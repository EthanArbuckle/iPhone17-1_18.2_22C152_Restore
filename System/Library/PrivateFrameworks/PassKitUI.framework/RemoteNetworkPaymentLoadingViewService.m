@interface RemoteNetworkPaymentLoadingViewService
- (_TtC9PassKitUI38RemoteNetworkPaymentLoadingViewService)init;
- (void)authorizationDidAuthorizeApplePayTrustSignatureCompleteWithResult:(id)a3;
- (void)authorizationDidAuthorizeContextCompleteWithResult:(id)a3;
- (void)authorizationDidAuthorizePaymentCompleteWithResult:(id)a3;
- (void)authorizationDidAuthorizePeerPaymentQuoteCompleteWithResult:(id)a3;
- (void)authorizationDidAuthorizePurchaseCompleteWithStatus:(int64_t)a3;
- (void)authorizationDidChangeCouponCodeCompleteWithUpdate:(id)a3;
- (void)authorizationDidRequestMerchantSessionCompleteWithUpdate:(id)a3;
- (void)authorizationDidSelectPaymentMethodCompleteWithUpdate:(id)a3;
- (void)authorizationDidSelectShippingAddressCompleteWithUpdate:(id)a3;
- (void)authorizationDidSelectShippingMethodCompleteWithUpdate:(id)a3;
- (void)authorizationDidUpdateAccountServicePaymentMethodCompleteWithUpdate:(id)a3 signatureRequest:(id)a4;
- (void)fulfillRemotePaymentRequestPromise:(id)a3 completion:(id)a4;
- (void)handleDismissWithCompletion:(id)a3;
- (void)handleHostApplicationDidBecomeActive;
- (void)handleHostApplicationWillResignActive:(BOOL)a3;
- (void)rejectRemotePaymentRequestPromiseWithFailure:(unint64_t)a3;
@end

@implementation RemoteNetworkPaymentLoadingViewService

- (void)handleHostApplicationWillResignActive:(BOOL)a3
{
  uint64_t v4 = sub_1A03B0B98();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = self;
  sub_1A03B0B38();
  v10 = sub_1A03B0B88();
  os_log_type_t v11 = sub_1A03B5058();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_19F450000, v10, v11, "LoadingViewService: handleHostApplicationWillResignActive", v12, 2u);
    MEMORY[0x1A6224E40](v12, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)handleHostApplicationDidBecomeActive
{
  uint64_t v3 = sub_1A03B0B98();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3, v5);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_1A03B0B38();
  v9 = sub_1A03B0B88();
  os_log_type_t v10 = sub_1A03B5058();
  if (os_log_type_enabled(v9, v10))
  {
    os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v11 = 0;
    _os_log_impl(&dword_19F450000, v9, v10, "LoadingViewService: handleHostApplicationDidBecomeActive", v11, 2u);
    MEMORY[0x1A6224E40](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

- (void)handleDismissWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    uint64_t v7 = sub_19F5789D8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_19FB55234(v7, v6);
  sub_19F48BB68((uint64_t)v7);
}

- (void)fulfillRemotePaymentRequestPromise:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    uint64_t v6 = sub_19F5C125C;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_19FB554FC(a3, (uint64_t)v6, v7);
  sub_19F48BB68((uint64_t)v6);
}

- (void)rejectRemotePaymentRequestPromiseWithFailure:(unint64_t)a3
{
  uint64_t v4 = self;
  sub_19FB55760(a3);
}

- (void)authorizationDidRequestMerchantSessionCompleteWithUpdate:(id)a3
{
}

- (void)authorizationDidAuthorizeContextCompleteWithResult:(id)a3
{
}

- (void)authorizationDidAuthorizePaymentCompleteWithResult:(id)a3
{
}

- (void)authorizationDidAuthorizePurchaseCompleteWithStatus:(int64_t)a3
{
}

- (void)authorizationDidAuthorizePeerPaymentQuoteCompleteWithResult:(id)a3
{
}

- (void)authorizationDidAuthorizeApplePayTrustSignatureCompleteWithResult:(id)a3
{
}

- (void)authorizationDidUpdateAccountServicePaymentMethodCompleteWithUpdate:(id)a3 signatureRequest:(id)a4
{
}

- (void)authorizationDidSelectShippingMethodCompleteWithUpdate:(id)a3
{
}

- (void)authorizationDidSelectShippingAddressCompleteWithUpdate:(id)a3
{
}

- (void)authorizationDidSelectPaymentMethodCompleteWithUpdate:(id)a3
{
}

- (void)authorizationDidChangeCouponCodeCompleteWithUpdate:(id)a3
{
}

- (_TtC9PassKitUI38RemoteNetworkPaymentLoadingViewService)init
{
  result = (_TtC9PassKitUI38RemoteNetworkPaymentLoadingViewService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38RemoteNetworkPaymentLoadingViewService_context));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI38RemoteNetworkPaymentLoadingViewService_configuration));
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI38RemoteNetworkPaymentLoadingViewService_delegate;

  sub_19F482DB0((uint64_t)v3);
}

@end