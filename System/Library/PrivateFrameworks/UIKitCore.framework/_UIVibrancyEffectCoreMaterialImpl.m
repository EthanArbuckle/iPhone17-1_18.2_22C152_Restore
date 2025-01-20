@interface _UIVibrancyEffectCoreMaterialImpl
- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5;
- (BOOL)invertAutomaticStyle;
- (BOOL)isEqual:(id)a3;
- (_UIVibrancyEffectCoreMaterialImpl)initWithLightMaterial:(id)a3 darkMaterial:(id)a4 vibrancyStyle:(int64_t)a5;
- (_UIVibrancyEffectCoreMaterialImpl)initWithStyle:(int64_t)a3 vibrancyStyle:(int64_t)a4;
- (int64_t)style;
- (int64_t)vibrancyStyle;
- (unint64_t)hash;
- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5;
- (void)appendDescriptionTo:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIVibrancyEffectCoreMaterialImpl

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  int64_t blurStyle = self->_blurStyle;
  if (blurStyle == 0x8000000000000000)
  {
    id v8 = a4;
    id v9 = a3;
    v10 = [v8 traitCollection];
    uint64_t v11 = [v10 userInterfaceStyle];
    uint64_t v12 = 19;
    if (v11 == 2) {
      uint64_t v12 = 20;
    }
    id v13 = *(id *)((char *)&self->super.super.isa + OBJC_IVAR____UIVibrancyEffectLegacyImpl__style[v12]);

    _UICoreMaterialUpdateVibrancyEffectDescriptorForMTMaterial(v13, self->_vibrancyStyle, v8, v9);
  }
  else
  {
    _UICoreMaterialUpdateVibrancyEffectDescriptor(blurStyle, self->_vibrancyStyle, a4, a3);
  }
}

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  int64_t blurStyle = self->_blurStyle;
  if (blurStyle != 0x8000000000000000)
  {
    if (_UICoreMaterialStyleNeedsUpdateForEnvironmentChange(blurStyle, v8, v9)) {
      goto LABEL_3;
    }
LABEL_5:
    v13.receiver = self;
    v13.super_class = (Class)_UIVibrancyEffectCoreMaterialImpl;
    BOOL v11 = [(_UIVibrancyEffectImpl *)&v13 _needsUpdateForTransitionFromEnvironment:v8 toEnvironment:v9 usage:a5];
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

- (_UIVibrancyEffectCoreMaterialImpl)initWithStyle:(int64_t)a3 vibrancyStyle:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIVibrancyEffectCoreMaterialImpl;
  result = [(_UIVibrancyEffectCoreMaterialImpl *)&v7 init];
  if (result)
  {
    result->_int64_t blurStyle = a3;
    result->_vibrancyStyle = a4;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkMaterial, 0);
  objc_storeStrong((id *)&self->_lightMaterial, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (id *)v4;
    v6 = v5;
    if (v5[1] == self->_blurStyle && v5[2] == self->_vibrancyStyle)
    {
      lightMaterial = self->_lightMaterial;
      id v8 = (NSString *)v5[3];
      id v9 = lightMaterial;
      if (v8 == v9)
      {

        goto LABEL_14;
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
        char v12 = 0;
LABEL_20:

        goto LABEL_21;
      }
      int v13 = [(NSString *)v8 isEqual:v9];

      if (v13)
      {
LABEL_14:
        darkMaterial = self->_darkMaterial;
        id v8 = (NSString *)v6[4];
        v15 = darkMaterial;
        if (v8 == v15)
        {
          char v12 = 1;
          v10 = v8;
        }
        else
        {
          v10 = v15;
          char v12 = 0;
          if (v8 && v15) {
            char v12 = [(NSString *)v8 isEqual:v15];
          }
        }
        goto LABEL_20;
      }
    }
    char v12 = 0;
LABEL_21:

    goto LABEL_22;
  }
  char v12 = 0;
LABEL_22:

  return v12;
}

- (_UIVibrancyEffectCoreMaterialImpl)initWithLightMaterial:(id)a3 darkMaterial:(id)a4 vibrancyStyle:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_UIVibrancyEffectCoreMaterialImpl;
  v10 = [(_UIVibrancyEffectCoreMaterialImpl *)&v15 init];
  BOOL v11 = v10;
  if (v10)
  {
    v10->_int64_t blurStyle = 0x8000000000000000;
    v10->_vibrancyStyle = a5;
    if (v8) {
      char v12 = v8;
    }
    else {
      char v12 = v9;
    }
    objc_storeStrong((id *)&v10->_lightMaterial, v12);
    if (v9) {
      int v13 = v9;
    }
    else {
      int v13 = v8;
    }
    objc_storeStrong((id *)&v11->_darkMaterial, v13);
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (self->_blurStyle != 0x8000000000000000)
  {
    id v5 = v4;
    [v4 encodeInteger:self->_vibrancyStyle forKey:@"UIVibrancyEffectVibrancyStyle"];
    [v5 encodeInteger:self->_blurStyle forKey:@"UIVibrancyEffectBlurMaterialStyle"];
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    _UIStyledEffectFallbackStylesForCoreMaterialStyle(self->_blurStyle, &v7, &v6);
    if (v7 != 0x8000000000000000) {
      [v5 encodeInteger:v7 forKey:@"UIVibrancyEffectBlurAutomaticStyle"];
    }
    if (v6 != 0x8000000000000000) {
      [v5 encodeInteger:v6 forKey:@"UIVibrancyEffectBlurStyle"];
    }
    id v4 = v5;
  }
}

- (unint64_t)hash
{
  return self->_vibrancyStyle ^ self->_blurStyle;
}

- (int64_t)style
{
  return self->_blurStyle;
}

- (int64_t)vibrancyStyle
{
  return self->_vibrancyStyle;
}

- (BOOL)invertAutomaticStyle
{
  return 0;
}

- (void)appendDescriptionTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_blurStyle == 0x8000000000000000)
  {
    [v4 appendFormat:@" lightMaterial=%@ darkMaterial=%@", self->_lightMaterial, self->_darkMaterial];
  }
  else
  {
    [v4 appendString:@" style="];
    id v5 = _UIStyledEffectConvertToString(self->_blurStyle);
    [v8 appendString:v5];
  }
  [v8 appendString:@" vibrancyStyle="];
  unint64_t vibrancyStyle = self->_vibrancyStyle;
  if (vibrancyStyle >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%li)", self->_vibrancyStyle);
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v7 = off_1E52DD2A0[vibrancyStyle];
  }
  [v8 appendString:v7];
}

@end