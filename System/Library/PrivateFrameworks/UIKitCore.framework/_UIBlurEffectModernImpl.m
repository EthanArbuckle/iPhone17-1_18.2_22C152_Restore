@interface _UIBlurEffectModernImpl
- (BOOL)isEqual:(id)a3;
- (_UIBlurEffectModernImpl)initWithBlurRadius:(double)a3 scale:(double)a4;
- (unint64_t)hash;
- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5;
- (void)appendDescriptionTo:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIBlurEffectModernImpl

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  if ([v7 reducedTransperancy]) {
    _UIBlurEffectAddAverageColorFilterEntry(v8, v7, fmax(self->_blurScale, 0.25));
  }
  else {
    _UIBlurEffectAddBlurFilterEntry(v8, v7, self->_blurRadius, self->_blurScale);
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (double *)a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && v4[1] == self->_blurRadius
    && v4[2] == self->_blurScale;

  return v5;
}

- (_UIBlurEffectModernImpl)initWithBlurRadius:(double)a3 scale:(double)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_UIBlurEffectModernImpl;
  result = [(_UIBlurEffectModernImpl *)&v8 init];
  if (result)
  {
    if (a3 >= 0.0) {
      double v7 = a3;
    }
    else {
      double v7 = 0.0;
    }
    result->_blurRadius = v7;
    result->_blurScale = fmax(fmin(a4, 1.0), 0.0);
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_blurRadius > 0.0)
  {
    objc_msgSend(v4, "encodeDouble:forKey:", @"UIBlurEffectRadius");
    id v4 = v5;
  }
  if (self->_blurScale > 0.0)
  {
    objc_msgSend(v5, "encodeDouble:forKey:", @"UIBlurEffectScale");
    id v4 = v5;
  }
}

- (unint64_t)hash
{
  return vcvtmd_u64_f64(self->_blurRadius);
}

- (void)appendDescriptionTo:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "appendFormat:", @" blurRadius=%f", *(void *)&self->_blurRadius);
  if (self->_blurScale > 0.0) {
    objc_msgSend(v4, "appendFormat:", @" blurScale=%f", *(void *)&self->_blurScale);
  }
}

@end