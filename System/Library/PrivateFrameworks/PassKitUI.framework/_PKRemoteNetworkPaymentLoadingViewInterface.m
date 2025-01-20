@interface _PKRemoteNetworkPaymentLoadingViewInterface
- (PKPaymentAuthorizationServiceProtocol)serviceDelegate;
- (UIViewController)primaryViewController;
- (_PKRemoteNetworkPaymentLoadingViewInterface)init;
- (_PKRemoteNetworkPaymentLoadingViewInterface)initWithContext:(id)a3 configuration:(id)a4;
- (void)didAppear;
@end

@implementation _PKRemoteNetworkPaymentLoadingViewInterface

- (_PKRemoteNetworkPaymentLoadingViewInterface)initWithContext:(id)a3 configuration:(id)a4
{
  return (_PKRemoteNetworkPaymentLoadingViewInterface *)RemoteNetworkPaymentLoadingViewInterface.init(context:configuration:)(a3, a4);
}

- (UIViewController)primaryViewController
{
  v2 = self;
  v3 = (void *)sub_19FCA33BC();

  return (UIViewController *)v3;
}

- (PKPaymentAuthorizationServiceProtocol)serviceDelegate
{
  return (PKPaymentAuthorizationServiceProtocol *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                          + OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_internalService));
}

- (void)didAppear
{
  v2 = self;
  sub_19FCA3544();
}

- (_PKRemoteNetworkPaymentLoadingViewInterface)init
{
  result = (_PKRemoteNetworkPaymentLoadingViewInterface *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  long long v3 = *(_OWORD *)&self->loadingView[OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingView + 136];
  v9[10] = *(_OWORD *)&self->loadingView[OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingView + 120];
  v9[11] = v3;
  v9[12] = *(_OWORD *)&self->loadingView[OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingView + 152];
  uint64_t v10 = *(void *)&self->loadingView[OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingView + 168];
  long long v4 = *(_OWORD *)&self->loadingView[OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingView + 72];
  v9[6] = *(_OWORD *)&self->loadingView[OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingView + 56];
  v9[7] = v4;
  long long v5 = *(_OWORD *)&self->loadingView[OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingView + 104];
  v9[8] = *(_OWORD *)&self->loadingView[OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingView + 88];
  v9[9] = v5;
  long long v6 = *(_OWORD *)&self->loadingView[OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingView + 8];
  v9[2] = *(_OWORD *)&self->loadingViewModel[OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingView];
  v9[3] = v6;
  long long v7 = *(_OWORD *)&self->loadingView[OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingView + 40];
  v9[4] = *(_OWORD *)&self->loadingView[OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingView + 24];
  v9[5] = v7;
  long long v8 = *(_OWORD *)&self->configuration[OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingView];
  v9[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingView);
  v9[1] = v8;
  sub_19FCA5F9C((uint64_t)v9);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____PKRemoteNetworkPaymentLoadingViewInterface_loadingViewSerialQueue));
}

@end