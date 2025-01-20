@interface _UIBarBackgroundLayoutModern
- (BOOL)bg1HasShadow;
- (BOOL)bg2Enabled;
- (BOOL)bg2HasShadow;
- (BOOL)shouldUseExplicitGeometry;
- (_UIBarBackgroundAppearanceData)backgroundData1;
- (_UIBarBackgroundAppearanceData)backgroundData2;
- (_UIBarBackgroundLayoutModern)initWithLayout:(id)a3;
- (double)bg1Alpha;
- (double)bg1ShadowAlpha;
- (double)bg2Alpha;
- (double)bg2ShadowAlpha;
- (id)bg1Color;
- (id)bg1Effects;
- (id)bg1Image;
- (id)bg1ShadowColor;
- (id)bg1ShadowEffect;
- (id)bg1ShadowImage;
- (id)bg1ShadowTint;
- (id)bg2Color;
- (id)bg2Effects;
- (id)bg2Image;
- (id)bg2ShadowColor;
- (id)bg2ShadowEffect;
- (id)bg2ShadowImage;
- (id)bg2ShadowTint;
- (int64_t)bg1ImageMode;
- (int64_t)bg2ImageMode;
- (void)describeInto:(id)a3;
- (void)setBackgroundData1:(id)a3;
- (void)setBackgroundData2:(id)a3;
@end

@implementation _UIBarBackgroundLayoutModern

- (BOOL)bg2Enabled
{
  return !self->_backgroundsAreSame && self->_backgroundData2 != 0;
}

- (id)bg1Image
{
  return [(_UIBarBackgroundAppearanceData *)self->_backgroundData1 backgroundImage];
}

- (id)bg1Effects
{
  return [(_UIBarBackgroundAppearanceData *)self->_backgroundData1 backgroundEffects];
}

- (id)bg1Color
{
  return [(_UIBarBackgroundAppearanceData *)self->_backgroundData1 backgroundColor];
}

- (id)bg2Color
{
  return [(_UIBarBackgroundAppearanceData *)self->_backgroundData2 backgroundColor];
}

- (id)bg2Image
{
  return [(_UIBarBackgroundAppearanceData *)self->_backgroundData2 backgroundImage];
}

- (id)bg2Effects
{
  return [(_UIBarBackgroundAppearanceData *)self->_backgroundData2 backgroundEffects];
}

- (BOOL)bg2HasShadow
{
  BOOL v3 = [(_UIBarBackgroundAppearanceData *)self->_backgroundData2 hasShadow];
  if (v3) {
    LOBYTE(v3) = !self->super._shadowHidden;
  }
  return v3;
}

- (BOOL)bg1HasShadow
{
  BOOL v3 = [(_UIBarBackgroundAppearanceData *)self->_backgroundData1 hasShadow];
  if (v3) {
    LOBYTE(v3) = !self->super._shadowHidden;
  }
  return v3;
}

- (id)bg1ShadowImage
{
  return [(_UIBarBackgroundAppearanceData *)self->_backgroundData1 shadowImage];
}

- (id)bg1ShadowEffect
{
  return [(_UIBarBackgroundAppearanceData *)self->_backgroundData1 shadowViewEffect];
}

- (double)bg1ShadowAlpha
{
  if (self->_backgroundsAreSame || !self->super._useExplicitGeometry) {
    return self->super._shadowAlpha;
  }
  else {
    return self->super._shadowAlpha * (1.0 - self->super._backgroundTransitionProgress);
  }
}

- (int64_t)bg1ImageMode
{
  return [(_UIBarBackgroundAppearanceData *)self->_backgroundData1 backgroundImageContentMode];
}

- (double)bg1Alpha
{
  double v2 = 1.0;
  if (!self->_backgroundsAreSame
    && ![(_UIBarBackgroundAppearanceData *)self->_backgroundData2 hasBackground])
  {
    return 1.0 - self->super._backgroundTransitionProgress;
  }
  return v2;
}

- (id)bg2ShadowImage
{
  return [(_UIBarBackgroundAppearanceData *)self->_backgroundData2 shadowImage];
}

- (id)bg2ShadowTint
{
  if (self->super._useExplicitGeometry)
  {
    BOOL v3 = [(_UIBarBackgroundAppearanceData *)self->_backgroundData2 shadowViewTintColor];
  }
  else
  {
    v4 = [(_UIBarBackgroundAppearanceData *)self->_backgroundData1 shadowViewTintColor];
    v5 = [(_UIBarBackgroundAppearanceData *)self->_backgroundData2 shadowViewTintColor];
    BOOL v3 = _interpolateColors(v4, v5, self->super._backgroundTransitionProgress);
  }
  return v3;
}

- (id)bg1ShadowTint
{
  if (self->_backgroundsAreSame || self->super._useExplicitGeometry)
  {
    uint64_t v3 = [(_UIBarBackgroundAppearanceData *)self->_backgroundData1 shadowViewTintColor];
  }
  else
  {
    if (![(_UIBarBackgroundAppearanceData *)self->_backgroundData2 hasShadow])
    {
      v6 = [(_UIBarBackgroundAppearanceData *)self->_backgroundData1 shadowViewTintColor];
      v7 = [(_UIBarBackgroundAppearanceData *)self->_backgroundData2 shadowViewTintColor];
      v8 = _interpolateColors(v6, v7, self->super._backgroundTransitionProgress);
      v9 = v8;
      if (v8)
      {
        id v10 = v8;
      }
      else
      {
        id v10 = +[UIColor clearColor];
      }
      v4 = v10;

      goto LABEL_5;
    }
    uint64_t v3 = +[UIColor clearColor];
  }
  v4 = (void *)v3;
LABEL_5:
  return v4;
}

- (id)bg2ShadowEffect
{
  return [(_UIBarBackgroundAppearanceData *)self->_backgroundData2 shadowViewEffect];
}

- (id)bg2ShadowColor
{
  if (self->super._useExplicitGeometry || self->super._backgroundTransitionProgress >= 1.0)
  {
    v5 = [(_UIBarBackgroundAppearanceData *)self->_backgroundData2 shadowViewBackgroundColor];
  }
  else
  {
    uint64_t v3 = [(_UIBarBackgroundAppearanceData *)self->_backgroundData1 shadowViewBackgroundColor];
    v4 = [(_UIBarBackgroundAppearanceData *)self->_backgroundData2 shadowViewBackgroundColor];
    v5 = _interpolateColors(v3, v4, self->super._backgroundTransitionProgress);
  }
  return v5;
}

- (id)bg1ShadowColor
{
  if (self->_backgroundsAreSame || self->super._useExplicitGeometry || self->super._backgroundTransitionProgress <= 0.0)
  {
    uint64_t v3 = [(_UIBarBackgroundAppearanceData *)self->_backgroundData1 shadowViewBackgroundColor];
  }
  else if ([(_UIBarBackgroundAppearanceData *)self->_backgroundData2 hasShadow])
  {
    uint64_t v3 = 0;
  }
  else
  {
    v5 = [(_UIBarBackgroundAppearanceData *)self->_backgroundData1 shadowViewBackgroundColor];
    v6 = [(_UIBarBackgroundAppearanceData *)self->_backgroundData2 shadowViewBackgroundColor];
    uint64_t v3 = _interpolateColors(v5, v6, self->super._backgroundTransitionProgress);
  }
  return v3;
}

- (double)bg2ShadowAlpha
{
  double result = self->super._shadowAlpha;
  if (self->super._useExplicitGeometry) {
    return result * self->super._backgroundTransitionProgress;
  }
  return result;
}

- (int64_t)bg2ImageMode
{
  return [(_UIBarBackgroundAppearanceData *)self->_backgroundData2 backgroundImageContentMode];
}

- (double)bg2Alpha
{
  return self->super._backgroundTransitionProgress;
}

- (BOOL)shouldUseExplicitGeometry
{
  return self->super._useExplicitGeometry && !self->_backgroundsAreSame;
}

- (void)setBackgroundData1:(id)a3
{
  id v11 = a3;
  objc_storeStrong((id *)&self->_backgroundData1, a3);
  backgroundData2 = self->_backgroundData2;
  v6 = self->_backgroundData1;
  v7 = backgroundData2;
  v8 = v7;
  if (v6 == v7)
  {
    char v10 = 1;
  }
  else
  {
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      char v10 = 0;
    }
    else {
      char v10 = [(_UIBarAppearanceData *)v6 isEqual:v7];
    }
  }

  self->_backgroundsAreSame = v10;
}

- (void)setBackgroundData2:(id)a3
{
  id v11 = a3;
  objc_storeStrong((id *)&self->_backgroundData2, a3);
  backgroundData2 = self->_backgroundData2;
  v6 = self->_backgroundData1;
  v7 = backgroundData2;
  v8 = v7;
  if (v6 == v7)
  {
    char v10 = 1;
  }
  else
  {
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      char v10 = 0;
    }
    else {
      char v10 = [(_UIBarAppearanceData *)v6 isEqual:v7];
    }
  }

  self->_backgroundsAreSame = v10;
}

- (_UIBarBackgroundLayoutModern)initWithLayout:(id)a3
{
  v4 = (id *)a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIBarBackgroundLayoutModern;
  v5 = [(_UIBarBackgroundLayout *)&v8 initWithLayout:v4];
  if (v5 && [v4 isMemberOfClass:objc_opt_class()])
  {
    objc_storeStrong((id *)&v5->_backgroundData1, v4[12]);
    v6 = v4;
    objc_storeStrong((id *)&v5->_backgroundData2, v6[13]);
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundData2, 0);
  objc_storeStrong((id *)&self->_backgroundData1, 0);
}

- (void)describeInto:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UIBarBackgroundLayoutModern;
  [(_UIBarBackgroundLayout *)&v5 describeInto:v4];
  if (self->_backgroundData1)
  {
    [v4 appendFormat:@" background1=%@", self->_backgroundData1];
    if (self->_backgroundData2) {
      [v4 appendFormat:@" background2=%@", self->_backgroundData2];
    }
  }
}

- (_UIBarBackgroundAppearanceData)backgroundData1
{
  return self->_backgroundData1;
}

- (_UIBarBackgroundAppearanceData)backgroundData2
{
  return self->_backgroundData2;
}

@end