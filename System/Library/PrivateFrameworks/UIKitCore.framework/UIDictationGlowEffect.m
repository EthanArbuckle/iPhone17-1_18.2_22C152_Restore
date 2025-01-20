@interface UIDictationGlowEffect
- (UIColor)tintColor;
- (UIDictationGlowEffect)initWithView:(id)a3;
- (double)blurRadius;
- (void)setBlurRadius:(double)a3;
- (void)setPulsing:(BOOL)a3;
- (void)setTintColor:(id)a3;
- (void)setTintColor:(id)a3 animated:(BOOL)a4 duration:(double)a5 autoreverses:(BOOL)a6 repeatCount:(double)a7;
- (void)updateColorWithUserInterfaceStyleChange;
@end

@implementation UIDictationGlowEffect

- (UIDictationGlowEffect)initWithView:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (+[UIKeyboard isInlineDictationGlowEffectEnabled]
    && !+[UIKeyboard isKeyboardProcess])
  {
    v29.receiver = self;
    v29.super_class = (Class)UIDictationGlowEffect;
    v6 = [(UIDictationGlowEffect *)&v29 init];
    v7 = v6;
    if (v6)
    {
      objc_storeWeak((id *)&v6->_glowEffectView, v4);
      id v8 = objc_alloc((Class)getTUIGlowEffectClass());
      id WeakRetained = objc_loadWeakRetained((id *)&v7->_glowEffectView);
      v10 = [WeakRetained layer];
      uint64_t v11 = [v8 initWithLayer:v10];
      glowEffect = v7->_glowEffect;
      v7->_glowEffect = (TUIGlowEffect *)v11;

      [(TUIGlowEffect *)v7->_glowEffect setPulsing:0];
      v13 = v7->_glowEffect;
      v14 = +[_UIDictationSettingsDomain rootSettings];
      [v14 minimumRadius];
      -[TUIGlowEffect setMinimumRadius:](v13, "setMinimumRadius:");

      id v15 = objc_loadWeakRetained((id *)&v7->_glowEffectView);
      v30[0] = 0x1ED3F5A48;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
      id v17 = (id)[v15 _registerForTraitTokenChanges:v16 withTarget:v7 action:sel_updateColorWithUserInterfaceStyleChange];

      id v18 = objc_loadWeakRetained((id *)&v7->_glowEffectView);
      v19 = [v18 traitCollection];
      uint64_t v20 = [v19 userInterfaceStyle];
      BOOL v22 = v20 == 2 || v20 == 1000;
      v7->_BOOL cachedDarkMode = v22;

      BOOL cachedDarkMode = v7->_cachedDarkMode;
      v24 = +[_UIDictationSettingsDomain rootSettings];
      v25 = v24;
      if (cachedDarkMode) {
        [v24 darkModeCompositingFiler];
      }
      else {
      v26 = [v24 lightModeCompositingFiler];
      }
      v27 = [(TUIGlowEffect *)v7->_glowEffect layer];
      [v27 setCompositingFilter:v26];
    }
    self = v7;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setTintColor:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    if (self->_cachedDarkMode)
    {
      double v17 = 0.0;
      uint64_t v18 = 0;
      id TUIGlowEffectClass = getTUIGlowEffectClass();
      BOOL cachedDarkMode = self->_cachedDarkMode;
      id v8 = v5;
      uint64_t v9 = [v8 CGColor];
      [v8 alphaComponent];
      if (objc_msgSend(TUIGlowEffectClass, "adjustVisibilityForDarkMode:tintColor:alpha:outTintColor:outAlpha:", cachedDarkMode, v9, &v18, &v17))
      {
        v10 = (UIColor *)[v8 copy];
        cachedTintColor = self->_cachedTintColor;
        self->_cachedTintColor = v10;

        v12 = _UIDictationGlowEffectLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          v16 = self->_cachedTintColor;
          *(_DWORD *)buf = 138412290;
          double v20 = *(double *)&v16;
          _os_log_debug_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEBUG, "cache tintColor %@", buf, 0xCu);
        }

        v13 = +[UIColor colorWithCGColor:v18];
        v5 = [v13 colorWithAlphaComponent:v17];

        v14 = _UIDictationGlowEffectLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218242;
          double v20 = v17;
          __int16 v21 = 2112;
          BOOL v22 = v5;
          _os_log_debug_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEBUG, "setTintColor: with dark-mode-adjusted opacity %f and color %@", buf, 0x16u);
        }
      }
      else
      {
        v5 = v8;
      }
    }
    id v15 = v5;
    -[TUIGlowEffect setTintColor:](self->_glowEffect, "setTintColor:", [v15 CGColor]);
  }
}

- (void)setTintColor:(id)a3 animated:(BOOL)a4 duration:(double)a5 autoreverses:(BOOL)a6 repeatCount:(double)a7
{
  BOOL v8 = a6;
  BOOL v10 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (self->_cachedDarkMode)
    {
      double v20 = 0.0;
      uint64_t v21 = 0;
      id TUIGlowEffectClass = getTUIGlowEffectClass();
      BOOL cachedDarkMode = self->_cachedDarkMode;
      id v15 = v12;
      uint64_t v16 = [v15 CGColor];
      [v15 alphaComponent];
      if (objc_msgSend(TUIGlowEffectClass, "adjustVisibilityForDarkMode:tintColor:alpha:outTintColor:outAlpha:", cachedDarkMode, v16, &v21, &v20))
      {
        double v17 = +[UIColor colorWithCGColor:v21];
        id v12 = [v17 colorWithAlphaComponent:v20];

        uint64_t v18 = _UIDictationGlowEffectLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218242;
          double v23 = v20;
          __int16 v24 = 2112;
          id v25 = v12;
          _os_log_debug_impl(&dword_1853B0000, v18, OS_LOG_TYPE_DEBUG, "setTintColor: with dark-mode-adjusted opacity %f and color %@", buf, 0x16u);
        }
      }
      else
      {
        id v12 = v15;
      }
    }
    glowEffect = self->_glowEffect;
    id v12 = v12;
    -[TUIGlowEffect setTintColor:animated:duration:autoreverses:repeatCount:](glowEffect, "setTintColor:animated:duration:autoreverses:repeatCount:", [v12 CGColor], v10, v8, a5, a7);
  }
}

- (void)setPulsing:(BOOL)a3
{
}

- (void)setBlurRadius:(double)a3
{
  self->_blurRadius = a3;
  -[TUIGlowEffect setBlurRadius:](self->_glowEffect, "setBlurRadius:");
}

- (void)updateColorWithUserInterfaceStyleChange
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_glowEffectView);
  id v4 = [WeakRetained traitCollection];
  uint64_t v5 = [v4 userInterfaceStyle];
  uint64_t v6 = v5;
  BOOL v8 = v5 == 2 || v5 == 1000;

  if (self->_cachedDarkMode != v8)
  {
    self->_BOOL cachedDarkMode = v8;
    uint64_t v9 = +[_UIDictationSettingsDomain rootSettings];
    BOOL v10 = v9;
    if (v6 == 1000 || v6 == 2)
    {
      uint64_t v11 = [v9 darkModeCompositingFiler];
    }
    else
    {
      uint64_t v11 = [v9 lightModeCompositingFiler];
    }
    id v12 = (void *)v11;
    v13 = [(TUIGlowEffect *)self->_glowEffect layer];
    [v13 setCompositingFilter:v12];

    if (self->_cachedTintColor && !self->_cachedDarkMode)
    {
      -[UIDictationGlowEffect setTintColor:](self, "setTintColor:");
      v14 = _UIDictationGlowEffectLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        cachedTintColor = self->_cachedTintColor;
        int v17 = 138412290;
        uint64_t v18 = cachedTintColor;
        _os_log_debug_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEBUG, "reset dark-mode-tint-color with cached value %@", (uint8_t *)&v17, 0xCu);
      }

      id v15 = self->_cachedTintColor;
      self->_cachedTintColor = 0;
    }
  }
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_cachedTintColor, 0);
  objc_storeStrong((id *)&self->_glowEffect, 0);
  objc_destroyWeak((id *)&self->_glowEffectView);
}

@end