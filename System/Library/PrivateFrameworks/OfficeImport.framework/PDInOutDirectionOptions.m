@interface PDInOutDirectionOptions
- (int)inOut;
- (void)setInOut:(int)a3;
@end

@implementation PDInOutDirectionOptions

- (void)setInOut:(int)a3
{
  self->mInOut = a3;
}

- (int)inOut
{
  return self->mInOut;
}

@end