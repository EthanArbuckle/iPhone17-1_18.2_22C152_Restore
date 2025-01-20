@interface PXBarAnimationOptions
- (PXBarAnimationOptions)init;
- (PXBarAnimationOptions)initWithType:(int64_t)a3;
- (PXBarAnimationOptions)initWithType:(int64_t)a3 duration:(double)a4;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (void)setDuration:(double)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PXBarAnimationOptions

- (PXBarAnimationOptions)initWithType:(int64_t)a3 duration:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PXBarAnimationOptions;
  result = [(PXBarAnimationOptions *)&v7 init];
  if (result)
  {
    result->_type = a3;
    result->_duration = a4;
  }
  return result;
}

- (PXBarAnimationOptions)initWithType:(int64_t)a3
{
  double v3 = *MEMORY[0x1E4FB2E08];
  if (!a3) {
    double v3 = 0.0;
  }
  return -[PXBarAnimationOptions initWithType:duration:](self, "initWithType:duration:", v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t v5 = [(PXBarAnimationOptions *)self type];
  [(PXBarAnimationOptions *)self duration];
  return (id)objc_msgSend(v4, "initWithType:duration:", v5);
}

- (int64_t)type
{
  return self->_type;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p, type=%lu, duration=%f>", objc_opt_class(), self, self->_type, *(void *)&self->_duration];
}

- (PXBarAnimationOptions)init
{
  return [(PXBarAnimationOptions *)self initWithType:0];
}

@end