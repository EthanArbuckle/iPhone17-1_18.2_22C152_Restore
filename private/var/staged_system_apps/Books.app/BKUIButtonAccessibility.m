@interface BKUIButtonAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (id)accessibilityLabel;
@end

@implementation BKUIButtonAccessibility

+ (id)imaxTargetClassName
{
  return @"UIButton";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(BKUIButtonAccessibility *)self accessibilityIdentifier];
  unsigned int v4 = [v3 isEqualToString:@"CloudDownloadButton"];

  if (v4)
  {
    v5 = sub_1000B86A8(@"download.icloud.button");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BKUIButtonAccessibility;
    v5 = [(BKUIButtonAccessibility *)&v7 accessibilityLabel];
  }

  return v5;
}

@end