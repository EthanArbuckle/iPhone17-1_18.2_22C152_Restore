@interface MPModelForYouRecommendationsResponse(NMSModelForYouRecommendationsRequest)
- (id)nms_cachedRecommendationsArray;
- (id)nms_cachedStoreItemMetadataResults;
- (void)nms_setCachedRecommendationsArray:()NMSModelForYouRecommendationsRequest;
- (void)nms_setCachedStoreItemMetadataResults:()NMSModelForYouRecommendationsRequest;
@end

@implementation MPModelForYouRecommendationsResponse(NMSModelForYouRecommendationsRequest)

- (id)nms_cachedRecommendationsArray
{
  return objc_getAssociatedObject(a1, sel_nms_cachedRecommendationsArray);
}

- (void)nms_setCachedRecommendationsArray:()NMSModelForYouRecommendationsRequest
{
}

- (id)nms_cachedStoreItemMetadataResults
{
  return objc_getAssociatedObject(a1, sel_nms_cachedStoreItemMetadataResults);
}

- (void)nms_setCachedStoreItemMetadataResults:()NMSModelForYouRecommendationsRequest
{
}

@end