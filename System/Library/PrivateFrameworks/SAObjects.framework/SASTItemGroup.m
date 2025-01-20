@interface SASTItemGroup
+ (id)itemGroup;
- (NSArray)fallbackCommands;
- (NSArray)templateItems;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setFallbackCommands:(id)a3;
- (void)setTemplateItems:(id)a3;
@end

@implementation SASTItemGroup

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"ItemGroup";
}

+ (id)itemGroup
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)fallbackCommands
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"fallbackCommands", v3);
}

- (void)setFallbackCommands:(id)a3
{
}

- (NSArray)templateItems
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"templateItems", &unk_1EFD77738);
}

- (void)setTemplateItems:(id)a3
{
}

@end