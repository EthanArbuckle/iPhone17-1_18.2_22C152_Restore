@interface SAHAAction
+ (id)action;
- (BOOL)includeCompleteInformation;
- (NSArray)executionFlags;
- (NSString)actionType;
- (NSString)attribute;
- (SAHAAttributeValue)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)executionOrder;
- (void)setActionType:(id)a3;
- (void)setAttribute:(id)a3;
- (void)setExecutionFlags:(id)a3;
- (void)setExecutionOrder:(int64_t)a3;
- (void)setIncludeCompleteInformation:(BOOL)a3;
- (void)setValue:(id)a3;
@end

@implementation SAHAAction

- (id)groupIdentifier
{
  return @"com.apple.ace.homeautomation";
}

- (id)encodedClassName
{
  return @"Action";
}

+ (id)action
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)actionType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"actionType"];
}

- (void)setActionType:(id)a3
{
}

- (NSString)attribute
{
  return (NSString *)[(AceObject *)self propertyForKey:@"attribute"];
}

- (void)setAttribute:(id)a3
{
}

- (NSArray)executionFlags
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"executionFlags"];
}

- (void)setExecutionFlags:(id)a3
{
}

- (int64_t)executionOrder
{
  return AceObjectIntegerForProperty(self, @"executionOrder");
}

- (void)setExecutionOrder:(int64_t)a3
{
}

- (BOOL)includeCompleteInformation
{
  return AceObjectBoolForProperty(self, @"includeCompleteInformation");
}

- (void)setIncludeCompleteInformation:(BOOL)a3
{
}

- (SAHAAttributeValue)value
{
  return (SAHAAttributeValue *)AceObjectAceObjectForProperty(self, @"value");
}

- (void)setValue:(id)a3
{
}

@end