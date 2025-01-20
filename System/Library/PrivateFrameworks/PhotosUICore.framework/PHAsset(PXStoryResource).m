@interface PHAsset(PXStoryResource)
- (double)px_storyResourceFetchBestPlaybackRect;
- (id)px_storyResourceFetchVideoAdjustments;
- (uint64_t)px_storyResourceFetchCurationScore;
- (uint64_t)px_storyResourceFetchFaceCount;
- (uint64_t)px_storyResourceFetchSceneClassifications;
- (uint64_t)px_storyResourceKind;
- (void)px_storyResourceFetchBestPlaybackRange;
@end

@implementation PHAsset(PXStoryResource)

- (uint64_t)px_storyResourceFetchFaceCount
{
  [a1 fetchPropertySetsIfNeeded];
  v2 = [a1 mediaAnalysisProperties];
  uint64_t v3 = [v2 faceCount];

  return v3;
}

- (uint64_t)px_storyResourceFetchCurationScore
{
  [a1 fetchPropertySetsIfNeeded];
  return [a1 curationScore];
}

- (uint64_t)px_storyResourceFetchSceneClassifications
{
  [a1 fetchPropertySetsIfNeeded];
  return [a1 sceneClassifications];
}

- (double)px_storyResourceFetchBestPlaybackRect
{
  [a1 fetchPropertySetsIfNeeded];
  v2 = [a1 mediaAnalysisProperties];
  [v2 bestPlaybackRect];
  double v4 = v3;

  return v4;
}

- (void)px_storyResourceFetchBestPlaybackRange
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  if (([a1 isVideo] & 1) != 0 || objc_msgSend(a1, "isPhotoIris"))
  {
    [a1 fetchPropertySetsIfNeeded];
    double v4 = [a1 mediaAnalysisProperties];
    v5 = v4;
    if (v4)
    {
      [v4 bestVideoTimeRange];
      int v6 = HIDWORD(v12);
      CMTimeValue v8 = v14;
      uint64_t v7 = v13;
      CMTimeScale v9 = v15;
      CMTimeFlags v10 = v16;
      BOOL v11 = v17 != 0;
    }
    else
    {
      BOOL v11 = 0;
      CMTimeFlags v10 = 0;
      CMTimeScale v9 = 0;
      CMTimeValue v8 = 0;
      uint64_t v7 = 0;
      int v6 = 0;
      long long v12 = 0u;
    }
    uint64_t v20 = v12;
    int v21 = DWORD2(v12);

    if ((v6 & 1) != 0 && (v10 & 1) != 0 && !v11 && (v8 & 0x8000000000000000) == 0)
    {
      time1.value = v8;
      time1.timescale = v9;
      time1.flags = v10;
      time1.epoch = 0;
      CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      if (CMTimeCompare(&time1, &time2))
      {
        *(void *)a2 = v20;
        *(_DWORD *)(a2 + 8) = v21;
        *(_DWORD *)(a2 + 12) = v6;
        *(void *)(a2 + 16) = v7;
        *(void *)(a2 + 24) = v8;
        *(_DWORD *)(a2 + 32) = v9;
        *(_DWORD *)(a2 + 36) = v10;
        *(void *)(a2 + 40) = 0;
      }
    }
  }
}

- (id)px_storyResourceFetchVideoAdjustments
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v1 = objc_msgSend(MEMORY[0x1E4F38F60], "assetResourcesForAsset:", a1, 0);
  v2 = (void *)[v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v10 != v3) {
          objc_enumerationMutation(v1);
        }
        v5 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v5 type] == 7)
        {
          id v6 = objc_alloc(MEMORY[0x1E4F8CE18]);
          uint64_t v7 = [v5 privateFileURL];
          v2 = (void *)[v6 initWithURL:v7];

          goto LABEL_11;
        }
      }
      v2 = (void *)[v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

- (uint64_t)px_storyResourceKind
{
  return 1;
}

@end