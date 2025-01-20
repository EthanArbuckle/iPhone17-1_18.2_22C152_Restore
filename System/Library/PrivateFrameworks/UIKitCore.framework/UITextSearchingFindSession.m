@interface UITextSearchingFindSession
- (BOOL)_hasResults;
- (BOOL)_isCurrentSearchQueryValid;
- (BOOL)allowsReplacementForCurrentlyHighlightedResult;
- (BOOL)isSearching;
- (BOOL)supportsReplacement;
- (UITextSearching)stronglyHeldSearchableObject;
- (UITextSearchingFindSession)initWithSearchableObject:(id)searchableObject;
- (UITextSearchingFindSession)initWithStronglyHeldSearchableObject:(id)a3;
- (id)_allFoundRanges;
- (id)_documentComparator;
- (id)_nearestRangeToSelectedRangeInDocument:(id)a3;
- (id)_nextItemInOrderedSet:(id)a3 usingComparator:(id)a4 fromItem:(id)a5 inDirection:(int64_t)a6 loopAround:(BOOL)a7;
- (id)_textRangeComparatorForDocument:(id)a3;
- (id)parentInteraction;
- (id)searchableObject;
- (int64_t)highlightedResultIndex;
- (int64_t)resultCount;
- (void)_finishedSearching;
- (void)_foundRange:(id)a3 forSearchString:(id)a4 inDocument:(id)a5;
- (void)_invalidateAllFoundRanges;
- (void)_invalidateFoundRange:(id)a3 inDocument:(id)a4;
- (void)_nextResultRelativeToRange:(id *)a3 document:(id *)a4 inDirection:(int64_t)a5;
- (void)_performBlockWhenSearchResultsAreAvailable:(id)a3;
- (void)_performDelayedSearchOperations;
- (void)_readilyHighlightNearestRangeToSelectedRangeIfNecessary;
- (void)_readilyHighlightNextResultInDirection:(int64_t)a3;
- (void)_replaceHighlightedTextRangeWithReplacementString:(id)a3;
- (void)_setHighlightedRange:(id)a3 inDocument:(id)a4;
- (void)_setNeedsResultCountUpdate;
- (void)_setReadyToPerformDelayedSearchOperations;
- (void)_updateResultCountLabel;
- (void)_updateSearchableObjectProtocolConformance;
- (void)highlightNearestFoundRangeToSelectedRangeIfNecessary;
- (void)highlightNextResultInDirection:(int64_t)a3;
- (void)performSearchWithQuery:(id)a3 options:(id)a4;
- (void)performSingleReplacementWithSearchQuery:(id)a3 replacementString:(id)a4 options:(id)a5;
- (void)replaceAllInstancesOfSearchQuery:(id)a3 withReplacementString:(id)a4 options:(id)a5;
- (void)reset;
- (void)setParentInteraction:(id)a3;
- (void)setSearchableObject:(id)a3;
- (void)setStronglyHeldSearchableObject:(id)a3;
@end

@implementation UITextSearchingFindSession

- (UITextSearchingFindSession)initWithSearchableObject:(id)searchableObject
{
  id v4 = searchableObject;
  v10.receiver = self;
  v10.super_class = (Class)UITextSearchingFindSession;
  v5 = [(UITextSearchingFindSession *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_searchableObject, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    blocksAwaitingSearchResults = v6->_blocksAwaitingSearchResults;
    v6->_blocksAwaitingSearchResults = v7;

    [(UITextSearchingFindSession *)v6 _updateSearchableObjectProtocolConformance];
  }

  return v6;
}

- (UITextSearchingFindSession)initWithStronglyHeldSearchableObject:(id)a3
{
  id v5 = a3;
  v6 = [(UITextSearchingFindSession *)self initWithSearchableObject:v5];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_stronglyHeldSearchableObject, a3);
  }

  return v7;
}

- (BOOL)supportsReplacement
{
  if ((*(_WORD *)&self->_searchableObjectConformsTo & 1) == 0) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchableObject);
  char v4 = [WeakRetained supportsTextReplacement];

  return v4;
}

- (BOOL)allowsReplacementForCurrentlyHighlightedResult
{
  BOOL v3 = [(UITextSearchingFindSession *)self supportsReplacement];
  if (v3)
  {
    if (self->_highlightedTextRange)
    {
      if ((*(_WORD *)&self->_searchableObjectConformsTo & 2) != 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_searchableObject);
        char v5 = [WeakRetained shouldReplaceFoundTextInRange:self->_highlightedTextRange inDocument:self->_highlightedDocument withText:&stru_1ED0E84C0];

        LOBYTE(v3) = v5;
      }
      else
      {
        LOBYTE(v3) = 1;
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)_isCurrentSearchQueryValid
{
  BOOL v3 = [(UITextSearchingFindSession *)self _hasResults];
  if (v3)
  {
    char v4 = [(UIFindSession *)self searchText];
    char v5 = [v4 isEqualToString:self->_lastSearchQuery];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)_nextResultRelativeToRange:(id *)a3 document:(id *)a4 inDirection:(int64_t)a5
{
  BOOL v9 = (unint64_t)[(NSMutableOrderedSet *)self->_sortedDocumentIdentifiers count] < 2;
  objc_super v10 = [(NSMutableDictionary *)self->_sortedResultsByDocument objectForKey:*a4];
  v11 = [(UITextSearchingFindSession *)self _textRangeComparatorForDocument:*a4];
  v12 = [(UITextSearchingFindSession *)self _nextItemInOrderedSet:v10 usingComparator:v11 fromItem:*a3 inDirection:a5 loopAround:v9];

  if (!v12)
  {
    sortedDocumentIdentifiers = self->_sortedDocumentIdentifiers;
    v14 = [(UITextSearchingFindSession *)self _documentComparator];
    v15 = [(UITextSearchingFindSession *)self _nextItemInOrderedSet:sortedDocumentIdentifiers usingComparator:v14 fromItem:*a4 inDirection:a5 loopAround:1];

    if (v15)
    {
      objc_storeStrong(a4, v15);
      v16 = [(NSMutableDictionary *)self->_sortedResultsByDocument objectForKey:v15];
      v17 = v16;
      if (a5) {
        [v16 lastObject];
      }
      else {
      v12 = [v16 firstObject];
      }
    }
    else
    {
      v12 = 0;
    }
  }
  id v18 = *a3;
  *a3 = v12;
}

- (void)_readilyHighlightNextResultInDirection:(int64_t)a3
{
  if (!self->_awaitingFirstResults
    && ![(UITextSearchingFindSession *)self _isCurrentSearchQueryValid])
  {
    char v5 = [(UIFindSession *)self searchText];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      [(UITextSearchingFindSession *)self _setHighlightedRange:0 inDocument:0];
      lastSearchOptions = self->_lastSearchOptions;
      if (lastSearchOptions)
      {
        v8 = lastSearchOptions;
      }
      else
      {
        v8 = +[UITextSearchOptions defaultSearchOptions];
      }
      BOOL v9 = v8;
      objc_super v10 = [(UIFindSession *)self searchText];
      [(UITextSearchingFindSession *)self performSearchWithQuery:v10 options:v9];
    }
  }
  highlightedTextRange = self->_highlightedTextRange;
  if (highlightedTextRange)
  {
    v13 = highlightedTextRange;
    v12 = self->_highlightedDocument;
    [(UITextSearchingFindSession *)self _nextResultRelativeToRange:&v13 document:&v12 inDirection:a3];
    [(UITextSearchingFindSession *)self _setHighlightedRange:v13 inDocument:v12];
  }
  else
  {
    [(UITextSearchingFindSession *)self highlightNearestFoundRangeToSelectedRangeIfNecessary];
  }
}

- (void)highlightNextResultInDirection:(int64_t)a3
{
  if ([(UITextSearchingFindSession *)self _hasResults] || !self->_isSearching)
  {
    [(UITextSearchingFindSession *)self _readilyHighlightNextResultInDirection:a3];
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __61__UITextSearchingFindSession_highlightNextResultInDirection___block_invoke;
    v5[3] = &unk_1E52D9CD0;
    v5[4] = self;
    v5[5] = a3;
    [(UITextSearchingFindSession *)self _performBlockWhenSearchResultsAreAvailable:v5];
  }
}

void __61__UITextSearchingFindSession_highlightNextResultInDirection___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  BOOL v3 = (void *)v2[19];
  if (v3)
  {
    id v10 = v3;
    id v9 = *(id *)(*(void *)(a1 + 32) + 160);
    [*(id *)(a1 + 32) _nextResultRelativeToRange:&v10 document:&v9 inDirection:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _setHighlightedRange:v10 inDocument:v9];
    uint64_t v4 = *(void *)(a1 + 32);
    char v5 = *(void **)(v4 + 152);
    *(void *)(v4 + 152) = 0;

    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 160);
    *(void *)(v6 + 160) = 0;
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    [v2 _readilyHighlightNextResultInDirection:v8];
  }
}

- (int64_t)highlightedResultIndex
{
  BOOL v3 = [(UITextSearchingFindSession *)self _allFoundRanges];
  int64_t v4 = [v3 indexOfObject:self->_highlightedTextRange];

  return v4;
}

- (void)performSearchWithQuery:(id)a3 options:(id)a4
{
  uint64_t v6 = (NSString *)a3;
  v7 = (UITextSearchOptions *)a4;
  self->_isSearching = 1;
  [(UITextSearchingFindSession *)self reset];
  if (!v7)
  {
    v7 = +[UITextSearchOptions defaultSearchOptions];
  }
  lastSearchQuery = self->_lastSearchQuery;
  self->_lastSearchQuery = v6;
  id v9 = v6;

  lastSearchOptions = self->_lastSearchOptions;
  self->_lastSearchOptions = v7;
  v11 = v7;

  self->_awaitingFirstResults = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentInteraction);
  [WeakRetained updateResultCount];

  [(_UITextSearchingFindSessionAggregator *)self->_aggregator setValid:0];
  v13 = [[_UITextSearchingFindSessionAggregator alloc] initWithSession:self];
  aggregator = self->_aggregator;
  self->_aggregator = v13;

  id v15 = objc_loadWeakRetained((id *)&self->_searchableObject);
  [v15 performTextSearchWithQueryString:v9 usingOptions:v11 resultAggregator:self->_aggregator];
}

- (void)_replaceHighlightedTextRangeWithReplacementString:(id)a3
{
  id v15 = a3;
  highlightedTextRange = self->_highlightedTextRange;
  if (highlightedTextRange
    || ([(UITextSearchingFindSession *)self _readilyHighlightNearestRangeToSelectedRangeIfNecessary], (highlightedTextRange = self->_highlightedTextRange) != 0))
  {
    char v5 = highlightedTextRange;
    uint64_t v6 = self->_highlightedDocument;
    p_searchableObject = &self->_searchableObject;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_searchableObject);
    [WeakRetained replaceFoundTextInRange:v5 inDocument:v6 withText:v15];

    uint64_t v9 = [v15 length];
    if (v9 == [(NSString *)self->_lastSearchQuery length])
    {
      if (([v15 isEqualToString:self->_lastSearchQuery] & 1) == 0)
      {
        id v10 = objc_loadWeakRetained((id *)p_searchableObject);
        [v10 decorateFoundTextRange:v5 inDocument:v6 usingStyle:0];

        if (v6) {
          v11 = (__CFString *)v6;
        }
        else {
          v11 = @"__singleton__";
        }
        v12 = [(NSMutableDictionary *)self->_sortedResultsByDocument objectForKey:v11];
        [v12 removeObject:v5];

        [(UITextSearchingFindSession *)self _updateResultCountLabel];
      }
    }
    else
    {
      if (self->_highlightedTextRange)
      {
        id v13 = objc_loadWeakRetained((id *)p_searchableObject);
        v14 = [v13 selectedTextRange];

        if (!v14)
        {
          objc_storeStrong((id *)&self->_highlightedRangeBeforeSubsequentSearch, self->_highlightedTextRange);
          objc_storeStrong((id *)&self->_highlightedDocumentBeforeSubsequentSearch, self->_highlightedDocument);
        }
      }
      [(UITextSearchingFindSession *)self performSearchWithQuery:self->_lastSearchQuery options:self->_lastSearchOptions];
    }
  }
}

- (void)performSingleReplacementWithSearchQuery:(id)a3 replacementString:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(UITextSearchingFindSession *)self supportsReplacement])
  {
    [(UIFindSession *)self setSearchText:v8];
    [(UIFindSession *)self setReplacementText:v9];
    if ([(UITextSearchingFindSession *)self _hasResults]
      && [v8 isEqualToString:self->_lastSearchQuery])
    {
      [(UITextSearchingFindSession *)self _replaceHighlightedTextRangeWithReplacementString:v9];
    }
    else
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __96__UITextSearchingFindSession_performSingleReplacementWithSearchQuery_replacementString_options___block_invoke;
      v12[3] = &unk_1E52DCB30;
      id v11 = v8;
      id v13 = v11;
      v14 = self;
      id v15 = v9;
      [(UITextSearchingFindSession *)self _performBlockWhenSearchResultsAreAvailable:v12];
      [(UITextSearchingFindSession *)self performSearchWithQuery:v11 options:v10];
      [(UITextSearchingFindSession *)self highlightNearestFoundRangeToSelectedRangeIfNecessary];
    }
  }
}

uint64_t __96__UITextSearchingFindSession_performSingleReplacementWithSearchQuery_replacementString_options___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isEqualToString:*(void *)(*(void *)(a1 + 40) + 128)];
  if (result)
  {
    BOOL v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    return [v3 _replaceHighlightedTextRangeWithReplacementString:v4];
  }
  return result;
}

- (void)replaceAllInstancesOfSearchQuery:(id)a3 withReplacementString:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(UITextSearchingFindSession *)self supportsReplacement])
  {
    [(UIFindSession *)self setSearchText:v8];
    [(UIFindSession *)self setReplacementText:v9];
    if ((*(_WORD *)&self->_searchableObjectConformsTo & 8) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_searchableObject);
      [WeakRetained replaceAllOccurrencesOfQueryString:v8 usingOptions:v10 withText:v9];

      [(UITextSearchingFindSession *)self performSearchWithQuery:v9 options:self->_lastSearchOptions];
    }
    else
    {
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      id v15 = __93__UITextSearchingFindSession_replaceAllInstancesOfSearchQuery_withReplacementString_options___block_invoke;
      v16 = &unk_1E52D9F98;
      v17 = self;
      id v18 = v9;
      id v11 = (void (**)(void))_Block_copy(&v13);
      if (objc_msgSend(v8, "isEqualToString:", self->_lastSearchQuery, v13, v14, v15, v16, v17)
        && [(UITextSearchingFindSession *)self _hasResults])
      {
        v11[2](v11);
      }
      else
      {
        [(UITextSearchingFindSession *)self _performBlockWhenSearchResultsAreAvailable:v11];
        [(UITextSearchingFindSession *)self performSearchWithQuery:v8 options:v10];
      }
    }
  }
}

void __93__UITextSearchingFindSession_replaceAllInstancesOfSearchQuery_withReplacementString_options___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 112);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  uint64_t v6 = __93__UITextSearchingFindSession_replaceAllInstancesOfSearchQuery_withReplacementString_options___block_invoke_2;
  v7 = &unk_1E53085E8;
  uint64_t v8 = v2;
  id v9 = *(id *)(a1 + 40);
  [v3 enumerateKeysAndObjectsUsingBlock:&v4];
  objc_msgSend(*(id *)(a1 + 32), "performSearchWithQuery:options:", *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 136), v4, v5, v6, v7, v8);
}

void __93__UITextSearchingFindSession_replaceAllInstancesOfSearchQuery_withReplacementString_options___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = objc_msgSend(a3, "reverseObjectEnumerator", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 184));
        [WeakRetained replaceFoundTextInRange:v11 inDocument:v5 withText:*(void *)(a1 + 40)];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (int64_t)resultCount
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = [(NSMutableDictionary *)self->_sortedResultsByDocument allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) count];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (BOOL)_hasResults
{
  return [(UITextSearchingFindSession *)self resultCount] > 0;
}

- (void)reset
{
  [(NSMutableDictionary *)self->_sortedResultsByDocument removeAllObjects];
  [(NSMutableOrderedSet *)self->_sortedDocumentIdentifiers removeAllObjects];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchableObject);
  [WeakRetained clearAllDecoratedFoundText];

  self->_awaitingFirstResults = 0;
  highlightedTextRange = self->_highlightedTextRange;
  self->_highlightedTextRange = 0;

  highlightedDocument = self->_highlightedDocument;
  self->_highlightedDocument = 0;

  lastSearchOptions = self->_lastSearchOptions;
  self->_lastSearchOptions = 0;

  lastSearchQuery = self->_lastSearchQuery;
  self->_lastSearchQuery = 0;

  id v8 = objc_loadWeakRetained((id *)&self->_parentInteraction);
  [v8 updateResultCount];
}

- (void)_updateSearchableObjectProtocolConformance
{
  p_searchableObject = &self->_searchableObject;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchableObject);
  *(_WORD *)&self->_searchableObjectConformsTo = *(_WORD *)&self->_searchableObjectConformsTo & 0xFFFE | objc_opt_respondsToSelector() & 1;

  id v5 = objc_loadWeakRetained((id *)p_searchableObject);
  if (objc_opt_respondsToSelector()) {
    __int16 v6 = 2;
  }
  else {
    __int16 v6 = 0;
  }
  *(_WORD *)&self->_searchableObjectConformsTo = *(_WORD *)&self->_searchableObjectConformsTo & 0xFFFD | v6;

  id v7 = objc_loadWeakRetained((id *)p_searchableObject);
  if (objc_opt_respondsToSelector()) {
    __int16 v8 = 4;
  }
  else {
    __int16 v8 = 0;
  }
  *(_WORD *)&self->_searchableObjectConformsTo = *(_WORD *)&self->_searchableObjectConformsTo & 0xFFFB | v8;

  id v9 = objc_loadWeakRetained((id *)p_searchableObject);
  if (objc_opt_respondsToSelector()) {
    __int16 v10 = 8;
  }
  else {
    __int16 v10 = 0;
  }
  *(_WORD *)&self->_searchableObjectConformsTo = *(_WORD *)&self->_searchableObjectConformsTo & 0xFFF7 | v10;

  id v11 = objc_loadWeakRetained((id *)p_searchableObject);
  if (objc_opt_respondsToSelector()) {
    __int16 v12 = 16;
  }
  else {
    __int16 v12 = 0;
  }
  *(_WORD *)&self->_searchableObjectConformsTo = *(_WORD *)&self->_searchableObjectConformsTo & 0xFFEF | v12;

  id v13 = objc_loadWeakRetained((id *)p_searchableObject);
  if (objc_opt_respondsToSelector()) {
    __int16 v14 = 32;
  }
  else {
    __int16 v14 = 0;
  }
  *(_WORD *)&self->_searchableObjectConformsTo = *(_WORD *)&self->_searchableObjectConformsTo & 0xFFDF | v14;

  id v15 = objc_loadWeakRetained((id *)p_searchableObject);
  if (objc_opt_respondsToSelector()) {
    __int16 v16 = 64;
  }
  else {
    __int16 v16 = 0;
  }
  *(_WORD *)&self->_searchableObjectConformsTo = *(_WORD *)&self->_searchableObjectConformsTo & 0xFFBF | v16;

  id v17 = objc_loadWeakRetained((id *)p_searchableObject);
  if (objc_opt_respondsToSelector()) {
    __int16 v18 = 128;
  }
  else {
    __int16 v18 = 0;
  }
  *(_WORD *)&self->_searchableObjectConformsTo = *(_WORD *)&self->_searchableObjectConformsTo & 0xFF7F | v18;

  id v19 = objc_loadWeakRetained((id *)p_searchableObject);
  if (objc_opt_respondsToSelector()) {
    __int16 v20 = 256;
  }
  else {
    __int16 v20 = 0;
  }
  *(_WORD *)&self->_searchableObjectConformsTo = *(_WORD *)&self->_searchableObjectConformsTo & 0xFEFF | v20;

  id v21 = objc_loadWeakRetained((id *)p_searchableObject);
  if (objc_opt_respondsToSelector()) {
    __int16 v22 = 512;
  }
  else {
    __int16 v22 = 0;
  }
  *(_WORD *)&self->_searchableObjectConformsTo = *(_WORD *)&self->_searchableObjectConformsTo & 0xFDFF | v22;

  id v23 = objc_loadWeakRetained((id *)p_searchableObject);
  if (objc_opt_respondsToSelector()) {
    __int16 v24 = 1024;
  }
  else {
    __int16 v24 = 0;
  }
  *(_WORD *)&self->_searchableObjectConformsTo = *(_WORD *)&self->_searchableObjectConformsTo & 0xFBFF | v24;

  id v25 = objc_loadWeakRetained((id *)p_searchableObject);
  if (objc_opt_respondsToSelector()) {
    __int16 v26 = 4096;
  }
  else {
    __int16 v26 = 0;
  }
  *(_WORD *)&self->_searchableObjectConformsTo = *(_WORD *)&self->_searchableObjectConformsTo & 0xEFFF | v26;

  id v28 = objc_loadWeakRetained((id *)p_searchableObject);
  if (objc_opt_respondsToSelector()) {
    __int16 v27 = 2048;
  }
  else {
    __int16 v27 = 0;
  }
  *(_WORD *)&self->_searchableObjectConformsTo = *(_WORD *)&self->_searchableObjectConformsTo & 0xF7FF | v27;
}

- (id)_nextItemInOrderedSet:(id)a3 usingComparator:(id)a4 fromItem:(id)a5 inDirection:(int64_t)a6 loopAround:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = [v11 indexOfObject:v13];
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!v13)
    {
      if (a6) {
        [v11 lastObject];
      }
      else {
      uint64_t v19 = [v11 firstObject];
      }
      goto LABEL_29;
    }
    uint64_t v15 = objc_msgSend(v11, "indexOfObject:inSortedRange:options:usingComparator:", v13, 0, objc_msgSend(v11, "count"), 1024, v12)- (a6 == 1);
  }
  else if (a6)
  {
    uint64_t v15 = v14 - 1;
  }
  else
  {
    uint64_t v15 = v14 + 1;
  }
  unint64_t v16 = [v11 count];
  if (!v16) {
    goto LABEL_26;
  }
  BOOL v17 = v15 < 0 || v15 >= v16;
  int v18 = !v17;
  if (!v17 || !v7)
  {
    if (!v18) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (v15 < 0)
  {
    uint64_t v15 = v16 - 1;
LABEL_25:
    if (v15 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_27;
    }
LABEL_26:
    __int16 v20 = 0;
    goto LABEL_30;
  }
  uint64_t v15 = 0;
LABEL_27:
  uint64_t v19 = [v11 objectAtIndex:v15];
LABEL_29:
  __int16 v20 = (void *)v19;
LABEL_30:

  return v20;
}

- (id)_nearestRangeToSelectedRangeInDocument:(id)a3
{
  id v4 = a3;
  p_searchableObject = &self->_searchableObject;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchableObject);
  BOOL v7 = [WeakRetained selectedTextRange];

  __int16 v8 = [(NSMutableDictionary *)self->_sortedResultsByDocument objectForKey:v4];
  id v9 = v8;
  if (!v7) {
    goto LABEL_14;
  }
  uint64_t v10 = [v8 count];
  id v11 = [(UITextSearchingFindSession *)self _textRangeComparatorForDocument:v4];
  unint64_t v12 = objc_msgSend(v9, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, v10, 1024, v11);

  if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_14;
  }
  uint64_t v13 = [v9 count];
  if (v12 >= v13 - 1) {
    unint64_t v14 = v13 - 1;
  }
  else {
    unint64_t v14 = v12;
  }
  uint64_t v15 = [v9 objectAtIndex:v14];
  if ([v15 isEqual:v7] && v12 < objc_msgSend(v9, "count") - 1)
  {
    uint64_t v16 = [v9 objectAtIndex:v12 + 1];

    uint64_t v15 = (void *)v16;
  }
  id v17 = objc_loadWeakRetained((id *)p_searchableObject);
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    id v19 = objc_loadWeakRetained((id *)p_searchableObject);
    __int16 v20 = [v19 endOfDocument];

    id v21 = [v7 start];
    int v22 = [v21 isEqual:v20];

    if (v22)
    {
      uint64_t v23 = [v9 firstObject];

      uint64_t v15 = (void *)v23;
    }
  }
  if (!v15)
  {
LABEL_14:
    uint64_t v15 = [v9 firstObject];
  }

  return v15;
}

- (void)_readilyHighlightNearestRangeToSelectedRangeIfNecessary
{
  if (!self->_highlightedTextRange)
  {
    uint64_t v3 = self->_highlightedDocument;
    if (!v3)
    {
      if ((*(_WORD *)&self->_searchableObjectConformsTo & 0x400) == 0
        || (id WeakRetained = objc_loadWeakRetained((id *)&self->_searchableObject),
            [WeakRetained selectedTextSearchDocument],
            BOOL v7 = objc_claimAutoreleasedReturnValue(),
            WeakRetained,
            (uint64_t v3 = v7) == 0))
      {
        uint64_t v5 = [(NSMutableOrderedSet *)self->_sortedDocumentIdentifiers firstObject];
        if (v5) {
          uint64_t v3 = v5;
        }
        else {
          uint64_t v3 = @"__singleton__";
        }
      }
    }
    __int16 v8 = v3;
    __int16 v6 = [(UITextSearchingFindSession *)self _nearestRangeToSelectedRangeInDocument:v3];
    [(UITextSearchingFindSession *)self _setHighlightedRange:v6 inDocument:v8];
  }
}

- (void)highlightNearestFoundRangeToSelectedRangeIfNecessary
{
  if ([(UITextSearchingFindSession *)self _hasResults])
  {
    [(UITextSearchingFindSession *)self _readilyHighlightNearestRangeToSelectedRangeIfNecessary];
  }
  else
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __82__UITextSearchingFindSession_highlightNearestFoundRangeToSelectedRangeIfNecessary__block_invoke;
    v3[3] = &unk_1E52D9F70;
    v3[4] = self;
    [(UITextSearchingFindSession *)self _performBlockWhenSearchResultsAreAvailable:v3];
  }
}

uint64_t __82__UITextSearchingFindSession_highlightNearestFoundRangeToSelectedRangeIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _readilyHighlightNearestRangeToSelectedRangeIfNecessary];
}

- (void)_updateResultCountLabel
{
  self->_needsResultCountUpdate = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentInteraction);
  [WeakRetained updateResultCount];
}

- (void)_setNeedsResultCountUpdate
{
  if (!self->_needsResultCountUpdate)
  {
    self->_needsResultCountUpdate = 1;
    [(UITextSearchingFindSession *)self performSelector:sel__updateResultCountLabel withObject:0 afterDelay:0.0];
  }
}

- (void)_setHighlightedRange:(id)a3 inDocument:(id)a4
{
  id v16 = a3;
  id v7 = a4;
  if ((*(_WORD *)&self->_searchableObjectConformsTo & 0x10) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_searchableObject);
    [WeakRetained willHighlightFoundTextRange:v16 inDocument:v7];
  }
  p_highlightedTextRange = &self->_highlightedTextRange;
  if (self->_highlightedTextRange)
  {
    uint64_t v10 = [(NSMutableDictionary *)self->_sortedResultsByDocument objectForKey:self->_highlightedDocument];
    int v11 = [v10 containsObject:*p_highlightedTextRange];

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_searchableObject);
      [v12 decorateFoundTextRange:*p_highlightedTextRange inDocument:self->_highlightedDocument usingStyle:1];
    }
  }
  objc_storeStrong((id *)&self->_highlightedTextRange, a3);
  objc_storeStrong((id *)&self->_highlightedDocument, a4);
  if (v16)
  {
    id v13 = objc_loadWeakRetained((id *)&self->_searchableObject);
    [v13 decorateFoundTextRange:v16 inDocument:v7 usingStyle:2];

    if ((*(_WORD *)&self->_searchableObjectConformsTo & 0x20) != 0)
    {
      id v14 = objc_loadWeakRetained((id *)&self->_searchableObject);
      [v14 scrollRangeToVisible:v16 inDocument:v7];
    }
    uint64_t v15 = [(UITextSearchingFindSession *)self parentInteraction];
    [v15 updateResultCount];
  }
}

- (id)_documentComparator
{
  objc_copyWeak(&to, (id *)&self->_searchableObject);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__UITextSearchingFindSession__documentComparator__block_invoke;
  v4[3] = &unk_1E5308610;
  objc_copyWeak(&v5, &to);
  uint64_t v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&to);
  return v2;
}

uint64_t __49__UITextSearchingFindSession__documentComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v8 = [WeakRetained compareOrderFromDocument:v6 toDocument:v5];

  return v8;
}

- (id)_textRangeComparatorForDocument:(id)a3
{
  id v4 = a3;
  objc_copyWeak(&to, (id *)&self->_searchableObject);
  if ((*(_WORD *)&self->_searchableObjectConformsTo & 0x1000) != 0)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__UITextSearchingFindSession__textRangeComparatorForDocument___block_invoke;
    v12[3] = &unk_1E5308638;
    void v12[4] = self;
    id v13 = v4;
    id v7 = v4;
    id v6 = _Block_copy(v12);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__UITextSearchingFindSession__textRangeComparatorForDocument___block_invoke_2;
    aBlock[3] = &unk_1E5308660;
    objc_copyWeak(&v11, &to);
    id v10 = v4;
    id v5 = v4;
    id v6 = _Block_copy(aBlock);

    objc_destroyWeak(&v11);
  }
  objc_destroyWeak(&to);
  return v6;
}

uint64_t __62__UITextSearchingFindSession__textRangeComparatorForDocument___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(*(void *)(a1 + 32) + 184);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  uint64_t v9 = [WeakRetained compareFoundRange:v7 toRange:v6 inDocument:*(void *)(a1 + 40)];

  return v9;
}

uint64_t __62__UITextSearchingFindSession__textRangeComparatorForDocument___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  uint64_t v9 = [v7 start];

  id v10 = [v6 start];

  uint64_t v11 = [WeakRetained offsetFromPosition:v9 toPosition:v10 inDocument:*(void *)(a1 + 32)];
  if (v11) {
    return -1;
  }
  else {
    return 0;
  }
}

- (void)_performDelayedSearchOperations
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[(NSMutableArray *)self->_blocksAwaitingSearchResults copy];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  -[NSMutableArray removeObjectsInArray:](self->_blocksAwaitingSearchResults, "removeObjectsInArray:", v4, (void)v9);
  self->_readyToPerformDelayedSearchOperations = 0;
}

- (void)_setReadyToPerformDelayedSearchOperations
{
  if (!self->_readyToPerformDelayedSearchOperations)
  {
    [(UITextSearchingFindSession *)self performSelector:sel__performDelayedSearchOperations withObject:0 afterDelay:0.0];
    self->_readyToPerformDelayedSearchOperations = 1;
  }
}

- (void)_performBlockWhenSearchResultsAreAvailable:(id)a3
{
  blocksAwaitingSearchResults = self->_blocksAwaitingSearchResults;
  id v5 = (id)[a3 copy];
  id v4 = _Block_copy(v5);
  [(NSMutableArray *)blocksAwaitingSearchResults addObject:v4];
}

- (id)_allFoundRanges
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = self->_sortedDocumentIdentifiers;
  uint64_t v4 = [(NSMutableOrderedSet *)obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v9 = [(NSMutableDictionary *)self->_sortedResultsByDocument objectForKey:v8];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v17;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v17 != v12) {
                objc_enumerationMutation(v9);
              }
              [v3 addObject:*(void *)(*((void *)&v16 + 1) + 8 * j)];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v11);
        }
      }
      uint64_t v5 = [(NSMutableOrderedSet *)obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }

  return v3;
}

- (void)_foundRange:(id)a3 forSearchString:(id)a4 inDocument:(id)a5
{
  id v33 = a3;
  id v9 = a4;
  uint64_t v10 = (__CFString *)a5;
  uint64_t v11 = v10;
  uint64_t v12 = @"__singleton__";
  if (v10) {
    uint64_t v12 = v10;
  }
  id v13 = v12;
  sortedDocumentIdentifiers = self->_sortedDocumentIdentifiers;
  if (!sortedDocumentIdentifiers)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA70] orderedSet];
    long long v16 = self->_sortedDocumentIdentifiers;
    self->_sortedDocumentIdentifiers = v15;

    sortedDocumentIdentifiers = self->_sortedDocumentIdentifiers;
  }
  if (([(NSMutableOrderedSet *)sortedDocumentIdentifiers containsObject:v13] & 1) == 0)
  {
    if ([(NSMutableOrderedSet *)self->_sortedDocumentIdentifiers count]
      && (*(_WORD *)&self->_searchableObjectConformsTo & 0x800) == 0)
    {
      v32 = [MEMORY[0x1E4F28B00] currentHandler];
      [v32 handleFailureInMethod:a2, self, @"UITextSearchingFindSession.m", 618, @"UITextSearching: When providing multiple documents to the aggregator, you must implement the optional method compareOrderFromDocument:toDocument:." object file lineNumber description];
    }
    long long v17 = self->_sortedDocumentIdentifiers;
    uint64_t v18 = [(NSMutableOrderedSet *)v17 count];
    long long v19 = [(UITextSearchingFindSession *)self _documentComparator];
    uint64_t v20 = -[NSMutableOrderedSet indexOfObject:inSortedRange:options:usingComparator:](v17, "indexOfObject:inSortedRange:options:usingComparator:", v13, 0, v18, 1024, v19);

    [(NSMutableOrderedSet *)self->_sortedDocumentIdentifiers insertObject:v13 atIndex:v20];
  }
  sortedResultsByDocument = self->_sortedResultsByDocument;
  if (!sortedResultsByDocument)
  {
    long long v22 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v23 = self->_sortedResultsByDocument;
    self->_sortedResultsByDocument = v22;

    sortedResultsByDocument = self->_sortedResultsByDocument;
  }
  __int16 v24 = [(NSMutableDictionary *)sortedResultsByDocument objectForKey:v13];

  if (!v24)
  {
    id v25 = self->_sortedResultsByDocument;
    uint64_t v26 = [MEMORY[0x1E4F1CA70] orderedSet];
    [(NSMutableDictionary *)v25 setObject:v26 forKey:v13];
  }
  __int16 v27 = [(NSMutableDictionary *)self->_sortedResultsByDocument objectForKey:v13];
  uint64_t v28 = [v27 count];
  v29 = [(UITextSearchingFindSession *)self _textRangeComparatorForDocument:v13];
  uint64_t v30 = objc_msgSend(v27, "indexOfObject:inSortedRange:options:usingComparator:", v33, 0, v28, 1024, v29);

  [v27 insertObject:v33 atIndex:v30];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchableObject);
  [WeakRetained decorateFoundTextRange:v33 inDocument:v11 usingStyle:1];

  self->_awaitingFirstResults = 0;
  [(UITextSearchingFindSession *)self _setNeedsResultCountUpdate];
  [(UITextSearchingFindSession *)self _setReadyToPerformDelayedSearchOperations];
}

- (void)_invalidateFoundRange:(id)a3 inDocument:(id)a4
{
  if (a4) {
    uint64_t v6 = (__CFString *)a4;
  }
  else {
    uint64_t v6 = @"__singleton__";
  }
  sortedResultsByDocument = self->_sortedResultsByDocument;
  id v10 = a4;
  id v8 = a3;
  id v9 = [(NSMutableDictionary *)sortedResultsByDocument objectForKey:v6];
  [v9 removeObject:v8];

  LODWORD(v9) = [v8 isEqual:self->_highlightedTextRange];
  if (v9) {
    [(UITextSearchingFindSession *)self highlightNextResultInDirection:0];
  }
  [(UITextSearchingFindSession *)self _setNeedsResultCountUpdate];
}

- (void)_invalidateAllFoundRanges
{
  [(UITextSearchingFindSession *)self reset];
  [(UITextSearchingFindSession *)self _setNeedsResultCountUpdate];
}

- (void)_finishedSearching
{
  self->_isSearching = 0;
  [(UITextSearchingFindSession *)self _setNeedsResultCountUpdate];
  [(UITextSearchingFindSession *)self _performDelayedSearchOperations];
}

- (id)parentInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentInteraction);
  return WeakRetained;
}

- (void)setParentInteraction:(id)a3
{
}

- (BOOL)isSearching
{
  return self->_isSearching;
}

- (id)searchableObject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchableObject);
  return WeakRetained;
}

- (void)setSearchableObject:(id)a3
{
}

- (UITextSearching)stronglyHeldSearchableObject
{
  return self->_stronglyHeldSearchableObject;
}

- (void)setStronglyHeldSearchableObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stronglyHeldSearchableObject, 0);
  objc_destroyWeak((id *)&self->_searchableObject);
  objc_destroyWeak((id *)&self->_parentInteraction);
  objc_storeStrong((id *)&self->_highlightedDocumentBeforeSubsequentSearch, 0);
  objc_storeStrong((id *)&self->_highlightedRangeBeforeSubsequentSearch, 0);
  objc_storeStrong((id *)&self->_aggregator, 0);
  objc_storeStrong((id *)&self->_lastSearchOptions, 0);
  objc_storeStrong((id *)&self->_lastSearchQuery, 0);
  objc_storeStrong((id *)&self->_blocksAwaitingSearchResults, 0);
  objc_storeStrong((id *)&self->_sortedResultsByDocument, 0);
  objc_storeStrong((id *)&self->_sortedDocumentIdentifiers, 0);
  objc_storeStrong((id *)&self->_highlightedDocument, 0);
  objc_storeStrong((id *)&self->_highlightedTextRange, 0);
}

@end