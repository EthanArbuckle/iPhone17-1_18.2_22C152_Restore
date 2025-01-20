@interface LivePostPlayController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (NSString)description;
- (TVPPlayer)prefetchedPlayer;
- (_TtC8VideosUI22LivePostPlayController)init;
- (void)cleanup;
- (void)didTapWithGesture:(id)a3;
- (void)playerControlsVisibilityChanged:(BOOL)a3;
- (void)playerViewControllerWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)setPrefetchedPlayer:(id)a3;
@end

@implementation LivePostPlayController

- (TVPPlayer)prefetchedPlayer
{
  v2 = sub_1E308DD38();
  return (TVPPlayer *)v2;
}

- (void)setPrefetchedPlayer:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1E308DDDC(a3);
}

- (NSString)description
{
  v2 = self;
  sub_1E308DEF4();

  v3 = (void *)sub_1E387C8E8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_release();
  sub_1E3877538();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_47();
  v3();
  sub_1E2BEA270((uint64_t)self + OBJC_IVAR____TtC8VideosUI22LivePostPlayController_shelfFetchPolicy, &qword_1EADE9630);
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8VideosUI22LivePostPlayController____lazy_storage___tapGestureRecognizer);
}

- (void)didTapWithGesture:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1E3095EFC();
}

- (_TtC8VideosUI22LivePostPlayController)init
{
}

- (void)cleanup
{
  v2 = self;
  sub_1E30968F0();
}

- (void)playerControlsVisibilityChanged:(BOOL)a3
{
  v3 = self;
  sub_1E3096C10();
}

- (void)playerViewControllerWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1E309704C(a4, width, height);
  swift_unknownObjectRelease();
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1E3097258((uint64_t)v6, v7);

  return v9 & 1;
}

@end