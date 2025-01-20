@interface SUUISizeValue
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (SUUISizeValue)initWithSize:(CGSize)a3;
- (id)description;
- (unint64_t)hash;
- (void)unionWithSize:(CGSize)a3;
@end

@implementation SUUISizeValue

- (SUUISizeValue)initWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)SUUISizeValue;
  result = [(SUUISizeValue *)&v6 init];
  if (result)
  {
    result->_double height = (uint64_t)height;
    result->_double width = (uint64_t)width;
  }
  return result;
}

- (CGSize)size
{
  double width = (double)self->_width;
  double height = (double)self->_height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)unionWithSize:(CGSize)a3
{
  float64x2_t v3 = vcvtq_f64_s64(*(int64x2_t *)&self->_height);
  CGFloat width = a3.width;
  *(int64x2_t *)&self->_double height = vcvtq_s64_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(*(float64x2_t *)&a3.height, v3), *(int8x16_t *)&a3.height, (int8x16_t)v3));
}

- (id)description
{
  float64x2_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SUUISizeValue;
  v4 = [(SUUISizeValue *)&v8 description];
  [(SUUISizeValue *)self size];
  v5 = NSStringFromCGSize(v10);
  objc_super v6 = [v3 stringWithFormat:@"%@: %@", v4, v5];

  return v6;
}

- (unint64_t)hash
{
  return self->_width;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = v5 == objc_opt_class() && self->_width == v4[2] && self->_height == v4[1];

  return v6;
}

@end