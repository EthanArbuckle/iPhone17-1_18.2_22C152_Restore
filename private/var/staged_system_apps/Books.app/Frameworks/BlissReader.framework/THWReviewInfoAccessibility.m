@interface THWReviewInfoAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)thaxLocalizedDescriptionForQuestionState:(int)a3;
@end

@implementation THWReviewInfoAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWReviewInfo";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)thaxLocalizedDescriptionForQuestionState:(int)a3
{
  if ((a3 - 3) > 3) {
    return 0;
  }
  else {
    return THAccessibilityLocalizedString((uint64_t)off_46C860[a3 - 3]);
  }
}

@end