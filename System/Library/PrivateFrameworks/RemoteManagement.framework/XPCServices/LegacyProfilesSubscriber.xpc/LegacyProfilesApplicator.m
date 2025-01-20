@interface LegacyProfilesApplicator
+ (id)supportedConfigurationTypes;
- (_TtC24LegacyProfilesSubscriber24LegacyProfilesApplicator)init;
- (_TtC24LegacyProfilesSubscriber24LegacyProfilesApplicator)initWithAdapter:(id)a3 inPlaceUpdates:(BOOL)a4;
@end

@implementation LegacyProfilesApplicator

- (_TtC24LegacyProfilesSubscriber24LegacyProfilesApplicator)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = [objc_allocWithZone((Class)type metadata accessor for LegacyProfilesAdapter()) init];
  v7.receiver = self;
  v7.super_class = ObjectType;
  v5 = [(LegacyProfilesApplicator *)&v7 initWithAdapter:v4 inPlaceUpdates:1];

  return v5;
}

- (_TtC24LegacyProfilesSubscriber24LegacyProfilesApplicator)initWithAdapter:(id)a3 inPlaceUpdates:(BOOL)a4
{
  BOOL v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(LegacyProfilesApplicator *)&v7 initWithAdapter:a3 inPlaceUpdates:v4];
}

+ (id)supportedConfigurationTypes
{
  sub_100001D08(&qword_100010D28);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100009D70;
  id v3 = [self registeredIdentifier];
  uint64_t v4 = sub_100009580();
  uint64_t v6 = v5;

  *(void *)(inited + 32) = v4;
  *(void *)(inited + 40) = v6;
  sub_1000092CC(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  v7.super.isa = sub_100009610().super.isa;
  swift_bridgeObjectRelease();

  return v7.super.isa;
}

@end