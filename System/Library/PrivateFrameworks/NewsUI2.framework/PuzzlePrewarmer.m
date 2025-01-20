@interface PuzzlePrewarmer
- (_TtC7NewsUI215PuzzlePrewarmer)init;
- (void)networkReachabilityDidChange:(id)a3;
@end

@implementation PuzzlePrewarmer

- (_TtC7NewsUI215PuzzlePrewarmer)init
{
  result = (_TtC7NewsUI215PuzzlePrewarmer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI215PuzzlePrewarmer_puzzleService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI215PuzzlePrewarmer_puzzleHistoryService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI215PuzzlePrewarmer_puzzleStatsService);
  swift_unknownObjectRelease();
}

- (void)networkReachabilityDidChange:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  if (objc_msgSend(a3, sel_isNetworkReachable))
  {
    sub_1DE984F2C();
    swift_unknownObjectRelease();

    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
  }
}

@end