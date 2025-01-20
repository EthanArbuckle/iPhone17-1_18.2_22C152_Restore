@interface PuzzleStreakBackgroundWorkerManager
- (_TtC7NewsUI235PuzzleStreakBackgroundWorkerManager)init;
- (void)bundleSubscriptionDidExpire:(id)a3;
- (void)bundleSubscriptionDidSubscribe:(id)a3;
@end

@implementation PuzzleStreakBackgroundWorkerManager

- (_TtC7NewsUI235PuzzleStreakBackgroundWorkerManager)init
{
  result = (_TtC7NewsUI235PuzzleStreakBackgroundWorkerManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsUI235PuzzleStreakBackgroundWorkerManager_backgroundFetchManager));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI235PuzzleStreakBackgroundWorkerManager_workerFactory);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  uint64_t v4 = qword_1EBAC0150;
  id v5 = a3;
  v6 = self;
  if (v4 != -1) {
    swift_once();
  }
  sub_1DFDFEA60();
  sub_1DFDF00C0();
  sub_1DF19F20C();
}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  uint64_t v4 = qword_1EBAC0150;
  id v5 = a3;
  v6 = self;
  if (v4 != -1) {
    swift_once();
  }
  sub_1DFDFEA60();
  uint64_t v7 = MEMORY[0x1E4FBC860];
  sub_1DFDF00C0();
  v8 = (Class *)((char *)&v6->super.isa + OBJC_IVAR____TtC7NewsUI235PuzzleStreakBackgroundWorkerManager_registeredWorkers);
  swift_beginAccess();
  void *v8 = v7;

  swift_bridgeObjectRelease();
}

@end