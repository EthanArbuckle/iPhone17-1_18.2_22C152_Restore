@interface SAUIButton
+ (id)button;
- (NSArray)commands;
- (NSString)secondaryText;
- (NSString)text;
- (SAUIColor)backgroundColor;
- (SAUIColor)textColor;
- (SAUIImageResource)image;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBackgroundColor:(id)a3;
- (void)setCommands:(id)a3;
- (void)setImage:(id)a3;
- (void)setSecondaryText:(id)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation SAUIButton

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"Button";
}

+ (id)button
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
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

- (NSString)secondaryText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"secondaryText"];
}

- (void)setSecondaryText:(id)a3
{
}

- (NSString)text
{
  return (NSString *)[(AceObject *)self propertyForKey:@"text"];
}

- (void)setText:(id)a3
{
}

- (SAUIColor)textColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, @"textColor");
}

- (void)setTextColor:(id)a3
{
}

@end