@interface PXStoryDefaultDetailedSaliencyProducerFactory
- (id)detailedSaliencyProducerForConfiguration:(id)a3;
@end

@implementation PXStoryDefaultDetailedSaliencyProducerFactory

- (id)detailedSaliencyProducerForConfiguration:(id)a3
{
  id v3 = a3;
  if (([v3 options] & 2) != 0) {
    goto LABEL_4;
  }
  v4 = +[PXStoryMultipartPanoramaSettings sharedInstance];
  int v5 = [v4 isFeatureEnabled];

  if (!v5
    || ([v3 mediaProvider],
        v6 = objc_claimAutoreleasedReturnValue(),
        v7 = [[PXStoryVisionDetailedSaliencyProducer alloc] initWithMediaProvider:v6], v6, !v7))
  {
LABEL_4:
    v7 = objc_alloc_init(PXStoryPassthroughDetailedSaliencyProducer);
  }

  return v7;
}

@end