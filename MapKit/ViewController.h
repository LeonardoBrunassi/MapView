//
//  ViewController.h
//  MapKit
//
//  Created by Rubens Gondek on 2/26/15.
//  Copyright (c) 2015 Ckode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (strong, retain) CLLocationManager *locManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)atualizaMap:(id)sender;

@end

