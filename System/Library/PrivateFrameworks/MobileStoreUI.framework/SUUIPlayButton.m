@interface SUUIPlayButton
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
- (BOOL)isRadio;
- (BOOL)showOnDemand;
- (BOOL)showOuterBorder;
- (BOOL)useLargeButton;
- (CGSize)buttonSize;
- (NSString)mediaURLString;
- (NSString)playItemIdentifier;
- (SUUIPlayButtonImageCache)imageCache;
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

@implementation SUUIPlayButton

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  double v5 = fmin(a3, 36.0);
  double v6 = v5;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIPlayButton;
  [(SUUIPlayButtonControl *)&v8 layoutSubviews];
  if ([(SUUIPlayButton *)self style] == 2)
  {
    if ([(SUUIPlayButtonControl *)self showingPlayIndicator])
    {
      [(SUUIPlayButton *)self buttonSize];
      double v4 = v3;
      double v6 = v5;
      v7 = [(SUUIPlayButtonControl *)self imageView];
      objc_msgSend(v7, "setFrame:", 0.0, 4.0, v4, v6);
    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIPlayButton;
  [(SUUIPlayButtonControl *)&v5 setEnabled:a3];
  if ([(SUUIPlayButton *)self style] == 2)
  {
    if ([(SUUIPlayButtonControl *)self showingPlayIndicator])
    {
      double v4 = [(SUUIPlayButtonControl *)self imageView];
      [v4 setAlpha:1.0];
    }
  }
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIPlayButton;
  [(SUUIPlayButtonControl *)&v5 tintColorDidChange];
  if ([(SUUIPlayButton *)self style] == 2)
  {
    if ([(SUUIPlayButtonControl *)self showingPlayIndicator])
    {
      double v3 = [(SUUIPlayButtonControl *)self imageView];
      double v4 = [(SUUIPlayButton *)self tintColor];
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
  double v3 = [(SUUIPlayButtonControl *)self customToggleImage];

  if (v3)
  {
    double v4 = [(SUUIPlayButtonControl *)self customToggleImage];
  }
  else
  {
    BOOL showStop = self->_showStop;
    double v6 = [(SUUIPlayButton *)self images];
    v7 = v6;
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
  if ([(SUUIPlayButton *)self style] == 2
    && [(SUUIPlayButtonControl *)self backgroundType] == 1)
  {
    double v3 = [MEMORY[0x263F825C8] whiteColor];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SUUIPlayButton;
    double v3 = [(SUUIPlayButtonControl *)&v5 defaultBackgroundColor];
  }
  return v3;
}

- (id)outerBorderColor
{
  if ([(SUUIPlayButton *)self style] == 2 || [(SUUIPlayButtonControl *)self isIndeterminate])
  {
    double v3 = [(SUUIPlayButton *)self tintColor];
  }
  else
  {
    double v3 = 0;
  }
  return v3;
}

- (id)playImage
{
  double v3 = [(SUUIPlayButtonControl *)self customPlayImage];

  if (v3)
  {
    double v4 = [(SUUIPlayButtonControl *)self customPlayImage];
  }
  else
  {
    objc_super v5 = [(SUUIPlayButton *)self images];
    double v4 = [v5 playImage];
  }
  return v4;
}

- (void)playIndicatorDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SUUIPlayButton *)self style] == 2 && v3)
  {
    objc_super v5 = [(SUUIPlayButtonControl *)self imageView];
    [v5 setAlpha:1.0];

    id v10 = [(SUUIPlayButtonControl *)self imageView];
    double v6 = [(SUUIPlayButton *)self tintColor];
    [v10 setTintColor:v6];
  }
  else
  {
    if ([(SUUIPlayButton *)self style] != 2) {
      return;
    }
    v7 = [(SUUIPlayButtonControl *)self imageView];
    objc_super v8 = [MEMORY[0x263F825C8] blackColor];
    [v7 setTintColor:v8];

    id v10 = [(SUUIPlayButtonControl *)self imageView];
    [(SUUIPlayButtonControl *)self playButtonDefaultAlpha];
    [v10 setAlpha:v9];
  }
}

- (void)refresh
{
  self->_BOOL showStop = 0;
  v2.receiver = self;
  v2.super_class = (Class)SUUIPlayButton;
  [(SUUIPlayButtonControl *)&v2 refresh];
}

- (void)reloadWithItemStatus:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  uint64_t v6 = [v12 playState];
  BOOL v7 = [(SUUIPlayButtonControl *)self isIndeterminate];
  if (v6 == 1)
  {
    if (!v7) {
      [(SUUIPlayButtonControl *)self beginIndeterminateAnimation];
    }
  }
  else
  {
    if (v7) {
      [(SUUIPlayButtonControl *)self endIndeterminateAnimation];
    }
    [v12 duration];
    double v9 = v8;
    if (self->_showStop != [v12 hideDuration])
    {
      self->_BOOL showStop = [v12 hideDuration];
      [(SUUIPlayButtonControl *)self showPlayIndicator:[(SUUIPlayButtonControl *)self showingPlayIndicator] force:1];
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
    [(SUUIPlayButtonControl *)self setProgress:v4 animated:v10];
  }
}

- (void)setBackgroundType:(int64_t)a3
{
  self->_BOOL showStop = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUUIPlayButton;
  [(SUUIPlayButtonControl *)&v3 setBackgroundType:a3];
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    +[SUUIPlayButtonImageCache imageCacheForStyle:](SUUIPlayButtonImageCache, "imageCacheForStyle:");
    objc_super v5 = (SUUIPlayButtonImageCache *)objc_claimAutoreleasedReturnValue();
    imageCache = self->_imageCache;
    self->_imageCache = v5;

    [(SUUIPlayButton *)self refresh];
    if (a3 == 2)
    {
      BOOL v7 = [(SUUIPlayButton *)self playImage];
      id v13 = [v7 imageWithRenderingMode:2];

      double v8 = [(SUUIPlayButtonControl *)self imageView];
      id v9 = [v8 image];

      if (v9 != v13)
      {
        double v10 = [(SUUIPlayButtonControl *)self imageView];
        [v10 setImage:v13];
      }
      if ([(SUUIPlayButtonControl *)self backgroundType] == 1)
      {
        double v11 = [(SUUIPlayButton *)self defaultBackgroundColor];
        [(SUUIPlayButtonControl *)self setControlColor:v11];
      }
      else
      {
        double v11 = [(SUUIPlayButtonControl *)self imageView];
        id v12 = [(SUUIPlayButton *)self tintColor];
        [v11 setTintColor:v12];
      }
      [(SUUIPlayButtonControl *)self updateOuterProgressLayerStroke];
      [(SUUIPlayButtonControl *)self setShowBorder:0];
      [(SUUIPlayButtonControl *)self setShowOuterBorder:1];
    }
    else
    {
      [(SUUIPlayButtonControl *)self setShowOuterBorder:0];
      [(SUUIPlayButtonControl *)self setShowBorder:1];
    }
  }
}

- (id)images
{
  imageCache = self->_imageCache;
  if (!imageCache)
  {
    BOOL v4 = +[SUUIPlayButtonImageCache imageCacheForStyle:self->_style];
    objc_super v5 = self->_imageCache;
    self->_imageCache = v4;

    imageCache = self->_imageCache;
  }
  return imageCache;
}

- (BOOL)showOuterBorder
{
  return [(SUUIPlayButton *)self style] == 2;
}

- (void)setRadio:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  [(SUUIPlayButton *)self setStyle:v3];
}

- (BOOL)isRadio
{
  return [(SUUIPlayButton *)self style] == 2;
}

- (void)setUseLargeButton:(BOOL)a3
{
}

- (BOOL)useLargeButton
{
  return [(SUUIPlayButton *)self style] == 1;
}

- (void)_updateEnabledState
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIPlayButton;
  [(SUUIPlayButtonControl *)&v8 _updateEnabledState];
  if ([(SUUIPlayButton *)self style] == 2)
  {
    if ([(SUUIPlayButtonControl *)self showingPlayIndicator])
    {
      [(SUUIPlayButton *)self buttonSize];
      double v4 = v3;
      double v6 = v5;
      BOOL v7 = [(SUUIPlayButtonControl *)self imageView];
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

- (SUUIPlayButtonImageCache)imageCache
{
  return self->_imageCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaURLString, 0);
  objc_storeStrong((id *)&self->_playItemIdentifier, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
}

@end