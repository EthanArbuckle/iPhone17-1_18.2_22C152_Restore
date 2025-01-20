@interface SAIntentGroupBatchSlotResolutionResult
+ (id)batchSlotResolutionResult;
- (NSArray)stepResults;
- (NSDictionary)slotResolutionMap;
- (NSString)base64EncodedIntent;
- (NSString)jsonEncodedIntent;
- (NSString)typeName;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBase64EncodedIntent:(id)a3;
- (void)setJsonEncodedIntent:(id)a3;
- (void)setSlotResolutionMap:(id)a3;
- (void)setStepResults:(id)a3;
- (void)setTypeName:(id)a3;
@end

@implementation SAIntentGroupBatchSlotResolutionResult

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"BatchSlotResolutionResult";
}

+ (id)batchSlotResolutionResult
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)base64EncodedIntent
{
  return (NSString *)[(AceObject *)self propertyForKey:@"base64EncodedIntent"];
}

- (void)setBase64EncodedIntent:(id)a3
{
}

- (NSString)jsonEncodedIntent
{
  return (NSString *)[(AceObject *)self propertyForKey:@"jsonEncodedIntent"];
}

- (void)setJsonEncodedIntent:(id)a3
{
}

- (NSDictionary)slotResolutionMap
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"slotResolutionMap"];
}

- (void)setSlotResolutionMap:(id)a3
{
}

- (NSArray)stepResults
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"stepResults", v3);
}

- (void)setStepResults:(id)a3
{
}

- (NSString)typeName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"typeName"];
}

- (void)setTypeName:(id)a3
{
}

@end