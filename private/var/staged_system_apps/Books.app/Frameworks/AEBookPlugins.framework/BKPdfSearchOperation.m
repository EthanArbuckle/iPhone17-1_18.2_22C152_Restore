@interface BKPdfSearchOperation
- (BKPdfSearchOperation)init;
- (BOOL)_doSearch;
- (BOOL)_doSearchWithString:(id)a3;
- (BOOL)_hasSearchableCharacters:(id)a3;
- (BOOL)dropDocument;
- (BOOL)isPastLimit;
- (BOOL)requiresMainThread;
- (PDFDocument)pdfDocument;
- (unint64_t)currentPageIndex;
- (unint64_t)foundResults;
- (unint64_t)numberOfDocumentPages;
- (unint64_t)remainingPages;
- (unint64_t)resultIndex;
- (void)_clearDocumentIfNeeded;
- (void)cancel;
- (void)dealloc;
- (void)didReceiveMemoryWarning:(id)a3;
- (void)setCurrentPageIndex:(unint64_t)a3;
- (void)setDropDocument:(BOOL)a3;
- (void)setFoundResults:(unint64_t)a3;
- (void)setNumberOfDocumentPages:(unint64_t)a3;
- (void)setPdfDocument:(id)a3;
- (void)setResultIndex:(unint64_t)a3;
@end

@implementation BKPdfSearchOperation

- (BKPdfSearchOperation)init
{
  v5.receiver = self;
  v5.super_class = (Class)BKPdfSearchOperation;
  v2 = [(BKSearchOperation *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"didReceiveMemoryWarning:" name:UIApplicationDidReceiveMemoryWarningNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BKPdfSearchOperation;
  [(BKSearchOperation *)&v4 dealloc];
}

- (void)didReceiveMemoryWarning:(id)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_dropDocument = 1;
  objc_sync_exit(obj);
}

- (PDFDocument)pdfDocument
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_pdfDocument)
  {
    v3 = +[AEPdfCache sharedInstance];
    objc_super v4 = [(BKSearchOperation *)v2 bookURL];
    id v5 = [v3 copyCacheObjectForURL:v4];

    uint64_t v6 = [v5 document];
    pdfDocument = v2->_pdfDocument;
    v2->_pdfDocument = (PDFDocument *)v6;

    v2->_numberOfDocumentPages = [(PDFDocument *)v2->_pdfDocument pageCount];
  }
  objc_sync_exit(v2);

  v8 = v2->_pdfDocument;

  return v8;
}

- (void)cancel
{
  v3 = [(BKPdfSearchOperation *)self pdfDocument];
  [v3 cancelFindString];

  v4.receiver = self;
  v4.super_class = (Class)BKPdfSearchOperation;
  [(BKSearchOperation *)&v4 cancel];
}

- (void)_clearDocumentIfNeeded
{
  if (self->_dropDocument)
  {
    obj = self;
    objc_sync_enter(obj);
    if (self->_dropDocument)
    {
      pdfDocument = obj->_pdfDocument;
      obj->_pdfDocument = 0;

      self->_dropDocument = 0;
    }
    objc_sync_exit(obj);
  }
}

- (BOOL)requiresMainThread
{
  return 0;
}

- (BOOL)isPastLimit
{
  return self->_foundResults > 0x63;
}

- (unint64_t)remainingPages
{
  return self->_numberOfDocumentPages - self->_currentPageIndex;
}

- (BOOL)_hasSearchableCharacters:(id)a3
{
  id v3 = a3;
  objc_super v4 = (char *)[v3 length];
  unsigned int v5 = [@"\uFFFD" characterAtIndex:0];
  if (v4)
  {
    unsigned int v6 = v5;
    v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    do
    {
      unsigned int v11 = [v3 characterAtIndex:v7];
      if (v11) {
        uint64_t v12 = v8;
      }
      else {
        uint64_t v12 = v8 + 1;
      }
      if (v11 == 32) {
        uint64_t v13 = v10 + 1;
      }
      else {
        uint64_t v13 = v10;
      }
      if (v11 == 32) {
        uint64_t v12 = v8;
      }
      if (v11 == v6) {
        ++v9;
      }
      else {
        uint64_t v10 = v13;
      }
      if (v11 != v6) {
        uint64_t v8 = v12;
      }
      ++v7;
    }
    while (v4 != v7);
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v9 = 0;
    uint64_t v8 = 0;
  }
  if (v9 + v8) {
    BOOL v14 = v9 + v10 + v8 >= (unint64_t)v4;
  }
  else {
    BOOL v14 = 0;
  }
  BOOL v15 = !v14;

  return v15;
}

- (BOOL)_doSearchWithString:(id)a3
{
  id v4 = a3;
  if ([v4 length]
    && ([(BKPdfSearchOperation *)self pdfDocument],
        unsigned int v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5)
    && self->_currentPageIndex < self->_numberOfDocumentPages)
  {
    unsigned int v6 = &objc_release_x26_ptr;
    +[NSDate timeIntervalSinceReferenceDate];
    double v8 = v7;
    if (self->_currentPageIndex)
    {
      uint64_t v9 = [(BKSearchOperation *)self lastSavedSearchResult];

      if (v9)
      {
        objc_opt_class();
        uint64_t v10 = [(BKSearchOperation *)self lastSavedSearchResult];
        uint64_t v9 = BUDynamicCast();
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    if ([(BKPdfSearchOperation *)self isCancelled])
    {
      BOOL v11 = 0;
    }
    else
    {
      uint64_t v13 = 0;
      while (1)
      {
        if (self->super._isDone) {
          goto LABEL_34;
        }
        [(BKSearchOperation *)self timeOut];
        if (v14 != 0.0)
        {
          [v6[450] timeIntervalSinceReferenceDate];
          double v16 = v15 - v8;
          [(BKSearchOperation *)self timeOut];
          if (v16 > v17) {
            break;
          }
        }
        if (self->_foundResults >= 0x64)
        {
          self->super._isDone = 1;
          [(BKSearchOperation *)self setStartSearchFromIndex:self->_currentPageIndex];
          [(BKSearchOperation *)self setLastSavedSearchResult:v9];
          v38 = _AESearchLog();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            v39 = +[NSNumber numberWithUnsignedInteger:self->_currentPageIndex];
            *(_DWORD *)buf = 138412290;
            v43 = v39;
            v40 = "Search: Max results hit %@";
            goto LABEL_29;
          }
LABEL_30:

LABEL_34:
          BOOL v11 = 0;
          goto LABEL_35;
        }
        [v6[450] timeIntervalSinceReferenceDate];
        if (v18 - v8 > 0.4)
        {
          [(BKSearchOperation *)self setStartSearchFromIndex:self->_currentPageIndex];
          [(BKSearchOperation *)self setLastSavedSearchResult:v9];
          v38 = _AESearchLog();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            v39 = +[NSNumber numberWithUnsignedInteger:self->_currentPageIndex];
            *(_DWORD *)buf = 138412290;
            v43 = v39;
            v40 = "Search: update partial results %@";
LABEL_29:
            _os_log_impl(&dword_0, v38, OS_LOG_TYPE_DEFAULT, v40, buf, 0xCu);
          }
          goto LABEL_30;
        }
        v19 = [(BKPdfSearchOperation *)self pdfDocument];
        v20 = [v19 findString:v4 fromSelection:v9 withOptions:1];

        if (!v20)
        {
          v41 = _AESearchLog();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v41, OS_LOG_TYPE_DEFAULT, "Search: end of document reached", buf, 2u);
          }

          self->super._isDone = 1;
          [(BKSearchOperation *)self setHavePartialResults:0];
          uint64_t v9 = 0;
          goto LABEL_34;
        }
        id v21 = v4;
        v22 = v13;
        uint64_t v9 = v20;
        v23 = [v20 pages];
        v24 = [v23 lastObject];
        v25 = [(BKPdfSearchOperation *)self pdfDocument];
        id v26 = [v25 indexForPage:v24];

        self->_currentPageIndex = (unint64_t)v26;
        v27 = _AESearchLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[BKPDFModernBookViewController pageNumberForPageIndex:v26]);
          v28 = (BKPDFSearchResult *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v43 = v28;
          _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "Search: found result on page %@", buf, 0xCu);
        }
        v29 = [v9 string];
        id v30 = [v9 copy];

        [v30 extendSelectionForLineBoundaries];
        v31 = objc_alloc_init(BKPDFSearchResult);
        id v4 = v21;
        [(BKSearchResult *)v31 setSearchString:v21];
        [(BKSearchResult *)v31 setOrdinal:self->super._ordinal];
        [(BKPDFSearchResult *)v31 setSelection:v9];
        v32 = [v30 string];
        [(BKSearchResult *)v31 setText:v32];

        v33 = [(BKSearchResult *)v31 text];
        id v34 = [v33 rangeOfString:v29];
        -[BKSearchResult setSearchStringRange:](v31, "setSearchStringRange:", v34, v35);

        [(BKSearchResult *)v31 setPageOffset:self->_currentPageIndex];
        v36 = +[BKPDFLocation locationForSelection:v30 offset:[(BKSearchResult *)v31 pageOffset]];
        [(BKSearchResult *)v31 setLocation:v36];

        [(NSMutableArray *)self->super._results addObject:v31];
        ++self->_foundResults;
        v37 = _AESearchLog();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v43 = v31;
          _os_log_impl(&dword_0, v37, OS_LOG_TYPE_DEFAULT, "Search: result %@", buf, 0xCu);
        }

        [(BKSearchOperation *)self setHavePartialResults:1];
        uint64_t v13 = v30;
        unsigned int v6 = &objc_release_x26_ptr;
        if ([(BKPdfSearchOperation *)self isCancelled])
        {
          BOOL v11 = 0;
          uint64_t v13 = v30;
          goto LABEL_35;
        }
      }
      [(BKPdfSearchOperation *)self cancel];
      BOOL v11 = 1;
LABEL_35:
    }
  }
  else
  {
    BOOL v11 = 0;
    self->super._isDone = 1;
  }

  return v11;
}

- (BOOL)_doSearch
{
  id v3 = [(BKSearchOperation *)self searchString];
  id v4 = +[NSMutableString stringWithString:v3];

  if ([(BKPdfSearchOperation *)self _hasSearchableCharacters:v4])
  {
    unsigned int v5 = +[NSCharacterSet characterSetWithCharactersInString:@"\uFFFD"];
    unsigned int v6 = [(BKSearchOperation *)self searchString];
    id v7 = [v6 rangeOfCharacterFromSet:v5 options:4];
    uint64_t v9 = v8;

    while (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [v4 deleteCharactersInRange:v7, v9];
      if (!v7) {
        break;
      }
      uint64_t v10 = [(BKSearchOperation *)self searchString];
      id v7 = [v10 rangeOfCharacterFromSet:v5 options:4 range:0];
      uint64_t v9 = v11;
    }
    BOOL v12 = [(BKPdfSearchOperation *)self _doSearchWithString:v4];
    [(BKPdfSearchOperation *)self _clearDocumentIfNeeded];
  }
  else
  {
    BOOL v12 = 0;
    self->super._isDone = 1;
  }

  return v12;
}

- (unint64_t)currentPageIndex
{
  return self->_currentPageIndex;
}

- (void)setCurrentPageIndex:(unint64_t)a3
{
  self->_currentPageIndex = a3;
}

- (unint64_t)numberOfDocumentPages
{
  return self->_numberOfDocumentPages;
}

- (void)setNumberOfDocumentPages:(unint64_t)a3
{
  self->_numberOfDocumentPages = a3;
}

- (void)setPdfDocument:(id)a3
{
}

- (unint64_t)foundResults
{
  return self->_foundResults;
}

- (void)setFoundResults:(unint64_t)a3
{
  self->_foundResults = a3;
}

- (unint64_t)resultIndex
{
  return self->_resultIndex;
}

- (void)setResultIndex:(unint64_t)a3
{
  self->_resultIndex = a3;
}

- (BOOL)dropDocument
{
  return self->_dropDocument;
}

- (void)setDropDocument:(BOOL)a3
{
  self->_dropDocument = a3;
}

- (void).cxx_destruct
{
}

@end