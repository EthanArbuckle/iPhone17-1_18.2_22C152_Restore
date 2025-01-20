@interface SearchUIAppIconUtilities
+ (CGSize)appIconItemSize;
+ (double)distanceToTopOfAppIconsForMultiResultCell;
+ (double)idealHorizontalSpacingBetweenAppIcons;
+ (double)idealHorizontalSpacingBetweenAppIconsForContainerWidth:(double)a3 insets:(UIEdgeInsets)a4;
+ (double)preferredHorizontalPlatterInsetForAppIcons;
+ (int64_t)numberOfAppIconsPerRow;
@end

@implementation SearchUIAppIconUtilities

+ (double)preferredHorizontalPlatterInsetForAppIcons
{
  +[SearchUIUtilities standardTableCellContentInset];
  return result;
}

+ (double)distanceToTopOfAppIconsForMultiResultCell
{
  v2 = objc_opt_class();
  [v2 preferredHorizontalPlatterInsetForAppIcons];
  return result;
}

+ (int64_t)numberOfAppIconsPerRow
{
  if (+[SearchUIUtilities isIpad]) {
    return 6;
  }
  else {
    return 4;
  }
}

+ (CGSize)appIconItemSize
{
  double v2 = *(double *)&searchUI_appIconItemSize_0;
  double v3 = *(double *)&searchUI_appIconItemSize_1;
  if (*(double *)&searchUI_appIconItemSize_0 == *MEMORY[0x1E4F1DB30]
    && *(double *)&searchUI_appIconItemSize_1 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v5 = objc_opt_new();
    [v5 iconViewSize];
    searchUI_appIconItemSize_0 = v6;
    searchUI_appIconItemSize_1 = v7;

    double v2 = *(double *)&searchUI_appIconItemSize_0;
    double v3 = *(double *)&searchUI_appIconItemSize_1;
  }
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)idealHorizontalSpacingBetweenAppIcons
{
  double result = *(double *)&idealHorizontalSpacingBetweenAppIcons_spacing;
  if (*(double *)&idealHorizontalSpacingBetweenAppIcons_spacing == 0.0)
  {
    BOOL v4 = +[SearchUIUtilities isIpad];
    double result = 22.0;
    if (!v4)
    {
      v5 = objc_msgSend(MEMORY[0x1E4FB1BA8], "mainScreen", 22.0);
      [v5 _referenceBounds];
      double v7 = v6;

      [a1 preferredHorizontalPlatterInsetForAppIcons];
      double v9 = v8;
      +[SearchUIUtilities standardTableCellContentInset];
      objc_msgSend(a1, "idealHorizontalSpacingBetweenAppIconsForContainerWidth:insets:", v7, 0.0, v9 + v10, 0.0, v9 + v10);
      idealHorizontalSpacingBetweenAppIcons_spacing = *(void *)&result;
    }
  }
  return result;
}

+ (double)idealHorizontalSpacingBetweenAppIconsForContainerWidth:(double)a3 insets:(UIEdgeInsets)a4
{
  double v5 = a3 - a4.left - a4.right;
  [a1 appIconItemSize];
  double v7 = v5 - v6 * (double)[a1 numberOfAppIconsPerRow];
  double v8 = (void *)MEMORY[0x1E4FAE100];
  double v9 = v7 / (double)([a1 numberOfAppIconsPerRow] - 1);
  [v8 deviceScaledRoundedValue:0 forView:v9];
  return result;
}

@end