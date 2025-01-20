@interface BKPaginationFactory
- (BKPaginationController)paginationController;
- (BKPaginationFactory)initWithPaginationController:(id)a3;
- (BOOL)isStyleRequiredForPagination;
- (id)lookupKeyForStyle:(id)a3 geometry:(id)a4;
- (void)addResultJob:(id)a3;
- (void)addResultSentinel:(id)a3;
@end

@implementation BKPaginationFactory

- (BKPaginationFactory)initWithPaginationController:(id)a3
{
  id v4 = a3;
  v5 = [(BKPaginationFactory *)self init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_paginationController, v4);
  }

  return v6;
}

- (id)lookupKeyForStyle:(id)a3 geometry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    CFStringRef v8 = [v6 summaryString];
  }
  else
  {
    CFStringRef v8 = @".";
  }
  v25 = (__CFString *)v8;
  v26 = v6;
  if ([v7 layout] == (char *)&dword_0 + 3)
  {
    CFStringRef v9 = @"-hscroll";
  }
  else
  {
    v10 = (char *)[v7 layout];
    CFStringRef v9 = @"-scroll";
    if (v10 != (unsigned char *)&dword_0 + 2) {
      CFStringRef v9 = &stru_1DF0D8;
    }
  }
  CFStringRef v24 = v9;
  v11 = +[NSUserDefaults standardUserDefaults];
  unsigned int v12 = [v11 BOOLForKey:@"BKUseOldFontStepsAndSpacing"];

  if (v12) {
    CFStringRef v13 = @"-oldFontSteps";
  }
  else {
    CFStringRef v13 = &stru_1DF0D8;
  }
  v14 = [(BKPaginationFactory *)self paginationController];
  v15 = [v14 bookDatabaseKey];
  v16 = [(BKPaginationFactory *)self paginationController];
  unsigned int v17 = [v16 isBookSample];
  [v7 layoutSize];
  v18 = NSStringFromCGSize(v28);
  unsigned int v19 = [v7 usePaginationLineGrid];
  v20 = [(BKPaginationFactory *)self paginationController];
  v21 = [v20 paginationRevision];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@-%d;%@;%@;%d;%@%@%@",
    v15,
    v17,
    v25,
    v18,
    v19,
    v21,
    v24,
  v22 = v13);

  return v22;
}

- (void)addResultSentinel:(id)a3
{
  id v4 = a3;
  v5 = [BKPaginationResultsOperation alloc];
  id v6 = [(BKPaginationFactory *)self paginationController];
  id v7 = [(BKPaginationFactory *)self paginationController];
  CFStringRef v8 = [v7 bookAnnotationProvider];
  id v11 = [(BKPaginationOperation *)v5 init:v4 paginationOperationController:v6 annotationProvider:v8];

  CFStringRef v9 = [(BKPaginationFactory *)self paginationController];
  v10 = [v9 resultsQueue];
  [v10 addOperation:v11];
}

- (void)addResultJob:(id)a3
{
  id v4 = a3;
  v5 = [BKPaginationResultsOperation alloc];
  id v6 = [(BKPaginationFactory *)self paginationController];
  id v7 = [(BKPaginationFactory *)self paginationController];
  CFStringRef v8 = [v7 bookAnnotationProvider];
  id v11 = [(BKPaginationOperation *)v5 init:v4 paginationOperationController:v6 annotationProvider:v8];

  CFStringRef v9 = [(BKPaginationFactory *)self paginationController];
  v10 = [v9 resultsQueue];
  [v10 addOperation:v11];
}

- (BOOL)isStyleRequiredForPagination
{
  return 1;
}

- (BKPaginationController)paginationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paginationController);

  return (BKPaginationController *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end