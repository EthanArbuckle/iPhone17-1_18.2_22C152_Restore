@interface CaseTypeResolutionResult
+ (id)confirmationRequiredWithCaseTypeToConfirm:(int64_t)a3;
+ (id)successWithResolvedCaseType:(int64_t)a3;
- (CaseTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation CaseTypeResolutionResult

+ (id)successWithResolvedCaseType:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static CaseTypeResolutionResult.success(with:)(a3);
  return v4;
}

+ (id)confirmationRequiredWithCaseTypeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static CaseTypeResolutionResult.confirmationRequired(with:)(a3);
  return v4;
}

- (CaseTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_25C8EC110();
  return (CaseTypeResolutionResult *)CaseTypeResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end