@interface _UIVisualEffectViewCornerMask
+ (id)continuousCornerMaskWithRadius:(double)a3;
+ (id)cornerMaskWithRadius:(double)a3;
+ (id)cornerMaskWithRadius:(double)a3 continuous:(BOOL)a4 cornerMask:(unint64_t)a5;
+ (id)imageCornerMaskWithImage:(id)a3 radius:(double)a4;
+ (void)_applyZeroMaskToLayer:(id)a3;
- (BOOL)_isCornerWithRadius:(double)a3 continuous:(BOOL)a4 mask:(unint64_t)a5;
- (BOOL)cornersAreContinuous;
- (BOOL)isEqual:(id)a3;
- (_UIVisualEffectViewCornerMask)init;
- (double)radius;
- (id)_clone;
- (id)cornerMaskAppliedToCorners:(unint64_t)a3;
- (id)cornerMaskEffectingEdges:(BOOL)a3;
- (unint64_t)appliedCorners;
- (void)_applyToLayer:(id)a3;
@end

@implementation _UIVisualEffectViewCornerMask

+ (void)_applyZeroMaskToLayer:(id)a3
{
  id v3 = a3;
  [v3 setCornerRadius:0.0];
  [v3 setCornerCurve:*MEMORY[0x1E4F39EA0]];
  [v3 setCornerContentsMasksEdges:0];
  [v3 setMaskedCorners:15];
  [v3 setCornerContents:0];
  objc_msgSend(v3, "setCornerContentsCenter:", 0.5, 0.5, 0.0, 0.0);
}

+ (id)cornerMaskWithRadius:(double)a3 continuous:(BOOL)a4 cornerMask:(unint64_t)a5
{
  if (a3 <= 0.0)
  {
    v9 = 0;
  }
  else
  {
    char v6 = a5;
    v9 = (double *)objc_alloc_init((Class)a1);
    v9[8] = a3;
    *((unsigned char *)v9 + 56) = a4;
    *((void *)v9 + 6) = v6 & 0xF;
  }
  return v9;
}

- (_UIVisualEffectViewCornerMask)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UIVisualEffectViewCornerMask;
  result = [(_UIVisualEffectViewCornerMask *)&v8 init];
  if (result)
  {
    result->_imageCenter.size.height = 0.0;
    result->_appliedCorners = 15;
    __asm { FMOV            V0.2D, #0.5 }
    result->_imageCenter.origin = _Q0;
    result->_imageCenter.size.width = 0.0;
  }
  return result;
}

- (id)cornerMaskAppliedToCorners:(unint64_t)a3
{
  unint64_t v3 = a3 & 0xF;
  if (v3 == self->_appliedCorners)
  {
    v4 = self;
  }
  else
  {
    v4 = [(_UIVisualEffectViewCornerMask *)self _clone];
    v4->_appliedCorners = v3;
  }
  return v4;
}

- (double)radius
{
  return self->_radius;
}

- (BOOL)cornersAreContinuous
{
  return self->_continuous;
}

- (unint64_t)appliedCorners
{
  return self->_appliedCorners;
}

- (BOOL)_isCornerWithRadius:(double)a3 continuous:(BOOL)a4 mask:(unint64_t)a5
{
  return self->_continuous == a4 && self->_appliedCorners == a5 && !self->_image && self->_radius == a3;
}

- (void)_applyToLayer:(id)a3
{
  double radius = self->_radius;
  id v6 = a3;
  [v6 setCornerRadius:radius];
  uint64_t v5 = (void *)MEMORY[0x1E4F39EA8];
  if (!self->_continuous) {
    uint64_t v5 = (void *)MEMORY[0x1E4F39EA0];
  }
  [v6 setCornerCurve:*v5];
  [v6 setCornerContentsMasksEdges:self->_effectsEdges];
  [v6 setMaskedCorners:self->_appliedCorners];
  objc_msgSend(v6, "setCornerContents:", -[UIImage CGImage](self->_image, "CGImage"));
  objc_msgSend(v6, "setCornerContentsCenter:", self->_imageCenter.origin.x, self->_imageCenter.origin.y, self->_imageCenter.size.width, self->_imageCenter.size.height);
}

+ (id)continuousCornerMaskWithRadius:(double)a3
{
  return (id)[a1 cornerMaskWithRadius:1 continuous:15 cornerMask:a3];
}

+ (id)cornerMaskWithRadius:(double)a3
{
  return (id)[a1 cornerMaskWithRadius:0 continuous:15 cornerMask:a3];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UIVisualEffectViewCornerMask *)a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (self == v4)
      {
        BOOL v9 = 1;
        goto LABEL_16;
      }
      uint64_t v5 = v4;
      id v6 = v5;
      if (self->_radius != v5->_radius
        || self->_continuous != v5->_continuous
        || self->_appliedCorners != v5->_appliedCorners
        || self->_effectsEdges != v5->_effectsEdges)
      {
        goto LABEL_13;
      }
      image = self->_image;
      objc_super v8 = v6->_image;
      BOOL v9 = ((unint64_t)image | (unint64_t)v8) == 0;
      if (!image || !v8) {
        goto LABEL_14;
      }
      if (-[UIImage isEqual:](image, "isEqual:")) {
        BOOL v9 = CGRectEqualToRect(self->_imageCenter, v6->_imageCenter);
      }
      else {
LABEL_13:
      }
        BOOL v9 = 0;
LABEL_14:

      goto LABEL_16;
    }
  }
  BOOL v9 = 0;
LABEL_16:

  return v9;
}

- (id)_clone
{
  unint64_t v3 = objc_alloc_init((Class)objc_opt_class());
  v3[8] = *(void *)&self->_radius;
  uint64_t v4 = [(UIImage *)self->_image copy];
  uint64_t v5 = (void *)v3[1];
  v3[1] = v4;

  CGSize size = self->_imageCenter.size;
  *((_OWORD *)v3 + 1) = self->_imageCenter.origin;
  *((CGSize *)v3 + 2) = size;
  v3[6] = self->_appliedCorners;
  return v3;
}

- (void).cxx_destruct
{
}

+ (id)imageCornerMaskWithImage:(id)a3 radius:(double)a4
{
  id v7 = a3;
  objc_super v8 = v7;
  if (a4 <= 0.0)
  {
    v14 = 0;
  }
  else
  {
    BOOL v9 = [v7 images];

    if (v9)
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2 object:a1 file:@"UIVisualEffectView.m" lineNumber:128 description:@"Cannot use an animated image"];
    }
    [v8 size];
    double v12 = v11;
    double v13 = v10;
    if (v11 <= 0.0 || v10 <= 0.0)
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2 object:a1 file:@"UIVisualEffectView.m" lineNumber:130 description:@"Can't mask with an empty image"];
    }
    v14 = (double *)objc_alloc_init((Class)a1);
    v14[8] = a4;
    *((unsigned char *)v14 + 56) = 0;
    uint64_t v15 = [v8 copy];
    v16 = (void *)*((void *)v14 + 1);
    *((void *)v14 + 1) = v15;

    if ([v8 _isResizable])
    {
      [v8 capInsets];
      v14[2] = v17 / v12;
      v14[3] = v18 / v13;
      v14[4] = 1.0 - (v17 + v19) / v12;
      v14[5] = 1.0 - (v18 + v20) / v13;
    }
  }

  return v14;
}

- (id)cornerMaskEffectingEdges:(BOOL)a3
{
  if (self->_effectsEdges == a3)
  {
    unint64_t v3 = self;
  }
  else
  {
    unint64_t v3 = [(_UIVisualEffectViewCornerMask *)self _clone];
    v3->_effectsEdges = a3;
  }
  return v3;
}

@end