@interface EventHistoryAggregateStoreStateModeResolver
- (_TtC19NewsPersonalization43EventHistoryAggregateStoreStateModeResolver)init;
- (id)aggregateStore;
- (id)generateDerivedData;
@end

@implementation EventHistoryAggregateStoreStateModeResolver

- (_TtC19NewsPersonalization43EventHistoryAggregateStoreStateModeResolver)init
{
  result = (_TtC19NewsPersonalization43EventHistoryAggregateStoreStateModeResolver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19NewsPersonalization43EventHistoryAggregateStoreStateModeResolver_personalizationData));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC19NewsPersonalization43EventHistoryAggregateStoreStateModeResolver_userEventHistoryAggregateStoreFactory);

  swift_release();
}

- (id)generateDerivedData
{
  v2 = self;
  id v3 = sub_1DE60A824();

  return v3;
}

- (id)aggregateStore
{
  v2 = self;
  sub_1DE60A528();
  v4 = v3;

  swift_unknownObjectRelease();

  return v4;
}

@end