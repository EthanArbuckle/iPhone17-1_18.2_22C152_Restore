@interface NaiveBayesClassifier
- (NaiveBayesClassifier)init;
- (NaiveBayesClassifier)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation NaiveBayesClassifier

- (NaiveBayesClassifier)initWithModelDescription:(id)a3 parameterDictionary:(id)a4 error:(id *)a5
{
  uint64_t v6 = sub_25DC161F0();
  return (NaiveBayesClassifier *)SiriSuggestionsIntelligence.NaiveBayesClassifier.init(modelDescription:parameters:)(a3, v6);
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  swift_unknownObjectRetain();
  id v7 = a4;
  v8 = self;
  v9 = (void *)SiriSuggestionsIntelligence.NaiveBayesClassifier.prediction(from:options:)();

  swift_unknownObjectRelease();

  return v9;
}

- (NaiveBayesClassifier)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end