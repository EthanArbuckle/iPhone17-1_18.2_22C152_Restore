@interface AccountTransferAuthorizationController
- (_TtC9PassKitUI38AccountTransferAuthorizationController)init;
- (id)presentationWindowForPaymentAuthorizationController:(id)a3;
- (void)accountChanged:(id)a3;
- (void)paymentAuthorizationController:(id)a3 didAuthorizeApplePayTrustSignature:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationController:(id)a3 didUpdateAccountServicePaymentMethod:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationControllerDidFinish:(id)a3;
- (void)transactionsChanged:(id)a3;
@end

@implementation AccountTransferAuthorizationController

- (_TtC9PassKitUI38AccountTransferAuthorizationController)init
{
  result = (_TtC9PassKitUI38AccountTransferAuthorizationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38AccountTransferAuthorizationController_paymentRequest));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38AccountTransferAuthorizationController_accountModel));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38AccountTransferAuthorizationController_paymentAuthorizationController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38AccountTransferAuthorizationController_window));
  swift_release();
  swift_release();
  sub_19F48BB68(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9PassKitUI38AccountTransferAuthorizationController_transferDidFinish));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38AccountTransferAuthorizationController_paymentWebService));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38AccountTransferAuthorizationController_scheduleTransferRequest));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38AccountTransferAuthorizationController_accountService));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38AccountTransferAuthorizationController_transactionFetcher));
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI38AccountTransferAuthorizationController_dismissalTimer;
  uint64_t v4 = sub_1A03B4658();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (id)presentationWindowForPaymentAuthorizationController:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC9PassKitUI38AccountTransferAuthorizationController_window));
}

- (void)paymentAuthorizationControllerDidFinish:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19F97CF18(v4);
}

- (void)paymentAuthorizationController:(id)a3 didUpdateAccountServicePaymentMethod:(id)a4 handler:(id)a5
{
  v8 = _Block_copy(a5);
  if (!v8)
  {
    uint64_t v9 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_7:
    __break(1u);
    return;
  }
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  v8 = sub_19F9806C4;
  if (!a4) {
    goto LABEL_7;
  }
LABEL_3:
  v10 = *(Class *)((char *)&self->super.isa
                 + OBJC_IVAR____TtC9PassKitUI38AccountTransferAuthorizationController_paymentRequest);
  uint64_t v11 = *(uint64_t *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC9PassKitUI38AccountTransferAuthorizationController_scheduleTransferModel);
  uint64_t v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_19F48BAB4((uint64_t)v8);
  id v13 = a3;
  id v14 = a4;
  v15 = self;
  sub_19FBD6FA8(v10, v14, v11, v12, (void (*)(void, void))v8, v9);
  sub_19F48BB68((uint64_t)v8);
  swift_release();
  sub_19F48BB68((uint64_t)v8);
}

- (void)paymentAuthorizationController:(id)a3 didAuthorizeApplePayTrustSignature:(id)a4 handler:(id)a5
{
  v8 = (void (*)(void))_Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = (void (*)(void))sub_19F533B00;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = self;
  sub_19F97FF20((uint64_t)a4, v8, v9);
  sub_19F48BB68((uint64_t)v8);
}

- (void)transactionsChanged:(id)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI38AccountTransferAuthorizationController_hasReceivedTransaction) = 1;
  v3 = self;
  sub_19F97FA70();
}

- (void)accountChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19F98016C();
}

@end