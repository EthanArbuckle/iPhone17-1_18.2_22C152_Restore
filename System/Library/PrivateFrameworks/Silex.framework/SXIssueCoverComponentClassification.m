@interface SXIssueCoverComponentClassification
+ (id)roleString;
+ (id)typeString;
+ (int)role;
- (Class)componentModelClass;
- (id)accessibilityContextualLabel;
@end

@implementation SXIssueCoverComponentClassification

+ (id)typeString
{
  return @"issue_cover";
}

+ (int)role
{
  return 0;
}

+ (id)roleString
{
  return @"issue_cover";
}

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityContextualLabel
{
  v2 = SXBundle();
  v3 = [v2 localizedStringForKey:@"Issue Cover" value:&stru_26D5311C0 table:0];

  return v3;
}

@end