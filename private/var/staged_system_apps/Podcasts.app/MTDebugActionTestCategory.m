@interface MTDebugActionTestCategory
- (_TtC8Podcasts25MTDebugActionTestCategory)init;
- (_TtC8Podcasts25MTDebugActionTestCategory)initWithName:(id)a3 title:(id)a4;
@end

@implementation MTDebugActionTestCategory

- (_TtC8Podcasts25MTDebugActionTestCategory)initWithName:(id)a3 title:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Podcasts25MTDebugActionTestCategory_name);
  uint64_t *v9 = v5;
  v9[1] = v7;
  v10 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Podcasts25MTDebugActionTestCategory_title);
  uint64_t *v10 = v8;
  v10[1] = v11;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for MTDebugActionTestCategory();
  return [(MTDebugActionTestCategory *)&v13 init];
}

- (_TtC8Podcasts25MTDebugActionTestCategory)init
{
  result = (_TtC8Podcasts25MTDebugActionTestCategory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end