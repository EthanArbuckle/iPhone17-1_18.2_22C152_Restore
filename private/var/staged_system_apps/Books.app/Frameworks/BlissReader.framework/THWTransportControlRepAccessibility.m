@interface THWTransportControlRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)thaxLabelForButtonControlRep:(id)a3;
@end

@implementation THWTransportControlRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWTransportControlRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)thaxLabelForButtonControlRep:(id)a3
{
  unint64_t v3 = (unint64_t)[a3 thaxTag];
  if (v3 > 2) {
    return 0;
  }
  v4 = off_46C798[v3];

  return THAccessibilityLocalizedString((uint64_t)v4);
}

@end