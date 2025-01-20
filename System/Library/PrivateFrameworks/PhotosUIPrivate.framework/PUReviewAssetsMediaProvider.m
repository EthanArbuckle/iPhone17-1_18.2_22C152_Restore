@interface PUReviewAssetsMediaProvider
- (PHConcurrentMapTable)_mediaRequests;
- (PUReviewAssetsMediaProvider)init;
- (double)_screenScale;
- (id)_resizeImageAtURL:(id)a3 imageUTI:(id)a4 targetSize:(CGSize)a5 bakeInOrientation:(BOOL)a6 error:(id *)a7;
- (int)_incrementRequestIdentifier;
- (int)_requestAdjustmentDataForAsset:(id)a3 resultHandler:(id)a4;
- (int)requestAVAssetForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestAsynchronousVideoURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (void)cancelImageRequest:(int)a3;
@end

@implementation PUReviewAssetsMediaProvider

- (void).cxx_destruct
{
}

- (PHConcurrentMapTable)_mediaRequests
{
  return self->__mediaRequests;
}

- (double)_screenScale
{
  return self->__screenScale;
}

- (void)cancelImageRequest:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v7 = [(PUReviewAssetsMediaProvider *)self _mediaRequests];
  v4 = [NSNumber numberWithInt:v3];
  v5 = [v7 objectForKey:v4];

  if (v5)
  {
    [v5 cancelRequest];
    v6 = [NSNumber numberWithInt:v3];
    [v7 removeObjectForKey:v6];
  }
}

- (int)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"PUReviewAssetsMediaProvider.m" lineNumber:666 description:@"PUReviewAssetsMediaProvider only accepts PUReviewAssets"];
  }
  uint64_t v12 = [(PUReviewAssetsMediaProvider *)self _incrementRequestIdentifier];
  uint64_t v32 = *MEMORY[0x1E4F39718];
  v13 = [NSNumber numberWithInt:v12];
  v33[0] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];

  id v15 = v9;
  v16 = objc_msgSend(v15, "providedImageURLForImageVersion:", objc_msgSend(v10, "version"));
  v17 = [(PUReviewAssetsMediaProvider *)self _mediaRequests];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = v10;
  }
  else
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F38EB0]);
    [v18 setAllowPreCaching:0];
  }
  [v18 setUseSharedImageDecoding:0];
  v19 = (void *)MEMORY[0x1E4F38EA8];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __82__PUReviewAssetsMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke;
  v27[3] = &unk_1E5F2B4C0;
  int v31 = v12;
  id v29 = v14;
  id v30 = v11;
  id v28 = v17;
  id v20 = v14;
  id v21 = v11;
  id v22 = v17;
  v23 = -[PUReviewAssetAnimatedImageMediaRequest initWithAnimatedImageRequestID:]([PUReviewAssetAnimatedImageMediaRequest alloc], "initWithAnimatedImageRequestID:", [v19 requestAnimatedImageWithURL:v16 completion:v27]);
  v24 = [NSNumber numberWithInt:v12];
  [v22 setObject:v23 forKey:v24];

  return v12;
}

void __82__PUReviewAssetsMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void **)(a1 + 32);
  v4 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  [v3 removeObjectForKey:v4];

  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, id, void))(v5 + 16))(v5, v6, *(void *)(a1 + 40));
  }
}

- (int)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v14 = a3;
  id v15 = a7;
  id v16 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2 object:self file:@"PUReviewAssetsMediaProvider.m" lineNumber:618 description:@"PUReviewAssetsMediaProvider only accepts PUReviewAssets"];
  }
  uint64_t v17 = [(PUReviewAssetsMediaProvider *)self _incrementRequestIdentifier];
  id v18 = v14;
  v19 = [v18 providedPreviewImage];
  id v20 = objc_msgSend(v18, "providedImageURLForImageVersion:", objc_msgSend(v16, "version"));
  uint64_t v21 = [v16 version];

  id v22 = [v18 providedVideoURLForImageVersion:v21];
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v24 = v23;
  if (v20) {
    [v23 addObject:v20];
  }
  if (v22) {
    [v24 addObject:v22];
  }
  v25 = [(PUReviewAssetsMediaProvider *)self _mediaRequests];
  v26 = (void *)MEMORY[0x1E4F39138];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  void v33[2] = __101__PUReviewAssetsMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  v33[3] = &unk_1E5F2B498;
  int v36 = v17;
  id v34 = v25;
  id v35 = v15;
  id v27 = v15;
  id v28 = v25;
  id v29 = -[PUReviewAssetLivePhotoMediaRequest initLivePhotoRequestID:]([PUReviewAssetLivePhotoMediaRequest alloc], "initLivePhotoRequestID:", objc_msgSend(v26, "requestLivePhotoWithResourceFileURLs:placeholderImage:targetSize:contentMode:resultHandler:", v24, v19, a5, v33, width, height));
  id v30 = [NSNumber numberWithInt:v17];
  [v28 setObject:v29 forKey:v30];

  return v17;
}

void __101__PUReviewAssetsMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v20 = *MEMORY[0x1E4F39718];
  id v6 = NSNumber;
  uint64_t v7 = *(unsigned int *)(a1 + 48);
  id v8 = a3;
  id v9 = [v6 numberWithInt:v7];
  v21[0] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  id v11 = (void *)[v10 mutableCopy];

  uint64_t v12 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F39750]];
  uint64_t v13 = *MEMORY[0x1E4F39698];
  [v11 setValue:v12 forKey:*MEMORY[0x1E4F39698]];

  id v14 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F39758]];

  uint64_t v15 = *MEMORY[0x1E4F396F8];
  [v11 setValue:v14 forKey:*MEMORY[0x1E4F396F8]];

  id v16 = [v11 objectForKeyedSubscript:v13];
  if (v16)
  {
  }
  else
  {
    id v18 = [v11 objectForKeyedSubscript:v13];
    if (v18) {
      goto LABEL_5;
    }
    v19 = [v11 objectForKeyedSubscript:v15];

    if (v19) {
      goto LABEL_6;
    }
  }
  uint64_t v17 = *(void **)(a1 + 32);
  id v18 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  [v17 removeObjectForKey:v18];
LABEL_5:

LABEL_6:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (int)requestAsynchronousVideoURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = (void (**)(id, void *, void *))a5;
  id v11 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"PUReviewAssetsMediaProvider.m" lineNumber:599 description:@"PUReviewAssetsMediaProvider only accepts PUReviewAssets"];
  }
  uint64_t v12 = [(PUReviewAssetsMediaProvider *)self _incrementRequestIdentifier];
  uint64_t v20 = *MEMORY[0x1E4F39718];
  uint64_t v13 = [NSNumber numberWithInt:v12];
  v21[0] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];

  id v15 = v9;
  uint64_t v16 = [v11 version];

  uint64_t v17 = [v15 providedVideoURLForVideoVersion:v16];
  if (v10) {
    v10[2](v10, v17, v14);
  }

  return v12;
}

- (int)requestAVAssetForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2 object:self file:@"PUReviewAssetsMediaProvider.m" lineNumber:561 description:@"PUReviewAssetsMediaProvider only accepts PUReviewAssets"];
  }
  uint64_t v12 = [(PUReviewAssetsMediaProvider *)self _incrementRequestIdentifier];
  uint64_t v34 = *MEMORY[0x1E4F39718];
  uint64_t v13 = [NSNumber numberWithInt:v12];
  v35[0] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];

  id v15 = v9;
  uint64_t v16 = [v11 version];

  uint64_t v17 = [v15 providedVideoURLForVideoVersion:v16];
  id v18 = [MEMORY[0x1E4F166C8] assetWithURL:v17];
  v19 = (void *)MEMORY[0x1E4F8CE18];
  uint64_t v20 = [v15 assetAdjustments];

  uint64_t v21 = [v19 videoAdjustmentsFromAssetAdjustmentsIfRecognized:v20];

  id v22 = (void *)[objc_alloc(MEMORY[0x1E4F8CE00]) initWithVideoAsset:v18 videoAdjustments:v21];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __76__PUReviewAssetsMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke;
  v30[3] = &unk_1E5F2EBC8;
  id v31 = v22;
  id v32 = v14;
  id v33 = v10;
  id v23 = v10;
  id v24 = v14;
  id v25 = v22;
  dispatch_block_t v26 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v30);
  id v27 = dispatch_get_global_queue(21, 0);
  dispatch_async(v27, v26);

  return v12;
}

void __76__PUReviewAssetsMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __76__PUReviewAssetsMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke_2;
  v3[3] = &unk_1E5F2B470;
  v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 requestAVAssetWithResultHandler:v3];
}

void __76__PUReviewAssetsMediaProvider_requestAVAssetForVideo_options_resultHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = a5;
    id v8 = (void *)[v6 mutableCopy];
    uint64_t v10 = *MEMORY[0x1E4F39698];
    v11[0] = v7;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v8 addEntriesFromDictionary:v9];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, a3, *(void *)(a1 + 32));
    id v8 = 0;
  }
}

- (int)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2 object:self file:@"PUReviewAssetsMediaProvider.m" lineNumber:519 description:@"PUReviewAssetsMediaProvider only accepts PUReviewAssets"];
  }
  uint64_t v12 = [(PUReviewAssetsMediaProvider *)self _incrementRequestIdentifier];
  uint64_t v34 = *MEMORY[0x1E4F39718];
  uint64_t v13 = [NSNumber numberWithInt:v12];
  v35[0] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];

  id v15 = v9;
  uint64_t v16 = [v11 version];

  uint64_t v17 = [v15 providedVideoURLForVideoVersion:v16];
  id v18 = [MEMORY[0x1E4F166C8] assetWithURL:v17];
  v19 = (void *)MEMORY[0x1E4F8CE18];
  uint64_t v20 = [v15 assetAdjustments];

  uint64_t v21 = [v19 videoAdjustmentsFromAssetAdjustmentsIfRecognized:v20];

  id v22 = (void *)[objc_alloc(MEMORY[0x1E4F8CE00]) initWithVideoAsset:v18 videoAdjustments:v21];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __79__PUReviewAssetsMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke;
  v30[3] = &unk_1E5F2EBC8;
  id v31 = v22;
  id v32 = v14;
  id v33 = v10;
  id v23 = v10;
  id v24 = v14;
  id v25 = v22;
  dispatch_block_t v26 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v30);
  id v27 = dispatch_get_global_queue(21, 0);
  dispatch_async(v27, v26);

  return v12;
}

void __79__PUReviewAssetsMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__PUReviewAssetsMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_2;
  v3[3] = &unk_1E5F2B470;
  v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 requestAVAssetWithResultHandler:v3];
}

void __79__PUReviewAssetsMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a5)
  {
    id v9 = *(void **)(a1 + 32);
    id v10 = a5;
    id v11 = (void *)[v9 mutableCopy];
    uint64_t v13 = *MEMORY[0x1E4F39698];
    v14[0] = v10;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    [v11 addEntriesFromDictionary:v12];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v11 = [MEMORY[0x1E4F16620] playerItemWithAsset:a2];
    [v11 setAudioMix:v8];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (int)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"PUReviewAssetsMediaProvider.m" lineNumber:472 description:@"PUReviewAssetsMediaProvider only accepts PUReviewAssets"];
  }
  int v12 = [(PUReviewAssetsMediaProvider *)self _incrementRequestIdentifier];
  BOOL v13 = ([v10 isSynchronous] & 1) != 0 || objc_msgSend(v10, "deliveryMode") == 0;
  id v14 = v9;
  uint64_t v15 = [v10 version];
  uint64_t v16 = [v14 providedImageURLForImageVersion:v15];
  int v17 = [v14 exifOrientationForImageVersion:v15];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PUReviewAssetsMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke;
  block[3] = &unk_1E5F2B448;
  int v28 = v12;
  int v29 = v17;
  id v26 = v16;
  id v27 = v11;
  id v18 = v11;
  id v19 = v16;
  dispatch_block_t v20 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  uint64_t v21 = v20;
  if (v13)
  {
    (*((void (**)(dispatch_block_t))v20 + 2))(v20);
  }
  else
  {
    id v22 = dispatch_get_global_queue(21, 0);
    dispatch_async(v22, v21);
  }
  return v12;
}

void __77__PUReviewAssetsMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  id v11 = (id)objc_msgSend(v2, "initWithObjectsAndKeys:", v3, *MEMORY[0x1E4F39718], 0);

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    [v11 setObject:v4 forKey:*MEMORY[0x1E4F396C8]];
    id v5 = (void *)MEMORY[0x1E4F442D8];
    id v6 = [*(id *)(a1 + 32) pathExtension];
    id v7 = [v5 typeWithFilenameExtension:v6 conformingToType:*MEMORY[0x1E4F44400]];

    if (v7)
    {
      id v8 = [v7 identifier];
      [v11 setObject:v8 forKey:*MEMORY[0x1E4F396D0]];
    }
    id v9 = [NSNumber numberWithInteger:PLImageOrientationFromExifOrientation()];
    [v11 setObject:v9 forKey:*MEMORY[0x1E4F396B8]];
  }
  id v10 = (void *)[v11 copy];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (int)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"PUReviewAssetsMediaProvider.m" lineNumber:415 description:@"PUReviewAssetsMediaProvider only accepts PUReviewAssets"];
  }
  int v12 = [(PUReviewAssetsMediaProvider *)self _incrementRequestIdentifier];
  BOOL v13 = ([v10 isSynchronous] & 1) != 0 || objc_msgSend(v10, "deliveryMode") == 0;
  id v14 = v9;
  uint64_t v15 = [v10 version];
  uint64_t v16 = [v14 providedImageURLForImageVersion:v15];
  LODWORD(v15) = [v14 exifOrientationForImageVersion:v15];
  uint64_t v17 = [v10 loadingMode];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __78__PUReviewAssetsMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke;
  v25[3] = &unk_1E5F2B420;
  id v27 = v11;
  uint64_t v28 = v17;
  int v29 = v12;
  int v30 = v15;
  id v26 = v16;
  id v18 = v11;
  id v19 = v16;
  dispatch_block_t v20 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v25);
  uint64_t v21 = v20;
  if (v13)
  {
    (*((void (**)(dispatch_block_t))v20 + 2))(v20);
  }
  else
  {
    id v22 = dispatch_get_global_queue(21, 0);
    dispatch_async(v22, v21);
  }
  return v12;
}

void __78__PUReviewAssetsMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  v20[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v18 = 0;
  uint64_t v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v2 options:0 error:&v18];
  id v4 = v18;
  if (v4)
  {
    v19[0] = *MEMORY[0x1E4F39718];
    id v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
    v19[1] = *MEMORY[0x1E4F39698];
    v20[0] = v5;
    v20[1] = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1CA60]);
    id v8 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
    id v5 = objc_msgSend(v7, "initWithObjectsAndKeys:", v8, *MEMORY[0x1E4F39718], 0);

    if (*(void *)(a1 + 48) == 0x10000)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      if (v9) {
        [v5 setObject:v9 forKey:*MEMORY[0x1E4F396C8]];
      }
    }
    uint64_t v6 = [v5 copy];
  }
  id v10 = (void *)v6;

  id v11 = *(void **)(a1 + 32);
  if (v11)
  {
    int v12 = (void *)MEMORY[0x1E4F442D8];
    BOOL v13 = [v11 pathExtension];
    id v14 = [v12 typeWithFilenameExtension:v13 conformingToType:*MEMORY[0x1E4F44400]];
  }
  else
  {
    id v14 = 0;
  }
  uint64_t v15 = PLImageOrientationFromExifOrientation();
  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v17 = [v14 identifier];
  (*(void (**)(uint64_t, void *, void *, uint64_t, void *))(v16 + 16))(v16, v3, v17, v15, v10);
}

- (id)_resizeImageAtURL:(id)a3 imageUTI:(id)a4 targetSize:(CGSize)a5 bakeInOrientation:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  double height = a5.height;
  double width = a5.width;
  v32[1] = *MEMORY[0x1E4F143B8];
  CFURLRef v12 = (const __CFURL *)a3;
  id v13 = a4;
  id v14 = v13;
  if (v13)
  {
    uint64_t v31 = *MEMORY[0x1E4F2FF78];
    v32[0] = v13;
    CFDictionaryRef v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
  }
  else
  {
    CFDictionaryRef v15 = 0;
  }
  CGImageSourceRef v16 = CGImageSourceCreateWithURL(v12, v15);
  if (!v16)
  {
    int v29 = 0;
    if (!a7) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  uint64_t v17 = v16;
  if (width <= height) {
    double v18 = height;
  }
  else {
    double v18 = width;
  }
  uint64_t v19 = (int)v18;
  dispatch_block_t v20 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:10];
  uint64_t v21 = [NSNumber numberWithInt:v19];
  [v20 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F2FF68]];

  uint64_t v22 = *MEMORY[0x1E4F1CFD0];
  uint64_t v23 = *MEMORY[0x1E4F2FE28];
  [v20 setObject:*MEMORY[0x1E4F1CFD0] forKeyedSubscript:*MEMORY[0x1E4F2FE28]];
  id v24 = [NSNumber numberWithBool:v8];
  [v20 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F2FE48]];

  if (v14)
  {
    id v25 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v14];
    int v26 = [v25 isEqual:*MEMORY[0x1E4F44450]];

    if (v26) {
      [v20 setObject:&unk_1F078CB60 forKeyedSubscript:*MEMORY[0x1E4F2FEC0]];
    }
  }
  [v20 setObject:v22 forKeyedSubscript:v23];
  CGImageRef ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v17, 0, (CFDictionaryRef)v20);
  if (ThumbnailAtIndex)
  {
    uint64_t v28 = ThumbnailAtIndex;
    int v29 = [MEMORY[0x1E4FB1818] imageWithCGImage:ThumbnailAtIndex];
    CGImageRelease(v28);
  }
  else
  {
    int v29 = 0;
  }
  CFRelease(v17);

  if (a7)
  {
LABEL_17:
    if (!v29)
    {
      *a7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PUReviewAssetsMediaProviderErrorDomain" code:-100 userInfo:0];
    }
  }
LABEL_19:

  return v29;
}

- (int)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  v93[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    v63 = id v62 = v15;
    [v63 handleFailureInMethod:a2 object:self file:@"PUReviewAssetsMediaProvider.m" lineNumber:173 description:@"PUReviewAssetsMediaProvider only accepts PUReviewAssets"];

    id v15 = v62;
  }
  id v16 = v13;
  uint64_t v17 = [v14 version];
  if (v17 != 16)
  {
    uint64_t v19 = v17;
    v71 = (void (**)(void, void, void))v15;
    uint64_t v18 = [(PUReviewAssetsMediaProvider *)self _incrementRequestIdentifier];
    unint64_t v69 = [v14 deliveryMode];
    int v20 = [v14 isSynchronous];
    v72 = [v16 providedImageURLForImageVersion:v19];
    uint64_t v21 = [v16 providedVideoURLForImageVersion:v19];
    if (([v16 playbackStyle] & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      uint64_t v22 = (void *)v21;
      int v23 = v20 ^ 1;
      if (!v21) {
        int v23 = 0;
      }
      int v70 = v23;
    }
    else
    {
      uint64_t v22 = (void *)v21;
      int v70 = 0;
    }
    id v24 = [v16 providedPreviewImage];
    [v24 scale];
    double v26 = v25;
    [v24 size];
    BOOL v29 = height <= v26 * v28 && width <= v26 * v27;
    if (v24)
    {
      int v30 = [v16 assetAdjustments];
      if (v19) {
        BOOL v31 = 1;
      }
      else {
        BOOL v31 = v30 == 0;
      }
      int v32 = v31;
    }
    else
    {
      int v32 = 0;
    }
    int v33 = v70;
    if (v72) {
      int v33 = 1;
    }
    if ((v29 & v32 & 1) != 0 || !v33)
    {
      id v15 = v71;
      ((void (**)(void, void *, void))v71)[2](v71, v24, 0);
      v40 = v22;
LABEL_53:

      goto LABEL_54;
    }
    int v68 = v32;
    uint64_t v92 = *MEMORY[0x1E4F39718];
    uint64_t v34 = [NSNumber numberWithInt:v18];
    v93[0] = v34;
    id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:&v92 count:1];

    int v36 = (void *)MEMORY[0x1E4F8CDF8];
    v37 = [v72 pathExtension];
    v38 = [v36 typeWithFilenameExtension:v37 conformingToType:*MEMORY[0x1E4F44400]];

    if (([v38 conformsToType:*MEMORY[0x1E4F44410]] & 1) != 0
      || [v38 conformsToType:*MEMORY[0x1E4F443E0]])
    {
      v39 = -[PUCAMReviewAssetsFigDecodeItem initWithImageURL:targetSize:]([PUCAMReviewAssetsFigDecodeItem alloc], "initWithImageURL:targetSize:", v72, width, height);
    }
    else
    {
      v39 = 0;
    }
    v40 = v22;
    if (v20)
    {
      unint64_t v41 = v69;
      if (v69 == 2) {
        char v42 = v68;
      }
      else {
        char v42 = 0;
      }
      v43 = v35;
      if ((v42 & 1) == 0)
      {
        v65 = v35;
        v67 = v39;
        if (v39)
        {
          v44 = v38;
          v45 = [(PLFigPreheatItem *)v39 cachedImage:0];
          v46 = (void *)[v35 mutableCopy];
          id v47 = 0;
          id v15 = v71;
        }
        else
        {
          v44 = v38;
          v54 = [v38 identifier];
          id v89 = 0;
          v45 = -[PUReviewAssetsMediaProvider _resizeImageAtURL:imageUTI:targetSize:bakeInOrientation:error:](self, "_resizeImageAtURL:imageUTI:targetSize:bakeInOrientation:error:", v72, v54, 1, &v89, width, height);
          id v47 = v89;

          v55 = (void *)[v35 mutableCopy];
          v46 = v55;
          id v15 = v71;
          if (v47) {
            [v55 setObject:v47 forKeyedSubscript:*MEMORY[0x1E4F39698]];
          }
        }
        (*((void (**)(id, void *, void *))v15 + 2))(v15, v45, v46);

        v43 = v65;
        goto LABEL_51;
      }
    }
    else
    {
      unint64_t v41 = v69;
      v43 = v35;
      if (v69 <= 1)
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __97__PUReviewAssetsMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
        aBlock[3] = &unk_1E5F2B3A8;
        v48 = v39;
        v88 = v71;
        v66 = v43;
        id v87 = v43;
        v49 = _Block_copy(aBlock);
        v64 = v38;
        if (v48)
        {
          v50 = [(PUReviewAssetsMediaProvider *)self _mediaRequests];
          v51 = [NSNumber numberWithInt:v18];
          [v50 setObject:v48 forKey:v51];

          v82[0] = MEMORY[0x1E4F143A8];
          v82[1] = 3221225472;
          v82[2] = __97__PUReviewAssetsMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_4;
          v82[3] = &unk_1E5F2B3D0;
          int v85 = v18;
          id v83 = v50;
          id v84 = v49;
          id v52 = v49;
          id v53 = v50;
          [(PLFigPreheatItem *)v48 startPreheatRequestWithCompletionHandler:v82];
        }
        else
        {
          uint64_t v56 = [v14 resizeMode];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __97__PUReviewAssetsMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_5;
          block[3] = &unk_1E5F2B3F8;
          BOOL v80 = v56 == 2;
          void block[4] = self;
          id v74 = v72;
          double v78 = width;
          double v79 = height;
          id v75 = v38;
          id v77 = v49;
          char v81 = v70;
          id v76 = v40;
          id v53 = v49;
          dispatch_block_t v57 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
          v58 = dispatch_get_global_queue(21, 0);
          dispatch_async(v58, v57);
        }
        v38 = v64;
        v43 = v66;
        v39 = v48;
      }
    }
    if ((v41 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
      int v59 = 0;
    }
    else {
      int v59 = v68;
    }
    id v15 = v71;
    if (v59 != 1) {
      goto LABEL_52;
    }
    v67 = v39;
    v44 = v38;
    v45 = (void *)[v43 mutableCopy];
    uint64_t v90 = *MEMORY[0x1E4F396F8];
    uint64_t v91 = MEMORY[0x1E4F1CC38];
    v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
    [v45 addEntriesFromDictionary:v60];

    ((void (**)(void, void *, void *))v71)[2](v71, v24, v45);
LABEL_51:

    v38 = v44;
    v39 = v67;
LABEL_52:

    goto LABEL_53;
  }
  LODWORD(v18) = [(PUReviewAssetsMediaProvider *)self _requestAdjustmentDataForAsset:v16 resultHandler:v15];
LABEL_54:

  return v18;
}

void __97__PUReviewAssetsMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (v7)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97__PUReviewAssetsMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2;
    block[3] = &unk_1E5F2EBC8;
    id v19 = *(id *)(a1 + 40);
    id v17 = v7;
    id v18 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);

    id v9 = v19;
LABEL_7:

    goto LABEL_8;
  }
  if ((a3 & 1) == 0)
  {
    id v10 = (void *)[*(id *)(a1 + 32) mutableCopy];
    if (v8)
    {
      uint64_t v20 = *MEMORY[0x1E4F39698];
      v21[0] = v8;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      [v10 addEntriesFromDictionary:v11];
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __97__PUReviewAssetsMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_3;
    v13[3] = &unk_1E5F2EA60;
    id v12 = *(id *)(a1 + 40);
    id v14 = v10;
    id v15 = v12;
    id v9 = v10;
    dispatch_async(MEMORY[0x1E4F14428], v13);

    goto LABEL_7;
  }
LABEL_8:
}

void __97__PUReviewAssetsMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_4(uint64_t a1, void *a2, char a3)
{
  id v5 = 0;
  id v8 = a2;
  if (!v8 && (a3 & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PUReviewAssetsMediaProviderErrorDomain" code:-99 userInfo:0];
  }
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  [v6 removeObjectForKey:v7];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __97__PUReviewAssetsMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_5(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 88))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [*(id *)(a1 + 48) identifier];
    id v18 = 0;
    id v5 = objc_msgSend(v2, "_resizeImageAtURL:imageUTI:targetSize:bakeInOrientation:error:", v3, v4, 1, &v18, *(double *)(a1 + 72), *(double *)(a1 + 80));
    id v6 = v18;

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_3:

    return;
  }
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    id v8 = (void *)MEMORY[0x1E4FB1818];
    id v9 = [v7 path];
    id v14 = [v8 imageWithContentsOfFile:v9];

    id v10 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
  }
  else
  {
    if (*(unsigned char *)(a1 + 89))
    {
      id v5 = [MEMORY[0x1E4F166C8] assetWithURL:*(void *)(a1 + 56)];
      id v6 = [MEMORY[0x1E4F16368] assetImageGeneratorWithAsset:v5];
      [v6 setAppliesPreferredTrackTransform:1];
      id v17 = 0;
      long long v15 = *MEMORY[0x1E4F1FA48];
      uint64_t v16 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      id v11 = (CGImage *)[MEMORY[0x1E4F8CC38] copyCGImageFromImageGenerator:v6 atTime:&v15 actualTime:0 error:&v17];
      id v12 = v17;
      if (v11)
      {
        id v13 = [MEMORY[0x1E4FB1818] imageWithCGImage:v11];
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
        CGImageRelease(v11);
      }
      else
      {
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      }

      goto LABEL_3;
    }
    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PUReviewAssetsMediaProviderErrorDomain" code:-102 userInfo:0];
    id v10 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
  }
  v10();
}

uint64_t __97__PUReviewAssetsMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __97__PUReviewAssetsMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (int)_requestAdjustmentDataForAsset:(id)a3 resultHandler:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void, uint64_t))a4;
  id v7 = a3;
  uint64_t v8 = [(PUReviewAssetsMediaProvider *)self _incrementRequestIdentifier];
  id v9 = [v7 assetAdjustments];

  if (v9)
  {
    id v10 = [v9 phAdjustmentData];
    v14[0] = *MEMORY[0x1E4F39718];
    id v11 = [NSNumber numberWithInt:v8];
    v14[1] = *MEMORY[0x1E4F39360];
    v15[0] = v11;
    v15[1] = v10;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
    v6[2](v6, 0, v12);

    id v6 = (void (**)(id, void, uint64_t))v12;
  }
  else
  {
    uint64_t v16 = *MEMORY[0x1E4F39718];
    id v10 = [NSNumber numberWithInt:v8];
    v17[0] = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    v6[2](v6, 0, (uint64_t)v11);
  }

  return v8;
}

- (int)_incrementRequestIdentifier
{
  return atomic_fetch_add(&self->_nextRequestIdentifier, 1u) + 1;
}

- (PUReviewAssetsMediaProvider)init
{
  v10.receiver = self;
  v10.super_class = (Class)PUReviewAssetsMediaProvider;
  uint64_t v2 = [(PUReviewAssetsMediaProvider *)&v10 init];
  uint64_t v3 = v2;
  if (v2)
  {
    atomic_store(0, (unsigned int *)&v2->_nextRequestIdentifier);
    id v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v4 scale];
    v3->__screenScale = v5;

    uint64_t v6 = [MEMORY[0x1E4F39018] mapTable];
    mediaRequests = v3->__mediaRequests;
    v3->__mediaRequests = (PHConcurrentMapTable *)v6;

    uint64_t v8 = v3;
  }

  return v3;
}

@end