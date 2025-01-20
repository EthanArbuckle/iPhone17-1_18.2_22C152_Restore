@interface SBIconBadgeView
+ (UIColor)badgeBackgroundColor;
+ (double)_textPadding;
+ (id)_checkoutImageForText:(id)a3 font:(id)a4 highlighted:(BOOL)a5;
+ (id)_createImageForText:(id)a3 font:(id)a4 highlighted:(BOOL)a5;
- (BOOL)displayingAccessory;
- (CGPoint)accessoryCenterForIconBounds:(CGRect)a3;
- (CGPoint)layoutOffset;
- (CGSize)badgeSize;
- (CGSize)intrinsicContentSize;
- (CGSize)intrinsicContentSizeForTextImage:(id)a3;
- (NSString)materialGroupNameBase;
- (NSString)overrideText;
- (NSString)text;
- (SBFParallaxSettings)parallaxSettings;
- (SBHIconImageAppearance)overrideIconImageAppearance;
- (SBIconBadgeView)init;
- (SBIconListLayout)listLayout;
- (UIFont)overrideFont;
- (double)badgeContentScale;
- (double)brightness;
- (double)overridePaddingFactor;
- (id)accessoryTextForIcon:(id)a3 infoProvider:(id)a4;
- (id)effectiveIconImageAppearance;
- (id)font;
- (int64_t)style;
- (void)_applyParallaxSettings;
- (void)_clearText;
- (void)_configureAnimatedForText:(id)a3 highlighted:(BOOL)a4 animator:(id)a5;
- (void)_configureAnimatedWithoutIcon;
- (void)_configureBackgroundAfterIconImageAppearanceChange;
- (void)_configureForText:(id)a3 highlighted:(BOOL)a4;
- (void)_configureWithoutIcon;
- (void)_crossfadeToTextImage:(id)a3 animator:(id)a4;
- (void)_layOutTextImageView:(id)a3;
- (void)_resizeForTextImage:(id)a3;
- (void)_zoomInWithTextImage:(id)a3 animator:(id)a4;
- (void)configureAnimatedForIcon:(id)a3 infoProvider:(id)a4 animator:(id)a5;
- (void)configureForIcon:(id)a3 infoProvider:(id)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessoryBrightness:(double)a3;
- (void)setBrightness:(double)a3;
- (void)setListLayout:(id)a3;
- (void)setMaterialGroupNameBase:(id)a3;
- (void)setOverrideFont:(id)a3;
- (void)setOverrideIconImageAppearance:(id)a3;
- (void)setOverridePaddingFactor:(double)a3;
- (void)setOverrideText:(id)a3;
- (void)setParallaxSettings:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)updateShadowWithRadius:(double)a3 alpha:(double)a4 imageOutset:(double)a5;
@end

@implementation SBIconBadgeView

- (void)setParallaxSettings:(id)a3
{
  v5 = (SBFParallaxSettings *)a3;
  parallaxSettings = self->_parallaxSettings;
  if (parallaxSettings != v5)
  {
    v7 = v5;
    [(SBFParallaxSettings *)parallaxSettings removeKeyObserver:self];
    objc_storeStrong((id *)&self->_parallaxSettings, a3);
    [(SBFParallaxSettings *)self->_parallaxSettings addKeyObserver:self];
    [(SBIconBadgeView *)self _applyParallaxSettings];
    v5 = v7;
  }
}

- (void)_applyParallaxSettings
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4FB1EB0] _motionEffectsSupported])
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v3 = [(SBIconBadgeView *)self _motionEffects];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v30;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v30 != v6) {
            objc_enumerationMutation(v3);
          }
          [(SBIconBadgeView *)self _removeMotionEffect:*(void *)(*((void *)&v29 + 1) + 8 * v7++)];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v5);
    }

    parallaxSettings = self->_parallaxSettings;
    if (parallaxSettings)
    {
      [(SBFParallaxSettings *)parallaxSettings slidePixelsX];
      double v10 = v9 * (double)[(SBFParallaxSettings *)self->_parallaxSettings slideDirectionX] * 0.5;
      [(SBFParallaxSettings *)self->_parallaxSettings slidePixelsY];
      double v12 = v11 * (double)[(SBFParallaxSettings *)self->_parallaxSettings slideDirectionY] * 0.5;
      double v13 = fabs(v12);
      if (fabs(v10) >= 2.22044605e-16 && v13 >= 2.22044605e-16)
      {
        v15 = (void *)[objc_alloc(MEMORY[0x1E4FB1870]) initWithKeyPath:@"layer.transform" type:0];
        v16 = (void *)MEMORY[0x1E4F29238];
        CATransform3DMakeTranslation(&v28, -v10, 0.0, 0.0);
        v17 = [v16 valueWithCATransform3D:&v28];
        [v15 setMinimumRelativeValue:v17];

        v18 = (void *)MEMORY[0x1E4F29238];
        CATransform3DMakeTranslation(&v27, v10, 0.0, 0.0);
        v19 = [v18 valueWithCATransform3D:&v27];
        [v15 setMaximumRelativeValue:v19];

        v20 = (void *)[objc_alloc(MEMORY[0x1E4FB1870]) initWithKeyPath:@"layer.transform" type:1];
        v21 = (void *)MEMORY[0x1E4F29238];
        CATransform3DMakeTranslation(&v26, 0.0, -v12, 0.0);
        v22 = [v21 valueWithCATransform3D:&v26];
        [v20 setMinimumRelativeValue:v22];

        v23 = (void *)MEMORY[0x1E4F29238];
        CATransform3DMakeTranslation(&v25, 0.0, v12, 0.0);
        v24 = [v23 valueWithCATransform3D:&v25];
        [v20 setMaximumRelativeValue:v24];

        [(SBIconBadgeView *)self _addMotionEffect:v15];
        [(SBIconBadgeView *)self _addMotionEffect:v20];
      }
    }
  }
}

- (CGSize)intrinsicContentSize
{
  v3 = [(SBHIconAccessoryCountedMapImageTuple *)self->_textImageTuple image];
  [(SBIconBadgeView *)self intrinsicContentSizeForTextImage:v3];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)prepareForReuse
{
  self->_displayingAccessory = 0;
  text = self->_text;
  self->_text = 0;

  [(SBIconBadgeView *)self _clearText];
  [(UIImageView *)self->_textView setImage:0];
  [(SBIconBadgeView *)self _resizeForTextImage:0];
  [(SBIconBadgeView *)self setOverrideFont:0];
  [(SBIconBadgeView *)self setOverrideText:0];
  [(SBIconBadgeView *)self setOverridePaddingFactor:0.0];
  [(SBIconBadgeView *)self setOverrideIconImageAppearance:0];
}

- (void)setOverrideText:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    double v4 = (NSString *)[v6 copy];
    overrideText = self->_overrideText;
    self->_overrideText = v4;

    [(SBIconBadgeView *)self _configureAnimatedWithoutIcon];
  }
}

- (void)setOverridePaddingFactor:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_overridePaddingFactor = a3;
    text = self->_text;
    self->_text = 0;

    [(SBIconBadgeView *)self _configureAnimatedWithoutIcon];
  }
}

- (void)setOverrideFont:(id)a3
{
  id v7 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    double v4 = (UIFont *)[v7 copy];
    overrideFont = self->_overrideFont;
    self->_overrideFont = v4;

    text = self->_text;
    self->_text = 0;

    [(SBIconBadgeView *)self _configureAnimatedWithoutIcon];
  }
}

- (CGPoint)accessoryCenterForIconBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(SBIconBadgeView *)self layoutOffset];
  double v9 = v8;
  double v11 = v10;
  [(SBIconBadgeView *)self bounds];
  double v13 = v12;
  double v15 = v14;
  char v16 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1;
  double v17 = SBIconBadgeViewCalculateAccessoryCenter(v16, x, y, width, height, v13, v15, v9, v11);
  result.CGFloat y = v18;
  result.CGFloat x = v17;
  return result;
}

- (CGPoint)layoutOffset
{
  v2 = [(SBIconBadgeView *)self listLayout];
  double v3 = SBHIconListLayoutIconAccessoryOffset(v2);
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.CGFloat y = v7;
  result.CGFloat x = v6;
  return result;
}

- (SBIconListLayout)listLayout
{
  return self->_listLayout;
}

- (void)setAccessoryBrightness:(double)a3
{
  -[SBIconBadgeView setBrightness:](self, "setBrightness:");
  id v5 = [(UIView *)self->_backgroundView sbh_darkener];
  [v5 setBrightness:a3];
}

- (void)setBrightness:(double)a3
{
  self->_brightness = a3;
}

- (BOOL)displayingAccessory
{
  return self->_displayingAccessory;
}

- (void)configureForIcon:(id)a3 infoProvider:(id)a4
{
  id v6 = a4;
  id v8 = [(SBIconBadgeView *)self accessoryTextForIcon:a3 infoProvider:v6];
  uint64_t v7 = [v6 isHighlighted];

  [(SBIconBadgeView *)self _configureForText:v8 highlighted:v7];
}

- (id)accessoryTextForIcon:(id)a3 infoProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBIconBadgeView *)self overrideText];
  double v9 = [v7 overrideBadgeNumberOrString];
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    double v11 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      char v16 = self;
      char v17 = objc_opt_isKindOfClass();

      if (v17)
      {
        id v18 = v9;
        if ([v18 integerValue] < 1)
        {
          double v13 = 0;
        }
        else
        {
          v19 = objc_msgSend(MEMORY[0x1E4F28EE0], "sbf_cachedDecimalNumberFormatter");
          double v13 = [v19 stringFromNumber:v18];
        }
      }
      else
      {
        v20 = self;
        char v21 = objc_opt_isKindOfClass();

        if (v21)
        {
          double v13 = 0;
          goto LABEL_6;
        }
        id v18 = [v7 location];
        double v13 = [v6 accessoryTextForLocation:v18];
      }

      goto LABEL_6;
    }
    id v10 = v9;
  }
  double v13 = v10;
LABEL_6:
  id v14 = v13;

  return v14;
}

- (NSString)overrideText
{
  return self->_overrideText;
}

- (void)_configureForText:(id)a3 highlighted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (NSString *)a3;
  id v15 = [(SBIconBadgeView *)self font];
  id v7 = [(id)objc_opt_class() _checkoutImageForText:v6 font:v15 highlighted:v4];
  [(SBIconBadgeView *)self _clearText];
  text = self->_text;
  self->_text = v6;
  double v9 = v6;

  textImageTuple = self->_textImageTuple;
  self->_textImageTuple = v7;
  double v11 = v7;

  textView = self->_textView;
  double v13 = [(SBHIconAccessoryCountedMapImageTuple *)self->_textImageTuple image];
  [(UIImageView *)textView setImage:v13];

  [(UIImageView *)self->_textView setAlpha:1.0];
  id v14 = [(SBHIconAccessoryCountedMapImageTuple *)self->_textImageTuple image];

  [(SBIconBadgeView *)self _resizeForTextImage:v14];
  self->_displayingAccessorCGFloat y = self->_textImageTuple != 0;
}

- (void)_resizeForTextImage:(id)a3
{
  [(SBIconBadgeView *)self intrinsicContentSizeForTextImage:a3];
  -[SBIconBadgeView setBounds:](self, "setBounds:", 0.0, 0.0, v4, v5);
  [(SBIconBadgeView *)self setNeedsLayout];
}

- (CGSize)intrinsicContentSizeForTextImage:(id)a3
{
  id v4 = a3;
  double v5 = [(SBIconBadgeView *)self listLayout];
  if (v4)
  {
    [v4 size];
    double v7 = v6;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB30];
  }
  [(id)objc_opt_class() _textPadding];
  double v9 = v8;
  if (v5)
  {
    [(SBIconBadgeView *)self badgeSize];
    double v12 = v11;
    if (v7 + v9 >= v10) {
      double v13 = v7 + v9;
    }
    else {
      double v13 = v10;
    }
  }
  else
  {
    id v14 = [(SBIconBadgeView *)self font];
    [v14 pointSize];
    id v15 = [(SBIconBadgeView *)self traitCollection];
    [v15 displayScale];

    BSSizeCeilForScale();
    double v13 = v16;
    double v12 = v17;
  }
  double v18 = v13;
  double v19 = v12;
  result.CGFloat height = v19;
  result.CGFloat width = v18;
  return result;
}

- (CGSize)badgeSize
{
  v2 = [(SBIconBadgeView *)self listLayout];
  double v3 = SBHIconListLayoutIconAccessorySize(v2);
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.CGFloat height = v7;
  result.CGFloat width = v6;
  return result;
}

+ (double)_textPadding
{
  return 12.0;
}

- (void)_clearText
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_textImageTuple)
  {
    double v3 = SBLogIcon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      double v4 = [(SBHIconAccessoryCountedMapImageTuple *)self->_textImageTuple sbh_countedMapKey];
      int v7 = 138412290;
      double v8 = v4;
      _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_INFO, "<----\tChecking in badge _textImageTuple w/ mapkey %@", (uint8_t *)&v7, 0xCu);
    }
    double v5 = SBIconAccessoryCountedMap();
    [v5 checkinValue:self->_textImageTuple];

    textImageTuple = self->_textImageTuple;
    self->_textImageTuple = 0;
  }
}

- (id)font
{
  double v3 = [(SBIconBadgeView *)self listLayout];
  double v4 = [(SBIconBadgeView *)self overrideFont];
  if (!v4)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([v3 accessoryFontForContentSizeCategory:*MEMORY[0x1E4FB27F0] options:UIAccessibilityIsBoldTextEnabled()], (double v4 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      double v4 = [MEMORY[0x1E4FB08E0] systemFontOfSize:16.0];
    }
  }

  return v4;
}

- (UIFont)overrideFont
{
  return self->_overrideFont;
}

+ (id)_checkoutImageForText:(id)a3 font:(id)a4 highlighted:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  double v10 = NSString;
  double v11 = [v9 fontName];
  [v9 pointSize];
  double v13 = [v10 stringWithFormat:@"%@:%@:%.1f:%u", v8, v11, v12, v5];

  id v14 = SBLogIcon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    CATransform3D v26 = v13;
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 1024;
    BOOL v30 = v5;
    __int16 v31 = 2112;
    id v32 = v9;
    _os_log_impl(&dword_1D7F0A000, v14, OS_LOG_TYPE_INFO, "---->\tChecking out text asset w/ mapkey of '%@', text '%@' isHighlighted:%{BOOL}u, font %@", buf, 0x26u);
  }

  id v15 = SBIconAccessoryCountedMap();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __58__SBIconBadgeView__checkoutImageForText_font_highlighted___block_invoke;
  v20[3] = &unk_1E6AB4B18;
  id v22 = v9;
  id v23 = a1;
  id v21 = v8;
  BOOL v24 = v5;
  id v16 = v9;
  id v17 = v8;
  double v18 = [v15 checkoutValueForKey:v13 creationBlock:v20];

  return v18;
}

- (void)setListLayout:(id)a3
{
  BOOL v5 = (SBIconListLayout *)a3;
  if (self->_listLayout != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_listLayout, a3);
    [(SBIconBadgeView *)self _clearText];
    [(SBIconBadgeView *)self setNeedsLayout];
    [(SBIconBadgeView *)self layoutIfNeeded];
    BOOL v5 = v6;
  }
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)SBIconBadgeView;
  [(SBIconBadgeView *)&v11 layoutSubviews];
  [(SBIconBadgeView *)self bounds];
  BSRectWithSize();
  CGRect v13 = CGRectInset(v12, 1.0, 1.0);
  double width = v13.size.width;
  double height = v13.size.height;
  backgroundView = self->_backgroundView;
  BSRectWithSize();
  -[UIView setBounds:](backgroundView, "setBounds:");
  double v6 = self->_backgroundView;
  UIRectGetCenter();
  -[UIView setCenter:](v6, "setCenter:");
  if (width <= height) {
    double v7 = width;
  }
  else {
    double v7 = height;
  }
  double v8 = v7 * 0.5;
  int v9 = BSFloatEqualToFloat();
  double v10 = self->_backgroundView;
  if (v9)
  {
    [(UIView *)v10 _setCornerRadius:v8];
    [(UIView *)self->_borderView _setCornerRadius:v8];
  }
  else
  {
    [(UIView *)v10 _setContinuousCornerRadius:v8];
    [(UIView *)self->_borderView _setContinuousCornerRadius:v8];
  }
  if (self->_textView) {
    -[SBIconBadgeView _layOutTextImageView:](self, "_layOutTextImageView:");
  }
  if (self->_incomingTextView) {
    -[SBIconBadgeView _layOutTextImageView:](self, "_layOutTextImageView:");
  }
}

- (void)_layOutTextImageView:(id)a3
{
  id v4 = a3;
  [(SBIconBadgeView *)self badgeContentScale];
  id v7 = [v4 image];
  [v7 size];
  [v7 alignmentRectInsets];
  double v6 = v5;
  [(UIView *)self->_backgroundView bounds];
  UIRectCenteredRect();
  SBHEdgeInsetsInvert(v6);
  UIRectIntegralWithScale();
  objc_msgSend(v4, "setFrame:");
}

- (double)badgeContentScale
{
  double v3 = [(SBIconBadgeView *)self listLayout];
  if (v3)
  {
    id v4 = [(SBIconBadgeView *)self listLayout];
    [v4 iconImageInfo];
    double v6 = v5;
  }
  else
  {
    id v4 = [(SBIconBadgeView *)self traitCollection];
    [v4 displayScale];
    double v6 = v7;
  }

  return v6;
}

- (void)setOverrideIconImageAppearance:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    id v4 = (SBHIconImageAppearance *)[v6 copy];
    overrideIconImageAppearance = self->_overrideIconImageAppearance;
    self->_overrideIconImageAppearance = v4;

    [(SBIconBadgeView *)self _configureBackgroundAfterIconImageAppearanceChange];
  }
}

- (void)_configureBackgroundAfterIconImageAppearanceChange
{
  id v33 = [(SBIconBadgeView *)self effectiveIconImageAppearance];
  uint64_t v3 = [v33 appearanceType];
  if (v3 == 2)
  {
    p_backgroundView = &self->_backgroundView;
    double v5 = self->_backgroundView;
LABEL_4:
    double v7 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      int v9 = v5;
    }
    else {
      int v9 = (UIView *)objc_opt_new();
    }
    double v10 = v9;
    BOOL v11 = v3 == 2;
    BOOL v12 = v3 == 2;
    if (v11) {
      uint64_t v13 = 3;
    }
    else {
      uint64_t v13 = 1;
    }
    [(UIView *)v9 setRecipe:v13];
    [(UIView *)v10 setOverrideUserInterfaceStyle:2 * v12];
    id v14 = [(SBIconBadgeView *)self materialGroupNameBase];
    if (v14)
    {
      [(UIView *)v10 setGroupNameBase:v14];
    }
    else
    {
      id v15 = objc_msgSend(NSString, "stringWithFormat:", @"%p", self);
      [(UIView *)v10 setGroupNameBase:v15];
    }
    id v16 = [(UIView *)v10 visualStylingProviderForCategory:1];
    id v17 = v16;
    if (self->_style == 1)
    {
      if (!self->_borderView)
      {
        double v18 = (UIView *)objc_opt_new();
        borderView = self->_borderView;
        self->_borderView = v18;

        [(UIView *)self->_borderView setAutoresizingMask:18];
        v20 = self->_borderView;
        [(UIView *)v10 bounds];
        -[UIView setFrame:](v20, "setFrame:");
        [(UIView *)v10 addSubview:self->_borderView];
      }
      [v17 automaticallyUpdateView:self->_textView withStyle:1];
      [v17 automaticallyUpdateView:self->_borderView withStyle:3];
    }
    else
    {
      [v16 stopAutomaticallyUpdatingView:self->_textView];
      [v17 stopAutomaticallyUpdatingView:self->_borderView];
    }
    id v21 = [(UIView *)self->_borderView layer];
    double v22 = 0.0;
    if (self->_style == 1)
    {
      [(SBIconBadgeView *)self badgeContentScale];
      double v22 = 1.0 / v23;
    }
    [v21 setBorderWidth:v22];
    [v21 borderWidth];
    objc_msgSend(v21, "setBorderOffset:");

    goto LABEL_21;
  }
  int64_t style = self->_style;
  p_backgroundView = &self->_backgroundView;
  double v5 = self->_backgroundView;
  if (style == 1) {
    goto LABEL_4;
  }
  __int16 v31 = self;
  char v32 = [(UIView *)v5 isMemberOfClass:v31];

  if ((v32 & 1) == 0)
  {
    double v10 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);

    id v17 = [(id)objc_opt_class() badgeBackgroundColor];
    [(UIView *)v10 setBackgroundColor:v17];
LABEL_21:

    double v5 = v10;
  }
  if (v5 != *p_backgroundView)
  {
    [(UIView *)*p_backgroundView removeFromSuperview];
    [(SBIconBadgeView *)self insertSubview:v5 atIndex:0];
    [(UIView *)v5 addSubview:self->_textView];
    BOOL v24 = [(UIView *)v5 sbh_darkener];
    [(SBIconBadgeView *)self brightness];
    objc_msgSend(v24, "setBrightness:");

    CATransform3D v25 = [(UIView *)*p_backgroundView layer];
    objc_storeStrong((id *)p_backgroundView, v5);
    [v25 shadowRadius];
    double v27 = v26;
    [v25 shadowOpacity];
    double v29 = v28;
    [v25 shadowOffset];
    [(SBIconBadgeView *)self updateShadowWithRadius:v27 alpha:v29 imageOutset:v30];
  }
}

- (id)effectiveIconImageAppearance
{
  uint64_t v3 = [(SBIconBadgeView *)self overrideIconImageAppearance];
  id v4 = [(SBIconBadgeView *)self traitCollection];
  double v5 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_iconImageAppearanceFromTraitCollection:overrideIconImageAppearance:", v4, v3);

  return v5;
}

- (SBHIconImageAppearance)overrideIconImageAppearance
{
  return self->_overrideIconImageAppearance;
}

+ (UIColor)badgeBackgroundColor
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1E20]);
  uint64_t v3 = [v2 traitCollectionByModifyingTraits:&__block_literal_global_66];

  id v4 = [MEMORY[0x1E4FB1618] systemRedColor];
  double v5 = [v4 resolvedColorWithTraitCollection:v3];

  return (UIColor *)v5;
}

void __39__SBIconBadgeView_badgeBackgroundColor__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setUserInterfaceStyle:1];
  [v2 setAccessibilityContrast:0];
}

- (SBIconBadgeView)init
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)SBIconBadgeView;
  id v2 = [(SBIconBadgeView *)&v13 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_brightness = 1.0;
    id v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = v4;

    id v6 = [(id)objc_opt_class() badgeBackgroundColor];
    [(UIView *)v3->_backgroundView setBackgroundColor:v6];
    [(SBIconBadgeView *)v3 addSubview:v3->_backgroundView];
    double v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    textView = v3->_textView;
    v3->_textView = v7;

    [(UIView *)v3->_backgroundView addSubview:v3->_textView];
    int v9 = self;
    v14[0] = v9;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    id v11 = (id)[(SBIconBadgeView *)v3 registerForTraitChanges:v10 withAction:sel__configureBackgroundAfterIconImageAppearanceChange];

    [(SBIconBadgeView *)v3 _configureBackgroundAfterIconImageAppearanceChange];
  }
  return v3;
}

- (void)dealloc
{
  [(SBIconBadgeView *)self _clearText];
  [(SBFParallaxSettings *)self->_parallaxSettings removeKeyObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBIconBadgeView;
  [(SBIconBadgeView *)&v3 dealloc];
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_int64_t style = a3;
    [(SBIconBadgeView *)self _configureBackgroundAfterIconImageAppearanceChange];
  }
}

- (void)updateShadowWithRadius:(double)a3 alpha:(double)a4 imageOutset:(double)a5
{
  id v9 = [(UIView *)self->_backgroundView layer];
  [v9 setShadowRadius:a3];
  *(float *)&double v8 = a4;
  [v9 setShadowOpacity:v8];
  objc_msgSend(v9, "setShadowOffset:", 0.0, a5);
  [v9 setShadowPathIsBounds:1];
}

- (void)configureAnimatedForIcon:(id)a3 infoProvider:(id)a4 animator:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v11 = [(SBIconBadgeView *)self accessoryTextForIcon:a3 infoProvider:v9];
  uint64_t v10 = [v9 isHighlighted];

  [(SBIconBadgeView *)self _configureAnimatedForText:v11 highlighted:v10 animator:v8];
}

- (void)_configureAnimatedWithoutIcon
{
  id v4 = [(SBIconBadgeView *)self accessoryTextForIcon:0 infoProvider:0];
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1ED8]) initWithDuration:0 curve:0 animations:0.3];
  [(SBIconBadgeView *)self _configureAnimatedForText:v4 highlighted:0 animator:v3];
  [v3 startAnimation];
}

- (void)_configureAnimatedForText:(id)a3 highlighted:(BOOL)a4 animator:(id)a5
{
  BOOL v6 = a4;
  id v15 = a3;
  id v9 = a5;
  if (SBFEqualStrings())
  {
    [(SBIconBadgeView *)self layoutIfNeeded];
    goto LABEL_12;
  }
  uint64_t v10 = [(SBIconBadgeView *)self font];
  id v11 = [(id)objc_opt_class() _checkoutImageForText:v15 font:v10 highlighted:v6];
  displayingAccessorCGFloat y = self->_displayingAccessory;
  [(SBIconBadgeView *)self _clearText];
  objc_storeStrong((id *)&self->_text, a3);
  objc_storeStrong((id *)&self->_textImageTuple, v11);
  self->_displayingAccessorCGFloat y = v11 != 0;
  if (!displayingAccessory || v11 == 0)
  {
    if (!v11)
    {
      if (displayingAccessory) {
        [(SBIconBadgeView *)self _zoomOutWithAnimator:v9];
      }
      goto LABEL_11;
    }
    id v14 = [v11 image];
    [(SBIconBadgeView *)self _zoomInWithTextImage:v14 animator:v9];
  }
  else
  {
    id v14 = [v11 image];
    [(SBIconBadgeView *)self _crossfadeToTextImage:v14 animator:v9];
  }

LABEL_11:
LABEL_12:
}

- (void)_crossfadeToTextImage:(id)a3 animator:(id)a4
{
  id v6 = a3;
  double v7 = (objc_class *)MEMORY[0x1E4FB1838];
  id v8 = a4;
  id v9 = objc_alloc_init(v7);
  [v9 setImage:v6];
  [v9 setAlpha:0.0];
  [(UIView *)self->_backgroundView addSubview:v9];
  objc_storeStrong((id *)&self->_incomingTextView, v9);
  [(SBIconBadgeView *)self setNeedsLayout];
  [(SBIconBadgeView *)self layoutIfNeeded];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__SBIconBadgeView__crossfadeToTextImage_animator___block_invoke;
  v16[3] = &unk_1E6AACDE0;
  v16[4] = self;
  id v17 = v6;
  id v10 = v9;
  id v18 = v10;
  id v11 = v6;
  [v8 addAnimations:v16];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__SBIconBadgeView__crossfadeToTextImage_animator___block_invoke_2;
  v13[3] = &unk_1E6AADF00;
  id v14 = v10;
  id v15 = self;
  id v12 = v10;
  [v8 addCompletion:v13];
}

uint64_t __50__SBIconBadgeView__crossfadeToTextImage_animator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _resizeForTextImage:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 448) setAlpha:0.0];
  id v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

void __50__SBIconBadgeView__crossfadeToTextImage_animator___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2 == *(void **)(v3 + 416))
  {
    [*(id *)(v3 + 448) removeFromSuperview];
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 448), *(id *)(*(void *)(a1 + 40) + 416));
    uint64_t v4 = *(void *)(a1 + 40);
    double v5 = *(void **)(v4 + 416);
    *(void *)(v4 + 416) = 0;
  }
  else
  {
    [v2 removeFromSuperview];
  }
}

- (void)_zoomInWithTextImage:(id)a3 animator:(id)a4
{
  textView = self->_textView;
  id v6 = a3;
  [(UIImageView *)textView setImage:v6];
  [(UIImageView *)self->_textView setAlpha:1.0];
  [(SBIconBadgeView *)self _resizeForTextImage:v6];

  [(SBIconBadgeView *)self setNeedsLayout];
  [(SBIconBadgeView *)self layoutIfNeeded];
}

SBHIconAccessoryCountedMapImageTuple *__58__SBIconBadgeView__checkoutImageForText_font_highlighted___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 48) _createImageForText:*(void *)(a1 + 32) font:*(void *)(a1 + 40) highlighted:*(unsigned __int8 *)(a1 + 56)];
  double v5 = (void *)v4;
  id v6 = 0;
  if (v3 && v4) {
    id v6 = [[SBHIconAccessoryCountedMapImageTuple alloc] initWithImage:v4 countedMapKey:v3];
  }

  return v6;
}

+ (id)_createImageForText:(id)a3 font:(id)a4 highlighted:(BOOL)a5
{
  v65[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a5 || ![v7 length] || (objc_msgSend(v7, "isEqualToString:", @"*") & 1) != 0)
  {
    id v9 = 0;
  }
  else
  {
    BOOL v11 = [v7 length] != 1;
    id v12 = [v8 fontDescriptor];
    uint64_t v64 = *MEMORY[0x1E4FB0910];
    uint64_t v13 = *MEMORY[0x1E4FB0960];
    v61[0] = *MEMORY[0x1E4FB0968];
    v61[1] = v13;
    v62[0] = &unk_1F300EFE0;
    id v14 = [NSNumber numberWithInteger:v11];
    v62[1] = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:2];
    v63 = v15;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
    v65[0] = v16;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:&v64 count:1];
    id v18 = [v12 fontDescriptorByAddingAttributes:v17];

    double v19 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v18 size:0.0];

    v20 = [MEMORY[0x1E4FB0848] defaultParagraphStyle];
    id v21 = (void *)[v20 mutableCopy];

    [v21 setLineBreakMode:5];
    uint64_t v22 = *MEMORY[0x1E4FB06F8];
    v60[0] = v19;
    uint64_t v23 = *MEMORY[0x1E4FB0700];
    v59[0] = v22;
    v59[1] = v23;
    BOOL v24 = [MEMORY[0x1E4FB1618] whiteColor];
    v59[2] = *MEMORY[0x1E4FB0738];
    v60[1] = v24;
    v60[2] = v21;
    CATransform3D v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:3];

    [v19 pointSize];
    double v27 = dbl_1D81E7FC0[v26 > 16.0];
    objc_msgSend(v7, "boundingRectWithSize:options:attributes:context:", 1, v25, 0, v27, 1.79769313e308);
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    objc_msgSend(v7, "boundingRectWithSize:options:attributes:context:", 0, v25, 0, v27, 1.79769313e308);
    CGFloat v50 = v37;
    CGFloat v51 = v36;
    CGFloat v39 = v38;
    CGFloat v41 = v40;
    v67.origin.CGFloat x = v29;
    v67.origin.CGFloat y = v31;
    v67.size.double width = v33;
    v67.size.double height = v35;
    double v42 = round(CGRectGetWidth(v67));
    v68.origin.CGFloat x = v29;
    v68.origin.CGFloat y = v31;
    v68.size.double width = v33;
    v68.size.double height = v35;
    double v43 = round(CGRectGetHeight(v68));
    v44 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", v42, v43);
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __56__SBIconBadgeView__createImageForText_font_highlighted___block_invoke;
    v52[3] = &unk_1E6AADFA0;
    CGFloat v55 = v29;
    CGFloat v56 = v31;
    CGFloat v57 = v33;
    CGFloat v58 = v35;
    id v53 = v7;
    id v54 = v25;
    id v45 = v25;
    v46 = [v44 imageWithActions:v52];
    v69.origin.CGFloat y = v50;
    v69.origin.CGFloat x = v51;
    v69.size.double width = v39;
    v69.size.double height = v41;
    double v47 = fabs(CGRectGetMinY(v69));
    v48 = [v46 imageWithBaselineOffsetFromBottom:v47];

    [v19 capHeight];
    id v9 = objc_msgSend(v48, "imageWithAlignmentRectInsets:", v43 - v47 - v49, 0.0, v47, 0.0);

    id v8 = v19;
  }

  return v9;
}

uint64_t __56__SBIconBadgeView__createImageForText_font_highlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawWithRect:options:attributes:context:", 1, *(void *)(a1 + 40), 0, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (void)_configureWithoutIcon
{
  id v3 = [(SBIconBadgeView *)self accessoryTextForIcon:0 infoProvider:0];
  [(SBIconBadgeView *)self _configureForText:v3 highlighted:0];
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_parallaxSettings == a3) {
    [(SBIconBadgeView *)self _applyParallaxSettings];
  }
}

- (SBFParallaxSettings)parallaxSettings
{
  return self->_parallaxSettings;
}

- (int64_t)style
{
  return self->_style;
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (void)setMaterialGroupNameBase:(id)a3
{
}

- (double)overridePaddingFactor
{
  return self->_overridePaddingFactor;
}

- (double)brightness
{
  return self->_brightness;
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideIconImageAppearance, 0);
  objc_storeStrong((id *)&self->_overrideFont, 0);
  objc_storeStrong((id *)&self->_overrideText, 0);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_storeStrong((id *)&self->_listLayout, 0);
  objc_storeStrong((id *)&self->_parallaxSettings, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_textImageTuple, 0);
  objc_storeStrong((id *)&self->_incomingTextView, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end