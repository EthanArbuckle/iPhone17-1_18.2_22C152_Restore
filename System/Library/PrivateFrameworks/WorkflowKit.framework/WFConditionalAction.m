@interface WFConditionalAction
- (BOOL)ignoresOutputFromAction:(id)a3 inWorkflow:(id)a4;
- (BOOL)inputPassthrough;
- (BOOL)inputRequired;
- (BOOL)isDeletable;
- (BOOL)populatesInputFromInputParameter;
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (BOOL)showsAddButtonForParameter:(id)a3;
- (BOOL)skipsProcessingHiddenParameters;
- (BOOL)truthWithVariableSource:(id)a3;
- (BOOL)usesLegacyInputBehavior;
- (NSArray)inputContentClasses;
- (NSArray)parameterDefinitions;
- (WFActionParameterSummary)parameterSummary;
- (WFConditionalAction)init;
- (WFConditionalAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5;
- (id)containedVariables;
- (id)createAccompanyingActions;
- (id)inputSourceInWorkflow:(id)a3;
- (id)localizedDefaultOutputNameWithContext:(id)a3;
- (id)localizedNameWithContext:(id)a3;
- (id)minimumSupportedClientVersion;
- (id)parameterStateForKey:(id)a3 fallingBackToDefaultValue:(BOOL)a4;
- (id)parameterStateUpdateForPlusButtonForParameter:(id)a3;
- (id)serializedParameters;
- (id)visibleParametersWithProcessing:(BOOL)a3;
- (unint64_t)parameterCollapsingBehavior;
- (void)resetEvaluationCriteriaWithVariableSource:(id)a3;
- (void)runWithInput:(WFContentCollection *)a3 completionHandler:(id)a4;
- (void)variableDidChange:(id)a3;
- (void)visibleParametersUpdated;
@end

@implementation WFConditionalAction

- (id)localizedNameWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C809EAC0();

  v6 = (void *)sub_1C8532618();
  swift_bridgeObjectRelease();
  return v6;
}

- (BOOL)isDeletable
{
  v2 = self;
  BOOL v3 = sub_1C809EE64();

  return v3;
}

- (BOOL)usesLegacyInputBehavior
{
  return 1;
}

- (BOOL)inputRequired
{
  v2 = self;
  BOOL v3 = sub_1C809EEEC();

  return v3;
}

- (NSArray)inputContentClasses
{
  v2 = self;
  sub_1C809EF80();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB6A2E40);
  BOOL v3 = (void *)sub_1C8532828();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (BOOL)ignoresOutputFromAction:(id)a3 inWorkflow:(id)a4
{
  uint64_t v5 = (uint64_t)a3;
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  LOBYTE(v5) = sub_1C809F004(v5, (uint64_t)v8);

  return v5 & 1;
}

- (id)inputSourceInWorkflow:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_1C809F0D8((uint64_t)v4);

  return v6;
}

- (BOOL)inputPassthrough
{
  return 1;
}

- (BOOL)populatesInputFromInputParameter
{
  return 0;
}

- (BOOL)skipsProcessingHiddenParameters
{
  return 1;
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1C809F1F0();
  uint64_t v7 = v6;

  if (v7)
  {
    id v8 = (void *)sub_1C8532618();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)createAccompanyingActions
{
  v2 = self;
  uint64_t v3 = sub_1C809F3DC();

  if (v3)
  {
    sub_1C7F42470(0, (unint64_t *)&qword_1EA511C30);
    id v4 = (void *)sub_1C8532828();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (WFConditionalAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  uint64_t v7 = sub_1C8532658();
  uint64_t v9 = v8;
  if (a5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA512650);
    a5 = (id)sub_1C8532538();
  }
  id v10 = a4;
  return (WFConditionalAction *)WFConditionalAction.init(identifier:definition:serializedParameters:)(v7, v9, a4, (uint64_t)a5);
}

- (id)serializedParameters
{
  v2 = self;
  sub_1C809F9C4();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA512650);
  uint64_t v3 = (void *)sub_1C8532518();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)minimumSupportedClientVersion
{
  v2 = self;
  sub_1C809FFE0();

  uint64_t v3 = (void *)sub_1C8532618();
  swift_bridgeObjectRelease();
  return v3;
}

- (WFActionParameterSummary)parameterSummary
{
  v2 = self;
  sub_1C80A0464();
  id v4 = v3;

  return (WFActionParameterSummary *)v4;
}

- (NSArray)parameterDefinitions
{
  return (NSArray *)sub_1C80A320C(self, (uint64_t)a2, (void (*)(void))sub_1C80A0B2C, (unint64_t *)&unk_1EA5148D0);
}

- (id)visibleParametersWithProcessing:(BOOL)a3
{
  uint64_t v3 = self;
  sub_1C80A0EE8();

  sub_1C7F42470(0, (unint64_t *)&qword_1EA5135D0);
  id v4 = (void *)sub_1C8532828();
  swift_bridgeObjectRelease();
  return v4;
}

- (unint64_t)parameterCollapsingBehavior
{
  return 2;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  sub_1C8532658();
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  sub_1C80A1E98();
  char v7 = v6;
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (id)parameterStateForKey:(id)a3 fallingBackToDefaultValue:(BOOL)a4
{
  uint64_t v5 = sub_1C8532658();
  uint64_t v7 = v6;
  uint64_t v8 = self;
  id v9 = sub_1C80A2C50(v5, v7);

  swift_bridgeObjectRelease();
  return v9;
}

- (id)containedVariables
{
  return sub_1C80A320C(self, (uint64_t)a2, (void (*)(void))sub_1C80A3098, (unint64_t *)&qword_1EA5143D0);
}

- (void)visibleParametersUpdated
{
  v2 = self;
  sub_1C80A3290();
}

- (void)resetEvaluationCriteriaWithVariableSource:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  sub_1C80A364C(a3);
  swift_unknownObjectRelease();
}

- (BOOL)truthWithVariableSource:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  unsigned __int8 v6 = sub_1C80A3828(a3);
  swift_unknownObjectRelease();

  return v6 & 1;
}

- (void)runWithInput:(WFContentCollection *)a3 completionHandler:(id)a4
{
  unsigned __int8 v6 = _Block_copy(a4);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  uint64_t v8 = a3;
  id v9 = self;
  sub_1C82A95B4((uint64_t)&unk_1EA5153D8, (uint64_t)v7);
}

- (WFConditionalAction)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___WFConditionalAction____lazy_storage___addButtonParameter));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (BOOL)showsAddButtonForParameter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = WFConditionalAction.showsAddButton(for:)((WFParameter *)v5);

  return self & 1;
}

- (id)parameterStateUpdateForPlusButtonForParameter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  unsigned __int8 v6 = (void *)WFConditionalAction.parameterStateUpdateForPlusButton(for:)((WFParameter *)v5);

  return v6;
}

- (void)variableDidChange:(id)a3
{
  id v4 = a3;
  v7.super.Class isa = (Class)self;
  Class isa = v7.super.isa;
  WFConditionalAction.variableDidChange(_:)(v7);
}

@end