@interface SAIntentGroupResolveIntentSlot
+ (id)resolveIntentSlot;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSNumber)intentSlotValueIndex;
- (NSString)intentSlotKeyPath;
- (NSString)jsonEncodedIntent;
- (SAIntentGroupProtobufMessage)intent;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIntent:(id)a3;
- (void)setIntentSlotKeyPath:(id)a3;
- (void)setIntentSlotValueIndex:(id)a3;
- (void)setJsonEncodedIntent:(id)a3;
@end

@implementation SAIntentGroupResolveIntentSlot

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"ResolveIntentSlot";
}

+ (id)resolveIntentSlot
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAIntentGroupProtobufMessage)intent
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, @"intent");
}

- (void)setIntent:(id)a3
{
}

- (NSString)intentSlotKeyPath
{
  return (NSString *)[(AceObject *)self propertyForKey:@"intentSlotKeyPath"];
}

- (void)setIntentSlotKeyPath:(id)a3
{
}

- (NSNumber)intentSlotValueIndex
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"intentSlotValueIndex"];
}

- (void)setIntentSlotValueIndex:(id)a3
{
}

- (NSString)jsonEncodedIntent
{
  return (NSString *)[(AceObject *)self propertyForKey:@"jsonEncodedIntent"];
}

- (void)setJsonEncodedIntent:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end