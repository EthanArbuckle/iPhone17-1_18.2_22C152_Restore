@interface NTKRichComplicationBaseCircularOpenGaugeImageView
- (CDRichComplicationImageView)bottomImageView;
- (id)bottomView;
- (int64_t)tritiumUpdateMode;
- (void)gaugeProvider:(id *)a3 andCenterTextProvider:(id *)a4 fromTemplate:(id)a5;
- (void)setBottomImageView:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKRichComplicationBaseCircularOpenGaugeImageView

- (id)bottomView
{
  bottomImageView = self->_bottomImageView;
  if (!bottomImageView)
  {
    v4 = [(CDRichComplicationView *)self device];
    uint64_t v5 = NTKShowGossamerUI(v4);

    id v6 = objc_alloc((Class)off_1E62BD628);
    v7 = [(CDRichComplicationView *)self device];
    v8 = (CDRichComplicationImageView *)[v6 initWithDevice:v7 useAccentColor:v5];
    v9 = self->_bottomImageView;
    self->_bottomImageView = v8;

    [(CDRichComplicationImageView *)self->_bottomImageView setPaused:[(CDRichComplicationView *)self paused]];
    [(CDRichComplicationImageView *)self->_bottomImageView setFilterProvider:self];
    bottomImageView = self->_bottomImageView;
  }
  return bottomImageView;
}

- (void)gaugeProvider:(id *)a3 andCenterTextProvider:(id *)a4 fromTemplate:(id)a5
{
  id v7 = a5;
  *a3 = [v7 gaugeProvider];
  v8 = [v7 centerTextProvider];

  *a4 = v8;
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeImageView;
  -[CDRichComplicationView setPaused:](&v5, sel_setPaused_);
  [(CDRichComplicationImageView *)self->_bottomImageView setPaused:v3];
}

- (int64_t)tritiumUpdateMode
{
  BOOL v3 = [(CDRichComplicationImageView *)self->_bottomImageView tritiumUpdateMode];
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
    v8.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeImageView;
    int64_t v6 = [(CDRichComplicationTemplateView *)&v8 tritiumUpdateMode];
  }

  return v6;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeImageView;
  -[NTKRichComplicationCircularOpenGaugeContentView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  [(CDRichComplicationImageView *)self->_bottomImageView transitionToMonochromeWithFraction:a3];
}

- (void)updateMonochromeColor
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationBaseCircularOpenGaugeImageView;
  [(NTKRichComplicationCircularOpenGaugeContentView *)&v3 updateMonochromeColor];
  [(CDRichComplicationImageView *)self->_bottomImageView updateMonochromeColor];
}

- (CDRichComplicationImageView)bottomImageView
{
  return self->_bottomImageView;
}

- (void)setBottomImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end