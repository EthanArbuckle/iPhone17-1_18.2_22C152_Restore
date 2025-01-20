@interface NTKRichComplicationBaseCircularOpenGaugeSimpleTextView
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (CDRichComplicationCurvedProgressView)progressView;
- (CLKUIColoringLabel)centerLabel;
- (CLKUIColoringLabel)smallLabel;
- (NTKRichComplicationBaseCircularOpenGaugeSimpleTextView)initWithFamily:(int64_t)a3;
- (int64_t)_innerFilterStyle;
- (int64_t)_outerFilterStyle;
- (void)_editingDidEnd;
- (void)_enumerateLabelsWithBlock:(id)a3;
- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3;
- (void)layoutSubviews;
- (void)setCenterLabel:(id)a3;
- (void)setProgressView:(id)a3;
- (void)setSmallLabel:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKRichComplicationBaseCircularOpenGaugeSimpleTextView

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

- (NTKRichComplicationBaseCircularOpenGaugeSimpleTextView)initWithFamily:(int64_t)a3
{
  v23.receiver = self;
  v23.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeSimpleTextView;
  v4 = -[NTKRichComplicationCircularBaseView initWithFamily:](&v23, sel_initWithFamily_);
  v5 = v4;
  if (v4)
  {
    double v22 = 0.0;
    long long v21 = 0u;
    v6 = [(CDRichComplicationView *)v4 device];
    _LayoutConstants_25(v6, a3, (uint64_t)&v20);

    id v7 = objc_alloc((Class)off_1E62BD620);
    double v8 = *((double *)&v21 + 1);
    double v9 = v22;
    double v10 = 6.28318531 - v22;
    v11 = [(CDRichComplicationView *)v5 device];
    uint64_t v12 = objc_msgSend(v7, "initWithFamily:curveWidth:padding:beginAngle:endAngle:forDevice:withFilterStyle:progressFillStyle:", a3, v11, -[NTKRichComplicationBaseCircularOpenGaugeSimpleTextView _outerFilterStyle](v5, "_outerFilterStyle"), 0, v8, 0.0, v9, v10);
    progressView = v5->_progressView;
    v5->_progressView = (CDRichComplicationCurvedProgressView *)v12;

    [(CDRichComplicationCurvedProgressView *)v5->_progressView setFilterProvider:v5];
    v14 = [(NTKRichComplicationCircularBaseView *)v5 contentView];
    [v14 addSubview:v5->_progressView];

    uint64_t v15 = [(NTKRichComplicationCircularBaseView *)v5 _createAndAddColoringLabel];
    smallLabel = v5->_smallLabel;
    v5->_smallLabel = (CLKUIColoringLabel *)v15;

    uint64_t v17 = [(NTKRichComplicationCircularBaseView *)v5 _createAndAddColoringLabel];
    centerLabel = v5->_centerLabel;
    v5->_centerLabel = (CLKUIColoringLabel *)v17;
  }
  return v5;
}

- (void)layoutSubviews
{
  v45[2] = *MEMORY[0x1E4F143B8];
  v41.receiver = self;
  v41.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeSimpleTextView;
  [(NTKRichComplicationCircularBaseView *)&v41 layoutSubviews];
  uint64_t v40 = 0;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  int v3 = [(CDRichComplicationView *)self device];
  _LayoutConstants_25(v3, [(CDRichComplicationView *)self family], (uint64_t)&v35);

  v4 = [(NTKRichComplicationCircularBaseView *)self contentView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  -[CDRichComplicationCurvedProgressView setFrame:](self->_progressView, "setFrame:", v6, v8, v10, v12);
  centerLabel = self->_centerLabel;
  double v14 = *MEMORY[0x1E4FB09E0];
  double v15 = *(double *)&v36;
  v16 = [NSNumber numberWithDouble:*(double *)&v36];
  v45[0] = v16;
  uint64_t v17 = [NSNumber numberWithDouble:v15];
  v45[1] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  v19 = [NSNumber numberWithDouble:*(double *)&v35];
  v44[0] = v19;
  long long v20 = [NSNumber numberWithDouble:*((double *)&v35 + 1)];
  v44[1] = v20;
  long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
  [(NTKRichComplicationCircularBaseView *)self _adjustFontSizeForLabel:centerLabel fontWeight:v18 possibleMaxWidths:v21 possibleFontSizes:v14];

  [(CLKUIColoringLabel *)self->_centerLabel frame];
  double v22 = [(CLKUIColoringLabel *)self->_centerLabel text];
  [v22 length];

  objc_super v23 = [(CLKUIColoringLabel *)self->_centerLabel font];
  [v23 ascender];

  v24 = [(CDRichComplicationView *)self device];
  CLKPixelAlignRectForDevice();
  -[CLKUIColoringLabel setFrame:](self->_centerLabel, "setFrame:");

  smallLabel = self->_smallLabel;
  double v26 = *(double *)&v39;
  v27 = [NSNumber numberWithDouble:*(double *)&v39];
  v43[0] = v27;
  v28 = [NSNumber numberWithDouble:v26];
  v43[1] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
  v30 = [NSNumber numberWithDouble:*((double *)&v37 + 1)];
  v42[0] = v30;
  v31 = [NSNumber numberWithDouble:*(double *)&v38];
  v42[1] = v31;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
  [(NTKRichComplicationCircularBaseView *)self _adjustFontSizeForLabel:smallLabel fontWeight:v29 possibleMaxWidths:v32 possibleFontSizes:v14];

  [(CLKUIColoringLabel *)self->_smallLabel frame];
  v33 = [(CLKUIColoringLabel *)self->_smallLabel font];
  [v33 ascender];

  v34 = [(CDRichComplicationView *)self device];
  CLKPixelAlignRectForDevice();
  -[CLKUIColoringLabel setFrame:](self->_smallLabel, "setFrame:");
}

- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3
{
  v10[0] = a3->var0;
  id v5 = a3->var1;
  double var2 = a3->var2;
  id v11 = v5;
  double v12 = var2;
  v9.receiver = self;
  v9.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeSimpleTextView;
  [(CDRichComplicationView *)&v9 _setFontConfiguration:v10];
  id v7 = a3->var1;
  if (v7)
  {
    double v8 = a3->var2;
    [(CDRichComplicationView *)self _updateColoringLabel:self->_smallLabel withFontDescriptor:v7 andSizeFactor:v8];
    [(CDRichComplicationView *)self _updateColoringLabel:self->_centerLabel withFontDescriptor:v7 andSizeFactor:v8];
  }
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10 || a3 == 12;
}

- (void)_enumerateLabelsWithBlock:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeSimpleTextView;
  v4 = (void (**)(id, CLKUIColoringLabel *))a3;
  [(CDRichComplicationView *)&v5 _enumerateLabelsWithBlock:v4];
  v4[2](v4, self->_smallLabel);
  v4[2](v4, self->_centerLabel);
}

- (void)_editingDidEnd
{
  [(CLKUIColoringLabel *)self->_smallLabel editingDidEnd];
  centerLabel = self->_centerLabel;
  [(CLKUIColoringLabel *)centerLabel editingDidEnd];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  [(CLKUIColoringLabel *)self->_centerLabel transitionToMonochromeWithFraction:[(NTKRichComplicationBaseCircularOpenGaugeSimpleTextView *)self _innerFilterStyle] style:a3];
  [(CLKUIColoringLabel *)self->_smallLabel transitionToMonochromeWithFraction:[(NTKRichComplicationBaseCircularOpenGaugeSimpleTextView *)self _outerFilterStyle] style:a3];
  progressView = self->_progressView;
  [(CDRichComplicationCurvedProgressView *)progressView transitionToMonochromeWithFraction:a3];
}

- (void)updateMonochromeColor
{
  [(CLKUIColoringLabel *)self->_centerLabel updateMonochromeColorWithStyle:[(NTKRichComplicationBaseCircularOpenGaugeSimpleTextView *)self _innerFilterStyle]];
  [(CLKUIColoringLabel *)self->_smallLabel updateMonochromeColorWithStyle:[(NTKRichComplicationBaseCircularOpenGaugeSimpleTextView *)self _outerFilterStyle]];
  progressView = self->_progressView;
  [(CDRichComplicationCurvedProgressView *)progressView updateMonochromeColor];
}

- (CLKUIColoringLabel)smallLabel
{
  return self->_smallLabel;
}

- (void)setSmallLabel:(id)a3
{
}

- (CLKUIColoringLabel)centerLabel
{
  return self->_centerLabel;
}

- (void)setCenterLabel:(id)a3
{
}

- (CDRichComplicationCurvedProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_centerLabel, 0);
  objc_storeStrong((id *)&self->_smallLabel, 0);
}

@end