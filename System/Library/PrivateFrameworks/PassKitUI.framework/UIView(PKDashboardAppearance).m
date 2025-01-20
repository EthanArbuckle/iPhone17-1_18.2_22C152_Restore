@interface UIView(PKDashboardAppearance)
- (void)pkui_setMaskType:()PKDashboardAppearance;
@end

@implementation UIView(PKDashboardAppearance)

- (void)pkui_setMaskType:()PKDashboardAppearance
{
  v4 = [a1 layer];
  id v8 = v4;
  uint64_t v5 = 0;
  double v6 = 0.0;
  uint64_t v7 = 15;
  switch(a3)
  {
    case 0:
      goto LABEL_6;
    case 1:
      double v6 = 10.0;
      uint64_t v5 = 1;
      uint64_t v7 = 3;
      goto LABEL_6;
    case 2:
      double v6 = 10.0;
      uint64_t v5 = 1;
      uint64_t v7 = 12;
      goto LABEL_6;
    case 3:
      double v6 = 10.0;
      uint64_t v5 = 1;
      uint64_t v7 = 15;
LABEL_6:
      [v4 setMaskedCorners:v7];
      break;
    default:
      double v6 = 10.0;
      uint64_t v5 = 1;
      break;
  }
  [v8 setCornerCurve:*MEMORY[0x1E4F39EA8]];
  [v8 setCornerRadius:v6];
  [v8 setMasksToBounds:v5];
}

@end