@interface SAUITemplateTemplatedModalView
+ (id)templatedModalView;
- (NSArray)templateItems;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setTemplateItems:(id)a3;
@end

@implementation SAUITemplateTemplatedModalView

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.templates";
}

- (id)encodedClassName
{
  return @"TemplatedModalView";
}

+ (id)templatedModalView
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