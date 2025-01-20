@interface NTKRichComplicationCircularOpenGaugeContentView
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
+ (int64_t)progressFillStyle;
- (CDRichComplicationCurvedProgressView)progressView;
- (CLKUIColoringLabel)centerLabel;
- (NTKRichComplicationCircularOpenGaugeContentView)initWithFamily:(int64_t)a3;
- (id)bottomView;
- (int64_t)_innerFilterStyle;
- (int64_t)_outerFilterStyle;
- (void)_editingDidEnd;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
- (void)gaugeProvider:(id *)a3 andCenterTextProvider:(id *)a4 fromTemplate:(id)a5;
- (void)layoutSubviews;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKRichComplicationCircularOpenGaugeContentView

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

- (NTKRichComplicationCircularOpenGaugeContentView)initWithFamily:(int64_t)a3
{
  v22.receiver = self;
  v22.super_class = (Class)NTKRichComplicationCircularOpenGaugeContentView;
  v4 = -[NTKRichComplicationCircularBaseView initWithFamily:](&v22, sel_initWithFamily_);
  v5 = v4;
  if (v4)
  {
    long long v21 = 0u;
    v6 = [(CDRichComplicationView *)v4 device];
    _LayoutConstants_16(v6, a3, &v20);

    id v7 = objc_alloc((Class)off_1E62BD620);
    long long v8 = v21;
    double v9 = 6.28318531 - *((double *)&v21 + 1);
    v10 = [(CDRichComplicationView *)v5 device];
    uint64_t v11 = objc_msgSend(v7, "initWithFamily:curveWidth:padding:beginAngle:endAngle:forDevice:withFilterStyle:progressFillStyle:", a3, v10, -[NTKRichComplicationCircularOpenGaugeContentView _outerFilterStyle](v5, "_outerFilterStyle"), objc_msgSend((id)objc_opt_class(), "progressFillStyle"), *(double *)&v8, 0.0, *((double *)&v8 + 1), v9);
    progressView = v5->_progressView;
    v5->_progressView = (CDRichComplicationCurvedProgressView *)v11;

    [(CDRichComplicationCurvedProgressView *)v5->_progressView setFilterProvider:v5];
    v13 = [(NTKRichComplicationCircularBaseView *)v5 contentView];
    [v13 addSubview:v5->_progressView];

    uint64_t v14 = [(NTKRichComplicationCircularOpenGaugeContentView *)v5 bottomView];
    bottomView = v5->_bottomView;
    v5->_bottomView = (UIView *)v14;

    v16 = [(NTKRichComplicationCircularBaseView *)v5 contentView];
    [v16 addSubview:v5->_bottomView];

    uint64_t v17 = [(NTKRichComplicationCircularBaseView *)v5 _createAndAddColoringLabel];
    centerLabel = v5->_centerLabel;
    v5->_centerLabel = (CLKUIColoringLabel *)v17;
  }
  return v5;
}

- (CDRichComplicationCurvedProgressView)progressView
{
  return self->_progressView;
}

- (CLKUIColoringLabel)centerLabel
{
  return self->_centerLabel;
}

- (void)layoutSubviews
{
  v31[2] = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)NTKRichComplicationCircularOpenGaugeContentView;
  [(NTKRichComplicationCircularBaseView *)&v29 layoutSubviews];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  int v3 = [(CDRichComplicationView *)self device];
  _LayoutConstants_16(v3, [(CDRichComplicationView *)self family], &v25);

  v4 = [(NTKRichComplicationCircularBaseView *)self contentView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  -[CDRichComplicationCurvedProgressView setFrame:](self->_progressView, "setFrame:", v6, v8, v10, v12);
  centerLabel = self->_centerLabel;
  double v14 = *MEMORY[0x1E4FB09E0];
  double v15 = *(double *)&v26;
  v16 = [NSNumber numberWithDouble:*(double *)&v26];
  v31[0] = v16;
  uint64_t v17 = [NSNumber numberWithDouble:v15];
  v31[1] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  v19 = [NSNumber numberWithDouble:*(double *)&v25];
  v30[0] = v19;
  long long v20 = [NSNumber numberWithDouble:*((double *)&v25 + 1)];
  v30[1] = v20;
  long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  [(NTKRichComplicationCircularBaseView *)self _adjustFontSizeForLabel:centerLabel fontWeight:v18 possibleMaxWidths:v21 possibleFontSizes:v14];

  [(CLKUIColoringLabel *)self->_centerLabel frame];
  objc_super v22 = [(CLKUIColoringLabel *)self->_centerLabel font];
  [v22 ascender];

  v23 = [(CDRichComplicationView *)self device];
  CLKPixelAlignRectForDevice();
  -[CLKUIColoringLabel setFrame:](self->_centerLabel, "setFrame:");

  [(UIView *)self->_bottomView frame];
  v24 = [(CDRichComplicationView *)self device];
  CLKPixelAlignRectForDevice();
  -[UIView setFrame:](self->_bottomView, "setFrame:");
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 10;
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v7 = 0;
  id v8 = 0;
  [(NTKRichComplicationCircularOpenGaugeContentView *)self gaugeProvider:&v8 andCenterTextProvider:&v7 fromTemplate:a3];
  id v5 = v8;
  id v6 = v7;
  [(CDRichComplicationCurvedProgressView *)self->_progressView setGaugeProvider:v5];
  [(CLKUIColoringLabel *)self->_centerLabel setTextProvider:v6];
}

- (void)_editingDidEnd
{
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  [(CLKUIColoringLabel *)self->_centerLabel transitionToMonochromeWithFraction:[(NTKRichComplicationCircularOpenGaugeContentView *)self _innerFilterStyle] style:a3];
  progressView = self->_progressView;
  [(CDRichComplicationCurvedProgressView *)progressView transitionToMonochromeWithFraction:a3];
}

- (void)updateMonochromeColor
{
  [(CLKUIColoringLabel *)self->_centerLabel updateMonochromeColorWithStyle:[(NTKRichComplicationCircularOpenGaugeContentView *)self _innerFilterStyle]];
  progressView = self->_progressView;
  [(CDRichComplicationCurvedProgressView *)progressView updateMonochromeColor];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomView, 0);
  objc_storeStrong((id *)&self->_centerLabel, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
}

- (id)bottomView
{
  return 0;
}

- (void)gaugeProvider:(id *)a3 andCenterTextProvider:(id *)a4 fromTemplate:(id)a5
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

@end