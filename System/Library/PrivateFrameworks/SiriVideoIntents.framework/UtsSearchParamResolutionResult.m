@interface UtsSearchParamResolutionResult
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)confirmationRequiredWithUtsSearchParamToConfirm:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)disambiguationWithUtsSearchParamsToDisambiguate:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
+ (id)successWithResolvedUtsSearchParam:(id)a3;
- (UtsSearchParamResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation UtsSearchParamResolutionResult

+ (id)successWithResolvedUtsSearchParam:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static UtsSearchParamResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithUtsSearchParamsToDisambiguate:(id)a3
{
  type metadata accessor for UtsSearchParam();
  unint64_t v3 = sub_22BD4AFB0();
  swift_getObjCClassMetadata();
  id v4 = static UtsSearchParamResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithUtsSearchParamToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static UtsSearchParamResolutionResult.confirmationRequired(with:)((uint64_t)a3);

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

- (UtsSearchParamResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_22BD4ACF0();
  return (UtsSearchParamResolutionResult *)UtsSearchParamResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end