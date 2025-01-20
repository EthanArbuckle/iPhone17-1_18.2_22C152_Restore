@interface SAPhoneIncomingCallSearch
+ (id)incomingCallSearch;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAPhoneIncomingCallSearch

- (id)groupIdentifier
{
  return @"com.apple.ace.phone";
}

- (id)encodedClassName
{
  return @"IncomingCallSearch";
}

+ (id)incomingCallSearch
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end