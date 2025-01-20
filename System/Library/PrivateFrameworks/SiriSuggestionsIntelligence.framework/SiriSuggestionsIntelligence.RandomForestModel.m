@interface SiriSuggestionsIntelligence.RandomForestModel
- (_TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligence17RandomForestModel)init;
- (_TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligence17RandomForestModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation SiriSuggestionsIntelligence.RandomForestModel

- (_TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligence17RandomForestModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  uint64_t v6 = sub_25DC161F0();
  return (_TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligence17RandomForestModel *)SiriSuggestionsIntelligence.RandomForestModel.init(modelDescription:parameters:)(a3, v6);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  swift_unknownObjectRetain();
  id v8 = a4;
  v9 = self;
  v10 = (void *)SiriSuggestionsIntelligence.RandomForestModel.prediction(from:options:)(a3);

  swift_unknownObjectRelease();

  return v10;
}

- (_TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligence17RandomForestModel)init
{
  return (_TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligence17RandomForestModel *)SiriSuggestionsIntelligence.RandomForestModel.init()();
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

@end