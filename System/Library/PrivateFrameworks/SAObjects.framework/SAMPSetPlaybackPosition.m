@interface SAMPSetPlaybackPosition
+ (id)setPlaybackPosition;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int)position;
- (void)setPosition:(int)a3;
@end

@implementation SAMPSetPlaybackPosition

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"SetPlaybackPosition";
}

+ (id)setPlaybackPosition
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int)position
{
  id v2 = [(AceObject *)self propertyForKey:@"position"];
  int v3 = SAMPPlaybackPositionForString(v2);

  return v3;
}

- (void)setPosition:(int)a3
{
  stringForSAMPPlaybackPosition(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  AceObjectSetCopyingObjectForProperty(self, @"position", v4);
}

- (BOOL)requiresResponse
{
  return 0;
}

@end