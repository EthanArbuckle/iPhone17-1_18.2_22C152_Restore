@interface SAUIHtmlView
+ (id)htmlView;
- (NSArray)commands;
- (NSString)descriptionText;
- (NSString)html;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCommands:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setHtml:(id)a3;
@end

@implementation SAUIHtmlView

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"HtmlView";
}

+ (id)htmlView
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)commands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"commands", &unk_1EFD73568);
}

- (void)setCommands:(id)a3
{
}

- (NSString)descriptionText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"descriptionText"];
}

- (void)setDescriptionText:(id)a3
{
}

- (NSString)html
{
  return (NSString *)[(AceObject *)self propertyForKey:@"html"];
}

- (void)setHtml:(id)a3
{
}

@end