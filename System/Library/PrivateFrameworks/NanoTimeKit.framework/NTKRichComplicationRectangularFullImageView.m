@interface NTKRichComplicationRectangularFullImageView
+ (BOOL)handlesComplicationTemplate:(id)a3;
- (id)content;
- (int64_t)tritiumUpdateMode;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)setPaused:(BOOL)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKRichComplicationRectangularFullImageView

- (id)content
{
  imageView = self->_imageView;
  if (!imageView)
  {
    id v4 = objc_alloc((Class)off_1E62BD628);
    v5 = [(CDRichComplicationView *)self device];
    v6 = (CDRichComplicationImageView *)[v4 initWithDevice:v5 useAccentColor:0];
    v7 = self->_imageView;
    self->_imageView = v6;

    [(CDRichComplicationImageView *)self->_imageView setPaused:[(CDRichComplicationView *)self paused]];
    [(CDRichComplicationImageView *)self->_imageView setFilterProvider:self];
    imageView = self->_imageView;
  }
  return imageView;
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationRectangularFullImageView;
  -[CDRichComplicationView setPaused:](&v5, sel_setPaused_);
  [(CDRichComplicationImageView *)self->_imageView setPaused:v3];
}

- (int64_t)tritiumUpdateMode
{
  BOOL v3 = [(CDRichComplicationImageView *)self->_imageView tritiumUpdateMode];
  id v4 = v3;
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
    v8.super_class = (Class)NTKRichComplicationRectangularFullImageView;
    int64_t v6 = [(CDRichComplicationTemplateView *)&v8 tritiumUpdateMode];
  }

  return v6;
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v6 = [a3 imageProvider];
  [(CDRichComplicationImageView *)self->_imageView setImageProvider:v6 reason:a4];
}

- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationRectangularFullImageView;
  -[CDRichComplicationView transitionToMonochromeWithFraction:](&v5, sel_transitionToMonochromeWithFraction_);
  [(CDRichComplicationImageView *)self->_imageView transitionToMonochromeWithFraction:a3];
}

- (void)updateMonochromeColor
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationRectangularFullImageView;
  [(CDRichComplicationView *)&v3 updateMonochromeColor];
  [(CDRichComplicationImageView *)self->_imageView updateMonochromeColor];
}

- (void).cxx_destruct
{
}

@end