@interface NTKRichComplicationRectangularLargeTextView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (NTKRichComplicationRectangularLargeTextView)init;
- (void)_editingDidEnd;
- (void)_enumerateLabelsWithBlock:(id)a3;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
- (void)layoutSubviews;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKRichComplicationRectangularLargeTextView

- (NTKRichComplicationRectangularLargeTextView)init
{
  v12.receiver = self;
  v12.super_class = (Class)NTKRichComplicationRectangularLargeTextView;
  v2 = [(NTKRichComplicationRectangularLargeHeadlineBaseView *)&v12 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v11 = 0;
    long long v10 = 0u;
    v4 = [(CDRichComplicationView *)v2 device];
    _LayoutConstants_53(v4, (uint64_t)&v9);

    uint64_t v5 = -[NTKRichComplicationRectangularBaseView _createAndAddColoringLabelWithFontSize:weight:usesTextProviderTintColoring:](v3, "_createAndAddColoringLabelWithFontSize:weight:usesTextProviderTintColoring:", 0, v10);
    line1Label = v3->_line1Label;
    v3->_line1Label = (CLKUIColoringLabel *)v5;

    v7 = [MEMORY[0x1E4FB1618] whiteColor];
    [(CLKUIColoringLabel *)v3->_line1Label setTextColor:v7];
  }
  return v3;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)NTKRichComplicationRectangularLargeTextView;
  [(NTKRichComplicationRectangularLargeHeadlineBaseView *)&v14 layoutSubviews];
  double v13 = 0.0;
  memset(v12, 0, sizeof(v12));
  v3 = [(CDRichComplicationView *)self device];
  _LayoutConstants_53(v3, (uint64_t)v12);

  [(NTKRichComplicationRectangularLargeTextView *)self bounds];
  double v5 = v4;
  [(NTKRichComplicationRectangularBaseView *)self contentMargin];
  double v7 = v5 + v6 * -2.0;
  [(CLKUIColoringLabel *)self->_line1Label sizeToFit];
  [(CLKUIColoringLabel *)self->_line1Label frame];
  [(NTKRichComplicationRectangularBaseView *)self contentMargin];
  double v8 = v13;
  long long v9 = [(CLKUIColoringLabel *)self->_line1Label font];
  [v9 ascender];

  long long v10 = [(CLKUIColoringLabel *)self->_line1Label font];
  [v10 lineHeight];

  uint64_t v11 = [(CDRichComplicationView *)self device];
  CLKPixelAlignRectForDevice();
  -[CLKUIColoringLabel setFrame:](self->_line1Label, "setFrame:");

  [(CLKUIColoringLabel *)self->_line1Label setMaxWidth:v7 + v8 * -2.0];
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 11;
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  double v7 = [v6 headerTextProvider];
  double v8 = [v6 headerImageProvider];
  [(NTKRichComplicationRectangularLargeHeadlineBaseView *)self _updateTemplateHeaderWithTextProvider:v7 imageProvider:v8 viewData:0 reason:a4];

  id v9 = [v6 bodyTextProvider];

  [(CLKUIColoringLabel *)self->_line1Label setTextProvider:v9];
}

- (void)_enumerateLabelsWithBlock:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationRectangularLargeTextView;
  double v4 = (void (**)(id, CLKUIColoringLabel *))a3;
  [(NTKRichComplicationRectangularLargeHeadlineBaseView *)&v5 _enumerateLabelsWithBlock:v4];
  v4[2](v4, self->_line1Label);
}

- (void)_editingDidEnd
{
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationRectangularLargeTextView;
  -[NTKRichComplicationRectangularLargeHeadlineBaseView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  [(CLKUIColoringLabel *)self->_line1Label transitionToMonochromeWithFraction:0 style:a3];
}

- (void)updateMonochromeColor
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationRectangularLargeTextView;
  [(NTKRichComplicationRectangularLargeHeadlineBaseView *)&v3 updateMonochromeColor];
  [(CLKUIColoringLabel *)self->_line1Label updateMonochromeColorWithStyle:0];
}

- (void).cxx_destruct
{
}

@end