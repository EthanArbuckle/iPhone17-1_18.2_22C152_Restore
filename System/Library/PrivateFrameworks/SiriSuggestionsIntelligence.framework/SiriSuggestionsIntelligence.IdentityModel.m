@interface SiriSuggestionsIntelligence.IdentityModel
- (_TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligence13IdentityModel)init;
- (_TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligence13IdentityModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation SiriSuggestionsIntelligence.IdentityModel

- (_TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligence13IdentityModel)init
{
  return (_TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligence13IdentityModel *)SiriSuggestionsIntelligence.IdentityModel.init()();
}

- (_TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligence13IdentityModel)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  return (_TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligence13IdentityModel *)SiriSuggestionsIntelligence.IdentityModel.init(modelDescription:parameters:)(a3);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  swift_unknownObjectRetain();
  id v7 = a4;
  v8 = self;
  id v9 = SiriSuggestionsIntelligence.IdentityModel.prediction(from:options:)();

  swift_unknownObjectRelease();

  return v9;
}

@end