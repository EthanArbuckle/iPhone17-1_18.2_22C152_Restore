@interface RemoteService
- (_TtC14softposreaderd13RemoteService)init;
- (void)copyBuildDateWithReply:(id)a3;
- (void)primerProxyWithConfiguration:(id)a3 reply:(id)a4;
- (void)sharedPrimerProxyWithReply:(id)a3;
@end

@implementation RemoteService

- (void)copyBuildDateWithReply:(id)a3
{
  uint64_t v5 = type metadata accessor for Date();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (void (**)(void *, Class))_Block_copy(a3);
  v11 = self;
  v12 = self;
  id v13 = [v11 current];
  id v14 = [v13 buildDate];

  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  v10[2](v10, isa);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  _Block_release(v10);
}

- (void)sharedPrimerProxyWithReply:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_10000D3E8((void (**)(void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)primerProxyWithConfiguration:(id)a3 reply:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v5);
  uint64_t v7 = self;
  sub_10000D6E8(v6, (void (**)(void, void, void, void))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (_TtC14softposreaderd13RemoteService)init
{
  return (_TtC14softposreaderd13RemoteService *)sub_10000C3D8(self, (uint64_t)a2, type metadata accessor for RemoteService);
}

@end