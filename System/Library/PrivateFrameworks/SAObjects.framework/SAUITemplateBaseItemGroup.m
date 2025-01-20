@interface SAUITemplateBaseItemGroup
+ (id)baseItemGroup;
- (NSArray)templateItems;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setTemplateItems:(id)a3;
@end

@implementation SAUITemplateBaseItemGroup

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.templates";
}

- (id)encodedClassName
{
  return @"BaseItemGroup";
}

+ (id)baseItemGroup
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)templateItems
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"templateItems", &unk_1EFD8C880);
}

- (void)setTemplateItems:(id)a3
{
}

@end