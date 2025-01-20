@interface LoadingViewController
- (LoadingViewController)initWithWebClip:(id)a3 orientation:(int64_t)a4;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)loadView;
- (void)viewDidLayoutSubviews;
@end

@implementation LoadingViewController

- (int64_t)preferredStatusBarStyle
{
  return self->_preferredStatusBarStyle;
}

- (LoadingViewController)initWithWebClip:(id)a3 orientation:(int64_t)a4
{
  id v6 = a3;
  v7 = [(LoadingViewController *)self initWithNibName:0 bundle:0];
  [(LoadingViewController *)v7 setModalPresentationStyle:5];
  [(LoadingViewController *)v7 setModalPresentationCapturesStatusBarAppearance:1];
  [(LoadingViewController *)v7 setModalTransitionStyle:2];
  v7->_orientation = a4;
  [v6 webClipStatusBarStyle];
  v7->_preferredStatusBarStyle = UIStatusBarStyleFromUIWebClipStatusBarStyle();
  v8 = [v6 getStartupImage:v7->_orientation];

  if (objc_msgSend(v8, "sf_isLaunchImageSizedForOrientation:includesStatusBar:", v7->_orientation, &v7->_imageIsFullScreen))objc_storeStrong((id *)&v7->_image, v8); {
  return v7;
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  unint64_t v2 = self->_orientation - 1;
  if (v2 > 3) {
    return 30;
  }
  else {
    return qword_23D525200[v2];
  }
}

- (void)loadView
{
  id v9 = [MEMORY[0x263F1C550] systemBackgroundColor];
  id v3 = objc_alloc_init(MEMORY[0x263F1CB60]);
  [v3 setBackgroundColor:v9];
  [(LoadingViewController *)self setView:v3];
  if (self->_image)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
    imageView = self->_imageView;
    self->_imageView = v4;

    [(UIImageView *)self->_imageView setImage:self->_image];
    [v3 addSubview:self->_imageView];
  }
  if (!self->_imageIsFullScreen)
  {
    id v6 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    statusBarView = self->_statusBarView;
    self->_statusBarView = v6;

    if ([(LoadingViewController *)self preferredStatusBarStyle])
    {
      v8 = [MEMORY[0x263F1C550] blackColor];
      [(UIView *)self->_statusBarView setBackgroundColor:v8];
    }
    else
    {
      [(UIView *)self->_statusBarView setBackgroundColor:v9];
    }
    [v3 addSubview:self->_statusBarView];
  }
}

- (void)viewDidLayoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)LoadingViewController;
  [(LoadingViewController *)&v17 viewDidLayoutSubviews];
  id v3 = [(LoadingViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [(id)*MEMORY[0x263F1D020] statusBarHeightForOrientation:self->_orientation];
  double v13 = v12;
  v14 = [(LoadingViewController *)self view];
  [v14 frame];
  double v15 = 0.0;
  -[UIView setFrame:](self->_statusBarView, "setFrame:", 0.0, 0.0, CGRectGetWidth(v18), v13);

  if (self->_imageIsFullScreen)
  {
    double v15 = v5;
  }
  else
  {
    v19.origin.x = v5;
    v19.origin.y = v7;
    v19.size.width = v9;
    v19.size.height = v11;
    CGFloat Width = CGRectGetWidth(v19);
    v20.origin.x = v5;
    v20.origin.y = v7;
    v20.size.width = v9;
    v20.size.height = v11;
    double v11 = CGRectGetHeight(v20) - v13;
    double v9 = Width;
    double v7 = v13;
  }
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v15, v7, v9, v11);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBarView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end