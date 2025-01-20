@interface SCNPlaneSelectionDebugger
- (_TtC7Measure25SCNPlaneSelectionDebugger)init;
- (_TtC7Measure25SCNPlaneSelectionDebugger)initWithCoder:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation SCNPlaneSelectionDebugger

- (_TtC7Measure25SCNPlaneSelectionDebugger)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001AD170();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = v10;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v16, 0, sizeof(v16));
    id v14 = a5;
    v15 = self;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_4;
  }
  uint64_t v9 = 0;
  uint64_t v11 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v12 = a5;
  v13 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (a5)
  {
LABEL_4:
    type metadata accessor for NSKeyValueChangeKey(0);
    sub_10001CA38();
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
LABEL_7:
  sub_1001AD230(v9, v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10001C9D8((uint64_t)v16);
}

- (_TtC7Measure25SCNPlaneSelectionDebugger)init
{
  result = (_TtC7Measure25SCNPlaneSelectionDebugger *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure25SCNPlaneSelectionDebugger____lazy_storage___rayNode));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure25SCNPlaneSelectionDebugger____lazy_storage___arKitNode));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure25SCNPlaneSelectionDebugger____lazy_storage___mlNode));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure25SCNPlaneSelectionDebugger____lazy_storage___lpNode));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure25SCNPlaneSelectionDebugger____lazy_storage___fallbackNode));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure25SCNPlaneSelectionDebugger____lazy_storage___previousNode));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure25SCNPlaneSelectionDebugger____lazy_storage___patchNode));
  id v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC7Measure25SCNPlaneSelectionDebugger____lazy_storage___adNode);
}

@end