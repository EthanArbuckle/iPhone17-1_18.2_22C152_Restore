@interface PDInvertCoordinateOptions
- (BOOL)isInvX;
- (BOOL)isInvY;
- (void)setIsInvX:(BOOL)a3;
- (void)setIsInvY:(BOOL)a3;
@end

@implementation PDInvertCoordinateOptions

- (BOOL)isInvX
{
  return self->mIsInvX;
}

- (void)setIsInvX:(BOOL)a3
{
  self->mIsInvX = a3;
}

- (BOOL)isInvY
{
  return self->mIsInvY;
}

- (void)setIsInvY:(BOOL)a3
{
  self->mIsInvY = a3;
}

@end