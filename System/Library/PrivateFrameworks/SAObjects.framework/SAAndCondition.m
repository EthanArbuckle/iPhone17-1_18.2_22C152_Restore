@interface SAAndCondition
+ (id)andCondition;
- (NSArray)conditions;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setConditions:(id)a3;
@end

@implementation SAAndCondition

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"AndCondition";
}

+ (id)andCondition
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