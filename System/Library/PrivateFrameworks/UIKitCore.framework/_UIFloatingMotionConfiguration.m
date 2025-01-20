@interface _UIFloatingMotionConfiguration
+ (id)configurationWithLargeTranslationOnAxis:(unint64_t)a3;
+ (id)configurationWithRotation:(CGPoint)a3;
+ (id)configurationWithRotationOnAxis:(unint64_t)a3;
+ (id)configurationWithTranslation:(CGPoint)a3;
+ (id)configurationWithTranslationOnAxis:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (CGPoint)rotation;
- (CGPoint)translation;
- (id)_initWithTranslation:(CGPoint)a3 rotation:(CGPoint)a4;
- (unint64_t)hash;
@end

@implementation _UIFloatingMotionConfiguration

+ (id)configurationWithRotationOnAxis:(unint64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
    double v3 = 0.04;
  }
  else {
    double v3 = 0.0;
  }
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    double v4 = 0.04;
  }
  else {
    double v4 = 0.0;
  }
  id v5 = objc_alloc((Class)a1);
  v6 = objc_msgSend(v5, "_initWithTranslation:rotation:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v3, v4);
  return v6;
}

+ (id)configurationWithTranslationOnAxis:(unint64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
    double v3 = 4.0;
  }
  else {
    double v3 = 0.0;
  }
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    double v4 = 4.0;
  }
  else {
    double v4 = 0.0;
  }
  id v5 = objc_alloc((Class)a1);
  v6 = objc_msgSend(v5, "_initWithTranslation:rotation:", v3, v4, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  return v6;
}

+ (id)configurationWithLargeTranslationOnAxis:(unint64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
    double v3 = 8.0;
  }
  else {
    double v3 = 0.0;
  }
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    double v4 = 8.0;
  }
  else {
    double v4 = 0.0;
  }
  id v5 = objc_alloc((Class)a1);
  v6 = objc_msgSend(v5, "_initWithTranslation:rotation:", v3, v4, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  return v6;
}

+ (id)configurationWithRotation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = objc_alloc((Class)a1);
  v6 = objc_msgSend(v5, "_initWithTranslation:rotation:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), x, y);
  return v6;
}

+ (id)configurationWithTranslation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = objc_alloc((Class)a1);
  v6 = objc_msgSend(v5, "_initWithTranslation:rotation:", x, y, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  return v6;
}

- (id)_initWithTranslation:(CGPoint)a3 rotation:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v6 = a3.y;
  CGFloat v7 = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)_UIFloatingMotionConfiguration;
  id result = [(_UIFloatingMotionConfiguration *)&v9 init];
  if (result)
  {
    *((CGFloat *)result + 3) = v7;
    *((CGFloat *)result + 4) = v6;
    *((CGFloat *)result + 1) = x;
    *((CGFloat *)result + 2) = y;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (_UIFloatingMotionConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (([(_UIFloatingMotionConfiguration *)v4 translation], self->_translation.x == v6)
        ? (BOOL v7 = self->_translation.y == v5)
        : (BOOL v7 = 0),
          v7))
    {
      [(_UIFloatingMotionConfiguration *)v4 rotation];
      BOOL v8 = self->_rotation.y == v10 && self->_rotation.x == v9;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  int8x16_t v2 = veorq_s8((int8x16_t)vcvtq_u64_f64(vmulq_f64((float64x2_t)self->_rotation, (float64x2_t)xmmword_186B93540)), (int8x16_t)vcvtq_u64_f64(vmulq_f64((float64x2_t)self->_translation, (float64x2_t)xmmword_186B93550)));
  return (unint64_t)veor_s8(*(int8x8_t *)v2.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL));
}

- (CGPoint)rotation
{
  double x = self->_rotation.x;
  double y = self->_rotation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)translation
{
  double x = self->_translation.x;
  double y = self->_translation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end