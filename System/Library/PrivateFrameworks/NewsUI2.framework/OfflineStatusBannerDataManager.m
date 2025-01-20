@interface OfflineStatusBannerDataManager
- (_TtC7NewsUI230OfflineStatusBannerDataManager)init;
- (void)bundleSubscriptionDidSubscribe:(void *)a3;
- (void)configurationManager:(id)a3 appConfigurationDidChange:(id)a4;
- (void)dealloc;
- (void)triggerAction;
@end

@implementation OfflineStatusBannerDataManager

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC7NewsUI230OfflineStatusBannerDataManager_bundleSubscriptionManager);
  v5 = self;
  objc_msgSend(v4, sel_removeObserver_, v5);
  objc_msgSend(*(id *)((char *)&v5->super.isa + OBJC_IVAR____TtC7NewsUI230OfflineStatusBannerDataManager_appConfigManager), sel_removeAppConfigObserver_, v5);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(OfflineStatusBannerDataManager *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI230OfflineStatusBannerDataManager_offlineFeatures);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI230OfflineStatusBannerDataManager_feedModeState;
  uint64_t v4 = sub_1DFDFA380();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

- (void)triggerAction
{
  v2 = self;
  MEMORY[0x1E01E38A0]();
}

- (_TtC7NewsUI230OfflineStatusBannerDataManager)init
{
  result = (_TtC7NewsUI230OfflineStatusBannerDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)bundleSubscriptionDidSubscribe:(void *)a3
{
  id v4 = a3;
  id v5 = a1;
  MEMORY[0x1E01E38A0]();
}

- (void)configurationManager:(id)a3 appConfigurationDidChange:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v5 = self;
  MEMORY[0x1E01E38A0]();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end