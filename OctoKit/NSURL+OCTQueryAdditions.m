//
//  NSURL+OCTQueryAdditions.m
//  OctoKit
//
//  Created by Justin Spahr-Summers on 2013-10-24.
//  Copyright (c) 2013 GitHub. All rights reserved.
//

#import "NSURL+OCTQueryAdditions.h"
#import <Mantle/Mantle.h>

@implementation NSURL (OCTQueryAdditions)

- (NSDictionary *)oct_queryArguments {
	NSArray *queryComponents = [self.query componentsSeparatedByString:@"&"];

	NSMutableDictionary *queryArguments = [[NSMutableDictionary alloc] initWithCapacity:queryComponents.count];
	for (NSString *component in queryComponents) {
		NSArray *parts = [component componentsSeparatedByString:@"="];

		NSString *key = [parts.mtl_firstObject stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		id value = [parts.lastObject stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding] ?: NSNull.null;
		queryArguments[key] = value;
	}

	return queryArguments;
}

@end
