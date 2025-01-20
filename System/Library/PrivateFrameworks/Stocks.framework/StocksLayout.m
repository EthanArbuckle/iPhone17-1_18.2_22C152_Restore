@interface StocksLayout
+ (id)fullScreenChartLayoutForSize:(CGSize)a3;
+ (id)layoutForSize:(CGSize)a3;
+ (id)singleColumnPortraitLayoutForSize:(CGSize)a3;
+ (id)threeColumnsLandscapeLayoutForSize:(CGSize)a3;
+ (id)twoColumnsLandscapeLayoutForSize:(CGSize)a3;
+ (id)twoColumnsPortraitLayoutForSize:(CGSize)a3;
+ (unint64_t)numberOfRowsForSize:(CGSize)a3;
- (BOOL)chartViewHasBottomLine;
- (BOOL)chartViewHasTapGesture;
- (BOOL)chartViewInScrollView;
- (BOOL)hasBlackView;
- (BOOL)hasBlurView;
- (BOOL)hasGrayView;
- (BOOL)hasPrimaryHorizontalDivider;
- (BOOL)hasPrimaryVerticalDivider;
- (BOOL)hasScrollView;
- (BOOL)hasSecondaryGrayView;
- (BOOL)hasSecondaryHorizontalDivider;
- (BOOL)hasSecondaryVerticalDivider;
- (BOOL)hasStatusView;
- (BOOL)hasStatusViewDivider;
- (BOOL)infoViewHasBottomLine;
- (BOOL)infoViewInScrollView;
- (BOOL)isFullScreenChart;
- (BOOL)newsViewHasBottomLine;
- (BOOL)newsViewInScrollView;
- (BOOL)newsViewShouldUseLargerFonts;
- (CGRect)blurViewFrame;
- (CGRect)chartViewFrame;
- (CGRect)grayViewFrame;
- (CGRect)infoViewFrame;
- (CGRect)listViewFrame;
- (CGRect)newsViewFrame;
- (CGRect)primaryHorizontalDividerFrame;
- (CGRect)primaryVerticalDividerFrame;
- (CGRect)scrollViewFrame;
- (CGRect)secondaryGrayViewFrame;
- (CGRect)secondaryHorizontalDividerFrame;
- (CGRect)secondaryVerticalDividerFrame;
- (CGRect)statusViewDividerFrame;
- (CGRect)statusViewFrame;
- (CGSize)scrollViewContentSize;
- (StockChartDisplayMode)chartDisplayMode;
- (UIEdgeInsets)listViewContentInsets;
- (double)statusViewCenteringRatio;
- (id)description;
- (unint64_t)listViewRowCount;
- (void)setBlurViewFrame:(CGRect)a3;
- (void)setChartDisplayMode:(id)a3;
- (void)setChartViewFrame:(CGRect)a3;
- (void)setChartViewHasBottomLine:(BOOL)a3;
- (void)setChartViewHasTapGesture:(BOOL)a3;
- (void)setChartViewInScrollView:(BOOL)a3;
- (void)setGrayViewFrame:(CGRect)a3;
- (void)setHasBlackView:(BOOL)a3;
- (void)setHasBlurView:(BOOL)a3;
- (void)setHasGrayView:(BOOL)a3;
- (void)setHasPrimaryHorizontalDivider:(BOOL)a3;
- (void)setHasPrimaryVerticalDivider:(BOOL)a3;
- (void)setHasScrollView:(BOOL)a3;
- (void)setHasSecondaryGrayView:(BOOL)a3;
- (void)setHasSecondaryHorizontalDivider:(BOOL)a3;
- (void)setHasSecondaryVerticalDivider:(BOOL)a3;
- (void)setHasStatusView:(BOOL)a3;
- (void)setHasStatusViewDivider:(BOOL)a3;
- (void)setInfoViewFrame:(CGRect)a3;
- (void)setInfoViewHasBottomLine:(BOOL)a3;
- (void)setInfoViewInScrollView:(BOOL)a3;
- (void)setIsFullScreenChart:(BOOL)a3;
- (void)setListViewContentInsets:(UIEdgeInsets)a3;
- (void)setListViewFrame:(CGRect)a3;
- (void)setListViewRowCount:(unint64_t)a3;
- (void)setNewsViewFrame:(CGRect)a3;
- (void)setNewsViewHasBottomLine:(BOOL)a3;
- (void)setNewsViewInScrollView:(BOOL)a3;
- (void)setNewsViewShouldUseLargerFonts:(BOOL)a3;
- (void)setPrimaryHorizontalDividerFrame:(CGRect)a3;
- (void)setPrimaryVerticalDividerFrame:(CGRect)a3;
- (void)setScrollViewContentSize:(CGSize)a3;
- (void)setScrollViewFrame:(CGRect)a3;
- (void)setSecondaryGrayViewFrame:(CGRect)a3;
- (void)setSecondaryHorizontalDividerFrame:(CGRect)a3;
- (void)setSecondaryVerticalDividerFrame:(CGRect)a3;
- (void)setStatusViewCenteringRatio:(double)a3;
- (void)setStatusViewDividerFrame:(CGRect)a3;
- (void)setStatusViewFrame:(CGRect)a3;
@end

@implementation StocksLayout

+ (id)layoutForSize:(CGSize)a3
{
  if (a3.height >= a3.width)
  {
    if (a3.width >= 640.0) {
      +[StocksLayout twoColumnsPortraitLayoutForSize:"twoColumnsPortraitLayoutForSize:"];
    }
    else {
      +[StocksLayout singleColumnPortraitLayoutForSize:"singleColumnPortraitLayoutForSize:"];
    }
  }
  else
  {
    if (a3.height < 376.0)
    {
      v3 = +[StocksLayout fullScreenChartLayoutForSize:"fullScreenChartLayoutForSize:"];
      goto LABEL_11;
    }
    if (a3.width >= 1024.0) {
      +[StocksLayout threeColumnsLandscapeLayoutForSize:"threeColumnsLandscapeLayoutForSize:"];
    }
    else {
      +[StocksLayout twoColumnsLandscapeLayoutForSize:"twoColumnsLandscapeLayoutForSize:"];
    }
  v3 = };
LABEL_11:

  return v3;
}

+ (id)singleColumnPortraitLayoutForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  unint64_t v6 = objc_msgSend(a1, "numberOfRowsForSize:");
  double v7 = (double)v6 * 56.0;
  double v8 = height + -44.0;
  v9 = [MEMORY[0x263F1C920] mainScreen];
  [v9 _referenceBounds];
  if (v10 == 812.0) {
    double v11 = 34.0;
  }
  else {
    double v11 = 0.0;
  }

  id v12 = objc_alloc_init((Class)a1);
  [v12 setListViewFrame:RoundRectToPixel(0.0)];
  double v13 = v8 - v7;
  [v12 setInfoViewFrame:RoundRectToPixel(0.0)];
  [v12 setChartViewFrame:RoundRectToPixel(width)];
  [v12 setNewsViewFrame:RoundRectToPixel(width + width)];
  objc_msgSend(v12, "setListViewContentInsets:", 0.0, 0.0, v8 + 44.0 - v7 + v11, 0.0);
  [v12 setNewsViewHasBottomLine:1];
  [v12 setInfoViewHasBottomLine:1];
  [v12 setChartViewHasBottomLine:1];
  [v12 setNewsViewShouldUseLargerFonts:width > 350.0];
  [v12 setHasScrollView:1];
  [v12 setScrollViewFrame:RoundRectToPixel(0.0)];
  objc_msgSend(v12, "setScrollViewContentSize:", width * 3.0, v8 - v7);
  [v12 setInfoViewInScrollView:1];
  [v12 setChartViewInScrollView:1];
  [v12 setNewsViewInScrollView:1];
  [v12 setHasBlurView:1];
  v14 = [MEMORY[0x263F1C920] mainScreen];
  [v14 scale];
  v15 = [MEMORY[0x263F1C920] mainScreen];
  [v15 scale];
  [v12 setBlurViewFrame:RoundRectToPixel(0.0)];

  [v12 setHasGrayView:1];
  v16 = [MEMORY[0x263F1C920] mainScreen];
  [v16 scale];
  v17 = [MEMORY[0x263F1C920] mainScreen];
  [v17 scale];
  [v12 setGrayViewFrame:RoundRectToPixel(0.0)];

  [v12 setHasSecondaryGrayView:0];
  [v12 setSecondaryGrayViewFrame:RoundRectToPixel(0.0)];
  [v12 setListViewRowCount:v6];
  [v12 setStatusViewCenteringRatio:0.5];
  [v12 setHasStatusView:1];
  objc_msgSend(v12, "setStatusViewFrame:", 0.0, v8, width, 44.0);
  [v12 setHasStatusViewDivider:0];
  v18 = [MEMORY[0x263F1C920] mainScreen];
  [v18 scale];
  [v12 setStatusViewDividerFrame:RoundRectToPixel(0.0)];

  [v12 setHasPrimaryHorizontalDivider:0];
  [v12 setHasSecondaryHorizontalDivider:0];
  [v12 setHasPrimaryVerticalDivider:0];
  [v12 listViewFrame];
  double MaxX = CGRectGetMaxX(v29);
  v20 = [MEMORY[0x263F1C920] mainScreen];
  [v20 scale];
  [v12 listViewFrame];
  [v12 setPrimaryVerticalDividerFrame:RoundRectToPixel(MaxX)];

  [v12 setHasSecondaryVerticalDivider:0];
  v21 = +[StockChartDisplayMode defaultDisplayMode];
  [v21 setMaxInterval:6];
  [v21 setGraphOverlapsYAxisLabels:1];
  v22 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.4];
  [v21 setXAxisKeylineColor:v22];

  v23 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.4];
  [v21 setAxisLabelsColor:v23];

  [v21 setYAxisLabelCount:2];
  objc_msgSend(v21, "setChartSize:", width, v13);
  v24 = [MEMORY[0x263F1C920] mainScreen];
  [v24 _referenceBounds];
  double v26 = v25;

  if (v26 == 736.0) {
    [v21 setHorizontalGridlineCount:4];
  }
  objc_msgSend(v12, "setChartDisplayMode:", v21, 0x4046000000000000);

  return v12;
}

+ (id)twoColumnsPortraitLayoutForSize:(CGSize)a3
{
  double width = a3.width;
  CGFloat v4 = a3.height + -64.0;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setListViewFrame:RoundRectToPixel(0.0)];
  [v5 setInfoViewFrame:RoundRectToPixel(width * 0.4)];
  [v5 setChartViewFrame:RoundRectToPixel(width * 0.4)];
  [v5 setNewsViewFrame:RoundRectToPixel(0.0)];
  objc_msgSend(v5, "setListViewContentInsets:", 0.0, 0.0, v4 * 0.5 + 44.0, 0.0);
  [v5 setNewsViewShouldUseLargerFonts:1];
  [v5 setHasScrollView:0];
  objc_msgSend(v5, "setScrollViewFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  objc_msgSend(v5, "setScrollViewContentSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  [v5 setInfoViewInScrollView:0];
  [v5 setChartViewInScrollView:0];
  [v5 setNewsViewInScrollView:0];
  objc_msgSend(v5, "setBlurViewFrame:", 0.0, v4 * 0.5 + 20.0, width, v4 * 0.5 + 44.0);
  [v5 setHasBlurView:1];
  [v5 setHasGrayView:1];
  [v5 setGrayViewFrame:RoundRectToPixel(width * 0.4)];
  [v5 setHasSecondaryGrayView:1];
  [v5 setSecondaryGrayViewFrame:RoundRectToPixel(0.0)];
  [v5 setStatusViewCenteringRatio:0.5];
  [v5 setHasStatusView:1];
  [v5 setStatusViewFrame:RoundRectToPixel(0.0)];
  [v5 setHasStatusViewDivider:1];
  unint64_t v6 = [MEMORY[0x263F1C920] mainScreen];
  [v6 scale];
  [v5 setStatusViewDividerFrame:RoundRectToPixel(0.0)];

  [v5 setHasPrimaryHorizontalDivider:1];
  double v7 = [MEMORY[0x263F1C920] mainScreen];
  [v7 scale];
  [v5 setPrimaryHorizontalDividerFrame:RoundRectToPixel(0.0)];

  [v5 setHasSecondaryHorizontalDivider:0];
  [v5 setHasPrimaryVerticalDivider:1];
  [v5 listViewFrame];
  double MaxX = CGRectGetMaxX(v14);
  v9 = [MEMORY[0x263F1C920] mainScreen];
  [v9 scale];
  [v5 setPrimaryVerticalDividerFrame:RoundRectToPixel(MaxX)];

  [v5 setHasSecondaryVerticalDivider:0];
  double v10 = [MEMORY[0x263F1C920] mainScreen];
  [v10 scale];
  [v5 setSecondaryVerticalDividerFrame:RoundRectToPixel(width)];

  double v11 = +[StockChartDisplayMode defaultDisplayMode];
  [v11 setVolumeHeight:RoundToPixel(18.0)];
  [v11 setMaxInterval:6];
  [v11 setYAxisLabelCount:2];
  [v11 setHorizontalGridlineCount:4];
  [v11 setGraphOverlapsYAxisLabels:1];
  objc_msgSend(v11, "setChartSize:", width * 0.6, v4 * 0.5 * 0.5);
  [v5 setChartDisplayMode:v11];

  return v5;
}

+ (id)fullScreenChartLayoutForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = objc_alloc_init((Class)a1);
  double v6 = *MEMORY[0x263F001A8];
  double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v9 = *(double *)(MEMORY[0x263F001A8] + 24);
  objc_msgSend(v5, "setListViewFrame:", *MEMORY[0x263F001A8], v7, v8, v9);
  [v5 setInfoViewFrame:RoundRectToPixel(width * 0.4)];
  [v5 setChartViewFrame:RoundRectToPixel(width)];
  objc_msgSend(v5, "setNewsViewFrame:", width, height, width * 0.6, height);
  [v5 setHasScrollView:1];
  [v5 setScrollViewFrame:RoundRectToPixel(0.0)];
  objc_msgSend(v5, "setScrollViewContentSize:", width * 3.0, height);
  [v5 setInfoViewInScrollView:0];
  [v5 setChartViewInScrollView:1];
  [v5 setNewsViewInScrollView:0];
  objc_msgSend(v5, "setBlurViewFrame:", v6, v7, v8, v9);
  [v5 setHasBlurView:0];
  [v5 setStatusViewCenteringRatio:0.7];
  [v5 setHasStatusView:1];
  [v5 setStatusViewFrame:RoundRectToPixel(0.0)];
  [v5 setChartViewHasTapGesture:height >= 376.0];
  [v5 setHasStatusViewDivider:0];
  [v5 setHasPrimaryHorizontalDivider:0];
  [v5 setHasSecondaryHorizontalDivider:0];
  [v5 setHasPrimaryVerticalDivider:0];
  [v5 setHasSecondaryVerticalDivider:0];
  double v10 = +[StockChartDisplayMode defaultDisplayMode];
  [v10 setMaxInterval:8];
  [v10 setShowsPriceLabelForPreviousClose:1];
  double v11 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.8];
  [v10 setXAxisKeylineColor:v11];

  [v10 setYAxisLabelCount:5];
  objc_msgSend(v10, "setHorizontalGridlineCount:", objc_msgSend(v10, "yAxisLabelCount"));
  [v10 setUsesDetailedAxisLabels:1];
  [v10 setShowsTitle:1.0];
  [v10 setHUDEnabled:1];
  objc_msgSend(v10, "setChartSize:", width, height);
  [v5 setChartDisplayMode:v10];
  [v5 setHasBlackView:1];
  [v5 setIsFullScreenChart:1];

  return v5;
}

+ (id)twoColumnsLandscapeLayoutForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v7 = [v6 userInterfaceLayoutDirection];

  if (v7)
  {
    double v8 = [MEMORY[0x263F1C920] mainScreen];
    [v8 scale];
    double v10 = width - (-1.0 / v9 + width * 0.4);

    double v11 = width * 0.6;
    double v22 = 0.0;
    double v23 = 0.3;
    double v24 = width * 0.6;
    double v12 = width * 0.6;
  }
  else
  {
    double v12 = width * 0.6;
    double v13 = [MEMORY[0x263F1C920] mainScreen];
    [v13 scale];
    double v24 = -1.0 / v14 + width * 0.4;

    double v10 = 0.0;
    double v22 = width * 0.6;
    double v23 = 0.7;
    double v11 = 0.0;
  }
  if (v7) {
    double v15 = 0.0;
  }
  else {
    double v15 = width * 0.4;
  }
  id v16 = objc_alloc_init((Class)a1);
  v17 = [MEMORY[0x263F1C920] mainScreen];
  [v17 scale];
  [v16 setListViewFrame:RoundRectToPixel(v10)];

  [v16 setInfoViewFrame:RoundRectToPixel(v11)];
  [v16 setChartViewFrame:RoundRectToPixel(v11)];
  [v16 setNewsViewFrame:RoundRectToPixel(v22)];
  [v16 setHasScrollView:1];
  [v16 setScrollViewFrame:RoundRectToPixel(v15)];
  objc_msgSend(v16, "setScrollViewContentSize:", (width + width) * 0.6, height + -44.0);
  [v16 setInfoViewInScrollView:1];
  [v16 setChartViewInScrollView:1];
  [v16 setNewsViewInScrollView:1];
  [v16 setHasBlurView:0];
  [v16 setBlurViewFrame:RoundRectToPixel(v15)];
  [v16 setHasGrayView:1];
  [v16 setGrayViewFrame:RoundRectToPixel(v15)];
  [v16 setHasSecondaryGrayView:0];
  [v16 setSecondaryGrayViewFrame:RoundRectToPixel(0.0)];
  [v16 setStatusViewCenteringRatio:v23];
  [v16 setHasStatusView:1];
  [v16 setStatusViewFrame:RoundRectToPixel(0.0)];
  [v16 setChartViewHasTapGesture:1];
  [v16 setHasStatusViewDivider:1];
  v18 = [MEMORY[0x263F1C920] mainScreen];
  [v18 scale];
  [v16 setStatusViewDividerFrame:RoundRectToPixel(0.0)];

  [v16 setHasPrimaryHorizontalDivider:0];
  [v16 setHasSecondaryHorizontalDivider:0];
  [v16 setHasPrimaryVerticalDivider:1];
  v19 = [MEMORY[0x263F1C920] mainScreen];
  [v19 scale];
  [v16 setPrimaryVerticalDividerFrame:RoundRectToPixel(v24)];

  [v16 setHasSecondaryVerticalDivider:1];
  v20 = +[StockChartDisplayMode defaultDisplayMode];
  [v20 setVolumeHeight:RoundToPixel(12.0)];
  [v20 setMaxInterval:6];
  [v20 setYAxisLabelCount:2];
  [v20 setHorizontalGridlineCount:3];
  [v20 setGraphOverlapsYAxisLabels:1];
  objc_msgSend(v20, "setChartSize:", v12, (height + -44.0) * 0.5);
  [v16 setChartDisplayMode:v20];

  return v16;
}

+ (id)threeColumnsLandscapeLayoutForSize:(CGSize)a3
{
  double width = a3.width;
  CGFloat v4 = a3.height + -64.0;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setListViewFrame:RoundRectToPixel(0.0)];
  [v5 setInfoViewFrame:RoundRectToPixel(width * 0.3)];
  [v5 setChartViewFrame:RoundRectToPixel(width * 0.65)];
  [v5 setNewsViewFrame:RoundRectToPixel(width * 0.3)];
  [v5 setNewsViewShouldUseLargerFonts:1];
  [v5 setHasScrollView:0];
  objc_msgSend(v5, "setScrollViewFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  objc_msgSend(v5, "setScrollViewContentSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  [v5 setInfoViewInScrollView:0];
  [v5 setChartViewInScrollView:0];
  [v5 setNewsViewInScrollView:0];
  [v5 setHasBlurView:0];
  [v5 setBlurViewFrame:RoundRectToPixel(width * 0.3)];
  [v5 setHasGrayView:1];
  [v5 setGrayViewFrame:RoundRectToPixel(width * 0.3)];
  [v5 setHasSecondaryGrayView:1];
  [v5 setSecondaryGrayViewFrame:RoundRectToPixel(width * 0.3)];
  [v5 setStatusViewCenteringRatio:0.65];
  [v5 setHasStatusView:1];
  [v5 setStatusViewFrame:RoundRectToPixel(0.0)];
  [v5 setHasStatusViewDivider:1];
  double v6 = [MEMORY[0x263F1C920] mainScreen];
  [v6 scale];
  [v5 setStatusViewDividerFrame:RoundRectToPixel(0.0)];

  [v5 setHasPrimaryHorizontalDivider:1];
  uint64_t v7 = [MEMORY[0x263F1C920] mainScreen];
  [v7 scale];
  [v5 setPrimaryHorizontalDividerFrame:RoundRectToPixel(width * 0.3)];

  [v5 setHasSecondaryHorizontalDivider:0];
  [v5 setHasPrimaryVerticalDivider:1];
  double v8 = [MEMORY[0x263F1C920] mainScreen];
  [v8 scale];
  [v5 setPrimaryVerticalDividerFrame:RoundRectToPixel(width * 0.3)];

  [v5 setHasSecondaryVerticalDivider:1];
  double v9 = [MEMORY[0x263F1C920] mainScreen];
  [v9 scale];
  [v5 setSecondaryVerticalDividerFrame:RoundRectToPixel(width * 0.65)];

  double v10 = +[StockChartDisplayMode defaultDisplayMode];
  [v10 setVolumeHeight:RoundToPixel(18.0)];
  [v10 setMaxInterval:6];
  [v10 setYAxisLabelCount:2];
  [v10 setHorizontalGridlineCount:4];
  [v10 setGraphOverlapsYAxisLabels:1];
  objc_msgSend(v10, "setChartSize:", width * 0.7 * 0.5, v4 * 0.5);
  [v5 setChartDisplayMode:v10];

  return v5;
}

+ (unint64_t)numberOfRowsForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [MEMORY[0x263F1C920] mainScreen];
  [v5 bounds];
  double v6 = CGRectGetHeight(v17);

  double v7 = 20.0;
  if (v6 - height > 1.0) {
    double v7 = 0.0;
  }
  double v8 = height - v7;
  uint64_t v9 = -1;
  do
  {
    double v10 = width / (v8 + (double)(unint64_t)(v9 + 2) * -56.0);
    ++v9;
  }
  while (v10 < 1.25);
  if (v10 > 1.51) {
    unint64_t v11 = v9;
  }
  else {
    unint64_t v11 = v9 + 1;
  }
  double v12 = [MEMORY[0x263F1C920] mainScreen];
  [v12 _referenceBounds];
  double v14 = v13;

  if (v11 > 7 && v14 == 812.0) {
    return 7;
  }
  else {
    return v11;
  }
}

- (id)description
{
  double v15 = NSString;
  [(StocksLayout *)self listViewFrame];
  v3 = NSStringFromCGRect(v18);
  [(StocksLayout *)self infoViewFrame];
  CGFloat v4 = NSStringFromCGRect(v19);
  id v5 = @"YES";
  if ([(StocksLayout *)self infoViewInScrollView]) {
    double v6 = @"YES";
  }
  else {
    double v6 = @"NO";
  }
  [(StocksLayout *)self chartViewFrame];
  double v7 = NSStringFromCGRect(v20);
  if ([(StocksLayout *)self chartViewInScrollView]) {
    double v8 = @"YES";
  }
  else {
    double v8 = @"NO";
  }
  [(StocksLayout *)self newsViewFrame];
  uint64_t v9 = NSStringFromCGRect(v21);
  if ([(StocksLayout *)self newsViewInScrollView]) {
    double v10 = @"YES";
  }
  else {
    double v10 = @"NO";
  }
  if (![(StocksLayout *)self hasScrollView]) {
    id v5 = @"NO";
  }
  [(StocksLayout *)self scrollViewFrame];
  unint64_t v11 = NSStringFromCGRect(v22);
  [(StocksLayout *)self scrollViewContentSize];
  double v12 = NSStringFromCGSize(v17);
  double v13 = [v15 stringWithFormat:@"listView\n\t-frame: %@\ninfoView\n\t-frame: %@\n\t-in scrollview: %@\nchartView\n\t-frame: %@\n\t-in scrollview: %@\nnewsView\n\t-frame: %@\n\t-in scrollview: %@\nscrollView\n\t-present: %@\n\t-frame: %@\n\t-content size: %@", v3, v4, v6, v7, v8, v9, v10, v5, v11, v12];

  return v13;
}

- (CGRect)listViewFrame
{
  double x = self->_listViewFrame.origin.x;
  double y = self->_listViewFrame.origin.y;
  double width = self->_listViewFrame.size.width;
  double height = self->_listViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setListViewFrame:(CGRect)a3
{
  self->_listViewFrame = a3;
}

- (CGRect)infoViewFrame
{
  double x = self->_infoViewFrame.origin.x;
  double y = self->_infoViewFrame.origin.y;
  double width = self->_infoViewFrame.size.width;
  double height = self->_infoViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInfoViewFrame:(CGRect)a3
{
  self->_infoViewFrame = a3;
}

- (CGRect)chartViewFrame
{
  double x = self->_chartViewFrame.origin.x;
  double y = self->_chartViewFrame.origin.y;
  double width = self->_chartViewFrame.size.width;
  double height = self->_chartViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setChartViewFrame:(CGRect)a3
{
  self->_chartViewFrame = a3;
}

- (CGRect)newsViewFrame
{
  double x = self->_newsViewFrame.origin.x;
  double y = self->_newsViewFrame.origin.y;
  double width = self->_newsViewFrame.size.width;
  double height = self->_newsViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setNewsViewFrame:(CGRect)a3
{
  self->_newsViewFrame = a3;
}

- (UIEdgeInsets)listViewContentInsets
{
  double top = self->_listViewContentInsets.top;
  double left = self->_listViewContentInsets.left;
  double bottom = self->_listViewContentInsets.bottom;
  double right = self->_listViewContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setListViewContentInsets:(UIEdgeInsets)a3
{
  self->_listViewContentInsets = a3;
}

- (BOOL)infoViewHasBottomLine
{
  return self->_infoViewHasBottomLine;
}

- (void)setInfoViewHasBottomLine:(BOOL)a3
{
  self->_infoViewHasBottomLine = a3;
}

- (BOOL)newsViewHasBottomLine
{
  return self->_newsViewHasBottomLine;
}

- (void)setNewsViewHasBottomLine:(BOOL)a3
{
  self->_newsViewHasBottomLine = a3;
}

- (BOOL)chartViewHasBottomLine
{
  return self->_chartViewHasBottomLine;
}

- (void)setChartViewHasBottomLine:(BOOL)a3
{
  self->_chartViewHasBottomLine = a3;
}

- (BOOL)newsViewShouldUseLargerFonts
{
  return self->_newsViewShouldUseLargerFonts;
}

- (void)setNewsViewShouldUseLargerFonts:(BOOL)a3
{
  self->_newsViewShouldUseLargerFonts = a3;
}

- (BOOL)chartViewHasTapGesture
{
  return self->_chartViewHasTapGesture;
}

- (void)setChartViewHasTapGesture:(BOOL)a3
{
  self->_chartViewHasTapGesture = a3;
}

- (BOOL)hasScrollView
{
  return self->_hasScrollView;
}

- (void)setHasScrollView:(BOOL)a3
{
  self->_hasScrollView = a3;
}

- (CGRect)scrollViewFrame
{
  double x = self->_scrollViewFrame.origin.x;
  double y = self->_scrollViewFrame.origin.y;
  double width = self->_scrollViewFrame.size.width;
  double height = self->_scrollViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setScrollViewFrame:(CGRect)a3
{
  self->_scrollViewFrame = a3;
}

- (CGSize)scrollViewContentSize
{
  double width = self->_scrollViewContentSize.width;
  double height = self->_scrollViewContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setScrollViewContentSize:(CGSize)a3
{
  self->_scrollViewContentSize = a3;
}

- (BOOL)infoViewInScrollView
{
  return self->_infoViewInScrollView;
}

- (void)setInfoViewInScrollView:(BOOL)a3
{
  self->_infoViewInScrollView = a3;
}

- (BOOL)chartViewInScrollView
{
  return self->_chartViewInScrollView;
}

- (void)setChartViewInScrollView:(BOOL)a3
{
  self->_chartViewInScrollView = a3;
}

- (BOOL)newsViewInScrollView
{
  return self->_newsViewInScrollView;
}

- (void)setNewsViewInScrollView:(BOOL)a3
{
  self->_newsViewInScrollView = a3;
}

- (BOOL)hasBlurView
{
  return self->_hasBlurView;
}

- (void)setHasBlurView:(BOOL)a3
{
  self->_hasBlurView = a3;
}

- (CGRect)blurViewFrame
{
  double x = self->_blurViewFrame.origin.x;
  double y = self->_blurViewFrame.origin.y;
  double width = self->_blurViewFrame.size.width;
  double height = self->_blurViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBlurViewFrame:(CGRect)a3
{
  self->_blurViewFrame = a3;
}

- (BOOL)hasGrayView
{
  return self->_hasGrayView;
}

- (void)setHasGrayView:(BOOL)a3
{
  self->_hasGrayView = a3;
}

- (CGRect)grayViewFrame
{
  double x = self->_grayViewFrame.origin.x;
  double y = self->_grayViewFrame.origin.y;
  double width = self->_grayViewFrame.size.width;
  double height = self->_grayViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setGrayViewFrame:(CGRect)a3
{
  self->_grayViewFrame = a3;
}

- (BOOL)hasSecondaryGrayView
{
  return self->_hasSecondaryGrayView;
}

- (void)setHasSecondaryGrayView:(BOOL)a3
{
  self->_hasSecondaryGrayView = a3;
}

- (CGRect)secondaryGrayViewFrame
{
  double x = self->_secondaryGrayViewFrame.origin.x;
  double y = self->_secondaryGrayViewFrame.origin.y;
  double width = self->_secondaryGrayViewFrame.size.width;
  double height = self->_secondaryGrayViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSecondaryGrayViewFrame:(CGRect)a3
{
  self->_secondaryGrayViewFrame = a3;
}

- (BOOL)hasStatusView
{
  return self->_hasStatusView;
}

- (void)setHasStatusView:(BOOL)a3
{
  self->_hasStatusView = a3;
}

- (CGRect)statusViewFrame
{
  double x = self->_statusViewFrame.origin.x;
  double y = self->_statusViewFrame.origin.y;
  double width = self->_statusViewFrame.size.width;
  double height = self->_statusViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setStatusViewFrame:(CGRect)a3
{
  self->_statusViewFrame = a3;
}

- (BOOL)hasStatusViewDivider
{
  return self->_hasStatusViewDivider;
}

- (void)setHasStatusViewDivider:(BOOL)a3
{
  self->_hasStatusViewDivider = a3;
}

- (CGRect)statusViewDividerFrame
{
  double x = self->_statusViewDividerFrame.origin.x;
  double y = self->_statusViewDividerFrame.origin.y;
  double width = self->_statusViewDividerFrame.size.width;
  double height = self->_statusViewDividerFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setStatusViewDividerFrame:(CGRect)a3
{
  self->_statusViewDividerFrame = a3;
}

- (BOOL)hasPrimaryHorizontalDivider
{
  return self->_hasPrimaryHorizontalDivider;
}

- (void)setHasPrimaryHorizontalDivider:(BOOL)a3
{
  self->_hasPrimaryHorizontalDivider = a3;
}

- (CGRect)primaryHorizontalDividerFrame
{
  double x = self->_primaryHorizontalDividerFrame.origin.x;
  double y = self->_primaryHorizontalDividerFrame.origin.y;
  double width = self->_primaryHorizontalDividerFrame.size.width;
  double height = self->_primaryHorizontalDividerFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPrimaryHorizontalDividerFrame:(CGRect)a3
{
  self->_primaryHorizontalDividerFrame = a3;
}

- (BOOL)hasSecondaryHorizontalDivider
{
  return self->_hasSecondaryHorizontalDivider;
}

- (void)setHasSecondaryHorizontalDivider:(BOOL)a3
{
  self->_hasSecondaryHorizontalDivider = a3;
}

- (CGRect)secondaryHorizontalDividerFrame
{
  double x = self->_secondaryHorizontalDividerFrame.origin.x;
  double y = self->_secondaryHorizontalDividerFrame.origin.y;
  double width = self->_secondaryHorizontalDividerFrame.size.width;
  double height = self->_secondaryHorizontalDividerFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSecondaryHorizontalDividerFrame:(CGRect)a3
{
  self->_secondaryHorizontalDividerFrame = a3;
}

- (BOOL)hasPrimaryVerticalDivider
{
  return self->_hasPrimaryVerticalDivider;
}

- (void)setHasPrimaryVerticalDivider:(BOOL)a3
{
  self->_hasPrimaryVerticalDivider = a3;
}

- (CGRect)primaryVerticalDividerFrame
{
  double x = self->_primaryVerticalDividerFrame.origin.x;
  double y = self->_primaryVerticalDividerFrame.origin.y;
  double width = self->_primaryVerticalDividerFrame.size.width;
  double height = self->_primaryVerticalDividerFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPrimaryVerticalDividerFrame:(CGRect)a3
{
  self->_primaryVerticalDividerFrame = a3;
}

- (BOOL)hasSecondaryVerticalDivider
{
  return self->_hasSecondaryVerticalDivider;
}

- (void)setHasSecondaryVerticalDivider:(BOOL)a3
{
  self->_hasSecondaryVerticalDivider = a3;
}

- (CGRect)secondaryVerticalDividerFrame
{
  double x = self->_secondaryVerticalDividerFrame.origin.x;
  double y = self->_secondaryVerticalDividerFrame.origin.y;
  double width = self->_secondaryVerticalDividerFrame.size.width;
  double height = self->_secondaryVerticalDividerFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSecondaryVerticalDividerFrame:(CGRect)a3
{
  self->_secondaryVerticalDividerFrame = a3;
}

- (unint64_t)listViewRowCount
{
  return self->_listViewRowCount;
}

- (void)setListViewRowCount:(unint64_t)a3
{
  self->_listViewRowCount = a3;
}

- (double)statusViewCenteringRatio
{
  return self->_statusViewCenteringRatio;
}

- (void)setStatusViewCenteringRatio:(double)a3
{
  self->_statusViewCenteringRatio = a3;
}

- (StockChartDisplayMode)chartDisplayMode
{
  return self->_chartDisplayMode;
}

- (void)setChartDisplayMode:(id)a3
{
}

- (BOOL)hasBlackView
{
  return self->_hasBlackView;
}

- (void)setHasBlackView:(BOOL)a3
{
  self->_hasBlackView = a3;
}

- (BOOL)isFullScreenChart
{
  return self->_isFullScreenChart;
}

- (void)setIsFullScreenChart:(BOOL)a3
{
  self->_isFullScreenChart = a3;
}

- (void).cxx_destruct
{
}

@end