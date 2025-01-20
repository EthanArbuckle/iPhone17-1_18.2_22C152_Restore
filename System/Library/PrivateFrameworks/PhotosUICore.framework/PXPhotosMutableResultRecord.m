@interface PXPhotosMutableResultRecord
- (BOOL)ensureKeyAssetAtBeginning;
- (BOOL)isCurated;
- (BOOL)preloadAssetTypeCounts;
- (BOOL)reverseSortOrder;
- (BOOL)wantsCuration;
- (NSArray)sortDescriptors;
- (NSPredicate)inclusionPredicate;
- (NSSet)curatedOids;
- (NSSet)excludedOids;
- (NSSet)includedOids;
- (PHFetchResult)curatedFetchResult;
- (PHFetchResult)exposedFetchResult;
- (PHFetchResult)fetchResult;
- (PHFetchResult)filteredFetchResult;
- (PHFetchResult)keyAssetsFetchResult;
- (PXPhotosMutableResultRecord)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)curatedRefetchCondition;
- (id)exposedFetchResultBeforeFiltering;
- (int64_t)curationLength;
- (int64_t)keyAssetIndex;
- (void)_invalidateFilteredFetchResult;
- (void)_invalidateInclusionPredicate;
- (void)_invalidateKeyAssetIndex;
- (void)_setIncludeOids:(id)a3;
- (void)_updateFilteredFetchResultIfNeeded;
- (void)adoptPreparedFilteredFetchResultFromRecord:(id)a3;
- (void)excludeOids:(id)a3;
- (void)includeOids:(id)a3;
- (void)invalidateFetchResultAssetCache;
- (void)setCuratedFetchResult:(id)a3;
- (void)setCuratedRefetchCondition:(id)a3;
- (void)setCurationLength:(int64_t)a3;
- (void)setEnsureKeyAssetAtBeginning:(BOOL)a3;
- (void)setFetchResult:(id)a3;
- (void)setFetchResult:(id)a3 reverseSortOrder:(BOOL)a4;
- (void)setKeyAssetIndex:(int64_t)a3;
- (void)setKeyAssetsFetchResult:(id)a3;
- (void)setPreloadAssetTypeCounts:(BOOL)a3;
- (void)setReverseSortOrder:(BOOL)a3;
- (void)setSortDescriptors:(id)a3;
- (void)setWantsCuration:(BOOL)a3;
- (void)stopExcludingOids:(id)a3;
- (void)stopIncludingAllOids;
@end

@implementation PXPhotosMutableResultRecord

- (void)_updateFilteredFetchResultIfNeeded
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (!self->_filteredFetchResultIsValid)
  {
    v2 = self;
    self->_filteredFetchResultIsValid = 1;
    BOOL v3 = [(PXPhotosMutableResultRecord *)self reverseSortOrder];
    v4 = [(PXPhotosMutableResultRecord *)v2 excludedOids];
    v5 = [(PXPhotosMutableResultRecord *)v2 keyAssetsFetchResult];
    v6 = [v5 fetchedObjectIDs];
    uint64_t v7 = [v6 firstObject];

    v59 = (void *)v7;
    if (v7) {
      BOOL v60 = [(PXPhotosMutableResultRecord *)v2 ensureKeyAssetAtBeginning];
    }
    else {
      BOOL v60 = 0;
    }
    v8 = [(PXPhotosMutableResultRecord *)v2 exposedFetchResultBeforeFiltering];
    v9 = [v8 photoLibrary];
    if ([v4 count]) {
      char v10 = 1;
    }
    else {
      char v10 = v3;
    }
    if ((v10 & 1) != 0 || v60)
    {
      v12 = [v8 fetchedObjectIDs];

      if (v12)
      {
        v57 = v8;
        v13 = [v8 fetchedObjectIDs];
        v58 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
        objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "count"));
        v14 = (NSSet *)objc_claimAutoreleasedReturnValue();
        v53 = v2;
        BOOL v50 = v3;
        if (v3)
        {
          id v15 = [v13 reverseObjectEnumerator];
          BOOL v16 = [(PXPhotosMutableResultRecord *)v2 preloadAssetTypeCounts];
          uint64_t v17 = [v13 count] - 1;
          uint64_t v18 = -1;
        }
        else
        {
          id v15 = v13;
          BOOL v16 = [(PXPhotosMutableResultRecord *)v2 preloadAssetTypeCounts];
          uint64_t v17 = 0;
          uint64_t v18 = 1;
        }
        v51 = v13;
        v52 = v9;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v19 = v15;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v61 objects:v65 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          unint64_t v54 = 0;
          unint64_t v55 = 0;
          unint64_t v56 = 0;
          uint64_t v22 = *(void *)v62;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v62 != v22) {
                objc_enumerationMutation(v19);
              }
              v24 = *(void **)(*((void *)&v61 + 1) + 8 * i);
              if ([v4 containsObject:v24])
              {
                [(NSSet *)v14 addObject:v24];
                if (v16)
                {
                  v25 = [v57 objectAtIndexedSubscript:v17];
                  uint64_t v26 = [v25 mediaType];
                  switch(v26)
                  {
                    case 3:
                      ++v56;
                      break;
                    case 2:
                      ++v55;
                      break;
                    case 1:
                      ++v54;
                      break;
                  }
                }
              }
              else if (v24 != v59 || !v60)
              {
                [v58 addObject:v24];
              }
              v17 += v18;
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v61 objects:v65 count:16];
          }
          while (v21);
        }
        else
        {
          unint64_t v54 = 0;
          unint64_t v55 = 0;
          unint64_t v56 = 0;
        }

        v11 = v14;
        uint64_t v28 = [(NSSet *)v14 count];
        int v29 = v50;
        if (v28) {
          int v29 = 1;
        }
        if ((v29 | v60) == 1)
        {
          uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
          uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
          uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
          v8 = v57;
          if (v16)
          {
            unint64_t v33 = [v57 cachedCountOfAssetsWithMediaType:1];
            unint64_t v34 = [v57 cachedCountOfAssetsWithMediaType:2];
            unint64_t v35 = [v57 cachedCountOfAssetsWithMediaType:3];
            uint64_t v36 = v33 - v54;
            if (v33 < v54 || v33 == 0x7FFFFFFFFFFFFFFFLL) {
              uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
            }
            if (v34 < v55 || v34 == 0x7FFFFFFFFFFFFFFFLL) {
              uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else {
              uint64_t v31 = v34 - v55;
            }
            if (v35 < v56 || v35 == 0x7FFFFFFFFFFFFFFFLL) {
              uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else {
              uint64_t v32 = v35 - v56;
            }
            uint64_t v30 = v36;
          }
          if (v60 && ([v4 containsObject:v59] & 1) == 0) {
            [v58 insertObject:v59 atIndex:0];
          }
          id v40 = objc_alloc(MEMORY[0x1E4F39150]);
          v41 = [v57 fetchType];
          v42 = [v57 fetchPropertySets];
          uint64_t v49 = v31;
          uint64_t v48 = v30;
          v43 = v58;
          v9 = v52;
          v12 = (PHFetchResult *)[v40 initWithOids:v58 photoLibrary:v52 fetchType:v41 fetchPropertySets:v42 identifier:0 registerIfNeeded:0 photosCount:v48 videosCount:v49 audiosCount:v32];

          v11 = v14;
        }
        else
        {
          v12 = 0;
          v8 = v57;
          v43 = v58;
          v9 = v52;
        }

        v2 = v53;
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      v11 = 0;
      v12 = 0;
    }
    excludedOids = v2->_excludedOids;
    v2->_excludedOids = v11;
    v45 = v11;

    filteredFetchResult = v2->_filteredFetchResult;
    v2->_filteredFetchResult = v12;
    v47 = v12;
  }
}

- (PHFetchResult)keyAssetsFetchResult
{
  return self->_keyAssetsFetchResult;
}

- (NSSet)excludedOids
{
  return self->_excludedOids;
}

- (BOOL)reverseSortOrder
{
  return self->_reverseSortOrder;
}

- (BOOL)preloadAssetTypeCounts
{
  return self->_preloadAssetTypeCounts;
}

- (void)setCuratedFetchResult:(id)a3
{
  uint64_t v7 = (PHFetchResult *)a3;
  if (self->_curatedFetchResult != v7)
  {
    objc_storeStrong((id *)&self->_curatedFetchResult, a3);
    v5 = [(PHFetchResult *)v7 fetchedObjectIDsSet];
    curatedOids = self->_curatedOids;
    self->_curatedOids = v5;

    [(PXPhotosMutableResultRecord *)self _invalidateFilteredFetchResult];
  }
}

- (void)setKeyAssetsFetchResult:(id)a3
{
  v5 = (PHFetchResult *)a3;
  if (self->_keyAssetsFetchResult != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)&self->_keyAssetsFetchResult, a3);
    [(PXPhotosMutableResultRecord *)self _invalidateKeyAssetIndex];
    BOOL v6 = [(PXPhotosMutableResultRecord *)self ensureKeyAssetAtBeginning];
    v5 = v7;
    if (v6)
    {
      [(PXPhotosMutableResultRecord *)self _invalidateFilteredFetchResult];
      v5 = v7;
    }
  }
}

- (void)setCuratedRefetchCondition:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(PXPhotosMutableResultRecord);
  v5 = [(PXPhotosMutableResultRecord *)self fetchResult];
  uint64_t v6 = [v5 copy];
  fetchResult = v4->_fetchResult;
  v4->_fetchResult = (PHFetchResult *)v6;

  v8 = [(PXPhotosMutableResultRecord *)self curatedFetchResult];
  uint64_t v9 = [v8 copy];
  curatedFetchResult = v4->_curatedFetchResult;
  v4->_curatedFetchResult = (PHFetchResult *)v9;

  v11 = [(PXPhotosMutableResultRecord *)self keyAssetsFetchResult];
  uint64_t v12 = [v11 copy];
  keyAssetsFetchResult = v4->_keyAssetsFetchResult;
  v4->_keyAssetsFetchResult = (PHFetchResult *)v12;

  v4->_keyAssetIndex = self->_keyAssetIndex;
  v4->_wantsCuration = [(PXPhotosMutableResultRecord *)self wantsCuration];
  v4->_curationLength = [(PXPhotosMutableResultRecord *)self curationLength];
  v14 = [(PXPhotosMutableResultRecord *)self sortDescriptors];
  uint64_t v15 = [v14 copy];
  sortDescriptors = v4->_sortDescriptors;
  v4->_sortDescriptors = (NSArray *)v15;

  uint64_t v17 = [(PXPhotosMutableResultRecord *)self filteredFetchResult];
  uint64_t v18 = [v17 copy];
  filteredFetchResult = v4->_filteredFetchResult;
  v4->_filteredFetchResult = (PHFetchResult *)v18;

  uint64_t v20 = [(PXPhotosMutableResultRecord *)self excludedOids];
  uint64_t v21 = [v20 copy];
  excludedOids = v4->_excludedOids;
  v4->_excludedOids = (NSSet *)v21;

  v23 = [(PXPhotosMutableResultRecord *)self includedOids];
  uint64_t v24 = [v23 copy];
  includedOids = v4->_includedOids;
  v4->_includedOids = (NSSet *)v24;

  uint64_t v26 = [(PXPhotosMutableResultRecord *)self curatedOids];
  uint64_t v27 = [v26 copy];
  curatedOids = v4->_curatedOids;
  v4->_curatedOids = (NSSet *)v27;

  v4->_filteredFetchResultIsValid = self->_filteredFetchResultIsValid;
  v4->_preloadAssetTypeCounts = self->_preloadAssetTypeCounts;
  v4->_reverseSortOrder = self->_reverseSortOrder;
  uint64_t v29 = [self->_curatedRefetchCondition copy];
  id curatedRefetchCondition = v4->_curatedRefetchCondition;
  v4->_id curatedRefetchCondition = (id)v29;

  v4->_ensureKeyAssetAtBeginning = self->_ensureKeyAssetAtBeginning;
  return v4;
}

- (PHFetchResult)exposedFetchResult
{
  BOOL v3 = [(PXPhotosMutableResultRecord *)self filteredFetchResult];
  if (!v3)
  {
    BOOL v3 = [(PXPhotosMutableResultRecord *)self exposedFetchResultBeforeFiltering];
  }
  return (PHFetchResult *)v3;
}

- (PHFetchResult)filteredFetchResult
{
  [(PXPhotosMutableResultRecord *)self _updateFilteredFetchResultIfNeeded];
  filteredFetchResult = self->_filteredFetchResult;
  return filteredFetchResult;
}

- (id)exposedFetchResultBeforeFiltering
{
  if (![(PXPhotosMutableResultRecord *)self wantsCuration]) {
    goto LABEL_5;
  }
  uint64_t v3 = [(PXPhotosMutableResultRecord *)self curatedFetchResult];
  if (!v3
    || (v4 = (void *)v3,
        [(PXPhotosMutableResultRecord *)self curatedFetchResult],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v4,
        v6))
  {
    uint64_t v7 = [(PXPhotosMutableResultRecord *)self curatedFetchResult];
  }
  else
  {
LABEL_5:
    uint64_t v7 = [(PXPhotosMutableResultRecord *)self fetchResult];
  }
  return v7;
}

- (PHFetchResult)curatedFetchResult
{
  return self->_curatedFetchResult;
}

- (BOOL)wantsCuration
{
  return self->_wantsCuration;
}

- (PXPhotosMutableResultRecord)init
{
  v5.receiver = self;
  v5.super_class = (Class)PXPhotosMutableResultRecord;
  v2 = [(PXPhotosMutableResultRecord *)&v5 init];
  uint64_t v3 = v2;
  if (v2) {
    [(PXPhotosMutableResultRecord *)v2 _invalidateKeyAssetIndex];
  }
  return v3;
}

- (void)_invalidateKeyAssetIndex
{
  self->_keyAssetIndex = -1;
}

- (void)_invalidateFilteredFetchResult
{
  self->_filteredFetchResultIsValid = 0;
  filteredFetchResult = self->_filteredFetchResult;
  self->_filteredFetchResult = 0;

  [(PXPhotosMutableResultRecord *)self _invalidateKeyAssetIndex];
}

- (void)setWantsCuration:(BOOL)a3
{
  if (self->_wantsCuration != a3)
  {
    self->_wantsCuration = a3;
    [(PXPhotosMutableResultRecord *)self _invalidateFilteredFetchResult];
  }
}

- (void)setSortDescriptors:(id)a3
{
  v8 = (NSArray *)a3;
  v4 = self->_sortDescriptors;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = (NSArray *)[(NSArray *)v8 copy];
      sortDescriptors = self->_sortDescriptors;
      self->_sortDescriptors = v6;

      [(PXPhotosMutableResultRecord *)self setFetchResult:0];
      [(PXPhotosMutableResultRecord *)self setCuratedFetchResult:0];
      [(PXPhotosMutableResultRecord *)self _invalidateFilteredFetchResult];
    }
  }
}

- (void)setPreloadAssetTypeCounts:(BOOL)a3
{
  self->_preloadAssetTypeCounts = a3;
}

- (void)setEnsureKeyAssetAtBeginning:(BOOL)a3
{
  if (self->_ensureKeyAssetAtBeginning != a3)
  {
    self->_ensureKeyAssetAtBeginning = a3;
    [(PXPhotosMutableResultRecord *)self _invalidateFilteredFetchResult];
  }
}

- (void)setCurationLength:(int64_t)a3
{
  if (self->_curationLength != a3)
  {
    self->_curationLength = a3;
    [(PXPhotosMutableResultRecord *)self setFetchResult:0];
    [(PXPhotosMutableResultRecord *)self setCuratedFetchResult:0];
    [(PXPhotosMutableResultRecord *)self _invalidateFilteredFetchResult];
  }
}

- (NSPredicate)inclusionPredicate
{
  if (!self->_inclusionPredicateIsValid)
  {
    self->_inclusionPredicateIsValid = 1;
    uint64_t v3 = [(PXPhotosMutableResultRecord *)self includedOids];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      char v5 = (void *)MEMORY[0x1E4F28F60];
      uint64_t v6 = [(PXPhotosMutableResultRecord *)self includedOids];
      uint64_t v7 = [v5 predicateWithFormat:@"self IN %@", v6];
    }
    else
    {
      uint64_t v7 = 0;
    }
    inclusionPredicate = self->_inclusionPredicate;
    self->_inclusionPredicate = v7;
  }
  uint64_t v9 = self->_inclusionPredicate;
  return v9;
}

- (NSSet)includedOids
{
  return self->_includedOids;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (int64_t)curationLength
{
  return self->_curationLength;
}

- (NSSet)curatedOids
{
  return self->_curatedOids;
}

- (void)setReverseSortOrder:(BOOL)a3
{
  if (self->_reverseSortOrder != a3)
  {
    self->_reverseSortOrder = a3;
    [(PXPhotosMutableResultRecord *)self _invalidateFilteredFetchResult];
  }
}

- (void)setFetchResult:(id)a3 reverseSortOrder:(BOOL)a4
{
  BOOL v4 = a4;
  [(PXPhotosMutableResultRecord *)self setFetchResult:a3];
  [(PXPhotosMutableResultRecord *)self setReverseSortOrder:v4];
}

- (void)setFetchResult:(id)a3
{
  char v5 = (PHFetchResult *)a3;
  if (self->_fetchResult != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_fetchResult, a3);
    [(PXPhotosMutableResultRecord *)self _invalidateFilteredFetchResult];
    char v5 = v6;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong(&self->_curatedRefetchCondition, 0);
  objc_storeStrong((id *)&self->_keyAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_curatedFetchResult, 0);
  objc_storeStrong((id *)&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_curatedOids, 0);
  objc_storeStrong((id *)&self->_includedOids, 0);
  objc_storeStrong((id *)&self->_excludedOids, 0);
  objc_storeStrong((id *)&self->_inclusionPredicate, 0);
  objc_storeStrong((id *)&self->_filteredFetchResult, 0);
}

- (PHFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (void)adoptPreparedFilteredFetchResultFromRecord:(id)a3
{
  id v4 = a3;
  if (self->_filteredFetchResultIsValid) {
    goto LABEL_27;
  }
  id v31 = v4;
  int v5 = [(PXPhotosMutableResultRecord *)self reverseSortOrder];
  BOOL v6 = v5 == [v31 reverseSortOrder];
  id v4 = v31;
  if (!v6) {
    goto LABEL_27;
  }
  uint64_t v7 = [(PXPhotosMutableResultRecord *)self excludedOids];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CAD0] set];
  }
  uint64_t v9 = [v31 excludedOids];
  char v10 = v9;
  if (!v9)
  {
    char v10 = [MEMORY[0x1E4F1CAD0] set];
  }
  if (v8 == v10)
  {
    int v11 = 1;
    if (v9) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  int v11 = [v8 isEqual:v10];
  if (!v9) {
LABEL_10:
  }

LABEL_11:
  if (!v7) {

  }
  id v4 = v31;
  if (v11)
  {
    uint64_t v12 = [(PXPhotosMutableResultRecord *)self keyAssetsFetchResult];
    v13 = [v12 fetchedObjectIDs];
    id v14 = [v13 firstObject];
    uint64_t v15 = [v31 keyAssetsFetchResult];
    BOOL v16 = [v15 fetchedObjectIDs];
    id v17 = [v16 firstObject];
    if (v14 == v17)
    {
    }
    else
    {
      uint64_t v18 = v17;
      char v19 = [v14 isEqual:v17];

      id v4 = v31;
      if ((v19 & 1) == 0) {
        goto LABEL_27;
      }
    }
    int v20 = [(PXPhotosMutableResultRecord *)self ensureKeyAssetAtBeginning];
    BOOL v6 = v20 == [v31 ensureKeyAssetAtBeginning];
    id v4 = v31;
    if (v6)
    {
      id v21 = [(PXPhotosMutableResultRecord *)self exposedFetchResultBeforeFiltering];
      id v22 = [v31 exposedFetchResultBeforeFiltering];
      if (v21 == v22)
      {
      }
      else
      {
        v23 = v22;
        char v24 = [v21 isEqual:v22];

        id v4 = v31;
        if ((v24 & 1) == 0) {
          goto LABEL_27;
        }
      }
      v25 = [v31 excludedOids];
      uint64_t v26 = (NSSet *)[v25 copy];
      excludedOids = self->_excludedOids;
      self->_excludedOids = v26;

      uint64_t v28 = [v31 filteredFetchResult];
      uint64_t v29 = (PHFetchResult *)[v28 copy];
      filteredFetchResult = self->_filteredFetchResult;
      self->_filteredFetchResult = v29;

      id v4 = v31;
      self->_filteredFetchResultIsValid = 1;
    }
  }
LABEL_27:
}

- (BOOL)ensureKeyAssetAtBeginning
{
  return self->_ensureKeyAssetAtBeginning;
}

- (id)curatedRefetchCondition
{
  return self->_curatedRefetchCondition;
}

- (void)setKeyAssetIndex:(int64_t)a3
{
  self->_keyAssetIndex = a3;
}

- (BOOL)isCurated
{
  uint64_t v3 = [(PXPhotosMutableResultRecord *)self curatedFetchResult];
  if (v3)
  {
    id v4 = [(PXPhotosMutableResultRecord *)self exposedFetchResultBeforeFiltering];
    int v5 = [(PXPhotosMutableResultRecord *)self curatedFetchResult];
    BOOL v6 = v4 == v5;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (int64_t)keyAssetIndex
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int64_t keyAssetIndex = self->_keyAssetIndex;
  if (keyAssetIndex == -1)
  {
    id v4 = [(PXPhotosMutableResultRecord *)self keyAssetsFetchResult];
    if ([v4 count])
    {
      int v5 = [(PXPhotosMutableResultRecord *)self exposedFetchResult];
      if (v5)
      {
        long long v15 = 0u;
        long long v16 = 0u;
        long long v13 = 0u;
        long long v14 = 0u;
        id v6 = v4;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        int64_t keyAssetIndex = 0x7FFFFFFFFFFFFFFFLL;
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v14;
          while (2)
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v14 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = objc_msgSend(v5, "indexOfObject:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
              if (v11 != 0x7FFFFFFFFFFFFFFFLL)
              {
                int64_t keyAssetIndex = v11;
                goto LABEL_15;
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
            if (v8) {
              continue;
            }
            break;
          }
          int64_t keyAssetIndex = 0x7FFFFFFFFFFFFFFFLL;
        }
LABEL_15:
      }
      else
      {
        int64_t keyAssetIndex = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      int64_t keyAssetIndex = 0x7FFFFFFFFFFFFFFFLL;
    }
    self->_int64_t keyAssetIndex = keyAssetIndex;
  }
  return keyAssetIndex;
}

- (void)stopExcludingOids:(id)a3
{
  id v7 = a3;
  if ([v7 count])
  {
    id v4 = [(PXPhotosMutableResultRecord *)self excludedOids];
    int v5 = (void *)[v4 mutableCopy];

    [v5 minusSet:v7];
    NSUInteger v6 = [(NSSet *)self->_excludedOids count];
    if (v6 != [v5 count])
    {
      objc_storeStrong((id *)&self->_excludedOids, v5);
      [(PXPhotosMutableResultRecord *)self _invalidateFilteredFetchResult];
    }
  }
}

- (void)excludeOids:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [v10 count];
  int v5 = v10;
  if (v4)
  {
    NSUInteger v6 = [MEMORY[0x1E4F1CA80] setWithArray:v10];
    id v7 = [(PXPhotosMutableResultRecord *)self excludedOids];

    if (v7)
    {
      uint64_t v8 = [(PXPhotosMutableResultRecord *)self excludedOids];
      [v6 unionSet:v8];
    }
    NSUInteger v9 = [(NSSet *)self->_excludedOids count];
    if (v9 != [v6 count])
    {
      objc_storeStrong((id *)&self->_excludedOids, v6);
      [(PXPhotosMutableResultRecord *)self _invalidateFilteredFetchResult];
    }

    int v5 = v10;
  }
}

- (void)_invalidateInclusionPredicate
{
  self->_inclusionPredicateIsValid = 0;
}

- (void)_setIncludeOids:(id)a3
{
  id v6 = a3;
  NSUInteger v5 = [(NSSet *)self->_includedOids count];
  if (v5 != [v6 count])
  {
    objc_storeStrong((id *)&self->_includedOids, a3);
    [(PXPhotosMutableResultRecord *)self _invalidateInclusionPredicate];
    [(PXPhotosMutableResultRecord *)self setFetchResult:0];
  }
}

- (void)stopIncludingAllOids
{
}

- (void)includeOids:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [v9 count];
  NSUInteger v5 = v9;
  if (v4)
  {
    id v6 = [MEMORY[0x1E4F1CA80] setWithArray:v9];
    id v7 = [(PXPhotosMutableResultRecord *)self includedOids];

    if (v7)
    {
      uint64_t v8 = [(PXPhotosMutableResultRecord *)self includedOids];
      [v6 unionSet:v8];
    }
    [(PXPhotosMutableResultRecord *)self _setIncludeOids:v6];

    NSUInteger v5 = v9;
  }
}

- (void)invalidateFetchResultAssetCache
{
  uint64_t v3 = (PHFetchResult *)[(PHFetchResult *)self->_filteredFetchResult copyWithOptions:&unk_1F02DB388];
  filteredFetchResult = self->_filteredFetchResult;
  self->_filteredFetchResult = v3;

  NSUInteger v5 = (PHFetchResult *)[(PHFetchResult *)self->_fetchResult copyWithOptions:&unk_1F02DB388];
  fetchResult = self->_fetchResult;
  self->_fetchResult = v5;
}

@end