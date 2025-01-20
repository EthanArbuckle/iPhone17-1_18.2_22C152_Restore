@interface SAUIConfirmationView
+ (id)confirmationView;
- (NSArray)allConfirmationOptions;
- (NSArray)confirmCommands;
- (NSArray)denyCommands;
- (NSNumber)generateForegroundAppSearchButtonLabel;
- (NSString)cancelTrigger;
- (NSString)confirmText;
- (NSString)denyText;
- (NSString)style;
- (NSString)subtitle;
- (NSString)title;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAllConfirmationOptions:(id)a3;
- (void)setCancelTrigger:(id)a3;
- (void)setConfirmCommands:(id)a3;
- (void)setConfirmText:(id)a3;
- (void)setDenyCommands:(id)a3;
- (void)setDenyText:(id)a3;
- (void)setGenerateForegroundAppSearchButtonLabel:(id)a3;
- (void)setStyle:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SAUIConfirmationView

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"ConfirmationView";
}

+ (id)confirmationView
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)allConfirmationOptions
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"allConfirmationOptions", v3);
}

- (void)setAllConfirmationOptions:(id)a3
{
}

- (NSString)cancelTrigger
{
  return (NSString *)[(AceObject *)self propertyForKey:@"cancelTrigger"];
}

- (void)setCancelTrigger:(id)a3
{
}

- (NSArray)confirmCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"confirmCommands", &unk_1EFD73568);
}

- (void)setConfirmCommands:(id)a3
{
}

- (NSString)confirmText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"confirmText"];
}

- (void)setConfirmText:(id)a3
{
}

- (NSArray)denyCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"denyCommands", &unk_1EFD73568);
}

- (void)setDenyCommands:(id)a3
{
}

- (NSString)denyText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"denyText"];
}

- (void)setDenyText:(id)a3
{
}

- (NSNumber)generateForegroundAppSearchButtonLabel
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"generateForegroundAppSearchButtonLabel"];
}

- (void)setGenerateForegroundAppSearchButtonLabel:(id)a3
{
}

- (NSString)style
{
  return (NSString *)[(AceObject *)self propertyForKey:@"style"];
}

- (void)setStyle:(id)a3
{
}

- (NSString)subtitle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"subtitle"];
}

- (void)setSubtitle:(id)a3
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