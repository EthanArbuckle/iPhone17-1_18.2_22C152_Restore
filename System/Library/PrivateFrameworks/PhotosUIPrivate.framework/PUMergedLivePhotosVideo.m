@interface PUMergedLivePhotosVideo
- (AVAsset)mergedVideoAsset;
- (AVVideoComposition)mergedVideoComposition;
- (NSArray)assets;
- (NSArray)keyTimes;
- (NSArray)startTimes;
- (PUMergedLivePhotosVideo)initWithAssets:(id)a3 startTimes:(id)a4 keyTimes:(id)a5 videoAsset:(id)a6 videoComposition:(id)a7 videoAspectRatio:(double)a8 options:(unint64_t)a9;
- (double)videoAspectRatio;
- (id)assetAtTime:(id *)a3 progress:(double *)a4;
- (id)debugDescription;
- (int64_t)_assetIndexAtTime:(id *)a3;
- (unint64_t)options;
@end

@implementation PUMergedLivePhotosVideo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergedVideoComposition, 0);
  objc_storeStrong((id *)&self->_mergedVideoAsset, 0);
  objc_storeStrong((id *)&self->_keyTimes, 0);
  objc_storeStrong((id *)&self->_startTimes, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

- (unint64_t)options
{
  return self->_options;
}

- (double)videoAspectRatio
{
  return self->_videoAspectRatio;
}

- (AVVideoComposition)mergedVideoComposition
{
  return self->_mergedVideoComposition;
}

- (AVAsset)mergedVideoAsset
{
  return self->_mergedVideoAsset;
}

- (NSArray)keyTimes
{
  return self->_keyTimes;
}

- (NSArray)startTimes
{
  return self->_startTimes;
}

- (NSArray)assets
{
  return self->_assets;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v22.receiver = self;
  v22.super_class = (Class)PUMergedLivePhotosVideo;
  v4 = [(PUMergedLivePhotosVideo *)&v22 description];
  v5 = (void *)[v3 initWithString:v4];

  id v6 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v7 = [(PUMergedLivePhotosVideo *)self startTimes];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __43__PUMergedLivePhotosVideo_debugDescription__block_invoke;
  v18 = &unk_1E5F25690;
  id v20 = v6;
  uint64_t v21 = 0x3FC999999999999ALL;
  v19 = self;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:&v15];

  [v5 appendFormat:@"\n\t%@", v8, v15, v16, v17, v18, v19];
  v9 = [(PUMergedLivePhotosVideo *)self keyTimes];
  [v5 appendFormat:@"\n\tKeyTimes:\n\t%@", v9];

  v10 = [(PUMergedLivePhotosVideo *)self startTimes];
  [v5 appendFormat:@"\n\tStartTimes:\n\t%@", v10];

  v11 = [(PUMergedLivePhotosVideo *)self assets];
  [v5 appendFormat:@"\n\tAssets:\n\t%@", v11];

  v12 = [(PUMergedLivePhotosVideo *)self mergedVideoAsset];
  [v5 appendFormat:@"\n\tvideoAsset:\n\t%@", v12];

  v13 = [(PUMergedLivePhotosVideo *)self mergedVideoComposition];
  [v5 appendFormat:@"\n\tvideoComposition:\n\t%@", v13];

  return v5;
}

void __43__PUMergedLivePhotosVideo_debugDescription__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  memset(&v30[1], 0, sizeof(CMTime));
  if (v5) {
    [v5 CMTimeValue];
  }
  memset(v30, 0, 24);
  v7 = [*(id *)(a1 + 32) startTimes];
  unint64_t v8 = [v7 count];
  v9 = *(void **)(a1 + 32);
  if (a3 + 1 >= v8)
  {
    v13 = [v9 mergedVideoAsset];
    v10 = v13;
    if (v13) {
      [v13 duration];
    }
    else {
      memset(v30, 0, 24);
    }
  }
  else
  {
    v10 = [v9 startTimes];
    v11 = [v10 objectAtIndexedSubscript:a3 + 1];
    v12 = v11;
    if (v11) {
      [v11 CMTimeValue];
    }
    else {
      memset(v30, 0, 24);
    }
  }
  memset(&v29, 0, sizeof(v29));
  v14 = [*(id *)(a1 + 32) keyTimes];
  uint64_t v15 = [v14 objectAtIndexedSubscript:a3];
  uint64_t v16 = v15;
  if (v15) {
    [v15 CMTimeValue];
  }
  else {
    memset(&v29, 0, sizeof(v29));
  }

  CMTime lhs = v30[0];
  CMTime v26 = v30[1];
  CMTimeSubtract(&time, &lhs, &v26);
  uint64_t v17 = (uint64_t)(CMTimeGetSeconds(&time) / *(double *)(a1 + 48));
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"["];
  if (v17 >= 1)
  {
    uint64_t v19 = 0;
    do
    {
      uint64_t v20 = v19 + 1;
      double v21 = *(double *)(a1 + 48);
      CMTime lhs = v30[1];
      Float64 v22 = CMTimeGetSeconds(&lhs) + (double)((int)v19 + 1) * v21;
      CMTime lhs = v29;
      if (v22 <= CMTimeGetSeconds(&lhs)
        || (CMTime lhs = v30[1],
            Float64 v23 = CMTimeGetSeconds(&lhs) + (double)(int)v19 * *(double *)(a1 + 48),
            CMTime lhs = v29,
            Float64 Seconds = CMTimeGetSeconds(&lhs),
            v25 = @"*",
            v23 >= Seconds))
      {
        v25 = @"-";
      }
      [v18 appendString:v25];
      ++v19;
    }
    while (v17 != v20);
  }
  [v18 appendString:@"]"];
  [*(id *)(a1 + 40) appendString:v18];
}

- (int64_t)_assetIndexAtTime:(id *)a3
{
  id v5 = [(PUMergedLivePhotosVideo *)self keyTimes];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __45__PUMergedLivePhotosVideo__assetIndexAtTime___block_invoke;
  v22[3] = &__block_descriptor_56_e24_B32__0__NSValue_8Q16_B24l;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v23 = *a3;
  id v6 = [v5 indexesOfObjectsPassingTest:v22];
  int64_t v7 = [v6 lastIndex];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  unint64_t v8 = [(PUMergedLivePhotosVideo *)self keyTimes];
  uint64_t v9 = [v8 count] - 1;

  if (v7 != v9)
  {
    memset(&v21, 0, sizeof(v21));
    v10 = [(PUMergedLivePhotosVideo *)self keyTimes];
    v11 = [v10 objectAtIndexedSubscript:v7];
    v12 = v11;
    if (v11) {
      [v11 CMTimeValue];
    }
    else {
      memset(&v21, 0, sizeof(v21));
    }

    memset(&v20, 0, sizeof(v20));
    v13 = [(PUMergedLivePhotosVideo *)self keyTimes];
    v14 = [v13 objectAtIndexedSubscript:v7 + 1];
    uint64_t v15 = v14;
    if (v14) {
      [v14 CMTimeValue];
    }
    else {
      memset(&v20, 0, sizeof(v20));
    }

    memset(&v19, 0, sizeof(v19));
    CMTime lhs = v20;
    CMTime v17 = v21;
    CMTimeSubtract(&v19, &lhs, &v17);
    CMTime lhs = (CMTime)*a3;
    CMTime v17 = v19;
    if (CMTimeCompare(&lhs, &v17) > 0) {
      ++v7;
    }
  }
  return v7;
}

uint64_t __45__PUMergedLivePhotosVideo__assetIndexAtTime___block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    [a2 CMTimeValue];
  }
  else {
    memset(&time1, 0, sizeof(time1));
  }
  CMTime v4 = *(CMTime *)(a1 + 32);
  return CMTimeCompare(&time1, &v4) >> 31;
}

- (id)assetAtTime:(id *)a3 progress:(double *)a4
{
  int64_t v7 = [(PUMergedLivePhotosVideo *)self assets];
  CMTime time = *(CMTime *)a3;
  int64_t v8 = [(PUMergedLivePhotosVideo *)self _assetIndexAtTime:&time];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = 0;
    goto LABEL_30;
  }
  uint64_t v10 = v8;
  uint64_t v9 = [v7 objectAtIndexedSubscript:v8];
  if (a4)
  {
    double v11 = 0.0;
    if ((unint64_t)[v7 count] < 2)
    {
LABEL_29:
      *a4 = v11;
      goto LABEL_30;
    }
    v12 = [(PUMergedLivePhotosVideo *)self keyTimes];
    v13 = [v12 firstObject];
    v14 = v13;
    if (v13) {
      [v13 CMTimeValue];
    }
    else {
      memset(&start, 0, sizeof(start));
    }
    uint64_t v15 = [v12 lastObject];
    uint64_t v16 = v15;
    if (v15) {
      [v15 CMTimeValue];
    }
    else {
      memset(&end, 0, sizeof(end));
    }
    CMTimeRangeFromTimeToTime(&range, &start, &end);
    CMTime time = (CMTime)*a3;
    int v17 = CMTimeRangeContainsTime(&range, &time);

    if (v17)
    {
      memset(&time, 0, sizeof(time));
      v18 = [v12 objectAtIndexedSubscript:v10];
      CMTime v19 = v18;
      if (v18) {
        [v18 CMTimeValue];
      }
      else {
        memset(&time, 0, sizeof(time));
      }

      CMTime lhs = (CMTime)*a3;
      CMTime rhs = time;
      CMTimeSubtract(&v32, &lhs, &rhs);
      double Seconds = CMTimeGetSeconds(&v32);
      if (Seconds <= 0.0 || v10 + 1 >= (unint64_t)[v7 count])
      {
        if (v10 < 1 || Seconds >= 0.0) {
          goto LABEL_28;
        }
        memset(&lhs, 0, sizeof(lhs));
        $3CC8671D27C23BF42ADDB32F2B5E48AE v23 = [v12 objectAtIndexedSubscript:v10 - 1];
        v24 = v23;
        if (v23) {
          [v23 CMTimeValue];
        }
        else {
          memset(&lhs, 0, sizeof(lhs));
        }

        CMTime rhs = time;
        CMTime v28 = lhs;
        CMTimeSubtract(&v27, &rhs, &v28);
        v25 = &v27;
      }
      else
      {
        memset(&lhs, 0, sizeof(lhs));
        CMTime v21 = [v12 objectAtIndexedSubscript:v10 + 1];
        Float64 v22 = v21;
        if (v21) {
          [v21 CMTimeValue];
        }
        else {
          memset(&lhs, 0, sizeof(lhs));
        }

        CMTime rhs = lhs;
        CMTime v28 = time;
        CMTimeSubtract(&v29, &rhs, &v28);
        v25 = &v29;
      }
      double v11 = Seconds / CMTimeGetSeconds(v25);
    }
LABEL_28:

    goto LABEL_29;
  }
LABEL_30:

  return v9;
}

- (PUMergedLivePhotosVideo)initWithAssets:(id)a3 startTimes:(id)a4 keyTimes:(id)a5 videoAsset:(id)a6 videoComposition:(id)a7 videoAspectRatio:(double)a8 options:(unint64_t)a9
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  v35.receiver = self;
  v35.super_class = (Class)PUMergedLivePhotosVideo;
  Float64 v22 = [(PUMergedLivePhotosVideo *)&v35 init];
  if (v22)
  {
    SEL v34 = a2;
    uint64_t v23 = [v17 count];
    if (v23 != [v18 count])
    {
      CMTime v32 = [MEMORY[0x1E4F28B00] currentHandler];
      [v32 handleFailureInMethod:v34, v22, @"PUMergedLivePhotosVideo.m", 18, @"Invalid parameter not satisfying: %@", @"assets.count == startTimes.count" object file lineNumber description];
    }
    uint64_t v24 = [v17 count];
    if (v24 != [v19 count])
    {
      v33 = [MEMORY[0x1E4F28B00] currentHandler];
      [v33 handleFailureInMethod:v34, v22, @"PUMergedLivePhotosVideo.m", 19, @"Invalid parameter not satisfying: %@", @"assets.count == keyTimes.count" object file lineNumber description];
    }
    uint64_t v25 = [v17 copy];
    assets = v22->_assets;
    v22->_assets = (NSArray *)v25;

    uint64_t v27 = [v18 copy];
    startTimes = v22->_startTimes;
    v22->_startTimes = (NSArray *)v27;

    uint64_t v29 = [v19 copy];
    keyTimes = v22->_keyTimes;
    v22->_keyTimes = (NSArray *)v29;

    objc_storeStrong((id *)&v22->_mergedVideoAsset, a6);
    objc_storeStrong((id *)&v22->_mergedVideoComposition, a7);
    v22->_videoAspectRatio = a8;
    v22->_options = a9;
  }

  return v22;
}

@end