@interface NTKSolarRichComplicationBaseCircularView
- (BOOL)_shouldAnimateWithTemplateUpdateReason:(int64_t)a3;
- (NTKSolarRichComplicationBaseCircularView)initWithFamily:(int64_t)a3;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
- (void)_updateWithLocation:(id)a3 useIdealizedTime:(BOOL)a4 forceUpdate:(BOOL)a5 animated:(BOOL)a6;
- (void)layoutSubviews;
- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKSolarRichComplicationBaseCircularView

- (NTKSolarRichComplicationBaseCircularView)initWithFamily:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NTKSolarRichComplicationBaseCircularView;
  v4 = -[NTKRichComplicationCircularBaseView initWithFamily:](&v13, sel_initWithFamily_);
  if (v4)
  {
    v5 = [NTKSolarRichComplicationFullColorImageView alloc];
    v6 = [(CDRichComplicationView *)v4 device];
    uint64_t v7 = [(NTKSolarRichComplicationFullColorImageView *)v5 initFullColorImageViewWithDevice:v6 family:a3];
    solarImageView = v4->_solarImageView;
    v4->_solarImageView = (NTKSolarRichComplicationFullColorImageView *)v7;

    [(NTKSolarRichComplicationFullColorImageView *)v4->_solarImageView setFilterProvider:v4];
    [(NTKSolarRichComplicationFullColorImageView *)v4->_solarImageView setClipsToBounds:0];
    v9 = [(NTKRichComplicationCircularBaseView *)v4 contentView];
    [v9 addSubview:v4->_solarImageView];

    v10 = [(NTKRichComplicationCircularBaseView *)v4 contentView];
    v11 = [v10 layer];
    [v11 setMasksToBounds:1];
  }
  return v4;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)NTKSolarRichComplicationBaseCircularView;
  [(NTKRichComplicationCircularBaseView *)&v16 layoutSubviews];
  v3 = [(NTKRichComplicationCircularBaseView *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v17.origin.x = v5;
  v17.origin.y = v7;
  v17.size.width = v9;
  v17.size.height = v11;
  double Width = CGRectGetWidth(v17);
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  double Height = CGRectGetHeight(v18);
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  double MidX = CGRectGetMidX(v19);
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  double MidY = CGRectGetMidY(v20);
  -[NTKSolarRichComplicationFullColorImageView setBounds:](self->_solarImageView, "setBounds:", 0.0, 0.0, Width, Height);
  -[NTKSolarRichComplicationFullColorImageView setCenter:](self->_solarImageView, "setCenter:", MidX, MidY);
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v9 = [a3 metadata];
  double v6 = [v9 objectForKeyedSubscript:@"NTKSolarComplicationEntryLocationKey"];
  CGFloat v7 = [v9 objectForKeyedSubscript:@"NTKSolarComplicationUseIdealizedTimeKey"];
  uint64_t v8 = [v7 BOOLValue];

  [(NTKSolarRichComplicationBaseCircularView *)self _updateWithLocation:v6 useIdealizedTime:v8 forceUpdate:0 animated:[(NTKSolarRichComplicationBaseCircularView *)self _shouldAnimateWithTemplateUpdateReason:a4]];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
}

- (void)updateMonochromeColor
{
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  solarImageView = self->_solarImageView;
  id v7 = a3;
  [(NTKSolarRichComplicationFullColorImageView *)solarImageView setTimeTravelDate:v7];
  v8.receiver = self;
  v8.super_class = (Class)NTKSolarRichComplicationBaseCircularView;
  [(CDRichComplicationTemplateView *)&v8 setTimeTravelDate:v7 animated:v4];
}

- (BOOL)_shouldAnimateWithTemplateUpdateReason:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 3;
}

- (void)_updateWithLocation:(id)a3 useIdealizedTime:(BOOL)a4 forceUpdate:(BOOL)a5 animated:(BOOL)a6
{
}

- (void).cxx_destruct
{
}

@end