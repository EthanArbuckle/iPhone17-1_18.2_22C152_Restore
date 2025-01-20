@interface NTKRichComplicationRectangularTextGaugeView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (BOOL)isMeteredProgressView;
+ (int64_t)progressFillStyle;
- (CLKUIColoringLabel)bodyLabel;
- (NTKRichComplicationLineProgressView)progressView;
- (NTKRichComplicationRectangularTextGaugeView)init;
- (void)_editingDidEnd;
- (void)_enumerateLabelsWithBlock:(id)a3;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
- (void)_handleTemplateUpdateWithReason:(int64_t)a3 headerViewData:(id)a4 headerImageProvider:(id)a5 headerTextProvider:(id)a6 bodyTextProvider:(id)a7 gaugeProvider:(id)a8;
- (void)layoutSubviews;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKRichComplicationRectangularTextGaugeView

+ (BOOL)isMeteredProgressView
{
  [a1 progressFillStyle];
  CDRichComplicationProgressFillStyleIsMetered();
}

+ (int64_t)progressFillStyle
{
  return 0;
}

- (NTKRichComplicationRectangularTextGaugeView)init
{
  v15.receiver = self;
  v15.super_class = (Class)NTKRichComplicationRectangularTextGaugeView;
  v2 = [(NTKRichComplicationRectangularLargeHeadlineBaseView *)&v15 init];
  if (v2)
  {
    uint64_t v3 = [(id)objc_opt_class() progressFillStyle];
    uint64_t v14 = 0;
    memset(v13, 0, sizeof(v13));
    v4 = [(CDRichComplicationView *)v2 device];
    _LayoutConstants_19(v4, (uint64_t)v13);

    uint64_t v5 = [(NTKRichComplicationRectangularBaseView *)v2 _createAndAddColoringLabelWithFontSize:1 weight:*((double *)v13 + 1) usesTextProviderTintColoring:*MEMORY[0x1E4FB09D8]];
    bodyLabel = v2->_bodyLabel;
    v2->_bodyLabel = (CLKUIColoringLabel *)v5;

    [(CLKUIColoringLabel *)v2->_bodyLabel setNumberOfLines:1];
    v7 = [MEMORY[0x1E4FB1618] whiteColor];
    [(CLKUIColoringLabel *)v2->_bodyLabel setTextColor:v7];

    v8 = [NTKRichComplicationLineProgressView alloc];
    v9 = [(CDRichComplicationView *)v2 device];
    uint64_t v10 = [(NTKRichComplicationLineProgressView *)v8 initForFamily:11 device:v9 progressFillStyle:v3];
    progressView = v2->_progressView;
    v2->_progressView = (NTKRichComplicationLineProgressView *)v10;

    [(CDRichComplicationProgressView *)v2->_progressView setFilterProvider:v2];
    [(NTKRichComplicationRectangularTextGaugeView *)v2 addSubview:v2->_progressView];
  }
  return v2;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)NTKRichComplicationRectangularTextGaugeView;
  [(NTKRichComplicationRectangularLargeHeadlineBaseView *)&v18 layoutSubviews];
  uint64_t v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [(CDRichComplicationView *)self device];
  _LayoutConstants_19(v3, (uint64_t)&v15);

  [(NTKRichComplicationRectangularTextGaugeView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  [(NTKRichComplicationRectangularBaseView *)self contentMargin];
  double v9 = v8;
  double v10 = v5 + v8 * -2.0;
  [(CLKUIColoringLabel *)self->_bodyLabel sizeToFit];
  [(CLKUIColoringLabel *)self->_bodyLabel frame];
  v11 = [(CLKUIColoringLabel *)self->_bodyLabel font];
  [v11 ascender];

  v12 = [(CLKUIColoringLabel *)self->_bodyLabel font];
  [v12 lineHeight];

  v13 = [(CDRichComplicationView *)self device];
  CLKPixelAlignRectForDevice();
  -[CLKUIColoringLabel setFrame:](self->_bodyLabel, "setFrame:");

  [(CLKUIColoringLabel *)self->_bodyLabel setMaxWidth:v10];
  if ([(id)objc_opt_class() isMeteredProgressView]) {
    uint64_t v14 = (double *)&v17;
  }
  else {
    uint64_t v14 = (double *)&v16;
  }
  -[NTKRichComplicationLineProgressView setFrame:](self->_progressView, "setFrame:", v9, v7 - *((double *)&v16 + 1) - *v14, v10);
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v12 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v12;
    double v7 = [v6 headerLabelData];
    double v8 = [v6 bodyTextProvider];

    double v9 = 0;
  }
  else
  {
    double v9 = [v12 headerImageProvider];
    double v8 = [v12 body1TextProvider];
    double v7 = 0;
  }
  double v10 = [v12 headerTextProvider];
  v11 = [v12 gaugeProvider];
  [(NTKRichComplicationRectangularTextGaugeView *)self _handleTemplateUpdateWithReason:a4 headerViewData:v7 headerImageProvider:v9 headerTextProvider:v10 bodyTextProvider:v8 gaugeProvider:v11];
}

- (void)_handleTemplateUpdateWithReason:(int64_t)a3 headerViewData:(id)a4 headerImageProvider:(id)a5 headerTextProvider:(id)a6 bodyTextProvider:(id)a7 gaugeProvider:(id)a8
{
  id v15 = a8;
  id v14 = a7;
  [(NTKRichComplicationRectangularLargeHeadlineBaseView *)self _updateTemplateHeaderWithTextProvider:a6 imageProvider:a5 viewData:a4 reason:a3];
  [(CLKUIColoringLabel *)self->_bodyLabel setTextProvider:v14];

  [(CDRichComplicationProgressView *)self->_progressView setGaugeProvider:v15];
}

- (void)_enumerateLabelsWithBlock:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationRectangularTextGaugeView;
  double v4 = (void (**)(id, CLKUIColoringLabel *))a3;
  [(NTKRichComplicationRectangularLargeHeadlineBaseView *)&v5 _enumerateLabelsWithBlock:v4];
  v4[2](v4, self->_bodyLabel);
}

- (void)_editingDidEnd
{
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationRectangularTextGaugeView;
  -[NTKRichComplicationRectangularLargeHeadlineBaseView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  [(CLKUIColoringLabel *)self->_bodyLabel transitionToMonochromeWithFraction:0 style:a3];
  [(CDRichComplicationProgressView *)self->_progressView transitionToMonochromeWithFraction:a3];
}

- (void)updateMonochromeColor
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationRectangularTextGaugeView;
  [(NTKRichComplicationRectangularLargeHeadlineBaseView *)&v3 updateMonochromeColor];
  [(CLKUIColoringLabel *)self->_bodyLabel updateMonochromeColorWithStyle:0];
  [(CDRichComplicationProgressView *)self->_progressView updateMonochromeColor];
}

- (CLKUIColoringLabel)bodyLabel
{
  return self->_bodyLabel;
}

- (NTKRichComplicationLineProgressView)progressView
{
  return self->_progressView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
}

@end