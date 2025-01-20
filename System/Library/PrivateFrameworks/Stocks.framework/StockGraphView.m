@interface StockGraphView
- ($87A9BE3275E22128A73FF46D0B92144E)plottedPointNearestToPoint:(SEL)a3;
- (BOOL)isRendered;
- (BOOL)isRendering;
- (CGPoint)rightmostPlottedPoint;
- (CGRect)_lineViewFrameForBoundsSize:(CGSize)a3;
- (CGRect)_trueGraphPointsRegion;
- (CGRect)_volumeViewFrameForBoundsSize:(CGSize)a3;
- (CGRect)volumeBarRectNearestToPoint:(CGPoint)a3;
- (StockChartDisplayMode)displayMode;
- (StockGraphView)initWithFrame:(CGRect)a3;
- (StockGraphViewContainer)chartViewDelegate;
- (UIEdgeInsets)graphInsets;
- (double)_timeAtPosition:(double)a3;
- (float)_priceAtTime:(double)a3 dataPosition:(double *)a4;
- (unint64_t)_normalizedAccumulatedVolumeInDataRange:(CGPoint)a3;
- (void)_finishCurrentLine;
- (void)_layoutSubviews;
- (void)_processGraphDataForWidth:(double)a3;
- (void)cancelRenderOperation;
- (void)clearData;
- (void)clearPaths;
- (void)dealloc;
- (void)graphRenderOperationDidFinish:(id)a3;
- (void)loadStockChartData:(id)a3;
- (void)readyForDisplayFromChartData;
- (void)recomputePathsAndRenderIfNeededForSize:(CGSize)a3;
- (void)resizeSelectedLineClipViewWithLeftX:(double)a3 rightX:(double)a4;
- (void)resizeSelectedVolumeClipViewWithLeftX:(double)a3 rightX:(double)a4;
- (void)setChartViewDelegate:(id)a3;
- (void)setDisplayMode:(id)a3;
- (void)setDottedLinePositionsWithLabelInfo:(id)a3;
- (void)setEvenlySpacedDottedLinePositionsWithCount:(unint64_t)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGraphInsets:(UIEdgeInsets)a3;
- (void)setShowingSelectedLine:(BOOL)a3;
- (void)setShowingSelectedVolumeRegion:(BOOL)a3;
@end

@implementation StockGraphView

- (StockGraphView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)StockGraphView;
  v3 = -[StockGraphView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F1C550] clearColor];
    [(StockGraphView *)v3 setBackgroundColor:v4];

    [(StockGraphView *)v3 setMultipleTouchEnabled:1];
    v3->_points = (CGPoint *)malloc_type_malloc(0x1E0uLL, 0x1000040451B5BE8uLL);
    v3->_values = (CGPoint *)malloc_type_malloc(0x1E0uLL, 0x1000040451B5BE8uLL);
    v3->_dataSize = 30;
    v5 = [LineGraphView alloc];
    double v6 = *MEMORY[0x263F001A8];
    double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v9 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v10 = -[LineGraphView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x263F001A8], v7, v8, v9);
    lineView = v3->_lineView;
    v3->_lineView = (LineGraphView *)v10;

    [(StockGraphView *)v3 addSubview:v3->_lineView];
    v3->_volumeSize = 30;
    v3->_volumeBars = ($175F2685EF764341F5DD80B75CC65478 *)malloc_type_malloc(0x1E0uLL, 0x1000040451B5BE8uLL);
    v12 = -[VolumeGraphView initWithFrame:]([VolumeGraphView alloc], "initWithFrame:", v6, v7, v8, v9);
    volumeView = v3->_volumeView;
    v3->_volumeView = v12;

    [(StockGraphView *)v3 addSubview:v3->_volumeView];
    [(StockGraphView *)v3 _layoutSubviews];
  }
  return v3;
}

- (CGRect)_lineViewFrameForBoundsSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = *MEMORY[0x263F00148];
  double v6 = *(double *)(MEMORY[0x263F00148] + 8);
  result.size.double height = height;
  result.size.double width = width;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)_volumeViewFrameForBoundsSize:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  [(StockChartDisplayMode *)self->_displayMode volumeHeight];
  double v7 = height - v6;
  [(StockChartDisplayMode *)self->_displayMode volumeHeight];
  double v9 = v8;
  double v10 = 0.0;
  double v11 = v7;
  double v12 = width;
  result.size.double height = v9;
  result.size.CGFloat width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)_layoutSubviews
{
  [(StockGraphView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  lineView = self->_lineView;
  -[StockGraphView _lineViewFrameForBoundsSize:](self, "_lineViewFrameForBoundsSize:", v3, v5);
  -[LineGraphView setFrame:](lineView, "setFrame:");
  volumeView = self->_volumeView;
  -[StockGraphView _volumeViewFrameForBoundsSize:](self, "_volumeViewFrameForBoundsSize:", v4, v6);

  -[VolumeGraphView setFrame:](volumeView, "setFrame:");
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)StockGraphView;
  -[StockGraphView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(StockGraphView *)self _layoutSubviews];
}

- (void)setShowingSelectedLine:(BOOL)a3
{
}

- (void)setShowingSelectedVolumeRegion:(BOOL)a3
{
}

- (void)setDottedLinePositionsWithLabelInfo:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "position", (void)v15);
        double v11 = objc_msgSend(NSNumber, "numberWithDouble:");
        [(NSArray *)v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  dottedLinePositions = self->_dottedLinePositions;
  self->_dottedLinePositions = v5;
  v13 = v5;

  dottedLinePositionsForStyleOnly = self->_dottedLinePositionsForStyleOnly;
  self->_dottedLinePositionsForStyleOnly = 0;
}

- (void)setEvenlySpacedDottedLinePositionsWithCount:(unint64_t)a3
{
  double v5 = (NSArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:a3];
  if (a3)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = [NSNumber numberWithDouble:(double)(unint64_t)++v6 / (double)(a3 + 1)];
      [(NSArray *)v5 addObject:v7];
    }
    while (a3 != v6);
  }
  dottedLinePositionsForStyleOnly = self->_dottedLinePositionsForStyleOnly;
  self->_dottedLinePositionsForStyleOnly = v5;
  uint64_t v10 = v5;

  dottedLinePositions = self->_dottedLinePositions;
  self->_dottedLinePositions = 0;
}

- (float)_priceAtTime:(double)a3 dataPosition:(double *)a4
{
  int valueIndex = self->_valueIndex;
  if (valueIndex >= self->_valueCount)
  {
    chartData = self->_chartData;
    return *(double *)([(StockChartData *)chartData stockValues] + 24 * self->_valueCount - 16);
  }
  double v7 = a3;
  if (valueIndex <= 0) {
    self->_int valueIndex = 1;
  }
  uint64_t v8 = [(StockChartData *)self->_chartData stockValues] + 24 * self->_valueIndex;
  double var0 = v8[-1].var0;
  double var1 = v8[-1].var1;
  double v11 = [(StockChartData *)self->_chartData stockValues];
  int v12 = self->_valueIndex;
  p_double var0 = &v11[v12].var0;
  double v14 = *p_var0;
  a3 = p_var0[1];
  if (*p_var0 < v7)
  {
    while (1)
    {
      int v15 = v12 + 1;
      self->_int valueIndex = v15;
      if (v15 == self->_valueCount) {
        break;
      }
      double var1 = a3;
      double var0 = v14;
      long long v16 = [(StockChartData *)self->_chartData stockValues];
      int v12 = self->_valueIndex;
      long long v17 = &v16[v12].var0;
      double v14 = *v17;
      a3 = v17[1];
      if (*v17 >= v7) {
        goto LABEL_7;
      }
    }
    if (a4) {
      *a4 = 1.0;
    }
    chartData = self->_chartData;
    return *(double *)([(StockChartData *)chartData stockValues] + 24 * self->_valueCount - 16);
  }
LABEL_7:
  double v18 = (v7 - var0) / (v14 - var0);
  if (a4) {
    *a4 = (v18 + (double)v12) / (double)(self->_valueCount - 1);
  }
  return a3 * v18 + var1 * (1.0 - v18);
}

- (double)_timeAtPosition:(double)a3
{
  int v4 = self->_valueCount - 1;
  double v5 = (double)v4 * a3;
  float v6 = v5;
  int v7 = vcvtms_s32_f32(v6);
  uint64_t v8 = [(StockChartData *)self->_chartData stockValues];
  if (v4 <= v7) {
    return v8[self->_valueCount - 1].var0;
  }
  double var0 = v8[v7].var0;
  uint64_t v10 = v7 + 1;
  if ((int)v10 >= self->_valueCount - 1) {
    return var0;
  }
  double v11 = (double)[(StockChartData *)self->_chartData stockValues][24 * v10];
  double v12 = v5 - (double)v7;
  double v13 = round(v12);
  if (v11 - var0 > 43200.0) {
    double v12 = v13;
  }
  return v11 * v12 + var0 * (1.0 - v12);
}

- (CGRect)_trueGraphPointsRegion
{
  [(StockGraphView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(StockChartDisplayMode *)self->_displayMode lineWidth];
  double v8 = v6 - v7 - self->_graphInsets.bottom - self->_graphInsets.top;
  uint64_t v9 = [MEMORY[0x263F1C920] mainScreen];
  [v9 scale];
  double v11 = v8 + -1.0 / v10;

  [(StockChartDisplayMode *)self->_displayMode lineWidth];
  double v13 = v12 * 0.5 + self->_graphInsets.bottom;
  [(StockChartDisplayMode *)self->_displayMode lineWidth];
  double v15 = v4 - v14 * 0.5;
  uint64_t v16 = 0;
  double v17 = v13;
  double v18 = v11;

  return CGRectIntegral(*(CGRect *)&v16);
}

- (void)clearPaths
{
  self->_dataCount = 0;
  self->_volumeCount = 0;
  double v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  linePointCounts = self->_linePointCounts;
  self->_linePointCounts = v3;

  MEMORY[0x270F9A758](v3, linePointCounts);
}

- (void)_finishCurrentLine
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v3 = self->_linePointCounts;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "intValue", (void)v11);
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    int v6 = 0;
  }

  linePointCounts = self->_linePointCounts;
  double v10 = [NSNumber numberWithInt:self->_dataCount - v6];
  [(NSMutableArray *)linePointCounts addObject:v10];
}

- (unint64_t)_normalizedAccumulatedVolumeInDataRange:(CGPoint)a3
{
  unsigned int valueCount = self->_valueCount;
  double v4 = (double)(int)(valueCount - 1);
  double v5 = a3.x * v4;
  double v6 = a3.y * v4;
  if (a3.y * v4 <= a3.x * v4) {
    return 0;
  }
  unsigned int v8 = vcvtmd_u64_f64(v5);
  if (v6 < (double)(v8 + 1)) {
    return (unint64_t)((v6 - v5)
  }
                            * (double)(unint64_t)([(StockChartData *)self->_chartData stockValues]
                                                       + 24 * v8)[16]);
  double v9 = 0.0;
  if (valueCount > v8)
  {
    double v11 = floor(v6);
    unsigned int v12 = vcvtpd_u64_f64(v5);
    do
    {
      double v13 = (double)v8;
      if (v5 <= (double)v8)
      {
        if (v11 <= v13) {
          return (unint64_t)(v9
        }
                                  + (v6 - v13)
                                  * (double)(unint64_t)([(StockChartData *)self->_chartData stockValues]+ 24 * v8)[16]);
        double v9 = v9
           + (double)(unint64_t)([(StockChartData *)self->_chartData stockValues] + 24 * v8++)[16];
      }
      else
      {
        double v9 = v9
           + (v13 - v5 + 1.0)
           * (double)(unint64_t)([(StockChartData *)self->_chartData stockValues] + 24 * v8)[16];
        unsigned int v8 = v12;
      }
    }
    while (v8 < self->_valueCount);
  }
  return (unint64_t)v9;
}

- (void)_processGraphDataForWidth:(double)a3
{
  if (![(StockChartData *)self->_chartData stockValueCount]) {
    return;
  }
  double v5 = *(double *)[(StockChartData *)self->_chartData stockValues];
  double v6 = *(double *)([(StockChartData *)self->_chartData stockValues] + 24 * self->_valueCount - 24);
  int64_t v7 = [(StockChartData *)self->_chartData chartInterval];
  double v130 = v6;
  if (v7)
  {
    float v122 = 0.0;
    double v117 = 1.0;
  }
  else
  {
    unsigned int v8 = [(StockChartData *)self->_chartData marketCloseDate];
    [v8 timeIntervalSince1970];
    double v10 = v9;
    double v11 = [(StockChartData *)self->_chartData marketOpenDate];
    [v11 timeIntervalSince1970];
    double v13 = v10 - v12;
    double v6 = v130;
    double v14 = a3 / (v13 / 60.0);

    double v15 = [(StockChartData *)self->_chartData marketOpenDate];
    [v15 timeIntervalSince1970];
    double v17 = (v5 - v16) / 60.0;

    float v18 = fmax(v17, 0.0);
    double v117 = v14;
    float v19 = v14 * v18;
    float v122 = v19;
  }
  if (![(StockChartData *)self->_chartData chartInterval]
    || (double v20 = 0.0, [(StockChartData *)self->_chartData chartInterval] == 1))
  {
    v21 = [(StockChartData *)self->_chartData marketCloseDate];
    [v21 timeIntervalSince1970];
    double v20 = (v22 - v6) / 60.0;
  }
  double v23 = v122;
  double v24 = (a3 - v122 - v20 * v117) / (double)(self->_valueCount - 1);
  BOOL v25 = v24 >= 2.0;
  v26 = [(StockChartData *)self->_chartData interestingIndexes];
  unint64_t v27 = [v26 count];

  if (!v27)
  {
    int v127 = 0;
    double v132 = fmax(v24, 2.0);
    v134[0] = 0.0;
LABEL_13:
    double v133 = 1.0;
    goto LABEL_14;
  }
  int64_t v28 = [(StockChartData *)self->_chartData chartInterval];
  double v132 = fmax(v24, 2.0);
  v134[0] = 0.0;
  if (v28 != 1)
  {
    int v127 = 0;
    goto LABEL_13;
  }
  v29 = [(StockChartData *)self->_chartData interestingIndexes];
  v30 = [v29 lastObject];
  [v30 doubleValue];
  double v133 = v31;

  BOOL v25 = 0;
  int v127 = 1;
LABEL_14:
  self->_int valueIndex = 0;
  [(StockGraphView *)self clearPaths];
  BOOL v126 = [(StockChartData *)self->_chartData hasVolume];
  self->_unint64_t maxVolume = 0;
  double v32 = 1.0;
  if (v25) {
    double v32 = 2.0;
  }
  self->_double volumeBarWidth = v32;
  double v33 = (double)[(StockChartData *)self->_chartData minValue][8];
  double v34 = (double)[(StockChartData *)self->_chartData maxValue][8];
  [(StockChartData *)self->_chartData previousClosePrice];
  double v36 = v34;
  double v128 = v33;
  if (v35 != 0.0)
  {
    float v37 = v35;
    int64_t v38 = [(StockChartData *)self->_chartData chartInterval];
    double v39 = v37;
    if (v33 >= v37) {
      double v40 = v37;
    }
    else {
      double v40 = v33;
    }
    if (v34 >= v39) {
      double v39 = v34;
    }
    if (v38) {
      double v36 = v34;
    }
    else {
      double v36 = v39;
    }
    if (v38) {
      double v41 = v33;
    }
    else {
      double v41 = v40;
    }
    double v128 = v41;
  }
  double v125 = v34;
  double v113 = v33;
  double v131 = *(double *)[(StockChartData *)self->_chartData minValue];
  v42 = [(StockChartData *)self->_chartData maxValue];
  double v43 = v130;
  BOOL v45 = v130 > 0.0 || v7 != 0;
  if (self->_valueIndex < self->_valueCount)
  {
    double v43 = v23 / a3;
    if (v23 / a3 <= v133 && v45)
    {
      double v46 = v5;
      double v114 = *(double *)(MEMORY[0x263F00148] + 8);
      double var0 = v42->var0;
      double v112 = -v132;
      double v123 = 1.0 / (double)v27;
      double v124 = v36 - v128;
      unsigned int v115 = v27 - 1;
      uint64_t v47 = 0xFFFFFFFFLL;
      double v129 = 2.0;
      double v118 = 0.0;
      double v119 = v130 + 1.0;
      double v120 = NAN;
      double v48 = v123;
      double v49 = 0.0;
      while (v7)
      {
        double v50 = v48;
        double v51 = v125;
        if (v25)
        {
          v52 = [(StockChartData *)self->_chartData stockValues];
          int valueIndex = self->_valueIndex;
          p_double var0 = &v52[valueIndex].var0;
          double v49 = *p_var0;
          double var1 = p_var0[1];
          self->_int valueIndex = valueIndex + 1;
          double v56 = v23;
          double v57 = v131;
          goto LABEL_69;
        }
        [(StockGraphView *)self _timeAtPosition:v134[0]];
        double v68 = v67;
        -[StockGraphView _priceAtTime:dataPosition:](self, "_priceAtTime:dataPosition:", 0);
        double v57 = v131;
        if (v131 > v49 && v131 < v68)
        {
          double v70 = v23 + v112 * (1.0 - (v131 - v49) / (v131 - v49));
LABEL_59:
          double v56 = v23 - v132;
          double v49 = v57;
          double v57 = v130 + 1.0;
          double var1 = v113;
          double v23 = v70;
          goto LABEL_69;
        }
        double var1 = v69;
        if (var0 > v49 && var0 < v68)
        {
          double v71 = v46;
          double v72 = v23 + v112 * (1.0 - (var0 - v49) / (var0 - v49));
          double v49 = var0;
          goto LABEL_63;
        }
        double v49 = v68;
        double v56 = v23;
LABEL_69:
        unsigned int dataCount = self->_dataCount + 1;
        self->_unsigned int dataCount = dataCount;
        unsigned int dataSize = self->_dataSize;
        double v131 = v57;
        if (dataSize >= dataCount)
        {
          values = self->_values;
        }
        else
        {
          self->_unsigned int dataSize = 2 * dataSize;
          self->_points = (CGPoint *)malloc_type_realloc(self->_points, 32 * dataSize, 0x1000040451B5BE8uLL);
          values = (CGPoint *)malloc_type_realloc(self->_values, 16 * self->_dataSize, 0x1000040451B5BE8uLL);
          self->_values = values;
          unsigned int dataCount = self->_dataCount;
        }
        unsigned int v80 = dataCount - 1;
        v81 = &self->_points[v80];
        v81->x = v23;
        v81->y = (var1 - v128) / v124;
        p_x = &values[v80].x;
        double *p_x = v49;
        p_x[1] = var1;
        double v23 = v132 + v56;
        if (v56 / a3 >= v133 || (v132 + v56) / a3 <= v133) {
          double v84 = v23 / a3;
        }
        else {
          double v84 = v133;
        }
        if (v127)
        {
          float v85 = v84 / v123;
          unsigned int v86 = vcvtms_u32_f32(v85);
          if (v115 >= v86) {
            uint64_t v87 = v86;
          }
          else {
            uint64_t v87 = v115;
          }
          if (v87 == v47)
          {
            uint64_t v87 = v47;
            double v48 = v50;
          }
          else
          {
            double v48 = v50;
            if (v87)
            {
              v88 = [(StockChartData *)self->_chartData interestingIndexes];
              v89 = [v88 objectAtIndex:(int)v87 - 1];
              [v89 doubleValue];
              double v118 = v90;
            }
            else
            {
              double v118 = 0.0;
            }
            double v120 = 1.0;
            if (v27 - 1 == (int)v87)
            {
              double v48 = v133 - v84;
            }
            else
            {
              v91 = [(StockChartData *)self->_chartData interestingIndexes];
              v92 = [v91 objectAtIndex:(int)v87];
              [v92 doubleValue];
              double v120 = v93;
            }
          }
          v134[0] = fmin(v118 + (v120 - v118) * (v84 - (double)(int)v87 * v123) / v48, 1.0);
          uint64_t v47 = v87;
        }
        else
        {
          if (v7) {
            v134[0] = v84;
          }
          double v48 = v50;
        }
        int v94 = v23 >= v129 || v25;
        if ((v126 & v94) != 1) {
          goto LABEL_111;
        }
        double v121 = v46;
        double v95 = a3;
        unsigned int v96 = self->_volumeCount + 1;
        self->_unsigned int volumeCount = v96;
        unsigned int volumeSize = self->_volumeSize;
        if (volumeSize < v96)
        {
          unsigned int v98 = 2 * volumeSize;
          self->_unsigned int volumeSize = v98;
          self->_volumeBars = ($175F2685EF764341F5DD80B75CC65478 *)malloc_type_realloc(self->_volumeBars, 16 * v98, 0x1000040451B5BE8uLL);
        }
        double v99 = v23 - v132;
        if (v25)
        {
          unint64_t v100 = *(void *)([(StockChartData *)self->_chartData stockValues]
                           + 24 * self->_valueIndex
                           - 8);
          unsigned int volumeCount = self->_volumeCount;
          if (volumeCount >= 2)
          {
            double volumeBarWidth = v99 - self->_volumeBars[volumeCount - 2].var0 + -1.0;
            if (volumeBarWidth > 0.0)
            {
              if (self->_volumeBarWidth < volumeBarWidth) {
                double volumeBarWidth = self->_volumeBarWidth;
              }
              self->_double volumeBarWidth = volumeBarWidth;
            }
            goto LABEL_108;
          }
        }
        else
        {
          double v103 = v48;
          double v104 = v134[0];
          double v105 = v129 + -1.0 + -0.5;
          unint64_t v100 = -[StockGraphView _normalizedAccumulatedVolumeInDataRange:](self, "_normalizedAccumulatedVolumeInDataRange:", v114, v134[0]);
          double v129 = v99 + 1.0 + 1.0;
          unsigned int volumeCount = self->_volumeCount;
          double v114 = v104;
          double v48 = v103;
          double v99 = v105;
        }
        a3 = v95;
LABEL_108:
        double v46 = v121;
        v106 = &self->_volumeBars[volumeCount - 1];
        v106->double var0 = v99;
        v106->double var1 = v100;
        unint64_t maxVolume = self->_maxVolume;
        if (maxVolume <= v100) {
          unint64_t maxVolume = v100;
        }
        self->_unint64_t maxVolume = maxVolume;
LABEL_111:
        double v43 = v130;
        BOOL v109 = v49 < v130 || v7 != 0;
        if (self->_valueIndex < self->_valueCount)
        {
          double v43 = v133;
          if (v84 <= v133 && v109) {
            continue;
          }
        }
        goto LABEL_130;
      }
      double v51 = v125;
      double v50 = v48;
      if (v49 == v119)
      {
        [(StockGraphView *)self _finishCurrentLine];
        v58 = [(StockChartData *)self->_chartData interestingIndexes];
        v59 = [v58 objectAtIndex:(int)v47];
        unsigned int v60 = [v59 unsignedIntValue];

        v61 = [(StockChartData *)self->_chartData stockValues] + 24 * v60;
        double v62 = v61->var0;
        double var1 = v61->var1;
        double v23 = v122 + (v61->var0 - v46) / 60.0 * v117;
        float v63 = v23;
        float v122 = v63;
        v134[0] = v134[0] + 1.0 / (double)(self->_valueCount - 1);
        double v46 = v62;
      }
      else
      {
        if (v25)
        {
          v74 = [(StockChartData *)self->_chartData stockValues];
          int v75 = self->_valueIndex;
          v76 = &v74[v75].var0;
          double v62 = *v76;
          double var1 = v76[1];
          double v23 = v122 + (*v76 - v46) / 60.0 * v117;
          self->_int valueIndex = v75 + 1;
        }
        else
        {
          double v110 = v130;
          if (v130 >= v119) {
            double v110 = v119;
          }
          if (v46 + (v23 - v122) / v117 * 60.0 >= v110) {
            double v62 = v110;
          }
          else {
            double v62 = v46 + (v23 - v122) / v117 * 60.0;
          }
          [(StockGraphView *)self _priceAtTime:v134 dataPosition:v62];
          double var1 = v111;
        }
        if (v47 != -1 && v119 != -1.0)
        {
LABEL_56:
          double v57 = v131;
          if (v131 > v49 && v131 < v62)
          {
            double v70 = v122 + (v131 - v46) / 60.0 * v117;
            goto LABEL_59;
          }
          double v71 = v46;
          if (var0 <= v49 || (double v49 = var0, var0 >= v62))
          {
            double v49 = v62;
            double v56 = v23;
          }
          else
          {
            double v72 = v122 + (var0 - v46) / 60.0 * v117;
LABEL_63:
            double v56 = v23 - v132;
            double var0 = v130 + 1.0;
            double var1 = v51;
            double v23 = v72;
          }
          double v46 = v71;
          goto LABEL_69;
        }
      }
      uint64_t v47 = (v47 + 1);
      if (v27 <= (int)v47)
      {
        unsigned int valueCount = self->_valueCount;
      }
      else
      {
        v64 = [(StockChartData *)self->_chartData interestingIndexes];
        v65 = [v64 objectAtIndex:(int)v47];
        unsigned int valueCount = [v65 unsignedIntValue];
      }
      double v73 = *(double *)([(StockChartData *)self->_chartData stockValues] + 24 * valueCount - 24);
      if (v73 == v130) {
        double v73 = v73 + 1.0;
      }
      double v119 = v73;
      goto LABEL_56;
    }
  }
LABEL_130:
  [(StockGraphView *)self _finishCurrentLine];
}

- (void)readyForDisplayFromChartData
{
  id v4 = [(StockChartData *)self->_chartData imageSetForDisplayMode:self->_displayMode];
  [(StockChartData *)self->_chartData dataSeriesDict];

  [(LineGraphView *)self->_lineView setGraphImageSet:v4];
  [(VolumeGraphView *)self->_volumeView setGraphImageSet:v4];
  self->_isRendered = 1;
  double v3 = [(StockGraphView *)self chartViewDelegate];
  [v3 stockGraphViewReadyForDisplay:self];
}

- (BOOL)isRendering
{
  return self->_renderOperation != 0;
}

- (void)cancelRenderOperation
{
  [(GraphRenderOperation *)self->_renderOperation cancel];
  renderOperation = self->_renderOperation;
  self->_renderOperation = 0;
}

- (void)recomputePathsAndRenderIfNeededForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(StockGraphView *)self cancelRenderOperation];
  double v6 = [(StockChartData *)self->_chartData imageSetForDisplayMode:self->_displayMode];

  if (![(StockChartDisplayMode *)self->_displayMode HUDEnabled] && v6
    || ([(StockGraphView *)self _processGraphDataForWidth:width - self->_graphInsets.left - self->_graphInsets.right], v6))
  {
    [(StockGraphView *)self readyForDisplayFromChartData];
  }
  else
  {
    int64_t v7 = objc_alloc_init(GraphRenderOperation);
    renderOperation = self->_renderOperation;
    self->_renderOperation = v7;

    [(GraphRenderOperation *)self->_renderOperation setDelegate:self];
    [(GraphRenderOperation *)self->_renderOperation setPoints:self->_points];
    [(GraphRenderOperation *)self->_renderOperation setLinePointCounts:self->_linePointCounts];
    [(GraphRenderOperation *)self->_renderOperation setDottedLinePositions:self->_dottedLinePositions];
    [(GraphRenderOperation *)self->_renderOperation setDottedLinePositionsForStyleOnly:self->_dottedLinePositionsForStyleOnly];
    [(GraphRenderOperation *)self->_renderOperation setVolumeBars:self->_volumeBars];
    [(GraphRenderOperation *)self->_renderOperation setVolumeCount:self->_volumeCount];
    [(GraphRenderOperation *)self->_renderOperation setVolumeBarWidth:self->_volumeBarWidth];
    [(GraphRenderOperation *)self->_renderOperation setMaxVolume:self->_maxVolume];
    -[GraphRenderOperation setGraphInsets:](self->_renderOperation, "setGraphInsets:", self->_graphInsets.top, self->_graphInsets.left, self->_graphInsets.bottom, self->_graphInsets.right);
    [(GraphRenderOperation *)self->_renderOperation setDisplayMode:self->_displayMode];
    -[GraphRenderOperation setGraphSize:](self->_renderOperation, "setGraphSize:", width, height);
    -[StockGraphView _volumeViewFrameForBoundsSize:](self, "_volumeViewFrameForBoundsSize:", width, height);
    -[GraphRenderOperation setVolumeGraphSize:](self->_renderOperation, "setVolumeGraphSize:", v9, v10);
    id v11 = +[GraphRenderer sharedRenderer];
    [v11 performRenderOperation:self->_renderOperation];
  }
}

- (void)graphRenderOperationDidFinish:(id)a3
{
  if (self->_renderOperation == a3)
  {
    chartData = self->_chartData;
    double v5 = [a3 graphImageSet];
    [(StockChartData *)chartData setImageSet:v5 forDisplayMode:self->_displayMode];

    [(StockGraphView *)self readyForDisplayFromChartData];
    renderOperation = self->_renderOperation;
    self->_renderOperation = 0;
  }
}

- (void)resizeSelectedLineClipViewWithLeftX:(double)a3 rightX:(double)a4
{
}

- (void)resizeSelectedVolumeClipViewWithLeftX:(double)a3 rightX:(double)a4
{
}

- (void)clearData
{
  [(StockGraphView *)self cancelRenderOperation];
  [(StockGraphView *)self clearPaths];
  chartData = self->_chartData;
  self->_chartData = 0;

  self->_int valueIndex = 0;
  self->_unsigned int valueCount = 0;
  self->_isRendered = 0;
}

- (void)loadStockChartData:(id)a3
{
  id v4 = (StockChartData *)a3;
  [(StockGraphView *)self clearData];
  chartData = self->_chartData;
  self->_chartData = v4;
  double v6 = v4;

  int v7 = [(StockChartData *)self->_chartData stockValueCount];
  self->_unsigned int valueCount = v7;
}

- (CGPoint)rightmostPlottedPoint
{
  v2 = &self->_points[self->_dataCount - 1];
  double x = v2->x;
  double y = v2->y;
  result.double y = y;
  result.double x = x;
  return result;
}

- ($87A9BE3275E22128A73FF46D0B92144E)plottedPointNearestToPoint:(SEL)a3
{
  retstr->double var0 = 0.0;
  retstr->double var1 = 0.0;
  retstr->var2 = 0;
  int var1_high = HIDWORD(self[20].var1);
  if (var1_high)
  {
    int v7 = self;
    double x = a4->x;
    var2 = (double *)self[18].var2;
    if (a4->x < *var2) {
      double x = *var2;
    }
    double v10 = var2[2 * (var1_high - 1)];
    if (x >= v10) {
      double x = var2[2 * (var1_high - 1)];
    }
    int v11 = (int)((x - *var2) / (v10 - *var2));
    double v12 = &var2[2 * v11 + 2];
    do
    {
      double v13 = *(v12 - 2);
      v12 -= 2;
      --v11;
    }
    while (v13 > x);
    do
    {
      double v14 = *v12;
      v12 += 2;
      double v15 = v14;
      ++v11;
    }
    while (v14 < x);
    if (v11 >= 1 && (x - var2[2 * (v11 - 1)]) / (v15 - var2[2 * (v11 - 1)]) <= 0.5) {
      --v11;
    }
    [($87A9BE3275E22128A73FF46D0B92144E *)self bounds];
    float64_t v33 = v17;
    float64_t v34 = v16;
    [($87A9BE3275E22128A73FF46D0B92144E *)v7 _trueGraphPointsRegion];
    double v19 = v18;
    double v20 = 1.0 - *(double *)(v7[18].var2 + 16 * v11 + 8);
    self = ($87A9BE3275E22128A73FF46D0B92144E *)[(id)v7[22].var2 lineWidth];
    v22.f64[0] = *(float64_t *)(v7[18].var2 + 16 * v11);
    v22.f64[1] = v21 * 0.5 + v20 * v19 + v7[23].var0;
    float32x2_t v23 = vrndm_f32(vcvt_f32_f64(v22));
    v24.f64[0] = v34;
    v24.f64[1] = v33;
    __asm { FMOV            V1.2D, #-1.0 }
    float64x2_t v30 = vaddq_f64(v24, _Q1);
    float64x2_t v31 = vcvtq_f64_f32(v23);
    *(float64x2_t *)a4 = vmaxnmq_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v30, v31), (int8x16_t)v31, (int8x16_t)v30), (float64x2_t)0);
    *(_OWORD *)&retstr->double var0 = *(_OWORD *)(*(void *)&v7[19].var0 + 16 * v11);
    retstr->var2 = 0;
  }
  else
  {
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&retstr->double var0 = _Q0;
  }
  return self;
}

- (CGRect)volumeBarRectNearestToPoint:(CGPoint)a3
{
  unsigned int volumeCount = self->_volumeCount;
  if (volumeCount)
  {
    volumeBars = self->_volumeBars;
    if (a3.x < volumeBars->var0) {
      a3.double x = volumeBars->var0;
    }
    double var0 = volumeBars[volumeCount - 1].var0;
    if (a3.x >= var0) {
      a3.double x = volumeBars[volumeCount - 1].var0;
    }
    int v7 = (int)((a3.x - volumeBars->var0) / (var0 - volumeBars->var0));
    p_double var0 = &volumeBars[v7 + 1].var0;
    do
    {
      double v9 = *(p_var0 - 2);
      p_var0 -= 2;
      --v7;
    }
    while (v9 > a3.x);
    do
    {
      double v10 = *p_var0;
      p_var0 += 2;
      double v11 = v10;
      ++v7;
    }
    while (v10 < a3.x);
    if (v7 >= 1 && (a3.x - volumeBars[v7 - 1].var0) / (v11 - volumeBars[v7 - 1].var0) <= 0.5) {
      --v7;
    }
    double v12 = &volumeBars[v7];
    double v13 = v12->var0;
    double v14 = (double)v12->var1 / (double)self->_maxVolume;
    [(StockChartDisplayMode *)self->_displayMode volumeHeight];
    *(float *)&double v15 = v14 * v15;
    double v16 = ceilf(*(float *)&v15);
    double v17 = round(v13 + self->_volumeBarWidth * -0.5);
    [(StockGraphView *)self frame];
    double v19 = v18 - v16;
    double v21 = v20 - v17;
    double volumeBarWidth = self->_volumeBarWidth;
    if (v21 < volumeBarWidth) {
      double volumeBarWidth = v21;
    }
  }
  else
  {
    double v17 = *MEMORY[0x263F001A8];
    double v19 = *(double *)(MEMORY[0x263F001A8] + 8);
    double volumeBarWidth = *(double *)(MEMORY[0x263F001A8] + 16);
    double v16 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  double v23 = v17;
  double v24 = v16;
  result.size.double height = v24;
  result.size.double width = volumeBarWidth;
  result.origin.double y = v19;
  result.origin.double x = v23;
  return result;
}

- (void)dealloc
{
  free(self->_points);
  free(self->_values);
  free(self->_volumeBars);
  v3.receiver = self;
  v3.super_class = (Class)StockGraphView;
  [(StockGraphView *)&v3 dealloc];
}

- (StockGraphViewContainer)chartViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chartViewDelegate);

  return (StockGraphViewContainer *)WeakRetained;
}

- (void)setChartViewDelegate:(id)a3
{
}

- (BOOL)isRendered
{
  return self->_isRendered;
}

- (UIEdgeInsets)graphInsets
{
  double top = self->_graphInsets.top;
  double left = self->_graphInsets.left;
  double bottom = self->_graphInsets.bottom;
  double right = self->_graphInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setGraphInsets:(UIEdgeInsets)a3
{
  self->_graphInsets = a3;
}

- (StockChartDisplayMode)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMode, 0);
  objc_storeStrong((id *)&self->_renderOperation, 0);
  objc_storeStrong((id *)&self->_dottedLinePositionsForStyleOnly, 0);
  objc_storeStrong((id *)&self->_dottedLinePositions, 0);
  objc_storeStrong((id *)&self->_linePointCounts, 0);
  objc_storeStrong((id *)&self->_chartData, 0);
  objc_destroyWeak((id *)&self->_chartViewDelegate);
  objc_storeStrong((id *)&self->_volumeView, 0);

  objc_storeStrong((id *)&self->_lineView, 0);
}

@end