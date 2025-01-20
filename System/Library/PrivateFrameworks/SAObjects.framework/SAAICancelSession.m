@interface SAAICancelSession
+ (id)cancelSession;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAAICancelSession

- (id)groupIdentifier
{
  return @"com.apple.ace.acousticid";
}

- (id)encodedClassName
{
  return @"CancelSession";
}

+ (id)cancelSession
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end