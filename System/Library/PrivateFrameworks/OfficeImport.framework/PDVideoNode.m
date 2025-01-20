@interface PDVideoNode
- (BOOL)isFullScreen;
- (void)setIsFullScreen:(BOOL)a3;
@end

@implementation PDVideoNode

- (void)setIsFullScreen:(BOOL)a3
{
  self->mIsFullScreen = a3;
}

- (BOOL)isFullScreen
{
  return self->mIsFullScreen;
}

@end