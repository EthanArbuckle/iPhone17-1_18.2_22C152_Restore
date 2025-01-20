@interface MeasurementUnitPickerParameter
- (NSArray)possibleStates;
- (_TtC11WorkflowKitP33_F3D70BA8F8258C8950438AAE8016123730MeasurementUnitPickerParameter)initWithDefinition:(id)a3;
- (id)localizedLabelForPossibleState:(id)a3;
@end

@implementation MeasurementUnitPickerParameter

- (NSArray)possibleStates
{
  v2 = self;
  uint64_t v3 = sub_1C81F4998();

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
  sub_1C81F4AF8(v4);
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

- (_TtC11WorkflowKitP33_F3D70BA8F8258C8950438AAE8016123730MeasurementUnitPickerParameter)initWithDefinition:(id)a3
{
  id v3 = a3;
  sub_1C81F4CB0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WorkflowKitP33_F3D70BA8F8258C8950438AAE8016123730MeasurementUnitPickerParameter_unitType));
}

@end