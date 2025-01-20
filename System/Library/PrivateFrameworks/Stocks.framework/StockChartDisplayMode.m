@interface StockChartDisplayMode
+ (id)defaultDisplayMode;
- (BOOL)HUDEnabled;
- (BOOL)graphOverlapsYAxisLabels;
- (BOOL)isEqual:(id)a3;
- (BOOL)showsPriceLabelForPreviousClose;
- (BOOL)showsVolume;
- (BOOL)usesDetailedAxisLabels;
- (CGGradient)backgroundGradient;
- (CGSize)chartSize;
- (StockChartDisplayMode)init;
- (UIColor)axisLabelsColor;
- (UIColor)backgroundLinesColor;
- (UIColor)lineColor;
- (UIColor)xAxisKeylineColor;
- (UIEdgeInsets)chartRenderingInsets;
- (UIEdgeInsets)lineGraphInsets;
- (double)gutterHeight;
- (double)intervalRowHeight;
- (double)lineGraphBottomPadding;
- (double)lineWidth;
- (double)showsTitle;
- (double)volumeHeight;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)maxInterval;
- (unint64_t)hash;
- (unint64_t)horizontalGridlineCount;
- (unint64_t)yAxisLabelCount;
- (void)dealloc;
- (void)setAxisLabelsColor:(id)a3;
- (void)setBackgroundGradient:(CGGradient *)a3;
- (void)setBackgroundLinesColor:(id)a3;
- (void)setChartRenderingInsets:(UIEdgeInsets)a3;
- (void)setChartSize:(CGSize)a3;
- (void)setGraphOverlapsYAxisLabels:(BOOL)a3;
- (void)setHUDEnabled:(BOOL)a3;
- (void)setHorizontalGridlineCount:(unint64_t)a3;
- (void)setIntervalRowHeight:(double)a3;
- (void)setLineColor:(id)a3;
- (void)setLineGraphInsets:(UIEdgeInsets)a3;
- (void)setLineWidth:(double)a3;
- (void)setMaxInterval:(int64_t)a3;
- (void)setShowsPriceLabelForPreviousClose:(BOOL)a3;
- (void)setShowsTitle:(double)a3;
- (void)setShowsVolume:(BOOL)a3;
- (void)setUsesDetailedAxisLabels:(BOOL)a3;
- (void)setVolumeHeight:(double)a3;
- (void)setXAxisKeylineColor:(id)a3;
- (void)setYAxisLabelCount:(unint64_t)a3;
@end

@implementation StockChartDisplayMode

+ (id)defaultDisplayMode
{
  v2 = objc_alloc_init(StockChartDisplayMode);

  return v2;
}

- (StockChartDisplayMode)init
{
  v12.receiver = self;
  v12.super_class = (Class)StockChartDisplayMode;
  v2 = [(StockChartDisplayMode *)&v12 init];
  v3 = v2;
  if (v2)
  {
    [(StockChartDisplayMode *)v2 setLineWidth:2.5];
    v4 = [MEMORY[0x263F1C550] colorWithWhite:0.450980392 alpha:0.4];
    [(StockChartDisplayMode *)v3 setBackgroundLinesColor:v4];

    v5 = [MEMORY[0x263F1C550] colorWithWhite:0.980392157 alpha:1.0];
    [(StockChartDisplayMode *)v3 setLineColor:v5];

    v6 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.8];
    [(StockChartDisplayMode *)v3 setXAxisKeylineColor:v6];

    v7 = [MEMORY[0x263F1C550] whiteColor];
    [(StockChartDisplayMode *)v3 setAxisLabelsColor:v7];

    [(StockChartDisplayMode *)v3 setVolumeHeight:RoundToPixel(19.5)];
    [(StockChartDisplayMode *)v3 setYAxisLabelCount:5];
    [(StockChartDisplayMode *)v3 setMaxInterval:6];
    [(StockChartDisplayMode *)v3 setIntervalRowHeight:34.5];
    [(StockChartDisplayMode *)v3 setShowsVolume:1];
    -[StockChartDisplayMode setChartRenderingInsets:](v3, "setChartRenderingInsets:", 0.0, 16.0, 0.0, 16.0);
    v8 = [MEMORY[0x263F08C38] UUID];
    uint64_t v9 = [v8 UUIDString];
    hash = v3->_hash;
    v3->_hash = (NSString *)v9;
  }
  return v3;
}

- (void)dealloc
{
  backgroundGradient = self->_backgroundGradient;
  if (backgroundGradient) {
    CGGradientRelease(backgroundGradient);
  }
  v4.receiver = self;
  v4.super_class = (Class)StockChartDisplayMode;
  [(StockChartDisplayMode *)&v4 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(NSString *)self->_hash copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  [(StockChartDisplayMode *)self chartSize];
  objc_msgSend(v4, "setChartSize:");
  objc_msgSend(v4, "setShowsVolume:", -[StockChartDisplayMode showsVolume](self, "showsVolume"));
  objc_msgSend(v4, "setMaxInterval:", -[StockChartDisplayMode maxInterval](self, "maxInterval"));
  objc_msgSend(v4, "setHUDEnabled:", -[StockChartDisplayMode HUDEnabled](self, "HUDEnabled"));
  [(StockChartDisplayMode *)self showsTitle];
  objc_msgSend(v4, "setShowsTitle:");
  objc_msgSend(v4, "setYAxisLabelCount:", -[StockChartDisplayMode yAxisLabelCount](self, "yAxisLabelCount"));
  objc_msgSend(v4, "setHorizontalGridlineCount:", -[StockChartDisplayMode horizontalGridlineCount](self, "horizontalGridlineCount"));
  objc_msgSend(v4, "setShowsPriceLabelForPreviousClose:", -[StockChartDisplayMode showsPriceLabelForPreviousClose](self, "showsPriceLabelForPreviousClose"));
  objc_msgSend(v4, "setUsesDetailedAxisLabels:", -[StockChartDisplayMode usesDetailedAxisLabels](self, "usesDetailedAxisLabels"));
  [(StockChartDisplayMode *)self lineGraphInsets];
  objc_msgSend(v4, "setLineGraphInsets:");
  objc_msgSend(v4, "setGraphOverlapsYAxisLabels:", -[StockChartDisplayMode graphOverlapsYAxisLabels](self, "graphOverlapsYAxisLabels"));
  [(StockChartDisplayMode *)self volumeHeight];
  objc_msgSend(v4, "setVolumeHeight:");
  [(StockChartDisplayMode *)self intervalRowHeight];
  objc_msgSend(v4, "setIntervalRowHeight:");
  objc_msgSend(v4, "setYAxisLabelCount:", -[StockChartDisplayMode yAxisLabelCount](self, "yAxisLabelCount"));
  [(StockChartDisplayMode *)self lineWidth];
  objc_msgSend(v4, "setLineWidth:");
  v7 = [(StockChartDisplayMode *)self lineColor];
  [v4 setLineColor:v7];

  v8 = [(StockChartDisplayMode *)self backgroundLinesColor];
  [v4 setBackgroundLinesColor:v8];

  uint64_t v9 = [(StockChartDisplayMode *)self xAxisKeylineColor];
  [v4 setXAxisKeylineColor:v9];

  v10 = [(StockChartDisplayMode *)self axisLabelsColor];
  [v4 setAxisLabelsColor:v10];

  objc_msgSend(v4, "setBackgroundGradient:", -[StockChartDisplayMode backgroundGradient](self, "backgroundGradient"));
  return v4;
}

- (unint64_t)hash
{
  return [(NSString *)self->_hash hash];
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (StockChartDisplayMode *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = [(NSString *)v4->_hash isEqualToString:self->_hash];
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)StockChartDisplayMode;
  v3 = [(StockChartDisplayMode *)&v7 description];
  objc_super v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
  [(StockChartDisplayMode *)self chartSize];
  char v5 = NSStringFromCGSize(v9);
  [v4 appendFormat:@"; chart size %@>", v5];

  return v4;
}

- (void)setBackgroundGradient:(CGGradient *)a3
{
  backgroundGradient = self->_backgroundGradient;
  if (backgroundGradient != a3)
  {
    if (backgroundGradient) {
      CGGradientRelease(backgroundGradient);
    }
    self->_backgroundGradient = a3;
    if (a3)
    {
      CGGradientRetain(a3);
    }
  }
}

- (double)gutterHeight
{
  [(StockChartDisplayMode *)self volumeHeight];
  return v2 + 18.0;
}

- (double)lineGraphBottomPadding
{
  [(StockChartDisplayMode *)self gutterHeight];
  return v2 + 17.0;
}

- (CGSize)chartSize
{
  double width = self->_chartSize.width;
  double height = self->_chartSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setChartSize:(CGSize)a3
{
  self->_chartSize = a3;
}

- (BOOL)showsVolume
{
  return self->_showsVolume;
}

- (void)setShowsVolume:(BOOL)a3
{
  self->_showsVolume = a3;
}

- (int64_t)maxInterval
{
  return self->_maxInterval;
}

- (void)setMaxInterval:(int64_t)a3
{
  self->_maxInterval = a3;
}

- (BOOL)HUDEnabled
{
  return self->_HUDEnabled;
}

- (void)setHUDEnabled:(BOOL)a3
{
  self->_HUDEnabled = a3;
}

- (double)showsTitle
{
  return self->_showsTitle;
}

- (void)setShowsTitle:(double)a3
{
  self->_showsTitle = a3;
}

- (unint64_t)yAxisLabelCount
{
  return self->_yAxisLabelCount;
}

- (void)setYAxisLabelCount:(unint64_t)a3
{
  self->_yAxisLabelCount = a3;
}

- (unint64_t)horizontalGridlineCount
{
  return self->_horizontalGridlineCount;
}

- (void)setHorizontalGridlineCount:(unint64_t)a3
{
  self->_horizontalGridlineCount = a3;
}

- (BOOL)showsPriceLabelForPreviousClose
{
  return self->_showsPriceLabelForPreviousClose;
}

- (void)setShowsPriceLabelForPreviousClose:(BOOL)a3
{
  self->_showsPriceLabelForPreviousClose = a3;
}

- (BOOL)usesDetailedAxisLabels
{
  return self->_usesDetailedAxisLabels;
}

- (void)setUsesDetailedAxisLabels:(BOOL)a3
{
  self->_usesDetailedAxisLabels = a3;
}

- (UIEdgeInsets)lineGraphInsets
{
  double top = self->_lineGraphInsets.top;
  double left = self->_lineGraphInsets.left;
  double bottom = self->_lineGraphInsets.bottom;
  double right = self->_lineGraphInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setLineGraphInsets:(UIEdgeInsets)a3
{
  self->_lineGraphInsets = a3;
}

- (BOOL)graphOverlapsYAxisLabels
{
  return self->_graphOverlapsYAxisLabels;
}

- (void)setGraphOverlapsYAxisLabels:(BOOL)a3
{
  self->_graphOverlapsYAxisLabels = a3;
}

- (double)volumeHeight
{
  return self->_volumeHeight;
}

- (void)setVolumeHeight:(double)a3
{
  self->_volumeHeight = a3;
}

- (double)intervalRowHeight
{
  return self->_intervalRowHeight;
}

- (void)setIntervalRowHeight:(double)a3
{
  self->_intervalRowHeight = a3;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (UIColor)lineColor
{
  return self->_lineColor;
}

- (void)setLineColor:(id)a3
{
}

- (UIColor)backgroundLinesColor
{
  return self->_backgroundLinesColor;
}

- (void)setBackgroundLinesColor:(id)a3
{
}

- (UIColor)xAxisKeylineColor
{
  return self->_xAxisKeylineColor;
}

- (void)setXAxisKeylineColor:(id)a3
{
}

- (UIColor)axisLabelsColor
{
  return self->_axisLabelsColor;
}

- (void)setAxisLabelsColor:(id)a3
{
}

- (CGGradient)backgroundGradient
{
  return self->_backgroundGradient;
}

- (UIEdgeInsets)chartRenderingInsets
{
  double top = self->_chartRenderingInsets.top;
  double left = self->_chartRenderingInsets.left;
  double bottom = self->_chartRenderingInsets.bottom;
  double right = self->_chartRenderingInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setChartRenderingInsets:(UIEdgeInsets)a3
{
  self->_chartRenderingInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axisLabelsColor, 0);
  objc_storeStrong((id *)&self->_xAxisKeylineColor, 0);
  objc_storeStrong((id *)&self->_backgroundLinesColor, 0);
  objc_storeStrong((id *)&self->_lineColor, 0);

  objc_storeStrong((id *)&self->_hash, 0);
}

@end