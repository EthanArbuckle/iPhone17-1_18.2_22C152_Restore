@interface ContentSortResolutionResult
+ (id)confirmationRequiredWithContentSortToConfirm:(int64_t)a3;
+ (id)successWithResolvedContentSort:(int64_t)a3;
- (ContentSortResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation ContentSortResolutionResult

+ (id)successWithResolvedContentSort:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static ContentSortResolutionResult.success(with:)(a3);
  return v4;
}

+ (id)confirmationRequiredWithContentSortToConfirm:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = static ContentSortResolutionResult.confirmationRequired(with:)(a3);
  return v4;
}

- (ContentSortResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  uint64_t v5 = sub_22BD4ACF0();
  return (ContentSortResolutionResult *)ContentSortResolutionResult.init(JSONDictionary:intent:)(v5, a4);
}

@end