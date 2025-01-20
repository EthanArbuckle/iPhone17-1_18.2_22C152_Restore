@interface PDAudioNode
- (BOOL)isNarration;
- (void)setIsNarration:(BOOL)a3;
@end

@implementation PDAudioNode

- (void)setIsNarration:(BOOL)a3
{
  self->mIsNarration = a3;
}

- (BOOL)isNarration
{
  return self->mIsNarration;
}

@end