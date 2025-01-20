@interface SAValueCondition
+ (id)valueCondition;
- (NSArray)legalValues;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLegalValues:(id)a3;
@end

@implementation SAValueCondition

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"ValueCondition";
}

+ (id)valueCondition
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)legalValues
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"legalValues"];
}

- (void)setLegalValues:(id)a3
{
}

@end