@interface SAHLShowActivity
+ (id)showActivity;
- (BOOL)requiresResponse;
- (NSString)activityDataType;
- (NSString)activityView;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setActivityDataType:(id)a3;
- (void)setActivityView:(id)a3;
@end

@implementation SAHLShowActivity

- (id)groupIdentifier
{
  return @"com.apple.ace.health";
}

- (id)encodedClassName
{
  return @"ShowActivity";
}

+ (id)showActivity
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)activityDataType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"activityDataType"];
}

- (void)setActivityDataType:(id)a3
{
}

- (NSString)activityView
{
  return (NSString *)[(AceObject *)self propertyForKey:@"activityView"];
}

- (void)setActivityView:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end