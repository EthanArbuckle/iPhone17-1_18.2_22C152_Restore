@interface CloudKitStack
+ (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (_TtC7Journal13CloudKitStack)init;
- (void)dealloc;
- (void)prioritizeDownloadNotification:(id)a3;
@end

@implementation CloudKitStack

- (void)dealloc
{
  v2 = self;
  sub_1002CAA64();
}

- (void).cxx_destruct
{
  sub_100040DBC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7Journal13CloudKitStack_inMemoryMetadata), *(void *)&self->inMemoryMetadata[OBJC_IVAR____TtC7Journal13CloudKitStack_inMemoryMetadata]);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

+ (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = v9;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v13, 0, sizeof(v13));
    id v12 = a5;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_4;
  }
  uint64_t v8 = 0;
  uint64_t v10 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v11 = a5;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (a5)
  {
LABEL_4:
    type metadata accessor for NSKeyValueChangeKey(0);
    sub_1002D2898(&qword_1007F8B48, type metadata accessor for NSKeyValueChangeKey);
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
LABEL_7:
  sub_1002D2184(v8, v10, (uint64_t)v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10001457C((uint64_t)v13, &qword_1007FAD50);
}

- (void)prioritizeDownloadNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  sub_1002CADF8((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC7Journal13CloudKitStack)init
{
  result = (_TtC7Journal13CloudKitStack *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end