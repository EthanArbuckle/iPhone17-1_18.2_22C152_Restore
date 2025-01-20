@interface POXSNullDefinition
+ (id)definition;
- (Class)typeForName:(id)a3;
@end

@implementation POXSNullDefinition

+ (id)definition
{
  v2 = objc_opt_new();
  return v2;
}

- (Class)typeForName:(id)a3
{
  return (Class)objc_opt_class();
}

@end