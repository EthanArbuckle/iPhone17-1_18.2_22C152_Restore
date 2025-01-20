@interface UpdatableStateSubjectPickerParameter
- (BOOL)preferParameterValuePicker;
- (NSArray)possibleStates;
- (_TtC11WorkflowKitP33_965B354D2BCE37F95CE5CB3E462835A136UpdatableStateSubjectPickerParameter)initWithDefinition:(id)a3;
- (id)localizedLabelForPossibleState:(id)a3;
@end

@implementation UpdatableStateSubjectPickerParameter

- (NSArray)possibleStates
{
  v2 = self;
  uint64_t v3 = sub_1C81F8B38();

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
  sub_1C81F8E50(v4);
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

- (BOOL)preferParameterValuePicker
{
  v2 = self;
  BOOL v3 = sub_1C81B0284();

  return v3;
}

- (_TtC11WorkflowKitP33_965B354D2BCE37F95CE5CB3E462835A136UpdatableStateSubjectPickerParameter)initWithDefinition:(id)a3
{
  id v3 = a3;
  sub_1C81F90D8();
}

- (void).cxx_destruct
{
}

@end