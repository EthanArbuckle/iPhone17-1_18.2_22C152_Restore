@interface AppleMediaServicesRequestHandler
- (_TtC16SiriAudioSupportP33_803E311218F114B89697FFF1DFF8ED2632AppleMediaServicesRequestHandler)init;
- (void)handleAuthenticateRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6;
- (void)handleDialogRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6;
- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5;
@end

@implementation AppleMediaServicesRequestHandler

- (void)handleAuthenticateRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = self;
  sub_237F89F94((uint64_t)v12, (uint64_t)sub_237F8A95C, v11, "AppleMediaServicesProvider#purchaseItem handle authenticateRequest", (uint64_t)&block_descriptor_21);

  swift_release();
}

- (void)handleDialogRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = self;
  sub_237F89AF4((uint64_t)v12, (uint64_t)sub_237F8A7F0, v11);

  swift_release();
}

- (void)purchase:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  sub_237F89D64((uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  id v12 = self;
  sub_237F89F94((uint64_t)v11, (uint64_t)sub_237F8A95C, v9, "AppleMediaServicesProvider#purchaseItem purchase handle authenticateRequest", (uint64_t)&block_descriptor_11);

  swift_release();
}

- (void)purchase:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  sub_237F8A210((uint64_t)v10, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (_TtC16SiriAudioSupportP33_803E311218F114B89697FFF1DFF8ED2632AppleMediaServicesRequestHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppleMediaServicesRequestHandler();
  return [(AppleMediaServicesRequestHandler *)&v3 init];
}

@end