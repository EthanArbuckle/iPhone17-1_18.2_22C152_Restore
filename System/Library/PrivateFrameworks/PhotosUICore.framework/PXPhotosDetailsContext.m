@interface PXPhotosDetailsContext
+ (NSCache)preheatedAssets;
+ (id)_assetFetchResultForAssets:(id)a3;
+ (id)_fetchPropertySets;
+ (id)_preheatedFetchResultForAsset:(id)a3;
+ (id)photosDetailsContextForAsset:(id)a3 parentContext:(id)a4;
+ (id)photosDetailsContextForAssetCollection:(id)a3 assets:(id)a4 keyAssets:(id)a5 enableCuration:(BOOL)a6 enableKeyAssets:(BOOL)a7 useVerboseSmartDescription:(BOOL)a8 viewSourceOrigin:(int64_t)a9;
+ (id)photosDetailsContextForAssetCollection:(id)a3 assets:(id)a4 keyAssets:(id)a5 enableCuration:(BOOL)a6 enableKeyAssets:(BOOL)a7 useVerboseSmartDescription:(BOOL)a8 viewSourceOrigin:(int64_t)a9 ignoreSharedLibraryFilters:(BOOL)a10;
+ (id)photosDetailsContextForAssetCollection:(id)a3 assets:(id)a4 viewSourceOrigin:(int64_t)a5;
+ (id)photosDetailsContextForMemory:(id)a3;
+ (id)photosDetailsContextForMemory:(id)a3 enableCuration:(BOOL)a4 enableKeyAssets:(BOOL)a5;
+ (void)photosDetailsContextPreheatForAssets:(id)a3;
- (BOOL)hasLocation;
- (BOOL)includeOthersInSocialGroupAssets;
- (BOOL)shouldShowHeaderTitle;
- (BOOL)shouldShowMovieHeader;
- (BOOL)shouldUseKeyFace;
- (NSDictionary)assetsByCollection;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (NSString)titleFontName;
- (PHAsset)firstAsset;
- (PHAssetCollection)containingAlbum;
- (PHFetchResult)assetCollections;
- (PHFetchResult)keyAssetsFetchResult;
- (PHFetchResult)people;
- (PXDisplayTitleInfo)displayTitleInfo;
- (PXPhotosDataSource)photosDataSource;
- (PXPhotosDetailsContext)init;
- (PXPhotosDetailsContext)initWithPhotosDataSource:(id)a3 displayTitleInfo:(id)a4 parentContext:(id)a5 keyAssetsFetchResult:(id)a6;
- (PXPhotosDetailsContext)parentContext;
- (PXPhotosDetailsViewModel)viewModel;
- (PXPhotosDetailsVisualLookupData)visualLookupData;
- (id)unlockDeviceStatus;
- (int64_t)viewSourceOrigin;
- (unint64_t)contextHierarchyDepth;
- (void)_updatePropertiesDerivedFromDisplayTitleInfo;
- (void)_updatePropertiesDerivedFromPhotosDataSource;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)setAssetCollections:(id)a3;
- (void)setAssetsByCollection:(id)a3;
- (void)setContainingAlbum:(id)a3;
- (void)setHasLocation:(BOOL)a3;
- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3;
- (void)setKeyAssetsFetchResult:(id)a3;
- (void)setLocalizedSubtitle:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setPeople:(id)a3;
- (void)setPhotosDataSource:(id)a3;
- (void)setShouldShowMovieHeader:(BOOL)a3;
- (void)setTitleFontName:(id)a3;
- (void)setUnlockDeviceStatus:(id)a3;
- (void)setViewModel:(id)a3;
- (void)setViewSourceOrigin:(int64_t)a3;
- (void)setVisualLookupData:(id)a3;
- (void)toggleIncludeOthersInSocialGroupAssets;
@end

@implementation PXPhotosDetailsContext

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unlockDeviceStatus, 0);
  objc_storeStrong((id *)&self->_titleFontName, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_people, 0);
  objc_storeStrong((id *)&self->_assetsByCollection, 0);
  objc_storeStrong((id *)&self->_assetCollections, 0);
  objc_storeStrong((id *)&self->_containingAlbum, 0);
  objc_storeStrong((id *)&self->_visualLookupData, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_keyAssetsFetchResult, 0);
  objc_destroyWeak((id *)&self->_parentContext);
  objc_storeStrong((id *)&self->_displayTitleInfo, 0);
  objc_storeStrong((id *)&self->_photosDataSource, 0);
}

- (void)setUnlockDeviceStatus:(id)a3
{
}

- (id)unlockDeviceStatus
{
  return self->_unlockDeviceStatus;
}

- (BOOL)includeOthersInSocialGroupAssets
{
  return self->_includeOthersInSocialGroupAssets;
}

- (BOOL)shouldUseKeyFace
{
  return self->_shouldUseKeyFace;
}

- (BOOL)hasLocation
{
  return self->_hasLocation;
}

- (BOOL)shouldShowMovieHeader
{
  return self->_shouldShowMovieHeader;
}

- (NSString)titleFontName
{
  return self->_titleFontName;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (PHFetchResult)people
{
  return self->_people;
}

- (NSDictionary)assetsByCollection
{
  return self->_assetsByCollection;
}

- (PHFetchResult)assetCollections
{
  return self->_assetCollections;
}

- (PHAssetCollection)containingAlbum
{
  return self->_containingAlbum;
}

- (PXPhotosDetailsVisualLookupData)visualLookupData
{
  return self->_visualLookupData;
}

- (unint64_t)contextHierarchyDepth
{
  return self->_contextHierarchyDepth;
}

- (PXPhotosDetailsViewModel)viewModel
{
  return self->_viewModel;
}

- (int64_t)viewSourceOrigin
{
  return self->_viewSourceOrigin;
}

- (PHFetchResult)keyAssetsFetchResult
{
  return self->_keyAssetsFetchResult;
}

- (PXPhotosDetailsContext)parentContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentContext);
  return (PXPhotosDetailsContext *)WeakRetained;
}

- (PXDisplayTitleInfo)displayTitleInfo
{
  return self->_displayTitleInfo;
}

- (PXPhotosDataSource)photosDataSource
{
  return self->_photosDataSource;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  if ((void *)PXDisplayTitleInfoObservationContext != a5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PXPhotosDetailsContext.m" lineNumber:401 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  [(PXPhotosDetailsContext *)self _updatePropertiesDerivedFromDisplayTitleInfo];
}

- (void)setPhotosDataSource:(id)a3
{
  v5 = (PXPhotosDataSource *)a3;
  photosDataSource = self->_photosDataSource;
  if (photosDataSource != v5)
  {
    v7 = v5;
    [(PXPhotosDataSource *)photosDataSource unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_photosDataSource, a3);
    [(PXPhotosDataSource *)self->_photosDataSource registerChangeObserver:self];
    [(PXPhotosDetailsContext *)self _updatePropertiesDerivedFromPhotosDataSource];
    [(PXPhotosDetailsContext *)self signalChange:1024];
    v5 = v7;
  }
}

- (void)setViewModel:(id)a3
{
  v5 = (PXPhotosDetailsViewModel *)a3;
  if (self->_viewModel != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(PXPhotosDetailsContext *)self signalChange:256];
    v5 = v6;
  }
}

- (void)setViewSourceOrigin:(int64_t)a3
{
  self->_viewSourceOrigin = a3;
}

- (void)setContainingAlbum:(id)a3
{
  v7 = (PHAssetCollection *)a3;
  v5 = self->_containingAlbum;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PHAssetCollection *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_containingAlbum, a3);
      [(PXPhotosDetailsContext *)self signalChange:4096];
    }
  }
}

- (void)setVisualLookupData:(id)a3
{
  v7 = (PXPhotosDetailsVisualLookupData *)a3;
  v5 = self->_visualLookupData;
  if (v5 == v7)
  {
  }
  else
  {
    BOOL v6 = [(PXPhotosDetailsVisualLookupData *)v7 isEqual:v5];

    if (!v6)
    {
      objc_storeStrong((id *)&self->_visualLookupData, a3);
      [(PXPhotosDetailsContext *)self signalChange:2048];
    }
  }
}

- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3
{
  if (self->_includeOthersInSocialGroupAssets != a3)
  {
    self->_includeOthersInSocialGroupAssets = a3;
    [(PXPhotosDetailsContext *)self signalChange:0x2000];
  }
}

- (void)setHasLocation:(BOOL)a3
{
  if (self->_hasLocation != a3)
  {
    self->_hasLocation = a3;
    [(PXPhotosDetailsContext *)self signalChange:512];
  }
}

- (void)setShouldShowMovieHeader:(BOOL)a3
{
  if (self->_shouldShowMovieHeader != a3)
  {
    self->_shouldShowMovieHeader = a3;
    [(PXPhotosDetailsContext *)self signalChange:128];
  }
}

- (void)setTitleFontName:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_titleFontName;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      BOOL v6 = (NSString *)[(NSString *)v8 copy];
      titleFontName = self->_titleFontName;
      self->_titleFontName = v6;

      [(PXPhotosDetailsContext *)self signalChange:64];
    }
  }
}

- (void)setLocalizedSubtitle:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_localizedSubtitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      BOOL v6 = (NSString *)[(NSString *)v8 copy];
      localizedSubtitle = self->_localizedSubtitle;
      self->_localizedSubtitle = v6;

      [(PXPhotosDetailsContext *)self signalChange:32];
    }
  }
}

- (void)setLocalizedTitle:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_localizedTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      BOOL v6 = (NSString *)[(NSString *)v8 copy];
      localizedTitle = self->_localizedTitle;
      self->_localizedTitle = v6;

      [(PXPhotosDetailsContext *)self signalChange:16];
    }
  }
}

- (void)setPeople:(id)a3
{
  BOOL v5 = (PHFetchResult *)a3;
  if (self->_people != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->_people, a3);
    [(PXPhotosDetailsContext *)self signalChange:8];
    BOOL v5 = v6;
  }
}

- (void)setKeyAssetsFetchResult:(id)a3
{
  v8 = (PHFetchResult *)a3;
  v4 = self->_keyAssetsFetchResult;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(PHFetchResult *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      BOOL v6 = (PHFetchResult *)[(PHFetchResult *)v8 copy];
      keyAssetsFetchResult = self->_keyAssetsFetchResult;
      self->_keyAssetsFetchResult = v6;

      [(PXPhotosDetailsContext *)self signalChange:4];
    }
  }
}

- (void)setAssetsByCollection:(id)a3
{
  v8 = (NSDictionary *)a3;
  v4 = self->_assetsByCollection;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSDictionary *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      BOOL v6 = (NSDictionary *)[(NSDictionary *)v8 copy];
      assetsByCollection = self->_assetsByCollection;
      self->_assetsByCollection = v6;

      [(PXPhotosDetailsContext *)self signalChange:2];
    }
  }
}

- (void)setAssetCollections:(id)a3
{
  v7 = (PHFetchResult *)a3;
  char v5 = self->_assetCollections;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PHFetchResult *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_assetCollections, a3);
      [(PXPhotosDetailsContext *)self signalChange:1];
    }
  }
}

- (void)toggleIncludeOthersInSocialGroupAssets
{
  id v2 = [(PXPhotosDetailsContext *)self photosDataSource];
  objc_msgSend(v2, "setIncludeOthersInSocialGroupAssets:", objc_msgSend(v2, "includeOthersInSocialGroupAssets") ^ 1);
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosDetailsContext;
  [(PXPhotosDetailsContext *)&v3 performChanges:a3];
}

- (PHAsset)firstAsset
{
  id v2 = [(PXPhotosDetailsContext *)self photosDataSource];
  objc_super v3 = [v2 indexPathForFirstAsset];
  if (v3)
  {
    v4 = [v2 assetAtIndexPath:v3];
  }
  else
  {
    v4 = 0;
  }

  return (PHAsset *)v4;
}

- (BOOL)shouldShowHeaderTitle
{
  return 1;
}

- (void)_updatePropertiesDerivedFromDisplayTitleInfo
{
  objc_super v3 = [(PXPhotosDetailsContext *)self displayTitleInfo];
  v4 = [v3 title];
  char v5 = [v3 subtitle];
  char v6 = [v3 fontName];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__PXPhotosDetailsContext__updatePropertiesDerivedFromDisplayTitleInfo__block_invoke;
  v10[3] = &unk_1E5DBF180;
  id v11 = v4;
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  id v9 = v4;
  [(PXPhotosDetailsContext *)self performChanges:v10];
}

void __70__PXPhotosDetailsContext__updatePropertiesDerivedFromDisplayTitleInfo__block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setLocalizedTitle:v3];
  [v4 setLocalizedSubtitle:a1[5]];
  [v4 setTitleFontName:a1[6]];
}

- (void)_updatePropertiesDerivedFromPhotosDataSource
{
  uint64_t v3 = [(PXPhotosDetailsContext *)self photosDataSource];
  id v4 = [v3 collectionListFetchResult];
  char v5 = [v3 fetchResultsByAssetCollection];
  char v6 = [v3 includeOthersInSocialGroupAssets];
  if ([(PXPhotosDetailsContext *)self shouldUseKeyFace])
  {
    id v7 = self;
    id v8 = [(PXPhotosDetailsContext *)v7 keyFaceAssetFetchResult];
  }
  else
  {
    if ([v3 numberOfSections] <= 0) {
      [(PXPhotosDetailsContext *)self keyAssetsFetchResult];
    }
    else {
    id v8 = [v3 keyAssetsInSection:0];
    }
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__PXPhotosDetailsContext__updatePropertiesDerivedFromPhotosDataSource__block_invoke;
  v12[3] = &unk_1E5DBF158;
  id v13 = v4;
  id v14 = v5;
  id v15 = v8;
  char v16 = v6;
  id v9 = v8;
  id v10 = v5;
  id v11 = v4;
  [(PXPhotosDetailsContext *)self performChanges:v12];
}

void __70__PXPhotosDetailsContext__updatePropertiesDerivedFromPhotosDataSource__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setAssetCollections:v3];
  [v4 setAssetsByCollection:*(void *)(a1 + 40)];
  [v4 setKeyAssetsFetchResult:*(void *)(a1 + 48)];
  [v4 setIncludeOthersInSocialGroupAssets:*(unsigned __int8 *)(a1 + 56)];
}

- (PXPhotosDetailsContext)initWithPhotosDataSource:(id)a3 displayTitleInfo:(id)a4 parentContext:(id)a5 keyAssetsFetchResult:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)PXPhotosDetailsContext;
  id v15 = [(PXPhotosDetailsContext *)&v22 init];
  char v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_photosDataSource, a3);
    [(PXPhotosDataSource *)v16->_photosDataSource registerChangeObserver:v16];
    if (v12)
    {
      v17 = (PXDisplayTitleInfo *)v12;
      displayTitleInfo = v16->_displayTitleInfo;
      v16->_displayTitleInfo = v17;
    }
    else
    {
      displayTitleInfo = [v11 firstAssetCollection];
      v19 = [[PXDisplayTitleInfo alloc] initWithAssetCollection:displayTitleInfo useVerboseSmartDescription:0];
      v20 = v16->_displayTitleInfo;
      v16->_displayTitleInfo = v19;
    }
    [(PXDisplayTitleInfo *)v16->_displayTitleInfo registerChangeObserver:v16 context:PXDisplayTitleInfoObservationContext];
    objc_storeWeak((id *)&v16->_parentContext, v13);
    objc_storeStrong((id *)&v16->_keyAssetsFetchResult, a6);
    v16->_viewSourceOrigin = 0;
    v16->_contextHierarchyDepth = [v13 contextHierarchyDepth] + 1;
    [(PXPhotosDetailsContext *)v16 _updatePropertiesDerivedFromPhotosDataSource];
    [(PXPhotosDetailsContext *)v16 _updatePropertiesDerivedFromDisplayTitleInfo];
  }

  return v16;
}

- (PXPhotosDetailsContext)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosDetailsContext.m", 167, @"%s is not available as initializer", "-[PXPhotosDetailsContext init]");

  abort();
}

+ (id)photosDetailsContextForAsset:(id)a3 parentContext:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a1 _preheatedFetchResultForAsset:a3];
  id v8 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v7 title:0];
  id v9 = (void *)MEMORY[0x1E4F39008];
  v20[0] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  id v11 = [v9 transientCollectionListWithCollections:v10 title:0];

  id v12 = (void *)MEMORY[0x1E4F39008];
  id v13 = [v7 fetchOptions];
  id v14 = [v12 fetchCollectionsInCollectionList:v11 options:v13];

  id v15 = [[PXPhotosDataSourceConfiguration alloc] initWithCollectionListFetchResult:v14 options:0];
  char v16 = [a1 _fetchPropertySets];
  [(PXPhotosDataSourceConfiguration *)v15 setFetchPropertySets:v16];

  v17 = [[PXPhotosDataSource alloc] initWithPhotosDataSourceConfiguration:v15];
  v18 = [[PXPhotosDetailsContext alloc] initWithPhotosDataSource:v17 displayTitleInfo:0 parentContext:v6 keyAssetsFetchResult:0];

  return v18;
}

+ (id)_preheatedFetchResultForAsset:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = +[PXPhotosDetailsContext preheatedAssets];
  id v6 = [v4 localIdentifier];
  id v7 = [v5 objectForKey:v6];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F39150]);
    v18[0] = v4;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    id v10 = [v7 photoLibrary];
    id v11 = [MEMORY[0x1E4F38EB8] fetchType];
    id v12 = (void *)MEMORY[0x1E4F1CAD0];
    id v13 = [a1 _fetchPropertySets];
    id v14 = [v12 setWithArray:v13];
    id v15 = (void *)[v8 initWithObjects:v9 photoLibrary:v10 fetchType:v11 fetchPropertySets:v14 identifier:0 registerIfNeeded:0];
  }
  else
  {
    id v17 = v4;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    id v15 = [a1 _assetFetchResultForAssets:v9];
  }

  return v15;
}

+ (NSCache)preheatedAssets
{
  if (preheatedAssets_onceToken != -1) {
    dispatch_once(&preheatedAssets_onceToken, &__block_literal_global_209_147617);
  }
  id v2 = (void *)preheatedAssets_assetsCache;
  return (NSCache *)v2;
}

uint64_t __41__PXPhotosDetailsContext_preheatedAssets__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)preheatedAssets_assetsCache;
  preheatedAssets_assetsCache = (uint64_t)v0;

  id v2 = (void *)preheatedAssets_assetsCache;
  return [v2 setCountLimit:20];
}

+ (void)photosDetailsContextPreheatForAssets:(id)a3
{
  id v4 = [a1 _assetFetchResultForAssets:a3];
  uint64_t v3 = [v4 fetchedObjects];
  [v3 enumerateObjectsUsingBlock:&__block_literal_global_147620];
}

void __63__PXPhotosDetailsContext_photosDetailsContextPreheatForAssets___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v4 = +[PXPhotosDetailsContext preheatedAssets];
  uint64_t v3 = [v2 localIdentifier];
  [v4 setObject:v2 forKey:v3];
}

+ (id)photosDetailsContextForMemory:(id)a3 enableCuration:(BOOL)a4 enableKeyAssets:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = (void *)MEMORY[0x1E4F38EB8];
  id v9 = a3;
  id v10 = [v8 fetchKeyCuratedAssetInAssetCollection:v9 referenceAsset:0];
  id v11 = [a1 photosDetailsContextForAssetCollection:v9 assets:0 keyAssets:v10 enableCuration:v6 enableKeyAssets:v5 useVerboseSmartDescription:0 viewSourceOrigin:5];

  return v11;
}

+ (id)photosDetailsContextForMemory:(id)a3
{
  return (id)[a1 photosDetailsContextForMemory:a3 enableCuration:0 enableKeyAssets:0];
}

+ (id)_assetFetchResultForAssets:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    BOOL v5 = [v4 objectAtIndexedSubscript:0];
    BOOL v6 = [v5 photoLibrary];
    id v7 = [v6 librarySpecificFetchOptions];

    id v8 = [a1 _fetchPropertySets];
    [v7 setFetchPropertySets:v8];

    [v7 setIncludeGuestAssets:1];
    id v9 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v4;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "localIdentifier", (void)v18);
          [v9 addObject:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v12);
    }

    char v16 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v9 options:v7];
  }
  else
  {
    id v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEBUG, "Invalid operation. Cannot obtain a fetch result for 0 assets", buf, 2u);
    }
    char v16 = 0;
  }

  return v16;
}

+ (id)_fetchPropertySets
{
  v8[8] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F39440];
  v8[0] = *MEMORY[0x1E4F39468];
  v8[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F39438];
  v8[2] = *MEMORY[0x1E4F39458];
  v8[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F394E8];
  v8[4] = *MEMORY[0x1E4F39510];
  v8[5] = v4;
  uint64_t v5 = *MEMORY[0x1E4F39558];
  v8[6] = *MEMORY[0x1E4F39428];
  v8[7] = v5;
  BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:8];
  return v6;
}

+ (id)photosDetailsContextForAssetCollection:(id)a3 assets:(id)a4 keyAssets:(id)a5 enableCuration:(BOOL)a6 enableKeyAssets:(BOOL)a7 useVerboseSmartDescription:(BOOL)a8 viewSourceOrigin:(int64_t)a9 ignoreSharedLibraryFilters:(BOOL)a10
{
  BOOL v35 = a8;
  BOOL v10 = a7;
  BOOL v11 = a6;
  v43[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  uint64_t v16 = 16;
  if (!v11) {
    uint64_t v16 = 0;
  }
  if (v10) {
    uint64_t v17 = v16 | 0x20;
  }
  else {
    uint64_t v17 = v16;
  }
  long long v18 = (void *)MEMORY[0x1E4F390A0];
  id v19 = a5;
  long long v20 = [v18 fetchOptionsWithPhotoLibrary:0 orObject:v14];
  [v20 setIncludePendingMemories:1];
  v43[0] = *MEMORY[0x1E4F397B8];
  long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
  [v20 setFetchPropertySets:v21];

  objc_super v22 = (void *)MEMORY[0x1E4F38EE8];
  v23 = [v14 localIdentifier];
  v42 = v23;
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
  v25 = [v22 fetchAssetCollectionsWithLocalIdentifiers:v24 options:v20];

  v26 = [[PXPhotosDataSourceConfiguration alloc] initWithCollectionListFetchResult:v25 options:v17];
  v27 = v26;
  if (a10)
  {
    [(PXPhotosDataSourceConfiguration *)v26 setLibraryFilterState:0];
    [(PXPhotosDataSourceConfiguration *)v27 setLibraryFilter:0];
  }
  if (v15)
  {
    id v40 = v14;
    id v41 = v15;
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    [(PXPhotosDataSourceConfiguration *)v27 setExistingAssetCollectionFetchResults:v28];
  }
  [(PXPhotosDataSourceConfiguration *)v27 setHideHiddenAssets:1];
  uint64_t v39 = *MEMORY[0x1E4F39440];
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
  [(PXPhotosDataSourceConfiguration *)v27 setFetchPropertySets:v29];

  v30 = [[PXPhotosDataSource alloc] initWithPhotosDataSourceConfiguration:v27];
  v31 = [[PXDisplayTitleInfo alloc] initWithAssetCollection:v14 useVerboseSmartDescription:v35];
  v32 = [[PXPhotosDetailsContext alloc] initWithPhotosDataSource:v30 displayTitleInfo:v31 parentContext:0 keyAssetsFetchResult:v19];

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __184__PXPhotosDetailsContext_photosDetailsContextForAssetCollection_assets_keyAssets_enableCuration_enableKeyAssets_useVerboseSmartDescription_viewSourceOrigin_ignoreSharedLibraryFilters___block_invoke;
  v36[3] = &__block_descriptor_40_e41_v16__0___PXMutablePhotosDetailsContext__8l;
  v36[4] = a9;
  [(PXPhotosDetailsContext *)v32 performChanges:v36];
  if (![v25 count])
  {
    v33 = PLUIGetLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v14;
      _os_log_impl(&dword_1A9AE7000, v33, OS_LOG_TYPE_ERROR, "Could not find any matching collections for the given asset collection: %@", buf, 0xCu);
    }
  }
  return v32;
}

uint64_t __184__PXPhotosDetailsContext_photosDetailsContextForAssetCollection_assets_keyAssets_enableCuration_enableKeyAssets_useVerboseSmartDescription_viewSourceOrigin_ignoreSharedLibraryFilters___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setViewSourceOrigin:*(void *)(a1 + 32)];
}

+ (id)photosDetailsContextForAssetCollection:(id)a3 assets:(id)a4 keyAssets:(id)a5 enableCuration:(BOOL)a6 enableKeyAssets:(BOOL)a7 useVerboseSmartDescription:(BOOL)a8 viewSourceOrigin:(int64_t)a9
{
  LOBYTE(v10) = 0;
  return (id)[a1 photosDetailsContextForAssetCollection:a3 assets:a4 keyAssets:a5 enableCuration:a6 enableKeyAssets:a7 useVerboseSmartDescription:a8 viewSourceOrigin:0 ignoreSharedLibraryFilters:v10];
}

+ (id)photosDetailsContextForAssetCollection:(id)a3 assets:(id)a4 viewSourceOrigin:(int64_t)a5
{
  return (id)[a1 photosDetailsContextForAssetCollection:a3 assets:a4 keyAssets:0 enableCuration:0 enableKeyAssets:0 useVerboseSmartDescription:0 viewSourceOrigin:a5];
}

@end