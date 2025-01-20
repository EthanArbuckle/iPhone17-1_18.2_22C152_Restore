@interface SCMLSafetyGuardrail
- (NSString)bundleID;
- (_TtC26SensitiveContentAnalysisML19SCMLSafetyGuardrail)init;
- (_TtC26SensitiveContentAnalysisML19SCMLSafetyGuardrail)initWithBackend:(unint64_t)a3 onBehalfOf:(int64_t)a4 modelManagerServicesUseCaseID:(id)a5 error:(id *)a6;
- (void)predictWithText:(NSString *)a3 completionHandler:(id)a4;
@end

@implementation SCMLSafetyGuardrail

- (NSString)bundleID
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_25BFF0370();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC26SensitiveContentAnalysisML19SCMLSafetyGuardrail)initWithBackend:(unint64_t)a3 onBehalfOf:(int64_t)a4 modelManagerServicesUseCaseID:(id)a5 error:(id *)a6
{
  uint64_t v8 = sub_25BFF0380();
  return (_TtC26SensitiveContentAnalysisML19SCMLSafetyGuardrail *)SCMLSafetyGuardrail.init(backend:onBehalfOf:modelManagerServicesUseCaseID:)(a3, a4, v8, v9);
}

- (void)predictWithText:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A584388);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_25BFF0540();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26A584398;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26A5843A8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_25BF86210((uint64_t)v9, (uint64_t)&unk_26A5843B8, (uint64_t)v14);
  swift_release();
}

- (_TtC26SensitiveContentAnalysisML19SCMLSafetyGuardrail)init
{
  result = (_TtC26SensitiveContentAnalysisML19SCMLSafetyGuardrail *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML19SCMLSafetyGuardrail_systemPrompt;
  uint64_t v4 = sub_25BFF0300();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  v5 = (char *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML19SCMLSafetyGuardrail_logger;
  uint64_t v6 = sub_25BFF01E0();
  uint64_t v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end