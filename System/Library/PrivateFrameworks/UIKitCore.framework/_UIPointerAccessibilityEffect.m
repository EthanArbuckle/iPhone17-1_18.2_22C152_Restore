@interface _UIPointerAccessibilityEffect
+ (BOOL)shouldApplyAccessibilityEffect;
+ (id)_effectWithInputEffect:(id)a3;
- (BOOL)prefersScaledContent;
- (BOOL)prefersShadow;
@end

@implementation _UIPointerAccessibilityEffect

+ (id)_effectWithInputEffect:(id)a3
{
  id v3 = a3;
  v4 = [v3 preview];
  v5 = +[UIPointerEffect effectWithPreview:v4];

  objc_msgSend(v5, "setPrefersScaledContent:", ((unint64_t)objc_msgSend(v3, "options") >> 5) & 1);
  char isKindOfClass = 1;
  objc_msgSend(v5, "set_tintViewTakesOnPointerShape:", 1);
  if (([v3 options] & 8) == 0)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  objc_msgSend(v5, "set_tintViewUsesPointerMaterial:", isKindOfClass & 1);

  return v5;
}

+ (BOOL)shouldApplyAccessibilityEffect
{
  return _AXSPointerAllowAppCustomizationEnabled() == 0;
}

- (BOOL)prefersShadow
{
  int v3 = _AXSPointerEffectScalingEnabled();
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIPointerAccessibilityEffect;
    LOBYTE(v3) = [(UIPointerHoverEffect *)&v5 prefersShadow];
  }
  return v3;
}

- (BOOL)prefersScaledContent
{
  int v3 = _AXSPointerEffectScalingEnabled();
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIPointerAccessibilityEffect;
    LOBYTE(v3) = [(UIPointerHoverEffect *)&v5 prefersScaledContent];
  }
  return v3;
}

@end