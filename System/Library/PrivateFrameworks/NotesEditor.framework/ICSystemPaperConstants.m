@interface ICSystemPaperConstants
+ (double)delayBeforePageControlFadesInInitially;
+ (double)linkBarAnimationDuration;
+ (double)linkBarHeight;
+ (double)linkBarItemsHeight;
+ (double)noteLeadingMargin;
@end

@implementation ICSystemPaperConstants

+ (double)linkBarHeight
{
  return 42.0;
}

+ (double)noteLeadingMargin
{
  v2 = [MEMORY[0x263F82DA0] currentTraitCollection];
  v3 = [v2 preferredContentSizeCategory];

  if ((unint64_t)v3 >= *MEMORY[0x263F83408])
  {
    uint64_t v5 = 0x4048000000000000;
LABEL_10:
    double v4 = *(double *)&v5;
    goto LABEL_11;
  }
  if ((unint64_t)v3 >= *MEMORY[0x263F83410])
  {
    uint64_t v5 = 0x4044000000000000;
    goto LABEL_10;
  }
  if ((unint64_t)v3 >= *MEMORY[0x263F83420])
  {
    uint64_t v5 = 0x4040000000000000;
    goto LABEL_10;
  }
  if ((unint64_t)v3 >= *MEMORY[0x263F83440]) {
    double v4 = 24.0;
  }
  else {
    double v4 = 16.0;
  }
LABEL_11:

  return v4;
}

+ (double)linkBarItemsHeight
{
  return 24.0;
}

+ (double)linkBarAnimationDuration
{
  return 0.33;
}

+ (double)delayBeforePageControlFadesInInitially
{
  return 0.33;
}

@end