@interface SAWeatherCondition
+ (id)condition;
- (NSString)conditionCode;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)conditionCodeIndex;
- (void)setConditionCode:(id)a3;
- (void)setConditionCodeIndex:(int64_t)a3;
@end

@implementation SAWeatherCondition

- (id)groupIdentifier
{
  return @"com.apple.ace.weather";
}

- (id)encodedClassName
{
  return @"Condition";
}

+ (id)condition
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)conditionCode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"conditionCode"];
}

- (void)setConditionCode:(id)a3
{
}

- (int64_t)conditionCodeIndex
{
  return AceObjectIntegerForProperty(self, @"conditionCodeIndex");
}

- (void)setConditionCodeIndex:(int64_t)a3
{
}

@end