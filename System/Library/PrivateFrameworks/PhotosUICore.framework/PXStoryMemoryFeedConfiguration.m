@interface PXStoryMemoryFeedConfiguration
+ (id)_photoKitMediaProviderWithPhotoLibrary:(id)a3;
+ (void)_handleContentSeenForDataSource:(id)a3;
- (BOOL)_shouldEmbedContentLayoutForLayoutKind:(int64_t)a3;
- (BOOL)allowsPopOnEmptyBehavior;
- (BOOL)wantsEmbeddedScrollView;
- (PHPhotoLibrary)photoLibrary;
- (PXStoryMemoryFeedConfiguration)initWithDataSourceManagerPromise:(id)a3 layoutKind:(int64_t)a4 photoLibrary:(id)a5 viewControllerSetupBlock:(id)a6;
- (PXStoryMemoryFeedConfiguration)initWithMemoriesInPhotoLibrary:(id)a3 layoutKind:(int64_t)a4 viewControllerSetupBlock:(id)a5;
- (PXStoryMemoryFeedConfiguration)initWithMemoriesInPhotoLibrary:(id)a3 layoutKind:(int64_t)a4 viewControllerSetupBlock:(id)a5 visibleRectChangeObserver:(id)a6;
- (PXStoryMemoryFeedConfiguration)initWithSyntheticSectionCount:(int64_t)a3 numberOfItemsPerSection:(int64_t)a4 photoLibrary:(id)a5 layoutKind:(int64_t)a6;
- (id)_defaultSpecManagerWithLayoutKind:(int64_t)a3 extendedTraitCollection:(id)a4;
- (id)copyWithLayoutKind:(int64_t)a3;
- (id)objectReferenceForDestination:(id)a3;
- (id)viewControllerTitle;
- (void)handleContentSeen;
@end

@implementation PXStoryMemoryFeedConfiguration

- (void).cxx_destruct
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (BOOL)_shouldEmbedContentLayoutForLayoutKind:(int64_t)a3
{
  return 0;
}

- (id)_defaultSpecManagerWithLayoutKind:(int64_t)a3 extendedTraitCollection:(id)a4
{
  id v8 = a4;
  v9 = v8;
  if (a3 == 1)
  {
    if (!v8)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"PXStoryMemoryFeedConfiguration.m", 177, @"Invalid parameter not satisfying: %@", @"extendedTraitCollection != nil" object file lineNumber description];
    }
    v4 = [[PXStoryMemoryFeedViewLayoutSpecManager alloc] initWithLayoutKind:1 extendedTraitCollection:v9];
  }
  else if (!a3)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXStoryMemoryFeedConfiguration.m" lineNumber:174 description:@"Code which should be unreachable has been reached"];

    abort();
  }

  return v4;
}

- (BOOL)allowsPopOnEmptyBehavior
{
  return PLIsFeaturedContentAllowed() ^ 1;
}

- (BOOL)wantsEmbeddedScrollView
{
  return 1;
}

- (void)handleContentSeen
{
  v2 = [(PXFeedConfiguration *)self dataSourceManager];
  v3 = [v2 dataSource];

  if (handleContentSeen_onceToken != -1) {
    dispatch_once(&handleContentSeen_onceToken, &__block_literal_global_210_229674);
  }
  v4 = handleContentSeen_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PXStoryMemoryFeedConfiguration_handleContentSeen__block_invoke_2;
  block[3] = &unk_1E5DD36F8;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __51__PXStoryMemoryFeedConfiguration_handleContentSeen__block_invoke_2(uint64_t a1)
{
  return +[PXStoryMemoryFeedConfiguration _handleContentSeenForDataSource:*(void *)(a1 + 32)];
}

void __51__PXStoryMemoryFeedConfiguration_handleContentSeen__block_invoke()
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v1 = dispatch_queue_create("PXStoryMemoryFeed.handleContentSeen", v0);
  v2 = (void *)handleContentSeen_queue;
  handleContentSeen_queue = (uint64_t)v1;
}

- (id)objectReferenceForDestination:(id)a3
{
  id v4 = a3;
  id v5 = [(PXFeedConfiguration *)self dataSourceManager];
  v6 = [v5 dataSource];

  id v7 = PXStoryObjectReferenceForDestinationInMemoryDataSource(v4, v6);

  return v7;
}

- (id)copyWithLayoutKind:(int64_t)a3
{
  id v4 = (void *)[(PXStoryMemoryFeedConfiguration *)self copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__PXStoryMemoryFeedConfiguration_copyWithLayoutKind___block_invoke;
  v6[3] = &__block_descriptor_40_e99___PXFeedViewLayoutSpecManager_24__0__PXStoryMemoryFeedConfiguration_8__PXExtendedTraitCollection_16l;
  v6[4] = a3;
  [v4 setSpecManagerPromise:v6];
  return v4;
}

uint64_t __53__PXStoryMemoryFeedConfiguration_copyWithLayoutKind___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 _defaultSpecManagerWithLayoutKind:*(void *)(a1 + 32) extendedTraitCollection:a3];
}

- (id)viewControllerTitle
{
  return PXLocalizedStringFromTable(@"PXMemoriesFeedTitle", @"PhotosUICore");
}

- (PXStoryMemoryFeedConfiguration)initWithDataSourceManagerPromise:(id)a3 layoutKind:(int64_t)a4 photoLibrary:(id)a5 viewControllerSetupBlock:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v11
    && (+[PXStorySettings sharedInstance],
        v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v13 useFeedPlaceholderItems],
        v13,
        !v14))
  {
    v15 = objc_alloc_init(PXStoryMemoryFeedItemLayoutFactory);
    [(PXStoryMemoryFeedItemLayoutFactory *)v15 setLayoutKind:a4];
  }
  else
  {
    v15 = objc_alloc_init(PXFeedDummyItemLayoutFactory);
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __116__PXStoryMemoryFeedConfiguration_initWithDataSourceManagerPromise_layoutKind_photoLibrary_viewControllerSetupBlock___block_invoke;
  v23[3] = &__block_descriptor_40_e99___PXFeedViewLayoutSpecManager_24__0__PXStoryMemoryFeedConfiguration_8__PXExtendedTraitCollection_16l;
  v23[4] = a4;
  v22.receiver = self;
  v22.super_class = (Class)PXStoryMemoryFeedConfiguration;
  v16 = [(PXFeedConfiguration *)&v22 initWithDataSourceManagerPromise:v10 specManagerPromise:v23 itemLayoutFactory:v15];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_photoLibrary, a5);
    v18 = +[PXStoryMemoryFeedConfiguration _photoKitMediaProviderWithPhotoLibrary:v11];
    [(PXFeedConfiguration *)v17 setMediaProvider:v18];

    v19 = [[PXStoryMemoryFeedActionPerformer alloc] initWithViewControllerSetupBlock:v12];
    [(PXFeedConfiguration *)v17 setActionPerformer:v19];
    v20 = objc_alloc_init(PXStoryMemoryFeedPlaceholderFactory);
    [(PXFeedConfiguration *)v17 setPlaceholderFactory:v20];
  }
  return v17;
}

uint64_t __116__PXStoryMemoryFeedConfiguration_initWithDataSourceManagerPromise_layoutKind_photoLibrary_viewControllerSetupBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 _defaultSpecManagerWithLayoutKind:*(void *)(a1 + 32) extendedTraitCollection:a3];
}

- (PXStoryMemoryFeedConfiguration)initWithSyntheticSectionCount:(int64_t)a3 numberOfItemsPerSection:(int64_t)a4 photoLibrary:(id)a5 layoutKind:(int64_t)a6
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __112__PXStoryMemoryFeedConfiguration_initWithSyntheticSectionCount_numberOfItemsPerSection_photoLibrary_layoutKind___block_invoke;
  v10[3] = &__block_descriptor_48_e70___PXSectionedDataSourceManager_16__0__PXStoryMemoryFeedConfiguration_8l;
  v10[4] = a3;
  v10[5] = a4;
  id v7 = [(PXStoryMemoryFeedConfiguration *)self initWithDataSourceManagerPromise:v10 layoutKind:a6 photoLibrary:a5 viewControllerSetupBlock:0];
  id v8 = v7;
  if (v7) {
    [(PXFeedConfiguration *)v7 setShouldEmbedContentLayout:[(PXStoryMemoryFeedConfiguration *)v7 _shouldEmbedContentLayoutForLayoutKind:a6]];
  }
  return v8;
}

PXFeedSyntheticDataSourceManager *__112__PXStoryMemoryFeedConfiguration_initWithSyntheticSectionCount_numberOfItemsPerSection_photoLibrary_layoutKind___block_invoke(uint64_t a1)
{
  dispatch_queue_t v1 = [[PXFeedSyntheticDataSourceManager alloc] initWithNumberOfSections:*(void *)(a1 + 32) numberOfItemsPerSection:*(void *)(a1 + 40)];
  return v1;
}

- (PXStoryMemoryFeedConfiguration)initWithMemoriesInPhotoLibrary:(id)a3 layoutKind:(int64_t)a4 viewControllerSetupBlock:(id)a5 visibleRectChangeObserver:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __127__PXStoryMemoryFeedConfiguration_initWithMemoriesInPhotoLibrary_layoutKind_viewControllerSetupBlock_visibleRectChangeObserver___block_invoke;
  v17[3] = &unk_1E5DC77D0;
  id v12 = v10;
  id v18 = v12;
  v13 = [(PXStoryMemoryFeedConfiguration *)self initWithDataSourceManagerPromise:v17 layoutKind:a4 photoLibrary:v12 viewControllerSetupBlock:a5];
  int v14 = v13;
  if (v13)
  {
    [(PXFeedConfiguration *)v13 setChromeControllerPromise:&__block_literal_global_194_229694];
    [(PXFeedConfiguration *)v14 setShouldEmbedContentLayout:[(PXStoryMemoryFeedConfiguration *)v14 _shouldEmbedContentLayoutForLayoutKind:a4]];
    v15 = (void *)[v11 copy];
    [(PXFeedConfiguration *)v14 setVisibleRectChangeObserver:v15];
  }
  return v14;
}

PXStoryMemoryFeedDataSourceManager *__127__PXStoryMemoryFeedConfiguration_initWithMemoriesInPhotoLibrary_layoutKind_viewControllerSetupBlock_visibleRectChangeObserver___block_invoke(uint64_t a1)
{
  dispatch_queue_t v1 = [[PXStoryMemoryFeedDataSourceManager alloc] initWithPhotoLibrary:*(void *)(a1 + 32)];
  [(PXStoryMemoryFeedDataSourceManager *)v1 performChanges:&__block_literal_global_229699];
  return v1;
}

PXStoryMemoryFeedChromeController *__127__PXStoryMemoryFeedConfiguration_initWithMemoriesInPhotoLibrary_layoutKind_viewControllerSetupBlock_visibleRectChangeObserver___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  v6 = [[PXStoryMemoryFeedChromeController alloc] initWithViewController:v5 dataSourceManager:v4];

  return v6;
}

uint64_t __127__PXStoryMemoryFeedConfiguration_initWithMemoriesInPhotoLibrary_layoutKind_viewControllerSetupBlock_visibleRectChangeObserver___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setIsActive:1];
}

- (PXStoryMemoryFeedConfiguration)initWithMemoriesInPhotoLibrary:(id)a3 layoutKind:(int64_t)a4 viewControllerSetupBlock:(id)a5
{
  return [(PXStoryMemoryFeedConfiguration *)self initWithMemoriesInPhotoLibrary:a3 layoutKind:a4 viewControllerSetupBlock:a5 visibleRectChangeObserver:0];
}

+ (id)_photoKitMediaProviderWithPhotoLibrary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F390D0]);
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v5 = [[PXPhotoKitUIMediaProvider alloc] initWithImageManager:v4 library:v3];

  return v5;
}

+ (void)_handleContentSeenForDataSource:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 allItemsEnumerator];
  if ([v3 count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v13 = v3;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v11 = [v10 assetCollection];
            [v4 addObject:v11];
          }
          else
          {
            id v11 = PLStoryGetLog();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v19 = v10;
              _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_ERROR, "Incorrect dataSource object. Expect PXMemoryInfo got: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v7);
    }

    id v12 = +[PXMemoriesSeenHelper defaultHelper];
    [v12 clearAnyPendingNotificationsFromMemories:v4];
    [v12 clearAnyPendingStateFromMemories:v4];

    id v3 = v13;
  }
}

@end