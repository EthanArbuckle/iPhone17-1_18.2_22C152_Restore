@interface SAPhoneIncomingCallSearchCompleted
+ (id)incomingCallSearchCompleted;
- (BOOL)requiresResponse;
- (NSArray)incomingCallSearchResults;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIncomingCallSearchResults:(id)a3;
@end

@implementation SAPhoneIncomingCallSearchCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.phone";
}

- (id)encodedClassName
{
  return @"IncomingCallSearchCompleted";
}

+ (id)incomingCallSearchCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)incomingCallSearchResults
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"incomingCallSearchResults", v3);
}

- (void)setIncomingCallSearchResults:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end