@interface PuzzleNotificationAutoEnableStartupTask
- (_TtC8NewsFeed39PuzzleNotificationAutoEnableStartupTask)init;
- (void)bundleSubscriptionDidExpire:(id)a3;
@end

@implementation PuzzleNotificationAutoEnableStartupTask

- (_TtC8NewsFeed39PuzzleNotificationAutoEnableStartupTask)init
{
  result = (_TtC8NewsFeed39PuzzleNotificationAutoEnableStartupTask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8NewsFeed39PuzzleNotificationAutoEnableStartupTask_executionPhase;
  uint64_t v4 = sub_1C1518C6C();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8NewsFeed39PuzzleNotificationAutoEnableStartupTask_notificationController));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8NewsFeed39PuzzleNotificationAutoEnableStartupTask_userInfo));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed39PuzzleNotificationAutoEnableStartupTask_featureAvailability);
  swift_unknownObjectRelease();
  v5 = (char *)self + OBJC_IVAR____TtC8NewsFeed39PuzzleNotificationAutoEnableStartupTask_puzzleHistoryService;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  uint64_t v4 = qword_1EB8814A0;
  id v5 = a3;
  v10 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1C15198DC();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EB93C7A8);
  v7 = sub_1C15198AC();
  os_log_type_t v8 = sub_1C151F38C();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1BFC31000, v7, v8, "PuzzleNotificationAutoEnableStartupTask received a subscription expired notification.", v9, 2u);
    MEMORY[0x1C18C9B00](v9, -1, -1);
  }

  sub_1C0BB5880();
}

@end