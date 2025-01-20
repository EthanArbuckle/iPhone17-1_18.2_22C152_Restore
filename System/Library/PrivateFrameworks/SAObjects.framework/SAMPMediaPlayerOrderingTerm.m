@interface SAMPMediaPlayerOrderingTerm
+ (id)mediaPlayerOrderingTerm;
- (NSString)mediaPlayerOrderingDirection;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int)mediaPlayerSearchProperty;
- (void)setMediaPlayerOrderingDirection:(id)a3;
- (void)setMediaPlayerSearchProperty:(int)a3;
@end

@implementation SAMPMediaPlayerOrderingTerm

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"MediaPlayerOrderingTerm";
}

+ (id)mediaPlayerOrderingTerm
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)mediaPlayerOrderingDirection
{
  return (NSString *)[(AceObject *)self propertyForKey:@"mediaPlayerOrderingDirection"];
}

- (void)setMediaPlayerOrderingDirection:(id)a3
{
}

- (int)mediaPlayerSearchProperty
{
  id v2 = [(AceObject *)self propertyForKey:@"mediaPlayerSearchProperty"];
  int v3 = SAMPSearchPropertyForString(v2);

  return v3;
}

- (void)setMediaPlayerSearchProperty:(int)a3
{
  stringForSAMPSearchProperty(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  AceObjectSetCopyingObjectForProperty(self, @"mediaPlayerSearchProperty", v4);
}

@end