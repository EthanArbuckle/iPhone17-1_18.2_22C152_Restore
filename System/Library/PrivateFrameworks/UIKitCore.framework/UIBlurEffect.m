@interface UIBlurEffect
+ (BOOL)supportsSecureCoding;
+ (UIBlurEffect)effectWithBlurRadius:(double)a3;
+ (UIBlurEffect)effectWithStyle:(UIBlurEffectStyle)style;
+ (UIBlurEffect)effectWithVariableBlurRadius:(double)a3 imageMask:(id)a4;
+ (id)_effectForLightMaterial:(id)a3 darkMaterial:(id)a4 bundle:(id)a5;
+ (id)_effectWithBlurRadius:(double)a3 scale:(double)a4;
+ (id)_effectWithInfiniteRadius;
+ (id)_effectWithInfiniteRadiusScale:(double)a3;
+ (id)_effectWithStyle:(int64_t)a3 invertAutomaticStyle:(BOOL)a4;
+ (id)_effectWithStyle:(int64_t)a3 tintColor:(id)a4 invertAutomaticStyle:(BOOL)a5;
+ (id)_effectWithTintColor:(id)a3;
+ (id)_effectWithVariableBlurRadius:(double)a3 imageMask:(id)a4 scale:(double)a5;
+ (id)_effectWithVariableBlurRadius:(double)a3 imageMask:(id)a4 scale:(double)a5 allowingAXAdaptation:(BOOL)a6;
- (BOOL)_canProvideCoreMaterialVibrancyEffect;
- (BOOL)_canProvideVibrancyEffect;
- (BOOL)_invertAutomaticStyle;
- (BOOL)_isATVStyle;
- (BOOL)_isAutomaticStyle;
- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (UIBlurEffect)init;
- (UIBlurEffect)initWithCoder:(id)a3;
- (UIColor)_tintColor;
- (id)_initWithImplementation:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)effectForUserInterfaceStyle:(int64_t)a3;
- (id)effectSettings;
- (int64_t)_expectedUsage;
- (int64_t)_style;
- (unint64_t)hash;
- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UIBlurEffect

- (void).cxx_destruct
{
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  id v10 = a3;
  impl = self->_impl;
  id v9 = a4;
  [(_UIBlurEffectImpl *)impl _updateEffectDescriptor:v10 forEnvironment:v9 usage:a5];
  LODWORD(impl) = [v9 allowsBlurring];

  if (impl) {
    [v10 setDisableInPlaceFiltering:1];
  }
  if (a5 == 1)
  {
    [v10 setAllowsVibrancyInContent:1];
    [v10 setLayerHitTestsAsOpaque:1];
  }
}

- (id)effectSettings
{
  v3 = +[_UILegacyEffectConverter sharedConverter];
  v4 = objc_msgSend(v3, "backdropSettingsForBlurStyle:", -[_UIBlurEffectImpl style](self->_impl, "style"));

  return v4;
}

- (id)effectForUserInterfaceStyle:(int64_t)a3
{
  -[_UIBlurEffectImpl implementationForUserInterfaceStyle:](self->_impl, "implementationForUserInterfaceStyle:");
  v5 = (_UIBlurEffectImpl *)objc_claimAutoreleasedReturnValue();
  if (v5 == self->_impl)
  {
    v9.receiver = self;
    v9.super_class = (Class)UIBlurEffect;
    uint64_t v6 = [(UIVisualEffect *)&v9 effectForUserInterfaceStyle:a3];
  }
  else
  {
    uint64_t v6 = [objc_alloc((Class)objc_opt_class()) _initWithImplementation:v5];
  }
  v7 = (void *)v6;

  return v7;
}

+ (id)_effectWithStyle:(int64_t)a3 tintColor:(id)a4 invertAutomaticStyle:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  if ((a3 & 0xFFFFFFFFFFFFFFFCLL) == 0x4B0 || (unint64_t)(a3 - 6) < 0xF || (unint64_t)(a3 - 1100) <= 2)
  {
    id v10 = [[_UIBlurEffectCoreMaterialImpl alloc] initWithStyle:a3];
    id v11 = objc_alloc((Class)a1);
  }
  else
  {
    id v9 = objc_alloc((Class)a1);
    id v10 = [[_UIBlurEffectLegacyImpl alloc] initWithStyle:a3 tintColor:v8 invertAutomaticStyle:v5];
    id v11 = v9;
  }
  v12 = (void *)[v11 _initWithImplementation:v10];

  return v12;
}

- (id)_initWithImplementation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIBlurEffect;
  uint64_t v6 = [(UIBlurEffect *)&v9 init];
  p_isa = (id *)&v6->super.super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_impl, a3);
    [p_isa[1] setEffect:p_isa];
  }

  return p_isa;
}

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5
{
  return [(_UIBlurEffectImpl *)self->_impl _needsUpdateForTransitionFromEnvironment:a3 toEnvironment:a4 usage:a5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ([(_UIBlurEffectImpl *)self->_impl requiresCopying])
  {
    id v3 = objc_alloc((Class)objc_opt_class());
    v4 = (void *)[(_UIBlurEffectImpl *)self->_impl copy];
    id v5 = (void *)[v3 _initWithImplementation:v4];

    return v5;
  }
  else
  {
    return self;
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UIBlurEffect *)a3;
  p_isa = (id *)&v4->super.super.isa;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else if (v4 && [(UIBlurEffect *)v4 isMemberOfClass:objc_opt_class()])
  {
    char v6 = [p_isa[1] isEqual:self->_impl];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)_canProvideVibrancyEffect
{
  return [(_UIBlurEffectImpl *)self->_impl canProvideVibrancyEffect];
}

- (BOOL)_canProvideCoreMaterialVibrancyEffect
{
  return [(_UIBlurEffectImpl *)self->_impl canProvideCoreMaterialVibrancyEffect];
}

- (int64_t)_style
{
  return [(_UIBlurEffectImpl *)self->_impl style];
}

- (BOOL)_invertAutomaticStyle
{
  return [(_UIBlurEffectImpl *)self->_impl invertAutomaticStyle];
}

+ (UIBlurEffect)effectWithStyle:(UIBlurEffectStyle)style
{
  return (UIBlurEffect *)[a1 _effectWithStyle:style tintColor:0 invertAutomaticStyle:0];
}

+ (id)_effectWithBlurRadius:(double)a3 scale:(double)a4
{
  id v6 = objc_alloc((Class)a1);
  v7 = [[_UIBlurEffectModernImpl alloc] initWithBlurRadius:a3 scale:a4];
  id v8 = (void *)[v6 _initWithImplementation:v7];

  return v8;
}

+ (UIBlurEffect)effectWithBlurRadius:(double)a3
{
  id v4 = objc_alloc((Class)a1);
  id v5 = [[_UIBlurEffectModernImpl alloc] initWithBlurRadius:a3 scale:0.0];
  id v6 = (void *)[v4 _initWithImplementation:v5];

  return (UIBlurEffect *)v6;
}

- (int64_t)_expectedUsage
{
  return 1;
}

+ (id)_effectWithTintColor:(id)a3
{
  return (id)[a1 _effectWithStyle:100 tintColor:a3 invertAutomaticStyle:0];
}

+ (UIBlurEffect)effectWithVariableBlurRadius:(double)a3 imageMask:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc((Class)a1);
  id v8 = [[_UIBlurEffectVariableImpl alloc] initWithBaseRadius:v6 imageMask:1 scale:a3 allowAXAdaptation:0.0];

  objc_super v9 = (void *)[v7 _initWithImplementation:v8];
  return (UIBlurEffect *)v9;
}

+ (id)_effectWithStyle:(int64_t)a3 invertAutomaticStyle:(BOOL)a4
{
  return (id)[a1 _effectWithStyle:a3 tintColor:0 invertAutomaticStyle:a4];
}

+ (id)_effectWithVariableBlurRadius:(double)a3 imageMask:(id)a4 scale:(double)a5
{
  id v8 = a4;
  id v9 = objc_alloc((Class)a1);
  id v10 = [[_UIBlurEffectVariableImpl alloc] initWithBaseRadius:v8 imageMask:1 scale:a3 allowAXAdaptation:a5];

  id v11 = (void *)[v9 _initWithImplementation:v10];
  return v11;
}

+ (id)_effectWithVariableBlurRadius:(double)a3 imageMask:(id)a4 scale:(double)a5 allowingAXAdaptation:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = objc_alloc((Class)a1);
  v12 = [[_UIBlurEffectVariableImpl alloc] initWithBaseRadius:v10 imageMask:v6 scale:a3 allowAXAdaptation:a5];

  v13 = (void *)[v11 _initWithImplementation:v12];
  return v13;
}

+ (id)_effectForLightMaterial:(id)a3 darkMaterial:(id)a4 bundle:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = _UICoreMaterialSanitizeMaterial(a3);
  uint64_t v11 = _UICoreMaterialSanitizeMaterial(v9);

  if (v10 | v11)
  {
    v13 = [[_UIBlurEffectCoreMaterialImpl alloc] initWithLightMaterial:v10 darkMaterial:v11 bundle:v8];
    v12 = (void *)[objc_alloc((Class)a1) _initWithImplementation:v13];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)_effectWithInfiniteRadius
{
  id v2 = objc_alloc((Class)a1);
  id v3 = +[_UIBlurEffectAverageImpl sharedInstance];
  id v4 = (void *)[v2 _initWithImplementation:v3];

  return v4;
}

+ (id)_effectWithInfiniteRadiusScale:(double)a3
{
  id v4 = objc_alloc((Class)a1);
  id v5 = [[_UIBlurEffectAverageImpl alloc] initWithScale:a3];
  BOOL v6 = (void *)[v4 _initWithImplementation:v5];

  return v6;
}

- (UIBlurEffect)init
{
  uint64_t v3 = [(UIBlurEffect *)self methodForSelector:sel_effectSettings];
  if (v3 == +[UIBlurEffect instanceMethodForSelector:sel_effectSettings])id v4 = [[_UIBlurEffectModernImpl alloc] initWithBlurRadius:0.0 scale:0.0]; {
  else
  }
    id v4 = [[_UIBlurEffectLegacyImpl alloc] initWithStyle:0x8000000000000000 tintColor:0 invertAutomaticStyle:0];
  id v5 = v4;
  BOOL v6 = [(UIBlurEffect *)self _initWithImplementation:v4];

  return v6;
}

- (UIBlurEffect)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIBlurEffect;
  id v5 = [(UIVisualEffect *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = +[_UIBlurEffectImpl implementationFromCoder:v4];
    impl = v5->_impl;
    v5->_impl = (_UIBlurEffectImpl *)v6;

    [(_UIBlurEffectImpl *)v5->_impl setEffect:v5];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIBlurEffect;
  id v4 = a3;
  [(UIVisualEffect *)&v5 encodeWithCoder:v4];
  -[_UIBlurEffectImpl encodeWithCoder:](self->_impl, "encodeWithCoder:", v4, v5.receiver, v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return [(_UIBlurEffectImpl *)self->_impl hash];
}

- (UIColor)_tintColor
{
  return (UIColor *)[(_UIBlurEffectImpl *)self->_impl tintColor];
}

- (BOOL)_isATVStyle
{
  return [(_UIBlurEffectImpl *)self->_impl style] > 3999;
}

- (BOOL)_isAutomaticStyle
{
  int64_t v2 = [(_UIBlurEffectImpl *)self->_impl style];
  BOOL result = 1;
  if ((unint64_t)(v2 - 4) >= 2 && v2 != 1000) {
    return v2 > 4999;
  }
  return result;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)UIBlurEffect;
  uint64_t v3 = [(UIBlurEffect *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  [(_UIBlurEffectImpl *)self->_impl appendDescriptionTo:v4];
  return v4;
}

@end