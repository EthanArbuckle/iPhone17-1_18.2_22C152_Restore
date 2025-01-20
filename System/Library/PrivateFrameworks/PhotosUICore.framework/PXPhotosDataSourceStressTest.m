@interface PXPhotosDataSourceStressTest
- (BOOL)isRunning;
- (PXPhotosDataSource)dataSource;
- (PXPhotosDataSourceStressTest)init;
- (double)updateInterval;
- (id)_categoryForAsset:(id)a3;
- (unint64_t)dataSourceIndex;
- (unint64_t)maximumAssetCount;
- (void)_prepare;
- (void)_setDataSource:(id)a3;
- (void)_setDataSourceIndex:(unint64_t)a3;
- (void)_updateDataSource;
- (void)setMaximumAssetCount:(unint64_t)a3;
- (void)setRunning:(BOOL)a3;
- (void)setUpdateInterval:(double)a3;
@end

@implementation PXPhotosDataSourceStressTest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_assetsByCategory, 0);
  objc_storeStrong((id *)&self->_categories, 0);
}

- (unint64_t)dataSourceIndex
{
  return self->_dataSourceIndex;
}

- (PXPhotosDataSource)dataSource
{
  return self->_dataSource;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setUpdateInterval:(double)a3
{
  self->_updateInterval = a3;
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (void)setMaximumAssetCount:(unint64_t)a3
{
  self->_maximumAssetCount = a3;
}

- (unint64_t)maximumAssetCount
{
  return self->_maximumAssetCount;
}

- (void)_setDataSourceIndex:(unint64_t)a3
{
  if (self->_dataSourceIndex != a3)
  {
    self->_dataSourceIndex = a3;
    [(PXPhotosDataSourceStressTest *)self signalChange:4];
  }
}

- (void)_setDataSource:(id)a3
{
  v5 = (PXPhotosDataSource *)a3;
  if (self->_dataSource != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_dataSource, a3);
    [(PXPhotosDataSourceStressTest *)self signalChange:2];
    v5 = v6;
  }
}

- (void)_updateDataSource
{
  v29[1] = *MEMORY[0x1E4F143B8];
  if ([(PXPhotosDataSourceStressTest *)self isRunning])
  {
    unint64_t sampleIndex = self->_sampleIndex;
    NSUInteger v4 = [(NSArray *)self->_categories count];
    v23 = [MEMORY[0x1E4F1CA48] array];
    if (self->_sampleLength)
    {
      unint64_t v5 = 0;
      unint64_t v6 = 1;
      do
      {
        unint64_t v7 = sampleIndex / v4;
        v8 = [(NSArray *)self->_categories objectAtIndexedSubscript:sampleIndex % v4];
        v9 = [(NSDictionary *)self->_assetsByCategory objectForKeyedSubscript:v8];
        v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", v5 % objc_msgSend(v9, "count"));
        [v23 addObject:v10];
        v6 *= v4;

        ++v5;
        unint64_t sampleIndex = v7;
      }
      while (v5 < self->_sampleLength);
    }
    else
    {
      unint64_t v6 = 1;
    }
    v11 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssets:v23 title:0];
    v12 = (void *)MEMORY[0x1E4F39008];
    v29[0] = v11;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    v14 = [v12 transientCollectionListWithCollections:v13 title:0];

    v15 = [MEMORY[0x1E4F38EE8] fetchCollectionsInCollectionList:v14 options:0];
    v16 = [[PXPhotosDataSourceConfiguration alloc] initWithCollectionListFetchResult:v15 options:16];
    v17 = [[PXPhotosDataSource alloc] initWithPhotosDataSourceConfiguration:v16];
    [(PXPhotosDataSource *)v17 setWantsCuration:1 forAssetCollection:v11];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __49__PXPhotosDataSourceStressTest__updateDataSource__block_invoke;
    v27[3] = &unk_1E5DD0328;
    v27[4] = self;
    v18 = v17;
    v28 = v18;
    [(PXPhotosDataSourceStressTest *)self performChanges:v27];
    unint64_t v19 = self->_sampleIndex + 1;
    self->_unint64_t sampleIndex = v19;
    if (v19 >= v6)
    {
      ++self->_sampleLength;
      self->_unint64_t sampleIndex = 0;
    }
    unint64_t sampleLength = self->_sampleLength;
    if (sampleLength <= [(PXPhotosDataSourceStressTest *)self maximumAssetCount])
    {
      objc_initWeak(&location, self);
      [(PXPhotosDataSourceStressTest *)self updateInterval];
      dispatch_time_t v22 = dispatch_time(0, (uint64_t)(v21 * 1000000000.0));
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__PXPhotosDataSourceStressTest__updateDataSource__block_invoke_2;
      block[3] = &unk_1E5DD32D0;
      objc_copyWeak(&v25, &location);
      dispatch_after(v22, MEMORY[0x1E4F14428], block);
      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
  }
}

uint64_t __49__PXPhotosDataSourceStressTest__updateDataSource__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setDataSource:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 dataSourceIndex] + 1;
  return [v2 _setDataSourceIndex:v3];
}

void __49__PXPhotosDataSourceStressTest__updateDataSource__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateDataSource];
}

- (id)_categoryForAsset:(id)a3
{
  id v3 = a3;
  double v4 = (double)(unint64_t)[v3 pixelWidth];
  unint64_t v5 = [v3 pixelHeight];

  if (v4 / (double)v5 <= 2.0) {
    PXFloatEqualToFloatWithTolerance();
  }
  return @"pano";
}

- (void)_prepare
{
  v21[2] = *MEMORY[0x1E4F143B8];
  if (!self->_isPrepared)
  {
    self->_isPrepared = 1;
    v21[0] = @"portrait";
    v21[1] = @"landscape";
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    categories = self->_categories;
    self->_categories = v3;

    unint64_t v5 = [(PXPhotosDataSourceStressTest *)self maximumAssetCount];
    unint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    unint64_t v7 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    v8 = [v7 librarySpecificFetchOptions];

    v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
    v20 = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    [v8 setSortDescriptors:v10];

    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v19[3] = 0;
    v11 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v8];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __40__PXPhotosDataSourceStressTest__prepare__block_invoke;
    v15[3] = &unk_1E5DB2570;
    v15[4] = self;
    v12 = v6;
    v17 = v19;
    unint64_t v18 = v5;
    v16 = v12;
    [v11 enumerateObjectsUsingBlock:v15];

    assetsByCategory = self->_assetsByCategory;
    self->_assetsByCategory = v12;
    v14 = v12;

    self->_unint64_t sampleLength = 1;
    _Block_object_dispose(v19, 8);
  }
}

void __40__PXPhotosDataSourceStressTest__prepare__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  unint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "_categoryForAsset:");
  if (v6)
  {
    unint64_t v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v6];
    if ((unint64_t)[v7 count] < *(void *)(a1 + 56))
    {
      if (!v7)
      {
        unint64_t v7 = [MEMORY[0x1E4F1CA48] array];
        [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v6];
      }
      [v7 addObject:v10];
      if ([*(id *)(*(void *)(a1 + 32) + 104) containsObject:v6]) {
        ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      }
    }
  }
  uint64_t v8 = *(void *)(a1 + 56);
  unint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v9 >= [*(id *)(*(void *)(a1 + 32) + 104) count] * v8) {
    *a4 = 1;
  }
}

- (void)setRunning:(BOOL)a3
{
  if (self->_running != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __43__PXPhotosDataSourceStressTest_setRunning___block_invoke;
    v3[3] = &unk_1E5DCEB78;
    v3[4] = self;
    BOOL v4 = a3;
    [(PXPhotosDataSourceStressTest *)self performChanges:v3];
  }
}

uint64_t __43__PXPhotosDataSourceStressTest_setRunning___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 136) = *(unsigned char *)(a1 + 40);
  uint64_t result = [*(id *)(a1 + 32) signalChange:1];
  if (*(unsigned char *)(a1 + 40))
  {
    [*(id *)(a1 + 32) _prepare];
    id v3 = *(void **)(a1 + 32);
    return [v3 _updateDataSource];
  }
  return result;
}

- (PXPhotosDataSourceStressTest)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosDataSourceStressTest;
  uint64_t result = [(PXPhotosDataSourceStressTest *)&v3 init];
  if (result)
  {
    result->_maximumAssetCount = 3;
    result->_updateInterval = 0.25;
  }
  return result;
}

@end