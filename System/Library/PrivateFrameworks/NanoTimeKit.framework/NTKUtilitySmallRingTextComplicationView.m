@interface NTKUtilitySmallRingTextComplicationView
+ (BOOL)handlesComplicationTemplate:(id)a3;
- (CLKUIColoringLabel)label;
- (NTKUtilitySmallRingTextComplicationView)initWithFrame:(CGRect)a3;
- (void)_enumerateColoringViewsWithBlock:(id)a3;
- (void)_setLabelText:(id)a3;
- (void)_updateForTemplateChange;
- (void)layoutSubviews;
@end

@implementation NTKUtilitySmallRingTextComplicationView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NTKUtilitySmallRingTextComplicationView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)NTKUtilitySmallRingTextComplicationView;
  id v3 = -[NTKUtilitySmallRingComplicationView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F19A50] systemFontOfSize:8.5 weight:*MEMORY[0x1E4FB09D0]];
    [(NTKUtilityComplicationView *)v3 setFont:v4];

    v5 = [(NTKUtilityComplicationView *)v3 font];
    uint64_t v6 = [(NTKUtilityComplicationView *)v3 _newLabelSubviewWithFont:v5 variant:0];
    label = v3->_label;
    v3->_label = (CLKUIColoringLabel *)v6;

    v8 = v3->_label;
    v9 = [(NTKUtilityComplicationView *)v3 device];
    _LayoutConstants_49(v9, v14);
    [(CLKUIColoringLabel *)v8 setMaxWidth:v15];

    v10 = v3->_label;
    v11 = [(NTKUtilityComplicationView *)v3 timeTravelDate];
    [(CLKUIColoringLabel *)v10 setInTimeTravel:v11 != 0];

    v12 = [(NTKUtilityCircularComplicationView *)v3 contentView];
    [v12 addSubview:v3->_label];
  }
  return v3;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)NTKUtilitySmallRingTextComplicationView;
  [(NTKUtilitySmallRingComplicationView *)&v9 layoutSubviews];
  id v3 = [(NTKUtilityCircularComplicationView *)self contentView];
  [v3 bounds];
  uint64_t v7 = v4;

  [(CLKUIColoringLabel *)self->_label sizeToFit];
  [(CLKUIColoringLabel *)self->_label frame];
  v5 = [(NTKUtilityComplicationView *)self device];
  _LayoutConstants_49(v5, v8);

  uint64_t v6 = [(NTKUtilityComplicationView *)self device];
  CLKRectCenteredIntegralRectForDevice();
  -[CLKUIColoringLabel setFrame:](self->_label, "setFrame:");
}

- (void)_updateForTemplateChange
{
  v9.receiver = self;
  v9.super_class = (Class)NTKUtilitySmallRingTextComplicationView;
  [(NTKUtilityComplicationView *)&v9 _updateForTemplateChange];
  id v3 = [(NTKUtilityComplicationView *)self complicationTemplate];
  label = self->_label;
  v5 = [v3 textProvider];
  [(CLKUIColoringLabel *)label setTextProvider:v5];

  uint64_t v6 = [NTKRing alloc];
  [v3 fillFraction];
  v8 = -[NTKRing initWithFillFraction:style:](v6, "initWithFillFraction:style:", [v3 ringStyle], v7);
  [(NTKUtilitySmallRingComplicationView *)self updateRingWithRingDescription:v8];
}

- (void)_setLabelText:(id)a3
{
  [(CLKUIColoringLabel *)self->_label setText:a3];
  [(NTKUtilitySmallRingTextComplicationView *)self setNeedsLayout];
  id v4 = [(NTKUtilityComplicationView *)self displayObserver];
  [v4 complicationDisplayNeedsResize:self];
}

- (void)_enumerateColoringViewsWithBlock:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKUtilitySmallRingTextComplicationView;
  id v4 = (void (**)(id, CLKUIColoringLabel *))a3;
  [(NTKUtilitySmallRingComplicationView *)&v5 _enumerateColoringViewsWithBlock:v4];
  v4[2](v4, self->_label);
}

- (CLKUIColoringLabel)label
{
  return self->_label;
}

- (void).cxx_destruct
{
}

@end