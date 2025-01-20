@interface SNOspreyChannel
- (NSString)description;
- (SNOspreyChannel)init;
- (SNOspreyChannel)initWithURL:(id)a3 configuration:(id)a4;
- (SNOspreyChannel)initWithURL:(id)a3 configuration:(id)a4 useCache:(BOOL)a5;
- (id)bidirectionalStreamingRequestWithMethodName:(id)a3 requestBuilder:(id)a4 streamingResponseHandler:(id)a5 completion:(id)a6;
@end

@implementation SNOspreyChannel

- (NSString)description
{
  v2 = self;
  uint64_t v3 = SiriNetworkOspreyChannel.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x2611B2220](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (id)bidirectionalStreamingRequestWithMethodName:(id)a3 requestBuilder:(id)a4 streamingResponseHandler:(id)a5 completion:(id)a6
{
  v9 = _Block_copy(a4);
  v10 = _Block_copy(a5);
  v11 = _Block_copy(a6);
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  if (v9)
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v9;
    v9 = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned SNLinkRecommendationInfo?) -> ();
  }
  else
  {
    uint64_t v15 = 0;
  }
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v10;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v11;
  v18 = self;
  id v19 = SiriNetworkOspreyChannel.bidirectionalStreamingRequest(withMethodName:requestBuilder:streamingResponseHandler:completion:)(v12, v14, (uint64_t)v9, v15, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSData) -> (), v16, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> (), v17);
  swift_release();
  swift_release();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed SNLinkRecommendationInfo?) -> ())?((uint64_t)v9);

  swift_bridgeObjectRelease();

  return v19;
}

- (SNOspreyChannel)initWithURL:(id)a3 configuration:(id)a4
{
  uint64_t v5 = type metadata accessor for URL();
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  return (SNOspreyChannel *)SiriNetworkOspreyChannel.init(url:configuration:)((uint64_t)v7, a4);
}

- (SNOspreyChannel)initWithURL:(id)a3 configuration:(id)a4 useCache:(BOOL)a5
{
  uint64_t v7 = type metadata accessor for URL();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  return (SNOspreyChannel *)SiriNetworkOspreyChannel.init(url:configuration:useCache:)((uint64_t)v9, a4, a5);
}

- (SNOspreyChannel)init
{
  return (SNOspreyChannel *)SiriNetworkOspreyChannel.init()();
}

- (void).cxx_destruct
{
  _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)self + OBJC_IVAR___SNOspreyChannel_connectionConfiguration, (uint64_t)v3, &demangling cache variable for type metadata for ConnectionConfiguration?);
  outlined release of ConnectionConfiguration?((uint64_t)v3);
  swift_unknownObjectRelease();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed SNLinkRecommendationInfo?) -> ())?(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___SNOspreyChannel_ospreyRequestBuilder));
  outlined consume of (@escaping @callee_guaranteed (@guaranteed SNLinkRecommendationInfo?) -> ())?(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___SNOspreyChannel_ospreyConnectionMetrics));
  _s11SiriNetwork17ConnectionMetricsVSgWObTm_0((uint64_t)self + OBJC_IVAR___SNOspreyChannel_connectionMetrics, (uint64_t)v4, (uint64_t *)&demangling cache variable for type metadata for ConnectionMetrics?);
  outlined release of ConnectionMetrics?(v4, outlined consume of ConnectionMetrics?);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end