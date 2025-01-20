@interface NTKRichComplicationBaseCircularClosedGaugeImageView
- (CDRichComplicationImageView)imageView;
- (id)gaugeProviderFromTemplate:(id)a3;
- (id)innerView;
- (int64_t)tritiumUpdateMode;
- (void)setImageView:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKRichComplicationBaseCircularClosedGaugeImageView

- (id)innerView
{
  imageView = self->_imageView;
  if (!imageView)
  {
    v4 = [(CDRichComplicationView *)self device];
    int v5 = NTKShowGossamerUI(v4);

    uint64_t v6 = v5 ^ 1u;
    id v7 = objc_alloc((Class)off_1E62BD628);
    v8 = [(CDRichComplicationView *)self device];
    v9 = (CDRichComplicationImageView *)[v7 initWithDevice:v8 useAccentColor:v6];
    v10 = self->_imageView;
    self->_imageView = v9;

    [(CDRichComplicationImageView *)self->_imageView setPaused:[(CDRichComplicationView *)self paused]];
    [(CDRichComplicationImageView *)self->_imageView setFilterProvider:self];
    imageView = self->_imageView;
  }

  return imageView;
}

- (id)gaugeProviderFromTemplate:(id)a3
{
  return (id)[a3 gaugeProvider];
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularClosedGaugeImageView;
  -[CDRichComplicationView setPaused:](&v5, sel_setPaused_);
  [(CDRichComplicationImageView *)self->_imageView setPaused:v3];
}

- (int64_t)tritiumUpdateMode
{
  BOOL v3 = [(CDRichComplicationImageView *)self->_imageView tritiumUpdateMode];
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 integerValue];
    if (v5 >= 2) {
      int64_t v6 = 2;
    }
    else {
      int64_t v6 = v5;
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKRichComplicationBaseCircularClosedGaugeImageView;
    int64_t v6 = [(CDRichComplicationTemplateView *)&v8 tritiumUpdateMode];
  }

  return v6;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularClosedGaugeImageView;
  -[NTKRichComplicationCircularClosedGaugeContentView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  [(CDRichComplicationImageView *)self->_imageView transitionToMonochromeWithFraction:a3];
}

- (void)updateMonochromeColor
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationBaseCircularClosedGaugeImageView;
  [(NTKRichComplicationCircularClosedGaugeContentView *)&v3 updateMonochromeColor];
  [(CDRichComplicationImageView *)self->_imageView updateMonochromeColor];
}

- (CDRichComplicationImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end