@interface UIWebPDFSearchController
- (BOOL)paused;
- (BOOL)searching;
- (NSArray)results;
- (NSString)searchString;
- (UIPDFDocument)documentToSearch;
- (UIWebPDFSearchController)init;
- (UIWebPDFSearchControllerDelegate)searchDelegate;
- (double)documentScale;
- (unint64_t)_actualStartingPageIndex;
- (unint64_t)resultLimit;
- (unint64_t)startingPageIndex;
- (void)_clearSearchQueue;
- (void)cancel;
- (void)dealloc;
- (void)pause;
- (void)resume;
- (void)search:(id)a3;
- (void)search:(id)a3 hasPartialResults:(id)a4;
- (void)searchDidBegin:(id)a3;
- (void)searchDidFinish:(id)a3;
- (void)searchDidTimeOut:(id)a3;
- (void)searchLimitHit:(id)a3;
- (void)searchWasCancelled:(id)a3;
- (void)setDocumentScale:(double)a3;
- (void)setDocumentToSearch:(id)a3;
- (void)setResultLimit:(unint64_t)a3;
- (void)setResults:(id)a3;
- (void)setSearchDelegate:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setStartingPageIndex:(unint64_t)a3;
@end

@implementation UIWebPDFSearchController

- (void)setDocumentToSearch:(id)a3
{
  if (self->_documentToSearch != a3)
  {
    id v5 = a3;

    self->_documentToSearch = (UIPDFDocument *)a3;
    v6 = [(NSOperationQueue *)self->_searchQueue operations];
    documentToSearch = self->_documentToSearch;
    [(NSArray *)v6 makeObjectsPerformSelector:sel_setDocumentToSearch_ withObject:documentToSearch];
  }
}

- (BOOL)searching
{
  NSUInteger v3 = [(NSOperationQueue *)self->_searchQueue operationCount];
  if (v3) {
    LOBYTE(v3) = ![(UIWebPDFSearchController *)self paused];
  }
  return v3;
}

- (BOOL)paused
{
  return ![(NSOperationQueue *)self->_searchQueue isSuspended];
}

- (UIWebPDFSearchController)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIWebPDFSearchController;
  v2 = [(UIWebPDFSearchController *)&v5 init];
  NSUInteger v3 = v2;
  if (v2)
  {
    [(UIWebPDFSearchController *)v2 setResultLimit:101];
    [(UIWebPDFSearchController *)v3 setDocumentScale:1.0];
  }
  return v3;
}

- (void)dealloc
{
  [(UIWebPDFSearchController *)self cancel];
  [(UIWebPDFSearchController *)self setDocumentToSearch:0];
  [(UIWebPDFSearchController *)self setSearchString:0];
  v3.receiver = self;
  v3.super_class = (Class)UIWebPDFSearchController;
  [(UIWebPDFSearchController *)&v3 dealloc];
}

- (unint64_t)_actualStartingPageIndex
{
  unint64_t pageIndexWhenLimitHit = self->_pageIndexWhenLimitHit;
  unint64_t result = [(UIWebPDFSearchController *)self startingPageIndex];
  if (pageIndexWhenLimitHit > result) {
    return pageIndexWhenLimitHit;
  }
  return result;
}

- (void)search:(id)a3
{
  if (!-[NSString isEqualToString:](self->_searchString, "isEqualToString:"))
  {
    [(UIWebPDFSearchController *)self cancel];

    self->_searchString = (NSString *)a3;
  }
  if ([(UIWebPDFSearchController *)self searchDelegate]
    && [(UIWebPDFSearchController *)self documentToSearch]
    && [a3 length])
  {
    if (!self->_searchQueue)
    {
      objc_super v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
      self->_searchQueue = v5;
      [(NSOperationQueue *)v5 setMaxConcurrentOperationCount:1];
    }
    if (!self->_results) {
      self->_results = (NSMutableArray *)(id)[MEMORY[0x1E4F1CA48] array];
    }
    v6 = objc_alloc_init(UIWebPDFSearchOperation);
    [(UIWebPDFSearchOperation *)v6 setDocumentToSearch:[(UIWebPDFSearchController *)self documentToSearch]];
    [(UIWebPDFSearchOperation *)v6 setStartingPageIndex:[(UIWebPDFSearchController *)self _actualStartingPageIndex]];
    [(UIWebPDFSearchOperation *)v6 setResultLimit:[(UIWebPDFSearchController *)self resultLimit]];
    [(UIWebPDFSearchOperation *)v6 setNumberOfResultsToSkip:self->_pageIndexWhenLimitHit];
    [(UIWebPDFSearchOperation *)v6 setSearchString:a3];
    [(UIWebPDFSearchOperation *)v6 setSearchDelegate:self];
    [(UIWebPDFSearchController *)self documentScale];
    -[UIWebPDFSearchOperation setDocumentScale:](v6, "setDocumentScale:");
    self->_notifiedThatSearchBegin = 0;
    [(NSOperationQueue *)self->_searchQueue addOperation:v6];
  }
}

- (void)_clearSearchQueue
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v3 = [(NSOperationQueue *)self->_searchQueue operations];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setSearchDelegate:0];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(NSOperationQueue *)self->_searchQueue cancelAllOperations];

  self->_searchQueue = 0;
}

- (void)cancel
{
  self->_results = 0;
}

- (void)pause
{
}

- (void)resume
{
  [(NSOperationQueue *)self->_searchQueue setSuspended:0];
  searchString = self->_searchString;
  [(UIWebPDFSearchController *)self search:searchString];
}

- (void)searchDidBegin:(id)a3
{
  if (!self->_notifiedThatSearchBegin)
  {
    self->_notifiedThatSearchBegin = 1;
    if (objc_opt_respondsToSelector())
    {
      searchDelegate = self->searchDelegate;
      [(UIWebPDFSearchControllerDelegate *)searchDelegate searchDidBegin:self];
    }
  }
}

- (void)searchDidTimeOut:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    searchDelegate = self->searchDelegate;
    [(UIWebPDFSearchControllerDelegate *)searchDelegate searchDidTimeOut:self];
  }
}

- (void)searchWasCancelled:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    searchDelegate = self->searchDelegate;
    [(UIWebPDFSearchControllerDelegate *)searchDelegate searchWasCancelled:self];
  }
}

- (void)searchLimitHit:(id)a3
{
  self->_unint64_t pageIndexWhenLimitHit = [a3 currentPageIndex];
  self->_resultIndexWhenLimitHit = [a3 currentPageResultCount];
  if (objc_opt_respondsToSelector())
  {
    searchDelegate = self->searchDelegate;
    [(UIWebPDFSearchControllerDelegate *)searchDelegate searchLimitHit:self];
  }
}

- (void)searchDidFinish:(id)a3
{
  if (objc_opt_respondsToSelector()) {
    [(UIWebPDFSearchControllerDelegate *)self->searchDelegate searchDidFinish:self];
  }
  [(UIWebPDFSearchController *)self _clearSearchQueue];
  [(UIWebPDFSearchController *)self setSearchString:0];
}

- (void)search:(id)a3 hasPartialResults:(id)a4
{
  [(NSMutableArray *)self->_results addObjectsFromArray:a4];
  if (objc_opt_respondsToSelector())
  {
    searchDelegate = self->searchDelegate;
    [(UIWebPDFSearchControllerDelegate *)searchDelegate search:self hasPartialResults:a4];
  }
}

- (UIPDFDocument)documentToSearch
{
  return self->_documentToSearch;
}

- (UIWebPDFSearchControllerDelegate)searchDelegate
{
  return self->searchDelegate;
}

- (void)setSearchDelegate:(id)a3
{
  self->searchDelegate = (UIWebPDFSearchControllerDelegate *)a3;
}

- (unint64_t)startingPageIndex
{
  return self->startingPageIndex;
}

- (void)setStartingPageIndex:(unint64_t)a3
{
  self->startingPageIndex = a3;
}

- (double)documentScale
{
  return self->documentScale;
}

- (void)setDocumentScale:(double)a3
{
  self->documentScale = a3;
}

- (unint64_t)resultLimit
{
  return self->resultLimit;
}

- (void)setResultLimit:(unint64_t)a3
{
  self->resultLimit = a3;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
}

- (NSArray)results
{
  return &self->_results->super;
}

- (void)setResults:(id)a3
{
}

@end