@interface NTKRichComplicationCornerCircularImageView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (id)_circularView;
- (int64_t)tritiumUpdateMode;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
- (void)_setFontConfiguration:(CDRichComplicationFontConfiguration *)a3;
- (void)_updatePlatterColor;
- (void)setPaused:(BOOL)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKRichComplicationCornerCircularImageView

- (id)_circularView
{
  imageView = self->_imageView;
  if (!imageView)
  {
    [(CDRichComplicationView *)self device];
    objc_claimAutoreleasedReturnValue();
    CDShowGossamerUI();
  }
  [(CDRichComplicationImageView *)imageView setContentMode:4];
  v4 = self->_imageView;

  return v4;
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationCornerCircularImageView;
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
    v8.super_class = (Class)NTKRichComplicationCornerCircularImageView;
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
  v7.super_class = (Class)NTKRichComplicationCornerCircularImageView;
  [(CDRichComplicationView *)&v7 _setFontConfiguration:v8];
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
  id v6 = [a3 imageProvider];
  [(CDRichComplicationImageView *)self->_imageView setImageProvider:v6 reason:a4];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  [(NTKRichComplicationCornerCircularImageView *)self _updatePlatterColor];
  imageView = self->_imageView;

  [(CDRichComplicationImageView *)imageView transitionToMonochromeWithFraction:a3];
}

- (void)updateMonochromeColor
{
  [(NTKRichComplicationCornerCircularImageView *)self _updatePlatterColor];
  imageView = self->_imageView;

  [(CDRichComplicationImageView *)imageView updateMonochromeColor];
}

- (void)_updatePlatterColor
{
  if ([(CDRichComplicationTemplateView *)self templateWantsPlatter])
  {
    id v3 = [(CDRichComplicationView *)self filterProvider];
    [v3 colorForView:self accented:0];
    objc_claimAutoreleasedReturnValue();

    CLKUIDefaultComplicationBackgroundColorWithNonAccentColor();
  }
  id v4 = [MEMORY[0x1E4FB1618] clearColor];
  -[CDRichComplicationImageView setBackgroundColor:](self->_imageView, "setBackgroundColor:");
}

- (void).cxx_destruct
{
}

@end