@interface SASDisableServerEndpointer
+ (id)disableServerEndpointer;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SASDisableServerEndpointer

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"DisableServerEndpointer";
}

+ (id)disableServerEndpointer
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end