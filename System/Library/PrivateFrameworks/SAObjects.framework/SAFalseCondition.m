@interface SAFalseCondition
+ (id)falseCondition;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAFalseCondition

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"FalseCondition";
}

+ (id)falseCondition
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end