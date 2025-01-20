@interface SXDefaultTextComponentClassification
+ (id)roleString;
+ (id)typeString;
+ (int)role;
- (Class)componentModelClass;
- (id)fontTextStyle;
@end

@implementation SXDefaultTextComponentClassification

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

+ (id)typeString
{
  return @"text";
}

+ (int)role
{
  return 0;
}

+ (id)roleString
{
  return SXComponentClassificationUnknownRoleString;
}

- (id)fontTextStyle
{
  return (id)*MEMORY[0x263F1D260];
}

@end