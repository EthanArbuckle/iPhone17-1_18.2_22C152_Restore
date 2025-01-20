@interface NUCGAffineTransform
- (CGAffineTransform)value;
- (NUCGAffineTransform)initWithCGAffineTransform:(CGAffineTransform *)a3;
@end

@implementation NUCGAffineTransform

- (CGAffineTransform)value
{
  objc_copyStruct(retstr, &self->_value, 48, 1, 0);
  return result;
}

- (NUCGAffineTransform)initWithCGAffineTransform:(CGAffineTransform *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NUCGAffineTransform;
  result = [(NUCGAffineTransform *)&v7 init];
  if (result)
  {
    long long v5 = *(_OWORD *)&a3->a;
    long long v6 = *(_OWORD *)&a3->c;
    *(_OWORD *)&result->_value.tx = *(_OWORD *)&a3->tx;
    *(_OWORD *)&result->_value.c = v6;
    *(_OWORD *)&result->_value.a = v5;
  }
  return result;
}

@end