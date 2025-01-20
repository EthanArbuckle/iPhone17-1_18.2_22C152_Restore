@interface UIDebuggingSpecViewController
- (BOOL)startMediaBrowserFromViewController:(id)a3;
- (CGPoint)origin;
- (NSMutableArray)specImages;
- (UICollectionView)collectionView;
- (UICollectionViewFlowLayout)flowLayout;
- (UIDebuggingSpecViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIView)spec;
- (double)originalOpacity;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)gotDeleteGesture:(id)a3;
- (void)gotPanGesture:(id)a3;
- (void)hideImage;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)prepareForMediaBrowser;
- (void)setCollectionView:(id)a3;
- (void)setFlowLayout:(id)a3;
- (void)setOrigin:(CGPoint)a3;
- (void)setOriginalOpacity:(double)a3;
- (void)setSpec:(id)a3;
- (void)setSpecImages:(id)a3;
- (void)viewDidLoad;
@end

@implementation UIDebuggingSpecViewController

- (UIDebuggingSpecViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)UIDebuggingSpecViewController;
  v4 = [(UIViewController *)&v17 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(UIViewController *)v4 navigationItem];
    v7 = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:2 target:v5 action:sel_prepareForMediaBrowser];
    [v6 setRightBarButtonItem:v7];
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    specImages = v5->_specImages;
    v5->_specImages = (NSMutableArray *)v8;

    v10 = objc_alloc_init(UICollectionViewFlowLayout);
    flowLayout = v5->_flowLayout;
    v5->_flowLayout = v10;

    -[UICollectionViewFlowLayout setItemSize:](v5->_flowLayout, "setItemSize:", 50.0, 50.0);
    v12 = [UICollectionView alloc];
    uint64_t v13 = -[UICollectionView initWithFrame:collectionViewLayout:](v12, "initWithFrame:collectionViewLayout:", v5->_flowLayout, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    collectionView = v5->_collectionView;
    v5->_collectionView = (UICollectionView *)v13;

    [(UICollectionView *)v5->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"specCell"];
    v15 = +[UIColor whiteColor];
    [(UICollectionView *)v5->_collectionView setBackgroundColor:v15];

    [(UICollectionView *)v5->_collectionView setDataSource:v5];
    [(UICollectionView *)v5->_collectionView setDelegate:v5];
  }
  return v5;
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)UIDebuggingSpecViewController;
  [(UIViewController *)&v23 viewDidLoad];
  v3 = [(UIViewController *)self view];
  [v3 frame];
  double v5 = v4;
  [(UICollectionViewFlowLayout *)self->_flowLayout minimumInteritemSpacing];
  double v7 = (v5 + v6 * -4.0) / 3.0;

  -[UICollectionViewFlowLayout setItemSize:](self->_flowLayout, "setItemSize:", v7, v7);
  uint64_t v8 = [(UIDebuggingSpecViewController *)self collectionView];
  [v8 setAutoresizingMask:18];

  v9 = [(UIViewController *)self view];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = [(UIDebuggingSpecViewController *)self collectionView];
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  v19 = [(UIViewController *)self view];
  v20 = [(UIDebuggingSpecViewController *)self collectionView];
  [v19 addSubview:v20];

  v21 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:sel_gotDeleteGesture_];
  [(UILongPressGestureRecognizer *)v21 setMinimumPressDuration:0.5];
  v22 = [(UIDebuggingSpecViewController *)self collectionView];
  [v22 addGestureRecognizer:v21];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  double v4 = [(UIDebuggingSpecViewController *)self specImages];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  double v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"specCell" forIndexPath:v6];
  uint64_t v8 = [UIImageView alloc];
  v9 = [(UIDebuggingSpecViewController *)self specImages];
  uint64_t v10 = [v6 row];

  double v11 = [v9 objectAtIndexedSubscript:v10];
  double v12 = [(UIImageView *)v8 initWithImage:v11];

  [v7 bounds];
  -[UIImageView setFrame:](v12, "setFrame:");
  [(UIImageView *)v12 setContentMode:2];
  [(UIView *)v12 setClipsToBounds:1];
  double v13 = [v7 contentView];
  [v13 addSubview:v12];

  [(UIView *)v12 setAutoresizingMask:18];
  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [UIImageView alloc];
  double v7 = [(UIViewController *)self view];
  uint64_t v8 = [v7 window];
  [v8 frame];
  v26 = -[UIImageView initWithFrame:](v6, "initWithFrame:");

  v9 = [(UIDebuggingSpecViewController *)self specImages];
  uint64_t v10 = [v5 row];

  double v11 = [v9 objectAtIndexedSubscript:v10];
  [(UIImageView *)v26 setImage:v11];

  double v12 = [UIView alloc];
  double v13 = [(UIViewController *)self view];
  double v14 = [v13 window];
  [v14 frame];
  double v15 = -[UIView initWithFrame:](v12, "initWithFrame:");

  [(UIView *)v15 addSubview:v26];
  double v16 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:sel_gotPanGesture_];
  [(UIView *)v15 addGestureRecognizer:v16];
  double v17 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel_hideImage];
  [(UITapGestureRecognizer *)v17 setNumberOfTouchesRequired:1];
  [(UITapGestureRecognizer *)v17 setNumberOfTapsRequired:2];
  [(UIView *)v15 addGestureRecognizer:v17];
  [(UIDebuggingSpecViewController *)self setSpec:v15];
  v18 = +[UIDebuggingInformationOverlay overlay];
  [v18 setTouchCaptureEnabled:1];

  v19 = +[UIDebuggingInformationOverlay overlay];
  v20 = [v19 rootViewController];
  v21 = [v20 view];
  v22 = [(UIDebuggingSpecViewController *)self spec];
  [v21 addSubview:v22];

  objc_super v23 = +[UIDebuggingInformationOverlay overlay];
  v24 = [v23 overlayViewController];

  v25 = [v24 containerView];
  [v25 setHidden:1];
}

- (void)gotDeleteGesture:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 3)
  {
    id v5 = [(UIDebuggingSpecViewController *)self collectionView];
    [v4 locationInView:v5];
    double v7 = v6;
    double v9 = v8;

    uint64_t v10 = [(UIDebuggingSpecViewController *)self collectionView];
    double v11 = objc_msgSend(v10, "indexPathForItemAtPoint:", v7, v9);

    if (v11)
    {
      double v12 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:1];
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      double v16 = __50__UIDebuggingSpecViewController_gotDeleteGesture___block_invoke;
      double v17 = &unk_1E5302AC8;
      v18 = self;
      id v19 = v11;
      double v13 = +[UIAlertAction actionWithTitle:@"Remove" style:2 handler:&v14];
      objc_msgSend(v12, "addAction:", v13, v14, v15, v16, v17, v18);
      [(UIViewController *)self presentViewController:v12 animated:1 completion:0];
    }
  }
}

void __50__UIDebuggingSpecViewController_gotDeleteGesture___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) specImages];
  objc_msgSend(v2, "removeObjectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "row"));

  id v3 = [*(id *)(a1 + 32) collectionView];
  [v3 reloadData];
}

- (void)gotPanGesture:(id)a3
{
  id v27 = a3;
  if ([v27 state] == 1)
  {
    id v4 = [(UIDebuggingSpecViewController *)self spec];
    id v5 = [v4 subviews];
    double v6 = [v5 objectAtIndexedSubscript:0];
    double v7 = [v6 layer];
    [v7 opacity];
    [(UIDebuggingSpecViewController *)self setOriginalOpacity:v8];

    [v27 locationInView:0];
    -[UIDebuggingSpecViewController setOrigin:](self, "setOrigin:");
    goto LABEL_13;
  }
  if ([v27 state] == 2)
  {
    [v27 locationInView:0];
    double v10 = v9;
    [(UIDebuggingSpecViewController *)self origin];
    double v12 = v10 - v11;
    [(UIDebuggingSpecViewController *)self originalOpacity];
    double v14 = v13 + v12 / -200.0;
    if (v12 > 0.0)
    {
      float v15 = v14;
      double v16 = [(UIDebuggingSpecViewController *)self spec];
      double v17 = [v16 subviews];
      v18 = [v17 objectAtIndexedSubscript:0];
      id v19 = [v18 layer];
      *(float *)&double v20 = v15;
      [v19 setOpacity:v20];

      if (v12 <= 250.0) {
        goto LABEL_13;
      }
LABEL_9:
      [(UIDebuggingSpecViewController *)self hideImage];
      goto LABEL_13;
    }
    if (v14 > 1.0) {
      double v14 = 1.0;
    }
    float v21 = v14;
    v22 = [(UIDebuggingSpecViewController *)self spec];
    objc_super v23 = [v22 subviews];
    v24 = [v23 objectAtIndexedSubscript:0];
    v25 = [v24 layer];
    *(float *)&double v26 = v21;
    [v25 setOpacity:v26];
  }
  else if ([v27 state] == 4 || objc_msgSend(v27, "state") == 5)
  {
    goto LABEL_9;
  }
LABEL_13:
}

- (void)hideImage
{
  id v3 = [(UIDebuggingSpecViewController *)self spec];
  [v3 removeFromSuperview];

  [(UIDebuggingSpecViewController *)self setSpec:0];
  id v4 = +[UIDebuggingInformationOverlay overlay];
  [v4 setTouchCaptureEnabled:0];

  id v5 = +[UIDebuggingInformationOverlay overlay];
  double v6 = [v5 overlayViewController];
  double v7 = [v6 containerView];

  float v8 = [v7 layer];
  [v8 setOpacity:0.0];

  [v7 setHidden:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__UIDebuggingSpecViewController_hideImage__block_invoke;
  v10[3] = &unk_1E52D9F70;
  id v11 = v7;
  id v9 = v7;
  +[UIView animateWithDuration:v10 animations:0.2];
}

void __42__UIDebuggingSpecViewController_hideImage__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) layer];
  LODWORD(v1) = 1.0;
  [v2 setOpacity:v1];
}

- (void)prepareForMediaBrowser
{
  id v3 = +[UIDebuggingInformationOverlay overlay];
  [v3 setTouchCaptureEnabled:1];

  [(UIDebuggingSpecViewController *)self startMediaBrowserFromViewController:self];
}

- (BOOL)startMediaBrowserFromViewController:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[UIImagePickerController isSourceTypeAvailable:2];
  if (v5)
  {
    double v6 = objc_alloc_init(UIImagePickerController);
    [(UIImagePickerController *)v6 setSourceType:2];
    [(UIImagePickerController *)v6 setAllowsEditing:0];
    [(UINavigationController *)v6 setDelegate:self];
    [v4 presentViewController:v6 animated:1 completion:0];
  }
  return v5;
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v5 = a4;
  double v6 = [(UIDebuggingSpecViewController *)self specImages];
  double v7 = [v5 objectForKeyedSubscript:@"UIImagePickerControllerOriginalImage"];

  [v6 addObject:v7];
  float v8 = [(UIDebuggingSpecViewController *)self collectionView];
  [v8 reloadData];

  [(UIViewController *)self dismissViewControllerAnimated:1 completion:0];
  id v9 = +[UIDebuggingInformationOverlay overlay];
  [v9 setTouchCaptureEnabled:0];
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  [(UIViewController *)self dismissViewControllerAnimated:1 completion:0];
  id v3 = +[UIDebuggingInformationOverlay overlay];
  [v3 setTouchCaptureEnabled:0];
}

- (UIView)spec
{
  return self->_spec;
}

- (void)setSpec:(id)a3
{
}

- (NSMutableArray)specImages
{
  return self->_specImages;
}

- (void)setSpecImages:(id)a3
{
}

- (CGPoint)origin
{
  double x = self->_origin.x;
  double y = self->_origin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOrigin:(CGPoint)a3
{
  self->_origin = a3;
}

- (double)originalOpacity
{
  return self->_originalOpacity;
}

- (void)setOriginalOpacity:(double)a3
{
  self->_originalOpacitdouble y = a3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionViewFlowLayout)flowLayout
{
  return self->_flowLayout;
}

- (void)setFlowLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_specImages, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

@end