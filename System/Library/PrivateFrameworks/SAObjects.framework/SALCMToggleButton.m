@interface SALCMToggleButton
+ (id)toggleButton;
- (NSDictionary)offIconDynamicImage;
- (NSDictionary)onIconDynamicImage;
- (NSString)offTitle;
- (NSString)onTitle;
- (SABaseCommand)commandToToggleToOffMode;
- (SABaseCommand)commandToToggleToOnMode;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCommandToToggleToOffMode:(id)a3;
- (void)setCommandToToggleToOnMode:(id)a3;
- (void)setOffIconDynamicImage:(id)a3;
- (void)setOffTitle:(id)a3;
- (void)setOnIconDynamicImage:(id)a3;
- (void)setOnTitle:(id)a3;
@end

@implementation SALCMToggleButton

- (id)groupIdentifier
{
  return @"com.apple.ace.livecontent";
}

- (id)encodedClassName
{
  return @"ToggleButton";
}

+ (id)toggleButton
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SABaseCommand)commandToToggleToOffMode
{
  return (SABaseCommand *)AceObjectAceObjectForProperty(self, @"commandToToggleToOffMode");
}

- (void)setCommandToToggleToOffMode:(id)a3
{
}

- (SABaseCommand)commandToToggleToOnMode
{
  return (SABaseCommand *)AceObjectAceObjectForProperty(self, @"commandToToggleToOnMode");
}

- (void)setCommandToToggleToOnMode:(id)a3
{
}

- (NSDictionary)offIconDynamicImage
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"offIconDynamicImage"];
}

- (void)setOffIconDynamicImage:(id)a3
{
}

- (NSString)offTitle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"offTitle"];
}

- (void)setOffTitle:(id)a3
{
}

- (NSDictionary)onIconDynamicImage
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"onIconDynamicImage"];
}

- (void)setOnIconDynamicImage:(id)a3
{
}

- (NSString)onTitle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"onTitle"];
}

- (void)setOnTitle:(id)a3
{
}

@end