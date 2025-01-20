@interface PKNearbyPeerPaymentViewProvider
- (PKNearbyPeerPaymentViewProvider)init;
- (id)amountEntryViewWithInitialAmount:(id)a3 initialMemo:(id)a4 dismissAction:(id)a5;
@end

@implementation PKNearbyPeerPaymentViewProvider

- (id)amountEntryViewWithInitialAmount:(id)a3 initialMemo:(id)a4 dismissAction:(id)a5
{
  v8 = _Block_copy(a5);
  if (a4)
  {
    uint64_t v9 = sub_1A03B4988();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v8;
  id v12 = a3;
  v13 = self;
  id v14 = (id)sub_19FAAAA48(a3, v9, (unint64_t)a4, (uint64_t)sub_19FAAAD38, v11);

  swift_release();
  swift_bridgeObjectRelease();

  return v14;
}

- (PKNearbyPeerPaymentViewProvider)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PKNearbyPeerPaymentViewProvider_amountEntryVC) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NearbyPeerPaymentViewProvider();
  return [(PKNearbyPeerPaymentViewProvider *)&v3 init];
}

- (void).cxx_destruct
{
}

@end