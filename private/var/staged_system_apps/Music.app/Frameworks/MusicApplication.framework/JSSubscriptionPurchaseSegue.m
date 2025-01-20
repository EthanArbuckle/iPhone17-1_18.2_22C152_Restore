@interface JSSubscriptionPurchaseSegue
- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5;
@end

@implementation JSSubscriptionPurchaseSegue

- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
}

- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
}

- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore27JSSubscriptionPurchaseSegue__buyParameters;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFDB48);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11MusicJSCore27JSSubscriptionPurchaseSegue__metricsOverlay;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFEAD0);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC11MusicJSCore27JSSubscriptionPurchaseSegue__shouldShowLoadingIndicator;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_DE0398);
  v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);

  v9(v7, v8);
}

@end