@interface NTKMonogramCircularSmallComplicationView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NTKMonogramCircularSmallComplicationView)initWithFrame:(CGRect)a3;
- (void)_updateLabelsForFontChange;
- (void)layoutSubviews;
- (void)setForegroundColor:(id)a3;
- (void)setMonogramText:(id)a3;
@end

@implementation NTKMonogramCircularSmallComplicationView

- (NTKMonogramCircularSmallComplicationView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NTKMonogramCircularSmallComplicationView;
  v3 = -[NTKCircularComplicationView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(NTKCircularComplicationView *)v3 device];
    v6 = NTKColorMonogramComplicationFontForCharacterCount(1, v5, [(NTKCircularComplicationView *)v4 useRoundedFontDesign]);
    uint64_t v7 = [(NTKCircularComplicationView *)v4 _newLabelSubviewWithFont:v6];
    label = v4->_label;
    v4->_label = (CLKUIColoringLabel *)v7;

    [(CLKUIColoringLabel *)v4->_label setTextAlignment:1];
    [(NTKCircularComplicationView *)v4 setWantsPlatter:0];
  }
  return v4;
}

- (void)setForegroundColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKMonogramCircularSmallComplicationView;
  [(NTKCircularComplicationView *)&v6 setForegroundColor:a3];
  label = self->_label;
  v5 = [(NTKCircularComplicationView *)self _computedForegroundColor];
  [(CLKUIColoringLabel *)label setColor:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[CLKUIColoringLabel sizeThatFits:](self->_label, "sizeThatFits:", a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  [(NTKCircularComplicationView *)self _layoutConstants];
  double v8 = 0.0;
  double v9 = 0.0;
  if (v5 >= 0.0) {
    double v8 = v5;
  }
  if (v7 >= 0.0) {
    double v9 = v7;
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)NTKMonogramCircularSmallComplicationView;
  [(NTKCircularComplicationView *)&v5 layoutSubviews];
  [(NTKMonogramCircularSmallComplicationView *)self bounds];
  [(CLKUIColoringLabel *)self->_label sizeToFit];
  [(CLKUIColoringLabel *)self->_label frame];
  label = self->_label;
  double v4 = [(NTKCircularComplicationView *)self device];
  CLKRectCenteredIntegralRectForDevice();
  -[CLKUIColoringLabel setFrame:](label, "setFrame:");
}

- (void)setMonogramText:(id)a3
{
  [(CLKUIColoringLabel *)self->_label setText:a3];
  [(NTKMonogramCircularSmallComplicationView *)self _updateLabelsForFontChange];
  [(NTKMonogramCircularSmallComplicationView *)self setNeedsLayout];
  id v4 = [(NTKCircularComplicationView *)self displayObserver];
  [v4 complicationDisplayNeedsResize:self];
}

- (void)_updateLabelsForFontChange
{
  id v7 = [(CLKUIColoringLabel *)self->_label text];
  label = self->_label;
  uint64_t v4 = [v7 length];
  objc_super v5 = [(NTKCircularComplicationView *)self device];
  double v6 = NTKColorMonogramComplicationFontForCharacterCount(v4, v5, [(NTKCircularComplicationView *)self useRoundedFontDesign]);
  [(CLKUIColoringLabel *)label setFont:v6];
}

- (void).cxx_destruct
{
}

@end