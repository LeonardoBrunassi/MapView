//
//  ViewController.m
//  MapKit
//
//  Created by Rubens Gondek on 2/26/15.
//  Copyright (c) 2015 Ckode. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface ViewController ()

@end

@implementation ViewController

@synthesize locManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    locManager = [[CLLocationManager alloc] init];
    [locManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [locManager setDelegate:self];
    
    // iOS 8 - Permissão
    if ([locManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [locManager requestWhenInUseAuthorization];
    }
    
    [locManager startUpdatingLocation];
    
    _mapView.showsUserLocation = YES;
    _mapView.mapType = MKMapTypeSatellite;
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocationCoordinate2D coord = [[locations lastObject]coordinate];
    _region = MKCoordinateRegionMakeWithDistance(coord, 150, 150);
    NSLog(@"%@", [locations lastObject]);
}



-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    // Erro
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)atualizaMap:(id)sender {
    [_mapView setRegion:_region animated:YES];
}


@end
