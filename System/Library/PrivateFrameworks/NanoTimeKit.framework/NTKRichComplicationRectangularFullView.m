@interface NTKRichComplicationRectangularFullView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (NTKRichComplicationRectangularFullView)init;
- (int64_t)tritiumUpdateMode;
- (void)_handleTemplate:(id)a3 reason:(int64_t)a4;
- (void)layoutSubviews;
- (void)setPaused:(BOOL)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKRichComplicationRectangularFullView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 11;
}

- (NTKRichComplicationRectangularFullView)init
{
  v8.receiver = self;
  v8.super_class = (Class)NTKRichComplicationRectangularFullView;
  v2 = [(NTKRichComplicationRectangularBaseView *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)off_1E62BD628);
    v4 = [(CDRichComplicationView *)v2 device];
    uint64_t v5 = [v3 initWithDevice:v4 useAccentColor:0];
    imageView = v2->_imageView;
    v2->_imageView = (CDRichComplicationImageView *)v5;

    [(CDRichComplicationImageView *)v2->_imageView setPaused:[(CDRichComplicationView *)v2 paused]];
    [(CDRichComplicationImageView *)v2->_imageView setFilterProvider:v2];
    [(NTKRichComplicationRectangularFullView *)v2 addSubview:v2->_imageView];
  }
  return v2;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)NTKRichComplicationRectangularFullView;
  [(NTKRichComplicationRectangularFullView *)&v13 layoutSubviews];
  [(NTKRichComplicationRectangularFullView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[CDRichComplicationImageView setFrame:](self->_imageView, "setFrame:");
  imageView = self->_imageView;
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  double MidX = CGRectGetMidX(v14);
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  -[CDRichComplicationImageView setCenter:](imageView, "setCenter:", MidX, CGRectGetMidY(v15));
}

- (void)_handleTemplate:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKRichComplicationRectangularFullView;
  [(CDRichComplicationTemplateView *)&v9 _handleTemplate:v6 reason:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    imageView = self->_imageView;
    CGFloat v8 = [v6 imageProvider];
    [(CDRichComplicationImageView *)imageView setImageProvider:v8 reason:a4];
  }
}

- (void)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NTKRichComplicationRectangularFullView;
  -[CDRichComplicationView setPaused:](&v5, sel_setPaused_);
  [(CDRichComplicationImageView *)self->_imageView setPaused:v3];
}

- (int64_t)tritiumUpdateMode
{
  BOOL v3 = [(CDRichComplicationImageView *)self->_imageView tritiumUpdateMode];
  CGFloat v4 = v3;
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
    v8.super_class = (Class)NTKRichComplicationRectangularFullView;
    int64_t v6 = [(CDRichComplicationTemplateView *)&v8 tritiumUpdateMode];
  }

  return v6;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
}

- (void)updateMonochromeColor
{
}

- (void).cxx_destruct
{
}

@end