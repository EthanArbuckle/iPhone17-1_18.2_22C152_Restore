@interface RMModelMathSettingsDeclaration.CalculatorMathNotesMode
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSNumber)payloadEnabled;
- (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration23CalculatorMathNotesMode)init;
- (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration23CalculatorMathNotesMode)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)combineWithOther:(id)a3;
- (void)setPayloadEnabled:(id)a3;
@end

@implementation RMModelMathSettingsDeclaration.CalculatorMathNotesMode

- (NSNumber)payloadEnabled
{
  return (NSNumber *)*(id *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration23CalculatorMathNotesMode_payloadEnabled];
}

- (void)setPayloadEnabled:(id)a3
{
  id v4 = *(id *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration23CalculatorMathNotesMode_payloadEnabled];
  *(void *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration23CalculatorMathNotesMode_payloadEnabled] = a3;
  id v3 = a3;
}

- (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration23CalculatorMathNotesMode)init
{
  return (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration23CalculatorMathNotesMode *)sub_100012E10(self, (uint64_t)a2, &OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration23CalculatorMathNotesMode_payloadEnabled, type metadata accessor for RMModelMathSettingsDeclaration.CalculatorMathNotesMode);
}

- (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration23CalculatorMathNotesMode)initWithCoder:(id)a3
{
  return (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration23CalculatorMathNotesMode *)sub_100012EC8(self, (uint64_t)a2, a3, &OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration23CalculatorMathNotesMode_payloadEnabled, type metadata accessor for RMModelMathSettingsDeclaration.CalculatorMathNotesMode);
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  return sub_100012FAC(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (void (*)(uint64_t))sub_100015E28);
}

- (id)serializeWithType:(signed __int16)a3
{
  return sub_100013F20(self, (uint64_t)a2, a3, (void (*)(void))_s22MathSettingsSubscriber07RMModelaB11DeclarationC010CalculatorA9NotesModeC9serialize4withSDySSypGSo0D17SerializationTypeV_tF_0);
}

- (void)combineWithOther:(id)a3
{
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_1000128A0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr, uint64_t))RMModelMathSettingsDeclaration.CalculatorMathNotesMode.copy(with:));
}

- (void).cxx_destruct
{
}

@end