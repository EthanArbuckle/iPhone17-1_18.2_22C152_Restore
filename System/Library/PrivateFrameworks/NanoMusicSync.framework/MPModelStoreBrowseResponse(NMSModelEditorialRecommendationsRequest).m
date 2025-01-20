@interface MPModelStoreBrowseResponse(NMSModelEditorialRecommendationsRequest)
- (id)nms_cachedLoadedOutput;
- (void)nms_setCachedLoadedOutput:()NMSModelEditorialRecommendationsRequest;
@end

@implementation MPModelStoreBrowseResponse(NMSModelEditorialRecommendationsRequest)

- (id)nms_cachedLoadedOutput
{
  return objc_getAssociatedObject(a1, sel_nms_cachedLoadedOutput);
}

- (void)nms_setCachedLoadedOutput:()NMSModelEditorialRecommendationsRequest
{
}

@end