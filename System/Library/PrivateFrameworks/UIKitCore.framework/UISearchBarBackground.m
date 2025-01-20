@interface UISearchBarBackground
- (BOOL)_hasCustomBackgroundImage;
- (BOOL)isTranslucent;
- (BOOL)usesContiguousBarBackground;
- (BOOL)usesEmbeddedAppearance;
- (UIColor)barTintColor;
- (UIImage)backgroundImage;
- (UIImage)backgroundImagePrompt;
- (UISearchBarBackground)initWithFrame:(CGRect)a3;
- (id)_backgroundImageForBarPosition:(int64_t)a3 barMetrics:(int64_t)a4;
- (id)_createBackgroundImageForBarStyle:(int64_t)a3 alpha:(double)a4;
- (int64_t)_barPosition;
- (int64_t)barStyle;
- (unint64_t)searchBarStyle;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_setBackgroundImage:(id)a3 forBarPosition:(int64_t)a4 barMetrics:(int64_t)a5;
- (void)_setBarPosition:(int64_t)a3;
- (void)_updateBackgroundImage;
- (void)_updateBackgroundImageIfPossible;
- (void)didMoveToWindow;
- (void)setBarStyle:(int64_t)a3;
- (void)setBarTintColor:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setSearchBarStyle:(unint64_t)a3;
- (void)setTranslucent:(BOOL)a3;
- (void)setUsesContiguousBarBackground:(BOOL)a3;
- (void)setUsesEmbeddedAppearance:(BOOL)a3;
@end

@implementation UISearchBarBackground

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)UISearchBarBackground;
  [(UIView *)&v3 didMoveToWindow];
  [(UISearchBarBackground *)self _updateBackgroundImageIfPossible];
}

- (id)_backgroundImageForBarPosition:(int64_t)a3 barMetrics:(int64_t)a4
{
  if (a3) {
    int64_t v5 = a3;
  }
  else {
    int64_t v5 = 2;
  }
  v6 = _UIBarAppearanceStorageKeyForBarPositionAndMetrics(v5, a4);
  v7 = [(NSMutableDictionary *)self->_customBackgroundImages objectForKey:v6];

  return v7;
}

- (UIImage)backgroundImage
{
  return (UIImage *)[(UISearchBarBackground *)self _backgroundImageForBarPosition:0 barMetrics:0];
}

- (int64_t)_barPosition
{
  return self->_barPosition;
}

- (void)_setBackgroundImage:(id)a3 forBarPosition:(int64_t)a4 barMetrics:(int64_t)a5
{
  id v19 = a3;
  if (a4) {
    int64_t v8 = a4;
  }
  else {
    int64_t v8 = 2;
  }
  v9 = _UIBarAppearanceStorageKeyForBarPositionAndMetrics(v8, a5);
  if (a4)
  {
    v10 = 0;
  }
  else
  {
    v10 = _UIBarAppearanceStorageKeyForBarPositionAndMetrics(3, a5);
  }
  id v11 = [(UISearchBarBackground *)self _backgroundImageForBarPosition:a4 barMetrics:a5];
  if (v11 != v19)
  {
    id v12 = v19;
    if (v12)
    {
      v13 = v12;
      if (([v12 _isResizable] & 1) != 0 || (objc_msgSend(v13, "size"), v14 <= 1.0))
      {
      }
      else
      {
        uint64_t v15 = objc_msgSend(v13, "resizableImageWithCapInsets:", 0.0, 0.0, 0.0, 0.0);

        v13 = (void *)v15;
        if (!v15) {
          goto LABEL_12;
        }
      }
      customBackgroundImages = self->_customBackgroundImages;
      if (!customBackgroundImages)
      {
        v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v18 = self->_customBackgroundImages;
        self->_customBackgroundImages = v17;

        customBackgroundImages = self->_customBackgroundImages;
      }
      [(NSMutableDictionary *)customBackgroundImages setObject:v13 forKey:v9];
      if (v10) {
        [(NSMutableDictionary *)self->_customBackgroundImages setObject:v13 forKey:v10];
      }
      goto LABEL_20;
    }
LABEL_12:
    [(NSMutableDictionary *)self->_customBackgroundImages removeObjectForKey:v9];
    if (v10) {
      [(NSMutableDictionary *)self->_customBackgroundImages removeObjectForKey:v10];
    }
    v13 = 0;
LABEL_20:
    [(UISearchBarBackground *)self _updateBackgroundImageIfPossible];
  }
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)UISearchBarBackground;
  [(UIView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(UISearchBarBackground *)self _updateBackgroundImageIfPossible];
}

- (void)setTranslucent:(BOOL)a3
{
  int64_t v3 = 1;
  if (!a3) {
    int64_t v3 = 2;
  }
  if (v3 != self->_barTranslucence)
  {
    self->_barTranslucence = v3;
    [(UISearchBarBackground *)self _updateBackgroundImageIfPossible];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  double v9 = v8;
  double v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)UISearchBarBackground;
  -[UIImageView setFrame:](&v15, sel_setFrame_, x, y, width, height);
  [(UIView *)self frame];
  if (v9 != v13 || v11 != v12) {
    [(UISearchBarBackground *)self _updateBackgroundImageIfPossible];
  }
}

- (void)_updateBackgroundImageIfPossible
{
  [(UIView *)self bounds];
  if (v3 != 0.0)
  {
    [(UIView *)self bounds];
    if (v4 != 0.0)
    {
      int64_t v5 = [(UIView *)self window];

      if (v5)
      {
        [(UISearchBarBackground *)self _updateBackgroundImage];
      }
    }
  }
}

- (UISearchBarBackground)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UISearchBarBackground;
  double v3 = -[UIImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    v3->_barPosition = 2;
    [(UISearchBarBackground *)v3 _updateBackgroundImageIfPossible];
  }
  return v4;
}

- (void)_setBarPosition:(int64_t)a3
{
  if (self->_barPosition != a3)
  {
    self->_barPosition = a3;
    [(UISearchBarBackground *)self _updateBackgroundImageIfPossible];
  }
}

- (void)setSearchBarStyle:(unint64_t)a3
{
  if (self->_searchBarStyle != a3)
  {
    self->_searchBarStyle = a3;
    [(_UIBarBackgroundImageView *)self setImage:0];
    [(UISearchBarBackground *)self _updateBackgroundImageIfPossible];
  }
}

- (void)_updateBackgroundImage
{
  [(UIView *)self bounds];
  double v4 = v3;
  if (v3 < 75.0) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 101;
  }
  objc_super v6 = [(UISearchBarBackground *)self _backgroundImageForBarPosition:self->_barPosition barMetrics:v5];
  [(UIImageView *)self setBackgroundColor:0];
  if (v6)
  {
    char v23 = 0;
    [v6 _isInvisibleAndGetIsTranslucent:&v23];
    int64_t barTranslucence = self->_barTranslucence;
    if (v23)
    {
      if (barTranslucence == 2)
      {
        barTintColor = self->_barTintColor;
        if (barTintColor)
        {
          uint64_t v9 = [(UIColor *)barTintColor colorWithAlphaComponent:1.0];
        }
        else
        {
          if ((unint64_t)(self->_barStyle - 1) >= 2) {
            +[UIColor whiteColor];
          }
          else {
          uint64_t v9 = +[UIColor blackColor];
          }
        }
        double v14 = (void *)v9;
        [(UIImageView *)self setBackgroundColor:v9];
        goto LABEL_22;
      }
    }
    else if (barTranslucence == 1)
    {
      _UIBarManufacturedTranslucentImage(v6);
      v6 = double v14 = v6;
LABEL_22:
    }
    [(_UIBarBackgroundImageView *)self setImage:v6];
    [v6 capInsets];
    if (self->_barPosition != 3) {
      goto LABEL_28;
    }
    if (v15 != 0.0) {
      goto LABEL_28;
    }
    if (v16 != 0.0) {
      goto LABEL_28;
    }
    [v6 size];
    double v18 = v17;
    id v19 = [(UIView *)self window];
    v20 = __UIStatusBarManagerForWindow(v19);
    [v20 defaultStatusBarHeightInOrientation:1];
    double v22 = v21;

    if (v18 == v4 - v22) {
      [(_UIBarBackgroundImageView *)self updateTopStripViewCreateIfNecessary];
    }
    else {
LABEL_28:
    }
      [(_UIBarBackgroundImageView *)self removeTopStripView];
    goto LABEL_29;
  }
  if (self->_searchBarStyle > 1)
  {
    double v13 = 0;
  }
  else
  {
    int64_t barStyle = self->_barStyle;
    BOOL v11 = [(UISearchBarBackground *)self isTranslucent];
    double v12 = 0.96;
    if (!v11) {
      double v12 = 1.0;
    }
    double v13 = [(UISearchBarBackground *)self _createBackgroundImageForBarStyle:barStyle alpha:v12];
  }
  objc_super v6 = objc_msgSend(v13, "resizableImageWithCapInsets:", 1.0, 0.0, 1.0, 0.0);

  [(_UIBarBackgroundImageView *)self setImage:v6];
LABEL_29:
  [(UIView *)self setOpaque:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customBackgroundImages, 0);
  objc_storeStrong((id *)&self->_barTintColor, 0);
}

- (void)setBarTintColor:(id)a3
{
  uint64_t v5 = (UIColor *)a3;
  if (self->_barTintColor != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_barTintColor, a3);
    [(UISearchBarBackground *)self _updateBackgroundImageIfPossible];
    uint64_t v5 = v6;
  }
}

- (BOOL)isTranslucent
{
  unint64_t barStyle = self->_barStyle;
  barTintColor = self->_barTintColor;
  uint64_t v5 = [(UIView *)self _screen];
  BOOL IsTranslucentOnScreen = _UIBarStyleWithTintColorIsTranslucentOnScreen(barStyle, (uint64_t)barTintColor, v5);

  BOOL v10 = IsTranslucentOnScreen;
  int64_t barTranslucence = self->_barTranslucence;
  if (barTranslucence) {
    return barTranslucence == 1;
  }
  if ([(UISearchBarBackground *)self _hasCustomBackgroundImage])
  {
    double v8 = [(UISearchBarBackground *)self _backgroundImageForBarPosition:0 barMetrics:0];
    [v8 _isInvisibleAndGetIsTranslucent:&v10];

    return v10;
  }
  return IsTranslucentOnScreen;
}

- (void)setUsesEmbeddedAppearance:(BOOL)a3
{
  if (self->_usesEmbeddedAppearance != a3)
  {
    self->_usesEmbeddedAppearance = a3;
    [(UISearchBarBackground *)self _updateBackgroundImageIfPossible];
  }
}

- (BOOL)usesEmbeddedAppearance
{
  return self->_usesEmbeddedAppearance;
}

- (void)setBarStyle:(int64_t)a3
{
  if (self->_barStyle != a3)
  {
    self->_unint64_t barStyle = a3;
    if (!self->_barTintColor) {
      [(UISearchBarBackground *)self _updateBackgroundImageIfPossible];
    }
  }
}

- (int64_t)barStyle
{
  return self->_barStyle;
}

- (unint64_t)searchBarStyle
{
  return self->_searchBarStyle;
}

- (id)_createBackgroundImageForBarStyle:(int64_t)a3 alpha:(double)a4
{
  if (!_MergedGlobals_21_1)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    double v8 = (void *)_MergedGlobals_21_1;
    _MergedGlobals_21_1 = (uint64_t)v7;
  }
  if (os_variant_has_internal_diagnostics())
  {
    if (!self)
    {
      v44 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v44, OS_LOG_TYPE_FAULT, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
      }
    }
  }
  else if (!self)
  {
    v45 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25E7E0) + 8);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v45, OS_LOG_TYPE_ERROR, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
    }
  }
  uint64_t v9 = +[UITraitCollection _currentTraitCollectionIfExists]();
  BOOL v10 = [(UIView *)self traitCollection];
  +[UITraitCollection setCurrentTraitCollection:v10];

  BOOL v11 = (void *)_UISetCurrentFallbackEnvironment(self);
  double v12 = _UISearchBarBackgroundFillColor(a3, self->_barTintColor);
  double v13 = self->_barTintColor;
  double v14 = v13;
  if (a3 || v13)
  {
    _UISearchBarBackgroundFillColor(a3, v13);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    double v17 = v16;
    if (v16)
    {
      double v50 = 0.0;
      *(void *)buf = 0;
      uint64_t v48 = 0;
      double v49 = 0.0;
      if ([v16 getHue:buf saturation:&v50 brightness:&v49 alpha:&v48])
      {
        double v49 = v49 * 0.6;
        +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", *(double *)buf, v50);
        id v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v18 = v17;
      }
      double v15 = v18;
    }
    else
    {
      double v15 = 0;
    }
  }
  else if (dyld_program_sdk_at_least())
  {
    double v15 = +[UIColor separatorColor];
  }
  else
  {
    id v19 = +[UIColor _barHairlineShadowColor];
    double v15 = +[UIColor _composedColorFromSourceColor:destinationColor:tintColor:alpha:](1.0, (uint64_t)UIColor, v19, 0, 0);
  }
  int64_t barPosition = self->_barPosition;
  BOOL usesContiguousBarBackground = self->_usesContiguousBarBackground;
  [(UIView *)self _currentScreenScale];
  double v23 = v22;
  [(UIView *)self bounds];
  double v25 = v24;
  double v26 = 0.0;
  if (barPosition == 3)
  {
    v27 = [(UIView *)self window];
    v28 = __UIStatusBarManagerForWindow(v27);
    [v28 statusBarHeight];
    double v26 = v29;
  }
  v30 = [_UISearchBarBackgroundCacheKey alloc];
  id v31 = v12;
  uint64_t v32 = [v31 CGColor];
  id v33 = v15;
  v34 = -[_UISearchBarBackgroundCacheKey initWithBarPosition:usesContiguousBarBackground:scale:alpha:height:statusBarHeight:backgroundColor:strokeColor:](v30, "initWithBarPosition:usesContiguousBarBackground:scale:alpha:height:statusBarHeight:backgroundColor:strokeColor:", barPosition, usesContiguousBarBackground, v32, [v33 CGColor], v23, a4, v25, v26);
  v35 = [(id)_MergedGlobals_21_1 objectForKey:v34];
  if (!v35)
  {
    double v36 = *MEMORY[0x1E4F1DB28];
    if (barPosition == 3) {
      double v36 = 0.0;
    }
    CGFloat v47 = v36;
    if (barPosition == 3) {
      double v37 = 0.0;
    }
    else {
      double v37 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    }
    if (barPosition == 3) {
      double v38 = 1.0 / v23;
    }
    else {
      double v38 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    }
    if (barPosition == 3) {
      double v39 = v26;
    }
    else {
      double v39 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    CGFloat v46 = v39;
    if (barPosition == 3)
    {
      double v40 = v25 - v26;
    }
    else
    {
      double v26 = 0.0;
      double v40 = v25;
    }
    _UIGraphicsBeginImageContextWithOptions(0, 0, 1.0 / v23, v25, v23);
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1) {
      v42 = 0;
    }
    else {
      v42 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    }
    CGContextSetAlpha(v42, a4);
    [v31 set];
    UIRectFillUsingOperation(1, 0.0, v26, 1.0 / v23, v40);
    if (barPosition == 3)
    {
      [v31 set];
      UIRectFillUsingOperation(1, v47, v37, v38, v46);
    }
    if (!usesContiguousBarBackground)
    {
      [v33 set];
      UIRectFillUsingOperation(1, 0.0, v25 - 1.0 / v23, 1.0 / v23, 1.0 / v23);
    }
    if (barPosition == 2)
    {
      [v33 set];
      UIRectFillUsingOperation(1, 0.0, v26, 1.0 / v23, 1.0 / v23);
    }
    v35 = _UIGraphicsGetImageFromCurrentImageContext(0);
    UIGraphicsEndImageContext();
    if (v35) {
      [(id)_MergedGlobals_21_1 setObject:v35 forKey:v34];
    }
  }
  _UIRestorePreviousFallbackEnvironment(v11);
  +[UITraitCollection setCurrentTraitCollection:v9];

  return v35;
}

- (UIImage)backgroundImagePrompt
{
  return (UIImage *)[(UISearchBarBackground *)self _backgroundImageForBarPosition:0 barMetrics:101];
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)UISearchBarBackground;
  -[UIImageView setBounds:](&v15, sel_setBounds_, x, y, width, height);
  [(UIView *)self bounds];
  if (v9 != v13 || v11 != v12) {
    [(UISearchBarBackground *)self _updateBackgroundImageIfPossible];
  }
}

- (BOOL)_hasCustomBackgroundImage
{
  return [(NSMutableDictionary *)self->_customBackgroundImages count] != 0;
}

- (void)setUsesContiguousBarBackground:(BOOL)a3
{
  if (self->_usesContiguousBarBackground != a3)
  {
    self->_BOOL usesContiguousBarBackground = a3;
    [(UISearchBarBackground *)self _updateBackgroundImageIfPossible];
  }
}

- (BOOL)usesContiguousBarBackground
{
  return self->_usesContiguousBarBackground;
}

- (UIColor)barTintColor
{
  return self->_barTintColor;
}

@end