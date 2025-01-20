@interface SubscriberStatusConditionProvider
- (_TtC7NewsUI233SubscriberStatusConditionProvider)init;
- (uint64_t)bundleSubscriptionDidSubscribe:(void *)a3;
- (void)configurationManager:(id)a3 appConfigurationDidChange:(id)a4;
@end

@implementation SubscriberStatusConditionProvider

- (_TtC7NewsUI233SubscriberStatusConditionProvider)init
{
  result = (_TtC7NewsUI233SubscriberStatusConditionProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (uint64_t)bundleSubscriptionDidSubscribe:(void *)a3
{
  v4 = *(void **)&a1[OBJC_IVAR____TtC7NewsUI233SubscriberStatusConditionProvider_appConfigurationManager];
  id v5 = a3;
  v6 = a1;
  id v7 = objc_msgSend(v4, sel_possiblyUnfetchedAppConfiguration);
  sub_1DF8A3A1C();

  return swift_unknownObjectRelease();
}

- (void)configurationManager:(id)a3 appConfigurationDidChange:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v5 = self;
  sub_1DF8A3A1C();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end