@interface VKLine
- (double)a;
- (double)b;
- (void)setA:(double)a3;
- (void)setB:(double)a3;
@end

@implementation VKLine

- (double)a
{
  return self->_a;
}

- (void)setA:(double)a3
{
  self->_a = a3;
}

- (double)b
{
  return self->_b;
}

- (void)setB:(double)a3
{
  self->_b = a3;
}

@end