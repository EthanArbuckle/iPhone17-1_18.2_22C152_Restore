@interface SKUISlideshowItemViewController
- (BOOL)_gestureRecognizer:(id)a3 canBePreventedByGestureRecognizer:(id)a4;
- (BOOL)_gestureRecognizer:(id)a3 canPreventGestureRecognizer:(id)a4;
- (SKUIClientContext)clientContext;
- (SKUISlideshowImageScrollView)imageScrollView;
- (SKUISlideshowItemViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SKUISlideshowItemViewControllerDelegate)delegate;
- (UIImage)itemImage;
- (id)_newLoadingView;
- (id)viewForZoomingInScrollView:(id)a3;
- (int64_t)indexInCollection;
- (unint64_t)supportedInterfaceOrientations;
- (void)_pinchGestureAction:(id)a3;
- (void)dealloc;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIndexInCollection:(int64_t)a3;
- (void)setItemImage:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation SKUISlideshowItemViewController

- (SKUISlideshowItemViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUISlideshowItemViewController initWithNibName:bundle:]();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUISlideshowItemViewController;
  v8 = [(SKUISlideshowItemViewController *)&v15 initWithNibName:v6 bundle:v7];
  v9 = v8;
  if (v8)
  {
    v8->_indexInCollection = 0;
    v10 = objc_alloc_init(SKUISlideshowImageScrollView);
    imageScrollView = v9->_imageScrollView;
    v9->_imageScrollView = v10;

    [(SKUISlideshowImageScrollView *)v9->_imageScrollView setDelegate:v9];
    [(SKUISlideshowImageScrollView *)v9->_imageScrollView setAutoresizingMask:18];
    v12 = v9->_imageScrollView;
    v13 = [MEMORY[0x1E4FB1618] clearColor];
    [(SKUISlideshowImageScrollView *)v12 setBackgroundColor:v13];

    v9->_zoomingGestureThresholdBroken = 0;
    v9->_lastContentOffset = (CGPoint)*MEMORY[0x1E4F1DAD8];
    v9->_lastZoomScale = 0.0;
  }

  return v9;
}

- (void)dealloc
{
  [(SKUISlideshowImageScrollView *)self->_imageScrollView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUISlideshowItemViewController;
  [(SKUISlideshowItemViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)SKUISlideshowItemViewController;
  [(SKUISlideshowItemViewController *)&v11 viewDidLoad];
  objc_super v3 = [(SKUISlideshowItemViewController *)self view];
  imageScrollView = self->_imageScrollView;
  [v3 bounds];
  -[SKUISlideshowImageScrollView setFrame:](imageScrollView, "setFrame:");
  [v3 addSubview:self->_imageScrollView];
  v5 = [(SKUISlideshowItemViewController *)self itemImage];

  if (!v5)
  {
    loadingView = self->_loadingView;
    if (!loadingView)
    {
      id v7 = [(SKUISlideshowItemViewController *)self _newLoadingView];
      v8 = self->_loadingView;
      self->_loadingView = v7;

      v9 = self->_loadingView;
      [v3 center];
      -[UIView setCenter:](v9, "setCenter:");
      loadingView = self->_loadingView;
    }
    [v3 addSubview:loadingView];
  }
  v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1AA0]) initWithTarget:self action:sel__pinchGestureAction_];
  [v10 setDelegate:self];
  [(SKUISlideshowImageScrollView *)self->_imageScrollView addGestureRecognizer:v10];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUISlideshowItemViewController;
  [(SKUISlideshowItemViewController *)&v4 viewDidDisappear:a3];
  [(SKUISlideshowImageScrollView *)self->_imageScrollView resetZoomScale];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 26;
}

- (UIImage)itemImage
{
  return [(SKUISlideshowImageScrollView *)self->_imageScrollView image];
}

- (void)setItemImage:(id)a3
{
  -[SKUISlideshowImageScrollView setImage:](self->_imageScrollView, "setImage:");
  loadingView = self->_loadingView;
  if (a3)
  {
    if (!loadingView) {
      return;
    }
    [(UIView *)loadingView removeFromSuperview];
    id v6 = self->_loadingView;
    self->_loadingView = 0;
  }
  else
  {
    if (!loadingView)
    {
      id v7 = [(SKUISlideshowItemViewController *)self _newLoadingView];
      v8 = self->_loadingView;
      self->_loadingView = v7;
    }
    v9 = [(SKUISlideshowItemViewController *)self view];
    [(UIView *)v9 addSubview:self->_loadingView];
    id v6 = v9;
  }
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return [(SKUISlideshowImageScrollView *)self->_imageScrollView imageView];
}

- (BOOL)_gestureRecognizer:(id)a3 canBePreventedByGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)_gestureRecognizer:(id)a3 canPreventGestureRecognizer:(id)a4
{
  return 0;
}

- (id)_newLoadingView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  objc_super v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];

  v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:1];
  [v3 addSubview:v5];
  [v5 startAnimating];
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  clientContext = self->_clientContext;
  if (clientContext) {
    [(SKUIClientContext *)clientContext localizedStringForKey:@"SCREENSHOTS_LOADING"];
  }
  else {
  v8 = +[SKUIClientContext localizedStringForKey:@"SCREENSHOTS_LOADING" inBundles:0];
  }
  [v6 setText:v8];

  v9 = [MEMORY[0x1E4FB1618] whiteColor];
  [v6 setTextColor:v9];

  v10 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:12.0];
  [v6 setFont:v10];

  objc_super v11 = [MEMORY[0x1E4FB1618] clearColor];
  [v6 setBackgroundColor:v11];

  [v6 sizeToFit];
  [v5 bounds];
  CGFloat v13 = v12 + 5.0;
  [v5 bounds];
  double v15 = v14 * 0.5;
  [v6 bounds];
  CGFloat v17 = v15 - v16 * 0.5;
  [v6 bounds];
  double v19 = v18;
  [v6 bounds];
  CGFloat v21 = v20;
  objc_msgSend(v6, "setFrame:", v13, v17, v19);
  [v3 addSubview:v6];
  v27.origin.x = v13;
  v27.origin.y = v17;
  v27.size.width = v19;
  v27.size.height = v21;
  double MaxX = CGRectGetMaxX(v27);
  [v5 frame];
  double MaxY = CGRectGetMaxY(v28);
  v29.origin.x = v13;
  v29.origin.y = v17;
  v29.size.width = v19;
  v29.size.height = v21;
  double v24 = CGRectGetMaxY(v29);
  if (MaxY >= v24) {
    double v25 = MaxY;
  }
  else {
    double v25 = v24;
  }
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, MaxX, v25);

  return v3;
}

- (void)_pinchGestureAction:(id)a3
{
  id v12 = a3;
  [(SKUISlideshowImageScrollView *)self->_imageScrollView contentOffset];
  self->_lastContentOffset.x = v4;
  self->_lastContentOffset.y = v5;
  [(SKUISlideshowImageScrollView *)self->_imageScrollView zoomScale];
  self->_lastZoomScale = v6;
  if ([v12 state] == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained slideshowItemViewControllerDidBeginPinchGesture:self];
LABEL_6:

    goto LABEL_7;
  }
  if ([v12 state] == 2)
  {
    [(SKUISlideshowImageScrollView *)self->_imageScrollView zoomScale];
    double v9 = v8;
    [(SKUISlideshowImageScrollView *)self->_imageScrollView minimumZoomScale];
    double v11 = v9 / v10;
    if (v9 / v10 != 1.0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained slideshowItemViewControllerDidDismissWithPinchGesture:self ratio:(v11 + -0.550000012) / -0.0999999642 + 1.0];
      goto LABEL_6;
    }
  }
LABEL_7:
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SKUISlideshowItemViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUISlideshowItemViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SKUISlideshowImageScrollView)imageScrollView
{
  return self->_imageScrollView;
}

- (int64_t)indexInCollection
{
  return self->_indexInCollection;
}

- (void)setIndexInCollection:(int64_t)a3
{
  self->_indexInCollection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageScrollView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loadingView, 0);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithNibName:bundle:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISlideshowItemViewController initWithNibName:bundle:]";
}

@end