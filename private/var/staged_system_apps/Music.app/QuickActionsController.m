@interface QuickActionsController
- (_TtC5Music22QuickActionsController)init;
@end

@implementation QuickActionsController

- (_TtC5Music22QuickActionsController)init
{
  return (_TtC5Music22QuickActionsController *)sub_100048F38();
}

- (void).cxx_destruct
{
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music22QuickActionsController_nowPlayingSubscription, &qword_1010B46B0);
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music22QuickActionsController_playMyStationShortcutItem);
}

@end