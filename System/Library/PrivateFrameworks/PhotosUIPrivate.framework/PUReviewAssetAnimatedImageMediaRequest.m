@interface PUReviewAssetAnimatedImageMediaRequest
- (PUReviewAssetAnimatedImageMediaRequest)initWithAnimatedImageRequestID:(int64_t)a3;
- (int64_t)_animatedRequestID;
- (void)cancelRequest;
@end

@implementation PUReviewAssetAnimatedImageMediaRequest

- (int64_t)_animatedRequestID
{
  return self->__animatedRequestID;
}

- (void)cancelRequest
{
  int64_t v2 = [(PUReviewAssetAnimatedImageMediaRequest *)self _animatedRequestID];
  v3 = (void *)MEMORY[0x1E4F38EA8];
  [v3 cancelAnimatedImageRequest:v2];
}

- (PUReviewAssetAnimatedImageMediaRequest)initWithAnimatedImageRequestID:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUReviewAssetAnimatedImageMediaRequest;
  result = [(PUReviewAssetAnimatedImageMediaRequest *)&v5 init];
  if (result) {
    result->__animatedRequestID = a3;
  }
  return result;
}

@end