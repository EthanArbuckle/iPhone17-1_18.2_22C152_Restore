@interface DynamicViewControllerFactory
- (_TtC16NewsSubscription28DynamicViewControllerFactory)init;
@end

@implementation DynamicViewControllerFactory

- (_TtC16NewsSubscription28DynamicViewControllerFactory)init
{
  result = (_TtC16NewsSubscription28DynamicViewControllerFactory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription28DynamicViewControllerFactory_dynamicViewControllerDelegate));
  v3 = (char *)self + OBJC_IVAR____TtC16NewsSubscription28DynamicViewControllerFactory_metricsBuilder;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end