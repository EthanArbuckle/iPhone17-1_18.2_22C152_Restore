@interface SAGetClientState
+ (id)getClientState;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)statesToGet;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setStatesToGet:(id)a3;
@end

@implementation SAGetClientState

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"GetClientState";
}

+ (id)getClientState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)statesToGet
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"statesToGet", v3);
}

- (void)setStatesToGet:(id)a3
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