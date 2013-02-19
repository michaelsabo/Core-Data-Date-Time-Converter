//
//  MasterViewController.m
//  CoreDataConverter
//
//  Created by Mike Sabo on 2/18/13.
//  Copyright (c) 2013 Mike Sabo. All rights reserved.
//

#import "MasterViewController.h"

@interface MasterViewController() 
-(void) clearDates;
@end

@implementation MasterViewController

@synthesize txtYear, txtCoreData,txtDay,txtEnoch,txtMonth,txtTimeStamp;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //init stuff
	}
	
    return self;
}

- (IBAction)dateToSeconds:(id)sender {
	NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"yyyyMMdd"];
	[formatter setTimeZone:[NSTimeZone timeZoneWithName:@"EST"]];
	NSString* stringDate = [NSString stringWithFormat:@"%@%@%@", [txtYear stringValue], [txtMonth stringValue], [txtDay stringValue]];
	NSDate* date = [formatter dateFromString:stringDate];
	core_data_time  = [date timeIntervalSinceReferenceDate];
	enoch_time = [date timeIntervalSince1970];
	[txtCoreData setStringValue:[NSString stringWithFormat:@"%.0f", core_data_time]];
	[txtEnoch setStringValue:[NSString stringWithFormat:@"%.0f", enoch_time]];
	
}

- (IBAction)clearFields:(id)sender {
}

- (IBAction)secondsToDate:(id)sender {
	[self clearDates];
	NSDate* date;
	NSDateFormatter* longFormatter = [[NSDateFormatter alloc] init];
	[longFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
	[longFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"EST"]];
	
	if ([[txtCoreData stringValue] length] > 0) {
		date = [NSDate dateWithTimeIntervalSinceReferenceDate:[txtCoreData doubleValue]];
		NSString* stringDate = [longFormatter stringFromDate:date];
		enoch_time = [date timeIntervalSince1970];
		[txtTimeStamp setStringValue:stringDate];
		[txtEnoch setStringValue:[NSString stringWithFormat:@"%.0f", enoch_time]];
		
	} else {
		date = [NSDate dateWithTimeIntervalSince1970:[txtEnoch doubleValue]];
		NSString* stringDate = [longFormatter stringFromDate:date];
		core_data_time  = [date timeIntervalSinceReferenceDate];
		
		[txtTimeStamp setStringValue:stringDate];
		[txtCoreData setStringValue:[NSString stringWithFormat:@"%.0f", core_data_time]];	
		
	}
}

-(void)clearDates {
	[txtMonth setStringValue:@""];
	[txtDay setStringValue:@""];
	[txtYear setStringValue:@""];
}

@end
