@interface CalendarUnitPickerParameter
- (NSArray)possibleStates;
- (_TtC11WorkflowKitP33_AD767BEAA88C93AB9397AB9AE1AC0E0B27CalendarUnitPickerParameter)initWithDefinition:(id)a3;
- (id)localizedLabelForPossibleState:(id)a3;
@end

@implementation CalendarUnitPickerParameter

- (NSArray)possibleStates
{
  v2 = self;
  uint64_t v3 = sub_1C8248710();

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
  sub_1C8248824(v4);
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

- (_TtC11WorkflowKitP33_AD767BEAA88C93AB9397AB9AE1AC0E0B27CalendarUnitPickerParameter)initWithDefinition:(id)a3
{
  id v3 = a3;
  sub_1C8248A68();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

@end