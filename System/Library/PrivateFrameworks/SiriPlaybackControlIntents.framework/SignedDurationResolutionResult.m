@interface SignedDurationResolutionResult
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)confirmationRequiredWithSignedDurationToConfirm:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)disambiguationWithSignedDurationsToDisambiguate:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
+ (id)successWithResolvedSignedDuration:(id)a3;
- (SignedDurationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation SignedDurationResolutionResult

+ (id)successWithResolvedSignedDuration:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_232A5F0E0((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithSignedDurationsToDisambiguate:(id)a3
{
  type metadata accessor for SignedDuration();
  unint64_t v3 = sub_232A68658();
  swift_getObjCClassMetadata();
  id v4 = sub_232A5F194(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithSignedDurationToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_232A5F2F8((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
}

- (SignedDurationResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (SignedDurationResolutionResult *)SignedDurationResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end