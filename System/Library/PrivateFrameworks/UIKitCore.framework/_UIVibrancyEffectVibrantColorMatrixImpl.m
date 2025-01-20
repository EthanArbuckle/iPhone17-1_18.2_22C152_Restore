@interface _UIVibrancyEffectVibrantColorMatrixImpl
- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (_UIVibrancyEffectVibrantColorMatrixImpl)initWithCAColorMatrix:(CAColorMatrix *)a3 alpha:(double)a4;
- (_UIVibrancyEffectVibrantColorMatrixImpl)initWithLightCAColorMatrix:(CAColorMatrix *)a3 darkCAColorMatrix:(CAColorMatrix *)a4 alpha:(double)a5;
- (_UIVibrancyEffectVibrantColorMatrixImpl)initWithSystemName:(int64_t)a3;
- (id)implementationReplacingTintColor:(id)a3;
- (unint64_t)hash;
- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5;
- (void)appendDescriptionTo:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIVibrancyEffectVibrantColorMatrixImpl

- (_UIVibrancyEffectVibrantColorMatrixImpl)initWithLightCAColorMatrix:(CAColorMatrix *)a3 darkCAColorMatrix:(CAColorMatrix *)a4 alpha:(double)a5
{
  v17.receiver = self;
  v17.super_class = (Class)_UIVibrancyEffectVibrantColorMatrixImpl;
  v8 = [(_UIVibrancyEffectVibrantColorMatrixImpl *)&v17 init];
  v9 = v8;
  if (v8)
  {
    *(_OWORD *)&v8->_lightVibrantColorMatrix.m11 = *(_OWORD *)&a3->m11;
    long long v10 = *(_OWORD *)&a3->m42;
    long long v12 = *(_OWORD *)&a3->m15;
    long long v11 = *(_OWORD *)&a3->m24;
    *(_OWORD *)&v8->_lightVibrantColorMatrix.m33 = *(_OWORD *)&a3->m33;
    *(_OWORD *)&v8->_lightVibrantColorMatrix.m42 = v10;
    *(_OWORD *)&v8->_lightVibrantColorMatrix.m15 = v12;
    *(_OWORD *)&v8->_lightVibrantColorMatrix.m24 = v11;
    *(_OWORD *)&v8->_darkVibrantColorMatrix.m11 = *(_OWORD *)&a4->m11;
    long long v13 = *(_OWORD *)&a4->m42;
    long long v15 = *(_OWORD *)&a4->m15;
    long long v14 = *(_OWORD *)&a4->m24;
    *(_OWORD *)&v8->_darkVibrantColorMatrix.m33 = *(_OWORD *)&a4->m33;
    *(_OWORD *)&v8->_darkVibrantColorMatrix.m42 = v13;
    *(_OWORD *)&v8->_darkVibrantColorMatrix.m15 = v15;
    *(_OWORD *)&v8->_darkVibrantColorMatrix.m24 = v14;
    v8->_alpha = fmax(fmin(a5, 1.0), 0.0);
    v8->_hasDarkVariant = memcmp(a3, a4, 0x50uLL) != 0;
  }
  return v9;
}

- (_UIVibrancyEffectVibrantColorMatrixImpl)initWithSystemName:(int64_t)a3
{
  if (!a3)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"UIVibrancyEffect.m" lineNumber:820 description:@"Cannot initialize custom vibrant color matrix effect without a matix"];
  }
  v24.receiver = self;
  v24.super_class = (Class)_UIVibrancyEffectVibrantColorMatrixImpl;
  v5 = [(_UIVibrancyEffectVibrantColorMatrixImpl *)&v24 init];
  v6 = (_UIVibrancyEffectVibrantColorMatrixImpl *)v5;
  if (v5)
  {
    *((void *)v5 + 1) = a3;
    if (a3 == 3)
    {
      *((_OWORD *)v5 + 1) = xmmword_186B93250;
      *((_OWORD *)v5 + 2) = xmmword_186B93260;
      *((_OWORD *)v5 + 3) = xmmword_186B93270;
      *((_OWORD *)v5 + 4) = xmmword_186B93280;
      *((_OWORD *)v5 + 5) = xmmword_186B93290;
      *((_OWORD *)v5 + 6) = xmmword_186B932A0;
      *((_OWORD *)v5 + 7) = xmmword_186B932B0;
      *((_OWORD *)v5 + 8) = xmmword_186B932C0;
      *((_OWORD *)v5 + 9) = xmmword_186B932D0;
      *((_OWORD *)v5 + 10) = xmmword_186B932E0;
      uint64_t v10 = +[UIColor _systemChromeShadowColor];
      reducedTransperancyColor = v6->_reducedTransperancyColor;
      v6->_reducedTransperancyColor = (UIColor *)v10;

      v6->_hasDarkVariant = 1;
    }
    else
    {
      if (a3 == 2)
      {
        v7 = v5 + 16;
        v8 = v5 + 96;
        *((_OWORD *)v5 + 6) = xmmword_186B932F0;
        *((_OWORD *)v5 + 7) = xmmword_186B93300;
        *((_OWORD *)v5 + 8) = xmmword_186B93310;
        *((_OWORD *)v5 + 9) = xmmword_186B93320;
        long long v9 = xmmword_186B93330;
      }
      else
      {
        if (a3 != 1)
        {
          *((void *)v5 + 1) = 0;
          long long v15 = (long long *)MEMORY[0x1E4F39AD8];
          long long v16 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 32);
          long long v17 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 48);
          *((_OWORD *)v5 + 8) = v16;
          *((_OWORD *)v5 + 9) = v17;
          long long v18 = v15[4];
          *((_OWORD *)v5 + 10) = v18;
          long long v20 = *v15;
          long long v19 = v15[1];
          *((_OWORD *)v5 + 6) = *v15;
          *((_OWORD *)v5 + 7) = v19;
          *((_OWORD *)v5 + 4) = v17;
          *((_OWORD *)v5 + 5) = v18;
          *((_OWORD *)v5 + 2) = v19;
          *((_OWORD *)v5 + 3) = v16;
          *((_OWORD *)v5 + 1) = v20;
          goto LABEL_12;
        }
        v7 = v5 + 16;
        v8 = v5 + 96;
        *((_OWORD *)v5 + 6) = xmmword_186B93340;
        *((_OWORD *)v5 + 7) = xmmword_186B93350;
        *((_OWORD *)v5 + 8) = xmmword_186B93360;
        *((_OWORD *)v5 + 9) = xmmword_186B93370;
        long long v9 = xmmword_186B93380;
      }
      v8[4] = v9;
      long long v12 = v8[4];
      long long v14 = v8[1];
      long long v13 = v8[2];
      v7[3] = v8[3];
      v7[4] = v12;
      v7[1] = v14;
      v7[2] = v13;
      _OWORD *v7 = *v8;
    }
LABEL_12:
    v6->_alpha = 1.0;
  }
  return v6;
}

- (_UIVibrancyEffectVibrantColorMatrixImpl)initWithCAColorMatrix:(CAColorMatrix *)a3 alpha:(double)a4
{
  long long v4 = *(_OWORD *)&a3->m15;
  long long v5 = *(_OWORD *)&a3->m33;
  long long v11 = *(_OWORD *)&a3->m24;
  long long v12 = v5;
  long long v6 = *(_OWORD *)&a3->m33;
  long long v13 = *(_OWORD *)&a3->m42;
  long long v7 = *(_OWORD *)&a3->m15;
  v10[0] = *(_OWORD *)&a3->m11;
  v10[1] = v7;
  v9[2] = v11;
  v9[3] = v6;
  v9[4] = *(_OWORD *)&a3->m42;
  v9[0] = v10[0];
  v9[1] = v4;
  return [(_UIVibrancyEffectVibrantColorMatrixImpl *)self initWithLightCAColorMatrix:v10 darkCAColorMatrix:v9 alpha:a4];
}

- (id)implementationReplacingTintColor:(id)a3
{
  [a3 alphaComponent];
  double v5 = v4;
  if (v4 == self->_alpha)
  {
    long long v6 = self;
  }
  else
  {
    long long v6 = (_UIVibrancyEffectVibrantColorMatrixImpl *)objc_opt_new();
    v6->_systemName = self->_systemName;
    *(_OWORD *)&v6->_lightVibrantColorMatrix.m11 = *(_OWORD *)&self->_lightVibrantColorMatrix.m11;
    long long v7 = *(_OWORD *)&self->_lightVibrantColorMatrix.m42;
    long long v9 = *(_OWORD *)&self->_lightVibrantColorMatrix.m15;
    long long v8 = *(_OWORD *)&self->_lightVibrantColorMatrix.m24;
    *(_OWORD *)&v6->_lightVibrantColorMatrix.m33 = *(_OWORD *)&self->_lightVibrantColorMatrix.m33;
    *(_OWORD *)&v6->_lightVibrantColorMatrix.m42 = v7;
    *(_OWORD *)&v6->_lightVibrantColorMatrix.m15 = v9;
    *(_OWORD *)&v6->_lightVibrantColorMatrix.m24 = v8;
    *(_OWORD *)&v6->_darkVibrantColorMatrix.m11 = *(_OWORD *)&self->_darkVibrantColorMatrix.m11;
    long long v10 = *(_OWORD *)&self->_darkVibrantColorMatrix.m42;
    long long v12 = *(_OWORD *)&self->_darkVibrantColorMatrix.m15;
    long long v11 = *(_OWORD *)&self->_darkVibrantColorMatrix.m24;
    *(_OWORD *)&v6->_darkVibrantColorMatrix.m33 = *(_OWORD *)&self->_darkVibrantColorMatrix.m33;
    *(_OWORD *)&v6->_darkVibrantColorMatrix.m42 = v10;
    *(_OWORD *)&v6->_darkVibrantColorMatrix.m15 = v12;
    *(_OWORD *)&v6->_darkVibrantColorMatrix.m24 = v11;
    objc_storeStrong((id *)&v6->_reducedTransperancyColor, self->_reducedTransperancyColor);
    v6->_hasDarkVariant = self->_hasDarkVariant;
    v6->_alpha = v5;
  }
  return v6;
}

- (unint64_t)hash
{
  unint64_t systemName = self->_systemName;
  if (!systemName) {
    return (unint64_t)(float)((float)((float)((float)(self->_lightVibrantColorMatrix.m11
  }
                                                           + self->_lightVibrantColorMatrix.m22)
                                                   + self->_lightVibrantColorMatrix.m33)
                                           + self->_lightVibrantColorMatrix.m44)
                                   * (float)(unint64_t)(self->_alpha * 1000.0));
  return systemName;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    double v5 = (double *)v4;
    long long v6 = v5;
    int64_t systemName = self->_systemName;
    if (systemName == *((void *)v5 + 1))
    {
      if (systemName)
      {
        BOOL v8 = 1;
LABEL_12:

        goto LABEL_13;
      }
      if (self->_hasDarkVariant == *((unsigned __int8 *)v5 + 192)
        && (!self->_hasDarkVariant || !memcmp(&self->_darkVibrantColorMatrix, v5 + 12, 0x50uLL))
        && self->_alpha == v6[23])
      {
        BOOL v8 = memcmp(&self->_lightVibrantColorMatrix, v6 + 2, 0x50uLL) == 0;
        goto LABEL_12;
      }
    }
    BOOL v8 = 0;
    goto LABEL_12;
  }
  BOOL v8 = 0;
LABEL_13:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:self->_systemName forKey:@"UIVibrancyColorMatrixType"];
  if (!self->_systemName)
  {
    long long v5 = *(_OWORD *)&self->_lightVibrantColorMatrix.m33;
    long long v13 = *(_OWORD *)&self->_lightVibrantColorMatrix.m24;
    long long v14 = v5;
    long long v15 = *(_OWORD *)&self->_lightVibrantColorMatrix.m42;
    long long v6 = *(_OWORD *)&self->_lightVibrantColorMatrix.m15;
    long long v11 = *(_OWORD *)&self->_lightVibrantColorMatrix.m11;
    long long v12 = v6;
    long long v7 = _UIVisualEffectModelEncodeCAColorMatrix(&v11, *(double *)&v6);
    [v4 encodeObject:v7 forKey:@"UIVibrancyEffectColorMatrixLight"];

    if (self->_hasDarkVariant)
    {
      long long v8 = *(_OWORD *)&self->_darkVibrantColorMatrix.m33;
      long long v13 = *(_OWORD *)&self->_darkVibrantColorMatrix.m24;
      long long v14 = v8;
      long long v15 = *(_OWORD *)&self->_darkVibrantColorMatrix.m42;
      long long v9 = *(_OWORD *)&self->_darkVibrantColorMatrix.m15;
      long long v11 = *(_OWORD *)&self->_darkVibrantColorMatrix.m11;
      long long v12 = v9;
      long long v10 = _UIVisualEffectModelEncodeCAColorMatrix(&v11, *(double *)&v9);
      [v4 encodeObject:v10 forKey:@"UIVibrancyEffectColorMatrixDark"];
    }
    if (self->_alpha < 1.0) {
      objc_msgSend(v4, "encodeDouble:forKey:", @"UIVibrancyEffectColorMatrixAlpha");
    }
  }
}

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!self->_hasDarkVariant) {
    goto LABEL_3;
  }
  long long v10 = [v8 traitCollection];
  uint64_t v11 = [v10 userInterfaceStyle];
  long long v12 = [v9 traitCollection];
  uint64_t v13 = [v12 userInterfaceStyle];

  if (v11 != v13)
  {
    BOOL v14 = 1;
  }
  else
  {
LABEL_3:
    v16.receiver = self;
    v16.super_class = (Class)_UIVibrancyEffectVibrantColorMatrixImpl;
    BOOL v14 = [(_UIVibrancyEffectImpl *)&v16 _needsUpdateForTransitionFromEnvironment:v8 toEnvironment:v9 usage:a5];
  }

  return v14;
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (self->_reducedTransperancyColor && [v8 reducedTransperancy])
  {
    long long v10 = objc_alloc_init(_UITintColorViewEntry);
    [(_UITintColorViewEntry *)v10 setTintColor:self->_reducedTransperancyColor];
    [v7 addViewEffect:v10];
  }
  else
  {
    if (self->_hasDarkVariant
      && ([v9 traitCollection],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          uint64_t v12 = [v11 userInterfaceStyle],
          v11,
          v12 == 2))
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F29238];
      uint64_t v14 = 96;
    }
    else
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F29238];
      uint64_t v14 = 16;
    }
    long long v15 = (_OWORD *)((char *)self + v14);
    long long v16 = v15[3];
    v24[2] = v15[2];
    v24[3] = v16;
    v24[4] = v15[4];
    long long v17 = v15[1];
    v24[0] = *v15;
    v24[1] = v17;
    long long v10 = [v13 valueWithCAColorMatrix:v24];
    long long v18 = [_UIVisualEffectFilterEntry alloc];
    uint64_t v19 = *MEMORY[0x1E4F3A350];
    uint64_t v25 = *MEMORY[0x1E4F3A168];
    v26[0] = v10;
    long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    v21 = [(_UIVisualEffectFilterEntry *)v18 initWithFilterType:v19 configurationValues:v20 requestedValues:MEMORY[0x1E4F1CC08] identityValues:MEMORY[0x1E4F1CC08]];

    [v7 addFilterEntry:v21];
    v22 = objc_alloc_init(_UITintColorViewEntry);
    v23 = +[UIColor colorWithWhite:1.0 alpha:self->_alpha];
    [(_UITintColorViewEntry *)v22 setTintColor:v23];

    [v7 addViewEffect:v22];
  }

  [v7 setTextShouldRenderWithTintColor:1];
}

- (void)appendDescriptionTo:(id)a3
{
  id v4 = a3;
  long long v5 = v4;
  int64_t systemName = self->_systemName;
  switch(systemName)
  {
    case 3:
      id v7 = @" style=systemChromeShadow";
      goto LABEL_7;
    case 2:
      id v7 = @" style=highIntensityShadow";
      goto LABEL_7;
    case 1:
      id v7 = @" style=lowIntensityShadow";
LABEL_7:
      [v4 appendString:v7];
      goto LABEL_12;
  }
  p_lightVibrantColorMatrix = &self->_lightVibrantColorMatrix;
  long long v9 = *(_OWORD *)&self->_lightVibrantColorMatrix.m33;
  if (self->_hasDarkVariant)
  {
    long long v18 = *(_OWORD *)&self->_lightVibrantColorMatrix.m24;
    long long v19 = v9;
    long long v20 = *(_OWORD *)&self->_lightVibrantColorMatrix.m42;
    long long v10 = *(_OWORD *)&self->_lightVibrantColorMatrix.m15;
    long long v16 = *(_OWORD *)&p_lightVibrantColorMatrix->m11;
    long long v17 = v10;
    uint64_t v11 = _UIVisualEffectFilterEntryDescribeColorMatrix((uint64_t)&v16);
    long long v12 = *(_OWORD *)&self->_darkVibrantColorMatrix.m33;
    long long v18 = *(_OWORD *)&self->_darkVibrantColorMatrix.m24;
    long long v19 = v12;
    long long v20 = *(_OWORD *)&self->_darkVibrantColorMatrix.m42;
    long long v13 = *(_OWORD *)&self->_darkVibrantColorMatrix.m15;
    long long v16 = *(_OWORD *)&self->_darkVibrantColorMatrix.m11;
    long long v17 = v13;
    uint64_t v14 = _UIVisualEffectFilterEntryDescribeColorMatrix((uint64_t)&v16);
    [v5 appendFormat:@" lightVibrantColorMatrix=%@ darkVibrantColorMatrix=%@", v11, v14];
  }
  else
  {
    long long v18 = *(_OWORD *)&self->_lightVibrantColorMatrix.m24;
    long long v19 = v9;
    long long v20 = *(_OWORD *)&self->_lightVibrantColorMatrix.m42;
    long long v15 = *(_OWORD *)&self->_lightVibrantColorMatrix.m15;
    long long v16 = *(_OWORD *)&p_lightVibrantColorMatrix->m11;
    long long v17 = v15;
    uint64_t v11 = _UIVisualEffectFilterEntryDescribeColorMatrix((uint64_t)&v16);
    [v5 appendFormat:@" vibrantColorMatrix=%@", v11];
  }

  objc_msgSend(v5, "appendFormat:", @" alpha=%f", *(void *)&self->_alpha);
LABEL_12:
}

- (void).cxx_destruct
{
}

@end