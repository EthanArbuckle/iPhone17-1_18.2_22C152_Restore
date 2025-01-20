@interface SAIntentGroupProcessIntent
+ (id)processIntent;
- (BOOL)allowsPunchOut;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (BOOL)shouldRunHandleIntent;
- (NSArray)intentSlotKeyPaths;
- (NSString)jsonEncodedIntent;
- (SAIntentGroupProtobufMessage)intent;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAllowsPunchOut:(BOOL)a3;
- (void)setIntent:(id)a3;
- (void)setIntentSlotKeyPaths:(id)a3;
- (void)setJsonEncodedIntent:(id)a3;
- (void)setShouldRunHandleIntent:(BOOL)a3;
@end

@implementation SAIntentGroupProcessIntent

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"ProcessIntent";
}

+ (id)processIntent
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)allowsPunchOut
{
  return AceObjectBoolForProperty(self, @"allowsPunchOut");
}

- (void)setAllowsPunchOut:(BOOL)a3
{
}

- (SAIntentGroupProtobufMessage)intent
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, @"intent");
}

- (void)setIntent:(id)a3
{
}

- (NSArray)intentSlotKeyPaths
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"intentSlotKeyPaths"];
}

- (void)setIntentSlotKeyPaths:(id)a3
{
}

- (NSString)jsonEncodedIntent
{
  return (NSString *)[(AceObject *)self propertyForKey:@"jsonEncodedIntent"];
}

- (void)setJsonEncodedIntent:(id)a3
{
}

- (BOOL)shouldRunHandleIntent
{
  return AceObjectBoolForProperty(self, @"shouldRunHandleIntent");
}

- (void)setShouldRunHandleIntent:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end