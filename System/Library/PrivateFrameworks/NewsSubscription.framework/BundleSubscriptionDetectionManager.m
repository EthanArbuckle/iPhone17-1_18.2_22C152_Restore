@interface BundleSubscriptionDetectionManager
- (_TtC16NewsSubscription34BundleSubscriptionDetectionManager)init;
- (void)bundleSubscriptionDidExpire:(id)a3;
- (void)bundleSubscriptionDidSubscribe:(id)a3 hideBundleDetectionUI:(BOOL)a4;
- (void)dealloc;
@end

@implementation BundleSubscriptionDetectionManager

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = qword_1EBA82A18;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_1BFBD2DC8();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EBA8EE00);
  v7 = sub_1BFBD2DA8();
  os_log_type_t v8 = sub_1BFBD4A18();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1BFA45000, v7, v8, "De-initializing BundleSubscriptionManager!", v9, 2u);
    MEMORY[0x1C18BCB70](v9, -1, -1);
  }

  v10.receiver = v5;
  v10.super_class = ObjectType;
  [(BundleSubscriptionDetectionManager *)&v10 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_postPurchaseOnboardingManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_router);
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_userInfo);
}

- (_TtC16NewsSubscription34BundleSubscriptionDetectionManager)init
{
  result = (_TtC16NewsSubscription34BundleSubscriptionDetectionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)bundleSubscriptionDidSubscribe:(id)a3 hideBundleDetectionUI:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1BFBC7340(a4);
}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  swift_getObjectType();
  uint64_t v5 = qword_1EA183D90;
  id v6 = a3;
  os_log_type_t v8 = self;
  if (v5 != -1) {
    swift_once();
  }
  sub_1BFBC7744(&qword_1EA187098, v7, (void (*)(uint64_t))type metadata accessor for BundleSubscriptionDetectionManager);
  sub_1BFBD2238();
  objc_msgSend(*(id *)((char *)&v8->super.isa + OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_userInfo), sel_setPostPurchaseOnboardingLastShownDate_, 0);
}

@end