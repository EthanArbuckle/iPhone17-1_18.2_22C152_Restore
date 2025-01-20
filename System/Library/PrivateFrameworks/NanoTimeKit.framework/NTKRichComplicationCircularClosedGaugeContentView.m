@interface NTKRichComplicationCircularClosedGaugeContentView
- (NTKRichComplicationCircularClosedGaugeContentView)initWithFamily:(int64_t)a3;
- (NTKRichComplicationRingProgressView)progressView;
- (id)gaugeProviderFromTemplate:(id)a3;
- (id)innerView;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
- (void)layoutSubviews;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKRichComplicationCircularClosedGaugeContentView

- (NTKRichComplicationCircularClosedGaugeContentView)initWithFamily:(int64_t)a3
{
  v17.receiver = self;
  v17.super_class = (Class)NTKRichComplicationCircularClosedGaugeContentView;
  v4 = -[NTKRichComplicationCircularBaseView initWithFamily:](&v17, sel_initWithFamily_);
  v5 = v4;
  if (v4)
  {
    v6 = [(CDRichComplicationView *)v4 device];
    double v7 = _LayoutConstants_26(v6, a3);

    v8 = [NTKRichComplicationRingProgressView alloc];
    v9 = [(CDRichComplicationView *)v5 device];
    uint64_t v10 = [(NTKRichComplicationRingProgressView *)v8 initWithFamily:a3 curveWidth:v9 padding:v7 forDevice:0.0];
    progressView = v5->_progressView;
    v5->_progressView = (NTKRichComplicationRingProgressView *)v10;

    [(CDRichComplicationProgressView *)v5->_progressView setFilterProvider:v5];
    v12 = [(NTKRichComplicationCircularBaseView *)v5 contentView];
    [v12 addSubview:v5->_progressView];

    uint64_t v13 = [(NTKRichComplicationCircularClosedGaugeContentView *)v5 innerView];
    innerView = v5->_innerView;
    v5->_innerView = (UIView *)v13;

    v15 = [(NTKRichComplicationCircularBaseView *)v5 contentView];
    [v15 addSubview:v5->_innerView];
  }
  return v5;
}

- (NTKRichComplicationRingProgressView)progressView
{
  return self->_progressView;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)NTKRichComplicationCircularClosedGaugeContentView;
  [(NTKRichComplicationCircularBaseView *)&v14 layoutSubviews];
  v3 = [(CDRichComplicationView *)self device];
  _LayoutConstants_26(v3, [(CDRichComplicationView *)self family]);

  v4 = [(NTKRichComplicationCircularBaseView *)self contentView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  -[NTKRichComplicationRingProgressView setFrame:](self->_progressView, "setFrame:", v6, v8, v10, v12);
  uint64_t v13 = [(CDRichComplicationView *)self device];
  CLKPixelAlignRectForDevice();
  -[UIView setFrame:](self->_innerView, "setFrame:");
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  progressView = self->_progressView;
  double v6 = -[NTKRichComplicationCircularClosedGaugeContentView gaugeProviderFromTemplate:](self, "gaugeProviderFromTemplate:", a3, a4);
  [(CDRichComplicationProgressView *)progressView setGaugeProvider:v6];

  double v7 = self->_progressView;
  [(CDRichComplicationProgressView *)v7 setStyle:1];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
}

- (void)updateMonochromeColor
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_innerView, 0);
}

- (id)innerView
{
  return 0;
}

- (id)gaugeProviderFromTemplate:(id)a3
{
  return 0;
}

@end