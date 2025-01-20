@interface UIVisualEffect
+ (BOOL)supportsSecureCoding;
+ (id)_effectCopyingFromCaptureGroup:(id)a3;
+ (id)effectCombiningEffects:(id)a3;
+ (id)effectCompositingColor:(id)a3;
+ (id)effectCompositingColor:(id)a3 withMode:(int64_t)a4 alpha:(double)a5;
+ (id)effectCompositingImage:(id)a3;
+ (id)effectCompositingImage:(id)a3 withMode:(int64_t)a4 alpha:(double)a5;
+ (id)emptyEffect;
- (BOOL)_isATVStyle;
- (BOOL)_isAutomaticStyle;
- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5;
- (BOOL)_selectorOverridden:(SEL)a3;
- (_UIBackdropViewSettings)effectSettings;
- (_UIVisualEffectConfig)effectConfig;
- (id)_allEffects;
- (id)effectConfigForQuality:(int64_t)a3;
- (int64_t)_expectedUsage;
- (void)_enumerateEffects:(id)a3;
- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5;
@end

@implementation UIVisualEffect

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5
{
  return 0;
}

- (void)_enumerateEffects:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, UIVisualEffect *, char *))a3 + 2))(a3, self, &v3);
}

+ (id)emptyEffect
{
  if (qword_1EB25C800 != -1) {
    dispatch_once(&qword_1EB25C800, &__block_literal_global_39);
  }
  v2 = (void *)_MergedGlobals_5_0;
  return v2;
}

void __29__UIVisualEffect_emptyEffect__block_invoke()
{
  v0 = objc_alloc_init(_UIEmptyEffect);
  v1 = (void *)_MergedGlobals_5_0;
  _MergedGlobals_5_0 = (uint64_t)v0;
}

+ (id)effectCompositingColor:(id)a3 withMode:(int64_t)a4 alpha:(double)a5
{
  id v8 = a3;
  v9 = _UIVisualEffectNewOverlay(a4, a5);
  v10 = v9;
  if (v9)
  {
    [v9 setColor:v8];
    id v11 = v10;
  }
  else
  {
    id v11 = [a1 emptyEffect];
  }
  v12 = v11;

  return v12;
}

+ (id)effectCompositingColor:(id)a3
{
  return (id)[a1 effectCompositingColor:a3 withMode:0 alpha:1.0];
}

+ (id)effectCombiningEffects:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 count];
  if (v5 == 1)
  {
    v6 = [v4 firstObject];
  }
  else if (v5)
  {
    v6 = [[_UICompoundEffect alloc] initWithEffects:v4];
  }
  else
  {
    v6 = [a1 emptyEffect];
  }
  v7 = v6;

  return v7;
}

+ (id)_effectCopyingFromCaptureGroup:(id)a3
{
  char v3 = +[_UICopyEffect copyEffectWithCaptureGroup:a3];
  return v3;
}

+ (id)effectCompositingImage:(id)a3
{
  return (id)[a1 effectCompositingImage:a3 withMode:0 alpha:1.0];
}

+ (id)effectCompositingImage:(id)a3 withMode:(int64_t)a4 alpha:(double)a5
{
  id v8 = a3;
  v9 = _UIVisualEffectNewOverlay(a4, a5);
  v10 = v9;
  if (v9)
  {
    [v9 setImage:v8];
    id v11 = v10;
  }
  else
  {
    id v11 = [a1 emptyEffect];
  }
  v12 = v11;

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIBackdropViewSettings)effectSettings
{
  return 0;
}

- (BOOL)_isATVStyle
{
  return 0;
}

- (BOOL)_isAutomaticStyle
{
  return 0;
}

- (_UIVisualEffectConfig)effectConfig
{
  return 0;
}

- (id)effectConfigForQuality:(int64_t)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, @"UIVisualEffect.m", 361, @"UIVisualEffect subclass must override %@", v6 object file lineNumber description];

  return 0;
}

- (id)_allEffects
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (BOOL)_selectorOverridden:(SEL)a3
{
  uint64_t v4 = -[UIVisualEffect methodForSelector:](self, "methodForSelector:");
  return v4 != +[UIVisualEffect instanceMethodForSelector:a3];
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  id v11 = a3;
  id v7 = a4;
  if ([(UIVisualEffect *)self _selectorOverridden:sel_effectSettings])
  {
    id v8 = +[_UILegacyEffectConverter sharedConverter];
    v9 = [(UIVisualEffect *)self effectSettings];
    [v8 applyBackdropSettings:v9 toEffectDescriptor:v11 environment:v7];
  }
  else if ([(UIVisualEffect *)self _selectorOverridden:sel_effectConfigForQuality_])
  {
    id v8 = +[_UILegacyEffectConverter sharedConverter];
    v9 = +[UIDevice currentDevice];
    v10 = -[UIVisualEffect effectConfigForQuality:](self, "effectConfigForQuality:", [v9 _graphicsQuality]);
    [v8 applyVibrancyConfig:v10 toEffectDescriptor:v11];
  }
  else
  {
    if (![(UIVisualEffect *)self _selectorOverridden:sel_effectConfig]) {
      goto LABEL_8;
    }
    id v8 = +[_UILegacyEffectConverter sharedConverter];
    v9 = [(UIVisualEffect *)self effectConfig];
    [v8 applyVibrancyConfig:v9 toEffectDescriptor:v11];
  }

LABEL_8:
}

- (int64_t)_expectedUsage
{
  if ([(UIVisualEffect *)self _selectorOverridden:sel_effectSettings]) {
    return 1;
  }
  if ([(UIVisualEffect *)self _selectorOverridden:sel_effectConfigForQuality_]) {
    return 2;
  }
  if ([(UIVisualEffect *)self _selectorOverridden:sel_effectConfig]) {
    return 2;
  }
  return 0;
}

@end