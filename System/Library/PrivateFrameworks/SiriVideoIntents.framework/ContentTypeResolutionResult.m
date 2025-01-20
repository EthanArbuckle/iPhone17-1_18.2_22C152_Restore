@interface ContentTypeResolutionResult
+ (id)confirmationRequiredWithContentTypeToConfirm:(int64_t)a3;
+ (id)successWithResolvedContentType:(int64_t)a3;
- (ContentTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation ContentTypeResolutionResult

+ (id)successWithResolvedContentType:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static ContentTypeResolutionResult.success(with:)(a3);
  return v4;
}

+ (id)confirmationRequiredWithContentTypeToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static ContentTypeResolutionResult.confirmationRequired(with:)(a3);
  return v4;
}

- (ContentTypeResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_22BD4ACF0();
  return (ContentTypeResolutionResult *)ContentTypeResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end