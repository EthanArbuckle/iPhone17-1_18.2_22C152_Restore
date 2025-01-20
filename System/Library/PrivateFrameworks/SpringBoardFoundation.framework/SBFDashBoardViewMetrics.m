@interface SBFDashBoardViewMetrics
+ (BOOL)_isPortrait;
+ (BOOL)_presentsListBelowDateTime;
+ (BOOL)layoutCentersContent:(unint64_t)a3;
+ (BOOL)layoutUsesMargin:(unint64_t)a3;
+ (CGRect)_reducedPageBoundsFromBounds:(CGRect)a3 forPage:(unint64_t)a4;
+ (CGRect)suggestedFrameForCallToActionLabel:(id)a3 yOffset:(double)a4 inBounds:(CGRect)a5;
+ (CGRect)suggestedFrameForDateTimeViewInScreenCoordinates:(CGRect)a3 centeredX:(BOOL)a4;
+ (CGRect)suggestedFrameForListForPage:(unint64_t)a3 pageBounds:(CGRect)a4;
+ (CGRect)suggestedFrameForListForPage:(unint64_t)a3 pageBounds:(CGRect)a4 insets:(UIEdgeInsets)a5;
+ (CGRect)suggestedFrameForListForPage:(unint64_t)a3 pageBounds:(CGRect)a4 insets:(UIEdgeInsets)a5 scrollsDateTime:(BOOL)a6;
+ (CGRect)suggestedFrameForMediaArtworkForControlsFrame:(CGRect)a3 bottomInset:(double)a4 inPageBounds:(CGRect)a5;
+ (CGRect)suggestedFrameForMediaControlsForPageBounds:(CGRect)a3;
+ (CGRect)suggestedFrameForStatusView:(id)a3 inView:(id)a4 withInsets:(UIEdgeInsets)a5;
+ (UIEdgeInsets)_cachedGlyphInsetsForString:(id)a3 withFont:(id)a4;
+ (UIEdgeInsets)suggestedContentInsetsForListForPage:(unint64_t)a3 pageBounds:(CGRect)a4;
+ (UIEdgeInsets)suggestedContentInsetsForListForPage:(unint64_t)a3 pageBounds:(CGRect)a4 scrollsDateTime:(BOOL)a5;
+ (double)_dateTimeMinXForReducedBounds:(CGRect)a3 forPage:(unint64_t)a4;
+ (double)_padSpecificInsets:(SBFDashBoardPadPageInsets *)a3 leading:(BOOL)a4;
+ (double)_padSpecificValueForDevice:(SBFDashBoardOrientationLeadingInsets)a3 leading:(BOOL)a4;
+ (double)_padSpecificValueJ99:(double)a3 otherPad:(double)a4;
+ (double)_phoneSpecificValueN56:(double)a3 n61:(double)a4 n69:(double)a5;
+ (double)_phoneSpecificValueN56:(double)a3 n61:(double)a4 n69:(double)a5 d22:(double)a6;
+ (double)dateBaselineToListY;
+ (double)listInsetXForPage:(unint64_t)a3;
+ (double)listInsetXForPage:(unint64_t)a3 leading:(BOOL)a4;
+ (double)listMinYForPage:(unint64_t)a3;
+ (double)listWidthForPage:(unint64_t)a3;
+ (double)scaledFontSize:(double)a3 withMaximumFontSizeCategory:(id)a4;
+ (double)searchBarWidth;
+ (double)searchClippingLineMaxY;
+ (double)singleLineDateViewBaselineDifferenceY;
+ (double)timeLabelBaselineY;
+ (double)timeLabelScrollPercentForPage:(unint64_t)a3;
+ (double)timeLabelToSubtitleLabelDifferenceY;
+ (double)timeSubtitleBaselineY;
+ (double)timeToListInsetXforPage:(unint64_t)a3;
+ (double)timeToSubtitleLabelBaselineDifferenceY;
+ (id)dateFont;
+ (id)dateOnlyLunarDateFont;
+ (unint64_t)dateTimeLayoutForPage:(unint64_t)a3;
+ (unint64_t)listLayoutForPage:(unint64_t)a3;
@end

@implementation SBFDashBoardViewMetrics

+ (unint64_t)listLayoutForPage:(unint64_t)a3
{
  v5 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return a3 != 2;
  }
  char v8 = [a1 _isPortrait];
  unint64_t v9 = 3;
  if (a3) {
    unint64_t v9 = 0;
  }
  if (a3 == 1) {
    unint64_t v9 = 4;
  }
  if (v8) {
    return 2;
  }
  else {
    return v9;
  }
}

+ (BOOL)layoutCentersContent:(unint64_t)a3
{
  return a3 - 1 < 2;
}

+ (BOOL)layoutUsesMargin:(unint64_t)a3
{
  return a3 - 2 < 3;
}

+ (unint64_t)dateTimeLayoutForPage:(unint64_t)a3
{
  if (a3 == 2) {
    return 1;
  }
  if (a3 == 1) {
    return objc_msgSend(a1, "_presentsListBelowDateTime", v3, v4) ^ 1;
  }
  return 2;
}

+ (CGRect)suggestedFrameForListForPage:(unint64_t)a3 pageBounds:(CGRect)a4
{
  objc_msgSend(a1, "suggestedFrameForListForPage:pageBounds:insets:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (CGRect)suggestedFrameForListForPage:(unint64_t)a3 pageBounds:(CGRect)a4 insets:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v15 = [a1 listScrollsDateTime];
  objc_msgSend(a1, "suggestedFrameForListForPage:pageBounds:insets:scrollsDateTime:", a3, v15, x, y, width, height, top, left, bottom, right);
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

+ (CGRect)suggestedFrameForListForPage:(unint64_t)a3 pageBounds:(CGRect)a4 insets:(UIEdgeInsets)a5 scrollsDateTime:(BOOL)a6
{
  BOOL v6 = a6;
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  objc_msgSend(a1, "_reducedPageBoundsFromBounds:forPage:");
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  CGFloat v45 = width;
  CGFloat v46 = height;
  objc_msgSend(a1, "suggestedContentInsetsForListForPage:pageBounds:scrollsDateTime:", a3, v6, x, y, width, height);
  double v23 = v22;
  unint64_t v24 = +[SBFDashBoardViewMetrics listLayoutForPage:a3];
  double v25 = 0.0;
  if (!v6)
  {
    [a1 listMinYForPage:a3];
    double v25 = v26 - v23;
  }
  v52.origin.double x = v15;
  v52.origin.double y = v17;
  v52.size.double width = v19;
  v52.size.double height = v21;
  double v27 = CGRectGetHeight(v52) - v25;
  BOOL v28 = +[SBFDashBoardViewMetrics layoutUsesMargin:v24];
  BOOL v29 = +[SBFDashBoardViewMetrics layoutCentersContent:v24];
  BOOL v30 = v29;
  if (v28)
  {
    [a1 listWidthForPage:a3];
    double v43 = v27;
    double v44 = v31;
    if (v30)
    {
      [a1 listInsetXForPage:a3];
    }
    else
    {
      if (v24 == 4)
      {
        v55.origin.double x = v15;
        v55.origin.double y = v17;
        v55.size.double width = v19;
        v55.size.double height = v21;
        CGFloat v34 = CGRectGetWidth(v55) - v44;
        [a1 listInsetXForPage:a3 leading:0];
        double v33 = v34 - v35;
        goto LABEL_14;
      }
      if (v24 != 3)
      {
        v36 = [MEMORY[0x1E4F28B00] currentHandler];
        [v36 handleFailureInMethod:a2, a1, @"SBFDashBoardViewMetrics.m", 265, @"The only way to get here should be left or right align, not %lu", v24 object file lineNumber description];

        double v33 = 0.0;
        goto LABEL_14;
      }
      [a1 listInsetXForPage:a3 leading:1];
    }
    double v33 = v32;
LABEL_14:
    v56.origin.double x = v15;
    v56.origin.double y = v17;
    v56.size.double width = v19;
    v56.size.double height = v21;
    double v15 = v33 + CGRectGetMinX(v56);
    double v17 = v25;
    double v21 = v43;
    double v19 = v44;
    goto LABEL_15;
  }
  if (v29)
  {
    v53.origin.double x = v15;
    v53.origin.double y = v17;
    v53.size.double width = v19;
    v53.size.double height = v21;
    CGRect v54 = CGRectInset(v53, 0.0, 0.0);
    double v15 = v54.origin.x;
    double v19 = v54.size.width;
    double v17 = v25;
    double v21 = v27;
  }
LABEL_15:
  double v37 = v19 - (left + right);
  double v38 = v21 - (top + bottom);
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
  {
    v57.origin.double x = x;
    v57.origin.double y = y;
    v57.size.double width = v45;
    v57.size.double height = v46;
    CGRectGetWidth(v57);
    v58.origin.double x = left + v15;
    v58.origin.double y = top + v17;
    v58.size.double width = v37;
    v58.size.double height = v38;
    CGRectGetMaxX(v58);
  }
  SBFMainScreenScale();
  BSRectRoundForScale();
  result.size.double height = v42;
  result.size.double width = v41;
  result.origin.double y = v40;
  result.origin.double x = v39;
  return result;
}

+ (UIEdgeInsets)suggestedContentInsetsForListForPage:(unint64_t)a3 pageBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v10 = [a1 listScrollsDateTime];
  objc_msgSend(a1, "suggestedContentInsetsForListForPage:pageBounds:scrollsDateTime:", a3, v10, x, y, width, height);
  result.double right = v14;
  result.double bottom = v13;
  result.double left = v12;
  result.double top = v11;
  return result;
}

+ (UIEdgeInsets)suggestedContentInsetsForListForPage:(unint64_t)a3 pageBounds:(CGRect)a4 scrollsDateTime:(BOOL)a5
{
  BOOL v5 = a5;
  objc_msgSend(a1, "listMinYForPage:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  double v9 = v8;
  if (v5)
  {
    *(double *)&uint64_t v10 = 66.0;
    if (!a3)
    {
      [a1 searchClippingLineMaxY];
      double v9 = v9 - v11;
    }
  }
  else if (a3 == 1)
  {
    if ([a1 _presentsListBelowDateTime]) {
      double v9 = 10.0;
    }
    *(double *)&uint64_t v10 = 66.0;
  }
  else
  {
    *(double *)&uint64_t v10 = 0.0;
    if (a3)
    {
      double v9 = 0.0;
    }
    else
    {
      [a1 searchClippingLineMaxY];
      double v9 = -v12;
    }
  }
  double v13 = 0.0;
  double v14 = 0.0;
  double v15 = v9;
  double v16 = *(double *)&v10;
  result.double right = v14;
  result.double bottom = v16;
  result.double left = v13;
  result.double top = v15;
  return result;
}

+ (CGRect)suggestedFrameForMediaControlsForPageBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  double v11 = (char *)[(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation];
  [MEMORY[0x1E4F42E28] heightForStyle:1 orientation:v11];
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_3;
    }
  }
  else
  {
    double v15 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v3 = (void *)[v15 userInterfaceIdiom];

    if (v3 != (void *)1)
    {
LABEL_3:
      uint64_t v12 = __sb__runningInSpringBoard();
      if (v12)
      {
        if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
        {
          int v13 = 0;
          int v14 = 0;
          goto LABEL_29;
        }
      }
      else
      {
        double v11 = [MEMORY[0x1E4F42948] currentDevice];
        if ([v11 userInterfaceIdiom])
        {
          int v14 = 0;
          int v13 = 1;
          goto LABEL_29;
        }
      }
      int v13 = v12 ^ 1;
      int v20 = __sb__runningInSpringBoard();
      if (v20)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v12 = [MEMORY[0x1E4F42D90] mainScreen];
        [(id)v12 _referenceBounds];
      }
      int v14 = v20 ^ 1;
      BSSizeRoundForScale();
      if (v21 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
      {
        if (v14) {
          goto LABEL_48;
        }
        goto LABEL_37;
      }
LABEL_29:
      int v22 = __sb__runningInSpringBoard();
      char v23 = v22;
      if (v22)
      {
        if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
        {
          if (v14) {
            goto LABEL_48;
          }
          goto LABEL_37;
        }
      }
      else
      {
        double v4 = [MEMORY[0x1E4F42948] currentDevice];
        if ([v4 userInterfaceIdiom]) {
          goto LABEL_47;
        }
      }
      int v28 = __sb__runningInSpringBoard();
      char v29 = v28;
      if (v28)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        BOOL v6 = [MEMORY[0x1E4F42D90] mainScreen];
        [v6 _referenceBounds];
      }
      BSSizeRoundForScale();
      if (v29)
      {
        if ((v23 & 1) == 0) {
          goto LABEL_47;
        }
LABEL_51:
        if (v14)
        {
LABEL_48:

          if ((v13 & 1) == 0) {
            goto LABEL_39;
          }
LABEL_38:

          goto LABEL_39;
        }
LABEL_37:
        if (!v13) {
          goto LABEL_39;
        }
        goto LABEL_38;
      }

      if (v23) {
        goto LABEL_51;
      }
LABEL_47:

      if (v14) {
        goto LABEL_48;
      }
      goto LABEL_37;
    }
  }
  if ((unint64_t)(v11 - 3) <= 1)
  {
    v31.origin.double x = x;
    v31.origin.CGFloat y = y;
    v31.size.double width = width;
    v31.size.CGFloat height = height;
    double x = CGRectGetWidth(v31) * 0.5;
    double width = width - x;
  }
  int v16 = __sb__runningInSpringBoard();
  char v17 = v16;
  if (v16)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_39;
    }
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v3 userInterfaceIdiom] != 1)
    {

      goto LABEL_39;
    }
  }
  int v18 = __sb__runningInSpringBoard();
  char v19 = v18;
  if (v18)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    BOOL v5 = [MEMORY[0x1E4F42D90] mainScreen];
    [v5 _referenceBounds];
  }
  BSSizeRoundForScale();
  if ((v19 & 1) == 0) {

  }
  if ((v17 & 1) == 0) {
LABEL_39:
  }
  v32.origin.double x = x;
  v32.origin.CGFloat y = y;
  v32.size.double width = width;
  v32.size.CGFloat height = height;
  CGRectGetMinX(v32);
  v33.origin.double x = x;
  v33.origin.CGFloat y = y;
  v33.size.double width = width;
  v33.size.CGFloat height = height;
  CGRectGetWidth(v33);
  UIRectInset();
  SBFMainScreenScale();
  BSRectRoundForScale();
  result.size.CGFloat height = v27;
  result.size.double width = v26;
  result.origin.CGFloat y = v25;
  result.origin.double x = v24;
  return result;
}

+ (CGRect)suggestedFrameForMediaArtworkForControlsFrame:(CGRect)a3 bottomInset:(double)a4 inPageBounds:(CGRect)a5
{
  CGRectGetMaxY(a3);
  BOOL v6 = (void *)0x1E4F42000;
  double v7 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    CGRectGetWidth(a5);
    CGRectGetHeight(a5);
    goto LABEL_17;
  }
  if ((unint64_t)([(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation] - 3) <= 1) {
    CGRectGetWidth(a5);
  }
  int v9 = __sb__runningInSpringBoard();
  char v10 = v9;
  if (v9)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_17;
    }
  }
  else
  {
    BOOL v6 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v6 userInterfaceIdiom] != 1)
    {
LABEL_16:

      goto LABEL_17;
    }
  }
  int v11 = __sb__runningInSpringBoard();
  char v12 = v11;
  if (v11)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    BOOL v5 = [MEMORY[0x1E4F42D90] mainScreen];
    [v5 _referenceBounds];
  }
  BSSizeRoundForScale();
  if ((v12 & 1) == 0) {

  }
  if ((v10 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_17:
  UIRectCenteredXInRectScale();
  result.size.CGFloat height = v16;
  result.size.double width = v15;
  result.origin.CGFloat y = v14;
  result.origin.double x = v13;
  return result;
}

+ (CGRect)suggestedFrameForCallToActionLabel:(id)a3 yOffset:(double)a4 inBounds:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  objc_msgSend(a3, "sizeThatFits:", a5.size.width + -48.0, 1.79769313e308);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  CGRectGetMaxY(v13);
  UIRectCenteredXInRectScale();
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

+ (double)searchBarWidth
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SBFDashBoardViewMetrics_searchBarWidth__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (searchBarWidth_onceToken != -1) {
    dispatch_once(&searchBarWidth_onceToken, block);
  }
  return *(double *)&searchBarWidth_sSearchBarWidth;
}

void __41__SBFDashBoardViewMetrics_searchBarWidth__block_invoke(uint64_t a1)
{
  int v2 = _os_feature_enabled_impl();
  double v3 = 556.0;
  if (v2) {
    double v3 = 425.0;
  }
  searchBarWidth_sSearchBardouble Width = *(void *)&v3;
  double v4 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    double v6 = *(double *)&searchBarWidth_sSearchBarWidth;
    double v7 = [MEMORY[0x1E4F42D90] mainScreen];
    [v7 _referenceBounds];
    double Width = CGRectGetWidth(v12);
    [*(id *)(a1 + 32) listInsetXForPage:0];
    double v10 = Width + v9 * -2.0;

    if (v6 <= v10) {
      *(double *)&uint64_t v11 = v6;
    }
    else {
      *(double *)&uint64_t v11 = v10;
    }
    searchBarWidth_sSearchBardouble Width = v11;
  }
}

+ (double)timeLabelScrollPercentForPage:(unint64_t)a3
{
  uint64_t v3 = [a1 dateTimeLayoutForPage:a3];
  if (v3 == 2)
  {
    BOOL v5 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1;
    double result = 1.0;
    double v6 = -1.0;
  }
  else
  {
    double result = 0.0;
    if (v3 != 1) {
      return result;
    }
    BOOL v5 = objc_msgSend((id)*MEMORY[0x1E4F43630], "userInterfaceLayoutDirection", 0.0) == 1;
    double result = -1.0;
    double v6 = 1.0;
  }
  if (v5) {
    return v6;
  }
  return result;
}

+ (CGRect)suggestedFrameForDateTimeViewInScreenCoordinates:(CGRect)a3 centeredX:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  objc_msgSend(a1, "_reducedPageBoundsFromBounds:forPage:", 0);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  CGFloat rect = v10;
  double rect_8 = width;
  if ([a1 _presentsListBelowDateTime])
  {
    objc_msgSend(a1, "suggestedFrameForListForPage:pageBounds:", 0, x, y, width, height);
    uint64_t v19 = v18;
    uint64_t v21 = v20;
    uint64_t v23 = v22;
    uint64_t v25 = v24;
    [a1 timeToListInsetXforPage:0];
    double v27 = v26;
    int v28 = (id *)MEMORY[0x1E4F43630];
    uint64_t v29 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
    uint64_t v30 = v19;
    uint64_t v31 = v21;
    uint64_t v32 = v23;
    uint64_t v33 = v25;
    if (v29 == 1) {
      double v34 = v27 + CGRectGetMinX(*(CGRect *)&v30);
    }
    else {
      double v34 = CGRectGetMaxX(*(CGRect *)&v30) - v27;
    }
    CGFloat v54 = height;
    CGFloat v36 = x;
    objc_msgSend(a1, "suggestedFrameForListForPage:pageBounds:", 1, x, y, rect_8, height, *(void *)&v34);
    uint64_t v38 = v37;
    uint64_t v40 = v39;
    uint64_t v42 = v41;
    uint64_t v44 = v43;
    [a1 timeToListInsetXforPage:1];
    uint64_t v45 = [*v28 userInterfaceLayoutDirection];
    uint64_t v46 = v38;
    uint64_t v47 = v40;
    uint64_t v48 = v42;
    uint64_t v49 = v44;
    if (v45 == 1) {
      CGRectGetMaxX(*(CGRect *)&v46);
    }
    else {
      CGRectGetMinX(*(CGRect *)&v46);
    }
    double height = v54;
    if (![a1 dateTimeLayoutForPage:1])
    {
      v60.origin.double x = x;
      v60.origin.double y = y;
      v60.size.double width = rect_8;
      v60.size.double height = v54;
      CGRectGetMaxX(v60);
    }
    if (v4)
    {
LABEL_17:
      v61.origin.double x = v36;
      v61.origin.double y = y;
      v61.size.double width = rect_8;
      v61.size.double height = height;
      CGRectGetWidth(v61);
      UIRectCenteredXInRect();
      CGRectGetMinX(v62);
    }
  }
  else
  {
    objc_msgSend(a1, "_dateTimeMinXForReducedBounds:forPage:", 0, v11, v13, v15, v17);
    double v35 = (id *)MEMORY[0x1E4F43630];
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
    {
      v58.origin.double x = v11;
      v58.origin.double y = v13;
      v58.size.double width = v15;
      v58.size.double height = v17;
      CGRectGetWidth(v58);
    }
    objc_msgSend(a1, "_dateTimeMinXForReducedBounds:forPage:", 1, v11, v13, v15, v17);
    CGFloat v36 = x;
    if ([*v35 userInterfaceLayoutDirection] == 1)
    {
      v59.origin.double x = rect;
      v59.origin.double y = v13;
      v59.size.double width = v15;
      v59.size.double height = v17;
      CGRectGetWidth(v59);
    }
    if (v4) {
      goto LABEL_17;
    }
  }
  [a1 timeLabelBaselineY];
  +[SBFLockScreenDateView timeFontMetrics];
  [a1 timeSubtitleBaselineY];
  +[SBFLockScreenDateSubtitleView labelFontMetrics];
  SBFMainScreenScale();
  BSRectRoundForScale();
  result.size.double height = v53;
  result.size.double width = v52;
  result.origin.double y = v51;
  result.origin.double x = v50;
  return result;
}

+ (double)_dateTimeMinXForReducedBounds:(CGRect)a3 forPage:(unint64_t)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v10 = objc_msgSend(a1, "dateTimeLayoutForPage:");
  if (v10)
  {
    if (v10 == 2)
    {
      v16.origin.CGFloat x = x;
      v16.origin.CGFloat y = y;
      v16.size.CGFloat width = width;
      v16.size.CGFloat height = height;
      double MaxX = CGRectGetMaxX(v16);
      [a1 listInsetXForPage:a4];
      return MaxX - v13;
    }
    else if (v10 == 1)
    {
      [a1 listInsetXForPage:a4];
    }
  }
  else
  {
    v15.origin.CGFloat x = x;
    v15.origin.CGFloat y = y;
    v15.size.CGFloat width = width;
    v15.size.CGFloat height = height;
    return CGRectGetWidth(v15) * 0.5;
  }
  return result;
}

+ (double)timeLabelBaselineY
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SBFDashBoardViewMetrics_timeLabelBaselineY__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (timeLabelBaselineY_onceToken != -1) {
    dispatch_once(&timeLabelBaselineY_onceToken, block);
  }
  [a1 searchClippingLineMaxY];
  +[SBFLockScreenDateView timeFontMetrics];
  SBFMainScreenScale();
  BSFloatRoundForScale();
  return result;
}

uint64_t __45__SBFDashBoardViewMetrics_timeLabelBaselineY__block_invoke(uint64_t a1)
{
  int v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  BOOL v4 = *(void **)(a1 + 32);
  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    uint64_t result = [v4 _padSpecificValueJ99:192.0 otherPad:166.0];
  }
  else {
    uint64_t result = [v4 _phoneSpecificValueN56:154.0 n61:140.0 n69:140.0 d22:175.0];
  }
  timeLabelBaselineY_timeLabelMinimumOffsetFromTopBaselineY = v6;
  return result;
}

+ (double)timeLabelToSubtitleLabelDifferenceY
{
  if (timeLabelToSubtitleLabelDifferenceY_onceToken != -1) {
    dispatch_once(&timeLabelToSubtitleLabelDifferenceY_onceToken, &__block_literal_global_26);
  }
  if ((BSFloatIsZero() & 1) == 0) {
    return *(double *)&timeLabelToSubtitleLabelDifferenceY_timeLabelToSubtitleLabelDifferenceY;
  }
  +[SBFLockScreenDateView timeFontMetrics];
  double v4 = v3;
  [a1 timeToSubtitleLabelBaselineDifferenceY];
  double v6 = v4 + v5;
  +[SBFLockScreenDateSubtitleView labelFontMetrics];
  double result = v6 - v7;
  timeLabelToSubtitleLabelDifferenceY_timeLabelToSubtitleLabelDifferenceY = *(void *)&result;
  return result;
}

void __62__SBFDashBoardViewMetrics_timeLabelToSubtitleLabelDifferenceY__block_invoke()
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v0 = *MEMORY[0x1E4F43788];
  v1 = [MEMORY[0x1E4F28F08] mainQueue];
  id v2 = (id)[v3 addObserverForName:v0 object:0 queue:v1 usingBlock:&__block_literal_global_17_1];
}

void __62__SBFDashBoardViewMetrics_timeLabelToSubtitleLabelDifferenceY__block_invoke_2()
{
  timeLabelToSubtitleLabelDifferenceY_timeLabelToSubtitleLabelDifferenceY = 0;
}

+ (double)timeToSubtitleLabelBaselineDifferenceY
{
  if (timeToSubtitleLabelBaselineDifferenceY_onceToken != -1) {
    dispatch_once(&timeToSubtitleLabelBaselineDifferenceY_onceToken, &__block_literal_global_19_1);
  }
  if ((BSFloatIsZero() & 1) == 0) {
    return *(double *)&timeToSubtitleLabelBaselineDifferenceY_timeToSubtitleLabelBaselineDifferenceY;
  }
  id v3 = [(id)*MEMORY[0x1E4F43630] preferredContentSizeCategory];
  IsAccessibilityCategorCGFloat y = UIContentSizeCategoryIsAccessibilityCategory(v3);

  if (IsAccessibilityCategory)
  {
    +[SBFLockScreenDateSubtitleView labelFontMetrics];
    double result = v5;
    timeToSubtitleLabelBaselineDifferenceY_timeToSubtitleLabelBaselineDifferenceY = *(void *)&v5;
  }
  else
  {
    double v7 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      [a1 _padSpecificValueJ99:46.0 otherPad:40.0];
      timeToSubtitleLabelBaselineDifferenceY_timeToSubtitleLabelBaselineDifferenceY = *(void *)&result;
    }
    else
    {
      timeToSubtitleLabelBaselineDifferenceY_timeToSubtitleLabelBaselineDifferenceY = 0x4042000000000000;
      return 36.0;
    }
  }
  return result;
}

void __65__SBFDashBoardViewMetrics_timeToSubtitleLabelBaselineDifferenceY__block_invoke()
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v0 = *MEMORY[0x1E4F43788];
  v1 = [MEMORY[0x1E4F28F08] mainQueue];
  id v2 = (id)[v3 addObserverForName:v0 object:0 queue:v1 usingBlock:&__block_literal_global_21];
}

void __65__SBFDashBoardViewMetrics_timeToSubtitleLabelBaselineDifferenceY__block_invoke_2()
{
  timeToSubtitleLabelBaselineDifferenceY_timeToSubtitleLabelBaselineDifferenceY = 0;
}

+ (UIEdgeInsets)_cachedGlyphInsetsForString:(id)a3 withFont:(id)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (_cachedGlyphInsetsForString_withFont__onceToken != -1) {
    dispatch_once(&_cachedGlyphInsetsForString_withFont__onceToken, &__block_literal_global_23);
  }
  double v7 = [(id)_cachedGlyphInsetsForString_withFont__leadingInsetForNumber objectForKeyedSubscript:v5];
  uint64_t v8 = [(id)_cachedGlyphInsetsForString_withFont__trailingInsetForNumber objectForKeyedSubscript:v5];
  double v9 = (void *)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    uint64_t v32 = *MEMORY[0x1E4F42508];
    v33[0] = v6;
    double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    double v12 = *MEMORY[0x1E4F1DB30];
    double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 8, v11, 0, *MEMORY[0x1E4F1DB30], v13);
    UIRectIntegralWithScale();
    double v15 = v14;
    double v17 = v16;
    objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 0, v11, 0, v12, v13);
    UIRectIntegralWithScale();
    double v19 = v18;
    double v21 = v15 - v20;
    uint64_t v22 = [NSNumber numberWithDouble:v15 - v20];

    uint64_t v23 = [NSNumber numberWithDouble:v19 - v17 - v21];

    [(id)_cachedGlyphInsetsForString_withFont__leadingInsetForNumber setObject:v22 forKeyedSubscript:v5];
    [(id)_cachedGlyphInsetsForString_withFont__trailingInsetForNumber setObject:v23 forKeyedSubscript:v5];

    double v9 = (void *)v23;
    double v7 = (void *)v22;
  }
  [v7 floatValue];
  float v25 = v24;
  [v9 floatValue];
  float v27 = v26;

  double v28 = v25;
  double v29 = v27;
  double v30 = 0.0;
  double v31 = 0.0;
  result.double right = v29;
  result.double bottom = v31;
  result.double left = v28;
  result.double top = v30;
  return result;
}

uint64_t __64__SBFDashBoardViewMetrics__cachedGlyphInsetsForString_withFont___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:10];
  v1 = (void *)_cachedGlyphInsetsForString_withFont__leadingInsetForNumber;
  _cachedGlyphInsetsForString_withFont__leadingInsetForNumber = v0;

  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:10];
  uint64_t v3 = _cachedGlyphInsetsForString_withFont__trailingInsetForNumber;
  _cachedGlyphInsetsForString_withFont__trailingInsetForNumber = v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

+ (double)timeToListInsetXforPage:(unint64_t)a3
{
  int v4 = objc_msgSend(a1, "_presentsListBelowDateTime", a3);
  double result = 0.0;
  if (v4)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F42948], "currentDevice", 0.0);
    uint64_t v7 = [v6 userInterfaceIdiom];

    double result = 16.0;
    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      int v8 = __sb__runningInSpringBoard();
      char v9 = v8;
      if (v8)
      {
        if (SBFEffectiveDeviceClass())
        {
          int v10 = SBFEffectiveDeviceClass();
          double result = 18.0;
          if (v10 != 1) {
            return result;
          }
        }
      }
      else
      {
        uint64_t v7 = [MEMORY[0x1E4F42948] currentDevice];
        if ([(id)v7 userInterfaceIdiom])
        {

          return 18.0;
        }
      }
      int v11 = __sb__runningInSpringBoard();
      char v12 = v11;
      if (v11)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        uint64_t v3 = [MEMORY[0x1E4F42D90] mainScreen];
        [v3 _referenceBounds];
      }
      BSSizeRoundForScale();
      BOOL v14 = v13 >= *(double *)(MEMORY[0x1E4FA6E50] + 40);
      if ((v12 & 1) == 0) {

      }
      if ((v9 & 1) == 0) {
      double result = 18.0;
      }
      if (v14) {
        return 24.0;
      }
    }
  }
  return result;
}

+ (double)timeSubtitleBaselineY
{
  [a1 timeLabelBaselineY];
  double v4 = v3;
  [a1 timeToSubtitleLabelBaselineDifferenceY];
  return v4 + v5;
}

+ (id)dateOnlyLunarDateFont
{
  if (dateOnlyLunarDateFont_onceToken != -1) {
    dispatch_once(&dateOnlyLunarDateFont_onceToken, &__block_literal_global_28_1);
  }
  if (dateOnlyLunarDateFont_dateOnlyLunarFont) {
    goto LABEL_29;
  }
  double v4 = (void *)MEMORY[0x1E4F42A30];
  double v5 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v7 = 23.0;
  }
  else {
    double v7 = 15.0;
  }
  uint64_t v8 = __sb__runningInSpringBoard();
  if (v8)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
LABEL_24:
      char v12 = (void *)MEMORY[0x1E4F43768];
      goto LABEL_25;
    }
  }
  else
  {
    double v5 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v5 userInterfaceIdiom])
    {
      int v9 = 0;
      int v10 = 0;
      int v11 = 1;
      goto LABEL_24;
    }
  }
  int v11 = v8 ^ 1;
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v9 = 0;
      int v10 = 0;
      char v12 = (void *)MEMORY[0x1E4F43770];
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v8 userInterfaceIdiom])
    {
      int v10 = 0;
      char v12 = (void *)MEMORY[0x1E4F43770];
      int v9 = 1;
      goto LABEL_25;
    }
  }
  int v9 = v2 ^ 1;
  int v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v2 _referenceBounds];
  }
  int v10 = v13 ^ 1;
  BSSizeRoundForScale();
  if (v14 >= *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    goto LABEL_24;
  }
  char v12 = (void *)MEMORY[0x1E4F43770];
LABEL_25:
  [a1 scaledFontSize:*v12 withMaximumFontSizeCategory:v7];
  uint64_t v15 = objc_msgSend(v4, "systemFontOfSize:");
  double v16 = (void *)dateOnlyLunarDateFont_dateOnlyLunarFont;
  dateOnlyLunarDateFont_dateOnlyLunarFont = v15;

  if (v10)
  {

    if (!v9) {
      goto LABEL_27;
    }
  }
  else if (!v9)
  {
LABEL_27:
    if (!v11) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }

  if (v11) {
LABEL_28:
  }

LABEL_29:
  double v17 = (void *)dateOnlyLunarDateFont_dateOnlyLunarFont;
  return v17;
}

void __48__SBFDashBoardViewMetrics_dateOnlyLunarDateFont__block_invoke()
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v0 = *MEMORY[0x1E4F43788];
  v1 = [MEMORY[0x1E4F28F08] mainQueue];
  id v2 = (id)[v3 addObserverForName:v0 object:0 queue:v1 usingBlock:&__block_literal_global_30];
}

void __48__SBFDashBoardViewMetrics_dateOnlyLunarDateFont__block_invoke_2()
{
  uint64_t v0 = (void *)dateOnlyLunarDateFont_dateOnlyLunarFont;
  dateOnlyLunarDateFont_dateOnlyLunarFont = 0;
}

+ (id)dateFont
{
  if (dateFont_onceToken != -1) {
    dispatch_once(&dateFont_onceToken, &__block_literal_global_33);
  }
  id v3 = (void *)dateFont_dateFont;
  if (!dateFont_dateFont)
  {
    double v4 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      [a1 _padSpecificValueJ99:66.0 otherPad:56.0];
    }
    else {
      [a1 _phoneSpecificValueN56:42.0 n61:36.0 n69:36.0];
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F42A30];
    objc_msgSend(a1, "scaledFontSize:withMaximumFontSizeCategory:", *MEMORY[0x1E4F43780]);
    uint64_t v7 = objc_msgSend(v6, "_lightSystemFontOfSize:");
    uint64_t v8 = (void *)dateFont_dateFont;
    dateFont_dateFont = v7;

    id v3 = (void *)dateFont_dateFont;
  }
  return v3;
}

void __35__SBFDashBoardViewMetrics_dateFont__block_invoke()
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v0 = *MEMORY[0x1E4F43788];
  v1 = [MEMORY[0x1E4F28F08] mainQueue];
  id v2 = (id)[v3 addObserverForName:v0 object:0 queue:v1 usingBlock:&__block_literal_global_35];
}

void __35__SBFDashBoardViewMetrics_dateFont__block_invoke_2()
{
  uint64_t v0 = (void *)dateFont_dateFont;
  dateFont_dateFont = 0;
}

+ (double)singleLineDateViewBaselineDifferenceY
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__SBFDashBoardViewMetrics_singleLineDateViewBaselineDifferenceY__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (singleLineDateViewBaselineDifferenceY_onceToken != -1) {
    dispatch_once(&singleLineDateViewBaselineDifferenceY_onceToken, block);
  }
  return *(double *)&singleLineDateViewBaselineDifferenceY_singleLineDateViewBaselineDifferenceY;
}

void __64__SBFDashBoardViewMetrics_singleLineDateViewBaselineDifferenceY__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [*(id *)(a1 + 32) _padSpecificValueJ99:-3.0 otherPad:-1.0];
    singleLineDateViewBaselineDifferenceY_singleLineDateViewBaselineDifferenceY = v4;
  }
}

+ (double)dateBaselineToListY
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SBFDashBoardViewMetrics_dateBaselineToListY__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (dateBaselineToListY_onceToken != -1) {
    dispatch_once(&dateBaselineToListY_onceToken, block);
  }
  return *(double *)&dateBaselineToListY_dateBaselineToListY;
}

void __46__SBFDashBoardViewMetrics_dateBaselineToListY__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  double v4 = 29.0;
  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    [*(id *)(a1 + 32) _padSpecificValueJ99:52.0 otherPad:34.0];
  }
  dateBaselineToListY_dateBaselineToListY = *(void *)&v4;
}

+ (double)listMinYForPage:(unint64_t)a3
{
  if (objc_msgSend(a1, "_presentsListBelowDateTime", a3))
  {
    [a1 timeLabelBaselineY];
    double v5 = v4;
    [a1 timeToSubtitleLabelBaselineDifferenceY];
    double v7 = v5 + v6;
    [a1 dateBaselineToListY];
    double v9 = v7 + v8;
    if (listMinYForPage__onceToken != -1) {
      dispatch_once(&listMinYForPage__onceToken, &__block_literal_global_37_0);
    }
    return v9 + *(double *)&listMinYForPage__alternateCalendarHeight;
  }
  else
  {
    [a1 _phoneSpecificValueN56:78.0 n61:58.0 n69:32.0];
  }
  return result;
}

void __43__SBFDashBoardViewMetrics_listMinYForPage___block_invoke()
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v0 = *MEMORY[0x1E4F256A8];
  v1 = [MEMORY[0x1E4F28F08] mainQueue];
  id v2 = (id)[v3 addObserverForName:v0 object:0 queue:v1 usingBlock:&__block_literal_global_39];
}

uint64_t __43__SBFDashBoardViewMetrics_listMinYForPage___block_invoke_2()
{
  uint64_t result = +[SBFLockScreenAlternateDateLabel showAlternateDate];
  uint64_t v1 = 0;
  if (result) {
    uint64_t result = +[SBFLockScreenDateSubtitleDateView subtitleLabelToLunarDateLabelBaselineDifferenceY];
  }
  listMinYForPage__alternateCalendarHeight = v1;
  return result;
}

+ (BOOL)_presentsListBelowDateTime
{
  id v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 1;
  }
  return [a1 _isPortrait];
}

+ (double)searchClippingLineMaxY
{
  if (searchClippingLineMaxY_onceToken != -1) {
    dispatch_once(&searchClippingLineMaxY_onceToken, &__block_literal_global_43);
  }
  return *(double *)&searchClippingLineMaxY_searchClippingLineMaxY;
}

void __49__SBFDashBoardViewMetrics_searchClippingLineMaxY__block_invoke()
{
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      double v0 = 68.0;
    }
    else if (SBFEffectiveHomeButtonType() == 2)
    {
      double v0 = 92.0;
    }
    else
    {
      double v0 = 68.0;
    }
  }
  else
  {
    uint64_t v1 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v1 userInterfaceIdiom])
    {
      double v0 = 68.0;
    }
    else if (SBFEffectiveHomeButtonType() == 2)
    {
      double v0 = 92.0;
    }
    else
    {
      double v0 = 68.0;
    }
  }
  id v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  double v4 = 72.0;
  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    double v4 = v0;
  }
  searchClippingLineMaxY_searchClippingLineMaxY = *(void *)&v4;
}

+ (double)_phoneSpecificValueN56:(double)a3 n61:(double)a4 n69:(double)a5
{
  int v10 = __sb__runningInSpringBoard();
  char v11 = v10;
  if (v10)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_15;
    }
  }
  else
  {
    double v5 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v5 userInterfaceIdiom])
    {

      goto LABEL_15;
    }
  }
  int v12 = __sb__runningInSpringBoard();
  char v13 = v12;
  if (v12)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    double v6 = [MEMORY[0x1E4F42D90] mainScreen];
    [v6 _referenceBounds];
  }
  BSSizeRoundForScale();
  double v15 = v14;
  double v16 = *(double *)(MEMORY[0x1E4FA6E50] + 48);
  if ((v13 & 1) == 0) {

  }
  if ((v11 & 1) == 0) {
  if (v15 < v16)
  }
  {
LABEL_15:
    int v17 = __sb__runningInSpringBoard();
    char v18 = v17;
    if (v17)
    {
      if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
      {
LABEL_22:
        int v19 = __sb__runningInSpringBoard();
        char v20 = v19;
        if (v19)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          double v6 = [MEMORY[0x1E4F42D90] mainScreen];
          [v6 _referenceBounds];
        }
        BSSizeRoundForScale();
        BOOL v22 = v21 >= *(double *)(MEMORY[0x1E4FA6E50] + 40);
        if ((v20 & 1) == 0) {

        }
        if ((v18 & 1) == 0) {
        a3 = a5;
        }
        if (v22) {
          return a4;
        }
        return a3;
      }
    }
    else
    {
      double v5 = [MEMORY[0x1E4F42948] currentDevice];
      if (![v5 userInterfaceIdiom]) {
        goto LABEL_22;
      }
    }
    return a5;
  }
  return a3;
}

+ (double)_phoneSpecificValueN56:(double)a3 n61:(double)a4 n69:(double)a5 d22:(double)a6
{
  if (__sb__runningInSpringBoard())
  {
    if ((!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
      && SBFEffectiveHomeButtonType() == 2)
    {
      return a6;
    }
  }
  else
  {
    int v12 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v12 userInterfaceIdiom])
    {
    }
    else
    {
      double v6 = (void *)SBFEffectiveHomeButtonType();

      if (v6 == (void *)2) {
        return a6;
      }
    }
  }
  int v13 = __sb__runningInSpringBoard();
  char v14 = v13;
  if (v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_24;
    }
  }
  else
  {
    double v6 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v6 userInterfaceIdiom])
    {

      goto LABEL_24;
    }
  }
  int v15 = __sb__runningInSpringBoard();
  char v16 = v15;
  if (v15)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    double v7 = [MEMORY[0x1E4F42D90] mainScreen];
    [v7 _referenceBounds];
  }
  BSSizeRoundForScale();
  double v18 = v17;
  double v19 = *(double *)(MEMORY[0x1E4FA6E50] + 48);
  if ((v16 & 1) == 0) {

  }
  if ((v14 & 1) == 0) {
  BOOL v20 = v18 < v19;
  }
  a6 = a3;
  if (v20)
  {
LABEL_24:
    int v21 = __sb__runningInSpringBoard();
    char v22 = v21;
    if (v21)
    {
      if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
      {
LABEL_31:
        int v23 = __sb__runningInSpringBoard();
        char v24 = v23;
        if (v23)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          double v7 = [MEMORY[0x1E4F42D90] mainScreen];
          [v7 _referenceBounds];
        }
        BSSizeRoundForScale();
        BOOL v26 = v25 >= *(double *)(MEMORY[0x1E4FA6E50] + 40);
        if ((v24 & 1) == 0) {

        }
        if ((v22 & 1) == 0) {
        a6 = a5;
        }
        if (v26) {
          return a4;
        }
        return a6;
      }
    }
    else
    {
      double v6 = [MEMORY[0x1E4F42948] currentDevice];
      if (![v6 userInterfaceIdiom]) {
        goto LABEL_31;
      }
    }
    return a5;
  }
  return a6;
}

+ (double)_padSpecificValueJ99:(double)a3 otherPad:(double)a4
{
  int v8 = __sb__runningInSpringBoard();
  char v9 = v8;
  if (v8)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      return a4;
    }
  }
  else
  {
    double v4 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v4 userInterfaceIdiom] != 1)
    {
LABEL_13:

      return a4;
    }
  }
  int v10 = __sb__runningInSpringBoard();
  char v11 = v10;
  if (v10)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    double v5 = [MEMORY[0x1E4F42D90] mainScreen];
    [v5 _referenceBounds];
  }
  BSSizeRoundForScale();
  if (v12 >= *(double *)(MEMORY[0x1E4FA6E50] + 264)) {
    a4 = a3;
  }
  if ((v11 & 1) == 0) {

  }
  if ((v9 & 1) == 0) {
    goto LABEL_13;
  }
  return a4;
}

+ (double)_padSpecificInsets:(SBFDashBoardPadPageInsets *)a3 leading:(BOOL)a4
{
  BOOL v6 = a4;
  int v9 = __sb__runningInSpringBoard();
  char v10 = v9;
  if (v9)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_15;
    }
  }
  else
  {
    double v4 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v4 userInterfaceIdiom] != 1)
    {

      goto LABEL_15;
    }
  }
  int v11 = __sb__runningInSpringBoard();
  char v12 = v11;
  if (v11)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    double v5 = [MEMORY[0x1E4F42D90] mainScreen];
    [v5 _referenceBounds];
  }
  BSSizeRoundForScale();
  double v14 = v13;
  double v15 = *(double *)(MEMORY[0x1E4FA6E50] + 264);
  if ((v12 & 1) == 0) {

  }
  if ((v10 & 1) == 0) {
  if (v14 >= v15)
  }
  {
    p_var1 = &a3->var2.var1;
    p_var2 = &a3->var2.var2;
    p_var3 = &a3->var2.var3;
    a3 = (SBFDashBoardPadPageInsets *)((char *)a3 + 64);
    goto LABEL_30;
  }
LABEL_15:
  int v19 = __sb__runningInSpringBoard();
  char v20 = v19;
  if (v19)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_29;
    }
  }
  else
  {
    double v4 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v4 userInterfaceIdiom] != 1)
    {

      goto LABEL_29;
    }
  }
  int v21 = __sb__runningInSpringBoard();
  char v22 = v21;
  if (v21)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    double v5 = [MEMORY[0x1E4F42D90] mainScreen];
    [v5 _referenceBounds];
  }
  BSSizeRoundForScale();
  double v24 = v23;
  double v25 = *(double *)(MEMORY[0x1E4FA6E50] + 248);
  if ((v22 & 1) == 0) {

  }
  if ((v20 & 1) == 0) {
  if (v24 >= v25)
  }
  {
    p_var1 = &a3->var1.var1;
    p_var2 = &a3->var1.var2;
    p_var3 = &a3->var1.var3;
    a3 = (SBFDashBoardPadPageInsets *)((char *)a3 + 32);
    goto LABEL_30;
  }
LABEL_29:
  p_var1 = &a3->var0.var1;
  p_var2 = &a3->var0.var2;
  p_var3 = &a3->var0.var3;
LABEL_30:
  double var0 = a3->var0.var0;
  double v27 = *p_var1;
  double v28 = *p_var2;
  double v29 = *p_var3;
  objc_msgSend(a1, "_padSpecificValueForDevice:leading:", v6, var0, v27, v28, v29);
  return result;
}

+ (double)_padSpecificValueForDevice:(SBFDashBoardOrientationLeadingInsets)a3 leading:(BOOL)a4
{
  BOOL v4 = a4;
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  int v8 = objc_msgSend(a1, "_isPortrait", a3.var0, a3.var1, a3.var2, a3.var3);
  if (v4) {
    double result = var0;
  }
  else {
    double result = var2;
  }
  if (!v8) {
    return var1;
  }
  return result;
}

+ (double)listInsetXForPage:(unint64_t)a3
{
  unint64_t v4 = [a1 listLayoutForPage:a3] - 3;
  double v5 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  unint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFBLL;
  if (v4 > 1)
  {
    double result = 8.0;
    if (v7 == 1) {
      return 0.0;
    }
  }
  else
  {
    int v8 = [a1 _isPortrait];
    if (v7 == 1)
    {
      double result = 69.0;
      if (v8) {
        return 56.0;
      }
    }
    else
    {
      double result = 8.0;
      if ((v8 & 1) == 0)
      {
        [a1 _phoneSpecificValueN56:79.0 n61:69.0 n69:54.0];
      }
    }
  }
  return result;
}

+ (double)listInsetXForPage:(unint64_t)a3 leading:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = [a1 listLayoutForPage:a3] - 3;
  unint64_t v7 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  unint64_t v9 = v8 & 0xFFFFFFFFFFFFFFFBLL;
  if (v6 > 1)
  {
    double result = 8.0;
    if (v9 == 1) {
      return 0.0;
    }
  }
  else if (v9 == 1)
  {
    v12[0] = xmmword_18B5E45B0;
    v12[1] = xmmword_18B5E45C0;
    v12[2] = vdupq_n_s64(0x4051400000000000uLL);
    v12[3] = vdupq_n_s64(0x4050000000000000uLL);
    v12[4] = xmmword_18B5E45D0;
    v12[5] = vdupq_n_s64(0x4054000000000000uLL);
    [a1 _padSpecificInsets:v12 leading:v4];
  }
  else
  {
    char v11 = [a1 _isPortrait];
    double result = 8.0;
    if ((v11 & 1) == 0)
    {
      [a1 _phoneSpecificValueN56:79.0 n61:69.0 n69:54.0];
    }
  }
  return result;
}

+ (double)listWidthForPage:(unint64_t)a3
{
  double v5 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    double result = 0.0;
    if (a3 <= 1)
    {
      int v8 = _os_feature_enabled_impl();
      double result = 556.0;
      if (v8) {
        return 425.0;
      }
    }
  }
  else if ([a1 _isPortrait] {
         || [a1 _presentsListBelowDateTime])
  }
  {
    [a1 searchBarWidth];
  }
  else
  {
    return 320.0;
  }
  return result;
}

+ (CGRect)suggestedFrameForStatusView:(id)a3 inView:(id)a4 withInsets:(UIEdgeInsets)a5
{
  if (a3 && a4)
  {
    double right = a5.right;
    double left = a5.left;
    id v8 = a3;
    [a4 bounds];
    if (left >= right) {
      double v10 = left;
    }
    else {
      double v10 = right;
    }
    objc_msgSend(v8, "sizeThatFits:", v9 + fmax(v10, 25.0) * -2.0);

    UIRectInset();
    SBFMainScreenScale();
    BSRectRoundForScale();
  }
  else
  {
    double v11 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

+ (BOOL)_isPortrait
{
  return (unint64_t)([(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation] - 1) < 2;
}

+ (CGRect)_reducedPageBoundsFromBounds:(CGRect)a3 forPage:(unint64_t)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  double v10 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v11 = [v10 userInterfaceIdiom];

  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    goto LABEL_10;
  }
  v23.origin.double x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double v12 = CGRectGetWidth(v23);
  [a1 listInsetXForPage:a4];
  double v14 = v12 + v13 * -2.0;
  [a1 listWidthForPage:a4];
  if (v15 >= v14) {
    double v16 = v14;
  }
  else {
    double v16 = v15;
  }
  uint64_t v17 = [a1 listLayoutForPage:a4];
  if (![a1 layoutUsesMargin:v17]) {
    double v14 = v16;
  }
  v24.origin.double x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double v18 = CGRectGetWidth(v24) - v14;
  if (v18 > 0.0)
  {
    if ([a1 layoutCentersContent:v17]) {
      double x = x + v18 * 0.5;
    }
  }
  else
  {
LABEL_10:
    double v14 = width;
  }
  double v19 = x;
  double v20 = y;
  double v21 = v14;
  double v22 = height;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.double x = v19;
  return result;
}

+ (double)scaledFontSize:(double)a3 withMaximumFontSizeCategory:(id)a4
{
  double v5 = (NSString *)a4;
  uint64_t v6 = [(id)*MEMORY[0x1E4F43630] preferredContentSizeCategory];
  NSComparisonResult v7 = UIContentSizeCategoryCompareToCategory(v6, v5);

  id v8 = (void *)MEMORY[0x1E4F42A30];
  uint64_t v9 = *MEMORY[0x1E4F43870];
  if (v7 == NSOrderedAscending)
  {
    uint64_t v11 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  }
  else
  {
    double v10 = [MEMORY[0x1E4F42F80] traitCollectionWithPreferredContentSizeCategory:v5];
    uint64_t v11 = [v8 preferredFontForTextStyle:v9 compatibleWithTraitCollection:v10];
  }
  [v11 _scaledValueForValue:a3];
  double v12 = [MEMORY[0x1E4F42D90] mainScreen];
  UIRoundToScreenScale();
  double v14 = v13;

  return v14;
}

@end