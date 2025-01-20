@interface SAUIDelayedActionCancelCommand
+ (id)delayedActionCancelCommand;
- (BOOL)requiresResponse;
- (NSString)delayedActionAceId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDelayedActionAceId:(id)a3;
@end

@implementation SAUIDelayedActionCancelCommand

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"DelayedActionCancelCommand";
}

+ (id)delayedActionCancelCommand
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)delayedActionAceId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"delayedActionAceId"];
}

- (void)setDelayedActionAceId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end