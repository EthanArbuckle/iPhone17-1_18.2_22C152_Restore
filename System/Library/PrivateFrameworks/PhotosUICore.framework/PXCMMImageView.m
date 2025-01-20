@interface PXCMMImageView
- (BOOL)test_highlighted;
- (PXCMMImageView)initWithFrame:(CGRect)a3;
- (PXCMMImageViewModel)viewModel;
- (void)_updateContentsRect;
- (void)_updateHighlighted;
- (void)_updateImage;
- (void)_updateImageRequestHelper;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setFrame:(CGRect)a3;
- (void)setViewModel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PXCMMImageView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_imageRequesterHelper, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

- (PXCMMImageViewModel)viewModel
{
  return self->_viewModel;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v10 = a3;
  if ((void *)PXCMMImageViewModelObservationContext == a5)
  {
    if ((v6 & 3) != 0) {
      [(PXCMMImageView *)self _updateImageRequestHelper];
    }
    if ((v6 & 4) != 0) {
      [(PXCMMImageView *)self _updateHighlighted];
    }
  }
  else
  {
    if ((void *)PXImageRequesterHelperObservationContext != a5)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"PXCMMImageView.m" lineNumber:147 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if ((v6 & 0x20) != 0) {
      [(PXCMMImageView *)self _updateImage];
    }
    if ((v6 & 8) != 0) {
      [(PXCMMImageView *)self _updateContentsRect];
    }
  }
}

- (BOOL)test_highlighted
{
  return ![(UIView *)self->_highlightView isHidden];
}

- (void)_updateContentsRect
{
  [(PXImageRequesterHelper *)self->_imageRequesterHelper contentsRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(UIImageView *)self->_imageView layer];
  objc_msgSend(v11, "setContentsRect:", v4, v6, v8, v10);
}

- (void)_updateImage
{
  id v3 = [(PXImageRequesterHelper *)self->_imageRequesterHelper image];
  [(UIImageView *)self->_imageView setImage:v3];
}

- (void)_updateHighlighted
{
  uint64_t v3 = [(PXCMMImageViewModel *)self->_viewModel isHighlighted] ^ 1;
  highlightView = self->_highlightView;
  [(UIView *)highlightView setHidden:v3];
}

- (void)_updateImageRequestHelper
{
  [(PXCMMImageView *)self bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  double v7 = [(PXCMMImageView *)self traitCollection];
  [v7 displayScale];
  if (v8 == 0.0) {
    double v9 = 1.0;
  }
  else {
    double v9 = v8;
  }

  imageRequesterHelper = self->_imageRequesterHelper;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__PXCMMImageView__updateImageRequestHelper__block_invoke;
  v11[3] = &unk_1E5DC6118;
  v11[4] = self;
  v11[5] = v4;
  v11[6] = v6;
  *(double *)&v11[7] = v9;
  [(PXImageRequesterHelper *)imageRequesterHelper performChanges:v11];
}

void __43__PXCMMImageView__updateImageRequestHelper__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 432);
  id v6 = a2;
  uint64_t v4 = [v3 asset];
  [v6 setAsset:v4];

  objc_msgSend(v6, "setContentSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 432) mediaProvider];
  [v6 setMediaProvider:v5];

  [v6 setScale:*(double *)(a1 + 56)];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXCMMImageView;
  [(PXCMMImageView *)&v4 traitCollectionDidChange:a3];
  [(PXCMMImageView *)self _updateImageRequestHelper];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXCMMImageView;
  -[PXCMMImageView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PXCMMImageView *)self _updateImageRequestHelper];
}

- (PXCMMImageView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)PXCMMImageView;
  uint64_t v3 = -[PXCMMImageView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_super v4 = objc_alloc_init(PXImageRequesterHelper);
    imageRequesterHelper = v3->_imageRequesterHelper;
    v3->_imageRequesterHelper = v4;

    [(PXImageRequesterHelper *)v3->_imageRequesterHelper registerChangeObserver:v3 context:PXImageRequesterHelperObservationContext];
    id v6 = objc_alloc(MEMORY[0x1E4FB1838]);
    [(PXCMMImageView *)v3 bounds];
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v7;

    [(UIImageView *)v3->_imageView setAutoresizingMask:18];
    [(UIImageView *)v3->_imageView setContentMode:2];
    [(UIImageView *)v3->_imageView setClipsToBounds:1];
    double v9 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
    [(UIImageView *)v3->_imageView setBackgroundColor:v9];

    [(PXCMMImageView *)v3 addSubview:v3->_imageView];
    id v10 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(PXCMMImageView *)v3 bounds];
    uint64_t v11 = objc_msgSend(v10, "initWithFrame:");
    highlightView = v3->_highlightView;
    v3->_highlightView = (UIView *)v11;

    [(UIView *)v3->_highlightView setAutoresizingMask:18];
    v13 = [MEMORY[0x1E4FB1618] labelColor];
    [(UIView *)v3->_highlightView setBackgroundColor:v13];

    [(UIView *)v3->_highlightView setAlpha:0.3];
    [(UIView *)v3->_highlightView setHidden:1];
    [(PXCMMImageView *)v3 addSubview:v3->_highlightView];
    v14 = objc_alloc_init(PXCMMImageViewModel);
    [(PXCMMImageView *)v3 setViewModel:v14];

    [(PXCMMImageView *)v3 setAccessibilityIgnoresInvertColors:1];
  }
  return v3;
}

- (void)setViewModel:(id)a3
{
  uint64_t v11 = (PXCMMImageViewModel *)a3;
  if (!v11)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXCMMImageView.m", 34, @"Invalid parameter not satisfying: %@", @"viewModel" object file lineNumber description];
  }
  p_viewModel = &self->_viewModel;
  uint64_t v7 = self->_viewModel;
  if (v7 == v11)
  {
  }
  else
  {
    double v8 = v11;
    char v9 = [(PXCMMImageViewModel *)v8 isEqual:v7];

    if ((v9 & 1) == 0)
    {
      [(PXCMMImageViewModel *)*p_viewModel unregisterChangeObserver:self context:PXCMMImageViewModelObservationContext];
      objc_storeStrong((id *)&self->_viewModel, a3);
      [(PXCMMImageViewModel *)*p_viewModel registerChangeObserver:self context:PXCMMImageViewModelObservationContext];
      [(PXCMMImageView *)self _updateImageRequestHelper];
      [(PXCMMImageView *)self _updateHighlighted];
    }
  }
}

@end