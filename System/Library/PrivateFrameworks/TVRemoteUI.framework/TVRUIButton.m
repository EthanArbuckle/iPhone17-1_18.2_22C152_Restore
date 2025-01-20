@interface TVRUIButton
+ (BOOL)buttonTypeHasTapAction:(int64_t)a3;
+ (BOOL)isValidButtonType:(int64_t)a3;
- (BOOL)hasButtonShape;
- (BOOL)hasTapAction;
- (BOOL)isHighlightEffectDisabled;
- (NSString)description;
- (TVRButtonHaptic)haptic;
- (TVRUIButton)initWithType:(int64_t)a3 hasTapAction:(BOOL)a4;
- (TVRUIButton)initWithType:(int64_t)a3 hasTapAction:(BOOL)a4 buttonLocation:(int64_t)a5;
- (TVRUIStyleProvider)styleProvider;
- (UIColor)defaultBackgroundColor;
- (UIImageView)imageView;
- (UILabel)titleLabel;
- (UIView)buttonContentView;
- (UIViewPropertyAnimator)highlightAnimator;
- (UIViewPropertyAnimator)unhighlightAnimator;
- (id)_accessibilityHintForButtonType:(int64_t)a3;
- (id)_accessibilityIDForButtonType:(int64_t)a3;
- (id)_accessibilityLabelForButtonType:(int64_t)a3;
- (id)_descriptionBuilder;
- (id)_hapticForButtonType:(int64_t)a3;
- (id)_pointerEffectForButtonType:(int64_t)a3 targetedPreview:(id)a4;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)buttonLocation;
- (int64_t)buttonType;
- (unint64_t)_controlEventsForActionTriggered;
- (void)_boldTextEnabledStatusChanged:(id)a3;
- (void)_darkenSystemColorsChanged:(id)a3;
- (void)_largeTextEnabledStatusChanged:(id)a3;
- (void)_touchDown:(id)a3;
- (void)_touchUp:(id)a3;
- (void)_updateButtonType:(int64_t)a3;
- (void)layoutSubviews;
- (void)setButtonContentView:(id)a3;
- (void)setButtonLocation:(int64_t)a3;
- (void)setDefaultBackgroundColor:(id)a3;
- (void)setDisableHighlightEffect:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHaptic:(id)a3;
- (void)setHasButtonShape:(BOOL)a3;
- (void)setHighlightAnimator:(id)a3;
- (void)setImageView:(id)a3;
- (void)setStyleProvider:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUnhighlightAnimator:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation TVRUIButton

+ (BOOL)isValidButtonType:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 0x1F || (unint64_t)a3 >> 1 == 4999;
}

+ (BOOL)buttonTypeHasTapAction:(int64_t)a3
{
  return a3 == 9998 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 6;
}

- (TVRUIButton)initWithType:(int64_t)a3 hasTapAction:(BOOL)a4
{
  return [(TVRUIButton *)self initWithType:a3 hasTapAction:a4 buttonLocation:0];
}

- (TVRUIButton)initWithType:(int64_t)a3 hasTapAction:(BOOL)a4 buttonLocation:(int64_t)a5
{
  v55[4] = *MEMORY[0x263EF8340];
  v54.receiver = self;
  v54.super_class = (Class)TVRUIButton;
  v8 = -[TVRUIButton initWithFrame:](&v54, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v8)
  {
    v9 = objc_alloc_init(TVRUIDarkStyleProvider);
    styleProvider = v8->_styleProvider;
    v8->_styleProvider = (TVRUIStyleProvider *)v9;

    v8->_hasButtonShape = 1;
    v8->_buttonLocation = a5;
    v11 = [MEMORY[0x263F825C8] clearColor];
    [(TVRUIButton *)v8 setBackgroundColor:v11];

    v8->_buttonType = a3;
    v12 = [(TVRUIButton *)v8 layer];
    [v12 setBorderColor:0];

    v13 = [(TVRUIButton *)v8 layer];
    [v13 setBorderWidth:0.0];

    v14 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    buttonContentView = v8->_buttonContentView;
    v8->_buttonContentView = v14;

    [(UIView *)v8->_buttonContentView setUserInteractionEnabled:0];
    v16 = [MEMORY[0x263F825C8] clearColor];
    [(UIView *)v8->_buttonContentView setBackgroundColor:v16];

    [(TVRUIButton *)v8 addSubview:v8->_buttonContentView];
    [(TVRUIButton *)v8 _darkenSystemColorsChanged:0];
    v17 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    titleLabel = v8->_titleLabel;
    v8->_titleLabel = v17;

    v19 = [MEMORY[0x263F825C8] systemGrayColor];
    [(UILabel *)v8->_titleLabel setTextColor:v19];

    [(UILabel *)v8->_titleLabel setTextAlignment:1];
    [(UILabel *)v8->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v8->_buttonContentView addSubview:v8->_titleLabel];
    v20 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    imageView = v8->_imageView;
    v8->_imageView = v20;

    [(UIImageView *)v8->_imageView setContentMode:4];
    [(UIImageView *)v8->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v8->_buttonContentView addSubview:v8->_imageView];
    uint64_t v22 = [(TVRUIStyleProvider *)v8->_styleProvider iconForButtonType:v8->_buttonType buttonLocation:v8->_buttonLocation];
    v53 = (void *)v22;
    if (v22)
    {
      v23 = (void *)v22;
      [(UIImageView *)v8->_imageView setImage:v22];
      if (([v23 isSymbolImage] & 1) == 0) {
        [(UIImageView *)v8->_imageView sizeToFit];
      }
    }
    else
    {
      v24 = [(TVRUIStyleProvider *)v8->_styleProvider textForButtonType:v8->_buttonType];
      if (v24)
      {
        [(UILabel *)v8->_titleLabel setText:v24];
        v25 = [(TVRUIStyleProvider *)v8->_styleProvider buttonTextColor];
        [(UILabel *)v8->_titleLabel setTextColor:v25];

        v26 = [(TVRUIStyleProvider *)v8->_styleProvider primaryButtonFont];
        [(UILabel *)v8->_titleLabel setFont:v26];

        [(UILabel *)v8->_titleLabel sizeToFit];
      }
    }
    uint64_t v27 = [(TVRUIButton *)v8 _hapticForButtonType:v8->_buttonType];
    haptic = v8->_haptic;
    v8->_haptic = (TVRButtonHaptic *)v27;

    v8->_tapAction = a4;
    v29 = [(TVRUIButton *)v8 _accessibilityLabelForButtonType:a3];
    [(TVRUIButton *)v8 setAccessibilityLabel:v29];

    v30 = [(TVRUIButton *)v8 _accessibilityHintForButtonType:a3];
    [(TVRUIButton *)v8 setAccessibilityHint:v30];

    v31 = [(TVRUIButton *)v8 _accessibilityIDForButtonType:a3];
    [(TVRUIButton *)v8 setAccessibilityIdentifier:v31];

    [(TVRUIButton *)v8 addTarget:v8 action:sel__touchDown_ forControlEvents:1];
    [(TVRUIButton *)v8 addTarget:v8 action:sel__touchUp_ forControlEvents:448];
    [(TVRUIButton *)v8 setClipsToBounds:1];
    v32 = [(TVRUIStyleProvider *)v8->_styleProvider tintColorForButtonEnabled];
    [(TVRUIButton *)v8 setTintColor:v32];

    v33 = (void *)[objc_alloc(MEMORY[0x263F82A70]) initWithDelegate:v8];
    [(TVRUIButton *)v8 addInteraction:v33];

    double v34 = 0.0;
    if (v8->_buttonType == 2)
    {
      if ([(TVRUIButton *)v8 _shouldReverseLayoutDirection]) {
        double v34 = 2.0;
      }
      else {
        double v34 = 0.0;
      }
    }
    v48 = (void *)MEMORY[0x263F08938];
    v52 = [(UIImageView *)v8->_imageView centerXAnchor];
    v51 = [(UIView *)v8->_buttonContentView centerXAnchor];
    v50 = [v52 constraintEqualToAnchor:v51 constant:v34];
    v55[0] = v50;
    v49 = [(UIImageView *)v8->_imageView centerYAnchor];
    v35 = [(UIView *)v8->_buttonContentView centerYAnchor];
    v36 = [v49 constraintEqualToAnchor:v35];
    v55[1] = v36;
    v37 = [(UILabel *)v8->_titleLabel centerXAnchor];
    v38 = [(UIView *)v8->_buttonContentView centerXAnchor];
    v39 = [v37 constraintEqualToAnchor:v38];
    v55[2] = v39;
    v40 = [(UILabel *)v8->_titleLabel centerYAnchor];
    v41 = [(UIView *)v8->_buttonContentView centerYAnchor];
    v42 = [v40 constraintEqualToAnchor:v41];
    v55[3] = v42;
    v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:4];
    [v48 activateConstraints:v43];

    v44 = [MEMORY[0x263F08A00] defaultCenter];
    [v44 addObserver:v8 selector:sel__boldTextEnabledStatusChanged_ name:*MEMORY[0x263F83190] object:0];

    v45 = [MEMORY[0x263F08A00] defaultCenter];
    [v45 addObserver:v8 selector:sel__largeTextEnabledStatusChanged_ name:*MEMORY[0x263F83428] object:0];

    v46 = [MEMORY[0x263F08A00] defaultCenter];
    [v46 addObserver:v8 selector:sel__darkenSystemColorsChanged_ name:*MEMORY[0x263F831A0] object:0];
  }
  return v8;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)TVRUIButton;
  [(TVRUIButton *)&v6 layoutSubviews];
  [(TVRUIButton *)self bounds];
  [(TVRUIButton *)self _setCornerRadius:CGRectGetHeight(v7) * 0.5];
  v3 = [(TVRUIButton *)self highlightAnimator];
  if ([v3 isRunning])
  {
  }
  else
  {
    v4 = [(TVRUIButton *)self unhighlightAnimator];
    char v5 = [v4 isRunning];

    if ((v5 & 1) == 0)
    {
      [(TVRUIButton *)self bounds];
      -[UIView setFrame:](self->_buttonContentView, "setFrame:");
      [(TVRUIButton *)self _cornerRadius];
      -[UIView _setCornerRadius:](self->_buttonContentView, "_setCornerRadius:");
    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVRUIButton;
  -[TVRUIButton setEnabled:](&v9, sel_setEnabled_);
  if ([(TVRUIButton *)self buttonLocation] != 1)
  {
    char v5 = [(TVRUIButton *)self styleProvider];
    objc_super v6 = v5;
    if (v3) {
      [v5 tintColorForButtonEnabled];
    }
    else {
    CGRect v7 = [v5 tintColorForButtonDisabled];
    }
    v8 = [(TVRUIButton *)self imageView];
    [v8 setTintColor:v7];
  }
}

- (NSString)description
{
  v2 = [(TVRUIButton *)self _descriptionBuilder];
  BOOL v3 = [v2 build];

  return (NSString *)v3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TVRUIButton;
  [(TVRUIButton *)&v5 touchesBegan:a3 withEvent:a4];
  [(TVRButtonHaptic *)self->_haptic userInteractionBegan];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TVRUIButton;
  [(TVRUIButton *)&v5 touchesEnded:a3 withEvent:a4];
  [(TVRButtonHaptic *)self->_haptic userInteractionEnded];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TVRUIButton;
  [(TVRUIButton *)&v5 touchesCancelled:a3 withEvent:a4];
  [(TVRButtonHaptic *)self->_haptic userInteractionCancelled];
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = a5;
  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = (void *)[objc_alloc(MEMORY[0x263F82CC8]) initWithView:self];
  objc_super v6 = [(TVRUIButton *)self _pointerEffectForButtonType:[(TVRUIButton *)self buttonType] targetedPreview:v5];
  CGRect v7 = [MEMORY[0x263F82A90] styleWithEffect:v6 shape:0];

  return v7;
}

- (id)_pointerEffectForButtonType:(int64_t)a3 targetedPreview:(id)a4
{
  v4 = (id *)0x263F82A60;
  if ((unint64_t)(a3 - 28) >= 3) {
    v4 = (id *)0x263F82A78;
  }
  id v5 = [*v4 effectWithPreview:a4];
  return v5;
}

- (void)_boldTextEnabledStatusChanged:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    objc_super v9 = "-[TVRUIButton _boldTextEnabledStatusChanged:]";
    _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  id v5 = [(TVRUIButton *)self styleProvider];
  objc_super v6 = objc_msgSend(v5, "iconForButtonType:buttonLocation:", -[TVRUIButton buttonType](self, "buttonType"), -[TVRUIButton buttonLocation](self, "buttonLocation"));
  CGRect v7 = [(TVRUIButton *)self imageView];
  [v7 setImage:v6];
}

- (void)_largeTextEnabledStatusChanged:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    objc_super v9 = "-[TVRUIButton _largeTextEnabledStatusChanged:]";
    _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  id v5 = [(TVRUIButton *)self styleProvider];
  objc_super v6 = objc_msgSend(v5, "iconForButtonType:buttonLocation:", -[TVRUIButton buttonType](self, "buttonType"), -[TVRUIButton buttonLocation](self, "buttonLocation"));
  CGRect v7 = [(TVRUIButton *)self imageView];
  [v7 setImage:v6];
}

- (void)_darkenSystemColorsChanged:(id)a3
{
  v4 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[TVRUIButton _darkenSystemColorsChanged:](v4);
  }

  if ([(TVRUIButton *)self hasButtonShape])
  {
    id v5 = [(TVRUIButton *)self styleProvider];
    objc_super v6 = [v5 buttonBackgroundColor];
    CGRect v7 = [(TVRUIButton *)self buttonContentView];
    [v7 setBackgroundColor:v6];
  }
  else
  {
    id v5 = [(TVRUIButton *)self buttonContentView];
    [v5 setBackgroundColor:0];
  }
}

- (void)setHasButtonShape:(BOOL)a3
{
  if (self->_hasButtonShape != a3)
  {
    self->_hasButtonShape = a3;
    [(TVRUIButton *)self _darkenSystemColorsChanged:0];
  }
}

- (id)_accessibilityLabelForButtonType:(int64_t)a3
{
  BOOL v3 = 0;
  switch(a3)
  {
    case 1:
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v4;
      objc_super v6 = @"TVRUIAXLabelButtonTypeSelect";
      goto LABEL_28;
    case 2:
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v4;
      objc_super v6 = @"TVRUIAXLabelButtonTypeMenu";
      goto LABEL_28;
    case 3:
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v4;
      objc_super v6 = @"TVRUIAXLabelButtonTypeHome";
      goto LABEL_28;
    case 4:
    case 8:
    case 9:
    case 10:
    case 11:
    case 19:
    case 20:
    case 21:
    case 22:
      break;
    case 5:
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v4;
      objc_super v6 = @"TVRUIAXLabelButtonTypePlayPause";
      goto LABEL_28;
    case 6:
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v4;
      objc_super v6 = @"TVRUIAXLabelButtonTypeSkipForward";
      goto LABEL_28;
    case 7:
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v4;
      objc_super v6 = @"TVRUIAXLabelButtonTypeSkipBackward";
      goto LABEL_28;
    case 12:
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v4;
      objc_super v6 = @"TVRUIAXLabelButtonTypeArrowUp";
      goto LABEL_28;
    case 13:
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v4;
      objc_super v6 = @"TVRUIAXLabelButtonTypeArrowDown";
      goto LABEL_28;
    case 14:
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v4;
      objc_super v6 = @"TVRUIAXLabelButtonTypeArrowLeft";
      goto LABEL_28;
    case 15:
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v4;
      objc_super v6 = @"TVRUIAXLabelButtonTypeArrowRight";
      goto LABEL_28;
    case 16:
    case 17:
    case 18:
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v4;
      objc_super v6 = @"TVRUIAXLabelButtonTypeCaptions";
      goto LABEL_28;
    case 23:
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v4;
      objc_super v6 = @"TVRUIAXLabelButtonTypeBack";
      goto LABEL_28;
    case 24:
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v4;
      objc_super v6 = @"TVRUIAXLabelButtonTypeExit";
      goto LABEL_28;
    case 25:
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v4;
      objc_super v6 = @"TVRUIAXLabelButtonTypeInfo";
      goto LABEL_28;
    case 26:
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v4;
      objc_super v6 = @"TVRUIAXLabelButtonTypePageUp";
      goto LABEL_28;
    case 27:
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v4;
      objc_super v6 = @"TVRUIAXLabelButtonTypePageDown";
      goto LABEL_28;
    case 28:
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v4;
      objc_super v6 = @"TVRUIAXLabelButtonTypeGuide";
      goto LABEL_28;
    case 29:
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v4;
      objc_super v6 = @"TVRUIAXLabelButtonTypeMute";
      goto LABEL_28;
    case 30:
      v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v4;
      objc_super v6 = @"TVRUIAXLabelButtonTypePower";
LABEL_28:
      BOOL v3 = [v4 localizedStringForKey:v6 value:&stru_26DB4CAE0 table:@"Localizable"];

      break;
    default:
      switch(a3)
      {
        case 9992:
          v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          id v5 = v4;
          objc_super v6 = @"TVRUIAXLabelButtonTypeMediaInfo";
          goto LABEL_28;
        case 9993:
          v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          id v5 = v4;
          objc_super v6 = @"TVRUIAXLabelButtonTypePlay";
          goto LABEL_28;
        case 9994:
          v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          id v5 = v4;
          objc_super v6 = @"TVRUIAXLabelButtonTypePause";
          goto LABEL_28;
        case 9995:
          v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          id v5 = v4;
          objc_super v6 = @"TVRUIAXLabelButtonTypeFastForward";
          goto LABEL_28;
        case 9996:
          v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          id v5 = v4;
          objc_super v6 = @"TVRUIAXLabelButtonTypeRewind";
          goto LABEL_28;
        case 9999:
          v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          id v5 = v4;
          objc_super v6 = @"TVRUIAXLabelButtonTypeKeyboard";
          goto LABEL_28;
        default:
          goto LABEL_29;
      }
  }
LABEL_29:
  return v3;
}

- (id)_accessibilityHintForButtonType:(int64_t)a3
{
  if (a3 == 30)
  {
    BOOL v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = v3;
    id v5 = @"TVRUIAXHintButtonTypePower";
    goto LABEL_5;
  }
  if (a3 == 29)
  {
    BOOL v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = v3;
    id v5 = @"TVRUIAXHintButtonTypeMute";
LABEL_5:
    objc_super v6 = [v3 localizedStringForKey:v5 value:&stru_26DB4CAE0 table:@"Localizable"];

    goto LABEL_7;
  }
  objc_super v6 = 0;
LABEL_7:
  return v6;
}

- (id)_accessibilityIDForButtonType:(int64_t)a3
{
  v4 = @"menu";
  switch(a3)
  {
    case 1:
      v4 = @"select";
      break;
    case 2:
      break;
    case 3:
      v4 = @"home";
      break;
    case 4:
    case 8:
    case 9:
    case 10:
    case 11:
    case 19:
    case 20:
    case 21:
    case 22:
LABEL_27:
      v4 = @"unknown";
      break;
    case 5:
      v4 = @"playPause";
      break;
    case 6:
      v4 = @"skipForward";
      break;
    case 7:
      v4 = @"skipBackward";
      break;
    case 12:
      v4 = @"arrowUp";
      break;
    case 13:
      v4 = @"arrowDown";
      break;
    case 14:
      v4 = @"arrowLeft";
      break;
    case 15:
      v4 = @"arrowRight";
      break;
    case 16:
      v4 = @"toggleCaptions";
      break;
    case 17:
      v4 = @"alwaysOnCaptions";
      break;
    case 18:
      v4 = @"captions";
      break;
    case 23:
      v4 = @"back";
      break;
    case 24:
      v4 = @"exit";
      break;
    case 25:
      v4 = @"info";
      break;
    case 26:
      v4 = @"pageUp";
      break;
    case 27:
      v4 = @"pageDown";
      break;
    case 28:
      v4 = @"guide";
      break;
    case 29:
      v4 = @"mute";
      break;
    case 30:
      v4 = @"power";
      break;
    default:
      switch(a3)
      {
        case 9993:
          v4 = @"play";
          break;
        case 9994:
          v4 = @"pause";
          break;
        case 9995:
          v4 = @"fastForward";
          break;
        case 9996:
          v4 = @"rewind";
          break;
        case 9999:
          v4 = @"keyboard";
          break;
        default:
          goto LABEL_27;
      }
      break;
  }
  id v5 = [NSString stringWithFormat:@"UIA.TVRemoteService.%@", v4];
  return v5;
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 64;
}

- (id)_hapticForButtonType:(int64_t)a3
{
  if (a3 == 4)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = +[TVRButtonHaptic hapticForView:](TVRButtonHaptic, "hapticForView:", self, v3);
  }
  return v5;
}

- (void)_touchUp:(id)a3
{
  uint64_t v4 = [(TVRUIButton *)self highlightAnimator];
  int v5 = [v4 isRunning];

  if (v5)
  {
    objc_super v6 = [(TVRUIButton *)self highlightAnimator];
    [v6 stopAnimation:1];
  }
  id v7 = objc_alloc(MEMORY[0x263F82E30]);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __24__TVRUIButton__touchUp___block_invoke;
  v10[3] = &unk_2647FFF70;
  v10[4] = self;
  int v8 = (void *)[v7 initWithDuration:2 curve:v10 animations:0.48];
  [(TVRUIButton *)self setUnhighlightAnimator:v8];

  objc_super v9 = [(TVRUIButton *)self unhighlightAnimator];
  [v9 startAnimation];
}

void __24__TVRUIButton__touchUp___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) defaultBackgroundColor];
  uint64_t v3 = [*(id *)(a1 + 32) buttonContentView];
  [v3 setBackgroundColor:v2];

  [*(id *)(a1 + 32) setDefaultBackgroundColor:0];
  uint64_t v4 = [*(id *)(a1 + 32) buttonContentView];
  long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v8[0] = *MEMORY[0x263F000D0];
  v8[1] = v5;
  v8[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v4 setTransform:v8];

  objc_super v6 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_227326000, v6, OS_LOG_TYPE_DEFAULT, "#animation - button unhighlighter ran", v7, 2u);
  }
}

- (void)_touchDown:(id)a3
{
  uint64_t v4 = [(TVRUIButton *)self defaultBackgroundColor];

  if (!v4)
  {
    long long v5 = [(TVRUIButton *)self buttonContentView];
    objc_super v6 = [v5 backgroundColor];
    [(TVRUIButton *)self setDefaultBackgroundColor:v6];
  }
  id v7 = [(TVRUIButton *)self unhighlightAnimator];
  [v7 stopAnimation:1];

  id v8 = objc_alloc(MEMORY[0x263F82E30]);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __26__TVRUIButton__touchDown___block_invoke;
  v11[3] = &unk_2647FFF70;
  v11[4] = self;
  objc_super v9 = (void *)[v8 initWithDuration:3 curve:v11 animations:0.2];
  [(TVRUIButton *)self setHighlightAnimator:v9];

  uint64_t v10 = [(TVRUIButton *)self highlightAnimator];
  [v10 startAnimation];
}

void __26__TVRUIButton__touchDown___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isHighlightEffectDisabled])
  {
    v2 = [*(id *)(a1 + 32) defaultBackgroundColor];

    if (!v2) {
      goto LABEL_6;
    }
    uint64_t v3 = [*(id *)(a1 + 32) defaultBackgroundColor];
  }
  else
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithDisplayP3Red:0.219607843 green:0.219607843 blue:0.235294118 alpha:1.0];
  }
  uint64_t v4 = (void *)v3;
  long long v5 = [*(id *)(a1 + 32) buttonContentView];
  [v5 setBackgroundColor:v4];

LABEL_6:
  CGAffineTransformMakeScale(&v10, 0.92, 0.92);
  objc_super v6 = [*(id *)(a1 + 32) buttonContentView];
  CGAffineTransform v9 = v10;
  [v6 setTransform:&v9];

  id v7 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "#animation - button highlighter ran", v8, 2u);
  }
}

- (id)_descriptionBuilder
{
  uint64_t v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  uint64_t v4 = [(TVRUIButton *)self titleLabel];
  long long v5 = [v4 text];
  [v3 appendString:v5 withName:@"title"];

  id v6 = (id)objc_msgSend(v3, "appendInteger:withName:", -[TVRUIButton buttonType](self, "buttonType"), @"buttonType");
  id v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRUIButton hasTapAction](self, "hasTapAction"), @"hasTapAction");
  id v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRUIButton isHighlightEffectDisabled](self, "isHighlightEffectDisabled"), @"highlightEffectDisabled");
  return v3;
}

- (void)_updateButtonType:(int64_t)a3
{
  self->_buttonType = a3;
  long long v5 = [(TVRUIButton *)self styleProvider];
  id v6 = objc_msgSend(v5, "iconForButtonType:buttonLocation:", a3, -[TVRUIButton buttonLocation](self, "buttonLocation"));
  id v7 = [(TVRUIButton *)self imageView];
  [v7 setImage:v6];

  id v8 = [(TVRUIButton *)self _accessibilityLabelForButtonType:a3];
  [(TVRUIButton *)self setAccessibilityLabel:v8];

  CGAffineTransform v9 = [(TVRUIButton *)self _accessibilityHintForButtonType:a3];
  [(TVRUIButton *)self setAccessibilityHint:v9];

  id v10 = [(TVRUIButton *)self _accessibilityIDForButtonType:a3];
  [(TVRUIButton *)self setAccessibilityIdentifier:v10];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (BOOL)hasTapAction
{
  return self->_tapAction;
}

- (BOOL)isHighlightEffectDisabled
{
  return self->_disableHighlightEffect;
}

- (void)setDisableHighlightEffect:(BOOL)a3
{
  self->_disableHighlightEffect = a3;
}

- (BOOL)hasButtonShape
{
  return self->_hasButtonShape;
}

- (UIViewPropertyAnimator)highlightAnimator
{
  return self->_highlightAnimator;
}

- (void)setHighlightAnimator:(id)a3
{
}

- (UIViewPropertyAnimator)unhighlightAnimator
{
  return self->_unhighlightAnimator;
}

- (void)setUnhighlightAnimator:(id)a3
{
}

- (UIColor)defaultBackgroundColor
{
  return self->_defaultBackgroundColor;
}

- (void)setDefaultBackgroundColor:(id)a3
{
}

- (TVRButtonHaptic)haptic
{
  return self->_haptic;
}

- (void)setHaptic:(id)a3
{
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
}

- (int64_t)buttonLocation
{
  return self->_buttonLocation;
}

- (void)setButtonLocation:(int64_t)a3
{
  self->_buttonLocation = a3;
}

- (UIView)buttonContentView
{
  return self->_buttonContentView;
}

- (void)setButtonContentView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonContentView, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_haptic, 0);
  objc_storeStrong((id *)&self->_defaultBackgroundColor, 0);
  objc_storeStrong((id *)&self->_unhighlightAnimator, 0);
  objc_storeStrong((id *)&self->_highlightAnimator, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

- (void)_darkenSystemColorsChanged:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[TVRUIButton _darkenSystemColorsChanged:]";
  _os_log_debug_impl(&dword_227326000, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
}

@end