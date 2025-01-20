@interface TagDeletionAlertController
- (_TtC11MobileNotes26TagDeletionAlertController)init;
- (_TtC11MobileNotes26TagDeletionAlertController)initWithViewControllerManager:(id)a3 window:(id)a4 eventReporter:(id)a5 deletionMethod:(int64_t)a6;
- (id)makeDeleteTagAlertControllerWithTags:(id)a3 sendNotification:(BOOL)a4;
@end

@implementation TagDeletionAlertController

- (_TtC11MobileNotes26TagDeletionAlertController)initWithViewControllerManager:(id)a3 window:(id)a4 eventReporter:(id)a5 deletionMethod:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (_TtC11MobileNotes26TagDeletionAlertController *)sub_1002749A8(a3, a4, a5, a6);

  return v13;
}

- (id)makeDeleteTagAlertControllerWithTags:(id)a3 sendNotification:(BOOL)a4
{
  sub_100031418(0, (unint64_t *)&qword_1006A49F0);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = self;
  id v8 = sub_1002722D4(v6, a4);

  swift_bridgeObjectRelease();

  return v8;
}

- (_TtC11MobileNotes26TagDeletionAlertController)init
{
  result = (_TtC11MobileNotes26TagDeletionAlertController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes26TagDeletionAlertController_viewControllerManager));

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11MobileNotes26TagDeletionAlertController_eventReporter);
}

@end