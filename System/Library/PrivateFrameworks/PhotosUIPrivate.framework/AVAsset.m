@interface AVAsset
@end

@implementation AVAsset

void __58__AVAsset_PhotosUI__pu_loadDurationWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v12 = 0;
  uint64_t v3 = [WeakRetained statusOfValueForKey:@"duration" error:&v12];
  id v4 = v12;
  long long v10 = *MEMORY[0x1E4F1F9F0];
  uint64_t v11 = *(void *)(MEMORY[0x1E4F1F9F0] + 16);
  if (v3 == 2)
  {
    if (WeakRetained)
    {
      [WeakRetained duration];
    }
    else
    {
      long long v8 = 0uLL;
      uint64_t v9 = 0;
    }
    long long v10 = v8;
    uint64_t v11 = v9;
    v5 = [MEMORY[0x1E4F29238] valueWithCMTime:&v8];
    objc_msgSend(WeakRetained, "_pu_setCachedDuration:", v5);
  }
  if (WeakRetained)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      v7 = *(void (**)(uint64_t, long long *, BOOL, id))(v6 + 16);
      long long v8 = v10;
      uint64_t v9 = v11;
      v7(v6, &v8, v3 == 2, v4);
    }
  }
}

void __125__AVAsset_PUPerspectiveTransform__pu_loadNormalizedVitalityPerspectiveTransformWithAdditionalNormalizedTransform_completion___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 80));
  v2 = *(void **)(a1 + 80);
  uint64_t v3 = _vitalityTransformRequiredProperties();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __125__AVAsset_PUPerspectiveTransform__pu_loadNormalizedVitalityPerspectiveTransformWithAdditionalNormalizedTransform_completion___block_invoke_2;
  v5[3] = &unk_1E5F24600;
  objc_copyWeak(v10, &location);
  long long v4 = *(_OWORD *)(a1 + 48);
  long long v6 = *(_OWORD *)(a1 + 32);
  long long v7 = v4;
  long long v8 = *(_OWORD *)(a1 + 64);
  id v9 = *(id *)(a1 + 88);
  [v2 loadValuesAsynchronouslyForKeys:v3 completionHandler:v5];

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __125__AVAsset_PUPerspectiveTransform__pu_loadNormalizedVitalityPerspectiveTransformWithAdditionalNormalizedTransform_completion___block_invoke_2(uint64_t a1)
{
  if (dispatch_get_specific((const void *)VitalityLoadingQueueIdentifier))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    objc_msgSend(WeakRetained, "_pu_handleRequiredPropertiesLoadedWithAdditionalNormalizedTransform:completion:", *(void *)(a1 + 80), *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64));
  }
  else
  {
    v2 = _vitalityLoadingQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __125__AVAsset_PUPerspectiveTransform__pu_loadNormalizedVitalityPerspectiveTransformWithAdditionalNormalizedTransform_completion___block_invoke_3;
    block[3] = &unk_1E5F24600;
    objc_copyWeak(&v10, (id *)(a1 + 88));
    long long v3 = *(_OWORD *)(a1 + 48);
    long long v6 = *(_OWORD *)(a1 + 32);
    long long v7 = v3;
    long long v8 = *(_OWORD *)(a1 + 64);
    id v9 = *(id *)(a1 + 80);
    dispatch_async(v2, block);

    objc_destroyWeak(&v10);
  }
}

void __125__AVAsset_PUPerspectiveTransform__pu_loadNormalizedVitalityPerspectiveTransformWithAdditionalNormalizedTransform_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  objc_msgSend(WeakRetained, "_pu_handleRequiredPropertiesLoadedWithAdditionalNormalizedTransform:completion:", *(void *)(a1 + 80), *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64));
}

@end