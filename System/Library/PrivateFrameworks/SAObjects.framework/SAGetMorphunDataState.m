@interface SAGetMorphunDataState
+ (id)getMorphunDataState;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (SAMorphunDataState)clientState;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setClientState:(id)a3;
@end

@implementation SAGetMorphunDataState

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"GetMorphunDataState";
}

+ (id)getMorphunDataState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAMorphunDataState)clientState
{
  return (SAMorphunDataState *)AceObjectAceObjectForProperty(self, @"clientState");
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