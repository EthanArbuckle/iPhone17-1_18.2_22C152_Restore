@interface ICDrawingRegressionTestDataCollectionPreviewViewController
- (BOOL)_canShowWhileLocked;
- (ICDrawingRegressionTestDataCollectionPreviewViewController)initWithDrawingImage:(id)a3;
- (UIImage)drawingImage;
- (UIImageView)imageView;
- (UIScrollView)scrollView;
- (void)centerImageView;
- (void)scrollViewDidZoom:(id)a3;
- (void)setDrawingImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setScrollView:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation ICDrawingRegressionTestDataCollectionPreviewViewController

- (ICDrawingRegressionTestDataCollectionPreviewViewController)initWithDrawingImage:(id)a3
{
  v4 = (UIImage *)a3;
  v8.receiver = self;
  v8.super_class = (Class)ICDrawingRegressionTestDataCollectionPreviewViewController;
  v5 = [(ICDrawingRegressionTestDataCollectionPreviewViewController *)&v8 init];
  drawingImage = v5->_drawingImage;
  v5->_drawingImage = v4;

  return v5;
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)ICDrawingRegressionTestDataCollectionPreviewViewController;
  [(ICDrawingRegressionTestDataCollectionPreviewViewController *)&v20 viewDidLoad];
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"Sketch Preview" value:&stru_10063F3D8 table:0];
  [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self setTitle:v4];

  v5 = +[UIColor lightGrayColor];
  v6 = [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self view];
  [v6 setBackgroundColor:v5];

  id v7 = [objc_alloc((Class)UIScrollView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self setScrollView:v7];

  objc_super v8 = [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self scrollView];
  [v8 setMinimumZoomScale:0.25];

  v9 = [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self scrollView];
  [v9 setMaximumZoomScale:3.0];

  v10 = [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self scrollView];
  [v10 setDelegate:self];

  v11 = [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self view];
  v12 = [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self scrollView];
  [v11 addSubview:v12];

  id v13 = objc_alloc((Class)UIImageView);
  v14 = [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self drawingImage];
  id v15 = [v13 initWithImage:v14];
  [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self setImageView:v15];

  v16 = +[UIColor whiteColor];
  v17 = [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self imageView];
  [v17 setBackgroundColor:v16];

  v18 = [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self scrollView];
  v19 = [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self imageView];
  [v18 addSubview:v19];
}

- (void)viewDidLayoutSubviews
{
  v3 = [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self view];
  [(id)v12 safeAreaInsets];
  double v14 = v5 + v13;
  double v16 = v7 + v15;
  double v18 = v9 - (v13 + v17);
  double v20 = v11 - (v15 + v19);

  v21 = [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self scrollView];
  [v21 frame];
  v42.origin.x = v22;
  v42.origin.y = v23;
  v42.size.width = v24;
  v42.size.height = v25;
  v39.origin.x = v14;
  v39.origin.y = v16;
  v39.size.width = v18;
  v39.size.height = v20;
  LOBYTE(v12) = CGRectEqualToRect(v39, v42);

  if ((v12 & 1) == 0)
  {
    v26 = [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self scrollView];
    [v26 setFrame:v14, v16, v18, v20];

    v27 = [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self imageView];
    [v27 bounds];
    double v29 = v28;
    double v31 = v30;
    v32 = [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self scrollView];
    [v32 setContentSize:v29, v31];

    v33 = [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self scrollView];
    [v33 bounds];
    double Width = CGRectGetWidth(v40);
    v35 = [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self imageView];
    [v35 bounds];
    double v36 = Width / CGRectGetWidth(v41);
    v37 = [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self scrollView];
    [v37 setZoomScale:v36];

    [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self centerImageView];
  }
}

- (void)centerImageView
{
  v3 = [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self scrollView];
  [v3 bounds];
  double v5 = v4;
  double v6 = [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self scrollView];
  [v6 contentSize];
  double v8 = (v5 - v7) * 0.5;

  double v9 = 0.0;
  if (v8 >= 0.0) {
    double v10 = v8;
  }
  else {
    double v10 = 0.0;
  }
  double v11 = [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self scrollView];
  [v11 bounds];
  double v13 = v12;
  double v14 = [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self scrollView];
  [v14 contentSize];
  double v16 = (v13 - v15) * 0.5;

  if (v16 >= 0.0) {
    double v9 = v16;
  }
  id v23 = [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self scrollView];
  [v23 contentSize];
  double v18 = v10 + v17 * 0.5;
  double v19 = [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self scrollView];
  [v19 contentSize];
  double v21 = v9 + v20 * 0.5;
  CGFloat v22 = [(ICDrawingRegressionTestDataCollectionPreviewViewController *)self imageView];
  [v22 setCenter:v18, v21];
}

- (void)scrollViewDidZoom:(id)a3
{
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIImage)drawingImage
{
  return self->_drawingImage;
}

- (void)setDrawingImage:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
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
  objc_storeStrong((id *)&self->_scrollView, 0);

  objc_storeStrong((id *)&self->_drawingImage, 0);
}

@end