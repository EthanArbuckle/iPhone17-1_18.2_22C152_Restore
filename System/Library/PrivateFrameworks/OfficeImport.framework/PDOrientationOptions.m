@interface PDOrientationOptions
- (int)orientation;
- (void)setOrientation:(int)a3;
@end

@implementation PDOrientationOptions

- (void)setOrientation:(int)a3
{
  self->mOrientation = a3;
}

- (int)orientation
{
  return self->mOrientation;
}

@end