@interface SARemoveFromActivityStream
+ (id)removeFromActivityStream;
- (BOOL)requiresResponse;
- (NSDate)fromDate;
- (NSDate)toDate;
- (NSString)activityType;
- (NSString)streamType;
- (NSString)taskType;
- (NSString)visibility;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setActivityType:(id)a3;
- (void)setFromDate:(id)a3;
- (void)setStreamType:(id)a3;
- (void)setTaskType:(id)a3;
- (void)setToDate:(id)a3;
- (void)setVisibility:(id)a3;
@end

@implementation SARemoveFromActivityStream

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"RemoveFromActivityStream";
}

+ (id)removeFromActivityStream
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

- (NSDate)fromDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"fromDate"];
}

- (void)setFromDate:(id)a3
{
}

- (NSString)streamType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"streamType"];
}

- (void)setStreamType:(id)a3
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
  return 0;
}

@end