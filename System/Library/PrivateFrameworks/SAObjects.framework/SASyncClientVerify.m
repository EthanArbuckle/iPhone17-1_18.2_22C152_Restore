@interface SASyncClientVerify
+ (id)clientVerify;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SASyncClientVerify

- (id)groupIdentifier
{
  return @"com.apple.ace.sync";
}

- (id)encodedClassName
{
  return @"ClientVerify";
}

+ (id)clientVerify
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end