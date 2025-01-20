@interface SACFSpokenNotificationProvideContext
+ (id)spokenNotificationProvideContext;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SACFSpokenNotificationProvideContext

- (id)groupIdentifier
{
  return @"com.apple.ace.clientflow";
}

- (id)encodedClassName
{
  return @"SpokenNotificationProvideContext";
}

+ (id)spokenNotificationProvideContext
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end