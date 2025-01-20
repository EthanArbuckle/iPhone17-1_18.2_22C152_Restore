@interface PaymentOfferCriteriaSetupWebView.Coordinator
- (_TtCV9PassKitUI32PaymentOfferCriteriaSetupWebView11Coordinator)init;
- (void)webView:(WKWebView *)a3 requestMediaCapturePermissionForOrigin:(WKSecurityOrigin *)a4 initiatedByFrame:(WKFrameInfo *)a5 type:(int64_t)a6 decisionHandler:(id)a7;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4;
@end

@implementation PaymentOfferCriteriaSetupWebView.Coordinator

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_19F947B54(v10, (uint64_t)v11, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
}

- (void)webView:(WKWebView *)a3 requestMediaCapturePermissionForOrigin:(WKSecurityOrigin *)a4 initiatedByFrame:(WKFrameInfo *)a5 type:(int64_t)a6 decisionHandler:(id)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94A4920);
  MEMORY[0x1F4188790](v13 - 8, v14);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = _Block_copy(a7);
  v18 = (void *)swift_allocObject();
  v18[2] = a3;
  v18[3] = a4;
  v18[4] = a5;
  v18[5] = a6;
  v18[6] = v17;
  v18[7] = self;
  uint64_t v19 = sub_1A03B4DD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v16, 1, 1, v19);
  v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_1E94AC690;
  v20[5] = v18;
  v21 = (void *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_1E94A4950;
  v21[5] = v20;
  v22 = a3;
  v23 = a4;
  v24 = a5;
  v25 = self;
  sub_19FCC1A38((uint64_t)v16, (uint64_t)&unk_1E94AC6A0, (uint64_t)v21);
  swift_release();
}

- (_TtCV9PassKitUI32PaymentOfferCriteriaSetupWebView11Coordinator)init
{
  result = (_TtCV9PassKitUI32PaymentOfferCriteriaSetupWebView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = *(void **)&self->parent[OBJC_IVAR____TtCV9PassKitUI32PaymentOfferCriteriaSetupWebView11Coordinator_parent + 8];
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();

  swift_release();
}

@end