@interface _UIVibrancyEffectImpl
+ (id)implementationFromCoder:(id)a3;
- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5;
- (BOOL)invertAutomaticStyle;
- (BOOL)isEqual:(id)a3;
- (int64_t)style;
- (int64_t)vibrancyStyle;
- (unint64_t)hash;
@end

@implementation _UIVibrancyEffectImpl

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5
{
  id v6 = a4;
  LOBYTE(a3) = [a3 reducedTransperancy];
  char v7 = [v6 reducedTransperancy];

  return a3 ^ v7;
}

+ (id)implementationFromCoder:(id)a3
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 containsValueForKey:@"UIVibrancyEffectBlurMaterialStyle"])
  {
    id v6 = -[_UIVibrancyEffectCoreMaterialImpl initWithStyle:vibrancyStyle:]([_UIVibrancyEffectCoreMaterialImpl alloc], "initWithStyle:vibrancyStyle:", [v5 decodeIntegerForKey:@"UIVibrancyEffectBlurMaterialStyle"], objc_msgSend(v5, "decodeIntegerForKey:", @"UIVibrancyEffectVibrancyStyle"));
LABEL_8:
    v8 = (_UIVibrancyEffectModernCompositedImpl *)v6;
    goto LABEL_9;
  }
  if ([v5 containsValueForKey:@"UIVibrancyEffectBlurAutomaticStyle"])
  {
    char v7 = @"UIVibrancyEffectBlurAutomaticStyle";
LABEL_7:
    id v6 = -[_UIVibrancyEffectLegacyImpl initWithStyle:invertAutomaticStyle:]([_UIVibrancyEffectLegacyImpl alloc], "initWithStyle:invertAutomaticStyle:", [v5 decodeIntegerForKey:v7], 0);
    goto LABEL_8;
  }
  if ([v5 containsValueForKey:@"UIVibrancyEffectBlurStyle"])
  {
    char v7 = @"UIVibrancyEffectBlurStyle";
    goto LABEL_7;
  }
  if ([v5 containsValueForKey:@"UIVibrancyEffectFilterType"])
  {
    uint64_t v10 = [v5 decodeIntegerForKey:@"UIVibrancyEffectFilterType"];
    v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"UIVibrancyEffectColor1"];
    v12 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"UIVibrancyEffectColor2"];
    v13 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"UIVibrancyEffectCompositingColor"];
    uint64_t v14 = [v5 decodeBoolForKey:@"UIVibrancyEffectInputReversed"];
    v15 = [_UIVibrancyEffectModernVibrancyImpl alloc];
    v16 = (void *)MEMORY[0x1E4F3A368];
    if (!v10) {
      v16 = (void *)MEMORY[0x1E4F3A360];
    }
    v8 = [(_UIVibrancyEffectModernVibrancyImpl *)v15 initWithFilter:*v16 inputColor1:v11 inputColor2:v12 compositingColor:v13 inputReversed:v14];

LABEL_17:
    goto LABEL_9;
  }
  if ([v5 containsValueForKey:@"UIVibrancyCompositedType"])
  {
    uint64_t v17 = [v5 decodeIntegerForKey:@"UIVibrancyCompositedType"];
    v18 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"UIVibrancyEffectCompositingColor"];
    v8 = [[_UIVibrancyEffectModernCompositedImpl alloc] initWithCompositingMode:v17 compositingColor:v18];

LABEL_9:
    if (v8) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
  if ([v5 containsValueForKey:@"UIVibrancyColorMatrixType"])
  {
    uint64_t v19 = [v5 decodeIntegerForKey:@"UIVibrancyColorMatrixType"];
    if (v19)
    {
      id v6 = [[_UIVibrancyEffectVibrantColorMatrixImpl alloc] initWithSystemName:v19];
      goto LABEL_8;
    }
    v21 = (void *)MEMORY[0x1E4F1CAD0];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
    v23 = [v21 setWithArray:v22];
    v11 = [v5 decodeObjectOfClasses:v23 forKey:@"UIVibrancyEffectColorMatrixLight"];

    v24 = (void *)MEMORY[0x1E4F1CAD0];
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
    v26 = [v24 setWithArray:v25];
    v27 = [v5 decodeObjectOfClasses:v26 forKey:@"UIVibrancyEffectColorMatrixDark"];

    double v28 = 1.0;
    if ([v5 containsValueForKey:@"UIVibrancyEffectColorMatrixAlpha"])
    {
      [v5 decodeDoubleForKey:@"UIVibrancyEffectColorMatrixAlpha"];
      double v28 = v29;
    }
    v30 = [_UIVibrancyEffectVibrantColorMatrixImpl alloc];
    if (v27)
    {
      _UIVisualEffectModelDecodeCAColorMatrix(v11, (uint64_t)v33);
      _UIVisualEffectModelDecodeCAColorMatrix(v27, (uint64_t)v32);
      uint64_t v31 = [(_UIVibrancyEffectVibrantColorMatrixImpl *)v30 initWithLightCAColorMatrix:v33 darkCAColorMatrix:v32 alpha:v28];
    }
    else
    {
      _UIVisualEffectModelDecodeCAColorMatrix(v11, (uint64_t)v34);
      uint64_t v31 = [(_UIVibrancyEffectVibrantColorMatrixImpl *)v30 initWithCAColorMatrix:v34 alpha:v28];
    }
    v8 = (_UIVibrancyEffectModernCompositedImpl *)v31;

    goto LABEL_17;
  }
LABEL_23:
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2 object:a1 file:@"UIVibrancyEffect.m" lineNumber:498 description:@"Failed to decode vibrancy effect!"];

  v8 = 0;
LABEL_10:

  return v8;
}

- (unint64_t)hash
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"UIVibrancyEffect.m" lineNumber:509 description:@"Subclass must implement"];

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"UIVibrancyEffect.m" lineNumber:515 description:@"Subclass must implement"];

  return 0;
}

- (int64_t)style
{
  return 0x8000000000000000;
}

- (int64_t)vibrancyStyle
{
  return 0;
}

- (BOOL)invertAutomaticStyle
{
  return 0;
}

@end