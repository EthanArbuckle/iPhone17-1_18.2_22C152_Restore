@interface BKPageScrollerPageView
- (BKImageResizerDelegate)imageResizerDelegate;
- (BKPageNavigationDelegate)navigationDelegate;
- (BKPageScrollerPageView)initWithFrame:(CGRect)a3 pageNumber:(unint64_t)a4 navigationDelegate:(id)a5 thumbnailingDelegate:(id)a6 imageResizerDelegate:(id)a7;
- (BKPageScrollerThumbnailingDelegate)thumbnailingDelegate;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSOperation)_resizeOperation;
- (NSOperation)_thumbnailingOperation;
- (UIView)contentView;
- (id)snapshot;
- (int)scrollState;
- (void)_contentIsReady:(id)a3;
- (void)_exposeContentView;
- (void)_teardownContentView;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)setImageResizerDelegate:(id)a3;
- (void)setNavigationDelegate:(id)a3;
- (void)setScrollState:(int)a3;
- (void)setThumbnailingDelegate:(id)a3;
- (void)set_resizeOperation:(id)a3;
- (void)set_thumbnailingOperation:(id)a3;
- (void)teardown;
@end

@implementation BKPageScrollerPageView

- (BKPageScrollerPageView)initWithFrame:(CGRect)a3 pageNumber:(unint64_t)a4 navigationDelegate:(id)a5 thumbnailingDelegate:(id)a6 imageResizerDelegate:(id)a7
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v39.receiver = self;
  v39.super_class = (Class)BKPageScrollerPageView;
  v18 = -[BKPageScrollerPageView initWithFrame:](&v39, "initWithFrame:", x, y, width, height);
  v19 = v18;
  if (v18)
  {
    v18->_pageNumber = a4;
    objc_storeWeak((id *)&v18->_navigationDelegate, v15);
    objc_storeWeak((id *)&v19->_thumbnailingDelegate, v16);
    objc_storeWeak((id *)&v19->_imageResizerDelegate, v17);
    id WeakRetained = objc_loadWeakRetained((id *)&v19->_thumbnailingDelegate);

    if (WeakRetained)
    {
      v21 = [objc_alloc((Class)UIImageView) initWithFrame:CGPointZero.x, CGPointZero.y, width, height];
      thumbnailView = v19->_thumbnailView;
      v19->_thumbnailView = v21;

      v23 = +[UIColor whiteColor];
      [(UIImageView *)v19->_thumbnailView setBackgroundColor:v23];

      [(UIImageView *)v19->_thumbnailView setAutoresizingMask:18];
      [(BKPageScrollerPageView *)v19 addSubview:v19->_thumbnailView];
      objc_initWeak(&location, v19->_thumbnailView);
      objc_initWeak(&from, v19);
      CGSizeScaleToScreen();
      v25 = v24;
      v27 = v26;
      id v28 = objc_loadWeakRetained((id *)&v19->_thumbnailingDelegate);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_AABD0;
      v34[3] = &unk_1DD038;
      objc_copyWeak(&v35, &location);
      objc_copyWeak(v36, &from);
      v36[1] = v25;
      v36[2] = v27;
      [v28 thumbnailingGenerateImageForPageNumber:a4 size:v34 callbackBlock:^(UIImage *image, NSError *error) {
    *(double *)&v25 = image.size.width;
    *(double *)&v27 = image.size.height;
}];

      objc_destroyWeak(v36);
      objc_destroyWeak(&v35);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    else
    {
      id v29 = objc_loadWeakRetained((id *)&v19->_navigationDelegate);
      uint64_t v30 = [v29 contentViewControllerForPageNumber:v19->_pageNumber];
      contentViewController = v19->_contentViewController;
      v19->_contentViewController = (BKContentViewController *)v30;

      v32 = [(BKContentViewController *)v19->_contentViewController view];
      [(BKPageScrollerPageView *)v19 addSubview:v32];
    }
  }

  return v19;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:BKContentReadyNotification object:self->_contentViewController];

  v4.receiver = self;
  v4.super_class = (Class)BKPageScrollerPageView;
  [(BKPageScrollerPageView *)&v4 dealloc];
}

- (void)teardown
{
  v3 = [(BKPageScrollerPageView *)self _resizeOperation];
  [v3 cancel];

  [(BKPageScrollerPageView *)self set_resizeOperation:0];
  objc_super v4 = [(BKPageScrollerPageView *)self _thumbnailingOperation];
  [v4 cancel];

  [(BKPageScrollerPageView *)self set_thumbnailingOperation:0];
  objc_storeWeak((id *)&self->_navigationDelegate, 0);

  objc_storeWeak((id *)&self->_thumbnailingDelegate, 0);
}

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)BKPageScrollerPageView;
  [(BKPageScrollerPageView *)&v4 didMoveToSuperview];
  v3 = [(BKPageScrollerPageView *)self superview];

  if (!v3) {
    [(BKPageScrollerPageView *)self _teardownContentView];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  p_thumbnailingDelegate = &self->_thumbnailingDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailingDelegate);

  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)p_thumbnailingDelegate);
    [v8 thumbnailingContentSizeForPageNumber:self->_pageNumber];
    goto LABEL_6;
  }
  contentViewController = self->_contentViewController;
  if (contentViewController)
  {
    v12 = [(BKContentViewController *)contentViewController view];
    id v8 = v12;
    if (!v12)
    {
      BCReportAssertionFailureWithMessage();
      goto LABEL_7;
    }
    [v12 sizeThatFits:width, height];
LABEL_6:
    double width = v9;
    double height = v10;
LABEL_7:
  }
  double v13 = width;
  double v14 = height;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)BKPageScrollerPageView;
  [(BKPageScrollerPageView *)&v8 layoutSubviews];
  [(BKPageScrollerPageView *)self bounds];
  CGRect v10 = CGRectIntegral(v9);
  -[UIImageView setFrame:](self->_thumbnailView, "setFrame:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
  [(BKPageScrollerPageView *)self bounds];
  CGRect v12 = CGRectIntegral(v11);
  double x = v12.origin.x;
  double y = v12.origin.y;
  double width = v12.size.width;
  double height = v12.size.height;
  v7 = [(BKContentViewController *)self->_contentViewController view];
  [v7 setFrame:CGRectMake(x, y, width, height)];
}

- (id)snapshot
{
  v3 = [(UIImageView *)self->_thumbnailView image];

  if (v3) {
    [(UIImageView *)self->_thumbnailView image];
  }
  else {
  objc_super v4 = [(BKContentViewController *)self->_contentViewController snapshot];
  }

  return v4;
}

- (void)setScrollState:(int)a3
{
  if (self->_scrollState != a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailingDelegate);

    if (WeakRetained)
    {
      if (a3 == 3)
      {
        [(BKPageScrollerPageView *)self _teardownContentView];
      }
      else if (a3 == 2)
      {
        contentViewController = self->_contentViewController;
        if (contentViewController)
        {
          if (![(BKContentViewController *)contentViewController isLoading]) {
            [(BKPageScrollerPageView *)self _exposeContentView];
          }
        }
        else
        {
          id v7 = objc_loadWeakRetained((id *)&self->_navigationDelegate);
          objc_super v8 = [v7 contentViewControllerForPageNumber:self->_pageNumber];
          CGRect v9 = self->_contentViewController;
          self->_contentViewController = v8;

          CGRect v10 = [(BKContentViewController *)self->_contentViewController view];
          [(BKPageScrollerPageView *)self addSubview:v10];

          if ([(BKContentViewController *)self->_contentViewController isLoading])
          {
            CGRect v11 = [(BKContentViewController *)self->_contentViewController view];
            [v11 setAlpha:0.0];

            CGRect v12 = +[NSNotificationCenter defaultCenter];
            [v12 addObserver:self selector:"_contentIsReady:" name:BKContentReadyNotification object:self->_contentViewController];
          }
          else
          {
            [(BKPageScrollerPageView *)self _exposeContentView];
          }
          [(BKPageScrollerPageView *)self setNeedsLayout];
        }
      }
    }
    self->_scrollState = a3;
  }
}

- (UIView)contentView
{
  return (UIView *)[(BKContentViewController *)self->_contentViewController view];
}

- (void)_contentIsReady:(id)a3
{
  if (self->_scrollState == 2) {
    [(BKPageScrollerPageView *)self _exposeContentView];
  }
}

- (void)_exposeContentView
{
  dispatch_time_t v3 = dispatch_time(0, 100000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_AB4E4;
  block[3] = &unk_1DAB88;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_teardownContentView
{
  contentViewController = self->_contentViewController;
  if (contentViewController)
  {
    objc_super v4 = [(BKContentViewController *)contentViewController view];
    [v4 setAlpha:1.0];

    [(UIImageView *)self->_thumbnailView setAlpha:1.0];
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 removeObserver:self name:BKContentReadyNotification object:self->_contentViewController];

    if ([(BKContentViewController *)self->_contentViewController isViewLoaded])
    {
      v6 = [(BKContentViewController *)self->_contentViewController view];
      id v7 = [v6 superview];

      if (v7 == self)
      {
        objc_super v8 = [(BKContentViewController *)self->_contentViewController view];
        [v8 removeFromSuperview];
      }
    }
    CGRect v9 = self->_contentViewController;
    self->_contentViewController = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
    [WeakRetained pageNavigationDidRemoveContentForPageNumber:self->_pageNumber];
  }
}

- (int)scrollState
{
  return self->_scrollState;
}

- (BKPageNavigationDelegate)navigationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);

  return (BKPageNavigationDelegate *)WeakRetained;
}

- (void)setNavigationDelegate:(id)a3
{
}

- (BKPageScrollerThumbnailingDelegate)thumbnailingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailingDelegate);

  return (BKPageScrollerThumbnailingDelegate *)WeakRetained;
}

- (void)setThumbnailingDelegate:(id)a3
{
}

- (BKImageResizerDelegate)imageResizerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageResizerDelegate);

  return (BKImageResizerDelegate *)WeakRetained;
}

- (void)setImageResizerDelegate:(id)a3
{
}

- (NSOperation)_resizeOperation
{
  return self->__resizeOperation;
}

- (void)set_resizeOperation:(id)a3
{
}

- (NSOperation)_thumbnailingOperation
{
  return self->__thumbnailingOperation;
}

- (void)set_thumbnailingOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__thumbnailingOperation, 0);
  objc_storeStrong((id *)&self->__resizeOperation, 0);
  objc_destroyWeak((id *)&self->_imageResizerDelegate);
  objc_destroyWeak((id *)&self->_thumbnailingDelegate);
  objc_destroyWeak((id *)&self->_navigationDelegate);
  objc_storeStrong((id *)&self->_thumbnailView, 0);

  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end