@interface AMSUIWebViewControllerDelegate
- (_TtC16NewsSubscription30AMSUIWebViewControllerDelegate)init;
- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
@end

@implementation AMSUIWebViewControllerDelegate

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  sub_1BFAEF4B4(v10, v11, (uint64_t)sub_1BFA80588, v9);

  swift_release();
}

- (_TtC16NewsSubscription30AMSUIWebViewControllerDelegate)init
{
  result = (_TtC16NewsSubscription30AMSUIWebViewControllerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription30AMSUIWebViewControllerDelegate_entitlementsManager);
  swift_bridgeObjectRelease();
}

@end