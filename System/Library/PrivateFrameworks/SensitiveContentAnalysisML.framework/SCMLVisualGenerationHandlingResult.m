@interface SCMLVisualGenerationHandlingResult
- (NSDictionary)people;
- (_TtC26SensitiveContentAnalysisML34SCMLVisualGenerationHandlingResult)init;
- (void)setPeople:(id)a3;
@end

@implementation SCMLVisualGenerationHandlingResult

- (NSDictionary)people
{
  swift_beginAccess();
  type metadata accessor for SCMLPersonAttributes();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_25BFF0310();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2;
}

- (void)setPeople:(id)a3
{
  type metadata accessor for SCMLPersonAttributes();
  uint64_t v4 = sub_25BFF0320();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC26SensitiveContentAnalysisML34SCMLVisualGenerationHandlingResult_people);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (_TtC26SensitiveContentAnalysisML34SCMLVisualGenerationHandlingResult)init
{
  result = (_TtC26SensitiveContentAnalysisML34SCMLVisualGenerationHandlingResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end