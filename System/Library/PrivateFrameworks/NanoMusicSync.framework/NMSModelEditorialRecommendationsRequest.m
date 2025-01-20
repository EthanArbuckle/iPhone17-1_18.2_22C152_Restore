@interface NMSModelEditorialRecommendationsRequest
- (BOOL)nms_useCachedDataOnly;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
- (id)nms_cachedLoadedOutput;
- (void)setNms_cachedLoadedOutput:(id)a3;
- (void)setNms_useCachedDataOnly:(BOOL)a3;
@end

@implementation NMSModelEditorialRecommendationsRequest

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = a3;
  v5 = [NMSModelEditorialRecommendationsRequestOperation alloc];
  v6 = (void *)[(NMSModelEditorialRecommendationsRequest *)self copy];
  v7 = [(MPStoreModelRequestOperation *)v5 initWithRequest:v6 responseHandler:v4];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NMSModelEditorialRecommendationsRequest;
  id v4 = [(MPModelStoreBrowseRequest *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    *((unsigned char *)v4 + 184) = self->_nms_useCachedDataOnly;
    objc_storeStrong(v4 + 24, self->_nms_cachedLoadedOutput);
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

- (id)nms_cachedLoadedOutput
{
  return self->_nms_cachedLoadedOutput;
}

- (void)setNms_cachedLoadedOutput:(id)a3
{
}

- (void).cxx_destruct
{
}

@end