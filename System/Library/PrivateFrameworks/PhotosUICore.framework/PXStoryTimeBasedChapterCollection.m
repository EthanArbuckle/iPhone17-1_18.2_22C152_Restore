@interface PXStoryTimeBasedChapterCollection
- (BOOL)canApplyEdits:(id)a3 error:(id *)a4;
- (BOOL)containsChapterBeginningWithAsset:(id)a3;
- (BOOL)usesAssetLocalCreationDates;
- (NSArray)chapters;
- (NSDictionary)chapterIndexesByIdentifier;
- (NSSet)chapterBeginningAssetLocalIdentifiers;
- (PXStoryTimeBasedChapterCollection)init;
- (PXStoryTimeBasedChapterCollection)initWithAssets:(id)a3 keyAsset:(id)a4 configuration:(id)a5;
- (id)_dateForAsset:(id)a3;
- (id)_initWithChapters:(id)a3 usesAssetLocalCreationDates:(BOOL)a4;
- (id)chapterAtIndex:(int64_t)a3;
- (id)chapterContainingAsset:(id)a3;
- (id)copyByApplyingEdits:(id)a3;
- (int64_t)indexOfChapterWithIdentifier:(id)a3;
- (int64_t)numberOfChapters;
- (void)enumerateChaptersUsingBlock:(id)a3;
@end

@implementation PXStoryTimeBasedChapterCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chapterBeginningAssetLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_chapterIndexesByIdentifier, 0);
  objc_storeStrong((id *)&self->_chapters, 0);
}

- (NSSet)chapterBeginningAssetLocalIdentifiers
{
  return self->_chapterBeginningAssetLocalIdentifiers;
}

- (NSDictionary)chapterIndexesByIdentifier
{
  return self->_chapterIndexesByIdentifier;
}

- (NSArray)chapters
{
  return self->_chapters;
}

- (BOOL)usesAssetLocalCreationDates
{
  return self->_usesAssetLocalCreationDates;
}

- (id)copyByApplyingEdits:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PXStoryTimeBasedChapterCollection *)self chapters];
  v6 = (void *)[v5 mutableCopy];

  v50 = self;
  BOOL v54 = [(PXStoryTimeBasedChapterCollection *)self usesAssetLocalCreationDates];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obj = v4;
  uint64_t v69 = [obj countByEnumeratingWithState:&v72 objects:v76 count:16];
  if (v69)
  {
    uint64_t v68 = *(void *)v73;
    unint64_t v7 = 0x1E4F28000uLL;
    v53 = v6;
    do
    {
      for (uint64_t i = 0; i != v69; ++i)
      {
        if (*(void *)v73 != v68) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __57__PXStoryTimeBasedChapterCollection_copyByApplyingEdits___block_invoke;
        aBlock[3] = &unk_1E5DB1AB8;
        id v10 = v6;
        id v71 = v10;
        v11 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
        switch([v9 kind])
        {
          case 0:
            v48 = [MEMORY[0x1E4F28B00] currentHandler];
            [v48 handleFailureInMethod:a2 object:v50 file:@"PXStoryTimeBasedChapterCollection.m" lineNumber:218 description:@"Code which should be unreachable has been reached"];

            abort();
          case 1:
            id v12 = v9;
            v13 = [v12 editedChapterIdentifier];
            uint64_t v14 = v11[2](v11, v13);

            unint64_t v7 = 0x1E4F28000;
            if (v14 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v15 = [v10 objectAtIndexedSubscript:v14];
              v16 = (void *)[v15 copy];

              unint64_t v7 = 0x1E4F28000;
              v17 = [v12 chapterChangeRequest];
              ((void (**)(void, void *))v17)[2](v17, v16);

              [v10 setObject:v16 atIndexedSubscript:v14];
            }
            goto LABEL_16;
          case 2:
            v64 = v11;
            id v18 = v9;
            v19 = [v18 firstAsset];
            v20 = _DateForAsset(v19, v54);
            v21 = [_PXStoryTimeBasedChapter alloc];
            unint64_t v22 = v7;
            id v23 = objc_alloc(*(Class *)(v7 + 3096));
            v24 = [MEMORY[0x1E4F1C9C8] distantFuture];
            v67 = v20;
            v25 = (void *)[v23 initWithStartDate:v20 endDate:v24];
            v63 = v19;
            v26 = [v19 uuid];
            uint64_t v27 = [(_PXStoryTimeBasedChapter *)v21 initWithDateInterval:v25 firstAssetLocalIdentifier:v26];

            v28 = [v18 chapterConfiguration];
            v28[2](v28, v27);

            v66 = (void *)v27;
            uint64_t v29 = objc_msgSend(v10, "indexOfObject:inSortedRange:options:usingComparator:", v27, 0, objc_msgSend(v10, "count"), 1024, &__block_literal_global_29_26614);
            if (v29 >= 1)
            {
              uint64_t v61 = v29 - 1;
              v30 = [v10 objectAtIndexedSubscript:v29 - 1];
              v31 = (void *)[v30 copy];

              id v57 = objc_alloc(*(Class *)(v22 + 3096));
              v59 = [v31 dateInterval];
              v55 = [v59 startDate];
              v32 = [v20 dateByAddingTimeInterval:-1.0];
              v33 = [v31 dateInterval];
              v34 = [v33 endDate];
              [v32 earlierDate:v34];
              v36 = uint64_t v35 = v29;
              v37 = (void *)[v57 initWithStartDate:v55 endDate:v36];
              [v31 setDateInterval:v37];

              uint64_t v29 = v35;
              [v10 setObject:v31 atIndexedSubscript:v61];
            }
            if (v29 < (unint64_t)[v10 count])
            {
              v58 = [v10 objectAtIndexedSubscript:v29];
              id v52 = objc_alloc(MEMORY[0x1E4F28C18]);
              v60 = [v66 dateInterval];
              v51 = [v60 startDate];
              v56 = [v58 dateInterval];
              [v56 startDate];
              v38 = uint64_t v62 = v29;
              v39 = [v38 dateByAddingTimeInterval:-1.0];
              v40 = [v66 dateInterval];
              v41 = [v40 endDate];
              v42 = [v39 earlierDate:v41];
              v43 = (void *)[v52 initWithStartDate:v51 endDate:v42];
              [v66 setDateInterval:v43];

              uint64_t v29 = v62;
            }
            [v10 insertObject:v66 atIndex:v29];

            v6 = v53;
            unint64_t v7 = 0x1E4F28000;
            v11 = v64;
            goto LABEL_16;
          case 3:
            v44 = [v9 deletedChapterIdentifier];
            uint64_t v45 = v11[2](v11, v44);

            if (v45 != 0x7FFFFFFFFFFFFFFFLL) {
              [v10 removeObjectAtIndex:v45];
            }
LABEL_16:

            break;
          default:
            break;
        }
      }
      uint64_t v69 = [obj countByEnumeratingWithState:&v72 objects:v76 count:16];
    }
    while (v69);
  }

  id v46 = [[PXStoryTimeBasedChapterCollection alloc] _initWithChapters:v6 usesAssetLocalCreationDates:v54];
  return v46;
}

uint64_t __57__PXStoryTimeBasedChapterCollection_copyByApplyingEdits___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__PXStoryTimeBasedChapterCollection_copyByApplyingEdits___block_invoke_2;
  v8[3] = &unk_1E5DB1A90;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = [v4 indexOfObjectPassingTest:v8];

  return v6;
}

uint64_t __57__PXStoryTimeBasedChapterCollection_copyByApplyingEdits___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareStartDateTo:");
}

uint64_t __57__PXStoryTimeBasedChapterCollection_copyByApplyingEdits___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)canApplyEdits:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 1;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__26624;
  v30 = __Block_byref_object_dispose__26625;
  id v31 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = a3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __57__PXStoryTimeBasedChapterCollection_canApplyEdits_error___block_invoke;
        aBlock[3] = &unk_1E5DB1A68;
        void aBlock[4] = self;
        aBlock[5] = &v26;
        aBlock[6] = &v32;
        id v9 = (void (**)(void *, void *))_Block_copy(aBlock);
        uint64_t v10 = [v8 kind];
        if (v10)
        {
          if (v10 == 1)
          {
            id v13 = v8;
            uint64_t v14 = [v13 editedChapterIdentifier];
            v9[2](v9, v14);
          }
          else if (v10 == 3)
          {
            id v11 = v8;
            id v12 = [v11 deletedChapterIdentifier];
            v9[2](v9, v12);
          }
        }
        else
        {
          uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PXStoryChapterErrorDomain" code:1 userInfo:0];
          v16 = (void *)v27[5];
          v27[5] = v15;

          *((unsigned char *)v33 + 24) = 0;
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v36 count:16];
    }
    while (v5);
  }

  if (a4) {
    *a4 = (id) v27[5];
  }
  BOOL v17 = *((unsigned char *)v33 + 24) != 0;
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v17;
}

void __57__PXStoryTimeBasedChapterCollection_canApplyEdits_error___block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) chapterIndexesByIdentifier];
  uint64_t v5 = [v4 objectForKeyedSubscript:v3];

  if (!v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28228];
    unint64_t v7 = (void *)[[NSString alloc] initWithFormat:@"%@ has no chapter with identifier %@", *(void *)(a1 + 32), v3];
    v13[0] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v9 = [v6 errorWithDomain:@"PXStoryChapterErrorDomain" code:2 userInfo:v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (id)chapterContainingAsset:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _DateForAsset(v4, [(PXStoryTimeBasedChapterCollection *)self usesAssetLocalCreationDates]);
  if (v5)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [(PXStoryTimeBasedChapterCollection *)self chapters];
    id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v11 = [v10 extendedDateIntervalForComparisonWithAssetDates];
          int v12 = [v11 containsDate:v5];

          if (v12)
          {
            id v7 = v10;
            goto LABEL_12;
          }
        }
        id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)containsChapterBeginningWithAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXStoryTimeBasedChapterCollection *)self chapterBeginningAssetLocalIdentifiers];
  uint64_t v6 = [v4 uuid];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

- (int64_t)indexOfChapterWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXStoryTimeBasedChapterCollection *)self chapterIndexesByIdentifier];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    int64_t v7 = [v6 integerValue];
  }
  else {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (id)chapterAtIndex:(int64_t)a3
{
  id v4 = [(PXStoryTimeBasedChapterCollection *)self chapters];
  uint64_t v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (int64_t)numberOfChapters
{
  v2 = [(PXStoryTimeBasedChapterCollection *)self chapters];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)_dateForAsset:(id)a3
{
  id v4 = a3;
  if ([(PXStoryTimeBasedChapterCollection *)self usesAssetLocalCreationDates]) {
    [v4 localCreationDate];
  }
  else {
  uint64_t v5 = [v4 creationDate];
  }

  return v5;
}

- (void)enumerateChaptersUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXStoryTimeBasedChapterCollection *)self chapters];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__PXStoryTimeBasedChapterCollection_enumerateChaptersUsingBlock___block_invoke;
  v7[3] = &unk_1E5DB1A40;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __65__PXStoryTimeBasedChapterCollection_enumerateChaptersUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a2;
  id v7 = [v6 dateInterval];
  (*(void (**)(uint64_t, id, id, uint64_t))(v5 + 16))(v5, v6, v7, a4);
}

- (id)_initWithChapters:(id)a3 usesAssetLocalCreationDates:(BOOL)a4
{
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PXStoryTimeBasedChapterCollection;
  id v7 = [(PXStoryTimeBasedChapterCollection *)&v26 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    chapters = v7->_chapters;
    v7->_chapters = (NSArray *)v8;

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    int v12 = v7->_chapters;
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    long long v22 = __83__PXStoryTimeBasedChapterCollection__initWithChapters_usesAssetLocalCreationDates___block_invoke;
    long long v23 = &unk_1E5DB1A18;
    id v24 = v10;
    id v25 = v11;
    id v13 = v11;
    id v14 = v10;
    [(NSArray *)v12 enumerateObjectsUsingBlock:&v20];
    uint64_t v15 = objc_msgSend(v14, "copy", v20, v21, v22, v23);
    chapterIndexesByIdentifier = v7->_chapterIndexesByIdentifier;
    v7->_chapterIndexesByIdentifier = (NSDictionary *)v15;

    uint64_t v17 = [v13 copy];
    chapterBeginningAssetLocalIdentifiers = v7->_chapterBeginningAssetLocalIdentifiers;
    v7->_chapterBeginningAssetLocalIdentifiers = (NSSet *)v17;

    v7->_usesAssetLocalCreationDates = a4;
  }

  return v7;
}

void __83__PXStoryTimeBasedChapterCollection__initWithChapters_usesAssetLocalCreationDates___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = NSNumber;
  id v6 = a2;
  id v7 = [v5 numberWithUnsignedInteger:a3];
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = [v6 identifier];
  [v8 setObject:v7 forKeyedSubscript:v9];

  id v11 = [v6 firstAssetLocalIdentifier];

  id v10 = v11;
  if (v11)
  {
    [*(id *)(a1 + 40) addObject:v11];
    id v10 = v11;
  }
}

- (PXStoryTimeBasedChapterCollection)initWithAssets:(id)a3 keyAsset:(id)a4 configuration:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(_PXStoryTimeBasedChapterCollectionConfiguration);
  v30 = v9;
  (*((void (**)(id, _PXStoryTimeBasedChapterCollectionConfiguration *))v9 + 2))(v9, v10);
  v33 = [(_PXStoryTimeBasedChapterCollectionConfiguration *)v10 chapters];
  id v11 = (id)[v33 sortedArrayUsingComparator:&__block_literal_global_26638];
  uint64_t v28 = v10;
  char v12 = [(_PXStoryTimeBasedChapterCollectionConfiguration *)v10 usesAssetLocalCreationDates];
  uint64_t v13 = [v7 count];
  id v14 = objc_alloc(MEMORY[0x1E4F1CA48]);
  if (v13 <= 1) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = v13;
  }
  long long v16 = (void *)[v14 initWithCapacity:v15];
  uint64_t v17 = [v8 uuid];
  id v31 = (void *)v17;
  if (v13 >= 1)
  {
    id v18 = (void *)v17;
    for (uint64_t i = 0; i != v13; ++i)
    {
      uint64_t v20 = [v7 objectAtIndexedSubscript:i];
      uint64_t v21 = _DateForAsset(v20, v12);
      long long v22 = [v20 uuid];
      long long v23 = v22;
      if (v21 && v22 && ([v22 isEqualToString:v18] & 1) == 0)
      {
        id v24 = [[_PXStoryTimeBasedAssetInfo alloc] initWithDate:v21 uuid:v23];
        [v16 addObject:v24];

        id v18 = v31;
      }
    }
  }
  [v16 sortUsingComparator:&__block_literal_global_5];
  memset(v34, 0, sizeof(v34));
  id obj = v33;
  if ([obj countByEnumeratingWithState:v34 objects:v35 count:16])
  {
    [**((id **)&v34[0] + 1) extendedDateIntervalForComparisonWithAssetDates];
    id v25 = [(id)objc_claimAutoreleasedReturnValue() startDate];
    [v16 count];
    v16;
    v25;
    PXFirstIndexInSortedRangePassingTest();
  }

  objc_super v26 = [(PXStoryTimeBasedChapterCollection *)self _initWithChapters:obj usesAssetLocalCreationDates:[(_PXStoryTimeBasedChapterCollectionConfiguration *)v28 usesAssetLocalCreationDates]];
  return v26;
}

BOOL __75__PXStoryTimeBasedChapterCollection_initWithAssets_keyAsset_configuration___block_invoke_3(uint64_t a1, uint64_t a2)
{
  int64_t v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  id v4 = [v3 date];
  BOOL v5 = [v4 compare:*(void *)(a1 + 40)] != -1;

  return v5;
}

uint64_t __75__PXStoryTimeBasedChapterCollection_initWithAssets_keyAsset_configuration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [a2 date];
  id v6 = [v4 date];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __75__PXStoryTimeBasedChapterCollection_initWithAssets_keyAsset_configuration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareStartDateTo:");
}

- (PXStoryTimeBasedChapterCollection)init
{
  return (PXStoryTimeBasedChapterCollection *)[(PXStoryTimeBasedChapterCollection *)self _initWithChapters:MEMORY[0x1E4F1CBF0] usesAssetLocalCreationDates:0];
}

@end