@interface SamplerIdentifier
- (SamplerIdentifier)initWithFirst:(unint64_t)a3 second:(unint64_t)a4;
- (unint64_t)first;
- (unint64_t)second;
- (void)setFirst:(unint64_t)a3;
- (void)setSecond:(unint64_t)a3;
@end

@implementation SamplerIdentifier

- (SamplerIdentifier)initWithFirst:(unint64_t)a3 second:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SamplerIdentifier;
  v6 = [(SamplerIdentifier *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_first = a3;
    v6->_second = a4;
    v8 = v6;
  }

  return v7;
}

- (unint64_t)first
{
  return self->_first;
}

- (void)setFirst:(unint64_t)a3
{
  self->_first = a3;
}

- (unint64_t)second
{
  return self->_second;
}

- (void)setSecond:(unint64_t)a3
{
  self->_second = a3;
}

@end