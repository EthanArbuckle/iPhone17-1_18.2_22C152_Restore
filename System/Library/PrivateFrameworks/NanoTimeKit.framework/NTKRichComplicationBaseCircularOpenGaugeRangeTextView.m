@interface NTKRichComplicationBaseCircularOpenGaugeRangeTextView
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
+ (int64_t)progressFillStyle;
- (CDRichComplicationCurvedProgressView)progressView;
- (CLKUIColoringLabel)centerLabel;
- (CLKUIColoringLabel)leadingSmallLabel;
- (CLKUIColoringLabel)trailingSmallLabel;
- (NTKRichComplicationBaseCircularOpenGaugeRangeTextView)initWithFamily:(int64_t)a3;
- (int64_t)_innerFilterStyle;
- (int64_t)_outerFilterStyle;
- (void)_editingDidEnd;
- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3;
- (void)layoutSubviews;
- (void)setCenterLabel:(id)a3;
- (void)setLeadingSmallLabel:(id)a3;
- (void)setProgressView:(id)a3;
- (void)setTrailingSmallLabel:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKRichComplicationBaseCircularOpenGaugeRangeTextView

+ (int64_t)progressFillStyle
{
  return 0;
}

- (int64_t)_outerFilterStyle
{
  v2 = [(CDRichComplicationView *)self device];
  int v3 = NTKShowGossamerUI(v2);

  if (v3) {
    return 2;
  }
  else {
    return 0;
  }
}

- (int64_t)_innerFilterStyle
{
  v2 = [(CDRichComplicationView *)self device];
  int v3 = NTKShowGossamerUI(v2);

  if (v3) {
    return 0;
  }
  else {
    return 2;
  }
}

- (NTKRichComplicationBaseCircularOpenGaugeRangeTextView)initWithFamily:(int64_t)a3
{
  v25.receiver = self;
  v25.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeRangeTextView;
  v4 = -[NTKRichComplicationCircularBaseView initWithFamily:](&v25, sel_initWithFamily_);
  v5 = v4;
  if (v4)
  {
    double v24 = 0.0;
    long long v23 = 0u;
    v6 = [(CDRichComplicationView *)v4 device];
    _LayoutConstants_52(v6, a3, (uint64_t)&v22);

    id v7 = objc_alloc((Class)off_1E62BD620);
    double v8 = *((double *)&v23 + 1);
    double v9 = v24;
    double v10 = 6.28318531 - v24;
    v11 = [(CDRichComplicationView *)v5 device];
    uint64_t v12 = objc_msgSend(v7, "initWithFamily:curveWidth:padding:beginAngle:endAngle:forDevice:withFilterStyle:progressFillStyle:", a3, v11, -[NTKRichComplicationBaseCircularOpenGaugeRangeTextView _outerFilterStyle](v5, "_outerFilterStyle"), objc_msgSend((id)objc_opt_class(), "progressFillStyle"), v8, 0.0, v9, v10);
    progressView = v5->_progressView;
    v5->_progressView = (CDRichComplicationCurvedProgressView *)v12;

    [(CDRichComplicationCurvedProgressView *)v5->_progressView setFilterProvider:v5];
    v14 = [(NTKRichComplicationCircularBaseView *)v5 contentView];
    [v14 addSubview:v5->_progressView];

    uint64_t v15 = [(NTKRichComplicationCircularBaseView *)v5 _createAndAddColoringLabel];
    leadingSmallLabel = v5->_leadingSmallLabel;
    v5->_leadingSmallLabel = (CLKUIColoringLabel *)v15;

    uint64_t v17 = [(NTKRichComplicationCircularBaseView *)v5 _createAndAddColoringLabel];
    trailingSmallLabel = v5->_trailingSmallLabel;
    v5->_trailingSmallLabel = (CLKUIColoringLabel *)v17;

    uint64_t v19 = [(NTKRichComplicationCircularBaseView *)v5 _createAndAddColoringLabel];
    centerLabel = v5->_centerLabel;
    v5->_centerLabel = (CLKUIColoringLabel *)v19;
  }
  return v5;
}

- (void)layoutSubviews
{
  v60[2] = *MEMORY[0x1E4F143B8];
  v54.receiver = self;
  v54.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeRangeTextView;
  [(NTKRichComplicationCircularBaseView *)&v54 layoutSubviews];
  uint64_t v53 = 0;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  int v3 = [(CDRichComplicationView *)self device];
  _LayoutConstants_52(v3, [(CDRichComplicationView *)self family], (uint64_t)&v47);

  v4 = [(NTKRichComplicationCircularBaseView *)self contentView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  -[CDRichComplicationCurvedProgressView setFrame:](self->_progressView, "setFrame:", v6, v8, v10, v12);
  centerLabel = self->_centerLabel;
  double v14 = *MEMORY[0x1E4FB09E0];
  double v15 = *(double *)&v48;
  v16 = [NSNumber numberWithDouble:*(double *)&v48];
  v60[0] = v16;
  uint64_t v17 = [NSNumber numberWithDouble:v15];
  v60[1] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
  uint64_t v19 = [NSNumber numberWithDouble:*(double *)&v47];
  v59[0] = v19;
  v20 = [NSNumber numberWithDouble:*((double *)&v47 + 1)];
  v59[1] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
  [(NTKRichComplicationCircularBaseView *)self _adjustFontSizeForLabel:centerLabel fontWeight:v18 possibleMaxWidths:v21 possibleFontSizes:v14];

  [(CLKUIColoringLabel *)self->_centerLabel frame];
  long long v22 = [(CLKUIColoringLabel *)self->_centerLabel font];
  [v22 ascender];

  long long v23 = [(CDRichComplicationView *)self device];
  CLKPixelAlignRectForDevice();
  -[CLKUIColoringLabel setFrame:](self->_centerLabel, "setFrame:");

  double v24 = [(CLKUIColoringLabel *)self->_leadingSmallLabel text];
  [v24 length];

  objc_super v25 = [(CLKUIColoringLabel *)self->_trailingSmallLabel text];
  [v25 length];

  leadingSmallLabel = self->_leadingSmallLabel;
  double v27 = *(double *)&v51;
  v28 = [NSNumber numberWithDouble:*(double *)&v51];
  v58[0] = v28;
  v29 = [NSNumber numberWithDouble:v27];
  v58[1] = v29;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
  double v31 = *(double *)&v49;
  v32 = [NSNumber numberWithDouble:*(double *)&v49];
  v57[0] = v32;
  double v33 = *((double *)&v49 + 1);
  v34 = [NSNumber numberWithDouble:*((double *)&v49 + 1)];
  v57[1] = v34;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
  [(NTKRichComplicationCircularBaseView *)self _adjustFontSizeForLabel:leadingSmallLabel fontWeight:v30 possibleMaxWidths:v35 possibleFontSizes:v14];

  [(CLKUIColoringLabel *)self->_leadingSmallLabel frame];
  v36 = [(CLKUIColoringLabel *)self->_leadingSmallLabel font];
  [v36 ascender];

  v37 = [(CDRichComplicationView *)self device];
  CLKPixelAlignRectForDevice();
  -[CLKUIColoringLabel setFrame:](self->_leadingSmallLabel, "setFrame:");

  trailingSmallLabel = self->_trailingSmallLabel;
  v39 = [NSNumber numberWithDouble:v27];
  v56[0] = v39;
  v40 = [NSNumber numberWithDouble:v27];
  v56[1] = v40;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
  v42 = [NSNumber numberWithDouble:v31];
  v55[0] = v42;
  v43 = [NSNumber numberWithDouble:v33];
  v55[1] = v43;
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
  [(NTKRichComplicationCircularBaseView *)self _adjustFontSizeForLabel:trailingSmallLabel fontWeight:v41 possibleMaxWidths:v44 possibleFontSizes:v14];

  [(CLKUIColoringLabel *)self->_trailingSmallLabel frame];
  v45 = [(CLKUIColoringLabel *)self->_trailingSmallLabel font];
  [v45 ascender];

  v46 = [(CDRichComplicationView *)self device];
  CLKPixelAlignRectForDevice();
  -[CLKUIColoringLabel setFrame:](self->_trailingSmallLabel, "setFrame:");
}

- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3
{
  v10[0] = a3->var0;
  id v5 = a3->var1;
  double var2 = a3->var2;
  id v11 = v5;
  double v12 = var2;
  v9.receiver = self;
  v9.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeRangeTextView;
  [(CDRichComplicationView *)&v9 _setFontConfiguration:v10];
  id v7 = a3->var1;
  if (v7)
  {
    double v8 = a3->var2;
    [(CDRichComplicationView *)self _updateColoringLabel:self->_leadingSmallLabel withFontDescriptor:v7 andSizeFactor:v8];
    [(CDRichComplicationView *)self _updateColoringLabel:self->_trailingSmallLabel withFontDescriptor:v7 andSizeFactor:v8];
    [(CDRichComplicationView *)self _updateColoringLabel:self->_centerLabel withFontDescriptor:v7 andSizeFactor:v8];
  }
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10 || a3 == 12;
}

- (void)_editingDidEnd
{
  [(CLKUIColoringLabel *)self->_leadingSmallLabel editingDidEnd];
  [(CLKUIColoringLabel *)self->_trailingSmallLabel editingDidEnd];
  centerLabel = self->_centerLabel;
  [(CLKUIColoringLabel *)centerLabel editingDidEnd];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  [(CLKUIColoringLabel *)self->_centerLabel transitionToMonochromeWithFraction:[(NTKRichComplicationBaseCircularOpenGaugeRangeTextView *)self _innerFilterStyle] style:a3];
  [(CLKUIColoringLabel *)self->_leadingSmallLabel transitionToMonochromeWithFraction:[(NTKRichComplicationBaseCircularOpenGaugeRangeTextView *)self _outerFilterStyle] style:a3];
  [(CLKUIColoringLabel *)self->_trailingSmallLabel transitionToMonochromeWithFraction:[(NTKRichComplicationBaseCircularOpenGaugeRangeTextView *)self _outerFilterStyle] style:a3];
  progressView = self->_progressView;
  [(CDRichComplicationCurvedProgressView *)progressView transitionToMonochromeWithFraction:a3];
}

- (void)updateMonochromeColor
{
  [(CLKUIColoringLabel *)self->_centerLabel updateMonochromeColorWithStyle:[(NTKRichComplicationBaseCircularOpenGaugeRangeTextView *)self _innerFilterStyle]];
  [(CLKUIColoringLabel *)self->_leadingSmallLabel updateMonochromeColorWithStyle:[(NTKRichComplicationBaseCircularOpenGaugeRangeTextView *)self _outerFilterStyle]];
  [(CLKUIColoringLabel *)self->_trailingSmallLabel updateMonochromeColorWithStyle:[(NTKRichComplicationBaseCircularOpenGaugeRangeTextView *)self _outerFilterStyle]];
  progressView = self->_progressView;
  [(CDRichComplicationCurvedProgressView *)progressView updateMonochromeColor];
}

- (CDRichComplicationCurvedProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (CLKUIColoringLabel)leadingSmallLabel
{
  return self->_leadingSmallLabel;
}

- (void)setLeadingSmallLabel:(id)a3
{
}

- (CLKUIColoringLabel)trailingSmallLabel
{
  return self->_trailingSmallLabel;
}

- (void)setTrailingSmallLabel:(id)a3
{
}

- (CLKUIColoringLabel)centerLabel
{
  return self->_centerLabel;
}

- (void)setCenterLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerLabel, 0);
  objc_storeStrong((id *)&self->_trailingSmallLabel, 0);
  objc_storeStrong((id *)&self->_leadingSmallLabel, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
}

@end