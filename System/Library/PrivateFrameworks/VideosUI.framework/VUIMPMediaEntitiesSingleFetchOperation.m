@interface VUIMPMediaEntitiesSingleFetchOperation
+ (id)_sortIndexesWithMediaQuerySection:(id)a3;
- (BOOL)_isSortingBeingPerformedByMediaQuery;
- (BOOL)_shouldSortUsingMediaQuery;
- (BOOL)processPredicateAfterFetch;
- (BOOL)processRangeAfterFetch;
- (MPMediaPredicate)mediaQueryPredicate;
- (NSArray)mediaQuerySortOrderingProperties;
- (NSArray)postFetchSortDescriptors;
- (NSDictionary)mediaQuerySortOrderingDirectionMappings;
- (NSError)error;
- (NSMutableSet)prefetchProperties;
- (VUIMPMediaEntitiesSingleFetchOperation)init;
- (VUIMPMediaEntitiesSingleFetchOperation)initWithMediaLibrary:(id)a3 request:(id)a4;
- (VUIMPMediaLibrary)mediaLibrary;
- (VUIMediaEntityFetchRequest)request;
- (VUIMediaEntityFetchResponse)response;
- (VUIMediaEntityKind)mediaEntityKind;
- (VUIMediaEntityType)currentFetchMediaEntityType;
- (id)_baseMediaQuery;
- (id)_bitTestMediaQueryPropertyPredicateWithKeyPathBitTestExpression:(id)a3 operatorType:(unint64_t)a4 constantExpression:(id)a5;
- (id)_coalesceResponses:(id)a3;
- (id)_collectionsFetchResponseWithMediaQuery:(id)a3;
- (id)_fetchResponseWithMediaEntities:(id)a3 mediaQuerySections:(id)a4;
- (id)_itemsFetchResponseWithMediaQuery:(id)a3;
- (id)_keyPathMediaQueryPropertyPredicateWithKeyPathExpression:(id)a3 operatorType:(unint64_t)a4 constantExpression:(id)a5;
- (id)_mediaEntities:(id)a3 subarrayWithRange:(_NSRange)a4;
- (id)_mediaEntityKind;
- (id)_mediaEntityPropertyDescriptorForFilteringWithKeyPath:(id)a3;
- (id)_mediaQuery;
- (id)_mediaQueryPredicateForCompoundPredicate:(id)a3;
- (id)_mediaQueryPredicateForPredicate:(id)a3;
- (id)_mediaQueryPropertyPredicateForComparisonPredicate:(id)a3;
- (id)_processFetchedMediaEntities:(id)a3;
- (id)_uniqueMediaCollectionsBySeasonNumber:(id)a3;
- (void)_addEntityLimitToMediaQuery:(id)a3;
- (void)_addPredicateToMediaQuery:(id)a3;
- (void)_addPrefetchPropertiesToMediaQuery:(id)a3;
- (void)_addSortingPropertiesToMediaQuery:(id)a3;
- (void)_populatePrefetchProperties;
- (void)_processPredicate;
- (void)_processRange;
- (void)_processSortDescriptors;
- (void)executionDidBegin;
- (void)setCurrentFetchMediaEntityType:(id)a3;
- (void)setError:(id)a3;
- (void)setMediaEntityKind:(id)a3;
- (void)setMediaLibrary:(id)a3;
- (void)setMediaQueryPredicate:(id)a3;
- (void)setMediaQuerySortOrderingDirectionMappings:(id)a3;
- (void)setMediaQuerySortOrderingProperties:(id)a3;
- (void)setPostFetchSortDescriptors:(id)a3;
- (void)setPrefetchProperties:(id)a3;
- (void)setProcessPredicateAfterFetch:(BOOL)a3;
- (void)setProcessRangeAfterFetch:(BOOL)a3;
- (void)setRequest:(id)a3;
- (void)setResponse:(id)a3;
@end

@implementation VUIMPMediaEntitiesSingleFetchOperation

- (VUIMPMediaEntitiesSingleFetchOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIMPMediaEntitiesSingleFetchOperation)initWithMediaLibrary:(id)a3 request:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"mediaLibrary" format];
    if (v9) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"request" format];
LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)VUIMPMediaEntitiesSingleFetchOperation;
  v10 = [(VUIMPMediaEntitiesSingleFetchOperation *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_request, a4);
    objc_storeStrong((id *)&v11->_mediaLibrary, a3);
    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    prefetchProperties = v11->_prefetchProperties;
    v11->_prefetchProperties = v12;
  }
  return v11;
}

- (void)setResponse:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_response)
  {
    v5 = [(VUIMPMediaEntitiesSingleFetchOperation *)self _coalesceResponses:v4];
  }
  else
  {
    v5 = (VUIMediaEntityFetchResponse *)v4;
  }
  response = self->_response;
  self->_response = v5;
}

- (void)executionDidBegin
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v16 = [(VUIMPMediaEntitiesSingleFetchOperation *)self request];
  objc_super v15 = [v16 options];
  int v3 = objc_msgSend(v15, "vui_BOOLForKey:defaultValue:", @"CheckHasItems", 0);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [(VUIMPMediaEntitiesSingleFetchOperation *)self request];
  v5 = [v4 mediaEntityTypes];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_storeStrong((id *)&self->_currentFetchMediaEntityType, *(id *)(*((void *)&v17 + 1) + 8 * v9));
        v10 = [(VUIMPMediaEntitiesSingleFetchOperation *)self _mediaEntityKind];
        [(VUIMPMediaEntitiesSingleFetchOperation *)self setMediaEntityKind:v10];
        [(VUIMPMediaEntitiesSingleFetchOperation *)self _populatePrefetchProperties];
        [(VUIMPMediaEntitiesSingleFetchOperation *)self _processRange];
        [(VUIMPMediaEntitiesSingleFetchOperation *)self _processSortDescriptors];
        [(VUIMPMediaEntitiesSingleFetchOperation *)self _processPredicate];
        v11 = [(VUIMPMediaEntitiesSingleFetchOperation *)self _mediaQuery];
        if ([(VUIMediaEntityType *)self->_currentFetchMediaEntityType subtype])
        {
          if (v3)
          {
            v12 = objc_alloc_init(VUIMediaEntityFetchResponse);
            uint64_t v13 = [v11 _hasCollections];
LABEL_11:
            [(VUIMediaEntityFetchResponse *)v12 setHasDataForCheckHasItemsOption:v13];
            goto LABEL_15;
          }
          uint64_t v14 = [(VUIMPMediaEntitiesSingleFetchOperation *)self _collectionsFetchResponseWithMediaQuery:v11];
        }
        else
        {
          if (v3)
          {
            v12 = objc_alloc_init(VUIMediaEntityFetchResponse);
            uint64_t v13 = [v11 _hasItems];
            goto LABEL_11;
          }
          uint64_t v14 = [(VUIMPMediaEntitiesSingleFetchOperation *)self _itemsFetchResponseWithMediaQuery:v11];
        }
        v12 = (VUIMediaEntityFetchResponse *)v14;
LABEL_15:
        [(VUIMPMediaEntitiesSingleFetchOperation *)self setResponse:v12];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  [(VUIAsynchronousOperation *)self finishExecutionIfPossible];
}

- (void)_processRange
{
  int v3 = [(VUIMPMediaEntitiesSingleFetchOperation *)self request];
  [v3 range];
  uint64_t v5 = v4;

  if (v5)
  {
    [(VUIMPMediaEntitiesSingleFetchOperation *)self setProcessRangeAfterFetch:1];
  }
}

- (BOOL)_shouldSortUsingMediaQuery
{
  int v3 = [(VUIMPMediaEntitiesSingleFetchOperation *)self request];
  uint64_t v4 = [v3 sortDescriptors];

  currentFetchMediaEntityType = self->_currentFetchMediaEntityType;
  uint64_t v6 = +[VUIMediaEntityType episode];
  if (currentFetchMediaEntityType == v6)
  {
    BOOL v9 = 1;
  }
  else if (v4)
  {
    uint64_t v7 = [(VUIMPMediaEntitiesSingleFetchOperation *)self request];
    uint64_t v8 = [v7 mediaEntityTypes];
    BOOL v9 = (unint64_t)[v8 count] >= 2 && (unint64_t)objc_msgSend(v4, "count") > 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return !v9;
}

- (void)_processSortDescriptors
{
  v2 = self;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v32 = [(VUIMPMediaEntitiesSingleFetchOperation *)self mediaEntityKind];
  int v3 = [(VUIMPMediaEntitiesSingleFetchOperation *)v2 request];
  uint64_t v4 = [v3 sortDescriptors];
  if ([v4 count])
  {
    BOOL v31 = [(VUIMPMediaEntitiesSingleFetchOperation *)v2 _shouldSortUsingMediaQuery];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v4;
    uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v35;
      v27 = v3;
      uint64_t v28 = *MEMORY[0x1E4F1C3C8];
      v25 = v2;
      v26 = v4;
      v30 = v5;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v35 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v12 = [v11 key];
          uint64_t v13 = [v32 propertyDescriptorForName:v12];
          if (!v13) {
            [MEMORY[0x1E4F1CA00] raise:v28, @"Unknown key for sort descriptor! %@", v12 format];
          }
          uint64_t v14 = [v13 sourcePropertyNames];
          objc_super v15 = v14;
          if (!v31 || (unint64_t)[v14 count] >= 2)
          {

            v21 = [(VUIMPMediaEntitiesSingleFetchOperation *)v25 mediaEntityKind];
            id v33 = 0;
            int v3 = v27;
            uint64_t v22 = [v27 _manualSortDescriptorsWithMediaEntityKind:v21 propertiesRequiredForSort:&v33];
            id v23 = v33;

            v24 = [(VUIMPMediaEntitiesSingleFetchOperation *)v25 prefetchProperties];
            [v24 unionSet:v23];

            [(VUIMPMediaEntitiesSingleFetchOperation *)v25 setPostFetchSortDescriptors:v22];
            [(VUIMPMediaEntitiesSingleFetchOperation *)v25 setProcessRangeAfterFetch:1];

            uint64_t v4 = v26;
            id v5 = v30;
            goto LABEL_20;
          }
          v16 = [v15 allObjects];
          long long v17 = [v16 firstObject];

          [v30 addObject:v17];
          if ([v11 ascending]) {
            uint64_t v18 = 1;
          }
          else {
            uint64_t v18 = 2;
          }
          long long v19 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v18];
          [v6 setObject:v19 forKey:v17];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
        uint64_t v4 = v26;
        int v3 = v27;
        v2 = v25;
        id v5 = v30;
        if (v8) {
          continue;
        }
        break;
      }
    }

    long long v20 = VUIDefaultLogObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v39 = v5;
      __int16 v40 = 2112;
      id v41 = v6;
      _os_log_impl(&dword_1E2BD7000, v20, OS_LOG_TYPE_DEFAULT, "Sorting will be performed by MPMediaLibrary using %@ (%@)", buf, 0x16u);
    }

    [(VUIMPMediaEntitiesSingleFetchOperation *)v2 setMediaQuerySortOrderingProperties:v5];
    [(VUIMPMediaEntitiesSingleFetchOperation *)v2 setMediaQuerySortOrderingDirectionMappings:v6];
LABEL_20:
  }
}

- (BOOL)_isSortingBeingPerformedByMediaQuery
{
  v2 = [(VUIMPMediaEntitiesSingleFetchOperation *)self postFetchSortDescriptors];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (void)_processPredicate
{
  BOOL v3 = [(VUIMPMediaEntitiesSingleFetchOperation *)self request];
  uint64_t v4 = [v3 predicate];
  if (v4)
  {
    uint64_t v5 = [(VUIMPMediaEntitiesSingleFetchOperation *)self _mediaQueryPredicateForPredicate:v4];
    if (v5) {
      goto LABEL_5;
    }
    id v6 = objc_msgSend(v4, "vui_keyPathsInPredicate");
    uint64_t v7 = [(VUIMPMediaEntitiesSingleFetchOperation *)self prefetchProperties];
    [v7 unionSet:v6];

    [(VUIMPMediaEntitiesSingleFetchOperation *)self setProcessPredicateAfterFetch:1];
  }
  uint64_t v5 = 0;
LABEL_5:
  id v8 = (id)v5;
  [(VUIMPMediaEntitiesSingleFetchOperation *)self setMediaQueryPredicate:v5];
}

- (id)_mediaQueryPredicateForPredicate:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(VUIMPMediaEntitiesSingleFetchOperation *)self _mediaQueryPredicateForCompoundPredicate:v4];
LABEL_5:
    id v6 = (void *)v5;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(VUIMPMediaEntitiesSingleFetchOperation *)self _mediaQueryPropertyPredicateForComparisonPredicate:v4];
    goto LABEL_5;
  }
  uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  char v8 = [v4 isEqual:v7];

  if ((v8 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unsupported predicate: %@", v4 format];
  }
  id v6 = 0;
LABEL_9:

  return v6;
}

- (id)_mediaQueryPredicateForCompoundPredicate:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [v4 subpredicates];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [(VUIMPMediaEntitiesSingleFetchOperation *)self _mediaQueryPredicateForPredicate:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        if (!v11)
        {

          goto LABEL_13;
        }
        v12 = (void *)v11;
        objc_msgSend(v5, "vui_addObjectIfNotNil:", v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  uint64_t v13 = [v4 compoundPredicateType];
  if (v13 == 2)
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F318F8];
    goto LABEL_15;
  }
  if (v13 == 1)
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F318F0];
LABEL_15:
    objc_super v15 = [v14 predicateMatchingPredicates:v5];
    goto LABEL_16;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unsupported compound predicate: %@", v4 format];
LABEL_13:
  objc_super v15 = 0;
LABEL_16:

  return v15;
}

- (id)_mediaQueryPropertyPredicateForComparisonPredicate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 leftExpression];
  id v6 = [v4 rightExpression];
  uint64_t v7 = [v5 expressionType];
  uint64_t v8 = [v6 expressionType];
  if (v7 == 3 && !v8)
  {
    uint64_t v9 = -[VUIMPMediaEntitiesSingleFetchOperation _keyPathMediaQueryPropertyPredicateWithKeyPathExpression:operatorType:constantExpression:](self, "_keyPathMediaQueryPropertyPredicateWithKeyPathExpression:operatorType:constantExpression:", v5, [v4 predicateOperatorType], v6);
LABEL_6:
    v10 = (void *)v9;
    goto LABEL_8;
  }
  if (objc_msgSend(v5, "vui_isKeyPathBitTestExpression"))
  {
    uint64_t v9 = -[VUIMPMediaEntitiesSingleFetchOperation _bitTestMediaQueryPropertyPredicateWithKeyPathBitTestExpression:operatorType:constantExpression:](self, "_bitTestMediaQueryPropertyPredicateWithKeyPathBitTestExpression:operatorType:constantExpression:", v5, [v4 predicateOperatorType], v6);
    goto LABEL_6;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unsupported expressions in comparison predicate: %@", v4 format];
  v10 = 0;
LABEL_8:

  return v10;
}

- (id)_keyPathMediaQueryPropertyPredicateWithKeyPathExpression:(id)a3 operatorType:(unint64_t)a4 constantExpression:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [a3 keyPath];
  v10 = [(VUIMPMediaEntitiesSingleFetchOperation *)self _mediaEntityPropertyDescriptorForFilteringWithKeyPath:v9];
  if (v10)
  {
    uint64_t v11 = [v8 constantValue];
    uint64_t v12 = [v10 sourceFilterValueBlock];
    uint64_t v13 = (void *)v12;
    if (v12)
    {
      uint64_t v14 = (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v11);

      uint64_t v11 = (void *)v14;
    }
    objc_super v15 = [v10 sourceFilterBlock];
    if (v15)
    {
      v16 = [(VUIMPMediaEntitiesSingleFetchOperation *)self request];
      ((void (**)(void, void *, unint64_t, void *))v15)[2](v15, v16, a4, v11);
    }
    else
    {
      long long v18 = [v10 sourcePropertyNames];
      long long v19 = [v18 allObjects];
      v16 = [v19 firstObject];

      objc_msgSend(MEMORY[0x1E4F31968], "vui_mediaPropertyPredicateWithProperty:predicateOperatorType:value:", v16, a4, v11);
    long long v17 = };
  }
  else
  {
    long long v17 = 0;
  }

  return v17;
}

- (id)_bitTestMediaQueryPropertyPredicateWithKeyPathBitTestExpression:(id)a3 operatorType:(unint64_t)a4 constantExpression:(id)a5
{
  id v8 = a3;
  uint64_t v9 = [a5 constantValue];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![v9 unsignedIntegerValue] && (a4 == 5 || a4 == 2))
  {
    uint64_t v12 = [v8 arguments];
    if ([v12 count] == 2)
    {
      uint64_t v13 = [v12 objectAtIndex:0];
      uint64_t v14 = [v12 objectAtIndex:1];
      v10 = 0;
      if ([v13 expressionType] == 3)
      {
        if ([v14 expressionType])
        {
          v10 = 0;
        }
        else
        {
          objc_super v15 = [v14 constantValue];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v16 = [v13 keyPath];
            long long v17 = [(VUIMPMediaEntitiesSingleFetchOperation *)self _mediaEntityPropertyDescriptorForFilteringWithKeyPath:v16];
            long long v18 = [v17 sourcePropertyNames];
            long long v19 = [v18 allObjects];

            if ([v19 count] == 1)
            {
              [v19 firstObject];
              long long v20 = v21 = v16;
              v10 = [MEMORY[0x1E4F31968] predicateWithValue:v15 forProperty:v20 comparisonType:107];

              v16 = v21;
            }
            else
            {
              v10 = 0;
            }
          }
          else
          {
            v10 = 0;
          }
        }
      }
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_mediaEntityPropertyDescriptorForFilteringWithKeyPath:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(VUIMPMediaEntitiesSingleFetchOperation *)self mediaEntityKind];
  id v6 = [v5 propertyDescriptorForName:v4];
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unknown keypath %@ for entity kind %@", v4, v5 format];
  }
  if ([v6 sourceSupportsFiltering])
  {
    id v7 = v6;
  }
  else
  {
    id v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "Filtering is not supported for keypath %@. Predicate cannot be satisfied by the MPMediaLibrary directly", buf, 0xCu);
    }

    id v7 = 0;
  }

  return v7;
}

- (id)_mediaEntityKind
{
  if ([(VUIMediaEntityType *)self->_currentFetchMediaEntityType subtype])
  {
    currentFetchMediaEntityType = self->_currentFetchMediaEntityType;
    id v4 = +[VUIMediaEntityType show];

    if (currentFetchMediaEntityType == v4)
    {
      v10 = VUIMPShowMediaCollectionKind();
    }
    else
    {
      id v5 = self->_currentFetchMediaEntityType;
      id v6 = +[VUIMediaEntityType season];

      if (v5 == v6)
      {
        v10 = VUIMPSeasonMediaCollectionKind();
      }
      else
      {
        id v7 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v8 = *MEMORY[0x1E4F1C3B8];
        uint64_t v9 = [(VUIMPMediaEntitiesSingleFetchOperation *)self request];
        [v7 raise:v8, @"Unable to determine the VUIMediaEntityKind to use for this request: %@", v9 format];

        v10 = 0;
      }
    }
  }
  else
  {
    v10 = VUIMPMediaItemKind();
  }
  return v10;
}

- (void)_populatePrefetchProperties
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(VUIMPMediaEntitiesSingleFetchOperation *)self prefetchProperties];
  id v4 = [(VUIMPMediaEntitiesSingleFetchOperation *)self mediaEntityKind];
  id v5 = [(VUIMPMediaEntitiesSingleFetchOperation *)self request];
  id v6 = [v5 properties];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v12 = [v4 propertyDescriptorForName:v11];
        if ([v12 retrievesSourcePropertiesAtFetch]) {
          [v3 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (id)_mediaQuery
{
  BOOL v3 = [(VUIMPMediaEntitiesSingleFetchOperation *)self _baseMediaQuery];
  if (v3)
  {
    [(VUIMPMediaEntitiesSingleFetchOperation *)self _addEntityLimitToMediaQuery:v3];
    [(VUIMPMediaEntitiesSingleFetchOperation *)self _addPredicateToMediaQuery:v3];
    [(VUIMPMediaEntitiesSingleFetchOperation *)self _addSortingPropertiesToMediaQuery:v3];
    [(VUIMPMediaEntitiesSingleFetchOperation *)self _addPrefetchPropertiesToMediaQuery:v3];
  }
  return v3;
}

- (id)_baseMediaQuery
{
  BOOL v3 = [(VUIMPMediaEntitiesSingleFetchOperation *)self mediaLibrary];
  id v4 = [v3 mediaLibrary];

  currentFetchMediaEntityType = self->_currentFetchMediaEntityType;
  id v6 = +[VUIMediaEntityType movie];

  if (currentFetchMediaEntityType == v6)
  {
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F31970], "vui_moviesQueryWithMediaLibrary:", v4);
    goto LABEL_11;
  }
  uint64_t v7 = self->_currentFetchMediaEntityType;
  uint64_t v8 = +[VUIMediaEntityType movieRental];

  if (v7 == v8)
  {
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F31970], "vui_movieRentalsQueryWithMediaLibrary:", v4);
LABEL_11:
    uint64_t v11 = (void *)v16;
    if (v16) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  uint64_t v9 = self->_currentFetchMediaEntityType;
  v10 = +[VUIMediaEntityType homeVideo];

  if (v9 == v10)
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F31970], "vui_homeVideosQueryWithMediaLibrary:", v4);
    goto LABEL_14;
  }
  if ([(VUIMediaEntityType *)self->_currentFetchMediaEntityType mediaCategoryType] != 1)
  {
LABEL_15:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Unable to create MPMediaQuery as the supplied media entity type is not supported: %@", self->_currentFetchMediaEntityType format];
    uint64_t v11 = 0;
    goto LABEL_16;
  }
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F31970], "vui_episodesQueryWithMediaLibrary:", v4);
  if (![(VUIMediaEntityType *)self->_currentFetchMediaEntityType subtype])
  {
LABEL_14:
    if (v11) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  uint64_t v12 = self->_currentFetchMediaEntityType;
  long long v13 = +[VUIMediaEntityType season];

  if (v12 == v13)
  {
    uint64_t v18 = v11;
    uint64_t v19 = 1;
  }
  else
  {
    long long v14 = self->_currentFetchMediaEntityType;
    long long v15 = +[VUIMediaEntityType show];

    if (v14 != v15)
    {

      goto LABEL_15;
    }
    uint64_t v18 = v11;
    uint64_t v19 = 8;
  }
  [v18 setGroupingType:v19];
  if (!v11) {
    goto LABEL_15;
  }
LABEL_16:
  [v11 setIgnoreSystemFilterPredicates:1];

  return v11;
}

- (void)_addEntityLimitToMediaQuery:(id)a3
{
  id v6 = a3;
  id v4 = [(VUIMPMediaEntitiesSingleFetchOperation *)self request];
  if (![(VUIMPMediaEntitiesSingleFetchOperation *)self processRangeAfterFetch])
  {
    [v4 range];
    if (v5) {
      [v6 setEntityLimit:v5];
    }
  }
}

- (void)_addPredicateToMediaQuery:(id)a3
{
  id v5 = a3;
  id v4 = [(VUIMPMediaEntitiesSingleFetchOperation *)self mediaQueryPredicate];
  if (v4) {
    [v5 addFilterPredicate:v4];
  }
}

- (void)_addSortingPropertiesToMediaQuery:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(VUIMPMediaEntitiesSingleFetchOperation *)self _isSortingBeingPerformedByMediaQuery];
  id v5 = v8;
  if (v4)
  {
    id v6 = [(VUIMPMediaEntitiesSingleFetchOperation *)self mediaQuerySortOrderingProperties];
    if ([v6 count])
    {
      [v8 _setOrderingProperties:v6];
      uint64_t v7 = [(VUIMPMediaEntitiesSingleFetchOperation *)self mediaQuerySortOrderingDirectionMappings];
      [v8 _setOrderingDirectionMappings:v7];
    }
    id v5 = v8;
  }
}

- (void)_addPrefetchPropertiesToMediaQuery:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v6 = [(VUIMPMediaEntitiesSingleFetchOperation *)self mediaEntityKind];
  uint64_t v7 = [(VUIMPMediaEntitiesSingleFetchOperation *)self prefetchProperties];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [v6 propertyDescriptorForName:*(void *)(*((void *)&v14 + 1) + 8 * v11)];
        long long v13 = [v12 sourcePropertyNames];
        if (v13) {
          [v5 unionSet:v13];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  [v4 setItemPropertiesToFetch:v5];
}

- (id)_processFetchedMediaEntities:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    if ([(VUIMPMediaEntitiesSingleFetchOperation *)self processPredicateAfterFetch])
    {
      id v5 = [(VUIMPMediaEntitiesSingleFetchOperation *)self request];
      id v6 = [v5 predicate];

      if (v6)
      {
        uint64_t v7 = [v4 filteredArrayUsingPredicate:v6];

        id v4 = (id)v7;
      }
    }
    uint64_t v8 = [(VUIMPMediaEntitiesSingleFetchOperation *)self postFetchSortDescriptors];
    if (v8)
    {
      uint64_t v9 = VUIDefaultLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "Sorting media entities returned from MPMediaQuery", buf, 2u);
      }

      uint64_t v10 = [v4 sortedArrayUsingDescriptors:v8];

      id v4 = (id)v10;
    }
    if ([(VUIMPMediaEntitiesSingleFetchOperation *)self processRangeAfterFetch])
    {
      uint64_t v11 = VUIDefaultLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v17 = 0;
        _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "Processing range on media entities returned from MPMediaQuery", v17, 2u);
      }

      uint64_t v12 = [(VUIMPMediaEntitiesSingleFetchOperation *)self request];
      uint64_t v13 = [v12 range];
      uint64_t v15 = -[VUIMPMediaEntitiesSingleFetchOperation _mediaEntities:subarrayWithRange:](self, "_mediaEntities:subarrayWithRange:", v4, v13, v14);

      id v4 = (id)v15;
    }
  }
  return v4;
}

- (id)_mediaEntities:(id)a3 subarrayWithRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v6 = a3;
  uint64_t v7 = v6;
  if (location == 0x7FFFFFFFFFFFFFFFLL
    || !length
    || location + length > [v6 count]
    || (objc_msgSend(v7, "subarrayWithRange:", location, length), (id v8 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v8 = v7;
  }

  return v8;
}

- (id)_itemsFetchResponseWithMediaQuery:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(VUIMPMediaEntitiesSingleFetchOperation *)self mediaLibrary];
  id v6 = [(VUIMPMediaEntitiesSingleFetchOperation *)self request];
  uint64_t v7 = [v6 properties];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v18 = v4;
  uint64_t v9 = [v4 items];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [[VUIMPMediaItem alloc] initWithMediaLibrary:v5 mediaItem:*(void *)(*((void *)&v19 + 1) + 8 * i) requestedProperties:v7];
        if (v14) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
  uint64_t v15 = [v18 itemSections];
  long long v16 = [(VUIMPMediaEntitiesSingleFetchOperation *)self _fetchResponseWithMediaEntities:v8 mediaQuerySections:v15];

  return v16;
}

- (id)_collectionsFetchResponseWithMediaQuery:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v27 = [(VUIMPMediaEntitiesSingleFetchOperation *)self mediaLibrary];
  id v5 = [(VUIMPMediaEntitiesSingleFetchOperation *)self request];
  unint64_t v6 = [(VUIMediaEntityType *)self->_currentFetchMediaEntityType mediaCollectionType];
  if (v6 == 1 || v6 == 2)
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Unexpected media collection type!"];
    uint64_t v7 = 0;
  }
  v25 = v5;
  id v8 = [v5 properties];
  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = [v4 collections];
  uint64_t v10 = [v4 collectionSections];
  if ([(VUIMediaEntityType *)self->_currentFetchMediaEntityType mediaCollectionType] == 1)
  {
    uint64_t v11 = [(VUIMPMediaEntitiesSingleFetchOperation *)self _uniqueMediaCollectionsBySeasonNumber:v9];

    uint64_t v9 = (void *)v11;
  }
  uint64_t v24 = self;
  v26 = v4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    long long v16 = (void *)v27;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        long long v19 = (void *)[[v7 alloc] initWithMediaLibrary:v16 mediaItemCollection:v18 requestedProperties:v8];
        if (v19)
        {
          [v28 addObject:v19];
        }
        else
        {
          long long v20 = VUIDefaultLogObject();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v34 = v18;
            _os_log_error_impl(&dword_1E2BD7000, v20, OS_LOG_TYPE_ERROR, "Unable to create VUIMediaCollection for MPMediaItemCollection: %@", buf, 0xCu);
          }

          uint64_t v10 = 0;
          long long v16 = (void *)v27;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v14);
  }
  else
  {
    long long v16 = (void *)v27;
  }

  [(VUIMPMediaEntitiesSingleFetchOperation *)v24 _fetchResponseWithMediaEntities:v28 mediaQuerySections:v10];
  long long v22 = v21 = v16;

  return v22;
}

- (id)_fetchResponseWithMediaEntities:(id)a3 mediaQuerySections:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(VUIMPMediaEntitiesSingleFetchOperation *)self _processFetchedMediaEntities:a3];
  id v8 = [(VUIMPMediaEntitiesSingleFetchOperation *)self request];
  uint64_t v9 = [(VUIMPMediaEntitiesSingleFetchOperation *)self mediaEntityKind];
  uint64_t v10 = [v8 _sortIndexPropertyKeyWithMediaEntityKind:v9];
  if ([v8 _shouldGenerateSortIndexes])
  {
    if (v6
      && [(VUIMPMediaEntitiesSingleFetchOperation *)self _isSortingBeingPerformedByMediaQuery])
    {
      uint64_t v11 = [(id)objc_opt_class() _sortIndexesWithMediaQuerySection:v6];
LABEL_7:
      id v12 = (void *)v11;
      goto LABEL_9;
    }
    if (v10)
    {
      uint64_t v11 = +[VUIMediaLibraryUtilities sortIndexesForMediaEntities:v7 sortIndexPropertyKey:v10];
      goto LABEL_7;
    }
  }
  id v12 = 0;
LABEL_9:
  uint64_t v13 = [v8 groupingKeyPath];
  if (v13)
  {
    uint64_t v14 = [v8 groupingSortComparator];
    uint64_t v15 = +[VUIMediaLibraryUtilities groupingForMediaEntities:v7 groupingKeyPath:v13 groupingSortComparator:v14 performDefaultSort:1 sortIndexPropertyKey:v10];

    if ([v8 _shouldGenerateGroupingSortIndexes])
    {
      long long v16 = +[VUIMediaLibraryUtilities sortIndexesForGrouping:v15];
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
  long long v16 = 0;
LABEL_14:
  long long v17 = objc_alloc_init(VUIMediaEntityFetchResponse);
  [(VUIMediaEntityFetchResponse *)v17 setMediaEntities:v7];
  [(VUIMediaEntityFetchResponse *)v17 setSortIndexes:v12];
  [(VUIMediaEntityFetchResponse *)v17 setGrouping:v15];
  [(VUIMediaEntityFetchResponse *)v17 setGroupingSortIndexes:v16];

  return v17;
}

+ (id)_sortIndexesWithMediaQuerySection:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "range", (void)v19);
        uint64_t v13 = v12;
        uint64_t v14 = [VUIMediaEntitySortIndex alloc];
        uint64_t v15 = [v10 title];
        long long v16 = [(VUIMediaEntitySortIndex *)v14 initWithTitle:v15 startIndex:v11 count:v13];

        [v4 addObject:v16];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  long long v17 = (void *)[v4 copy];
  return v17;
}

- (id)_coalesceResponses:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIMPMediaEntitiesSingleFetchOperation *)self _mediaQuery];
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = [(VUIMediaEntityFetchResponse *)self->_response mediaEntities];
  [v6 addObjectsFromArray:v7];
  uint64_t v8 = [v4 mediaEntities];
  [v6 addObjectsFromArray:v8];

  uint64_t v9 = [v5 collectionSections];
  uint64_t v10 = [(VUIMPMediaEntitiesSingleFetchOperation *)self _fetchResponseWithMediaEntities:v6 mediaQuerySections:v9];

  if ([(VUIMediaEntityFetchResponse *)self->_response hasDataForCheckHasItemsOption]) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = [v4 hasDataForCheckHasItemsOption];
  }
  [v10 setHasDataForCheckHasItemsOption:v11];

  return v10;
}

- (id)_uniqueMediaCollectionsBySeasonNumber:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v45;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = __80__VUIMPMediaEntitiesSingleFetchOperation__uniqueMediaCollectionsBySeasonNumber___block_invoke(v7, *(void **)(*((void *)&v44 + 1) + 8 * v10));
        if ([v4 containsObject:v11]) {
          [v5 addObject:v11];
        }
        [v4 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v44 objects:v50 count:16];
      uint64_t v8 = v7;
    }
    while (v7);
  }

  if ([v5 count])
  {
    uint64_t v12 = objc_opt_new();
    uint64_t v13 = objc_opt_new();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v31 = v6;
    id obj = v6;
    uint64_t v14 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
    id v33 = v13;
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v41;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v41 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void **)(*((void *)&v40 + 1) + 8 * v17);
          long long v19 = __80__VUIMPMediaEntitiesSingleFetchOperation__uniqueMediaCollectionsBySeasonNumber___block_invoke(v14, v18);
          if ([v5 containsObject:v19])
          {
            long long v20 = [v13 objectForKeyedSubscript:v19];
            long long v21 = [v18 items];
            if (v20)
            {
              long long v22 = [v20 arrayByAddingObjectsFromArray:v21];
              [v33 setObject:v22 forKeyedSubscript:v19];

              uint64_t v13 = v33;
            }
            else
            {
              [v13 setObject:v21 forKeyedSubscript:v19];
            }
          }
          else
          {
            [v12 addObject:v18];
          }

          ++v17;
        }
        while (v15 != v17);
        uint64_t v14 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
        uint64_t v15 = v14;
      }
      while (v14);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v23 = [v13 allValues];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v36 objects:v48 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v37 != v26) {
            objc_enumerationMutation(v23);
          }
          id v28 = (void *)[objc_alloc(MEMORY[0x1E4F31938]) initWithItems:*(void *)(*((void *)&v36 + 1) + 8 * i)];
          [v12 addObject:v28];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v36 objects:v48 count:16];
      }
      while (v25);
    }

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __80__VUIMPMediaEntitiesSingleFetchOperation__uniqueMediaCollectionsBySeasonNumber___block_invoke_2;
    v34[3] = &unk_1E6DF3F40;
    id v35 = &__block_literal_global_1;
    id v29 = [v12 sortedArrayUsingComparator:v34];

    id v6 = v31;
  }
  else
  {
    id v29 = v6;
  }

  return v29;
}

id __80__VUIMPMediaEntitiesSingleFetchOperation__uniqueMediaCollectionsBySeasonNumber___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 representativeItem];
  id v3 = [v2 valueForProperty:*MEMORY[0x1E4F314A0]];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28ED0] numberWithInt:0xFFFFFFFFLL];
  }
  id v5 = v4;

  return v5;
}

uint64_t __80__VUIMPMediaEntitiesSingleFetchOperation__uniqueMediaCollectionsBySeasonNumber___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  id v7 = a3;
  uint64_t v8 = v6(v5, a2);
  uint64_t v9 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  uint64_t v10 = [v8 compare:v9];
  return v10;
}

- (VUIMediaEntityFetchRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (VUIMediaEntityFetchResponse)response
{
  return self->_response;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (VUIMPMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (void)setMediaLibrary:(id)a3
{
}

- (VUIMediaEntityKind)mediaEntityKind
{
  return self->_mediaEntityKind;
}

- (void)setMediaEntityKind:(id)a3
{
}

- (NSMutableSet)prefetchProperties
{
  return self->_prefetchProperties;
}

- (void)setPrefetchProperties:(id)a3
{
}

- (MPMediaPredicate)mediaQueryPredicate
{
  return self->_mediaQueryPredicate;
}

- (void)setMediaQueryPredicate:(id)a3
{
}

- (NSArray)mediaQuerySortOrderingProperties
{
  return self->_mediaQuerySortOrderingProperties;
}

- (void)setMediaQuerySortOrderingProperties:(id)a3
{
}

- (NSDictionary)mediaQuerySortOrderingDirectionMappings
{
  return self->_mediaQuerySortOrderingDirectionMappings;
}

- (void)setMediaQuerySortOrderingDirectionMappings:(id)a3
{
}

- (NSArray)postFetchSortDescriptors
{
  return self->_postFetchSortDescriptors;
}

- (void)setPostFetchSortDescriptors:(id)a3
{
}

- (BOOL)processPredicateAfterFetch
{
  return self->_processPredicateAfterFetch;
}

- (void)setProcessPredicateAfterFetch:(BOOL)a3
{
  self->_processPredicateAfterFetch = a3;
}

- (BOOL)processRangeAfterFetch
{
  return self->_processRangeAfterFetch;
}

- (void)setProcessRangeAfterFetch:(BOOL)a3
{
  self->_processRangeAfterFetch = a3;
}

- (VUIMediaEntityType)currentFetchMediaEntityType
{
  return self->_currentFetchMediaEntityType;
}

- (void)setCurrentFetchMediaEntityType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFetchMediaEntityType, 0);
  objc_storeStrong((id *)&self->_postFetchSortDescriptors, 0);
  objc_storeStrong((id *)&self->_mediaQuerySortOrderingDirectionMappings, 0);
  objc_storeStrong((id *)&self->_mediaQuerySortOrderingProperties, 0);
  objc_storeStrong((id *)&self->_mediaQueryPredicate, 0);
  objc_storeStrong((id *)&self->_prefetchProperties, 0);
  objc_storeStrong((id *)&self->_mediaEntityKind, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end