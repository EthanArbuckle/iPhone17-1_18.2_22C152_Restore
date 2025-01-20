@interface SASetMultipleClientStates
+ (id)setMultipleClientStates;
- (BOOL)requiresResponse;
- (NSArray)clientStateSetters;
- (NSArray)failedGetters;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setClientStateSetters:(id)a3;
- (void)setFailedGetters:(id)a3;
@end

@implementation SASetMultipleClientStates

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SetMultipleClientStates";
}

+ (id)setMultipleClientStates
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)clientStateSetters
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"clientStateSetters", &unk_1EFD7C870);
}

- (void)setClientStateSetters:(id)a3
{
}

- (NSArray)failedGetters
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"failedGetters", v3);
}

- (void)setFailedGetters:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end