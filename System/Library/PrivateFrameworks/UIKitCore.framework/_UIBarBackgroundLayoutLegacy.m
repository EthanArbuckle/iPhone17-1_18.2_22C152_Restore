@interface _UIBarBackgroundLayoutLegacy
- (BOOL)bg1HasShadow;
- (BOOL)hasBackgroundEffect;
- (BOOL)shouldUseExplicitGeometry;
- (UIImage)shadowImage;
- (_UIBarBackgroundLayoutLegacy)initWithLayout:(id)a3;
- (double)bg1Alpha;
- (double)bg1ImageAlpha;
- (double)bg1ShadowAlpha;
- (double)bgInset;
- (double)topInset;
- (id)_blurWithStyle:(int64_t)a3 tint:(id)a4;
- (id)_colorForStyle:(int64_t)a3;
- (id)bg1Color;
- (id)bg1Effects;
- (id)bg1Image;
- (id)bg1ShadowColor;
- (id)bg1ShadowEffect;
- (id)bg1ShadowImage;
- (void)configureAsTransparent;
- (void)configureBackgroundColor:(id)a3 barStyle:(int64_t)a4 translucent:(BOOL)a5;
- (void)configureEffectForStyle:(int64_t)a3 backgroundTintColor:(id)a4 forceOpaque:(BOOL)a5;
- (void)configureImage:(id)a3 forceOpaque:(BOOL)a4 backgroundTintColor:(id)a5;
- (void)configureImage:(id)a3 forceOpaque:(BOOL)a4 barStyle:(int64_t)a5;
- (void)configureImage:(id)a3 forceTranslucent:(BOOL)a4;
- (void)configureShadowForBarStyle:(int64_t)a3;
- (void)configureShadowImage:(id)a3;
- (void)configureWithEffects:(id)a3;
- (void)configureWithoutShadow;
- (void)describeInto:(id)a3;
- (void)setTopInset:(double)a3;
- (void)setUseExplicitGeometry:(BOOL)a3;
@end

@implementation _UIBarBackgroundLayoutLegacy

- (id)bg1Image
{
  return self->_backgroundImage;
}

- (id)bg1Effects
{
  return self->_backgroundEffects;
}

- (id)bg1Color
{
  return self->_backgroundTintColor;
}

- (BOOL)bg1HasShadow
{
  return self->_hasShadow && !self->super._shadowHidden;
}

- (id)bg1ShadowImage
{
  return self->_shadowImage;
}

- (id)bg1ShadowEffect
{
  return self->_shadowEffect;
}

- (id)bg1ShadowColor
{
  if (self->_shadowEffect) {
    return 0;
  }
  else {
    return self->_shadowColor;
  }
}

- (double)bg1ShadowAlpha
{
  return self->super._shadowAlpha * self->super._backgroundAlpha;
}

- (double)bg1ImageAlpha
{
  double result = 0.909803922;
  if (self->_translucence != 1) {
    return 1.0;
  }
  return result;
}

- (double)bg1Alpha
{
  return self->super._backgroundAlpha;
}

- (BOOL)shouldUseExplicitGeometry
{
  return 0;
}

- (double)bgInset
{
  return self->_topInset;
}

- (void)configureEffectForStyle:(int64_t)a3 backgroundTintColor:(id)a4 forceOpaque:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v26 = v8;
  if (v5)
  {
    backgroundImage = self->_backgroundImage;
    self->_backgroundImage = 0;

    if (v26) {
      [v26 colorWithAlphaComponent:1.0];
    }
    else {
    v15 = [(_UIBarBackgroundLayoutLegacy *)self _colorForStyle:a3];
    }
    v16 = &OBJC_IVAR____UIBarBackgroundLayoutLegacy__backgroundEffects;
    objc_storeStrong((id *)&self->_backgroundTintColor, v15);
    int64_t v17 = 2;
  }
  else
  {
    if (a3 == 4)
    {
      backgroundEffects = self->_backgroundEffects;
      self->_backgroundEffects = 0;
    }
    else
    {
      int64_t interfaceIdiom = self->super._interfaceIdiom;
      if (interfaceIdiom == 2 || interfaceIdiom == 8)
      {
        if (a3) {
          uint64_t v13 = 4018;
        }
        else {
          uint64_t v13 = 5007;
        }
        v14 = [(_UIBarBackgroundLayoutLegacy *)self _blurWithStyle:v13 tint:v8];
        backgroundEffects = self->_backgroundEffects;
        self->_backgroundEffects = v14;
      }
      else
      {
        if (v8 && !self->super._disableTinting)
        {
          backgroundEffects = (NSArray *)v8;
          uint64_t v21 = 100;
        }
        else
        {
          int v18 = dyld_program_sdk_at_least();
          backgroundEffects = 0;
          uint64_t v19 = 20;
          if (!a3) {
            uint64_t v19 = 10;
          }
          uint64_t v20 = 2;
          if (!a3) {
            uint64_t v20 = 5;
          }
          if (v18) {
            uint64_t v21 = v19;
          }
          else {
            uint64_t v21 = v20;
          }
        }
        v22 = [(_UIBarBackgroundLayoutLegacy *)self _blurWithStyle:v21 tint:backgroundEffects];
        v23 = self->_backgroundEffects;
        self->_backgroundEffects = v22;
      }
    }

    int64_t v17 = 0;
    v16 = &OBJC_IVAR____UIBarBackgroundLayoutLegacy__backgroundTintColor;
    v15 = self->_backgroundImage;
    self->_backgroundImage = 0;
  }

  uint64_t v24 = *v16;
  v25 = *(Class *)((char *)&self->super.super.isa + v24);
  *(Class *)((char *)&self->super.super.isa + v24) = 0;

  self->_translucence = v17;
}

- (id)_blurWithStyle:(int64_t)a3 tint:(id)a4
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = v6;
  if (self->super._disableTinting)
  {
    if (!v6)
    {
      v12 = +[UIBlurEffect _effectWithBlurRadius:20.0 scale:0.25];
      v24[0] = v12;
      uint64_t v13 = +[UIColorEffect colorEffectSaturate:1.8];
      v24[1] = v13;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
      goto LABEL_7;
    }
    long long v19 = 0u;
    long long v20 = 0u;
    [v6 getRed:&v19 green:(char *)&v19 + 8 blue:&v20 alpha:(char *)&v20 + 8];
    double v8 = *((double *)&v20 + 1);
    if (*((double *)&v20 + 1) < 1.0)
    {
      double v9 = *((double *)&v20 + 1) * *(double *)&v20;
      double v10 = *((double *)&v20 + 1) * *((double *)&v19 + 1);
      double v11 = *((double *)&v20 + 1) * *(double *)&v19;
      v12 = +[UIBlurEffect _effectWithBlurRadius:20.0 scale:0.25];
      v23[0] = v12;
      uint64_t v13 = +[UIColorEffect colorEffectSaturate:1.8];
      v23[1] = v13;
      v14 = +[UIColorEffect _colorEffectSourceOver:](UIColorEffect, "_colorEffectSourceOver:", v11, v10, v9, v8);
      v23[2] = v14;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];

LABEL_7:
      goto LABEL_10;
    }
    v12 = +[UIVisualEffect effectCompositingColor:v7];
    v22 = v12;
    v16 = (void *)MEMORY[0x1E4F1C978];
    int64_t v17 = &v22;
  }
  else
  {
    v12 = +[UIBlurEffect _effectWithStyle:a3 tintColor:v6 invertAutomaticStyle:0];
    uint64_t v21 = v12;
    v16 = (void *)MEMORY[0x1E4F1C978];
    int64_t v17 = &v21;
  }
  v15 = [v16 arrayWithObjects:v17 count:1];
LABEL_10:

  return v15;
}

- (void)configureShadowForBarStyle:(int64_t)a3
{
  shadowImage = self->_shadowImage;
  self->_shadowImage = 0;

  objc_storeStrong((id *)&self->_shadowEffect, 0);
  if (!self->_shadowEffect)
  {
    id v6 = _UIBarHairlineShadowColorForBarStyle(a3);
    v7 = (UIColor *)[v6 copy];
    shadowColor = self->_shadowColor;
    self->_shadowColor = v7;
  }
  self->_hasShadow = 1;
}

- (void)configureWithoutShadow
{
  shadowImage = self->_shadowImage;
  self->_shadowImage = 0;

  shadowColor = self->_shadowColor;
  self->_shadowColor = 0;

  shadowEffect = self->_shadowEffect;
  self->_shadowEffect = 0;

  self->_hasShadow = 0;
}

- (void)configureWithEffects:(id)a3
{
  id v8 = a3;
  backgroundImage = self->_backgroundImage;
  self->_backgroundImage = 0;

  self->_translucence = 0;
  uint64_t v5 = [v8 count];
  if (v5) {
    id v6 = (void *)[v8 copy];
  }
  else {
    id v6 = 0;
  }
  objc_storeStrong((id *)&self->_backgroundEffects, v6);
  if (v5) {

  }
  backgroundTintColor = self->_backgroundTintColor;
  self->_backgroundTintColor = 0;
}

- (void)configureShadowImage:(id)a3
{
  objc_storeStrong((id *)&self->_shadowImage, a3);
  id v5 = a3;
  shadowColor = self->_shadowColor;
  self->_shadowColor = 0;

  shadowEffect = self->_shadowEffect;
  self->_shadowEffect = 0;

  self->_hasShadow = 1;
}

- (id)_colorForStyle:(int64_t)a3
{
  if (self->super._interfaceIdiom == 3)
  {
LABEL_16:
    v7 = 0;
    goto LABEL_18;
  }
  int64_t interfaceStyle = self->super._interfaceStyle;
  if (a3 == 4) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = 1;
  }
  if (interfaceStyle == 1000 || interfaceStyle == 2) {
    int64_t v6 = v4;
  }
  else {
    int64_t v6 = a3;
  }
  if (v6 == 2) {
    int64_t v6 = 1;
  }
  if (v6 != 1)
  {
    if (!v6)
    {
      v7 = +[UIColor systemBackgroundColor];
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  v7 = +[UIColor blackColor];
LABEL_18:
  return v7;
}

- (double)topInset
{
  return self->_topInset;
}

- (void)setTopInset:(double)a3
{
  double v3 = fmax(a3, 0.0);
  if (self->_topInset != v3) {
    self->_topInset = v3;
  }
}

- (_UIBarBackgroundLayoutLegacy)initWithLayout:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIBarBackgroundLayoutLegacy;
  id v5 = [(_UIBarBackgroundLayout *)&v10 initWithLayout:v4];
  int64_t v6 = v5;
  if (v5)
  {
    v5->super._useExplicitGeometry = 0;
    if ([v4 isMemberOfClass:objc_opt_class()])
    {
      v6->_translucence = *((void *)v4 + 11);
      objc_storeStrong((id *)&v6->_backgroundImage, *((id *)v4 + 12));
      v7 = (id *)v4;
      objc_storeStrong((id *)&v6->_backgroundTintColor, v7[13]);
      objc_storeStrong((id *)&v6->_backgroundEffects, v7[14]);
      objc_storeStrong((id *)&v6->_shadowImage, v7[15]);
      objc_storeStrong((id *)&v6->_shadowColor, v7[16]);
      objc_storeStrong((id *)&v6->_shadowEffect, v7[17]);
      v6->_hasShadow = *((unsigned char *)v7 + 144);
      id v8 = v7[19];

      *(void *)&v6->_topInset = v8;
    }
  }

  return v6;
}

- (void)configureImage:(id)a3 forceTranslucent:(BOOL)a4
{
  BOOL v4 = a4;
  objc_storeStrong((id *)&self->_backgroundImage, a3);
  id v9 = a3;
  self->_translucence = v4;
  backgroundEffects = self->_backgroundEffects;
  self->_backgroundEffects = 0;

  backgroundTintColor = self->_backgroundTintColor;
  self->_backgroundTintColor = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowEffect, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_shadowImage, 0);
  objc_storeStrong((id *)&self->_backgroundEffects, 0);
  objc_storeStrong((id *)&self->_backgroundTintColor, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
}

- (void)setUseExplicitGeometry:(BOOL)a3
{
  self->super._useExplicitGeometry = 0;
}

- (UIImage)shadowImage
{
  if (self->_hasShadow) {
    return self->_shadowImage;
  }
  else {
    return (UIImage *)0;
  }
}

- (BOOL)hasBackgroundEffect
{
  return [(NSArray *)self->_backgroundEffects count] != 0;
}

- (void)configureBackgroundColor:(id)a3 barStyle:(int64_t)a4 translucent:(BOOL)a5
{
  BOOL v5 = a5;
  id v13 = a3;
  backgroundImage = self->_backgroundImage;
  self->_backgroundImage = 0;

  self->_translucence = v5;
  backgroundEffects = self->_backgroundEffects;
  self->_backgroundEffects = 0;

  if (v13 || v5)
  {
    v12 = (UIColor *)v13;
    backgroundTintColor = self->_backgroundTintColor;
    self->_backgroundTintColor = v12;
  }
  else
  {
    objc_super v10 = [(_UIBarBackgroundLayoutLegacy *)self _colorForStyle:a4];
    backgroundTintColor = self->_backgroundTintColor;
    self->_backgroundTintColor = v10;
  }
}

- (void)configureImage:(id)a3 forceOpaque:(BOOL)a4 backgroundTintColor:(id)a5
{
  BOOL v6 = a4;
  id v14 = a3;
  objc_storeStrong((id *)&self->_backgroundImage, a3);
  id v9 = a5;
  int64_t v10 = 2;
  if (!v6) {
    int64_t v10 = 0;
  }
  self->_translucence = v10;
  backgroundEffects = self->_backgroundEffects;
  self->_backgroundEffects = 0;

  if (v6)
  {
    uint64_t v12 = [v9 colorWithAlphaComponent:1.0];
  }
  else
  {
    uint64_t v12 = [v9 copy];
  }
  id v13 = (void *)v12;

  objc_storeStrong((id *)&self->_backgroundTintColor, v13);
}

- (void)configureImage:(id)a3 forceOpaque:(BOOL)a4 barStyle:(int64_t)a5
{
  BOOL v6 = a4;
  id v12 = a3;
  objc_storeStrong((id *)&self->_backgroundImage, a3);
  int64_t v9 = 2;
  if (!v6) {
    int64_t v9 = 0;
  }
  self->_translucence = v9;
  backgroundEffects = self->_backgroundEffects;
  self->_backgroundEffects = 0;

  if (!v12) {
    BOOL v6 = 1;
  }
  if (v6)
  {
    double v11 = [(_UIBarBackgroundLayoutLegacy *)self _colorForStyle:a5];
  }
  else
  {
    double v11 = 0;
  }
  objc_storeStrong((id *)&self->_backgroundTintColor, v11);
  if (v6) {
}
  }

- (void)configureAsTransparent
{
  backgroundImage = self->_backgroundImage;
  self->_backgroundImage = 0;

  self->_translucence = 0;
  backgroundEffects = self->_backgroundEffects;
  self->_backgroundEffects = 0;

  backgroundTintColor = self->_backgroundTintColor;
  self->_backgroundTintColor = 0;
}

- (void)describeInto:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIBarBackgroundLayoutLegacy;
  id v4 = a3;
  [(_UIBarBackgroundLayout *)&v5 describeInto:v4];
  [v4 appendFormat:@" _translucence=%li backgroundImage=%@ backgroundTintColor=%@ backgroundEffects=%@ shadowImage=%@ shadowColor=%@", self->_translucence, self->_backgroundImage, self->_backgroundTintColor, self->_backgroundEffects, self->_shadowImage, self->_shadowColor, v5.receiver, v5.super_class];
}

@end