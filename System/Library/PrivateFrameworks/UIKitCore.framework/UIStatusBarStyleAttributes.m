@interface UIStatusBarStyleAttributes
- (BOOL)isDoubleHeight;
- (BOOL)isLockScreen;
- (BOOL)isPulsingAnimationEnabled;
- (BOOL)isTranslucent;
- (BOOL)isTransparent;
- (BOOL)shouldProduceReturnEvent;
- (BOOL)shouldShowInternalItemType:(int)a3 withScreenCapabilities:(id)a4;
- (BOOL)shouldUseVisualAltitude;
- (BOOL)supportsRasterization;
- (BOOL)usesVerticalLayout;
- (UIStatusBarStyleAttributes)init;
- (UIStatusBarStyleAttributes)initWithRequest:(id)a3;
- (double)foregroundAlpha;
- (double)glowAnimationDuration;
- (double)heightForMetrics:(int64_t)a3;
- (double)heightForOrientation:(int64_t)a3;
- (id)backgroundColorWithTintColor:(id)a3;
- (id)backgroundImageName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)foregroundStyle;
- (id)newForegroundStyleWithHeight:(double)a3;
- (int64_t)idiom;
- (int64_t)legibilityStyle;
- (int64_t)style;
- (int64_t)tapButtonType;
- (void)setForegroundAlpha:(double)a3;
- (void)setPulsingAnimationEnabled:(BOOL)a3;
@end

@implementation UIStatusBarStyleAttributes

- (BOOL)isDoubleHeight
{
  return 0;
}

- (UIStatusBarStyleAttributes)initWithRequest:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIStatusBarStyleAttributes;
  v5 = [(UIStatusBarStyleAttributes *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    request = v5->_request;
    v5->_request = (UIStatusBarStyleRequest *)v6;
  }
  return v5;
}

- (UIStatusBarStyleAttributes)init
{
  return [(UIStatusBarStyleAttributes *)self initWithRequest:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = (void *)[(UIStatusBarStyleRequest *)self->_request copy];
  uint64_t v6 = (void *)[v4 initWithRequest:v5];

  uint64_t v7 = [(UIStatusBarStyleRequest *)self->_request copy];
  v8 = (void *)v6[1];
  v6[1] = v7;

  uint64_t v9 = [(UIStatusBarForegroundStyleAttributes *)self->_foregroundStyle copy];
  v10 = (void *)v6[2];
  v6[2] = v9;

  return v6;
}

- (double)foregroundAlpha
{
  [(UIStatusBarStyleRequest *)self->_request foregroundAlpha];
  return result;
}

- (void)setForegroundAlpha:(double)a3
{
  v5 = (UIStatusBarStyleRequest *)[(UIStatusBarStyleRequest *)self->_request mutableCopy];
  [(UIStatusBarStyleRequest *)v5 setForegroundAlpha:a3];
  request = self->_request;
  self->_request = v5;
}

- (int64_t)style
{
  return [(UIStatusBarStyleRequest *)self->_request style];
}

- (int64_t)legibilityStyle
{
  return [(UIStatusBarStyleRequest *)self->_request legibilityStyle];
}

- (BOOL)supportsRasterization
{
  return [(UIStatusBarStyleAttributes *)self legibilityStyle] == 0;
}

- (id)foregroundStyle
{
  foregroundStyle = self->_foregroundStyle;
  if (!foregroundStyle)
  {
    [(UIStatusBarStyleAttributes *)self heightForMetrics:0];
    id v4 = -[UIStatusBarStyleAttributes newForegroundStyleWithHeight:](self, "newForegroundStyleWithHeight:");
    v5 = self->_foregroundStyle;
    self->_foregroundStyle = v4;

    unint64_t v6 = [(UIStatusBarStyleAttributes *)self style];
    if (v6 - 300 < 6
      || v6 - 103 <= 7 && ((1 << (v6 - 103)) & 0x99) != 0
      || (uint64_t v7 = 0, v6 <= 3) && v6 != 2)
    {
      uint64_t v7 = 1;
    }
    [(UIStatusBarForegroundStyleAttributes *)self->_foregroundStyle setCanShowBreadcrumbs:v7];
    foregroundStyle = self->_foregroundStyle;
  }
  return foregroundStyle;
}

- (int64_t)idiom
{
  v2 = +[UIDevice currentDevice];
  int64_t v3 = [v2 userInterfaceIdiom];

  return v3;
}

- (double)heightForOrientation:(int64_t)a3
{
  v5 = [(UIStatusBarStyleRequest *)self->_request overrideHeight];

  if (v5)
  {
    unint64_t v6 = [(UIStatusBarStyleRequest *)self->_request overrideHeight];
    [v6 doubleValue];
    double v8 = v7;

    return v8;
  }
  else
  {
    uint64_t v10 = _UIDeviceNativeUserInterfaceIdiom();
    BOOL v12 = (unint64_t)(a3 - 5) < 0xFFFFFFFFFFFFFFFELL && v10 != 1;
    [(UIStatusBarStyleAttributes *)self heightForMetrics:v12];
  }
  return result;
}

- (double)heightForMetrics:(int64_t)a3
{
  return 20.0;
}

- (BOOL)isTranslucent
{
  return 0;
}

- (BOOL)isTransparent
{
  return 0;
}

- (BOOL)isLockScreen
{
  return 0;
}

- (BOOL)usesVerticalLayout
{
  v2 = [(UIStatusBarStyleAttributes *)self foregroundStyle];
  char v3 = [v2 usesVerticalLayout];

  return v3;
}

- (BOOL)shouldProduceReturnEvent
{
  return 0;
}

- (BOOL)shouldUseVisualAltitude
{
  return 0;
}

- (id)backgroundColorWithTintColor:(id)a3
{
  return 0;
}

- (id)backgroundImageName
{
  return 0;
}

- (id)newForegroundStyleWithHeight:(double)a3
{
  return 0;
}

- (double)glowAnimationDuration
{
  return 0.0;
}

- (BOOL)shouldShowInternalItemType:(int)a3 withScreenCapabilities:(id)a4
{
  return 0;
}

- (int64_t)tapButtonType
{
  return -1;
}

- (BOOL)isPulsingAnimationEnabled
{
  return self->_pulsingAnimationEnabled;
}

- (void)setPulsingAnimationEnabled:(BOOL)a3
{
  self->_pulsingAnimationEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundStyle, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end