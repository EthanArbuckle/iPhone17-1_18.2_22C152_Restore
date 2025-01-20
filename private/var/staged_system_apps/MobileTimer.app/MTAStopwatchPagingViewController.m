@interface MTAStopwatchPagingViewController
- (BOOL)_canShowWhileLocked;
- (MTAStopwatchPagingViewControllerDelegate)delegate;
- (NSArray)pages;
- (UIScrollView)scrollView;
- (unint64_t)currentPage;
- (void)loadView;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setCurrentPage:(unint64_t)a3;
- (void)setCurrentPage:(unint64_t)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setPages:(id)a3;
- (void)setScrollView:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MTAStopwatchPagingViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  v11.receiver = self;
  v11.super_class = (Class)MTAStopwatchPagingViewController;
  [(MTAStopwatchPagingViewController *)&v11 loadView];
  v3 = objc_opt_new();
  [(MTAStopwatchPagingViewController *)self setScrollView:v3];

  v4 = [(MTAStopwatchPagingViewController *)self scrollView];
  [v4 setPagingEnabled:1];

  v5 = [(MTAStopwatchPagingViewController *)self scrollView];
  [v5 setShowsHorizontalScrollIndicator:0];

  v6 = [(MTAStopwatchPagingViewController *)self scrollView];
  [v6 setAutoresizesSubviews:0];

  v7 = [(MTAStopwatchPagingViewController *)self scrollView];
  [v7 setDelegate:self];

  v8 = [(MTAStopwatchPagingViewController *)self view];
  [v8 setAutoresizesSubviews:0];

  v9 = [(MTAStopwatchPagingViewController *)self view];
  v10 = [(MTAStopwatchPagingViewController *)self scrollView];
  [v9 addSubview:v10];
}

- (void)setPages:(id)a3
{
  v5 = (NSArray *)a3;
  pages = self->_pages;
  if (pages != v5)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v7 = pages;
    id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * i) removeFromSuperview];
        }
        id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v9);
    }

    objc_storeStrong((id *)&self->_pages, a3);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v12 = self->_pages;
    id v13 = [(NSArray *)v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v20 + 1) + 8 * (void)j);
          [v17 setAutoresizesSubviews:0, v20];
          [v17 setAutoresizingMask:0];
          v18 = [(MTAStopwatchPagingViewController *)self scrollView];
          [v18 addSubview:v17];
        }
        id v14 = [(NSArray *)v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v14);
    }

    v19 = [(MTAStopwatchPagingViewController *)self view];
    [v19 setNeedsLayout];
  }
}

- (void)setCurrentPage:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  self->_currentPage = a3;
  double v6 = (double)a3;
  v7 = [(MTAStopwatchPagingViewController *)self scrollView];
  [v7 bounds];
  double v9 = v8 * v6;

  id v10 = [(MTAStopwatchPagingViewController *)self scrollView];
  [v10 setContentOffset:v4 animated:v9];
}

- (void)setCurrentPage:(unint64_t)a3
{
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)MTAStopwatchPagingViewController;
  [(MTAStopwatchPagingViewController *)&v13 viewWillLayoutSubviews];
  v3 = [(MTAStopwatchPagingViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(MTAStopwatchPagingViewController *)self scrollView];
  [v12 setFrame:v5, v7, v9, v11];
}

- (void)viewDidLayoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)MTAStopwatchPagingViewController;
  [(MTAStopwatchPagingViewController *)&v31 viewDidLayoutSubviews];
  v3 = [(MTAStopwatchPagingViewController *)self view];
  unsigned __int8 v4 = [v3 mtui_isRTL];

  double v5 = [(MTAStopwatchPagingViewController *)self scrollView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  double v10 = [(MTAStopwatchPagingViewController *)self pages];
  double v11 = v10;
  if (v4) {
    [v10 reverseObjectEnumerator];
  }
  else {
  v12 = [v10 objectEnumerator];
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v14)
  {
    id v15 = v14;
    double x = CGPointZero.x;
    double y = CGPointZero.y;
    uint64_t v18 = *(void *)v28;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v27 + 1) + 8 * i) setFrame:x, y, v7, v9, (void)v27];
        double x = v7 + x;
      }
      id v15 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v15);
  }

  long long v20 = [(MTAStopwatchPagingViewController *)self pages];
  double v21 = v7 * (double)(unint64_t)[v20 count];
  long long v22 = [(MTAStopwatchPagingViewController *)self scrollView];
  [v22 setContentSize:v21, v9];

  if (v4)
  {
    long long v23 = [(MTAStopwatchPagingViewController *)self pages];
    id v24 = [v23 count];
    unint64_t v25 = (unint64_t)v24 + ~[(MTAStopwatchPagingViewController *)self currentPage];
  }
  else
  {
    unint64_t v25 = [(MTAStopwatchPagingViewController *)self currentPage];
  }
  long long v26 = [(MTAStopwatchPagingViewController *)self scrollView];
  [v26 setContentOffset:v7 * (double)v25, 0.0];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)MTAStopwatchPagingViewController;
  id v7 = a4;
  -[MTAStopwatchPagingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100049550;
  v8[3] = &unk_1000A1400;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v7 = a3;
  double v8 = [(MTAStopwatchPagingViewController *)self view];
  unsigned int v9 = [v8 mtui_isRTL];

  double x = a5->x;
  [v7 bounds];
  double v12 = v11;

  unint64_t v13 = vcvtad_u64_f64(x / v12);
  if (v9)
  {
    id v14 = [(MTAStopwatchPagingViewController *)self pages];
    unint64_t v13 = (unint64_t)[v14 count] + ~v13;
  }
  if (v13 != self->_currentPage)
  {
    self->_currentPage = v13;
    id v15 = [(MTAStopwatchPagingViewController *)self delegate];
    [v15 stopwatchPagingViewController:self didPage:self->_currentPage];
  }
}

- (MTAStopwatchPagingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTAStopwatchPagingViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)pages
{
  return self->_pages;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (unint64_t)currentPage
{
  return self->_currentPage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_pages, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end