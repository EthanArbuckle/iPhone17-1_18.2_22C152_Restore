@interface _UIBlurEffectLegacyImpl
- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5;
- (BOOL)canProvideVibrancyEffect;
- (BOOL)invertAutomaticStyle;
- (BOOL)isEqual:(id)a3;
- (UIBlurEffect)effect;
- (_UIBlurEffectLegacyImpl)initWithStyle:(int64_t)a3 tintColor:(id)a4 invertAutomaticStyle:(BOOL)a5;
- (id)implementationForUserInterfaceStyle:(int64_t)a3;
- (id)tintColor;
- (int64_t)style;
- (unint64_t)hash;
- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5;
- (void)appendDescriptionTo:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEffect:(id)a3;
@end

@implementation _UIBlurEffectLegacyImpl

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  effect = self->_effect;
  id v8 = a4;
  id v9 = a3;
  v10 = [v8 traitCollection];
  -[UIBlurEffect effectForUserInterfaceStyle:](effect, "effectForUserInterfaceStyle:", [v10 userInterfaceStyle]);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  v11 = [v14 effectSettings];
  v12 = v11;
  if (self->_tintColor) {
    objc_msgSend(v11, "setColorTint:");
  }
  v13 = +[_UILegacyEffectConverter sharedConverter];
  [v13 applyBackdropSettings:v12 toEffectDescriptor:v9 environment:v8];
}

- (id)implementationForUserInterfaceStyle:(int64_t)a3
{
  v4 = self;
  uint64_t style = v4->_style;
  if ((unint64_t)(style - 4) < 2 || (style != 1000 ? (BOOL v6 = style < 5000) : (BOOL v6 = 0), !v6))
  {
    v7 = [[_UIBlurEffectLegacyImpl alloc] initWithStyle:_UIStyledEffectConvertAutomaticStyle(v4->_style, a3, v4->_invertAutomaticStyle) tintColor:v4->_tintColor invertAutomaticStyle:0];

    v4 = v7;
  }
  return v4;
}

- (void)setEffect:(id)a3
{
  self->_effect = (UIBlurEffect *)a3;
}

- (_UIBlurEffectLegacyImpl)initWithStyle:(int64_t)a3 tintColor:(id)a4 invertAutomaticStyle:(BOOL)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UIBlurEffectLegacyImpl;
  id v9 = [(_UIBlurEffectLegacyImpl *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_uint64_t style = a3;
    uint64_t v11 = [v8 copy];
    tintColor = v10->_tintColor;
    v10->_tintColor = (UIColor *)v11;

    v10->_invertAutomaticStyle = a5;
  }

  return v10;
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
  objc_super v14 = [v9 traitCollection];
  uint64_t v15 = [v14 userInterfaceStyle];

  if (v13 == v15)
  {
LABEL_7:
    v18.receiver = self;
    v18.super_class = (Class)_UIBlurEffectLegacyImpl;
    BOOL v16 = [(_UIBlurEffectImpl *)&v18 _needsUpdateForTransitionFromEnvironment:v8 toEnvironment:v9 usage:a5];
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    BOOL v6 = (unsigned __int8 *)v5;
    if (*((void *)v5 + 1) == self->_style)
    {
      tintColor = self->_tintColor;
      id v8 = (UIColor *)*((id *)v5 + 2);
      id v9 = tintColor;
      if (v8 == v9)
      {

LABEL_13:
        BOOL v12 = v6[24] == self->_invertAutomaticStyle;
LABEL_15:

        goto LABEL_16;
      }
      v10 = v9;
      if (v8) {
        BOOL v11 = v9 == 0;
      }
      else {
        BOOL v11 = 1;
      }
      if (v11)
      {
      }
      else
      {
        BOOL v13 = [(UIColor *)v8 isEqual:v9];

        if (v13) {
          goto LABEL_13;
        }
      }
    }
    BOOL v12 = 0;
    goto LABEL_15;
  }
  BOOL v12 = 0;
LABEL_16:

  return v12;
}

- (BOOL)canProvideVibrancyEffect
{
  return 1;
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)invertAutomaticStyle
{
  return self->_invertAutomaticStyle;
}

- (void).cxx_destruct
{
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
  [v4 encodeInteger:style forKey:@"UIBlurEffectStyle"];
}

- (unint64_t)hash
{
  return self->_style;
}

- (id)tintColor
{
  return self->_tintColor;
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
  if (self->_tintColor) {
    [v5 appendFormat:@" tintColor=%@", self->_tintColor];
  }
}

- (UIBlurEffect)effect
{
  return self->_effect;
}

@end