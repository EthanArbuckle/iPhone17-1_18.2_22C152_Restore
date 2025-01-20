@interface _UIBarBackgroundAppearanceData
+ (id)decodeFromCoder:(id)a3 prefix:(id)a4;
+ (id)opaqueBackgroundData;
+ (id)standardBackgroundData;
+ (id)transparentBackgroundData;
- (BOOL)checkEqualTo:(id)a3;
- (BOOL)hasBackground;
- (BOOL)hasShadow;
- (NSArray)backgroundEffects;
- (UIBlurEffect)backgroundEffect;
- (UIColor)backgroundColor;
- (UIColor)shadowColor;
- (UIColor)shadowViewBackgroundColor;
- (UIColor)shadowViewTintColor;
- (UIImage)backgroundImage;
- (UIImage)shadowImage;
- (UIVibrancyEffect)overrideTabBarVibrancyEffect;
- (UIVibrancyEffect)shadowEffect;
- (UIVibrancyEffect)shadowViewEffect;
- (UIVibrancyEffect)tabBarVibrancyEffect;
- (double)visibilityOnScrollDistance;
- (id)replicate;
- (int64_t)backgroundImageContentMode;
- (int64_t)behaviorForTransitioningTo:(id)a3;
- (int64_t)hashInto:(int64_t)a3;
- (int64_t)visibility;
- (void)_updateBackgroundFlags;
- (void)_updateShadowFlags;
- (void)configureWithDefaultShadow;
- (void)configureWithoutShadow;
- (void)describeInto:(id)a3;
- (void)encodeToCoder:(id)a3 prefix:(id)a4;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundEffect:(id)a3;
- (void)setBackgroundEffects:(id)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setBackgroundImageContentMode:(int64_t)a3;
- (void)setOverrideTabBarVibrancyEffect:(id)a3;
- (void)setShadowColor:(id)a3;
- (void)setShadowEffect:(id)a3;
- (void)setShadowImage:(id)a3;
- (void)setVisibility:(int64_t)a3;
- (void)setVisibilityOnScrollDistance:(double)a3;
@end

@implementation _UIBarBackgroundAppearanceData

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (NSArray)backgroundEffects
{
  return self->_backgroundEffects;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIImage)shadowImage
{
  return self->_shadowImage;
}

- (UIVibrancyEffect)shadowViewEffect
{
  shadowEffect = self->_shadowEffect;
  if (shadowEffect)
  {
    shadowViewEffect = self->_shadowViewEffect;
    if (!shadowViewEffect)
    {
      v5 = [(UIVibrancyEffect *)shadowEffect _effectReplacingTintColor:self->_shadowColor];
      v6 = self->_shadowViewEffect;
      self->_shadowViewEffect = v5;

      shadowViewEffect = self->_shadowViewEffect;
    }
    shadowEffect = shadowViewEffect;
  }
  return shadowEffect;
}

- (int64_t)backgroundImageContentMode
{
  return self->_backgroundImageContentMode;
}

- (BOOL)hasShadow
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)hasBackground
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (UIColor)shadowViewTintColor
{
  if (self->_shadowEffect)
  {
    id v2 = 0;
  }
  else
  {
    if ((*(unsigned char *)&self->_flags & 4) != 0)
    {
      shadowImage = self->_shadowImage;
      if (shadowImage) {
        shadowImage = self->_shadowColor;
      }
    }
    else
    {
      shadowImage = 0;
    }
    id v2 = shadowImage;
  }
  return (UIColor *)v2;
}

- (UIColor)shadowViewBackgroundColor
{
  if (self->_shadowEffect)
  {
    id v2 = 0;
  }
  else
  {
    if ((*(unsigned char *)&self->_flags & 4) != 0 && !self->_shadowImage) {
      shadowColor = self->_shadowColor;
    }
    else {
      shadowColor = 0;
    }
    id v2 = shadowColor;
  }
  return v2;
}

- (id)replicate
{
  v17.receiver = self;
  v17.super_class = (Class)_UIBarBackgroundAppearanceData;
  uint64_t v3 = [(_UIBarAppearanceData *)&v17 replicate];
  *(void *)(v3 + 16) = *(void *)&self->_flags;
  uint64_t v4 = [(NSArray *)self->_backgroundEffects copy];
  v5 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v4;

  uint64_t v6 = [(UIColor *)self->_backgroundColor copy];
  v7 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v6;

  objc_storeStrong((id *)(v3 + 56), self->_backgroundImage);
  *(void *)(v3 + 64) = self->_backgroundImageContentMode;
  *(void *)(v3 + 104) = self->_visibility;
  *(double *)(v3 + 112) = self->_visibilityOnScrollDistance;
  uint64_t v8 = [(UIVibrancyEffect *)self->_overrideTabBarVibrancyEffect copy];
  v9 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = v8;

  uint64_t v10 = [(UIVibrancyEffect *)self->_shadowEffect copy];
  v11 = *(void **)(v3 + 96);
  *(void *)(v3 + 96) = v10;

  objc_storeStrong((id *)(v3 + 88), self->_shadowImage);
  uint64_t v12 = [(UIColor *)self->_shadowColor copy];
  v13 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = v12;

  uint64_t v14 = [(UIVibrancyEffect *)self->_tabBarVibrancyEffect copy];
  v15 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v14;

  return (id)v3;
}

- (BOOL)checkEqualTo:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_UIBarBackgroundAppearanceData;
  if (![(_UIBarAppearanceData *)&v23 checkEqualTo:v4]
    || self->_backgroundImageContentMode != *((void *)v4 + 8))
  {
    goto LABEL_31;
  }
  v5 = (void *)*((void *)v4 + 6);
  uint64_t v6 = self->_backgroundColor;
  v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      goto LABEL_30;
    }
    BOOL v10 = [(UIColor *)v6 isEqual:v7];

    if (!v10) {
      goto LABEL_31;
    }
  }
  v11 = (void *)*((void *)v4 + 7);
  uint64_t v6 = self->_backgroundImage;
  uint64_t v12 = v11;
  if (v6 == v12)
  {
  }
  else
  {
    uint64_t v8 = v12;
    if (v6) {
      BOOL v13 = v12 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13) {
      goto LABEL_30;
    }
    BOOL v14 = [(UIColor *)v6 isEqual:v12];

    if (!v14) {
      goto LABEL_31;
    }
  }
  v15 = (void *)*((void *)v4 + 5);
  uint64_t v6 = self->_backgroundEffects;
  v16 = v15;
  if (v6 == v16)
  {
  }
  else
  {
    uint64_t v8 = v16;
    if (!v6 || !v16) {
      goto LABEL_30;
    }
    BOOL v17 = [(UIColor *)v6 isEqual:v16];

    if (!v17) {
      goto LABEL_31;
    }
  }
  v18 = (void *)*((void *)v4 + 9);
  uint64_t v6 = self->_overrideTabBarVibrancyEffect;
  v19 = v18;
  if (v6 != v19)
  {
    uint64_t v8 = v19;
    if (v6 && v19)
    {
      BOOL v20 = [(UIColor *)v6 isEqual:v19];

      if (!v20) {
        goto LABEL_31;
      }
      goto LABEL_34;
    }
LABEL_30:

    goto LABEL_31;
  }

LABEL_34:
  if (UIEqual(self->_shadowEffect, *((void **)v4 + 12))
    && UIEqual(self->_shadowColor, *((void **)v4 + 10))
    && UIEqual(self->_shadowImage, *((void **)v4 + 11))
    && self->_visibility == *((void *)v4 + 13))
  {
    BOOL v21 = self->_visibilityOnScrollDistance == *((double *)v4 + 14);
    goto LABEL_32;
  }
LABEL_31:
  BOOL v21 = 0;
LABEL_32:

  return v21;
}

+ (id)transparentBackgroundData
{
  id v2 = (void *)qword_1EB25BC58;
  if (!qword_1EB25BC58)
  {
    uint64_t v3 = objc_opt_new();
    id v4 = (void *)qword_1EB25BC58;
    qword_1EB25BC58 = v3;

    v5 = *(void **)(qword_1EB25BC58 + 40);
    *(void *)(qword_1EB25BC58 + 40) = MEMORY[0x1E4F1CBF0];

    uint64_t v6 = qword_1EB25BC58;
    *(unsigned char *)(qword_1EB25BC58 + 16) |= 1u;
    v7 = *(void **)(v6 + 48);
    *(void *)(v6 + 48) = 0;

    uint64_t v8 = *(void **)(qword_1EB25BC58 + 56);
    *(void *)(qword_1EB25BC58 + 56) = 0;

    BOOL v9 = (void *)qword_1EB25BC58;
    *(void *)(qword_1EB25BC58 + 64) = 0;
    v9[13] = 1;
    [v9 _updateBackgroundFlags];
    [(id)qword_1EB25BC58 configureWithoutShadow];
    id v10 = (id)[(id)qword_1EB25BC58 markReadOnly];
    id v2 = (void *)qword_1EB25BC58;
  }
  return v2;
}

- (UIBlurEffect)backgroundEffect
{
  if (*(unsigned char *)&self->_flags)
  {
    id v2 = [(NSArray *)self->_backgroundEffects firstObject];
  }
  else
  {
    id v2 = 0;
  }
  return (UIBlurEffect *)v2;
}

- (void)configureWithoutShadow
{
  [(_UIBarAppearanceData *)self assertMutable:a2];
  shadowColor = self->_shadowColor;
  self->_shadowColor = 0;

  shadowImage = self->_shadowImage;
  self->_shadowImage = 0;

  shadowEffect = self->_shadowEffect;
  self->_shadowEffect = 0;

  shadowViewEffect = self->_shadowViewEffect;
  self->_shadowViewEffect = 0;

  [(_UIBarBackgroundAppearanceData *)self _updateShadowFlags];
}

- (void)setBackgroundEffect:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(_UIBarAppearanceData *)self assertMutable:a2];
  if (v5)
  {
    v8[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    backgroundEffects = self->_backgroundEffects;
    self->_backgroundEffects = v6;
  }
  else
  {
    backgroundEffects = self->_backgroundEffects;
    self->_backgroundEffects = (NSArray *)MEMORY[0x1E4F1CBF0];
  }

  *(unsigned char *)&self->_flags |= 1u;
  [(_UIBarBackgroundAppearanceData *)self _updateBackgroundFlags];
}

- (UIVibrancyEffect)tabBarVibrancyEffect
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  overrideTabBarVibrancyEffect = self->_overrideTabBarVibrancyEffect;
  if (!overrideTabBarVibrancyEffect)
  {
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v4 = self->_backgroundEffects;
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v16;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v16 != v7) {
              objc_enumerationMutation(v4);
            }
            BOOL v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v10 = v9;
              if (objc_msgSend(v10, "_canProvideVibrancyEffect", (void)v15))
              {
                v11 = +[UIVibrancyEffect effectForBlurEffect:v10 style:4];
                tabBarVibrancyEffect = self->_tabBarVibrancyEffect;
                self->_tabBarVibrancyEffect = v11;
              }
              goto LABEL_15;
            }
          }
          uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
LABEL_15:

      *(unsigned char *)&self->_flags &= ~8u;
    }
    overrideTabBarVibrancyEffect = self->_tabBarVibrancyEffect;
  }
  BOOL v13 = overrideTabBarVibrancyEffect;
  return v13;
}

+ (id)standardBackgroundData
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)_MergedGlobals_1_0;
  if (!_MergedGlobals_1_0)
  {
    uint64_t v3 = objc_opt_new();
    id v4 = (void *)_MergedGlobals_1_0;
    _MergedGlobals_1_0 = v3;

    uint64_t v5 = +[UIBlurEffect effectWithStyle:10];
    v14[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    uint64_t v7 = *(void **)(_MergedGlobals_1_0 + 40);
    *(void *)(_MergedGlobals_1_0 + 40) = v6;

    uint64_t v8 = _MergedGlobals_1_0;
    *(unsigned char *)(_MergedGlobals_1_0 + 16) |= 1u;
    BOOL v9 = *(void **)(v8 + 48);
    *(void *)(v8 + 48) = 0;

    id v10 = *(void **)(_MergedGlobals_1_0 + 56);
    *(void *)(_MergedGlobals_1_0 + 56) = 0;

    v11 = (void *)_MergedGlobals_1_0;
    *(void *)(_MergedGlobals_1_0 + 64) = 0;
    v11[13] = 0;
    [v11 _updateBackgroundFlags];
    [(id)_MergedGlobals_1_0 configureWithDefaultShadow];
    id v12 = (id)[(id)_MergedGlobals_1_0 markReadOnly];
    id v2 = (void *)_MergedGlobals_1_0;
  }
  return v2;
}

- (void)_updateBackgroundFlags
{
  if ([(NSArray *)self->_backgroundEffects count] || self->_backgroundColor) {
    char v3 = 2;
  }
  else {
    char v3 = 2 * (self->_backgroundImage != 0);
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
  tabBarVibrancyEffect = self->_tabBarVibrancyEffect;
  self->_tabBarVibrancyEffect = 0;

  if ([(NSArray *)self->_backgroundEffects count] && !self->_backgroundColor) {
    char v5 = 8 * (self->_backgroundImage == 0);
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v5;
}

- (void)_updateShadowFlags
{
  if (self->_shadowEffect || self->_shadowColor)
  {
    char v3 = 4;
  }
  else
  {
    shadowImage = self->_shadowImage;
    if (shadowImage) {
      char v3 = 4 * ([(UIImage *)shadowImage renderingMode] != UIImageRenderingModeAlwaysTemplate);
    }
    else {
      char v3 = 0;
    }
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (UIVibrancyEffect)shadowEffect
{
  return self->_shadowEffect;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void)setShadowColor:(id)a3
{
  id v5 = a3;
  [(_UIBarAppearanceData *)self assertMutable:a2];
  uint64_t v6 = (UIColor *)[v5 copy];

  shadowColor = self->_shadowColor;
  self->_shadowColor = v6;

  shadowViewEffect = self->_shadowViewEffect;
  self->_shadowViewEffect = 0;

  [(_UIBarBackgroundAppearanceData *)self _updateShadowFlags];
}

- (void)configureWithDefaultShadow
{
  [(_UIBarAppearanceData *)self assertMutable:a2];
  char v3 = +[UIColor _systemChromeShadowColor];
  shadowColor = self->_shadowColor;
  self->_shadowColor = v3;

  shadowEffect = self->_shadowEffect;
  self->_shadowEffect = 0;

  shadowImage = self->_shadowImage;
  self->_shadowImage = 0;

  shadowViewEffect = self->_shadowViewEffect;
  self->_shadowViewEffect = 0;

  [(_UIBarBackgroundAppearanceData *)self _updateShadowFlags];
}

- (void)setBackgroundColor:(id)a3
{
  id v5 = a3;
  [(_UIBarAppearanceData *)self assertMutable:a2];
  uint64_t v6 = (UIColor *)[v5 copy];

  backgroundColor = self->_backgroundColor;
  self->_backgroundColor = v6;

  [(_UIBarBackgroundAppearanceData *)self _updateBackgroundFlags];
}

+ (id)opaqueBackgroundData
{
  id v2 = (void *)qword_1EB25BC50;
  if (!qword_1EB25BC50)
  {
    uint64_t v3 = objc_opt_new();
    id v4 = (void *)qword_1EB25BC50;
    qword_1EB25BC50 = v3;

    id v5 = *(void **)(qword_1EB25BC50 + 40);
    *(void *)(qword_1EB25BC50 + 40) = MEMORY[0x1E4F1CBF0];

    *(unsigned char *)(qword_1EB25BC50 + 16) |= 1u;
    uint64_t v6 = +[UIColor systemBackgroundColor];
    uint64_t v7 = *(void **)(qword_1EB25BC50 + 48);
    *(void *)(qword_1EB25BC50 + 48) = v6;

    uint64_t v8 = *(void **)(qword_1EB25BC50 + 56);
    *(void *)(qword_1EB25BC50 + 56) = 0;

    BOOL v9 = (void *)qword_1EB25BC50;
    *(void *)(qword_1EB25BC50 + 64) = 0;
    v9[13] = 2;
    [v9 _updateBackgroundFlags];
    [(id)qword_1EB25BC50 configureWithDefaultShadow];
    id v10 = (id)[(id)qword_1EB25BC50 markReadOnly];
    id v2 = (void *)qword_1EB25BC50;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowEffect, 0);
  objc_storeStrong((id *)&self->_shadowImage, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_overrideTabBarVibrancyEffect, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundEffects, 0);
  objc_storeStrong((id *)&self->_tabBarVibrancyEffect, 0);
  objc_storeStrong((id *)&self->_shadowViewEffect, 0);
}

- (void)setBackgroundEffects:(id)a3
{
  id v7 = a3;
  [(_UIBarAppearanceData *)self assertMutable:a2];
  if (v7)
  {
    id v5 = (NSArray *)[v7 copy];
    backgroundEffects = self->_backgroundEffects;
    self->_backgroundEffects = v5;
  }
  else
  {
    backgroundEffects = self->_backgroundEffects;
    self->_backgroundEffects = (NSArray *)MEMORY[0x1E4F1CBF0];
  }

  *(unsigned char *)&self->_flags &= ~1u;
  [(_UIBarBackgroundAppearanceData *)self _updateBackgroundFlags];
}

+ (id)decodeFromCoder:(id)a3 prefix:(id)a4
{
  v59[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = @"Style";
  if (v7)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%@.%@", v7, @"Style"];
  }
  if (![v6 containsValueForKey:v8])
  {
    uint64_t v11 = objc_opt_new();
    uint64_t v12 = objc_opt_class();
    if (v7)
    {
      BOOL v13 = [NSString stringWithFormat:@"%@.%@", v7, @"Effect"];
      BOOL v14 = [v6 decodeObjectOfClass:v12 forKey:v13];
    }
    else
    {
      BOOL v14 = [v6 decodeObjectOfClass:v12 forKey:@"Effect"];
    }
    if (v14)
    {
      v59[0] = v14;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:1];
      long long v16 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v15;

      char v17 = *(unsigned char *)(v11 + 16) | 1;
    }
    else
    {
      long long v18 = (void *)MEMORY[0x1E4F1CAD0];
      v58[0] = objc_opt_class();
      v58[1] = objc_opt_class();
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
      uint64_t v20 = [v18 setWithArray:v19];
      BOOL v21 = @"Effects";
      if (v7)
      {
        BOOL v21 = [NSString stringWithFormat:@"%@.%@", v7, @"Effects", v58[0]];
      }
      uint64_t v22 = [v6 decodeObjectOfClasses:v20 forKey:v21];
      objc_super v23 = (void *)v22;
      if (v22) {
        v24 = (void *)v22;
      }
      else {
        v24 = (void *)MEMORY[0x1E4F1CBF0];
      }
      objc_storeStrong((id *)(v11 + 40), v24);

      if (v7) {
      char v17 = *(unsigned char *)(v11 + 16) & 0xFE;
      }
    }
    *(unsigned char *)(v11 + 16) = v17;
    uint64_t v25 = objc_opt_class();
    v26 = @"Color";
    if (v7)
    {
      v26 = [NSString stringWithFormat:@"%@.%@", v7, @"Color"];
    }
    uint64_t v27 = [v6 decodeObjectOfClass:v25 forKey:v26];
    v28 = *(void **)(v11 + 48);
    *(void *)(v11 + 48) = v27;

    if (v7)
    {

      uint64_t v29 = objc_opt_class();
      v30 = [NSString stringWithFormat:@"%@.%@", v7, @"Image"];
    }
    else
    {
      uint64_t v29 = objc_opt_class();
      v30 = @"Image";
    }
    uint64_t v31 = [v6 decodeObjectOfClass:v29 forKey:v30];
    v32 = *(void **)(v11 + 56);
    *(void *)(v11 + 56) = v31;

    if (v7)
    {

      v33 = [NSString stringWithFormat:@"%@.%@", v7, @"ImageContentMode"];
      *(void *)(v11 + 64) = [v6 decodeIntegerForKey:v33];

      [(id)v11 _updateBackgroundFlags];
      v34 = [NSString stringWithFormat:@"%@.%@", v7, @"Visibility"];
      uint64_t v35 = [v6 decodeIntegerForKey:v34];

      if (!v35)
      {
LABEL_34:
        v41 = [NSString stringWithFormat:@"%@.%@", v7, @"ShadowVersion"];
        uint64_t v42 = [v6 decodeIntegerForKey:v41];

        goto LABEL_36;
      }
      *(void *)(v11 + 104) = v35;
      v36 = [NSString stringWithFormat:@"%@.%@", v7, @"VisibilityOnScrollDistance"];
      [v6 decodeDoubleForKey:v36];
      double v38 = v37;
    }
    else
    {
      *(void *)(v11 + 64) = [v6 decodeIntegerForKey:@"ImageContentMode"];
      [(id)v11 _updateBackgroundFlags];
      uint64_t v39 = [v6 decodeIntegerForKey:@"Visibility"];
      if (!v39) {
        goto LABEL_35;
      }
      *(void *)(v11 + 104) = v39;
      [v6 decodeDoubleForKey:@"VisibilityOnScrollDistance"];
      double v38 = v40;
    }
    if (v38 != 0.0) {
      *(double *)(v11 + 112) = v38;
    }
    if (v7) {
      goto LABEL_34;
    }
LABEL_35:
    uint64_t v42 = [v6 decodeIntegerForKey:@"ShadowVersion"];
LABEL_36:
    if (v42 == 2)
    {
      uint64_t v47 = objc_opt_class();
      v48 = @"ShadowEffect";
      if (v7)
      {
        v48 = [NSString stringWithFormat:@"%@.%@", v7, @"ShadowEffect"];
      }
      uint64_t v49 = [v6 decodeObjectOfClass:v47 forKey:v48];
      v50 = *(void **)(v11 + 96);
      *(void *)(v11 + 96) = v49;

      if (!v7)
      {
        uint64_t v51 = objc_opt_class();
        v44 = @"ShadowColor";
        goto LABEL_53;
      }

      uint64_t v51 = objc_opt_class();
      [NSString stringWithFormat:@"%@.%@", v7, @"ShadowColor"];
    }
    else
    {
      if (v42 == 1)
      {
        uint64_t v43 = objc_opt_class();
        v44 = @"ShadowEffect";
        if (v7)
        {
          v44 = [NSString stringWithFormat:@"%@.%@", v7, @"ShadowEffect"];
        }
        uint64_t v45 = [v6 decodeObjectOfClass:v43 forKey:v44];
        uint64_t v46 = 96;
        goto LABEL_54;
      }
      uint64_t v51 = objc_opt_class();
      v44 = @"ShadowColor";
      if (!v7)
      {
LABEL_53:
        uint64_t v45 = [v6 decodeObjectOfClass:v51 forKey:v44];
        uint64_t v46 = 80;
LABEL_54:
        v52 = *(void **)(v11 + v46);
        *(void *)(v11 + v46) = v45;

        if (v7)
        {

          uint64_t v53 = objc_opt_class();
          v54 = [NSString stringWithFormat:@"%@.%@", v7, @"ShadowImage"];
        }
        else
        {
          uint64_t v53 = objc_opt_class();
          v54 = @"ShadowImage";
        }
        uint64_t v55 = [v6 decodeObjectOfClass:v53 forKey:v54];
        v56 = *(void **)(v11 + 88);
        *(void *)(v11 + 88) = v55;

        if (v7) {
        [(id)v11 _updateShadowFlags];
        }

        goto LABEL_60;
      }
      [NSString stringWithFormat:@"%@.%@", v7, @"ShadowColor"];
    }
    v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_53;
  }
  uint64_t v9 = [v6 decodeIntegerForKey:v8];
  switch(v9)
  {
    case 3:
      uint64_t v10 = [a1 transparentBackgroundData];
      goto LABEL_50;
    case 2:
      uint64_t v10 = [a1 opaqueBackgroundData];
      goto LABEL_50;
    case 1:
      uint64_t v10 = [a1 standardBackgroundData];
LABEL_50:
      uint64_t v11 = v10;
      goto LABEL_60;
  }
  uint64_t v11 = 0;
LABEL_60:

  return (id)v11;
}

- (void)encodeToCoder:(id)a3 prefix:(id)a4
{
  id v51 = a3;
  id v6 = a4;
  id v7 = v6;
  if ((_UIBarBackgroundAppearanceData *)_MergedGlobals_1_0 == self)
  {
    if (!v6)
    {
      long long v16 = v51;
      uint64_t v17 = 1;
      goto LABEL_20;
    }
    BOOL v13 = [NSString stringWithFormat:@"%@.%@", v6, @"Style"];
    BOOL v14 = v51;
    uint64_t v15 = 1;
LABEL_14:
    [v14 encodeInteger:v15 forKey:v13];

    goto LABEL_70;
  }
  if ((_UIBarBackgroundAppearanceData *)qword_1EB25BC50 == self)
  {
    if (!v6)
    {
      long long v16 = v51;
      uint64_t v17 = 2;
      goto LABEL_20;
    }
    BOOL v13 = [NSString stringWithFormat:@"%@.%@", v6, @"Style"];
    BOOL v14 = v51;
    uint64_t v15 = 2;
    goto LABEL_14;
  }
  if ((_UIBarBackgroundAppearanceData *)qword_1EB25BC58 == self)
  {
    if (v6)
    {
      BOOL v13 = [NSString stringWithFormat:@"%@.%@", v6, @"Style"];
      BOOL v14 = v51;
      uint64_t v15 = 3;
      goto LABEL_14;
    }
    long long v16 = v51;
    uint64_t v17 = 3;
LABEL_20:
    [v16 encodeInteger:v17 forKey:@"Style"];
    goto LABEL_70;
  }
  if ([(NSArray *)self->_backgroundEffects count])
  {
    backgroundEffects = self->_backgroundEffects;
    if (*(unsigned char *)&self->_flags)
    {
      uint64_t v9 = [(NSArray *)self->_backgroundEffects firstObject];
      if (v7)
      {
        long long v18 = [NSString stringWithFormat:@"%@.%@", v7, @"Effect"];
        [v51 encodeObject:v9 forKey:v18];

LABEL_25:
        goto LABEL_26;
      }
      uint64_t v12 = @"Effect";
      uint64_t v10 = v51;
      uint64_t v11 = (NSArray *)v9;
    }
    else
    {
      if (!v7)
      {
        [v51 encodeObject:self->_backgroundEffects forKey:@"Effects"];
        backgroundColor = self->_backgroundColor;
        if (!backgroundColor) {
          goto LABEL_31;
        }
        uint64_t v20 = v51;
        goto LABEL_30;
      }
      uint64_t v9 = [NSString stringWithFormat:@"%@.%@", v7, @"Effects"];
      uint64_t v10 = v51;
      uint64_t v11 = backgroundEffects;
      uint64_t v12 = v9;
    }
    [v10 encodeObject:v11 forKey:v12];
    goto LABEL_25;
  }
LABEL_26:
  BOOL v21 = self->_backgroundColor;
  if (!v21) {
    goto LABEL_31;
  }
  if (v7)
  {
    uint64_t v22 = [NSString stringWithFormat:@"%@.%@", v7, @"Color"];
    [v51 encodeObject:v21 forKey:v22];

    goto LABEL_31;
  }
  uint64_t v20 = v51;
  backgroundColor = self->_backgroundColor;
LABEL_30:
  [v20 encodeObject:backgroundColor forKey:@"Color"];
LABEL_31:
  backgroundImage = self->_backgroundImage;
  if (!backgroundImage)
  {
LABEL_34:
    int64_t backgroundImageContentMode = self->_backgroundImageContentMode;
    if (!backgroundImageContentMode) {
      goto LABEL_41;
    }
    if (v7)
    {
      v26 = [NSString stringWithFormat:@"%@.%@", v7, @"ImageContentMode"];
      [v51 encodeInteger:backgroundImageContentMode forKey:v26];

      goto LABEL_41;
    }
    v28 = v51;
    int64_t v27 = self->_backgroundImageContentMode;
    goto LABEL_40;
  }
  if (v7)
  {
    v24 = [NSString stringWithFormat:@"%@.%@", v7, @"Image"];
    [v51 encodeObject:backgroundImage forKey:v24];

    goto LABEL_34;
  }
  [v51 encodeObject:self->_backgroundImage forKey:@"Image"];
  int64_t v27 = self->_backgroundImageContentMode;
  if (!v27) {
    goto LABEL_41;
  }
  v28 = v51;
LABEL_40:
  [v28 encodeInteger:v27 forKey:@"ImageContentMode"];
LABEL_41:
  int64_t visibility = self->_visibility;
  if (!visibility)
  {
LABEL_44:
    double visibilityOnScrollDistance = self->_visibilityOnScrollDistance;
    if (visibilityOnScrollDistance == 0.0) {
      goto LABEL_51;
    }
    if (v7)
    {
      v32 = [NSString stringWithFormat:@"%@.%@", v7, @"VisibilityOnScrollDistance"];
      [v51 encodeDouble:v32 forKey:visibilityOnScrollDistance];

      goto LABEL_51;
    }
    v34 = v51;
    double v33 = self->_visibilityOnScrollDistance;
    goto LABEL_50;
  }
  if (v7)
  {
    v30 = [NSString stringWithFormat:@"%@.%@", v7, @"Visibility"];
    [v51 encodeInteger:visibility forKey:v30];

    goto LABEL_44;
  }
  [v51 encodeInteger:self->_visibility forKey:@"Visibility"];
  double v33 = self->_visibilityOnScrollDistance;
  if (v33 == 0.0) {
    goto LABEL_51;
  }
  v34 = v51;
LABEL_50:
  [v34 encodeDouble:@"VisibilityOnScrollDistance" forKey:v33];
LABEL_51:
  shadowEffect = self->_shadowEffect;
  if (!shadowEffect)
  {
    shadowColor = self->_shadowColor;
    if (shadowColor)
    {
      if (v7)
      {
        uint64_t v43 = [NSString stringWithFormat:@"%@.%@", v7, @"ShadowColor"];
        [v51 encodeObject:shadowColor forKey:v43];
      }
      else
      {
        [v51 encodeObject:self->_shadowColor forKey:@"ShadowColor"];
      }
    }
    goto LABEL_66;
  }
  if (v7)
  {
    v36 = [NSString stringWithFormat:@"%@.%@", v7, @"ShadowEffect"];
    [v51 encodeObject:shadowEffect forKey:v36];

    double v37 = self->_shadowColor;
    if (v37)
    {
      double v38 = [NSString stringWithFormat:@"%@.%@", v7, @"ShadowColor"];
      [v51 encodeObject:v37 forKey:v38];

      uint64_t v39 = [NSString stringWithFormat:@"%@.%@", v7, @"ShadowVersion"];
      double v40 = v51;
      uint64_t v41 = 2;
LABEL_62:
      [v40 encodeInteger:v41 forKey:v39];

      goto LABEL_66;
    }
  }
  else
  {
    [v51 encodeObject:self->_shadowEffect forKey:@"ShadowEffect"];
    v44 = self->_shadowColor;
    if (v44)
    {
      [v51 encodeObject:v44 forKey:@"ShadowColor"];
      uint64_t v45 = v51;
      uint64_t v46 = 2;
      goto LABEL_65;
    }
  }
  uint64_t v47 = +[UIColor _systemChromeShadowColor];
  if (v7)
  {
    v48 = [NSString stringWithFormat:@"%@.%@", v7, @"ShadowColor"];
    [v51 encodeObject:v47 forKey:v48];

    uint64_t v39 = [NSString stringWithFormat:@"%@.%@", v7, @"ShadowVersion"];
    double v40 = v51;
    uint64_t v41 = 1;
    goto LABEL_62;
  }
  [v51 encodeObject:v47 forKey:@"ShadowColor"];

  uint64_t v45 = v51;
  uint64_t v46 = 1;
LABEL_65:
  [v45 encodeInteger:v46 forKey:@"ShadowVersion"];
LABEL_66:
  shadowImage = self->_shadowImage;
  if (shadowImage)
  {
    if (v7)
    {
      v50 = [NSString stringWithFormat:@"%@.%@", v7, @"ShadowImage"];
      [v51 encodeObject:shadowImage forKey:v50];
    }
    else
    {
      [v51 encodeObject:shadowImage forKey:@"ShadowImage"];
    }
  }
LABEL_70:
}

- (void)describeInto:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIBarBackgroundAppearanceData;
  [(_UIBarAppearanceData *)&v8 describeInto:v4];
  if ([(NSArray *)self->_backgroundEffects count])
  {
    backgroundEffects = self->_backgroundEffects;
    if (*(unsigned char *)&self->_flags)
    {
      id v6 = [(NSArray *)backgroundEffects firstObject];
      [v4 appendFormat:@" effect=(%@)", v6];
    }
    else
    {
      id v6 = [(NSArray *)backgroundEffects componentsJoinedByString:@", "];
      [v4 appendFormat:@" effects=(%@)", v6];
    }
  }
  if (self->_backgroundColor) {
    [v4 appendFormat:@" color=%@", self->_backgroundColor];
  }
  if (self->_backgroundImage) {
    [v4 appendFormat:@" image=%@ contentMode=%li", self->_backgroundImage, self->_backgroundImageContentMode];
  }
  if (self->_visibility)
  {
    [v4 appendString:@" visibility="];
    switch(self->_visibility)
    {
      case 0:
        break;
      case 1:
        id v7 = @"hidden";
        goto LABEL_14;
      case 2:
        id v7 = @"visible";
LABEL_14:
        [v4 appendString:v7];
        break;
      case 3:
        [v4 appendString:@"visibleOnScroll"];
        if (self->_visibilityOnScrollDistance > 0.0) {
          objc_msgSend(v4, "appendFormat:", @"(distance=%0.2f)", *(void *)&self->_visibilityOnScrollDistance);
        }
        break;
      default:
        objc_msgSend(v4, "appendFormat:", @"unknown(%ld)", self->_visibility);
        break;
    }
  }
  if (self->_shadowEffect) {
    [v4 appendFormat:@" shadowEffect=%@", self->_shadowEffect];
  }
  if (self->_shadowColor) {
    [v4 appendFormat:@" shadowColor=%@", self->_shadowColor];
  }
  if (self->_shadowImage) {
    [v4 appendFormat:@" shadowImage=%@", self->_shadowImage];
  }
}

- (int64_t)hashInto:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UIBarBackgroundAppearanceData;
  int64_t v4 = [(_UIBarAppearanceData *)&v9 hashInto:a3];
  NSUInteger v5 = [(NSArray *)self->_backgroundEffects count];
  uint64_t v6 = 1;
  if (self->_backgroundColor) {
    uint64_t v6 = 2;
  }
  NSUInteger v7 = v6 + v5;
  if (self->_backgroundImage) {
    ++v7;
  }
  if (self->_shadowEffect) {
    ++v7;
  }
  if (self->_shadowImage) {
    ++v7;
  }
  if (self->_shadowColor) {
    ++v7;
  }
  return (self->_visibility + v7 * v4 + (uint64_t)self->_visibilityOnScrollDistance) << 8;
}

- (void)setBackgroundImage:(id)a3
{
  NSUInteger v5 = (UIImage *)a3;
  [(_UIBarAppearanceData *)self assertMutable:a2];
  backgroundImage = self->_backgroundImage;
  self->_backgroundImage = v5;

  [(_UIBarBackgroundAppearanceData *)self _updateBackgroundFlags];
}

- (void)setOverrideTabBarVibrancyEffect:(id)a3
{
  id v5 = a3;
  [(_UIBarAppearanceData *)self assertMutable:a2];
  uint64_t v6 = (UIVibrancyEffect *)[v5 copy];

  overrideTabBarVibrancyEffect = self->_overrideTabBarVibrancyEffect;
  self->_overrideTabBarVibrancyEffect = v6;
}

- (void)setShadowImage:(id)a3
{
  id v5 = (UIImage *)a3;
  [(_UIBarAppearanceData *)self assertMutable:a2];
  shadowImage = self->_shadowImage;
  self->_shadowImage = v5;

  [(_UIBarBackgroundAppearanceData *)self _updateShadowFlags];
}

- (void)setShadowEffect:(id)a3
{
  id v5 = a3;
  [(_UIBarAppearanceData *)self assertMutable:a2];
  uint64_t v6 = (UIVibrancyEffect *)[v5 copy];

  shadowEffect = self->_shadowEffect;
  self->_shadowEffect = v6;

  shadowViewEffect = self->_shadowViewEffect;
  self->_shadowViewEffect = 0;

  [(_UIBarBackgroundAppearanceData *)self _updateShadowFlags];
}

- (int64_t)behaviorForTransitioningTo:(id)a3
{
  return 1;
}

- (void)setBackgroundImageContentMode:(int64_t)a3
{
  self->_int64_t backgroundImageContentMode = a3;
}

- (UIVibrancyEffect)overrideTabBarVibrancyEffect
{
  return self->_overrideTabBarVibrancyEffect;
}

- (int64_t)visibility
{
  return self->_visibility;
}

- (void)setVisibility:(int64_t)a3
{
  self->_int64_t visibility = a3;
}

- (double)visibilityOnScrollDistance
{
  return self->_visibilityOnScrollDistance;
}

- (void)setVisibilityOnScrollDistance:(double)a3
{
  self->_double visibilityOnScrollDistance = a3;
}

@end