@interface PUCurationActionPeopleBrowserViewController
- (NSMutableDictionary)detectionTraitsByFaceLocalIdentifierByPersonLocalIdentifier;
- (NSMutableDictionary)facesByPersonLocalIdentifier;
- (PUCurationActionAssetBrowserViewController)assetBrowserViewController;
- (PUCurationActionPeopleBrowserViewController)initWithTraitContainer:(id)a3;
- (PUCurationTraitContainer)traitContainer;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setAssetBrowserViewController:(id)a3;
- (void)setDetectionTraitsByFaceLocalIdentifierByPersonLocalIdentifier:(id)a3;
- (void)setFacesByPersonLocalIdentifier:(id)a3;
- (void)setTraitContainer:(id)a3;
@end

@implementation PUCurationActionPeopleBrowserViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectionTraitsByFaceLocalIdentifierByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_facesByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_assetBrowserViewController, 0);
  objc_storeStrong((id *)&self->_traitContainer, 0);
}

- (void)setDetectionTraitsByFaceLocalIdentifierByPersonLocalIdentifier:(id)a3
{
}

- (NSMutableDictionary)detectionTraitsByFaceLocalIdentifierByPersonLocalIdentifier
{
  return self->_detectionTraitsByFaceLocalIdentifierByPersonLocalIdentifier;
}

- (void)setFacesByPersonLocalIdentifier:(id)a3
{
}

- (NSMutableDictionary)facesByPersonLocalIdentifier
{
  return self->_facesByPersonLocalIdentifier;
}

- (void)setAssetBrowserViewController:(id)a3
{
}

- (PUCurationActionAssetBrowserViewController)assetBrowserViewController
{
  return self->_assetBrowserViewController;
}

- (void)setTraitContainer:(id)a3
{
}

- (PUCurationTraitContainer)traitContainer
{
  return self->_traitContainer;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(PXPeopleDetailSettingsViewController *)self dataSource];
  uint64_t v7 = [v5 row];

  id v18 = [v6 personAtIndex:v7];

  v8 = [(PUCurationActionPeopleBrowserViewController *)self facesByPersonLocalIdentifier];
  v9 = [v18 localIdentifier];
  v10 = [v8 objectForKeyedSubscript:v9];

  v11 = [(PUCurationActionPeopleBrowserViewController *)self detectionTraitsByFaceLocalIdentifierByPersonLocalIdentifier];
  v12 = [v18 localIdentifier];
  v13 = [v11 objectForKeyedSubscript:v12];

  v14 = [(PUCurationActionPeopleBrowserViewController *)self assetBrowserViewController];
  v15 = [(PUCurationActionPeopleBrowserViewController *)self traitContainer];
  [v14 setTraitContainer:v15 withFaces:v10 detectionTraitsByFaceLocalIdentifier:v13];

  v16 = [(PUCurationActionPeopleBrowserViewController *)self navigationController];
  v17 = [(PUCurationActionPeopleBrowserViewController *)self assetBrowserViewController];
  [v16 pushViewController:v17 animated:1];
}

- (PUCurationActionPeopleBrowserViewController)initWithTraitContainer:(id)a3
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PUCurationActionPeopleBrowserViewController_initWithTraitContainer___block_invoke;
  aBlock[3] = &unk_1E5F22208;
  id v6 = v5;
  id v24 = v6;
  uint64_t v7 = self;
  v25 = v7;
  v8 = _Block_copy(aBlock);
  v22.receiver = v7;
  v22.super_class = (Class)PUCurationActionPeopleBrowserViewController;
  v9 = [(PXPeopleDetailSettingsViewController *)&v22 initWithDataSourceReloadBlock:v8];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_traitContainer, a3);
    v11 = [v6 actionLabel];
    [(PUCurationActionPeopleBrowserViewController *)v10 setTitle:v11];

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    facesByPersonLocalIdentifier = v10->_facesByPersonLocalIdentifier;
    v10->_facesByPersonLocalIdentifier = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    detectionTraitsByFaceLocalIdentifierByPersonLocalIdentifier = v10->_detectionTraitsByFaceLocalIdentifierByPersonLocalIdentifier;
    v10->_detectionTraitsByFaceLocalIdentifierByPersonLocalIdentifier = v14;

    v16 = [(PUCurationActionPeopleBrowserViewController *)v10 px_extendedTraitCollection];
    [v16 userInterfaceIdiom];
    objc_opt_class();

    v17 = [PUCurationActionAssetBrowserViewController alloc];
    id v18 = objc_opt_new();
    uint64_t v19 = [(PUPhotosAlbumViewController *)v17 initWithSpec:v18];
    assetBrowserViewController = v10->_assetBrowserViewController;
    v10->_assetBrowserViewController = (PUCurationActionAssetBrowserViewController *)v19;
  }
  return v10;
}

id __70__PUCurationActionPeopleBrowserViewController_initWithTraitContainer___block_invoke(uint64_t a1)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  v40 = objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
  v36 = [v40 librarySpecificFetchOptions];
  v2 = objc_msgSend(MEMORY[0x1E4F391F0], "fetchPersonsWithOptions:");
  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  obuint64_t j = v2;
  uint64_t v42 = [obj countByEnumeratingWithState:&v63 objects:v70 count:16];
  if (v42)
  {
    uint64_t v39 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v42; ++i)
      {
        if (*(void *)v64 != v39) {
          objc_enumerationMutation(obj);
        }
        v4 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        id v5 = (void *)MEMORY[0x1B3E7C430]();
        id v6 = [v40 librarySpecificFetchOptions];
        uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"detectionTraits.@count > 0"];
        [v6 setInternalPredicate:v7];

        v8 = [MEMORY[0x1E4F39050] fetchFacesForPerson:v4 options:v6];
        if ([v8 count])
        {
          v41 = v4;
          v44 = v6;
          v45 = v5;
          uint64_t v46 = i;
          v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v8, "count"));
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          v43 = v8;
          id v10 = v8;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v59 objects:v69 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v60;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v60 != v13) {
                  objc_enumerationMutation(v10);
                }
                v15 = *(void **)(*((void *)&v59 + 1) + 8 * j);
                v16 = [v15 localIdentifier];
                [v9 setObject:v15 forKeyedSubscript:v16];
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v59 objects:v69 count:16];
            }
            while (v12);
          }

          id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v18 = [MEMORY[0x1E4F39038] detectionTraitsByFaceLocalIdentifierForFaces:v10 withDetectionTraitTypes:&unk_1F078AB80];
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          id v47 = [v18 allKeys];
          uint64_t v50 = [v47 countByEnumeratingWithState:&v55 objects:v68 count:16];
          if (v50)
          {
            uint64_t v48 = *(void *)v56;
            v49 = v18;
            do
            {
              for (uint64_t k = 0; k != v50; ++k)
              {
                if (*(void *)v56 != v48) {
                  objc_enumerationMutation(v47);
                }
                uint64_t v20 = *(void *)(*((void *)&v55 + 1) + 8 * k);
                v21 = [v18 objectForKeyedSubscript:v20];
                long long v51 = 0u;
                long long v52 = 0u;
                long long v53 = 0u;
                long long v54 = 0u;
                uint64_t v22 = [v21 countByEnumeratingWithState:&v51 objects:v67 count:16];
                if (v22)
                {
                  uint64_t v23 = v22;
                  uint64_t v24 = *(void *)v52;
                  do
                  {
                    for (uint64_t m = 0; m != v23; ++m)
                    {
                      if (*(void *)v52 != v24) {
                        objc_enumerationMutation(v21);
                      }
                      v26 = *(void **)(*((void *)&v51 + 1) + 8 * m);
                      if ([v26 type] == 1)
                      {
                        int v27 = [v26 value];
                        if (v27 == [*(id *)(a1 + 32) value])
                        {
                          v28 = [v9 objectForKeyedSubscript:v20];
                          [v17 addObject:v28];
                        }
                      }
                    }
                    uint64_t v23 = [v21 countByEnumeratingWithState:&v51 objects:v67 count:16];
                  }
                  while (v23);
                }

                id v18 = v49;
              }
              uint64_t v50 = [v47 countByEnumeratingWithState:&v55 objects:v68 count:16];
            }
            while (v50);
          }

          if ([v17 count])
          {
            [v37 addObject:v41];
            v29 = [*(id *)(a1 + 40) facesByPersonLocalIdentifier];
            v30 = [v41 localIdentifier];
            [v29 setObject:v17 forKeyedSubscript:v30];

            v31 = [*(id *)(a1 + 40) detectionTraitsByFaceLocalIdentifierByPersonLocalIdentifier];
            v32 = [v41 localIdentifier];
            [v31 setObject:v18 forKeyedSubscript:v32];
          }
          id v5 = v45;
          uint64_t i = v46;
          v8 = v43;
          id v6 = v44;
        }
      }
      uint64_t v42 = [obj countByEnumeratingWithState:&v63 objects:v70 count:16];
    }
    while (v42);
  }

  id v33 = objc_alloc(MEMORY[0x1E4F39150]);
  v34 = (void *)[v33 initWithObjects:v37 photoLibrary:v40 fetchType:*MEMORY[0x1E4F39670] fetchPropertySets:0 identifier:0 registerIfNeeded:0];

  return v34;
}

@end