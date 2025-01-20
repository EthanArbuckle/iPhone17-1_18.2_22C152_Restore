@interface SAUISash
+ (id)sash;
- (NSArray)commands;
- (NSString)applicationBundleIdentifier;
- (NSString)title;
- (SAUIColor)backgroundColor;
- (SAUIColor)textColor;
- (SAUIImageResource)image;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCommands:(id)a3;
- (void)setImage:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SAUISash

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"Sash";
}

+ (id)sash
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)applicationBundleIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"applicationBundleIdentifier"];
}

- (void)setApplicationBundleIdentifier:(id)a3
{
}

- (SAUIColor)backgroundColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, @"backgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
}

- (NSArray)commands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"commands", &unk_1EFD73568);
}

- (void)setCommands:(id)a3
{
}

- (SAUIImageResource)image
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, @"image");
}

- (void)setImage:(id)a3
{
}

- (SAUIColor)textColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, @"textColor");
}

- (void)setTextColor:(id)a3
{
}

- (NSString)title
{
  return (NSString *)[(AceObject *)self propertyForKey:@"title"];
}

- (void)setTitle:(id)a3
{
}

@end