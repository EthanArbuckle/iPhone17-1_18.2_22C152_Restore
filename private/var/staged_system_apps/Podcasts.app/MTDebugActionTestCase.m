@interface MTDebugActionTestCase
- (_TtC8Podcasts21MTDebugActionTestCase)init;
- (_TtC8Podcasts21MTDebugActionTestCase)initWithCategory:(id)a3 name:(id)a4 title:(id)a5 handler:(id)a6;
@end

@implementation MTDebugActionTestCase

- (_TtC8Podcasts21MTDebugActionTestCase)initWithCategory:(id)a3 name:(id)a4 title:(id)a5 handler:(id)a6
{
  v8 = _Block_copy(a6);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v8;
  v16 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts21MTDebugActionTestCase_category);
  v16[3] = (id)type metadata accessor for MTDebugActionTestCategory();
  v16[4] = (id)sub_1002C4B40();
  id *v16 = a3;
  v17 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Podcasts21MTDebugActionTestCase_name);
  uint64_t *v17 = v9;
  v17[1] = v11;
  v18 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Podcasts21MTDebugActionTestCase_title);
  uint64_t *v18 = v12;
  v18[1] = v14;
  v19 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC8Podcasts21MTDebugActionTestCase_handler);
  *v19 = sub_10021A39C;
  v19[1] = (uint64_t (*)())v15;
  v22.receiver = self;
  v22.super_class = (Class)type metadata accessor for MTDebugActionTestCase();
  id v20 = a3;
  return [(MTDebugActionTestCase *)&v22 init];
}

- (_TtC8Podcasts21MTDebugActionTestCase)init
{
  result = (_TtC8Podcasts21MTDebugActionTestCase *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10004D2D8((uint64_t)self + OBJC_IVAR____TtC8Podcasts21MTDebugActionTestCase_category);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

@end