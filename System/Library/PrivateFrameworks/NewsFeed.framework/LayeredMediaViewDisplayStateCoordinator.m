@interface LayeredMediaViewDisplayStateCoordinator
- (void)reduceMotionStatusDidChange;
- (void)sceneDidEnterBackground;
- (void)sceneWillEnterForeground;
@end

@implementation LayeredMediaViewDisplayStateCoordinator

- (void)sceneDidEnterBackground
{
}

- (void)sceneWillEnterForeground
{
}

- (void)reduceMotionStatusDidChange
{
  swift_retain();
  LayeredMediaViewDisplayStateCoordinator.updateDisplay()();
  swift_release();
}

@end