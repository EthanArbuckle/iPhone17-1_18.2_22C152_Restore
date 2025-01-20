@interface SPChartView
- (BOOL)isCompactGraph;
- (BOOL)showsHorizontalLines;
- (CGRect)graphViewFrameForMode:(id)a3;
- (CGRect)lineGraphFrame;
- (SPChartView)initWithFrame:(CGRect)a3;
- (SPChartView)initWithStockChartDisplayMode:(id)a3;
- (SPChartViewDelegate)delegate;
- (Stock)stock;
- (StockChartData)chartData;
- (StockChartDisplayMode)currentDisplayMode;
- (UIFont)labelFont;
- (double)lineGraphBottomPadding;
- (double)widestYLabelWidthForMode:(id)a3;
- (id)_smallCapsFontFrom:(id)a3;
- (unint64_t)chartViewType;
- (void)_prepareXAxisLabelsAndPositions;
- (void)_prepareXAxisLabelsForLabelInfoArray:(id)a3;
- (void)_prepareYAxisLabelsAndPositions;
- (void)_setDayLabelsWithInterval:(unsigned int)a3 realTimePositions:(BOOL)a4;
- (void)_setHourLabels;
- (void)_setMonthAndYearLabels;
- (void)clearData;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBackgroundGradient:(CGGradient *)a3;
- (void)setChartData:(id)a3;
- (void)setChartViewType:(unint64_t)a3;
- (void)setCompactGraph:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setShowsHorizontalLines:(BOOL)a3;
- (void)setStock:(id)a3;
- (void)setYAxisLabelCount:(unint64_t)a3;
- (void)stockGraphViewReadyForDisplay:(id)a3;
@end

@implementation SPChartView

- (void)clearData
{
  chartData = self->_chartData;
  self->_chartData = 0;

  graph = self->_graph;

  [(StockGraphView *)graph clearData];
}

- (void)setBackgroundGradient:(CGGradient *)a3
{
}

- (void)setYAxisLabelCount:(unint64_t)a3
{
}

- (SPChartView)initWithStockChartDisplayMode:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPChartView;
  v6 = [(SPChartView *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_currentDisplayMode, a3);
    [(StockGraphView *)v7->_graph setDisplayMode:v7->_currentDisplayMode];
  }

  return v7;
}

- (SPChartView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)SPChartView;
  v3 = -[SPChartView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_chartViewType = 0;
    id v5 = [StockGraphView alloc];
    uint64_t v6 = -[StockGraphView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    graph = v4->_graph;
    v4->_graph = (StockGraphView *)v6;

    [(StockGraphView *)v4->_graph setChartViewDelegate:v4];
    uint64_t v8 = +[StockChartDisplayMode defaultDisplayMode];
    currentDisplayMode = v4->_currentDisplayMode;
    v4->_currentDisplayMode = (StockChartDisplayMode *)v8;

    v10 = [MEMORY[0x263F1C550] whiteColor];
    [(StockChartDisplayMode *)v4->_currentDisplayMode setLineColor:v10];

    [(StockChartDisplayMode *)v4->_currentDisplayMode setLineWidth:1.0];
    [(StockChartDisplayMode *)v4->_currentDisplayMode setShowsVolume:0];
    [(StockChartDisplayMode *)v4->_currentDisplayMode setVolumeHeight:0.0];
    [(StockChartDisplayMode *)v4->_currentDisplayMode setHorizontalGridlineCount:3];
    [(StockChartDisplayMode *)v4->_currentDisplayMode setYAxisLabelCount:2];
    v11 = v4->_currentDisplayMode;
    v12 = [MEMORY[0x263F1C550] clearColor];
    [(StockChartDisplayMode *)v11 setXAxisKeylineColor:v12];

    [(StockGraphView *)v4->_graph setDisplayMode:v4->_currentDisplayMode];
    v4->_selectedInterval = -1;
    [(SPChartView *)v4 addSubview:v4->_graph];
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    xAxisLabels = v4->_xAxisLabels;
    v4->_xAxisLabels = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    yAxisLabels = v4->_yAxisLabels;
    v4->_yAxisLabels = v15;

    v17 = objc_alloc_init(ChartLabelInfoManager);
    labelInfoManager = v4->_labelInfoManager;
    v4->_labelInfoManager = v17;

    v19 = [MEMORY[0x263F1C550] clearColor];
    [(SPChartView *)v4 setBackgroundColor:v19];

    [(SPChartView *)v4 setShowsHorizontalLines:0];
  }
  return v4;
}

- (void)dealloc
{
  +[GraphRenderer clearSharedRenderer];
  v3.receiver = self;
  v3.super_class = (Class)SPChartView;
  [(SPChartView *)&v3 dealloc];
}

- (void)stockGraphViewReadyForDisplay:(id)a3
{
  xAxisLabels = self->_xAxisLabels;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __45__SPChartView_stockGraphViewReadyForDisplay___block_invoke;
  v12[3] = &unk_26467CF80;
  v12[4] = self;
  [(NSMutableArray *)xAxisLabels enumerateObjectsUsingBlock:v12];
  yAxisLabels = self->_yAxisLabels;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__SPChartView_stockGraphViewReadyForDisplay___block_invoke_2;
  v11[3] = &unk_26467CF80;
  v11[4] = self;
  [(NSMutableArray *)yAxisLabels enumerateObjectsUsingBlock:v11];
  [(StockGraphView *)self->_graph setNeedsDisplay];
  [(SPChartView *)self setNeedsDisplay];
  [(SPChartView *)self setNeedsLayout];
  [(SPChartView *)self bounds];
  v13.width = v6;
  v13.height = v7;
  UIGraphicsBeginImageContextWithOptions(v13, 0, 2.0);
  uint64_t v8 = [(SPChartView *)self layer];
  [v8 renderInContext:UIGraphicsGetCurrentContext()];

  objc_super v9 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained spChartView:self hasChartImage:v9];
}

uint64_t __45__SPChartView_stockGraphViewReadyForDisplay___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addSubview:a2];
}

uint64_t __45__SPChartView_stockGraphViewReadyForDisplay___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addSubview:a2];
}

- (void)setChartData:(id)a3
{
  p_chartData = &self->_chartData;
  v11 = (StockChartData *)a3;
  if (*p_chartData != v11)
  {
    objc_storeStrong((id *)&self->_chartData, a3);
    if (*p_chartData)
    {
      [(StockChartData *)*p_chartData setPreviousClosePrice:0.0];
      self->_selectedInterval = [(StockChartData *)v11 chartInterval];
      [(StockGraphView *)self->_graph loadStockChartData:v11];
      [(StockGraphView *)self->_graph bounds];
      if (v6 != *MEMORY[0x263F001B0] || v7 != *(double *)(MEMORY[0x263F001B0] + 8))
      {
        double v9 = v6;
        double v10 = v7;
        [(SPChartView *)self _prepareYAxisLabelsAndPositions];
        [(SPChartView *)self _prepareXAxisLabelsAndPositions];
        -[StockGraphView recomputePathsAndRenderIfNeededForSize:](self->_graph, "recomputePathsAndRenderIfNeededForSize:", v9, v10);
      }
    }
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SPChartView *)self frame];
  v21.origin.double x = v8;
  v21.origin.double y = v9;
  v21.size.double width = v10;
  v21.size.double height = v11;
  v20.origin.double x = x;
  v20.origin.double y = y;
  v20.size.double width = width;
  v20.size.double height = height;
  if (CGRectEqualToRect(v20, v21)) {
    goto LABEL_9;
  }
  -[StockChartDisplayMode setChartSize:](self->_currentDisplayMode, "setChartSize:", width, height);
  -[StockGraphView setFrame:](self->_graph, "setFrame:", 0.0, 0.0, width, height);
  unint64_t v12 = [(SPChartView *)self chartViewType];
  if (v12)
  {
    if (v12 != 1) {
      goto LABEL_7;
    }
    double v13 = 22.0;
    double v14 = 5.0;
  }
  else
  {
    double v13 = 30.0;
    double v14 = 20.0;
  }
  -[StockGraphView setGraphInsets:](self->_graph, "setGraphInsets:", v14, 0.0, v13, 0.0);
LABEL_7:
  chartData = self->_chartData;
  if (chartData)
  {
    [(StockChartData *)chartData clearAllImageSets];
    graph = self->_graph;
    [(StockGraphView *)graph bounds];
    -[StockGraphView recomputePathsAndRenderIfNeededForSize:](graph, "recomputePathsAndRenderIfNeededForSize:", v17, v18);
    [(SPChartView *)self _prepareYAxisLabelsAndPositions];
    [(SPChartView *)self _prepareXAxisLabelsAndPositions];
  }
LABEL_9:
  v19.receiver = self;
  v19.super_class = (Class)SPChartView;
  -[SPChartView setFrame:](&v19, sel_setFrame_, x, y, width, height);
}

- (void)layoutSubviews
{
  if (self->_chartData && [(StockGraphView *)self->_graph isRendered])
  {
    id v38 = [(StockChartData *)self->_chartData xAxisLabelInfoArrayForMode:self->_currentDisplayMode];
    objc_super v3 = [(StockChartData *)self->_chartData yAxisLabelInfoArrayForMode:self->_currentDisplayMode];
    uint64_t v4 = [v38 count];
    if (v4)
    {
      uint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        double v7 = [(NSMutableArray *)self->_xAxisLabels objectAtIndex:i];
        CGFloat v8 = [v38 objectAtIndex:i];
        [(SPChartView *)self frame];
        double v10 = v9;
        [v7 frame];
        double v12 = v11;
        double v14 = v13;
        [v8 position];
        double v16 = v15;
        [(StockGraphView *)self->_graph frame];
        double v18 = floor(v16 * v17 + 2.0);
        if (self->_selectedInterval)
        {
          if (self->_compactGraph) {
            double v19 = 5.5;
          }
          else {
            double v19 = 6.5;
          }
          double v18 = v18 + v19;
        }
        CGRect v20 = [v7 font];
        [v20 ascender];
        double v22 = RoundToPixelWatch(v10 + -1.0 - v21);

        objc_msgSend(v7, "setFrame:", v18, v22, v12, v14);
        if ((i & 1) != 0 && !self->_selectedInterval) {
          [v7 setHidden:1];
        }
      }
    }
    v23 = [(NSMutableArray *)self->_xAxisLabels firstObject];
    [v23 setHidden:1];
    uint64_t v24 = [v3 count];
    if (v24)
    {
      uint64_t v25 = v24;
      for (uint64_t j = 0; j != v25; ++j)
      {
        v27 = [(NSMutableArray *)self->_yAxisLabels objectAtIndex:j];
        v28 = [v3 objectAtIndex:j];
        [v27 frame];
        double v30 = v29;
        double v32 = v31;
        [(SPChartView *)self bounds];
        CGFloat v33 = CGRectGetMaxX(v40) - v30;
        [v28 position];
        double v35 = 1.0 - v34;
        [(SPChartView *)self frame];
        float v37 = v35 * (v36 - v32 + -10.0) + 0.0;
        objc_msgSend(v27, "setFrame:", v33, floorf(v37), v30, v32);
      }
    }
  }
}

- (id)_smallCapsFontFrom:(id)a3
{
  v21[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F1D218];
  v20[0] = *MEMORY[0x263F1D220];
  v20[1] = v3;
  v21[0] = &unk_26D5E8E68;
  v21[1] = &unk_26D5E8E80;
  uint64_t v4 = NSDictionary;
  id v5 = a3;
  double v6 = [v4 dictionaryWithObjects:v21 forKeys:v20 count:2];
  uint64_t v7 = *MEMORY[0x263F1D1E8];
  double v17 = v6;
  uint64_t v18 = v7;
  CGFloat v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
  double v19 = v8;
  double v9 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];

  double v10 = [v5 fontDescriptor];
  double v11 = [v10 fontDescriptorByAddingAttributes:v9];

  double v12 = (void *)MEMORY[0x263F1C658];
  [v5 pointSize];
  double v14 = v13;

  double v15 = [v12 fontWithDescriptor:v11 size:v14];

  return v15;
}

- (void)_prepareXAxisLabelsForLabelInfoArray:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = 424;
  [(NSMutableArray *)self->_xAxisLabels enumerateObjectsUsingBlock:&__block_literal_global];
  [(NSMutableArray *)self->_xAxisLabels removeAllObjects];
  double v30 = [(SPChartView *)self labelFont];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    double v9 = *MEMORY[0x263F001A8];
    double v10 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v11 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v12 = *(double *)(MEMORY[0x263F001A8] + 24);
    unint64_t v13 = 0x263F1C000uLL;
    do
    {
      uint64_t v14 = 0;
      uint64_t v31 = v7;
      do
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(obj);
        }
        double v15 = *(void **)(*((void *)&v33 + 1) + 8 * v14);
        double v16 = objc_msgSend(objc_alloc(*(Class *)(v13 + 1896)), "initWithFrame:", v9, v10, v11, v12);
        double v17 = [v15 string];
        [v16 setText:v17];

        [v16 setTextAlignment:2];
        unint64_t v18 = [(SPChartView *)self chartViewType];
        if (v18 == 1)
        {
          uint64_t v21 = v8;
          uint64_t v22 = v5;
          unint64_t v23 = v13;
          uint64_t v24 = [(StockChartData *)self->_chartData dataSeriesDict];
          if (v24) {
            [MEMORY[0x263F1C550] whiteColor];
          }
          else {
          uint64_t v25 = [MEMORY[0x263F1C550] colorWithWhite:0.301960784 alpha:1.0];
          }
          [v16 setTextColor:v25];

          [v16 setFont:v30];
          v26 = [(SPChartView *)self chartData];
          v27 = [v26 dataSeriesDict];
          uint64_t v28 = [v27 count];

          unint64_t v13 = v23;
          uint64_t v5 = v22;
          uint64_t v8 = v21;
          uint64_t v7 = v31;
          if (!v28) {
            [v16 setText:&stru_26D5DA820];
          }
        }
        else if (!v18)
        {
          double v19 = [MEMORY[0x263F1C550] systemGrayColor];
          [v16 setTextColor:v19];

          CGRect v20 = [MEMORY[0x263F1C658] systemFontOfSize:8.0];
          [v16 setFont:v20];
        }
        double v29 = [MEMORY[0x263F1C550] clearColor];
        [v16 setBackgroundColor:v29];

        [v16 sizeToFit];
        [*(id *)((char *)&self->super.super.super.isa + v5) addObject:v16];

        ++v14;
      }
      while (v7 != v14);
      uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v7);
  }
}

uint64_t __52__SPChartView__prepareXAxisLabelsForLabelInfoArray___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

- (void)_prepareXAxisLabelsAndPositions
{
  switch(self->_selectedInterval)
  {
    case 0:
      [(SPChartView *)self _setHourLabels];
      break;
    case 1:
      uint64_t v2 = 1;
      uint64_t v3 = 0;
      goto LABEL_5;
    case 2:
      uint64_t v2 = 7;
      uint64_t v3 = 1;
LABEL_5:
      [(SPChartView *)self _setDayLabelsWithInterval:v2 realTimePositions:v3];
      break;
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
      [(SPChartView *)self _setMonthAndYearLabels];
      break;
    default:
      return;
  }
}

- (void)_setMonthAndYearLabels
{
  uint64_t v2 = self;
  unsigned int v3 = [(StockChartData *)self->_chartData stockValueCount];
  if (!v3) {
    return;
  }
  unsigned int v4 = v3;
  uint64_t v5 = [(StockChartData *)v2->_chartData stockValues];
  uint64_t v6 = [MEMORY[0x263EFF8F0] currentCalendar];
  v126 = (void *)[v6 copy];

  uint64_t v7 = [(StockChartData *)v2->_chartData marketTimeZone];
  [v126 setTimeZone:v7];

  uint64_t v8 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:*v5];
  uint64_t v9 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v5[3 * v4 - 3]];
  v106 = (void *)v8;
  double v10 = [v126 components:8 fromDate:v8 toDate:v9 options:0];
  uint64_t v11 = [v10 month];
  uint64_t v119 = v11;
  if ([v10 month] >= 25)
  {
    float v12 = (double)[v10 month] / 24.0;
    float v13 = floorf(v12);
    float v14 = 6.0;
LABEL_7:
    float v16 = v13 * v14;
    if (v16 > 12.0) {
      float v16 = 12.0;
    }
    unint64_t v17 = (unint64_t)v16;
    goto LABEL_11;
  }
  if (v11 >= 7)
  {
    float v15 = (double)[v10 month] / 12.0;
    float v13 = ceilf(v15);
    float v14 = 3.0;
    goto LABEL_7;
  }
  unint64_t v17 = 1;
LABEL_11:
  v104 = v10;
  unint64_t v18 = [v10 month];
  BOOL v19 = v17 == 1 || v17 == 12;
  unint64_t v123 = v17;
  if (v19) {
    uint64_t v20 = v18 / v17 + 1;
  }
  else {
    uint64_t v20 = v18 / v17;
  }
  uint64_t v21 = 2;
  if (v19) {
    uint64_t v21 = 3;
  }
  uint64_t v22 = v20 + 1;
  unint64_t v23 = +[ChartLabelInfoManager sharedLabelInfoManager];
  uint64_t v24 = [MEMORY[0x263EFF980] arrayWithCapacity:v20 + 2];
  v107 = v23;
  uint64_t v25 = [v23 labelInfoForYAxis];
  [v24 addObject:v25];

  v120 = [MEMORY[0x263EFF980] arrayWithCapacity:v22];
  v105 = (void *)v9;
  v26 = [v126 components:8 fromDate:v9];
  uint64_t v27 = v4 - 1;
  v121 = v24;
  v118 = v2;
  if ((int)(v4 - 1) < 0)
  {
    uint64_t v31 = 0;
    double v30 = 0;
    id v40 = 0;
    int rect = 0;
    goto LABEL_33;
  }
  int rect = 0;
  int v28 = 0;
  double v29 = 0;
  double v30 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = v27 + 1;
  float v33 = (float)v27;
  long long v34 = &v5[3 * v27];
  do
  {
    long long v35 = v31;
    long long v36 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:*v34];

    uint64_t v31 = [v126 components:8 fromDate:v36];

    uint64_t v37 = [v31 month];
    if (v37 == [v26 month]) {
      goto LABEL_26;
    }
    if (v123 != ++v28)
    {
      if (rect) {
        goto LABEL_25;
      }
      if ([v26 month] != 1 && (objc_msgSend(v26, "month") - 1) % v123)
      {
        int rect = 0;
        goto LABEL_25;
      }
    }
    [v120 setObject:v29 atIndexedSubscript:rect];
    uint64_t v38 = objc_alloc_init(ChartLabelInfo);

    [(ChartLabelInfo *)v38 setPosition:(float)((float)(int)v32 / v33)];
    [v121 addObject:v38];
    int v28 = 0;
    ++rect;
    double v30 = v38;
LABEL_25:
    id v39 = v31;

    v26 = v39;
LABEL_26:
    id v40 = v36;

    v34 -= 3;
    double v29 = v40;
    BOOL v96 = v32-- <= 1;
  }
  while (!v96);

  uint64_t v2 = v118;
  uint64_t v24 = v121;
LABEL_33:

  [(SPChartView *)v2 lineGraphFrame];
  double v115 = v41;
  CGFloat v116 = v42;
  CGFloat v117 = v43;
  double v45 = v44;
  double v110 = 0.0;
  if ((unint64_t)[v24 count] < 2) {
    goto LABEL_41;
  }
  v46 = objc_msgSend(v24, "objectAtIndexedSubscript:", objc_msgSend(v24, "count") - 2);
  [v46 position];
  double v48 = v47;
  v49 = objc_msgSend(v24, "objectAtIndexedSubscript:", objc_msgSend(v24, "count") - 1);
  [v49 position];
  double v110 = v45 * (v48 - v50);

  if (v123 == 12 || v123 == 1)
  {
    id v51 = v40;
    if (v123 == 12)
    {
      v52 = [v126 components:-1 fromDate:v51];
      [v52 setMonth:1];
      uint64_t v53 = [v126 dateFromComponents:v52];

      id v51 = (id)v53;
    }
    [v120 setObject:v51 atIndexedSubscript:rect];
    v54 = objc_alloc_init(ChartLabelInfo);

    v55 = objc_msgSend(v24, "objectAtIndexedSubscript:", objc_msgSend(v24, "count") - 1);
    [v55 position];
    [(ChartLabelInfo *)v54 setPosition:v56 - v110 / v45];

    [(ChartLabelInfo *)v54 position];
    if (v57 > 0.0)
    {
      [v24 addObject:v54];
      ++rect;
    }
  }
  else
  {
LABEL_41:
    v54 = v30;
  }
  v58 = [(SPChartView *)v2 currentDisplayMode];
  int v59 = [v58 usesDetailedAxisLabels];

  v60 = [v107 monthLabelInfoArrayForLabelLength:0];
  if (rect >= 1)
  {
    uint64_t v61 = 0;
    int v62 = 0;
    double v64 = *MEMORY[0x263F001A0];
    double v63 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v65 = 0.015;
    if (v59) {
      double v65 = 0.0199999996;
    }
    float v66 = floor(v45 * v65);
    double v127 = v66;
    double v111 = *(double *)(MEMORY[0x263F001B0] + 8);
    double v112 = *MEMORY[0x263F001B0];
    uint64_t v114 = rect;
    double v108 = *(double *)(MEMORY[0x263F001A0] + 24);
    double v109 = *(double *)(MEMORY[0x263F001A0] + 16);
    CGFloat recta = v109;
    double v67 = v108;
    double v113 = v45;
    while (1)
    {
      int v68 = v62;
      v69 = v54;
      v70 = [v120 objectAtIndexedSubscript:v61];
      v71 = [v126 components:8 fromDate:v70];
      uint64_t v72 = v61 + 1;
      v54 = [v121 objectAtIndex:v61 + 1];

      if (v119 >= 7 && [v71 month] == 1)
      {
        v73 = [v126 timeZone];
        [(ChartLabelInfo *)v54 setStringToYearWithDate:v70 timeZone:v73];
        int v62 = 1;
      }
      else
      {
        v73 = objc_msgSend(v60, "objectAtIndex:", (objc_msgSend(v71, "month") - 1) % (unint64_t)objc_msgSend(v60, "count"));
        [(ChartLabelInfo *)v54 retainStringAndSizeFromLabelInfo:v73];
        int v62 = 0;
      }

      [(ChartLabelInfo *)v54 size];
      double v75 = v74;
      CGFloat v77 = v76;
      CGFloat v122 = v67;
      if (v123 == 1 || v123 == 12)
      {
        CGFloat v78 = v63;
        double v79 = v64;
        double v80 = v110;
        if (!v61)
        {
          [(ChartLabelInfo *)v54 position];
          double v80 = v45 * (1.0 - v81);
        }
        double v82 = 0.5;
        float v83 = v80 * 0.5;
        [(ChartLabelInfo *)v54 position];
        CGFloat v84 = v115;
        double v86 = v115 + v45 * v85 + v83 - v75 * 0.5;
      }
      else
      {
        CGFloat v78 = v63;
        double v79 = v64;
        [(ChartLabelInfo *)v54 position];
        CGFloat v84 = v115;
        double v86 = v115 + v45 * v87;
        double v82 = 0.5;
      }
      v129.origin.double x = v84;
      v129.size.double height = v116;
      v129.origin.double y = v117;
      v129.size.double width = v45;
      CGFloat MaxX = CGRectGetMaxX(v129);
      double v89 = v86 + v75 * v82;
      BOOL v96 = v75 + v86 <= MaxX;
      double v90 = v127;
      if (!v96 || v89 < v127)
      {
        -[ChartLabelInfo setString:](v54, "setString:", &stru_26D5DA820, v127, v89);
        -[ChartLabelInfo setSize:](v54, "setSize:", v112, v111);
        CGFloat v77 = v108;
        double v75 = v109;
      }
      v92 = [(SPChartView *)v118 currentDisplayMode];
      double v63 = 0.0;
      if ([v92 usesDetailedAxisLabels]) {
        double v93 = 10.0;
      }
      else {
        double v93 = 0.0;
      }
      if ((v68 & (v62 ^ 1)) != 0) {
        double v94 = 4.0;
      }
      else {
        double v94 = 0.0;
      }

      double v64 = fmax(floor(v86), 0.0);
      if (v64 >= v127) {
        goto LABEL_71;
      }
      v130.origin.double x = v79;
      v130.origin.double y = v78;
      v130.size.double width = recta;
      v130.size.double height = v122;
      if (CGRectIsNull(v130)) {
        break;
      }
      v131.origin.double y = 0.0;
      v131.origin.double x = v127;
      v131.size.double width = v75;
      v131.size.double height = v77;
      double v95 = v94 + v93 + CGRectGetMaxX(v131);
      BOOL v96 = v95 > v79 && v119 <= 6;
      if (v96)
      {
        [(ChartLabelInfo *)v54 setString:&stru_26D5DA820];
        -[ChartLabelInfo setSize:](v54, "setSize:", v112, v111);
        double v45 = v113;
LABEL_81:
        v97 = [(ChartLabelInfo *)v54 string];
        uint64_t v98 = [v97 length];

        double v64 = v127;
        if (v98)
        {
          [(ChartLabelInfo *)v54 setString:&stru_26D5DA820];
          -[ChartLabelInfo setSize:](v54, "setSize:", v112, v111);
          CGFloat v77 = v122;
          double v75 = recta;
          double v63 = v78;
          double v64 = v79;
        }
        goto LABEL_72;
      }
      double v45 = v113;
      if (v95 > v79) {
        goto LABEL_81;
      }
      double v64 = v127;
LABEL_72:

      uint64_t v61 = v72;
      double v67 = v77;
      CGFloat recta = v75;
      if (v114 == v72) {
        goto LABEL_83;
      }
    }
    double v64 = v127;
LABEL_71:
    double v45 = v113;
    goto LABEL_72;
  }
LABEL_83:
  [(SPChartView *)v118 _prepareXAxisLabelsForLabelInfoArray:v121];
  chartData = v118->_chartData;
  v100 = [(SPChartView *)v118 currentDisplayMode];
  [(StockChartData *)chartData setXAxisLabelInfoArray:v121 forDisplayMode:v100];

  v101 = v118->_chartData;
  v102 = [(SPChartView *)v118 currentDisplayMode];
  [(StockChartData *)v101 setLabelPlacement:v103 forDisplayMode:v102];
}

- (void)_setDayLabelsWithInterval:(unsigned int)a3 realTimePositions:(BOOL)a4
{
  BOOL v80 = a4;
  uint64_t v95 = *MEMORY[0x263EF8340];
  CGFloat v77 = [(StockChartData *)self->_chartData marketTimeZone];
  uint64_t v6 = [v77 secondsFromGMT];
  unsigned int v79 = a3;
  uint64_t v7 = 2;
  if (a3 == 1) {
    uint64_t v7 = 3;
  }
  uint64_t v76 = v7;
  uint64_t v8 = +[ChartLabelInfoManager sharedLabelInfoManager];
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
  float v15 = (void *)[v14 copy];

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
    CGFloat v78 = v15;
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
        v88 = (void *)v16;
        uint64_t v24 = v15;
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
            double v29 = [(SPChartView *)self currentDisplayMode];
            if (![v29 usesDetailedAxisLabels]) {
              goto LABEL_28;
            }
            uint64_t v30 = [v22 month];

            if (v30 != v84)
            {
              double v29 = [v82 lastObject];
              [v29 setStringToMonthAndDayWithDate:v85 timeZone:v77];
LABEL_28:
            }
          }
          uint64_t v31 = objc_msgSend(v81, "labelInfoWithUnsignedInteger:", objc_msgSend(v22, "day"));
          uint64_t v32 = (void *)[v31 copy];

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
          float v15 = v78;
          goto LABEL_32;
        }
        v87 -= v25;
        float v15 = v24;
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
      id v39 = [v82 objectAtIndexedSubscript:v36];
      [v39 position];
      if (v40 == -1.0) {
        [v39 setPosition:(float)((float)v37 / v38)];
      }

      ++v36;
      --v37;
    }
    while (v37 != -1);
  }
  double v41 = [(SPChartView *)self currentDisplayMode];
  char v42 = [v41 usesDetailedAxisLabels];

  if (v42)
  {
    double v43 = [v82 lastObject];
    [v43 setStringToMonthAndDayWithDate:v85 timeZone:v77];
  }
  [(SPChartView *)self _prepareXAxisLabelsForLabelInfoArray:v82];
  chartData = self->_chartData;
  double v45 = [(SPChartView *)self currentDisplayMode];
  [(StockChartData *)chartData setXAxisLabelInfoArray:v82 forDisplayMode:v45];

  v46 = self->_chartData;
  double v47 = [(SPChartView *)self currentDisplayMode];
  [(StockChartData *)v46 setLabelPlacement:v76 forDisplayMode:v47];

  if (v86 && [(StockChartData *)self->_chartData stockValueCount] >= 6)
  {
    double v48 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v86, "count"));
    if (v48 && self->_selectedInterval == 1)
    {
      v49 = [(StockChartData *)self->_chartData stockValues];
      long double var0 = v49[[(StockChartData *)self->_chartData stockValueCount] - 1].var0;
      id v51 = [(StockChartData *)self->_chartData marketCloseDate];
      [v51 timeIntervalSince1970];
      double v53 = fmod(v52, 86400.0);
      double v54 = (v53 - fmod(var0, 86400.0)) / 60.0;

      double v55 = 1.0;
      if (v54 > 20.0)
      {
        double v56 = [MEMORY[0x263EFF8F0] currentCalendar];
        double v57 = (void *)[v56 copy];

        v58 = [(StockChartData *)self->_chartData marketTimeZone];
        [v57 setTimeZone:v58];

        int v59 = [(StockChartData *)self->_chartData marketOpenDate];
        v60 = [v57 components:96 fromDate:v59];

        uint64_t v61 = [(StockChartData *)self->_chartData marketCloseDate];
        int v62 = [v57 components:96 fromDate:v61];

        float v63 = (float)[v62 hour];
        float v64 = (float)[v62 minute] + (float)(v63 * 60.0);
        float v65 = (float)[v60 hour];
        double v66 = v54 / (float)(v64 - (float)((float)[v60 minute] + (float)(v65 * 60.0)));
        double v55 = 1.0 - v66 / (double)(unint64_t)([v86 count] + 1);
      }
      double v67 = [NSNumber numberWithDouble:v55];
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
        v73 = NSNumber;
        [*(id *)(*((void *)&v90 + 1) + 8 * i) doubleValue];
        double v75 = objc_msgSend(v73, "numberWithDouble:", v74 / ((double)-[StockChartData stockValueCount](self->_chartData, "stockValueCount") + -1.0));
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
  uint64_t v55 = *MEMORY[0x263EF8340];
  unsigned int v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  unsigned int v4 = (void *)[v3 copy];

  uint64_t v5 = [(StockChartData *)self->_chartData marketTimeZone];
  [v4 setTimeZone:v5];

  uint64_t v6 = [(StockChartData *)self->_chartData marketOpenDate];
  uint64_t v7 = [(StockChartData *)self->_chartData marketCloseDate];
  uint64_t v8 = [v4 components:96 fromDate:v6 toDate:v7 options:0];

  uint64_t v9 = [(StockChartData *)self->_chartData marketOpenDate];
  uint64_t j = [v4 components:96 fromDate:v9];

  uint64_t v11 = [(StockChartData *)self->_chartData marketCloseDate];
  unsigned int v12 = [v4 components:96 fromDate:v11];

  uint64_t v13 = [j minute];
  if (v13) {
    float v14 = 1.0 - (float)((float)v13 / 60.0);
  }
  else {
    float v14 = 0.0;
  }
  float v15 = (float)[v12 minute] / 60.0;
  float v16 = ceilf(v14);
  uint64_t v17 = (uint64_t)(float)(v16 + (float)[v8 hour]) - ((float)(v15 + v14) >= 1.0);
  if (v17 <= 1) {
    uint64_t v19 = 1;
  }
  else {
    uint64_t v19 = v17;
  }
  *(float *)&double v18 = v15 + v14;
  uint64_t v20 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", v19, v18);
  if ((unint64_t)(v17 - 25) > 0xFFFFFFFFFFFFFFE7)
  {
    double v48 = j;
    v49 = v4;
    uint64_t v22 = [v12 hour];
    uint64_t v23 = -v22;
    uint64_t v47 = v17;
    uint64_t v24 = v17;
    do
    {
      int v25 = v20;
      uint64_t v26 = (v22 & ~(v22 >> 63)) + v23;
      BOOL v27 = v26 != 0;
      unint64_t v28 = ((unint64_t)(v26 - v27) * (unsigned __int128)0xAAAAAAAAAAAAAAABLL) >> 64;
      unint64_t v29 = (v26 - v27) / 0x18uLL;
      if ((v22 & ~(v22 >> 63)) + v23) {
        unint64_t v30 = v29 + 1;
      }
      else {
        unint64_t v30 = v28 >> 4;
      }
      if ([(ChartLabelInfoManager *)self->_labelInfoManager use24hrTime])
      {
        uint64_t v31 = v22 + 24 * v30;
      }
      else if (v22 + 24 * (v27 + (v28 >> 4)) - 12 * ((v22 + 24 * (v27 + (v28 >> 4))) / 0xC))
      {
        uint64_t v31 = v22 + 24 * (v27 + (v28 >> 4)) - 12 * ((v22 + 24 * (v27 + (v28 >> 4))) / 0xC);
      }
      else
      {
        uint64_t v31 = 12;
      }
      uint64_t v32 = [(ChartLabelInfoManager *)self->_labelInfoManager labelInfoWithUnsignedInteger:v31];
      double v33 = (void *)[v32 copy];
      uint64_t v20 = v25;
      [v25 addObject:v33];

      --v22;
      ++v23;
      --v24;
    }
    while (v24);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v34 = v25;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v50 objects:v54 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      float v37 = 1.0 / (float)(v15 + (float)(v14 + (float)((float)v47 - v16)));
      float v38 = 1.0 - (float)(v37 * v15);
      uint64_t v39 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v51 != v39) {
            objc_enumerationMutation(v34);
          }
          [*(id *)(*((void *)&v50 + 1) + 8 * i) setPosition:v38];
          float v38 = v38 - v37;
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v50 objects:v54 count:16];
      }
      while (v36);
    }

    if (v47 < 13)
    {
      LODWORD(v44) = 0;
      uint64_t j = v48;
    }
    else
    {
      id v41 = objc_alloc_init(MEMORY[0x263F089C8]);
      char v42 = [v34 objectAtIndex:0];
      double v43 = [v42 string];
      uint64_t v44 = [v43 integerValue] & 1;

      unint64_t v45 = v44 ^ 1;
      for (uint64_t j = v48; [v34 count] > v45; v45 += 2)
        [v41 addIndex:v45];
      [v34 removeObjectsAtIndexes:v41];
    }
    if (v15 > 0.0 || v44)
    {
      v46 = [(ChartLabelInfoManager *)self->_labelInfoManager labelInfoForYAxis];
      [v34 insertObject:v46 atIndex:0];
    }
    [(SPChartView *)self _prepareXAxisLabelsForLabelInfoArray:v34];
    [(StockChartData *)self->_chartData setXAxisLabelInfoArray:v34 forDisplayMode:self->_currentDisplayMode];
    unsigned int v4 = v49;
  }
  else
  {
    uint64_t v21 = [(ChartLabelInfoManager *)self->_labelInfoManager labelInfoForYAxis];
    [v20 addObject:v21];

    [(SPChartView *)self _prepareXAxisLabelsForLabelInfoArray:v20];
    [(StockChartData *)self->_chartData setXAxisLabelInfoArray:v20 forDisplayMode:self->_currentDisplayMode];
  }
}

- (void)_prepareYAxisLabelsAndPositions
{
  float v3 = 0.0;
  float v4 = 0.0;
  if ([(StockChartData *)self->_chartData minValue]) {
    float v4 = (double)[(StockChartData *)self->_chartData minValue][8];
  }
  if ([(StockChartData *)self->_chartData maxValue]) {
    float v3 = (double)[(StockChartData *)self->_chartData maxValue][8];
  }
  float v5 = v3 - v4;
  unint64_t v6 = [(StockChartDisplayMode *)self->_currentDisplayMode yAxisLabelCount];
  double v7 = (float)(v3 - v4) / (double)(v6 - 1);
  BOOL v8 = v7 >= 2.0 && v3 >= 100.0;
  if (v8)
  {
    uint64_t v9 = 0;
  }
  else
  {
    if (v7 >= 0.0199999996) {
      unsigned int v10 = 2;
    }
    else {
      unsigned int v10 = 3;
    }
    unsigned int v11 = [(Stock *)self->_stock pricePrecision];
    if (v10 <= v11) {
      uint64_t v9 = v11;
    }
    else {
      uint64_t v9 = v10;
    }
  }
  [(StockChartData *)self->_chartData setYAxisFractionDigits:v9];
  id v37 = [MEMORY[0x263EFF980] arrayWithCapacity:v6];
  if (v6)
  {
    LODWORD(v14) = 0;
    float v15 = 0;
    float v16 = 0;
    while (1)
    {
      uint64_t v17 = v16;
      double v18 = v15;
      *(float *)&double v13 = (float)v14 / (float)(v6 - 1);
      float v19 = v4 + (float)(v5 * *(float *)&v13);
      if (v14)
      {
        if (!v8) {
          goto LABEL_24;
        }
        LODWORD(v12) = vcvtps_s32_f32(v19);
      }
      else
      {
        if (!v8)
        {
LABEL_24:
          *(float *)&double v13 = v4 + (float)(v5 * *(float *)&v13);
          uint64_t v20 = [NSNumber numberWithFloat:v13];
          goto LABEL_25;
        }
        LODWORD(v12) = vcvtms_s32_f32(v19);
      }
      uint64_t v20 = [NSNumber numberWithInt:v12];
LABEL_25:
      float v15 = (void *)v20;

      float v16 = objc_alloc_init(ChartLabelInfo);
      [(ChartLabelInfo *)v16 setPosition:(float)((float)(v19 - v4) / v5)];
      uint64_t v21 = +[StockDataFormatter sharedDataFormatter];
      uint64_t v22 = objc_msgSend(v21, "formattedNumber:withPrecision:useGroupSeparator:", v15, -[StockChartData yAxisFractionDigits](self->_chartData, "yAxisFractionDigits"), 1);
      [(ChartLabelInfo *)v16 setString:v22];

      [v37 addObject:v16];
      unint64_t v14 = (v14 + 1);
      if (v6 <= v14)
      {

        break;
      }
    }
  }
  [(NSMutableArray *)self->_yAxisLabels enumerateObjectsUsingBlock:&__block_literal_global_42];
  [(NSMutableArray *)self->_yAxisLabels removeAllObjects];
  uint64_t v23 = [v37 count];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = 0;
    double v26 = *MEMORY[0x263F001A8];
    double v27 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v28 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v29 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v30 = *MEMORY[0x263F1D288];
    do
    {
      uint64_t v31 = [v37 objectAtIndex:v25];
      uint64_t v32 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v26, v27, v28, v29);
      double v33 = [v31 string];
      [v32 setText:v33];

      [v32 setTextAlignment:1];
      id v34 = [MEMORY[0x263F1C550] systemGrayColor];
      [v32 setTextColor:v34];

      uint64_t v35 = [MEMORY[0x263F1C658] preferredFontForTextStyle:v30];
      [v32 setFont:v35];

      uint64_t v36 = [MEMORY[0x263F1C550] clearColor];
      [v32 setBackgroundColor:v36];

      [v32 sizeToFit];
      [(NSMutableArray *)self->_yAxisLabels addObject:v32];

      ++v25;
    }
    while (v24 != v25);
  }
  [(StockChartData *)self->_chartData setYAxisLabelInfoArray:v37 forDisplayMode:self->_currentDisplayMode];
}

uint64_t __46__SPChartView__prepareYAxisLabelsAndPositions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

- (void)drawRect:(CGRect)a3
{
  if (!self->_chartData) {
    return;
  }
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  if (![(StockGraphView *)self->_graph isRendered]) {
    return;
  }
  id v27 = [(StockChartData *)self->_chartData xAxisLabelInfoArrayForMode:self->_currentDisplayMode];
  double v6 = RoundToPixelWatch(2.5);
  double v7 = RoundToPixelWatch(0.5);
  double v8 = RoundToPixelWatch(0.5) * 0.5;
  CurrentContext = UIGraphicsGetCurrentContext();
  id v10 = [MEMORY[0x263F1C550] systemGrayColor];
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v10 CGColor]);

  CGContextSetLineJoin(CurrentContext, kCGLineJoinMiter);
  CGContextSetLineCap(CurrentContext, kCGLineCapSquare);
  double v11 = 10.0;
  if (!self->_compactGraph) {
    double v11 = 11.0;
  }
  double v12 = RoundToPixelWatch(height - v11);
  if ([(SPChartView *)self showsHorizontalLines])
  {
    CGFloat v13 = v8 + v12;
    CGContextBeginPath(CurrentContext);
    CGContextSetLineWidth(CurrentContext, v7);
    CGContextMoveToPoint(CurrentContext, 0.0, v8);
    CGContextAddLineToPoint(CurrentContext, width, v8);
    CGContextMoveToPoint(CurrentContext, 0.0, v13);
    CGContextAddLineToPoint(CurrentContext, width, v13);
    CGContextStrokePath(CurrentContext);
  }
  unint64_t v14 = [(SPChartView *)self chartViewType];
  if (v14 == 1)
  {
    id v15 = [MEMORY[0x263F1C550] colorWithRed:0.3 green:0.3 blue:0.3 alpha:1.0];
    uint64_t v17 = (CGColor *)[v15 CGColor];
  }
  else
  {
    if (v14)
    {
      uint64_t v17 = 0;
      goto LABEL_14;
    }
    id v15 = [MEMORY[0x263F1C550] systemGrayColor];
    id v16 = [v15 colorWithAlphaComponent:0.5];
    uint64_t v17 = (CGColor *)[v16 CGColor];
  }
LABEL_14:
  CGContextSetStrokeColorWithColor(CurrentContext, v17);
  CGContextBeginPath(CurrentContext);
  CGContextSetLineWidth(CurrentContext, v6);
  uint64_t v18 = [v27 count];
  if (v18)
  {
    uint64_t v19 = v18;
    for (uint64_t i = 0; i != v19; ++i)
    {
      uint64_t v21 = [(NSMutableArray *)self->_xAxisLabels objectAtIndex:i];
      uint64_t v22 = [v27 objectAtIndex:i];
      if (([v21 isHidden] & 1) == 0)
      {
        [v22 position];
        double v24 = v23;
        [(StockGraphView *)self->_graph frame];
        CGFloat v26 = v8 + RoundToPixelWatch(v24 * v25);
        CGContextMoveToPoint(CurrentContext, v26, 0.0);
        CGContextAddLineToPoint(CurrentContext, v26, height);
      }
    }
  }
  CGContextStrokePath(CurrentContext);
}

- (CGRect)graphViewFrameForMode:(id)a3
{
  id v3 = a3;
  [v3 showsTitle];
  if (v4 == 0.0) {
    double v5 = 0.0;
  }
  else {
    double v5 = 37.0;
  }
  [v3 chartSize];
  double v7 = v6;
  double v9 = v8;
  [v3 intervalRowHeight];
  double v11 = v10 + v5;
  [v3 intervalRowHeight];
  double v13 = v12;

  double v14 = v9 - (v5 + v13 + 0.5);
  double v15 = 16.0;
  double v16 = v11;
  double v17 = v7 + -32.0;
  result.size.double height = v14;
  result.size.CGFloat width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (CGRect)lineGraphFrame
{
  unint64_t v3 = [(SPChartView *)self chartViewType];
  double v4 = [(SPChartView *)self currentDisplayMode];
  [(SPChartView *)self graphViewFrameForMode:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  [(SPChartView *)self lineGraphBottomPadding];
  double v14 = v13;
  double v15 = [(SPChartView *)self currentDisplayMode];
  char v16 = [v15 graphOverlapsYAxisLabels];

  if ((v16 & 1) == 0)
  {
    double v17 = [(SPChartView *)self currentDisplayMode];
    [(SPChartView *)self widestYLabelWidthForMode:v17];
    double v10 = v10 - (v18 + 4.0 + 0.5);
  }
  double v19 = 0.0;
  if (v3 == 1) {
    double v19 = 5.0;
  }
  if (!v3) {
    double v19 = 18.0;
  }
  double v20 = v12 - (v19 + v14);
  double v21 = v19 + v8;
  double v22 = v6;
  double v23 = v10;
  result.size.double height = v20;
  result.size.CGFloat width = v23;
  result.origin.double y = v21;
  result.origin.double x = v22;
  return result;
}

- (double)widestYLabelWidthForMode:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(StockChartData *)self->_chartData yAxisLabelInfoArrayForMode:a3];
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

- (double)lineGraphBottomPadding
{
  uint64_t v2 = [(SPChartView *)self currentDisplayMode];
  [v2 lineGraphBottomPadding];
  double v4 = v3;

  return v4;
}

- (UIFont)labelFont
{
  double v3 = [(SPChartView *)self chartViewType];
  if (v3 == (void *)1)
  {
    if ([(SPChartView *)self isCompactGraph]) {
      double v4 = 18.0;
    }
    else {
      double v4 = 20.0;
    }
    double v3 = [MEMORY[0x263F1C658] systemFontOfSize:v4 weight:*MEMORY[0x263F1D330]];
  }
  else if (!v3)
  {
    double v3 = [MEMORY[0x263F1C658] systemFontOfSize:10.0];
  }

  return (UIFont *)v3;
}

- (unint64_t)chartViewType
{
  return self->_chartViewType;
}

- (void)setChartViewType:(unint64_t)a3
{
  self->_chartViewType = a3;
}

- (BOOL)isCompactGraph
{
  return self->_compactGraph;
}

- (void)setCompactGraph:(BOOL)a3
{
  self->_compactGraph = a3;
}

- (BOOL)showsHorizontalLines
{
  return self->_showsHorizontalLines;
}

- (void)setShowsHorizontalLines:(BOOL)a3
{
  self->_showsHorizontalLines = a3;
}

- (StockChartData)chartData
{
  return self->_chartData;
}

- (Stock)stock
{
  return self->_stock;
}

- (void)setStock:(id)a3
{
}

- (SPChartViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SPChartViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (StockChartDisplayMode)currentDisplayMode
{
  return self->_currentDisplayMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDisplayMode, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stock, 0);
  objc_storeStrong((id *)&self->_chartData, 0);
  objc_storeStrong((id *)&self->_labelInfoManager, 0);
  objc_storeStrong((id *)&self->_yAxisLabels, 0);
  objc_storeStrong((id *)&self->_xAxisLabels, 0);

  objc_storeStrong((id *)&self->_graph, 0);
}

@end