@interface SASTCountdownTimerItem
+ (id)countdownTimerItem;
- (NSString)headerText;
- (SASTTemplateAction)action;
- (SAUIColor)bodyBackgroundColor;
- (SAUIColor)countdownTextColor;
- (SAUIColor)headerBackgroundColor;
- (SAUIColor)headerTextColor;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)actionDelayInSeconds;
- (void)setAction:(id)a3;
- (void)setActionDelayInSeconds:(int64_t)a3;
- (void)setBodyBackgroundColor:(id)a3;
- (void)setCountdownTextColor:(id)a3;
- (void)setHeaderBackgroundColor:(id)a3;
- (void)setHeaderText:(id)a3;
- (void)setHeaderTextColor:(id)a3;
@end

@implementation SASTCountdownTimerItem

- (id)groupIdentifier
{
  return @"com.apple.ace.templates";
}

- (id)encodedClassName
{
  return @"CountdownTimerItem";
}

+ (id)countdownTimerItem
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

- (int64_t)actionDelayInSeconds
{
  return AceObjectIntegerForProperty(self, @"actionDelayInSeconds");
}

- (void)setActionDelayInSeconds:(int64_t)a3
{
}

- (SAUIColor)bodyBackgroundColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, @"bodyBackgroundColor");
}

- (void)setBodyBackgroundColor:(id)a3
{
}

- (SAUIColor)countdownTextColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, @"countdownTextColor");
}

- (void)setCountdownTextColor:(id)a3
{
}

- (SAUIColor)headerBackgroundColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, @"headerBackgroundColor");
}

- (void)setHeaderBackgroundColor:(id)a3
{
}

- (NSString)headerText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"headerText"];
}

- (void)setHeaderText:(id)a3
{
}

- (SAUIColor)headerTextColor
{
  return (SAUIColor *)AceObjectAceObjectForProperty(self, @"headerTextColor");
}

- (void)setHeaderTextColor:(id)a3
{
}

@end