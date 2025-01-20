@interface DSKBLEPairing
- (_TtC10seserviced13DSKBLEPairing)init;
- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4;
- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5;
- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6;
- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4;
@end

@implementation DSKBLEPairing

- (_TtC10seserviced13DSKBLEPairing)init
{
  return (_TtC10seserviced13DSKBLEPairing *)sub_1000E3A80();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC10seserviced13DSKBLEPairing_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced13DSKBLEPairing_pairingAgent);
}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = self;
  sub_10010B8B4(a3, a4, (uint8_t *)a5);
}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10010C3BC(a4);
}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_10010CB1C(a4, (uint64_t)a5);
}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10010D1D0(a4);
}

@end