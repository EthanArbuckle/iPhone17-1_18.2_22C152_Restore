@interface PDBlackOptions
- (BOOL)isThroughBlack;
- (void)setIsThroughBlack:(BOOL)a3;
@end

@implementation PDBlackOptions

- (void)setIsThroughBlack:(BOOL)a3
{
  self->mIsThroughBlack = a3;
}

- (BOOL)isThroughBlack
{
  return self->mIsThroughBlack;
}

@end