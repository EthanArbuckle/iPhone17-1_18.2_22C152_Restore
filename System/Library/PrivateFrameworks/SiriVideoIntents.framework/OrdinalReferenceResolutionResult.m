@interface OrdinalReferenceResolutionResult
+ (id)confirmationRequiredWithOrdinalReferenceToConfirm:(int64_t)a3;
+ (id)successWithResolvedOrdinalReference:(int64_t)a3;
- (OrdinalReferenceResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation OrdinalReferenceResolutionResult

+ (id)successWithResolvedOrdinalReference:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static OrdinalReferenceResolutionResult.success(with:)(a3);
  return v4;
}

+ (id)confirmationRequiredWithOrdinalReferenceToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static OrdinalReferenceResolutionResult.confirmationRequired(with:)(a3);
  return v4;
}

- (OrdinalReferenceResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_22BD4ACF0();
  return (OrdinalReferenceResolutionResult *)OrdinalReferenceResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end