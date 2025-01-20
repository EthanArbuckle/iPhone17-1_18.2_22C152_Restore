@interface PaymentAuthorizationServiceDelegate
- (_TtC9PassKitUI35PaymentAuthorizationServiceDelegate)init;
- (char)authorizationDidAuthorizeContextCompleteWithResult:(uint64_t)a3;
- (void)authorizationDidAuthorizePurchaseCompleteWithStatus:(int64_t)a3;
- (void)authorizationDidChangeCouponCodeCompleteWithUpdate:(id)a3;
- (void)authorizationDidRequestMerchantSessionCompleteWithUpdate:(id)a3;
- (void)authorizationDidSelectPaymentMethodCompleteWithUpdate:(id)a3;
- (void)authorizationDidSelectShippingAddressCompleteWithUpdate:(id)a3;
- (void)authorizationDidSelectShippingMethodCompleteWithUpdate:(id)a3;
- (void)authorizationDidUpdateAccountServicePaymentMethodCompleteWithUpdate:(id)a3 signatureRequest:(id)a4;
- (void)handleDismissWithCompletion:(id)a3;
- (void)handleHostApplicationDidCancel;
@end

@implementation PaymentAuthorizationServiceDelegate

- (void)authorizationDidChangeCouponCodeCompleteWithUpdate:(id)a3
{
}

- (void)authorizationDidUpdateAccountServicePaymentMethodCompleteWithUpdate:(id)a3 signatureRequest:(id)a4
{
}

- (void)handleHostApplicationDidCancel
{
  v2 = self;
  sub_19FD80CD4();
}

- (void)handleDismissWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_19F5789D8;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_19FD80EB8(v7, v6);
  sub_19F48BB68((uint64_t)v7);
}

- (void)authorizationDidRequestMerchantSessionCompleteWithUpdate:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_19FD81178((uint64_t)a3);
}

- (char)authorizationDidAuthorizeContextCompleteWithResult:(uint64_t)a3
{
  if (a3) {
    return (char *)objc_msgSend(*(id *)&result[OBJC_IVAR____TtC9PassKitUI35PaymentAuthorizationServiceDelegate_stateMachine], sel_didReceivePaymentAuthorizationResult_);
  }
  __break(1u);
  return result;
}

- (void)authorizationDidAuthorizePurchaseCompleteWithStatus:(int64_t)a3
{
  id v5 = objc_allocWithZone(MEMORY[0x1E4F84A30]);
  uint64_t v6 = self;
  id v7 = objc_msgSend(v5, sel_init);
  objc_msgSend(v7, sel_setStatus_, a3);
  objc_msgSend(*(id *)((char *)&v6->super.isa + OBJC_IVAR____TtC9PassKitUI35PaymentAuthorizationServiceDelegate_stateMachine), sel_didReceivePaymentAuthorizationResult_, v7);
}

- (void)authorizationDidSelectShippingMethodCompleteWithUpdate:(id)a3
{
}

- (void)authorizationDidSelectShippingAddressCompleteWithUpdate:(id)a3
{
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI35PaymentAuthorizationServiceDelegate_stateMachine);
  v9 = self;
  id v5 = (_TtC9PassKitUI35PaymentAuthorizationServiceDelegate *)a3;
  objc_msgSend(v4, sel_didReceiveShippingContactCompleteWithUpdate_, v5);
  if (!v5)
  {
    __break(1u);
    goto LABEL_9;
  }
  id v6 = [(PaymentAuthorizationServiceDelegate *)v5 availableShippingMethods];
  if (!v6)
  {
LABEL_9:
    __break(1u);
    return;
  }
  id v7 = v6;
  v8 = (_TtC9PassKitUI35PaymentAuthorizationServiceDelegate *)objc_msgSend(v6, sel_defaultMethod);

  if (v8)
  {
    objc_msgSend(v4, sel_didSelectShippingMethod_, v8);

    id v5 = v9;
    v9 = v8;
  }
}

- (void)authorizationDidSelectPaymentMethodCompleteWithUpdate:(id)a3
{
}

- (_TtC9PassKitUI35PaymentAuthorizationServiceDelegate)init
{
  result = (_TtC9PassKitUI35PaymentAuthorizationServiceDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35PaymentAuthorizationServiceDelegate_stateMachine));

  swift_release();
}

@end