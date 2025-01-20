@interface NewIssueLocalNotificationScheduler
- (_TtC7NewsUI234NewIssueLocalNotificationScheduler)init;
- (void)issueReadingHistoryDidChange:(id)a3 forIssueIDs:(id)a4;
@end

@implementation NewIssueLocalNotificationScheduler

- (_TtC7NewsUI234NewIssueLocalNotificationScheduler)init
{
  result = (_TtC7NewsUI234NewIssueLocalNotificationScheduler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI234NewIssueLocalNotificationScheduler_notificationService);
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI234NewIssueLocalNotificationScheduler_calendar;
  uint64_t v4 = sub_1DFDE7860();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
}

- (void)issueReadingHistoryDidChange:(id)a3 forIssueIDs:(id)a4
{
  swift_getObjectType();
  sub_1DFBBA7F0(0, (unint64_t *)&qword_1EBACA520, type metadata accessor for UserNotification, MEMORY[0x1E4FBB320]);
  id v6 = a3;
  v7 = self;
  sub_1DFDEE090();
  *(void *)(swift_allocObject() + 16) = v7;
  v8 = v7;
  v9 = (void *)sub_1DFDEDCE0();
  sub_1DFDEDE20();

  swift_release();
  swift_release();
  swift_release();
}

@end