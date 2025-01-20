@interface RMModelMathSettingsDeclaration
+ (NSString)registeredClassName;
+ (NSString)registeredIdentifier;
+ (id)assetTypes;
+ (id)supportedOS;
- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (_TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration)init;
- (_TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration)initWithCoder:(id)a3;
- (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator)payloadCalculator;
- (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration14SystemBehavior)payloadSystemBehavior;
- (id)assetReferences;
- (id)copyWithZone:(void *)a3;
- (id)serializePayloadWithType:(signed __int16)a3;
- (void)setPayloadCalculator:(id)a3;
- (void)setPayloadSystemBehavior:(id)a3;
@end

@implementation RMModelMathSettingsDeclaration

+ (NSString)registeredClassName
{
  NSString v2 = sub_100016BB0();

  return (NSString *)v2;
}

+ (NSString)registeredIdentifier
{
  NSString v2 = sub_100016BB0();

  return (NSString *)v2;
}

- (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator)payloadCalculator
{
  return (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator *)*(id *)&self->RMModelConfigurationBase_opaque[OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadCalculator];
}

- (void)setPayloadCalculator:(id)a3
{
  id v4 = *(id *)&self->RMModelConfigurationBase_opaque[OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadCalculator];
  *(void *)&self->RMModelConfigurationBase_opaque[OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadCalculator] = a3;
  id v3 = a3;
}

- (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration14SystemBehavior)payloadSystemBehavior
{
  return (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration14SystemBehavior *)*(id *)&self->RMModelConfigurationBase_opaque[OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadSystemBehavior];
}

- (void)setPayloadSystemBehavior:(id)a3
{
  id v4 = *(id *)&self->RMModelConfigurationBase_opaque[OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadSystemBehavior];
  *(void *)&self->RMModelConfigurationBase_opaque[OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadSystemBehavior] = a3;
  id v3 = a3;
}

- (_TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration)init
{
  return (_TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration *)sub_10000FD38();
}

- (_TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration)initWithCoder:(id)a3
{
  *(void *)&self->RMModelConfigurationBase_opaque[OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadCalculator] = 0;
  *(void *)&self->RMModelConfigurationBase_opaque[OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadSystemBehavior] = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RMModelMathSettingsDeclaration();
  return [(RMModelMathSettingsDeclaration *)&v5 initWithCoder:a3];
}

+ (id)supportedOS
{
  _s22MathSettingsSubscriber07RMModelaB11DeclarationC11supportedOSSDySo8NSNumberCSayShyAFGGGyFZ_0();
  sub_10000D85C(0, (unint64_t *)&qword_100021F38);
  sub_100003E74(&qword_1000222F8);
  sub_1000169A0();
  v2.super.isa = sub_100016B50().super.isa;
  swift_bridgeObjectRelease();

  return v2.super.isa;
}

+ (id)assetTypes
{
  v2.super.isa = sub_100016CD0().super.isa;

  return v2.super.isa;
}

- (id)assetReferences
{
  sub_10000D85C(0, &qword_1000222F0);
  v2.super.isa = sub_100016C60().super.isa;

  return v2.super.isa;
}

- (BOOL)loadPayloadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  return sub_1000117C8(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t))RMModelMathSettingsDeclaration.loadPayload(from:serializationType:));
}

- (id)serializePayloadWithType:(signed __int16)a3
{
  return sub_10001214C(self, (uint64_t)a2, a3, (void (*)(uint64_t))RMModelMathSettingsDeclaration.serializePayload(with:));
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_1000128A0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr, uint64_t))RMModelMathSettingsDeclaration.copy(with:));
}

- (void).cxx_destruct
{
  id v3 = *(void **)&self->RMModelConfigurationBase_opaque[OBJC_IVAR____TtC22MathSettingsSubscriber30RMModelMathSettingsDeclaration_payloadSystemBehavior];
}

@end