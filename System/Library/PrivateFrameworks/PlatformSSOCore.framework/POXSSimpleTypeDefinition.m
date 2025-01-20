@interface POXSSimpleTypeDefinition
+ (id)definition;
- (id)stringFromValue:(id)a3;
- (id)valueFromString:(id)a3;
@end

@implementation POXSSimpleTypeDefinition

+ (id)definition
{
  v2 = objc_opt_new();
  return v2;
}

- (id)valueFromString:(id)a3
{
  return 0;
}

- (id)stringFromValue:(id)a3
{
  return 0;
}

@end