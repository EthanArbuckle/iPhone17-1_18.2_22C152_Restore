@interface SASTSideBySideButtonsItem
+ (id)sideBySideButtonsItem;
- (BOOL)primaryButtonEnabled;
- (BOOL)secondaryButtonEnabled;
- (NSString)buttonsViewStyle;
- (NSString)primaryButtonLabel;
- (NSString)secondaryButtonLabel;
- (SASTTemplateAction)primaryButtonAction;
- (SASTTemplateAction)secondaryButtonAction;
- (SAUIColor)primaryButtonTextColor;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setButtonsViewStyle:(id)a3;
- (void)setPrimaryButtonAction:(id)a3;
- (void)setPrimaryButtonEnabled:(BOOL)a3;
- (void)setPrimaryButtonLabel:(id)a3;
- (void)setPrimaryButtonTextColor:(id)a3;
- (void)setSecondaryButtonAction:(id)a3;
- (void)setSecondaryButtonEnabled:(BOOL)a3;
- (void)setSecondaryButtonLabel:(id)a3;
@end

@implementation SASTSideBySideButtonsItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"SideBySideButtonsItem";
}

+ (id)sideBySideButtonsItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)buttonsViewStyle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"buttonsViewStyle"];
}

- (void)setButtonsViewStyle:(id)a3
{
}

- (SASTTemplateAction)primaryButtonAction
{
  return (SASTTemplateAction *)AceObjectAceObjectForProperty(self, @"primaryButtonAction");
}

- (void)setPrimaryButtonAction:(id)a3
{
}

- (BOOL)primaryButtonEnabled
{
  return AceObjectBoolForProperty(self, @"primaryButtonEnabled");
}

- (void)setPrimaryButtonEnabled:(BOOL)a3
{
}

- (NSString)primaryButtonLabel
{
  return (NSString *)[(AceObject *)self propertyForKey:@"primaryButtonLabel"];
}

- (void)setPrimaryButtonLabel:(id)a3
{
}

- (SAUIColor)primaryButtonTextColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, @"primaryButtonTextColor");
}

- (void)setPrimaryButtonTextColor:(id)a3
{
}

- (SASTTemplateAction)secondaryButtonAction
{
  return (SASTTemplateAction *)AceObjectAceObjectForProperty(self, @"secondaryButtonAction");
}

- (void)setSecondaryButtonAction:(id)a3
{
}

- (BOOL)secondaryButtonEnabled
{
  return AceObjectBoolForProperty(self, @"secondaryButtonEnabled");
}

- (void)setSecondaryButtonEnabled:(BOOL)a3
{
}

- (NSString)secondaryButtonLabel
{
  return (NSString *)[(AceObject *)self propertyForKey:@"secondaryButtonLabel"];
}

- (void)setSecondaryButtonLabel:(id)a3
{
}

@end