@interface JSStoreFlowSegue
- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5;
- (id)dynamicViewController:(id)a3 contentViewWithDictionary:(id)a4 frame:(CGRect)a5;
- (void)cloudServiceSetupViewControllerDidDismiss:(id)a3;
- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5;
- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5;
- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
@end

@implementation JSStoreFlowSegue

- (void)cloudServiceSetupViewControllerDidDismiss:(id)a3
{
  id v4 = a3;
  v5 = self;
  JSStoreFlowSegue.cloudServiceSetupViewControllerDidDismiss(_:)((SKCloudServiceSetupViewController)v4);
}

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  _s11MusicJSCore16JSStoreFlowSegueC0A11ApplicationE17webViewController_6handle10completionySo08AMSUIWebhI0C_So22AMSAuthenticateRequestCySo0M6ResultCSg_s5Error_pSgtctF_0(v10, (uint64_t)v11, (uint64_t)sub_EE33C, v9);

  swift_release();
}

- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5
{
  v5 = _Block_copy(a5);
  _Block_release(v5);
  return 0;
}

- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  sub_ED7E8((uint64_t)v10, v11, (void (**)(void, void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)dynamicViewController:(id)a3 didFinishWithPurchaseResult:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  id v11 = a5;
  sub_EDAA8(a4, (uint64_t)a5);
}

- (id)dynamicViewController:(id)a3 contentViewWithDictionary:(id)a4 frame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  sub_AB6250();
  id v12 = objc_allocWithZone((Class)type metadata accessor for UpsellArtworkGrid());
  id v13 = a3;
  id v14 = a4;
  v15 = self;
  id v16 = sub_394A24(x, y, width, height);

  swift_bridgeObjectRelease();

  return v16;
}

- (void)dynamicViewController:(id)a3 didFinishCarrierLinkingWithResult:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  id v11 = a5;
  sub_EDED8((uint64_t)a5);
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__url;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFE178);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v6 = (char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__sourceApplicationBundleIdentifier;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFDB48);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__referrerURL, v4);
  id v8 = (char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__userInfo;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFEC68);
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  id v10 = (char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__scriptingMetricsOverlay;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFEAD0);
  (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  id v12 = (char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__didCompleteSubscriptionPurchase;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFEC80);
  (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  id v14 = (char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__subscriptionStatus;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFEC98);
  (*(void (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  id v16 = (char *)self + OBJC_IVAR____TtC11MusicJSCore16JSStoreFlowSegue__didFinishLinkingWithCarrier;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_DE0398);
  v18 = *(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8);

  v18(v16, v17);
}

@end