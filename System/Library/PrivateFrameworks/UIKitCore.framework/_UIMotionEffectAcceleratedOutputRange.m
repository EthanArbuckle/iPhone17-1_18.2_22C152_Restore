@interface _UIMotionEffectAcceleratedOutputRange
- (BOOL)isEqual:(id)a3;
- (CGPoint)acceleration;
- (UIOffset)acceleratedOutputForViewerOffset:(UIOffset)a3 accelerationBoostFactor:(CGPoint)a4;
- (_UIMotionEffectAcceleratedOutputRange)init;
- (_UIMotionEffectAcceleratedOutputRange)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)reset;
- (void)setAcceleration:(CGPoint)a3 fixingOutputForViewerOffset:(UIOffset)a4;
@end

@implementation _UIMotionEffectAcceleratedOutputRange

- (void)setAcceleration:(CGPoint)a3 fixingOutputForViewerOffset:(UIOffset)a4
{
  double vertical = a4.vertical;
  double horizontal = a4.horizontal;
  double y = a3.y;
  double x = a3.x;
  _AssertPointComponentsArePositive(a3.x, a3.y);
  double v9 = self->_acceleration.x;
  if (vabdd_f64(x, v9) >= 2.22044605e-16)
  {
    self->_referenceOffset.double horizontal = horizontal - self->_referenceOffset.horizontal;
    self->_referenceAcceleration.double x = v9;
  }
  double v10 = self->_acceleration.y;
  if (vabdd_f64(y, v10) >= 2.22044605e-16)
  {
    self->_referenceOffset.double vertical = vertical - self->_referenceOffset.vertical;
    self->_referenceAcceleration.double y = v10;
  }
  self->_acceleration.double x = x;
  self->_acceleration.double y = y;
}

- (UIOffset)acceleratedOutputForViewerOffset:(UIOffset)a3 accelerationBoostFactor:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat vertical = a3.vertical;
  CGFloat horizontal = a3.horizontal;
  _AssertPointComponentsArePositive(a4.x, a4.y);
  v5.f64[0] = x;
  v5.f64[1] = y;
  __asm { FMOV            V0.2D, #1.0 }
  float64x2_t v11 = vaddq_f64(v5, _Q0);
  float64x2_t v12 = vnegq_f64(v11);
  float64x2_t v13 = vaddq_f64(vmulq_f64(v5, (float64x2_t)self->_referenceAcceleration), _Q0);
  float64x2_t v14 = vaddq_f64(vmulq_f64(v5, (float64x2_t)self->_acceleration), _Q0);
  v15.f64[0] = horizontal;
  v15.f64[1] = vertical;
  float64x2_t v16 = vaddq_f64(vmulq_f64(v15, v14), vmulq_f64((float64x2_t)self->_referenceOffset, vsubq_f64(v13, v14)));
  float64x2_t v17 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v16, v11), (int8x16_t)v11, (int8x16_t)v16);
  int8x16_t v18 = vbslq_s8((int8x16_t)vcgtq_f64(v17, v12), (int8x16_t)v17, (int8x16_t)v12);
  double v19 = *(double *)&v18.i64[1];
  result.CGFloat horizontal = *(double *)v18.i64;
  result.CGFloat vertical = v19;
  return result;
}

- (_UIMotionEffectAcceleratedOutputRange)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIMotionEffectAcceleratedOutputRange;
  v2 = [(_UIMotionEffectAcceleratedOutputRange *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(_UIMotionEffectAcceleratedOutputRange *)v2 reset];
    v4 = v3;
  }

  return v3;
}

- (void)reset
{
  CGPoint v2 = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_referenceAcceleration = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_acceleration = v2;
  self->_referenceOffset.CGFloat horizontal = 0.0;
  self->_referenceOffset.CGFloat vertical = 0.0;
}

- (_UIMotionEffectAcceleratedOutputRange)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIMotionEffectAcceleratedOutputRange;
  float64x2_t v5 = [(_UIMotionEffectAcceleratedOutputRange *)&v15 init];
  objc_super v6 = v5;
  if (v5)
  {
    [(_UIMotionEffectAcceleratedOutputRange *)v5 reset];
    [v4 decodeUIOffsetForKey:@"UIReferenceOffset"];
    v6->_referenceOffset.CGFloat horizontal = v7;
    v6->_referenceOffset.CGFloat vertical = v8;
    [v4 decodeCGPointForKey:@"UIReferenceAcceleration"];
    v6->_referenceAcceleration.CGFloat x = v9;
    v6->_referenceAcceleration.CGFloat y = v10;
    [v4 decodeCGPointForKey:@"UIAcceleration"];
    v6->_acceleration.CGFloat x = v11;
    v6->_acceleration.CGFloat y = v12;
    float64x2_t v13 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  double horizontal = self->_referenceOffset.horizontal;
  double vertical = self->_referenceOffset.vertical;
  id v6 = a3;
  objc_msgSend(v6, "encodeUIOffset:forKey:", @"UIReferenceOffset", horizontal, vertical);
  objc_msgSend(v6, "encodeCGPoint:forKey:", @"UIReferenceAcceleration", self->_referenceAcceleration.x, self->_referenceAcceleration.y);
  objc_msgSend(v6, "encodeCGPoint:forKey:", @"UIAcceleration", self->_acceleration.x, self->_acceleration.y);
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  float64x2_t v5 = NSStringFromClass(v4);
  id v6 = NSStringFromUIOffset(self->_referenceOffset);
  CGFloat v7 = NSStringFromCGPoint(self->_referenceAcceleration);
  CGFloat v8 = NSStringFromCGPoint(self->_acceleration);
  CGFloat v9 = [v3 stringWithFormat:@"<%@: %p referenceOffset=%@ lastAcceleration=%@ acceleration=%@>", v5, self, v6, v7, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    float64x2_t v5 = (double *)v4;
    BOOL v6 = self->_referenceAcceleration.x == v5[3] && self->_referenceAcceleration.y == v5[4];
    BOOL v8 = v6
      && (self->_referenceOffset.horizontal == v5[1] ? (BOOL v7 = self->_referenceOffset.vertical == v5[2]) : (BOOL v7 = 0), v7)
      && self->_acceleration.y == v5[6]
      && self->_acceleration.x == v5[5];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return (unint64_t)(floor(self->_acceleration.y * 100.0)
                          + (double)(31
                                   * (unint64_t)(floor(self->_acceleration.x * 100.0)
                                                      + (double)(31
                                                               * (unint64_t)(floor(self->_referenceOffset.vertical* 100.0)+ (double)(31* (unint64_t)(floor(self->_referenceOffset.horizontal * 100.0) + (double)(31 * (unint64_t)(floor(self->_referenceAcceleration.y * 100.0) + (double)(31 * (unint64_t)(floor(self->_referenceAcceleration.x * 100.0) + 31.0)))))))))));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init(_UIMotionEffectAcceleratedOutputRange);
  *(UIOffset *)((char *)result + 8) = self->_referenceOffset;
  *(CGPoint *)((char *)result + 24) = self->_referenceAcceleration;
  *(CGPoint *)((char *)result + 40) = self->_acceleration;
  return result;
}

- (CGPoint)acceleration
{
  double x = self->_acceleration.x;
  double y = self->_acceleration.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end