@interface LanguageTypeResolutionResult
+ (id)confirmationRequiredWithLanguageTypeToConfirm:(int64_t)a3;
+ (id)successWithResolvedLanguageType:(int64_t)a3;
- (LanguageTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation LanguageTypeResolutionResult

+ (id)successWithResolvedLanguageType:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A03C(a3);
  return v4;
}

+ (id)confirmationRequiredWithLanguageTypeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_232A5A088(a3);
  return v4;
}

- (LanguageTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_232A684F8();
  return (LanguageTypeResolutionResult *)LanguageTypeResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end