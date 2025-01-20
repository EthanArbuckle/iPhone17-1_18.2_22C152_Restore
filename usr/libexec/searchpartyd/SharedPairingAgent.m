@interface SharedPairingAgent
- (_TtC12searchpartyd18SharedPairingAgent)init;
- (void)dealloc;
- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4;
- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5;
- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6;
@end

@implementation SharedPairingAgent

- (void)dealloc
{
  v2 = self;
  sub_10106F744();
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

- (_TtC12searchpartyd18SharedPairingAgent)init
{
  result = (_TtC12searchpartyd18SharedPairingAgent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_10107200C(a4, (uint64_t)a5, "peerDidFailToCompletePairing: %{public}s. %{public}@", (uint64_t)sub_10107255C, "peerDidFailToCompletePairing: peer cannot be nil!");
}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_101071AF4(a4);
}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = self;
  sub_10107200C(a4, a5, "peerDidRequestPairing: %{public}s. %{public}@", (uint64_t)sub_101072520, "peerDidRequestPairing: peer cannot be nil!");
}

@end