@interface SKUIPlayButton
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
- (BOOL)isRadio;
- (BOOL)showOnDemand;
- (BOOL)showOuterBorder;
- (BOOL)useLargeButton;
- (CGSize)buttonSize;
- (NSString)mediaURLString;
- (NSString)playItemIdentifier;
- (SKUIPlayButtonImageCache)imageCache;
- (float)buttonCornerRadius;
- (id)cancelImage;
- (id)defaultBackgroundColor;
- (id)images;
- (id)outerBorderColor;
- (id)playImage;
- (int64_t)itemIdentifier;
- (int64_t)style;
- (void)_updateEnabledState;
- (void)layoutSubviews;
- (void)playIndicatorDidChange:(BOOL)a3;
- (void)refresh;
- (void)reloadWithItemStatus:(id)a3 animated:(BOOL)a4;
- (void)setBackgroundType:(int64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setItemIdentifier:(int64_t)a3;
- (void)setMediaURLString:(id)a3;
- (void)setPlayItemIdentifier:(id)a3;
- (void)setRadio:(BOOL)a3;
- (void)setShowOnDemand:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setUseLargeButton:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation SKUIPlayButton

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    +[SKUIPlayButton sizeThatFitsWidth:viewElement:context:]();
  }
  double v6 = fmin(a3, 36.0);
  double v7 = v6;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)SKUIPlayButton;
  [(SKUIPlayButtonControl *)&v8 layoutSubviews];
  if ([(SKUIPlayButton *)self style] == 2)
  {
    if ([(SKUIPlayButtonControl *)self showingPlayIndicator])
    {
      [(SKUIPlayButton *)self buttonSize];
      double v4 = v3;
      double v6 = v5;
      double v7 = [(SKUIPlayButtonControl *)self imageView];
      objc_msgSend(v7, "setFrame:", 0.0, 4.0, v4, v6);
    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SKUIPlayButton;
  [(SKUIPlayButtonControl *)&v5 setEnabled:a3];
  if ([(SKUIPlayButton *)self style] == 2)
  {
    if ([(SKUIPlayButtonControl *)self showingPlayIndicator])
    {
      double v4 = [(SKUIPlayButtonControl *)self imageView];
      [v4 setAlpha:1.0];
    }
  }
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)SKUIPlayButton;
  [(SKUIPlayButtonControl *)&v5 tintColorDidChange];
  if ([(SKUIPlayButton *)self style] == 2)
  {
    if ([(SKUIPlayButtonControl *)self showingPlayIndicator])
    {
      double v3 = [(SKUIPlayButtonControl *)self imageView];
      double v4 = [(SKUIPlayButton *)self tintColor];
      [v3 setTintColor:v4];
    }
  }
}

- (CGSize)buttonSize
{
  double v2 = 36.0;
  if (self->_style != 1) {
    double v2 = 28.0;
  }
  double v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (float)buttonCornerRadius
{
  float result = 14.0;
  if (self->_style == 1) {
    return 18.0;
  }
  return result;
}

- (id)cancelImage
{
  double v3 = [(SKUIPlayButtonControl *)self customToggleImage];

  if (v3)
  {
    double v4 = [(SKUIPlayButtonControl *)self customToggleImage];
  }
  else
  {
    BOOL showStop = self->_showStop;
    double v6 = [(SKUIPlayButton *)self images];
    double v7 = v6;
    if (showStop) {
      [v6 stopImage];
    }
    else {
    double v4 = [v6 pauseImage];
    }
  }

  return v4;
}

- (id)defaultBackgroundColor
{
  if ([(SKUIPlayButton *)self style] == 2
    && [(SKUIPlayButtonControl *)self backgroundType] == 1)
  {
    double v3 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SKUIPlayButton;
    double v3 = [(SKUIPlayButtonControl *)&v5 defaultBackgroundColor];
  }

  return v3;
}

- (id)outerBorderColor
{
  if ([(SKUIPlayButton *)self style] == 2 || [(SKUIPlayButtonControl *)self isIndeterminate])
  {
    double v3 = [(SKUIPlayButton *)self tintColor];
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

- (id)playImage
{
  double v3 = [(SKUIPlayButtonControl *)self customPlayImage];

  if (v3)
  {
    double v4 = [(SKUIPlayButtonControl *)self customPlayImage];
  }
  else
  {
    objc_super v5 = [(SKUIPlayButton *)self images];
    double v4 = [v5 playImage];
  }

  return v4;
}

- (void)playIndicatorDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SKUIPlayButton *)self style] == 2 && v3)
  {
    objc_super v5 = [(SKUIPlayButtonControl *)self imageView];
    [v5 setAlpha:1.0];

    id v10 = [(SKUIPlayButtonControl *)self imageView];
    double v6 = [(SKUIPlayButton *)self tintColor];
    [v10 setTintColor:v6];
  }
  else
  {
    if ([(SKUIPlayButton *)self style] != 2) {
      return;
    }
    double v7 = [(SKUIPlayButtonControl *)self imageView];
    objc_super v8 = [MEMORY[0x1E4FB1618] blackColor];
    [v7 setTintColor:v8];

    id v10 = [(SKUIPlayButtonControl *)self imageView];
    [(SKUIPlayButtonControl *)self playButtonDefaultAlpha];
    [v10 setAlpha:v9];
  }
}

- (void)refresh
{
  self->_BOOL showStop = 0;
  v2.receiver = self;
  v2.super_class = (Class)SKUIPlayButton;
  [(SKUIPlayButtonControl *)&v2 refresh];
}

- (void)reloadWithItemStatus:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  uint64_t v6 = [v12 playState];
  BOOL v7 = [(SKUIPlayButtonControl *)self isIndeterminate];
  if (v6 == 1)
  {
    if (!v7) {
      [(SKUIPlayButtonControl *)self beginIndeterminateAnimation];
    }
  }
  else
  {
    if (v7) {
      [(SKUIPlayButtonControl *)self endIndeterminateAnimation];
    }
    [v12 duration];
    double v9 = v8;
    if (self->_showStop != [v12 hideDuration])
    {
      self->_BOOL showStop = [v12 hideDuration];
      [(SKUIPlayButtonControl *)self showPlayIndicator:[(SKUIPlayButtonControl *)self showingPlayIndicator] force:1];
    }
    if (v9 < 2.22044605e-16 || [v12 hideDuration])
    {
      double v10 = 0.0;
    }
    else
    {
      [v12 currentTime];
      double v10 = v11 / v9;
      *(float *)&double v10 = v10;
    }
    [(SKUIPlayButtonControl *)self setProgress:v4 animated:v10];
  }
}

- (void)setBackgroundType:(int64_t)a3
{
  self->_BOOL showStop = 0;
  v3.receiver = self;
  v3.super_class = (Class)SKUIPlayButton;
  [(SKUIPlayButtonControl *)&v3 setBackgroundType:a3];
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    +[SKUIPlayButtonImageCache imageCacheForStyle:](SKUIPlayButtonImageCache, "imageCacheForStyle:");
    objc_super v5 = (SKUIPlayButtonImageCache *)objc_claimAutoreleasedReturnValue();
    imageCache = self->_imageCache;
    self->_imageCache = v5;

    [(SKUIPlayButton *)self refresh];
    if (a3 == 2)
    {
      BOOL v7 = [(SKUIPlayButton *)self playImage];
      id v13 = [v7 imageWithRenderingMode:2];

      double v8 = [(SKUIPlayButtonControl *)self imageView];
      id v9 = [v8 image];

      if (v9 != v13)
      {
        double v10 = [(SKUIPlayButtonControl *)self imageView];
        [v10 setImage:v13];
      }
      if ([(SKUIPlayButtonControl *)self backgroundType] == 1)
      {
        double v11 = [(SKUIPlayButton *)self defaultBackgroundColor];
        [(SKUIPlayButtonControl *)self setControlColor:v11];
      }
      else
      {
        double v11 = [(SKUIPlayButtonControl *)self imageView];
        id v12 = [(SKUIPlayButton *)self tintColor];
        [v11 setTintColor:v12];
      }
      [(SKUIPlayButtonControl *)self updateOuterProgressLayerStroke];
      [(SKUIPlayButtonControl *)self setShowBorder:0];
      [(SKUIPlayButtonControl *)self setShowOuterBorder:1];
    }
    else
    {
      [(SKUIPlayButtonControl *)self setShowOuterBorder:0];
      [(SKUIPlayButtonControl *)self setShowBorder:1];
    }
  }
}

- (id)images
{
  imageCache = self->_imageCache;
  if (!imageCache)
  {
    BOOL v4 = +[SKUIPlayButtonImageCache imageCacheForStyle:self->_style];
    objc_super v5 = self->_imageCache;
    self->_imageCache = v4;

    imageCache = self->_imageCache;
  }

  return imageCache;
}

- (BOOL)showOuterBorder
{
  return [(SKUIPlayButton *)self style] == 2;
}

- (void)setRadio:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  [(SKUIPlayButton *)self setStyle:v3];
}

- (BOOL)isRadio
{
  return [(SKUIPlayButton *)self style] == 2;
}

- (void)setUseLargeButton:(BOOL)a3
{
}

- (BOOL)useLargeButton
{
  return [(SKUIPlayButton *)self style] == 1;
}

- (void)_updateEnabledState
{
  v8.receiver = self;
  v8.super_class = (Class)SKUIPlayButton;
  [(SKUIPlayButtonControl *)&v8 _updateEnabledState];
  if ([(SKUIPlayButton *)self style] == 2)
  {
    if ([(SKUIPlayButtonControl *)self showingPlayIndicator])
    {
      [(SKUIPlayButton *)self buttonSize];
      double v4 = v3;
      double v6 = v5;
      BOOL v7 = [(SKUIPlayButtonControl *)self imageView];
      objc_msgSend(v7, "setFrame:", 0.0, 4.0, v4, v6);
    }
  }
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(int64_t)a3
{
  self->_itemIdentifier = a3;
}

- (NSString)playItemIdentifier
{
  return self->_playItemIdentifier;
}

- (void)setPlayItemIdentifier:(id)a3
{
}

- (BOOL)showOnDemand
{
  return self->_showOnDemand;
}

- (void)setShowOnDemand:(BOOL)a3
{
  self->_showOnDemand = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (NSString)mediaURLString
{
  return self->_mediaURLString;
}

- (void)setMediaURLString:(id)a3
{
}

- (SKUIPlayButtonImageCache)imageCache
{
  return self->_imageCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaURLString, 0);
  objc_storeStrong((id *)&self->_playItemIdentifier, 0);

  objc_storeStrong((id *)&self->_imageCache, 0);
}

+ (void)sizeThatFitsWidth:viewElement:context:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIPlayButton sizeThatFitsWidth:viewElement:context:]";
}

@end