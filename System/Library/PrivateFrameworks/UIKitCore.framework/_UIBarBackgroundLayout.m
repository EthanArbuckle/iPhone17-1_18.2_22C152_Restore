@interface _UIBarBackgroundLayout
- (BOOL)bg1HasShadow;
- (BOOL)bg2Enabled;
- (BOOL)bg2HasHeight;
- (BOOL)bg2HasShadow;
- (BOOL)disableTinting;
- (BOOL)shadowHidden;
- (BOOL)shouldUseExplicitGeometry;
- (BOOL)useExplicitGeometry;
- (NSArray)bg1Effects;
- (NSArray)bg2Effects;
- (UIColor)bg1Color;
- (UIColor)bg1ShadowColor;
- (UIColor)bg1ShadowTint;
- (UIColor)bg2Color;
- (UIColor)bg2ShadowColor;
- (UIColor)bg2ShadowTint;
- (UIImage)bg1Image;
- (UIImage)bg1ShadowImage;
- (UIImage)bg2Image;
- (UIImage)bg2ShadowImage;
- (UIVibrancyEffect)bg1ShadowEffect;
- (UIVibrancyEffect)bg2ShadowEffect;
- (_UIBarBackgroundLayout)init;
- (_UIBarBackgroundLayout)initWithLayout:(id)a3;
- (double)backgroundAlpha;
- (double)backgroundHeight1;
- (double)backgroundHeight2;
- (double)backgroundTransitionProgress;
- (double)bg1Alpha;
- (double)bg1ImageAlpha;
- (double)bg1ShadowAlpha;
- (double)bg2Alpha;
- (double)bg2ShadowAlpha;
- (double)bgInset;
- (double)shadowAlpha;
- (double)topInset;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)bg1ImageMode;
- (int64_t)bg2ImageMode;
- (int64_t)interfaceIdiom;
- (int64_t)interfaceStyle;
- (void)describeInto:(id)a3;
- (void)setBackgroundAlpha:(double)a3;
- (void)setBackgroundHeight1:(double)a3;
- (void)setBackgroundHeight2:(double)a3;
- (void)setBackgroundTransitionProgress:(double)a3;
- (void)setDisableTinting:(BOOL)a3;
- (void)setInterfaceIdiom:(int64_t)a3;
- (void)setInterfaceStyle:(int64_t)a3;
- (void)setShadowAlpha:(double)a3;
- (void)setShadowHidden:(BOOL)a3;
- (void)setUseExplicitGeometry:(BOOL)a3;
@end

@implementation _UIBarBackgroundLayout

- (void)setBackgroundTransitionProgress:(double)a3
{
  self->_backgroundTransitionProgress = a3;
}

- (void)setUseExplicitGeometry:(BOOL)a3
{
  self->_useExplicitGeometry = a3;
}

- (void)setBackgroundAlpha:(double)a3
{
  double v3 = fmax(fmin(a3, 1.0), 0.0);
  if (v3 != self->_backgroundAlpha) {
    self->_backgroundAlpha = v3;
  }
}

- (BOOL)bg2Enabled
{
  return 0;
}

- (UIColor)bg1ShadowTint
{
  return 0;
}

- (int64_t)bg1ImageMode
{
  return 0;
}

- (double)bg1ImageAlpha
{
  return 1.0;
}

- (BOOL)bg2HasShadow
{
  return 0;
}

- (double)bgInset
{
  return 0.0;
}

- (void)setShadowAlpha:(double)a3
{
  double v3 = fmax(fmin(a3, 1.0), 0.0);
  if (v3 != self->_shadowAlpha) {
    self->_shadowAlpha = v3;
  }
}

- (void)setDisableTinting:(BOOL)a3
{
  self->_disableTinting = a3;
}

- (double)topInset
{
  return 0.0;
}

- (void)setInterfaceStyle:(int64_t)a3
{
  self->_interfaceStyle = a3;
}

- (void)setInterfaceIdiom:(int64_t)a3
{
  self->_interfaceIdiom = a3;
}

- (_UIBarBackgroundLayout)init
{
  return [(_UIBarBackgroundLayout *)self initWithLayout:0];
}

- (_UIBarBackgroundLayout)initWithLayout:(id)a3
{
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIBarBackgroundLayout;
  v5 = [(_UIBarBackgroundLayout *)&v13 init];
  v6 = (_UIBarBackgroundLayout *)v5;
  if (v5)
  {
    if (v4)
    {
      *((void *)v5 + 1) = v4[1];
      *((void *)v5 + 2) = v4[2];
      *((void *)v5 + 3) = v4[3];
      *((void *)v5 + 4) = v4[4];
      *((void *)v5 + 5) = v4[5];
      *((void *)v5 + 6) = v4[6];
      *((void *)v5 + 7) = v4[7];
      v5[64] = *((unsigned char *)v4 + 64);
      v5[65] = *((unsigned char *)v4 + 65);
      v5[66] = *((unsigned char *)v4 + 66);
    }
    else
    {
      __asm { FMOV            V0.2D, #1.0 }
      *(_OWORD *)(v5 + 8) = _Q0;
    }
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bg2ShadowEffect, 0);
  objc_storeStrong((id *)&self->_bg1ShadowEffect, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithLayout:self];
}

- (BOOL)shouldUseExplicitGeometry
{
  return self->_useExplicitGeometry;
}

- (double)bg1Alpha
{
  return 1.0;
}

- (NSArray)bg1Effects
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (UIColor)bg1Color
{
  return 0;
}

- (UIImage)bg1Image
{
  return 0;
}

- (BOOL)bg1HasShadow
{
  return 0;
}

- (UIColor)bg1ShadowColor
{
  return 0;
}

- (UIImage)bg1ShadowImage
{
  return 0;
}

- (double)bg1ShadowAlpha
{
  return 1.0;
}

- (BOOL)bg2HasHeight
{
  return 0;
}

- (double)bg2Alpha
{
  return 1.0;
}

- (NSArray)bg2Effects
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (UIColor)bg2Color
{
  return 0;
}

- (UIImage)bg2Image
{
  return 0;
}

- (int64_t)bg2ImageMode
{
  return 0;
}

- (UIColor)bg2ShadowColor
{
  return 0;
}

- (UIImage)bg2ShadowImage
{
  return 0;
}

- (UIColor)bg2ShadowTint
{
  return 0;
}

- (double)bg2ShadowAlpha
{
  return 1.0;
}

- (void)describeInto:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "appendFormat:", @" idiom=%li style=%li backgroundAlpha=%f shadowAlpha=%f", self->_interfaceIdiom, self->_interfaceStyle, *(void *)&self->_backgroundAlpha, *(void *)&self->_shadowAlpha);
  if (self->_shadowHidden) {
    [v4 appendString:@" shadowHidden"];
  }
  if (self->_useExplicitGeometry) {
    objc_msgSend(v4, "appendFormat:", @" height1=%f height2=%f", *(void *)&self->_backgroundHeight1, *(void *)&self->_backgroundHeight2);
  }
  else {
    [v4 appendString:@" fullHeight"];
  }
  objc_msgSend(v4, "appendFormat:", @" transitionProgress=%f", *(void *)&self->_backgroundTransitionProgress);
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)_UIBarBackgroundLayout;
  double v3 = [(_UIBarBackgroundLayout *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  [(_UIBarBackgroundLayout *)self describeInto:v4];
  return v4;
}

- (int64_t)interfaceIdiom
{
  return self->_interfaceIdiom;
}

- (int64_t)interfaceStyle
{
  return self->_interfaceStyle;
}

- (double)backgroundAlpha
{
  return self->_backgroundAlpha;
}

- (double)shadowAlpha
{
  return self->_shadowAlpha;
}

- (BOOL)shadowHidden
{
  return self->_shadowHidden;
}

- (void)setShadowHidden:(BOOL)a3
{
  self->_shadowHidden = a3;
}

- (BOOL)useExplicitGeometry
{
  return self->_useExplicitGeometry;
}

- (double)backgroundHeight1
{
  return self->_backgroundHeight1;
}

- (void)setBackgroundHeight1:(double)a3
{
  self->_backgroundHeight1 = a3;
}

- (double)backgroundHeight2
{
  return self->_backgroundHeight2;
}

- (void)setBackgroundHeight2:(double)a3
{
  self->_backgroundHeight2 = a3;
}

- (double)backgroundTransitionProgress
{
  return self->_backgroundTransitionProgress;
}

- (BOOL)disableTinting
{
  return self->_disableTinting;
}

- (UIVibrancyEffect)bg1ShadowEffect
{
  return self->_bg1ShadowEffect;
}

- (UIVibrancyEffect)bg2ShadowEffect
{
  return self->_bg2ShadowEffect;
}

@end