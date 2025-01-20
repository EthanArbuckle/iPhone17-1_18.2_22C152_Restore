@interface XPCSession
- (NSString)description;
- (_TtC12wifip2pdCore10XPCSession)init;
- (int64_t)hash;
- (void)createDatapathWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)createPublishWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)createSubscribeWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)createXPCResponderWithType:(unint64_t)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)dump:(id)a3 to:(id)a4 maximumDepth:(int64_t)a5 completionHandler:(id)a6;
- (void)performRealtimeConnectivityCheckWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)queryAWDLLowLatencyStatisticsWithCompletionHandler:(id)a3;
- (void)queryAWDLState:(id)a3;
- (void)queryAWDLStatisticsWithCompletionHandler:(id)a3;
- (void)queryActiveServiceUniqueIdentifiersWithCompletionHandler:(id)a3;
- (void)queryActiveServicesAndActivePortsWithCompletionHandler:(id)a3;
- (void)queryAverageRSSIForAWDLPeer:(id)a3 completionHandler:(id)a4;
- (void)queryCurrentDeviceCapabilities:(id)a3;
- (void)queryPeersWithCompletionHandler:(id)a3;
- (void)startMonitoringAWDLStateWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)updateAWDLLTERestrictedChannels:(id)a3 completionHandler:(id)a4;
@end

@implementation XPCSession

- (NSString)description
{
  v2 = self;
  sub_10000D6EC();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (int64_t)hash
{
  return (int64_t)[*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC12wifip2pdCore10XPCSession_connection) hash];
}

- (void)dealloc
{
  v2 = self;
  sub_1002B95D0();
}

- (void).cxx_destruct
{
  swift_release();
  sub_100011E30(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12wifip2pdCore10XPCSession_invalidationHandler));
  NSString v3 = (char *)self + OBJC_IVAR____TtC12wifip2pdCore10XPCSession_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();

  swift_bridgeObjectRelease();
  v5 = (char *)self + OBJC_IVAR____TtC12wifip2pdCore10XPCSession_uuid;
  uint64_t v6 = type metadata accessor for UUID();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

- (_TtC12wifip2pdCore10XPCSession)init
{
  result = (_TtC12wifip2pdCore10XPCSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)createSubscribeWithConfiguration:(id)a3 completionHandler:(id)a4
{
}

- (void)createPublishWithConfiguration:(id)a3 completionHandler:(id)a4
{
}

- (void)createDatapathWithConfiguration:(id)a3 completionHandler:(id)a4
{
}

- (void)queryCurrentDeviceCapabilities:(id)a3
{
}

- (void)createXPCResponderWithType:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = self;
  sub_1002BA2E8(a3, (uint64_t)sub_100013164, v7);

  swift_release();
}

- (void)startMonitoringAWDLStateWithConfiguration:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v11[0] = a3;
  v11[1] = sub_100013164;
  v11[2] = v7;
  v11[3] = 0;
  v11[4] = 0;
  char v12 = 5;
  v8 = *(void (**)(void *, _TtC12wifip2pdCore10XPCSession *))((char *)&self->super.isa
                                                                         + OBJC_IVAR____TtC12wifip2pdCore10XPCSession_requestHandler);
  id v9 = a3;
  v10 = self;
  swift_retain();
  v8(v11, v10);

  swift_release();

  swift_release();
}

- (void)queryAWDLState:(id)a3
{
}

- (void)queryAverageRSSIForAWDLPeer:(id)a3 completionHandler:(id)a4
{
}

- (void)queryPeersWithCompletionHandler:(id)a3
{
}

- (void)queryAWDLStatisticsWithCompletionHandler:(id)a3
{
}

- (void)queryAWDLLowLatencyStatisticsWithCompletionHandler:(id)a3
{
}

- (void)updateAWDLLTERestrictedChannels:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  sub_10006F314(0, (unint64_t *)&unk_1004882A0);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  v8 = self;
  sub_1002BAA00(v6, (uint64_t)sub_100013164, v7);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)performRealtimeConnectivityCheckWithConfiguration:(id)a3 completionHandler:(id)a4
{
}

- (void)queryActiveServiceUniqueIdentifiersWithCompletionHandler:(id)a3
{
}

- (void)queryActiveServicesAndActivePortsWithCompletionHandler:(id)a3
{
}

- (void)dump:(id)a3 to:(id)a4 maximumDepth:(int64_t)a5 completionHandler:(id)a6
{
  id v9 = _Block_copy(a6);
  uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v9;
  id v12 = a4;
  v13 = self;
  sub_1002BB258(v10, (uint64_t)v12, a5, (uint64_t)sub_100012A00, v11);

  swift_bridgeObjectRelease();

  swift_release();
}

@end