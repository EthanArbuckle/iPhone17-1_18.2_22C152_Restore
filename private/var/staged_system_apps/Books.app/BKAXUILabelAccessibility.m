@interface BKAXUILabelAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation BKAXUILabelAccessibility

+ (id)imaxTargetClassName
{
  return @"UILabel";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(BKAXUILabelAccessibility *)self imaxIdentification];
  unsigned int v4 = [v3 isEqualToString:@"PageCountLabel"];

  if (v4)
  {
    v5 = sub_1000B86A8(@"page.number.label");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BKAXUILabelAccessibility;
    v5 = [(BKAXUILabelAccessibility *)&v7 accessibilityLabel];
  }

  return v5;
}

- (id)accessibilityValue
{
  v3 = [(BKAXUILabelAccessibility *)self imaxIdentification];
  unsigned int v4 = [v3 isEqualToString:@"PageCountLabel"];

  if (v4)
  {
    v10 = self;
    v5 = &selRef_accessibilityLabel;
    v6 = &v10;
  }
  else
  {
    v9 = self;
    v5 = &selRef_accessibilityValue;
    v6 = &v9;
  }
  v6[1] = (BKAXUILabelAccessibility *)BKAXUILabelAccessibility;
  objc_super v7 = [v6 v5 v9];

  return v7;
}

@end