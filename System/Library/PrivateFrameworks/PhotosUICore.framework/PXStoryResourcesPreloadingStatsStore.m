@interface PXStoryResourcesPreloadingStatsStore
- (BOOL)didDownloadFirstVideo;
- (double)estimatedLoadingTimeLeft;
- (float)loadedFraction;
- (void)_enumerateAllStats:(id)a3;
- (void)_modifyStatsForPlaybackStyle:(int64_t)a3 withModifier:(id)a4;
- (void)noteClipWithPlaybackStyle:(int64_t)a3 loadedWithLoadingTime:(double)a4;
- (void)noteSessionStartedPreloadableClipsCounts:(id *)a3;
@end

@implementation PXStoryResourcesPreloadingStatsStore

- (void)_enumerateAllStats:(id)a3
{
  v4 = (char *)a3 + 16;
  v5 = (void (*)(id, long long *, uint64_t, uint64_t))*((void *)a3 + 2);
  long long v6 = *(_OWORD *)&self->_imageClipsStats.accumulatedClipsLoadingTime;
  long long v13 = *(_OWORD *)&self->_imageClipsStats.preloadableClipsCount;
  long long v14 = v6;
  id v7 = a3;
  v5(v7, &v13, 1, v8);
  v9 = *(void (**)(id, long long *, uint64_t))v4;
  long long v10 = *(_OWORD *)&self->_videoClipsStats.accumulatedClipsLoadingTime;
  long long v13 = *(_OWORD *)&self->_videoClipsStats.preloadableClipsCount;
  long long v14 = v10;
  v9(v7, &v13, 4);
  v11 = *(void (**)(id, long long *, uint64_t))v4;
  long long v12 = *(_OWORD *)&self->_livePhotoClipsStats.accumulatedClipsLoadingTime;
  long long v13 = *(_OWORD *)&self->_livePhotoClipsStats.preloadableClipsCount;
  long long v14 = v12;
  v11(v7, &v13, 3);
}

- (void)_modifyStatsForPlaybackStyle:(int64_t)a3 withModifier:(id)a4
{
  id v7 = a4;
  switch(a3)
  {
    case 1:
      uint64_t v8 = 8;
      break;
    case 3:
      uint64_t v8 = 40;
      break;
    case 4:
      uint64_t v8 = 72;
      break;
    default:
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"PXStoryResourcesPreloader.m" lineNumber:1057 description:@"Code which should be unreachable has been reached"];

      abort();
  }
  id v10 = v7;
  (*((void (**)(id, char *))v7 + 2))(v7, (char *)self + v8);
}

- (BOOL)didDownloadFirstVideo
{
  return self->_videoClipsStats.preloadableClipsCount < 1 || self->_videoClipsStats.preloadedClipsCount > 0;
}

- (double)estimatedLoadingTimeLeft
{
  uint64_t v26 = 0;
  v27 = (double *)&v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  v4 = +[PXStorySettings sharedInstance];
  int v5 = [v4 estimateTimeLeftPerPlaybackStyle];

  if (v5)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __64__PXStoryResourcesPreloadingStatsStore_estimatedLoadingTimeLeft__block_invoke;
    v25[3] = &unk_1E5DCBB98;
    v25[4] = self;
    v25[5] = &v26;
    v25[6] = a2;
    [(PXStoryResourcesPreloadingStatsStore *)self _enumerateAllStats:v25];
  }
  else
  {
    uint64_t v21 = 0;
    v22 = (double *)&v21;
    uint64_t v23 = 0x2020000000;
    uint64_t v24 = 0;
    uint64_t v17 = 0;
    v18 = (double *)&v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = 0;
    uint64_t v13 = 0;
    long long v14 = &v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = 0;
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000;
    uint64_t v12 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__PXStoryResourcesPreloadingStatsStore_estimatedLoadingTimeLeft__block_invoke_2;
    v8[3] = &unk_1E5DCBBC0;
    v8[4] = &v21;
    v8[5] = &v17;
    v8[6] = &v13;
    v8[7] = &v9;
    [(PXStoryResourcesPreloadingStatsStore *)self _enumerateAllStats:v8];
    v27[3] = v27[3] + v22[3] / v18[3] * (double)(v14[3] - v10[3]);
    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v21, 8);
  }
  double v6 = v27[3];
  _Block_object_dispose(&v26, 8);
  return v6;
}

double __64__PXStoryResourcesPreloadingStatsStore_estimatedLoadingTimeLeft__block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3 < 1)
  {
    if (a3 == 1)
    {
      double v4 = 1.5;
    }
    else
    {
      if (a3 != 3 && a3 != 4)
      {
        uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
        [v8 handleFailureInMethod:a1[6] object:a1[4] file:@"PXStoryResourcesPreloader.m" lineNumber:1016 description:@"Code which should be unreachable has been reached"];

        abort();
      }
      double v4 = 2.0;
    }
  }
  else
  {
    double v4 = *(double *)(a2 + 16) / (double)v3;
  }
  uint64_t v5 = *(void *)(a1[5] + 8);
  double result = *(double *)(v5 + 24) + v4 * (double)(uint64_t)(*(void *)a2 - *(void *)(a2 + 8));
  *(double *)(v5 + 24) = result;
  return result;
}

double __64__PXStoryResourcesPreloadingStatsStore_estimatedLoadingTimeLeft__block_invoke_2(void *a1, uint64_t a2)
{
  *(double *)(*(void *)(a1[4] + 8) + 24) = *(double *)(a2 + 16) + *(double *)(*(void *)(a1[4] + 8) + 24);
  uint64_t v2 = *(void *)(a1[5] + 8);
  double result = *(double *)(v2 + 24) + (double)*(uint64_t *)(a2 + 24);
  *(double *)(v2 + 24) = result;
  *(void *)(*(void *)(a1[6] + 8) + 24) += *(void *)a2;
  *(void *)(*(void *)(a1[7] + 8) + 24) += *(void *)(a2 + 8);
  return result;
}

- (float)loadedFraction
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__PXStoryResourcesPreloadingStatsStore_loadedFraction__block_invoke;
  v5[3] = &unk_1E5DCBB70;
  v5[4] = &v10;
  v5[5] = &v6;
  [(PXStoryResourcesPreloadingStatsStore *)self _enumerateAllStats:v5];
  uint64_t v2 = v11[3];
  if (v2 < 1) {
    float v3 = 1.0;
  }
  else {
    float v3 = (float)v7[3] / (float)v2;
  }
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
  return v3;
}

uint64_t __54__PXStoryResourcesPreloadingStatsStore_loadedFraction__block_invoke(uint64_t result, void *a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += *a2;
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) += a2[1];
  return result;
}

- (void)noteClipWithPlaybackStyle:(int64_t)a3 loadedWithLoadingTime:(double)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __88__PXStoryResourcesPreloadingStatsStore_noteClipWithPlaybackStyle_loadedWithLoadingTime___block_invoke;
  v4[3] = &__block_descriptor_40_e16_v16__0____qqdq_8l;
  *(double *)&v4[4] = a4;
  [(PXStoryResourcesPreloadingStatsStore *)self _modifyStatsForPlaybackStyle:a3 withModifier:v4];
}

double __88__PXStoryResourcesPreloadingStatsStore_noteClipWithPlaybackStyle_loadedWithLoadingTime___block_invoke(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 16) + fmax(*(double *)(a1 + 32), 1.0);
  *(double *)(a2 + 16) = result;
  ++*(void *)(a2 + 24);
  ++*(void *)(a2 + 8);
  return result;
}

- (void)noteSessionStartedPreloadableClipsCounts:(id *)a3
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__PXStoryResourcesPreloadingStatsStore_noteSessionStartedPreloadableClipsCounts___block_invoke;
  v9[3] = &__block_descriptor_56_e16_v16__0____qqdq_8l;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D v10 = *a3;
  [(PXStoryResourcesPreloadingStatsStore *)self _modifyStatsForPlaybackStyle:1 withModifier:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__PXStoryResourcesPreloadingStatsStore_noteSessionStartedPreloadableClipsCounts___block_invoke_2;
  v7[3] = &__block_descriptor_56_e16_v16__0____qqdq_8l;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D v8 = *a3;
  [(PXStoryResourcesPreloadingStatsStore *)self _modifyStatsForPlaybackStyle:4 withModifier:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__PXStoryResourcesPreloadingStatsStore_noteSessionStartedPreloadableClipsCounts___block_invoke_3;
  v5[3] = &__block_descriptor_56_e16_v16__0____qqdq_8l;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D v6 = *a3;
  [(PXStoryResourcesPreloadingStatsStore *)self _modifyStatsForPlaybackStyle:3 withModifier:v5];
}

uint64_t __81__PXStoryResourcesPreloadingStatsStore_noteSessionStartedPreloadableClipsCounts___block_invoke(uint64_t result, void *a2)
{
  *a2 = *(void *)(result + 32);
  a2[1] = 0;
  return result;
}

uint64_t __81__PXStoryResourcesPreloadingStatsStore_noteSessionStartedPreloadableClipsCounts___block_invoke_2(uint64_t result, void *a2)
{
  *a2 = *(void *)(result + 40);
  a2[1] = 0;
  return result;
}

uint64_t __81__PXStoryResourcesPreloadingStatsStore_noteSessionStartedPreloadableClipsCounts___block_invoke_3(uint64_t result, void *a2)
{
  *a2 = *(void *)(result + 48);
  a2[1] = 0;
  return result;
}

@end