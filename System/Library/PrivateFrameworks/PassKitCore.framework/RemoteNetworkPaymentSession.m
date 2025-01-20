@interface RemoteNetworkPaymentSession
- (_TtC11PassKitCore27RemoteNetworkPaymentSession)init;
- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3;
- (void)dealloc;
- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinator:(id)a3 didChangeCouponCode:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinator:(id)a3 didRequestMerchantSessionUpdate:(id)a4;
- (void)paymentAuthorizationCoordinator:(id)a3 didSelectPaymentMethod:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinator:(id)a3 didSelectShippingAddress:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinator:(id)a3 didSelectShippingMethod:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3;
@end

@implementation RemoteNetworkPaymentSession

- (void)dealloc
{
  v2 = self;
  sub_190F4C274();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore27RemoteNetworkPaymentSession_originatingProcess));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore27RemoteNetworkPaymentSession_authorizationCoordinator));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore27RemoteNetworkPaymentSession_inAppPaymentService));
  v3 = (char *)self + OBJC_IVAR____TtC11PassKitCore27RemoteNetworkPaymentSession_delegate;
  sub_190F1042C((uint64_t)v3);
}

- (void)paymentAuthorizationCoordinator:(id)a3 didRequestMerchantSessionUpdate:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_190F53BA0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_190F53784((uint64_t)v6, v7);
  sub_190EF6480((uint64_t)v6);
}

- (void)paymentAuthorizationCoordinator:(id)a3 didChangeCouponCode:(id)a4 handler:(id)a5
{
  id v8 = _Block_copy(a5);
  v9 = v8;
  if (!a4)
  {
    if (!v8) {
      goto LABEL_10;
    }
    swift_allocObject();
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v10 = sub_1915EF030();
  a4 = v11;
  if (!v9)
  {
LABEL_9:
    if (a4)
    {
LABEL_11:
      __break(1u);
      return;
    }
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v12 = v10;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v9;
  if (!a4) {
    goto LABEL_10;
  }
  uint64_t v14 = v13;
  id v15 = a3;
  v16 = self;
  sub_190F4DDA8(v12, (uint64_t)a4, (uint64_t)sub_190F53BA0, v14);
  sub_190EF6480((uint64_t)sub_190F53BA0);

  swift_bridgeObjectRelease();
}

- (void)paymentAuthorizationCoordinator:(id)a3 didSelectShippingAddress:(id)a4 handler:(id)a5
{
  id v8 = _Block_copy(a5);
  if (!v8)
  {
    if (a4)
    {
LABEL_8:
      __break(1u);
      return;
    }
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v9 = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  if (!a4) {
    goto LABEL_7;
  }
  uint64_t v11 = v10;
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  sub_190F4E150((uint64_t)v13, (uint64_t)sub_190F53BA0, v11);
  sub_190EF6480((uint64_t)sub_190F53BA0);
}

- (void)paymentAuthorizationCoordinator:(id)a3 didSelectPaymentMethod:(id)a4 handler:(id)a5
{
  id v8 = _Block_copy(a5);
  if (v8)
  {
    v9 = v8;
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v9;
    id v11 = a3;
    id v12 = a4;
    id v13 = self;
    sub_190F4E550(a4, (uint64_t)sub_190F53BA0, v10);

    swift_release();
  }
  else
  {
    __break(1u);
  }
}

- (void)paymentAuthorizationCoordinator:(id)a3 didSelectShippingMethod:(id)a4 handler:(id)a5
{
  id v8 = _Block_copy(a5);
  if (!v8)
  {
    if (a4)
    {
LABEL_8:
      __break(1u);
      return;
    }
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v9 = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  if (!a4) {
    goto LABEL_7;
  }
  uint64_t v11 = v10;
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  sub_190F4E914(v13, (uint64_t)sub_190F53BA0, v11);
  sub_190EF6480((uint64_t)sub_190F53BA0);
}

- (void)paymentAuthorizationCoordinator:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  id v8 = _Block_copy(a5);
  if (!v8)
  {
    if (a4)
    {
LABEL_8:
      __break(1u);
      return;
    }
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v9 = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  if (!a4) {
    goto LABEL_7;
  }
  uint64_t v11 = v10;
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  sub_190F4ED1C(v13, (uint64_t)sub_190F53230, v11);
  sub_190EF6480((uint64_t)sub_190F53230);
}

- (void)paymentAuthorizationCoordinatorDidFinish:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_190F51E3C(a3);
}

- (id)presentationSceneIdentifierForPaymentAuthorizationCoordinator:(id)a3
{
  return 0;
}

- (_TtC11PassKitCore27RemoteNetworkPaymentSession)init
{
  result = (_TtC11PassKitCore27RemoteNetworkPaymentSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end