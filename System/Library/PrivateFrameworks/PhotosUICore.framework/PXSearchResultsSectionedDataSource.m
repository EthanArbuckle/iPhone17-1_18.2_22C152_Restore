@interface PXSearchResultsSectionedDataSource
+ (id)postQuerySearchResultsLog;
+ (id)topAssetsSectionForSearchResultsValue:(id)a3;
- (BOOL)_shouldCancel:(unint64_t)a3;
- (BOOL)didMerge;
- (BOOL)hasPendingChanges;
- (BOOL)ignorePastResults;
- (BOOL)isSectionExpandable:(int64_t)a3;
- (BOOL)isSectionExpanded:(int64_t)a3;
- (BOOL)isTopAssetsSection:(int64_t)a3;
- (BOOL)resultsReady;
- (BOOL)searchIsFinished:(id)a3;
- (BOOL)wordEmbeddingsRequested;
- (NSArray)results;
- (NSArray)suggestions;
- (NSArray)uncommittedResults;
- (NSArray)uncommittedSuggestions;
- (NSCalendar)calendar;
- (NSDateComponents)dateRangeFormattingComponents;
- (NSDateIntervalFormatter)dateIntervalFormatter;
- (NSDictionary)debugDictionary;
- (NSDictionary)sceneAncestryInformation;
- (NSString)debugDescription;
- (OS_dispatch_queue)queue;
- (PHFetchResult)homePersons;
- (PLPhotoLibrary)photoLibrary;
- (PLSearchIndexDateFormatter)dateFormatter;
- (PLSearchProcessor)searchProcessor;
- (PSIDatabase)searchIndex;
- (PSIQuery)query;
- (PXSearchQueryMatchInfo)searchQueryMatchInfo;
- (PXSearchResultsSectionedDataSource)initWithSearchIndex:(id)a3 photoLibrary:(id)a4;
- (PXSearchResultsSectionedDataSourceChangeObserver)changeObserver;
- (id)_fetchObjectsWithEntityName:(id)a3 uuids:(id)a4;
- (id)_wordEmbeddingSubstitutionsWantsSubstitutedString:(BOOL)a3;
- (id)allSearchResultsForSection:(int64_t)a3;
- (id)initForUnitTests;
- (id)searchResultAtIndexPath:(id)a3;
- (id)selectedWordEmbeddingTextAtIndex:(unint64_t)a3;
- (id)stringWithStartDate:(id)a3 endDate:(id)a4;
- (id)tapToRadarAttachments;
- (id)titleForHeaderInSection:(int64_t)a3 accessibilityIdentifier:(id *)a4;
- (id)topAssetFilter;
- (id)wordEmbeddingSubstitutions;
- (int64_t)numberOfSearchResultsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)numberOfVisibleSearchResultsInSection:(int64_t)a3;
- (unint64_t)maxGroupedResultsCount;
- (unint64_t)queryTag;
- (unint64_t)sectionFetchIndex;
- (unint64_t)uncommittedMaxGroupedResultsCount;
- (unint64_t)unprocessedSearchResultsCount;
- (void)_asyncFetchAssetsWithQueryTag:(unint64_t)a3;
- (void)_confirmationDidFinish:(id)a3;
- (void)_inqBackgroundProcessAssetResults:(id)a3 assetResultsForCompletions:(id)a4 collectionResults:(id)a5 topAssetsResult:(id)a6 topCollectionResults:(id)a7 withTag:(unint64_t)a8 searchString:(id)a9 representedObjects:(id)a10 maxSuggestionCount:(unint64_t)a11 priorityAssetUUID:(id)a12;
- (void)_inqCancel;
- (void)_updateResultsWithMergeTargetPerson:(id)a3 sourcePerson:(id)a4 tombstonedCandidatesLocalIdentifiers:(id)a5;
- (void)cancel;
- (void)collapseSection:(int64_t)a3;
- (void)didChangeThumbnailAssetsForSearchResult:(id)a3;
- (void)didChangeThumbnailAssetsForSearchResult:(id)a3 atIndexes:(id)a4;
- (void)expandSection:(int64_t)a3;
- (void)mergePendingChanges;
- (void)setCalendar:(id)a3;
- (void)setChangeObserver:(id)a3;
- (void)setDateFormatter:(id)a3;
- (void)setDateIntervalFormatter:(id)a3;
- (void)setDateRangeFormattingComponents:(id)a3;
- (void)setDidMerge:(BOOL)a3;
- (void)setHomePersons:(id)a3;
- (void)setIgnorePastResults:(BOOL)a3;
- (void)setMaxGroupedResultsCount:(unint64_t)a3;
- (void)setPhotoLibrary:(id)a3;
- (void)setQuery:(id)a3;
- (void)setQueryTag:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setResults:(id)a3;
- (void)setResultsReady:(BOOL)a3;
- (void)setSceneAncestryInformation:(id)a3;
- (void)setSearchIndex:(id)a3;
- (void)setSearchProcessor:(id)a3;
- (void)setSearchString:(id)a3 representedObjects:(id)a4 maxSuggestionCount:(unint64_t)a5 priorityAssetUUID:(id)a6 libraryScope:(unint64_t)a7;
- (void)setSectionFetchIndex:(unint64_t)a3;
- (void)setSuggestions:(id)a3;
- (void)setTopAssetFilter:(id)a3;
- (void)setUncommittedMaxGroupedResultsCount:(unint64_t)a3;
- (void)setUncommittedResults:(id)a3;
- (void)setUncommittedSuggestions:(id)a3;
- (void)setUnprocessedSearchResultsCount:(unint64_t)a3;
- (void)setWordEmbeddingsRequested:(BOOL)a3;
@end

@implementation PXSearchResultsSectionedDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateRangeFormattingComponents, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_sceneAncestryInformation, 0);
  objc_storeStrong((id *)&self->_uncommittedSuggestions, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_homePersons, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_searchIndex, 0);
  objc_storeStrong((id *)&self->_searchProcessor, 0);
  objc_storeStrong((id *)&self->_dateIntervalFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_uncommittedResults, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_searchQueryMatchInfo, 0);
  objc_storeStrong(&self->_topAssetFilter, 0);
  objc_destroyWeak((id *)&self->_changeObserver);
}

- (void)setWordEmbeddingsRequested:(BOOL)a3
{
  self->_wordEmbeddingsRequested = a3;
}

- (BOOL)wordEmbeddingsRequested
{
  return self->_wordEmbeddingsRequested;
}

- (void)setDateRangeFormattingComponents:(id)a3
{
}

- (NSDateComponents)dateRangeFormattingComponents
{
  return self->_dateRangeFormattingComponents;
}

- (void)setCalendar:(id)a3
{
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setSceneAncestryInformation:(id)a3
{
}

- (NSDictionary)sceneAncestryInformation
{
  return (NSDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (void)setUncommittedSuggestions:(id)a3
{
}

- (NSArray)uncommittedSuggestions
{
  return self->_uncommittedSuggestions;
}

- (void)setSuggestions:(id)a3
{
}

- (void)setHomePersons:(id)a3
{
}

- (PHFetchResult)homePersons
{
  return self->_homePersons;
}

- (void)setDidMerge:(BOOL)a3
{
}

- (BOOL)didMerge
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_didMerge);
  return v2 & 1;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQuery:(id)a3
{
}

- (PSIQuery)query
{
  return self->_query;
}

- (void)setSearchIndex:(id)a3
{
}

- (PSIDatabase)searchIndex
{
  return self->_searchIndex;
}

- (void)setSearchProcessor:(id)a3
{
}

- (PLSearchProcessor)searchProcessor
{
  return self->_searchProcessor;
}

- (void)setDateIntervalFormatter:(id)a3
{
}

- (void)setDateFormatter:(id)a3
{
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PLPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setUnprocessedSearchResultsCount:(unint64_t)a3
{
  self->_unprocessedSearchResultsCount = a3;
}

- (unint64_t)unprocessedSearchResultsCount
{
  return self->_unprocessedSearchResultsCount;
}

- (void)setUncommittedMaxGroupedResultsCount:(unint64_t)a3
{
  self->_uncommittedMaxGroupedResultsCount = a3;
}

- (unint64_t)uncommittedMaxGroupedResultsCount
{
  return self->_uncommittedMaxGroupedResultsCount;
}

- (void)setQueryTag:(unint64_t)a3
{
  self->_queryTag = a3;
}

- (unint64_t)queryTag
{
  return self->_queryTag;
}

- (void)setMaxGroupedResultsCount:(unint64_t)a3
{
  self->_maxGroupedResultsCount = a3;
}

- (unint64_t)maxGroupedResultsCount
{
  return self->_maxGroupedResultsCount;
}

- (void)setSectionFetchIndex:(unint64_t)a3
{
  self->_sectionFetchIndex = a3;
}

- (unint64_t)sectionFetchIndex
{
  return self->_sectionFetchIndex;
}

- (void)setUncommittedResults:(id)a3
{
}

- (NSArray)uncommittedResults
{
  return self->_uncommittedResults;
}

- (NSArray)results
{
  return self->_results;
}

- (void)setIgnorePastResults:(BOOL)a3
{
  self->_ignorePastResults = a3;
}

- (BOOL)ignorePastResults
{
  return self->_ignorePastResults;
}

- (PXSearchQueryMatchInfo)searchQueryMatchInfo
{
  return self->_searchQueryMatchInfo;
}

- (void)setTopAssetFilter:(id)a3
{
}

- (id)topAssetFilter
{
  return self->_topAssetFilter;
}

- (void)setResultsReady:(BOOL)a3
{
  self->_resultsReady = a3;
}

- (void)setChangeObserver:(id)a3
{
}

- (PXSearchResultsSectionedDataSourceChangeObserver)changeObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);
  return (PXSearchResultsSectionedDataSourceChangeObserver *)WeakRetained;
}

- (void)_updateResultsWithMergeTargetPerson:(id)a3 sourcePerson:(id)a4 tombstonedCandidatesLocalIdentifiers:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v40 = a4;
  id v38 = a5;
  v8 = self->_results;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v9 = v8;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (!v10) {
    goto LABEL_30;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v47;
  while (2)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v47 != v12) {
        objc_enumerationMutation(v9);
      }
      v14 = *(void **)(*((void *)&v46 + 1) + 8 * i);
      if ([v14 sectionType] == 2)
      {
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        v15 = [v14 searchResults];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          v36 = self;
          v37 = v14;
          v35 = v9;
          v39 = 0;
          v18 = 0;
          uint64_t v19 = *(void *)v43;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v43 != v19) {
                objc_enumerationMutation(v15);
              }
              v21 = *(void **)(*((void *)&v42 + 1) + 8 * j);
              v22 = [v21 person];
              v23 = [v22 localIdentifier];
              v24 = [v41 localIdentifier];
              int v25 = [v23 isEqualToString:v24];

              if (v25)
              {
                id v26 = v21;

                v18 = v26;
              }
              else
              {
                v27 = [v22 localIdentifier];
                v28 = [v40 localIdentifier];
                int v29 = [v27 isEqualToString:v28];

                if (v29)
                {
                  id v30 = v21;

                  v39 = v30;
                }
                else
                {
                  v31 = [v22 localIdentifier];
                  int v32 = [v38 containsObject:v31];

                  if (v32) {
                    [v37 removeSearchResult:v21];
                  }
                }
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v42 objects:v50 count:16];
          }
          while (v17);

          self = v36;
          if (v18)
          {
            v9 = v35;
            v33 = v39;
            if (v39) {
              [v37 removeSearchResult:v39];
            }
            goto LABEL_29;
          }
          v9 = v35;
          v33 = v39;
        }
        else
        {

          v33 = 0;
        }
        [v33 _setPerson:v41];
        objc_msgSend(v33, "_setApproximateCount:", objc_msgSend(v41, "numberOfAssets"));
        v18 = 0;
LABEL_29:
        id WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);
        [WeakRetained searchResultsDataSourceHasPendingChanges:self shouldMergePendingChanges:0];

        goto LABEL_30;
      }
    }
    uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v11) {
      continue;
    }
    break;
  }
LABEL_30:
}

- (void)_confirmationDidFinish:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(NSArray *)self->_results count]) {
    goto LABEL_10;
  }
  v6 = [v5 object];
  if (!v6)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    [v18 handleFailureInMethod:a2, self, @"PXSearchResultsSectionedDataSource.m", 942, @"%@ should be an instance inheriting from %@, but it is nil", @"notification.object", v20 object file lineNumber description];
LABEL_14:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    v21 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v21);
    v22 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v18 handleFailureInMethod:a2, self, @"PXSearchResultsSectionedDataSource.m", 942, @"%@ should be an instance inheriting from %@, but it is %@", @"notification.object", v20, v22 object file lineNumber description];

    goto LABEL_14;
  }
LABEL_4:
  v7 = [v6 sourcePerson];
  v8 = [v6 targetPerson];
  v9 = [v6 otherPersons];
  uint64_t v10 = objc_msgSend(v9, "_pl_map:", &__block_literal_global_401);

  if (![v8 verifiedType])
  {
    uint64_t v11 = PLUIGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v8;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_ERROR, "The notification for bootstrap / confirmation flow provided an invalid target person: %@", buf, 0xCu);
    }

    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    v13 = [v12 librarySpecificFetchOptions];

    uint64_t v14 = [v7 uuid];
    if (!v14) {
      PXAssertGetLog();
    }
    v15 = (void *)v14;
    uint64_t v16 = [MEMORY[0x1E4F391F0] fetchFinalMergeTargetPersonsForPersonWithUUID:v14 options:v13];
    uint64_t v17 = [v16 firstObject];

    v8 = (void *)v17;
  }
  [(PXSearchResultsSectionedDataSource *)self _updateResultsWithMergeTargetPerson:v8 sourcePerson:v7 tombstonedCandidatesLocalIdentifiers:v10];

LABEL_10:
}

uint64_t __61__PXSearchResultsSectionedDataSource__confirmationDidFinish___block_invoke(uint64_t a1, void *a2)
{
  return [a2 localIdentifier];
}

- (NSString)debugDescription
{
  unsigned __int8 v2 = [(PXSearchResultsSectionedDataSource *)self debugDictionary];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (NSDictionary)debugDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__PXSearchResultsSectionedDataSource_debugDictionary__block_invoke;
  v8[3] = &unk_1E5DD32A8;
  id v5 = v3;
  id v9 = v5;
  uint64_t v10 = self;
  dispatch_sync(queue, v8);
  v6 = (NSDictionary *)v5;

  return v6;
}

void __53__PXSearchResultsSectionedDataSource_debugDictionary__block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = [v2 stringWithFormat:@"%@:%p", v4, *(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:@"self"];

  v6 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = *(id *)(*(void *)(a1 + 40) + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v23 + 1) + 8 * v11) debugDictionary];
        if (v12) {
          [v6 addObject:v12];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }

  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:@"searchResults"];
  v13 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 56)];
  [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:@"sectionFetchIndex"];

  uint64_t v14 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 64)];
  [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:@"maxGroupedResultCount"];

  v15 = [*(id *)(*(void *)(a1 + 40) + 152) description];
  [*(id *)(a1 + 32) setObject:v15 forKeyedSubscript:@"homePersonsFetchResult"];

  uint64_t v16 = [*(id *)(*(void *)(a1 + 40) + 152) fetchedObjects];
  uint64_t v17 = [v16 valueForKey:@"description"];
  [*(id *)(a1 + 32) setObject:v17 forKeyedSubscript:@"homePersons"];

  v18 = [*(id *)(*(void *)(a1 + 40) + 136) description];
  [*(id *)(a1 + 32) setObject:v18 forKeyedSubscript:@"query"];

  uint64_t v19 = [*(id *)(*(void *)(a1 + 40) + 136) substitutions];
  v20 = +[PXSearchResultsDataUtility sortedWordEmbeddingsForCurrentQueryFromSubstitutions:v19];

  if ([v20 count]) {
    [*(id *)(a1 + 32) setObject:v20 forKeyedSubscript:@"wordEmbeddings"];
  }
  id v21 = *(id *)(*(void *)(a1 + 40) + 160);
  if ([v21 count])
  {
    v22 = [v21 description];
    [*(id *)(a1 + 32) setObject:v22 forKeyedSubscript:@"suggestions"];
  }
}

- (id)tapToRadarAttachments
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = [NSString stringWithFormat:@"%@-Summary", v4];
  v6 = [(PXSearchResultsSectionedDataSource *)self debugDictionary];
  id v7 = PXFeedbackTapToRadarUtilitiesWriteDictionaryToPlistFile(v6, v5);

  if (v7)
  {
    v10[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (id)_wordEmbeddingSubstitutionsWantsSubstitutedString:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PSIQuery *)self->_query searchText];
  sceneAncestryInformation = self->_sceneAncestryInformation;
  id v7 = [(PSIQuery *)self->_query substitutions];
  uint64_t v8 = +[PXSearchResultsDataUtility wordEmbeddingSubstitutionsForSearchText:v5 wantsSubstitutedString:v3 sceneAncestoryInformation:sceneAncestryInformation substitutions:v7];

  return v8;
}

- (id)selectedWordEmbeddingTextAtIndex:(unint64_t)a3
{
  v4 = [(PXSearchResultsSectionedDataSource *)self _wordEmbeddingSubstitutionsWantsSubstitutedString:1];
  id v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (id)wordEmbeddingSubstitutions
{
  return [(PXSearchResultsSectionedDataSource *)self _wordEmbeddingSubstitutionsWantsSubstitutedString:0];
}

- (NSArray)suggestions
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__36077;
  v7[4] = __Block_byref_object_dispose__36078;
  id v8 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__PXSearchResultsSectionedDataSource_suggestions__block_invoke;
  v6[3] = &unk_1E5DD0588;
  v6[4] = self;
  v6[5] = v7;
  dispatch_sync(queue, v6);
  v4 = self->_suggestions;
  _Block_object_dispose(v7, 8);

  return v4;
}

void __49__PXSearchResultsSectionedDataSource_suggestions__block_invoke(uint64_t a1)
{
}

- (void)didChangeThumbnailAssetsForSearchResult:(id)a3 atIndexes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PXSearchResultsSectionedDataSource *)self changeObserver];
  [v8 searchResultsDataSource:self didChangeThumbnailAssetsForSearchResult:v7 atIndexes:v6];
}

- (void)didChangeThumbnailAssetsForSearchResult:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PXSearchResultsSectionedDataSource.m", 814, @"Invalid parameter not satisfying: %@", @"searchResult" object file lineNumber description];
  }
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSearchResultsSectionedDataSource.m", 815, @"%s expected main thread", "-[PXSearchResultsSectionedDataSource didChangeThumbnailAssetsForSearchResult:]");
  }
  id v6 = (void *)[(NSArray *)self->_results mutableCopy];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = self->_results;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v12 sectionType] == 1)
        {
          uint64_t v14 = [v5 topAssetsFetchResult];
          uint64_t v15 = [v14 count];

          BOOL v13 = v15 != 0;
          [v6 removeObject:v12];
          if (v15)
          {
            uint64_t v16 = +[PXSearchResultsSectionedDataSource topAssetsSectionForSearchResultsValue:v5];
            [v6 insertObject:v16 atIndex:0];
          }
          uint64_t v17 = (void *)[v6 copy];
          [(PXSearchResultsSectionedDataSource *)self setResults:v17];

          goto LABEL_17;
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_17:

  v18 = [(PXSearchResultsSectionedDataSource *)self changeObserver];
  [v18 searchResultsDataSource:self didChangeThumbnailAssetsForSearchResult:v5 topAssetsSectionExists:v13];
}

- (id)stringWithStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_calendar)
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    calendar = self->_calendar;
    self->_calendar = v8;
  }
  dateRangeFormattingComponents = self->_dateRangeFormattingComponents;
  if (!dateRangeFormattingComponents)
  {
    uint64_t v11 = (NSDateComponents *)objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    uint64_t v12 = self->_dateRangeFormattingComponents;
    self->_dateRangeFormattingComponents = v11;

    BOOL v13 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"GMT"];
    [(NSDateComponents *)self->_dateRangeFormattingComponents setTimeZone:v13];

    [(NSDateComponents *)self->_dateRangeFormattingComponents setHour:12];
    dateRangeFormattingComponents = self->_dateRangeFormattingComponents;
  }
  uint64_t v14 = self->_calendar;
  uint64_t v15 = [(PXSearchResultsSectionedDataSource *)self dateIntervalFormatter];
  uint64_t v16 = +[PXSearchResultsDataUtility stringWithStartDate:v6 endDate:v7 calendar:v14 dateComponents:dateRangeFormattingComponents dateIntervalFormatter:v15];

  return v16;
}

- (NSDateIntervalFormatter)dateIntervalFormatter
{
  dateIntervalFormatter = self->_dateIntervalFormatter;
  if (!dateIntervalFormatter)
  {
    v4 = (NSDateIntervalFormatter *)objc_opt_new();
    id v5 = self->_dateIntervalFormatter;
    self->_dateIntervalFormatter = v4;

    [(NSDateIntervalFormatter *)self->_dateIntervalFormatter setDateStyle:2];
    [(NSDateIntervalFormatter *)self->_dateIntervalFormatter setTimeStyle:0];
    dateIntervalFormatter = self->_dateIntervalFormatter;
  }
  return dateIntervalFormatter;
}

- (PLSearchIndexDateFormatter)dateFormatter
{
  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    v4 = (PLSearchIndexDateFormatter *)objc_alloc_init(MEMORY[0x1E4F8ABA0]);
    id v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    dateFormatter = self->_dateFormatter;
  }
  return dateFormatter;
}

- (BOOL)searchIsFinished:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__PXSearchResultsSectionedDataSource_searchIsFinished___block_invoke;
  v6[3] = &unk_1E5DD0588;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __55__PXSearchResultsSectionedDataSource_searchIsFinished___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 32);
  if (*(void *)(v2 + 88))
  {
    BOOL v3 = 0;
  }
  else
  {
    result = [*(id *)(v2 + 48) count];
    BOOL v3 = result == 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)setResults:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__PXSearchResultsSectionedDataSource_setResults___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __49__PXSearchResultsSectionedDataSource_setResults___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)cancel
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PXSearchResultsSectionedDataSource_cancel__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __44__PXSearchResultsSectionedDataSource_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _inqCancel];
}

- (void)_inqCancel
{
  ++self->_queryTag;
  self->_unprocessedSearchResultsCount = 0;
  [(PSIQuery *)self->_query cancel];
  query = self->_query;
  self->_query = 0;

  uncommittedSuggestions = self->_uncommittedSuggestions;
  self->_uncommittedSuggestions = 0;

  uncommittedResults = self->_uncommittedResults;
  self->_uncommittedResults = 0;

  self->_uncommittedMaxGroupedResultsCount = 0;
  homePersons = self->_homePersons;
  self->_homePersons = 0;

  self->_sectionFetchIndex = 0;
  atomic_store(0, (unsigned __int8 *)&self->_didMerge);
  self->_ignorePastResults = 1;
}

- (void)mergePendingChanges
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PXSearchResultsSectionedDataSource.m" lineNumber:721 description:@"expect main thread"];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PXSearchResultsSectionedDataSource_mergePendingChanges__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __57__PXSearchResultsSectionedDataSource_mergePendingChanges__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 160), *(id *)(*(void *)(a1 + 32) + 168));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(*(void *)(a1 + 32) + 48));
  *(void *)(*(void *)(a1 + 32) + 64) = *(void *)(*(void *)(a1 + 32) + 80);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 168);
  *(void *)(v2 + 168) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = 0;

  *(void *)(*(void *)(a1 + 32) + 80) = 0;
  atomic_store(1u, (unsigned __int8 *)(*(void *)(a1 + 32) + 10));
}

- (BOOL)hasPendingChanges
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__PXSearchResultsSectionedDataSource_hasPendingChanges__block_invoke;
  v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__PXSearchResultsSectionedDataSource_hasPendingChanges__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 48) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (void)_asyncFetchAssetsWithQueryTag:(unint64_t)a3
{
  id v5 = dispatch_get_global_queue(25, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__PXSearchResultsSectionedDataSource__asyncFetchAssetsWithQueryTag___block_invoke;
  v6[3] = &unk_1E5DD08D8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

void __68__PXSearchResultsSectionedDataSource__asyncFetchAssetsWithQueryTag___block_invoke(uint64_t a1)
{
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  char v43 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__36077;
  v36 = __Block_byref_object_dispose__36078;
  id v37 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(NSObject **)(v2 + 144);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PXSearchResultsSectionedDataSource__asyncFetchAssetsWithQueryTag___block_invoke_2;
  block[3] = &unk_1E5DB2708;
  block[4] = v2;
  void block[5] = v42;
  uint64_t v4 = *(void *)(a1 + 40);
  block[6] = &v38;
  block[7] = v31;
  block[8] = &v32;
  block[9] = v4;
  dispatch_sync(v3, block);
  if (*((unsigned char *)v39 + 24))
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v7 = (void *)v33[5];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __68__PXSearchResultsSectionedDataSource__asyncFetchAssetsWithQueryTag___block_invoke_3;
    v27[3] = &unk_1E5DB2730;
    id v8 = v5;
    id v28 = v8;
    id v9 = v6;
    id v29 = v9;
    [v7 enumerateObjectsUsingBlock:v27];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v11 = (void *)MEMORY[0x1E4F38EB8];
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F390A0], "px_searchAssetFetchOptions");
    BOOL v13 = [v11 fetchAssetsWithLocalIdentifiers:v8 options:v12];

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __68__PXSearchResultsSectionedDataSource__asyncFetchAssetsWithQueryTag___block_invoke_4;
    v25[3] = &unk_1E5DC4908;
    id v14 = v10;
    id v26 = v14;
    [v13 enumerateObjectsUsingBlock:v25];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __68__PXSearchResultsSectionedDataSource__asyncFetchAssetsWithQueryTag___block_invoke_5;
    v18[3] = &unk_1E5DC76C0;
    id v19 = v14;
    id v20 = v9;
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v21 = *(void *)(a1 + 32);
    long long v22 = &v32;
    long long v23 = v31;
    uint64_t v24 = v15;
    id v16 = v9;
    id v17 = v14;
    dispatch_async(MEMORY[0x1E4F14428], v18);
  }
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(v42, 8);
}

void __68__PXSearchResultsSectionedDataSource__asyncFetchAssetsWithQueryTag___block_invoke_2(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(void *)(a1[4] + 72) != a1[9];
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    unsigned __int8 v2 = atomic_load((unsigned __int8 *)(a1[4] + 10));
    BOOL v3 = (v2 & 1) == 0;
    uint64_t v4 = 40;
    if (v3) {
      uint64_t v4 = 48;
    }
    id v5 = *(id *)(a1[4] + v4);
    unint64_t v6 = *(void *)(a1[4] + 56);
    id v11 = v5;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v6 < [v5 count];
    if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
    {
      *(void *)(*(void *)(a1[7] + 8) + 24) = *(void *)(a1[4] + 56);
      uint64_t v7 = [v11 objectAtIndexedSubscript:*(void *)(*(void *)(a1[7] + 8) + 24)];
      uint64_t v8 = [v7 searchResults];
      uint64_t v9 = *(void *)(a1[8] + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      ++*(void *)(a1[4] + 56);
    }
  }
}

void __68__PXSearchResultsSectionedDataSource__asyncFetchAssetsWithQueryTag___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([v5 itemType] != 2)
  {
    unint64_t v6 = [v5 assetLocalIdentifiersForPreview];
    [*(id *)(a1 + 32) addObjectsFromArray:v6];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          id v13 = [*(id *)(a1 + 40) objectForKeyedSubscript:v12];
          if (!v13) {
            id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          }
          id v14 = [NSNumber numberWithUnsignedInteger:a3];
          [v13 addObject:v14];

          [*(id *)(a1 + 40) setObject:v13 forKeyedSubscript:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
}

uint64_t __68__PXSearchResultsSectionedDataSource__asyncFetchAssetsWithQueryTag___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __68__PXSearchResultsSectionedDataSource__asyncFetchAssetsWithQueryTag___block_invoke_5(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v22 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v30;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v2;
        BOOL v3 = *(void **)(*((void *)&v29 + 1) + 8 * v2);
        uint64_t v4 = *(void **)(a1 + 40);
        id v5 = [v3 localIdentifier];
        unint64_t v6 = [v4 objectForKeyedSubscript:v5];

        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v26 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "unsignedIntegerValue"));
              id v13 = (void *)MEMORY[0x1E4F38EB8];
              id v14 = [v3 localIdentifier];
              long long v15 = [v13 uuidFromLocalIdentifier:v14];
              [v12 _setAsset:v3 forUUID:v15];
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v9);
        }

        uint64_t v2 = v23 + 1;
      }
      while (v23 + 1 != v22);
      uint64_t v22 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v22);
  }

  unsigned __int8 v16 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 48) + 10));
  if (v16)
  {
    if ([*(id *)(*(void *)(a1 + 48) + 160) count]) {
      ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    }
    long long v17 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __68__PXSearchResultsSectionedDataSource__asyncFetchAssetsWithQueryTag___block_invoke_6;
    v24[3] = &unk_1E5DB2758;
    uint64_t v18 = *(void *)(a1 + 64);
    v24[4] = *(void *)(a1 + 48);
    v24[5] = v18;
    [v17 enumerateObjectsUsingBlock:v24];
  }
  return [*(id *)(a1 + 48) _asyncFetchAssetsWithQueryTag:*(void *)(a1 + 72)];
}

void __68__PXSearchResultsSectionedDataSource__asyncFetchAssetsWithQueryTag___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (void *)MEMORY[0x1E4F28D58];
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v7 = a2;
  id v9 = [v5 indexPathForRow:a3 inSection:v6];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained searchResultsDataSource:*(void *)(a1 + 32) didFetchAssetsForSearchResult:v7 indexPath:v9];
}

- (id)_fetchObjectsWithEntityName:(id)a3 uuids:(id)a4
{
  photoLibrary = self->_photoLibrary;
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PLPhotoLibrary *)photoLibrary managedObjectContext];
  id v9 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:v7];

  uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@", v6];

  [v9 setPropertiesToFetch:&unk_1F02D3700];
  [v9 setIncludesPendingChanges:0];
  [v9 setPredicate:v10];
  uint64_t v13 = 0;
  id v11 = [v8 executeFetchRequest:v9 error:&v13];

  return v11;
}

- (void)_inqBackgroundProcessAssetResults:(id)a3 assetResultsForCompletions:(id)a4 collectionResults:(id)a5 topAssetsResult:(id)a6 topCollectionResults:(id)a7 withTag:(unint64_t)a8 searchString:(id)a9 representedObjects:(id)a10 maxSuggestionCount:(unint64_t)a11 priorityAssetUUID:(id)a12
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v38 = a4;
  id v39 = a5;
  id v40 = a6;
  id v41 = a7;
  id v18 = a9;
  id v19 = a10;
  id v20 = a12;
  v90[0] = 0;
  v90[1] = v90;
  v90[2] = 0x2020000000;
  char v91 = 0;
  v88[0] = 0;
  v88[1] = v88;
  v88[2] = 0x2020000000;
  unint64_t queryTag = self->_queryTag;
  BOOL v89 = queryTag != a8;
  if (queryTag == a8)
  {
    uint64_t v22 = [(id)objc_opt_class() postQuerySearchResultsLog];
    unint64_t v35 = a8;
    os_signpost_id_t v23 = os_signpost_id_generate(v22);
    uint64_t v24 = v22;
    long long v25 = v24;
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "SearchResults-PostQuery", "", buf, 2u);
    }
    os_signpost_id_t v34 = v23;

    *(void *)buf = 0;
    v83 = buf;
    uint64_t v84 = 0x3032000000;
    v85 = __Block_byref_object_copy__36077;
    v86 = __Block_byref_object_dispose__36078;
    id v87 = 0;
    v80[0] = 0;
    v80[1] = v80;
    v80[2] = 0x3032000000;
    v80[3] = __Block_byref_object_copy__36077;
    v80[4] = __Block_byref_object_dispose__36078;
    id v81 = 0;
    v79[0] = 0;
    v79[1] = v79;
    v79[2] = 0x2020000000;
    v79[3] = 0;
    v77[0] = 0;
    v77[1] = v77;
    v77[2] = 0x3032000000;
    v77[3] = __Block_byref_object_copy__36077;
    v77[4] = __Block_byref_object_dispose__36078;
    id v78 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v75[0] = 0;
    v75[1] = v75;
    v75[2] = 0x2020000000;
    BOOL v76 = 0;
    if ((unint64_t)[v19 count] <= 1)
    {
      if ([v19 count]) {
        BOOL v26 = [v18 length] != 0;
      }
      else {
        BOOL v26 = 0;
      }
    }
    else
    {
      BOOL v26 = 1;
    }
    BOOL v76 = v26;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v27 = v19;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v71 objects:v92 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v72;
      while (2)
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v72 != v29) {
            objc_enumerationMutation(v27);
          }
          if ([*(id *)(*((void *)&v71 + 1) + 8 * i) userCategory] == 5)
          {
            char v31 = 1;
            goto LABEL_20;
          }
        }
        uint64_t v28 = [v27 countByEnumeratingWithState:&v71 objects:v92 count:16];
        if (v28) {
          continue;
        }
        break;
      }
    }
    char v31 = 0;
LABEL_20:

    photoLibrary = self->_photoLibrary;
    ++self->_unprocessedSearchResultsCount;
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke;
    v54[3] = &unk_1E5DB26B8;
    v54[4] = self;
    unint64_t v68 = v35;
    v61 = v88;
    v62 = v79;
    id v55 = v37;
    v63 = v77;
    v64 = v75;
    id v56 = v38;
    id v57 = v39;
    id v58 = v41;
    v65 = v90;
    char v70 = v31;
    id v59 = v40;
    id v60 = v20;
    unint64_t v69 = a11;
    v66 = v80;
    v67 = buf;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke_2_295;
    void v42[3] = &unk_1E5DB26E0;
    v42[4] = self;
    long long v45 = v88;
    long long v46 = v80;
    unint64_t v51 = v35;
    SEL v52 = a2;
    long long v47 = buf;
    long long v48 = v79;
    id v43 = v18;
    long long v49 = v77;
    v50 = v90;
    long long v32 = v25;
    long long v44 = v32;
    os_signpost_id_t v53 = v34;
    [(PLPhotoLibrary *)photoLibrary performBlock:v54 completionHandler:v42];

    _Block_object_dispose(v75, 8);
    _Block_object_dispose(v77, 8);

    _Block_object_dispose(v79, 8);
    _Block_object_dispose(v80, 8);

    _Block_object_dispose(buf, 8);
  }
  _Block_object_dispose(v88, 8);
  _Block_object_dispose(v90, 8);
}

void __231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(NSObject **)(v2 + 144);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke_2;
  block[3] = &unk_1E5DCCCF8;
  uint64_t v4 = *(void *)(v1 + 144);
  block[4] = v2;
  uint64_t v114 = v4;
  long long v113 = *(_OWORD *)(v1 + 88);
  dispatch_sync(v3, block);
  if (!*(unsigned char *)(*(void *)(*(void *)(v1 + 88) + 8) + 24))
  {
    v80 = objc_opt_new();
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id v5 = *(id *)(v1 + 40);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v108 objects:v119 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      LOBYTE(v8) = 0;
      uint64_t v9 = *(void *)v109;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v109 != v9) {
            objc_enumerationMutation(v5);
          }
          id v11 = *(void **)(*((void *)&v108 + 1) + 8 * i);
          if (v8) {
            int v8 = 1;
          }
          else {
            int v8 = [*(id *)(*((void *)&v108 + 1) + 8 * i) isImplicitlyTokenized];
          }
          if ([v11 isSinglePersonOrPetResult])
          {
            uint64_t v12 = [v11 lookupIdentifiers];
            uint64_t v13 = [v12 firstObject];
            [v80 addObject:v13];
          }
          if (([v11 categoryMask] & 0x1C000000000) != 0)
          {
            id v14 = *(void **)(*(void *)(*(void *)(v1 + 104) + 8) + 40);
            long long v15 = [v11 assetUUIDs];
            [v14 addObjectsFromArray:v15];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v108 objects:v119 count:16];
      }
      while (v7);

      if (v8) {
        *(unsigned char *)(*(void *)(*(void *)(v1 + 112) + 8) + 24) = 1;
      }
    }
    else
    {
    }
    unsigned __int8 v16 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    long long v17 = [v16 librarySpecificFetchOptions];

    id v18 = [MEMORY[0x1E4F391F0] fetchPersonsWithLocalIdentifiers:v80 options:v17];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke_3;
    aBlock[3] = &unk_1E5DB2668;
    aBlock[4] = *(void *)(v1 + 32);
    id v76 = v18;
    id v105 = v76;
    id v19 = v17;
    uint64_t v20 = *(void *)(v1 + 96);
    id v75 = v19;
    id v106 = v19;
    uint64_t v107 = v20;
    BOOL v89 = (void (**)(void *, id, void *))_Block_copy(aBlock);
    long long v74 = [*(id *)(*(void *)(v1 + 32) + 120) searchResultSectionsForQuery:*(void *)(*(void *)(v1 + 32) + 136) withAssetResults:*(void *)(v1 + 40) assetResultsForCompletions:*(void *)(v1 + 48) collectionResults:*(void *)(v1 + 56) combineAssetSections:*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 112) + 8) + 24)];
    uint64_t v21 = objc_msgSend(*(id *)(*(void *)(v1 + 32) + 120), "updatedSearchSections:withTopCollectionResults:");
    v77 = [MEMORY[0x1E4F1CA48] array];
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    obuint64_t j = v21;
    uint64_t v22 = [obj countByEnumeratingWithState:&v100 objects:v118 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v101;
      long long v25 = off_1E5DA8000;
      BOOL v26 = off_1E5DA8000;
      uint64_t v78 = *(void *)v101;
      do
      {
        uint64_t v27 = 0;
        uint64_t v79 = v23;
        do
        {
          if (*(void *)v101 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v85 = v27;
          uint64_t v28 = *(void **)(*((void *)&v100 + 1) + 8 * v27);
          uint64_t v29 = [v28 categoryMask];
          v86 = [v28 searchResults];
          uint64_t v30 = [(__objc2_class *)v25[135] sectionIsHighlightsSection:v28];
          if (v29 != 0x2000000000)
          {
            int v31 = v30;
            uint64_t v32 = [(__objc2_class *)v26[136] sectionTypeForCategoryMask:v29 isMomentSection:v30 isTopAssetSection:0];
            if (v32)
            {
              uint64_t v33 = v32;
              int v82 = v31;
              uint64_t v84 = v29;
              v83 = [(__objc2_class *)v25[135] sectionTitleFromSearchResultSection:v28 shouldCombineAssetsSections:*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 112) + 8) + 24)];
              os_signpost_id_t v34 = (void *)[objc_alloc(v26[136]) initWithTitle:v83 withSectionType:v33];
              long long v96 = 0u;
              long long v97 = 0u;
              long long v98 = 0u;
              long long v99 = 0u;
              id v88 = v86;
              uint64_t v35 = [v88 countByEnumeratingWithState:&v96 objects:v117 count:16];
              if (!v35) {
                goto LABEL_44;
              }
              uint64_t v36 = v35;
              uint64_t v37 = *(void *)v97;
              while (1)
              {
                uint64_t v38 = 0;
                uint64_t v87 = v36;
                do
                {
                  if (*(void *)v97 != v37) {
                    objc_enumerationMutation(v88);
                  }
                  id v39 = *(void **)(*((void *)&v96 + 1) + 8 * v38);
                  uint64_t v40 = [v39 type];
                  if (v40 == 2)
                  {
                    long long v42 = v34;
                    uint64_t v43 = v1;
                    id v44 = v39;
                    long long v45 = [v44 sortDate];
                    id v41 = v89[2](v89, v44, v45);

                    long long v46 = [v44 subtitle];
                    if (!v46)
                    {
                      long long v47 = [v44 startDate];
                      long long v48 = [v44 endDate];
                      [v41 setStartDate:v47 endDate:v48];
                    }
                    uint64_t v49 = [v44 collectionType];
                    v50 = [v44 uuid];
                    unint64_t v51 = [v44 title];
                    [v41 _setCollectionType:v49 uuid:v50 title:v51 subtitle:v46];

                    uint64_t v1 = v43;
                    os_signpost_id_t v34 = v42;
                    uint64_t v36 = v87;
                    if (v41)
                    {
LABEL_38:
                      [v34 addSearchResult:v41];
                      *(unsigned char *)(*(void *)(*(void *)(v1 + 120) + 8) + 24) = 1;
LABEL_41:
                    }
                  }
                  else
                  {
                    if (v40 != 1)
                    {
                      id v41 = PLUIGetLog();
                      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                      {
                        uint64_t v52 = [v39 type];
                        *(_DWORD *)buf = 134217984;
                        uint64_t v116 = v52;
                        _os_log_impl(&dword_1A9AE7000, v41, OS_LOG_TYPE_ERROR, "Search result has unsupported type: %ld", buf, 0xCu);
                      }
                      goto LABEL_41;
                    }
                    id v41 = v89[2](v89, v39, 0);
                    if (v41) {
                      goto LABEL_38;
                    }
                  }
                  ++v38;
                }
                while (v36 != v38);
                uint64_t v36 = [v88 countByEnumeratingWithState:&v96 objects:v117 count:16];
                if (!v36)
                {
LABEL_44:

                  int v53 = v82;
                  if (!*(unsigned char *)(*(void *)(*(void *)(v1 + 112) + 8) + 24)) {
                    int v53 = 1;
                  }
                  if (v84 == 256) {
                    int v53 = 1;
                  }
                  if (v84 == 4096) {
                    int v53 = 1;
                  }
                  if (v84 == 0x10000000000000 || v84 == 128)
                  {
                    if (*(unsigned char *)(v1 + 160)) {
                      LOBYTE(v53) = 0;
                    }
                    uint64_t v24 = v78;
                    uint64_t v23 = v79;
                    long long v25 = off_1E5DA8000;
                    BOOL v26 = off_1E5DA8000;
                    if ((v53 & 1) == 0)
                    {
LABEL_59:

                      break;
                    }
                  }
                  else
                  {
                    uint64_t v24 = v78;
                    uint64_t v23 = v79;
                    long long v25 = off_1E5DA8000;
                    BOOL v26 = off_1E5DA8000;
                    if (!v53) {
                      goto LABEL_59;
                    }
                  }
                  v54 = [v34 searchResults];
                  uint64_t v55 = [v54 count];

                  if (v55) {
                    [v77 addObject:v34];
                  }
                  goto LABEL_59;
                }
              }
            }
          }

          uint64_t v27 = v85 + 1;
        }
        while (v85 + 1 != v23);
        uint64_t v23 = [obj countByEnumeratingWithState:&v100 objects:v118 count:16];
      }
      while (v23);
    }

    if ([*(id *)(v1 + 72) assetCount])
    {
      id v56 = [(id)objc_opt_class() postQuerySearchResultsLog];
      os_signpost_id_t v57 = os_signpost_id_generate(v56);
      id v58 = v56;
      id v59 = v58;
      if (v57 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v59, OS_SIGNPOST_INTERVAL_BEGIN, v57, "SearchResults-TopAssets", "", buf, 2u);
      }

      id v60 = [PXSearchTopAssetsResult alloc];
      v61 = [*(id *)(v1 + 72) assetUUIDs];
      v62 = [(PXSearchTopAssetsResult *)v60 initWithAssetUUIDs:v61 priorityAssetUUID:*(void *)(v1 + 80)];

      v63 = [(PXSearchTopAssetsResult *)v62 topAssetsFetchResult];
      if ([v63 count])
      {
        [(PXSearchTopAssetsResult *)v62 setDelegate:*(void *)(v1 + 32)];
        v64 = [*(id *)(v1 + 32) topAssetFilter];
        [(PXSearchTopAssetsResult *)v62 setTopAssetFilter:v64];

        v65 = +[PXSearchResultsSectionedDataSource topAssetsSectionForSearchResultsValue:v62];
        [v77 addObject:v65];
        *(unsigned char *)(*(void *)(*(void *)(v1 + 120) + 8) + 24) = 1;
      }
      v66 = v59;
      v67 = v66;
      if (v57 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v67, OS_SIGNPOST_INTERVAL_END, v57, "SearchResults-TopAssets", "", buf, 2u);
      }
    }
    uint64_t v68 = *(void *)(v1 + 32);
    unint64_t v69 = *(NSObject **)(v68 + 144);
    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke_290;
    void v90[3] = &unk_1E5DB2690;
    uint64_t v70 = *(void *)(v1 + 88);
    v90[4] = v68;
    id v91 = v77;
    id v92 = v74;
    uint64_t v93 = v70;
    long long v71 = *(_OWORD *)(v1 + 144);
    long long v94 = *(_OWORD *)(v1 + 128);
    long long v95 = v71;
    id v72 = v74;
    id v73 = v77;
    dispatch_sync(v69, v90);
  }
}

void __231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke_2_295(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(NSObject **)(v2 + 144);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke_3_296;
  v7[3] = &unk_1E5DB26E0;
  v7[4] = v2;
  uint64_t v4 = *(void *)(a1 + 112);
  uint64_t v13 = *(void *)(a1 + 104);
  uint64_t v14 = v4;
  long long v10 = *(_OWORD *)(a1 + 56);
  long long v11 = *(_OWORD *)(a1 + 72);
  id v8 = *(id *)(a1 + 40);
  long long v12 = *(_OWORD *)(a1 + 88);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 120);
  id v9 = v5;
  uint64_t v15 = v6;
  dispatch_async(v3, v7);
}

void __231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke_3_296(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(void *)(a1 + 104) != *(void *)(*(void *)(a1 + 32)
                                                                                                  + 72);
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 9) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(v2 + 88);
    if (!v3)
    {
      uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:*(void *)(a1 + 112) object:*(void *)(a1 + 32) file:@"PXSearchResultsSectionedDataSource.m" lineNumber:570 description:@"expect bumped counter"];

      uint64_t v2 = *(void *)(a1 + 32);
      uint64_t v3 = *(void *)(v2 + 88);
    }
    *(void *)(v2 + 88) = v3 - 1;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 168), *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
    *(void *)(*(void *)(a1 + 32) + 80) = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    id v4 = *(id *)(*(void *)(a1 + 32) + 136);
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v21 = v4;
    uint64_t v7 = [v4 queryTokens];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ([v12 userCategory] == 14 || !objc_msgSend(v12, "userCategory"))
          {
            uint64_t v13 = [v12 text];
            [v5 addObject:v13];
          }
          uint64_t v14 = [v12 text];
          uint64_t v15 = [v14 length];

          if (v15)
          {
            unsigned __int8 v16 = [v12 text];
            [v6 addObject:v16];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
    }

    [v21 personIdentifiers];
    objc_claimAutoreleasedReturnValue();
    PXMap();
  }
  long long v17 = *(id *)(a1 + 48);
  id v18 = v17;
  os_signpost_id_t v19 = *(void *)(a1 + 120);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v18, OS_SIGNPOST_INTERVAL_END, v19, "SearchResults-PostQuery", "", buf, 2u);
  }
}

void __231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained searchResultsDataSourceHasPendingChanges:*(void *)(a1 + 32) shouldMergePendingChanges:1];
}

uint64_t __231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F391F0] localIdentifierWithUUID:a2];
}

void __231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke_2(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(void *)(a1[4] + 72) != a1[7];
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    uint64_t v2 = a1[4];
    if (!*(void *)(v2 + 168) && !*(void *)(v2 + 48) && !*(unsigned char *)(v2 + 9))
    {
      objc_storeStrong((id *)(v2 + 168), *(id *)(v2 + 160));
      objc_storeStrong((id *)(a1[4] + 48), *(id *)(a1[4] + 40));
      *(void *)(a1[4] + 80) = *(void *)(a1[4] + 64);
      uint64_t v2 = a1[4];
    }
    *(void *)(*(void *)(a1[6] + 8) + 24) = *(void *)(v2 + 80);
  }
}

PXSearchResultsValue *__231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [v5 assetCount];
  uint64_t v8 = objc_alloc_init(PXSearchResultsValue);
  [(PXSearchResultsValue *)v8 setDelegate:*(void *)(a1 + 32)];
  [(PXSearchResultsValue *)v8 _setSearchResult:v5];
  [(PXSearchResultsValue *)v8 _setApproximateCount:v7];
  [(PXSearchResultsValue *)v8 _setDate:v6];
  if ([v5 isSinglePersonOrPetResult])
  {
    unint64_t v28 = v7;
    id v30 = v6;
    uint64_t v9 = [v5 lookupIdentifiers];
    uint64_t v10 = [v9 firstObject];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v29 = a1;
    id v11 = *(id *)(a1 + 40);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(v11);
          }
          unsigned __int8 v16 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          long long v17 = [v16 uuid];
          int v18 = [v17 isEqualToString:v10];

          if (v18)
          {
            [(PXSearchResultsValue *)v8 _setPerson:v16];
            goto LABEL_12;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v37 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    os_signpost_id_t v19 = [(PXSearchResultsValue *)v8 person];

    a1 = v29;
    id v6 = v30;
    unint64_t v7 = v28;
    if (!v19)
    {
      uint64_t v20 = [MEMORY[0x1E4F391F0] fetchFinalMergeTargetPersonsForPersonWithUUID:v10 options:*(void *)(v29 + 48)];
      uint64_t v21 = [v20 firstObject];

      if (!v21)
      {
        long long v26 = 0;
        goto LABEL_23;
      }
      [(PXSearchResultsValue *)v8 _setPerson:v21];
    }
  }
  uint64_t v10 = [v5 keyAssetUUID];
  if (![v10 length])
  {
    uint64_t v22 = PLUIGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v5;
      _os_log_impl(&dword_1A9AE7000, v22, OS_LOG_TYPE_ERROR, "keyAssetUUID is nil for searchResult: %@", buf, 0xCu);
    }
  }
  long long v23 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v10, 0);
  [(PXSearchResultsValue *)v8 _setAssetUUIDs:v23];

  uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
  unint64_t v25 = *(void *)(v24 + 24);
  if (v25 <= v7) {
    unint64_t v25 = v7;
  }
  *(void *)(v24 + 24) = v25;
  long long v26 = v8;
LABEL_23:

  return v26;
}

void __231__PXSearchResultsSectionedDataSource__inqBackgroundProcessAssetResults_assetResultsForCompletions_collectionResults_topAssetsResult_topCollectionResults_withTag_searchString_representedObjects_maxSuggestionCount_priorityAssetUUID___block_invoke_290(void *a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = *(void *)(a1[4] + 72) != a1[10];
  if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    uint64_t v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"sectionType" ascending:1];
    uint64_t v3 = (void *)a1[5];
    v15[0] = v2;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    id v5 = [v3 sortedArrayUsingDescriptors:v4];

    id v6 = [*(id *)(a1[4] + 136) searchText];
    uint64_t v7 = [v6 length];

    uint64_t v8 = a1[4];
    if (v7)
    {
      uint64_t v9 = [*(id *)(v8 + 120) completionSuggestionsForQuery:*(void *)(v8 + 136) withSearchSections:a1[6] numberOfSuggestions:a1[11]];
    }
    else
    {
      if (![*(id *)(v8 + 136) numberOfNextKeywordSuggestionToProcess])
      {
LABEL_7:
        uint64_t v12 = *(void *)(a1[9] + 8);
        uint64_t v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v5;
        id v14 = v5;

        *(void *)(a1[4] + 56) = 0;
        return;
      }
      uint64_t v9 = [*(id *)(a1[4] + 136) nextKeywordSuggestions];
    }
    uint64_t v10 = *(void *)(a1[8] + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    goto LABEL_7;
  }
}

- (BOOL)_shouldCancel:(unint64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__PXSearchResultsSectionedDataSource__shouldCancel___block_invoke;
  v6[3] = &unk_1E5DD0588;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  LOBYTE(a3) = v8[3] != a3;
  _Block_object_dispose(&v7, 8);
  return a3;
}

uint64_t __52__PXSearchResultsSectionedDataSource__shouldCancel___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 72);
  return result;
}

- (BOOL)resultsReady
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__PXSearchResultsSectionedDataSource_resultsReady__block_invoke;
  v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__PXSearchResultsSectionedDataSource_resultsReady__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)setSearchString:(id)a3 representedObjects:(id)a4 maxSuggestionCount:(unint64_t)a5 priorityAssetUUID:(id)a6 libraryScope:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  queue = self->_queue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __123__PXSearchResultsSectionedDataSource_setSearchString_representedObjects_maxSuggestionCount_priorityAssetUUID_libraryScope___block_invoke;
  v19[3] = &unk_1E5DB2640;
  v19[4] = self;
  id v20 = v12;
  unint64_t v23 = a7;
  unint64_t v24 = a5;
  id v21 = v13;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(queue, v19);
}

void __123__PXSearchResultsSectionedDataSource_setSearchString_representedObjects_maxSuggestionCount_priorityAssetUUID_libraryScope___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _inqCancel];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[9];
  uint64_t v4 = *(void *)(a1 + 64);
  if (v4 == 2) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = v4 == 1;
  }
  uint64_t v6 = [v2 searchIndex];
  uint64_t v7 = [v6 newQueryWithSearchText:*(void *)(a1 + 40) queryTokens:*(void *)(a1 + 48) useWildcardSearchText:1 libraryScope:v5];
  uint64_t v8 = *(void *)(a1 + 32);
  char v9 = *(void **)(v8 + 136);
  *(void *)(v8 + 136) = v7;

  [*(id *)(*(void *)(a1 + 32) + 136) setWordEmbeddingMode:258];
  if (![*(id *)(a1 + 40) length]) {
    [*(id *)(*(void *)(a1 + 32) + 136) setNumberOfNextKeywordSuggestionToProcess:*(void *)(a1 + 72)];
  }
  [*(id *)(a1 + 32) setResultsReady:0];
  qos_class_t v10 = qos_class_self();
  id v11 = dispatch_get_global_queue(v10, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __123__PXSearchResultsSectionedDataSource_setSearchString_representedObjects_maxSuggestionCount_priorityAssetUUID_libraryScope___block_invoke_2;
  v15[3] = &unk_1E5DB2640;
  id v12 = *(void **)(a1 + 40);
  v15[4] = *(void *)(a1 + 32);
  uint64_t v19 = v3;
  id v16 = v12;
  id v13 = *(id *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 72);
  id v17 = v13;
  uint64_t v20 = v14;
  id v18 = *(id *)(a1 + 56);
  dispatch_async(v11, v15);
}

void __123__PXSearchResultsSectionedDataSource_setSearchString_representedObjects_maxSuggestionCount_priorityAssetUUID_libraryScope___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 120);
  uint64_t v4 = *(void *)(v2 + 136);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __123__PXSearchResultsSectionedDataSource_setSearchString_representedObjects_maxSuggestionCount_priorityAssetUUID_libraryScope___block_invoke_3;
  v8[3] = &unk_1E5DB2618;
  uint64_t v5 = *(void *)(a1 + 64);
  void v8[4] = v2;
  uint64_t v12 = v5;
  id v9 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 72);
  id v10 = v6;
  uint64_t v13 = v7;
  id v11 = *(id *)(a1 + 56);
  [v3 performQuery:v4 withResultsHandler:v8];
}

void __123__PXSearchResultsSectionedDataSource_setSearchString_representedObjects_maxSuggestionCount_priorityAssetUUID_libraryScope___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = *(void *)(a1 + 32);
  id v17 = *(NSObject **)(v16 + 144);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __123__PXSearchResultsSectionedDataSource_setSearchString_representedObjects_maxSuggestionCount_priorityAssetUUID_libraryScope___block_invoke_4;
  block[3] = &unk_1E5DB25F0;
  block[4] = v16;
  id v26 = v11;
  id v27 = v12;
  id v28 = v13;
  id v29 = v14;
  id v30 = v15;
  uint64_t v34 = *(void *)(a1 + 64);
  id v31 = *(id *)(a1 + 40);
  id v18 = *(id *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 72);
  id v32 = v18;
  uint64_t v35 = v19;
  id v33 = *(id *)(a1 + 56);
  id v20 = v15;
  id v21 = v14;
  id v22 = v13;
  id v23 = v12;
  id v24 = v11;
  dispatch_async(v17, block);
}

void __123__PXSearchResultsSectionedDataSource_setSearchString_representedObjects_maxSuggestionCount_priorityAssetUUID_libraryScope___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _inqBackgroundProcessAssetResults:*(void *)(a1 + 40) assetResultsForCompletions:*(void *)(a1 + 48) collectionResults:*(void *)(a1 + 56) topAssetsResult:*(void *)(a1 + 64) topCollectionResults:*(void *)(a1 + 72) withTag:*(void *)(a1 + 104) searchString:*(void *)(a1 + 80) representedObjects:*(void *)(a1 + 88) maxSuggestionCount:*(void *)(a1 + 112) priorityAssetUUID:*(void *)(a1 + 96)];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 136) substitutions];
  uint64_t v3 = [v2 allKeys];
  if ([v3 count])
  {
    char v4 = [*(id *)(a1 + 32) wordEmbeddingsRequested];

    if ((v4 & 1) == 0)
    {
      uint64_t v5 = *(void **)(a1 + 32);
      uint64_t v6 = 1;
LABEL_13:
      [v5 setWordEmbeddingsRequested:v6];
      return;
    }
  }
  else
  {
  }
  id v9 = [*(id *)(*(void *)(a1 + 32) + 136) substitutions];
  uint64_t v7 = [v9 allKeys];
  if (![v7 count]
    && ([*(id *)(a1 + 40) count] || objc_msgSend(*(id *)(a1 + 56), "count")))
  {
    int v8 = [*(id *)(a1 + 32) wordEmbeddingsRequested];

    if (!v8) {
      return;
    }
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = 0;
    goto LABEL_13;
  }
}

- (id)titleForHeaderInSection:(int64_t)a3 accessibilityIdentifier:(id *)a4
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__36077;
  uint64_t v19 = __Block_byref_object_dispose__36078;
  id v20 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__36077;
  id v13 = __Block_byref_object_dispose__36078;
  id v14 = 0;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__PXSearchResultsSectionedDataSource_titleForHeaderInSection_accessibilityIdentifier___block_invoke;
  v8[3] = &unk_1E5DCCCF8;
  void v8[4] = self;
  void v8[5] = &v15;
  v8[6] = &v9;
  v8[7] = a3;
  dispatch_sync(queue, v8);
  if (a4) {
    *a4 = (id) v10[5];
  }
  id v6 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __86__PXSearchResultsSectionedDataSource_titleForHeaderInSection_accessibilityIdentifier___block_invoke(void *a1)
{
  unint64_t v2 = a1[7];
  if (v2 < [*(id *)(a1[4] + 40) count])
  {
    id v8 = [*(id *)(a1[4] + 40) objectAtIndexedSubscript:a1[7]];
    uint64_t v3 = [v8 title];
    uint64_t v4 = *(void *)(a1[5] + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v6 = [v8 sectionType];
    if ((unint64_t)(v6 - 1) > 0x14) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = off_1E5DB2778[v6 - 1];
    }
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v7);
  }
}

- (BOOL)isTopAssetsSection:(int64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PXSearchResultsSectionedDataSource_isTopAssetsSection___block_invoke;
  block[3] = &unk_1E5DCDEC8;
  void block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __57__PXSearchResultsSectionedDataSource_isTopAssetsSection___block_invoke(void *a1)
{
  unint64_t v2 = a1[6];
  if (v2 < [*(id *)(a1[4] + 40) count])
  {
    id v5 = [*(id *)(a1[4] + 40) objectAtIndexedSubscript:a1[6]];
    uint64_t v3 = [v5 searchResults];
    char v4 = [v3 firstObject];

    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [v4 itemType] == 2;
  }
}

- (id)allSearchResultsForSection:(int64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  char v10 = __Block_byref_object_copy__36077;
  uint64_t v11 = __Block_byref_object_dispose__36078;
  id v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PXSearchResultsSectionedDataSource_allSearchResultsForSection___block_invoke;
  block[3] = &unk_1E5DCDEC8;
  void block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __65__PXSearchResultsSectionedDataSource_allSearchResultsForSection___block_invoke(void *a1)
{
  unint64_t v2 = a1[6];
  if (v2 < [*(id *)(a1[4] + 40) count])
  {
    id v6 = [*(id *)(a1[4] + 40) objectAtIndexedSubscript:a1[6]];
    uint64_t v3 = [v6 searchResults];
    uint64_t v4 = *(void *)(a1[5] + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

- (id)searchResultAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__36077;
  uint64_t v17 = __Block_byref_object_dispose__36078;
  id v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PXSearchResultsSectionedDataSource_searchResultAtIndexPath___block_invoke;
  block[3] = &unk_1E5DCCA20;
  id v10 = v4;
  uint64_t v11 = self;
  id v12 = &v13;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __62__PXSearchResultsSectionedDataSource_searchResultAtIndexPath___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) section];
  if (v2 < [*(id *)(*(void *)(a1 + 40) + 40) count])
  {
    id v8 = [*(id *)(*(void *)(a1 + 40) + 40) objectAtIndexedSubscript:v2];
    unint64_t v3 = [*(id *)(a1 + 32) row];
    if (v3 < [v8 visibleCount])
    {
      id v4 = [v8 searchResults];
      uint64_t v5 = objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "row"));
      uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
  }
}

- (int64_t)numberOfSearchResultsInSection:(int64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PXSearchResultsSectionedDataSource_numberOfSearchResultsInSection___block_invoke;
  block[3] = &unk_1E5DCDEC8;
  void block[5] = &v7;
  block[6] = a3;
  void block[4] = self;
  dispatch_sync(queue, block);
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __69__PXSearchResultsSectionedDataSource_numberOfSearchResultsInSection___block_invoke(void *a1)
{
  unint64_t v2 = a1[6];
  if (v2 < [*(id *)(a1[4] + 40) count])
  {
    id v3 = [*(id *)(a1[4] + 40) objectAtIndexedSubscript:a1[6]];
    *(void *)(*(void *)(a1[5] + 8) + 24) = [v3 totalCount];
  }
}

- (int64_t)numberOfVisibleSearchResultsInSection:(int64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PXSearchResultsSectionedDataSource_numberOfVisibleSearchResultsInSection___block_invoke;
  block[3] = &unk_1E5DCDEC8;
  void block[5] = &v7;
  block[6] = a3;
  void block[4] = self;
  dispatch_sync(queue, block);
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __76__PXSearchResultsSectionedDataSource_numberOfVisibleSearchResultsInSection___block_invoke(void *a1)
{
  unint64_t v2 = a1[6];
  if (v2 < [*(id *)(a1[4] + 40) count])
  {
    id v3 = [*(id *)(a1[4] + 40) objectAtIndexedSubscript:a1[6]];
    *(void *)(*(void *)(a1[5] + 8) + 24) = [v3 visibleCount];
  }
}

- (void)collapseSection:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__PXSearchResultsSectionedDataSource_collapseSection___block_invoke;
  v4[3] = &unk_1E5DD08D8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

void __54__PXSearchResultsSectionedDataSource_collapseSection___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 < [*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 40) objectAtIndexedSubscript:*(void *)(a1 + 40)];
    [v3 setExpanded:0];
  }
}

- (void)expandSection:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__PXSearchResultsSectionedDataSource_expandSection___block_invoke;
  v4[3] = &unk_1E5DD08D8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

void __52__PXSearchResultsSectionedDataSource_expandSection___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 < [*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 40) objectAtIndexedSubscript:*(void *)(a1 + 40)];
    [v3 setExpanded:1];
  }
}

- (BOOL)isSectionExpanded:(int64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PXSearchResultsSectionedDataSource_isSectionExpanded___block_invoke;
  block[3] = &unk_1E5DCDEC8;
  void block[5] = &v7;
  block[6] = a3;
  void block[4] = self;
  dispatch_sync(queue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __56__PXSearchResultsSectionedDataSource_isSectionExpanded___block_invoke(void *a1)
{
  unint64_t v2 = a1[6];
  if (v2 < [*(id *)(a1[4] + 40) count])
  {
    id v3 = [*(id *)(a1[4] + 40) objectAtIndexedSubscript:a1[6]];
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [v3 isExpanded];
  }
}

- (BOOL)isSectionExpandable:(int64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PXSearchResultsSectionedDataSource_isSectionExpandable___block_invoke;
  block[3] = &unk_1E5DCDEC8;
  void block[5] = &v7;
  block[6] = a3;
  void block[4] = self;
  dispatch_sync(queue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __58__PXSearchResultsSectionedDataSource_isSectionExpandable___block_invoke(void *a1)
{
  unint64_t v2 = a1[6];
  if (v2 < [*(id *)(a1[4] + 40) count])
  {
    id v3 = [*(id *)(a1[4] + 40) objectAtIndexedSubscript:a1[6]];
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = [v3 isExpandable];
  }
}

- (int64_t)numberOfSections
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__PXSearchResultsSectionedDataSource_numberOfSections__block_invoke;
  v5[3] = &unk_1E5DD0588;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__PXSearchResultsSectionedDataSource_numberOfSections__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)initForUnitTests
{
  v6.receiver = self;
  v6.super_class = (Class)PXSearchResultsSectionedDataSource;
  unint64_t v2 = [(PXSearchResultsSectionedDataSource *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create(0, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (PXSearchResultsSectionedDataSource)initWithSearchIndex:(id)a3 photoLibrary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PXSearchResultsSectionedDataSource;
  uint64_t v9 = [(PXSearchResultsSectionedDataSource *)&v21 init];
  char v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_searchIndex, a3);
    dispatch_queue_t v11 = dispatch_queue_create(0, 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F8ABB8]) initWithDatabase:v10->_searchIndex];
    searchProcessor = v10->_searchProcessor;
    v10->_searchProcessor = (PLSearchProcessor *)v13;

    objc_storeStrong((id *)&v10->_photoLibrary, a4);
    uint64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v10 selector:sel__confirmationDidFinish_ name:@"PXPeopleConfirmationDidFinish" object:0];

    objc_initWeak(&location, v10);
    uint64_t v16 = dispatch_get_global_queue(17, 0);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __71__PXSearchResultsSectionedDataSource_initWithSearchIndex_photoLibrary___block_invoke;
    v18[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v19, &location);
    dispatch_async(v16, v18);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __71__PXSearchResultsSectionedDataSource_initWithSearchIndex_photoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = 0;
    unint64_t v2 = +[PXSearchTaxonomyUtility localizedSceneAncestryInformationWithError:&v4];
    id v3 = v4;
    if (v2)
    {
      [WeakRetained setSceneAncestryInformation:v2];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v6 = v3;
      _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not get scene ancestry information, error %@", buf, 0xCu);
    }
  }
}

+ (id)postQuerySearchResultsLog
{
  if (postQuerySearchResultsLog_onceToken != -1) {
    dispatch_once(&postQuerySearchResultsLog_onceToken, &__block_literal_global_349);
  }
  unint64_t v2 = (void *)postQuerySearchResultsLog_postQuerySearchResultsLog;
  return v2;
}

void __63__PXSearchResultsSectionedDataSource_postQuerySearchResultsLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.photos.ui.search", "SearchResults-PostQuery");
  uint64_t v1 = (void *)postQuerySearchResultsLog_postQuerySearchResultsLog;
  postQuerySearchResultsLog_postQuerySearchResultsLog = (uint64_t)v0;
}

+ (id)topAssetsSectionForSearchResultsValue:(id)a3
{
  id v3 = a3;
  id v4 = PXLocalizedStringFromTable(@"SEARCH_RESULT_SECTION_HEADER_PHOTOS_TITLE", @"PhotosUICore");
  uint64_t v5 = [v3 assetUUIDs];
  uint64_t v9 = [v5 count];
  id v6 = PXLocalizedStringWithValidatedFormat(v4, @"%lu");

  uint64_t v7 = [[PXSearchResultsSection alloc] initWithTitle:v6 withSectionType:+[PXSearchResultsSection sectionTypeForCategoryMask:isMomentSection:isTopAssetSection:](PXSearchResultsSection, "sectionTypeForCategoryMask:isMomentSection:isTopAssetSection:", 0x8000000, 0, 1, v9)];
  [(PXSearchResultsSection *)v7 addSearchResult:v3];

  return v7;
}

@end