@interface SAUITemplateTabularDataRowActionShowModalSnippet
+ (id)tabularDataRowActionShowModalSnippet;
- (SAServerBoundCommand)fetchContentCommand;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setFetchContentCommand:(id)a3;
@end

@implementation SAUITemplateTabularDataRowActionShowModalSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.templates";
}

- (id)encodedClassName
{
  return @"TabularDataRowActionShowModalSnippet";
}

+ (id)tabularDataRowActionShowModalSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAServerBoundCommand)fetchContentCommand
{
  return (SAServerBoundCommand *)AceObjectAceObjectForProperty(self, @"fetchContentCommand");
}

- (void)setFetchContentCommand:(id)a3
{
}

@end