@interface SASEnableServerEndpointer
+ (id)enableServerEndpointer;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SASEnableServerEndpointer

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"EnableServerEndpointer";
}

+ (id)enableServerEndpointer
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end