@interface NTKRichComplicationRectangularDailyGraphView
+ (CGSize)graphSize;
+ (NSString)dailyFormattedNoData;
- (CGRect)cachedBounds;
- (CGRect)drawableGraphRect;
- (CGRect)graphRect;
- (CLKUIColoringLabel)titleLabel;
- (NSArray)timeMarkerLabels;
- (NTKRichComplicationRectangularDailyGraphView)init;
- (UIColor)accentColor;
- (UIColor)graphLabelAndGridColor;
- (UIColor)noDataTextColor;
- (UIColor)nonAccentColor;
- (UILabel)dailyHighLabel;
- (UILabel)dailyLowLabel;
- (double)_calculateGraphXBasedOnRect:(CGRect)a3 constants:(id *)a4;
- (double)_lineStrokeWidthGivenRect:(CGRect)a3;
- (double)timeMarkerPadding;
- (id)_datesForGraphInTimezone:(id)a3;
- (void)_addConstraints;
- (void)_addSubviews;
- (void)_applyPausedUpdate;
- (void)_drawVerticalHourLines:(CGContext *)a3 rect:(CGRect)a4 bottomLabelPadding:(double)a5;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
- (void)_updateTimeMarkerLabelsForDates:(id)a3 timezone:(id)a4;
- (void)drawRect:(CGRect)a3;
- (void)resetToNoDataState:(id)a3;
- (void)setAccentColor:(id)a3;
- (void)setCachedBounds:(CGRect)a3;
- (void)setGraphRect:(CGRect)a3;
- (void)setNonAccentColor:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKRichComplicationRectangularDailyGraphView

+ (NSString)dailyFormattedNoData
{
  return (NSString *)NTKClockFaceLocalizedString(@"DIGITAL_SIGNATURE_LARGE_RECTANGULAR_DAILY_HIGH_LOW_NO_DATA", @"--");
}

+ (CGSize)graphSize
{
  if (graphSize_onceToken != -1) {
    dispatch_once(&graphSize_onceToken, &__block_literal_global_14);
  }
  double v2 = *(double *)&graphSize_Size_0;
  double v3 = *(double *)&graphSize_Size_1;
  result.height = v3;
  result.width = v2;
  return result;
}

double __57__NTKRichComplicationRectangularDailyGraphView_graphSize__block_invoke()
{
  uint64_t v4 = 0;
  long long v3 = 0u;
  v0 = objc_msgSend(MEMORY[0x1E4F19A30], "currentDevice", 0, 0, 0, 0, 0, 0, 0, 0, 0);
  _LayoutConstants_1(v0, (uint64_t)&v2);

  double result = *((double *)&v3 + 1);
  graphSize_Size_0 = *((void *)&v3 + 1);
  graphSize_Size_1 = v4;
  return result;
}

- (NTKRichComplicationRectangularDailyGraphView)init
{
  v14.receiver = self;
  v14.super_class = (Class)NTKRichComplicationRectangularDailyGraphView;
  long long v2 = [(NTKRichComplicationRectangularBaseView *)&v14 init];
  long long v3 = v2;
  if (v2)
  {
    v2->_timeLabelAndGridAlpha = 0.25;
    v2->_noDataAlpha = 0.5;
    uint64_t v4 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.5];
    noDataTextColor = v3->_noDataTextColor;
    v3->_noDataTextColor = (UIColor *)v4;

    uint64_t v6 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:v3->_timeLabelAndGridAlpha];
    graphLabelAndGridColor = v3->_graphLabelAndGridColor;
    v3->_graphLabelAndGridColor = (UIColor *)v6;

    CGSize v8 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v3->_cachedBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v3->_cachedBounds.size = v8;
    uint64_t v9 = [MEMORY[0x1E4FB1618] whiteColor];
    accentColor = v3->_accentColor;
    v3->_accentColor = (UIColor *)v9;

    uint64_t v11 = [MEMORY[0x1E4FB1618] whiteColor];
    nonAccentColor = v3->_nonAccentColor;
    v3->_nonAccentColor = (UIColor *)v11;

    [(NTKRichComplicationRectangularDailyGraphView *)v3 _addSubviews];
    [(NTKRichComplicationRectangularDailyGraphView *)v3 _addConstraints];
  }
  return v3;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGContextClearRect(CurrentContext, v19);
  CGContextSetAllowsAntialiasing(CurrentContext, 1);
  [(NTKRichComplicationRectangularDailyGraphView *)self graphRect];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [(NTKRichComplicationRectangularDailyGraphView *)self timeMarkerPadding];
  -[NTKRichComplicationRectangularDailyGraphView _drawVerticalHourLines:rect:bottomLabelPadding:](self, "_drawVerticalHourLines:rect:bottomLabelPadding:", CurrentContext, v10, v12, v14, v16, v17);
  [(NTKRichComplicationRectangularDailyGraphView *)self drawableGraphRect];

  -[NTKRichComplicationRectangularDailyGraphView drawGraph:rect:](self, "drawGraph:rect:", CurrentContext);
}

- (void)resetToNoDataState:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F19AB0] textProviderWithText:a3];
  v5 = [(NTKRichComplicationRectangularDailyGraphView *)self titleLabel];
  [v5 setTextProvider:v4];

  uint64_t v6 = [(NTKRichComplicationRectangularDailyGraphView *)self noDataTextColor];
  v7 = [(NTKRichComplicationRectangularDailyGraphView *)self titleLabel];
  [v7 setColor:v6];

  CGSize v8 = +[NTKRichComplicationRectangularDailyGraphView dailyFormattedNoData];
  double v9 = [(NTKRichComplicationRectangularDailyGraphView *)self dailyHighLabel];
  [v9 setText:v8];

  double v10 = [(NTKRichComplicationRectangularDailyGraphView *)self noDataTextColor];
  double v11 = [(NTKRichComplicationRectangularDailyGraphView *)self dailyHighLabel];
  [v11 setTextColor:v10];

  double v12 = +[NTKRichComplicationRectangularDailyGraphView dailyFormattedNoData];
  double v13 = [(NTKRichComplicationRectangularDailyGraphView *)self dailyLowLabel];
  [v13 setText:v12];

  id v15 = [(NTKRichComplicationRectangularDailyGraphView *)self noDataTextColor];
  double v14 = [(NTKRichComplicationRectangularDailyGraphView *)self dailyLowLabel];
  [v14 setTextColor:v15];
}

- (void)_addConstraints
{
  uint64_t v53 = 0;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v48 = 0u;
  long long v3 = [(CDRichComplicationView *)self device];
  _LayoutConstants_1(v3, (uint64_t)&v48);

  uint64_t v4 = [(NTKRichComplicationRectangularDailyGraphView *)self titleLabel];
  v5 = [v4 leadingAnchor];
  uint64_t v6 = [(NTKRichComplicationRectangularDailyGraphView *)self leadingAnchor];
  [(NTKRichComplicationRectangularBaseView *)self contentMargin];
  v38 = objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6);

  v7 = [(NTKRichComplicationRectangularDailyGraphView *)self trailingAnchor];
  CGSize v8 = [(NTKRichComplicationRectangularDailyGraphView *)self titleLabel];
  double v9 = [v8 trailingAnchor];
  [(NTKRichComplicationRectangularBaseView *)self contentMargin];
  double v10 = objc_msgSend(v7, "constraintGreaterThanOrEqualToAnchor:constant:", v9);

  LODWORD(v11) = 1148829696;
  [v10 setPriority:v11];
  double v12 = [(NTKRichComplicationRectangularDailyGraphView *)self titleLabel];
  double v13 = [v12 firstBaselineAnchor];
  double v14 = [(NTKRichComplicationRectangularDailyGraphView *)self topAnchor];
  v37 = [v13 constraintEqualToAnchor:v14 constant:*((double *)&v48 + 1)];

  id v15 = [(NTKRichComplicationRectangularDailyGraphView *)self dailyHighLabel];
  double v16 = [v15 leadingAnchor];
  double v17 = [(NTKRichComplicationRectangularDailyGraphView *)self leadingAnchor];
  [(NTKRichComplicationRectangularBaseView *)self contentMargin];
  v18 = objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17);

  CGRect v19 = [(NTKRichComplicationRectangularDailyGraphView *)self dailyHighLabel];
  v20 = [v19 firstBaselineAnchor];
  v21 = [(NTKRichComplicationRectangularDailyGraphView *)self topAnchor];
  v22 = [v20 constraintEqualToAnchor:v21 constant:*((double *)&v49 + 1)];

  v23 = [(NTKRichComplicationRectangularDailyGraphView *)self dailyLowLabel];
  v24 = [v23 leadingAnchor];
  v25 = [(NTKRichComplicationRectangularDailyGraphView *)self dailyHighLabel];
  v26 = [v25 leadingAnchor];
  v27 = [v24 constraintEqualToAnchor:v26];

  v28 = [(NTKRichComplicationRectangularDailyGraphView *)self dailyLowLabel];
  v29 = [v28 firstBaselineAnchor];
  v30 = [(NTKRichComplicationRectangularDailyGraphView *)self dailyHighLabel];
  v31 = [v30 firstBaselineAnchor];
  v32 = [v29 constraintEqualToAnchor:v31 constant:*((double *)&v50 + 1)];

  v33 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", v38, v10, v37, v18, v22, v27, v32, 0);
  double v34 = *((double *)&v52 + 1) * 0.25;
  v35 = [(NTKRichComplicationRectangularDailyGraphView *)self timeMarkerLabels];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __63__NTKRichComplicationRectangularDailyGraphView__addConstraints__block_invoke;
  v39[3] = &unk_1E62C1210;
  double v41 = v34;
  long long v44 = v50;
  long long v45 = v51;
  long long v46 = v52;
  uint64_t v47 = v53;
  long long v42 = v48;
  long long v43 = v49;
  v39[4] = self;
  id v40 = v33;
  id v36 = v33;
  [v35 enumerateObjectsUsingBlock:v39];

  [MEMORY[0x1E4F28DC8] activateConstraints:v36];
}

void __63__NTKRichComplicationRectangularDailyGraphView__addConstraints__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v24 = a2;
  double v5 = 0.0;
  if (a3) {
    double v5 = 1.0;
  }
  double v6 = 2.0 - v5;
  double v7 = 2.0 - v5 + (double)a3 * *(double *)(a1 + 48);
  if (CLKLayoutIsRTL())
  {
    [*(id *)(a1 + 32) contentMargin];
    double v9 = v7 + v8;
    double v10 = *(void **)(a1 + 40);
    double v11 = [v24 leftAnchor];
    double v12 = *(void **)(a1 + 32);
  }
  else
  {
    double v13 = *(double *)(a1 + 128);
    [*(id *)(a1 + 32) contentMargin];
    double v9 = v13 + v14 - v7;
    double v10 = *(void **)(a1 + 40);
    double v11 = [*(id *)(a1 + 32) rightAnchor];
    double v12 = v24;
  }
  id v15 = [v12 leftAnchor];
  double v16 = [v11 constraintEqualToAnchor:v15 constant:v9];
  [v10 addObject:v16];

  double v17 = *(void **)(a1 + 40);
  v18 = [v24 widthAnchor];
  CGRect v19 = [v18 constraintEqualToConstant:*(double *)(a1 + 48) + v6 * -2.0];
  [v17 addObject:v19];

  v20 = *(void **)(a1 + 40);
  v21 = [*(id *)(a1 + 32) bottomAnchor];
  v22 = [v24 firstBaselineAnchor];
  v23 = [v21 constraintEqualToAnchor:v22 constant:*(double *)(a1 + 112)];
  [v20 addObject:v23];
}

- (void)_addSubviews
{
  uint64_t v34 = 0;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  long long v3 = [(CDRichComplicationView *)self device];
  _LayoutConstants_1(v3, (uint64_t)&v29);

  uint64_t v4 = (void *)MEMORY[0x1E4F19680];
  double v5 = [MEMORY[0x1E4F19A50] systemFontOfSize:*MEMORY[0x1E4F19680] weight:*(double *)&v29 design:*MEMORY[0x1E4FB09D0]];
  double v6 = [v5 CLKFontWithLocalizedSmallCaps];

  double v7 = (CLKUIColoringLabel *)objc_opt_new();
  double v8 = [MEMORY[0x1E4FB1618] whiteColor];
  [(CLKUIColoringLabel *)v7 setTextColor:v8];

  [(CLKUIColoringLabel *)v7 setFont:v6];
  [(CLKUIColoringLabel *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CLKUIColoringLabel *)v7 setUsesTextProviderTintColoring:1];
  [(CLKUIColoringLabel *)v7 setTwoToneStyleInMonochrome:1];
  [(CLKUIColoringLabel *)v7 setFilterProvider:self];
  [(NTKRichComplicationRectangularDailyGraphView *)self addSubview:v7];

  titleLabel = self->_titleLabel;
  self->_titleLabel = v7;

  double v10 = (UILabel *)objc_opt_new();
  double v11 = *MEMORY[0x1E4FB09E0];
  double v12 = [MEMORY[0x1E4F19A50] systemFontOfSize:*v4 weight:*(double *)&v30 design:*MEMORY[0x1E4FB09E0]];
  double v13 = [v12 CLKFontWithAlternativePunctuation];
  [(UILabel *)v10 setFont:v13];

  double v14 = [(NTKRichComplicationRectangularDailyGraphView *)self accentColor];
  [(UILabel *)v10 setTextColor:v14];

  [(UILabel *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(NTKRichComplicationRectangularDailyGraphView *)self addSubview:v10];
  dailyHighLabel = self->_dailyHighLabel;
  self->_dailyHighLabel = v10;

  double v16 = (UILabel *)objc_opt_new();
  double v17 = [MEMORY[0x1E4F19A50] systemFontOfSize:*v4 weight:*(double *)&v31 design:v11];
  v18 = [v17 CLKFontWithAlternativePunctuation];
  [(UILabel *)v16 setFont:v18];

  CGRect v19 = [(NTKRichComplicationRectangularDailyGraphView *)self accentColor];
  [(UILabel *)v16 setTextColor:v19];

  [(UILabel *)v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(NTKRichComplicationRectangularDailyGraphView *)self addSubview:v16];
  dailyLowLabel = self->_dailyLowLabel;
  self->_dailyLowLabel = v16;

  uint64_t v21 = 4;
  v22 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
  double v23 = *(double *)&v32;
  do
  {
    id v24 = objc_opt_new();
    [v24 setAdjustsFontSizeToFitWidth:1];
    v25 = [MEMORY[0x1E4F19A50] systemFontOfSize:*v4 weight:v23 design:v11];
    [v24 setFont:v25];

    [v24 setMinimumScaleFactor:0.85];
    v26 = [(NTKRichComplicationRectangularDailyGraphView *)self graphLabelAndGridColor];
    [v24 setTextColor:v26];

    [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v24 setTextAlignment:0];
    [(NTKRichComplicationRectangularDailyGraphView *)self addSubview:v24];
    [v22 addObject:v24];

    --v21;
  }
  while (v21);
  v27 = (NSArray *)[v22 copy];

  timeMarkerLabels = self->_timeMarkerLabels;
  self->_timeMarkerLabels = v27;
}

- (double)_calculateGraphXBasedOnRect:(CGRect)a3 constants:(id *)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (CLKLayoutIsRTL())
  {
    [(NTKRichComplicationRectangularBaseView *)self contentMargin];
  }
  else
  {
    v14.origin.CGFloat x = x;
    v14.origin.CGFloat y = y;
    v14.size.CGFloat width = width;
    v14.size.CGFloat height = height;
    double v11 = CGRectGetWidth(v14);
    [(NTKRichComplicationRectangularBaseView *)self contentMargin];
    return v11 - (v12 + a4->var9);
  }
  return result;
}

- (id)_datesForGraphInTimezone:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  double v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  double v6 = [v5 componentsInTimeZone:v3 fromDate:v4];
  double v7 = objc_msgSend(v4, "dateByAddingTimeInterval:", (double)objc_msgSend(v6, "minute") * -60.0+ (double)objc_msgSend(v6, "hour") * -3600.0- (double)objc_msgSend(v6, "second")+ -1.0);
  double v8 = [v5 components:192 fromDate:v7];

  [v8 setSecond:0];
  [v8 setMinute:0];
  double v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:24];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  int v20 = 0;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __73__NTKRichComplicationRectangularDailyGraphView__datesForGraphInTimezone___block_invoke;
  double v16 = &unk_1E62C1238;
  id v10 = v9;
  id v17 = v10;
  v18 = v19;
  [v5 enumerateDatesStartingAfterDate:v7 matchingComponents:v8 options:2 usingBlock:&v13];
  double v11 = objc_msgSend(v10, "copy", v13, v14, v15, v16);

  _Block_object_dispose(v19, 8);

  return v11;
}

uint64_t __73__NTKRichComplicationRectangularDailyGraphView__datesForGraphInTimezone___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) addObject:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  int v8 = *(_DWORD *)(v7 + 24);
  *(_DWORD *)(v7 + 24) = v8 + 1;
  if (v8 >= 23) {
    *a4 = 1;
  }
  return result;
}

- (void)_drawVerticalHourLines:(CGContext *)a3 rect:(CGRect)a4 bottomLabelPadding:(double)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  CGContextSaveGState(a3);
  CGContextSetLineWidth(a3, 1.0);
  id v12 = [(NTKRichComplicationRectangularDailyGraphView *)self graphLabelAndGridColor];
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)[v12 CGColor]);

  v21.origin.double x = x;
  v21.origin.double y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  unint64_t v13 = 0;
  double v14 = CGRectGetHeight(v21) - a5;
  do
  {
    v22.origin.double x = x;
    v22.origin.double y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    double v15 = CGRectGetWidth(v22);
    HIDWORD(v16) = -1431655765 * v13;
    LODWORD(v16) = HIDWORD(v16);
    double v17 = v14;
    if ((v16 >> 1) <= 0x2AAAAAAA)
    {
      v23.origin.double x = x;
      v23.origin.double y = y;
      v23.size.CGFloat width = width;
      v23.size.CGFloat height = height;
      double v17 = CGRectGetHeight(v23);
    }
    CGFloat v18 = x + (double)v13 / 24.0 * v15;
    CGFloat v19 = y + v17;
    CGContextBeginPath(a3);
    CGContextMoveToPoint(a3, v18, y);
    CGContextAddLineToPoint(a3, v18, v19);
    CGContextStrokePath(a3);
    ++v13;
  }
  while (v13 != 25);

  CGContextRestoreGState(a3);
}

- (double)_lineStrokeWidthGivenRect:(CGRect)a3
{
  return (CGRectGetWidth(a3) + -25.0) / 24.0;
}

- (void)_updateTimeMarkerLabelsForDates:(id)a3 timezone:(id)a4
{
  id v35 = a3;
  id v6 = a4;
  if (!_updateTimeMarkerLabelsForDates_timezone__TimeFormatter)
  {
    uint64_t v7 = objc_opt_new();
    int v8 = (void *)_updateTimeMarkerLabelsForDates_timezone__TimeFormatter;
    _updateTimeMarkerLabelsForDates_timezone__TimeFormatter = v7;
  }
  double v9 = (void *)MEMORY[0x1E4F1CA20];
  id v10 = [MEMORY[0x1E4F28B50] mainBundle];
  double v11 = [v10 preferredLocalizations];
  id v12 = [v11 firstObject];
  unint64_t v13 = [v9 localeWithLocaleIdentifier:v12];

  double v14 = [v13 languageCode];
  LODWORD(v11) = [@"zh" isEqualToString:v14];

  if (v11) {
    double v15 = @"J";
  }
  else {
    double v15 = @"j";
  }
  unint64_t v16 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:v15 options:0 locale:v13];
  [(id)_updateTimeMarkerLabelsForDates_timezone__TimeFormatter setDateFormat:v16];

  uint64_t v34 = v6;
  [(id)_updateTimeMarkerLabelsForDates_timezone__TimeFormatter setTimeZone:v6];
  unint64_t v17 = [v35 count];
  CGFloat v18 = [(NTKRichComplicationRectangularDailyGraphView *)self timeMarkerLabels];
  unint64_t v19 = [v18 count];

  int v20 = [(NTKRichComplicationRectangularDailyGraphView *)self timeMarkerLabels];
  uint64_t v21 = [v20 count];

  if (v21)
  {
    unint64_t v22 = 0;
    unint64_t v23 = v17 / v19;
    do
    {
      id v24 = [v35 objectAtIndexedSubscript:v22 * v23];
      v25 = [(id)_updateTimeMarkerLabelsForDates_timezone__TimeFormatter stringFromDate:v24];
      v26 = [v25 uppercaseStringWithLocale:v13];

      v27 = [v13 languageCode];
      char v28 = [@"hi" isEqualToString:v27];

      if ((v28 & 1) == 0)
      {
        uint64_t v29 = [v26 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F1635E90];

        v26 = (void *)v29;
      }
      long long v30 = [(NTKRichComplicationRectangularDailyGraphView *)self timeMarkerLabels];
      long long v31 = [v30 objectAtIndexedSubscript:v22];
      [v31 setText:v26];

      ++v22;
      long long v32 = [(NTKRichComplicationRectangularDailyGraphView *)self timeMarkerLabels];
      unint64_t v33 = [v32 count];
    }
    while (v22 < v33);
  }
}

- (void)_applyPausedUpdate
{
  BOOL v3 = [(CDRichComplicationView *)self paused];
  id v5 = [(NTKRichComplicationRectangularDailyGraphView *)self titleLabel];
  uint64_t v4 = [v5 textProvider];
  [v4 setPaused:v3];
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v10 = [a3 metadata];
  id v5 = [v10 objectForKeyedSubscript:@"NTKDailyGraphRichComplicationMetadataKeyTimeZone"];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  }
  int v8 = v7;

  double v9 = [(NTKRichComplicationRectangularDailyGraphView *)self _datesForGraphInTimezone:v8];
  [(NTKRichComplicationRectangularDailyGraphView *)self _updateTimeMarkerLabelsForDates:v9 timezone:v8];

  [(NTKRichComplicationRectangularDailyGraphView *)self loadWithMetadata:v10];
}

- (CGRect)drawableGraphRect
{
  [(NTKRichComplicationRectangularDailyGraphView *)self graphRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  int IsRTL = CLKLayoutIsRTL();
  double v12 = -0.5;
  if (IsRTL) {
    double v12 = 0.5;
  }
  double v13 = v4 + v12;
  [(NTKRichComplicationRectangularDailyGraphView *)self timeMarkerPadding];
  double v15 = v10 - v14;
  double v16 = v13;
  double v17 = v6;
  double v18 = v8;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (CGRect)graphRect
{
  [(NTKRichComplicationRectangularDailyGraphView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(NTKRichComplicationRectangularDailyGraphView *)self cachedBounds];
  v41.origin.double x = v11;
  v41.origin.double y = v12;
  v41.size.double width = v13;
  v41.size.double height = v14;
  v38.origin.double x = v4;
  v38.origin.double y = v6;
  v38.size.double width = v8;
  v38.size.double height = v10;
  if (!CGRectEqualToRect(v38, v41))
  {
    [(NTKRichComplicationRectangularDailyGraphView *)self bounds];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v37 = 0.0;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v32 = 0u;
    unint64_t v23 = [(CDRichComplicationView *)self device];
    _LayoutConstants_1(v23, (uint64_t)&v32);

    v30[2] = v34;
    v30[3] = v35;
    v30[4] = v36;
    double v31 = v37;
    v30[0] = v32;
    v30[1] = v33;
    -[NTKRichComplicationRectangularDailyGraphView _calculateGraphXBasedOnRect:constants:](self, "_calculateGraphXBasedOnRect:constants:", v30, v16, v18, v20, v22);
    double v25 = v24;
    v39.origin.double x = v16;
    v39.origin.double y = v18;
    v39.size.double width = v20;
    v39.size.double height = v22;
    -[NTKRichComplicationRectangularDailyGraphView setGraphRect:](self, "setGraphRect:", v25, CGRectGetHeight(v39) - (*((double *)&v35 + 1) + v37), *((double *)&v36 + 1));
    -[NTKRichComplicationRectangularDailyGraphView setCachedBounds:](self, "setCachedBounds:", v16, v18, v20, v22);
  }
  double x = self->_graphRect.origin.x;
  double y = self->_graphRect.origin.y;
  double width = self->_graphRect.size.width;
  double height = self->_graphRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)timeMarkerPadding
{
  uint64_t v10 = 0;
  long long v9 = 0u;
  double v3 = [(CDRichComplicationView *)self device];
  _LayoutConstants_1(v3, (uint64_t)&v8);

  CGFloat v4 = [(NTKRichComplicationRectangularDailyGraphView *)self timeMarkerLabels];
  double v5 = [v4 firstObject];
  [v5 frame];
  double v6 = CGRectGetHeight(v11) - *(double *)&v9;

  return v6;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  [(CLKUIColoringLabel *)self->_titleLabel transitionToMonochromeWithFraction:2 style:a3];
  CGFloat v4 = [(CDRichComplicationView *)self filterProvider];
  double v5 = [v4 colorForView:self accented:1];
  accentColor = self->_accentColor;
  self->_accentColor = v5;

  double v7 = [(CDRichComplicationView *)self filterProvider];
  long long v8 = [v7 colorForView:self accented:0];
  nonAccentColor = self->_nonAccentColor;
  self->_nonAccentColor = v8;

  uint64_t v10 = [(UIColor *)self->_nonAccentColor colorWithAlphaComponent:self->_noDataAlpha];
  noDataTextColor = self->_noDataTextColor;
  self->_noDataTextColor = v10;

  CGFloat v12 = [(UIColor *)self->_nonAccentColor colorWithAlphaComponent:self->_timeLabelAndGridAlpha];
  graphLabelAndGridColor = self->_graphLabelAndGridColor;
  self->_graphLabelAndGridColor = v12;

  CGFloat v14 = [(NTKRichComplicationRectangularDailyGraphView *)self timeMarkerLabels];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __83__NTKRichComplicationRectangularDailyGraphView_transitionToMonochromeWithFraction___block_invoke;
  void v19[3] = &unk_1E62C1260;
  v19[4] = self;
  [v14 enumerateObjectsUsingBlock:v19];

  double v15 = self->_accentColor;
  double v16 = [(NTKRichComplicationRectangularDailyGraphView *)self dailyLowLabel];
  [v16 setTextColor:v15];

  double v17 = self->_accentColor;
  double v18 = [(NTKRichComplicationRectangularDailyGraphView *)self dailyHighLabel];
  [v18 setTextColor:v17];

  [(NTKRichComplicationRectangularDailyGraphView *)self setNeedsDisplay];
}

void __83__NTKRichComplicationRectangularDailyGraphView_transitionToMonochromeWithFraction___block_invoke(uint64_t a1, void *a2)
{
  long long v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 graphLabelAndGridColor];
  [v3 setTextColor:v4];
}

- (void)updateMonochromeColor
{
  [(CLKUIColoringLabel *)self->_titleLabel updateMonochromeColorWithStyle:2];
  id v3 = [(CDRichComplicationView *)self filterProvider];
  id v4 = [v3 colorForView:self accented:1];
  accentColor = self->_accentColor;
  self->_accentColor = v4;

  double v6 = [(CDRichComplicationView *)self filterProvider];
  double v7 = [v6 colorForView:self accented:0];
  nonAccentColor = self->_nonAccentColor;
  self->_nonAccentColor = v7;

  long long v9 = [(UIColor *)self->_nonAccentColor colorWithAlphaComponent:self->_noDataAlpha];
  noDataTextColor = self->_noDataTextColor;
  self->_noDataTextColor = v9;

  CGRect v11 = [(UIColor *)self->_nonAccentColor colorWithAlphaComponent:self->_timeLabelAndGridAlpha];
  graphLabelAndGridColor = self->_graphLabelAndGridColor;
  self->_graphLabelAndGridColor = v11;

  CGFloat v13 = [(NTKRichComplicationRectangularDailyGraphView *)self timeMarkerLabels];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __69__NTKRichComplicationRectangularDailyGraphView_updateMonochromeColor__block_invoke;
  v18[3] = &unk_1E62C1260;
  v18[4] = self;
  [v13 enumerateObjectsUsingBlock:v18];

  CGFloat v14 = self->_accentColor;
  double v15 = [(NTKRichComplicationRectangularDailyGraphView *)self dailyLowLabel];
  [v15 setTextColor:v14];

  double v16 = self->_accentColor;
  double v17 = [(NTKRichComplicationRectangularDailyGraphView *)self dailyHighLabel];
  [v17 setTextColor:v16];

  [(NTKRichComplicationRectangularDailyGraphView *)self setNeedsDisplay];
}

void __69__NTKRichComplicationRectangularDailyGraphView_updateMonochromeColor__block_invoke(uint64_t a1, void *a2)
{
  long long v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 graphLabelAndGridColor];
  [v3 setTextColor:v4];
}

- (CLKUIColoringLabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)dailyHighLabel
{
  return self->_dailyHighLabel;
}

- (UILabel)dailyLowLabel
{
  return self->_dailyLowLabel;
}

- (UIColor)accentColor
{
  return self->_accentColor;
}

- (void)setAccentColor:(id)a3
{
}

- (UIColor)nonAccentColor
{
  return self->_nonAccentColor;
}

- (void)setNonAccentColor:(id)a3
{
}

- (CGRect)cachedBounds
{
  double x = self->_cachedBounds.origin.x;
  double y = self->_cachedBounds.origin.y;
  double width = self->_cachedBounds.size.width;
  double height = self->_cachedBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCachedBounds:(CGRect)a3
{
  self->_cachedBounds = a3;
}

- (void)setGraphRect:(CGRect)a3
{
  self->_graphRect = a3;
}

- (UIColor)noDataTextColor
{
  return self->_noDataTextColor;
}

- (UIColor)graphLabelAndGridColor
{
  return self->_graphLabelAndGridColor;
}

- (NSArray)timeMarkerLabels
{
  return self->_timeMarkerLabels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeMarkerLabels, 0);
  objc_storeStrong((id *)&self->_graphLabelAndGridColor, 0);
  objc_storeStrong((id *)&self->_noDataTextColor, 0);
  objc_storeStrong((id *)&self->_nonAccentColor, 0);
  objc_storeStrong((id *)&self->_accentColor, 0);
  objc_storeStrong((id *)&self->_dailyLowLabel, 0);
  objc_storeStrong((id *)&self->_dailyHighLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end