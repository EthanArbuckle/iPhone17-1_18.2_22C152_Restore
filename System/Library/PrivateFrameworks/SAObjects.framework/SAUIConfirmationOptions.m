@interface SAUIConfirmationOptions
+ (id)confirmationOptions;
- (NSArray)allConfirmationOptions;
- (NSArray)confirmCommands;
- (NSArray)denyCommands;
- (NSString)cancelTrigger;
- (NSString)confirmText;
- (NSString)denyText;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAllConfirmationOptions:(id)a3;
- (void)setCancelTrigger:(id)a3;
- (void)setConfirmCommands:(id)a3;
- (void)setConfirmText:(id)a3;
- (void)setDenyCommands:(id)a3;
- (void)setDenyText:(id)a3;
@end

@implementation SAUIConfirmationOptions

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"ConfirmationOptions";
}

+ (id)confirmationOptions
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

@end