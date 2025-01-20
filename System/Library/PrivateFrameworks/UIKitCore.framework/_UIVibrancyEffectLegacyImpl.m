@interface _UIVibrancyEffectLegacyImpl
- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5;
- (BOOL)invertAutomaticStyle;
- (BOOL)isEqual:(id)a3;
- (UIVibrancyEffect)effect;
- (_UIVibrancyEffectLegacyImpl)initWithStyle:(int64_t)a3 invertAutomaticStyle:(BOOL)a4;
- (_UIVibrancyEffectLegacyImpl)initWithStyle:(int64_t)a3 invertAutomaticStyle:(BOOL)a4 ignoreSimpleVibrancy:(BOOL)a5;
- (id)implementationForUserInterfaceStyle:(int64_t)a3;
- (int64_t)style;
- (unint64_t)hash;
- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5;
- (void)appendDescriptionTo:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEffect:(id)a3;
@end

@implementation _UIVibrancyEffectLegacyImpl

- (void)setEffect:(id)a3
{
  self->_effect = (UIVibrancyEffect *)a3;
}

- (_UIVibrancyEffectLegacyImpl)initWithStyle:(int64_t)a3 invertAutomaticStyle:(BOOL)a4 ignoreSimpleVibrancy:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)_UIVibrancyEffectLegacyImpl;
  result = [(_UIVibrancyEffectLegacyImpl *)&v9 init];
  if (result)
  {
    result->_style = a3;
    result->_invertAutomaticStyle = a4;
    result->_ignoreSimpleVibrancy = a5;
  }
  return result;
}

- (_UIVibrancyEffectLegacyImpl)initWithStyle:(int64_t)a3 invertAutomaticStyle:(BOOL)a4
{
  return [(_UIVibrancyEffectLegacyImpl *)self initWithStyle:a3 invertAutomaticStyle:a4 ignoreSimpleVibrancy:0];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int64_t style = self->_style;
  id v7 = v4;
  if ((unint64_t)(style - 4) < 2 || (style != 1000 ? (BOOL v6 = style < 5000) : (BOOL v6 = 0), !v6))
  {
    objc_msgSend(v4, "encodeInteger:forKey:");
    int64_t style = _UIStyledEffectConvertAutomaticStyle(self->_style, 1, 0);
    id v4 = v7;
  }
  [v4 encodeInteger:style forKey:@"UIVibrancyEffectBlurStyle"];
}

- (unint64_t)hash
{
  return self->_style;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && *((void *)v4 + 1) == self->_style
    && v4[16] == self->_invertAutomaticStyle;

  return v5;
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)invertAutomaticStyle
{
  return self->_invertAutomaticStyle;
}

- (id)implementationForUserInterfaceStyle:(int64_t)a3
{
  id v4 = self;
  uint64_t style = v4->_style;
  if ((unint64_t)(style - 4) < 2 || (style != 1000 ? (BOOL v6 = style < 5000) : (BOOL v6 = 0), !v6))
  {
    id v7 = [[_UIVibrancyEffectLegacyImpl alloc] initWithStyle:_UIStyledEffectConvertAutomaticStyle(v4->_style, a3, v4->_invertAutomaticStyle) invertAutomaticStyle:0];

    id v4 = v7;
  }
  return v4;
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  id v14 = a4;
  effect = self->_effect;
  id v8 = a3;
  objc_super v9 = [v14 traitCollection];
  v10 = -[UIVibrancyEffect effectForUserInterfaceStyle:](effect, "effectForUserInterfaceStyle:", [v9 userInterfaceStyle]);

  if ([v14 reducedTransperancy]) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = [v14 useSimpleVibrancy];
  }
  v12 = [v10 effectConfigForReducedTransperancy:v11];
  v13 = +[_UILegacyEffectConverter sharedConverter];
  [v13 applyVibrancyConfig:v12 toEffectDescriptor:v8];

  [v8 setContentViewRequiresClipping:1];
}

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  int64_t style = self->_style;
  if ((unint64_t)(style - 4) >= 2 && style != 1000 && style < 5000) {
    goto LABEL_7;
  }
  v12 = [v8 traitCollection];
  uint64_t v13 = [v12 userInterfaceStyle];
  id v14 = [v9 traitCollection];
  uint64_t v15 = [v14 userInterfaceStyle];

  if (v13 == v15)
  {
LABEL_7:
    v18.receiver = self;
    v18.super_class = (Class)_UIVibrancyEffectLegacyImpl;
    BOOL v16 = [(_UIVibrancyEffectImpl *)&v18 _needsUpdateForTransitionFromEnvironment:v8 toEnvironment:v9 usage:a5];
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

- (void)appendDescriptionTo:(id)a3
{
  id v5 = a3;
  [v5 appendString:@" style="];
  id v4 = _UIStyledEffectConvertToString(self->_style);
  [v5 appendString:v4];

  if (self->_invertAutomaticStyle) {
    [v5 appendString:@" invertedAutomaticStyle"];
  }
}

- (UIVibrancyEffect)effect
{
  return self->_effect;
}

@end