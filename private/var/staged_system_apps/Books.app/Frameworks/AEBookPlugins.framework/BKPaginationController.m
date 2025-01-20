@interface BKPaginationController
+ (id)newPaginationControllerForBook:(id)a3 delegate:(id)a4;
- (AEAnnotationProvider)bookAnnotationProvider;
- (AEBookInfo)book;
- (BKFlowingBookLayoutConfiguration)configuration;
- (BKNavigationHistory)navigationHistory;
- (BKPaginationController)init;
- (BKPaginationController)initWithBook:(id)a3 delegate:(id)a4;
- (BKPaginationControllerDelegate)delegate;
- (BOOL)bookShouldDisableOptimizeSpeed;
- (BOOL)isBookSample;
- (BOOL)workIsStillPending;
- (ContentStyle)style;
- (NSArray)bookmarkPageCounts;
- (NSManagedObjectID)bookObjectID;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (NSString)bookDatabaseKey;
- (NSString)bookLanguage;
- (_NSRange)pageRangeForAnnotation:(id)a3;
- (_NSRange)pageRangeForChapter:(id)a3;
- (_NSRange)pageRangeForChapterAtIndex:(unint64_t)a3;
- (_NSRange)pageRangeForChapterAtPageNumber:(int64_t)a3;
- (float)progress;
- (id)_lookupKey;
- (id)chapterArrayWithLookupKey:(id)a3;
- (id)chapterForPageNumber:(int64_t)a3;
- (id)documentPageCountForDocumentOrdinal:(int64_t)a3;
- (id)fetchBookmarkPageCounts;
- (id)hrefForChapterAtPageNumber:(int64_t)a3;
- (id)hrefForPageNumber:(int64_t)a3;
- (id)layoutQueue;
- (id)pageLocationForPageNumber:(int64_t)a3;
- (id)pageTitleForAnnotation:(id)a3;
- (id)pageTitleForChapter:(id)a3;
- (id)pageTitleForPageNumber:(int64_t)a3;
- (id)paginationArrayWithLookupKey:(id)a3;
- (id)paginationCompletedNotificationName;
- (id)paginationInfoForPageNumber:(int64_t)a3;
- (id)paginationRevision;
- (id)physicalPageTitlesForPageNumber:(int64_t)a3;
- (id)physicalPagesArrayWithLookupKey:(id)a3;
- (id)resultsQueue;
- (id)titleForChapterAtPageNumber:(int64_t)a3;
- (int)bookDirection;
- (int64_t)incrementBatchProgress;
- (int64_t)pageNumberForDocumentOrdinal:(int64_t)a3;
- (int64_t)pageNumberForLocation:(id)a3;
- (int64_t)pageTotal;
- (int64_t)pagesInDocumentOrdinal:(int64_t)a3;
- (int64_t)paginationRetryCount;
- (unint64_t)chapterIndexForHref:(id)a3;
- (unint64_t)chapterIndexForPageNumber:(int64_t)a3;
- (unint64_t)chapterIndexForPageNumber:(int64_t)a3 getFirstChapter:(BOOL)a4;
- (unint64_t)jobGeneration;
- (unint64_t)numberOfChapters;
- (unint64_t)physicalPageIndexForPageNumber:(int64_t)a3;
- (unint64_t)spineIndexInPackage;
- (void)_releaseData:(BOOL)a3;
- (void)abortCurrentBatch;
- (void)addPrepareJob:(id)a3;
- (void)addResultJob:(id)a3;
- (void)addResultSentinel:(id)a3;
- (void)batchEnded:(BOOL)a3;
- (void)cancelAllOperations;
- (void)dealloc;
- (void)destroyIvars;
- (void)managedObjectContextDidSave:(id)a3;
- (void)pause;
- (void)postPaginationLoadedNotification;
- (void)quit;
- (void)releasePaginationInfo;
- (void)repaginateWithStyle:(id)a3 geometry:(id)a4;
- (void)repaginateWithStyle:(id)a3 geometry:(id)a4 force:(BOOL)a5;
- (void)resume;
- (void)setBookDirection:(int)a3;
- (void)setBookmarkPageCounts:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setJobGeneration:(unint64_t)a3;
- (void)setNavigationHistory:(id)a3;
- (void)setOperationFactory:(id)a3;
- (void)setPaginationRetryCount:(int64_t)a3;
- (void)setStyle:(id)a3;
- (void)updatePaginationCache:(BOOL)a3;
- (void)updateProgress;
- (void)waitUntilAllOperationsAreFinished;
@end

@implementation BKPaginationController

- (BKPaginationController)init
{
  v5.receiver = self;
  v5.super_class = (Class)BKPaginationController;
  v2 = [(BKPaginationController *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"managedObjectContextDidSave:" name:NSManagedObjectContextDidSaveNotification object:0];

    v2->_pageTotal = 0x7FFFFFFFFFFFFFFFLL;
    v2->_paginationBatchSize = 0;
    v2->_paginationBatchProgress = 0;
    v2->_jobGeneration = 0;
  }
  return v2;
}

- (BKPaginationController)initWithBook:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(BKPaginationController *)self init];
  if (v9)
  {
    uint64_t v10 = [v7 objectID];
    bookObjectID = v9->_bookObjectID;
    v9->_bookObjectID = (NSManagedObjectID *)v10;

    objc_storeStrong((id *)&v9->_bookObject, a3);
    uint64_t v12 = [v7 databaseKey];
    bookDatabaseKey = v9->_bookDatabaseKey;
    v9->_bookDatabaseKey = (NSString *)v12;

    uint64_t v14 = [v7 bookLanguage];
    bookLanguage = v9->_bookLanguage;
    v9->_bookLanguage = (NSString *)v14;

    v9->_bookDirection = [v7 bkPageProgressionDirection];
    v16 = [v7 sampleContent];
    v9->_bookSample = [v16 BOOLValue];

    uint64_t v17 = [v7 managedObjectContext];
    primaryMOC = v9->_primaryMOC;
    v9->_primaryMOC = (NSManagedObjectContext *)v17;

    v9->_bookShouldDisableOptimizeSpeed = [v7 shouldDisableOptimizeSpeed];
    v19 = [v7 spineIndexInPackage];
    v9->_spineIndexInPackage = (unint64_t)[v19 unsignedIntegerValue];

    objc_storeWeak((id *)&v9->_delegate, v8);
  }

  return v9;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(BKPaginationController *)self setJobGeneration:(char *)[(BKPaginationController *)self jobGeneration] + 1];
  layoutQueue = self->_layoutQueue;
  self->_layoutQueue = 0;

  resultsQueue = self->_resultsQueue;
  self->_resultsQueue = 0;

  [(BKPaginationController *)self _releaseData:0];
  [(BKPaginationController *)self setOperationFactory:0];
  lookupKey = self->_lookupKey;
  self->_lookupKey = 0;

  primaryMOC = self->_primaryMOC;
  self->_primaryMOC = 0;

  paginationInfo = self->_paginationInfo;
  self->_paginationInfo = 0;

  chapterInfo = self->_chapterInfo;
  self->_chapterInfo = 0;

  physicalPagesInfo = self->_physicalPagesInfo;
  self->_physicalPagesInfo = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
  v11.receiver = self;
  v11.super_class = (Class)BKPaginationController;
  [(BKPaginationController *)&v11 dealloc];
}

- (id)paginationCompletedNotificationName
{
  return BKPaginationCompleteForBookNotification;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return [(NSManagedObjectContext *)self->_primaryMOC persistentStoreCoordinator];
}

- (AEAnnotationProvider)bookAnnotationProvider
{
  return [(AEBookInfo *)self->_bookObject annotationProvider];
}

- (void)destroyIvars
{
  paginationInfo = self->_paginationInfo;
  self->_paginationInfo = 0;

  chapterInfo = self->_chapterInfo;
  self->_chapterInfo = 0;

  physicalPagesInfo = self->_physicalPagesInfo;
  self->_physicalPagesInfo = 0;

  [(BKPaginationController *)self setBookmarkPageCounts:0];
  bookDatabaseKey = self->_bookDatabaseKey;
  self->_bookDatabaseKey = 0;

  lookupKey = self->_lookupKey;
  self->_lookupKey = 0;

  bookObjectID = self->_bookObjectID;
  self->_bookObjectID = 0;

  primaryMOC = self->_primaryMOC;
  self->_primaryMOC = 0;

  bookObject = self->_bookObject;
  self->_bookObject = 0;

  style = self->_style;
  self->_style = 0;

  operationFactory = self->_operationFactory;
  self->_operationFactory = 0;

  navigationHistory = self->_navigationHistory;
  self->_navigationHistory = 0;

  configuration = self->_configuration;
  self->_configuration = 0;
}

- (void)setOperationFactory:(id)a3
{
  objc_super v5 = (BKPaginationFactory *)a3;
  operationFactory = self->_operationFactory;
  p_operationFactory = &self->_operationFactory;
  if (operationFactory != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_operationFactory, a3);
    objc_super v5 = v8;
  }
}

- (void)postPaginationLoadedNotification
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:BKPaginationDataLoadedNotification object:self];

  v4 = _AEPaginationLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Posting PaginationLoaded", v5, 2u);
  }
}

- (void)batchEnded:(BOOL)a3
{
  if (a3)
  {
    objc_initWeak(&location, self);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_83A94;
    v3[3] = &unk_1DC8D8;
    objc_copyWeak(&v4, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

+ (id)newPaginationControllerForBook:(id)a3 delegate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[BKPaginationController alloc] initWithBook:v6 delegate:v5];

  unsigned int v8 = [v6 contentType];
  if (v8 == 2)
  {
    v9 = (EpubPaginationFactory *)v7;
    id v7 = 0;
    goto LABEL_5;
  }
  if (!v8)
  {
    v9 = [[EpubPaginationFactory alloc] initWithPaginationController:v7];
    [(BKPaginationController *)v7 setOperationFactory:v9];
LABEL_5:
  }
  return v7;
}

- (AEBookInfo)book
{
  return self->_bookObject;
}

- (void)cancelAllOperations
{
  [(BKPaginationController *)self setJobGeneration:(char *)[(BKPaginationController *)self jobGeneration] + 1];
  [(NSOperationQueue *)self->_layoutQueue cancelAllOperations];
  resultsQueue = self->_resultsQueue;

  [(NSOperationQueue *)resultsQueue cancelAllOperations];
}

- (void)abortCurrentBatch
{
  if (self->_resultsQueue)
  {
    [(BKPaginationController *)self setJobGeneration:(char *)[(BKPaginationController *)self jobGeneration] + 1];
    [(NSOperationQueue *)self->_resultsQueue cancelAllOperations];
    v3 = objc_alloc_init(BKPaginationAbortJob);
    [(BKPaginationController *)self addResultSentinel:v3];
  }
}

- (void)waitUntilAllOperationsAreFinished
{
  v3 = [(NSOperationQueue *)self->_layoutQueue operations];
  if ([v3 count])
  {

LABEL_4:
    [(BKPaginationController *)self performSelector:"waitUntilAllOperationsAreFinished" withObject:0 afterDelay:1.0];
    return;
  }
  id v4 = [(NSOperationQueue *)self->_resultsQueue operations];
  id v5 = [v4 count];

  if (v5) {
    goto LABEL_4;
  }
  [(NSOperationQueue *)self->_layoutQueue waitUntilAllOperationsAreFinished];
  resultsQueue = self->_resultsQueue;

  [(NSOperationQueue *)resultsQueue waitUntilAllOperationsAreFinished];
}

- (void)quit
{
  [(BKPaginationController *)self cancelAllOperations];
  [(BKPaginationFactory *)self->_operationFactory quit];
  [(BKPaginationController *)self abortCurrentBatch];
  [(BKPaginationController *)self destroyIvars];

  [(BKPaginationController *)self performSelectorOnMainThread:"waitUntilAllOperationsAreFinished" withObject:0 waitUntilDone:0];
}

- (id)documentPageCountForDocumentOrdinal:(int64_t)a3
{
  if (a3 < 0)
  {
    id v6 = 0;
  }
  else
  {
    id v4 = [objc_alloc((Class)NSNumber) initWithInteger:a3];
    id v5 = [(NSArray *)self->_paginationInfo bu_indexOfObjectWithValue:v4 forKeyPath:@"documentOrdinal"];
    if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = 0;
    }
    else
    {
      id v6 = [(NSArray *)self->_paginationInfo objectAtIndex:v5];
    }
  }

  return v6;
}

- (int64_t)pageNumberForDocumentOrdinal:(int64_t)a3
{
  v3 = [(BKPaginationController *)self documentPageCountForDocumentOrdinal:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 pageNumber];
    int64_t v6 = (int64_t)[v5 integerValue];
  }
  else
  {
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (int64_t)pagesInDocumentOrdinal:(int64_t)a3
{
  v3 = [(BKPaginationController *)self documentPageCountForDocumentOrdinal:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 pageCount];
    signed int v6 = [v5 intValue];

    int64_t v7 = v6;
  }
  else
  {
    int64_t v7 = -1;
  }

  return v7;
}

- (int64_t)pageTotal
{
  if (self->_pageTotal == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v3 = [(NSArray *)self->_paginationInfo count];
    id v4 = [(BKPaginationController *)self book];
    id v5 = [v4 linearDocumentCount];

    if ((id)v3 == v5)
    {
      signed int v6 = [(NSArray *)self->_paginationInfo lastObject];
      int64_t v7 = [v6 pageNumber];
      id v8 = [v7 integerValue];

      v9 = [v6 pageCount];
      id v10 = [v9 integerValue];

      self->_pageTotal = (int64_t)v10 + (void)v8 - 1;
    }
  }
  return self->_pageTotal;
}

- (void)repaginateWithStyle:(id)a3 geometry:(id)a4
{
}

- (void)repaginateWithStyle:(id)a3 geometry:(id)a4 force:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(BKPaginationController *)self _lookupKey];
  [(BKPaginationController *)self setStyle:v8];
  [(BKPaginationController *)self setConfiguration:v9];

  objc_super v11 = [(BKPaginationController *)self configuration];
  uint64_t v12 = [v11 environment];
  [v12 unfreeze];

  v13 = [(BKPaginationController *)self delegate];
  uint64_t v14 = [v13 environmentOverrideViewForPaginationController:self];

  if (v14)
  {
    v15 = _AEPaginationLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 138412290;
      v32 = v14;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Set an override view: %@", (uint8_t *)&v31, 0xCu);
    }

    v16 = [(BKPaginationController *)self configuration];
    uint64_t v17 = [v16 environment];
    [v17 setView:v14];
  }
  v18 = [(BKPaginationController *)self configuration];
  v19 = [v18 environment];
  [v19 freeze];

  v20 = _AEPaginationLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = [(BKPaginationController *)self configuration];
    int v31 = 138543618;
    v32 = v21;
    __int16 v33 = 2114;
    id v34 = v8;
    _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "\nCaptured configuration: %{public}@\nStyle:%{public}@\n", (uint8_t *)&v31, 0x16u);
  }
  [(BKPaginationController *)self releasePaginationInfo];
  if (v8
    || ![(BKPaginationFactory *)self->_operationFactory isStyleRequiredForPagination])
  {
    v22 = [(BKPaginationController *)self _lookupKey];
    v23 = _AEPaginationLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 138543362;
      v32 = v22;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "Repagination request made for:%{public}@.", (uint8_t *)&v31, 0xCu);
    }

    if (([v10 isEqualToString:v22] & 1) == 0)
    {
      v24 = _AEPaginationLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        int v31 = 138543618;
        v32 = v22;
        __int16 v33 = 2114;
        id v34 = v10;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "CurrentKey:%{public}@ != PreviousKey:%{public}@ Resetting count. #retryPagination", (uint8_t *)&v31, 0x16u);
      }

      [(BKPaginationController *)self setPaginationRetryCount:0];
    }
    [(BKPaginationController *)self updatePaginationCache:v5];
    [(BKPaginationController *)self setJobGeneration:(char *)[(BKPaginationController *)self jobGeneration] + 1];
    id v25 = [(BKPaginationJob *)[BKPaginationBatchJob alloc] init:[(BKPaginationController *)self jobGeneration]];
    [v25 setStyle:v8];
    [v25 setLookupKey:v22];
    v26 = [(BKPaginationController *)self bookDatabaseKey];
    [v25 setBookDatabaseKey:v26];

    v27 = [(BKPaginationController *)self configuration];
    [v27 contentLayoutSize];
    [v25 setPageSize:];

    v28 = [(BKPaginationController *)self navigationHistory];
    v29 = [v28 allObjects];
    [v25 setHistoryEntities:v29];

    v30 = [(BKPaginationController *)self configuration];
    [v25 setConfiguration:v30];

    [v25 setForce:v5];
    [(BKPaginationController *)self addPrepareJob:v25];
  }
  else
  {
    v22 = _AEPaginationLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v31) = 0;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_ERROR, "Aborting pagination because no style was provided.", (uint8_t *)&v31, 2u);
    }
  }
}

- (void)_releaseData:(BOOL)a3
{
  BOOL v3 = a3;
  paginationInfo = self->_paginationInfo;
  self->_paginationInfo = 0;

  chapterInfo = self->_chapterInfo;
  self->_chapterInfo = 0;

  physicalPagesInfo = self->_physicalPagesInfo;
  self->_physicalPagesInfo = 0;

  [(BKPaginationController *)self setBookmarkPageCounts:0];
  self->_pageTotal = 0x7FFFFFFFFFFFFFFFLL;
  lookupKey = self->_lookupKey;
  self->_lookupKey = 0;

  self->_paginationBatchSize = 0;
  self->_paginationBatchProgress = 0;
  if (v3)
  {
    [(BKPaginationController *)self abortCurrentBatch];
  }
}

- (void)releasePaginationInfo
{
}

- (void)pause
{
  if (!atomic_fetch_add(&self->_pauseCount, 1uLL)) {
    [(NSOperationQueue *)self->_layoutQueue setSuspended:1];
  }
}

- (void)resume
{
  if (atomic_fetch_add(&self->_pauseCount, 0xFFFFFFFFFFFFFFFFLL) == 1) {
    [(NSOperationQueue *)self->_layoutQueue setSuspended:0];
  }
}

- (id)paginationInfoForPageNumber:(int64_t)a3
{
  if (a3 >= 1 && (NSUInteger v5 = [(NSArray *)self->_paginationInfo count]) != 0)
  {
    uint64_t v6 = 0;
    while (1)
    {
      int64_t v7 = [(NSArray *)self->_paginationInfo objectAtIndex:v6];
      id v8 = [v7 pageNumber];
      id v9 = [v8 integerValue];

      id v10 = [v7 pageCount];
      id v11 = [v10 integerValue];

      if ((uint64_t)v9 <= a3 && (uint64_t)v9 + (uint64_t)v11 > a3) {
        break;
      }

      if (v5 == ++v6) {
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    int64_t v7 = 0;
  }

  return v7;
}

- (id)pageLocationForPageNumber:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x7FFFFFFFFFFFFFFDLL)
  {
    id v9 = 0;
  }
  else
  {
    id v4 = -[BKPaginationController paginationInfoForPageNumber:](self, "paginationInfoForPageNumber:");
    if (v4)
    {
      NSUInteger v5 = [BKPageLocation alloc];
      uint64_t v6 = [v4 documentOrdinal];
      id v7 = [v6 integerValue];
      id v8 = [v4 pageNumber];
      id v9 = -[BKPageLocation initWithOrdinal:andOffset:](v5, "initWithOrdinal:andOffset:", v7, a3 - (void)[v8 integerValue]);
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

- (int64_t)pageNumberForLocation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = -[BKPaginationController pagesInDocumentOrdinal:](self, "pagesInDocumentOrdinal:", [v5 ordinal]);
    if (v6 <= (unint64_t)[v5 pageOffset]
      || (int64_t v7 = -[BKPaginationController pageNumberForDocumentOrdinal:](self, "pageNumberForDocumentOrdinal:", [v5 ordinal]), (unint64_t)(v7 - 1) > 0x7FFFFFFFFFFFFFFDLL))
    {
      int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      int64_t v8 = (int64_t)[v5 pageOffset] + v7;
    }
  }
  else
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
    int64_t v8 = -[BKPaginationController pageNumberForDocumentOrdinal:](self, "pageNumberForDocumentOrdinal:", [v4 ordinal]);
  }

  return v8;
}

- (unint64_t)chapterIndexForPageNumber:(int64_t)a3
{
  return [(BKPaginationController *)self chapterIndexForPageNumber:a3 getFirstChapter:0];
}

- (unint64_t)chapterIndexForPageNumber:(int64_t)a3 getFirstChapter:(BOOL)a4
{
  if ((unint64_t)(a3 - 1) > 0x7FFFFFFFFFFFFFFDLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v7 = 0;
  unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    if (v7 >= [(NSArray *)self->_chapterInfo count]) {
      break;
    }
    id v9 = [(NSArray *)self->_chapterInfo objectAtIndex:v7];
    id v10 = [v9 pageNumber];
    signed int v11 = [v10 intValue];

    BOOL v12 = v11 == a3 && a4;
    if (v11 > a3) {
      break;
    }
    unint64_t v8 = v7++;
  }
  while (!v12);
  return v8;
}

- (unint64_t)numberOfChapters
{
  return [(NSArray *)self->_chapterInfo count];
}

- (unint64_t)physicalPageIndexForPageNumber:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x7FFFFFFFFFFFFFFDLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v5 = 0;
  uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    unint64_t v7 = v6;
    if (v5 >= [(NSArray *)self->_physicalPagesInfo count]) {
      break;
    }
    unint64_t v8 = [(NSArray *)self->_physicalPagesInfo objectAtIndex:v5];
    id v9 = [v8 pageNumber];
    id v10 = [v9 integerValue];

    uint64_t v6 = v5++;
  }
  while ((uint64_t)v10 <= a3);
  return v7;
}

- (unint64_t)chapterIndexForHref:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4 && [v4 length])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = self->_chapterInfo;
    unint64_t v7 = (char *)[(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      unint64_t v8 = 0;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        id v10 = 0;
        signed int v11 = &v7[(void)v8];
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          BOOL v12 = [*(id *)(*((void *)&v16 + 1) + 8 * (void)v10) href:(void)v16];
          unsigned __int8 v13 = [v12 isEqualToString:v5];

          if (v13)
          {

            unint64_t v14 = (unint64_t)&v10[(void)v8];
            goto LABEL_14;
          }
          ++v10;
        }
        while (v7 != v10);
        unint64_t v7 = (char *)[(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        unint64_t v8 = v11;
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:

  return v14;
}

- (id)physicalPageTitlesForPageNumber:(int64_t)a3
{
  physicalPagesInfo = self->_physicalPagesInfo;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_853A0;
  v14[3] = &unk_1DC9E0;
  v14[4] = a3;
  uint64_t v6 = [(NSArray *)physicalPagesInfo indexesOfObjectsWithOptions:3 passingTest:v14];
  if ([v6 count])
  {
    if (!v6) {
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v7 = [(BKPaginationController *)self physicalPageIndexForPageNumber:a3];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v8 = 0;
    }
    else {
      unint64_t v8 = v7;
    }
    uint64_t v9 = +[NSIndexSet indexSetWithIndex:v8];

    uint64_t v6 = (void *)v9;
    if (!v9) {
      goto LABEL_10;
    }
  }
  id v10 = [v6 lastIndex];
  if (v10 < (id)[(NSArray *)self->_physicalPagesInfo count])
  {
    signed int v11 = [(NSArray *)self->_physicalPagesInfo objectsAtIndexes:v6];
    BOOL v12 = [v11 valueForKey:@"name"];

    goto LABEL_11;
  }
LABEL_10:
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (id)chapterForPageNumber:(int64_t)a3
{
  unint64_t v4 = [(BKPaginationController *)self chapterIndexForPageNumber:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = [(NSArray *)self->_chapterInfo objectAtIndex:v4];
  }

  return v5;
}

- (id)titleForChapterAtPageNumber:(int64_t)a3
{
  BOOL v3 = [(BKPaginationController *)self chapterForPageNumber:a3];
  unint64_t v4 = [v3 name];

  return v4;
}

- (id)hrefForChapterAtPageNumber:(int64_t)a3
{
  BOOL v3 = [(BKPaginationController *)self chapterForPageNumber:a3];
  unint64_t v4 = [v3 href];

  return v4;
}

- (id)hrefForPageNumber:(int64_t)a3
{
  BOOL v3 = [(BKPaginationController *)self paginationInfoForPageNumber:a3];
  unint64_t v4 = [v3 href];

  return v4;
}

- (_NSRange)pageRangeForChapterAtIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_chapterInfo count] <= a3)
  {
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v5 = [(NSArray *)self->_chapterInfo objectAtIndex:a3];
    if (a3 + 1 >= [(NSArray *)self->_chapterInfo count])
    {
      uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      if ([(BKPaginationController *)self pageTotal] != 0x7FFFFFFFFFFFFFFFLL)
      {
        signed int v11 = [v5 pageNumber];
        uint64_t v8 = (uint64_t)[v11 integerValue];

        uint64_t v10 = [(BKPaginationController *)self pageTotal] - v8 + 1;
      }
    }
    else
    {
      uint64_t v6 = -[NSArray objectAtIndex:](self->_chapterInfo, "objectAtIndex:");
      unint64_t v7 = [v5 pageNumber];
      uint64_t v8 = (uint64_t)[v7 integerValue];

      uint64_t v9 = [v6 pageNumber];
      uint64_t v10 = (uint64_t)[v9 integerValue] - v8;
    }
  }
  NSUInteger v12 = v8;
  NSUInteger v13 = v10;
  result.length = v13;
  result.id location = v12;
  return result;
}

- (_NSRange)pageRangeForChapter:(id)a3
{
  unint64_t v4 = [a3 href];
  unint64_t v5 = [(BKPaginationController *)self chapterIndexForHref:v4];

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v6 = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    NSUInteger v6 = (NSUInteger)[(BKPaginationController *)self pageRangeForChapterAtIndex:v5];
  }
  result.length = v7;
  result.id location = v6;
  return result;
}

- (_NSRange)pageRangeForChapterAtPageNumber:(int64_t)a3
{
  unint64_t v4 = [(BKPaginationController *)self chapterIndexForPageNumber:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v5 = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    NSUInteger v5 = (NSUInteger)[(BKPaginationController *)self pageRangeForChapterAtIndex:v4];
  }
  result.length = v6;
  result.id location = v5;
  return result;
}

- (_NSRange)pageRangeForAnnotation:(id)a3
{
  unint64_t v4 = [a3 annotationUuid];
  NSUInteger v5 = +[NSPredicate predicateWithFormat:@"annotationUuid == %@", v4];

  NSUInteger v6 = [(BKPaginationController *)self fetchBookmarkPageCounts];
  NSUInteger v7 = [v6 filteredArrayUsingPredicate:v5];
  if ([v7 count])
  {
    uint64_t v8 = [v7 objectAtIndex:0];
    uint64_t v9 = [v8 pageNumber];
    uint64_t v10 = (uint64_t)[v9 unsignedIntegerValue];
    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v12 = v10;
  NSUInteger v13 = v11;
  result.length = v13;
  result.id location = v12;
  return result;
}

- (id)pageTitleForPageNumber:(int64_t)a3
{
  if ([(NSArray *)self->_physicalPagesInfo count])
  {
    physicalPagesInfo = self->_physicalPagesInfo;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_85A00;
    v10[3] = &unk_1DC9E0;
    v10[4] = a3;
    id v6 = [(NSArray *)physicalPagesInfo indexOfObjectWithOptions:3 passingTest:v10];
    if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      NSUInteger v7 = 0;
    }
    else
    {
      uint64_t v8 = [(NSArray *)self->_physicalPagesInfo objectAtIndex:v6];
      NSUInteger v7 = [v8 name];
    }
  }
  else
  {
    NSUInteger v7 = +[NSString stringWithFormat:@"%ld", a3];
  }

  return v7;
}

- (id)pageTitleForAnnotation:(id)a3
{
  id v4 = [(BKPaginationController *)self pageRangeForAnnotation:a3];
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v5 = 0;
  }
  else
  {
    NSUInteger v5 = [(BKPaginationController *)self pageTitleForPageNumber:v4];
  }

  return v5;
}

- (id)pageTitleForChapter:(id)a3
{
  id v4 = [a3 href];
  unint64_t v5 = [(BKPaginationController *)self chapterIndexForHref:v4];

  chapterInfo = self->_chapterInfo;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [(NSArray *)chapterInfo count];
    uint64_t v8 = [(BKPaginationController *)self book];
    uint64_t v9 = [v8 chapters];
    uint64_t v10 = [v9 allObjects];
    id v11 = [v10 count];

    [(BKPaginationController *)self progress];
    NSUInteger v12 = 0;
    if (v13 >= 1.0 && v7 != v11)
    {
      unint64_t v14 = _AEPaginationLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = +[NSNumber numberWithUnsignedInteger:v7];
        long long v16 = +[NSNumber numberWithUnsignedInteger:v11];
        int v20 = 138543618;
        v21 = v15;
        __int16 v22 = 2114;
        v23 = v16;
      }
      NSUInteger v12 = 0;
    }
  }
  else
  {
    long long v17 = [(NSArray *)chapterInfo objectAtIndex:v5];
    long long v18 = [v17 pageNumber];
    NSUInteger v12 = -[BKPaginationController pageTitleForPageNumber:](self, "pageTitleForPageNumber:", [v18 integerValue]);
  }

  return v12;
}

- (id)_lookupKey
{
  operationFactory = self->_operationFactory;
  id v4 = [(BKPaginationController *)self style];
  unint64_t v5 = [(BKPaginationController *)self configuration];
  id v6 = [(BKPaginationFactory *)operationFactory lookupKeyForStyle:v4 geometry:v5];

  return v6;
}

- (int64_t)incrementBatchProgress
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t v3 = v2->_paginationBatchProgress + 1;
  v2->_paginationBatchProgress = v3;
  objc_sync_exit(v2);

  [(BKPaginationController *)v2 performSelectorOnMainThread:"updateProgress" withObject:0 waitUntilDone:0];
  return v3;
}

- (float)progress
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t paginationBatchSize = v2->_paginationBatchSize;
  uint64_t paginationBatchProgress = v2->_paginationBatchProgress;
  objc_sync_exit(v2);

  if (paginationBatchSize < 1) {
    return 0.0;
  }
  float result = fmaxf((float)paginationBatchProgress / (float)paginationBatchSize, 0.0);
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

- (BOOL)workIsStillPending
{
  int64_t v3 = [(BKPaginationController *)self prepareQueue];
  if ([v3 operationCount])
  {
    char v4 = 1;
  }
  else
  {
    unint64_t v5 = [(BKPaginationController *)self layoutQueue];
    if ([v5 operationCount])
    {
      char v4 = 1;
    }
    else
    {
      id v6 = [(BKPaginationController *)self resultsQueue];
      char v4 = [v6 operationCount] != 0;
    }
  }

  return v4;
}

- (void)updateProgress
{
  [(BKPaginationController *)self willChangeValueForKey:@"progress"];

  [(BKPaginationController *)self didChangeValueForKey:@"progress"];
}

- (void)updatePaginationCache:(BOOL)a3
{
  uint64_t v5 = [(BKPaginationController *)self book];
  if (!v5) {
    goto LABEL_12;
  }
  id v6 = (void *)v5;
  id v7 = [(BKPaginationController *)self book];
  uint64_t v8 = [v7 managedObjectContext];

  if (v8)
  {
    uint64_t v9 = [(BKPaginationController *)self _lookupKey];
    uint64_t v10 = [(BKPaginationController *)self paginationArrayWithLookupKey:v9];
    if (![v10 count])
    {
      id v11 = _AEPaginationLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 138543362;
        v26 = v9;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Did not find existing pagination results for LookupKey:%{public}@", (uint8_t *)&v25, 0xCu);
      }
    }
    if (!-[NSArray isEqualToArray:](self->_paginationInfo, "isEqualToArray:", v10) && [v10 count])
    {
      objc_storeStrong((id *)&self->_lookupKey, v9);
      paginationInfo = self->_paginationInfo;
      self->_paginationInfo = 0;

      chapterInfo = self->_chapterInfo;
      self->_chapterInfo = 0;

      physicalPagesInfo = self->_physicalPagesInfo;
      self->_physicalPagesInfo = 0;

      self->_pageTotal = 0x7FFFFFFFFFFFFFFFLL;
      v15 = [(BKPaginationController *)self book];
      id v16 = [v15 linearDocumentCount];

      if ((uint64_t)v16 >= 1)
      {
        self->_uint64_t paginationBatchSize = (int64_t)v16;
        if (a3) {
          id v17 = 0;
        }
        else {
          id v17 = [v10 count];
        }
        self->_uint64_t paginationBatchProgress = (int64_t)v17;
        [(BKPaginationController *)self updateProgress];
      }
      int v20 = [(BKPaginationController *)self chapterArrayWithLookupKey:v9];
      v21 = self->_chapterInfo;
      self->_chapterInfo = v20;
      __int16 v22 = v20;

      objc_storeStrong((id *)&self->_paginationInfo, v10);
      v23 = [(BKPaginationController *)self physicalPagesArrayWithLookupKey:v9];
      v24 = self->_physicalPagesInfo;
      self->_physicalPagesInfo = v23;

      [(BKPaginationController *)self postPaginationLoadedNotification];
    }
  }
  else
  {
LABEL_12:
    long long v18 = [(BKPaginationController *)self bookObjectID];

    if (!v18) {
      return;
    }
    uint64_t v9 = _AEPaginationLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      long long v19 = [(BKPaginationController *)self bookObjectID];
      int v25 = 138412290;
      v26 = v19;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "We have no book. Was it deleted? %@", (uint8_t *)&v25, 0xCu);
    }
  }
}

- (void)managedObjectContextDidSave:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:NSDeletedObjectsKey];

  if ([v6 count])
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v30;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(v7);
          }
          NSUInteger v12 = [*(id *)(*((void *)&v29 + 1) + 8 * i) objectID];
          float v13 = [(BKPaginationController *)self bookObjectID];
          unsigned __int8 v14 = [v12 isEqual:v13];

          if (v14)
          {
            char v15 = 1;
            goto LABEL_12;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    char v15 = 0;
LABEL_12:
  }
  else
  {
    char v15 = 0;
  }
  id v16 = [v4 userInfo];
  id v17 = [v16 objectForKey:NSInsertedObjectsKey];

  id v18 = [v17 count];
  if ((v15 & 1) == 0 && v18)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v19 = v17;
    int v20 = (char *)[v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v26;
      while (2)
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v19);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            LOBYTE(v20) = 1;
            goto LABEL_26;
          }
        }
        int v20 = (char *)[v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }
LABEL_26:

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_86430;
    v23[3] = &unk_1DBE90;
    char v24 = (char)v20;
    v23[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v23);
  }
}

- (id)chapterArrayWithLookupKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BKPaginationController *)self book];
  id v6 = [v5 managedObjectContext];

  id v7 = +[NSPredicate predicateWithFormat:@"lookupKey ==[n] %@", v4];

  id v8 = [v6 entity:@"BKChapterPageCount" withPredicate:v7 sortBy:@"pageNumber" ascending:1 fetchLimit:0];

  return v8;
}

- (id)paginationArrayWithLookupKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BKPaginationController *)self book];
  id v6 = [v5 managedObjectContext];

  id v7 = +[NSPredicate predicateWithFormat:@"lookupKey ==[n] %@", v4];

  id v8 = [v6 entity:@"BKDocumentPageCount" withPredicate:v7 sortBy:@"documentOrdinal" ascending:1 fetchLimit:0];

  return v8;
}

- (id)physicalPagesArrayWithLookupKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BKPaginationController *)self book];
  id v6 = [v5 managedObjectContext];

  id v7 = +[NSPredicate predicateWithFormat:@"lookupKey ==[n] %@", v4];

  id v8 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"pageNumber" ascending:1];
  id v9 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"name" ascending:1];
  id v10 = [objc_alloc((Class)NSArray) initWithObjects:v8, v9, 0];
  id v11 = [v6 entity:@"BKPhysicalPageCount" withPredicate:v7 sortDescriptors:v10 fetchLimit:0 prefetchRelationships:0];

  return v11;
}

- (id)fetchBookmarkPageCounts
{
  int64_t v3 = [(BKPaginationController *)self bookmarkPageCounts];

  if (!v3)
  {
    id v4 = [(BKPaginationController *)self _lookupKey];
    uint64_t v5 = [(BKPaginationController *)self book];
    id v6 = [v5 managedObjectContext];

    id v7 = +[NSPredicate predicateWithFormat:@"lookupKey ==[n] %@", v4];
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    id v10 = [v6 entity:v9 withPredicate:v7 sortBy:@"pageNumber" ascending:1 fetchLimit:0];
    [(BKPaginationController *)self setBookmarkPageCounts:v10];
  }

  return [(BKPaginationController *)self bookmarkPageCounts];
}

- (id)resultsQueue
{
  resultsQueue = self->_resultsQueue;
  if (!resultsQueue)
  {
    id v4 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    uint64_t v5 = self->_resultsQueue;
    self->_resultsQueue = v4;

    [(NSOperationQueue *)self->_resultsQueue setMaxConcurrentOperationCount:1];
    resultsQueue = self->_resultsQueue;
  }

  return resultsQueue;
}

- (id)layoutQueue
{
  layoutQueue = self->_layoutQueue;
  if (!layoutQueue)
  {
    id v4 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    uint64_t v5 = self->_layoutQueue;
    self->_layoutQueue = v4;

    [(NSOperationQueue *)self->_layoutQueue setMaxConcurrentOperationCount:1];
    layoutQueue = self->_layoutQueue;
  }

  return layoutQueue;
}

- (void)addPrepareJob:(id)a3
{
}

- (void)addResultSentinel:(id)a3
{
}

- (void)addResultJob:(id)a3
{
}

- (id)paginationRevision
{
  v2 = (void *)qword_22B5A0;
  if (!qword_22B5A0)
  {
    id v3 = objc_alloc((Class)NSString);
    id v4 = +[AEAssetEngine appInfoMgr];
    uint64_t v5 = [v4 osBuildVersion];
    id v6 = [v3 initWithFormat:@"%@-%d", v5, 14];
    id v7 = (void *)qword_22B5A0;
    qword_22B5A0 = (uint64_t)v6;

    v2 = (void *)qword_22B5A0;
  }

  return v2;
}

- (NSManagedObjectID)bookObjectID
{
  return self->_bookObjectID;
}

- (NSString)bookDatabaseKey
{
  return self->_bookDatabaseKey;
}

- (NSString)bookLanguage
{
  return self->_bookLanguage;
}

- (int)bookDirection
{
  return self->_bookDirection;
}

- (void)setBookDirection:(int)a3
{
  self->_bookDirection = a3;
}

- (BOOL)isBookSample
{
  return self->_bookSample;
}

- (ContentStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (unint64_t)jobGeneration
{
  return self->_jobGeneration;
}

- (void)setJobGeneration:(unint64_t)a3
{
  self->_jobGeneration = a3;
}

- (BKNavigationHistory)navigationHistory
{
  return (BKNavigationHistory *)objc_getProperty(self, a2, 168, 1);
}

- (void)setNavigationHistory:(id)a3
{
}

- (BKFlowingBookLayoutConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NSArray)bookmarkPageCounts
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBookmarkPageCounts:(id)a3
{
}

- (BOOL)bookShouldDisableOptimizeSpeed
{
  return self->_bookShouldDisableOptimizeSpeed;
}

- (unint64_t)spineIndexInPackage
{
  return self->_spineIndexInPackage;
}

- (BKPaginationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKPaginationControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)paginationRetryCount
{
  return self->_paginationRetryCount;
}

- (void)setPaginationRetryCount:(int64_t)a3
{
  self->_paginationRetryCount = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_navigationHistory, 0);
  objc_storeStrong((id *)&self->_operationFactory, 0);
  objc_storeStrong((id *)&self->_primaryMOC, 0);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_storeStrong((id *)&self->_resultsQueue, 0);
  objc_storeStrong((id *)&self->_physicalPagesInfo, 0);
  objc_storeStrong((id *)&self->_bookmarkPageCounts, 0);
  objc_storeStrong((id *)&self->_chapterInfo, 0);
  objc_storeStrong((id *)&self->_paginationInfo, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_lookupKey, 0);
  objc_storeStrong((id *)&self->_bookLanguage, 0);
  objc_storeStrong((id *)&self->_bookDatabaseKey, 0);
  objc_storeStrong((id *)&self->_bookObject, 0);

  objc_storeStrong((id *)&self->_bookObjectID, 0);
}

@end