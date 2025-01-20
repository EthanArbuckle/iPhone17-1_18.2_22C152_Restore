@interface NTKRichComplicationBaseCircularStackImageView
- (CDRichComplicationImageView)line1ImageView;
- (id)line1View;
- (id)line2TextProviderFromTemplate:(id)a3;
- (int64_t)tritiumUpdateMode;
- (void)setLine1ImageView:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKRichComplicationBaseCircularStackImageView

- (id)line1View
{
  line1ImageView = self->_line1ImageView;
  if (!line1ImageView)
  {
    v4 = [(CDRichComplicationView *)self device];
    uint64_t v5 = NTKShowGossamerUI(v4);

    id v6 = objc_alloc((Class)off_1E62BD628);
    v7 = [(CDRichComplicationView *)self device];
    v8 = (CDRichComplicationImageView *)[v6 initWithDevice:v7 useAccentColor:v5];
    v9 = self->_line1ImageView;
    self->_line1ImageView = v8;

    [(CDRichComplicationImageView *)self->_line1ImageView setPaused:[(CDRichComplicationView *)self paused]];
    [(CDRichComplicationImageView *)self->_line1ImageView setFilterProvider:self];
    line1ImageView = self->_line1ImageView;
  }

  return line1ImageView;
}

- (id)line2TextProviderFromTemplate:(id)a3
{
  return (id)[a3 line2TextProvider];
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularStackImageView;
  -[CDRichComplicationView setPaused:](&v5, sel_setPaused_);
  [(CDRichComplicationImageView *)self->_line1ImageView setPaused:v3];
}

- (int64_t)tritiumUpdateMode
{
  BOOL v3 = [(CDRichComplicationImageView *)self->_line1ImageView tritiumUpdateMode];
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
    v8.super_class = (Class)NTKRichComplicationBaseCircularStackImageView;
    int64_t v6 = [(CDRichComplicationTemplateView *)&v8 tritiumUpdateMode];
  }

  return v6;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationBaseCircularStackImageView;
  -[NTKRichComplicationCircularStackContentTextView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  [(CDRichComplicationImageView *)self->_line1ImageView transitionToMonochromeWithFraction:a3];
}

- (void)updateMonochromeColor
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationBaseCircularStackImageView;
  [(NTKRichComplicationCircularStackContentTextView *)&v3 updateMonochromeColor];
  [(CDRichComplicationImageView *)self->_line1ImageView updateMonochromeColor];
}

- (CDRichComplicationImageView)line1ImageView
{
  return self->_line1ImageView;
}

- (void)setLine1ImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end