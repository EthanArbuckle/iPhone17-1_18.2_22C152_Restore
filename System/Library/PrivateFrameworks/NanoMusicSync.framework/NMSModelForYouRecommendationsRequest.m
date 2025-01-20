@interface NMSModelForYouRecommendationsRequest
- (BOOL)nms_useCachedDataOnly;
- (NSArray)nms_cachedRecommendationsArray;
- (NSDictionary)nms_cachedStoreItemMetadataResults;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
- (void)setNms_cachedRecommendationsArray:(id)a3;
- (void)setNms_cachedStoreItemMetadataResults:(id)a3;
- (void)setNms_useCachedDataOnly:(BOOL)a3;
@end

@implementation NMSModelForYouRecommendationsRequest

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = a3;
  v5 = [NMSModelForYouRecommendationsRequestOperation alloc];
  v6 = (void *)[(NMSModelForYouRecommendationsRequest *)self copy];
  v7 = [(MPStoreModelRequestOperation *)v5 initWithRequest:v6 responseHandler:v4];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NMSModelForYouRecommendationsRequest;
  id v4 = [(MPModelForYouRecommendationsRequest *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    *((unsigned char *)v4 + 168) = self->_nms_useCachedDataOnly;
    objc_storeStrong(v4 + 22, self->_nms_cachedRecommendationsArray);
    objc_storeStrong(v5 + 23, self->_nms_cachedStoreItemMetadataResults);
  }
  return v5;
}

- (BOOL)nms_useCachedDataOnly
{
  return self->_nms_useCachedDataOnly;
}

- (void)setNms_useCachedDataOnly:(BOOL)a3
{
  self->_nms_useCachedDataOnly = a3;
}

- (NSArray)nms_cachedRecommendationsArray
{
  return self->_nms_cachedRecommendationsArray;
}

- (void)setNms_cachedRecommendationsArray:(id)a3
{
}

- (NSDictionary)nms_cachedStoreItemMetadataResults
{
  return self->_nms_cachedStoreItemMetadataResults;
}

- (void)setNms_cachedStoreItemMetadataResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nms_cachedStoreItemMetadataResults, 0);

  objc_storeStrong((id *)&self->_nms_cachedRecommendationsArray, 0);
}

@end