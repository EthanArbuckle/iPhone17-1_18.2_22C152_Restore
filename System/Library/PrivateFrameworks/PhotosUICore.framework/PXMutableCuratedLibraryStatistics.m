@interface PXMutableCuratedLibraryStatistics
- (PXMutableCuratedLibraryStatistics)init;
- (int64_t)_coutIndexForPlaybackStyle:(int64_t)a3 displayProminence:(int64_t)a4 autoPlaybackEligibility:(int64_t)a5;
- (int64_t)numberOfAssetsWithPlaybackStyle:(int64_t)a3 displayProminence:(int64_t)a4 autoPlaybackEligibility:(int64_t)a5;
- (void)_incrementCountForPlaybackStyle:(int64_t)a3 displayProminence:(int64_t)a4 autoPlaybackEligibility:(int64_t)a5;
- (void)appendStatisticsForSection:(int64_t)a3 assetsDataSource:(id)a4 playbackController:(id)a5 visibleItems:(id)a6 heroItems:(id)a7 keyItem:(int64_t)a8;
- (void)dealloc;
@end

@implementation PXMutableCuratedLibraryStatistics

- (void)appendStatisticsForSection:(int64_t)a3 assetsDataSource:(id)a4 playbackController:(id)a5 visibleItems:(id)a6 heroItems:(id)a7 keyItem:(int64_t)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x4010000000;
  v28[3] = &unk_1AB5D584F;
  long long v29 = 0u;
  int64x2_t v30 = 0u;
  *(void *)&long long v29 = [v14 identifier];
  *((void *)&v29 + 1) = a3;
  int64x2_t v30 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __131__PXMutableCuratedLibraryStatistics_appendStatisticsForSection_assetsDataSource_playbackController_visibleItems_heroItems_keyItem___block_invoke;
  v21[3] = &unk_1E5DC86C0;
  v26 = v28;
  id v18 = v14;
  id v22 = v18;
  int64_t v27 = a8;
  id v19 = v17;
  id v23 = v19;
  id v20 = v15;
  id v24 = v20;
  v25 = self;
  [v16 enumerateIndexesUsingBlock:v21];

  _Block_object_dispose(v28, 8);
}

void __131__PXMutableCuratedLibraryStatistics_appendStatisticsForSection_assetsDataSource_playbackController_visibleItems_heroItems_keyItem___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 48) = a2;
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  long long v6 = *(_OWORD *)(v5 + 48);
  v11[0] = *(_OWORD *)(v5 + 32);
  v11[1] = v6;
  v7 = [v4 assetAtItemIndexPath:v11];
  uint64_t v8 = [v7 playbackStyle];
  if (*(void *)(a1 + 72) == a2) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = [*(id *)(a1 + 40) containsIndex:a2];
  }
  if (objc_opt_respondsToSelector() & 1) != 0 && ([v7 isAutoPlaybackEligibilityEstimated])
  {
    uint64_t v10 = 0;
  }
  else if ([*(id *)(a1 + 48) canPlayAsset:v7] {
         && ([*(id *)(a1 + 48) isDisplayAssetEligibleForAutoPlayback:v7] & 1) != 0)
  }
  {
    uint64_t v10 = 2;
  }
  else
  {
    uint64_t v10 = 1;
  }
  [*(id *)(a1 + 56) _incrementCountForPlaybackStyle:v8 displayProminence:v9 autoPlaybackEligibility:v10];
}

- (int64_t)_coutIndexForPlaybackStyle:(int64_t)a3 displayProminence:(int64_t)a4 autoPlaybackEligibility:(int64_t)a5
{
  return a3 + 6 * (3 * a5 + a4);
}

- (void)_incrementCountForPlaybackStyle:(int64_t)a3 displayProminence:(int64_t)a4 autoPlaybackEligibility:(int64_t)a5
{
  counts = self->_counts;
  int64_t v6 = [(PXMutableCuratedLibraryStatistics *)self _coutIndexForPlaybackStyle:a3 displayProminence:a4 autoPlaybackEligibility:a5];
  ++counts[v6];
}

- (int64_t)numberOfAssetsWithPlaybackStyle:(int64_t)a3 displayProminence:(int64_t)a4 autoPlaybackEligibility:(int64_t)a5
{
  counts = self->_counts;
  return counts[[(PXMutableCuratedLibraryStatistics *)self _coutIndexForPlaybackStyle:a3 displayProminence:a4 autoPlaybackEligibility:a5]];
}

- (void)dealloc
{
  free(self->_counts);
  v3.receiver = self;
  v3.super_class = (Class)PXMutableCuratedLibraryStatistics;
  [(PXMutableCuratedLibraryStatistics *)&v3 dealloc];
}

- (PXMutableCuratedLibraryStatistics)init
{
  v4.receiver = self;
  v4.super_class = (Class)PXMutableCuratedLibraryStatistics;
  v2 = [(PXMutableCuratedLibraryStatistics *)&v4 init];
  if (v2) {
    v2->_counts = (int64_t *)malloc_type_calloc(0x36uLL, 8uLL, 0x100004000313F17uLL);
  }
  return v2;
}

@end