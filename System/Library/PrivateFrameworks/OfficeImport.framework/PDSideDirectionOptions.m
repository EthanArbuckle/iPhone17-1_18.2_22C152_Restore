@interface PDSideDirectionOptions
- (int)direction;
- (void)setDirection:(int)a3;
@end

@implementation PDSideDirectionOptions

- (void)setDirection:(int)a3
{
  self->mDirection = a3;
}

- (int)direction
{
  return self->mDirection;
}

@end