@interface SDAuthenticationTransportIDSService
- (_TtC16DaemoniOSLibrary35SDAuthenticationTransportIDSService)init;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
@end

@implementation SDAuthenticationTransportIDSService

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v14 = v13;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  v19 = self;
  sub_1005F6704(v15, v17, v12, v14);

  swift_bridgeObjectRelease();
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v14 = v13;
  id v15 = a3;
  id v16 = a4;
  id v18 = a7;
  id v17 = self;
  sub_1005F6D5C(v12, v14, a6);

  swift_bridgeObjectRelease();
}

- (_TtC16DaemoniOSLibrary35SDAuthenticationTransportIDSService)init
{
  result = (_TtC16DaemoniOSLibrary35SDAuthenticationTransportIDSService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary35SDAuthenticationTransportIDSService_queue));
  sub_100261080((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary35SDAuthenticationTransportIDSService_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary35SDAuthenticationTransportIDSService_idsService;

  sub_10024D338((uint64_t)v3);
}

@end