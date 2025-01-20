@interface _NUColorSamplerResult
- ($0AC6E346AE4835514AAA8AC86D8F4844)point;
- (CGColor)color;
- (void)dealloc;
- (void)setColor:(CGColor *)a3;
- (void)setPoint:(id)a3;
@end

@implementation _NUColorSamplerResult

- (void)setColor:(CGColor *)a3
{
}

- (CGColor)color
{
  return self->_color;
}

- (void)setPoint:(id)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3 = a3;
  objc_copyStruct(&self->_point, &v3, 16, 1, 0);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)point
{
  objc_copyStruct(v4, &self->_point, 16, 1, 0);
  int64_t v2 = v4[0];
  int64_t v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)dealloc
{
  CGColorRelease(self->_color);
  v3.receiver = self;
  v3.super_class = (Class)_NUColorSamplerResult;
  [(_NUColorSamplerResult *)&v3 dealloc];
}

@end