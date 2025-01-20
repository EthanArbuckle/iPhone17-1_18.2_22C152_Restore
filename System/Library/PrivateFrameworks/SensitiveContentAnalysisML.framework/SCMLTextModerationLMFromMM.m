@interface SCMLTextModerationLMFromMM
- (_TtC26SensitiveContentAnalysisML26SCMLTextModerationLMFromMM)init;
- (id)initOnBehalfOf:(int64_t)a3 modelManagerServicesUseCaseID:(id)a4 error:(id *)a5;
- (void)predictWithText:(NSString *)a3 completionHandler:(id)a4;
@end

@implementation SCMLTextModerationLMFromMM

- (id)initOnBehalfOf:(int64_t)a3 modelManagerServicesUseCaseID:(id)a4 error:(id *)a5
{
  return SCMLTextModerationLMFromMM.init(onBehalfOf:modelManagerServicesUseCaseID:)(a3);
}

- (void)predictWithText:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A584388);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v13[4] = &unk_26A584650;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26A584658;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_25BF86210((uint64_t)v9, (uint64_t)&unk_26A584660, (uint64_t)v14);
  swift_release();
}

- (_TtC26SensitiveContentAnalysisML26SCMLTextModerationLMFromMM)init
{
  result = (_TtC26SensitiveContentAnalysisML26SCMLTextModerationLMFromMM *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML26SCMLTextModerationLMFromMM_logger;
  uint64_t v4 = sub_25BFF01E0();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end