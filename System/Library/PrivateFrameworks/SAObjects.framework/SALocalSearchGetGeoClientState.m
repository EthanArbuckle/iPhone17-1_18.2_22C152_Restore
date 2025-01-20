@interface SALocalSearchGetGeoClientState
+ (id)getGeoClientState;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (SALocalSearchGeoClientState)clientState;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setClientState:(id)a3;
@end

@implementation SALocalSearchGetGeoClientState

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"GetGeoClientState";
}

+ (id)getGeoClientState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SALocalSearchGeoClientState)clientState
{
  return (SALocalSearchGeoClientState *)AceObjectAceObjectForProperty(self, @"clientState");
}

- (void)setClientState:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end