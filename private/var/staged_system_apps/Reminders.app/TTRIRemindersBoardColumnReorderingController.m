@interface TTRIRemindersBoardColumnReorderingController
- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4;
- (_TtC9Reminders44TTRIRemindersBoardColumnReorderingController)init;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3;
- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 sessionDidMove:(id)a4;
- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5;
@end

@implementation TTRIRemindersBoardColumnReorderingController

- (_TtC9Reminders44TTRIRemindersBoardColumnReorderingController)init
{
  result = (_TtC9Reminders44TTRIRemindersBoardColumnReorderingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000499D4((uint64_t)self + OBJC_IVAR____TtC9Reminders44TTRIRemindersBoardColumnReorderingController_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC9Reminders44TTRIRemindersBoardColumnReorderingController_id;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9Reminders44TTRIRemindersBoardColumnReorderingController_collectionView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9Reminders44TTRIRemindersBoardColumnReorderingController_dataSource));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9Reminders44TTRIRemindersBoardColumnReorderingController_debugOverlayView));

  swift_release();
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_1002E4F98(a4);

  swift_unknownObjectRelease();
  sub_1000368FC(0, (unint64_t *)&qword_100791B50);
  v8.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v8.super.isa;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  return 0;
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  id v7 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  NSArray v8 = self;
  sub_1002E56B0(a5);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3
{
  uint64_t v5 = sub_10003B754(&qword_10079AF90);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  v9 = self;
  sub_1002E322C(2u);
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  type metadata accessor for MainActor();
  swift_retain();
  uint64_t v12 = static MainActor.shared.getter();
  v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = &protocol witness table for MainActor;
  v13[4] = v11;
  swift_release();
  sub_10022F74C((uint64_t)v7, (uint64_t)&unk_100798598, (uint64_t)v13);

  swift_release();
}

- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4
{
  return 1;
}

- (void)dragInteraction:(id)a3 sessionDidMove:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = self;
  sub_1002E5CE8(a4);

  swift_unknownObjectRelease();
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  swift_getObjectType();
  id v8 = a3;
  swift_unknownObjectRetain();
  v9 = self;
  if (sub_1002E4C68(a4, (uint64_t)v9)) {
    sub_1002E322C(5u);
  }
  sub_1002E322C(6u);

  swift_unknownObjectRelease();
}

@end