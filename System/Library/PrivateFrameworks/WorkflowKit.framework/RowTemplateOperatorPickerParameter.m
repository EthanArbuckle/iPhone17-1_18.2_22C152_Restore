@interface RowTemplateOperatorPickerParameter
- (BOOL)parameterStateIsValid:(id)a3;
- (NSArray)possibleStates;
- (_TtC11WorkflowKitP33_4F21910BB89D8A2662B5B8AC5ABCCA7D34RowTemplateOperatorPickerParameter)initWithDefinition:(id)a3;
- (id)localizedLabelForPossibleState:(id)a3;
@end

@implementation RowTemplateOperatorPickerParameter

- (NSArray)possibleStates
{
  v2 = self;
  uint64_t v3 = sub_1C80570C4();

  if (v3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA5148B0);
    v4 = (void *)sub_1C8532828();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C8057310(v4);
  uint64_t v7 = v6;

  if (v7)
  {
    v8 = (void *)sub_1C8532618();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)parameterStateIsValid:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1C80577A0((uint64_t)v4);

  return self & 1;
}

- (_TtC11WorkflowKitP33_4F21910BB89D8A2662B5B8AC5ABCCA7D34RowTemplateOperatorPickerParameter)initWithDefinition:(id)a3
{
  id v3 = a3;
  sub_1C80578C8();
}

- (void).cxx_destruct
{
}

@end