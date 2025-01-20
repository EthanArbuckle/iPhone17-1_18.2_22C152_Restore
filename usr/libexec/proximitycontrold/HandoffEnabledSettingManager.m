@interface HandoffEnabledSettingManager
- (_TtC17proximitycontrold28HandoffEnabledSettingManager)init;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation HandoffEnabledSettingManager

- (_TtC17proximitycontrold28HandoffEnabledSettingManager)init
{
  return (_TtC17proximitycontrold28HandoffEnabledSettingManager *)sub_1001B4F50();
}

- (void)dealloc
{
  v2 = self;
  sub_1001B5100();
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
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
    sub_1001B6A88((unint64_t *)&qword_10035ADE0, type metadata accessor for NSKeyValueChangeKey);
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
LABEL_7:
  sub_1001B6918(v9, v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000D78C((uint64_t)v16, &qword_100371910);
}

@end