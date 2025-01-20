@interface SAMPCollection
+ (id)collection;
- (BOOL)editable;
- (NSArray)items;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEditable:(BOOL)a3;
- (void)setItems:(id)a3;
@end

@implementation SAMPCollection

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"Collection";
}

+ (id)collection
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)editable
{
  return AceObjectBoolForProperty(self, @"editable");
}

- (void)setEditable:(BOOL)a3
{
}

- (NSArray)items
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"items", v3);
}

- (void)setItems:(id)a3
{
}

@end