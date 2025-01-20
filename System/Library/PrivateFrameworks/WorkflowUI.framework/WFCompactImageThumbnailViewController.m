@interface WFCompactImageThumbnailViewController
- (UIImageView)imageView;
- (WFCompactImageThumbnailViewController)initWithAspectRatio:(double)a3 imageGenerator:(id)a4;
- (double)aspectRatio;
- (double)contentHeightForWidth:(double)a3;
- (double)lastViewWidth;
- (id)imageGenerator;
- (void)loadView;
- (void)redrawImage;
- (void)setImageView:(id)a3;
- (void)setLastViewWidth:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation WFCompactImageThumbnailViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_imageView);
  objc_storeStrong(&self->_imageGenerator, 0);
}

- (void)setLastViewWidth:(double)a3
{
  self->_lastViewWidth = a3;
}

- (double)lastViewWidth
{
  return self->_lastViewWidth;
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)imageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageView);
  return (UIImageView *)WeakRetained;
}

- (id)imageGenerator
{
  return self->_imageGenerator;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (void)redrawImage
{
  v3 = [(WFCompactImageThumbnailViewController *)self traitCollection];
  [v3 displayScale];
  double v5 = v4;

  v6 = [(WFCompactImageThumbnailViewController *)self view];
  [v6 bounds];
  double v8 = v7;

  [(WFCompactImageThumbnailViewController *)self aspectRatio];
  double v10 = v5 * v8;
  double v11 = v5 * (v8 / v9);
  v12 = [(WFCompactImageThumbnailViewController *)self imageGenerator];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __52__WFCompactImageThumbnailViewController_redrawImage__block_invoke;
  v13[3] = &unk_2649CBC18;
  v13[4] = self;
  *(double *)&v13[5] = v8;
  ((void (**)(void, void *, double, double))v12)[2](v12, v13, v10, v11);
}

void __52__WFCompactImageThumbnailViewController_redrawImage__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__WFCompactImageThumbnailViewController_redrawImage__block_invoke_2;
  block[3] = &unk_2649CBBF0;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  block[4] = v4;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __52__WFCompactImageThumbnailViewController_redrawImage__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 bounds];
  double v4 = v3;
  double v5 = *(double *)(a1 + 48);

  if (v4 == v5)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = [*(id *)(a1 + 32) imageView];
    [v7 setImage:v6];

    id v8 = [*(id *)(a1 + 32) imageView];
    [v8 startAnimating];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WFCompactImageThumbnailViewController;
  id v4 = a3;
  [(WFCompactImageThumbnailViewController *)&v10 traitCollectionDidChange:v4];
  objc_msgSend(v4, "displayScale", v10.receiver, v10.super_class);
  double v6 = v5;

  id v7 = [(WFCompactImageThumbnailViewController *)self traitCollection];
  [v7 displayScale];
  double v9 = v8;

  if (v6 != v9) {
    [(WFCompactImageThumbnailViewController *)self redrawImage];
  }
}

- (void)viewDidLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)WFCompactImageThumbnailViewController;
  [(WFCompactImageThumbnailViewController *)&v7 viewDidLayoutSubviews];
  double v3 = [(WFCompactImageThumbnailViewController *)self view];
  [v3 bounds];
  double v5 = v4;

  [(WFCompactImageThumbnailViewController *)self lastViewWidth];
  if (vabdd_f64(v5, v6) >= 2.22044605e-16)
  {
    [(WFCompactImageThumbnailViewController *)self setLastViewWidth:v5];
    [(WFCompactImageThumbnailViewController *)self redrawImage];
  }
}

- (double)contentHeightForWidth:(double)a3
{
  [(WFCompactImageThumbnailViewController *)self aspectRatio];
  double v5 = 0.0;
  if (v6 > 0.0)
  {
    [(WFCompactImageThumbnailViewController *)self aspectRatio];
    double v5 = 1.0 / v7;
  }
  return v5 * a3;
}

- (void)loadView
{
  v14.receiver = self;
  v14.super_class = (Class)WFCompactImageThumbnailViewController;
  [(WFCompactImageThumbnailViewController *)&v14 loadView];
  double v3 = [(WFCompactImageThumbnailViewController *)self view];
  double v4 = [v3 traitCollection];
  [v4 displayScale];
  double v6 = v5;

  double v7 = [(WFCompactImageThumbnailViewController *)self view];
  [v7 bounds];
  CGRect v16 = CGRectInset(v15, -1.0 / v6, -1.0 / v6);
  double x = v16.origin.x;
  double y = v16.origin.y;
  double width = v16.size.width;
  double height = v16.size.height;

  id v12 = objc_alloc_init(MEMORY[0x263F82828]);
  [v12 setContentMode:1];
  objc_msgSend(v12, "setFrame:", x, y, width, height);
  [v12 setAutoresizingMask:18];
  v13 = [(WFCompactImageThumbnailViewController *)self view];
  [v13 addSubview:v12];

  [(WFCompactImageThumbnailViewController *)self setImageView:v12];
}

- (WFCompactImageThumbnailViewController)initWithAspectRatio:(double)a3 imageGenerator:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    objc_super v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFCompactImageThumbnailViewController.m", 28, @"Invalid parameter not satisfying: %@", @"imageGenerator" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)WFCompactImageThumbnailViewController;
  double v8 = [(WFCompactImageThumbnailViewController *)&v15 initWithNibName:0 bundle:0];
  double v9 = v8;
  if (v8)
  {
    v8->_aspectRatio = a3;
    uint64_t v10 = [v7 copy];
    id imageGenerator = v9->_imageGenerator;
    v9->_id imageGenerator = (id)v10;

    id v12 = v9;
  }

  return v9;
}

@end