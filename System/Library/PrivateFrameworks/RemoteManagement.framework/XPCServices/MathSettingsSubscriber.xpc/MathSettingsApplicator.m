@interface MathSettingsApplicator
+ (id)supportedConfigurationClassesArray;
+ (id)supportedConfigurationTypes;
- (_TtC22MathSettingsSubscriber22MathSettingsApplicator)init;
- (_TtC22MathSettingsSubscriber22MathSettingsApplicator)initWithAdapter:(id)a3;
@end

@implementation MathSettingsApplicator

- (_TtC22MathSettingsSubscriber22MathSettingsApplicator)init
{
  id v3 = [objc_allocWithZone((Class)type metadata accessor for MathSettingsAdapter()) init];
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MathSettingsApplicator();
  v4 = [(MathSettingsApplicator *)&v6 initWithAdapter:v3];

  return v4;
}

+ (id)supportedConfigurationTypes
{
  sub_10000F420((uint64_t)&off_10001C850);
  swift_arrayDestroy();
  v2.super.isa = sub_100016CD0().super.isa;
  swift_bridgeObjectRelease();

  return v2.super.isa;
}

+ (id)supportedConfigurationClassesArray
{
  sub_100003E74(&qword_100021B58);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100017BB0;
  *(void *)(v2 + 32) = type metadata accessor for RMModelMathSettingsDeclaration();
  sub_100003E74((uint64_t *)&unk_100021F20);
  v3.super.isa = sub_100016C60().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (_TtC22MathSettingsSubscriber22MathSettingsApplicator)initWithAdapter:(id)a3
{
  swift_unknownObjectRetain();
  result = (_TtC22MathSettingsSubscriber22MathSettingsApplicator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end