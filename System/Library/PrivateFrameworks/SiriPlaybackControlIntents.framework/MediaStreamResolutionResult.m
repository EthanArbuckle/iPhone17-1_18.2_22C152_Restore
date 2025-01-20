@interface MediaStreamResolutionResult
+ (id)confirmationRequiredWithMediaStreamToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithMediaStreamsToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedMediaStream:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (MediaStreamResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation MediaStreamResolutionResult

+ (id)successWithResolvedMediaStream:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_232A631B8((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithMediaStreamsToDisambiguate:(id)a3
{
  type metadata accessor for MediaStream();
  unint64_t v3 = sub_232A68658();
  swift_getObjCClassMetadata();
  id v4 = sub_232A6321C(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithMediaStreamToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_232A63314((uint64_t)a3);

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

- (MediaStreamResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (MediaStreamResolutionResult *)MediaStreamResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end