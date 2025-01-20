@interface PUVideoEditReviewAsset
- (PUVideoEditReviewAsset)initWithReviewAsset:(id)a3 trimmedVideoPath:(id)a4;
- (id)pathForTrimmedVideoFile;
@end

@implementation PUVideoEditReviewAsset

- (void).cxx_destruct
{
}

- (id)pathForTrimmedVideoFile
{
  return self->_trimmedVideoPath;
}

- (PUVideoEditReviewAsset)initWithReviewAsset:(id)a3 trimmedVideoPath:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PUVideoEditReviewAsset;
  v8 = [(PUReviewAsset *)&v11 initWithReviewAsset:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_trimmedVideoPath, a4);
  }

  return v9;
}

@end