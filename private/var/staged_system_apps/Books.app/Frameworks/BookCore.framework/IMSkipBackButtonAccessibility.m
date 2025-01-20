@interface IMSkipBackButtonAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (id)accessibilityLabel;
@end

@implementation IMSkipBackButtonAccessibility

+ (id)imaxTargetClassName
{
  return @"IMSkipBackButton";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v2 = [(IMSkipBackButtonAccessibility *)self imaxValueForKey:@"_timeInterval"];
  [v2 doubleValue];
  double v4 = v3;

  if (v4 == 0.0) {
    double v4 = 30.0;
  }
  v5 = objc_opt_new();
  [v5 setUnitsStyle:3];
  [v5 setAllowedUnits:128];
  v6 = [v5 stringFromTimeInterval:v4];
  v7 = IMAXLocString(@"skip.back %@");
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v6);

  return v8;
}

@end