@interface PKContinuousButton
+ (Class)layerClass;
+ (id)_filterInputColorForEffect:(int64_t)a3;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)blurDisabled;
- (BOOL)showSpinner;
- (PKContinuousButton)init;
- (PKContinuousButton)initWithCoder:(id)a3;
- (PKContinuousButton)initWithConfiguration:(id *)a3;
- (PKContinuousButton)initWithCornerRadius:(double)a3 effect:(int64_t)a4;
- (PKContinuousButton)initWithFrame:(CGRect)a3;
- (id)pk_childrenForAppearance;
- (void)_createHighlightFilterIfNecessary;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_updateBackdropSettings;
- (void)_updateColor;
- (void)_updateFilter;
- (void)_updateTitleColor;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBlurDisabled:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImageEnabled:(BOOL)a3 forState:(unint64_t)a4;
- (void)setSelected:(BOOL)a3;
- (void)setShowSpinner:(BOOL)a3;
- (void)tintColorDidChange;
- (void)updateActivityIndicatorColorWithColor:(id)a3;
- (void)updateBackgroundColorWithColor:(id)a3;
- (void)updateImageView;
- (void)updateTitleColorWithColor:(id)a3;
- (void)updateWithImage:(id)a3;
@end

@implementation PKContinuousButton

- (void)setImageEnabled:(BOOL)a3 forState:(unint64_t)a4
{
  disabledImageStates = self->_disabledImageStates;
  if (a3)
  {
    v7 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableSet *)disabledImageStates removeObject:v7];
  }
  else
  {
    if (!disabledImageStates)
    {
      v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v9 = self->_disabledImageStates;
      self->_disabledImageStates = v8;

      disabledImageStates = self->_disabledImageStates;
    }
    v7 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableSet *)disabledImageStates addObject:v7];
  }

  if (self->_image)
  {
    [(PKContinuousButton *)self updateImageView];
  }
}

- (void)_updateColor
{
  v3 = [(PKContinuousButton *)self tintColor];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4FB1618] systemBlueColor];
  }
  v6 = v5;

  v7 = [(PKContinuousButton *)self traitCollection];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __34__PKContinuousButton__updateColor__block_invoke;
  v12 = &unk_1E59CA870;
  v13 = self;
  id v14 = v6;
  id v8 = v6;
  PKUIPerformWithEffectiveTraitCollection(v7, &v9);

  [(PKContinuousButton *)self _updateTitleColor];
}

void __34__PKContinuousButton__updateColor__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  switch(*(void *)(v1 + 760))
  {
    case 0:
      v4 = CGColorRetain((CGColorRef)[*(id *)(a1 + 40) CGColor]);
      [*(id *)(*(void *)(a1 + 32) + 864) setStrokeColor:v4];
      id v5 = *(void **)(*(void *)(a1 + 32) + 864);
      v6 = 0;
      goto LABEL_10;
    case 1:
      v4 = CGColorRetain((CGColorRef)[*(id *)(v1 + 800) CGColor]);
      if (!v4)
      {
        id v7 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
        v4 = CGColorRetain((CGColorRef)[v7 CGColor]);
      }
      goto LABEL_9;
    case 2:
      v4 = CGColorRetain((CGColorRef)[*(id *)(a1 + 40) CGColor]);
LABEL_9:
      [*(id *)(*(void *)(a1 + 32) + 864) setStrokeColor:v4];
      id v5 = *(void **)(*(void *)(a1 + 32) + 864);
      v6 = v4;
LABEL_10:
      [v5 setFillColor:v6];
      CGColorRelease(v4);
      break;
    case 3:
    case 4:
      [*(id *)(v1 + 864) setStrokeColor:0];
      v3 = *(void **)(*(void *)(a1 + 32) + 864);
      [v3 setFillColor:0];
      break;
    default:
      return;
  }
}

- (void)_updateTitleColor
{
  overrideTitleColor = self->_overrideTitleColor;
  if (overrideTitleColor)
  {
    v4 = overrideTitleColor;
  }
  else
  {
    switch(self->_configuration.style)
    {
      case 0:
      case 1:
      case 4:
        uint64_t v5 = [(PKContinuousButton *)self tintColor];
        goto LABEL_7;
      case 2:
        uint64_t v5 = [MEMORY[0x1E4FB1618] whiteColor];
        goto LABEL_7;
      case 3:
        uint64_t v5 = [MEMORY[0x1E4FB1618] labelColor];
LABEL_7:
        v4 = (UIColor *)v5;
        if (!v5) {
          goto LABEL_8;
        }
        break;
      default:
LABEL_8:
        v6 = [(PKContinuousButton *)self tintColor];
        id v7 = v6;
        if (v6)
        {
          id v8 = v6;
        }
        else
        {
          id v8 = [MEMORY[0x1E4FB1618] systemBlueColor];
        }
        v4 = v8;

        break;
    }
  }
  v11 = v4;
  [(PKContinuousButton *)self setTitleColor:v11 forState:0];
  uint64_t v9 = v11;
  if (self->_configuration.highlightEffect == 2)
  {
    uint64_t v9 = v11;
    if ((unint64_t)(self->_configuration.style - 1) <= 1)
    {
      uint64_t v9 = [(UIColor *)v11 colorWithAlphaComponent:0.5];
    }
  }
  [(PKContinuousButton *)self setTitleColor:v9 forState:4];
  [(PKContinuousButton *)self setTitleColor:v9 forState:1];
  [(PKContinuousButton *)self setTitleColor:v9 forState:5];
  if (self->_configuration.disabledEffect != self->_configuration.highlightEffect)
  {
    uint64_t v10 = v11;

    if (self->_configuration.disabledEffect == 2 && (unint64_t)(self->_configuration.style - 1) <= 1)
    {
      uint64_t v9 = [(UIColor *)v10 colorWithAlphaComponent:0.5];
    }
    else
    {
      uint64_t v9 = v10;
    }
  }
  [(PKContinuousButton *)self setTitleColor:v9 forState:2];
}

void __37__PKContinuousButton_updateImageView__block_invoke_40(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "pkui_imageWithAlpha:", 0.5);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)PKContinuousButton;
  [(PKContinuousButton *)&v28 layoutSubviews];
  [(PKContinuousButton *)self bounds];
  double v6 = v5;
  double v8 = v7;
  if (v3 == self->_boundsSize.width && v4 == self->_boundsSize.height) {
    goto LABEL_18;
  }
  double v10 = v3;
  double v11 = v4;
  self->_boundsSize.width = v3;
  self->_boundsSize.height = v4;
  [(CAShapeLayer *)self->_layer lineWidth];
  double v13 = v12 * 0.5;
  p_configuration = &self->_configuration;
  int64_t shape = self->_configuration.shape;
  switch(shape)
  {
    case 2:
      v16 = objc_msgSend(MEMORY[0x1E4FB14C0], "_bezierPathWithPillRect:cornerRadius:", v6 + v13, v8 + v13, v10 - (v13 + v13), v11 - (v13 + v13), v11 * 0.5);
      [(CAShapeLayer *)self->_layer setCornerCurve:*MEMORY[0x1E4F39EA8]];
      layer = self->_layer;
      double cornerRadius = v11 * 0.5;
      goto LABEL_12;
    case 1:
      v16 = objc_msgSend(MEMORY[0x1E4FB14C0], "_bezierPathWithPillRect:cornerRadius:", v6 + v13, v8 + v13, v10 - (v13 + v13), v11 - (v13 + v13), p_configuration->cornerRadius);
      [(CAShapeLayer *)self->_layer setCornerCurve:*MEMORY[0x1E4F39EA8]];
      layer = self->_layer;
      double cornerRadius = p_configuration->cornerRadius;
      goto LABEL_12;
    case 0:
      v16 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", v6 + v13, v8 + v13, v10 - (v13 + v13), v11 - (v13 + v13));
      [(CAShapeLayer *)self->_layer setCornerCurve:*MEMORY[0x1E4F39EA0]];
      layer = self->_layer;
      double cornerRadius = fmin(v10, v11) * 0.5;
LABEL_12:
      [(CAShapeLayer *)layer setCornerRadius:cornerRadius];
      goto LABEL_14;
  }
  v16 = 0;
LABEL_14:
  backdropView = self->_backdropView;
  if (backdropView)
  {
    v20 = [(_UIBackdropView *)backdropView superview];

    if (!v20)
    {
      v21 = [(PKContinuousButton *)self _backgroundView];
      [v21 addSubview:self->_backdropView];
    }
  }
  id v22 = v16;
  -[CAShapeLayer setPath:](self->_layer, "setPath:", [v22 CGPath]);

LABEL_18:
  v23 = self->_backdropView;
  if (v23)
  {
    v24 = [(PKContinuousButton *)self _backgroundView];
    [v24 bounds];
    -[_UIBackdropView setFrame:](v23, "setFrame:");
  }
  v25 = [(UIActivityIndicatorView *)self->_activityIndicatorView superview];

  if (v25)
  {
    activityIndicatorView = self->_activityIndicatorView;
    v27 = [(PKContinuousButton *)self titleLabel];
    [v27 center];
    -[UIActivityIndicatorView setCenter:](activityIndicatorView, "setCenter:");
  }
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"path"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PKContinuousButton;
    BOOL v5 = [(PKContinuousButton *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (void)updateWithImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);

  [(PKContinuousButton *)self updateImageView];
}

- (void)updateImageView
{
  [(PKContinuousButton *)self setAdjustsImageWhenHighlighted:0];
  [(PKContinuousButton *)self setAdjustsImageWhenDisabled:0];
  double v3 = [(PKContinuousButton *)self traitCollection];
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1818]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__PKContinuousButton_updateImageView__block_invoke;
  aBlock[3] = &unk_1E59DD9B8;
  aBlock[4] = self;
  id v5 = v4;
  id v34 = v5;
  double v6 = (void (**)(void *, UIImage *, void))_Block_copy(aBlock);
  objc_super v7 = self->_image;
  v6[2](v6, v7, 0);
  uint64_t v27 = 0;
  objc_super v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__54;
  v31 = __Block_byref_object_dispose__54;
  double v8 = v7;
  uint64_t v9 = v8;
  v32 = v8;
  p_configuration = &self->_configuration;
  double v11 = v8;
  if (self->_configuration.highlightEffect == 2)
  {
    double v11 = v8;
    if ((unint64_t)(self->_configuration.style - 1) <= 1)
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __37__PKContinuousButton_updateImageView__block_invoke_40;
      v24[3] = &unk_1E59CEDA0;
      v26 = &v27;
      v25 = v8;
      PKUIPerformWithEffectiveTraitCollection(v3, v24);

      double v11 = (UIImage *)v28[5];
    }
  }
  v6[2](v6, v11, 4);
  v6[2](v6, (UIImage *)v28[5], 1);
  v6[2](v6, (UIImage *)v28[5], 5);
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__54;
  id v22 = __Block_byref_object_dispose__54;
  double v12 = (UIImage *)(id)v28[5];
  v23 = v12;
  if (self->_configuration.disabledEffect != self->_configuration.highlightEffect)
  {
    double v13 = v12;
    id v14 = v9;
    v23 = v14;

    if (p_configuration->disabledEffect == 2 && (unint64_t)(p_configuration->style - 1) <= 1)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __37__PKContinuousButton_updateImageView__block_invoke_2;
      v15[3] = &unk_1E59CEDA0;
      v17 = &v18;
      v16 = v14;
      PKUIPerformWithEffectiveTraitCollection(v3, v15);
    }
  }
  v6[2](v6, (UIImage *)v19[5], 2);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v27, 8);
}

void __37__PKContinuousButton_updateImageView__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = (void *)v4[99];
  if (v5)
  {
    objc_super v7 = NSNumber;
    id v8 = a2;
    id v11 = [v7 numberWithUnsignedInteger:a3];
    int v9 = objc_msgSend(v5, "containsObject:");
    id v10 = v8;
    if (v9) {
      id v10 = *(id *)(a1 + 40);
    }
    [v4 setImage:v10 forState:a3];
  }
  else
  {
    id v11 = a2;
    [v4 setImage:v11 forState:a3];
  }
}

- (PKContinuousButton)initWithConfiguration:(id *)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)PKContinuousButton;
  id v4 = -[PKContinuousButton initWithFrame:](&v26, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v5 = v4;
  if (v4)
  {
    [(PKContinuousButton *)v4 setOpaque:0];
    [(PKContinuousButton *)v5 setExclusiveTouch:1];
    [(PKContinuousButton *)v5 setTintAdjustmentMode:1];
    [(PKContinuousButton *)v5 _setWantsAccessibilityUnderline:0];
    int64_t var4 = a3->var4;
    long long v7 = *(_OWORD *)&a3->var2;
    *(_OWORD *)&v5->_configuration.double cornerRadius = *(_OWORD *)&a3->var0;
    *(_OWORD *)&v5->_configuration.style = v7;
    v5->_configuration.disabledEffect = var4;
    v5->_configuration.double cornerRadius = fmax(v5->_configuration.cornerRadius, 0.0);
    if (v5->_configuration.style == 3)
    {
      v5->_backdropStyle = 2020;
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4FB1FE0]) initWithPrivateStyle:v5->_backdropStyle];
      backdropView = v5->_backdropView;
      v5->_backdropView = (_UIBackdropView *)v8;

      [(_UIBackdropView *)v5->_backdropView setUserInteractionEnabled:0];
      id v10 = objc_alloc_init(MEMORY[0x1E4FB1818]);
      [(PKContinuousButton *)v5 setBackgroundImage:v10 forState:0];

      [(PKContinuousButton *)v5 layoutIfNeeded];
      id v11 = [(PKContinuousButton *)v5 _backgroundView];
      [v11 addSubview:v5->_backdropView];

      double v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v12 addObserver:v5 selector:sel__accessibilitySettingsDidChange_ name:*MEMORY[0x1E4FB24A8] object:0];
    }
    if (!v5->_configuration.disabledEffect) {
      v5->_configuration.disabledEffect = v5->_configuration.highlightEffect;
    }
    uint64_t v13 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
    normalInputColor = v5->_normalInputColor;
    v5->_normalInputColor = (UIColor *)v13;

    uint64_t v15 = +[PKContinuousButton _filterInputColorForEffect:v5->_configuration.highlightEffect];
    highlightInputColor = v5->_highlightInputColor;
    v5->_highlightInputColor = (UIColor *)v15;

    uint64_t v17 = +[PKContinuousButton _filterInputColorForEffect:v5->_configuration.disabledEffect];
    disabledInputColor = v5->_disabledInputColor;
    v5->_disabledInputColor = (UIColor *)v17;

    uint64_t v19 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    activityIndicatorColor = v5->_activityIndicatorColor;
    v5->_activityIndicatorColor = (UIColor *)v19;

    uint64_t v21 = [(PKContinuousButton *)v5 layer];
    layer = v5->_layer;
    v5->_layer = (CAShapeLayer *)v21;

    [(CAShapeLayer *)v5->_layer setLineWidth:1.0];
    [(CAShapeLayer *)v5->_layer setMasksToBounds:1];
    v5->_enabled = 1;
    v5->_highlighted = 0;
    v5->_selected = 0;
    v27[0] = objc_opt_class();
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    id v24 = (id)[(PKContinuousButton *)v5 registerForTraitChanges:v23 withHandler:&__block_literal_global_202];

    [(PKContinuousButton *)v5 _updateColor];
  }
  return v5;
}

+ (id)_filterInputColorForEffect:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      double v3 = (void *)MEMORY[0x1E4FB1618];
      double v4 = 1.0;
      double v5 = 0.5;
      goto LABEL_8;
    case 1:
      double v3 = (void *)MEMORY[0x1E4FB1618];
      double v4 = 0.6;
      goto LABEL_7;
    case 0:
      double v3 = (void *)MEMORY[0x1E4FB1618];
      double v4 = 1.0;
LABEL_7:
      double v5 = 1.0;
LABEL_8:
      double v6 = [v3 colorWithWhite:v4 alpha:v5];
      if (v6) {
        goto LABEL_10;
      }
      break;
  }
  double v6 = [MEMORY[0x1E4FB1618] colorWithWhite:0.6 alpha:1.0];
LABEL_10:

  return v6;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PKContinuousButton;
  [(PKContinuousButton *)&v3 tintColorDidChange];
  [(PKContinuousButton *)self _updateColor];
}

- (id)pk_childrenForAppearance
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (PKContinuousButton)initWithCoder:(id)a3
{
  return 0;
}

- (PKContinuousButton)init
{
  return [(PKContinuousButton *)self initWithCornerRadius:1 effect:0.0];
}

- (PKContinuousButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  long long v7 = [(PKContinuousButton *)self initWithCornerRadius:1 effect:0.0];
  uint64_t v8 = v7;
  if (v7) {
    -[PKContinuousButton setFrame:](v7, "setFrame:", x, y, width, height);
  }
  return v8;
}

- (PKContinuousButton)initWithCornerRadius:(double)a3 effect:(int64_t)a4
{
  double v5 = a3;
  long long v6 = xmmword_1A040E960;
  int64_t v7 = a4;
  int64_t v8 = a4;
  return [(PKContinuousButton *)self initWithConfiguration:&v5];
}

uint64_t __44__PKContinuousButton_initWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  if (a2[98]) {
    return [a2 updateImageView];
  }
  return result;
}

- (void)dealloc
{
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKContinuousButton;
  [(PKContinuousButton *)&v4 dealloc];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PKContinuousButton;
  [(PKContinuousButton *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(PKContinuousButton *)self _updateColor];
}

- (void)updateBackgroundColorWithColor:(id)a3
{
  objc_super v4 = (UIColor *)[a3 copy];
  overrideBackgroundColor = self->_overrideBackgroundColor;
  self->_overrideBackgroundColor = v4;

  [(PKContinuousButton *)self _updateColor];
}

- (void)updateTitleColorWithColor:(id)a3
{
  objc_super v4 = (UIColor *)[a3 copy];
  overrideTitleColor = self->_overrideTitleColor;
  self->_overrideTitleColor = v4;

  [(PKContinuousButton *)self _updateTitleColor];
}

- (void)updateActivityIndicatorColorWithColor:(id)a3
{
  p_activityIndicatorColor = &self->_activityIndicatorColor;
  int64_t v7 = (UIColor *)a3;
  if (*p_activityIndicatorColor != v7)
  {
    objc_storeStrong((id *)&self->_activityIndicatorColor, a3);
    activityIndicatorView = self->_activityIndicatorView;
    if (activityIndicatorView) {
      [(UIActivityIndicatorView *)activityIndicatorView setColor:*p_activityIndicatorColor];
    }
  }
}

void __37__PKContinuousButton_updateImageView__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "pkui_imageWithAlpha:", 0.5);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setBlurDisabled:(BOOL)a3
{
  if (self->_configuration.style == 3 && self->_blurDisabled != a3)
  {
    self->_blurDisabled = a3;
    [(PKContinuousButton *)self _updateBackdropSettings];
  }
}

- (void)_updateBackdropSettings
{
  BOOL blurDisabled = self->_blurDisabled;
  objc_super v4 = (void *)MEMORY[0x1E4FB1FE8];
  uint64_t v5 = [MEMORY[0x1E4FB1FE8] settingsForPrivateStyle:self->_backdropStyle];
  if (blurDisabled)
  {
    id v7 = (id)v5;
    uint64_t v6 = objc_msgSend(v4, "pkui_createTransparentSettingsFromSettings:", v5);

    uint64_t v5 = v6;
  }
  id v8 = (id)v5;
  [(_UIBackdropView *)self->_backdropView transitionToSettings:v5];
}

- (void)_createHighlightFilterIfNecessary
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (!self->_highlightFilter)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F39BC0]);
    objc_super v4 = (CAFilter *)[v3 initWithType:*MEMORY[0x1E4F3A2A8]];
    highlightFilter = self->_highlightFilter;
    self->_highlightFilter = v4;

    [(CAFilter *)self->_highlightFilter setName:@"highlightFilter"];
    [(CAFilter *)self->_highlightFilter setValue:[(UIColor *)self->_normalInputColor CGColor] forKey:@"inputColor"];
    layer = self->_layer;
    v8[0] = self->_highlightFilter;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [(CAShapeLayer *)layer setFilters:v7];

    objc_storeStrong((id *)&self->_appliedInputColor, self->_normalInputColor);
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKContinuousButton;
  -[PKContinuousButton setEnabled:](&v5, sel_setEnabled_);
  if (self->_enabled != v3)
  {
    self->_enabled = v3;
    [(PKContinuousButton *)self _updateFilter];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKContinuousButton;
  -[PKContinuousButton setHighlighted:](&v5, sel_setHighlighted_);
  if (self->_highlighted != v3)
  {
    self->_highlighted = v3;
    [(PKContinuousButton *)self _updateFilter];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKContinuousButton;
  -[PKContinuousButton setSelected:](&v5, sel_setSelected_);
  if (self->_selected != v3)
  {
    self->_selected = v3;
    [(PKContinuousButton *)self _updateFilter];
  }
}

- (void)_updateFilter
{
  [(PKContinuousButton *)self _createHighlightFilterIfNecessary];
  BOOL v3 = &OBJC_IVAR___PKContinuousButton__disabledInputColor;
  if (self->_enabled)
  {
    BOOL v3 = &OBJC_IVAR___PKContinuousButton__highlightInputColor;
    if (!self->_highlighted)
    {
      BOOL v3 = &OBJC_IVAR___PKContinuousButton__normalInputColor;
      if (self->_selected) {
        BOOL v3 = &OBJC_IVAR___PKContinuousButton__highlightInputColor;
      }
    }
  }
  id v13 = *(id *)((char *)&self->super.super.super.super.super.isa + *v3);
  if ((-[UIColor isEqual:](self->_appliedInputColor, "isEqual:") & 1) == 0)
  {
    objc_super v4 = (void *)MEMORY[0x1E4FB1618];
    objc_super v5 = [(CAShapeLayer *)self->_layer presentationLayer];
    uint64_t v6 = (CGColor *)[v5 valueForKeyPath:@"filters.highlightFilter.inputColor"];
    if (!v6) {
      uint64_t v6 = [(UIColor *)self->_appliedInputColor CGColor];
    }
    id v7 = [v4 colorWithCGColor:v6];

    layer = self->_layer;
    id v9 = v13;
    -[CAShapeLayer setValue:forKeyPath:](layer, "setValue:forKeyPath:", [v9 CGColor], @"filters.highlightFilter.inputColor");
    id v10 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"filters.highlightFilter.inputColor"];
    [v10 setAdditive:0];
    [v10 setDuration:0.15];
    id v11 = v7;
    objc_msgSend(v10, "setFromValue:", objc_msgSend(v11, "CGColor"));
    id v12 = v9;
    objc_msgSend(v10, "setToValue:", objc_msgSend(v12, "CGColor"));
    [(CAShapeLayer *)self->_layer removeAnimationForKey:@"highlight"];
    [(CAShapeLayer *)self->_layer addAnimation:v10 forKey:@"highlight"];
    objc_storeStrong((id *)&self->_appliedInputColor, v12);
  }
}

- (void)setShowSpinner:(BOOL)a3
{
  if (self->_showSpinner == a3) {
    return;
  }
  self->_showSpinner = a3;
  activityIndicatorView = self->_activityIndicatorView;
  if (!activityIndicatorView)
  {
    objc_super v5 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    uint64_t v6 = self->_activityIndicatorView;
    self->_activityIndicatorView = v5;

    activityIndicatorView = self->_activityIndicatorView;
    if (self->_activityIndicatorColor)
    {
      -[UIActivityIndicatorView setColor:](activityIndicatorView, "setColor:");
      activityIndicatorView = self->_activityIndicatorView;
    }
  }
  if (!self->_showSpinner) {
    goto LABEL_9;
  }
  id v7 = [(UIActivityIndicatorView *)activityIndicatorView superview];

  if (v7)
  {
    if (self->_showSpinner) {
      return;
    }
    activityIndicatorView = self->_activityIndicatorView;
LABEL_9:
    id v8 = [(UIActivityIndicatorView *)activityIndicatorView superview];

    if (!v8) {
      return;
    }
    [(UIActivityIndicatorView *)self->_activityIndicatorView stopAnimating];
    [(UIActivityIndicatorView *)self->_activityIndicatorView removeFromSuperview];
    id v9 = [(PKContinuousButton *)self titleLabel];
    [v9 setAlpha:1.0];

    id v10 = [(PKContinuousButton *)self _imageView];
    id v11 = v10;
    double v12 = 1.0;
    goto LABEL_13;
  }
  [(PKContinuousButton *)self addSubview:self->_activityIndicatorView];
  [(UIActivityIndicatorView *)self->_activityIndicatorView startAnimating];
  id v13 = [(PKContinuousButton *)self titleLabel];
  [v13 setAlpha:0.0];

  id v10 = [(PKContinuousButton *)self _imageView];
  id v11 = v10;
  double v12 = 0.0;
LABEL_13:
  [v10 setAlpha:v12];

  [(PKContinuousButton *)self setNeedsLayout];
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (BOOL)blurDisabled
{
  return self->_blurDisabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorColor, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_layer, 0);
  objc_storeStrong((id *)&self->_appliedInputColor, 0);
  objc_storeStrong((id *)&self->_disabledInputColor, 0);
  objc_storeStrong((id *)&self->_selectedInputColor, 0);
  objc_storeStrong((id *)&self->_highlightInputColor, 0);
  objc_storeStrong((id *)&self->_normalInputColor, 0);
  objc_storeStrong((id *)&self->_highlightFilter, 0);
  objc_storeStrong((id *)&self->_overrideTitleColor, 0);
  objc_storeStrong((id *)&self->_overrideBackgroundColor, 0);
  objc_storeStrong((id *)&self->_disabledImageStates, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end