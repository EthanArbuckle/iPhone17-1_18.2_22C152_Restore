@interface _PSPeopleSuggestionsMetricsInferenceEventInternal
- (NSString)description;
- (_PSPeopleSuggestionsMetricsInferenceEventInternal)initWithId:(id)a3 responseType:(int64_t)a4 suggestions:(id)a5;
@end

@implementation _PSPeopleSuggestionsMetricsInferenceEventInternal

- (_PSPeopleSuggestionsMetricsInferenceEventInternal)initWithId:(id)a3 responseType:(int64_t)a4 suggestions:(id)a5
{
  uint64_t v7 = sub_25B3DCDE8();
  uint64_t v9 = v8;
  type metadata accessor for PeopleSuggestions.PeopleSuggestion();
  sub_25B3CCC10(&qword_26B346878, (void (*)(void))type metadata accessor for PeopleSuggestions.PeopleSuggestion);
  uint64_t v10 = sub_25B3DCF18();
  v11 = self;
  sub_25B3C89CC(v10);
  *(Class *)((char *)&v11->super.super.isa + OBJC_IVAR____PSPeopleSuggestionsMetricsInferenceEventInternal_responseType) = (Class)a4;
  *(Class *)((char *)&v11->super.super.isa + OBJC_IVAR____PSPeopleSuggestionsMetricsInferenceEventInternal_suggestions) = (Class)v10;

  v12 = (uint64_t *)((char *)v11 + OBJC_IVAR____TtC15ReportingPlugin25PeopleSuggestionInference_id);
  uint64_t *v12 = v7;
  v12[1] = v9;
  v14.receiver = v11;
  v14.super_class = (Class)type metadata accessor for PeopleSuggestionInference();
  return [(PeopleSuggestionInference *)&v14 init];
}

- (void).cxx_destruct
{
}

- (NSString)description
{
  return (NSString *)sub_25B3C5CB4(self, (uint64_t)a2, (void (*)(void))PeopleSuggestions.description.getter);
}

@end