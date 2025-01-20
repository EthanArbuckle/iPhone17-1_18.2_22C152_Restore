@interface FullscreenImageViewController
- (BOOL)_canShowWhileLocked;
- (FullscreenImageViewController)initWithCoder:(id)a3;
- (FullscreenImageViewController)initWithImage:(id)a3 scrollable:(BOOL)a4;
- (FullscreenImageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (FullscreenImageViewController)initWithView:(id)a3 scrollable:(BOOL)a4;
- (UIView)contentView;
- (id)viewForZoomingInScrollView:(id)a3;
- (int64_t)preferredStatusBarStyle;
- (void)_close:(id)a3;
- (void)_updateMaxZoomScale;
- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)zoomToPoint:(id)a3;
@end

@implementation FullscreenImageViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (FullscreenImageViewController)initWithImage:(id)a3 scrollable:(BOOL)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FullscreenImageViewController;
  v8 = [(FullscreenImageViewController *)&v12 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_image, a3);
    v9->_isScrollable = a4;
    v10 = v9;
  }

  return v9;
}

- (FullscreenImageViewController)initWithView:(id)a3 scrollable:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FullscreenImageViewController;
  v8 = [(FullscreenImageViewController *)&v11 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_contentView, a3);
    v9->_isScrollable = a4;
  }

  return v9;
}

- (FullscreenImageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return [(FullscreenImageViewController *)self initWithImage:0 scrollable:1];
}

- (FullscreenImageViewController)initWithCoder:(id)a3
{
  return [(FullscreenImageViewController *)self initWithImage:0 scrollable:1];
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)viewDidLoad
{
  v72.receiver = self;
  v72.super_class = (Class)FullscreenImageViewController;
  [(FullscreenImageViewController *)&v72 viewDidLoad];
  v3 = +[UIColor blackColor];
  v4 = [(FullscreenImageViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = v5;

  [(UIScrollView *)self->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIScrollView *)self->_scrollView setDelegate:self];
  [(UIScrollView *)self->_scrollView setDecelerationRate:0.850000024];
  [(UIScrollView *)self->_scrollView setMaximumZoomScale:3.0];
  [(UIScrollView *)self->_scrollView setMinimumZoomScale:1.0];
  id v7 = [(FullscreenImageViewController *)self view];
  [v7 addSubview:self->_scrollView];

  v8 = [(UIScrollView *)self->_scrollView topAnchor];
  v9 = [(FullscreenImageViewController *)self view];
  v10 = [v9 topAnchor];
  objc_super v11 = [v8 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  objc_super v12 = [(UIScrollView *)self->_scrollView leadingAnchor];
  v13 = [(FullscreenImageViewController *)self view];
  v14 = [v13 leadingAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  v16 = [(UIScrollView *)self->_scrollView trailingAnchor];
  v17 = [(FullscreenImageViewController *)self view];
  v18 = [v17 trailingAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  [v19 setActive:1];

  v20 = [(UIScrollView *)self->_scrollView bottomAnchor];
  v21 = [(FullscreenImageViewController *)self view];
  v22 = [v21 bottomAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  [v23 setActive:1];

  contentView = self->_contentView;
  if (!contentView)
  {
    v25 = (UIView *)objc_alloc_init((Class)UIImageView);
    [(UIView *)v25 setImage:self->_image];
    v26 = +[UIColor clearColor];
    [(UIView *)v25 setBackgroundColor:v26];

    [(UIView *)v25 setContentMode:1];
    v27 = self->_contentView;
    self->_contentView = v25;

    contentView = self->_contentView;
  }
  [(UIScrollView *)self->_scrollView addSubview:contentView];
  v28 = +[MapsTheme visualEffectViewAllowingBlur:1];
  v29 = +[UIBlurEffect effectWithStyle:2];
  [v28 setEffect:v29];

  [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
  v30 = [(FullscreenImageViewController *)self view];
  [v30 addSubview:v28];

  v31 = (UINavigationBar *)objc_alloc_init((Class)UINavigationBar);
  topBar = self->_topBar;
  self->_topBar = v31;

  [(UINavigationBar *)self->_topBar setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UINavigationBar *)self->_topBar setBarStyle:1];
  [(UINavigationBar *)self->_topBar setTranslucent:1];
  id v33 = objc_alloc_init((Class)UIImage);
  [(UINavigationBar *)self->_topBar setBackgroundImage:v33 forBarMetrics:0];
  [(UINavigationBar *)self->_topBar setShadowImage:v33];
  v34 = +[UIColor whiteColor];
  [(UINavigationBar *)self->_topBar setTintColor:v34];

  v35 = [(FullscreenImageViewController *)self view];
  [v35 addSubview:self->_topBar];

  v36 = [(UINavigationBar *)self->_topBar leadingAnchor];
  v37 = [(FullscreenImageViewController *)self view];
  v38 = [v37 leadingAnchor];
  v39 = [v36 constraintEqualToAnchor:v38];
  [v39 setActive:1];

  v40 = [(UINavigationBar *)self->_topBar trailingAnchor];
  v41 = [(FullscreenImageViewController *)self view];
  v42 = [v41 trailingAnchor];
  v43 = [v40 constraintEqualToAnchor:v42];
  [v43 setActive:1];

  v44 = [(UINavigationBar *)self->_topBar topAnchor];
  v45 = [(FullscreenImageViewController *)self view];
  v46 = [v45 safeAreaLayoutGuide];
  v47 = [v46 topAnchor];
  v48 = [v44 constraintEqualToAnchor:v47];
  [v48 setActive:1];

  v49 = [v28 topAnchor];
  v50 = [(FullscreenImageViewController *)self view];
  v51 = [v50 topAnchor];
  v52 = [v49 constraintEqualToAnchor:v51];
  [v52 setActive:1];

  v53 = [v28 leadingAnchor];
  v54 = [(FullscreenImageViewController *)self view];
  v55 = [v54 leadingAnchor];
  v56 = [v53 constraintEqualToAnchor:v55];
  [v56 setActive:1];

  v57 = [v28 trailingAnchor];
  v58 = [(FullscreenImageViewController *)self view];
  v59 = [v58 trailingAnchor];
  v60 = [v57 constraintEqualToAnchor:v59];
  [v60 setActive:1];

  v61 = [v28 bottomAnchor];
  v62 = [(UINavigationBar *)self->_topBar bottomAnchor];
  v63 = [v61 constraintEqualToAnchor:v62];
  [v63 setActive:1];

  id v64 = objc_alloc((Class)UINavigationItem);
  v65 = [(FullscreenImageViewController *)self title];
  id v66 = [v64 initWithTitle:v65];

  id v67 = objc_alloc((Class)UIBarButtonItem);
  v68 = +[UIImage _mapkit_imageNamed:@"UI_close"];
  id v69 = [v67 initWithImage:v68 style:0 target:self action:"_close:"];

  [v66 setRightBarButtonItem:v69];
  [(UINavigationBar *)self->_topBar pushNavigationItem:v66 animated:0];
  id v70 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"zoomToPoint:"];
  [v70 setNumberOfTapsRequired:2];
  [v70 setDelaysTouchesBegan:1];
  v71 = [(FullscreenImageViewController *)self view];
  [v71 addGestureRecognizer:v70];
}

- (void)_updateMaxZoomScale
{
  [(UIImage *)self->_image size];
  double v4 = v3;
  v5 = [(FullscreenImageViewController *)self view];
  [v5 bounds];
  double v7 = v4 / v6;

  [(UIImage *)self->_image size];
  double v9 = v8;
  v10 = [(FullscreenImageViewController *)self view];
  [v10 bounds];
  double v12 = v9 / v11;

  if (v7 <= v12) {
    double v13 = v12;
  }
  else {
    double v13 = v7;
  }
  double v14 = fmax(v13, 3.0);
  scrollView = self->_scrollView;

  [(UIScrollView *)scrollView setMaximumZoomScale:v14];
}

- (void)viewWillLayoutSubviews
{
  double v3 = [(FullscreenImageViewController *)self view];
  [v3 bounds];
  -[UIView setFrame:](self->_contentView, "setFrame:");

  [(FullscreenImageViewController *)self _updateMaxZoomScale];
  v4.receiver = self;
  v4.super_class = (Class)FullscreenImageViewController;
  [(FullscreenImageViewController *)&v4 viewWillLayoutSubviews];
}

- (void)_close:(id)a3
{
  objc_super v4 = +[MKMapService sharedService];
  [v4 captureUserAction:4 onTarget:613 eventValue:0];

  id v5 = [(FullscreenImageViewController *)self presentingViewController];
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)zoomToPoint:(id)a3
{
  [a3 locationInView:self->_scrollView];
  if (self->_isZoomed)
  {
    self->_isZoomed = 0;
    scrollView = self->_scrollView;
    [(UIScrollView *)scrollView minimumZoomScale];
    -[UIScrollView setZoomScale:animated:](scrollView, "setZoomScale:animated:", 1);
  }
  else
  {
    double v7 = v4;
    double v8 = v5;
    self->_isZoomed = 1;
    [(UIScrollView *)self->_scrollView frame];
    double v10 = v9;
    [(UIScrollView *)self->_scrollView maximumZoomScale];
    double v12 = v10 / v11;
    [(UIScrollView *)self->_scrollView frame];
    double v14 = v13;
    [(UIScrollView *)self->_scrollView maximumZoomScale];
    double v16 = v14 / v15;
    if (v7 - v12 * 0.5 >= 0.0) {
      double v17 = v7 - v12 * 0.5;
    }
    else {
      double v17 = 0.0;
    }
    if (v8 - v16 * 0.5 >= 0.0) {
      double v18 = v8 - v16 * 0.5;
    }
    else {
      double v18 = 0.0;
    }
    [(UIScrollView *)self->_scrollView frame];
    if (v12 + v17 > v19) {
      [(UIScrollView *)self->_scrollView frame];
    }
    [(UIScrollView *)self->_scrollView frame];
    if (v16 + v18 > v20) {
      [(UIScrollView *)self->_scrollView frame];
    }
    v21 = self->_scrollView;
    -[UIScrollView zoomToRect:animated:](v21, "zoomToRect:animated:", 1);
  }
}

- (id)viewForZoomingInScrollView:(id)a3
{
  if (self->_isScrollable) {
    return self->_contentView;
  }
  else {
    return 0;
  }
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  id v6 = a3;
  [v6 zoomScale];
  double v8 = v7;
  [v6 minimumZoomScale];
  double v10 = v9;

  self->_isZoomed = v8 != v10;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_topBar, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end