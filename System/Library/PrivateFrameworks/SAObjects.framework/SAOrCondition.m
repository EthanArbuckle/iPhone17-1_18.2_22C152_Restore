@interface SAOrCondition
+ (id)orCondition;
- (NSArray)conditions;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setConditions:(id)a3;
@end

@implementation SAOrCondition

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"OrCondition";
}

+ (id)orCondition
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)conditions
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"conditions", &unk_1EFDA1268);
}

- (void)setConditions:(id)a3
{
}

@end