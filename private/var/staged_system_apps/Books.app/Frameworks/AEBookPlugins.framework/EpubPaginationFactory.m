@interface EpubPaginationFactory
- (BOOL)isStyleRequiredForPagination;
- (EpubPaginationFactory)initWithPaginationController:(id)a3;
- (id)lookupKeyForStyle:(id)a3 geometry:(id)a4;
- (void)addPrepareJob:(id)a3;
- (void)dealloc;
- (void)quit;
@end

@implementation EpubPaginationFactory

- (EpubPaginationFactory)initWithPaginationController:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EpubPaginationFactory;
  v5 = [(BKPaginationFactory *)&v13 initWithPaginationController:v4];
  if (v5)
  {
    v6 = [v4 book];
    v5->_isFixedLayout = [v6 isFixedLayout];

    v7 = [v4 book];
    v5->_respectsPageBreaks = [v7 obeyPageBreaks];

    v8 = [v4 book];
    uint64_t v9 = [v8 respectImageSizeClass];
    respectImageSizeClass = v5->_respectImageSizeClass;
    v5->_respectImageSizeClass = (NSString *)v9;

    v11 = [v4 book];
    v5->_respectImageSizeClassIsPrefix = [v11 respectImageSizeClassIsPrefix];
  }
  return v5;
}

- (id)lookupKeyForStyle:(id)a3 geometry:(id)a4
{
  if (self->_isFixedLayout)
  {
    v5 = [(BKPaginationFactory *)self paginationController];
    v6 = [v5 bookDatabaseKey];
    v7 = [(BKPaginationFactory *)self paginationController];
    v8 = [v7 paginationRevision];
    uint64_t v9 = +[NSString stringWithFormat:@"%@-%@", v6, v8];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)EpubPaginationFactory;
    uint64_t v9 = [(BKPaginationFactory *)&v11 lookupKeyForStyle:a3 geometry:a4];
  }

  return v9;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)EpubPaginationFactory;
  [(EpubPaginationFactory *)&v4 dealloc];
}

- (void)quit
{
  v2.receiver = self;
  v2.super_class = (Class)EpubPaginationFactory;
  [(BKPaginationFactory *)&v2 quit];
}

- (void)addPrepareJob:(id)a3
{
  id v4 = a3;
  if (!self->_isFixedLayout)
  {
    v5 = _BookEPUBLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[EpubPaginationFactory addPrepareJob:]");
      int v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_FAULT, "Only Pagination Jobs for fixed layout content should go through %@", (uint8_t *)&v14, 0xCu);
    }
  }
  v7 = [BKPictureBookPaginationOperation alloc];
  v8 = [(BKPaginationFactory *)self paginationController];
  uint64_t v9 = [(BKPaginationFactory *)self paginationController];
  v10 = [v9 bookAnnotationProvider];
  id v11 = [(BKPaginationOperation *)v7 init:v4 paginationOperationController:v8 annotationProvider:v10];

  v12 = [(BKPaginationFactory *)self paginationController];
  objc_super v13 = [v12 prepareQueue];
  [v13 addOperation:v11];
}

- (BOOL)isStyleRequiredForPagination
{
  return !self->_isFixedLayout;
}

- (void).cxx_destruct
{
}

@end