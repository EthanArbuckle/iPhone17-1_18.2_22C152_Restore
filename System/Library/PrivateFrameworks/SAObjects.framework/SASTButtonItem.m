@interface SASTButtonItem
+ (id)buttonItem;
- (BOOL)centered;
- (NSString)position;
- (SASTTemplateAction)action;
- (SAUIDecoratedText)decoratedLabel;
- (SAUILocalImageResource)localImageResource;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAction:(id)a3;
- (void)setCentered:(BOOL)a3;
- (void)setDecoratedLabel:(id)a3;
- (void)setLocalImageResource:(id)a3;
- (void)setPosition:(id)a3;
@end

@implementation SASTButtonItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"ButtonItem";
}

+ (id)buttonItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SASTTemplateAction)action
{
  return (SASTTemplateAction *)AceObjectAceObjectForProperty(self, @"action");
}

- (void)setAction:(id)a3
{
}

- (BOOL)centered
{
  return AceObjectBoolForProperty(self, @"centered");
}

- (void)setCentered:(BOOL)a3
{
}

- (SAUIDecoratedText)decoratedLabel
{
  return (SAUIDecoratedText *)AceObjectAceObjectForProperty(self, @"decoratedLabel");
}

- (void)setDecoratedLabel:(id)a3
{
}

- (SAUILocalImageResource)localImageResource
{
  return (SAUILocalImageResource *)AceObjectAceObjectForProperty(self, @"localImageResource");
}

- (void)setLocalImageResource:(id)a3
{
}

- (NSString)position
{
  return (NSString *)[(AceObject *)self propertyForKey:@"position"];
}

- (void)setPosition:(id)a3
{
}

@end