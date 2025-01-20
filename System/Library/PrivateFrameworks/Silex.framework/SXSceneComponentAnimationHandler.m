@interface SXSceneComponentAnimationHandler
- (BOOL)animationShouldRepeat;
- (double)screenHeightStartOffset;
@end

@implementation SXSceneComponentAnimationHandler

- (double)screenHeightStartOffset
{
  return 0.0;
}

- (BOOL)animationShouldRepeat
{
  return 1;
}

@end