@interface RMModelMathSettingsDeclaration.Calculator
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator)init;
- (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator)initWithCoder:(id)a3;
- (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration19CalculatorBasicMode)payloadBasicMode;
- (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration20CalculatorInputModes)payloadInputModes;
- (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration23CalculatorMathNotesMode)payloadMathNotesMode;
- (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration24CalculatorProgrammerMode)payloadProgrammerMode;
- (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration24CalculatorScientificMode)payloadScientificMode;
- (id)copyWithZone:(void *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)combineWithOther:(id)a3;
- (void)setPayloadBasicMode:(id)a3;
- (void)setPayloadInputModes:(id)a3;
- (void)setPayloadMathNotesMode:(id)a3;
- (void)setPayloadProgrammerMode:(id)a3;
- (void)setPayloadScientificMode:(id)a3;
@end

@implementation RMModelMathSettingsDeclaration.Calculator

- (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration19CalculatorBasicMode)payloadBasicMode
{
  return (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration19CalculatorBasicMode *)*(id *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadBasicMode];
}

- (void)setPayloadBasicMode:(id)a3
{
  id v4 = *(id *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadBasicMode];
  *(void *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadBasicMode] = a3;
  id v3 = a3;
}

- (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration24CalculatorScientificMode)payloadScientificMode
{
  return (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration24CalculatorScientificMode *)*(id *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadScientificMode];
}

- (void)setPayloadScientificMode:(id)a3
{
  id v4 = *(id *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadScientificMode];
  *(void *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadScientificMode] = a3;
  id v3 = a3;
}

- (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration24CalculatorProgrammerMode)payloadProgrammerMode
{
  return (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration24CalculatorProgrammerMode *)*(id *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadProgrammerMode];
}

- (void)setPayloadProgrammerMode:(id)a3
{
  id v4 = *(id *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadProgrammerMode];
  *(void *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadProgrammerMode] = a3;
  id v3 = a3;
}

- (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration23CalculatorMathNotesMode)payloadMathNotesMode
{
  return (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration23CalculatorMathNotesMode *)*(id *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadMathNotesMode];
}

- (void)setPayloadMathNotesMode:(id)a3
{
  id v4 = *(id *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadMathNotesMode];
  *(void *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadMathNotesMode] = a3;
  id v3 = a3;
}

- (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration20CalculatorInputModes)payloadInputModes
{
  return (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration20CalculatorInputModes *)*(id *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadInputModes];
}

- (void)setPayloadInputModes:(id)a3
{
  id v4 = *(id *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadInputModes];
  *(void *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadInputModes] = a3;
  id v3 = a3;
}

- (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator)init
{
  *(void *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadBasicMode] = 0;
  *(void *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadScientificMode] = 0;
  *(void *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadProgrammerMode] = 0;
  *(void *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadMathNotesMode] = 0;
  *(void *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadInputModes] = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RMModelMathSettingsDeclaration.Calculator();
  return [(RMModelMathSettingsDeclaration.Calculator *)&v3 init];
}

- (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator)initWithCoder:(id)a3
{
  return (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator *)sub_100011140(a3);
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  return sub_1000117C8(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t))RMModelMathSettingsDeclaration.Calculator.load(from:serializationType:));
}

- (id)serializeWithType:(signed __int16)a3
{
  return sub_10001214C(self, (uint64_t)a2, a3, (void (*)(uint64_t))RMModelMathSettingsDeclaration.Calculator.serialize(with:));
}

- (void)combineWithOther:(id)a3
{
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_1000128A0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr, uint64_t))RMModelMathSettingsDeclaration.Calculator.copy(with:));
}

- (void).cxx_destruct
{
  objc_super v3 = *(void **)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration10Calculator_payloadInputModes];
}

@end