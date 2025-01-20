@interface UIVibrancyEffect
+ (BOOL)supportsSecureCoding;
+ (UIVibrancyEffect)effectForBlurEffect:(UIBlurEffect *)blurEffect;
+ (UIVibrancyEffect)effectForBlurEffect:(UIBlurEffect *)blurEffect style:(UIVibrancyEffectStyle)style;
+ (id)_darkVibrantEffectWithLightenColor:(id)a3 dodgeColor:(id)a4 compositingColor:(id)a5;
+ (id)_effectForBlurEffect:(id)a3 vibrancyStyle:(int64_t)a4;
+ (id)_effectWithStyle:(int64_t)a3 ignoreSimpleVibrancy:(BOOL)a4;
+ (id)_lightVibrantEffectWithDarkenColor:(id)a3 burnColor:(id)a4 compositingColor:(id)a5;
+ (id)_vibrancyEntryWithType:(id)a3 inputColor1:(id)a4 inputColor2:(id)a5 inputReversed:(BOOL)a6;
+ (id)_vibrantEffectForLightMaterial:(id)a3 darkMaterial:(id)a4 vibrancyStyle:(int64_t)a5;
+ (id)_vibrantEffectWithCAColorMatrix:(CAColorMatrix *)a3 alpha:(double)a4;
+ (id)_vibrantEffectWithLightCAColorMatrix:(CAColorMatrix *)a3 darkCAColorMatrix:(CAColorMatrix *)a4 alpha:(double)a5;
+ (id)_vibrantShadowEffect;
+ (id)darkVibrantEffectWithDodgeColor:(id)a3 lightenColor:(id)a4 compositingColor:(id)a5;
+ (id)lightVibrantEffectWithBurnColor:(id)a3 darkenColor:(id)a4 compositingColor:(id)a5;
+ (id)vibrantChromeShadowEffect;
+ (id)vibrantEffectWithCompositingMode:(int64_t)a3 compositingColor:(id)a4;
+ (id)vibrantHeavyShadowEffect;
+ (id)vibrantMediumShadowEffect;
- (BOOL)_isATVStyle;
- (BOOL)_isAutomaticStyle;
- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (UIVibrancyEffect)init;
- (UIVibrancyEffect)initWithCoder:(id)a3;
- (id)_effectReplacingTintColor:(id)a3;
- (id)_initWithImplementation:(id)a3;
- (id)_reduceTransparencyEffectConfig;
- (id)description;
- (id)effectConfig;
- (id)effectConfigForQuality:(int64_t)a3;
- (id)effectConfigForReducedTransperancy:(BOOL)a3;
- (id)effectForUserInterfaceStyle:(int64_t)a3;
- (int64_t)_blurStyle;
- (int64_t)_expectedUsage;
- (int64_t)_vibrancyStyle;
- (unint64_t)hash;
- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UIVibrancyEffect

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5
{
  return [(_UIVibrancyEffectImpl *)self->_impl _needsUpdateForTransitionFromEnvironment:a3 toEnvironment:a4 usage:a5];
}

- (int64_t)_expectedUsage
{
  return 2;
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
}

+ (id)_vibrantEffectWithLightCAColorMatrix:(CAColorMatrix *)a3 darkCAColorMatrix:(CAColorMatrix *)a4 alpha:(double)a5
{
  v9 = [_UIVibrancyEffectVibrantColorMatrixImpl alloc];
  long long v10 = *(_OWORD *)&a3->m33;
  v18[2] = *(_OWORD *)&a3->m24;
  v18[3] = v10;
  v18[4] = *(_OWORD *)&a3->m42;
  long long v11 = *(_OWORD *)&a3->m15;
  v18[0] = *(_OWORD *)&a3->m11;
  v18[1] = v11;
  long long v12 = *(_OWORD *)&a4->m33;
  v17[2] = *(_OWORD *)&a4->m24;
  v17[3] = v12;
  v17[4] = *(_OWORD *)&a4->m42;
  long long v13 = *(_OWORD *)&a4->m15;
  v17[0] = *(_OWORD *)&a4->m11;
  v17[1] = v13;
  v14 = [(_UIVibrancyEffectVibrantColorMatrixImpl *)v9 initWithLightCAColorMatrix:v18 darkCAColorMatrix:v17 alpha:a5];
  v15 = (void *)[objc_alloc((Class)a1) _initWithImplementation:v14];

  return v15;
}

- (void).cxx_destruct
{
}

+ (UIVibrancyEffect)effectForBlurEffect:(UIBlurEffect *)blurEffect
{
  v4 = blurEffect;
  if ([(UIBlurEffect *)v4 _canProvideVibrancyEffect])
  {
    if ([(UIBlurEffect *)v4 _canProvideCoreMaterialVibrancyEffect]) {
      v5 = [[_UIVibrancyEffectCoreMaterialImpl alloc] initWithStyle:[(UIBlurEffect *)v4 _style] vibrancyStyle:1];
    }
    else {
      v5 = [[_UIVibrancyEffectLegacyImpl alloc] initWithStyle:[(UIBlurEffect *)v4 _style] invertAutomaticStyle:[(UIBlurEffect *)v4 _invertAutomaticStyle]];
    }
  }
  else
  {
    v5 = [[_UIVibrancyEffectModernCompositedImpl alloc] initWithCompositingMode:24 compositingColor:0];
  }
  v6 = v5;
  v7 = (void *)[objc_alloc((Class)a1) _initWithImplementation:v5];

  return (UIVibrancyEffect *)v7;
}

+ (UIVibrancyEffect)effectForBlurEffect:(UIBlurEffect *)blurEffect style:(UIVibrancyEffectStyle)style
{
  v6 = blurEffect;
  if ([(UIBlurEffect *)v6 _canProvideVibrancyEffect]
    && [(UIBlurEffect *)v6 _canProvideCoreMaterialVibrancyEffect])
  {
    v7 = [[_UIVibrancyEffectCoreMaterialImpl alloc] initWithStyle:[(UIBlurEffect *)v6 _style] vibrancyStyle:style];
    v8 = (void *)[objc_alloc((Class)a1) _initWithImplementation:v7];
  }
  else
  {
    v8 = [a1 effectForBlurEffect:v6];
  }

  return (UIVibrancyEffect *)v8;
}

- (id)_initWithImplementation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIVibrancyEffect;
  v6 = [(UIVibrancyEffect *)&v9 init];
  p_isa = (id *)&v6->super.super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_impl, a3);
    [p_isa[1] setEffect:p_isa];
  }

  return p_isa;
}

+ (id)_effectForBlurEffect:(id)a3 vibrancyStyle:(int64_t)a4
{
  uint64_t v6 = _UIVibrancyStyleConvertToPublic(a4);
  return (id)[a1 effectForBlurEffect:a3 style:v6];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UIVibrancyEffect *)a3;
  p_isa = (id *)&v4->super.super.isa;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else if (v4 && [(UIVibrancyEffect *)v4 isMemberOfClass:objc_opt_class()])
  {
    char v6 = [p_isa[1] isEqual:self->_impl];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (id)darkVibrantEffectWithDodgeColor:(id)a3 lightenColor:(id)a4 compositingColor:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  long long v11 = [_UIVibrancyEffectModernVibrancyImpl alloc];
  long long v12 = [(_UIVibrancyEffectModernVibrancyImpl *)v11 initWithFilter:*MEMORY[0x1E4F3A368] inputColor1:v10 inputColor2:v9 compositingColor:v8 inputReversed:0];

  long long v13 = (void *)[objc_alloc((Class)a1) _initWithImplementation:v12];
  return v13;
}

+ (id)lightVibrantEffectWithBurnColor:(id)a3 darkenColor:(id)a4 compositingColor:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  long long v11 = [_UIVibrancyEffectModernVibrancyImpl alloc];
  long long v12 = [(_UIVibrancyEffectModernVibrancyImpl *)v11 initWithFilter:*MEMORY[0x1E4F3A360] inputColor1:v10 inputColor2:v9 compositingColor:v8 inputReversed:0];

  long long v13 = (void *)[objc_alloc((Class)a1) _initWithImplementation:v12];
  return v13;
}

+ (id)vibrantEffectWithCompositingMode:(int64_t)a3 compositingColor:(id)a4
{
  id v6 = a4;
  v7 = [[_UIVibrancyEffectModernCompositedImpl alloc] initWithCompositingMode:a3 compositingColor:v6];

  id v8 = (void *)[objc_alloc((Class)a1) _initWithImplementation:v7];
  return v8;
}

+ (id)_darkVibrantEffectWithLightenColor:(id)a3 dodgeColor:(id)a4 compositingColor:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  long long v11 = [_UIVibrancyEffectModernVibrancyImpl alloc];
  long long v12 = [(_UIVibrancyEffectModernVibrancyImpl *)v11 initWithFilter:*MEMORY[0x1E4F3A368] inputColor1:v9 inputColor2:v10 compositingColor:v8 inputReversed:1];

  long long v13 = (void *)[objc_alloc((Class)a1) _initWithImplementation:v12];
  return v13;
}

+ (id)_lightVibrantEffectWithDarkenColor:(id)a3 burnColor:(id)a4 compositingColor:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  long long v11 = [_UIVibrancyEffectModernVibrancyImpl alloc];
  long long v12 = [(_UIVibrancyEffectModernVibrancyImpl *)v11 initWithFilter:*MEMORY[0x1E4F3A360] inputColor1:v9 inputColor2:v10 compositingColor:v8 inputReversed:1];

  long long v13 = (void *)[objc_alloc((Class)a1) _initWithImplementation:v12];
  return v13;
}

+ (id)_vibrantEffectWithCAColorMatrix:(CAColorMatrix *)a3 alpha:(double)a4
{
  v7 = [_UIVibrancyEffectVibrantColorMatrixImpl alloc];
  long long v8 = *(_OWORD *)&a3->m33;
  v13[2] = *(_OWORD *)&a3->m24;
  v13[3] = v8;
  v13[4] = *(_OWORD *)&a3->m42;
  long long v9 = *(_OWORD *)&a3->m15;
  v13[0] = *(_OWORD *)&a3->m11;
  v13[1] = v9;
  id v10 = [(_UIVibrancyEffectVibrantColorMatrixImpl *)v7 initWithCAColorMatrix:v13 alpha:a4];
  long long v11 = (void *)[objc_alloc((Class)a1) _initWithImplementation:v10];

  return v11;
}

+ (id)_vibrantShadowEffect
{
  v4[0] = xmmword_186B93200;
  v4[1] = xmmword_186B93210;
  v4[2] = xmmword_186B93220;
  v4[3] = xmmword_186B93230;
  v4[4] = xmmword_186B93240;
  v2 = [a1 _vibrantEffectWithCAColorMatrix:v4 alpha:1.0];
  return v2;
}

+ (id)vibrantMediumShadowEffect
{
  v3 = [[_UIVibrancyEffectVibrantColorMatrixImpl alloc] initWithSystemName:1];
  v4 = (void *)[objc_alloc((Class)a1) _initWithImplementation:v3];

  return v4;
}

+ (id)vibrantHeavyShadowEffect
{
  v3 = [[_UIVibrancyEffectVibrantColorMatrixImpl alloc] initWithSystemName:2];
  v4 = (void *)[objc_alloc((Class)a1) _initWithImplementation:v3];

  return v4;
}

+ (id)vibrantChromeShadowEffect
{
  v3 = [[_UIVibrancyEffectVibrantColorMatrixImpl alloc] initWithSystemName:3];
  v4 = (void *)[objc_alloc((Class)a1) _initWithImplementation:v3];

  return v4;
}

+ (id)_vibrantEffectForLightMaterial:(id)a3 darkMaterial:(id)a4 vibrancyStyle:(int64_t)a5
{
  id v8 = a4;
  uint64_t v9 = _UICoreMaterialSanitizeMaterial(a3);
  uint64_t v10 = _UICoreMaterialSanitizeMaterial(v8);

  if (v9 | v10)
  {
    long long v12 = [[_UIVibrancyEffectCoreMaterialImpl alloc] initWithLightMaterial:v9 darkMaterial:v10 vibrancyStyle:_UIVibrancyStyleConvertToPublic(a5)];
    long long v11 = (void *)[objc_alloc((Class)a1) _initWithImplementation:v12];
  }
  else
  {
    long long v11 = 0;
  }

  return v11;
}

+ (id)_effectWithStyle:(int64_t)a3 ignoreSimpleVibrancy:(BOOL)a4
{
  id v5 = [[_UIVibrancyEffectLegacyImpl alloc] initWithStyle:a3 invertAutomaticStyle:0 ignoreSimpleVibrancy:a4];
  id v6 = (void *)[objc_alloc((Class)a1) _initWithImplementation:v5];

  return v6;
}

- (id)_effectReplacingTintColor:(id)a3
{
  if (a3)
  {
    -[_UIVibrancyEffectImpl implementationReplacingTintColor:](self->_impl, "implementationReplacingTintColor:");
    v4 = (_UIVibrancyEffectImpl *)objc_claimAutoreleasedReturnValue();
    if (self->_impl == v4) {
      id v5 = self;
    }
    else {
      id v5 = (UIVibrancyEffect *)[objc_alloc((Class)objc_opt_class()) _initWithImplementation:v4];
    }
    id v6 = v5;
  }
  else
  {
    id v6 = self;
  }
  return v6;
}

- (UIVibrancyEffect)init
{
  uint64_t v3 = [(UIVibrancyEffect *)self methodForSelector:sel_effectConfig];
  if (v3 == +[UIVibrancyEffect instanceMethodForSelector:](UIVibrancyEffect, "instanceMethodForSelector:", sel_effectConfig)&& (uint64_t v4 = [(UIVibrancyEffect *)self methodForSelector:sel_effectConfigForQuality_], v4 == +[UIVibrancyEffect instanceMethodForSelector:sel_effectConfigForQuality_]))
  {
    id v8 = [_UIVibrancyEffectModernVibrancyImpl alloc];
    uint64_t v9 = *MEMORY[0x1E4F3A368];
    uint64_t v10 = +[UIColor clearColor];
    long long v11 = +[UIColor clearColor];
    long long v12 = +[UIColor clearColor];
    id v5 = [(_UIVibrancyEffectModernVibrancyImpl *)v8 initWithFilter:v9 inputColor1:v10 inputColor2:v11 compositingColor:v12 inputReversed:0];
  }
  else
  {
    id v5 = [[_UIVibrancyEffectLegacyImpl alloc] initWithStyle:0x8000000000000000 invertAutomaticStyle:0];
  }
  id v6 = [(UIVibrancyEffect *)self _initWithImplementation:v5];

  return v6;
}

- (UIVibrancyEffect)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIVibrancyEffect;
  id v5 = [(UIVisualEffect *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = +[_UIVibrancyEffectImpl implementationFromCoder:v4];
    impl = v5->_impl;
    v5->_impl = (_UIVibrancyEffectImpl *)v6;

    [(_UIVibrancyEffectImpl *)v5->_impl setEffect:v5];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIVibrancyEffect;
  id v4 = a3;
  [(UIVisualEffect *)&v5 encodeWithCoder:v4];
  -[_UIVibrancyEffectImpl encodeWithCoder:](self->_impl, "encodeWithCoder:", v4, v5.receiver, v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return [(_UIVibrancyEffectImpl *)self->_impl hash];
}

- (id)_reduceTransparencyEffectConfig
{
  uint64_t v3 = +[_UILegacyEffectConverter sharedConverter];
  id v4 = objc_msgSend(v3, "vibrancyConfigForReducedTransperancyVibrancyStyle:", -[_UIVibrancyEffectImpl style](self->_impl, "style"));

  return v4;
}

- (id)effectConfigForQuality:(int64_t)a3
{
  objc_super v5 = +[_UILegacyEffectConverter sharedConverter];
  int64_t v6 = [(_UIVibrancyEffectImpl *)self->_impl style];
  if (a3 == 10) {
    [v5 vibrancyConfigForLowQualityVibrancyStyle:v6];
  }
  else {
  v7 = [v5 vibrancyConfigForHighQualityVibrancyStyle:v6];
  }

  return v7;
}

- (id)effectConfig
{
  return [(UIVibrancyEffect *)self effectConfigForReducedTransperancy:0];
}

- (id)effectConfigForReducedTransperancy:(BOOL)a3
{
  BOOL v3 = a3;
  _AXSEnhanceBackgroundContrastEnabled();
  if (v3)
  {
    objc_super v5 = [(UIVibrancyEffect *)self _reduceTransparencyEffectConfig];
  }
  else
  {
    int64_t v6 = +[UIDevice currentDevice];
    objc_super v5 = -[UIVibrancyEffect effectConfigForQuality:](self, "effectConfigForQuality:", [v6 _graphicsQuality]);
  }
  return v5;
}

+ (id)_vibrancyEntryWithType:(id)a3 inputColor1:(id)a4 inputColor2:(id)a5 inputReversed:(BOOL)a6
{
  BOOL v6 = a6;
  v20[3] = *MEMORY[0x1E4F143B8];
  v19[0] = @"inputColor0";
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  v20[0] = [v9 CGColor];
  v19[1] = @"inputColor1";
  id v12 = v10;
  uint64_t v13 = [v12 CGColor];

  v20[1] = v13;
  v19[2] = @"inputReversed";
  v14 = [NSNumber numberWithBool:v6];
  v20[2] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

  v16 = [_UIVisualEffectFilterEntry alloc];
  v17 = [(_UIVisualEffectFilterEntry *)v16 initWithFilterType:v11 configurationValues:v15 requestedValues:MEMORY[0x1E4F1CC08] identityValues:MEMORY[0x1E4F1CC08]];

  return v17;
}

- (BOOL)_isATVStyle
{
  return [(_UIVibrancyEffectImpl *)self->_impl style] > 3999;
}

- (BOOL)_isAutomaticStyle
{
  int64_t v2 = [(_UIVibrancyEffectImpl *)self->_impl style];
  BOOL result = 1;
  if ((unint64_t)(v2 - 4) >= 2 && v2 != 1000) {
    return v2 > 4999;
  }
  return result;
}

- (id)effectForUserInterfaceStyle:(int64_t)a3
{
  -[_UIVibrancyEffectImpl implementationForUserInterfaceStyle:](self->_impl, "implementationForUserInterfaceStyle:");
  objc_super v5 = (_UIVibrancyEffectImpl *)objc_claimAutoreleasedReturnValue();
  if (v5 == self->_impl)
  {
    v9.receiver = self;
    v9.super_class = (Class)UIVibrancyEffect;
    uint64_t v6 = [(UIVisualEffect *)&v9 effectForUserInterfaceStyle:a3];
  }
  else
  {
    uint64_t v6 = [objc_alloc((Class)objc_opt_class()) _initWithImplementation:v5];
  }
  v7 = (void *)v6;

  return v7;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)UIVibrancyEffect;
  BOOL v3 = [(UIVibrancyEffect *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  [(_UIVibrancyEffectImpl *)self->_impl appendDescriptionTo:v4];
  return v4;
}

- (int64_t)_blurStyle
{
  return [(_UIVibrancyEffectImpl *)self->_impl style];
}

- (int64_t)_vibrancyStyle
{
  return [(_UIVibrancyEffectImpl *)self->_impl vibrancyStyle];
}

@end