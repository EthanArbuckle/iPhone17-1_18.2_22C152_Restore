@interface SXButtonComponentClassification
+ (id)roleString;
+ (id)typeString;
+ (int)role;
- (Class)componentModelClass;
- (id)accessibilityContextualLabel;
@end

@implementation SXButtonComponentClassification

+ (id)typeString
{
  return @"button";
}

+ (int)role
{
  return 0;
}

+ (id)roleString
{
  return SXComponentClassificationUnknownRoleString;
}

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityContextualLabel
{
  v2 = SXBundle();
  v3 = [v2 localizedStringForKey:@"Button" value:&stru_26D5311C0 table:0];

  return v3;
}

@end