@interface PXStoryPHAssetCollectionAssetsProducer
+ (BOOL)shouldApplyDetailsViewContextForAssetCollection:(id)a3;
+ (BOOL)shouldEnableCurationForAssetCollection:(id)a3;
- (NSArray)referencePersons;
- (PHAssetCollection)assetCollection;
- (PHFetchResult)keyAsset;
- (PXStoryPHAssetCollectionAssetsProducer)init;
- (PXStoryPHAssetCollectionAssetsProducer)initWithAssetCollection:(id)a3 keyAsset:(id)a4 referencePersons:(id)a5 curationKind:(int64_t)a6 options:(unint64_t)a7;
- (id)requestAssetsWithOptions:(unint64_t)a3 storyQueue:(id)a4 resultHandler:(id)a5;
- (int64_t)curationKind;
- (unint64_t)options;
@end

@implementation PXStoryPHAssetCollectionAssetsProducer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_referencePersons, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

- (unint64_t)options
{
  return self->_options;
}

- (int64_t)curationKind
{
  return self->_curationKind;
}

- (PHFetchResult)keyAsset
{
  return self->_keyAsset;
}

- (NSArray)referencePersons
{
  return self->_referencePersons;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (id)requestAssetsWithOptions:(unint64_t)a3 storyQueue:(id)a4 resultHandler:(id)a5
{
  char v6 = a3;
  v38[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if ((v6 & 2) != 0) {
    uint64_t v9 = 712742;
  }
  else {
    uint64_t v9 = 712738;
  }
  v10 = (void (**)(id, PXStoryProducerResult *))a5;
  unint64_t v11 = v9 & 0xFFFFFFFFFFFFFFBFLL | (([(PXStoryPHAssetCollectionAssetsProducer *)self options] & 1) << 6);
  v12 = [(PXStoryPHAssetCollectionAssetsProducer *)self assetCollection];
  int v13 = [(id)objc_opt_class() shouldEnableCurationForAssetCollection:v12];
  if (v13) {
    v11 |= 0x10uLL;
  }
  if (+[PXStoryPHAssetCollectionAssetsProducer shouldApplyDetailsViewContextForAssetCollection:v12])
  {
    v11 |= 0x100000uLL;
  }
  if ([(PXStoryPHAssetCollectionAssetsProducer *)self curationKind] == 3) {
    unint64_t v14 = v11 | 0x200010;
  }
  else {
    unint64_t v14 = v11;
  }
  v15 = [PXPhotosDataSourceConfiguration alloc];
  v16 = [(PXStoryPHAssetCollectionAssetsProducer *)self assetCollection];
  v17 = [(PXPhotosDataSourceConfiguration *)v15 initWithAssetCollection:v16 options:v14];

  [(PXPhotosDataSourceConfiguration *)v17 setCurationKind:[(PXStoryPHAssetCollectionAssetsProducer *)self curationKind]];
  if (v13) {
    [(PXPhotosDataSourceConfiguration *)v17 setCurationType:1];
  }
  if (([(PXStoryPHAssetCollectionAssetsProducer *)self options] & 2) != 0)
  {
    [(PXPhotosDataSourceConfiguration *)v17 setLibraryFilterState:0];
    [(PXPhotosDataSourceConfiguration *)v17 setLibraryFilter:0];
  }
  v18 = [(PXStoryPHAssetCollectionAssetsProducer *)self referencePersons];
  [(PXPhotosDataSourceConfiguration *)v17 setFilterPersons:v18];
  v19 = [(PXStoryPHAssetCollectionAssetsProducer *)self keyAsset];
  uint64_t v20 = [v19 count];

  if (v20)
  {
    v21 = [(PXStoryPHAssetCollectionAssetsProducer *)self assetCollection];
    v37 = v21;
    v22 = [(PXStoryPHAssetCollectionAssetsProducer *)self keyAsset];
    v38[0] = v22;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
    [(PXPhotosDataSourceConfiguration *)v17 setExistingKeyAssetsFetchResults:v23];
  }
  v24 = [v12 photoLibrary];
  if (![v18 count])
  {
    v25 = +[PXContentSyndicationConfigurationProvider contentSyndicationConfigurationProviderWithPhotoLibrary:v24];
    -[PXPhotosDataSourceConfiguration setCanIncludeUnsavedSyndicatedAssets:](v17, "setCanIncludeUnsavedSyndicatedAssets:", [v25 showUnsavedSyndicatedContentInMemories]);
  }
  [(PXPhotosDataSourceConfiguration *)v17 setClientQueue:v8];
  [(PXPhotosDataSourceConfiguration *)v17 setWantsCurationByDefault:(v14 >> 4) & 1];
  uint64_t v26 = *MEMORY[0x1E4F39560];
  v36[0] = *MEMORY[0x1E4F39448];
  v36[1] = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  [(PXPhotosDataSourceConfiguration *)v17 setFetchPropertySets:v27];

  v28 = [[PXPhotosDataSource alloc] initWithPhotosDataSourceConfiguration:v17];
  v29 = v28;
  if ((v6 & 2) != 0)
  {
    [(PXPhotosDataSource *)v28 setAllowSlowFetchesOnClientQueue:1];
    if (v6) {
      goto LABEL_24;
    }
  }
  else if (v6)
  {
    [(PXPhotosDataSource *)v28 forceAccurateAllSectionsIfNeeded];
LABEL_24:
    [(PXPhotosDataSource *)v29 startBackgroundFetchIfNeeded];
    goto LABEL_25;
  }
  v30 = +[PXPreloadScheduler sharedScheduler];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __92__PXStoryPHAssetCollectionAssetsProducer_requestAssetsWithOptions_storyQueue_resultHandler___block_invoke;
  v34[3] = &unk_1E5DD36F8;
  v35 = v29;
  [v30 scheduleMainQueueTask:v34];

LABEL_25:
  v31 = [[PXPhotoKitAssetsDataSourceManager alloc] initWithPhotosDataSource:v29];
  v32 = [[PXStoryProducerResult alloc] initWithObject:v31];
  v10[2](v10, v32);

  return 0;
}

uint64_t __92__PXStoryPHAssetCollectionAssetsProducer_requestAssetsWithOptions_storyQueue_resultHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startBackgroundFetchIfNeeded];
}

- (PXStoryPHAssetCollectionAssetsProducer)initWithAssetCollection:(id)a3 keyAsset:(id)a4 referencePersons:(id)a5 curationKind:(int64_t)a6 options:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PXStoryPHAssetCollectionAssetsProducer;
  v16 = [(PXStoryPHAssetCollectionAssetsProducer *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_assetCollection, a3);
    objc_storeStrong((id *)&v17->_keyAsset, a4);
    uint64_t v18 = [v15 copy];
    referencePersons = v17->_referencePersons;
    v17->_referencePersons = (NSArray *)v18;

    v17->_curationKind = a6;
    v17->_options = a7;
  }

  return v17;
}

- (PXStoryPHAssetCollectionAssetsProducer)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryPHAssetCollectionAssetsProducer.m", 36, @"%s is not available as initializer", "-[PXStoryPHAssetCollectionAssetsProducer init]");

  abort();
}

+ (BOOL)shouldEnableCurationForAssetCollection:(id)a3
{
  id v3 = a3;
  if ((unint64_t)([v3 assetCollectionType] - 4) >= 3) {
    int v4 = objc_msgSend(v3, "px_isRegularAlbum");
  }
  else {
    int v4 = 1;
  }
  if ([v3 assetCollectionType] == 2) {
    v4 |= [v3 isUserSmartAlbum] ^ 1;
  }

  return v4;
}

+ (BOOL)shouldApplyDetailsViewContextForAssetCollection:(id)a3
{
  return [a3 assetCollectionType] != 4;
}

@end