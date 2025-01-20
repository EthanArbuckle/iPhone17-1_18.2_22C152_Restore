@interface TranslationResultItemResolutionResult
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)confirmationRequiredWithTranslationResultItemToConfirm:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)disambiguationWithTranslationResultItemsToDisambiguate:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
+ (id)successWithResolvedTranslationResultItem:(id)a3;
- (TranslationResultItemResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation TranslationResultItemResolutionResult

+ (id)successWithResolvedTranslationResultItem:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static TranslationResultItemResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithTranslationResultItemsToDisambiguate:(id)a3
{
  type metadata accessor for TranslationResultItem();
  unint64_t v3 = sub_236FB2A30();
  swift_getObjCClassMetadata();
  id v4 = static TranslationResultItemResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithTranslationResultItemToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static TranslationResultItemResolutionResult.confirmationRequired(with:)((uint64_t)a3);

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

- (TranslationResultItemResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_236FB28E0();
  return (TranslationResultItemResolutionResult *)TranslationResultItemResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end