@interface PRIncomingCallMetricsProvider
+ (BOOL)canApplyKashidaToText:(id)a3 withFont:(id)a4;
+ (CGRect)maximumHorizontalTextBounds;
+ (CGRect)maximumVerticalTextBounds;
+ (double)_deviceTopMargin;
+ (double)horizontalTextEdgePadding;
+ (double)horizontalTextEdgePaddingForContentSizeCategory:(id)a3;
+ (double)horizontalTextMaxYScreenHeightMultiplier;
+ (double)maxHorizontalTextWidth;
+ (double)maxVerticalTextHeight;
+ (double)minimumScaleFactor;
+ (double)verticalTextMaxYScreenHeightMultiplier;
+ (double)verticalTextMinYScreenHeightMultiplier;
+ (id)_contentSizeCategoryToFactorMap;
+ (id)preferredContentSizeCategory;
+ (unint64_t)maximumVerticalTextLength;
@end

@implementation PRIncomingCallMetricsProvider

+ (double)minimumScaleFactor
{
  return 0.8;
}

+ (unint64_t)maximumVerticalTextLength
{
  [a1 maximumVerticalTextBounds];
  double Height = CGRectGetHeight(v5);
  return +[PRVerticalLabel maximumTextLengthForHeight:Height];
}

+ (double)verticalTextMinYScreenHeightMultiplier
{
  return 0.13;
}

+ (double)verticalTextMaxYScreenHeightMultiplier
{
  return 0.5675;
}

+ (CGRect)maximumVerticalTextBounds
{
  v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 bounds];
  double Height = CGRectGetHeight(v13);

  [a1 maximumHorizontalTextBounds];
  CGFloat Width = CGRectGetWidth(v14);
  [a1 verticalTextMaxYScreenHeightMultiplier];
  double v7 = v6;
  [a1 verticalTextMinYScreenHeightMultiplier];
  double v9 = Height * (v7 - v8);
  double v10 = 0.0;
  double v11 = 0.0;
  double v12 = Width;
  result.size.height = v9;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

+ (BOOL)canApplyKashidaToText:(id)a3 withFont:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  double v6 = (objc_class *)MEMORY[0x1E4F28B18];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  uint64_t v15 = *MEMORY[0x1E4FB06F8];
  v16[0] = v7;
  double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];

  double v11 = (void *)[v9 initWithString:v8 attributes:v10];
  [v11 size];
  double v13 = v12;
  [a1 maximumHorizontalTextBounds];
  LOBYTE(a1) = v13 < CGRectGetWidth(v17);

  return (char)a1;
}

+ (id)_contentSizeCategoryToFactorMap
{
  if (_contentSizeCategoryToFactorMap_once != -1) {
    dispatch_once(&_contentSizeCategoryToFactorMap_once, &__block_literal_global_39);
  }
  v2 = (void *)_contentSizeCategoryToFactorMap_mapContentSizeFactor;
  return v2;
}

void __64__PRIncomingCallMetricsProvider__contentSizeCategoryToFactorMap__block_invoke()
{
  v9[12] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4FB27E8];
  v8[0] = *MEMORY[0x1E4FB27C8];
  v8[1] = v0;
  v9[0] = &unk_1ED9EEE60;
  v9[1] = &unk_1ED9EEE60;
  uint64_t v1 = *MEMORY[0x1E4FB27D0];
  v8[2] = *MEMORY[0x1E4FB27D8];
  v8[3] = v1;
  v9[2] = &unk_1ED9EEE60;
  v9[3] = &unk_1ED9EEE60;
  uint64_t v2 = *MEMORY[0x1E4FB27B8];
  v8[4] = *MEMORY[0x1E4FB27C0];
  v8[5] = v2;
  v9[4] = &unk_1ED9EEE78;
  v9[5] = &unk_1ED9EEE90;
  uint64_t v3 = *MEMORY[0x1E4FB2798];
  v8[6] = *MEMORY[0x1E4FB27B0];
  v8[7] = v3;
  v9[6] = &unk_1ED9EEE90;
  v9[7] = &unk_1ED9EEEA8;
  uint64_t v4 = *MEMORY[0x1E4FB2788];
  v8[8] = *MEMORY[0x1E4FB2790];
  v8[9] = v4;
  v9[8] = &unk_1ED9EEEC0;
  v9[9] = &unk_1ED9EEED8;
  uint64_t v5 = *MEMORY[0x1E4FB2778];
  v8[10] = *MEMORY[0x1E4FB2780];
  v8[11] = v5;
  v9[10] = &unk_1ED9EEEF0;
  v9[11] = &unk_1ED9EEF08;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:12];
  id v7 = (void *)_contentSizeCategoryToFactorMap_mapContentSizeFactor;
  _contentSizeCategoryToFactorMap_mapContentSizeFactor = v6;
}

+ (double)_deviceTopMargin
{
  if (_deviceTopMargin_once != -1) {
    dispatch_once(&_deviceTopMargin_once, &__block_literal_global_20);
  }
  return *(double *)&_deviceTopMargin_deviceTopMargin;
}

void __49__PRIncomingCallMetricsProvider__deviceTopMargin__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v0 bounds];
  double Height = CGRectGetHeight(v3);

  double v2 = 25.0;
  if (Height >= 800.0)
  {
    if (Height == 852.0)
    {
      double v2 = 60.0;
    }
    else
    {
      double v2 = 60.0;
      if (Height < 930.0) {
        double v2 = 50.0;
      }
    }
  }
  _deviceTopMargin_deviceTopMargin = *(void *)&v2;
}

+ (double)horizontalTextMaxYScreenHeightMultiplier
{
  return 0.225;
}

+ (double)horizontalTextEdgePaddingForContentSizeCategory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _contentSizeCategoryToFactorMap];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = &unk_1ED9EEE60;
  if (v6) {
    id v7 = v6;
  }
  id v8 = v7;

  double v9 = (double)(unint64_t)[v8 unsignedIntegerValue] * 4.0 + 44.0;
  double v10 = [MEMORY[0x1E4FB1BA8] mainScreen];

  [v10 bounds];
  double Width = CGRectGetWidth(v13);

  double result = v9 + -4.0;
  if (Width > 375.0) {
    return v9;
  }
  return result;
}

+ (id)preferredContentSizeCategory
{
  double v2 = _UIAccessibilityContentSizeCategoryName();
  CGRect v3 = v2;
  if (!v2) {
    double v2 = (void *)*MEMORY[0x1E4FB27D0];
  }
  id v4 = v2;

  return v4;
}

+ (double)horizontalTextEdgePadding
{
  CGRect v3 = [a1 preferredContentSizeCategory];
  [a1 horizontalTextEdgePaddingForContentSizeCategory:v3];
  double v5 = v4;

  return v5;
}

+ (CGRect)maximumHorizontalTextBounds
{
  CGRect v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 bounds];
  double Width = CGRectGetWidth(v16);

  [a1 horizontalTextEdgePadding];
  double v6 = Width + v5 * -2.0;
  id v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v7 bounds];
  double Height = CGRectGetHeight(v17);

  [(id)objc_opt_class() _deviceTopMargin];
  double v10 = v9;
  [a1 horizontalTextMaxYScreenHeightMultiplier];
  double v12 = -(v10 - Height * v11);
  double v13 = 0.0;
  double v14 = 0.0;
  double v15 = v6;
  result.size.height = v12;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

+ (double)maxVerticalTextHeight
{
  [a1 maximumVerticalTextBounds];
  return CGRectGetHeight(*(CGRect *)&v2);
}

+ (double)maxHorizontalTextWidth
{
  [a1 maximumHorizontalTextBounds];
  return CGRectGetWidth(*(CGRect *)&v2);
}

@end