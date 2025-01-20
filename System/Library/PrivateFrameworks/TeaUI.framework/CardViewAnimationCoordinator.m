@interface CardViewAnimationCoordinator
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (_TtC5TeaUI28CardViewAnimationCoordinator)init;
- (void)handleWithRecognizer:(id)a3;
@end

@implementation CardViewAnimationCoordinator

- (void)handleWithRecognizer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B6074544(v4);
}

- (_TtC5TeaUI28CardViewAnimationCoordinator)init
{
}

- (void).cxx_destruct
{
  sub_1B5E437C4((uint64_t)self + OBJC_IVAR____TtC5TeaUI28CardViewAnimationCoordinator_delegate);
  sub_1B5E437C4((uint64_t)self + OBJC_IVAR____TtC5TeaUI28CardViewAnimationCoordinator_parentDelegate);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5TeaUI28CardViewAnimationCoordinator_panGestureRecoginzer);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CardViewAnimationCoordinator.gestureRecognizer(_:shouldRecognizeSimultaneouslyWith:)((UIGestureRecognizer)v8, (UIGestureRecognizer)v7);

  return 1;
}

@end