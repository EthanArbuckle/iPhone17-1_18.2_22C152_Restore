@interface InteractiveLegacyProfilesApplicator
+ (id)supportedConfigurationTypes;
- (_TtC35InteractiveLegacyProfilesSubscriber35InteractiveLegacyProfilesApplicator)init;
- (_TtC35InteractiveLegacyProfilesSubscriber35InteractiveLegacyProfilesApplicator)initWithAdapter:(id)a3 inPlaceUpdates:(BOOL)a4;
@end

@implementation InteractiveLegacyProfilesApplicator

- (_TtC35InteractiveLegacyProfilesSubscriber35InteractiveLegacyProfilesApplicator)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = [objc_allocWithZone((Class)type metadata accessor for InteractiveLegacyProfilesAdapter()) init];
  v7.receiver = self;
  v7.super_class = ObjectType;
  v5 = [(InteractiveLegacyProfilesApplicator *)&v7 initWithAdapter:v4 inPlaceUpdates:1];

  return v5;
}

- (_TtC35InteractiveLegacyProfilesSubscriber35InteractiveLegacyProfilesApplicator)initWithAdapter:(id)a3 inPlaceUpdates:(BOOL)a4
{
  BOOL v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(InteractiveLegacyProfilesApplicator *)&v7 initWithAdapter:a3 inPlaceUpdates:v4];
}

+ (id)supportedConfigurationTypes
{
  sub_100001E9C(&qword_100010D28);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100009D10;
  id v3 = [self registeredIdentifier];
  uint64_t v4 = sub_100009510();
  uint64_t v6 = v5;

  *(void *)(inited + 32) = v4;
  *(void *)(inited + 40) = v6;
  sub_10000925C(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  v7.super.isa = sub_1000095A0().super.isa;
  swift_bridgeObjectRelease();

  return v7.super.isa;
}

@end