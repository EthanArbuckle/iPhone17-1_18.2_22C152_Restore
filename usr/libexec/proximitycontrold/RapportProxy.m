@interface RapportProxy
- (_TtC17proximitycontrold12RapportProxy)init;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation RapportProxy

- (void)dealloc
{
  v2 = self;
  sub_100185C58();
}

- (void).cxx_destruct
{
  sub_10000D78C((uint64_t)self + OBJC_IVAR____TtC17proximitycontrold12RapportProxy_activitySource, &qword_1003637B8);
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC17proximitycontrold12RapportProxy)init
{
  result = (_TtC17proximitycontrold12RapportProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v11 = v10;
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
  v11 = 0;
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
    sub_100091204();
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
LABEL_7:
  sub_10018ADE4(v9, v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000D78C((uint64_t)v16, &qword_100371910);
}

@end