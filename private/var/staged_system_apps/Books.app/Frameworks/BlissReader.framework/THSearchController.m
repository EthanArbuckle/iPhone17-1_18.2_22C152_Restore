@interface THSearchController
- (BOOL)indexLoaded;
- (BOOL)isEncodedResultForPageNumber:(id)a3;
- (BOOL)paginationResultsValid;
- (BOOL)searchNotes;
- (BOOL)unloadRequested;
- (NSArray)mediaSearchResults;
- (NSArray)notesSearchResults;
- (NSArray)recentSearches;
- (NSArray)suggestionOccurenceCounts;
- (NSArray)suggestionResults;
- (NSArray)textSearchResults;
- (NSArray)topMediaSearchResults;
- (NSArray)topNotesSearchResults;
- (NSArray)topTextSearchResults;
- (NSString)currentQuery;
- (NSString)recentSearchResultsAutosaveName;
- (THDisplayPageNumberMap)displayPageNumberMap;
- (THSearchController)initWithDocumentRoot:(id)a3;
- (id)anchorForSelectedSearchResult:(id)a3;
- (id)displayNumberStringFromEncodedPageNumberResult:(id)a3;
- (id)displayPageNumberForAbsolutePageIndex:(unint64_t)a3;
- (id)p_allSearchResults;
- (id)p_recentSearchAtIndex:(int64_t)a3;
- (id)p_recentsEntryForTrimmedQuery:(id)a3 resultCount:(int64_t)a4;
- (id)recentSearchQueryAtIndex:(int64_t)a3;
- (id)summaryForGlossaryTerm:(id)a3;
- (int64_t)recentSearchCount;
- (int64_t)recentSearchCountAtIndex:(int64_t)a3;
- (unint64_t)absolutePageIndexForPageNumberString:(id)a3;
- (unint64_t)absolutePageIndexFromEncodedPageNumberResult:(id)a3;
- (unint64_t)searchResultCount;
- (void)annotationSearchIndexBuildOperationFailed:(id)a3;
- (void)cancelLoadIndex;
- (void)clearSearchResults;
- (void)dealloc;
- (void)documentWillDealloc;
- (void)invalidatePaginationResults;
- (void)loadIndex;
- (void)p_indexloadFinished:(id)a3;
- (void)p_kickOffQuery:(id)a3 giveSuggestions:(BOOL)a4 completionBlock:(id)a5;
- (void)p_populatePageNumbersOfModelSearchResults:(id)a3;
- (void)p_processSearchResultsWithCompletionBlock:(id)a3;
- (void)p_processSuggestionsWithCompletionBlock:(id)a3;
- (void)p_setupDisplayPageNumberMap;
- (void)resolveTitleForSearchResult:(id)a3;
- (void)searchForString:(id)a3 completionBlock:(id)a4;
- (void)searchIndexLoadOperationFailed:(id)a3;
- (void)setAnnotationSearchRefText:(id)a3;
- (void)setDisplayPageNumberMap:(id)a3;
- (void)setPaginationResultsValid:(BOOL)a3;
- (void)setRecentSearchResultsAutosaveName:(id)a3;
- (void)setRecentSearches:(id)a3;
- (void)setSearchNotes:(BOOL)a3;
- (void)setSearchRefText:(id)a3;
- (void)setUnloadRequested:(BOOL)a3;
- (void)suggestionsForSearchString:(id)a3 completionBlock:(id)a4;
- (void)unloadIndex;
- (void)updatePaginationResults;
@end

@implementation THSearchController

- (THSearchController)initWithDocumentRoot:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THSearchController;
  v4 = [(THSearchController *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->mDocumentRoot = (THDocumentRoot *)a3;
    v4->mRecentSearches = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v5;
}

- (void)p_setupDisplayPageNumberMap
{
  if (![(THSearchController *)self displayPageNumberMap])
  {
    [(THSearchController *)self setDisplayPageNumberMap:objc_alloc_init(THDisplayPageNumberMap)];
    if ([(THSearchController *)self paginationResultsValid])
    {
      [(THSearchController *)self updatePaginationResults];
    }
  }
}

- (void)updatePaginationResults
{
  [(THDisplayPageNumberMap *)[(THSearchController *)self displayPageNumberMap] buildDisplayPageMapsWithDocumentRoot:self->mDocumentRoot];
  [(THSearchController *)self setPaginationResultsValid:1];
  if ([(THSearchController *)self displayPageNumberMap])
  {
    [(THSearchController *)self p_populatePageNumbersOfModelSearchResults:[(THSearchController *)self p_allSearchResults]];
    v3 = +[NSNotificationCenter defaultCenter];
    v4 = THSearchControllerDidUpdatePaginationResultsNotification;
    [(NSNotificationCenter *)v3 postNotificationName:v4 object:self];
  }
}

- (void)invalidatePaginationResults
{
  [(THDisplayPageNumberMap *)[(THSearchController *)self displayPageNumberMap] clearDisplayPageMapsWithDocumentRoot:self->mDocumentRoot];
  [(THSearchController *)self setPaginationResultsValid:0];
  if ([(THSearchController *)self displayPageNumberMap])
  {
    [(THSearchController *)self p_populatePageNumbersOfModelSearchResults:[(THSearchController *)self p_allSearchResults]];
    v3 = +[NSNotificationCenter defaultCenter];
    v4 = THSearchControllerDidUpdatePaginationResultsNotification;
    [(NSNotificationCenter *)v3 postNotificationName:v4 object:self];
  }
}

- (void)dealloc
{
  [(THSearchController *)self clearSearchResults];

  self->mRecentSearches = 0;
  self->mDisplayPageNumberMap = 0;

  self->mAnnotationReferenceTextMap = 0;
  v3.receiver = self;
  v3.super_class = (Class)THSearchController;
  [(THSearchController *)&v3 dealloc];
}

- (void)suggestionsForSearchString:(id)a3 completionBlock:(id)a4
{
  objc_sync_enter(self);
  [(THSearchController *)self p_kickOffQuery:a3 giveSuggestions:1 completionBlock:a4];

  objc_sync_exit(self);
}

- (void)searchForString:(id)a3 completionBlock:(id)a4
{
  objc_sync_enter(self);
  [(THSearchController *)self p_kickOffQuery:a3 giveSuggestions:0 completionBlock:a4];

  objc_sync_exit(self);
}

- (id)p_recentsEntryForTrimmedQuery:(id)a3 resultCount:(int64_t)a4
{
  return +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", a3, @"query", +[NSNumber numberWithInteger:a4], @"result count", 0);
}

- (void)p_kickOffQuery:(id)a3 giveSuggestions:(BOOL)a4 completionBlock:(id)a5
{
  objc_sync_enter(self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_D0CC0;
  v9[3] = &unk_4590F0;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = a5;
  BOOL v10 = a4;
  _os_activity_initiate(&dword_0, "Search for string", OS_ACTIVITY_FLAG_DEFAULT, v9);
  objc_sync_exit(self);
}

- (void)setSearchRefText:(id)a3
{
  objc_sync_enter(self);
  self->mReferenceTextMap = (NSDictionary *)a3;

  objc_sync_exit(self);
}

- (void)setAnnotationSearchRefText:(id)a3
{
  objc_sync_enter(self);

  self->mAnnotationReferenceTextMap = 0;
  self->mAnnotationReferenceTextMap = (NSDictionary *)a3;

  objc_sync_exit(self);
}

- (void)p_processSuggestionsWithCompletionBlock:(id)a3
{
  objc_sync_enter(self);
  if (self->mCurrentQuery
    && self->mOccurrenceMap
    && (![(THSearchController *)self searchNotes] || self->mAnnotationOccurrenceMap)
    && self->mReferenceTextMap)
  {
    id v5 = [(THSearchIndex *)[(THDocumentRoot *)self->mDocumentRoot searchIndex] resultsForQuery:self->mCurrentQuery occurrenceMap:self->mOccurrenceMap searchContextMap:self->mReferenceTextMap suggestions:1];
    if ([(THSearchController *)self searchNotes])
    {
      id v6 = [(THSearchIndex *)[(THDocumentRoot *)self->mDocumentRoot annotationSearchIndex] resultsForQuery:self->mCurrentQuery occurrenceMap:self->mAnnotationOccurrenceMap searchContextMap:self->mAnnotationReferenceTextMap suggestions:1];
      id v7 = +[NSMutableDictionary dictionary];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v8 = [v5 setByAddingObjectsFromSet:v6];
      id v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v30;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v30 != v10) {
              objc_enumerationMutation(v8);
            }
            v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            id v13 = [v7 objectForKey:[v12 term]];
            if (v13) {
              [v13 setOccurenceCount:((char *)[v13 occurenceCount]) + [v12 occurenceCount]];
            }
            else {
              [v7 setObject:v12 forKey:[v12 term]];
            }
          }
          id v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v9);
      }
      v14 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", [v7 allValues]);
    }
    else
    {
      v14 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", [v5 allObjects]);
    }
    v15 = v14;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_D1694;
    v28[3] = &unk_457B78;
    v28[4] = self;
    [(NSMutableArray *)v14 sortUsingComparator:v28];
    id v16 = [(THDisplayPageNumberMap *)[(THSearchController *)self displayPageNumberMap] preferredAbsolutePageIndexesForDisplayPageNumber:self->mCurrentQuery];
    id v17 = [v16 count];
    BOOL v18 = v17 != 0;
    v19 = +[NSMutableArray arrayWithCapacity:v18];
    v20 = +[NSMutableArray arrayWithCapacity:v18];
    if (v17)
    {
      signed int v21 = [[v16 objectAtIndex:0] intValue];
      id v22 = [(THDisplayPageNumberMap *)[(THSearchController *)self displayPageNumberMap] displayPageNumberForAbsolutePageIndex:v21];
      [(NSMutableArray *)v19 addObject:+[NSString stringWithFormat:@"%@%@,%lu", kTHSearchControllerPageNumberToken, v22, v21]];
      [(NSMutableArray *)v20 addObject:+[NSNumber numberWithUnsignedInteger:1]];
      unint64_t v23 = 19;
    }
    else
    {
      unint64_t v23 = 20;
    }
    if ((unint64_t)[(NSMutableArray *)v15 count] > v23) {
      -[NSMutableArray removeObjectsInRange:](v15, "removeObjectsInRange:", v23, (char *)[(NSMutableArray *)v15 count] - v23);
    }
    v24 = +[NSArray arrayWithArray:[(NSMutableArray *)v15 tsu_map:&stru_459130]];
    v25 = +[NSArray arrayWithArray:[(NSMutableArray *)v15 tsu_map:&stru_459170]];
    id v26 = [(NSMutableArray *)v19 arrayByAddingObjectsFromArray:v24];
    id v27 = [(NSMutableArray *)v20 arrayByAddingObjectsFromArray:v25];
    self->mSuggestionResults = (NSArray *)[v26 copy];
    self->mSuggestionOccurenceCounts = (NSArray *)[v27 copy];
    (*((void (**)(id))a3 + 2))(a3);

    self->mOccurrenceMap = 0;
    self->mAnnotationOccurrenceMap = 0;

    self->mReferenceTextMap = 0;
  }
  objc_sync_exit(self);
}

- (void)p_processSearchResultsWithCompletionBlock:(id)a3
{
  objc_sync_enter(self);
  if (self->mCurrentQuery
    && self->mOccurrenceMap
    && (![(THSearchController *)self searchNotes] || self->mAnnotationOccurrenceMap)
    && self->mReferenceTextMap
    && (![(THSearchController *)self searchNotes] || self->mAnnotationReferenceTextMap))
  {
    id v5 = [(THSearchIndex *)[(THDocumentRoot *)self->mDocumentRoot searchIndex] resultsForQuery:self->mCurrentQuery occurrenceMap:self->mOccurrenceMap searchContextMap:self->mReferenceTextMap suggestions:0];
    -[THSearchController p_populatePageNumbersOfModelSearchResults:](self, "p_populatePageNumbersOfModelSearchResults:", [v5 objectsPassingTest:&stru_4591B0]);
    id v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
    id v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
    v45 = (void (**)(void))a3;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v8 = [v5 countByEnumeratingWithState:&v67 objects:v76 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v68;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v68 != v9) {
            objc_enumerationMutation(v5);
          }
          v11 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          if ([v11 isTextResult]) {
            v12 = v6;
          }
          else {
            v12 = v7;
          }
          [(NSMutableArray *)v12 addObject:v11];
        }
        id v8 = [v5 countByEnumeratingWithState:&v67 objects:v76 count:16];
      }
      while (v8);
    }
    if ([(THSearchController *)self searchNotes])
    {
      id v13 = objc_msgSend(objc_msgSend(-[THSearchIndex resultsForQuery:occurrenceMap:searchContextMap:suggestions:](-[THDocumentRoot annotationSearchIndex](self->mDocumentRoot, "annotationSearchIndex"), "resultsForQuery:occurrenceMap:searchContextMap:suggestions:", self->mCurrentQuery, self->mAnnotationOccurrenceMap, self->mAnnotationReferenceTextMap, 0), "allObjects"), "mutableCopy");
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v14 = [v13 countByEnumeratingWithState:&v63 objects:v75 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v64;
        do
        {
          for (j = 0; j != v14; j = (char *)j + 1)
          {
            if (*(void *)v64 != v15) {
              objc_enumerationMutation(v13);
            }
            objc_msgSend(*(id *)(*((void *)&v63 + 1) + 8 * (void)j), "setDisplayPageNumber:", -[THDisplayPageNumberMap displayPageNumberForAbsolutePageIndex:](-[THSearchController displayPageNumberMap](self, "displayPageNumberMap"), "displayPageNumberForAbsolutePageIndex:", objc_msgSend(*(id *)(*((void *)&v63 + 1) + 8 * (void)j), "pageNumber")));
          }
          id v14 = [v13 countByEnumeratingWithState:&v63 objects:v75 count:16];
        }
        while (v14);
      }
    }
    else
    {
      id v13 = 0;
    }
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_D1FB0;
    v62[3] = &unk_457B78;
    v62[4] = self;
    id v17 = &isPad_ptr;
    if ([(NSMutableArray *)v6 count])
    {
      [(NSMutableArray *)v6 sortUsingComparator:v62];
      id v18 = objc_alloc_init((Class)NSMutableArray);
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v19 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v58 objects:v74 count:16];
      if (v19)
      {
        BOOL v20 = 0;
        uint64_t v21 = *(void *)v59;
        do
        {
          for (k = 0; k != v19; k = (char *)k + 1)
          {
            if (*(void *)v59 != v21) {
              objc_enumerationMutation(v6);
            }
            unint64_t v23 = *(void **)(*((void *)&v58 + 1) + 8 * (void)k);
            if ([v23 rank] == 1 && v20)
            {
              BOOL v20 = 1;
            }
            else
            {
              [v18 addObject:v23];
              BOOL v20 = [v23 rank] == 1;
            }
          }
          id v19 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v58 objects:v74 count:16];
        }
        while (v19);
      }
      id v17 = &isPad_ptr;
      id v24 = objc_alloc((Class)NSArray);
      id v25 = [v18 count];
      if ((unint64_t)v25 >= 3) {
        uint64_t v26 = 3;
      }
      else {
        uint64_t v26 = (uint64_t)v25;
      }
      self->mTopTextResults = [v24 initWithArray:[v18 subarrayWithRange:0, v26]];

      [(NSMutableArray *)v6 sortUsingComparator:&stru_4591D0];
      self->mTextResults = (NSArray *)[objc_alloc((Class)NSArray) initWithArray:v6];
    }
    if ([(NSMutableArray *)v7 count])
    {
      [(NSMutableArray *)v7 sortUsingComparator:v62];
      id v27 = objc_alloc((Class)v17[373]);
      id v28 = [(NSMutableArray *)v7 count];
      if ((unint64_t)v28 >= 2) {
        uint64_t v29 = 2;
      }
      else {
        uint64_t v29 = (uint64_t)v28;
      }
      self->mTopMediaResults = [v27 initWithArray:[v7 subarrayWithRange:0, v29]];
      [(NSMutableArray *)v7 sortUsingComparator:&stru_4591D0];
      self->mMediaResults = (NSArray *)[objc_alloc((Class)v17[373]) initWithArray:v7];
    }
    if ([v13 count])
    {
      [v13 sortUsingComparator:v62];
      id v30 = objc_alloc((Class)v17[373]);
      id v31 = [v13 count];
      if ((unint64_t)v31 >= 2) {
        uint64_t v32 = 2;
      }
      else {
        uint64_t v32 = (uint64_t)v31;
      }
      self->mTopNotesResults = [v30 initWithArray:[v13 subarrayWithRange:0, v32]];
      [v13 sortUsingComparator:&stru_4591D0];
      self->mNotesResults = (NSArray *)[objc_alloc((Class)v17[373]) initWithArray:v13];
    }
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    mTopTextResults = self->mTopTextResults;
    id v34 = [(NSArray *)mTopTextResults countByEnumeratingWithState:&v54 objects:v73 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v55;
      do
      {
        for (m = 0; m != v34; m = (char *)m + 1)
        {
          if (*(void *)v55 != v35) {
            objc_enumerationMutation(mTopTextResults);
          }
          [(THSearchController *)self resolveTitleForSearchResult:*(void *)(*((void *)&v54 + 1) + 8 * (void)m)];
        }
        id v34 = [(NSArray *)mTopTextResults countByEnumeratingWithState:&v54 objects:v73 count:16];
      }
      while (v34);
    }
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    mTopMediaResults = self->mTopMediaResults;
    id v38 = [(NSArray *)mTopMediaResults countByEnumeratingWithState:&v50 objects:v72 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v51;
      do
      {
        for (n = 0; n != v38; n = (char *)n + 1)
        {
          if (*(void *)v51 != v39) {
            objc_enumerationMutation(mTopMediaResults);
          }
          [(THSearchController *)self resolveTitleForSearchResult:*(void *)(*((void *)&v50 + 1) + 8 * (void)n)];
        }
        id v38 = [(NSArray *)mTopMediaResults countByEnumeratingWithState:&v50 objects:v72 count:16];
      }
      while (v38);
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    mTopNotesResults = self->mTopNotesResults;
    id v42 = [(NSArray *)mTopNotesResults countByEnumeratingWithState:&v46 objects:v71 count:16];
    if (v42)
    {
      uint64_t v43 = *(void *)v47;
      do
      {
        for (ii = 0; ii != v42; ii = (char *)ii + 1)
        {
          if (*(void *)v47 != v43) {
            objc_enumerationMutation(mTopNotesResults);
          }
          [(THSearchController *)self resolveTitleForSearchResult:*(void *)(*((void *)&v46 + 1) + 8 * (void)ii)];
        }
        id v42 = [(NSArray *)mTopNotesResults countByEnumeratingWithState:&v46 objects:v71 count:16];
      }
      while (v42);
    }
    v45[2]();

    self->mOccurrenceMap = 0;
    self->mAnnotationOccurrenceMap = 0;

    self->mReferenceTextMap = 0;
  }
  objc_sync_exit(self);
}

- (BOOL)isEncodedResultForPageNumber:(id)a3
{
  return [a3 rangeOfString:kTHSearchControllerPageNumberToken] == 0;
}

- (id)displayNumberStringFromEncodedPageNumberResult:(id)a3
{
  id v3 = objc_msgSend(objc_msgSend(a3, "substringFromIndex:", objc_msgSend(kTHSearchControllerPageNumberToken, "length")), "componentsSeparatedByString:", @",");

  return [v3 objectAtIndex:0];
}

- (unint64_t)absolutePageIndexFromEncodedPageNumberResult:(id)a3
{
  id v3 = objc_msgSend(objc_msgSend(a3, "substringFromIndex:", objc_msgSend(kTHSearchControllerPageNumberToken, "length")), "componentsSeparatedByString:", @",");
  if ((unint64_t)[v3 count] < 2) {
    id v4 = 0;
  }
  else {
    id v4 = [v3 objectAtIndex:1];
  }
  LODWORD(result) = [v4 intValue];
  if ((result & 0x80000000) != 0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return (int)result;
  }
}

- (unint64_t)absolutePageIndexForPageNumberString:(id)a3
{
  id v4 = [(THSearchController *)self displayPageNumberMap];

  return [(THDisplayPageNumberMap *)v4 absolutePageIndexForDisplayPageNumber:a3];
}

- (void)clearSearchResults
{
  objc_sync_enter(self);
  [(NSOperationQueue *)self->mReferenceIndexLoadQueue cancelAllOperations];

  self->mCurrentQuery = 0;
  self->mSuggestionResults = 0;

  self->mSuggestionOccurenceCounts = 0;
  self->mTextResults = 0;

  self->mTopTextResults = 0;
  self->mMediaResults = 0;

  self->mTopMediaResults = 0;
  self->mNotesResults = 0;

  self->mTopNotesResults = 0;
  self->mOccurrenceMap = 0;

  self->mAnnotationOccurrenceMap = 0;
  self->mIndexLoadQueue = 0;

  self->mReferenceIndexLoadQueue = 0;
  self->mReferenceIndexLoadOperation = 0;

  self->mReferenceTextMap = 0;

  objc_sync_exit(self);
}

- (unint64_t)searchResultCount
{
  NSUInteger v3 = [(NSArray *)[(THSearchController *)self textSearchResults] count];
  id v4 = (char *)[(NSArray *)[(THSearchController *)self mediaSearchResults] count] + v3;
  return [(NSArray *)[(THSearchController *)self notesSearchResults] count] + (void)v4;
}

- (id)anchorForSelectedSearchResult:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v5 = [a3 annotation];
  mDocumentRoot = self->mDocumentRoot;
  if (v5)
  {
    id v7 = v5;
    id v8 = -[THDocumentNavigationModel contentNodeForGUID:](-[THDocumentRoot navigationModel](mDocumentRoot, "navigationModel"), "contentNodeForGUID:", [v5 annotationContentNodeID]);
    id v10 = [a3 contextRangeForResult];
    return +[THAnnotationAnchor annotationAnchorWithContentNode:annotation:noteRange:](THAnnotationAnchor, "annotationAnchorWithContentNode:annotation:noteRange:", v8, v7, v10, v9);
  }
  else
  {
    id v11 = [a3 occurrenceIndex];
    id v12 = [a3 term];
    id v13 = [a3 cfi];
    return [(THDocumentRoot *)mDocumentRoot anchorForNthInstance:v11 ofSearchString:v12 afterCFIString:v13 coarsenIfNeeded:1];
  }
}

- (void)resolveTitleForSearchResult:(id)a3
{
  if (![a3 title])
  {
    id v5 = objc_msgSend(objc_msgSend(-[THDocumentRoot modelStorageAnchorForCfi:shallow:error:](self->mDocumentRoot, "modelStorageAnchorForCfi:shallow:error:", objc_msgSend(a3, "cfi"), 1, 0), "contentNode"), "title");
    [a3 setTitle:v5];
  }
}

- (BOOL)indexLoaded
{
  v2 = [(THDocumentRoot *)self->mDocumentRoot searchIndex];

  return [(THSearchIndex *)v2 loaded];
}

- (void)p_indexloadFinished:(id)a3
{
  objc_sync_enter(self);
  int64_t v4 = self->mCountOfLoadingIndices - 1;
  self->mCountOfLoadingIndices = v4;
  if (v4
    || ([(THSearchIndex *)[(THDocumentRoot *)self->mDocumentRoot searchIndex] finishLoading], [(THSearchIndex *)[(THDocumentRoot *)self->mDocumentRoot annotationSearchIndex] finishLoading], self->mIndexLoadOperation = 0, self->mAnnotationIndexBuildOperation = 0, self->mIndexLoadFailed))
  {
    objc_sync_exit(self);
  }
  else
  {
    [(THAnnotationSearchIndex *)[(THDocumentRoot *)self->mDocumentRoot annotationSearchIndex] setAnnotationStorageController:[(THDocumentRoot *)self->mDocumentRoot annotationController]];
    [(THSearchController *)self performSelectorOnMainThread:"p_setupDisplayPageNumberMap" withObject:0 waitUntilDone:0];
    BOOL mIndexLoadFailed = self->mIndexLoadFailed;
    objc_sync_exit(self);
    if (!mIndexLoadFailed)
    {
      id v6 = +[NSNotificationCenter defaultCenter];
      id v7 = THSearchControllerDidLoadIndexNotification;
      [(NSNotificationCenter *)v6 postNotificationName:v7 object:self];
    }
  }
}

- (void)loadIndex
{
  objc_sync_enter(self);
  if (self->mIndexLoadOperation
    || [(THSearchIndex *)[(THDocumentRoot *)self->mDocumentRoot searchIndex] loaded])
  {
    int v3 = 0;
  }
  else
  {
    id v7 = [[THSearchIndexLoadOperation alloc] initWithDelegate:self documentRoot:self->mDocumentRoot];
    self->mIndexLoadOperation = &v7->super;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_D28DC;
    v9[3] = &unk_456DE0;
    v9[4] = self;
    [(THSearchIndexLoadOperation *)v7 setCompletionBlock:v9];
    ++self->mCountOfLoadingIndices;
    int v3 = 1;
  }
  if (self->mAnnotationIndexBuildOperation || ![(THSearchController *)self searchNotes])
  {
    if (!v3) {
      goto LABEL_13;
    }
    int v5 = 0;
  }
  else
  {
    int64_t v4 = [[THAnnotationSearchIndexBuildOperation alloc] initWithDelegate:self documentRoot:self->mDocumentRoot];
    self->mAnnotationIndexBuildOperation = &v4->super;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_D28E8;
    v8[3] = &unk_456DE0;
    v8[4] = self;
    [(THAnnotationSearchIndexBuildOperation *)v4 setCompletionBlock:v8];
    ++self->mCountOfLoadingIndices;
    int v5 = 1;
  }
  self->BOOL mIndexLoadFailed = 0;
  id v6 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
  self->mIndexLoadQueue = v6;
  [(NSOperationQueue *)v6 setName:@"Search Index Load"];
  if (v3)
  {
    [(NSOperationQueue *)self->mIndexLoadQueue addOperation:self->mIndexLoadOperation];
  }
  if (v5)
  {
    [(NSOperationQueue *)self->mIndexLoadQueue addOperation:self->mAnnotationIndexBuildOperation];
  }
LABEL_13:
  objc_sync_exit(self);
}

- (void)cancelLoadIndex
{
  objc_sync_enter(self);
  [(NSOperation *)self->mIndexLoadOperation cancel];
  [(NSOperationQueue *)self->mIndexLoadQueue cancelAllOperations];

  objc_sync_exit(self);
}

- (void)unloadIndex
{
  objc_sync_enter(self);
  [(NSOperation *)self->mIndexLoadOperation cancel];
  [(NSOperationQueue *)self->mIndexLoadQueue cancelAllOperations];
  [(THSearchIndex *)[(THDocumentRoot *)self->mDocumentRoot searchIndex] unload];
  [(THSearchIndex *)[(THDocumentRoot *)self->mDocumentRoot annotationSearchIndex] unload];
  self->mUnloadRequested = 0;
  if (TSUPadIsFirstGen()) {
    self->mUnloadRequested = 1;
  }

  objc_sync_exit(self);
}

- (void)documentWillDealloc
{
  self->mDocumentRoot = 0;
}

- (void)searchIndexLoadOperationFailed:(id)a3
{
  objc_sync_enter(self);
  self->BOOL mIndexLoadFailed = 1;

  objc_sync_exit(self);
}

- (void)annotationSearchIndexBuildOperationFailed:(id)a3
{
  objc_sync_enter(self);
  self->BOOL mIndexLoadFailed = 1;

  objc_sync_exit(self);
}

- (id)displayPageNumberForAbsolutePageIndex:(unint64_t)a3
{
  return [(THDisplayPageNumberMap *)self->mDisplayPageNumberMap displayPageNumberForAbsolutePageIndex:a3];
}

- (id)summaryForGlossaryTerm:(id)a3
{
  id result = [(THModelGlossary *)[(THDocumentRoot *)self->mDocumentRoot glossary] entryForTerm:a3];
  if (result)
  {
    return [result summaryText];
  }
  return result;
}

- (int64_t)recentSearchCount
{
  v2 = [(THSearchController *)self recentSearches];

  return [(NSArray *)v2 count];
}

- (id)p_recentSearchAtIndex:(int64_t)a3
{
  int64_t v4 = [(THSearchController *)self recentSearches];
  if ((uint64_t)[(NSArray *)v4 count] <= a3) {
    return 0;
  }
  objc_opt_class();
  [(NSArray *)v4 objectAtIndex:a3];

  return (id)TSUDynamicCast();
}

- (id)recentSearchQueryAtIndex:(int64_t)a3
{
  id v3 = [(THSearchController *)self p_recentSearchAtIndex:a3];
  objc_opt_class();
  [v3 objectForKey:@"query"];

  return (id)TSUDynamicCast();
}

- (int64_t)recentSearchCountAtIndex:(int64_t)a3
{
  id v3 = [(THSearchController *)self p_recentSearchAtIndex:a3];
  objc_opt_class();
  [v3 objectForKey:@"result count"];
  int64_t v4 = (void *)TSUDynamicCast();

  return (int64_t)[v4 integerValue];
}

- (id)p_allSearchResults
{
  id v3 = +[NSMutableArray array];
  if ([(NSArray *)[(THSearchController *)self textSearchResults] count]) {
    [v3 addObjectsFromArray:[self textSearchResults]];
  }
  if ([(NSArray *)[(THSearchController *)self mediaSearchResults] count]) {
    [v3 addObjectsFromArray:[self mediaSearchResults]];
  }
  if ([(NSArray *)[(THSearchController *)self notesSearchResults] count]) {
    [v3 addObjectsFromArray:[self notesSearchResults]];
  }
  return v3;
}

- (void)p_populatePageNumbersOfModelSearchResults:(id)a3
{
  id v3 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  int v5 = (char *)[a3 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    CFStringRef v8 = @"-";
    CFStringRef v9 = &stru_46D7E8;
    id v22 = self;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v3);
        }
        id v11 = [(id)THBundle() localizedStringForKey:v8 value:v9 table:0];
        objc_opt_class();
        id v12 = (void *)TSUDynamicCast();
        if ([(THSearchController *)self paginationResultsValid])
        {
          if (objc_msgSend(objc_msgSend(v12, "cfi"), "length"))
          {
            unint64_t v13 = -[THDocumentRoot absolutePageIndexForCFI:](self->mDocumentRoot, "absolutePageIndexForCFI:", [v12 cfi]);
            if (v13 != 0x7FFFFFFFFFFFFFFFLL)
            {
              unint64_t v14 = v13;
              id v15 = [(THDisplayPageNumberMap *)[(THSearchController *)self displayPageNumberMap] displayPageNumberForAbsolutePageIndex:v13];
              id v16 = v6;
              uint64_t v17 = v7;
              CFStringRef v18 = v9;
              CFStringRef v19 = v8;
              id v20 = v3;
              id v21 = v15;
              if ([v15 length]) {
                id v11 = v21;
              }
              id v3 = v20;
              CFStringRef v8 = v19;
              CFStringRef v9 = v18;
              uint64_t v7 = v17;
              id v6 = v16;
              self = v22;
              [v12 setPageNumber:v14];
            }
          }
        }
        [v12 setDisplayPageNumber:v11];
      }
      id v6 = (char *)[v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }
}

- (NSArray)recentSearches
{
  return &self->mRecentSearches->super;
}

- (void)setRecentSearches:(id)a3
{
}

- (NSString)currentQuery
{
  return self->mCurrentQuery;
}

- (NSArray)suggestionResults
{
  return self->mSuggestionResults;
}

- (NSArray)suggestionOccurenceCounts
{
  return self->mSuggestionOccurenceCounts;
}

- (NSArray)textSearchResults
{
  return self->mTextResults;
}

- (NSArray)topTextSearchResults
{
  return self->mTopTextResults;
}

- (NSArray)mediaSearchResults
{
  return self->mMediaResults;
}

- (NSArray)topMediaSearchResults
{
  return self->mTopMediaResults;
}

- (NSArray)notesSearchResults
{
  return self->mNotesResults;
}

- (NSArray)topNotesSearchResults
{
  return self->mTopNotesResults;
}

- (BOOL)unloadRequested
{
  return self->mUnloadRequested;
}

- (void)setUnloadRequested:(BOOL)a3
{
  self->mUnloadRequested = a3;
}

- (THDisplayPageNumberMap)displayPageNumberMap
{
  return self->mDisplayPageNumberMap;
}

- (void)setDisplayPageNumberMap:(id)a3
{
}

- (BOOL)searchNotes
{
  return self->mSearchNotes;
}

- (void)setSearchNotes:(BOOL)a3
{
  self->mSearchNotes = a3;
}

- (NSString)recentSearchResultsAutosaveName
{
  return self->_recentSearchResultsAutosaveName;
}

- (void)setRecentSearchResultsAutosaveName:(id)a3
{
}

- (BOOL)paginationResultsValid
{
  return self->_paginationResultsValid;
}

- (void)setPaginationResultsValid:(BOOL)a3
{
  self->_paginationResultsValid = a3;
}

@end