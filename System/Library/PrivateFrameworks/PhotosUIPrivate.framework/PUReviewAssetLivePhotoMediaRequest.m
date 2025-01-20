@interface PUReviewAssetLivePhotoMediaRequest
- (id)initLivePhotoRequestID:(int)a3;
- (int)_liveRequestID;
- (void)cancelRequest;
@end

@implementation PUReviewAssetLivePhotoMediaRequest

- (int)_liveRequestID
{
  return self->__liveRequestID;
}

- (void)cancelRequest
{
  uint64_t v2 = [(PUReviewAssetLivePhotoMediaRequest *)self _liveRequestID];
  v3 = (void *)MEMORY[0x1E4F39138];
  [v3 cancelLivePhotoRequestWithRequestID:v2];
}

- (id)initLivePhotoRequestID:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUReviewAssetLivePhotoMediaRequest;
  id result = [(PUReviewAssetLivePhotoMediaRequest *)&v5 init];
  if (result) {
    *((_DWORD *)result + 2) = a3;
  }
  return result;
}

@end