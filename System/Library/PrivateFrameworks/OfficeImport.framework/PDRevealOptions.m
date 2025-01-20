@interface PDRevealOptions
- (BOOL)isThroughBlack;
- (void)setIsThroughBlack:(BOOL)a3;
@end

@implementation PDRevealOptions

- (BOOL)isThroughBlack
{
  return *((unsigned char *)&self->super.mDirection + 4);
}

- (void)setIsThroughBlack:(BOOL)a3
{
  *((unsigned char *)&self->super.mDirection + 4) = a3;
}

@end