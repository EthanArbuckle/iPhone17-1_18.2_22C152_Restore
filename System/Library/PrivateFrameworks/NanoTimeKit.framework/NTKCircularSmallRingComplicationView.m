@interface NTKCircularSmallRingComplicationView
- (NTKCircularSmallRingComplicationView)initWithFrame:(CGRect)a3;
- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3;
- (void)layoutSubviews;
- (void)setForegroundColor:(id)a3;
- (void)setUsesMediumLayout:(BOOL)a3;
- (void)updateRingWithOverrideColor:(id)a3;
- (void)updateRingWithRingDescription:(id)a3;
@end

@implementation NTKCircularSmallRingComplicationView

- (NTKCircularSmallRingComplicationView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NTKCircularSmallRingComplicationView;
  v3 = -[NTKCircularComplicationView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(NTKCircularComplicationView *)v3 setWantsPlatter:0];
    id v5 = objc_alloc((Class)off_1E62BDB50);
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    fillFractionRing = v4->_fillFractionRing;
    v4->_fillFractionRing = (CLKUIColoringImageView *)v6;

    [(NTKCircularSmallRingComplicationView *)v4 addSubview:v4->_fillFractionRing];
  }
  return v4;
}

- (void)setUsesMediumLayout:(BOOL)a3
{
  self->_didDrawOnce = 0;
  v3.receiver = self;
  v3.super_class = (Class)NTKCircularSmallRingComplicationView;
  [(NTKCircularComplicationView *)&v3 setUsesMediumLayout:a3];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCircularSmallRingComplicationView;
  [(NTKCircularComplicationView *)&v4 layoutSubviews];
  [(NTKCircularSmallRingComplicationView *)self bounds];
  [(NTKCircularComplicationView *)self _layoutConstants];
  objc_super v3 = [(NTKCircularComplicationView *)self device];
  CLKRectCenteredIntegralRectForDevice();
  -[CLKUIColoringImageView setFrame:](self->_fillFractionRing, "setFrame:");
}

- (void)updateRingWithRingDescription:(id)a3
{
  id v4 = a3;
  [v4 fillFraction];
  if (!CLKFloatEqualsFloat() || !self->_didDrawOnce)
  {
    [v4 fillFraction];
    self->_fillFraction = v5;
    [(NTKCircularComplicationView *)self _layoutConstants];
    [v4 setRadius:v8 * 0.5];
    [(NTKCircularComplicationView *)self _layoutConstants];
    [v4 setStrokeWidth:v7];
    uint64_t v6 = [v4 ringImage];
    [(CLKUIColoringImageView *)self->_fillFractionRing setImage:v6];

    self->_didDrawOnce = 1;
    [(NTKCircularSmallRingComplicationView *)self setNeedsLayout];
  }
}

- (void)updateRingWithOverrideColor:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_ringOverrideColor, a3);
  if (self->_ringOverrideColor)
  {
    -[CLKUIColoringImageView setColor:](self->_fillFractionRing, "setColor:");
  }
  else
  {
    double v5 = [(NTKCircularComplicationView *)self _computedForegroundColor];
    [(CLKUIColoringImageView *)self->_fillFractionRing setColor:v5];
  }
  [(NTKCircularSmallRingComplicationView *)self setNeedsLayout];
}

- (void)setForegroundColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCircularSmallRingComplicationView;
  [(NTKCircularComplicationView *)&v4 setForegroundColor:a3];
  if (self->_ringOverrideColor)
  {
    -[CLKUIColoringImageView setColor:](self->_fillFractionRing, "setColor:");
    [(NTKCircularSmallRingComplicationView *)self setNeedsLayout];
  }
}

- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringOverrideColor, 0);
  objc_storeStrong((id *)&self->_fillFractionRing, 0);
}

@end