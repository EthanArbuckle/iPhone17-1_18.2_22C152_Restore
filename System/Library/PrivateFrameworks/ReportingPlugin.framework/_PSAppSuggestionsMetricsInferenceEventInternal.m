@interface _PSAppSuggestionsMetricsInferenceEventInternal
- (NSSet)suggestions;
- (NSString)description;
- (_PSAppSuggestionsMetricsInferenceEventInternal)initWithId:(id)a3 suggestions:(id)a4;
@end

@implementation _PSAppSuggestionsMetricsInferenceEventInternal

- (NSSet)suggestions
{
  type metadata accessor for AppSuggestions.AppSuggestion();
  sub_25B3CCC10(&qword_26B346780, (void (*)(void))type metadata accessor for AppSuggestions.AppSuggestion);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_25B3DCF08();
  swift_bridgeObjectRelease();

  return (NSSet *)v2;
}

- (_PSAppSuggestionsMetricsInferenceEventInternal)initWithId:(id)a3 suggestions:(id)a4
{
  uint64_t v5 = sub_25B3DCDE8();
  uint64_t v7 = v6;
  type metadata accessor for AppSuggestions.AppSuggestion();
  sub_25B3CCC10(&qword_26B346780, (void (*)(void))type metadata accessor for AppSuggestions.AppSuggestion);
  uint64_t v8 = sub_25B3DCF18();
  v9 = self;
  sub_25B3C7488(v8);
  *(Class *)((char *)&v9->super.super.isa + OBJC_IVAR____PSAppSuggestionsMetricsInferenceEventInternal_suggestions) = (Class)v8;

  v10 = (uint64_t *)((char *)v9 + OBJC_IVAR____TtC15ReportingPlugin25PeopleSuggestionInference_id);
  uint64_t *v10 = v5;
  v10[1] = v7;
  v12.receiver = v9;
  v12.super_class = (Class)type metadata accessor for PeopleSuggestionInference();
  return [(PeopleSuggestionInference *)&v12 init];
}

- (void).cxx_destruct
{
}

- (NSString)description
{
  return (NSString *)sub_25B3C5CB4(self, (uint64_t)a2, (void (*)(void))AppSuggestions.description.getter);
}

@end