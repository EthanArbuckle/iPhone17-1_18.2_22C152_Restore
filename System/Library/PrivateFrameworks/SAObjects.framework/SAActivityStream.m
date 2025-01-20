@interface SAActivityStream
+ (id)activityStream;
- (BOOL)requiresResponse;
- (NSArray)activities;
- (NSString)taskType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setActivities:(id)a3;
- (void)setTaskType:(id)a3;
@end

@implementation SAActivityStream

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"ActivityStream";
}

+ (id)activityStream
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)activities
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"activities", v3);
}

- (void)setActivities:(id)a3
{
}

- (NSString)taskType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"taskType"];
}

- (void)setTaskType:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end