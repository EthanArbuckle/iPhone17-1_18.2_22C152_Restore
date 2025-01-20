@interface NTKRichComplicationCircularStackContentTextView
- (BOOL)templateWantsPlatter;
- (CLKUIColoringLabel)line2Label;
- (NTKRichComplicationCircularStackContentTextView)initWithFamily:(int64_t)a3;
- (id)line1View;
- (id)line2TextProviderFromTemplate:(id)a3;
- (int64_t)_line2FilterStyle;
- (void)_editingDidEnd;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
- (void)layoutSubviews;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKRichComplicationCircularStackContentTextView

- (NTKRichComplicationCircularStackContentTextView)initWithFamily:(int64_t)a3
{
  v20.receiver = self;
  v20.super_class = (Class)NTKRichComplicationCircularStackContentTextView;
  v4 = -[NTKRichComplicationCircularBaseView initWithFamily:](&v20, sel_initWithFamily_);
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [(NTKRichComplicationCircularStackContentTextView *)v4 line1View];
    line1View = v5->_line1View;
    v5->_line1View = (UIView *)v6;

    v8 = [(NTKRichComplicationCircularBaseView *)v5 contentView];
    [v8 addSubview:v5->_line1View];

    long long v18 = 0u;
    long long v19 = 0u;
    v9 = [(CDRichComplicationView *)v5 device];
    _LayoutConstants_30(v9, a3, (uint64_t)&v17);

    v10 = (CLKUIColoringLabel *)objc_alloc_init((Class)off_1E62BDB58);
    line2Label = v5->_line2Label;
    v5->_line2Label = v10;

    v12 = (void *)*((void *)&v18 + 1);
    [(CLKUIColoringLabel *)v5->_line2Label setFont:*((void *)&v18 + 1)];
    [(CLKUIColoringLabel *)v5->_line2Label setTextAlignment:1];
    v13 = v5->_line2Label;
    v14 = [MEMORY[0x1E4FB1618] whiteColor];
    [(CLKUIColoringLabel *)v13 setTextColor:v14];

    [(CLKUIColoringLabel *)v5->_line2Label setUsesTextProviderTintColoring:1];
    [(CLKUIColoringLabel *)v5->_line2Label setMaxWidth:*(double *)&v18];
    [(CLKUIColoringLabel *)v5->_line2Label setFilterProvider:v5];
    v15 = [(NTKRichComplicationCircularBaseView *)v5 contentView];
    [v15 addSubview:v5->_line2Label];
  }
  return v5;
}

- (CLKUIColoringLabel)line2Label
{
  return self->_line2Label;
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)NTKRichComplicationCircularStackContentTextView;
  [(NTKRichComplicationCircularBaseView *)&v19 layoutSubviews];
  v3 = [(NTKRichComplicationCircularBaseView *)self contentView];
  [v3 bounds];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  v4 = [(CDRichComplicationView *)self device];
  _LayoutConstants_30(v4, [(CDRichComplicationView *)self family], (uint64_t)&v16);

  [(CLKUIColoringLabel *)self->_line2Label sizeToFit];
  line1View = self->_line1View;
  uint64_t v6 = [(CDRichComplicationView *)self device];
  CLKRectIntegralForDevice();
  -[UIView ntk_setBoundsAndPositionFromFrame:](line1View, "ntk_setBoundsAndPositionFromFrame:");

  [(CLKUIColoringLabel *)self->_line2Label frame];
  [(CLKUIColoringLabel *)self->_line2Label _lastLineBaseline];
  v7 = [(CDRichComplicationView *)self device];
  CLKRectCenteredXInRectForDevice();
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  -[CLKUIColoringLabel setFrame:](self->_line2Label, "setFrame:", v9, v11, v13, v15);
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  line2Label = self->_line2Label;
  -[NTKRichComplicationCircularStackContentTextView line2TextProviderFromTemplate:](self, "line2TextProviderFromTemplate:", a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(CLKUIColoringLabel *)line2Label setTextProvider:v5];
}

- (void)_editingDidEnd
{
}

- (int64_t)_line2FilterStyle
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

- (BOOL)templateWantsPlatter
{
  return 1;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationCircularStackContentTextView;
  -[NTKRichComplicationCircularBaseView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  [(CLKUIColoringLabel *)self->_line2Label transitionToMonochromeWithFraction:[(NTKRichComplicationCircularStackContentTextView *)self _line2FilterStyle] style:a3];
}

- (void)updateMonochromeColor
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationCircularStackContentTextView;
  [(NTKRichComplicationCircularBaseView *)&v3 updateMonochromeColor];
  [(CLKUIColoringLabel *)self->_line2Label updateMonochromeColorWithStyle:[(NTKRichComplicationCircularStackContentTextView *)self _line2FilterStyle]];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_line2Label, 0);
  objc_storeStrong((id *)&self->_line1View, 0);
}

- (id)line1View
{
  return 0;
}

- (id)line2TextProviderFromTemplate:(id)a3
{
  return 0;
}

@end