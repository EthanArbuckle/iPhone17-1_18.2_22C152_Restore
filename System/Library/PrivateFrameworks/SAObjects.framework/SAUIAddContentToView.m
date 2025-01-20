@interface SAUIAddContentToView
+ (id)addContentToView;
- (BOOL)requiresResponse;
- (NSString)status;
- (NSString)targetViewId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setStatus:(id)a3;
- (void)setTargetViewId:(id)a3;
@end

@implementation SAUIAddContentToView

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"AddContentToView";
}

+ (id)addContentToView
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)status
{
  return (NSString *)[(AceObject *)self propertyForKey:@"status"];
}

- (void)setStatus:(id)a3
{
}

- (NSString)targetViewId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"targetViewId"];
}

- (void)setTargetViewId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end