@interface NTKRichComplicationCornerTextImageView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (id)_outerView;
- (int64_t)tritiumUpdateMode;
- (void)_editingDidEnd;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3;
- (void)setPaused:(BOOL)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKRichComplicationCornerTextImageView

- (id)_outerView
{
  imageView = self->_imageView;
  if (!imageView)
  {
    id v4 = objc_alloc((Class)off_1E62BD628);
    v5 = [(CDRichComplicationView *)self device];
    v6 = (CDRichComplicationImageView *)[v4 initWithDevice:v5 useAccentColor:0];
    v7 = self->_imageView;
    self->_imageView = v6;

    [(CDRichComplicationImageView *)self->_imageView setFilterProvider:self];
    [(CDRichComplicationImageView *)self->_imageView setPaused:[(CDRichComplicationView *)self paused]];
    imageView = self->_imageView;
  }
  return imageView;
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationCornerTextImageView;
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
    v8.super_class = (Class)NTKRichComplicationCornerTextImageView;
    int64_t v6 = [(CDRichComplicationTemplateView *)&v8 tritiumUpdateMode];
  }

  return v6;
}

- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3
{
  v8[0] = a3->var0;
  id v5 = a3->var1;
  double var2 = a3->var2;
  id v9 = v5;
  double v10 = var2;
  v7.receiver = self;
  v7.super_class = (Class)NTKRichComplicationCornerTextImageView;
  [(CDRichComplicationCornerBaseTextView *)&v7 _setFontConfiguration:v8];
  if (a3->var1)
  {
    -[CDRichComplicationImageView setFontDescriptor:](self->_imageView, "setFontDescriptor:");
    [(CDRichComplicationImageView *)self->_imageView setFontSizeFactor:a3->var2];
  }
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
  return a3 == 8;
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  objc_super v7 = [v6 textProvider];
  objc_super v8 = [(CDRichComplicationCornerBaseTextView *)self innerLabel];
  [v8 setTextProvider:v7];

  id v9 = [v6 imageProvider];

  [(CDRichComplicationImageView *)self->_imageView setImageProvider:v9 reason:a4];
}

- (void)_editingDidEnd
{
  id v2 = [(CDRichComplicationCornerBaseTextView *)self innerLabel];
  [v2 editingDidEnd];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  id v5 = [(CDRichComplicationCornerBaseTextView *)self innerLabel];
  [v5 transitionToMonochromeWithFraction:2 style:a3];

  imageView = self->_imageView;
  [(CDRichComplicationImageView *)imageView transitionToMonochromeWithFraction:a3];
}

- (void)updateMonochromeColor
{
  id v3 = [(CDRichComplicationCornerBaseTextView *)self innerLabel];
  [v3 updateMonochromeColorWithStyle:2];

  imageView = self->_imageView;
  [(CDRichComplicationImageView *)imageView updateMonochromeColor];
}

- (void).cxx_destruct
{
}

@end