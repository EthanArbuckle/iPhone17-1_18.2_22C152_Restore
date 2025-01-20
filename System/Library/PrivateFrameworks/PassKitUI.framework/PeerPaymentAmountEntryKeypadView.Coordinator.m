@interface PeerPaymentAmountEntryKeypadView.Coordinator
- (_TtCV9PassKitUI32PeerPaymentAmountEntryKeypadView11Coordinator)init;
- (double)percentExpanded;
- (id)currentBalance;
- (id)maximumTransferAmount;
- (id)minimumTransferAmount;
- (void)amountDidChangeTo:(id)a3;
- (void)memoDidChangeTo:(id)a3;
@end

@implementation PeerPaymentAmountEntryKeypadView.Coordinator

- (id)minimumTransferAmount
{
  return sub_19F91C1D8((char *)self, (uint64_t)a2, (SEL *)&selRef_minimumAmount);
}

- (id)maximumTransferAmount
{
  return sub_19F91C1D8((char *)self, (uint64_t)a2, (SEL *)&selRef_maximumAmount);
}

- (id)currentBalance
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtCV9PassKitUI32PeerPaymentAmountEntryKeypadView11Coordinator_peerPaymentAccount), sel_currentBalance);

  return v2;
}

- (double)percentExpanded
{
  return 1.0;
}

- (void)amountDidChangeTo:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E94ABC78);
    sub_1A03B4258();
  }
  else
  {
    __break(1u);
  }
}

- (void)memoDidChangeTo:(id)a3
{
  if (a3) {
    sub_1A03B4988();
  }
  else {
    uint64_t v3 = 0;
  }
  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E94ABC80);
    sub_1A03B4258();
  }
  else
  {
    __break(1u);
  }
}

- (_TtCV9PassKitUI32PeerPaymentAmountEntryKeypadView11Coordinator)init
{
  result = (_TtCV9PassKitUI32PeerPaymentAmountEntryKeypadView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV9PassKitUI32PeerPaymentAmountEntryKeypadView11Coordinator_peerPaymentAccount));

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

@end