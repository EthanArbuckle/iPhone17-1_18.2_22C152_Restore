@interface PXPeoplePersonDataSource
- (PXPeopleDataSourceSection)dataSourceSection;
- (PXPeoplePersonDataSource)initWithName:(id)a3 personFetchType:(unint64_t)a4;
- (PXPeoplePersonDataSource)initWithName:(id)a3 personFetchType:(unint64_t)a4 fetchLimit:(unint64_t)a5;
- (id)_applyChanges:(id)a3;
- (id)_assetForFace:(id)a3;
- (id)_faceForPerson:(id)a3;
- (id)_fetchResultForFetchType:(unint64_t)a3 fetchOptions:(id)a4;
- (id)_itemsArrayFromObjects:(id)a3;
- (id)_membersForModelObjects:(id)a3;
- (id)faceTileAtIndex:(int64_t)a3;
- (id)generateFetchResult;
- (id)titleAtIndex:(unint64_t)a3;
- (int64_t)_personTypeForFetchType:(unint64_t)a3;
- (unint64_t)personFetchType;
- (void)_asyncLoadImageForItem:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 resultHandler:(id)a6;
- (void)_cacheFacesAndAssets;
- (void)cancelImageLoadingForItem:(id)a3;
- (void)loadObjectsAndUpdateMembersWithCompletion:(id)a3;
- (void)photoLibraryDidChange:(id)a3;
- (void)setDataSourceSection:(id)a3;
- (void)setPersonFetchType:(unint64_t)a3;
- (void)startListeningForChanges;
- (void)stopListeningForChanges;
- (void)updateKeyFace:(id)a3 forPerson:(id)a4;
@end

@implementation PXPeoplePersonDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceSection, 0);
  objc_storeStrong((id *)&self->_assetsByFaces, 0);
  objc_storeStrong((id *)&self->_keyFaceByPersonLocalIdentifier, 0);
}

- (void)setDataSourceSection:(id)a3
{
}

- (PXPeopleDataSourceSection)dataSourceSection
{
  return self->_dataSourceSection;
}

- (void)setPersonFetchType:(unint64_t)a3
{
  self->_personFetchType = a3;
}

- (unint64_t)personFetchType
{
  return self->_personFetchType;
}

- (id)_assetForFace:(id)a3
{
  v4 = [a3 uuid];
  v5 = [(NSDictionary *)self->_assetsByFaces objectForKeyedSubscript:v4];

  return v5;
}

- (id)_faceForPerson:(id)a3
{
  v4 = [a3 localIdentifier];
  v5 = [(NSMutableDictionary *)self->_keyFaceByPersonLocalIdentifier objectForKeyedSubscript:v4];

  return v5;
}

- (id)faceTileAtIndex:(int64_t)a3
{
  v4 = [(PXPeopleDataSource *)self personAtIndex:a3];
  v5 = [(PXPeoplePersonDataSource *)self _faceForPerson:v4];
  v6 = [(PXPeoplePersonDataSource *)self _assetForFace:v5];
  v7 = [[PXPeopleFaceTile alloc] initWithFace:v5 asset:v6 person:v4];

  return v7;
}

- (void)updateKeyFace:(id)a3 forPerson:(id)a4
{
  id v8 = a3;
  v6 = [a4 localIdentifier];
  if (v6)
  {
    keyFaceByPersonLocalIdentifier = self->_keyFaceByPersonLocalIdentifier;
    if (v8) {
      [(NSMutableDictionary *)keyFaceByPersonLocalIdentifier setObject:v8 forKey:v6];
    }
    else {
      [(NSMutableDictionary *)keyFaceByPersonLocalIdentifier removeObjectForKey:v6];
    }
  }
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4 = a3;
  v5 = [(PXPeopleDataSource *)self objects];
  v6 = (void *)MEMORY[0x1E4F1C978];
  v7 = [(PXPeopleDataSource *)self members];
  id v8 = [v6 arrayWithArray:v7];

  v9 = [v4 changeDetailsForFetchResult:v5];
  if (v9)
  {
    v10 = [(PXPeoplePersonDataSource *)self _applyChanges:v9];
    v11 = [(PXPeopleDataSource *)self members];
    v12 = [(PXPeopleDataSource *)self delegate];
    if (v12)
    {
      v13 = [off_1E5DA5568 changeDetailsFromArray:v8 toArray:v11 changedObjects:v10];
      if ([v13 hasAnyChanges])
      {
        objc_initWeak(&location, self);
        v12;
        objc_copyWeak(&v14, &location);
        v13;
        px_dispatch_on_main_queue();
      }
    }
  }
}

void __50__PXPeoplePersonDataSource_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [v2 peopleDataSource:WeakRetained didApplyIncrementalChanges:*(void *)(a1 + 40)];
}

- (id)generateFetchResult
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F390A0];
  id v4 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v5 = [v3 fetchOptionsWithPhotoLibrary:v4 orObject:0];

  v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"manualOrder" ascending:1];
  v13[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v5 setSortDescriptors:v7];

  uint64_t v12 = *MEMORY[0x1E4F397E0];
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  [v5 setFetchPropertySets:v8];

  v9 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
  [v5 setIncludedDetectionTypes:v9];

  v10 = [(PXPeoplePersonDataSource *)self _fetchResultForFetchType:[(PXPeoplePersonDataSource *)self personFetchType] fetchOptions:v5];

  return v10;
}

- (void)cancelImageLoadingForItem:(id)a3
{
  id v6 = a3;
  uint64_t v3 = [v6 faceImageRequestID];
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = +[PXPeopleFaceCropManager sharedManager];
    [v5 cancelRequestForRequestID:v4];

    [v6 setFaceImageRequestID:0];
  }
}

- (void)_asyncLoadImageForItem:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 resultHandler:(id)a6
{
  double width = a4.width;
  id v10 = a3;
  v11 = (void (**)(id, uint64_t, void, double, double, double, double))a6;
  uint64_t v12 = [v10 faceImage];
  v13 = (void *)v12;
  if (v11 && v12) {
    v11[2](v11, v12, 0, *(double *)off_1E5DAB010, *((double *)off_1E5DAB010 + 1), *((double *)off_1E5DAB010 + 2), *((double *)off_1E5DAB010 + 3));
  }
  [v10 setResultHandler:v11];
  uint64_t v14 = [v10 faceImageRequestID];
  v15 = +[PXPeopleFaceCropManager sharedManager];
  if (([v15 isRequestActiveWithRequestID:v14] & 1) == 0)
  {
    v16 = [v10 modelObject];
    v17 = [(PXPeoplePersonDataSource *)self _faceForPerson:v16];
    v18 = [PXPeopleFaceCropFetchOptions alloc];
    if (v17)
    {
      v19 = -[PXPeopleFaceCropFetchOptions initWithPerson:face:targetSize:displayScale:](v18, "initWithPerson:face:targetSize:displayScale:", v16, v17, width, width, a5);
      v20 = [(PXPeoplePersonDataSource *)self _assetForFace:v17];
      [(PXPeopleFaceCropFetchOptions *)v19 setAsset:v20];
    }
    else
    {
      v19 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:](v18, "initWithPerson:targetSize:displayScale:", v16, width, width, a5);
    }
    [(PXPeopleFaceCropFetchOptions *)v19 setCornerStyle:2];
    [(PXPeopleFaceCropFetchOptions *)v19 setCropFactor:0];
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3042000000;
    v22[3] = __Block_byref_object_copy__280751;
    v22[4] = __Block_byref_object_dispose__280752;
    objc_initWeak(&v23, v10);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __89__PXPeoplePersonDataSource__asyncLoadImageForItem_targetSize_displayScale_resultHandler___block_invoke;
    v21[3] = &unk_1E5DD00D8;
    v21[4] = v22;
    objc_msgSend(v10, "setFaceImageRequestID:", objc_msgSend(v15, "requestFaceCropForOptions:resultHandler:", v19, v21));
    _Block_object_dispose(v22, 8);
    objc_destroyWeak(&v23);
  }
}

void __89__PXPeoplePersonDataSource__asyncLoadImageForItem_targetSize_displayScale_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
    [v7 setFaceImage:v19];
    id v8 = [v7 resultHandler];
    if (v8)
    {
      v9 = [v5 objectForKeyedSubscript:@"PXPeopleContentsRectKey"];
      [v9 CGRectValue];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      v18 = [v5 objectForKeyedSubscript:@"PXPeopleErrorKey"];
      ((void (**)(void, id, void *, double, double, double, double))v8)[2](v8, v19, v18, v11, v13, v15, v17);
    }
  }
}

- (id)_membersForModelObjects:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  id v6 = [(PXPeopleDataSource *)self members];
  id v7 = [(PXPeopleDataSource *)self persons];
  unint64_t v8 = [v6 count];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        unint64_t v14 = objc_msgSend(v7, "indexOfObject:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        if (v14 < v8)
        {
          double v15 = [v6 objectAtIndex:v14];
          [v5 addObject:v15];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  return v5;
}

- (id)_applyChanges:(id)a3
{
  id v4 = a3;
  id v5 = [v4 fetchResultAfterChanges];
  [(PXPeopleDataSource *)self _setObjectsWithoutUpdate:v5];

  id v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = [(PXPeopleDataSource *)self members];
  unint64_t v8 = [v6 arrayWithArray:v7];

  id v9 = [v4 removedObjects];
  if ([v9 count])
  {
    uint64_t v10 = [(PXPeoplePersonDataSource *)self _membersForModelObjects:v9];

    [v8 removeObjectsInArray:v10];
    id v9 = (void *)v10;
  }
  uint64_t v11 = [v4 insertedObjects];
  if ([v11 count])
  {
    uint64_t v12 = [(PXPeoplePersonDataSource *)self _itemsArrayFromObjects:v11];

    [v8 addObjectsFromArray:v12];
    uint64_t v11 = (void *)v12;
  }
  double v13 = [v4 changedObjects];
  if ([v13 count])
  {
    unint64_t v14 = [(PXPeoplePersonDataSource *)self _membersForModelObjects:v13];
    if ([v14 count])
    {
      unint64_t v15 = 0;
      do
      {
        double v16 = [v14 objectAtIndexedSubscript:v15];
        long long v17 = [v13 objectAtIndexedSubscript:v15];
        [v16 updateWithModel:v17];

        ++v15;
      }
      while (v15 < [v14 count]);
    }
  }
  else
  {
    unint64_t v14 = (void *)MEMORY[0x1E4F1CBF0];
  }
  long long v18 = [(PXPeopleDataSource *)self filterPredicate];
  if (v18) {
    [v8 filterUsingPredicate:v18];
  }
  long long v19 = [(PXPeopleDataSource *)self sortComparator];
  if (v19) {
    [v8 sortUsingComparator:v19];
  }
  [(PXPeopleDataSource *)self setMembers:v8];

  return v14;
}

- (int64_t)_personTypeForFetchType:(unint64_t)a3
{
  return a3 == 0;
}

- (id)_fetchResultForFetchType:(unint64_t)a3 fetchOptions:(id)a4
{
  id v5 = a4;
  [v5 setPersonContext:1];
  id v6 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
  [v5 setIncludedDetectionTypes:v6];

  switch(a3)
  {
    case 0uLL:
      id v7 = (void *)MEMORY[0x1E4F391F0];
      uint64_t v8 = 1;
      goto LABEL_6;
    case 2uLL:
      uint64_t v9 = [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v5];
      goto LABEL_8;
    case 1uLL:
      id v7 = (void *)MEMORY[0x1E4F391F0];
      uint64_t v8 = 0;
LABEL_6:
      uint64_t v9 = [v7 fetchPersonsWithType:v8 options:v5];
LABEL_8:
      uint64_t v10 = (void *)v9;
      goto LABEL_10;
  }
  uint64_t v10 = 0;
LABEL_10:

  return v10;
}

- (id)_itemsArrayFromObjects:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
        id v10 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [PXPersonItem alloc];
        uint64_t v12 = -[PXPersonItem initWithPerson:](v11, "initWithPerson:", v10, (void)v14);

        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)titleAtIndex:(unint64_t)a3
{
  id v4 = [(PXPeopleDataSource *)self personAtIndex:a3];
  id v5 = objc_msgSend(v4, "px_localizedName");
  uint64_t v6 = v5;
  if (self->_showUUIDIfNoName && ![v5 length])
  {
    uint64_t v7 = [v4 uuid];
    uint64_t v8 = [v7 substringToIndex:8];

    uint64_t v6 = (void *)v8;
  }

  return v6;
}

- (void)_cacheFacesAndAssets
{
  id v12 = [(PXPeopleDataSource *)self persons];
  unint64_t v3 = [v12 count];
  if (v3)
  {
    if (v3 >= 0x1C) {
      uint64_t v4 = 28;
    }
    else {
      uint64_t v4 = v3;
    }
    id v5 = objc_msgSend(v12, "subarrayWithRange:", 0, v4);
    uint64_t v6 = [MEMORY[0x1E4F39050] fetchKeyFaceByPersonLocalIdentifierForPersons:v5 options:0];
    uint64_t v7 = (NSMutableDictionary *)[v6 mutableCopy];
    keyFaceByPersonLocalIdentifier = self->_keyFaceByPersonLocalIdentifier;
    self->_keyFaceByPersonLocalIdentifier = v7;

    uint64_t v9 = [(NSMutableDictionary *)self->_keyFaceByPersonLocalIdentifier allValues];
    id v10 = [MEMORY[0x1E4F38EB8] fetchAssetsGroupedByFaceUUIDForFaces:v9];
    assetsByFaces = self->_assetsByFaces;
    self->_assetsByFaces = v10;
  }
}

- (void)loadObjectsAndUpdateMembersWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PXPeoplePersonDataSource_loadObjectsAndUpdateMembersWithCompletion___block_invoke;
  aBlock[3] = &unk_1E5DD1848;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  uint64_t v6 = _Block_copy(aBlock);
  v7.receiver = self;
  v7.super_class = (Class)PXPeoplePersonDataSource;
  [(PXPeopleDataSource *)&v7 loadObjectsAndUpdateMembersWithCompletion:v6];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

uint64_t __70__PXPeoplePersonDataSource_loadObjectsAndUpdateMembersWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _cacheFacesAndAssets];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)stopListeningForChanges
{
  objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 unregisterChangeObserver:self];
}

- (void)startListeningForChanges
{
  objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 registerChangeObserver:self];
}

- (PXPeoplePersonDataSource)initWithName:(id)a3 personFetchType:(unint64_t)a4 fetchLimit:(unint64_t)a5
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__PXPeoplePersonDataSource_initWithName_personFetchType_fetchLimit___block_invoke;
  v11[3] = &unk_1E5DD0C30;
  unint64_t v13 = a5;
  id v12 = self;
  unint64_t v14 = a4;
  v10.receiver = v12;
  v10.super_class = (Class)PXPeoplePersonDataSource;
  objc_super v7 = [(PXPeopleDataSource *)&v10 initWithName:a3 objectsReloadBlock:v11];
  uint64_t v8 = v7;
  if (v7) {
    v7->_personFetchType = a4;
  }

  return v8;
}

id __68__PXPeoplePersonDataSource_initWithName_personFetchType_fetchLimit___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F390A0];
  id v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v4 = [v2 fetchOptionsWithPhotoLibrary:v3 orObject:0];

  [v4 setFetchLimit:*(void *)(a1 + 40)];
  id v5 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
  [v4 setIncludedDetectionTypes:v5];

  uint64_t v6 = [*(id *)(a1 + 32) _fetchResultForFetchType:*(void *)(a1 + 48) fetchOptions:v4];

  return v6;
}

- (PXPeoplePersonDataSource)initWithName:(id)a3 personFetchType:(unint64_t)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F39150];
  id v7 = a3;
  id v8 = [v6 alloc];
  id v9 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  objc_super v10 = [MEMORY[0x1E4F391F0] fetchType];
  uint64_t v11 = (void *)[v8 initWithOids:MEMORY[0x1E4F1CBF0] photoLibrary:v9 fetchType:v10 fetchPropertySets:0 identifier:0 registerIfNeeded:0];

  v18.receiver = self;
  v18.super_class = (Class)PXPeoplePersonDataSource;
  id v12 = [(PXPeopleDataSource *)&v18 initWithName:v7 objects:v11];

  if (v12)
  {
    v12->_personFetchType = a4;
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    keyFaceByPersonLocalIdentifier = v12->_keyFaceByPersonLocalIdentifier;
    v12->_keyFaceByPersonLocalIdentifier = (NSMutableDictionary *)v13;

    assetsByFaces = v12->_assetsByFaces;
    v12->_assetsByFaces = (NSDictionary *)MEMORY[0x1E4F1CC08];

    long long v16 = +[PXPeopleUISettings sharedInstance];
    v12->_showUUIDIfNoName = [v16 showUUIDIfNoName];
  }
  return v12;
}

@end