@interface AVAsset
@end

@implementation AVAsset

void __62__AVAsset_PhotosUICore__px_loadDurationWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = NSStringFromSelector(sel_duration);
  id v13 = 0;
  uint64_t v4 = [WeakRetained statusOfValueForKey:v3 error:&v13];
  id v5 = v13;

  long long v11 = *MEMORY[0x1E4F1F9F0];
  uint64_t v12 = *(void *)(MEMORY[0x1E4F1F9F0] + 16);
  if (v4 == 2)
  {
    if (WeakRetained)
    {
      [WeakRetained duration];
    }
    else
    {
      long long v9 = 0uLL;
      uint64_t v10 = 0;
    }
    long long v11 = v9;
    uint64_t v12 = v10;
    v6 = [MEMORY[0x1E4F29238] valueWithCMTime:&v9];
    objc_msgSend(WeakRetained, "_px_setCachedDuration:", v6);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7 && WeakRetained)
  {
    v8 = *(void (**)(uint64_t, long long *, BOOL, id))(v7 + 16);
    long long v9 = v11;
    uint64_t v10 = v12;
    v8(v7, &v9, v4 == 2, v5);
  }
}

@end