@interface _UIBlurEffectCoreMaterialImpl
- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5;
- (BOOL)canProvideCoreMaterialVibrancyEffect;
- (BOOL)canProvideVibrancyEffect;
- (BOOL)invertAutomaticStyle;
- (BOOL)isEqual:(id)a3;
- (_UIBlurEffectCoreMaterialImpl)initWithLightMaterial:(id)a3 darkMaterial:(id)a4 bundle:(id)a5;
- (_UIBlurEffectCoreMaterialImpl)initWithStyle:(int64_t)a3;
- (id)tintColor;
- (int64_t)style;
- (unint64_t)hash;
- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5;
- (void)appendDescriptionTo:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIBlurEffectCoreMaterialImpl

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  int64_t style = self->_style;
  id v8 = a4;
  id v13 = a3;
  if (style == 0x8000000000000000)
  {
    v9 = [v8 traitCollection];
    uint64_t v10 = [v9 userInterfaceStyle];
    uint64_t v11 = 11;
    if (v10 == 2) {
      uint64_t v11 = 12;
    }
    id v12 = *(id *)((char *)&self->super.super.isa + OBJC_IVAR____UIBlurEffectLegacyImpl__style[v11]);

    _UICoreMaterialUpdateBlurEffectDescriptorForMTMaterial(v12, self->_bundle, v8, v13);
  }
  else
  {
    _UICoreMaterialUpdateBlurEffectDescriptor(style, v8, v13);
  }
}

- (_UIBlurEffectCoreMaterialImpl)initWithStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIBlurEffectCoreMaterialImpl;
  result = [(_UIBlurEffectCoreMaterialImpl *)&v5 init];
  if (result) {
    result->_int64_t style = a3;
  }
  return result;
}

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  int64_t style = self->_style;
  if (style != 0x8000000000000000)
  {
    if (_UICoreMaterialStyleNeedsUpdateForEnvironmentChange(style, v8, v9)) {
      goto LABEL_3;
    }
LABEL_5:
    v13.receiver = self;
    v13.super_class = (Class)_UIBlurEffectCoreMaterialImpl;
    BOOL v11 = [(_UIBlurEffectImpl *)&v13 _needsUpdateForTransitionFromEnvironment:v8 toEnvironment:v9 usage:a5];
    goto LABEL_6;
  }
  if (self->_lightMaterial == self->_darkMaterial) {
    goto LABEL_5;
  }
LABEL_3:
  BOOL v11 = 1;
LABEL_6:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_darkMaterial, 0);
  objc_storeStrong((id *)&self->_lightMaterial, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    objc_super v5 = (id *)v4;
    v6 = v5;
    if (v5[1] == self->_style)
    {
      lightMaterial = self->_lightMaterial;
      id v8 = (NSString *)v5[2];
      id v9 = lightMaterial;
      if (v8 == v9)
      {

        goto LABEL_13;
      }
      uint64_t v10 = v9;
      if (v8) {
        BOOL v11 = v9 == 0;
      }
      else {
        BOOL v11 = 1;
      }
      if (v11)
      {
        char v12 = 0;
LABEL_19:

        goto LABEL_20;
      }
      int v13 = [(NSString *)v8 isEqual:v9];

      if (v13)
      {
LABEL_13:
        darkMaterial = self->_darkMaterial;
        id v8 = (NSString *)v6[3];
        v15 = darkMaterial;
        if (v8 == v15)
        {
          char v12 = 1;
          uint64_t v10 = v8;
        }
        else
        {
          uint64_t v10 = v15;
          char v12 = 0;
          if (v8 && v15) {
            char v12 = [(NSString *)v8 isEqual:v15];
          }
        }
        goto LABEL_19;
      }
    }
    char v12 = 0;
LABEL_20:

    goto LABEL_21;
  }
  char v12 = 0;
LABEL_21:

  return v12;
}

- (BOOL)canProvideVibrancyEffect
{
  return self->_style != 0x8000000000000000;
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)canProvideCoreMaterialVibrancyEffect
{
  return self->_style != 0x8000000000000000;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t style = self->_style;
  id v4 = a3;
  if (style != 0x8000000000000000)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    id v5 = v4;
    [v4 encodeInteger:style forKey:@"UIBlurEffectMaterialStyle"];
    _UIStyledEffectFallbackStylesForCoreMaterialStyle(style, &v7, &v6);
    if (v7 != 0x8000000000000000) {
      [v5 encodeInteger:v7 forKey:@"UIBlurEffectAutomaticStyle"];
    }
    if (v6 != 0x8000000000000000) {
      [v5 encodeInteger:v6 forKey:@"UIBlurEffectStyle"];
    }
    id v4 = v5;
  }
}

- (_UIBlurEffectCoreMaterialImpl)initWithLightMaterial:(id)a3 darkMaterial:(id)a4 bundle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_UIBlurEffectCoreMaterialImpl;
  BOOL v11 = [(_UIBlurEffectCoreMaterialImpl *)&v16 init];
  char v12 = v11;
  if (v11)
  {
    v11->_int64_t style = 0x8000000000000000;
    if (v8) {
      int v13 = v8;
    }
    else {
      int v13 = v9;
    }
    objc_storeStrong((id *)&v11->_lightMaterial, v13);
    if (v9) {
      v14 = v9;
    }
    else {
      v14 = v8;
    }
    objc_storeStrong((id *)&v12->_darkMaterial, v14);
    objc_storeStrong((id *)&v12->_bundle, a5);
  }

  return v12;
}

- (unint64_t)hash
{
  return self->_style;
}

- (id)tintColor
{
  return 0;
}

- (BOOL)invertAutomaticStyle
{
  return 0;
}

- (void)appendDescriptionTo:(id)a3
{
  int64_t style = self->_style;
  if (style == 0x8000000000000000)
  {
    lightMaterial = self->_lightMaterial;
    darkMaterial = self->_darkMaterial;
    id v7 = a3;
    [v7 appendFormat:@" lightMaterial=%@ darkMaterial=%@", lightMaterial, darkMaterial];
  }
  else
  {
    id v6 = a3;
    _UIStyledEffectConvertToString(style);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v6 appendFormat:@" style=%@", v7];
  }
}

@end