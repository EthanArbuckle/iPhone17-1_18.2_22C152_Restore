@interface ParameterValuePickerModel
- (_TtC14WorkflowEditor25ParameterValuePickerModel)init;
- (void)_reload;
- (void)parameterAttributesDidChange:(id)a3;
@end

@implementation ParameterValuePickerModel

- (void)_reload
{
  v2 = self;
  sub_23496927C();
}

- (void)parameterAttributesDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23496B9B8(v4);
}

- (_TtC14WorkflowEditor25ParameterValuePickerModel)init
{
}

- (void).cxx_destruct
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D0E08);
  OUTLINED_FUNCTION_5_9();
  uint64_t v3 = OUTLINED_FUNCTION_8_8();
  v4(v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D0E10);
  OUTLINED_FUNCTION_5_9();
  uint64_t v5 = OUTLINED_FUNCTION_8_8();
  v6(v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687D0E18);
  OUTLINED_FUNCTION_5_9();
  uint64_t v7 = OUTLINED_FUNCTION_8_8();
  v8(v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2687CFF80);
  OUTLINED_FUNCTION_5_9();
  uint64_t v9 = OUTLINED_FUNCTION_8_8();
  v10(v9);

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_2349159D0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC14WorkflowEditor25ParameterValuePickerModel_onSelectedStateChange));
  sub_2349159D0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC14WorkflowEditor25ParameterValuePickerModel_onSelectMagicVariable));
  sub_2349159D0(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC14WorkflowEditor25ParameterValuePickerModel_onCancel));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor25ParameterValuePickerModel_defaultCollection));
  swift_bridgeObjectRelease();
  v11 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14WorkflowEditor25ParameterValuePickerModel_reloadDebouncer);
}

@end