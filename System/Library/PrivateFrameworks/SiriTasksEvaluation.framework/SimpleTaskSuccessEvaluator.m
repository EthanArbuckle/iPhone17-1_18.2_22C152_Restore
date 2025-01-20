@interface SimpleTaskSuccessEvaluator
- (_TtC19SiriTasksEvaluation26SimpleTaskSuccessEvaluator)init;
- (id)evaluateWithPseEvents:(id)a3;
@end

@implementation SimpleTaskSuccessEvaluator

- (id)evaluateWithPseEvents:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D40698);
  unint64_t v4 = sub_21E6E1558();
  v5 = self;
  v6 = sub_21E6DC430(v4);

  swift_bridgeObjectRelease();

  return v6;
}

- (_TtC19SiriTasksEvaluation26SimpleTaskSuccessEvaluator)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC19SiriTasksEvaluation26SimpleTaskSuccessEvaluator_minStartCallDurationInMs) = (Class)5000;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SimpleTaskSuccessEvaluator();
  return [(SimpleTaskSuccessEvaluator *)&v3 init];
}

@end