@interface PXSearchResultsValue
- (BOOL)isAssetResult;
- (BOOL)isFinished;
- (BOOL)isOCRStringMatchedResult;
- (BOOL)isSingletonPersonResult;
- (NSArray)assetUUIDs;
- (NSArray)assets;
- (NSArray)searchTokens;
- (NSDate)date;
- (NSDictionary)debugDictionary;
- (NSMutableDictionary)uuidToAssetMap;
- (NSString)collectionSubtitle;
- (NSString)collectionTitle;
- (NSString)collectionUUID;
- (NSString)dateFilterString;
- (NSString)description;
- (NSString)displaySubtitle;
- (NSString)displayTitle;
- (NSString)searchString;
- (NSString)selectedDisplayTitle;
- (NSString)transientToken;
- (PHPerson)person;
- (PLSearchResult)searchResult;
- (PXSearchResultsValue)init;
- (PXSearchResultsValueDelegate)delegate;
- (double)score;
- (id)_startDateForAssetCollection:(id)a3;
- (id)assetLocalIdentifiersForPreview;
- (id)displayTitleWithDefaultAttributes:(id)a3 dimmedAttributes:(id)a4 selectedDisplayTitle:(id *)a5;
- (id)groupsMatchRanges;
- (int64_t)compare:(id)a3;
- (unint64_t)_plCategoryForPlSearchResult:(id)a3;
- (unint64_t)approximateCount;
- (unint64_t)categoryAtIndex:(unint64_t)a3;
- (unint64_t)collectionType;
- (unint64_t)itemType;
- (unint64_t)searchCategories;
- (void)_computeScoreWithMaxGroupedResultsCount:(unint64_t)a3;
- (void)_setApproximateCount:(unint64_t)a3;
- (void)_setAsset:(id)a3 forUUID:(id)a4;
- (void)_setAssetUUIDs:(id)a3;
- (void)_setCollectionType:(unint64_t)a3 uuid:(id)a4 title:(id)a5 subtitle:(id)a6;
- (void)_setDate:(id)a3;
- (void)_setDateFilterString:(id)a3;
- (void)_setPerson:(id)a3;
- (void)_setSearchResult:(id)a3;
- (void)_setSelectedDisplayTitle:(id)a3;
- (void)enumerateSearchIndexCategoriesUsingBlock:(id)a3;
- (void)fetchAllUUIDs:(id)a3;
- (void)fetchRemainingUUIDs:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStartDate:(id)a3 endDate:(id)a4;
- (void)setTransientToken:(id)a3;
@end

@implementation PXSearchResultsValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFilterString, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uuidToAssetMap, 0);
  objc_storeStrong((id *)&self->_selectedDisplayTitle, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_collectionTitle, 0);
  objc_storeStrong((id *)&self->_collectionUUID, 0);
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
  objc_storeStrong((id *)&self->_transientToken, 0);
  objc_storeStrong((id *)&self->_collectionSubtitle, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_displaySubtitle, 0);
  objc_storeStrong((id *)&self->_attributedDisplayTitle, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_setDateFilterString:(id)a3
{
}

- (NSString)dateFilterString
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)_setDate:(id)a3
{
}

- (void)_setSearchResult:(id)a3
{
}

- (PLSearchResult)searchResult
{
  return (PLSearchResult *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDelegate:(id)a3
{
}

- (PXSearchResultsValueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXSearchResultsValueDelegate *)WeakRetained;
}

- (NSMutableDictionary)uuidToAssetMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)_setSelectedDisplayTitle:(id)a3
{
}

- (NSString)selectedDisplayTitle
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)_setPerson:(id)a3
{
}

- (PHPerson)person
{
  return self->_person;
}

- (void)_setApproximateCount:(unint64_t)a3
{
  self->_approximateCount = a3;
}

- (unint64_t)approximateCount
{
  return self->_approximateCount;
}

- (NSString)collectionTitle
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)collectionUUID
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (unint64_t)collectionType
{
  return self->_collectionType;
}

- (void)_setAssetUUIDs:(id)a3
{
}

- (NSArray)assetUUIDs
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTransientToken:(id)a3
{
}

- (NSString)transientToken
{
  return self->_transientToken;
}

- (unint64_t)itemType
{
  return 1;
}

- (void)setStartDate:(id)a3 endDate:(id)a4
{
  v6 = (PSIDate *)a3;
  v7 = (PSIDate *)a4;
  startDate = self->_startDate;
  self->_startDate = v6;
  v10 = v6;

  endDate = self->_endDate;
  self->_endDate = v7;
}

- (NSString)collectionSubtitle
{
  collectionSubtitle = self->_collectionSubtitle;
  if (!collectionSubtitle)
  {
    if (self->_startDate)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v5 = [WeakRetained stringWithStartDate:self->_startDate endDate:self->_endDate];
      v6 = self->_collectionSubtitle;
      self->_collectionSubtitle = v5;

      collectionSubtitle = self->_collectionSubtitle;
    }
    else
    {
      collectionSubtitle = 0;
    }
  }
  return collectionSubtitle;
}

- (NSString)description
{
  v2 = [(PXSearchResultsValue *)self debugDictionary];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (NSDictionary)debugDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [v4 stringWithFormat:@"%@:%p", v6, self];
  [v3 setObject:v7 forKeyedSubscript:@"self"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PXSearchResultsValue itemType](self, "itemType"));
  [v3 setObject:v8 forKeyedSubscript:@"itemType"];

  v9 = [(PXSearchResultsValue *)self displayTitle];
  [v3 setObject:v9 forKeyedSubscript:@"title"];

  [v3 setObject:self->_displaySubtitle forKeyedSubscript:@"subtitle"];
  v10 = [NSNumber numberWithUnsignedInteger:self->_approximateCount];
  [v3 setObject:v10 forKeyedSubscript:@"count"];

  v11 = [NSNumber numberWithUnsignedInteger:self->_collectionType];
  [v3 setObject:v11 forKeyedSubscript:@"collectionType"];

  [v3 setObject:self->_collectionUUID forKeyedSubscript:@"collectionUUID"];
  [v3 setObject:self->_collectionTitle forKeyedSubscript:@"collectionTitle"];
  v12 = [(PXSearchResultsValue *)self collectionSubtitle];
  [v3 setObject:v12 forKeyedSubscript:@"collectionSubtitle"];

  [v3 setObject:self->_assetUUIDs forKeyedSubscript:@"assetUUIDs"];
  v13 = [(PXSearchResultsValue *)self groupsMatchRanges];
  v14 = [v13 valueForKey:@"description"];
  [v3 setObject:v14 forKeyedSubscript:@"groupsMatchRanges"];

  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PXSearchResultsValue categoryAtIndex:](self, "categoryAtIndex:", 0));
  [v3 setObject:v15 forKeyedSubscript:@"mainCategory"];

  v16 = [NSNumber numberWithUnsignedLongLong:self->_searchCategories];
  [v3 setObject:v16 forKeyedSubscript:@"searchCategoriesMask"];

  return (NSDictionary *)v3;
}

- (void)enumerateSearchIndexCategoriesUsingBlock:(id)a3
{
  v13 = (void (**)(id, uint64_t))a3;
  if (!v13)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXSearchResultsValue.m", 569, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  v5 = [(PXSearchResultsValue *)self searchResult];
  uint64_t v6 = [v5 groupCount];

  if (v6)
  {
    unint64_t v7 = 0;
    do
    {
      v8 = [(PXSearchResultsValue *)self searchResult];
      uint64_t v9 = [v8 categoryAtIndex:v7];

      v13[2](v13, v9);
      ++v7;
      v10 = [(PXSearchResultsValue *)self searchResult];
      unint64_t v11 = [v10 groupCount];
    }
    while (v7 < v11);
  }
}

- (id)groupsMatchRanges
{
  v2 = [(PXSearchResultsValue *)self searchResult];
  v3 = [v2 matchRanges];

  return v3;
}

- (unint64_t)categoryAtIndex:(unint64_t)a3
{
  v4 = [(PXSearchResultsValue *)self searchResult];
  unint64_t v5 = [v4 categoryAtIndex:a3];

  return v5;
}

- (unint64_t)searchCategories
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__PXSearchResultsValue_searchCategories__block_invoke;
  v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __40__PXSearchResultsValue_searchCategories__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2[3])
  {
    unint64_t v3 = [v2 searchResult];
    uint64_t v4 = [v3 groupCount];

    if (v4)
    {
      unint64_t v5 = 0;
      do
      {
        uint64_t v6 = [*(id *)(a1 + 32) searchResult];
        [v6 categoryAtIndex:v5];
        *(void *)(*(void *)(a1 + 32) + 24) |= PLSearchIndexCategoryMaskForCategory();

        ++v5;
        unint64_t v7 = [*(id *)(a1 + 32) searchResult];
        unint64_t v8 = [v7 groupCount];
      }
      while (v5 < v8);
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 24);
}

- (NSArray)assets
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = self->_assetUUIDs;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_uuidToAssetMap, "objectForKeyedSubscript:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)_setAsset:(id)a3 forUUID:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uuidToAssetMap = self->_uuidToAssetMap;
  if (!uuidToAssetMap)
  {
    unint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v9 = self->_uuidToAssetMap;
    self->_uuidToAssetMap = v8;

    uuidToAssetMap = self->_uuidToAssetMap;
  }
  [(NSMutableDictionary *)uuidToAssetMap setObject:v10 forKeyedSubscript:v6];
}

- (id)assetLocalIdentifiersForPreview
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v5 = [(PXSearchResultsValue *)self searchResult];
  id v6 = [v5 keyAssetUUID];
  uint64_t v7 = objc_msgSend(v4, "arrayWithObjects:", v6, 0);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = [MEMORY[0x1E4F38EB8] localIdentifierWithUUID:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        if ([v13 length]) {
          [v3 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v3;
}

- (int64_t)compare:(id)a3
{
  double score = self->_score;
  double v4 = *((double *)a3 + 2);
  if (score > v4) {
    return -1;
  }
  else {
    return score < v4;
  }
}

- (id)_startDateForAssetCollection:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = [v3 photoLibrary];
  uint64_t v5 = [v4 librarySpecificFetchOptions];

  id v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v12[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v5 setSortDescriptors:v7];

  [v5 setFetchLimit:1];
  id v8 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v3 options:v5];

  uint64_t v9 = [v8 firstObject];

  uint64_t v10 = [v9 creationDate];

  return v10;
}

- (NSDate)date
{
  v35[1] = *MEMORY[0x1E4F143B8];
  date = self->_date;
  if (!date)
  {
    double v4 = [MEMORY[0x1E4F1C9C8] distantPast];
    uint64_t v5 = self->_date;
    self->_date = v4;

    id v6 = @"LOL";
    switch([(PXSearchResultsValue *)self collectionType])
    {
      case 0uLL:
      case 4uLL:
        goto LABEL_6;
      case 2uLL:
        uint64_t v7 = (void *)MEMORY[0x1E4F39160];
        goto LABEL_5;
      case 3uLL:
        uint64_t v7 = (void *)MEMORY[0x1E4F38EE8];
LABEL_5:
        id v8 = [(PXSearchResultsValue *)self collectionUUID];
        id v6 = [v7 localIdentifierWithUUID:v8];

        if (!v6) {
          goto LABEL_9;
        }
LABEL_6:
        uint64_t v9 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
        id v10 = [v9 librarySpecificFetchOptions];

        [v10 setFetchLimit:1];
        uint64_t v11 = (void *)MEMORY[0x1E4F38EE8];
        v35[0] = v6;
        long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
        long long v13 = [v11 fetchAssetCollectionsWithLocalIdentifiers:v12 options:v10];
        long long v14 = [v13 firstObject];

        if (!v14) {
          goto LABEL_24;
        }
        long long v15 = [v14 startDate];
        if (v15)
        {
          long long v16 = v15;
          long long v17 = v16;
        }
        else
        {
          long long v16 = [(PXSearchResultsValue *)self _startDateForAssetCollection:v14];
          long long v17 = 0;
        }
        goto LABEL_22;
      default:
LABEL_9:
        id v6 = [(PXSearchResultsValue *)self assetUUIDs];
        if (![(__CFString *)v6 count]) {
          goto LABEL_25;
        }
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v6 = v6;
        uint64_t v18 = [(__CFString *)v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v30;
          do
          {
            uint64_t v21 = 0;
            do
            {
              if (*(void *)v30 != v20) {
                objc_enumerationMutation(v6);
              }
              v22 = objc_msgSend(MEMORY[0x1E4F38EB8], "localIdentifierWithUUID:", *(void *)(*((void *)&v29 + 1) + 8 * v21), (void)v29);
              if (v22) {
                [v10 addObject:v22];
              }

              ++v21;
            }
            while (v19 != v21);
            uint64_t v19 = [(__CFString *)v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
          }
          while (v19);
        }

        v23 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
        long long v14 = [v23 librarySpecificFetchOptions];

        v24 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
        v33 = v24;
        v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
        [v14 setSortDescriptors:v25];

        [v14 setFetchLimit:1];
        v26 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v10 options:v14];
        long long v17 = [v26 firstObject];

        if (!v17) {
          goto LABEL_23;
        }
        long long v16 = [v17 creationDate];
LABEL_22:
        v27 = self->_date;
        self->_date = v16;

LABEL_23:
LABEL_24:

LABEL_25:
        date = self->_date;
        break;
    }
  }
  return date;
}

- (void)_computeScoreWithMaxGroupedResultsCount:(unint64_t)a3
{
  double v4 = fmax((double)[(PXSearchResultsValue *)self approximateCount] / (double)a3, 0.0);
  if (v4 > 1.0) {
    double v4 = 1.0;
  }
  self->_double score = v4;
}

- (unint64_t)_plCategoryForPlSearchResult:(id)a3
{
  return [a3 categoryAtIndex:0];
}

- (BOOL)isOCRStringMatchedResult
{
  id v3 = [(PXSearchResultsValue *)self searchResult];
  unint64_t v4 = [(PXSearchResultsValue *)self _plCategoryForPlSearchResult:v3];

  return v4 - 1203 < 2;
}

- (void)fetchAllUUIDs:(id)a3
{
  id v8 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PXSearchResultsValue.m" lineNumber:394 description:@"expect main thread"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(PLSearchResult *)self->_searchResult assetUUIDs];
    if ([(PXSearchResultsValue *)self isAssetResult]) {
      [(PXSearchResultsValue *)self _setAssetUUIDs:v5];
    }
  }
  id v6 = v8;
  if (v8)
  {
    (*((void (**)(id))v8 + 2))(v8);
    id v6 = v8;
  }
}

- (void)fetchRemainingUUIDs:(id)a3
{
  uint64_t v5 = (void (**)(void))a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PXSearchResultsValue.m" lineNumber:375 description:@"expect main thread"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = self->_searchResult;
    uint64_t v7 = [(PLSearchResult *)v6 assetUUIDs];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__PXSearchResultsValue_fetchRemainingUUIDs___block_invoke;
    block[3] = &unk_1E5DD0E78;
    block[4] = self;
    id v11 = v7;
    long long v12 = v5;
    id v8 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else if (v5)
  {
    v5[2](v5);
  }
}

uint64_t __44__PXSearchResultsValue_fetchRemainingUUIDs___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isAssetResult]) {
    [*(id *)(a1 + 32) _setAssetUUIDs:*(void *)(a1 + 40)];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (BOOL)isSingletonPersonResult
{
  v2 = [(PXSearchResultsValue *)self searchResult];
  char v3 = [v2 isSinglePersonOrPetResult];

  return v3;
}

- (BOOL)isAssetResult
{
  v2 = [(PXSearchResultsValue *)self collectionUUID];
  BOOL v3 = v2 == 0;

  return v3;
}

- (NSString)displaySubtitle
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PXSearchResultsValue.m" lineNumber:232 description:@"expect main thread"];
  }
  displaySubtitle = self->_displaySubtitle;
  if (!displaySubtitle)
  {
    uint64_t v5 = self->_searchResult;
    if (![(PLSearchResult *)v5 groupCount])
    {
      uint64_t v7 = 0;
      goto LABEL_61;
    }
    uint64_t v6 = [(PXSearchResultsValue *)self _plCategoryForPlSearchResult:v5];
    uint64_t v7 = 0;
    if (v6 <= 1499)
    {
      if (v6 <= 1099)
      {
        if ((unint64_t)(v6 - 1) >= 0xE)
        {
          switch(v6)
          {
            case 1000:
              id v8 = @"SEARCH_CATEGORY_HOME";
              goto LABEL_59;
            case 1001:
              id v8 = @"SEARCH_CATEGORY_WORK";
              goto LABEL_59;
            case 1002:
              goto LABEL_17;
            case 1003:
            case 1004:
              id v8 = @"SEARCH_CATEGORY_POI";
              goto LABEL_59;
            case 1005:
            case 1006:
              id v8 = @"SEARCH_CATEGORY_ROI";
              goto LABEL_59;
            default:
              goto LABEL_61;
          }
          goto LABEL_61;
        }
LABEL_17:
        uint64_t v9 = [(PLSearchResult *)v5 owningContentString];
        goto LABEL_60;
      }
      if (v6 <= 1299)
      {
        if ((unint64_t)(v6 - 1100) > 7)
        {
          switch(v6)
          {
            case 1200:
              id v8 = @"SEARCH_CATEGORY_KEYWORD";
              goto LABEL_59;
            case 1201:
              id v8 = @"SEARCH_CATEGORY_TITLE";
              goto LABEL_59;
            case 1202:
              id v8 = @"SEARCH_CATEGORY_DESCRIPTION";
              goto LABEL_59;
            case 1203:
            case 1204:
            case 1205:
              id v8 = @"SEARCH_CATEGORY_OCR_TEXT";
              goto LABEL_59;
            default:
              goto LABEL_61;
          }
          goto LABEL_61;
        }
        if (v6 == 1103) {
          id v8 = @"SEARCH_CATEGORY_HOLIDAY";
        }
        else {
          id v8 = @"SEARCH_CATEGORY_DATE";
        }
        goto LABEL_59;
      }
      char v10 = v6 - 20;
      if ((unint64_t)(v6 - 1300) > 0x1F)
      {
LABEL_41:
        if (v6 == 1400)
        {
          id v8 = @"SEARCH_CATEGORY_ALBUM_TITLE";
          goto LABEL_59;
        }
        if (v6 == 1401)
        {
          id v8 = @"SEARCH_CATEGORY_MEMORY_TITLE";
          goto LABEL_59;
        }
        goto LABEL_61;
      }
      if (((1 << v10) & 0x300400) == 0)
      {
        if (((1 << v10) & 3) != 0)
        {
          id v8 = @"SEARCH_UNNAMED_RESULTS_PERSON_TITLE";
          goto LABEL_59;
        }
        if (((1 << v10) & 0xC0000000) != 0)
        {
          id v8 = @"SEARCH_UNNAMED_RESULTS_PETS_TITLE";
          goto LABEL_59;
        }
        goto LABEL_41;
      }
LABEL_36:
      uint64_t v9 = PXLocalizedSharedLibraryString(@"PXSharedLibrary_SearchResultsSubtitle_InSharedLibrary");
LABEL_60:
      uint64_t v7 = (void *)v9;
      goto LABEL_61;
    }
    if (v6 <= 1899)
    {
      if (v6 <= 1599)
      {
        if ((unint64_t)(v6 - 1500) > 0x29 || ((1 << (v6 + 36)) & 0x300C0300C03) == 0) {
          goto LABEL_61;
        }
        id v8 = @"SEARCH_CATEGORY_SCENE";
        goto LABEL_59;
      }
      if (v6 > 1700)
      {
        if ((unint64_t)(v6 - 1800) >= 4)
        {
          if (v6 == 1701)
          {
            id v8 = @"SEARCH_CATEGORY_BUSINESS_CATEGORY";
            goto LABEL_59;
          }
          goto LABEL_61;
        }
        goto LABEL_36;
      }
      if ((unint64_t)(v6 - 1600) > 0xB || ((1 << (v6 - 64)) & 0xC03) == 0)
      {
        if (v6 == 1700)
        {
          id v8 = @"SEARCH_CATEGORY_BUSINESS_NAME";
          goto LABEL_59;
        }
        goto LABEL_61;
      }
      id v8 = @"SEARCH_CATEGORY_MEANING";
    }
    else
    {
      if (v6 > 1999)
      {
        switch(v6)
        {
          case 2000:
            id v8 = @"SEARCH_RESULT_SECTION_HEADER_ALBUMS";
            goto LABEL_59;
          case 2100:
            id v8 = @"SEARCH_CATEGORY_FILENAME";
            goto LABEL_59;
          case 2200:
            id v8 = @"SEARCH_CATEGORY_SAVED_FROM_APP";
            goto LABEL_59;
        }
LABEL_61:
        if ([(NSString *)self->_dateFilterString length])
        {
          uint64_t v11 = [v7 stringByAppendingFormat:@", %@", self->_dateFilterString];

          uint64_t v7 = (void *)v11;
        }
        long long v12 = self->_displaySubtitle;
        self->_displaySubtitle = (NSString *)v7;

        displaySubtitle = self->_displaySubtitle;
        goto LABEL_64;
      }
      if ((unint64_t)(v6 - 1900) >= 0x14) {
        goto LABEL_61;
      }
      id v8 = @"SEARCH_CATEGORY_MEDIA_TYPE";
    }
LABEL_59:
    uint64_t v9 = PXLocalizedStringFromTable(v8, @"PhotosUICore");
    goto LABEL_60;
  }
LABEL_64:
  return displaySubtitle;
}

- (NSString)displayTitle
{
  return [(NSAttributedString *)self->_attributedDisplayTitle string];
}

- (id)displayTitleWithDefaultAttributes:(id)a3 dimmedAttributes:(id)a4 selectedDisplayTitle:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v61 = [MEMORY[0x1E4F28B00] currentHandler];
    [v61 handleFailureInMethod:a2 object:self file:@"PXSearchResultsValue.m" lineNumber:89 description:@"expect main thread"];
  }
  uint64_t v11 = PXLocalizedStringFromTable(@"SEARCH_CATEGORY_DELIMITER", @"PhotosUICore");
  attributedDisplayTitle = self->_attributedDisplayTitle;
  if (!attributedDisplayTitle)
  {
    v68 = a5;
    v71 = v11;
    id v19 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    id v69 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    uint64_t v20 = [(PLSearchResult *)self->_searchResult contentStrings];
    uint64_t v21 = [(PLSearchResult *)self->_searchResult matchRanges];
    v22 = +[PXSearchTitlesSpec searchItalicTitleAttributes];
    id v67 = v10;
    if ([v21 count]) {
      v23 = v10;
    }
    else {
      v23 = v9;
    }
    id v24 = v23;
    uint64_t v97 = 0;
    v98 = &v97;
    uint64_t v99 = 0x3032000000;
    v100 = __Block_byref_object_copy__69678;
    v101 = __Block_byref_object_dispose__69679;
    id v102 = 0;
    uint64_t v91 = 0;
    v92 = &v91;
    uint64_t v93 = 0x3032000000;
    v94 = __Block_byref_object_copy__69678;
    v95 = __Block_byref_object_dispose__69679;
    id v96 = 0;
    uint64_t v85 = 0;
    v86 = &v85;
    uint64_t v87 = 0x3032000000;
    v88 = __Block_byref_object_copy__69678;
    v89 = __Block_byref_object_dispose__69679;
    id v90 = 0;
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __96__PXSearchResultsValue_displayTitleWithDefaultAttributes_dimmedAttributes_selectedDisplayTitle___block_invoke;
    v73[3] = &unk_1E5DB5858;
    v73[4] = self;
    v81 = &v85;
    id v25 = v22;
    id v74 = v25;
    id v72 = v24;
    id v75 = v72;
    id v65 = v21;
    id v66 = v9;
    id v76 = v65;
    SEL v84 = a2;
    id v26 = v9;
    id v77 = v26;
    v82 = &v91;
    v83 = &v97;
    id v27 = v19;
    uint64_t v11 = v71;
    id v28 = v27;
    id v78 = v27;
    id v64 = v71;
    id v79 = v64;
    id v29 = v69;
    id v80 = v29;
    v70 = v20;
    [v20 enumerateObjectsUsingBlock:v73];
    long long v30 = (void *)v86[5];
    v86[5] = 0;

    long long v31 = (void *)v98[5];
    if (v92[5])
    {
      if (v31)
      {
        id v32 = v25;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v34 = [WeakRetained dateFormatter];

        v35 = [(id)v98[5] string];
        v36 = [(id)v92[5] string];
        v37 = (void *)[v34 newLocalizedStringFromYear:v35 month:v36];

        v38 = [(id)v98[5] string];
        uint64_t v39 = [v37 rangeOfString:v38];
        uint64_t v63 = v40;
        uint64_t v41 = v39;

        v42 = [(id)v92[5] string];
        uint64_t v43 = [v37 rangeOfString:v42];
        uint64_t v62 = v44;
        uint64_t v45 = v43;

        if (!v37 || v41 == 0x7FFFFFFFFFFFFFFFLL || v45 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v46 = (void *)[(id)v92[5] mutableCopy];
          v49 = [v46 mutableString];
          [v49 appendString:v64];

          [v46 appendAttributedString:v98[5]];
        }
        else
        {
          v46 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v37 attributes:0];
          objc_msgSend(v46, "addAttributes:range:", v26, v45, v62);
          objc_msgSend(v46, "addAttributes:range:", v26, v41, v63);
        }
        v50 = (void *)v86[5];
        v86[5] = (uint64_t)v46;

        uint64_t v11 = v71;
        goto LABEL_24;
      }
      long long v31 = (void *)v92[5];
    }
    else if (!v31)
    {
LABEL_25:
      if (v86[5])
      {
        if ([v28 length])
        {
          v51 = [v28 mutableString];
          [v51 appendString:v64];
        }
        [v28 appendAttributedString:v86[5]];
        if ([v29 length]) {
          [v29 appendString:v64];
        }
        v52 = [(id)v86[5] string];
        [v29 appendString:v52];
      }
      if (self->_transientToken)
      {
        id v53 = objc_alloc(MEMORY[0x1E4F28B18]);
        v54 = [NSString stringWithFormat:@" from %@", self->_transientToken];
        v55 = (void *)[v53 initWithString:v54 attributes:v72];
        [v28 appendAttributedString:v55];
      }
      v56 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
      objc_msgSend(v28, "px_attributedStringByDeletingCharactersInSet:", v56);
      v57 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
      v58 = self->_attributedDisplayTitle;
      self->_attributedDisplayTitle = v57;

      selectedDisplayTitle = self->_selectedDisplayTitle;
      self->_selectedDisplayTitle = (NSString *)v29;
      id v60 = v29;

      _Block_object_dispose(&v85, 8);
      _Block_object_dispose(&v91, 8);

      _Block_object_dispose(&v97, 8);
      id v10 = v67;
      a5 = v68;
      id v9 = v66;
      if (v68) {
        goto LABEL_7;
      }
      goto LABEL_8;
    }
    id v32 = v25;
    v47 = v86;
    id v48 = v31;
    v34 = (void *)v47[5];
    v47[5] = (uint64_t)v48;
LABEL_24:

    id v25 = v32;
    goto LABEL_25;
  }
  long long v13 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  BOOL v14 = +[PXSearchDisplayUtility attributedStringFontNeedsUpdate:attributedDisplayTitle currentFont:v13];

  if (v14)
  {
    long long v15 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:self->_attributedDisplayTitle];
    -[NSAttributedString addAttributes:range:](v15, "addAttributes:range:", v9, 0, [(NSAttributedString *)v15 length]);
    long long v16 = self->_attributedDisplayTitle;
    self->_attributedDisplayTitle = v15;
  }
  if (a5) {
LABEL_7:
  }
    *a5 = self->_selectedDisplayTitle;
LABEL_8:
  long long v17 = self->_attributedDisplayTitle;

  return v17;
}

void __96__PXSearchResultsValue_displayTitleWithDefaultAttributes_dimmedAttributes_selectedDisplayTitle___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 152) categoryAtIndex:a3];
  if ([v5 length])
  {
    if ([v5 length] || (PLSearchIndexCategoryIsPet() & 1) == 0)
    {
LABEL_16:
      uint64_t v16 = [objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v5 attributes:*(void *)(a1 + 48)];
      uint64_t v17 = *(void *)(*(void *)(a1 + 96) + 8);
      uint64_t v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;

      [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) beginEditing];
      id v10 = [*(id *)(a1 + 56) objectAtIndex:a3];
      uint64_t v34 = MEMORY[0x1E4F143A8];
      uint64_t v35 = 3221225472;
      v36 = __96__PXSearchResultsValue_displayTitleWithDefaultAttributes_dimmedAttributes_selectedDisplayTitle___block_invoke_2;
      v37 = &unk_1E5DB5830;
      uint64_t v19 = *(void *)(a1 + 120);
      uint64_t v40 = *(void *)(a1 + 96);
      uint64_t v41 = v19;
      uint64_t v38 = *(void *)(a1 + 32);
      id v39 = *(id *)(a1 + 64);
      [v10 enumerateObjectsUsingBlock:&v34];
      if (((PLSearchIndexCategoryIsPerson() & 1) != 0 || PLSearchIndexCategoryIsPet())
        && objc_msgSend(*(id *)(*(void *)(a1 + 32) + 152), "isMatchedByIdentifierAtIndex:", a3, v34, v35, v36, v37, v38))
      {
        uint64_t v20 = [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) string];
        uint64_t v21 = [v20 rangeOfString:v5];
        uint64_t v23 = v22;

        if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), "px_rangeExists:", v21, v23) & 1) == 0) {
          PXAssertGetLog();
        }
        objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), "setAttributes:range:", *(void *)(a1 + 64), v21, v23);
      }
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), "endEditing", v34, v35, v36, v37, v38);

      goto LABEL_25;
    }
LABEL_15:
    id v11 = objc_alloc(MEMORY[0x1E4F28E48]);
    long long v12 = PXLocalizedStringFromTable(@"SEARCH_UNNAMED_RESULTS_PET_TITLE", @"PhotosUICore");
    uint64_t v13 = [v11 initWithString:v12 attributes:*(void *)(a1 + 40)];
    uint64_t v14 = *(void *)(*(void *)(a1 + 96) + 8);
    long long v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    goto LABEL_26;
  }
  int IsPerson = PLSearchIndexCategoryIsPerson();
  if ([v5 length])
  {
    if (!IsPerson) {
      goto LABEL_16;
    }
  }
  else
  {
    int IsPet = PLSearchIndexCategoryIsPet();
    if ((IsPerson & 1) == 0)
    {
      if (!IsPet) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  if (PLSearchIndexCategoryIsPerson())
  {
    id v9 = @"SEARCH_UNNAMED_RESULTS_PERSON_TITLE";
  }
  else
  {
    if (v6 != 1310)
    {
      id v10 = 0;
      goto LABEL_24;
    }
    id v9 = @"SEARCH_SOCIAL_GROUP_TITLE";
  }
  id v10 = PXLocalizedStringFromTable(v9, @"PhotosUICore");
LABEL_24:
  uint64_t v24 = [objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v10 attributes:*(void *)(a1 + 40)];
  uint64_t v25 = *(void *)(*(void *)(a1 + 96) + 8);
  id v26 = *(void **)(v25 + 40);
  *(void *)(v25 + 40) = v24;

LABEL_25:
LABEL_26:
  if (v6 == 1101)
  {
    id v28 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    uint64_t v27 = *(void *)(a1 + 112);
    goto LABEL_30;
  }
  if (v6 == 1100)
  {
    uint64_t v27 = *(void *)(a1 + 104);
    id v28 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
LABEL_30:
    uint64_t v29 = *(void *)(v27 + 8);
    id v30 = v28;
    long long v31 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = v30;
    goto LABEL_36;
  }
  if ([*(id *)(a1 + 72) length])
  {
    id v32 = [*(id *)(a1 + 72) mutableString];
    [v32 appendString:*(void *)(a1 + 80)];
  }
  [*(id *)(a1 + 72) appendAttributedString:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
  if ([*(id *)(a1 + 88) length]) {
    [*(id *)(a1 + 88) appendString:*(void *)(a1 + 80)];
  }
  v33 = *(void **)(a1 + 88);
  long long v31 = [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) string];
  [v33 appendString:v31];
LABEL_36:
}

uint64_t __96__PXSearchResultsValue_displayTitleWithDefaultAttributes_dimmedAttributes_selectedDisplayTitle___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 rangeValue];
  uint64_t v5 = v4;
  if ((objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "px_rangeExists:", v3, v4) & 1) == 0) {
    PXAssertGetLog();
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  return objc_msgSend(v7, "setAttributes:range:", v6, v3, v5);
}

- (BOOL)isFinished
{
  v2 = self;
  uint64_t v3 = [(PXSearchResultsValue *)self delegate];
  LOBYTE(v2) = [v3 searchIsFinished:v2];

  return (char)v2;
}

- (double)score
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__PXSearchResultsValue_score__block_invoke;
  v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __29__PXSearchResultsValue_score__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 16);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSArray)searchTokens
{
  return (NSArray *)[(PLSearchResult *)self->_searchResult searchTokens];
}

- (NSString)searchString
{
  v2 = [(PLSearchResult *)self->_searchResult contentStrings];
  double v3 = [v2 componentsJoinedByString:@" "];

  return (NSString *)v3;
}

- (void)_setCollectionType:(unint64_t)a3 uuid:(id)a4 title:(id)a5 subtitle:(id)a6
{
  id v10 = (NSString *)a4;
  id v11 = (NSString *)a5;
  long long v12 = (NSString *)a6;
  collectionUUID = self->_collectionUUID;
  self->_collectionType = a3;
  self->_collectionUUID = v10;
  uint64_t v17 = v10;

  collectionTitle = self->_collectionTitle;
  self->_collectionTitle = v11;
  long long v15 = v11;

  collectionSubtitle = self->_collectionSubtitle;
  self->_collectionSubtitle = v12;
}

- (PXSearchResultsValue)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXSearchResultsValue;
  v2 = [(PXSearchResultsValue *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create(0, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

@end