@interface AccessoryHandler
- (_TtC14dockaccessoryd16AccessoryHandler)init;
- (void)accessoryConnectionDetached:(id)a3;
- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7;
- (void)dealloc;
@end

@implementation AccessoryHandler

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7
{
  uint64_t v8 = (uint64_t)a6;
  uint64_t v9 = *(void *)&a5;
  if (a3)
  {
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v14 = v13;
    if (!v8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v12 = 0;
  unint64_t v14 = 0;
  if (a6) {
LABEL_3:
  }
    uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
LABEL_4:
  if (a7)
  {
    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a7 = v16;
  }
  else
  {
    uint64_t v15 = 0;
  }
  v17 = self;
  sub_1000A69C8(v12, v14, a4, v9, v8, v15, (unint64_t)a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)accessoryConnectionDetached:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v6 = 0;
  }
  v7 = self;
  sub_1000A7008(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)dealloc
{
  v2 = self;
  sub_1000A75B8();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd16AccessoryHandler_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC14dockaccessoryd16AccessoryHandler)init
{
  return (_TtC14dockaccessoryd16AccessoryHandler *)sub_1000A7990();
}

@end