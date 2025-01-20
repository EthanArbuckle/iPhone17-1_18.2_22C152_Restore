@interface SAUITemplateBaseItem
+ (id)baseItem;
- (BOOL)hasPriorityLayout;
- (BOOL)shouldBeOffscreenInPartial;
- (NSArray)communicationOptions;
- (NSArray)presentationOptions;
- (SAUITemplateEdgeInsets)fullScreenPaddingDelta;
- (SAUITemplateEdgeInsets)padding;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCommunicationOptions:(id)a3;
- (void)setFullScreenPaddingDelta:(id)a3;
- (void)setHasPriorityLayout:(BOOL)a3;
- (void)setPadding:(id)a3;
- (void)setPresentationOptions:(id)a3;
- (void)setShouldBeOffscreenInPartial:(BOOL)a3;
@end

@implementation SAUITemplateBaseItem

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.templates";
}

- (id)encodedClassName
{
  return @"BaseItem";
}

+ (id)baseItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)communicationOptions
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"communicationOptions"];
}

- (void)setCommunicationOptions:(id)a3
{
}

- (SAUITemplateEdgeInsets)fullScreenPaddingDelta
{
  return (SAUITemplateEdgeInsets *)AceObjectAceObjectForProperty(self, @"fullScreenPaddingDelta");
}

- (void)setFullScreenPaddingDelta:(id)a3
{
}

- (BOOL)hasPriorityLayout
{
  return AceObjectBoolForProperty(self, @"hasPriorityLayout");
}

- (void)setHasPriorityLayout:(BOOL)a3
{
}

- (SAUITemplateEdgeInsets)padding
{
  return (SAUITemplateEdgeInsets *)AceObjectAceObjectForProperty(self, @"padding");
}

- (void)setPadding:(id)a3
{
}

- (NSArray)presentationOptions
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"presentationOptions"];
}

- (void)setPresentationOptions:(id)a3
{
}

- (BOOL)shouldBeOffscreenInPartial
{
  return AceObjectBoolForProperty(self, @"shouldBeOffscreenInPartial");
}

- (void)setShouldBeOffscreenInPartial:(BOOL)a3
{
}

@end