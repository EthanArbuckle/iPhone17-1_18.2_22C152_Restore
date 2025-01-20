@interface PXGFocusEffectViewConfiguration
- (BOOL)isEqual:(id)a3;
- (CGPoint)contentMotionRotation;
- (CGPoint)contentMotionTranslation;
- (PXGFocusEffectViewConfiguration)initWithConfiguration:(id)a3;
- (double)cornerRadius;
- (double)focusedSizeIncrease;
- (double)shadowOpacity;
- (double)shadowVerticalOffset;
- (unint64_t)hash;
- (void)setContentMotionRotation:(CGPoint)a3;
- (void)setContentMotionTranslation:(CGPoint)a3;
- (void)setCornerRadius:(double)a3;
- (void)setFocusedSizeIncrease:(double)a3;
- (void)setShadowOpacity:(double)a3;
- (void)setShadowVerticalOffset:(double)a3;
@end

@implementation PXGFocusEffectViewConfiguration

- (void)setShadowOpacity:(double)a3
{
  self->_shadowOpacity = a3;
}

- (double)shadowOpacity
{
  return self->_shadowOpacity;
}

- (void)setShadowVerticalOffset:(double)a3
{
  self->_shadowVerticalOffset = a3;
}

- (double)shadowVerticalOffset
{
  return self->_shadowVerticalOffset;
}

- (void)setFocusedSizeIncrease:(double)a3
{
  self->_focusedSizeIncrease = a3;
}

- (double)focusedSizeIncrease
{
  return self->_focusedSizeIncrease;
}

- (void)setContentMotionTranslation:(CGPoint)a3
{
  self->_contentMotionTranslation = a3;
}

- (CGPoint)contentMotionTranslation
{
  double x = self->_contentMotionTranslation.x;
  double y = self->_contentMotionTranslation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setContentMotionRotation:(CGPoint)a3
{
  self->_contentMotionRotation = a3;
}

- (CGPoint)contentMotionRotation
{
  double x = self->_contentMotionRotation.x;
  double y = self->_contentMotionRotation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXGFocusEffectViewConfiguration *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v32.receiver = self;
      v32.super_class = (Class)PXGFocusEffectViewConfiguration;
      if (![(PXGFocusableViewConfiguration *)&v32 isEqual:v5]) {
        goto LABEL_14;
      }
      [(PXGFocusEffectViewConfiguration *)self cornerRadius];
      double v7 = v6;
      [(PXGFocusEffectViewConfiguration *)v5 cornerRadius];
      if (v7 != v8) {
        goto LABEL_14;
      }
      [(PXGFocusEffectViewConfiguration *)self contentMotionRotation];
      double v10 = v9;
      double v12 = v11;
      [(PXGFocusEffectViewConfiguration *)v5 contentMotionRotation];
      BOOL v14 = 0;
      if (v10 != v15) {
        goto LABEL_15;
      }
      if (v12 != v13) {
        goto LABEL_15;
      }
      [(PXGFocusEffectViewConfiguration *)self contentMotionTranslation];
      double v17 = v16;
      double v19 = v18;
      [(PXGFocusEffectViewConfiguration *)v5 contentMotionTranslation];
      BOOL v14 = 0;
      if (v17 != v21 || v19 != v20) {
        goto LABEL_15;
      }
      [(PXGFocusEffectViewConfiguration *)self focusedSizeIncrease];
      double v23 = v22;
      [(PXGFocusEffectViewConfiguration *)v5 focusedSizeIncrease];
      if (v23 == v24
        && ([(PXGFocusEffectViewConfiguration *)self shadowVerticalOffset],
            double v26 = v25,
            [(PXGFocusEffectViewConfiguration *)v5 shadowVerticalOffset],
            v26 == v27))
      {
        [(PXGFocusEffectViewConfiguration *)self shadowOpacity];
        double v29 = v28;
        [(PXGFocusEffectViewConfiguration *)v5 shadowOpacity];
        BOOL v14 = v29 == v30;
      }
      else
      {
LABEL_14:
        BOOL v14 = 0;
      }
LABEL_15:

      goto LABEL_16;
    }
    BOOL v14 = 0;
  }
LABEL_16:

  return v14;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)PXGFocusEffectViewConfiguration;
  unint64_t v3 = [(PXGFocusableViewConfiguration *)&v6 hash];
  int8x16_t v4 = veorq_s8((int8x16_t)vshlq_u64(vcvtq_u64_f64((float64x2_t)self->_contentMotionRotation), (uint64x2_t)xmmword_1AB31A720), (int8x16_t)vshlq_u64(vcvtq_u64_f64((float64x2_t)self->_contentMotionTranslation), (uint64x2_t)xmmword_1AB31A730));
  return *(void *)&veor_s8(*(int8x8_t *)v4.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL)) ^ (2
                                                                                                * (unint64_t)self->_cornerRadius) ^ ((unint64_t)self->_focusedSizeIncrease << 6) ^ ((unint64_t)self->_shadowVerticalOffset << 7) ^ v3 ^ ((unint64_t)self->_shadowOpacity << 8);
}

- (PXGFocusEffectViewConfiguration)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PXGFocusEffectViewConfiguration;
  v5 = [(PXGFocusableViewConfiguration *)&v21 initWithConfiguration:v4];
  objc_super v6 = v5;
  if (v5)
  {
    if (v4)
    {
      [v4 cornerRadius];
      v6->_cornerRadius = v7;
      [v4 contentMotionRotation];
      v6->_contentMotionRotation.double x = v8;
      v6->_contentMotionRotation.double y = v9;
      [v4 contentMotionTranslation];
      v6->_contentMotionTranslation.double x = v10;
      v6->_contentMotionTranslation.double y = v11;
      [v4 focusedSizeIncrease];
      v6->_focusedSizeIncrease = v12;
      [v4 shadowVerticalOffset];
      v6->_shadowVerticalOffset = v13;
      [v4 shadowOpacity];
    }
    else
    {
      v5->_cornerRadius = 5.0;
      v5->_contentMotionRotation = (CGPoint)vdupq_n_s64(0x3FA47AE147AE147BuLL);
      __asm { FMOV            V0.2D, #4.0 }
      v5->_contentMotionTranslation = _Q0;
      v5->_focusedSizeIncrease = 30.0;
      v5->_shadowVerticalOffset = 25.0;
      double v14 = 0.5;
    }
    v6->_shadowOpacitdouble y = v14;
  }

  return v6;
}

@end