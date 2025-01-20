@interface PuzzleStreakLocalNotificationScheduler
- (_TtC7NewsUI238PuzzleStreakLocalNotificationScheduler)init;
@end

@implementation PuzzleStreakLocalNotificationScheduler

- (_TtC7NewsUI238PuzzleStreakLocalNotificationScheduler)init
{
  result = (_TtC7NewsUI238PuzzleStreakLocalNotificationScheduler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI238PuzzleStreakLocalNotificationScheduler_notificationService);
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI238PuzzleStreakLocalNotificationScheduler_calendar;
  uint64_t v4 = sub_1DFDE7860();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI238PuzzleStreakLocalNotificationScheduler_puzzleHistoryService);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

@end