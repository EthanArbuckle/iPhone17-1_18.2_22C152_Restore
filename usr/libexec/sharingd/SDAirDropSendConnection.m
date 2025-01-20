@interface SDAirDropSendConnection
- (_TtC16DaemoniOSLibrary23SDAirDropSendConnection)init;
@end

@implementation SDAirDropSendConnection

- (_TtC16DaemoniOSLibrary23SDAirDropSendConnection)init
{
  result = (_TtC16DaemoniOSLibrary23SDAirDropSendConnection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1002F6F68((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_endpoint, type metadata accessor for SDAirDropDiscoveredEndpoint);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_deviceStatus));
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_sendRequest;
  uint64_t v4 = type metadata accessor for SFAirDropSend.Request();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_helloRequest, &qword_10096DF48);
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_helloContinuation, &qword_10096DF50);
  swift_release();
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_askRequest, &qword_10096DF58);
  swift_release();
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_askContinuation, &qword_10096DF60);
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_uploadRequest, &qword_10096DF68);
  swift_unknownObjectRelease();
  swift_release();
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_uploadContinuation, &qword_10096DF70);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_exchangeContinuation, &qword_10096DF78);
  swift_release();
  sub_1002F6F68((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_telemetry, type metadata accessor for SDAirDropSendConnectionTelemetry);
  v5 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_lastActiveInterfaceType;
  uint64_t v6 = type metadata accessor for SFNWInterfaceType();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end