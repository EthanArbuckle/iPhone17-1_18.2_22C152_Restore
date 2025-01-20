@interface _SFAirDropTransferObserverAdaptor
- (SFAirDropTransferObserverDelegate)delegate;
- (_TtC7Sharing33_SFAirDropTransferObserverAdaptor)init;
- (void)setDelegate:(id)a3;
@end

@implementation _SFAirDropTransferObserverAdaptor

- (SFAirDropTransferObserverDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC7Sharing33_SFAirDropTransferObserverAdaptor_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1A626CEF0](v2);

  return (SFAirDropTransferObserverDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC7Sharing33_SFAirDropTransferObserverAdaptor)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = type metadata accessor for SFAirDropClient.Identifier();
  MEMORY[0x1F4188790](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  swift_storeEnumTagMultiPayload();
  type metadata accessor for SFAirDropClient(0);
  swift_allocObject();
  v7 = self;
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC7Sharing33_SFAirDropTransferObserverAdaptor_client) = (Class)SFAirDropClient.init(identifier:)((uint64_t)v6);

  v9.receiver = v7;
  v9.super_class = ObjectType;
  return [(_SFAirDropTransferObserverAdaptor *)&v9 init];
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC7Sharing33_SFAirDropTransferObserverAdaptor_delegate;

  sub_1A5549604((uint64_t)v3);
}

@end