@interface AVPlayerItem(PhotosUICore)
- (uint64_t)px_loadedTimeRangesContainTime:()PhotosUICore;
@end

@implementation AVPlayerItem(PhotosUICore)

- (uint64_t)px_loadedTimeRangesContainTime:()PhotosUICore
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = [a1 loadedTimeRanges];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        memset(&v14, 0, sizeof(v14));
        if (v9) {
          [v9 CMTimeRangeValue];
        }
        CMTimeRange range = v14;
        CMTime v12 = *a3;
        if (CMTimeRangeContainsTime(&range, &v12))
        {
          uint64_t v10 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 0;
LABEL_13:

  return v10;
}

@end