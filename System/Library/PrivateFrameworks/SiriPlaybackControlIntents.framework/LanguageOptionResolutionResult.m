@interface LanguageOptionResolutionResult
+ (id)confirmationRequiredWithLanguageOptionToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithLanguageOptionsToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedLanguageOption:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (LanguageOptionResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation LanguageOptionResolutionResult

+ (id)successWithResolvedLanguageOption:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_232A603D0((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithLanguageOptionsToDisambiguate:(id)a3
{
  type metadata accessor for LanguageOption();
  unint64_t v3 = sub_232A68658();
  swift_getObjCClassMetadata();
  id v4 = sub_232A60434(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithLanguageOptionToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_232A6052C((uint64_t)a3);

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

- (LanguageOptionResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (LanguageOptionResolutionResult *)LanguageOptionResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end