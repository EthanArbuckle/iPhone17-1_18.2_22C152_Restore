@interface IPAScaleImageSizePolicy
- (BOOL)isEqual:(id)a3;
- (CGSize)transformSize:(CGSize)a3;
- (IPAScaleImageSizePolicy)initWithCoder:(id)a3;
- (IPAScaleImageSizePolicy)initWithScale:(double)a3;
- (double)transformScaleForSize:(CGSize)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IPAScaleImageSizePolicy

- (unint64_t)hash
{
  return (unint64_t)self->_scale;
}

- (BOOL)isEqual:(id)a3
{
  return self->_scale == *((double *)a3 + 1);
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IPAScaleImageSizePolicy;
  id v4 = a3;
  [(IPAImageSizePolicy *)&v6 encodeWithCoder:v4];
  double scale = self->_scale;
  *(float *)&double scale = scale;
  objc_msgSend(v4, "encodeFloat:forKey:", @"scale", scale, v6.receiver, v6.super_class);
}

- (IPAScaleImageSizePolicy)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IPAScaleImageSizePolicy;
  id v3 = a3;
  id v4 = [(IPAImageSizePolicy *)&v8 initWithCoder:v3];
  objc_msgSend(v3, "decodeFloatForKey:", @"scale", v8.receiver, v8.super_class);
  float v6 = v5;

  v4->_double scale = v6;
  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p> scale=%f", objc_opt_class(), self, *(void *)&self->_scale];
}

- (double)transformScaleForSize:(CGSize)a3
{
  return self->_scale;
}

- (CGSize)transformSize:(CGSize)a3
{
  double scale = self->_scale;
  double v4 = round(a3.width * scale);
  double v5 = round(a3.height * scale);
  result.height = v5;
  result.width = v4;
  return result;
}

- (IPAScaleImageSizePolicy)initWithScale:(double)a3
{
  if (a3 <= 0.0 || a3 >= 100.0)
  {
    double v7 = a3;
    _PFAssertContinueHandler();
  }
  v8.receiver = self;
  v8.super_class = (Class)IPAScaleImageSizePolicy;
  CGSize result = [(IPAScaleImageSizePolicy *)&v8 init];
  if (result) {
    result->_double scale = a3;
  }
  return result;
}

@end