@interface AVAsset(PhotosUI)
- (id)pu_cachedDuration;
- (void)_pu_setCachedDuration:()PhotosUI;
- (void)pu_duration;
- (void)pu_loadDurationWithCompletionHandler:()PhotosUI;
@end

@implementation AVAsset(PhotosUI)

- (void)pu_loadDurationWithCompletionHandler:()PhotosUI
{
  v4 = a3;
  v5 = objc_msgSend(a1, "pu_cachedDuration");
  v6 = v5;
  if (v5)
  {
    location[0] = 0;
    location[1] = 0;
    uint64_t v18 = 0;
    [v5 CMTimeValue];
    if (v4)
    {
      v7 = (void (*)(void *, long long *, uint64_t, void))v4[2];
      long long v15 = *(_OWORD *)location;
      uint64_t v16 = v18;
      v7(v4, &v15, 1, 0);
    }
  }
  else
  {
    objc_initWeak(location, a1);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __58__AVAsset_PhotosUI__pu_loadDurationWithCompletionHandler___block_invoke;
    v12 = &unk_1E5F29240;
    objc_copyWeak(&v14, location);
    v13 = v4;
    v8 = (void (**)(void))_Block_copy(&v9);
    if (objc_msgSend(a1, "statusOfValueForKey:error:", @"duration", 0, v9, v10, v11, v12) == 2) {
      v8[2](v8);
    }
    else {
      [a1 loadValuesAsynchronouslyForKeys:&unk_1F078AB38 completionHandler:v8];
    }

    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
  }
}

- (void)pu_duration
{
  uint64_t v4 = objc_msgSend(a1, "pu_cachedDuration");
  if (v4)
  {
    v5 = (void *)v4;
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
  }
  else
  {
    long long v8 = 0uLL;
    uint64_t v9 = 0;
    [a1 duration];
    long long v6 = v8;
    uint64_t v7 = v9;
    v5 = [MEMORY[0x1E4F29238] valueWithCMTime:&v6];
    objc_msgSend(a1, "_pu_setCachedDuration:", v5);
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    if (!v5) {
      return;
    }
  }
  [v5 CMTimeValue];
}

- (id)pu_cachedDuration
{
  return objc_getAssociatedObject(a1, sel_pu_cachedDuration);
}

- (void)_pu_setCachedDuration:()PhotosUI
{
}

@end