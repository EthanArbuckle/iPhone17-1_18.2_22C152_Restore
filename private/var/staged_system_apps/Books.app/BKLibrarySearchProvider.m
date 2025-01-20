@interface BKLibrarySearchProvider
- (BKLibrarySearchProvider)initWithFetchRequest:(id)a3 name:(id)a4 searchTerm:(id)a5 limit:(unint64_t)a6;
- (BKLibrarySearchProvider)initWithFetchRequest:(id)a3 name:(id)a4 searchTerm:(id)a5 limit:(unint64_t)a6 moc:(id)a7;
- (id)_assetDictionariesForDynamicArrayWithFetchRequest:(id)a3 isInitialFetch:(BOOL)a4 matchedAssets:(id)a5;
- (id)_classifyAllResultsWithSearchItemStatus:(id)a3 searchItemStatus:(int64_t)a4;
- (id)_classifyResultsSearchItemStatus:(id)a3 wideningSearch:(BOOL)a4;
- (unint64_t)resultClassificationLimit;
- (void)_commonInitWithSearchTerm:(id)a3 limit:(unint64_t)a4;
- (void)setResultClassificationLimit:(unint64_t)a3;
- (void)updateSearchResultEntityType:(int64_t)a3;
- (void)updateSearchTerm:(id)a3;
- (void)updateSearchTerm:(id)a3 resettingResultType:(BOOL)a4;
@end

@implementation BKLibrarySearchProvider

- (BKLibrarySearchProvider)initWithFetchRequest:(id)a3 name:(id)a4 searchTerm:(id)a5 limit:(unint64_t)a6 moc:(id)a7
{
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BKLibrarySearchProvider;
  v13 = [(BKLibraryProvider *)&v16 initWithFetchRequest:a3 name:a4 moc:a7];
  v14 = v13;
  if (v13) {
    [(BKLibrarySearchProvider *)v13 _commonInitWithSearchTerm:v12 limit:a6];
  }

  return v14;
}

- (BKLibrarySearchProvider)initWithFetchRequest:(id)a3 name:(id)a4 searchTerm:(id)a5 limit:(unint64_t)a6
{
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BKLibrarySearchProvider;
  v11 = [(BKLibraryProvider *)&v14 initWithFetchRequest:a3 name:a4];
  id v12 = v11;
  if (v11) {
    [(BKLibrarySearchProvider *)v11 _commonInitWithSearchTerm:v10 limit:a6];
  }

  return v12;
}

- (void)_commonInitWithSearchTerm:(id)a3 limit:(unint64_t)a4
{
  self->_resultClassificationLimit = a4;
  [(BKLibrarySearchProvider *)self updateSearchTerm:a3];
}

- (void)updateSearchTerm:(id)a3
{
}

- (void)updateSearchTerm:(id)a3 resettingResultType:(BOOL)a4
{
  BOOL v4 = a4;
  id v15 = a3;
  v7 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  v8 = [v15 stringByTrimmingCharactersInSet:v7];

  id v9 = [v8 length];
  currentSearchTerm = self->_currentSearchTerm;
  if (v9)
  {
    objc_storeStrong((id *)&self->_previousSearchTerm, currentSearchTerm);
    objc_storeStrong((id *)&self->_currentSearchTerm, a3);
    self->_previousSearchResultEntityType = self->_currentSearchResultEntityType;
    if (v4)
    {
      int64_t currentSearchResultEntityType = 0;
      self->_int64_t currentSearchResultEntityType = 0;
    }
    else
    {
      int64_t currentSearchResultEntityType = self->_currentSearchResultEntityType;
    }
    v13 = +[BKLibraryManager searchFetchRequestWithText:v8 entityType:currentSearchResultEntityType];
    objc_super v14 = +[BSUIAsset propertiesNeededFromBKLibraryAsset];
    [v13 setPropertiesToFetch:v14];
  }
  else
  {
    self->_currentSearchTerm = 0;

    previousSearchTerm = self->_previousSearchTerm;
    self->_previousSearchTerm = 0;

    v13 = 0;
    if (v4)
    {
      v13 = 0;
      self->_int64_t currentSearchResultEntityType = 0;
      self->_previousSearchResultEntityType = 0;
    }
  }
  [(BKLibraryProvider *)self configureFetchedResultsControllerWithFetchRequest:v13];
}

- (void)updateSearchResultEntityType:(int64_t)a3
{
  int64_t currentSearchResultEntityType = self->_currentSearchResultEntityType;
  if (currentSearchResultEntityType == a3) {
    return;
  }
  self->_previousSearchResultEntityType = currentSearchResultEntityType;
  self->_int64_t currentSearchResultEntityType = a3;
  objc_storeStrong((id *)&self->_previousSearchTerm, self->_currentSearchTerm);
  currentSearchTerm = self->_currentSearchTerm;
  v7 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v13 = [(NSString *)currentSearchTerm stringByTrimmingCharactersInSet:v7];

  if (a3 == 4)
  {
    v8 = [(BKLibraryProvider *)self dynamicArray];
    [v8 updateArray:&__NSArray0__struct];

    id v9 = [(BKLibraryProvider *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      v11 = [(BKLibraryProvider *)self delegate];
      [v11 libraryProvider:self contentDidLoad:&__NSArray0__struct];
LABEL_7:
    }
  }
  else if ([v13 length])
  {
    v11 = +[BKLibraryManager searchFetchRequestWithText:v13 entityType:a3];
    id v12 = +[BSUIAsset propertiesNeededFromBKLibraryAsset];
    [v11 setPropertiesToFetch:v12];

    [(BKLibraryProvider *)self configureFetchedResultsControllerWithFetchRequest:v11];
    goto LABEL_7;
  }
}

- (id)_assetDictionariesForDynamicArrayWithFetchRequest:(id)a3 isInitialFetch:(BOOL)a4 matchedAssets:(id)a5
{
  BOOL v5 = a4;
  v17.receiver = self;
  v17.super_class = (Class)BKLibrarySearchProvider;
  v7 = [(BKLibraryProvider *)&v17 _assetDictionariesForDynamicArrayWithFetchRequest:a3 isInitialFetch:a4 matchedAssets:a5];
  v8 = v7;
  if (v5 && [v7 count])
  {
    int64_t currentSearchResultEntityType = self->_currentSearchResultEntityType;
    if (currentSearchResultEntityType == self->_previousSearchResultEntityType)
    {
      if (![(NSString *)self->_previousSearchTerm hasPrefix:self->_currentSearchTerm])
      {
        if (self->_previousSearchTerm && -[NSString hasPrefix:](self->_currentSearchTerm, "hasPrefix:")) {
          goto LABEL_15;
        }
        goto LABEL_13;
      }
    }
    else
    {
      currentSearchTerm = self->_currentSearchTerm;
      if (currentSearchTerm != self->_previousSearchTerm)
      {
        if (!-[NSString isEqualToString:](currentSearchTerm, "isEqualToString:")) {
          goto LABEL_13;
        }
        int64_t currentSearchResultEntityType = self->_currentSearchResultEntityType;
      }
      if (currentSearchResultEntityType)
      {
        if (!self->_previousSearchResultEntityType)
        {
LABEL_15:
          id v12 = self;
          id v13 = v8;
          uint64_t v14 = 0;
          goto LABEL_16;
        }
LABEL_13:
        uint64_t v11 = [(BKLibrarySearchProvider *)self _classifyAllResultsWithSearchItemStatus:v8 searchItemStatus:1];
LABEL_17:
        id v15 = (void *)v11;

        v8 = v15;
        goto LABEL_18;
      }
    }
    id v12 = self;
    id v13 = v8;
    uint64_t v14 = 1;
LABEL_16:
    uint64_t v11 = [(BKLibrarySearchProvider *)v12 _classifyResultsSearchItemStatus:v13 wideningSearch:v14];
    goto LABEL_17;
  }
LABEL_18:

  return v8;
}

- (id)_classifyAllResultsWithSearchItemStatus:(id)a3 searchItemStatus:(int64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [v15 mutableCopy];
        id v13 = +[NSNumber numberWithInteger:a4];
        [v12 setObject:v13 forKeyedSubscript:@"searchItemStatus"];

        [v6 addObject:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)_classifyResultsSearchItemStatus:(id)a3 wideningSearch:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(BKLibraryProvider *)self dynamicArray];
  id v8 = [v7 internalArray];

  if ([v8 count])
  {
    id v24 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v9 = BSUIAssetKeyAssetID;
    uint64_t v10 = [v6 valueForKey:BSUIAssetKeyAssetID];
    uint64_t v11 = [v8 valueForKey:v9];
    id v12 = +[NSSet setWithArray:v10];
    id v13 = +[NSSet setWithArray:v11];
    id v14 = [v12 mutableCopy];
    [v14 minusSet:v13];
    id v15 = [v13 mutableCopy];
    [v15 minusSet:v12];
    if (v4)
    {
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_1000E44DC;
      v31[3] = &unk_100A46668;
      id v32 = v14;
      uint64_t v16 = (uint64_t)[v10 indexOfObjectWithOptions:2 passingTest:v31];
    }
    else
    {
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000E4514;
    v25[3] = &unk_100A46690;
    id v26 = v14;
    id v27 = v15;
    uint64_t v30 = v16;
    id v28 = v11;
    id v18 = v24;
    id v29 = v18;
    id v19 = v11;
    id v20 = v15;
    id v21 = v14;
    [v6 enumerateObjectsUsingBlock:v25];
    v22 = v29;
    id v17 = v18;
  }
  else
  {
    id v17 = [(BKLibrarySearchProvider *)self _classifyAllResultsWithSearchItemStatus:v6 searchItemStatus:1];
  }

  return v17;
}

- (unint64_t)resultClassificationLimit
{
  return self->_resultClassificationLimit;
}

- (void)setResultClassificationLimit:(unint64_t)a3
{
  self->_resultClassificationLimit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousSearchTerm, 0);

  objc_storeStrong((id *)&self->_currentSearchTerm, 0);
}

@end