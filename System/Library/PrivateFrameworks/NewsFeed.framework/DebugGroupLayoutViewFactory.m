@interface DebugGroupLayoutViewFactory
- (_TtC8NewsFeed27DebugGroupLayoutViewFactory)init;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
@end

@implementation DebugGroupLayoutViewFactory

- (_TtC8NewsFeed27DebugGroupLayoutViewFactory)init
{
  result = (_TtC8NewsFeed27DebugGroupLayoutViewFactory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed27DebugGroupLayoutViewFactory_colorPaletteProvider);
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  sub_1C1317FC8();

  swift_unknownObjectRelease();
  sub_1BFC39268(0, &qword_1EA1AE300);
  v7 = (void *)sub_1C151EBAC();
  swift_bridgeObjectRelease();
  return v7;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  v10 = sub_1C1318190(v7);

  swift_unknownObjectRelease();
  return v10;
}

@end