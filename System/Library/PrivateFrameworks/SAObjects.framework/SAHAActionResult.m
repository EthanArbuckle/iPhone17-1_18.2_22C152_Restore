@interface SAHAActionResult
+ (id)actionResult;
- (NSArray)relatedEntityIds;
- (NSString)outcome;
- (NSString)requestActionId;
- (NSString)resultAttribute;
- (SAHAAttributeValue)resultValue;
- (SAHAEntity)entity;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEntity:(id)a3;
- (void)setOutcome:(id)a3;
- (void)setRelatedEntityIds:(id)a3;
- (void)setRequestActionId:(id)a3;
- (void)setResultAttribute:(id)a3;
- (void)setResultValue:(id)a3;
@end

@implementation SAHAActionResult

- (id)groupIdentifier
{
  return @"com.apple.ace.homeautomation";
}

- (id)encodedClassName
{
  return @"ActionResult";
}

+ (id)actionResult
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAHAEntity)entity
{
  return (SAHAEntity *)AceObjectAceObjectForProperty(self, @"entity");
}

- (void)setEntity:(id)a3
{
}

- (NSString)outcome
{
  return (NSString *)[(AceObject *)self propertyForKey:@"outcome"];
}

- (void)setOutcome:(id)a3
{
}

- (NSArray)relatedEntityIds
{
  return (NSArray *)AceObjectURLArrayForProperty(self, @"relatedEntityIds");
}

- (void)setRelatedEntityIds:(id)a3
{
}

- (NSString)requestActionId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"requestActionId"];
}

- (void)setRequestActionId:(id)a3
{
}

- (NSString)resultAttribute
{
  return (NSString *)[(AceObject *)self propertyForKey:@"resultAttribute"];
}

- (void)setResultAttribute:(id)a3
{
}

- (SAHAAttributeValue)resultValue
{
  return (SAHAAttributeValue *)AceObjectAceObjectForProperty(self, @"resultValue");
}

- (void)setResultValue:(id)a3
{
}

@end