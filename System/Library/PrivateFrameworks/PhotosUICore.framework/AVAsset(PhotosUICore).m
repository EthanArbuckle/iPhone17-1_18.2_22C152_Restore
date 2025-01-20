@interface AVAsset(PhotosUICore)
- (double)px_dimensionsOfFirstVideoTrack;
- (id)px_assetByClampingToDuration:()PhotosUICore error:;
- (id)px_cachedDuration;
- (void)_px_setCachedDuration:()PhotosUICore;
- (void)px_duration;
- (void)px_loadDurationWithCompletionHandler:()PhotosUICore;
@end

@implementation AVAsset(PhotosUICore)

- (id)px_assetByClampingToDuration:()PhotosUICore error:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [a1 duration];
  *(_OWORD *)&time2.start.value = *(_OWORD *)&a3->value;
  time2.start.epoch = a3->epoch;
  if (CMTimeCompare(&time1, &time2.start) <= 0)
  {
    id v12 = a1;
  }
  else
  {
    memset(&time2, 0, sizeof(time2));
    v7 = (CMTime *)MEMORY[0x1E4F1FA48];
    start[0] = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    CMTime duration = *a3;
    CMTimeRangeMake(&time2, start, &duration);
    id v8 = objc_alloc_init(MEMORY[0x1E4F16590]);
    id v15 = 0;
    *(CMTimeRange *)&start[0].value = time2;
    CMTime duration = *v7;
    char v9 = [MEMORY[0x1E4F8CC38] insertTimeRange:start ofAsset:a1 atTime:&duration intoMutableComposition:v8 error:&v15];
    id v10 = v15;
    v11 = v10;
    if (v9)
    {
      if (a4) {
        *a4 = v10;
      }
      id v12 = (id)[v8 copy];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        start[0] = *a3;
        CFStringRef v14 = CMTimeCopyDescription(0, start);
        LODWORD(start[0].value) = 138412802;
        *(CMTimeValue *)((char *)&start[0].value + 4) = (CMTimeValue)a1;
        LOWORD(start[0].flags) = 2112;
        *(void *)((char *)&start[0].flags + 2) = v14;
        HIWORD(start[0].epoch) = 2112;
        start[1].value = (CMTimeValue)v11;
        _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to produce trimmed AVAsset from asset %@, duration %@. Error: %@.", (uint8_t *)start, 0x20u);
      }
      id v12 = 0;
    }
  }
  return v12;
}

- (double)px_dimensionsOfFirstVideoTrack
{
  v1 = [MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15C18] forAsset:a1];
  v2 = [v1 firstObject];

  [v2 dimensions];
  double v4 = v3;

  return v4;
}

- (void)px_loadDurationWithCompletionHandler:()PhotosUICore
{
  v23[1] = *MEMORY[0x1E4F143B8];
  double v4 = a3;
  v5 = objc_msgSend(a1, "px_cachedDuration");
  v6 = v5;
  if (v5)
  {
    location[0] = 0;
    location[1] = 0;
    uint64_t v22 = 0;
    [v5 CMTimeValue];
    if (v4)
    {
      v7 = (void (*)(void *, long long *, uint64_t, void))v4[2];
      long long v19 = *(_OWORD *)location;
      uint64_t v20 = v22;
      v7(v4, &v19, 1, 0);
    }
  }
  else
  {
    objc_initWeak(location, a1);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __62__AVAsset_PhotosUICore__px_loadDurationWithCompletionHandler___block_invoke;
    v16 = &unk_1E5DD1848;
    objc_copyWeak(&v18, location);
    v17 = v4;
    id v8 = (void (**)(void))_Block_copy(&v13);
    char v9 = NSStringFromSelector(sel_duration);
    uint64_t v10 = objc_msgSend(a1, "statusOfValueForKey:error:", v9, 0, v13, v14, v15, v16);

    if (v10 == 2)
    {
      v8[2](v8);
    }
    else
    {
      v11 = NSStringFromSelector(sel_duration);
      v23[0] = v11;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
      [a1 loadValuesAsynchronouslyForKeys:v12 completionHandler:v8];
    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(location);
  }
}

- (void)px_duration
{
  uint64_t v4 = objc_msgSend(a1, "px_cachedDuration");
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
    objc_msgSend(a1, "_px_setCachedDuration:", v5);
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    if (!v5) {
      return;
    }
  }
  [v5 CMTimeValue];
}

- (id)px_cachedDuration
{
  return objc_getAssociatedObject(a1, sel_px_cachedDuration);
}

- (void)_px_setCachedDuration:()PhotosUICore
{
}

@end