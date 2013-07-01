//
//  MapViewController.m
//  Map
//
//  Created by user on 2013/06/09.
//  Copyright (c) 2013年 user. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize mapView ;
@synthesize locationManager;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.mapView.delegate = self ;
    
    //アプリの起動時にMapViewが読まれたタイミングで、位置情報の取得処理を実行
    self.locationManager = [[[CLLocationManager alloc] init]autoContentAccessingProxy] ;
    locationManager.delegate = self ;
    [locationManager startUpdatingLocation] ;       //位置情報の取得開始
    mapView.showsUserLocation = YES ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//表示領域の設定
-(void)locationManager:(CLLocationManager *)manager didUpdateToLocations:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    MKCoordinateRegion region = mapView.region ;
    
    region.center = newLocation.coordinate ;        //画面の中心座標を指定する
    region.span.latitudeDelta = 0.01 ;              //南北の距離
    region.span.longitudeDelta = 0.01 ;             //東西の距離
    
    [mapView setRegion:region] ;
    
    [locationManager stopUpdatingLocation] ;        //呼び出して終了
    //⬆のメソッドを呼び出さないと連続して情報取得してしまう
}




-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(NSError *)error
{
    [locationManager stopUpdatingLocation] ;
}

-(void)viewDidUnload
{
    [self setMapView:nil] ;
    [super viewDidUnload] ;
    
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return (self.interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown) ;
}

    

- (IBAction)standardButton:(id)sender
{
    mapView.mapType = MKMapTypeStandard ;
            
}

- (IBAction)satelliteButton:(id)sender
{
    mapView.mapType = MKMapTypeSatellite ;
}

- (IBAction)hybridButton:(id)sender
{
    mapView.mapType = MKMapTypeHybrid ;
}
@end
