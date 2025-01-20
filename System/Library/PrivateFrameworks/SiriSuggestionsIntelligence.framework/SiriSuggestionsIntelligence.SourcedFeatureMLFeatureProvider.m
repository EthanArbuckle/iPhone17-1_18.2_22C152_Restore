@interface SiriSuggestionsIntelligence.SourcedFeatureMLFeatureProvider
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation SiriSuggestionsIntelligence.SourcedFeatureMLFeatureProvider

- (NSSet)featureNames
{
  swift_retain();
  SiriSuggestionsIntelligence.SourcedFeatureMLFeatureProvider.featureNames.getter();
  swift_release();
  v2 = (void *)sub_25DC165E0();
  swift_bridgeObjectRelease();

  return (NSSet *)v2;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v3 = sub_25DC162C0();
  v5 = v4;
  swift_retain();
  v6._countAndFlagsBits = v3;
  v6._object = v5;
  v7 = (void *)SiriSuggestionsIntelligence.SourcedFeatureMLFeatureProvider.featureValue(for:)(v6);
  swift_release();
  swift_bridgeObjectRelease();

  return v7;
}

@end