@interface PDSplitDirectionOptions
- (int)inOut;
- (int)orientation;
- (void)setInOut:(int)a3;
- (void)setOrientation:(int)a3;
@end

@implementation PDSplitDirectionOptions

- (void)setInOut:(int)a3
{
  self->mInOut = a3;
}

- (void)setOrientation:(int)a3
{
  self->mOrientation = a3;
}

- (int)orientation
{
  return self->mOrientation;
}

- (int)inOut
{
  return self->mInOut;
}

@end