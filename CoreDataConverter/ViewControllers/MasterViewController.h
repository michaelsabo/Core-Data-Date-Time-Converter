//
//  MasterViewController.h
//  CoreDataConverter
//
//  Created by Mike Sabo on 2/18/13.
//  Copyright (c) 2013 Mike Sabo. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MasterViewController : NSViewController {
	NSTimeInterval enoch_time;
	NSTimeInterval core_data_time;
	
	NSNumber* year;
	NSNumber* month;
	NSNumber* day;	
}

@property (strong) IBOutlet NSTextField *txtYear;
@property (strong) IBOutlet NSTextField *txtMonth;
@property (strong) IBOutlet NSTextField *txtDay;

@property (strong) IBOutlet NSTextField *txtCoreData;
@property (strong) IBOutlet NSTextField *txtEnoch;
@property (strong) IBOutlet NSTextField *txtTimeStamp;


- (IBAction)dateToSeconds:(id)sender;
- (IBAction)clearFields:(id)sender;
- (IBAction)secondsToDate:(id)sender;


@end
