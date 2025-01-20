@interface PXPeopleRecoDataSource
- (BOOL)hasAnyRejectedItems;
- (BOOL)isIndexRejected:(unint64_t)a3;
- (BOOL)isUsingMockedData;
- (BOOL)shouldAllowCommitting;
- (BOOL)toggleRejectionForIndex:(unint64_t)a3;
- (NSMutableIndexSet)rejectedFaceCropIndexes;
- (NSMutableIndexSet)rejectedFaceIndexes;
- (OS_dispatch_queue)processingQueue;
- (PHFetchResult)faceCrops;
- (PHFetchResult)faces;
- (PHPerson)person;
- (PXPeopleRecoDataSource)initWithPerson:(id)a3 dataSourceDelegate:(id)a4;
- (PXPeopleRecoDataSourceDelegate)dataSourceDelegate;
- (unint64_t)numberOfItems;
- (void)_clearIndexes;
- (void)_fetchEverythingForPerson:(id)a3;
- (void)commitChanges;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3;
- (void)requestImageForItemAtIndex:(unint64_t)a3 targetSize:(CGSize)a4 displayScale:(double)a5 imageBlock:(id)a6;
- (void)setFaceCrops:(id)a3;
- (void)setFaces:(id)a3;
- (void)setPerson:(id)a3;
- (void)setProcessingQueue:(id)a3;
@end

@implementation PXPeopleRecoDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_rejectedFaceCropIndexes, 0);
  objc_storeStrong((id *)&self->_rejectedFaceIndexes, 0);
  objc_storeStrong((id *)&self->_faceCrops, 0);
  objc_storeStrong((id *)&self->_faces, 0);
  objc_destroyWeak((id *)&self->_dataSourceDelegate);
  objc_storeStrong((id *)&self->_person, 0);
}

- (BOOL)isUsingMockedData
{
  return self->_isUsingMockedData;
}

- (void)setProcessingQueue:(id)a3
{
}

- (NSMutableIndexSet)rejectedFaceCropIndexes
{
  return self->_rejectedFaceCropIndexes;
}

- (NSMutableIndexSet)rejectedFaceIndexes
{
  return self->_rejectedFaceIndexes;
}

- (void)setFaceCrops:(id)a3
{
}

- (PHFetchResult)faceCrops
{
  return self->_faceCrops;
}

- (void)setFaces:(id)a3
{
}

- (PHFetchResult)faces
{
  return self->_faces;
}

- (PXPeopleRecoDataSourceDelegate)dataSourceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSourceDelegate);
  return (PXPeopleRecoDataSourceDelegate *)WeakRetained;
}

- (void)setPerson:(id)a3
{
}

- (PHPerson)person
{
  return self->_person;
}

- (void)_clearIndexes
{
  v3 = [(PXPeopleRecoDataSource *)self rejectedFaceIndexes];
  [v3 removeAllIndexes];

  v4 = [(PXPeopleRecoDataSource *)self rejectedFaceCropIndexes];
  [v4 removeAllIndexes];

  id v5 = [(PXPeopleRecoDataSource *)self dataSourceDelegate];
  [v5 recoDataSourceDataChanged:self];
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v22 = a3;
  id v5 = [(PXPeopleRecoDataSource *)self person];
  v6 = [v22 changeDetailsForObject:v5];

  v7 = [v6 objectAfterChanges];
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      v21 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
      [v18 handleFailureInMethod:a2, self, @"PXPeopleRecoDataSource.m", 235, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"personChangeDetails.objectAfterChanges", v20, v21 object file lineNumber description];
    }
  }
  if ([v7 verifiedType] == -2)
  {
    v8 = [MEMORY[0x1E4F390A0] fetchOptionsWithPhotoLibrary:0 orObject:v7];
    v9 = (void *)MEMORY[0x1E4F391F0];
    v10 = [v7 uuid];
    v11 = [v9 fetchFinalMergeTargetPersonsForPersonWithUUID:v10 options:v8];
    v12 = [v11 firstObject];

    [(PXPeopleRecoDataSource *)self setPerson:v12];
    [(PXPeopleRecoDataSource *)self _fetchEverythingForPerson:v12];
  }
  else
  {
    v13 = [(PXPeopleRecoDataSource *)self faces];
    v8 = [v22 changeDetailsForFetchResult:v13];

    if (v8)
    {
      v14 = [v8 fetchResultAfterChanges];
      [(PXPeopleRecoDataSource *)self setFaces:v14];
    }
    v15 = [(PXPeopleRecoDataSource *)self faceCrops];
    v12 = [v22 changeDetailsForFetchResult:v15];

    if (v12)
    {
      v16 = [v12 fetchResultAfterChanges];
      [(PXPeopleRecoDataSource *)self setFaceCrops:v16];
    }
    else
    {
      v17 = 0;
      if (!v8) {
        goto LABEL_12;
      }
    }
  }
  [(PXPeopleRecoDataSource *)self _clearIndexes];
  v17 = v8;
LABEL_12:
}

- (OS_dispatch_queue)processingQueue
{
  p_processingQueue = &self->_processingQueue;
  v3 = self->_processingQueue;
  if (!v3)
  {
    v4 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_USER_INITIATED, 0);
    v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.photos.people.manageTags.processing", v4);

    objc_storeStrong((id *)p_processingQueue, v3);
  }
  return v3;
}

- (void)commitChanges
{
  if ([(PXPeopleRecoDataSource *)self hasAnyRejectedItems]
    && ![(PXPeopleRecoDataSource *)self isUsingMockedData])
  {
    v3 = +[PXPeopleUISettings sharedInstance];
    char v4 = [v3 enableReviewPhotosDemoMode];

    if ((v4 & 1) == 0)
    {
      id v5 = [(PXPeopleRecoDataSource *)self faces];
      v6 = [(PXPeopleRecoDataSource *)self rejectedFaceIndexes];
      v7 = [v5 objectsAtIndexes:v6];

      v8 = [(PXPeopleRecoDataSource *)self faceCrops];
      v9 = [(PXPeopleRecoDataSource *)self rejectedFaceCropIndexes];
      v10 = [v8 objectsAtIndexes:v9];

      v11 = [(PXPeopleRecoDataSource *)self person];
      v12 = [v11 photoLibrary];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __39__PXPeopleRecoDataSource_commitChanges__block_invoke;
      v19[3] = &unk_1E5DD0F30;
      id v20 = v11;
      id v21 = v7;
      id v22 = v10;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __39__PXPeopleRecoDataSource_commitChanges__block_invoke_2;
      v16[3] = &unk_1E5DD2570;
      id v17 = v20;
      v18 = self;
      id v13 = v20;
      id v14 = v10;
      id v15 = v7;
      [v12 performChanges:v19 completionHandler:v16];
    }
  }
}

uint64_t __39__PXPeopleRecoDataSource_commitChanges__block_invoke(id *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] verifiedType];
  uint64_t v3 = [a1[5] count];
  if (v2 != 1 || v3 != 0)
  {
    uint64_t v5 = v3;
    v6 = [MEMORY[0x1E4F39200] changeRequestForPerson:a1[4]];
    v7 = v6;
    if (v2 != 1) {
      [v6 setVerifiedType:1];
    }
    if (v5) {
      [v7 addRejectedFaces:a1[5] forCluster:1];
    }
  }
  uint64_t result = [a1[6] count];
  if (result)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = a1[6];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = (id)objc_msgSend(MEMORY[0x1E4F39070], "creationRequestForFaceCropCopyFromFaceCrop:withType:onPerson:", *(void *)(*((void *)&v15 + 1) + 8 * v13++), 2, a1[4], (void)v15);
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }

    return [MEMORY[0x1E4F39070] deleteFaceCrops:a1[6]];
  }
  return result;
}

void __39__PXPeopleRecoDataSource_commitChanges__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    id v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      id v14 = v5;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "Error committing rejections: %@ for person: %@", buf, 0x16u);
    }
    goto LABEL_7;
  }
  v6 = [MEMORY[0x1E4F28F80] processInfo];
  char v7 = [v6 isLowPowerModeEnabled];

  if ((v7 & 1) == 0)
  {
    v8 = [*(id *)(a1 + 40) processingQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PXPeopleRecoDataSource_commitChanges__block_invoke_208;
    block[3] = &unk_1E5DD36F8;
    uint64_t v12 = *(id *)(a1 + 32);
    dispatch_async(v8, block);

    id v9 = v12;
LABEL_7:
  }
}

void __39__PXPeopleRecoDataSource_commitChanges__block_invoke_208(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F744E8] sharedAnalysisService];
  uint64_t v3 = [*(id *)(a1 + 32) photoLibrary];
  char v4 = [v3 photoLibraryURL];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__PXPeopleRecoDataSource_commitChanges__block_invoke_3;
  v5[3] = &unk_1E5DD2D68;
  id v6 = *(id *)(a1 + 32);
  [v2 requestPersonProcessingForPhotoLibraryURL:v4 options:MEMORY[0x1E4F1CC08] progressHandler:&__block_literal_global_284965 completionHandler:v5];
}

void __39__PXPeopleRecoDataSource_commitChanges__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = PLUIGetLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v12 = 138412546;
      id v13 = v3;
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      char v7 = "Error requesting person processing: %@ for person: %@";
      v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 22;
LABEL_6:
      _os_log_impl(&dword_1A9AE7000, v8, v9, v7, (uint8_t *)&v12, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void **)(a1 + 32);
    int v12 = 138412290;
    id v13 = v11;
    char v7 = "Successfully requested person processing for person: %@";
    v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    uint32_t v10 = 12;
    goto LABEL_6;
  }
}

- (BOOL)hasAnyRejectedItems
{
  id v3 = [(PXPeopleRecoDataSource *)self rejectedFaceIndexes];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(PXPeopleRecoDataSource *)self rejectedFaceCropIndexes];
    BOOL v4 = [v5 count] != 0;
  }
  return v4;
}

- (BOOL)shouldAllowCommitting
{
  unint64_t v3 = [(PXPeopleRecoDataSource *)self numberOfItems];
  BOOL v4 = [(PXPeopleRecoDataSource *)self rejectedFaceIndexes];
  uint64_t v5 = [v4 count];
  uint64_t v6 = [(PXPeopleRecoDataSource *)self rejectedFaceCropIndexes];
  LOBYTE(v3) = v3 > [v6 count] + v5;

  return v3;
}

- (BOOL)toggleRejectionForIndex:(unint64_t)a3
{
  BOOL v5 = -[PXPeopleRecoDataSource isIndexRejected:](self, "isIndexRejected:");
  uint64_t v6 = [(PXPeopleRecoDataSource *)self faces];
  unint64_t v7 = [v6 count];

  BOOL v8 = a3 >= v7;
  unint64_t v9 = a3 - v7;
  if (v5)
  {
    if (v8)
    {
      uint32_t v10 = [(PXPeopleRecoDataSource *)self rejectedFaceCropIndexes];
      uint64_t v11 = v10;
      unint64_t v12 = v9;
    }
    else
    {
      uint32_t v10 = [(PXPeopleRecoDataSource *)self rejectedFaceIndexes];
      uint64_t v11 = v10;
      unint64_t v12 = a3;
    }
    [v10 removeIndex:v12];
  }
  else
  {
    if (v8)
    {
      id v13 = [(PXPeopleRecoDataSource *)self rejectedFaceCropIndexes];
      uint64_t v11 = v13;
      unint64_t v14 = v9;
    }
    else
    {
      id v13 = [(PXPeopleRecoDataSource *)self rejectedFaceIndexes];
      uint64_t v11 = v13;
      unint64_t v14 = a3;
    }
    [v13 addIndex:v14];
  }

  return !v5;
}

- (BOOL)isIndexRejected:(unint64_t)a3
{
  BOOL v5 = [(PXPeopleRecoDataSource *)self faces];
  unint64_t v6 = [v5 count];

  if (a3 >= v6)
  {
    unint64_t v7 = [(PXPeopleRecoDataSource *)self rejectedFaceCropIndexes];
    BOOL v8 = v7;
    unint64_t v9 = a3 - v6;
  }
  else
  {
    unint64_t v7 = [(PXPeopleRecoDataSource *)self rejectedFaceIndexes];
    BOOL v8 = v7;
    unint64_t v9 = a3;
  }
  char v10 = [v7 containsIndex:v9];

  return v10;
}

- (void)requestImageForItemAtIndex:(unint64_t)a3 targetSize:(CGSize)a4 displayScale:(double)a5 imageBlock:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a6;
  unint64_t v12 = [(PXPeopleRecoDataSource *)self faces];
  unint64_t v13 = [v12 count];
  if (v13 <= a3)
  {
    unint64_t v21 = v13;
    id v22 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__PXPeopleRecoDataSource_requestImageForItemAtIndex_targetSize_displayScale_imageBlock___block_invoke_2;
    block[3] = &unk_1E5DD0A30;
    unint64_t v25 = a3;
    unint64_t v26 = v21;
    void block[4] = self;
    id v24 = v11;
    uint64_t v17 = (PXPeopleFaceCropFetchOptions *)v11;
    dispatch_async(v22, block);
  }
  else
  {
    unint64_t v14 = [PXPeopleFaceCropFetchOptions alloc];
    uint64_t v15 = [(PXPeopleRecoDataSource *)self person];
    uint64_t v16 = [v12 objectAtIndexedSubscript:a3];
    uint64_t v17 = -[PXPeopleFaceCropFetchOptions initWithPerson:face:targetSize:displayScale:](v14, "initWithPerson:face:targetSize:displayScale:", v15, v16, width, height, a5);

    long long v18 = +[PXPeopleUISettings sharedInstance];
    LOBYTE(v14) = [v18 showReviewPhotosObjectType];

    if ((v14 & 1) == 0) {
      [(PXPeopleFaceCropFetchOptions *)v17 setCornerStyle:1];
    }
    v19 = +[PXPeopleFaceCropManager sharedManager];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __88__PXPeopleRecoDataSource_requestImageForItemAtIndex_targetSize_displayScale_imageBlock___block_invoke;
    v27[3] = &unk_1E5DD24E8;
    id v28 = v11;
    id v20 = v11;
    [v19 requestFaceCropForOptions:v17 resultHandler:v27];
  }
}

void __88__PXPeopleRecoDataSource_requestImageForItemAtIndex_targetSize_displayScale_imageBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (*(void *)(a1 + 32))
  {
    id v5 = a2;
    id v7 = [a3 objectForKeyedSubscript:@"PXPeopleContentsRectKey"];
    uint64_t v6 = *(void *)(a1 + 32);
    [v7 CGRectValue];
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  }
}

void __88__PXPeopleRecoDataSource_requestImageForItemAtIndex_targetSize_displayScale_imageBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) faceCrops];
  unint64_t v3 = v2;
  unint64_t v4 = *(void *)(a1 + 48);
  unint64_t v5 = *(void *)(a1 + 56);
  if (v4 < v5) {
    unint64_t v5 = 0;
  }
  id v10 = [v2 objectAtIndex:v4 - v5];

  uint64_t v6 = (void *)MEMORY[0x1E4FB1818];
  id v7 = [v10 resourceData];
  BOOL v8 = [v6 imageWithData:v7];

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, void *, double, double, double, double))(v9 + 16))(v9, v8, *(double *)off_1E5DAB010, *((double *)off_1E5DAB010 + 1), *((double *)off_1E5DAB010 + 2), *((double *)off_1E5DAB010 + 3));
  }
}

- (unint64_t)numberOfItems
{
  unint64_t v3 = [(PXPeopleRecoDataSource *)self faces];
  uint64_t v4 = [v3 count];
  unint64_t v5 = [(PXPeopleRecoDataSource *)self faceCrops];
  unint64_t v6 = [v5 count] + v4;

  return v6;
}

- (void)_fetchEverythingForPerson:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F390A0] fetchOptionsWithPhotoLibrary:0 orObject:v4];
  [v5 setIncludeOnlyFacesNeedingFaceCrop:1];
  unint64_t v6 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
  [v5 setIncludedDetectionTypes:v6];

  id v7 = [MEMORY[0x1E4F39050] fetchFacesForPerson:v4 options:v5];
  [(PXPeopleRecoDataSource *)self setFaces:v7];

  BOOL v8 = [MEMORY[0x1E4F390A0] fetchOptionsWithPhotoLibrary:0 orObject:v4];
  if ([(PXPeopleRecoDataSource *)self isUsingMockedData])
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"uuid" ascending:1];
    v14[0] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [v8 setSortDescriptors:v10];

    [v8 setFetchLimit:100];
    uint64_t v11 = [MEMORY[0x1E4F39060] fetchFaceCropsWithOptions:v8];
  }
  else
  {
    unint64_t v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"type=%d||type=%d||type=%d", 1, 3, 5);
    [v8 setPredicate:v12];

    uint64_t v11 = [MEMORY[0x1E4F39060] fetchFaceCropsForPerson:v4 options:v8];
  }
  unint64_t v13 = (void *)v11;
  [(PXPeopleRecoDataSource *)self setFaceCrops:v11];
}

- (PXPeopleRecoDataSource)initWithPerson:(id)a3 dataSourceDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PXPeopleRecoDataSource;
  uint64_t v9 = [(PXPeopleRecoDataSource *)&v18 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_person, a3);
    objc_storeWeak((id *)&v10->_dataSourceDelegate, v8);
    uint64_t v11 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    rejectedFaceIndexes = v10->_rejectedFaceIndexes;
    v10->_rejectedFaceIndexes = v11;

    unint64_t v13 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    rejectedFaceCropIndexes = v10->_rejectedFaceCropIndexes;
    v10->_rejectedFaceCropIndexes = v13;

    uint64_t v15 = +[PXPeopleUISettings sharedInstance];
    v10->_isUsingMockedData = [v15 useReviewPhotosMockDataSource];

    [(PXPeopleRecoDataSource *)v10 _fetchEverythingForPerson:v7];
    uint64_t v16 = [v7 photoLibrary];
    objc_msgSend(v16, "px_registerChangeObserver:", v10);
  }
  return v10;
}

@end