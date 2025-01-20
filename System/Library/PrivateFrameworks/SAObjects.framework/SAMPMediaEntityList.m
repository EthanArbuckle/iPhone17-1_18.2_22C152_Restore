@interface SAMPMediaEntityList
+ (id)mediaEntityList;
- (SAMPCollection)parentCollection;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int)mediaType;
- (void)setMediaType:(int)a3;
- (void)setParentCollection:(id)a3;
@end

@implementation SAMPMediaEntityList

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"MediaEntityList";
}

+ (id)mediaEntityList
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int)mediaType
{
  id v2 = [(AceObject *)self propertyForKey:@"mediaType"];
  int v3 = SAMPTypeForString(v2);

  return v3;
}

- (void)setMediaType:(int)a3
{
  stringForSAMPType(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  AceObjectSetCopyingObjectForProperty(self, @"mediaType", v4);
}

- (SAMPCollection)parentCollection
{
  return (SAMPCollection *)AceObjectAceObjectForProperty(self, @"parentCollection");
}

- (void)setParentCollection:(id)a3
{
}

@end