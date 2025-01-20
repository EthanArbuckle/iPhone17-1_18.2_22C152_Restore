@interface ImageTypeResolutionResult
+ (id)confirmationRequiredWithImageTypeToConfirm:(int64_t)a3;
+ (id)successWithResolvedImageType:(int64_t)a3;
- (ImageTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation ImageTypeResolutionResult

+ (id)successWithResolvedImageType:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static ImageTypeResolutionResult.success(with:)(a3);
  return v4;
}

+ (id)confirmationRequiredWithImageTypeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static ImageTypeResolutionResult.confirmationRequired(with:)(a3);
  return v4;
}

- (ImageTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_22BD4ACF0();
  return (ImageTypeResolutionResult *)ImageTypeResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end