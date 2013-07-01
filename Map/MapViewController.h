//
//  MapViewController.h
//  Map
//
//  Created by user on 2013/06/09.
//  Copyright (c) 2013年 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController
<MKMapViewDelegate,CLLocationManagerDelegate>
{
    IBOutlet MKMapView *mapView;
    CLLocationManager *locationManager ;

}

@property (nonatomic,retain) CLLocationManager *locationManager ;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;


- (IBAction)standardButton:(id)sender;

- (IBAction)satelliteButton:(id)sender;


- (IBAction)hybridButton:(id)sender;

@end
