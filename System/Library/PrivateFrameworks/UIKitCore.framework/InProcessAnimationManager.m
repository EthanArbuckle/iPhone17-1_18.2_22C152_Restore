@interface InProcessAnimationManager
- (void)applicationBecameActive;
- (void)applicationDidEnterBackground;
- (void)displayLinkFire:(id)a3;
- (void)screenBasedSceneDidDisconnect:(id)a3;
- (void)screenBasedSceneWillAttachWindow:(id)a3;
@end

@implementation InProcessAnimationManager

- (void)displayLinkFire:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_1856ABED4(v3);
  swift_release();
}

- (void)screenBasedSceneWillAttachWindow:(id)a3
{
}

- (void)screenBasedSceneDidDisconnect:(id)a3
{
}

- (void)applicationDidEnterBackground
{
}

- (void)applicationBecameActive
{
}

@end