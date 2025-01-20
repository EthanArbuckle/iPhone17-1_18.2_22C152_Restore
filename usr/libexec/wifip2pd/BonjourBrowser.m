@interface BonjourBrowser
- (_TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB14BonjourBrowser)init;
- (void)subscribeLostDiscoveryResultForPublishID:(unsigned __int8)a3 address:(id)a4;
- (void)subscribeReceivedDiscoveryResult:(id)a3;
- (void)subscribeReceivedMessage:(void *)a3 fromPublishID:(uint64_t)a4 address:(void *)a5;
- (void)subscribeTerminatedWithReason:(int64_t)a3;
@end

@implementation BonjourBrowser

- (void)subscribeTerminatedWithReason:(int64_t)a3
{
  v3 = self;
  sub_100037480();
}

- (void)subscribeReceivedDiscoveryResult:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10002D820(v4);
}

- (void)subscribeLostDiscoveryResultForPublishID:(unsigned __int8)a3 address:(id)a4
{
  id v6 = a4;
  v7 = self;
  sub_10002DC58(a3, v6);
}

- (_TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB14BonjourBrowser)init
{
  result = (_TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB14BonjourBrowser *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB14BonjourBrowser_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

- (void)subscribeReceivedMessage:(void *)a3 fromPublishID:(uint64_t)a4 address:(void *)a5
{
  id v7 = a3;
  id v8 = a5;
  id v12 = a1;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;

  sub_10000C970(v9, v11);
}

@end