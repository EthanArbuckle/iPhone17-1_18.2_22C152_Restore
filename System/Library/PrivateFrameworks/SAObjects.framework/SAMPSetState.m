@interface SAMPSetState
+ (id)setState;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int)state;
- (void)setState:(int)a3;
@end

@implementation SAMPSetState

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"SetState";
}

+ (id)setState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int)state
{
  id v2 = [(AceObject *)self propertyForKey:@"state"];
  int v3 = SAMPPlayStateForString(v2);

  return v3;
}

- (void)setState:(int)a3
{
  stringForSAMPPlayState(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  AceObjectSetCopyingObjectForProperty(self, @"state", v4);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end