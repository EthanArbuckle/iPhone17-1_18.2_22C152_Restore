@interface SAActivityObject
+ (id)activityObject;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDictionary)metadata;
- (NSString)streamType;
- (NSString)type;
- (NSString)visibility;
- (SAClientUserActivity)userActivity;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEndDate:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setStreamType:(id)a3;
- (void)setType:(id)a3;
- (void)setUserActivity:(id)a3;
- (void)setVisibility:(id)a3;
@end

@implementation SAActivityObject

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"ActivityObject";
}

+ (id)activityObject
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDate)endDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"endDate"];
}

- (void)setEndDate:(id)a3
{
}

- (NSDictionary)metadata
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"metadata"];
}

- (void)setMetadata:(id)a3
{
}

- (NSDate)startDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"startDate"];
}

- (void)setStartDate:(id)a3
{
}

- (NSString)streamType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"streamType"];
}

- (void)setStreamType:(id)a3
{
}

- (NSString)type
{
  return (NSString *)[(AceObject *)self propertyForKey:@"type"];
}

- (void)setType:(id)a3
{
}

- (SAClientUserActivity)userActivity
{
  return (SAClientUserActivity *)AceObjectAceObjectForProperty(self, @"userActivity");
}

- (void)setUserActivity:(id)a3
{
}

- (NSString)visibility
{
  return (NSString *)[(AceObject *)self propertyForKey:@"visibility"];
}

- (void)setVisibility:(id)a3
{
}

@end