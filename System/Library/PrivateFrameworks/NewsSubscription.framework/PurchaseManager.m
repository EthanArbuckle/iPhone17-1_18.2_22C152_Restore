@interface PurchaseManager
- (_TtC16NewsSubscription15PurchaseManager)init;
- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleWindowRequest:(id)a4 completion:(id)a5;
- (void)purchaseFailedForInvalidPurchaseReceiptWithProductID:(id)a3 ongoingPurchaseEntry:(id)a4;
- (void)purchaseFailedWithProductID:(id)a3 transactionState:(int64_t)a4 transactionError:(id)a5 ongoingPurchaseEntry:(id)a6;
- (void)purchaseSuccessWithProductID:(id)a3 transaction:(id)a4 chargeCurrencyCode:(id)a5 ongoingPurchaseEntry:(id)a6;
@end

@implementation PurchaseManager

- (_TtC16NewsSubscription15PurchaseManager)init
{
  result = (_TtC16NewsSubscription15PurchaseManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription15PurchaseManager_metricsBuilder);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
}

- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
}

- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
}

- (void)purchase:(id)a3 handleWindowRequest:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_1BFA80264((uint64_t)v11, (void (**)(void, void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)purchaseFailedWithProductID:(id)a3 transactionState:(int64_t)a4 transactionError:(id)a5 ongoingPurchaseEntry:(id)a6
{
  uint64_t v10 = sub_1BFBD45F8();
  uint64_t v12 = v11;
  id v15 = a5;
  id v13 = a6;
  v14 = self;
  sub_1BFA7BF30(v10, v12, a4, v15, v13);

  swift_bridgeObjectRelease();
}

- (void)purchaseFailedForInvalidPurchaseReceiptWithProductID:(id)a3 ongoingPurchaseEntry:(id)a4
{
  uint64_t v6 = sub_1BFBD45F8();
  uint64_t v8 = v7;
  id v9 = a4;
  uint64_t v10 = self;
  sub_1BFA7CBAC(v6, v8, v9);

  swift_bridgeObjectRelease();
}

- (void)purchaseSuccessWithProductID:(id)a3 transaction:(id)a4 chargeCurrencyCode:(id)a5 ongoingPurchaseEntry:(id)a6
{
  uint64_t v9 = sub_1BFBD45F8();
  uint64_t v11 = v10;
  uint64_t v12 = sub_1BFBD45F8();
  uint64_t v14 = v13;
  id v15 = a4;
  id v16 = a6;
  v17 = self;
  sub_1BFA7D240(v9, v11, v15, v12, v14, v16);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end