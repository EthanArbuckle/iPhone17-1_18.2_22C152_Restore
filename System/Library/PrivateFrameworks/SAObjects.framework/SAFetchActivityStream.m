@interface SAFetchActivityStream
+ (id)fetchActivityStream;
- (BOOL)ascending;
- (BOOL)requiresResponse;
- (NSArray)matchingMetadataKeys;
- (NSArray)streamTypes;
- (NSDate)fromDate;
- (NSDate)toDate;
- (NSDictionary)matchingMetadataKeysAndStringValues;
- (NSNumber)limit;
- (NSString)activityType;
- (NSString)sortBy;
- (NSString)taskType;
- (NSString)visibility;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setActivityType:(id)a3;
- (void)setAscending:(BOOL)a3;
- (void)setFromDate:(id)a3;
- (void)setLimit:(id)a3;
- (void)setMatchingMetadataKeys:(id)a3;
- (void)setMatchingMetadataKeysAndStringValues:(id)a3;
- (void)setSortBy:(id)a3;
- (void)setStreamTypes:(id)a3;
- (void)setTaskType:(id)a3;
- (void)setToDate:(id)a3;
- (void)setVisibility:(id)a3;
@end

@implementation SAFetchActivityStream

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"FetchActivityStream";
}

+ (id)fetchActivityStream
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)activityType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"activityType"];
}

- (void)setActivityType:(id)a3
{
}

- (BOOL)ascending
{
  return AceObjectBoolForProperty(self, @"ascending");
}

- (void)setAscending:(BOOL)a3
{
}

- (NSDate)fromDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"fromDate"];
}

- (void)setFromDate:(id)a3
{
}

- (NSNumber)limit
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"limit"];
}

- (void)setLimit:(id)a3
{
}

- (NSArray)matchingMetadataKeys
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"matchingMetadataKeys"];
}

- (void)setMatchingMetadataKeys:(id)a3
{
}

- (NSDictionary)matchingMetadataKeysAndStringValues
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"matchingMetadataKeysAndStringValues"];
}

- (void)setMatchingMetadataKeysAndStringValues:(id)a3
{
}

- (NSString)sortBy
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sortBy"];
}

- (void)setSortBy:(id)a3
{
}

- (NSArray)streamTypes
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"streamTypes"];
}

- (void)setStreamTypes:(id)a3
{
}

- (NSString)taskType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"taskType"];
}

- (void)setTaskType:(id)a3
{
}

- (NSDate)toDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"toDate"];
}

- (void)setToDate:(id)a3
{
}

- (NSString)visibility
{
  return (NSString *)[(AceObject *)self propertyForKey:@"visibility"];
}

- (void)setVisibility:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end