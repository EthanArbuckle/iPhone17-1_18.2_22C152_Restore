@interface TSKFindReplaceController
+ (BOOL)p_searchReference:(id)a3 comparedWithSearchReference:(id)a4 orEqual:(BOOL)a5 inDirection:(unint64_t)a6 before:(BOOL)a7 comparator:(id)a8;
+ (BOOL)searchReference:(id)a3 isAfterSearchReference:(id)a4 orEqual:(BOOL)a5 inDirection:(unint64_t)a6 comparator:(id)a7;
+ (BOOL)searchReference:(id)a3 isBeforeSearchReference:(id)a4 orEqual:(BOOL)a5 inDirection:(unint64_t)a6 comparator:(id)a7;
+ (void)_recursiveSearchWithSearchTarget:(id)a3 forAnnotationsWithHitBlock:(id)a4;
+ (void)_recursiveSearchWithSearchTarget:(id)a3 forString:(id)a4 options:(unint64_t)a5 hitBlock:(id)a6;
- (BOOL)commentsIncludedInAnnotationSearch;
- (BOOL)countSearchHits;
- (BOOL)p_searchCriteriaIsValid;
- (BOOL)p_shouldCountAnnotation:(id)a3;
- (NSMutableArray)layoutSearchResults;
- (NSMutableDictionary)layoutSearchCountForRootIndexMap;
- (NSMutableSet)annotationDisplayStringTypes;
- (NSString)searchString;
- (TSKDocumentRootProvider)documentRootProvider;
- (TSKFindReplaceController)initWithDocumentRootProvider:(id)a3 delegate:(id)a4;
- (TSKFindReplaceController)initWithDocumentRootProvider:(id)a3 delegate:(id)a4 onlySearchesAnnotations:(BOOL)a5;
- (TSKFindReplaceController)initWithDocumentRootProvider:(id)a3 delegate:(id)a4 targetProvider:(id)a5 onlySearchesAnnotations:(BOOL)a6;
- (TSKFindReplaceDelegate)findReplaceDelegate;
- (TSKSearchTargetProvider)searchTargetProvider;
- (_NSRange)currentRootSearchTargetRange;
- (id)_firstResultInDirection:(unint64_t)a3;
- (id)_lastResultInDirection:(unint64_t)a3;
- (id)annotationSearchReferenceForAnnotation:(id)a3;
- (id)documentRoot;
- (id)firstVisibleResultInRect:(CGRect)a3;
- (id)progressBlock;
- (id)searchReferenceAfterReference:(id)a3 inDirection:(unint64_t)a4;
- (id)searchReferencesToHighlightInVisibleRootObjectRange:(_NSRange)a3;
- (id)searchResultComparator;
- (unint64_t)_nextRootSearchTargetFromIndex:(unint64_t)a3 inDirection:(unint64_t)a4 wrapped:(BOOL *)a5;
- (unint64_t)_resultCountInRootObjectRange:(_NSRange)a3;
- (unint64_t)indexOfVisibleSearchReference:(id)a3;
- (unint64_t)searchOptions;
- (unint64_t)searchResultsCount;
- (void)_buildLayoutSearchResultsForRootSearchTargetsInRange:(_NSRange)a3 resultsArray:(id)a4;
- (void)_nextSearchTargetWithMatchInDirection:(unint64_t)a3;
- (void)dealloc;
- (void)invalidateSearchResults;
- (void)p_buildSearchResultsIfNecessary;
- (void)p_buildVisibleSearchResultsIfNecessary;
- (void)p_continueCountingHits;
- (void)p_startCountingHits;
- (void)p_stopCountingHits;
- (void)setAnnotationDisplayStringTypes:(id)a3;
- (void)setCommentsIncludedInAnnotationSearch:(BOOL)a3;
- (void)setCountSearchHits:(BOOL)a3;
- (void)setCurrentRootSearchTargetRange:(_NSRange)a3;
- (void)setDocumentRootProvider:(id)a3;
- (void)setLayoutSearchCountForRootIndexMap:(id)a3;
- (void)setLayoutSearchResults:(id)a3;
- (void)setProgressBlock:(id)a3;
- (void)setSearchOptions:(unint64_t)a3;
- (void)setSearchProgressBlock:(id)a3;
- (void)setSearchResultComparator:(id)a3;
- (void)setSearchString:(id)a3;
- (void)sortLayoutSearchResultsArray:(id)a3;
@end

@implementation TSKFindReplaceController

- (void)setDocumentRootProvider:(id)a3
{
  if (self->_documentRootProvider != a3)
  {
    self->_documentRootProvider = (TSKDocumentRootProvider *)a3;
    [(TSKFindReplaceController *)self p_stopCountingHits];
  }
}

- (TSKFindReplaceController)initWithDocumentRootProvider:(id)a3 delegate:(id)a4
{
  return [(TSKFindReplaceController *)self initWithDocumentRootProvider:a3 delegate:a4 targetProvider:0 onlySearchesAnnotations:0];
}

- (TSKFindReplaceController)initWithDocumentRootProvider:(id)a3 delegate:(id)a4 onlySearchesAnnotations:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v9 = [a3 documentRoot];

  return [(TSKFindReplaceController *)self initWithDocumentRootProvider:a3 delegate:a4 targetProvider:v9 onlySearchesAnnotations:v5];
}

- (TSKFindReplaceController)initWithDocumentRootProvider:(id)a3 delegate:(id)a4 targetProvider:(id)a5 onlySearchesAnnotations:(BOOL)a6
{
  v14.receiver = self;
  v14.super_class = (Class)TSKFindReplaceController;
  v10 = [(TSKFindReplaceController *)&v14 init];
  v11 = v10;
  if (v10)
  {
    [(TSKFindReplaceController *)v10 setDocumentRootProvider:a3];
    -[TSKFindReplaceController setLayoutSearchResults:](v11, "setLayoutSearchResults:", [MEMORY[0x263EFF980] array]);
    -[TSKFindReplaceController setAnnotationDisplayStringTypes:](v11, "setAnnotationDisplayStringTypes:", [MEMORY[0x263EFF9C0] set]);
    v11->_searchTargetProvider = (TSKSearchTargetProvider *)a5;
    -[TSKFindReplaceController setLayoutSearchCountForRootIndexMap:](v11, "setLayoutSearchCountForRootIndexMap:", [MEMORY[0x263EFF9A0] dictionary]);
    v11->_findReplaceDelegate = (TSKFindReplaceDelegate *)a4;
    v11->_searchOptions = 16;
    v11->_countSearchHits = 1;
    [(TSKFindReplaceController *)v11 setSearchResultComparator:&__block_literal_global_17];
    v12 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];
    if (([v12 BOOLForKey:@"FindReplaceMatchCaseKey"] & 1) == 0) {
      v11->_searchOptions |= 1uLL;
    }
    if ([v12 BOOLForKey:@"FindReplaceWholeWordsKey"]) {
      v11->_searchOptions |= 8uLL;
    }
    v11->_onlySearchesAnnotations = a6;
  }
  return v11;
}

- (void)dealloc
{
  [(TSKFindReplaceController *)self setLayoutSearchResults:0];
  [(TSKFindReplaceController *)self setLayoutSearchCountForRootIndexMap:0];
  [(TSKFindReplaceController *)self setAnnotationDisplayStringTypes:0];

  v3.receiver = self;
  v3.super_class = (Class)TSKFindReplaceController;
  [(TSKFindReplaceController *)&v3 dealloc];
}

- (void)setSearchProgressBlock:(id)a3
{
  if ([(TSKFindReplaceController *)self progressBlock] != a3)
  {
    [(TSKFindReplaceController *)self p_stopCountingHits];
    [(TSKFindReplaceController *)self setProgressBlock:a3];
    if ([(TSKFindReplaceController *)self progressBlock])
    {
      [(TSKFindReplaceController *)self p_startCountingHits];
    }
  }
}

- (void)setSearchOptions:(unint64_t)a3
{
  if (self->_searchOptions != a3)
  {
    self->_searchOptions = a3;
    BOOL v5 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];
    [v5 setBool:(a3 & 1) == 0 forKey:@"FindReplaceMatchCaseKey"];
    [v5 setBool:(a3 >> 3) & 1 forKey:@"FindReplaceWholeWordsKey"];
    [(TSKFindReplaceController *)self invalidateSearchResults];
  }
}

- (unint64_t)searchResultsCount
{
  unint64_t v3 = [(NSMutableArray *)[(TSKFindReplaceController *)self layoutSearchResults] count];
  unint64_t result = self->_searchResultsCount;
  if (v3 > result)
  {
    BOOL v5 = [(TSKFindReplaceController *)self layoutSearchResults];
    return [(NSMutableArray *)v5 count];
  }
  return result;
}

- (void)setSearchResultComparator:(id)a3
{
  if (a3) {
    id v3 = a3;
  }
  else {
    id v3 = &__block_literal_global_17;
  }
  id searchResultComparator = self->_searchResultComparator;
  if (v3 != searchResultComparator)
  {

    self->_id searchResultComparator = (id)[v3 copy];
  }
}

- (id)documentRoot
{
  v2 = [(TSKFindReplaceController *)self documentRootProvider];

  return (id)[(TSKDocumentRootProvider *)v2 documentRoot];
}

- (void)setCommentsIncludedInAnnotationSearch:(BOOL)a3
{
  self->_commentsIncludedInAnnotationSearch = a3;
  [(TSKFindReplaceController *)self invalidateSearchResults];
}

- (BOOL)p_shouldCountAnnotation:(id)a3
{
  if (a3) {
    return [a3 annotationType] != 1 || self->_commentsIncludedInAnnotationSearch;
  }
  BOOL v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v6 = [NSString stringWithUTF8String:"-[TSKFindReplaceController p_shouldCountAnnotation:]"];
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKFindReplaceController.m"), 251, @"invalid nil value for '%s'", "annotation");
  return 0;
}

- (BOOL)p_searchCriteriaIsValid
{
  return [(NSString *)[(TSKFindReplaceController *)self searchString] length]
      || self->_onlySearchesAnnotations;
}

- (void)p_continueCountingHits
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSKFindReplaceController p_continueCountingHits]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKFindReplaceController.m"), 319, @"This operation must only be performed on the main thread.");
  }
  if (self->_currentModelEnumerator
    && [(TSKFindReplaceController *)self p_searchCriteriaIsValid])
  {
    currentSearchable = self->_currentSearchable;
    if (currentSearchable)
    {
      BOOL v6 = 0;
    }
    else
    {
      id v7 = [(NSEnumerator *)self->_currentModelEnumerator nextObject];
      BOOL v6 = v7 == 0;
      if (v7)
      {
        currentSearchable = (TSKSearchable *)TSUProtocolCast();
        self->_currentSearchable = currentSearchable;
        if (!currentSearchable) {
          goto LABEL_29;
        }
      }
      else
      {
        currentSearchable = self->_currentSearchable;
        if (!currentSearchable) {
          goto LABEL_29;
        }
      }
    }
    if (self->_currentSearch)
    {
      if (self->_onlySearchesAnnotations) {
        -[TSKSearchable continueAnnotationSearch:](currentSearchable, "continueAnnotationSearch:");
      }
      else {
        -[TSKSearchable continueSearch:](currentSearchable, "continueSearch:");
      }
LABEL_25:
      currentSearch = self->_currentSearch;
      if (!currentSearch) {
        goto LABEL_31;
      }
LABEL_26:
      BOOL v19 = [(TSKSearch *)currentSearch isComplete];
      v20 = self->_currentSearch;
      if (v19)
      {

        self->_currentSearch = 0;
        goto LABEL_31;
      }
      if (v20)
      {
LABEL_29:
        if (v6)
        {
LABEL_32:

          self->_currentModelEnumerator = 0;
          uint64_t v21 = 1;
LABEL_33:
          if ([(TSKFindReplaceController *)self progressBlock])
          {
            v22 = [(TSKFindReplaceController *)self progressBlock];
            v22[2](v22, self->_searchResultsCount, v21);
          }
          return;
        }
LABEL_30:
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __50__TSKFindReplaceController_p_continueCountingHits__block_invoke_3;
        block[3] = &unk_2646AF7B8;
        block[4] = self;
        dispatch_async(MEMORY[0x263EF83A0], block);
        uint64_t v21 = 0;
        goto LABEL_33;
      }
LABEL_31:
      self->_currentSearchable = 0;
      if (v6) {
        goto LABEL_32;
      }
      goto LABEL_30;
    }
    char v8 = objc_opt_respondsToSelector();
    char v9 = objc_opt_respondsToSelector();
    char v10 = v9;
    if ((v8 & 1) == 0 && (v9 & 1) == 0)
    {
      v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"-[TSKFindReplaceController p_continueCountingHits]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKFindReplaceController.m"), 347, @"Every searchable should respond to atleast a string search or an annotation search");
    }
    if (self->_onlySearchesAnnotations)
    {
      if ((v10 & 1) == 0) {
        goto LABEL_25;
      }
      v13 = self->_currentSearchable;
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __50__TSKFindReplaceController_p_continueCountingHits__block_invoke_2;
      v24[3] = &unk_2646B0D10;
      v24[4] = self;
      objc_super v14 = (void *)[(TSKSearchable *)v13 searchForAnnotationsWithHitBlock:v24];
    }
    else
    {
      if ((v8 & 1) == 0) {
        goto LABEL_25;
      }
      v15 = self->_currentSearchable;
      v16 = [(TSKFindReplaceController *)self searchString];
      unint64_t v17 = [(TSKFindReplaceController *)self searchOptions];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __50__TSKFindReplaceController_p_continueCountingHits__block_invoke;
      v25[3] = &unk_2646B0D10;
      v25[4] = self;
      objc_super v14 = (void *)[(TSKSearchable *)v15 searchForString:v16 options:v17 onHit:v25];
    }
    currentSearch = v14;
    self->_currentSearch = currentSearch;
    if (!currentSearch) {
      goto LABEL_31;
    }
    goto LABEL_26;
  }
}

uint64_t __50__TSKFindReplaceController_p_continueCountingHits__block_invoke(uint64_t result)
{
  return result;
}

uint64_t __50__TSKFindReplaceController_p_continueCountingHits__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "p_shouldCountAnnotation:", objc_msgSend(a2, "annotation"));
  if (result)
  {
    ++*(void *)(*(void *)(a1 + 32) + 72);
    BOOL v5 = *(void **)(*(void *)(a1 + 32) + 56);
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(a2, "annotation"), "annotationDisplayStringType"));
    return [v5 addObject:v6];
  }
  return result;
}

uint64_t __50__TSKFindReplaceController_p_continueCountingHits__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_continueCountingHits");
}

- (void)p_stopCountingHits
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSKFindReplaceController p_stopCountingHits]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKFindReplaceController.m"), 414, @"This operation must only be performed on the main thread.");
  }
  self->_searchResultsCount = 0;

  self->_currentModelEnumerator = 0;
  self->_currentSearch = 0;
}

- (void)p_startCountingHits
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSKFindReplaceController p_startCountingHits]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKFindReplaceController.m"), 423, @"This operation must only be performed on the main thread.");
  }
  self->_currentSearchable = 0;
  self->_currentModelEnumerator = (NSEnumerator *)(id)objc_msgSend(-[TSKFindReplaceController documentRoot](self, "documentRoot"), "modelEnumeratorWithFlags:", 1);
  self->_searchResultsCount = 0;
  [(NSMutableSet *)self->_annotationDisplayStringTypes removeAllObjects];
  self->_currentSearchStartTime = CFAbsoluteTimeGetCurrent();
  if (self->_currentModelEnumerator)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__TSKFindReplaceController_p_startCountingHits__block_invoke;
    block[3] = &unk_2646AF7B8;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __47__TSKFindReplaceController_p_startCountingHits__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_continueCountingHits");
}

+ (void)_recursiveSearchWithSearchTarget:(id)a3 forString:(id)a4 options:(unint64_t)a5 hitBlock:(id)a6
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  objc_msgSend(a1, "_assertSearchTargetImplementsProperMethods:");
  if (objc_opt_respondsToSelector()) {
    [a3 layoutSearchForString:a4 options:a5 hitBlock:a6];
  }
  if (objc_opt_respondsToSelector())
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v11 = objc_msgSend(a3, "childSearchTargets", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          [a1 _recursiveSearchWithSearchTarget:*(void *)(*((void *)&v16 + 1) + 8 * v15++) forString:a4 options:a5 hitBlock:a6];
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v13);
    }
  }
}

+ (void)_recursiveSearchWithSearchTarget:(id)a3 forAnnotationsWithHitBlock:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  objc_msgSend(a1, "_assertSearchTargetImplementsProperMethods:");
  if (objc_opt_respondsToSelector()) {
    [a3 layoutSearchForAnnotationWithHitBlock:a4];
  }
  if (objc_opt_respondsToSelector())
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = (void *)[a3 childAnnotationSearchTargets];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          [a1 _recursiveSearchWithSearchTarget:*(void *)(*((void *)&v21 + 1) + 8 * i) forAnnotationsWithHitBlock:a4];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v9);
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v12 = objc_msgSend(a3, "childSearchTargets", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          [a1 _recursiveSearchWithSearchTarget:*(void *)(*((void *)&v17 + 1) + 8 * j) forAnnotationsWithHitBlock:a4];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v14);
    }
  }
}

- (id)searchReferencesToHighlightInVisibleRootObjectRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v6 = (void *)[MEMORY[0x263F7C8A8] dictionary];
  if ([(TSKFindReplaceController *)self searchString]
    && [(NSString *)[(TSKFindReplaceController *)self searchString] length]
    && location < location + length)
  {
    do
    {
      id v7 = [(TSKFindReplaceController *)self searchTargetProvider];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __80__TSKFindReplaceController_searchReferencesToHighlightInVisibleRootObjectRange___block_invoke;
      v9[3] = &unk_2646B0D38;
      v9[4] = self;
      v9[5] = v6;
      [(TSKSearchTargetProvider *)v7 withRootSearchTargetAtIndex:location++ executeBlock:v9];
      --length;
    }
    while (length);
  }
  return v6;
}

uint64_t __80__TSKFindReplaceController_searchReferencesToHighlightInVisibleRootObjectRange___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [*(id *)(a1 + 32) searchString];
  uint64_t v6 = [*(id *)(a1 + 32) searchOptions];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __80__TSKFindReplaceController_searchReferencesToHighlightInVisibleRootObjectRange___block_invoke_2;
  v8[3] = &unk_2646B0D10;
  v8[4] = *(void *)(a1 + 40);
  return [v4 _recursiveSearchWithSearchTarget:a2 forString:v5 options:v6 hitBlock:v8];
}

uint64_t __80__TSKFindReplaceController_searchReferencesToHighlightInVisibleRootObjectRange___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", objc_msgSend(a2, "model"));
  if (!v4)
  {
    uint64_t v4 = (void *)[MEMORY[0x263EFF980] array];
    objc_msgSend(*(id *)(a1 + 32), "setObject:forUncopiedKey:", v4, objc_msgSend(a2, "model"));
  }

  return [v4 addObject:a2];
}

- (void)invalidateSearchResults
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSKFindReplaceController invalidateSearchResults]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKFindReplaceController.m"), 525, @"This operation must only be performed on the main thread.");
  }
  [(NSMutableArray *)[(TSKFindReplaceController *)self layoutSearchResults] removeAllObjects];
  [(NSMutableSet *)self->_annotationDisplayStringTypes removeAllObjects];
  -[TSKFindReplaceController setCurrentRootSearchTargetRange:](self, "setCurrentRootSearchTargetRange:", *MEMORY[0x263F7C7C8], *(void *)(MEMORY[0x263F7C7C8] + 8));
  if (self->_countSearchHits)
  {
    [(TSKFindReplaceController *)self p_stopCountingHits];
    if ([(TSKFindReplaceController *)self progressBlock])
    {
      if ([(TSKFindReplaceController *)self p_searchCriteriaIsValid])
      {
        [(TSKFindReplaceController *)self p_startCountingHits];
      }
    }
  }
}

- (void)sortLayoutSearchResultsArray:(id)a3
{
}

- (void)_buildLayoutSearchResultsForRootSearchTargetsInRange:(_NSRange)a3 resultsArray:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a3.location != [(TSKFindReplaceController *)self currentRootSearchTargetRange]
    || length != v8)
  {
    -[TSKFindReplaceController setCurrentRootSearchTargetRange:](self, "setCurrentRootSearchTargetRange:", location, length);
    [a4 removeAllObjects];
    if (self->_onlySearchesAnnotations)
    {
      uint64_t v9 = v18;
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __94__TSKFindReplaceController__buildLayoutSearchResultsForRootSearchTargetsInRange_resultsArray___block_invoke;
      v18[3] = &unk_2646B0D80;
      v18[4] = self;
      v18[5] = a4;
      uint64_t v10 = v17;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v11 = __94__TSKFindReplaceController__buildLayoutSearchResultsForRootSearchTargetsInRange_resultsArray___block_invoke_2;
    }
    else
    {
      uint64_t v9 = v16;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __94__TSKFindReplaceController__buildLayoutSearchResultsForRootSearchTargetsInRange_resultsArray___block_invoke_3;
      v16[3] = &unk_2646B0D10;
      v16[4] = self;
      uint64_t v10 = v15;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v11 = __94__TSKFindReplaceController__buildLayoutSearchResultsForRootSearchTargetsInRange_resultsArray___block_invoke_4;
    }
    v10[2] = v11;
    v10[3] = &unk_2646B0DA8;
    v10[4] = self;
    v10[5] = v9;
    if (location < location + length)
    {
      do
      {
        uint64_t v12 = [a4 count];
        [(TSKSearchTargetProvider *)[(TSKFindReplaceController *)self searchTargetProvider] withRootSearchTargetAtIndex:location executeBlock:v10];
        uint64_t v13 = [a4 count];
        uint64_t v14 = [NSNumber numberWithUnsignedInteger:location];
        -[NSMutableDictionary setObject:forKey:](-[TSKFindReplaceController layoutSearchCountForRootIndexMap](self, "layoutSearchCountForRootIndexMap"), "setObject:forKey:", [NSNumber numberWithUnsignedInteger:v13 - v12], v14);
        ++location;
        --length;
      }
      while (length);
    }
    [(TSKFindReplaceController *)self sortLayoutSearchResultsArray:a4];
  }
}

uint64_t __94__TSKFindReplaceController__buildLayoutSearchResultsForRootSearchTargetsInRange_resultsArray___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "p_shouldCountAnnotation:", objc_msgSend(a2, "annotation"));
  if (result)
  {
    [a2 searchReferencePoint];
    if ((TSUPointIsFinite() & 1) == 0)
    {
      uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[TSKFindReplaceController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:]_block_invoke"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKFindReplaceController.m"), 564, @"the hit reference should have a valid point");
    }
    id v7 = *(void **)(a1 + 40);
    return [v7 addObject:a2];
  }
  return result;
}

uint64_t __94__TSKFindReplaceController__buildLayoutSearchResultsForRootSearchTargetsInRange_resultsArray___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = *(void *)(a1 + 40);

  return [v4 _recursiveSearchWithSearchTarget:a2 forAnnotationsWithHitBlock:v5];
}

uint64_t __94__TSKFindReplaceController__buildLayoutSearchResultsForRootSearchTargetsInRange_resultsArray___block_invoke_3(uint64_t a1, void *a2)
{
  [a2 searchReferencePoint];
  if ((TSUPointIsFinite() & 1) == 0)
  {
    uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSKFindReplaceController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:]_block_invoke_3"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKFindReplaceController.m"), 575, @"the hit reference should have a valid point");
  }
  [*(id *)(a1 + 32) findReplaceDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "findReplaceDelegate"), "findReplaceController:shouldSkipSearchReference:", *(void *)(a1 + 32), a2), (result & 1) == 0))
  {
    id v7 = (void *)[*(id *)(a1 + 32) layoutSearchResults];
    return [v7 addObject:a2];
  }
  return result;
}

uint64_t __94__TSKFindReplaceController__buildLayoutSearchResultsForRootSearchTargetsInRange_resultsArray___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [*(id *)(a1 + 32) searchString];
  uint64_t v6 = [*(id *)(a1 + 32) searchOptions];
  uint64_t v7 = *(void *)(a1 + 40);

  return [v4 _recursiveSearchWithSearchTarget:a2 forString:v5 options:v6 hitBlock:v7];
}

- (unint64_t)_nextRootSearchTargetFromIndex:(unint64_t)a3 inDirection:(unint64_t)a4 wrapped:(BOOL *)a5
{
  while (1)
  {
    uint64_t v9 = [(TSKFindReplaceController *)self searchTargetProvider];
    uint64_t v10 = self->_onlySearchesAnnotations ? 0 : [(TSKFindReplaceController *)self searchString];
    unint64_t result = [(TSKSearchTargetProvider *)v9 nextRootSearchTargetIndexFromIndex:a3 forString:v10 options:[(TSKFindReplaceController *)self searchOptions] inDirection:a4];
    BOOL v12 = a3 == 0x7FFFFFFFFFFFFFFFLL && result == 0x7FFFFFFFFFFFFFFFLL;
    BOOL v13 = v12;
    if (v12 || result != 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    *a5 = 1;
    a3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v13) {
    return 0;
  }
  return result;
}

- (void)_nextSearchTargetWithMatchInDirection:(unint64_t)a3
{
  uint64_t v5 = (void *)MEMORY[0x263F089C8];
  uint64_t v6 = [(TSKFindReplaceController *)self currentRootSearchTargetRange];
  for (uint64_t i = objc_msgSend(v5, "indexSetWithIndexesInRange:", v6, v7);
        ;
        objc_msgSend(i, "addIndexesInRange:", v18, v19))
  {
    uint64_t v9 = [(TSKFindReplaceController *)self currentRootSearchTargetRange];
    uint64_t v11 = v10 - 1;
    if (a3) {
      uint64_t v11 = 0;
    }
    char v20 = 0;
    unint64_t v12 = [(TSKFindReplaceController *)self _nextRootSearchTargetFromIndex:v9 + v11 inDirection:a3 wrapped:&v20];
    unint64_t v13 = [(TSKFindReplaceController *)self currentRootSearchTargetRange];
    if (v12 < v13 || v12 - v13 >= v14) {
      -[TSKFindReplaceController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:](self, "_buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:", v12, 1, [(TSKFindReplaceController *)self layoutSearchResults]);
    }
    if ([(NSMutableArray *)[(TSKFindReplaceController *)self layoutSearchResults] count]) {
      break;
    }
    uint64_t v16 = [(TSKFindReplaceController *)self currentRootSearchTargetRange];
    if (objc_msgSend(i, "containsIndexesInRange:", v16, v17))
    {
      [(TSKFindReplaceController *)self findReplaceDelegate];
      if (objc_opt_respondsToSelector()) {
        [(TSKFindReplaceDelegate *)[(TSKFindReplaceController *)self findReplaceDelegate] findReplaceControllerDidFindNoResults:self];
      }
      return;
    }
    uint64_t v18 = [(TSKFindReplaceController *)self currentRootSearchTargetRange];
  }
  if (v20)
  {
    [(TSKFindReplaceController *)self findReplaceDelegate];
    if (objc_opt_respondsToSelector()) {
      [(TSKFindReplaceDelegate *)[(TSKFindReplaceController *)self findReplaceDelegate] findReplaceController:self didWrapInDirection:a3];
    }
  }
}

- (id)_firstResultInDirection:(unint64_t)a3
{
  id result = (id)[(NSMutableArray *)[(TSKFindReplaceController *)self layoutSearchResults] count];
  if (result)
  {
    uint64_t v6 = [(TSKFindReplaceController *)self layoutSearchResults];
    if (a3)
    {
      return (id)[(NSMutableArray *)v6 lastObject];
    }
    else
    {
      return (id)[(NSMutableArray *)v6 objectAtIndex:0];
    }
  }
  return result;
}

- (id)_lastResultInDirection:(unint64_t)a3
{
  id result = (id)[(NSMutableArray *)[(TSKFindReplaceController *)self layoutSearchResults] count];
  if (result)
  {
    uint64_t v6 = [(TSKFindReplaceController *)self layoutSearchResults];
    if (a3)
    {
      return (id)[(NSMutableArray *)v6 objectAtIndex:0];
    }
    else
    {
      return (id)[(NSMutableArray *)v6 lastObject];
    }
  }
  return result;
}

- (void)p_buildSearchResultsIfNecessary
{
  uint64_t v3 = [(TSKFindReplaceController *)self currentRootSearchTargetRange];
  if (v3 == *MEMORY[0x263F7C7C8] && v4 == *(void *)(MEMORY[0x263F7C7C8] + 8))
  {
    uint64_t v6 = [(TSKFindReplaceDelegate *)[(TSKFindReplaceController *)self findReplaceDelegate] visibleRootIndexRange];
    uint64_t v8 = v7;
    uint64_t v9 = [(TSKFindReplaceController *)self layoutSearchResults];
    -[TSKFindReplaceController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:](self, "_buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:", v6, v8, v9);
  }
}

- (void)p_buildVisibleSearchResultsIfNecessary
{
  uint64_t v3 = [(TSKFindReplaceController *)self currentRootSearchTargetRange];
  uint64_t v5 = v4;
  if (v3 != [(TSKFindReplaceDelegate *)[(TSKFindReplaceController *)self findReplaceDelegate] visibleRootIndexRange]|| v5 != v6)
  {
    uint64_t v7 = [(TSKFindReplaceDelegate *)[(TSKFindReplaceController *)self findReplaceDelegate] visibleRootIndexRange];
    uint64_t v9 = v8;
    uint64_t v10 = [(TSKFindReplaceController *)self layoutSearchResults];
    -[TSKFindReplaceController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:](self, "_buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:", v7, v9, v10);
  }
}

- (id)firstVisibleResultInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3052000000;
  uint64_t v17 = __Block_byref_object_copy__6;
  uint64_t v18 = __Block_byref_object_dispose__6;
  uint64_t v19 = 0;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v9 = [(TSKFindReplaceDelegate *)[(TSKFindReplaceController *)self findReplaceDelegate] visibleRootIndexRange];
  -[TSKFindReplaceController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:](self, "_buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:", v9, v10, v8);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53__TSKFindReplaceController_firstVisibleResultInRect___block_invoke;
  v13[3] = &unk_2646B0DD0;
  *(CGFloat *)&v13[5] = x;
  *(CGFloat *)&v13[6] = y;
  *(CGFloat *)&v13[7] = width;
  *(CGFloat *)&v13[8] = height;
  v13[4] = &v14;
  [v8 enumerateObjectsUsingBlock:v13];

  uint64_t v11 = (void *)v15[5];
  _Block_object_dispose(&v14, 8);
  return v11;
}

BOOL __53__TSKFindReplaceController_firstVisibleResultInRect___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  [a2 searchReferencePoint];
  v10.CGFloat x = v7;
  v10.CGFloat y = v8;
  BOOL result = CGRectContainsPoint(*(CGRect *)(a1 + 40), v10);
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
    *a4 = 1;
  }
  return result;
}

- (id)annotationSearchReferenceForAnnotation:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  [(TSKFindReplaceController *)self p_buildSearchResultsIfNecessary];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = [(TSKFindReplaceController *)self layoutSearchResults];
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v22 != v8) {
        objc_enumerationMutation(v5);
      }
      CGPoint v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
      if (objc_msgSend((id)objc_msgSend(v10, "annotation"), "isEqual:", a3)) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
    if (v10) {
      return v10;
    }
  }
LABEL_11:
  [(TSKFindReplaceController *)self p_buildVisibleSearchResultsIfNecessary];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = [(TSKFindReplaceController *)self layoutSearchResults];
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (!v12) {
    return 0;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v18;
LABEL_13:
  uint64_t v15 = 0;
  while (1)
  {
    if (*(void *)v18 != v14) {
      objc_enumerationMutation(v11);
    }
    CGPoint v10 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
    if (objc_msgSend((id)objc_msgSend(v10, "annotation"), "isEqual:", a3)) {
      return v10;
    }
    if (v13 == ++v15)
    {
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
      CGPoint v10 = 0;
      if (v13) {
        goto LABEL_13;
      }
      return v10;
    }
  }
}

- (unint64_t)indexOfVisibleSearchReference:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = [(NSMutableArray *)[(TSKFindReplaceController *)self layoutSearchResults] indexOfObject:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
    return v4
  }
         + -[TSKFindReplaceController _resultCountInRootObjectRange:](self, "_resultCountInRootObjectRange:", 0, [(TSKFindReplaceController *)self currentRootSearchTargetRange])+ 1;
  uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v6 = [NSString stringWithUTF8String:"-[TSKFindReplaceController indexOfVisibleSearchReference:]"];
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKFindReplaceController.m"), 797, @"Could not find searchReference in current root search target range");
  return 0;
}

- (unint64_t)_resultCountInRootObjectRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v6 = [(TSKFindReplaceController *)self currentRootSearchTargetRange];
  uint64_t v15 = v7;
  uint64_t v16 = v6;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (location >= location + length)
  {
    unint64_t v9 = 0;
  }
  else
  {
    unint64_t v9 = 0;
    do
    {
      uint64_t v10 = [NSNumber numberWithUnsignedInteger:location];
      if (!-[NSMutableDictionary objectForKey:](-[TSKFindReplaceController layoutSearchCountForRootIndexMap](self, "layoutSearchCountForRootIndexMap"), "objectForKey:", v10))-[TSKFindReplaceController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:](self, "_buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:", location, 1, v8); {
      uint64_t v11 = (void *)[(NSMutableDictionary *)[(TSKFindReplaceController *)self layoutSearchCountForRootIndexMap] objectForKey:v10];
      }
      if (v11)
      {
        v9 += (int)[v11 intValue];
      }
      else
      {
        uint64_t v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v13 = [NSString stringWithUTF8String:"-[TSKFindReplaceController _resultCountInRootObjectRange:]"];
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKFindReplaceController.m"), 825, @"invalid nil value for '%s'", "rootCount");
      }
      ++location;
      --length;
    }
    while (length);
  }
  -[TSKFindReplaceController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:](self, "_buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:", v16, v15, v8);

  return v9;
}

- (id)searchReferenceAfterReference:(id)a3 inDirection:(unint64_t)a4
{
  [(TSKFindReplaceController *)self p_buildSearchResultsIfNecessary];
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x3052000000;
  v26 = __Block_byref_object_copy__6;
  uint64_t v27 = __Block_byref_object_dispose__6;
  uint64_t v28 = 0;
  if (!a3)
  {
    if (![(NSMutableArray *)[(TSKFindReplaceController *)self layoutSearchResults] count]) {
      [(TSKFindReplaceController *)self _nextSearchTargetWithMatchInDirection:a4];
    }
    goto LABEL_8;
  }
  uint64_t v7 = [(NSMutableArray *)[(TSKFindReplaceController *)self layoutSearchResults] indexOfObject:a3];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = [(NSMutableArray *)[(TSKFindReplaceController *)self layoutSearchResults] count]- 1;
    }
    if (v7 == v9)
    {
      [(TSKFindReplaceController *)self _nextSearchTargetWithMatchInDirection:a4];
      id v8 = [(TSKFindReplaceController *)self _firstResultInDirection:a4];
    }
    else
    {
      uint64_t v10 = [(TSKFindReplaceController *)self layoutSearchResults];
      if (a4) {
        uint64_t v11 = v7 - 1;
      }
      else {
        uint64_t v11 = v7 + 1;
      }
      id v8 = (id)[(NSMutableArray *)v10 objectAtIndex:v11];
    }
    goto LABEL_21;
  }
  if (![(NSMutableArray *)[(TSKFindReplaceController *)self layoutSearchResults] count]) {
    [(TSKFindReplaceController *)self _nextSearchTargetWithMatchInDirection:a4];
  }
  if (objc_msgSend((id)objc_opt_class(), "searchReference:isBeforeSearchReference:orEqual:inDirection:comparator:", a3, -[TSKFindReplaceController _firstResultInDirection:](self, "_firstResultInDirection:", a4), 0, a4, -[TSKFindReplaceController searchResultComparator](self, "searchResultComparator")))goto LABEL_8; {
  if (objc_msgSend((id)objc_opt_class(), "searchReference:isAfterSearchReference:orEqual:inDirection:comparator:", a3, -[TSKFindReplaceController _lastResultInDirection:](self, "_lastResultInDirection:", a4), 1, a4, -[TSKFindReplaceController searchResultComparator](self, "searchResultComparator")))
  }
  {
    [(TSKFindReplaceController *)self _nextSearchTargetWithMatchInDirection:a4];
LABEL_8:
    id v8 = [(TSKFindReplaceController *)self _firstResultInDirection:a4];
    goto LABEL_21;
  }
  uint64_t v14 = [(TSKFindReplaceController *)self layoutSearchResults];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  long long v17 = __70__TSKFindReplaceController_searchReferenceAfterReference_inDirection___block_invoke;
  long long v18 = &unk_2646B0DF8;
  long long v19 = self;
  id v20 = a3;
  long long v21 = &v23;
  unint64_t v22 = a4;
  [(NSMutableArray *)v14 enumerateObjectsWithOptions:2 * (a4 != 0) usingBlock:&v15];
  uint64_t v12 = (void *)v24[5];
  if (v12) {
    goto LABEL_22;
  }
  -[TSKFindReplaceController _nextSearchTargetWithMatchInDirection:](self, "_nextSearchTargetWithMatchInDirection:", a4, v15, v16, v17, v18);
  id v8 = [(TSKFindReplaceController *)self _firstResultInDirection:a4];
LABEL_21:
  uint64_t v12 = v8;
  void v24[5] = (uint64_t)v8;
LABEL_22:
  _Block_object_dispose(&v23, 8);
  return v12;
}

uint64_t __70__TSKFindReplaceController_searchReferenceAfterReference_inDirection___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend((id)objc_opt_class(), "searchReference:isAfterSearchReference:orEqual:inDirection:comparator:", a2, *(void *)(a1 + 40), 0, *(void *)(a1 + 56), objc_msgSend(*(id *)(a1 + 32), "searchResultComparator"));
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = a2;
    *a4 = 1;
  }
  return result;
}

+ (BOOL)p_searchReference:(id)a3 comparedWithSearchReference:(id)a4 orEqual:(BOOL)a5 inDirection:(unint64_t)a6 before:(BOOL)a7 comparator:(id)a8
{
  BOOL v8 = a7;
  uint64_t v11 = (*((uint64_t (**)(id, id, id))a8 + 2))(a8, a3, a4);
  if (a6)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else if (!v8)
  {
LABEL_3:
    if (v11 == 1) {
      return v11;
    }
    goto LABEL_7;
  }
  if (v11 == -1)
  {
    LOBYTE(v11) = 1;
    return v11;
  }
LABEL_7:
  if (v11) {
    LOBYTE(v11) = 0;
  }
  else {
    LOBYTE(v11) = a5;
  }
  return v11;
}

+ (BOOL)searchReference:(id)a3 isBeforeSearchReference:(id)a4 orEqual:(BOOL)a5 inDirection:(unint64_t)a6 comparator:(id)a7
{
  return objc_msgSend(a1, "p_searchReference:comparedWithSearchReference:orEqual:inDirection:before:comparator:", a3, a4, a5, a6, 1, a7);
}

+ (BOOL)searchReference:(id)a3 isAfterSearchReference:(id)a4 orEqual:(BOOL)a5 inDirection:(unint64_t)a6 comparator:(id)a7
{
  return objc_msgSend(a1, "p_searchReference:comparedWithSearchReference:orEqual:inDirection:before:comparator:", a3, a4, a5, a6, 0, a7);
}

- (NSMutableSet)annotationDisplayStringTypes
{
  return self->_annotationDisplayStringTypes;
}

- (void)setAnnotationDisplayStringTypes:(id)a3
{
}

- (BOOL)commentsIncludedInAnnotationSearch
{
  return self->_commentsIncludedInAnnotationSearch;
}

- (TSKFindReplaceDelegate)findReplaceDelegate
{
  return self->_findReplaceDelegate;
}

- (TSKSearchTargetProvider)searchTargetProvider
{
  return self->_searchTargetProvider;
}

- (TSKDocumentRootProvider)documentRootProvider
{
  return self->_documentRootProvider;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
}

- (unint64_t)searchOptions
{
  return self->_searchOptions;
}

- (BOOL)countSearchHits
{
  return self->_countSearchHits;
}

- (void)setCountSearchHits:(BOOL)a3
{
  self->_countSearchHits = a3;
}

- (id)searchResultComparator
{
  return self->_searchResultComparator;
}

- (_NSRange)currentRootSearchTargetRange
{
  NSUInteger length = self->_currentRootSearchTargetRange.length;
  NSUInteger location = self->_currentRootSearchTargetRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setCurrentRootSearchTargetRange:(_NSRange)a3
{
  self->_currentRootSearchTargetRange = a3;
}

- (NSMutableArray)layoutSearchResults
{
  return self->_layoutSearchResults;
}

- (void)setLayoutSearchResults:(id)a3
{
}

- (NSMutableDictionary)layoutSearchCountForRootIndexMap
{
  return self->_layoutSearchCountForRootIndexMap;
}

- (void)setLayoutSearchCountForRootIndexMap:(id)a3
{
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
}

@end