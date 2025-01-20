@interface ContentImageResolutionResult
+ (id)confirmationRequiredWithContentImageToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithContentImagesToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedContentImage:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (ContentImageResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation ContentImageResolutionResult

+ (id)successWithResolvedContentImage:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static ContentImageResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithContentImagesToDisambiguate:(id)a3
{
  type metadata accessor for ContentImage();
  unint64_t v3 = sub_22BD4AFB0();
  swift_getObjCClassMetadata();
  id v4 = static ContentImageResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithContentImageToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static ContentImageResolutionResult.confirmationRequired(with:)((uint64_t)a3);

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

- (ContentImageResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_22BD4ACF0();
  return (ContentImageResolutionResult *)ContentImageResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end