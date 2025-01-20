@interface UIPointerHoverEffect
- (BOOL)_tintViewTakesOnPointerShape;
- (BOOL)_tintViewUsesPointerMaterial;
- (BOOL)isEqual:(id)a3;
- (BOOL)prefersScaledContent;
- (BOOL)prefersShadow;
- (UIPointerEffectTintMode)preferredTintMode;
- (UIPointerHoverEffect)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)settings;
- (unint64_t)constrainedAxes;
- (unint64_t)hash;
- (unint64_t)options;
- (void)setPreferredTintMode:(UIPointerEffectTintMode)preferredTintMode;
- (void)setPrefersScaledContent:(BOOL)prefersScaledContent;
- (void)setPrefersShadow:(BOOL)prefersShadow;
- (void)set_tintViewTakesOnPointerShape:(BOOL)a3;
- (void)set_tintViewUsesPointerMaterial:(BOOL)a3;
@end

@implementation UIPointerHoverEffect

- (UIPointerHoverEffect)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIPointerHoverEffect;
  v2 = [(UIPointerHoverEffect *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(UIPointerHoverEffect *)v2 setPreferredTintMode:1];
    [(UIPointerHoverEffect *)v3 setPrefersScaledContent:1];
  }
  return v3;
}

- (unint64_t)options
{
  UIPointerEffectTintMode v3 = [(UIPointerHoverEffect *)self preferredTintMode];
  uint64_t v4 = 9;
  if (v3 != UIPointerEffectTintModeUnderlay) {
    uint64_t v4 = 1;
  }
  if (v3 == UIPointerEffectTintModeOverlay) {
    unint64_t v5 = 5;
  }
  else {
    unint64_t v5 = v4;
  }
  if ([(UIPointerHoverEffect *)self prefersShadow]) {
    v5 |= 0x10uLL;
  }
  if ([(UIPointerHoverEffect *)self prefersScaledContent]) {
    v5 |= 0x20uLL;
  }
  if ([(UIPointerHoverEffect *)self _tintViewTakesOnPointerShape]) {
    v5 |= 0xC00uLL;
  }
  if ([(UIPointerHoverEffect *)self _tintViewUsesPointerMaterial]) {
    return v5 & 0xFFFFFFFFFFFFBFF3 | 0x4008;
  }
  else {
    return v5;
  }
}

- (unint64_t)constrainedAxes
{
  return 0;
}

- (id)settings
{
  v2 = +[_UIPointerSettingsDomain rootSettings];
  UIPointerEffectTintMode v3 = [v2 hoverEffectSettings];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIPointerHoverEffect;
  id v4 = [(UIPointerEffect *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setPreferredTintMode:", -[UIPointerHoverEffect preferredTintMode](self, "preferredTintMode"));
  objc_msgSend(v4, "setPrefersScaledContent:", -[UIPointerHoverEffect prefersScaledContent](self, "prefersScaledContent"));
  objc_msgSend(v4, "setPrefersShadow:", -[UIPointerHoverEffect prefersShadow](self, "prefersShadow"));
  objc_msgSend(v4, "set_tintViewTakesOnPointerShape:", -[UIPointerHoverEffect _tintViewTakesOnPointerShape](self, "_tintViewTakesOnPointerShape"));
  objc_msgSend(v4, "set_tintViewUsesPointerMaterial:", -[UIPointerHoverEffect _tintViewUsesPointerMaterial](self, "_tintViewUsesPointerMaterial"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UIPointerHoverEffect;
  if ([(UIPointerEffect *)&v13 isEqual:v4])
  {
    id v5 = v4;
    uint64_t v6 = [v5 preferredTintMode];
    if (v6 == [(UIPointerHoverEffect *)self preferredTintMode]
      && (int v7 = [v5 prefersScaledContent],
          v7 == [(UIPointerHoverEffect *)self prefersScaledContent])
      && (int v8 = [v5 prefersShadow], v8 == -[UIPointerHoverEffect prefersShadow](self, "prefersShadow"))
      && (int v9 = [v5 _tintViewTakesOnPointerShape],
          v9 == [(UIPointerHoverEffect *)self _tintViewTakesOnPointerShape]))
    {
      int v12 = [v5 _tintViewUsesPointerMaterial];
      int v10 = v12 ^ [(UIPointerHoverEffect *)self _tintViewUsesPointerMaterial] ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)UIPointerHoverEffect;
  unint64_t v3 = [(UIPointerEffect *)&v9 hash];
  UIPointerEffectTintMode v4 = [(UIPointerHoverEffect *)self preferredTintMode];
  uint64_t v5 = v4 ^ [(UIPointerHoverEffect *)self prefersScaledContent];
  uint64_t v6 = v5 ^ [(UIPointerHoverEffect *)self prefersShadow];
  unint64_t v7 = v6 ^ [(UIPointerHoverEffect *)self _tintViewTakesOnPointerShape] ^ v3;
  return v7 ^ [(UIPointerHoverEffect *)self _tintViewUsesPointerMaterial];
}

- (UIPointerEffectTintMode)preferredTintMode
{
  return self->_preferredTintMode;
}

- (void)setPreferredTintMode:(UIPointerEffectTintMode)preferredTintMode
{
  self->_preferredTintMode = preferredTintMode;
}

- (BOOL)prefersShadow
{
  return self->_prefersShadow;
}

- (void)setPrefersShadow:(BOOL)prefersShadow
{
  self->_prefersShadow = prefersShadow;
}

- (BOOL)prefersScaledContent
{
  return self->_prefersScaledContent;
}

- (void)setPrefersScaledContent:(BOOL)prefersScaledContent
{
  self->_prefersScaledContent = prefersScaledContent;
}

- (BOOL)_tintViewTakesOnPointerShape
{
  return self->__tintViewTakesOnPointerShape;
}

- (void)set_tintViewTakesOnPointerShape:(BOOL)a3
{
  self->__tintViewTakesOnPointerShape = a3;
}

- (BOOL)_tintViewUsesPointerMaterial
{
  return self->__tintViewUsesPointerMaterial;
}

- (void)set_tintViewUsesPointerMaterial:(BOOL)a3
{
  self->__tintViewUsesPointerMaterial = a3;
}

@end