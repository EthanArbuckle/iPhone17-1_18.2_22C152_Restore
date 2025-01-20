@interface ManagedAppsApplicator
+ (id)supportedConfigurationTypes;
- (_TtC21ManagedAppsSubscriber21ManagedAppsApplicator)init;
- (_TtC21ManagedAppsSubscriber21ManagedAppsApplicator)initWithAdapter:(id)a3 inPlaceUpdates:(BOOL)a4;
@end

@implementation ManagedAppsApplicator

- (_TtC21ManagedAppsSubscriber21ManagedAppsApplicator)init
{
  id v3 = [objc_allocWithZone((Class)type metadata accessor for ManagedAppsAdapter()) init];
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ManagedAppsApplicator();
  v4 = [(ManagedAppsApplicator *)&v6 initWithAdapter:v3 inPlaceUpdates:1];

  [(ManagedAppsApplicator *)v4 setRemoveBeforeApply:1];
  return v4;
}

+ (id)supportedConfigurationTypes
{
  sub_100002AE8(&qword_10001CD30);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100014660;
  id v3 = [self registeredIdentifier];
  uint64_t v4 = sub_100013C18();
  uint64_t v6 = v5;

  *(void *)(inited + 32) = v4;
  *(void *)(inited + 40) = v6;
  sub_1000108AC(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  v7.super.isa = sub_100013D68().super.isa;
  swift_bridgeObjectRelease();

  return v7.super.isa;
}

- (_TtC21ManagedAppsSubscriber21ManagedAppsApplicator)initWithAdapter:(id)a3 inPlaceUpdates:(BOOL)a4
{
  swift_unknownObjectRetain();
  result = (_TtC21ManagedAppsSubscriber21ManagedAppsApplicator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end