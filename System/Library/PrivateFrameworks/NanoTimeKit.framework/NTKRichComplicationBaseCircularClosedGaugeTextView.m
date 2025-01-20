@interface NTKRichComplicationBaseCircularClosedGaugeTextView
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (CLKUIColoringLabel)centerLabel;
- (NTKRichComplicationBaseCircularClosedGaugeTextView)initWithFamily:(int64_t)a3;
- (NTKRichComplicationRingProgressView)progressView;
- (int64_t)_innerFilterStyle;
- (void)_editingDidEnd;
- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3;
- (void)layoutSubviews;
- (void)setCenterLabel:(id)a3;
- (void)setProgressView:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKRichComplicationBaseCircularClosedGaugeTextView

- (NTKRichComplicationBaseCircularClosedGaugeTextView)initWithFamily:(int64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)NTKRichComplicationBaseCircularClosedGaugeTextView;
  v4 = -[NTKRichComplicationCircularBaseView initWithFamily:](&v16, sel_initWithFamily_);
  v5 = v4;
  if (v4)
  {
    v6 = [(CDRichComplicationView *)v4 device];
    double v7 = _LayoutConstants_5(v6, a3);

    v8 = [NTKRichComplicationRingProgressView alloc];
    v9 = [(CDRichComplicationView *)v5 device];
    uint64_t v10 = [(NTKRichComplicationRingProgressView *)v8 initWithFamily:a3 curveWidth:v9 padding:v7 forDevice:0.0];
    progressView = v5->_progressView;
    v5->_progressView = (NTKRichComplicationRingProgressView *)v10;

    [(CDRichComplicationProgressView *)v5->_progressView setFilterProvider:v5];
    v12 = [(NTKRichComplicationCircularBaseView *)v5 contentView];
    [v12 addSubview:v5->_progressView];

    uint64_t v13 = [(NTKRichComplicationCircularBaseView *)v5 _createAndAddColoringLabel];
    centerLabel = v5->_centerLabel;
    v5->_centerLabel = (CLKUIColoringLabel *)v13;
  }
  return v5;
}

- (void)layoutSubviews
{
  v26[1] = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)NTKRichComplicationBaseCircularClosedGaugeTextView;
  [(NTKRichComplicationCircularBaseView *)&v24 layoutSubviews];
  v3 = [(CDRichComplicationView *)self device];
  _LayoutConstants_5(v3, [(CDRichComplicationView *)self family]);
  double v5 = v4;
  double v7 = v6;

  v8 = [(NTKRichComplicationCircularBaseView *)self contentView];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  -[NTKRichComplicationRingProgressView setFrame:](self->_progressView, "setFrame:", v10, v12, v14, v16);
  centerLabel = self->_centerLabel;
  double v18 = *MEMORY[0x1E4FB09E0];
  v19 = [NSNumber numberWithDouble:v5];
  v26[0] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  v21 = [NSNumber numberWithDouble:v7];
  v25 = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  [(NTKRichComplicationCircularBaseView *)self _adjustFontSizeForLabel:centerLabel fontWeight:v20 possibleMaxWidths:v22 possibleFontSizes:v18];

  [(CLKUIColoringLabel *)self->_centerLabel frame];
  v23 = [(CDRichComplicationView *)self device];
  CLKPixelAlignRectForDevice();
  -[CLKUIColoringLabel setFrame:](self->_centerLabel, "setFrame:");
}

- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3
{
  v8[0] = a3->var0;
  id v5 = a3->var1;
  double var2 = a3->var2;
  id v9 = v5;
  double v10 = var2;
  v7.receiver = self;
  v7.super_class = (Class)NTKRichComplicationBaseCircularClosedGaugeTextView;
  [(CDRichComplicationView *)&v7 _setFontConfiguration:v8];
  if (a3->var1)
  {
    -[CDRichComplicationView _updateColoringLabel:withFontDescriptor:andSizeFactor:](self, "_updateColoringLabel:withFontDescriptor:andSizeFactor:", self->_centerLabel, a3->var2);
  }
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10 || a3 == 12;
}

- (void)_editingDidEnd
{
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

- (void)transitionToMonochromeWithFraction:(double)a3
{
  [(CLKUIColoringLabel *)self->_centerLabel transitionToMonochromeWithFraction:[(NTKRichComplicationBaseCircularClosedGaugeTextView *)self _innerFilterStyle] style:a3];
  progressView = self->_progressView;

  [(CDRichComplicationProgressView *)progressView transitionToMonochromeWithFraction:a3];
}

- (void)updateMonochromeColor
{
  [(CLKUIColoringLabel *)self->_centerLabel updateMonochromeColorWithStyle:[(NTKRichComplicationBaseCircularClosedGaugeTextView *)self _innerFilterStyle]];
  progressView = self->_progressView;

  [(CDRichComplicationProgressView *)progressView updateMonochromeColor];
}

- (CLKUIColoringLabel)centerLabel
{
  return self->_centerLabel;
}

- (void)setCenterLabel:(id)a3
{
}

- (NTKRichComplicationRingProgressView)progressView
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
}

@end