@interface PUCurationActionAssetBrowserViewController
- (NSMutableArray)assetContainers;
- (PHPhotoLibrary)curationPhotoLibrary;
- (PUCurationTraitContainer)traitContainer;
- (double)globalHeaderHeight;
- (id)_globalHeaderTitle;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (void)_update;
- (void)configureGlobalHeaderView:(id)a3;
- (void)setAssetContainers:(id)a3;
- (void)setCurationPhotoLibrary:(id)a3;
- (void)setTraitContainer:(id)a3;
- (void)setTraitContainer:(id)a3 withFaces:(id)a4 detectionTraitsByFaceLocalIdentifier:(id)a5;
- (void)viewDidLoad;
@end

@implementation PUCurationActionAssetBrowserViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curationPhotoLibrary, 0);
  objc_storeStrong((id *)&self->_traitContainer, 0);
  objc_storeStrong((id *)&self->_assetContainers, 0);
}

- (void)setCurationPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)curationPhotoLibrary
{
  return self->_curationPhotoLibrary;
}

- (void)setTraitContainer:(id)a3
{
}

- (PUCurationTraitContainer)traitContainer
{
  return self->_traitContainer;
}

- (void)setAssetContainers:(id)a3
{
}

- (NSMutableArray)assetContainers
{
  return self->_assetContainers;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v24.receiver = self;
  v24.super_class = (Class)PUCurationActionAssetBrowserViewController;
  id v6 = a4;
  v7 = [(PUPhotosGridViewController *)&v24 collectionView:a3 cellForItemAtIndexPath:v6];
  v8 = [(PUCurationActionAssetBrowserViewController *)self assetContainers];
  uint64_t v9 = [v6 row];

  v10 = [v8 objectAtIndex:v9];

  [v10 score];
  uint64_t v12 = v11;
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"%.3f", v11);
  [v7 setScore:v13];

  v14 = [(PUCurationActionAssetBrowserViewController *)self traitContainer];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PUCurationActionAssetBrowserViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  block[3] = &unk_1E5F2D2C8;
  id v15 = v7;
  uint64_t v23 = v12;
  id v21 = v15;
  v22 = v14;
  id v16 = v14;
  dispatch_async(MEMORY[0x1E4F14428], block);
  v17 = v22;
  id v18 = v15;

  return v18;
}

void __84__PUCurationActionAssetBrowserViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  [*(id *)(a1 + 40) highPrecisionOperatingPoint];
  if (v2 >= v3)
  {
    uint64_t v8 = [MEMORY[0x1E4FB1618] systemGreenColor];
  }
  else
  {
    double v4 = *(double *)(a1 + 48);
    [*(id *)(a1 + 40) operatingPoint];
    if (v4 >= v5)
    {
      uint64_t v8 = [MEMORY[0x1E4FB1618] labelColor];
    }
    else
    {
      double v6 = *(double *)(a1 + 48);
      [*(id *)(a1 + 40) highRecallOperatingPoint];
      if (v6 >= v7) {
        [MEMORY[0x1E4FB1618] systemYellowColor];
      }
      else {
      uint64_t v8 = [MEMORY[0x1E4FB1618] systemRedColor];
      }
    }
  }
  id v9 = (id)v8;
  [*(id *)(a1 + 32) setColor:v8];
}

- (double)globalHeaderHeight
{
  double v3 = [(PUCurationActionAssetBrowserViewController *)self _globalHeaderTitle];
  double v4 = [(PUCurationActionAssetBrowserViewController *)self _existingView];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;

  objc_msgSend(MEMORY[0x1E4F90570], "sizeThatFits:forTitle:", v3, v6, v8);
  double v10 = v9;

  return v10;
}

- (void)configureGlobalHeaderView:(id)a3
{
  id v4 = a3;
  id v5 = [(PUCurationActionAssetBrowserViewController *)self _globalHeaderTitle];
  [v4 setTitle:v5];
}

- (id)_globalHeaderTitle
{
  double v2 = [(PUCurationActionAssetBrowserViewController *)self traitContainer];
  double v3 = NSString;
  [v2 highPrecisionOperatingPoint];
  uint64_t v5 = v4;
  [v2 operatingPoint];
  uint64_t v7 = v6;
  [v2 highRecallOperatingPoint];
  double v9 = [v3 stringWithFormat:@"Green: >= %.3f (HighPrecision), Black/White: >= %.3f (OperatingPoint), Yellow: >= %.3f (HighRecall), Red: else", v5, v7, v8];

  return v9;
}

- (void)_update
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(PUCurationActionAssetBrowserViewController *)self assetContainers];
  uint64_t v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = [(PUCurationActionAssetBrowserViewController *)self assetContainers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v23 + 1) + 8 * v10) asset];
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  uint64_t v12 = (void *)MEMORY[0x1E4F38EE8];
  v13 = [(PUCurationActionAssetBrowserViewController *)self traitContainer];
  v14 = [v13 actionLabel];
  id v15 = [(PUCurationActionAssetBrowserViewController *)self curationPhotoLibrary];
  id v16 = [v12 transientAssetCollectionWithAssets:v5 title:v14 identifier:0 photoLibrary:v15];

  v17 = (void *)MEMORY[0x1E4F39008];
  v27 = v16;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  v19 = [v16 localizedTitle];
  v20 = [v17 transientCollectionListWithCollections:v18 title:v19];

  id v21 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v20 options:0];
  [(PUPhotosAlbumViewController *)self setAssetCollection:v16 fetchResultContainingAssetCollection:v21 filterPredicate:0];
  v22 = [(PUCurationActionAssetBrowserViewController *)self collectionView];
  [v22 reloadData];
}

- (void)setTraitContainer:(id)a3 withFaces:(id)a4 detectionTraitsByFaceLocalIdentifier:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v36 = a5;
  [(PUCurationActionAssetBrowserViewController *)self setTraitContainer:a3];
  uint64_t v9 = [v8 firstObject];
  uint64_t v10 = [v9 photoLibrary];
  [(PUCurationActionAssetBrowserViewController *)self setCurationPhotoLibrary:v10];

  v33 = v8;
  uint64_t v11 = [MEMORY[0x1E4F38EB8] fetchAssetsGroupedByFaceUUIDForFaces:v8];
  uint64_t v12 = [(PUCurationActionAssetBrowserViewController *)self traitContainer];
  int v13 = [v12 value];

  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v34 = self;
  [(PUCurationActionAssetBrowserViewController *)self setAssetContainers:v14];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obuint64_t j = v11;
  uint64_t v15 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v35 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v43 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        v19 = [MEMORY[0x1E4F39050] localIdentifierWithUUID:v18];
        v20 = [v36 objectForKeyedSubscript:v19];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v21 = v20;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v39;
          while (2)
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v39 != v24) {
                objc_enumerationMutation(v21);
              }
              long long v26 = *(void **)(*((void *)&v38 + 1) + 8 * j);
              if ([v26 type] == 1 && objc_msgSend(v26, "value") == v13)
              {
                v27 = objc_alloc_init(PUCurationActionAssetContainer);
                v28 = [obj objectForKeyedSubscript:v18];
                [(PUCurationActionAssetContainer *)v27 setAsset:v28];

                [v26 score];
                -[PUCurationActionAssetContainer setScore:](v27, "setScore:");
                uint64_t v29 = [(PUCurationActionAssetBrowserViewController *)v34 assetContainers];
                [v29 addObject:v27];

                goto LABEL_17;
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v38 objects:v47 count:16];
            if (v23) {
              continue;
            }
            break;
          }
        }
LABEL_17:
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v16);
  }

  v30 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"score" ascending:0];
  v31 = [(PUCurationActionAssetBrowserViewController *)v34 assetContainers];
  v46 = v30;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
  [v31 sortUsingDescriptors:v32];

  if ([(PUCurationActionAssetBrowserViewController *)v34 isViewLoaded]) {
    [(PUCurationActionAssetBrowserViewController *)v34 _update];
  }
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PUCurationActionAssetBrowserViewController;
  [(PUPhotosAlbumViewController *)&v4 viewDidLoad];
  id v3 = [(PUCurationActionAssetBrowserViewController *)self collectionView];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PUPhotoCell"];

  [(PUCurationActionAssetBrowserViewController *)self _update];
}

@end