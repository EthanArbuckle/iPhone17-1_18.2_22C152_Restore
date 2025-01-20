@interface PasscodeSettingsApplicator
+ (id)supportedConfigurationTypes;
- (_TtC26PasscodeSettingsSubscriber26PasscodeSettingsApplicator)init;
- (_TtC26PasscodeSettingsSubscriber26PasscodeSettingsApplicator)initWithAdapter:(id)a3 inPlaceUpdates:(BOOL)a4;
@end

@implementation PasscodeSettingsApplicator

- (_TtC26PasscodeSettingsSubscriber26PasscodeSettingsApplicator)init
{
  id v3 = [objc_allocWithZone((Class)type metadata accessor for PasscodeSettingsAdapter()) init];
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PasscodeSettingsApplicator();
  v4 = [(PasscodeSettingsApplicator *)&v6 initWithAdapter:v3 inPlaceUpdates:1];

  return v4;
}

+ (id)supportedConfigurationTypes
{
  sub_100003184(&qword_100015010);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10000DA00;
  id v3 = [self registeredIdentifier];
  uint64_t v4 = sub_10000D0E8();
  uint64_t v6 = v5;

  *(void *)(inited + 32) = v4;
  *(void *)(inited + 40) = v6;
  sub_10000C1CC(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  v7.super.isa = sub_10000D1B8().super.isa;
  swift_bridgeObjectRelease();

  return v7.super.isa;
}

- (_TtC26PasscodeSettingsSubscriber26PasscodeSettingsApplicator)initWithAdapter:(id)a3 inPlaceUpdates:(BOOL)a4
{
  swift_unknownObjectRetain();
  result = (_TtC26PasscodeSettingsSubscriber26PasscodeSettingsApplicator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end