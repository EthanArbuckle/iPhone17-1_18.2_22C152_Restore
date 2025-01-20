@interface StockChartView
+ (CGGradient)LineBackgroundGradient;
- (BOOL)drawsBottomLine;
- (BOOL)hadError;
- (BOOL)isCurrentChart;
- (BOOL)isLandscape;
- (BOOL)isLoading;
- (BOOL)shouldShowLoadingStatus;
- (CGRect)graphViewFrameForMode:(id)a3;
- (CGRect)lineGraphFrame;
- (NSArray)alternateDisplayModes;
- (NSError)error;
- (NSString)description;
- (Stock)stock;
- (StockChartData)chartData;
- (StockChartDisplayMode)currentDisplayMode;
- (StockChartView)initWithInitialDisplayMode:(id)a3 preferredChartInterval:(int64_t)a4 stockChartViewDelegate:(id)a5;
- (StockChartViewDelegate)chartViewDelegate;
- (StocksViewController)controller;
- (double)_evennessOfValue:(double)a3 inRange:(double)a4;
- (double)horizontalPadding;
- (double)lineGraphBottomPadding;
- (double)widestYLabelWidthForMode:(id)a3;
- (id)HUDView;
- (id)chartUpdater;
- (id)currentGraphView;
- (id)graphViewForMode:(id)a3;
- (int64_t)maxSupportedIntervalFromDesiredInterval:(int64_t)a3;
- (int64_t)preferredInterval;
- (int64_t)selectedInterval;
- (void)_layoutAxesAndXLabels;
- (void)_layoutIntervalButtonRow;
- (void)_layoutSubviews;
- (void)_layoutTopLabelsHidden:(BOOL)a3;
- (void)_layoutVolumeSeparatorLineForGraphRect:(CGRect)a3;
- (void)_layoutYLabels;
- (void)_prepareXAxisLabelsAndPositions;
- (void)_prepareYAxisLabelsAndPositionsForDisplayMode:(id)a3;
- (void)_setDayLabelsWithInterval:(unsigned int)a3 realTimePositions:(BOOL)a4;
- (void)_setHourLabels;
- (void)_setMonthAndYearLabels;
- (void)_setShowingLoadingStatus:(BOOL)a3;
- (void)addDisplayMode:(id)a3;
- (void)animateTransitionToDisplayMode:(id)a3;
- (void)chartIntervalButtonRow:(id)a3 didSelectChartInterval:(int64_t)a4;
- (void)chartUpdater:(id)a3 didFailWithError:(id)a4;
- (void)chartUpdater:(id)a3 didReceiveStockChartData:(id)a4;
- (void)clearData;
- (void)createYLabelsForMode:(id)a3;
- (void)dealloc;
- (void)didTransitionToDisplayMode:(id)a3;
- (void)enumerateGraphsAndDisplayModesUsingBlock:(id)a3;
- (void)forceLayout;
- (void)hideLabelsAxesAndGraphs;
- (void)hideOtherGraphViews;
- (void)layoutGraphViews;
- (void)layoutIfNeeded;
- (void)layoutLoadingStatus;
- (void)layoutPreviousClose;
- (void)layoutSubviews;
- (void)prepareForTransitionToDisplayMode:(id)a3;
- (void)reloadData;
- (void)reloadDataIfStale;
- (void)renderGraphDataIfNeeded;
- (void)renderGraphDataIfNeededForMode:(id)a3;
- (void)resetLocale;
- (void)setChartData:(id)a3;
- (void)setChartViewDelegate:(id)a3;
- (void)setController:(id)a3;
- (void)setCurrentDisplayMode:(id)a3;
- (void)setDrawsBottomLine:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLabelsAndAxesAlpha:(double)a3;
- (void)setNeedsLayout;
- (void)setPreferredInterval:(int64_t)a3;
- (void)setSelectedInterval:(int64_t)a3;
- (void)setShowingHUD:(BOOL)a3;
- (void)setStock:(id)a3;
- (void)stockGraphViewReadyForDisplay:(id)a3;
- (void)updateChartViewForSelectedInterval;
- (void)updateHUDView;
@end

@implementation StockChartView

+ (CGGradient)LineBackgroundGradient
{
  result = (CGGradient *)LineBackgroundGradient_gradient;
  if (!LineBackgroundGradient_gradient)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v4 = (void *)MEMORY[0x263EFF8C0];
    id v5 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.2];
    uint64_t v6 = [v5 CGColor];
    id v7 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.2];
    CFArrayRef v8 = (const __CFArray *)objc_msgSend(v4, "arrayWithObjects:", v6, objc_msgSend(v7, "CGColor"), 0);

    LineBackgroundGradient_gradient = (uint64_t)CGGradientCreateWithColors(DeviceRGB, v8, 0);
    CGColorSpaceRelease(DeviceRGB);
    return (CGGradient *)LineBackgroundGradient_gradient;
  }
  return result;
}

- (BOOL)isCurrentChart
{
  v2 = self;
  v3 = [(StockChartView *)self chartViewDelegate];
  LOBYTE(v2) = [v3 stockChartViewIsCurrentChartView:v2];

  return (char)v2;
}

- (void)dealloc
{
  [(YQLRequest *)self->_chartUpdater cancelAndInvalidate];
  [(ChartUpdater *)self->_chartUpdater setDelegate:0];
  chartUpdater = self->_chartUpdater;
  self->_chartUpdater = 0;

  v4.receiver = self;
  v4.super_class = (Class)StockChartView;
  [(StockChartView *)&v4 dealloc];
}

- (StockChartView)initWithInitialDisplayMode:(id)a3 preferredChartInterval:(int64_t)a4 stockChartViewDelegate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v58.receiver = self;
  v58.super_class = (Class)StockChartView;
  v10 = -[StockChartView initWithFrame:](&v58, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v10)
  {
    v11 = [MEMORY[0x263F1C550] clearColor];
    [(StockChartView *)v10 setBackgroundColor:v11];

    [(StockChartView *)v10 setMultipleTouchEnabled:1];
    uint64_t v12 = objc_opt_new();
    graphViews = v10->_graphViews;
    v10->_graphViews = (NSMutableDictionary *)v12;

    v14 = objc_alloc_init(LoadingLabel);
    loadingLabel = v10->_loadingLabel;
    v10->_loadingLabel = v14;

    [(StockChartView *)v10 addSubview:v10->_loadingLabel];
    v16 = objc_alloc_init(ChartUpdater);
    chartUpdater = v10->_chartUpdater;
    v10->_chartUpdater = v16;

    [(ChartUpdater *)v10->_chartUpdater setDelegate:v10];
    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    axisViews = v10->_axisViews;
    v10->_axisViews = v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    xLabelViews = v10->_xLabelViews;
    v10->_xLabelViews = v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    yLabelViews = v10->_yLabelViews;
    v10->_yLabelViews = v22;

    [(StockChartView *)v10 createYLabelsForMode:v8];
    v24 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    xAxisKeyline = v10->_xAxisKeyline;
    v10->_xAxisKeyline = v24;

    [(UIView *)v10->_xAxisKeyline setHidden:1];
    [(StockChartView *)v10 addSubview:v10->_xAxisKeyline];
    uint64_t v26 = objc_opt_new();
    previousCloseLine = v10->_previousCloseLine;
    v10->_previousCloseLine = (DashedLineView *)v26;

    v28 = v10->_previousCloseLine;
    v29 = [MEMORY[0x263F1C550] clearColor];
    [(DashedLineView *)v28 setBackgroundColor:v29];

    [(StockChartView *)v10 addSubview:v10->_previousCloseLine];
    v30 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    previousCloseLabel = v10->_previousCloseLabel;
    v10->_previousCloseLabel = v30;

    v32 = v10->_previousCloseLabel;
    v33 = +[StocksStyle sharedStyle];
    v34 = [v33 lightFontOfSize:12.0];
    [(UILabel *)v32 setFont:v34];

    v35 = v10->_previousCloseLabel;
    v36 = [MEMORY[0x263F1C550] whiteColor];
    [(UILabel *)v35 setTextColor:v36];

    v37 = v10->_previousCloseLabel;
    v38 = [MEMORY[0x263F1C550] clearColor];
    [(UILabel *)v37 setBackgroundColor:v38];

    [(UILabel *)v10->_previousCloseLabel setTextAlignment:2];
    [(StockChartView *)v10 addSubview:v10->_previousCloseLabel];
    v39 = objc_alloc_init(ChartHUDView);
    HUDView = v10->_HUDView;
    v10->_HUDView = v39;

    [(ChartHUDView *)v10->_HUDView setChartView:v10];
    [(ChartHUDView *)v10->_HUDView setOverlayHidden:1];
    [(StockChartView *)v10 addSubview:v10->_HUDView];
    v41 = objc_alloc_init(ChartTitleLabel);
    titleView = v10->_titleView;
    v10->_titleView = v41;

    v43 = v10->_titleView;
    v44 = [MEMORY[0x263F1C550] blackColor];
    [(ChartTitleLabel *)v43 setBackgroundColor:v44];

    [v8 showsTitle];
    if (v45 != 0.0) {
      [(StockChartView *)v10 insertSubview:v10->_titleView belowSubview:v10->_HUDView];
    }
    v46 = [[ChartIntervalButtonRow alloc] initWithMaxChartInterval:8 chartIntervalButtonRowDelegate:v10];
    intervalButtonRow = v10->_intervalButtonRow;
    v10->_intervalButtonRow = v46;

    [(StockChartView *)v10 addSubview:v10->_intervalButtonRow];
    v48 = [(StockChartView *)v10 layer];
    [v48 setNeedsLayoutOnGeometryChange:0];

    v49 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    chartTopKeyline = v10->_chartTopKeyline;
    v10->_chartTopKeyline = v49;

    v51 = v10->_chartTopKeyline;
    v52 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.8];
    [(UIView *)v51 setBackgroundColor:v52];

    [(StockChartView *)v10 addSubview:v10->_chartTopKeyline];
    v53 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    chartBottomKeyline = v10->_chartBottomKeyline;
    v10->_chartBottomKeyline = v53;

    v55 = v10->_chartBottomKeyline;
    v56 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.8];
    [(UIView *)v55 setBackgroundColor:v56];

    [(StockChartView *)v10 addSubview:v10->_chartBottomKeyline];
    objc_msgSend(v8, "setBackgroundGradient:", objc_msgSend((id)objc_opt_class(), "LineBackgroundGradient"));
    [(StockChartView *)v10 addDisplayMode:v8];
    [(StockChartView *)v10 setCurrentDisplayMode:v8];
    v10->_preferredInterval = a4;
    v10->_selectedInterval = a4;
    objc_storeWeak((id *)&v10->_chartViewDelegate, v9);
    [(ChartIntervalButtonRow *)v10->_intervalButtonRow selectChartIntervalButtonForInterval:[(StockChartView *)v10 maxSupportedIntervalFromDesiredInterval:a4]];
  }

  return v10;
}

- (void)addDisplayMode:(id)a3
{
  id v4 = a3;
  displayModes = self->_displayModes;
  id v15 = v4;
  if (!displayModes)
  {
    uint64_t v6 = (NSMutableArray *)objc_opt_new();
    id v7 = self->_displayModes;
    self->_displayModes = v6;

    id v4 = v15;
    displayModes = self->_displayModes;
  }
  if (([(NSMutableArray *)displayModes containsObject:v4] & 1) == 0)
  {
    id v8 = [StockGraphView alloc];
    id v9 = -[StockGraphView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(StockGraphView *)v9 setDisplayMode:v15];
    [(StockGraphView *)v9 setChartViewDelegate:self];
    v10 = [(StockChartView *)self chartData];
    [(StockGraphView *)v9 loadStockChartData:v10];

    objc_msgSend(v15, "setBackgroundGradient:", objc_msgSend((id)objc_opt_class(), "LineBackgroundGradient"));
    v11 = [MEMORY[0x263F1C920] mainScreen];
    [v11 scale];
    BOOL v13 = v12 == 1.0;
    double v14 = 0.7;
    if (v13) {
      double v14 = 1.0;
    }
    [v15 setLineWidth:v14];

    [(NSMutableArray *)self->_displayModes addObject:v15];
    [(NSMutableDictionary *)self->_graphViews setObject:v9 forKey:v15];
    [(StockChartView *)self insertSubview:v9 belowSubview:self->_HUDView];
    [(StockChartView *)self createYLabelsForMode:v15];
    [(StockChartView *)self _prepareYAxisLabelsAndPositionsForDisplayMode:v15];
  }
}

- (void)setDrawsBottomLine:(BOOL)a3
{
  self->_drawsBottomLine = a3;
  [(UIView *)self->_chartBottomKeyline setHidden:!a3];
}

- (id)graphViewForMode:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_graphViews objectForKey:a3];
}

- (void)setCurrentDisplayMode:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_currentDisplayMode, a3);
  -[ChartIntervalButtonRow updateMaxChartInterval:](self->_intervalButtonRow, "updateMaxChartInterval:", [v5 maxInterval]);
  if (self->_chartData) {
    [(StockChartView *)self _prepareXAxisLabelsAndPositions];
  }
  [(StockChartView *)self setNeedsLayout];
}

- (NSArray)alternateDisplayModes
{
  v3 = (void *)[(NSMutableArray *)self->_displayModes mutableCopy];
  id v4 = [(StockChartView *)self currentDisplayMode];
  [v3 removeObject:v4];

  return (NSArray *)v3;
}

- (void)enumerateGraphsAndDisplayModesUsingBlock:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = (void (**)(id, uint64_t, void *, unsigned __int8 *))a3;
  if (!v5)
  {
    BOOL v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"StockChartView.m", 249, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_displayModes;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
LABEL_5:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
      unsigned __int8 v14 = 0;
      double v12 = [(StockChartView *)self graphViewForMode:v11];
      v5[2](v5, v11, v12, &v14);
      LODWORD(v11) = v14;

      if (v11) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
}

- (void)resetLocale
{
  [(ChartHUDView *)self->_HUDView resetLocale];
  v3 = +[ChartLabelInfoManager sharedLabelInfoManager];
  [v3 resetLocale];

  [(StockChartView *)self _setMonthAndYearLabels];
}

- (NSString)description
{
  v3 = NSString;
  id v4 = [(Stock *)self->_stock symbol];
  v8.receiver = self;
  v8.super_class = (Class)StockChartView;
  id v5 = [(StockChartView *)&v8 description];
  uint64_t v6 = [v3 stringWithFormat:@"Ticker %@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)currentGraphView
{
  v3 = [(StockChartView *)self currentDisplayMode];
  id v4 = [(StockChartView *)self graphViewForMode:v3];

  return v4;
}

- (void)setStock:(id)a3
{
  id v5 = (Stock *)a3;
  if (self->_stock != v5)
  {
    uint64_t v6 = v5;
    [(StockChartView *)self enumerateGraphsAndDisplayModesUsingBlock:&__block_literal_global_11];
    objc_storeStrong((id *)&self->_stock, a3);
    [(StockChartView *)self clearData];
    [(StockChartView *)self setNeedsLayout];
    id v5 = v6;
  }
}

uint64_t __27__StockChartView_setStock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 cancelRenderOperation];
}

- (BOOL)shouldShowLoadingStatus
{
  v2 = [(StockChartView *)self currentGraphView];
  char v3 = [v2 isRendered] ^ 1;

  return v3;
}

- (void)layoutGraphViews
{
  if (!self->_animating)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __34__StockChartView_layoutGraphViews__block_invoke;
    v2[3] = &unk_26467DD28;
    v2[4] = self;
    [(StockChartView *)self enumerateGraphsAndDisplayModesUsingBlock:v2];
  }
}

void __34__StockChartView_layoutGraphViews__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [v4 graphViewFrameForMode:a2];
  objc_msgSend(v5, "setFrame:");
}

- (void)layoutPreviousClose
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  [(StockChartData *)self->_chartData previousClosePrice];
  float v4 = v3;
  int v5 = 0;
  if (!self->_selectedInterval && v3 != 0.0)
  {
    if ([(StockChartView *)self isLoading])
    {
      int v5 = 0;
    }
    else
    {
      uint64_t v6 = [(StockChartView *)self currentGraphView];
      int v5 = [v6 isRendered];
    }
  }
  uint64_t v7 = v5 ^ 1u;
  [(DashedLineView *)self->_previousCloseLine setHidden:v7];
  [(UILabel *)self->_previousCloseLabel setHidden:v7];
  if ((v7 & 1) == 0)
  {
    previousCloseLabel = self->_previousCloseLabel;
    uint64_t v9 = +[StockDataFormatter sharedDataFormatter];
    *(float *)&double v10 = v4;
    uint64_t v11 = [NSNumber numberWithFloat:v10];
    double v12 = objc_msgSend(v9, "formattedNumber:withPrecision:useGroupSeparator:", v11, -[StockChartData yAxisFractionDigits](self->_chartData, "yAxisFractionDigits"), 1);
    [(UILabel *)previousCloseLabel setText:v12];

    [(UILabel *)self->_previousCloseLabel sizeToFit];
    BOOL v13 = self->_previousCloseLabel;
    unsigned __int8 v14 = [(StockChartView *)self currentDisplayMode];
    int v15 = [v14 showsPriceLabelForPreviousClose];
    double v16 = 0.0;
    if (v15) {
      double v16 = 1.0;
    }
    [(UILabel *)v13 setAlpha:v16];

    long long v17 = [(StockChartView *)self chartData];
    double v18 = *(double *)([v17 minValue] + 8);

    double v19 = v4;
    if (v18 <= v4) {
      double v20 = v18;
    }
    else {
      double v20 = v4;
    }
    v21 = [(StockChartView *)self chartData];
    double v22 = *(double *)([v21 maxValue] + 8);

    if (v22 <= v19) {
      double v23 = v19;
    }
    else {
      double v23 = v22;
    }
    v24 = [(StockChartView *)self currentGraphView];
    [v24 frame];
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    double v32 = v31;

    v73.origin.CGFloat x = v26;
    v73.origin.CGFloat y = v28;
    v73.size.width = v30;
    v73.size.CGFloat height = v32;
    double MaxY = CGRectGetMaxY(v73);
    [(StockChartView *)self lineGraphBottomPadding];
    double v35 = MaxY - v34;
    [(StockChartView *)self lineGraphBottomPadding];
    double v37 = v35 - RoundToPixel((v19 - v20) / (v23 - v20) * (v32 - v36 + -18.0));
    previousCloseLine = self->_previousCloseLine;
    v74.origin.CGFloat x = v26;
    v74.origin.CGFloat y = v28;
    v74.size.width = v30;
    v74.size.CGFloat height = v32;
    double MinX = CGRectGetMinX(v74);
    v75.origin.CGFloat x = v26;
    v75.origin.CGFloat y = v28;
    v75.size.width = v30;
    v75.size.CGFloat height = v32;
    double Width = CGRectGetWidth(v75);
    -[DashedLineView setFrame:](previousCloseLine, "setFrame:", MinX, v37, Width, RoundToPixel(0.5));
    [(DashedLineView *)self->_previousCloseLine setNeedsDisplay];
    [(UILabel *)self->_previousCloseLabel frame];
    double v42 = v41;
    double v44 = v43;
    double v45 = v37 - v43 + -4.0;
    v46 = [(UILabel *)self->_previousCloseLabel font];
    [v46 descender];
    double v48 = RoundToPixel(v45 - v47);

    v76.origin.CGFloat x = v26;
    v76.origin.CGFloat y = v28;
    v76.size.width = v30;
    v76.size.CGFloat height = v32;
    CGFloat MaxX = CGRectGetMaxX(v76);
    double v50 = MaxX - v42;
    -[UILabel setFrame:](self->_previousCloseLabel, "setFrame:", MaxX - v42, v48, v42, v44);
    v51 = [(StockChartView *)self currentDisplayMode];
    int v52 = [v51 showsPriceLabelForPreviousClose];

    if (v52)
    {
      v77.origin.CGFloat x = v50;
      v77.origin.CGFloat y = v48;
      v77.size.width = v42;
      v77.size.CGFloat height = v44;
      CGRect v78 = CGRectInset(v77, -4.0, -4.0);
      CGFloat x = v78.origin.x;
      CGFloat y = v78.origin.y;
      CGFloat v55 = v78.size.width;
      CGFloat height = v78.size.height;
      [(DashedLineView *)self->_previousCloseLine frame];
      CGRect v80 = CGRectInset(v79, -4.0, -4.0);
      CGFloat v57 = v80.origin.x;
      CGFloat v58 = v80.origin.y;
      CGFloat v59 = v80.size.width;
      CGFloat v60 = v80.size.height;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      v61 = self->_yLabelViews;
      uint64_t v62 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v67 objects:v71 count:16];
      if (v62)
      {
        uint64_t v63 = v62;
        uint64_t v64 = *(void *)v68;
        do
        {
          for (uint64_t i = 0; i != v63; ++i)
          {
            if (*(void *)v68 != v64) {
              objc_enumerationMutation(v61);
            }
            v66 = *(void **)(*((void *)&v67 + 1) + 8 * i);
            objc_msgSend(v66, "frame", (void)v67);
            v83.origin.CGFloat x = x;
            v83.origin.CGFloat y = y;
            v83.size.width = v55;
            v83.size.CGFloat height = height;
            if (!CGRectIntersectsRect(v81, v83))
            {
              [v66 frame];
              v84.origin.CGFloat x = v57;
              v84.origin.CGFloat y = v58;
              v84.size.width = v59;
              v84.size.CGFloat height = v60;
              if (!CGRectIntersectsRect(v82, v84)) {
                continue;
              }
            }
            [v66 setHidden:1];
          }
          uint64_t v63 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v67 objects:v71 count:16];
        }
        while (v63);
      }
    }
  }
}

- (void)_layoutSubviews
{
  float v3 = +[StockManager sharedManager];
  float v4 = [v3 stocksList];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    [(StockChartView *)self bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    unsigned __int8 v14 = [(StockChartView *)self currentDisplayMode];
    [v14 showsTitle];
    double v16 = v15;
    BOOL v17 = v15 == 0.0;

    [(StockChartView *)self _layoutTopLabelsHidden:v17];
    if (v16 != 0.0)
    {
      double v18 = [(StockChartView *)self currentDisplayMode];
      [v18 chartRenderingInsets];
      double v20 = v19;
      double v22 = v21;

      [(ChartTitleLabel *)self->_titleView prepareStringsWithStock:self->_stock width:v11 - (v20 + v22)];
    }
    if (self->_chartData)
    {
      [(StockChartView *)self layoutGraphViews];
      [(StockChartView *)self _prepareXAxisLabelsAndPositions];
    }
    [(StockChartView *)self _layoutIntervalButtonRow];
    [(ChartIntervalButtonRow *)self->_intervalButtonRow setHidden:0];
    if ([(StockChartView *)self shouldShowLoadingStatus])
    {
      [(StockChartView *)self _setShowingLoadingStatus:1];
    }
    else
    {
      [(StockChartView *)self _setShowingLoadingStatus:0];
      double v23 = [(StockChartView *)self currentGraphView];
      [v23 frame];
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;

      -[StockChartView _layoutVolumeSeparatorLineForGraphRect:](self, "_layoutVolumeSeparatorLineForGraphRect:", v25, v27, v29, v31);
      [(StockChartView *)self _layoutYLabels];
      [(StockChartView *)self _layoutAxesAndXLabels];
      -[ChartHUDView setFrame:](self->_HUDView, "setFrame:", v7, v9, v11, v13);
      double v32 = [(StockChartView *)self currentGraphView];
      [v32 setHidden:0];

      [(UIView *)self->_xAxisKeyline setHidden:0];
      v33 = [(StockChartView *)self chartViewDelegate];
      char v34 = objc_opt_respondsToSelector();

      if (v34)
      {
        double v35 = [(StockChartView *)self chartViewDelegate];
        [v35 stockChartViewFinishedInitialLoad:self];
      }
    }
    [(StockChartView *)self layoutPreviousClose];
    double v36 = [(StockChartView *)self currentDisplayMode];
    [(StockChartView *)self graphViewFrameForMode:v36];
    double v38 = v37;
    CGFloat v40 = v39;
    CGFloat v42 = v41;
    CGFloat v44 = v43;

    double v45 = [MEMORY[0x263F1C408] sharedApplication];
    uint64_t v46 = [v45 statusBarOrientation];

    [(StockChartView *)self horizontalPadding];
    double v48 = v47;
    v70.origin.CGFloat x = v38;
    v70.origin.CGFloat y = v40;
    v70.size.width = v42;
    v70.size.CGFloat height = v44;
    double MaxY = CGRectGetMaxY(v70);
    v71.origin.CGFloat x = v38;
    v71.origin.CGFloat y = v40;
    v71.size.width = v42;
    v71.size.CGFloat height = v44;
    double Width = CGRectGetWidth(v71);
    v49 = [MEMORY[0x263F1C920] mainScreen];
    [v49 scale];
    double v51 = 1.0 / v50;

    v72.origin.CGFloat x = v38;
    v72.origin.CGFloat y = v40;
    v72.size.width = v42;
    v72.size.CGFloat height = v44;
    double MinY = CGRectGetMinY(v72);
    double v53 = MinY - RoundToPixel(0.5);
    v73.origin.CGFloat x = v38;
    v73.origin.CGFloat y = v40;
    v73.size.width = v42;
    v73.size.CGFloat height = v44;
    double v54 = CGRectGetWidth(v73);
    double v55 = v54 + RoundToPixel(0.5);
    v56 = [MEMORY[0x263F1C920] mainScreen];
    [v56 scale];
    double v58 = 1.0 / v57;

    double v59 = 0.0;
    if (v46 == 3) {
      double v59 = v48;
    }
    double v60 = v38 - v59;
    v61 = [MEMORY[0x263F1C920] mainScreen];
    [v61 _referenceBounds];
    double v63 = v62;

    double v64 = -0.0;
    if (v63 == 812.0) {
      double v64 = v48;
    }
    double v65 = v55 + v64;
    -[UIView setFrame:](self->_chartBottomKeyline, "setFrame:", v60, MaxY, Width + v64, v51);
    [(UIView *)self->_chartBottomKeyline setHidden:[(StockChartView *)self drawsBottomLine] ^ 1];
    -[UIView setFrame:](self->_chartTopKeyline, "setFrame:", v60, v53, v65, v58);
    chartTopKeyline = self->_chartTopKeyline;
    [(UIView *)chartTopKeyline setHidden:0];
  }
  else
  {
    [(ChartIntervalButtonRow *)self->_intervalButtonRow setHidden:1];
    [(StockChartView *)self _layoutTopLabelsHidden:1];
    [(StockChartView *)self hideLabelsAxesAndGraphs];
    [(StockChartView *)self _setShowingLoadingStatus:0];
  }
}

- (void)layoutSubviews
{
  if (!self->_animating)
  {
    float v3 = [(StockChartView *)self controller];
    char v4 = [v3 isAnimatingRotation];

    if ((v4 & 1) == 0)
    {
      [(StockChartView *)self _layoutSubviews];
    }
  }
}

- (double)horizontalPadding
{
  float v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 _referenceBounds];
  if (v4 == 812.0)
  {
    if ([(StockChartView *)self isLandscape]) {
      double v5 = 44.0;
    }
    else {
      double v5 = 0.0;
    }
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (BOOL)isLandscape
{
  v2 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v3 = [v2 statusBarOrientation];

  return (unint64_t)(v3 - 3) < 2;
}

- (void)layoutIfNeeded
{
  if ([(StockChartView *)self isCurrentChart])
  {
    if (!self->_animating)
    {
      v3.receiver = self;
      v3.super_class = (Class)StockChartView;
      [(StockChartView *)&v3 layoutIfNeeded];
    }
  }
}

- (void)forceLayout
{
  [(StockChartView *)self _layoutSubviews];
  intervalButtonRow = self->_intervalButtonRow;

  [(ChartIntervalButtonRow *)intervalButtonRow setNeedsLayout];
}

- (void)setNeedsLayout
{
  if (self->_animating)
  {
    self->_layoutPending = 1;
  }
  else
  {
    v2.receiver = self;
    v2.super_class = (Class)StockChartView;
    [(StockChartView *)&v2 setNeedsLayout];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(StockChartView *)self frame];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)StockChartView;
  -[StockChartView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (width != v9 || height != v11) {
    [(StockChartView *)self renderGraphDataIfNeeded];
  }
}

- (double)lineGraphBottomPadding
{
  objc_super v2 = [(StockChartView *)self currentDisplayMode];
  [v2 lineGraphBottomPadding];
  double v4 = v3;

  return v4;
}

- (void)chartUpdater:(id)a3 didReceiveStockChartData:(id)a4
{
  id v11 = a4;
  double v5 = [(StockChartView *)self chartViewDelegate];
  [v5 stockChartViewNeedsLoadingStatusUpdated:self];

  int64_t selectedInterval = self->_selectedInterval;
  if (selectedInterval == [v11 chartInterval])
  {
    double v7 = [(Stock *)self->_stock symbol];
    double v8 = [v11 stock];
    double v9 = [v8 symbol];
    int v10 = [v7 isEqualToString:v9];

    if (v10) {
      [(StockChartView *)self setChartData:v11];
    }
  }
}

- (void)chartUpdater:(id)a3 didFailWithError:(id)a4
{
  objc_storeStrong((id *)&self->_error, a4);
  [(StockChartView *)self setNeedsLayout];
  id v5 = [(StockChartView *)self chartViewDelegate];
  [v5 stockChartViewNeedsLoadingStatusUpdated:self];
}

- (id)chartUpdater
{
  return self->_chartUpdater;
}

- (BOOL)isLoading
{
  return [(YQLRequest *)self->_chartUpdater isLoading];
}

- (BOOL)hadError
{
  return self->_error != 0;
}

- (void)reloadData
{
  if (self->_stock && ![(StockChartView *)self isLoading])
  {
    [(StockChartView *)self clearData];
    if (![(ChartUpdater *)self->_chartUpdater updateChartForStock:self->_stock interval:self->_selectedInterval])
    {
      double v3 = [(StockChartView *)self chartViewDelegate];
      [v3 stockChartViewNeedsLoadingStatusUpdated:self];
    }
    [(StockChartView *)self setNeedsLayout];
  }
}

- (void)clearData
{
  chartData = self->_chartData;
  self->_chartData = 0;

  [(StockChartView *)self setError:0];
  [(StockChartView *)self hideLabelsAxesAndGraphs];
  [(StockChartView *)self enumerateGraphsAndDisplayModesUsingBlock:&__block_literal_global_63];
  [(StockChartView *)self updateHUDView];
  chartUpdater = self->_chartUpdater;

  [(ChartUpdater *)chartUpdater cancel];
}

uint64_t __27__StockChartView_clearData__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 clearData];
}

- (void)reloadDataIfStale
{
  if ([(ChartHUDView *)self->_HUDView isTrackingTouches]
    || self->_chartData
    && (([(id)*MEMORY[0x263F1D020] isSuspended] & 1) == 0
     && ![(Stock *)self->_stock marketIsOpen]
     || (double Current = CFAbsoluteTimeGetCurrent(),
         [(StockChartData *)self->_chartData expirationTime],
         Current < v4)))
  {
    [(StockChartView *)self setError:0];
  }
  else
  {
    [(StockChartView *)self reloadData];
  }
}

- (void)setChartData:(id)a3
{
  id v5 = (StockChartData *)a3;
  if (self->_chartData != v5)
  {
    objc_storeStrong((id *)&self->_chartData, a3);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __31__StockChartView_setChartData___block_invoke;
    v7[3] = &unk_26467DD28;
    double v8 = v5;
    [(StockChartView *)self enumerateGraphsAndDisplayModesUsingBlock:v7];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __31__StockChartView_setChartData___block_invoke_2;
    v6[3] = &unk_26467DD28;
    v6[4] = self;
    [(StockChartView *)self enumerateGraphsAndDisplayModesUsingBlock:v6];
    [(StockChartView *)self bounds];
    if (!CGRectEqualToRect(v9, *MEMORY[0x263F001A8]))
    {
      [(StockChartView *)self layoutSubviews];
      [(StockChartView *)self renderGraphDataIfNeeded];
    }
    [(StockChartView *)self updateHUDView];
  }
}

uint64_t __31__StockChartView_setChartData___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 loadStockChartData:*(void *)(a1 + 32)];
}

uint64_t __31__StockChartView_setChartData___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _prepareYAxisLabelsAndPositionsForDisplayMode:a2];
}

- (CGRect)graphViewFrameForMode:(id)a3
{
  id v4 = a3;
  [v4 showsTitle];
  if (v5 == 0.0) {
    double v6 = 0.0;
  }
  else {
    double v6 = 37.0;
  }
  [v4 chartSize];
  [v4 chartRenderingInsets];
  double v8 = v7;
  double v10 = v9;
  double v40 = v11;
  double v13 = v12;
  [(StockChartView *)self horizontalPadding];
  double v15 = v14;
  double v16 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v17 = [v16 statusBarOrientation];

  [(StockChartView *)self bounds];
  double v19 = v18;
  double v39 = v20;
  [v4 intervalRowHeight];
  double v22 = v8 + v6 + v21;
  double v23 = -0.0;
  if (v17 == 3) {
    double v23 = v15;
  }
  double v24 = v10 + v23;
  double v25 = v10 + v13;
  double v26 = [MEMORY[0x263F1C920] mainScreen];
  [v26 _referenceBounds];
  double v27 = 0.0;
  if (v28 == 812.0) {
    double v27 = v15;
  }
  double v29 = v25 + v27;

  [v4 intervalRowHeight];
  double v31 = v30;

  double v32 = [MEMORY[0x263F1C920] mainScreen];
  [v32 scale];
  double v34 = v39 - (v8 + v40 + v6 + v31 + 1.0 / v33);

  double v35 = v24;
  double v36 = v22;
  double v37 = v19 - v29;
  double v38 = v34;
  result.size.double height = v38;
  result.size.double width = v37;
  result.origin.double y = v36;
  result.origin.double x = v35;
  return result;
}

- (CGRect)lineGraphFrame
{
  double v3 = [(StockChartView *)self currentDisplayMode];
  [(StockChartView *)self graphViewFrameForMode:v3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [(StockChartView *)self lineGraphBottomPadding];
  double v13 = v12;
  double v14 = [(StockChartView *)self currentDisplayMode];
  char v15 = [v14 graphOverlapsYAxisLabels];

  if ((v15 & 1) == 0)
  {
    double v16 = [(StockChartView *)self currentDisplayMode];
    [(StockChartView *)self widestYLabelWidthForMode:v16];
    double v18 = v17 + 4.0;
    double v19 = [MEMORY[0x263F1C920] mainScreen];
    [v19 scale];
    double v9 = v9 - (v18 + 1.0 / v20);
  }
  double v21 = v11 - (v13 + 18.0);
  double v22 = v7 + 18.0;
  double v23 = v5;
  double v24 = v9;
  result.size.double height = v21;
  result.size.double width = v24;
  result.origin.double y = v22;
  result.origin.double x = v23;
  return result;
}

- (void)renderGraphDataIfNeededForMode:(id)a3
{
  id v15 = a3;
  double v4 = -[StockChartView graphViewForMode:](self, "graphViewForMode:");
  double v5 = [(StockChartView *)self chartData];
  if (v5 && ([v4 isRendered] & 1) == 0)
  {
    char v6 = [v4 isRendering];

    if ((v6 & 1) == 0)
    {
      double v7 = 0.0;
      if (([v15 graphOverlapsYAxisLabels] & 1) == 0)
      {
        [(StockChartView *)self widestYLabelWidthForMode:v15];
        double v9 = v8 + 4.0;
        double v10 = [MEMORY[0x263F1C920] mainScreen];
        [v10 scale];
        double v7 = FloorToPixel(v9 + 1.0 / v11);
      }
      [v15 lineGraphBottomPadding];
      objc_msgSend(v4, "setGraphInsets:", 18.0, 0.0, v12, v7);
      [(StockChartView *)self graphViewFrameForMode:v15];
      objc_msgSend(v4, "recomputePathsAndRenderIfNeededForSize:", v13, v14);
    }
  }
  else
  {
  }
}

- (void)renderGraphDataIfNeeded
{
  double v3 = [(StockChartView *)self currentDisplayMode];
  [(StockChartView *)self renderGraphDataIfNeededForMode:v3];

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__StockChartView_renderGraphDataIfNeeded__block_invoke;
  v4[3] = &unk_26467DD28;
  v4[4] = self;
  [(StockChartView *)self enumerateGraphsAndDisplayModesUsingBlock:v4];
}

void __41__StockChartView_renderGraphDataIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) currentDisplayMode];

  double v4 = v5;
  if (v3 != v5)
  {
    [*(id *)(a1 + 32) renderGraphDataIfNeededForMode:v5];
    double v4 = v5;
  }
}

- (void)stockGraphViewReadyForDisplay:(id)a3
{
  id v5 = a3;
  id v4 = [(StockChartView *)self currentGraphView];

  if (v4 == v5)
  {
    [(StockChartView *)self hideOtherGraphViews];
    [v5 setAlpha:1.0];
    [(StockChartView *)self setLabelsAndAxesAlpha:1.0];
    [(StockChartView *)self setNeedsLayout];
  }
  [(StockChartView *)self updateHUDView];
}

- (void)hideOtherGraphViews
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = [(StockChartView *)self currentDisplayMode];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_displayModes;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        if (v3 != *(void **)(*((void *)&v10 + 1) + 8 * v8))
        {
          double v9 = [(StockChartView *)self graphViewForMode:(void)v10];
          [v9 setAlpha:0.0];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)HUDView
{
  return self->_HUDView;
}

- (void)setShowingHUD:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ChartHUDView *)self->_HUDView isOverlayHidden] == a3)
  {
    uint64_t v5 = [(StockChartView *)self currentDisplayMode];
    uint64_t v6 = [(StockChartView *)self currentGraphView];
    [(ChartHUDView *)self->_HUDView setGraphView:v6];
    HUDView = self->_HUDView;
    [v6 frame];
    double v9 = v8;
    [v5 gutterHeight];
    double v11 = v9 - v10;
    long long v12 = [MEMORY[0x263F1C920] mainScreen];
    [v12 scale];
    [(ChartHUDView *)HUDView setBarHeight:v11 + 1.0 / v13 * -2.0];

    [(ChartHUDView *)self->_HUDView setOverlayHidden:!v3];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __32__StockChartView_setShowingHUD___block_invoke;
    v17[3] = &unk_26467D108;
    v17[4] = self;
    BOOL v18 = v3;
    [MEMORY[0x263F1CB60] animateWithDuration:v17 animations:0.100000001];
    chartTopKeyline = self->_chartTopKeyline;
    double v15 = 0.2;
    if (!v3) {
      double v15 = 0.8;
    }
    double v16 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:v15];
    [(UIView *)chartTopKeyline setBackgroundColor:v16];
  }
}

uint64_t __32__StockChartView_setShowingHUD___block_invoke(uint64_t a1)
{
  objc_super v2 = *(void **)(*(void *)(a1 + 32) + 424);
  double v3 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v3 = 1.0;
  }
  [v2 setAlpha:v3];
  id v4 = *(void **)(*(void *)(a1 + 32) + 480);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 40);

  return [v4 setLabelsHidden:v5];
}

- (void)updateHUDView
{
  HUDView = self->_HUDView;
  if (self->_chartData)
  {
    id v6 = [(StockChartView *)self currentDisplayMode];
    if ([v6 HUDEnabled])
    {
      id v4 = [(StockChartView *)self currentGraphView];
      -[ChartHUDView setEnabled:](HUDView, "setEnabled:", [v4 isRendered]);
    }
    else
    {
      [(ChartHUDView *)HUDView setEnabled:0];
    }
  }
  else
  {
    uint64_t v5 = self->_HUDView;
    [(ChartHUDView *)v5 setEnabled:0];
  }
}

- (void)_layoutIntervalButtonRow
{
  [(StockChartView *)self bounds];
  double v4 = v3;
  double v5 = *MEMORY[0x263F001A8];
  id v6 = [MEMORY[0x263F1C920] mainScreen];
  [v6 _referenceBounds];
  double v8 = v7;

  double v9 = [(StockChartView *)self currentDisplayMode];
  [v9 showsTitle];
  if (v10 == 0.0)
  {
    double MaxY = 0.0;
  }
  else
  {
    [(ChartTitleLabel *)self->_titleView frame];
    double MaxY = CGRectGetMaxY(v20);
  }

  [(StockChartView *)self horizontalPadding];
  double v13 = v12;
  BOOL v14 = [(StockChartView *)self isLandscape];
  if (v14) {
    double v15 = v4 + v13 * -2.0;
  }
  else {
    double v15 = v4;
  }
  if (v14) {
    double v16 = v13;
  }
  else {
    double v16 = v5;
  }
  double v17 = 26.0;
  intervalButtonRow = self->_intervalButtonRow;
  if (v8 == 667.0) {
    double v17 = 33.0;
  }

  -[ChartIntervalButtonRow setFrame:](intervalButtonRow, "setFrame:", v16, MaxY, v15, v17);
}

- (void)_layoutVolumeSeparatorLineForGraphRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v9 = [v8 statusBarOrientation];

  [(StockChartView *)self horizontalPadding];
  double v11 = v10;
  v33.origin.double x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v33);
  v34.origin.double x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  double v13 = CGRectGetWidth(v34);
  BOOL v14 = [MEMORY[0x263F1C920] mainScreen];
  [v14 scale];
  double v16 = v15;

  double v17 = [(StockChartView *)self currentDisplayMode];
  [v17 gutterHeight];
  double v19 = v18;
  CGRect v20 = [MEMORY[0x263F1C920] mainScreen];
  [v20 scale];
  double v22 = v21;

  double v23 = 0.0;
  if (v9 == 3) {
    double v23 = v11;
  }
  double v24 = x - v23;
  double v25 = [MEMORY[0x263F1C920] mainScreen];
  [v25 _referenceBounds];
  double v27 = v26;

  double v28 = -0.0;
  if (v27 == 812.0) {
    double v28 = v11;
  }
  -[UIView setFrame:](self->_xAxisKeyline, "setFrame:", v24, MaxY - (v19 + 1.0 / v22), v13 + v28, 1.0 / v16);
  xAxisKeyline = self->_xAxisKeyline;
  id v31 = [(StockChartView *)self currentDisplayMode];
  double v30 = [v31 xAxisKeylineColor];
  [(UIView *)xAxisKeyline setBackgroundColor:v30];
}

- (void)createYLabelsForMode:(id)a3
{
  id v9 = a3;
  double v4 = +[ChartLabelInfoManager chartLabelFont];
  unint64_t v5 = [(NSMutableArray *)self->_yLabelViews count];
  if (v5 < [v9 yAxisLabelCount])
  {
    do
    {
      id v6 = objc_alloc_init(MEMORY[0x263F1C768]);
      [v6 setFont:v4];
      double v7 = [MEMORY[0x263F1C550] clearColor];
      [v6 setBackgroundColor:v7];

      [v6 setTextAlignment:2];
      [(NSMutableArray *)self->_yLabelViews addObject:v6];
      [(StockChartView *)self addSubview:v6];

      unint64_t v8 = [(NSMutableArray *)self->_yLabelViews count];
    }
    while (v8 < [v9 yAxisLabelCount]);
  }
}

- (void)_setMonthAndYearLabels
{
  unsigned int v3 = [(StockChartData *)self->_chartData stockValueCount];
  if (!v3) {
    return;
  }
  unsigned int v4 = v3;
  unint64_t v5 = [(StockChartData *)self->_chartData stockValues];
  id v6 = [MEMORY[0x263EFF8F0] currentCalendar];
  v133 = (void *)[v6 copy];

  double v7 = [(StockChartData *)self->_chartData marketTimeZone];
  [v133 setTimeZone:v7];

  unint64_t v8 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v5->var0];
  id v9 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v5[v4 - 1].var0];
  if ([v9 compare:v8] == -1) {
    goto LABEL_99;
  }
  double v10 = [v133 components:8 fromDate:v8 toDate:v9 options:0];
  uint64_t v11 = [v10 month];
  v113 = v8;
  uint64_t v132 = v11;
  if ([v10 month] >= 25)
  {
    float v12 = (double)[v10 month] / 24.0;
    float v13 = floorf(v12);
    float v14 = 6.0;
LABEL_9:
    float v17 = v13 * v14;
    if (v17 > 12.0) {
      float v17 = 12.0;
    }
    unint64_t v15 = (unint64_t)v17;
    goto LABEL_12;
  }
  if (v11 >= 7)
  {
    float v16 = (double)[v10 month] / 12.0;
    float v13 = ceilf(v16);
    float v14 = 3.0;
    goto LABEL_9;
  }
  unint64_t v15 = 1;
LABEL_12:
  v124 = self;
  v111 = v10;
  unint64_t v18 = [v10 month];
  BOOL v19 = v15 == 1 || v15 == 12;
  unint64_t v129 = v15;
  if (v19) {
    uint64_t v20 = v18 / v15 + 1;
  }
  else {
    uint64_t v20 = v18 / v15;
  }
  uint64_t v21 = 2;
  if (v19) {
    uint64_t v21 = 3;
  }
  uint64_t v110 = v21;
  uint64_t v22 = v20 + 1;
  double v23 = +[ChartLabelInfoManager sharedLabelInfoManager];
  double v24 = [MEMORY[0x263EFF980] arrayWithCapacity:v20 + 2];
  v114 = v23;
  double v25 = [v23 labelInfoForYAxis];
  v128 = v24;
  [v24 addObject:v25];

  v127 = [MEMORY[0x263EFF980] arrayWithCapacity:v22];
  v112 = v9;
  double v26 = [v133 components:8 fromDate:v9];
  uint64_t v27 = v4 - 1;
  if ((int)(v4 - 1) >= 0)
  {
    unsigned int v28 = 0;
    int v29 = 0;
    double v30 = 0;
    id v31 = 0;
    double v32 = 0;
    uint64_t v33 = v27 + 1;
    float v34 = (float)v27;
    p_var0 = &v5[v27].var0;
    while (1)
    {
      double v36 = v32;
      double v37 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:*p_var0];
      double v32 = objc_msgSend(v133, "components:fromDate:", 8);

      uint64_t v38 = [v32 month];
      if (v38 != [v26 month]) {
        break;
      }
LABEL_27:

      p_var0 -= 3;
      double v30 = v37;
      if (v33-- <= 1) {
        goto LABEL_34;
      }
    }
    if (v129 != ++v29)
    {
      if (v28) {
        goto LABEL_26;
      }
      if ([v26 month] != 1 && (objc_msgSend(v26, "month") - 1) % v129)
      {
        unsigned int v28 = 0;
        goto LABEL_26;
      }
    }
    [v127 setObject:v30 atIndexedSubscript:(int)v28];
    double v39 = objc_alloc_init(ChartLabelInfo);

    [(ChartLabelInfo *)v39 setPosition:(float)((float)(int)v33 / v34)];
    [v128 addObject:v39];
    int v29 = 0;
    ++v28;
    id v31 = v39;
LABEL_26:
    id v40 = v32;

    double v26 = v40;
    goto LABEL_27;
  }
  double v32 = 0;
  id v31 = 0;
  double v37 = 0;
  unsigned int v28 = 0;
LABEL_34:

  [(StockChartView *)v124 lineGraphFrame];
  uint64_t v122 = v43;
  double v123 = v42;
  double v45 = v44;
  uint64_t v121 = v46;
  double rect = v44;
  v109 = v37;
  if ((unint64_t)[v128 count] < 2)
  {
    double v120 = 0.0;
  }
  else
  {
    double v47 = objc_msgSend(v128, "objectAtIndexedSubscript:", objc_msgSend(v128, "count") - 2);
    [v47 position];
    double v49 = v48;
    double v50 = objc_msgSend(v128, "objectAtIndexedSubscript:", objc_msgSend(v128, "count") - 1);
    [v50 position];
    double v120 = v45 * (v49 - v51);

    if (v129 == 12 || v129 == 1)
    {
      id v52 = v37;
      if (v129 == 12)
      {
        double v53 = [v133 components:-1 fromDate:v52];
        [v53 setMonth:1];
        uint64_t v54 = [v133 dateFromComponents:v53];

        id v52 = (id)v54;
      }
      [v127 setObject:v52 atIndexedSubscript:(int)v28];
      double v55 = objc_alloc_init(ChartLabelInfo);

      v56 = objc_msgSend(v128, "objectAtIndexedSubscript:", objc_msgSend(v128, "count") - 1);
      [v56 position];
      [(ChartLabelInfo *)v55 setPosition:v57 - v120 / rect];

      [v128 addObject:v55];
      ++v28;

      id v31 = v55;
    }
  }
  double v58 = [(StockChartView *)v124 currentDisplayMode];
  int v59 = [v58 usesDetailedAxisLabels];
  double v60 = 0.015;
  if (v59) {
    double v60 = 0.0199999996;
  }
  float v61 = round(rect * v60);

  double v115 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v116 = *MEMORY[0x263F001A0];
  double v118 = *(double *)(MEMORY[0x263F001A0] + 24);
  double v119 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v62 = v61;
  double v125 = *(double *)(MEMORY[0x263F001B0] + 8);
  double v126 = *MEMORY[0x263F001B0];
  uint64_t v130 = v28;
  uint64_t v63 = 2;
  double v64 = 0.5;
  while (2)
  {
    double v65 = [v114 monthLabelInfoArrayForLabelLength:v63];
    if ((int)v130 < 1)
    {
      double v69 = v116;
      CGFloat v70 = v118;
      CGFloat v134 = v119;
      CGFloat v135 = v115;
      goto LABEL_94;
    }
    uint64_t v117 = v63;
    uint64_t v66 = 0;
    char v67 = 0;
    int v68 = 0;
    double v69 = v116;
    CGFloat v70 = v118;
    CGFloat v134 = v119;
    CGFloat v135 = v115;
    while (1)
    {
      int v71 = v68;
      CGRect v72 = v31;
      CGRect v73 = [v127 objectAtIndexedSubscript:v66];
      CGRect v74 = [v133 components:8 fromDate:v73];
      uint64_t v75 = v66 + 1;
      id v31 = [v128 objectAtIndex:v66 + 1];

      if (v132 < 7) {
        goto LABEL_49;
      }
      if ([v74 month] == 1)
      {
        CGRect v76 = [v133 timeZone];
        [v31 setStringToYearWithDate:v73 timeZone:v76];
        int v68 = 1;
      }
      else
      {
LABEL_49:
        CGRect v76 = objc_msgSend(v65, "objectAtIndex:", (objc_msgSend(v74, "month") - 1) % (unint64_t)objc_msgSend(v65, "count"));
        [v31 retainStringAndSizeFromLabelInfo:v76];
        int v68 = 0;
      }

      [v31 size];
      double v78 = v77;
      CGFloat v80 = v79;
      if (v129 == 1 || v129 == 12)
      {
        double v81 = v120;
        if (!v66)
        {
          objc_msgSend(v31, "position", v120);
          double v81 = rect * (1.0 - v82);
        }
        float v83 = v81 * v64;
        [v31 position];
        double v84 = v123;
        double v85 = rect;
        double v87 = v123 + rect * v86 + v83 - v78 * v64;
      }
      else
      {
        [v31 position];
        double v84 = v123;
        double v85 = rect;
        double v87 = v123 + rect * v88;
      }
      double v89 = v84;
      uint64_t v91 = v121;
      uint64_t v90 = v122;
      if (v78 + v87 > CGRectGetMaxX(*(CGRect *)(&v85 - 2)) || v87 + v78 * v64 < v62)
      {
        [v31 setString:&stru_26D5DA820];
        objc_msgSend(v31, "setSize:", v126, v125);
        CGFloat v80 = v118;
        double v78 = v119;
      }
      v93 = [(StockChartView *)v124 currentDisplayMode];
      int v94 = [v93 usesDetailedAxisLabels];
      double v95 = 6.0;
      if (v94) {
        double v95 = 10.0;
      }
      double v96 = 4.0;
      if ((v71 & (v68 ^ 1)) == 0) {
        double v96 = 0.0;
      }
      double v97 = v96 + v95;

      double v98 = fmax(round(v87), 0.0);
      v137.origin.double x = v69;
      v137.size.CGFloat width = v134;
      v137.origin.CGFloat y = v135;
      v137.size.CGFloat height = v70;
      if (CGRectIsEmpty(v137))
      {
        BOOL v99 = 0;
      }
      else
      {
        v138.origin.CGFloat y = 0.0;
        v138.origin.double x = v98;
        v138.size.CGFloat width = v78;
        v138.size.CGFloat height = v80;
        BOOL v99 = v97 + CGRectGetMaxX(v138) > v69;
      }
      BOOL v100 = v66 == 1 && v99;
      v67 |= v100;
      int v101 = v99 ^ v100;
      double v64 = 0.5;
      if (v98 >= v62) {
        break;
      }
      if (v101)
      {
        int v101 = 1;
LABEL_78:
        double v98 = v62;
        if (v101 && v132 <= 6)
        {
          [v31 setString:&stru_26D5DA820];
          objc_msgSend(v31, "setSize:", v126, v125);
          double v98 = v62;
          goto LABEL_82;
        }
        break;
      }
      v139.origin.double x = v69;
      v139.size.CGFloat width = v134;
      v139.origin.CGFloat y = v135;
      v139.size.CGFloat height = v70;
      if (!CGRectIsNull(v139))
      {
        v140.origin.CGFloat y = 0.0;
        v140.origin.double x = v62;
        v140.size.CGFloat width = v78;
        v140.size.CGFloat height = v80;
        int v101 = v97 + CGRectGetMaxX(v140) > v69;
        goto LABEL_78;
      }
      CGFloat v134 = v78;
      CGFloat v135 = 0.0;
      CGFloat v70 = v80;
      double v69 = v62;
LABEL_86:

      uint64_t v66 = v75;
      if (v130 == v75)
      {
        uint64_t v63 = v117;
        if ((v67 & 1) == 0) {
          goto LABEL_94;
        }
        goto LABEL_91;
      }
    }
    if (!v101) {
      goto LABEL_85;
    }
LABEL_82:
    v102 = [v31 string];
    uint64_t v103 = [v102 length];

    if (!v103)
    {
LABEL_85:
      CGFloat v134 = v78;
      CGFloat v135 = 0.0;
      CGFloat v70 = v80;
      double v69 = v98;
      goto LABEL_86;
    }
    uint64_t v63 = v117;
    if (!v117)
    {
      [v31 setString:&stru_26D5DA820];
      objc_msgSend(v31, "setSize:", v126, v125);
      goto LABEL_86;
    }

    double v69 = v116;
    CGFloat v70 = v118;
    CGFloat v134 = v119;
    CGFloat v135 = v115;
    if ((v67 & 1) == 0)
    {
      CGFloat v135 = v115;
      CGFloat v134 = v119;
      CGFloat v70 = v118;
      double v69 = v116;
      goto LABEL_95;
    }
LABEL_91:
    v141.origin.double x = v69;
    v141.size.CGFloat width = v134;
    v141.origin.CGFloat y = v135;
    v141.size.CGFloat height = v70;
    if (!CGRectIsNull(v141) && (unint64_t)[v128 count] >= 2)
    {
      v104 = [v128 objectAtIndexedSubscript:1];
      [v104 setString:&stru_26D5DA820];
      objc_msgSend(v104, "setSize:", v126, v125);
    }
LABEL_94:
    if (v63)
    {
LABEL_95:
      v142.origin.double x = v69;
      v142.size.CGFloat width = v134;
      v142.origin.CGFloat y = v135;
      v142.size.CGFloat height = v70;
      if (CGRectIsNull(v142))
      {

        --v63;
        continue;
      }
    }
    break;
  }
  chartData = v124->_chartData;
  v106 = [(StockChartView *)v124 currentDisplayMode];
  [(StockChartData *)chartData setXAxisLabelInfoArray:v128 forDisplayMode:v106];

  v107 = v124->_chartData;
  v108 = [(StockChartView *)v124 currentDisplayMode];
  [(StockChartData *)v107 setLabelPlacement:v110 forDisplayMode:v108];

  id v9 = v112;
  unint64_t v8 = v113;
LABEL_99:
}

- (void)_setDayLabelsWithInterval:(unsigned int)a3 realTimePositions:(BOOL)a4
{
  BOOL v80 = a4;
  uint64_t v95 = *MEMORY[0x263EF8340];
  double v77 = [(StockChartData *)self->_chartData marketTimeZone];
  uint64_t v6 = [v77 secondsFromGMT];
  unsigned int v79 = a3;
  uint64_t v7 = 2;
  if (a3 == 1) {
    uint64_t v7 = 3;
  }
  uint64_t v76 = v7;
  unint64_t v8 = +[ChartLabelInfoManager sharedLabelInfoManager];
  uint64_t v9 = [MEMORY[0x263EFF980] array];
  double v81 = v8;
  double v82 = (void *)v9;
  if (self->_selectedInterval == 1
    && (double v10 = (void *)v9,
        [v8 labelInfoForYAxis],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        [v10 addObject:v11],
        v11,
        self->_selectedInterval == 1))
  {
    double v86 = [MEMORY[0x263EFF980] array];
  }
  else
  {
    double v86 = 0;
  }
  unsigned int v12 = [(StockChartData *)self->_chartData stockValueCount];
  float v13 = [(StockChartData *)self->_chartData stockValues];
  float v14 = [MEMORY[0x263EFF8F0] currentCalendar];
  unint64_t v15 = (void *)[v14 copy];

  [v15 setTimeZone:v77];
  if (v12)
  {
    unsigned int v87 = 0;
    uint64_t v84 = 0;
    double v85 = 0;
    uint64_t v16 = 0;
    float v83 = 0;
    uint64_t v17 = v12 - 1;
    double v18 = (double)v6;
    p_long double var0 = &v13[v17].var0;
    uint64_t v20 = 0xFFFFFFFFLL;
    double v78 = v15;
    while (1)
    {
      uint64_t v21 = (void *)v16;
      uint64_t v16 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:*p_var0];

      uint64_t v22 = [v15 components:24 fromDate:v16];
      uint64_t v23 = (int)((*p_var0 + v18) / 86400.0);
      if (v20 == v23)
      {
        uint64_t v23 = v20;
      }
      else
      {
        double v88 = (void *)v16;
        double v24 = v15;
        if (v20 == -1) {
          int v25 = 0;
        }
        else {
          int v25 = v20 - v23;
        }
        if (v25 >= 1 && v86 != 0)
        {
          uint64_t v27 = [NSNumber numberWithUnsignedInt:v17];
          [v86 addObject:v27];
        }
        if (v25 > (uint64_t)v87 || v87 == v25)
        {
          if (v84)
          {
            int v29 = [(StockChartView *)self currentDisplayMode];
            if (![v29 usesDetailedAxisLabels]) {
              goto LABEL_28;
            }
            uint64_t v30 = [v22 month];

            if (v30 != v84)
            {
              int v29 = [v82 lastObject];
              [v29 setStringToMonthAndDayWithDate:v85 timeZone:v77];
LABEL_28:
            }
          }
          id v31 = objc_msgSend(v81, "labelInfoWithUnsignedInteger:", objc_msgSend(v22, "day"));
          double v32 = (void *)[v31 copy];

          double v33 = -1.0;
          if (v80) {
            double v33 = (float)((float)v17
          }
                        / (float)([(StockChartData *)self->_chartData stockValueCount] - 1));
          [v32 setPosition:v33];
          [v82 addObject:v32];
          uint64_t v84 = [v22 month];
          uint64_t v16 = (uint64_t)v88;
          id v34 = v88;

          float v83 = v32;
          double v85 = v34;
          unsigned int v87 = v79;
          unint64_t v15 = v78;
          goto LABEL_32;
        }
        v87 -= v25;
        unint64_t v15 = v24;
        uint64_t v16 = (uint64_t)v88;
      }
LABEL_32:

      p_var0 -= 3;
      uint64_t v17 = (v17 - 1);
      uint64_t v20 = v23;
      if (v17 == -1) {
        goto LABEL_35;
      }
    }
  }
  float v83 = 0;
  uint64_t v16 = 0;
  double v85 = 0;
LABEL_35:
  double v89 = (void *)v16;
  uint64_t v35 = [v82 count];
  if (v35)
  {
    uint64_t v36 = 0;
    unint64_t v37 = v35 - 1;
    float v38 = (float)(unint64_t)(v35 - 1);
    do
    {
      double v39 = [v82 objectAtIndexedSubscript:v36];
      [v39 position];
      if (v40 == -1.0) {
        [v39 setPosition:(float)((float)v37 / v38)];
      }

      ++v36;
      --v37;
    }
    while (v37 != -1);
  }
  double v41 = [(StockChartView *)self currentDisplayMode];
  char v42 = [v41 usesDetailedAxisLabels];

  if (v42)
  {
    uint64_t v43 = [v82 lastObject];
    [v43 setStringToMonthAndDayWithDate:v85 timeZone:v77];
  }
  chartData = self->_chartData;
  double v45 = [(StockChartView *)self currentDisplayMode];
  [(StockChartData *)chartData setXAxisLabelInfoArray:v82 forDisplayMode:v45];

  uint64_t v46 = self->_chartData;
  double v47 = [(StockChartView *)self currentDisplayMode];
  [(StockChartData *)v46 setLabelPlacement:v76 forDisplayMode:v47];

  if (v86 && [(StockChartData *)self->_chartData stockValueCount] >= 6)
  {
    double v48 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v86, "count"));
    if (v48 && self->_selectedInterval == 1)
    {
      double v49 = [(StockChartData *)self->_chartData stockValues];
      long double var0 = v49[[(StockChartData *)self->_chartData stockValueCount] - 1].var0;
      double v51 = [(StockChartData *)self->_chartData marketCloseDate];
      [v51 timeIntervalSince1970];
      double v53 = fmod(v52, 86400.0);
      double v54 = (v53 - fmod(var0, 86400.0)) / 60.0;

      double v55 = 1.0;
      if (v54 > 20.0)
      {
        v56 = [MEMORY[0x263EFF8F0] currentCalendar];
        double v57 = (void *)[v56 copy];

        double v58 = [(StockChartData *)self->_chartData marketTimeZone];
        [v57 setTimeZone:v58];

        int v59 = [(StockChartData *)self->_chartData marketOpenDate];
        double v60 = [v57 components:96 fromDate:v59];

        float v61 = [(StockChartData *)self->_chartData marketCloseDate];
        double v62 = [v57 components:96 fromDate:v61];

        float v63 = (float)[v62 hour];
        float v64 = (float)[v62 minute] + (float)(v63 * 60.0);
        float v65 = (float)[v60 hour];
        double v66 = v54 / (float)(v64 - (float)((float)[v60 minute] + (float)(v65 * 60.0)));
        double v55 = 1.0 - v66 / (double)(unint64_t)([v86 count] + 1);
      }
      char v67 = [NSNumber numberWithDouble:v55];
      [v48 addObject:v67];
    }
  }
  else
  {
    double v48 = 0;
  }
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id v68 = v86;
  uint64_t v69 = [v68 countByEnumeratingWithState:&v90 objects:v94 count:16];
  if (v69)
  {
    uint64_t v70 = v69;
    uint64_t v71 = *(void *)v91;
    do
    {
      for (uint64_t i = 0; i != v70; ++i)
      {
        if (*(void *)v91 != v71) {
          objc_enumerationMutation(v68);
        }
        CGRect v73 = NSNumber;
        [*(id *)(*((void *)&v90 + 1) + 8 * i) doubleValue];
        uint64_t v75 = objc_msgSend(v73, "numberWithDouble:", v74 / ((double)-[StockChartData stockValueCount](self->_chartData, "stockValueCount") + -1.0));
        [v48 insertObject:v75 atIndex:0];
      }
      uint64_t v70 = [v68 countByEnumeratingWithState:&v90 objects:v94 count:16];
    }
    while (v70);
  }

  [(StockChartData *)self->_chartData setInterestingIndexes:v48];
}

- (void)_setHourLabels
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  unsigned int v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  unsigned int v4 = (void *)[v3 copy];

  unint64_t v5 = [(StockChartData *)self->_chartData marketTimeZone];
  [v4 setTimeZone:v5];

  uint64_t v6 = [(StockChartData *)self->_chartData marketOpenDate];
  uint64_t v7 = [(StockChartData *)self->_chartData marketCloseDate];
  j = [v4 components:96 fromDate:v6 toDate:v7 options:0];

  uint64_t v9 = [(StockChartData *)self->_chartData marketOpenDate];
  double v10 = [v4 components:96 fromDate:v9];

  uint64_t v11 = [(StockChartData *)self->_chartData marketCloseDate];
  unsigned int v12 = [v4 components:96 fromDate:v11];

  uint64_t v13 = [v10 minute];
  if (v13) {
    float v14 = 1.0 - (float)((float)v13 / 60.0);
  }
  else {
    float v14 = 0.0;
  }
  float v15 = (float)[v12 minute] / 60.0;
  uint64_t v16 = [j hour];
  float v17 = ceilf(v14);
  *(float *)&double v18 = v15 + v14;
  uint64_t v19 = (uint64_t)(float)(v17 + (float)v16) - ((float)(v15 + v14) >= 1.0);
  uint64_t v20 = +[ChartLabelInfoManager sharedLabelInfoManager];
  if (v19 <= 1) {
    uint64_t v21 = 1;
  }
  else {
    uint64_t v21 = v19;
  }
  uint64_t v22 = [MEMORY[0x263EFF980] arrayWithCapacity:v21];
  if ((unint64_t)(v19 - 25) > 0xFFFFFFFFFFFFFFE7)
  {
    double v55 = j;
    v56 = self;
    double v54 = v12;
    uint64_t v26 = [v12 hour];
    uint64_t v27 = -v26;
    uint64_t v53 = v19;
    do
    {
      uint64_t v28 = (v26 & ~(v26 >> 63)) + v27;
      BOOL v29 = v28 != 0;
      unint64_t v30 = ((unint64_t)(v28 - v29) * (unsigned __int128)0xAAAAAAAAAAAAAAABLL) >> 64;
      unint64_t v31 = (v28 - v29) / 0x18uLL;
      if ((v26 & ~(v26 >> 63)) + v27) {
        unint64_t v32 = v31 + 1;
      }
      else {
        unint64_t v32 = v30 >> 4;
      }
      if (objc_msgSend(v20, "use24hrTime", v53))
      {
        uint64_t v33 = v26 + 24 * v32;
      }
      else if (v26 + 24 * (v29 + (v30 >> 4)) - 12 * ((v26 + 24 * (v29 + (v30 >> 4))) / 0xC))
      {
        uint64_t v33 = v26 + 24 * (v29 + (v30 >> 4)) - 12 * ((v26 + 24 * (v29 + (v30 >> 4))) / 0xC);
      }
      else
      {
        uint64_t v33 = 12;
      }
      id v34 = [v20 labelInfoWithUnsignedInteger:v33];
      uint64_t v35 = (void *)[v34 copy];
      [v22 addObject:v35];

      --v26;
      ++v27;
      --v19;
    }
    while (v19);
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v36 = v22;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v57 objects:v61 count:16];
    unsigned int v12 = v54;
    if (v37)
    {
      uint64_t v38 = v37;
      float v39 = 1.0 / (float)(v15 + (float)(v14 + (float)((float)v53 - v17)));
      float v40 = 1.0 - (float)(v39 * v15);
      uint64_t v41 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v58 != v41) {
            objc_enumerationMutation(v36);
          }
          [*(id *)(*((void *)&v57 + 1) + 8 * i) setPosition:v40];
          float v40 = v40 - v39;
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v57 objects:v61 count:16];
      }
      while (v38);
    }

    if (v53 < 13)
    {
      LODWORD(v46) = 0;
      j = v55;
    }
    else
    {
      id v43 = objc_alloc_init(MEMORY[0x263F089C8]);
      double v44 = [v36 objectAtIndex:0];
      double v45 = [v44 string];
      uint64_t v46 = [v45 integerValue] & 1;

      unint64_t v47 = v46 ^ 1;
      for (j = v55; [v36 count] > v47; v47 += 2)
        [v43 addIndex:v47];
      [v36 removeObjectsAtIndexes:v43];
    }
    if (v15 > 0.0 || v46)
    {
      double v48 = [v20 labelInfoForYAxis];
      [v36 insertObject:v48 atIndex:0];
    }
    chartData = v56->_chartData;
    double v50 = [(StockChartView *)v56 currentDisplayMode];
    [(StockChartData *)chartData setXAxisLabelInfoArray:v36 forDisplayMode:v50];

    double v51 = v56->_chartData;
    long double v52 = [(StockChartView *)v56 currentDisplayMode];
    [(StockChartData *)v51 setLabelPlacement:2 forDisplayMode:v52];
  }
  else
  {
    uint64_t v23 = [v20 labelInfoForYAxis];
    [v22 addObject:v23];

    double v24 = self->_chartData;
    int v25 = [(StockChartView *)self currentDisplayMode];
    [(StockChartData *)v24 setXAxisLabelInfoArray:v22 forDisplayMode:v25];
  }
}

- (void)_prepareXAxisLabelsAndPositions
{
  if ([(StockChartData *)self->_chartData stockValueCount])
  {
    chartData = self->_chartData;
    unsigned int v4 = [(StockChartView *)self currentDisplayMode];
    unint64_t v5 = [(StockChartData *)chartData xAxisLabelInfoArrayForMode:v4];
    uint64_t v6 = [v5 count];

    if (!v6)
    {
      switch(self->_selectedInterval)
      {
        case 0:
          [(StockChartView *)self _setHourLabels];
          break;
        case 1:
          uint64_t v7 = self;
          uint64_t v8 = 1;
          uint64_t v9 = 0;
          goto LABEL_13;
        case 2:
          uint64_t v7 = self;
          uint64_t v8 = 7;
          uint64_t v9 = 1;
LABEL_13:
          [(StockChartView *)v7 _setDayLabelsWithInterval:v8 realTimePositions:v9];
          break;
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
          [(StockChartView *)self _setMonthAndYearLabels];
          break;
        default:
          return;
      }
    }
  }
}

- (double)_evennessOfValue:(double)a3 inRange:(double)a4
{
  double result = 1.0;
  if (a3 == 0.0) {
    return result;
  }
  float v7 = 0.0;
  if (fmod(a3, 10.0) == 0.0)
  {
    do
    {
      float v7 = v7 + 1.0;
      a3 = a3 / 10.0;
    }
    while (fmod(a3, 10.0) == 0.0);
  }
  else
  {
    do
    {
      do
      {
        float v7 = v7 + -1.0;
        a3 = a3 * 10.0;
        double v8 = fmod(a3, 10.0);
      }
      while (v8 < 0.0);
    }
    while (v8 > 0.0);
    float v7 = v7 + 1.0;
    a3 = a3 / 10.0;
  }
  if (fabs(fmod(a3, 25.0)) < 0.001)
  {
    float v9 = 1.0;
LABEL_14:
    float v7 = v7 + v9;
    goto LABEL_15;
  }
  if (fabs(fmod(a3, 5.0)) < 0.001)
  {
    float v7 = v7 + 0.9;
    goto LABEL_15;
  }
  if (fabs(fmod(a3, 2.0)) < 0.001)
  {
    float v9 = 0.25;
    goto LABEL_14;
  }
LABEL_15:
  double v10 = floor(log10(a4));
  double v11 = v7;
  if (v10 >= v7) {
    return 1.0 / (vabdd_f64(v10, v11) + 1.0);
  }
  double v12 = v11 - v10;
  if (v12 > 0.8) {
    double v12 = 0.8;
  }
  return v12 * 0.5 + 0.85;
}

- (void)_prepareYAxisLabelsAndPositionsForDisplayMode:(id)a3
{
  id v43 = a3;
  unsigned int v4 = [(StockChartView *)self graphViewForMode:v43];
  unint64_t v5 = [(StockChartData *)self->_chartData yAxisLabelInfoArrayForMode:v43];
  if (![(StockChartData *)self->_chartData stockValueCount])
  {
LABEL_4:
    if (self->_chartData && [v43 horizontalGridlineCount])
    {
      uint64_t v6 = [v43 horizontalGridlineCount];
      if (v6 == [v43 yAxisLabelCount]) {
        [v4 setDottedLinePositionsWithLabelInfo:v5];
      }
      else {
        objc_msgSend(v4, "setEvenlySpacedDottedLinePositionsWithCount:", objc_msgSend(v43, "horizontalGridlineCount"));
      }
    }
    goto LABEL_51;
  }
  if (self->_chartData)
  {
    if ([v5 count]) {
      goto LABEL_4;
    }
    chartData = self->_chartData;
  }
  else
  {
    chartData = 0;
  }
  float v8 = (double)[(StockChartData *)chartData minValue][8];
  float v9 = (double)[(StockChartData *)self->_chartData maxValue][8];
  [(StockChartData *)self->_chartData previousClosePrice];
  if (v10 != 0.0)
  {
    float v11 = v10;
    int64_t v12 = [(StockChartData *)self->_chartData chartInterval];
    float v13 = v11 <= v8 ? v11 : v8;
    float v14 = v11 <= v9 ? v9 : v11;
    if (!v12)
    {
      float v9 = v14;
      float v8 = v13;
    }
  }
  float v15 = v9 - v8;
  int v16 = [v43 yAxisLabelCount];
  int v17 = v16 - 1;
  double v18 = (float)(v9 - v8) / (double)(v16 - 1);
  int v19 = [v43 usesDetailedAxisLabels];
  float v20 = 1.0;
  if (v19) {
    float v20 = 1.5;
  }
  BOOL v21 = v18 < (float)(v20 + v20) || v9 < (float)(v20 * 100.0);
  if (v21)
  {
    if (v18 >= 0.0199999996) {
      unsigned int v22 = 2;
    }
    else {
      unsigned int v22 = 3;
    }
    unsigned int v23 = [(Stock *)self->_stock pricePrecision];
    if (v22 <= v23) {
      uint64_t v24 = v23;
    }
    else {
      uint64_t v24 = v22;
    }
  }
  else
  {
    uint64_t v24 = 0;
  }
  [(StockChartData *)self->_chartData setYAxisFractionDigits:v24];
  int v25 = [MEMORY[0x263EFF980] arrayWithCapacity:v16];
  if (v16)
  {
    double v42 = v15 / (double)v17;
    float v40 = v5;
    uint64_t v41 = v4;
    unsigned int v26 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    float v29 = (float)v17;
    int v30 = -v16;
    double v31 = 0.0;
    do
    {
      if (objc_msgSend(v43, "usesDetailedAxisLabels", v40, v41))
      {
        float v34 = v8;
        if (v26)
        {
          double v33 = v8 + v31 * v42;
          *(float *)&double v33 = v33;
          if (v30 + v26 == -1) {
            float v34 = v9;
          }
          else {
            float v34 = *(float *)&v33;
          }
        }
      }
      else
      {
        float v34 = v8 + (float)(v15 * (float)((float)v26 / v29));
      }
      if (v21)
      {
        *(float *)&double v33 = v34;
        [NSNumber numberWithFloat:v33];
      }
      else
      {
        LODWORD(v32) = llroundf(v34);
        [NSNumber numberWithInt:v32];
      uint64_t v35 = };

      id v36 = objc_alloc_init(ChartLabelInfo);
      [(ChartLabelInfo *)v36 setPosition:(float)((float)(v34 - v8) / v15)];
      uint64_t v37 = +[StockDataFormatter sharedDataFormatter];
      uint64_t v38 = objc_msgSend(v37, "formattedNumber:withPrecision:useGroupSeparator:", v35, -[StockChartData yAxisFractionDigits](self->_chartData, "yAxisFractionDigits"), 1);
      [(ChartLabelInfo *)v36 setString:v38];

      [v25 addObject:v36];
      double v31 = v31 + 1.0;
      ++v26;
      uint64_t v27 = v35;
      uint64_t v28 = v36;
    }
    while (v30 + v26);

    unint64_t v5 = v40;
    unsigned int v4 = v41;
  }
  if ([v43 horizontalGridlineCount])
  {
    uint64_t v39 = [v43 horizontalGridlineCount];
    if (v39 == [v43 yAxisLabelCount]) {
      [v4 setDottedLinePositionsWithLabelInfo:v25];
    }
    else {
      objc_msgSend(v4, "setEvenlySpacedDottedLinePositionsWithCount:", objc_msgSend(v43, "horizontalGridlineCount"));
    }
  }
  [(StockChartData *)self->_chartData setYAxisLabelInfoArray:v25 forDisplayMode:v43];

LABEL_51:
}

- (void)_layoutYLabels
{
  chartData = self->_chartData;
  unsigned int v4 = [(StockChartView *)self currentDisplayMode];
  id v76 = [(StockChartData *)chartData yAxisLabelInfoArrayForMode:v4];

  uint64_t v74 = [v76 count];
  if (!v74) {
    goto LABEL_42;
  }
  unint64_t v5 = [(StockChartView *)self currentGraphView];
  [v5 frame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  [(StockChartView *)self lineGraphFrame];
  double y = v86.origin.y;
  double height = v86.size.height;
  double MaxX = CGRectGetMaxX(v86);
  int v16 = [(StockChartView *)self currentDisplayMode];
  if ([v16 graphOverlapsYAxisLabels])
  {
    double v17 = MaxX + -4.0;
  }
  else
  {
    v87.origin.double x = v7;
    v87.origin.double y = v9;
    v87.size.CGFloat width = v11;
    v87.size.double height = v13;
    double v17 = CGRectGetMaxX(v87);
  }
  double v81 = v17;

  double v18 = +[ChartLabelInfoManager chartLabelFont];
  [v18 leading];
  double v20 = v19;

  BOOL v21 = [(StockChartView *)self currentDisplayMode];
  uint64_t v22 = [v21 yAxisLabelCount];

  double v23 = ceil(v20);
  double v24 = v22 == 2 ? 0.0 : v23;
  uint64_t v25 = [(NSMutableArray *)self->_yLabelViews count];
  if (!v25) {
    goto LABEL_42;
  }
  uint64_t v26 = v25;
  CGFloat v71 = v7;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  unint64_t v30 = 0;
  double v73 = y - v24;
  double v31 = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat rect2 = *(double *)(MEMORY[0x263F001A8] + 24);
  double v32 = v9;
  double v34 = *MEMORY[0x263F001A8];
  double v33 = *(double *)(MEMORY[0x263F001A8] + 8);
  float v79 = (float)(v25 - v74);
  float v72 = (float)(unint64_t)(v25 - 1);
  double v69 = v32 + 15.0;
  CGFloat v70 = v32;
  double v77 = *(double *)(MEMORY[0x263F00148] + 8);
  double v78 = *MEMORY[0x263F00148];
  double v80 = v11;
  do
  {
    CGFloat v35 = v13;
    double v36 = (double)v30;
    double v37 = roundf((float)((float)(unint64_t)(v29 + 1) / v79) * (float)(unint64_t)(v74 - 1 + v29));
    uint64_t v38 = [(NSMutableArray *)self->_yLabelViews objectAtIndex:v30];

    if (v37 == (double)v30) {
      uint64_t v39 = v29 + 1;
    }
    else {
      uint64_t v39 = v29;
    }
    uint64_t v27 = (void *)v38;
    CGFloat v82 = v31;
    if (v37 == v36)
    {

      double v83 = v81 - v31;
      double v43 = rect2;
    }
    else
    {
      float v40 = [v76 objectAtIndex:v30 - v29];

      [v40 size];
      double v31 = v41;
      double v43 = v42;
      double v83 = v81 - v41;
      if (v74 == 2)
      {
        if (v30 == v29)
        {
          v88.origin.double y = v70;
          v88.origin.double x = v71;
          v88.size.CGFloat width = v11;
          CGFloat v13 = v35;
          v88.size.double height = v35;
          double MaxY = CGRectGetMaxY(v88);
          double v45 = [(StockChartView *)self currentDisplayMode];
          [v45 gutterHeight];
          double v47 = MaxY - v46;
          double v48 = [MEMORY[0x263F1C920] mainScreen];
          [v48 scale];
          double v50 = v47 + -1.0 / v49 + -4.0;
          double v51 = [v27 font];
          [v51 ascender];
          double v53 = RoundToPixel(v50 - v52);
        }
        else
        {
          double v45 = [v27 font];
          [v45 ascender];
          double v53 = RoundToPixel(v69 - v57);
          CGFloat v13 = v35;
        }
        double v55 = v83;

        goto LABEL_26;
      }
      if (v40)
      {
        [v40 position];
        goto LABEL_21;
      }
    }
    float v40 = 0;
    double v54 = (float)((float)v30 / v72);
LABEL_21:
    double v53 = RoundToPixel(v73 + height * (1.0 - v54));
    if (v37 != v36)
    {
      CGFloat v13 = v35;
      double v55 = v83;
LABEL_26:
      v89.origin.double x = v55;
      v89.origin.double y = v53;
      v89.size.CGFloat width = v31;
      v89.size.double height = v43;
      v90.origin.double x = v34;
      v90.origin.double y = v33;
      v90.size.CGFloat width = v82;
      v90.size.double height = rect2;
      BOOL v56 = CGRectIntersectsRect(v89, v90);
      uint64_t v28 = v40;
      goto LABEL_27;
    }
    BOOL v56 = 1;
    uint64_t v28 = v40;
    CGFloat v13 = v35;
    double v55 = v83;
LABEL_27:
    [v27 bounds];
    double v59 = v58;
    if (!v56 || v31 > v58)
    {
      uint64_t v60 = [MEMORY[0x263F1CB60] areAnimationsEnabled];
      [MEMORY[0x263F1CB60] setAnimationsEnabled:0];
      [v27 center];
      [v27 setCenter:v61 + (v31 - v59) * 0.5];
      objc_msgSend(v27, "setBounds:", 0.0, 0.0, v31, v43);
      [MEMORY[0x263F1CB60] setAnimationsEnabled:v60];
    }
    [v27 bounds];
    double v31 = v62;
    double v64 = v63;
    float v65 = [(StockChartView *)self currentDisplayMode];
    double v66 = [v65 axisLabelsColor];
    [v27 setTextColor:v66];

    CGFloat rect2 = v64;
    objc_msgSend(v27, "setFrame:", v55, v53, v31, v64);
    [v27 setAlpha:(double)!v56];
    if (!v56)
    {
      char v67 = [v28 string];
      [v27 setText:v67];
    }
    [v27 setHidden:0];
    id v68 = [v27 superview];

    if (!v68) {
      [(StockChartView *)self addSubview:v27];
    }
    if (v56) {
      double v34 = v78;
    }
    else {
      double v34 = v55;
    }
    if (v56) {
      double v33 = v77;
    }
    else {
      double v33 = v53;
    }
    ++v30;
    uint64_t v29 = v39;
    CGFloat v11 = v80;
  }
  while (v26 != v30);

LABEL_42:
}

- (void)_layoutAxesAndXLabels
{
  uint64_t v116 = *MEMORY[0x263EF8340];
  unsigned int v3 = [(StockChartView *)self currentGraphView];
  [v3 frame];
  double rect = v4;

  [(StockChartView *)self lineGraphFrame];
  double v6 = v5;
  CGFloat v98 = v8;
  CGFloat v99 = v7;
  double v10 = v9;
  chartData = self->_chartData;
  double v12 = [(StockChartView *)self currentDisplayMode];
  uint64_t v95 = [(StockChartData *)chartData labelPlacementForDisplayMode:v12];

  CGFloat v13 = self->_chartData;
  float v14 = [(StockChartView *)self currentDisplayMode];
  float v15 = [(StockChartData *)v13 xAxisLabelInfoArrayForMode:v14];

  unint64_t v16 = [v15 count];
  long long v93 = [(StockChartView *)self currentGraphView];
  while ([(NSMutableArray *)self->_axisViews count] < v16)
  {
    id v17 = objc_alloc_init(MEMORY[0x263F1CB60]);
    [(NSMutableArray *)self->_axisViews addObject:v17];
  }
  if ([(NSMutableArray *)self->_axisViews count] > v16)
  {
    double v18 = -[NSMutableArray subarrayWithRange:](self->_axisViews, "subarrayWithRange:", v16, [(NSMutableArray *)self->_axisViews count] - v16);
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v109 objects:v115 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v110;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v110 != v21) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v109 + 1) + 8 * i) setHidden:1];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v109 objects:v115 count:16];
      }
      while (v20);
    }
    [(NSMutableArray *)self->_axisViews removeObjectsInArray:v18];
  }
  if (v16)
  {
    uint64_t v23 = +[ChartLabelInfoManager chartLabelFont];
    while ([(NSMutableArray *)self->_xLabelViews count] < v16)
    {
      id v24 = objc_alloc_init(MEMORY[0x263F1C768]);
      [v24 setFont:v23];
      uint64_t v25 = [MEMORY[0x263F1C550] clearColor];
      [v24 setBackgroundColor:v25];

      [(NSMutableArray *)self->_xLabelViews addObject:v24];
    }
    if ([(NSMutableArray *)self->_xLabelViews count] > v16)
    {
      uint64_t v26 = -[NSMutableArray subarrayWithRange:](self->_xLabelViews, "subarrayWithRange:", v16, [(NSMutableArray *)self->_xLabelViews count] - v16);
      long long v105 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v105 objects:v114 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v106;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v106 != v29) {
              objc_enumerationMutation(v26);
            }
            [*(id *)(*((void *)&v105 + 1) + 8 * j) setHidden:1];
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v105 objects:v114 count:16];
        }
        while (v28);
      }
      [(NSMutableArray *)self->_xLabelViews removeObjectsInArray:v26];
    }
    uint64_t v89 = v23;
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    double v31 = self->_xLabelViews;
    uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v101 objects:v113 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v102;
      do
      {
        for (uint64_t k = 0; k != v33; ++k)
        {
          if (*(void *)v102 != v34) {
            objc_enumerationMutation(v31);
          }
          double v36 = *(void **)(*((void *)&v101 + 1) + 8 * k);
          double v37 = [(StockChartView *)self currentDisplayMode];
          uint64_t v38 = [v37 axisLabelsColor];
          [v36 setTextColor:v38];
        }
        uint64_t v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v101 objects:v113 count:16];
      }
      while (v33);
    }

    if (v16 <= 1)
    {
      double v45 = 0.0;
    }
    else
    {
      uint64_t v39 = [v15 objectAtIndexedSubscript:v16 - 2];
      [v39 position];
      double v41 = v40;
      double v42 = [v15 objectAtIndexedSubscript:v16 - 1];
      [v42 position];
      float v44 = v10 * (v41 - v43);

      double v45 = v44;
    }
    float v46 = round(v10 * 0.015);
    [(UIView *)self->_xAxisKeyline frame];
    double MaxY = CGRectGetMaxY(v117);
    uint64_t v48 = 0;
    unsigned int v49 = 0;
    double v50 = 0;
    double v91 = v6 + v45;
    double v92 = v45;
    double v94 = v46;
    unint64_t v51 = 0x263F1C000uLL;
    double v52 = 0.0;
    CGFloat v96 = v10;
    CGFloat v97 = v6;
    do
    {
      double v53 = v50;
      double v50 = [v15 objectAtIndex:v48];

      [v50 position];
      float v55 = v54;
      float v56 = round(v6 + v10 * v55);
      double v57 = [(NSMutableArray *)self->_xLabelViews objectAtIndex:v48];
      double v58 = [v57 font];
      [v58 ascender];
      double v60 = RoundToPixel(v59);

      double v61 = v56;
      double v62 = [*(id *)(v51 + 2336) mainScreen];
      [v62 scale];
      double v64 = v63;

      if (v49)
      {
        float v65 = [*(id *)(v51 + 2336) mainScreen];
        [v65 scale];
        double v61 = v61 + -1.0 / v66 * 0.5;
      }
      double v67 = MaxY;
      double v68 = MaxY + v60 - rect;
      double v69 = 1.0 / v64;
      CGFloat v70 = [(NSMutableArray *)self->_axisViews objectAtIndex:v48];
      float v71 = 1.0 - v55;
      if ((float)(1.0 - v55) > v55) {
        float v71 = v55;
      }
      BOOL v72 = v71 >= 0.02 || v49 == 0;
      uint64_t v73 = !v72;
      if (v72)
      {
        uint64_t v74 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.2];
        [v70 setBackgroundColor:v74];

        objc_msgSend(v70, "setFrame:", v61, rect, 1.0 / v64, v68);
        uint64_t v75 = [v70 superview];

        if (!v75) {
          [(StockChartView *)self insertSubview:v70 belowSubview:v93];
        }
      }
      [v70 setHidden:v73];
      [v50 size];
      double v77 = v76;
      double v79 = v78;
      switch(v95)
      {
        case 3:
          if (v49 == 1)
          {
            v120.size.CGFloat width = v96;
            v120.origin.double x = v97;
            v120.size.double height = v98;
            v120.origin.double y = v99;
            double v80 = CGRectGetMaxX(v120) - v61;
          }
          else
          {
            double v80 = v91 - v61;
            if (v16 - 1 != v48) {
              double v80 = v92;
            }
          }
          float v81 = v80 * 0.5;
          v121.origin.double x = v61;
          v121.origin.double y = rect;
          v121.size.CGFloat width = v69;
          v121.size.double height = v68;
          CGFloat MinX = CGRectGetMinX(v121);
          double v52 = RoundToPixel(MinX + v81 - v77 * 0.5);
          break;
        case 2:
          v119.origin.double x = v61;
          v119.origin.double y = rect;
          v119.size.CGFloat width = v69;
          v119.size.double height = v68;
          double v52 = CGRectGetMaxX(v119) + 2.0;
          break;
        case 1:
          v118.origin.double x = v61;
          v118.origin.double y = rect;
          v118.size.CGFloat width = v69;
          v118.size.double height = v68;
          double v52 = CGRectGetMidX(v118) + v77 * -0.5;
          break;
      }
      if (v52 <= v94) {
        double v52 = v94;
      }
      double v83 = [v50 string];
      [v57 setText:v83];

      uint64_t v84 = [v50 accessibilityLabel];
      [v57 setAccessibilityLabel:v84];

      double MaxY = v67;
      objc_msgSend(v57, "setFrame:", v52, v67, v77, v79);
      double v85 = [v50 string];
      uint64_t v86 = [v85 length];
      double v87 = 0.0;
      if (v86) {
        double v87 = 1.0;
      }
      [v57 setAlpha:v87];

      CGRect v88 = [v57 superview];

      if (!v88) {
        [(StockChartView *)self insertSubview:v57 belowSubview:v93];
      }
      double v10 = v96;
      double v6 = v97;
      v122.origin.double x = v97;
      v122.size.double height = v98;
      v122.origin.double y = v99;
      v122.size.CGFloat width = v96;
      [v57 setHidden:v52 > CGRectGetMaxX(v122)];

      uint64_t v48 = ++v49;
      unint64_t v51 = 0x263F1C000;
    }
    while (v16 > v49);
  }
}

- (void)_layoutTopLabelsHidden:(BOOL)a3
{
  BOOL v3 = a3;
  [(StockChartView *)self bounds];
  double v6 = v5;
  [(StockChartView *)self horizontalPadding];
  double v8 = v7;
  BOOL v9 = [(StockChartView *)self isLandscape];
  double v10 = 0.0;
  double v11 = v6 + v8 * -2.0;
  if (v9) {
    double v10 = v8 + 0.0;
  }
  else {
    double v11 = v6;
  }
  double v12 = 1.0;
  if (!v3) {
    double v12 = 37.0;
  }
  uint64_t v13 = 0;
  CGRect v16 = CGRectIntegral(*(CGRect *)&v10);
  -[ChartTitleLabel setFrame:](self->_titleView, "setFrame:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
  titleView = self->_titleView;

  [(ChartTitleLabel *)titleView setAlpha:(double)!v3];
}

- (double)widestYLabelWidthForMode:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v3 = [(StockChartData *)self->_chartData yAxisLabelInfoArrayForMode:a3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) size];
        if (v9 > v7) {
          double v7 = v9;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (void)hideLabelsAxesAndGraphs
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  [(UIView *)self->_xAxisKeyline setHidden:1];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  BOOL v3 = self->_axisViews;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v27;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * v7++) setHidden:1];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v5);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v8 = self->_xLabelViews;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v22 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * v12++) setHidden:1];
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v22 objects:v31 count:16];
    }
    while (v10);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v13 = self->_yLabelViews;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v18 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v17++), "setHidden:", 1, (void)v18);
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v18 objects:v30 count:16];
    }
    while (v15);
  }

  [(StockChartView *)self enumerateGraphsAndDisplayModesUsingBlock:&__block_literal_global_73];
  [(ChartHUDView *)self->_HUDView setOverlayHidden:1];
}

uint64_t __41__StockChartView_hideLabelsAxesAndGraphs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setHidden:1];
}

- (void)_setShowingLoadingStatus:(BOOL)a3
{
  if (a3)
  {
    [(StockChartView *)self hideLabelsAxesAndGraphs];
    [(StockChartView *)self layoutLoadingStatus];
    [(LoadingLabel *)self->_loadingLabel setHidden:0];
    loadingLabel = self->_loadingLabel;
    [(LoadingLabel *)loadingLabel setAlpha:1.0];
  }
  else
  {
    uint64_t v5 = self->_loadingLabel;
    [(LoadingLabel *)v5 setHidden:1];
  }
}

- (void)layoutLoadingStatus
{
  BOOL v3 = [(StockChartView *)self error];
  uint64_t v4 = [v3 code];

  if (v4)
  {
    if (v4 == 2 && self->_selectedInterval <= 1uLL)
    {
      uint64_t v5 = +[StocksBundles getBundle:1];
      uint64_t v6 = v5;
      uint64_t v7 = @"No Chart Available";
    }
    else
    {
      uint64_t v5 = +[StocksBundles getBundle:1];
      uint64_t v6 = v5;
      uint64_t v7 = @"Error Retrieving Chart";
    }
  }
  else
  {
    uint64_t v5 = +[StocksBundles getBundle:1];
    uint64_t v6 = v5;
    uint64_t v7 = @"RETRIEVING_CHART";
  }
  id v14 = [v5 localizedStringForKey:v7 value:&stru_26D5DA820 table:@"Localizable"];

  [(LoadingLabel *)self->_loadingLabel setText:v14 showingActivity:v4 == 0];
  [(StockChartView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  [(LoadingLabel *)self->_loadingLabel frame];
  -[LoadingLabel setFrame:](self->_loadingLabel, "setFrame:", round((v9 - v12) * 0.5), round((v11 - v13) * 0.5));
}

- (void)setLabelsAndAxesAlpha:(double)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v5 = self->_axisViews;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * v9++) setAlpha:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  double v10 = self->_xLabelViews;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * v14++) setAlpha:a3];
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v15 = self->_yLabelViews;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v19++), "setAlpha:", a3, (void)v20);
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (void)prepareForTransitionToDisplayMode:(id)a3
{
  id v13 = a3;
  self->_animating = 1;
  uint64_t v4 = [(StockChartView *)self graphViewForMode:v13];
  uint64_t v5 = [(StockChartView *)self currentGraphView];
  [v13 showsTitle];
  titleView = self->_titleView;
  if (v7 == 0.0)
  {
    double v9 = 0.0;
    double v10 = self->_titleView;
    uint64_t v11 = 0;
  }
  else
  {
    stocuint64_t k = self->_stock;
    [v13 chartSize];
    double v10 = titleView;
    uint64_t v11 = stock;
  }
  [(ChartTitleLabel *)v10 prepareStringsWithStock:v11 width:v9];
  if ([v4 isRendered])
  {
    [v5 frame];
    objc_msgSend(v4, "setFrame:");
    [v4 setAlpha:0.0];
  }
  else
  {
    [(StockChartView *)self layoutLoadingStatus];
  }
  [v13 showsTitle];
  if (v12 == 0.0) {
    [(StockChartView *)self setShowingHUD:0];
  }
  else {
    [(StockChartView *)self insertSubview:self->_titleView belowSubview:self->_HUDView];
  }
}

- (void)animateTransitionToDisplayMode:(id)a3
{
  id v19 = a3;
  uint64_t v4 = [(StockChartView *)self currentGraphView];
  uint64_t v5 = [(StockChartView *)self graphViewForMode:v19];
  [(StockChartView *)self setCurrentDisplayMode:v19];
  int64_t preferredInterval = self->_preferredInterval;
  if (preferredInterval == self->_selectedInterval)
  {
    double v7 = [(StockChartView *)self currentDisplayMode];
    uint64_t v8 = [v7 maxInterval];

    if (preferredInterval <= v8) {
      goto LABEL_5;
    }
    int64_t preferredInterval = self->_preferredInterval;
  }
  [(StockChartView *)self setSelectedInterval:[(StockChartView *)self maxSupportedIntervalFromDesiredInterval:preferredInterval]];
  [(StockChartView *)self updateChartViewForSelectedInterval];
  [(ChartIntervalButtonRow *)self->_intervalButtonRow selectChartIntervalButtonForInterval:[(StockChartView *)self selectedInterval]];
LABEL_5:
  [v4 setAlpha:0.0];
  char v9 = [v5 isRendered];
  loadingLabel = self->_loadingLabel;
  if (v9)
  {
    [(LoadingLabel *)loadingLabel setAlpha:0.0];
    [v5 setAlpha:1.0];
  }
  else
  {
    [(LoadingLabel *)loadingLabel setAlpha:1.0];
    [(StockChartView *)self setLabelsAndAxesAlpha:0.0];
  }
  [(StockChartView *)self graphViewFrameForMode:v19];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v5, "setFrame:", v12, v14, v16, v18);
  [(StockChartView *)self forceLayout];
}

- (void)didTransitionToDisplayMode:(id)a3
{
  [a3 showsTitle];
  if (v4 == 0.0) {
    [(ChartTitleLabel *)self->_titleView removeFromSuperview];
  }
  uint64_t v5 = [(StockChartView *)self currentGraphView];
  char v6 = [v5 isRendered];

  if (v6)
  {
    [(LoadingLabel *)self->_loadingLabel setAlpha:0.0];
    double v7 = [(StockChartView *)self currentGraphView];
    [v7 setAlpha:1.0];

    [(StockChartView *)self setLabelsAndAxesAlpha:1.0];
  }
  else
  {
    [(StockChartView *)self hideLabelsAxesAndGraphs];
  }
  self->_animating = 0;
  if (self->_layoutPending)
  {
    [(StockChartView *)self setNeedsLayout];
    self->_layoutPending = 0;
  }
  [(ChartTitleLabel *)self->_titleView prepareStringsForDeferredStockIfNeeded];
  [(StockChartView *)self hideOtherGraphViews];

  [(StockChartView *)self updateHUDView];
}

- (int64_t)maxSupportedIntervalFromDesiredInterval:(int64_t)a3
{
  double v4 = [(StockChartView *)self currentDisplayMode];
  uint64_t v5 = [v4 maxInterval];

  if (v5 >= a3) {
    return a3;
  }
  else {
    return v5;
  }
}

- (void)updateChartViewForSelectedInterval
{
  [(StockChartView *)self setShowingHUD:0];

  [(StockChartView *)self reloadData];
}

- (void)chartIntervalButtonRow:(id)a3 didSelectChartInterval:(int64_t)a4
{
  int64_t v6 = [(StockChartView *)self selectedInterval];
  int64_t v7 = [(StockChartView *)self maxSupportedIntervalFromDesiredInterval:a4];
  if (v7 != v6)
  {
    self->_int64_t preferredInterval = v7;
    [(StockChartView *)self setSelectedInterval:v7];
    [(StockChartView *)self updateChartViewForSelectedInterval];
    id v8 = [(StockChartView *)self chartViewDelegate];
    [v8 stockChartView:self chartIntervalDidChange:a4];
  }
}

- (StocksViewController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (StocksViewController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (Stock)stock
{
  return self->_stock;
}

- (StockChartData)chartData
{
  return self->_chartData;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (StockChartDisplayMode)currentDisplayMode
{
  return self->_currentDisplayMode;
}

- (BOOL)drawsBottomLine
{
  return self->_drawsBottomLine;
}

- (int64_t)selectedInterval
{
  return self->_selectedInterval;
}

- (void)setSelectedInterval:(int64_t)a3
{
  self->_int64_t selectedInterval = a3;
}

- (StockChartViewDelegate)chartViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chartViewDelegate);

  return (StockChartViewDelegate *)WeakRetained;
}

- (void)setChartViewDelegate:(id)a3
{
}

- (int64_t)preferredInterval
{
  return self->_preferredInterval;
}

- (void)setPreferredInterval:(int64_t)a3
{
  self->_int64_t preferredInterval = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chartViewDelegate);
  objc_storeStrong((id *)&self->_currentDisplayMode, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_chartData, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_graphViews, 0);
  objc_storeStrong((id *)&self->_displayModes, 0);
  objc_storeStrong((id *)&self->_xAxisKeyline, 0);
  objc_storeStrong((id *)&self->_chartBottomKeyline, 0);
  objc_storeStrong((id *)&self->_chartTopKeyline, 0);
  objc_storeStrong((id *)&self->_HUDView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_previousCloseLabel, 0);
  objc_storeStrong((id *)&self->_previousCloseLine, 0);
  objc_storeStrong((id *)&self->_yLabelViews, 0);
  objc_storeStrong((id *)&self->_xLabelViews, 0);
  objc_storeStrong((id *)&self->_axisViews, 0);
  objc_storeStrong((id *)&self->_stock, 0);
  objc_storeStrong((id *)&self->_intervalButtonRow, 0);
  objc_storeStrong((id *)&self->_chartUpdater, 0);

  objc_storeStrong((id *)&self->_loadingLabel, 0);
}

@end