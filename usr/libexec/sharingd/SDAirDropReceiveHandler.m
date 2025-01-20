@interface SDAirDropReceiveHandler
- (_TtC16DaemoniOSLibrary23SDAirDropReceiveHandler)init;
@end

@implementation SDAirDropReceiveHandler

- (_TtC16DaemoniOSLibrary23SDAirDropReceiveHandler)init
{
  result = (_TtC16DaemoniOSLibrary23SDAirDropReceiveHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_id;
  uint64_t v4 = type metadata accessor for SFAirDrop.TransferIdentifier();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_receiveID;
  uint64_t v6 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  sub_1006802B8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_serverConnectionIdentity, type metadata accessor for SDAirDropServerConnectionIdentity);
  sub_100261080((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_delegate);
  sub_100261080((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_receiveServiceDelegate);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_deviceStatus));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_endpointService));
  swift_release();
  swift_bridgeObjectRelease();
  v7 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_askContinuation;
  uint64_t v8 = sub_10000A844(&qword_10097DA18);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_transferContinuation;
  uint64_t v10 = sub_10000A844(&qword_10096BBA8);
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_exchangeContinuation, &qword_100978548);
  v11 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_handlerContinuation;
  uint64_t v12 = sub_10000A844(&qword_100978650);
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_helloRequest, &qword_10096DF48);
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_askRequest, &qword_10096DF58);
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_uploadRequest, &qword_10096DF68);
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_exchangeRequest, &qword_100978508);
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_transferStart, (uint64_t *)&unk_100975040);
  swift_release();
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_helloConnection, &qword_100978540);
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_askConnection, &qword_100978540);
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_uploadConnection, &qword_100978540);
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_exchangeConnection, &qword_100978540);
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_errorConnection, &qword_100978540);
}

@end