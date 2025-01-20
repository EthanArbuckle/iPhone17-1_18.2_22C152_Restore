@interface PDWheelDirectionOptions
- (int)spokes;
- (void)setSpokes:(int)a3;
@end

@implementation PDWheelDirectionOptions

- (void)setSpokes:(int)a3
{
  self->mSpokes = a3;
}

- (int)spokes
{
  return self->mSpokes;
}

@end