@interface _SFBarTheme
+ (BOOL)backdropIsDarkForStyle:(int64_t)a3;
+ (BOOL)canTintPrivateStyles;
+ (BOOL)prefersThemeColorEffect;
+ (_SFBarTheme)themeWithBarTintStyle:(int64_t)a3;
+ (_SFBarTheme)themeWithBarTintStyle:(int64_t)a3 preferredBarTintColor:(id)a4 controlsTintColor:(id)a5;
+ (_SFBarTheme)themeWithTheme:(id)a3;
+ (id)backdropEffectForStyle:(int64_t)a3;
+ (id)controlsTintColorForStyle:(int64_t)a3;
- (BOOL)backdropIsDark;
- (BOOL)backdropIsTinted;
- (BOOL)isEqual:(id)a3;
- (NSArray)backdropAdjustmentEffects;
- (NSArray)backdropEffects;
- (UIBlurEffect)backdropEffect;
- (UIColor)controlsTintColor;
- (UIColor)platterProgressBarTintColor;
- (UIColor)preferredBarTintColor;
- (_SFBarTheme)fallbackTheme;
- (_SFBarTheme)initWithBarTintStyle:(int64_t)a3 preferredBarTintColor:(id)a4 controlsTintColor:(id)a5;
- (id)description;
- (int64_t)overrideUserInterfaceStyle;
- (int64_t)tintStyle;
- (void)applyBackdropEffectsToView:(id)a3;
@end

@implementation _SFBarTheme

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropAdjustmentEffects, 0);
  objc_storeStrong((id *)&self->_backdropEffect, 0);
  objc_storeStrong((id *)&self->_platterProgressBarTintColor, 0);
  objc_storeStrong((id *)&self->_preferredBarTintColor, 0);
  objc_storeStrong((id *)&self->_controlsTintColor, 0);

  objc_storeStrong((id *)&self->_preferredControlsTintColor, 0);
}

- (void)applyBackdropEffectsToView:(id)a3
{
  id v8 = a3;
  v4 = [(_SFBarTheme *)self backdropEffects];
  [v8 setBackgroundEffects:v4];

  if (self->_backdropAdjustmentEffects) {
    backdropAdjustmentEffects = self->_backdropAdjustmentEffects;
  }
  else {
    backdropAdjustmentEffects = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  [v8 setContentEffects:backdropAdjustmentEffects];
  if (self->_backdropAdjustmentEffects) {
    [v8 tintColor];
  }
  else {
  v6 = [MEMORY[0x1E4FB1618] clearColor];
  }
  v7 = [v8 contentView];
  [v7 setBackgroundColor:v6];
}

- (NSArray)backdropEffects
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(_SFBarTheme *)self backdropEffect];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

- (UIBlurEffect)backdropEffect
{
  return self->_backdropEffect;
}

+ (id)controlsTintColorForStyle:(int64_t)a3
{
  if (a3 == 5)
  {
    v3 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  else
  {
    if (_SFIsPrivateTintStyle(a3)) {
      [MEMORY[0x1E4FB1618] labelColor];
    }
    else {
    v3 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_safariAccentColor");
    }
  }

  return v3;
}

- (_SFBarTheme)initWithBarTintStyle:(int64_t)a3 preferredBarTintColor:(id)a4 controlsTintColor:(id)a5
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if ((unint64_t)(a3 - 1) >= 2 && ([(id)objc_opt_class() canTintPrivateStyles] & 1) == 0)
  {

    id v8 = 0;
    id v9 = 0;
  }
  v33.receiver = self;
  v33.super_class = (Class)_SFBarTheme;
  v10 = [(_SFBarTheme *)&v33 init];
  v11 = v10;
  if (v10)
  {
    v10->_tintStyle = a3;
    if (v8) {
      int v12 = objc_msgSend(v8, "sf_isDarkColor");
    }
    else {
      int v12 = [(id)objc_opt_class() backdropIsDarkForStyle:a3];
    }
    int v13 = v12;
    v11->_backdropIsDark = v12;
    BOOL v15 = a3 == 5 || v8 != 0;
    v11->_backdropIsTinted = v15;
    objc_storeStrong((id *)&v11->_preferredBarTintColor, v8);
    objc_storeStrong((id *)&v11->_preferredControlsTintColor, v9);
    if (v9)
    {
      v16 = (UIColor *)v9;
    }
    else
    {
      v16 = [(id)objc_opt_class() controlsTintColorForStyle:a3];
    }
    controlsTintColor = v11->_controlsTintColor;
    v11->_controlsTintColor = v16;

    v18 = v11->_controlsTintColor;
    v19 = 0;
    switch(a3)
    {
      case 0:
        goto LABEL_25;
      case 1:
      case 2:
      case 5:
        double v20 = 1.0;
        goto LABEL_22;
      case 3:
        double v20 = 0.4;
        goto LABEL_22;
      case 4:
        double v20 = 0.5;
        goto LABEL_22;
      default:
        double v20 = 0.0;
LABEL_22:
        if (_SFIsPrivateTintStyle(a3))
        {
          v21 = [MEMORY[0x1E4FB1618] whiteColor];
          v19 = [v21 colorWithAlphaComponent:v20];
        }
        else
        {
          v19 = v18;
        }
LABEL_25:

        platterProgressBarTintColor = v11->_platterProgressBarTintColor;
        v11->_platterProgressBarTintColor = v19;

        uint64_t v23 = 1;
        if (v13) {
          uint64_t v23 = 2;
        }
        v11->_overrideUserInterfaceStyle = v23;
        v24 = objc_opt_class();
        if (v8)
        {
          if ([v24 prefersThemeColorEffect])
          {
            if (plainBlurEffect_onceToken[0] != -1) {
              dispatch_once(plainBlurEffect_onceToken, &__block_literal_global_66);
            }
            v25 = (UIBlurEffect *)(id)plainBlurEffect_effect;
          }
          else
          {
            v25 = [MEMORY[0x1E4FB14C8] _effectWithTintColor:v8];
          }
        }
        else
        {
          v25 = [v24 backdropEffectForStyle:a3];
        }
        backdropEffect = v11->_backdropEffect;
        v11->_backdropEffect = v25;

        if (a3 == 4)
        {
          v32[0] = xmmword_18C70F030;
          v32[1] = xmmword_18C70F040;
          v32[2] = xmmword_18C70F050;
          v32[3] = xmmword_18C70F060;
          v32[4] = xmmword_18C70F070;
          v27 = [MEMORY[0x1E4FB1EA0] _vibrantEffectWithCAColorMatrix:v32 alpha:1.0];
          v34[0] = v27;
          uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
          backdropAdjustmentEffects = v11->_backdropAdjustmentEffects;
          v11->_backdropAdjustmentEffects = (NSArray *)v28;
        }
        else
        {
          v27 = v11->_backdropAdjustmentEffects;
          v11->_backdropAdjustmentEffects = 0;
        }

        v30 = v11;
        break;
    }
  }

  return v11;
}

+ (BOOL)backdropIsDarkForStyle:(int64_t)a3
{
  return _SFIsDarkTintStyle(a3);
}

+ (id)backdropEffectForStyle:(int64_t)a3
{
  return _SFBackdropEffectForBarTintStyle(a3);
}

- (int64_t)overrideUserInterfaceStyle
{
  return self->_overrideUserInterfaceStyle;
}

- (UIColor)controlsTintColor
{
  return self->_controlsTintColor;
}

+ (BOOL)prefersThemeColorEffect
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_SFBarTheme *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t tintStyle = self->_tintStyle;
      if (tintStyle == [v5 tintStyle])
      {
        v7 = [v5 preferredBarTintColor];
        preferredBarTintColor = self->_preferredBarTintColor;
        if (preferredBarTintColor == v7 || [(UIColor *)preferredBarTintColor isEqual:v7])
        {
          id v9 = (UIColor *)v5[1];
          preferredControlsTintColor = self->_preferredControlsTintColor;
          BOOL v11 = preferredControlsTintColor == v9
             || [(UIColor *)preferredControlsTintColor isEqual:v9];
        }
        else
        {
          BOOL v11 = 0;
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (int64_t)tintStyle
{
  return self->_tintStyle;
}

- (UIColor)preferredBarTintColor
{
  return self->_preferredBarTintColor;
}

+ (_SFBarTheme)themeWithBarTintStyle:(int64_t)a3
{
  return (_SFBarTheme *)[a1 themeWithBarTintStyle:a3 preferredBarTintColor:0 controlsTintColor:0];
}

+ (_SFBarTheme)themeWithTheme:(id)a3
{
  v4 = a3;
  char isKindOfClass = objc_opt_isKindOfClass();
  if (!v4 || (isKindOfClass & 1) != 0) {
    v6 = v4;
  }
  else {
    v6 = objc_msgSend(objc_alloc((Class)a1), "initWithBarTintStyle:preferredBarTintColor:controlsTintColor:", objc_msgSend(v4, "tintStyle"), v4[5], v4[1]);
  }
  v7 = v6;

  return (_SFBarTheme *)v7;
}

+ (_SFBarTheme)themeWithBarTintStyle:(int64_t)a3 preferredBarTintColor:(id)a4 controlsTintColor:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = (void *)[objc_alloc((Class)a1) initWithBarTintStyle:a3 preferredBarTintColor:v9 controlsTintColor:v8];

  return (_SFBarTheme *)v10;
}

- (UIColor)platterProgressBarTintColor
{
  return self->_platterProgressBarTintColor;
}

+ (BOOL)canTintPrivateStyles
{
  return 0;
}

- (_SFBarTheme)fallbackTheme
{
  if (self->_preferredBarTintColor || self->_preferredControlsTintColor) {
    v2 = (_SFBarTheme *)[objc_alloc((Class)objc_opt_class()) initWithBarTintStyle:self->_tintStyle preferredBarTintColor:0 controlsTintColor:0];
  }
  else {
    v2 = self;
  }

  return v2;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = _SFStringForTintStyle(self->_tintStyle);
  v7 = [v3 stringWithFormat:@"<%@: %p, %@", v5, self, v6];

  if (self->_preferredBarTintColor)
  {
    if (self->_backdropIsDark) {
      id v8 = @"dark";
    }
    else {
      id v8 = @"light";
    }
    [v7 appendFormat:@", tint=%@ (%@)", self->_preferredBarTintColor, v8];
  }
  if (self->_preferredControlsTintColor) {
    [v7 appendFormat:@", conrolsTint=%@", self->_preferredControlsTintColor];
  }
  [v7 appendString:@">"];

  return v7;
}

- (BOOL)backdropIsDark
{
  return self->_backdropIsDark;
}

- (BOOL)backdropIsTinted
{
  return self->_backdropIsTinted;
}

- (NSArray)backdropAdjustmentEffects
{
  return self->_backdropAdjustmentEffects;
}

@end