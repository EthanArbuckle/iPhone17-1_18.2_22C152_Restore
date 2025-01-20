@interface MKTransitInfoLabelView
+ (int64_t)clusteredShieldSizeForContentSizeCategory:(id)a3;
@end

@implementation MKTransitInfoLabelView

+ (int64_t)clusteredShieldSizeForContentSizeCategory:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:UIContentSizeCategoryExtraExtraExtraLarge] & 1) != 0
    || ([v3 isEqualToString:UIContentSizeCategoryAccessibilityMedium] & 1) != 0
    || ([v3 isEqualToString:UIContentSizeCategoryAccessibilityLarge] & 1) != 0
    || ([v3 isEqualToString:UIContentSizeCategoryAccessibilityExtraLarge] & 1) != 0
    || ([v3 isEqualToString:UIContentSizeCategoryAccessibilityExtraExtraLarge] & 1) != 0)
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:UIContentSizeCategoryAccessibilityExtraExtraExtraLarge])
  {
    int64_t v4 = 6;
  }
  else
  {
    int64_t v4 = 5;
  }

  return v4;
}

@end