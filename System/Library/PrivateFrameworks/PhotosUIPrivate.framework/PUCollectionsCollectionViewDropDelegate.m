@interface PUCollectionsCollectionViewDropDelegate
- (BOOL)_allowDrop;
- (BOOL)_canHandleDropSession:(id)a3;
- (BOOL)collectionView:(id)a3 canHandleDropSesson:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5;
- (PUCollectionsCollectionViewDropDataProvider)dropDataProvider;
- (id)_collectionAtIndexPath:(id)a3;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (void)_handleDrop:(id)a3 forItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)setDropDataProvider:(id)a3;
@end

@implementation PUCollectionsCollectionViewDropDelegate

- (void).cxx_destruct
{
}

- (void)setDropDataProvider:(id)a3
{
}

- (PUCollectionsCollectionViewDropDataProvider)dropDataProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dropDataProvider);
  return (PUCollectionsCollectionViewDropDataProvider *)WeakRetained;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEBUG, "_collectionView: %@ performDropWithCoordinator: %@", (uint8_t *)&v11, 0x16u);
  }

  v9 = [v7 session];
  v10 = [v7 destinationIndexPath];
  [(PUCollectionsCollectionViewDropDelegate *)self _handleDrop:v9 forItemAtIndexPath:v10];
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138412802;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_DEBUG, "_collectionView: %@ dropSessionDidUpdate:%@ withDestinationIndexPath: %@", (uint8_t *)&v19, 0x20u);
  }

  id v12 = [(PUCollectionsCollectionViewDropDelegate *)self _collectionAtIndexPath:v10];
  uint64_t v13 = objc_msgSend(v12, "px_assetsDropMode");
  if (v13 == 1 || v13 == 2 && PXDropSessionHasItemsNeedingImport())
  {
    id v14 = objc_alloc(MEMORY[0x1E4FB15B8]);
    uint64_t v15 = 2;
    uint64_t v16 = 2;
  }
  else
  {
    id v14 = objc_alloc(MEMORY[0x1E4FB15B8]);
    uint64_t v15 = 1;
    uint64_t v16 = 0;
  }
  v17 = (void *)[v14 initWithDropOperation:v15 intent:v16];

  return v17;
}

- (BOOL)collectionView:(id)a3 canHandleDropSesson:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEBUG, "_collectionView: %@ canHandleDropSesson: %@ ", (uint8_t *)&v11, 0x16u);
  }

  BOOL v9 = [(PUCollectionsCollectionViewDropDelegate *)self _canHandleDropSession:v7];
  return v9;
}

- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  id v6 = [(PUCollectionsCollectionViewDropDelegate *)self _collectionAtIndexPath:a4];
  BOOL v7 = [(PUCollectionsCollectionViewDropDelegate *)self _allowDrop];
  id v8 = [MEMORY[0x1E4F90110] sharedInstance];
  int v9 = [v8 springLoadingEnabled];

  char v10 = 0;
  if (v7 && v9) {
    char v10 = objc_msgSend(v6, "px_allowsSpringLoading");
  }

  return v10;
}

- (void)_handleDrop:(id)a3 forItemAtIndexPath:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEBUG, "_handleDrop: %@", (uint8_t *)&v13, 0xCu);
  }

  int v9 = [(PUCollectionsCollectionViewDropDelegate *)self _collectionAtIndexPath:v7];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v9)
  {
    char v10 = [MEMORY[0x1E4F90440] dropAssetsActionPerformerForAssetCollection:v9 dropSession:v6];
    int v11 = [(PUCollectionsCollectionViewDropDelegate *)self dropDataProvider];
    id v12 = [v11 actionPerformerDelegateForCollectionViewDropDelegate:self];
    [v10 setDelegate:v12];

    [v10 performActionWithCompletionHandler:0];
  }
}

- (BOOL)_canHandleDropSession:(id)a3
{
  id v4 = a3;
  if ([(PUCollectionsCollectionViewDropDelegate *)self _allowDrop])
  {
    v5 = [MEMORY[0x1E4F902C8] supportedTypeIdentifiers];
    char v6 = [v4 hasItemsConformingToTypeIdentifiers:v5];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)_collectionAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(PUCollectionsCollectionViewDropDelegate *)self dropDataProvider];
  char v6 = [v5 collectionViewDropDelegate:self collectionAtIndexPath:v4];

  return v6;
}

- (BOOL)_allowDrop
{
  v3 = [(PUCollectionsCollectionViewDropDelegate *)self dropDataProvider];
  id v4 = v3;
  if (!self->_dataProviderImplementsAllowDrop || v3 == 0) {
    char v6 = 1;
  }
  else {
    char v6 = [v3 allowDropForCollectionViewDropDelegate:self];
  }

  return v6;
}

@end