@interface SAGetMultipleClientStates
+ (id)getMultipleClientStates;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)clientStateGetters;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setClientStateGetters:(id)a3;
@end

@implementation SAGetMultipleClientStates

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"GetMultipleClientStates";
}

+ (id)getMultipleClientStates
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)clientStateGetters
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"clientStateGetters", &unk_1EFD77850);
}

- (void)setClientStateGetters:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end