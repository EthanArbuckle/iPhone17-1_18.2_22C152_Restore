@interface PXPhotoKitPeopleSuggestionsMediaProvider
- (int)requestImageForPersonSuggestion:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 cropFactor:(int64_t)a6 cornerStyle:(int64_t)a7 resultHandler:(id)a8;
- (void)cancelRequest:(int)a3;
@end

@implementation PXPhotoKitPeopleSuggestionsMediaProvider

- (void)cancelRequest:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = +[PXPeopleFaceCropManager sharedManager];
  [v4 cancelRequestForRequestID:v3];
}

- (int)requestImageForPersonSuggestion:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 cropFactor:(int64_t)a6 cornerStyle:(int64_t)a7 resultHandler:(id)a8
{
  double height = a4.height;
  double width = a4.width;
  id v16 = a3;
  id v17 = a8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2 object:self file:@"PXPhotoKitPeopleSuggestionsMediaProvider.m" lineNumber:21 description:@"This media provider only works with PXPhotoKitPersonSuggestion."];
  }
  id v18 = v16;
  v19 = [PXPeopleFaceCropFetchOptions alloc];
  v20 = [v18 person];
  v21 = [v18 keyFaceFetchResult];
  v22 = [v21 firstObject];
  v23 = -[PXPeopleFaceCropFetchOptions initWithPerson:face:targetSize:displayScale:](v19, "initWithPerson:face:targetSize:displayScale:", v20, v22, width, height, a5);

  v24 = [v18 keyAssetFetchResult];

  v25 = [v24 firstObject];
  [(PXPeopleFaceCropFetchOptions *)v23 setAsset:v25];

  [(PXPeopleFaceCropFetchOptions *)v23 setCropFactor:a6];
  [(PXPeopleFaceCropFetchOptions *)v23 setCornerStyle:a7];
  [(PXPeopleFaceCropFetchOptions *)v23 setDeliveryMode:1];
  v26 = +[PXPeopleFaceCropManager sharedManager];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __137__PXPhotoKitPeopleSuggestionsMediaProvider_requestImageForPersonSuggestion_targetSize_displayScale_cropFactor_cornerStyle_resultHandler___block_invoke;
  v31[3] = &unk_1E5DD24E8;
  id v32 = v17;
  id v27 = v17;
  int v28 = [v26 requestFaceCropForOptions:v23 resultHandler:v31];

  return v28;
}

uint64_t __137__PXPhotoKitPeopleSuggestionsMediaProvider_requestImageForPersonSuggestion_targetSize_displayScale_cropFactor_cornerStyle_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end