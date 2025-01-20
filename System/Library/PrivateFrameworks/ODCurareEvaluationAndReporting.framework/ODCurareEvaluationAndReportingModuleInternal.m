@interface ODCurareEvaluationAndReportingModuleInternal
- (BOOL)generatePETReportAndReturnError:(id *)a3;
- (ODCurareEvaluationAndReportingModuleInternal)init;
- (ODCurareEvaluationAndReportingModuleInternal)initWithBundleIdentifier:(id)a3 dataProviderInstance:(id)a4 evaluationInstance:(id)a5 personalizationInstance:(id)a6 pruningPolicy:(id)a7 error:(id *)a8;
- (id)evaluateDefaultModelWithDefaultModelPath:(id)a3 modelConfiguration:(id)a4 error:(id *)a5;
- (id)getEvaluationResults;
- (id)getSelectedModelAndReturnError:(id *)a3;
- (id)trainAndEvaluateAdaptedModelsWithAdaptableModelPath:(id)a3 modelConfiguration:(id)a4 error:(id *)a5;
- (id)trainAndEvaluateModelsWithCandidateModels:(id)a3 personalizationPolicy:(id)a4 modelSelectionPolicy:(id)a5 error:(id *)a6;
- (void)dealloc;
@end

@implementation ODCurareEvaluationAndReportingModuleInternal

- (ODCurareEvaluationAndReportingModuleInternal)initWithBundleIdentifier:(id)a3 dataProviderInstance:(id)a4 evaluationInstance:(id)a5 personalizationInstance:(id)a6 pruningPolicy:(id)a7 error:(id *)a8
{
  uint64_t v12 = sub_23562D860();
  uint64_t v14 = v13;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v15 = a7;
  return (ODCurareEvaluationAndReportingModuleInternal *)ODCurareEvaluationAndReportingModule.init(bundleIdentifier:dataProviderInstance:evaluationInstance:personalizationInstance:pruningPolicy:)(v12, v14, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7);
}

- (id)getSelectedModelAndReturnError:(id *)a3
{
  v4 = self;
  ODCurareEvaluationAndReportingModule.getSelectedModel()(v5);
  v8 = v7;

  if (v6)
  {
    if (a3)
    {
      v9 = (void *)sub_23562D550();

      id v10 = v9;
      v8 = 0;
      *a3 = v9;
    }
    else
    {

      v8 = 0;
    }
  }
  return v8;
}

- (id)trainAndEvaluateModelsWithCandidateModels:(id)a3 personalizationPolicy:(id)a4 modelSelectionPolicy:(id)a5 error:(id *)a6
{
  sub_2355E34C0(0, &qword_26ADD0A40);
  uint64_t v10 = sub_23562D980();
  v11 = (objc_class *)a4;
  uint64_t v12 = (NSArray *)a5;
  uint64_t v13 = self;
  v21.super.isa = v11;
  v21._hyperparameterSelectionPolicy = v12;
  v14.super.super.isa = ODCurareEvaluationAndReportingModule.trainAndEvaluateModels(candidateModels:personalizationPolicy:modelSelectionPolicy:)((Swift::OpaquePointer)v10, v21, *(ODCurareModelSelectionPolicy *)(&v19 - 3)).super.super.isa;
  swift_bridgeObjectRelease();

  if (v15.super.super.isa)
  {
    if (a6)
    {
      v16 = (void *)sub_23562D550();

      id v17 = v16;
      v14.super.super.isa = 0;
      *a6 = v16;
    }
    else
    {

      v14.super.super.isa = 0;
    }
  }
  return v14.super.super.isa;
}

- (id)evaluateDefaultModelWithDefaultModelPath:(id)a3 modelConfiguration:(id)a4 error:(id *)a5
{
  uint64_t v7 = sub_23562D660();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23562D630();
  id v11 = a4;
  uint64_t v12 = self;
  uint64_t v13 = (void *)ODCurareEvaluationAndReportingModule.evaluateDefaultModel(defaultModelPath:modelConfiguration:)((uint64_t)v10, a4);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v13;
}

- (id)trainAndEvaluateAdaptedModelsWithAdaptableModelPath:(id)a3 modelConfiguration:(id)a4 error:(id *)a5
{
  uint64_t v7 = sub_23562D660();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23562D630();
  id v11 = a4;
  uint64_t v12 = self;
  uint64_t v13 = (void *)ODCurareEvaluationAndReportingModule.trainAndEvaluateAdaptedModels(adaptableModelPath:modelConfiguration:)((uint64_t)v12, a4);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v13;
}

- (BOOL)generatePETReportAndReturnError:(id *)a3
{
  v4 = self;
  ODCurareEvaluationAndReportingModule.generatePETReport()();

  if (v5)
  {
    if (a3)
    {
      v6 = (void *)sub_23562D550();

      id v7 = v6;
      *a3 = v6;
    }
    else
    {
    }
  }
  return v5 == 0;
}

- (id)getEvaluationResults
{
  v2 = self;
  ODCurareEvaluationAndReportingModule.getEvaluationResults()();

  v3 = (void *)sub_23562D7D0();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)dealloc
{
  v2 = self;
  swift_bridgeObjectRetain();
  sub_235628854();
  swift_bridgeObjectRelease();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for ODCurareEvaluationAndReportingModule();
  [(ODCurareEvaluationAndReportingModuleInternal *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  objc_super v3 = (char *)self + OBJC_IVAR___ODCurareEvaluationAndReportingModuleInternal_temporaryDirectory;
  uint64_t v4 = sub_23562D660();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___ODCurareEvaluationAndReportingModuleInternal_frameworkExecutionDate;
  uint64_t v6 = sub_23562D770();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  sub_2355E2A84((uint64_t)self + OBJC_IVAR___ODCurareEvaluationAndReportingModuleInternal_frameworkPersonalizationDate, &qword_26ADD0698);
  sub_2355E2A84((uint64_t)self + OBJC_IVAR___ODCurareEvaluationAndReportingModuleInternal_lastPersonalizationSampleDate, &qword_26ADD0698);
  sub_2355E2A84((uint64_t)self + OBJC_IVAR___ODCurareEvaluationAndReportingModuleInternal_frameworkEvaluationDate, &qword_26ADD0698);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___ODCurareEvaluationAndReportingModuleInternal_modelStore);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ODCurareEvaluationAndReportingModuleInternal_defaultModelEvaluationSummary));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ODCurareEvaluationAndReportingModuleInternal_frameworkExecutionMetadata));
  sub_2355E2A84((uint64_t)self + OBJC_IVAR___ODCurareEvaluationAndReportingModuleInternal_frameworkExecutionSelectedModelURL, &qword_26ADD0680);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___ODCurareEvaluationAndReportingModuleInternal_metadataStore);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___ODCurareEvaluationAndReportingModuleInternal_modelEvaluationSummaryStore);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ODCurareEvaluationAndReportingModuleInternal_personalizationResult));
  sub_2355E2A84((uint64_t)self + OBJC_IVAR___ODCurareEvaluationAndReportingModuleInternal_personalizedModelPath, &qword_26ADD0680);
  swift_bridgeObjectRelease();
}

- (ODCurareEvaluationAndReportingModuleInternal)init
{
  result = (ODCurareEvaluationAndReportingModuleInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end