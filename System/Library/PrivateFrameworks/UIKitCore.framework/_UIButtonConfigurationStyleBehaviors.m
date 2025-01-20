@interface _UIButtonConfigurationStyleBehaviors
+ (id)behaviorForStyle:(uint64_t)a1;
+ (id)fillBehaviors;
+ (id)grayBehaviors;
+ (id)plainBehaviors:(uint64_t)a1;
+ (id)tintBehaviors;
+ (void)emptyBehaviors;
- (_UIButtonConfigurationStyleBehaviors)initWithStyle:(int64_t)a3;
- (id)behaviorForState:(void *)a1;
- (id)effectiveActivityIndicatorColorFromEffectiveColor:(char)a3 state:;
- (id)effectiveBackgroundColorFromBaseColor:(uint64_t)a3 state:(void *)a4 traitCollection:;
- (id)effectiveBackgroundVisualEffectFromBaseColor:(uint64_t)a3 state:(void *)a4 traitCollection:;
- (id)effectiveBehaviorWithoutButtonShapes;
- (id)effectiveForegroundColorFromBaseColor:(void *)a3 baseBackgroundColor:(uint64_t)a4 state:(void *)a5 traitCollection:;
@end

@implementation _UIButtonConfigurationStyleBehaviors

- (id)effectiveForegroundColorFromBaseColor:(void *)a3 baseBackgroundColor:(uint64_t)a4 state:(void *)a5 traitCollection:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (a1)
  {
    uint64_t v12 = *(void *)(a1 + 24);
    if (v12)
    {
      (*(void (**)(uint64_t, id, id, uint64_t, id))(v12 + 16))(v12, v9, v10, a4, v11);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if (v9)
    {
      id v13 = v9;
    }
    else
    {
      id v13 = +[UIColor tintColor];
    }
    v14 = v13;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)behaviorForState:(void *)a1
{
  if (a1)
  {
    v3 = a1;
    v4 = v3;
    if ((a2 & 4) != 0)
    {
      uint64_t v5 = v3[6];
      if (v5 != -1)
      {
        uint64_t v6 = +[_UIButtonConfigurationStyleBehaviors behaviorForStyle:]((uint64_t)_UIButtonConfigurationStyleBehaviors, v5);

        v4 = (void *)v6;
      }
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)effectiveBackgroundVisualEffectFromBaseColor:(uint64_t)a3 state:(void *)a4 traitCollection:
{
  id v7 = a2;
  id v8 = a4;
  if (a1 && (uint64_t v9 = *(void *)(a1 + 40)) != 0)
  {
    id v10 = (*(void (**)(uint64_t, id, uint64_t, id))(v9 + 16))(v9, v7, a3, v8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)effectiveBackgroundColorFromBaseColor:(uint64_t)a3 state:(void *)a4 traitCollection:
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9)
    {
      (*(void (**)(uint64_t, id, uint64_t, id))(v9 + 16))(v9, v7, a3, v8);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if (v7)
    {
      id v10 = v7;
    }
    else
    {
      id v10 = +[UIColor tintColor];
    }
    id v11 = v10;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)effectiveBehaviorWithoutButtonShapes
{
  if (a1)
  {
    id v2 = a1;
    +[_UIButtonConfigurationStyleBehaviors plainBehaviors:]((uint64_t)_UIButtonConfigurationStyleBehaviors, 0);
    id v3 = (id)objc_claimAutoreleasedReturnValue();

    if (v3 == v2)
    {
      v4 = (void *)effectiveBehaviorWithoutButtonShapes_plainWithoutButtonShape;
      if (!effectiveBehaviorWithoutButtonShapes_plainWithoutButtonShape)
      {
        uint64_t v5 = [[_UIButtonConfigurationStyleBehaviors alloc] initWithStyle:*((void *)v2 + 1)];
        uint64_t v6 = (void *)effectiveBehaviorWithoutButtonShapes_plainWithoutButtonShape;
        effectiveBehaviorWithoutButtonShapes_plainWithoutButtonShape = (uint64_t)v5;

        if (effectiveBehaviorWithoutButtonShapes_plainWithoutButtonShape
          && (objc_setProperty_nonatomic_copy((id)effectiveBehaviorWithoutButtonShapes_plainWithoutButtonShape, v7, *((id *)v2 + 3), 24), (uint64_t v9 = (void *)effectiveBehaviorWithoutButtonShapes_plainWithoutButtonShape) != 0)&& (*(void *)(effectiveBehaviorWithoutButtonShapes_plainWithoutButtonShape + 48) = *((void *)v2 + 6), v9[7] = *((void *)v2 + 7), v9[8] = *((void *)v2 + 8), objc_setProperty_nonatomic_copy(v9, v8, @"plain.noShape", 16), effectiveBehaviorWithoutButtonShapes_plainWithoutButtonShape))
        {
          objc_setProperty_nonatomic_copy((id)effectiveBehaviorWithoutButtonShapes_plainWithoutButtonShape, v10, &__block_literal_global_9_0, 32);
          v4 = (void *)effectiveBehaviorWithoutButtonShapes_plainWithoutButtonShape;
        }
        else
        {
          v4 = 0;
        }
      }
    }
    else
    {
      v4 = v2;
    }
    a1 = v4;
    uint64_t v1 = vars8;
  }
  return a1;
}

+ (id)grayBehaviors
{
  self;
  v0 = (void *)grayBehaviors_gray;
  if (!grayBehaviors_gray)
  {
    uint64_t v1 = [[_UIButtonConfigurationStyleBehaviors alloc] initWithStyle:1];
    id v2 = (void *)grayBehaviors_gray;
    grayBehaviors_gray = (uint64_t)v1;

    if (grayBehaviors_gray)
    {
      objc_setProperty_nonatomic_copy((id)grayBehaviors_gray, v3, @"gray", 16);
      if (grayBehaviors_gray)
      {
        objc_setProperty_nonatomic_copy((id)grayBehaviors_gray, v4, &__block_literal_global_37_3, 24);
        if (grayBehaviors_gray)
        {
          objc_setProperty_nonatomic_copy((id)grayBehaviors_gray, v5, &__block_literal_global_43_1, 32);
          if (grayBehaviors_gray)
          {
            objc_setProperty_nonatomic_copy((id)grayBehaviors_gray, v6, &__block_literal_global_45_0, 40);
            if (grayBehaviors_gray) {
              *(_OWORD *)(grayBehaviors_gray + 48) = xmmword_186B96C20;
            }
          }
        }
      }
    }
    uint64_t v7 = cornerStyleForDeviceIdiomAndConfigurationKind(1);
    v0 = (void *)grayBehaviors_gray;
    if (grayBehaviors_gray) {
      *(void *)(grayBehaviors_gray + 64) = v7;
    }
  }
  return v0;
}

+ (id)fillBehaviors
{
  self;
  v0 = (void *)fillBehaviors_fill;
  if (!fillBehaviors_fill)
  {
    uint64_t v1 = [[_UIButtonConfigurationStyleBehaviors alloc] initWithStyle:3];
    id v2 = (void *)fillBehaviors_fill;
    fillBehaviors_fill = (uint64_t)v1;

    if (fillBehaviors_fill)
    {
      objc_setProperty_nonatomic_copy((id)fillBehaviors_fill, v3, @"filled", 16);
      if (fillBehaviors_fill)
      {
        objc_setProperty_nonatomic_copy((id)fillBehaviors_fill, v4, &__block_literal_global_65_1, 24);
        if (fillBehaviors_fill)
        {
          objc_setProperty_nonatomic_copy((id)fillBehaviors_fill, v5, &__block_literal_global_69_0, 32);
          if (fillBehaviors_fill)
          {
            objc_setProperty_nonatomic_copy((id)fillBehaviors_fill, v6, &__block_literal_global_73_1, 40);
            if (fillBehaviors_fill) {
              *(void *)(fillBehaviors_fill + 56) = 100;
            }
          }
        }
      }
    }
    uint64_t v7 = cornerStyleForDeviceIdiomAndConfigurationKind(1);
    v0 = (void *)fillBehaviors_fill;
    if (fillBehaviors_fill) {
      *(void *)(fillBehaviors_fill + 64) = v7;
    }
  }
  return v0;
}

+ (id)plainBehaviors:(uint64_t)a1
{
  self;
  if (a2)
  {
    if (a2 != 1)
    {
      id v12 = 0;
      goto LABEL_11;
    }
    id v3 = &qword_1EB260D30;
  }
  else
  {
    id v3 = &qword_1EB260D28;
  }
  v4 = (void *)*v3;
  if (!*v3)
  {
    uint64_t v5 = [[_UIButtonConfigurationStyleBehaviors alloc] initWithStyle:0];
    uint64_t v7 = (int64x2_t *)v5;
    if (v5)
    {
      objc_setProperty_nonatomic_copy(v5, v6, @"plain", 16);
      objc_setProperty_nonatomic_copy(v7, v8, &__block_literal_global_25_4, 24);
      objc_setProperty_nonatomic_copy(v7, v9, &__block_literal_global_30_1, 32);
      objc_setProperty_nonatomic_copy(v7, v10, &__block_literal_global_32_2, 40);
      v7[3] = vdupq_n_s64(2uLL);
      v7[4].i64[0] = cornerStyleForDeviceIdiomAndConfigurationKind(a2);
    }
    else
    {
      cornerStyleForDeviceIdiomAndConfigurationKind(a2);
    }
    id v11 = (void *)*v3;
    uint64_t *v3 = (uint64_t)v7;

    v4 = (void *)*v3;
  }
  id v12 = v4;
LABEL_11:
  return v12;
}

- (_UIButtonConfigurationStyleBehaviors)initWithStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIButtonConfigurationStyleBehaviors;
  result = [(_UIButtonConfigurationStyleBehaviors *)&v5 init];
  if (result)
  {
    result->_style = a3;
    result->_selectionStyle = -1;
  }
  return result;
}

+ (id)tintBehaviors
{
  self;
  v0 = (void *)tintBehaviors_tint;
  if (!tintBehaviors_tint)
  {
    uint64_t v1 = [[_UIButtonConfigurationStyleBehaviors alloc] initWithStyle:2];
    id v2 = (void *)tintBehaviors_tint;
    tintBehaviors_tint = (uint64_t)v1;

    if (tintBehaviors_tint)
    {
      objc_setProperty_nonatomic_copy((id)tintBehaviors_tint, v3, @"tinted", 16);
      if (tintBehaviors_tint)
      {
        objc_setProperty_nonatomic_copy((id)tintBehaviors_tint, v4, &__block_literal_global_50_0, 24);
        if (tintBehaviors_tint)
        {
          objc_setProperty_nonatomic_copy((id)tintBehaviors_tint, v5, &__block_literal_global_56_4, 32);
          if (tintBehaviors_tint)
          {
            objc_setProperty_nonatomic_copy((id)tintBehaviors_tint, v6, &__block_literal_global_60, 40);
            if (tintBehaviors_tint) {
              *(int64x2_t *)(tintBehaviors_tint + 48) = vdupq_n_s64(3uLL);
            }
          }
        }
      }
    }
    uint64_t v7 = cornerStyleForDeviceIdiomAndConfigurationKind(1);
    v0 = (void *)tintBehaviors_tint;
    if (tintBehaviors_tint) {
      *(void *)(tintBehaviors_tint + 64) = v7;
    }
  }
  return v0;
}

- (id)effectiveActivityIndicatorColorFromEffectiveColor:(char)a3 state:
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    if ((a3 & 2) != 0)
    {
      id v7 = +[UIColor secondaryLabelColor];
    }
    else
    {
      id v7 = v5;
    }
    SEL v8 = v7;
  }
  else
  {
    SEL v8 = 0;
  }

  return v8;
}

+ (id)behaviorForStyle:(uint64_t)a1
{
  uint64_t v3 = self;
  if (a2 == 1)
  {
    v4 = +[_UIButtonConfigurationStyleBehaviors grayBehaviors]();
  }
  else if (a2 == 2)
  {
    v4 = +[_UIButtonConfigurationStyleBehaviors tintBehaviors]();
  }
  else
  {
    if (a2 == 3) {
      +[_UIButtonConfigurationStyleBehaviors fillBehaviors]();
    }
    else {
    v4 = +[_UIButtonConfigurationStyleBehaviors plainBehaviors:](v3, 0);
    }
  }
  return v4;
}

+ (void)emptyBehaviors
{
  self;
  v0 = (void *)emptyBehaviors_empty;
  if (!emptyBehaviors_empty)
  {
    uint64_t v1 = [[_UIButtonConfigurationStyleBehaviors alloc] initWithStyle:0];
    id v2 = (void *)emptyBehaviors_empty;
    emptyBehaviors_empty = (uint64_t)v1;

    v0 = (void *)emptyBehaviors_empty;
    if (emptyBehaviors_empty)
    {
      objc_setProperty_nonatomic_copy((id)emptyBehaviors_empty, v3, @"empty", 16);
      v0 = (void *)emptyBehaviors_empty;
      if (emptyBehaviors_empty)
      {
        objc_setProperty_nonatomic_copy((id)emptyBehaviors_empty, v4, &__block_literal_global_15_5, 24);
        v0 = (void *)emptyBehaviors_empty;
        if (emptyBehaviors_empty)
        {
          objc_setProperty_nonatomic_copy((id)emptyBehaviors_empty, v5, &__block_literal_global_17_3, 32);
          v0 = (void *)emptyBehaviors_empty;
          if (emptyBehaviors_empty)
          {
            objc_setProperty_nonatomic_copy((id)emptyBehaviors_empty, v6, &__block_literal_global_20_3, 40);
            v0 = (void *)emptyBehaviors_empty;
            if (emptyBehaviors_empty)
            {
              *(_OWORD *)(emptyBehaviors_empty + 48) = xmmword_186B96C30;
              v0[8] = -1;
            }
          }
        }
      }
    }
  }
  return v0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_calculateBackgroundVisualEffect, 0);
  objc_storeStrong(&self->_calculateBackgroundColor, 0);
  objc_storeStrong(&self->_calculateForegroundColor, 0);
  objc_storeStrong((id *)&self->_styleDescription, 0);
}

@end