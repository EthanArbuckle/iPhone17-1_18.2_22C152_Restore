@interface SASportsMetadataGroup
+ (id)metadataGroup;
- (NSArray)metadata;
- (NSNumber)selected;
- (NSString)groupTitle;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setGroupTitle:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setSelected:(id)a3;
@end

@implementation SASportsMetadataGroup

- (id)groupIdentifier
{
  return @"com.apple.ace.sports";
}

- (id)encodedClassName
{
  return @"MetadataGroup";
}

+ (id)metadataGroup
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)groupTitle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"groupTitle"];
}

- (void)setGroupTitle:(id)a3
{
}

- (NSArray)metadata
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"metadata", v3);
}

- (void)setMetadata:(id)a3
{
}

- (NSNumber)selected
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"selected"];
}

- (void)setSelected:(id)a3
{
}

@end