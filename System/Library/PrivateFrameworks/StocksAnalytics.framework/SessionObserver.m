@interface SessionObserver
- (_TtC15StocksAnalytics15SessionObserver)init;
- (void)bundleSubscriptionDidChange:(id)a3 previousBundleSubscription:(id)a4;
- (void)bundleSubscriptionDidExpire:(id)a3;
- (void)dealloc;
- (void)offerDidChange:(id)a3;
- (void)pushOrientationData;
@end

@implementation SessionObserver

- (void)bundleSubscriptionDidExpire:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s15StocksAnalytics15SessionObserverC27bundleSubscriptionDidExpireyySo08FCBundleF0CF_0(v4);
}

- (void)bundleSubscriptionDidChange:(id)a3 previousBundleSubscription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  _s15StocksAnalytics15SessionObserverC27bundleSubscriptionDidExpireyySo08FCBundleF0CF_0(v6);
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = self;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_currentDevice);
  objc_msgSend(v6, sel_endGeneratingDeviceOrientationNotifications);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(SessionObserver *)&v7 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();

  sub_20AB117BC((uint64_t)self + OBJC_IVAR____TtC15StocksAnalytics15SessionObserver_userContext);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15StocksAnalytics15SessionObserver_appConfigurationManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15StocksAnalytics15SessionObserver_watchlistManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15StocksAnalytics15SessionObserver_appIntentExecutionTypeProvider);

  swift_release();
}

- (_TtC15StocksAnalytics15SessionObserver)init
{
  result = (_TtC15StocksAnalytics15SessionObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)pushOrientationData
{
  v2 = self;
  sub_20AB0F130();
}

- (void)offerDidChange:(id)a3
{
  uint64_t v4 = sub_20AB85080();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  objc_super v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20AB85060();
  v8 = self;
  sub_20AB166C8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end