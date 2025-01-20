@interface WebOptinFlowManager
- (_TtC16NewsSubscription19WebOptinFlowManager)init;
- (void)handledAction:(id)a3 state:(unint64_t)a4;
@end

@implementation WebOptinFlowManager

- (_TtC16NewsSubscription19WebOptinFlowManager)init
{
  result = (_TtC16NewsSubscription19WebOptinFlowManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription19WebOptinFlowManager_purchaseController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription19WebOptinFlowManager_receiptRefresher);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription19WebOptinFlowManager_subscriptionController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription19WebOptinFlowManager_purchasingSpinnerViewControllerFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription19WebOptinFlowManager_tracker);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription19WebOptinFlowManager_router);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription19WebOptinFlowManager_webAccessOptInProvider);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription19WebOptinFlowManager_sceneProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription19WebOptinFlowManager_hideMyEmailService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription19WebOptinFlowManager_siwaCredentialUploader);
  sub_1BFA9C2FC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16NewsSubscription19WebOptinFlowManager_postUpsellAction));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16NewsSubscription19WebOptinFlowManager____lazy_storage___verifyingSpinnerViewController);
}

- (void)handledAction:(id)a3 state:(unint64_t)a4
{
  v4 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16NewsSubscription19WebOptinFlowManager_postUpsellAction);
  if (v4)
  {
    swift_unknownObjectRetain();
    v7 = self;
    uint64_t v6 = sub_1BFA9C504((uint64_t)v4);
    v4(v6);
    sub_1BFA9C2FC((uint64_t)v4);
    swift_unknownObjectRelease();
  }
}

@end