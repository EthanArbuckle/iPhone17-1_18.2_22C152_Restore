@interface PUOneUpVideoPlayerController
- (PUBrowsingVideoPlayer)player;
- (PUOneUpVideoPlayerController)init;
- (PUOneUpVideoPlayerControllerDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)setPlayer:(id)a3;
- (void)updateWithBrowsingViewModel:(id)a3;
@end

@implementation PUOneUpVideoPlayerController

- (PUOneUpVideoPlayerController)init
{
  return (PUOneUpVideoPlayerController *)OneUpVideoPlayerController.init()();
}

- (PUBrowsingVideoPlayer)player
{
  v2 = sub_1AEAE9B54();
  return (PUBrowsingVideoPlayer *)v2;
}

- (void)setPlayer:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AEAE9BF8(a3);
}

- (PUOneUpVideoPlayerControllerDelegate)delegate
{
  v2 = (void *)sub_1AEAE9D80();
  return (PUOneUpVideoPlayerControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AEAE9E24();
}

- (void).cxx_destruct
{
  sub_1AEA2489C((uint64_t)self + OBJC_IVAR___PUOneUpVideoPlayerController_delegate);
  v3 = (char *)self + OBJC_IVAR___PUOneUpVideoPlayerController_oneUpState;
  sub_1AEAEA4C0((uint64_t)v3);
}

- (void)updateWithBrowsingViewModel:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AEAEBE04(v4);
}

@end