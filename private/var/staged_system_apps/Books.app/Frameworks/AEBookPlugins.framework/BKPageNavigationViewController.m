@interface BKPageNavigationViewController
- (BKPageNavigationDelegate)delegate;
- (BKPageNavigationViewController)init;
- (BOOL)ignoreNextGesture;
- (BOOL)isZoomedOut;
- (NSArray)viewControllers;
- (UIPageViewControllerDataSource)dataSource;
- (_NSRange)visiblePages;
- (id)_imageViewForPageContentImage:(id)a3;
- (id)contentView;
- (id)viewForLiveResize;
- (int64_t)_leftPageNumberForOffset:(int64_t)a3 usingPageCount:(int64_t)a4;
- (int64_t)_pageNumberForOffset:(int64_t)a3 onGreaterSide:(BOOL)a4 usingPageCount:(int64_t)a5;
- (int64_t)_rightPageNumberForOffset:(int64_t)a3 usingPageCount:(int64_t)a4;
- (int64_t)leftPageNumberForSinglePageOffset:(int64_t)a3;
- (int64_t)leftPageNumberForSpreadPageOffset:(int64_t)a3;
- (int64_t)pageCount;
- (int64_t)pageOffset;
- (int64_t)rightPageNumberForSinglePageOffset:(int64_t)a3;
- (int64_t)rightPageNumberForSpreadPageOffset:(int64_t)a3;
- (void)adjustToNewSize:(CGSize)a3;
- (void)contentViewImage:(BOOL)a3 afterScreenUpdates:(BOOL)a4 completion:(id)a5;
- (void)contentViewImage:(BOOL)a3 completion:(id)a4;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIgnoreNextGesture:(BOOL)a3;
- (void)setPageCount:(int64_t)a3;
- (void)setPageOffset:(int64_t)a3;
- (void)turnToNextPage;
- (void)turnToNextPageWithDelta:(unint64_t)a3;
- (void)turnToPreviousPage;
- (void)turnToPreviousPageWithDelta:(unint64_t)a3;
@end

@implementation BKPageNavigationViewController

- (BKPageNavigationViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)BKPageNavigationViewController;
  result = [(BKPageNavigationViewController *)&v3 init];
  if (result) {
    result->_pageOffset = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (NSArray)viewControllers
{
  return 0;
}

- (_NSRange)visiblePages
{
  NSUInteger v2 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)contentView
{
  return 0;
}

- (void)contentViewImage:(BOOL)a3 completion:(id)a4
{
  v7 = (void (**)(id, void *))objc_retainBlock(a4);
  if (v7)
  {
    v5 = [(BKPageNavigationViewController *)self contentView];
    v6 = [v5 im_snapshotInContext];
    v7[2](v7, v6);
  }
}

- (void)contentViewImage:(BOOL)a3 afterScreenUpdates:(BOOL)a4 completion:(id)a5
{
  v8 = (void (**)(id, void *))objc_retainBlock(a5);
  if (v8)
  {
    v6 = [(BKPageNavigationViewController *)self contentView];
    v7 = [v6 im_snapshotInContext];
    v8[2](v8, v7);
  }
}

- (BOOL)isZoomedOut
{
  return 1;
}

- (void)turnToNextPage
{
}

- (void)turnToPreviousPage
{
}

- (void)turnToNextPageWithDelta:(unint64_t)a3
{
  int64_t v5 = [(BKViewController *)self layoutDirection];
  int64_t v6 = [(BKPageNavigationViewController *)self pageOffset];
  if (v5 == 1) {
    unint64_t v7 = -(uint64_t)a3;
  }
  else {
    unint64_t v7 = a3;
  }

  [(BKPageNavigationViewController *)self turnToPageNumber:v6 + v7 + 1 animated:1];
}

- (void)turnToPreviousPageWithDelta:(unint64_t)a3
{
  int64_t v5 = [(BKViewController *)self layoutDirection];
  int64_t v6 = [(BKPageNavigationViewController *)self pageOffset];
  if (v5 == 1) {
    unint64_t v7 = a3;
  }
  else {
    unint64_t v7 = -(uint64_t)a3;
  }

  [(BKPageNavigationViewController *)self turnToPageNumber:v6 + v7 + 1 animated:1];
}

- (void)adjustToNewSize:(CGSize)a3
{
  NSUInteger v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", a3.width, a3.height, @"Do not call method", "-[BKPageNavigationViewController adjustToNewSize:]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (id)viewForLiveResize
{
  NSUInteger v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[BKPageNavigationViewController viewForLiveResize]");
  id v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v2 userInfo:0];

  objc_exception_throw(v3);
}

- (BKPageNavigationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKPageNavigationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIPageViewControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (UIPageViewControllerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (int64_t)pageCount
{
  return self->_pageCount;
}

- (void)setPageCount:(int64_t)a3
{
  self->_pageCount = a3;
}

- (int64_t)pageOffset
{
  return self->_pageOffset;
}

- (void)setPageOffset:(int64_t)a3
{
  self->_pageOffset = a3;
}

- (BOOL)ignoreNextGesture
{
  return self->_ignoreNextGesture;
}

- (void)setIgnoreNextGesture:(BOOL)a3
{
  self->_ignoreNextGesture = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);

  objc_destroyWeak((id *)&self->_delegate);
}

- (id)_imageViewForPageContentImage:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)UIImageView) initWithImage:v3];

  [v4 setContentMode:1];

  return v4;
}

- (int64_t)_pageNumberForOffset:(int64_t)a3 onGreaterSide:(BOOL)a4 usingPageCount:(int64_t)a5
{
  int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  int64_t v6 = (a3 & 1) + a3;
  if (a3 > a5) {
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (a3 >= 1) {
    int64_t v5 = v6;
  }
  int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v8 = 1;
  if (a3) {
    uint64_t v8 = 2;
  }
  uint64_t v9 = v8 + a3;
  if (a3 > a5) {
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (a3 >= 0) {
    int64_t v7 = v9;
  }
  if (a4) {
    return v7;
  }
  else {
    return v5;
  }
}

- (int64_t)_leftPageNumberForOffset:(int64_t)a3 usingPageCount:(int64_t)a4
{
  BOOL v7 = (char *)[(BKViewController *)self layoutDirection] == (char *)&dword_0 + 1;

  return [(BKPageNavigationViewController *)self _pageNumberForOffset:a3 onGreaterSide:v7 usingPageCount:a4];
}

- (int64_t)_rightPageNumberForOffset:(int64_t)a3 usingPageCount:(int64_t)a4
{
  BOOL v7 = [(BKViewController *)self layoutDirection] == 0;

  return [(BKPageNavigationViewController *)self _pageNumberForOffset:a3 onGreaterSide:v7 usingPageCount:a4];
}

- (int64_t)leftPageNumberForSpreadPageOffset:(int64_t)a3
{
  int64_t v5 = (char *)[(BKPageNavigationViewController *)self pageCount] - 1;

  return [(BKPageNavigationViewController *)self _leftPageNumberForOffset:a3 usingPageCount:v5];
}

- (int64_t)rightPageNumberForSpreadPageOffset:(int64_t)a3
{
  int64_t v5 = (char *)[(BKPageNavigationViewController *)self pageCount] - 1;

  return [(BKPageNavigationViewController *)self _rightPageNumberForOffset:a3 usingPageCount:v5];
}

- (int64_t)leftPageNumberForSinglePageOffset:(int64_t)a3
{
  int64_t v5 = [(BKPageNavigationViewController *)self pageCount];

  return [(BKPageNavigationViewController *)self _leftPageNumberForOffset:a3 usingPageCount:v5];
}

- (int64_t)rightPageNumberForSinglePageOffset:(int64_t)a3
{
  int64_t v5 = [(BKPageNavigationViewController *)self pageCount];

  return [(BKPageNavigationViewController *)self _rightPageNumberForOffset:a3 usingPageCount:v5];
}

@end