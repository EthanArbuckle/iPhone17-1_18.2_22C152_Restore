@interface SettingPickerParameter
- (BOOL)preferParameterValuePicker;
- (NSArray)possibleStates;
- (_TtC11WorkflowKit22SettingPickerParameter)initWithDefinition:(id)a3;
- (id)localizedLabelForPossibleState:(id)a3;
@end

@implementation SettingPickerParameter

- (BOOL)preferParameterValuePicker
{
  v2 = self;
  BOOL v3 = sub_1C81B0284();

  return v3;
}

- (NSArray)possibleStates
{
  v2 = self;
  uint64_t v3 = sub_1C81B0360();

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
  return sub_1C81B04F4(self, (uint64_t)a2, a3, (uint64_t (*)(id))sub_1C81B0364);
}

- (_TtC11WorkflowKit22SettingPickerParameter)initWithDefinition:(id)a3
{
  return (_TtC11WorkflowKit22SettingPickerParameter *)sub_1C81B0578(a3);
}

- (void).cxx_destruct
{
  sub_1C7F782F8((uint64_t)self + OBJC_IVAR____TtC11WorkflowKit22SettingPickerParameter_datasource);
  swift_bridgeObjectRelease();
}

@end