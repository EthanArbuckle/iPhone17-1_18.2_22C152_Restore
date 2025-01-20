@interface SCMLSafetyGuardrailResult
- (BOOL)safe;
- (NSArray)labels;
- (_TtC26SensitiveContentAnalysisML25SCMLSafetyGuardrailResult)init;
- (_TtC26SensitiveContentAnalysisML25SCMLSafetyGuardrailResult)initWithResult:(id)a3;
@end

@implementation SCMLSafetyGuardrailResult

- (BOOL)safe
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC26SensitiveContentAnalysisML25SCMLSafetyGuardrailResult_safe);
}

- (NSArray)labels
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_25BFF04B0();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (_TtC26SensitiveContentAnalysisML25SCMLSafetyGuardrailResult)initWithResult:(id)a3
{
  uint64_t v3 = sub_25BFF0380();
  return (_TtC26SensitiveContentAnalysisML25SCMLSafetyGuardrailResult *)SCMLSafetyGuardrailResult.init(result:)(v3, v4);
}

- (_TtC26SensitiveContentAnalysisML25SCMLSafetyGuardrailResult)init
{
  result = (_TtC26SensitiveContentAnalysisML25SCMLSafetyGuardrailResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end