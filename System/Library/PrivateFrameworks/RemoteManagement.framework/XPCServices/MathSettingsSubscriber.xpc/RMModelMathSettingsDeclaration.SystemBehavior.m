@interface RMModelMathSettingsDeclaration.SystemBehavior
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (NSNumber)payloadKeyboardSuggestions;
- (NSNumber)payloadMathNotes;
- (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration14SystemBehavior)init;
- (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration14SystemBehavior)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)combineWithOther:(id)a3;
- (void)setPayloadKeyboardSuggestions:(id)a3;
- (void)setPayloadMathNotes:(id)a3;
@end

@implementation RMModelMathSettingsDeclaration.SystemBehavior

- (NSNumber)payloadKeyboardSuggestions
{
  return (NSNumber *)*(id *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration14SystemBehavior_payloadKeyboardSuggestions];
}

- (void)setPayloadKeyboardSuggestions:(id)a3
{
  id v4 = *(id *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration14SystemBehavior_payloadKeyboardSuggestions];
  *(void *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration14SystemBehavior_payloadKeyboardSuggestions] = a3;
  id v3 = a3;
}

- (NSNumber)payloadMathNotes
{
  return (NSNumber *)*(id *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration14SystemBehavior_payloadMathNotes];
}

- (void)setPayloadMathNotes:(id)a3
{
  id v4 = *(id *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration14SystemBehavior_payloadMathNotes];
  *(void *)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration14SystemBehavior_payloadMathNotes] = a3;
  id v3 = a3;
}

- (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration14SystemBehavior)init
{
  return (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration14SystemBehavior *)sub_100013D40(self, (uint64_t)a2, &OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration14SystemBehavior_payloadKeyboardSuggestions, &OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration14SystemBehavior_payloadMathNotes, type metadata accessor for RMModelMathSettingsDeclaration.SystemBehavior);
}

- (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration14SystemBehavior)initWithCoder:(id)a3
{
  return (_TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration14SystemBehavior *)sub_100013E10(self, (uint64_t)a2, a3, &OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration14SystemBehavior_payloadKeyboardSuggestions, &OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration14SystemBehavior_payloadMathNotes, type metadata accessor for RMModelMathSettingsDeclaration.SystemBehavior);
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  return sub_100012FAC(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (void (*)(uint64_t))sub_100016558);
}

- (id)serializeWithType:(signed __int16)a3
{
  return sub_100013F20(self, (uint64_t)a2, a3, (void (*)(void))_s22MathSettingsSubscriber07RMModelaB11DeclarationC14SystemBehaviorC9serialize4withSDySSypGSo0D17SerializationTypeV_tF_0);
}

- (void)combineWithOther:(id)a3
{
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_1000128A0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr, uint64_t))RMModelMathSettingsDeclaration.SystemBehavior.copy(with:));
}

- (void).cxx_destruct
{
  id v3 = *(void **)&self->RMModelPayloadBase_opaque[OBJC_IVAR____TtCC22MathSettingsSubscriber30RMModelMathSettingsDeclaration14SystemBehavior_payloadMathNotes];
}

@end