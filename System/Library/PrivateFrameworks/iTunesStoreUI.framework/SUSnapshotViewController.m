@interface SUSnapshotViewController
- (SUSnapshotViewController)initWithOriginal:(id)a3;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIImageView)imageView;
- (UIViewController)originalViewController;
- (id)_snapshotOfView:(id)a3;
- (int64_t)_currentOrientation;
- (int64_t)originalOrientation;
- (void)_startActivityIndicator;
- (void)_stopActivityIndicator;
- (void)setActivityIndicatorView:(id)a3;
- (void)setImageView:(id)a3;
- (void)setOriginalOrientation:(int64_t)a3;
- (void)setOriginalViewController:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SUSnapshotViewController

- (SUSnapshotViewController)initWithOriginal:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUSnapshotViewController;
  v6 = [(SUSnapshotViewController *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_originalOrientation = [(SUSnapshotViewController *)v6 _currentOrientation];
    objc_storeStrong((id *)&v7->_originalViewController, a3);
    v8 = [v5 title];
    [(SUSnapshotViewController *)v7 setTitle:v8];

    v9 = [(SUSnapshotViewController *)v7 navigationItem];
    v10 = [v5 navigationItem];
    v11 = [v10 rightBarButtonItem];
    [v9 setRightBarButtonItem:v11];
  }
  return v7;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)SUSnapshotViewController;
  [(SUSnapshotViewController *)&v13 viewDidLoad];
  v3 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:2];
  activityIndicatorView = self->_activityIndicatorView;
  self->_activityIndicatorView = v3;

  id v5 = [(SUSnapshotViewController *)self view];
  [v5 addSubview:self->_activityIndicatorView];

  v6 = [(SUSnapshotViewController *)self originalViewController];
  v7 = [v6 view];
  v8 = [(SUSnapshotViewController *)self _snapshotOfView:v7];

  v9 = (UIImageView *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v8];
  imageView = self->_imageView;
  self->_imageView = v9;

  v11 = [(SUSnapshotViewController *)self view];
  [v11 setUserInteractionEnabled:0];

  v12 = [(SUSnapshotViewController *)self view];
  [v12 addSubview:self->_imageView];
}

- (void)viewWillLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)SUSnapshotViewController;
  [(SUSnapshotViewController *)&v7 viewWillLayoutSubviews];
  v3 = [(SUSnapshotViewController *)self activityIndicatorView];
  v4 = [(SUSnapshotViewController *)self view];
  [v4 center];
  objc_msgSend(v3, "setCenter:");

  id v5 = [(SUSnapshotViewController *)self imageView];
  v6 = [(UIViewController *)self->_originalViewController view];
  [v6 bounds];
  objc_msgSend(v5, "setFrame:");
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUSnapshotViewController;
  [(SUSnapshotViewController *)&v7 viewWillAppear:a3];
  int64_t v4 = [(SUSnapshotViewController *)self _currentOrientation];
  if ((unint64_t)(v4 - 1) > 1)
  {
    if ((unint64_t)(v4 - 3) > 1
      || (unint64_t)([(SUSnapshotViewController *)self originalOrientation] - 3) > 1)
    {
      goto LABEL_7;
    }
LABEL_6:
    id v5 = [(SUSnapshotViewController *)self imageView];
    [v5 setHidden:0];

    [(SUSnapshotViewController *)self _stopActivityIndicator];
    return;
  }
  if ((unint64_t)([(SUSnapshotViewController *)self originalOrientation] - 1) < 2) {
    goto LABEL_6;
  }
LABEL_7:
  v6 = [(SUSnapshotViewController *)self imageView];
  [v6 setHidden:1];

  [(SUSnapshotViewController *)self _startActivityIndicator];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUSnapshotViewController;
  [(SUSnapshotViewController *)&v4 viewDidDisappear:a3];
  [(SUSnapshotViewController *)self _stopActivityIndicator];
}

- (int64_t)_currentOrientation
{
  v2 = [MEMORY[0x263F1C408] sharedApplication];
  int64_t v3 = [v2 statusBarOrientation];

  return v3;
}

- (id)_snapshotOfView:(id)a3
{
  id v3 = a3;
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [MEMORY[0x263F1C920] mainScreen];
  [v12 scale];
  CGFloat v14 = v13;
  v18.width = v9;
  v18.height = v11;
  UIGraphicsBeginImageContextWithOptions(v18, 0, v14);

  objc_msgSend(v3, "drawViewHierarchyInRect:afterScreenUpdates:", 1, v5, v7, v9, v11);
  v15 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v15;
}

- (void)_startActivityIndicator
{
  id v3 = [(SUSnapshotViewController *)self activityIndicatorView];
  [v3 startAnimating];

  id v4 = [(SUSnapshotViewController *)self activityIndicatorView];
  [v4 setHidden:0];
}

- (void)_stopActivityIndicator
{
  id v3 = [(SUSnapshotViewController *)self activityIndicatorView];
  [v3 stopAnimating];

  id v4 = [(SUSnapshotViewController *)self activityIndicatorView];
  [v4 setHidden:1];
}

- (UIViewController)originalViewController
{
  return self->_originalViewController;
}

- (void)setOriginalViewController:(id)a3
{
}

- (int64_t)originalOrientation
{
  return self->_originalOrientation;
}

- (void)setOriginalOrientation:(int64_t)a3
{
  self->_originalOrientation = a3;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);

  objc_storeStrong((id *)&self->_originalViewController, 0);
}

@end