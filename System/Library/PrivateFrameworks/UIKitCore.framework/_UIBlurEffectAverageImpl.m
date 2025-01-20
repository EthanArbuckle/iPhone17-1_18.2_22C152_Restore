@interface _UIBlurEffectAverageImpl
+ (id)sharedInstance;
- (BOOL)isEqual:(id)a3;
- (_UIBlurEffectAverageImpl)initWithScale:(double)a3;
- (unint64_t)hash;
- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5;
- (void)appendDescriptionTo:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIBlurEffectAverageImpl

+ (id)sharedInstance
{
  v2 = (void *)_sharedAverageImplementation;
  if (!_sharedAverageImplementation)
  {
    uint64_t v3 = objc_opt_new();
    v4 = (void *)_sharedAverageImplementation;
    _sharedAverageImplementation = v3;

    v2 = (void *)_sharedAverageImplementation;
  }
  return v2;
}

- (_UIBlurEffectAverageImpl)initWithScale:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIBlurEffectAverageImpl;
  result = [(_UIBlurEffectAverageImpl *)&v5 init];
  if (result) {
    result->_scale = fmax(fmin(a3, 1.0), 0.0);
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
}

- (unint64_t)hash
{
  return vcvtd_n_u64_f64(self->_scale, 5uLL);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (double *)a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    BOOL v5 = v4[1] == self->_scale;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
}

- (void)appendDescriptionTo:(id)a3
{
  id v4 = a3;
  [v4 appendString:@" infiniteBlurRadius"];
  if (self->_scale > 0.0) {
    objc_msgSend(v4, "appendFormat:", @" scale=%f", *(void *)&self->_scale);
  }
}

@end