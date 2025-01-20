@interface SearchDataManager
- (_TtC8BookEPUB17SearchDataManager)init;
- (uint64_t)searchControllerResultsChanged:(char *)a1;
- (void)searchControllerDidFinishSearching:(id)a3;
- (void)searchControllerWillBeginSearching:(id)a3 reportAnalytics:(BOOL)a4;
@end

@implementation SearchDataManager

- (_TtC8BookEPUB17SearchDataManager)init
{
  result = (_TtC8BookEPUB17SearchDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_4F924((uint64_t)self + OBJC_IVAR____TtC8BookEPUB17SearchDataManager_delegate);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)searchControllerWillBeginSearching:(id)a3 reportAnalytics:(BOOL)a4
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8BookEPUB17SearchDataManager_searchController);
    swift_unknownObjectRetain();
    v7 = self;
    id v8 = [v6 results];
    sub_371F4(&qword_3FE898);
    unint64_t v9 = sub_2FC3F0();

    sub_4E464(v9, a4);
    swift_unknownObjectRelease();

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
}

- (void)searchControllerDidFinishSearching:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_7B550();
  swift_unknownObjectRelease();
}

- (uint64_t)searchControllerResultsChanged:(char *)a1
{
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    v3 = *(void **)&a1[OBJC_IVAR____TtC8BookEPUB17SearchDataManager_searchController];
    swift_unknownObjectRetain();
    v4 = a1;
    id v5 = [v3 results];
    sub_371F4(&qword_3FE898);
    unint64_t v6 = sub_2FC3F0();

    sub_4E34C(v6);
    swift_unknownObjectRelease();

    swift_bridgeObjectRelease();
    return swift_unknownObjectRelease();
  }
  return result;
}

@end