@interface SAUIConfirmationOption
+ (id)confirmationOption;
- (BOOL)active;
- (NSArray)commands;
- (NSArray)delayExpiryCommands;
- (NSNumber)automaticConfirmationThreshold;
- (NSNumber)speechDuration;
- (NSString)buttonRole;
- (NSString)iconLabel;
- (NSString)iconType;
- (NSString)label;
- (NSString)type;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setActive:(BOOL)a3;
- (void)setAutomaticConfirmationThreshold:(id)a3;
- (void)setButtonRole:(id)a3;
- (void)setCommands:(id)a3;
- (void)setDelayExpiryCommands:(id)a3;
- (void)setIconLabel:(id)a3;
- (void)setIconType:(id)a3;
- (void)setLabel:(id)a3;
- (void)setSpeechDuration:(id)a3;
- (void)setType:(id)a3;
@end

@implementation SAUIConfirmationOption

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"ConfirmationOption";
}

+ (id)confirmationOption
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)active
{
  return AceObjectBoolForProperty(self, @"active");
}

- (void)setActive:(BOOL)a3
{
}

- (NSNumber)automaticConfirmationThreshold
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"automaticConfirmationThreshold"];
}

- (void)setAutomaticConfirmationThreshold:(id)a3
{
}

- (NSArray)commands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"commands", &unk_1EFD73568);
}

- (void)setCommands:(id)a3
{
}

- (NSArray)delayExpiryCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"delayExpiryCommands", &unk_1EFD73568);
}

- (void)setDelayExpiryCommands:(id)a3
{
}

- (NSString)iconLabel
{
  return (NSString *)[(AceObject *)self propertyForKey:@"iconLabel"];
}

- (void)setIconLabel:(id)a3
{
}

- (NSString)iconType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"iconType"];
}

- (void)setIconType:(id)a3
{
}

- (NSString)buttonRole
{
  return (NSString *)[(AceObject *)self propertyForKey:@"buttonRole"];
}

- (void)setButtonRole:(id)a3
{
}

- (NSString)label
{
  return (NSString *)[(AceObject *)self propertyForKey:@"label"];
}

- (void)setLabel:(id)a3
{
}

- (NSNumber)speechDuration
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"speechDuration"];
}

- (void)setSpeechDuration:(id)a3
{
}

- (NSString)type
{
  return (NSString *)[(AceObject *)self propertyForKey:@"type"];
}

- (void)setType:(id)a3
{
}

@end