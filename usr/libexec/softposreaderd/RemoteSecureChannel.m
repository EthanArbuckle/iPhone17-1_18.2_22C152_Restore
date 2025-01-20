@interface RemoteSecureChannel
- (_TtC14softposreaderd19RemoteSecureChannel)init;
- (void)securingRequest:(id)a3 reply:(id)a4;
@end

@implementation RemoteSecureChannel

- (void)securingRequest:(id)a3 reply:(id)a4
{
  uint64_t v6 = type metadata accessor for URLRequest();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static URLRequest._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v11);
  v12 = self;
  sub_10000E4D8((uint64_t)v10, (uint64_t)v12, (uint64_t)v11);
  _Block_release(v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (_TtC14softposreaderd19RemoteSecureChannel)init
{
  result = (_TtC14softposreaderd19RemoteSecureChannel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end