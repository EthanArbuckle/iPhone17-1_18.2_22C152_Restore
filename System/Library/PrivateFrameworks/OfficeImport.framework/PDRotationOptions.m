@interface PDRotationOptions
- (int)direction;
- (void)setDirection:(int)a3;
@end

@implementation PDRotationOptions

- (int)direction
{
  return self->mDirection;
}

- (void)setDirection:(int)a3
{
  self->mDirection = a3;
}

@end