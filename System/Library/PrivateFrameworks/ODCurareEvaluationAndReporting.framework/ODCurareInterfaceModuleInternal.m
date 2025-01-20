@interface ODCurareInterfaceModuleInternal
- (BOOL)generateCAReportAndReturnError:(id *)a3;
- (ODCurareInterfaceModuleInternal)init;
- (ODCurareInterfaceModuleInternal)initWithBundleIdentifier:(id)a3 evaluationInstance:(id)a4 personalizationInstance:(id)a5 pruningPolicy:(id)a6 error:(id *)a7;
- (id)evaluateModelsWithEvaluationModels:(id)a3 error:(id *)a4;
- (id)getSelectedModelWithDefaultModel:(id)a3 selectionPolicy:(id)a4 error:(id *)a5;
- (id)personalizeModelsWithPersonalizableModels:(id)a3 personalizationPolicy:(id)a4 error:(id *)a5;
@end

@implementation ODCurareInterfaceModuleInternal

- (ODCurareInterfaceModuleInternal)initWithBundleIdentifier:(id)a3 evaluationInstance:(id)a4 personalizationInstance:(id)a5 pruningPolicy:(id)a6 error:(id *)a7
{
  uint64_t v10 = sub_23562D860();
  uint64_t v12 = v11;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v13 = a6;
  return (ODCurareInterfaceModuleInternal *)ODCurareInterfaceModule.init(bundleIdentifier:evaluationInstance:personalizationInstance:pruningPolicy:)(v10, v12, (uint64_t)a4, (uint64_t)a5, a6);
}

- (id)personalizeModelsWithPersonalizableModels:(id)a3 personalizationPolicy:(id)a4 error:(id *)a5
{
  sub_2355E34C0(0, &qword_26ADD0A40);
  uint64_t v8 = sub_23562D980();
  v9 = (objc_class *)a4;
  uint64_t v10 = self;
  v17.super.isa = v9;
  v11.super.super.isa = ODCurareInterfaceModule.personalizeModels(personalizableModels:personalizationPolicy:)((Swift::OpaquePointer)v8, v17).super.super.isa;
  swift_bridgeObjectRelease();

  if (v12.super.super.isa)
  {
    if (a5)
    {
      id v13 = (void *)sub_23562D550();

      id v14 = v13;
      v11.super.super.isa = 0;
      *a5 = v13;
    }
    else
    {

      v11.super.super.isa = 0;
    }
  }
  return v11.super.super.isa;
}

- (id)evaluateModelsWithEvaluationModels:(id)a3 error:(id *)a4
{
  sub_2355E34C0(0, &qword_26ADD0A40);
  uint64_t v6 = sub_23562D980();
  v7 = self;
  v8.super.super.isa = ODCurareInterfaceModule.evaluateModels(evaluationModels:)((Swift::OpaquePointer)v6).super.super.isa;
  swift_bridgeObjectRelease();

  if (v9.super.super.isa)
  {
    if (a4)
    {
      uint64_t v10 = (void *)sub_23562D550();

      id v11 = v10;
      v8.super.super.isa = 0;
      *a4 = v10;
    }
    else
    {

      v8.super.super.isa = 0;
    }
  }
  return v8.super.super.isa;
}

- (id)getSelectedModelWithDefaultModel:(id)a3 selectionPolicy:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  ODCurareInterfaceModule.getSelectedModel(defaultModel:selectionPolicy:)(v12, (ODCurareCandidateModel_optional *)a3, (ODCurareModelSelectionPolicy_optional *)a4);
  v15 = v14;

  if (v13)
  {
    if (a5)
    {
      v16 = (void *)sub_23562D550();

      id v17 = v16;
      v15 = 0;
      *a5 = v16;
    }
    else
    {

      v15 = 0;
    }
  }
  return v15;
}

- (BOOL)generateCAReportAndReturnError:(id *)a3
{
  char v3 = *((unsigned char *)&self->super.isa + OBJC_IVAR___ODCurareInterfaceModuleInternal_shouldReportFailure);
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ODCurareInterfaceModuleInternal_clientBundleIdentifier);
  uint64_t v5 = *(void *)&self->evaluationInstance[OBJC_IVAR___ODCurareInterfaceModuleInternal_clientBundleIdentifier];
  uint64_t v6 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ODCurareInterfaceModuleInternal_modelStore);
  v7 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ODCurareInterfaceModuleInternal_metadataStore);
  NSNumber v8 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ODCurareInterfaceModuleInternal_modelEvaluationSummaryStore);
  id v9 = self;
  sub_235612B18(v4, v5, v6, v7, v8, v3);

  return 1;
}

- (ODCurareInterfaceModuleInternal)init
{
  result = (ODCurareInterfaceModuleInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  char v3 = (char *)self + OBJC_IVAR___ODCurareInterfaceModuleInternal_temporaryDirectory;
  uint64_t v4 = sub_23562D660();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR___ODCurareInterfaceModuleInternal_frameworkExecutionDate;
  uint64_t v6 = sub_23562D770();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  sub_2355E2A84((uint64_t)self + OBJC_IVAR___ODCurareInterfaceModuleInternal_frameworkPersonalizationDate, &qword_26ADD0698);
  sub_2355E2A84((uint64_t)self + OBJC_IVAR___ODCurareInterfaceModuleInternal_lastPersonalizationSampleDate, &qword_26ADD0698);
  sub_2355E2A84((uint64_t)self + OBJC_IVAR___ODCurareInterfaceModuleInternal_frameworkEvaluationDate, &qword_26ADD0698);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ODCurareInterfaceModuleInternal_defaultModelEvaluationSummary));

  sub_2355E2A84((uint64_t)self + OBJC_IVAR___ODCurareInterfaceModuleInternal_frameworkExecutionSelectedModelURL, &qword_26ADD0680);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___ODCurareInterfaceModuleInternal_modelStore);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___ODCurareInterfaceModuleInternal_metadataStore);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___ODCurareInterfaceModuleInternal_modelEvaluationSummaryStore);
}

@end