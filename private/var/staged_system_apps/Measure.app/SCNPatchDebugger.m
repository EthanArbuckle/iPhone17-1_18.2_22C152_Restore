@interface SCNPatchDebugger
- (_TtC7Measure16SCNPatchDebugger)init;
- (_TtC7Measure16SCNPatchDebugger)initWithCoder:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation SCNPatchDebugger

- (_TtC7Measure16SCNPatchDebugger)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC7Measure16SCNPatchDebugger____lazy_storage___pointContainerNode) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC7Measure16SCNPatchDebugger____lazy_storage___paintContainerNode) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure16SCNPatchDebugger____lazy_storage___pointPool) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure16SCNPatchDebugger____lazy_storage___paintPool) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure16SCNPatchDebugger____lazy_storage___skRenderer) = 0;
  id v4 = a3;

  result = (_TtC7Measure16SCNPatchDebugger *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
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
  _s7Measure16SCNPatchDebuggerC12observeValue10forKeyPath2of6change7contextySSSg_ypSgSDySo05NSKeye6ChangeG0aypGSgSvSgtF_0(v9, v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10001C9D8((uint64_t)v16);
}

- (_TtC7Measure16SCNPatchDebugger)init
{
  result = (_TtC7Measure16SCNPatchDebugger *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure16SCNPatchDebugger____lazy_storage___pointContainerNode));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure16SCNPatchDebugger____lazy_storage___paintContainerNode));
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC7Measure16SCNPatchDebugger____lazy_storage___skRenderer);
}

@end