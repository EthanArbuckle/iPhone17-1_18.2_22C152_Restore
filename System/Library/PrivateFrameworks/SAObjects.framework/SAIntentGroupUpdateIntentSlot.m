@interface SAIntentGroupUpdateIntentSlot
+ (id)updateIntentSlot;
- (BOOL)requiresResponse;
- (NSNumber)intentSlotValueIndex;
- (NSString)intentSlotKeyPath;
- (NSString)intentTypeName;
- (NSString)jsonEncodedIntentSlotResolutionResult;
- (SAIntentGroupProtobufMessage)intentSlotResolutionResult;
- (SAIntentGroupProtobufMessage)location;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIntentSlotKeyPath:(id)a3;
- (void)setIntentSlotResolutionResult:(id)a3;
- (void)setIntentSlotValueIndex:(id)a3;
- (void)setIntentTypeName:(id)a3;
- (void)setJsonEncodedIntentSlotResolutionResult:(id)a3;
- (void)setLocation:(id)a3;
@end

@implementation SAIntentGroupUpdateIntentSlot

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"UpdateIntentSlot";
}

+ (id)updateIntentSlot
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)intentSlotKeyPath
{
  return (NSString *)[(AceObject *)self propertyForKey:@"intentSlotKeyPath"];
}

- (void)setIntentSlotKeyPath:(id)a3
{
}

- (SAIntentGroupProtobufMessage)intentSlotResolutionResult
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, @"intentSlotResolutionResult");
}

- (void)setIntentSlotResolutionResult:(id)a3
{
}

- (NSNumber)intentSlotValueIndex
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"intentSlotValueIndex"];
}

- (void)setIntentSlotValueIndex:(id)a3
{
}

- (NSString)intentTypeName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"intentTypeName"];
}

- (void)setIntentTypeName:(id)a3
{
}

- (NSString)jsonEncodedIntentSlotResolutionResult
{
  return (NSString *)[(AceObject *)self propertyForKey:@"jsonEncodedIntentSlotResolutionResult"];
}

- (void)setJsonEncodedIntentSlotResolutionResult:(id)a3
{
}

- (SAIntentGroupProtobufMessage)location
{
  return (SAIntentGroupProtobufMessage *)AceObjectAceObjectForProperty(self, @"location");
}

- (void)setLocation:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end