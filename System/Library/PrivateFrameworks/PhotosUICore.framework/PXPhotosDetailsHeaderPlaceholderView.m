@interface PXPhotosDetailsHeaderPlaceholderView
- (PXPhotosDetailsHeaderPlaceholderView)initWithRegionOfInterest:(id)a3;
- (id)viewForLastBaselineLayout;
- (void)_layoutImageTile;
- (void)_layoutLabelForLastBaselineLayout;
- (void)_layoutTextTile;
- (void)_layoutTile:(id)a3 withGeometry:(PXTileGeometry *)a4 userData:(id)a5;
- (void)layoutSubviews;
@end

@implementation PXPhotosDetailsHeaderPlaceholderView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelForLastBaselineLayout, 0);
  objc_storeStrong((id *)&self->_textTileUserData, 0);
  objc_storeStrong((id *)&self->_textTile, 0);
  objc_storeStrong((id *)&self->_imageTileUserData, 0);
  objc_storeStrong((id *)&self->_imageTile, 0);
  objc_storeStrong((id *)&self->_tileAnimator, 0);
}

- (void)_layoutLabelForLastBaselineLayout
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  v4 = [(PXTitleSubtitleUILabelTile *)self->_textTile view];
  [v4 bounds];
  double MinY = CGRectGetMinY(v10);
  [(PXTitleSubtitleUILabelTile *)self->_textTile lastBaseline];
  -[PXPhotosDetailsHeaderPlaceholderView convertPoint:fromView:](self, "convertPoint:fromView:", v4, v3, MinY + v6);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__PXPhotosDetailsHeaderPlaceholderView__layoutLabelForLastBaselineLayout__block_invoke;
  v9[3] = &unk_1E5DAEBD0;
  v9[4] = self;
  v9[5] = v7;
  v9[6] = v8;
  +[PXViewLayoutHelper performLayoutWithinView:self usingBlock:v9];
}

void __73__PXPhotosDetailsHeaderPlaceholderView__layoutLabelForLastBaselineLayout__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int64x2_t v9 = vdupq_n_s64(0x7FF8000000000000uLL);
  int64x2_t v10 = v9;
  objc_msgSend(v3, "leadingOfView:", *(void *)(a1 + 32), *(_OWORD *)&v9, *(_OWORD *)&v9, *(_OWORD *)&v9, *(_OWORD *)&v9);
  objc_msgSend(v3, "trailingOfView:", *(void *)(a1 + 32), v4);
  v9.i64[1] = v5;
  *(void *)&long long v7 = *(void *)(a1 + 48);
  int64x2_t v8 = vdupq_n_s64(0x7FF0000000000000uLL);
  [v3 layoutView:*(void *)(*(void *)(a1 + 32) + 1024) withAttributes:&v6];
}

- (void)_layoutTile:(id)a3 withGeometry:(PXTileGeometry *)a4 userData:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int64x2_t v10 = [v8 view];
  v11 = [v10 superview];

  if (v11 != self) {
    [(PXPhotosDetailsHeaderPlaceholderView *)self addSubview:v10];
  }
  tileAnimator = self->_tileAnimator;
  long long v13 = *(_OWORD *)&a4->contentSize.height;
  v19[8] = *(_OWORD *)&a4->hidden;
  v19[9] = v13;
  long long v14 = *(_OWORD *)&a4->contentsRect.size.height;
  v19[10] = *(_OWORD *)&a4->contentsRect.origin.y;
  v19[11] = v14;
  long long v15 = *(_OWORD *)&a4->transform.c;
  v19[4] = *(_OWORD *)&a4->transform.a;
  v19[5] = v15;
  long long v16 = *(_OWORD *)&a4->alpha;
  v19[6] = *(_OWORD *)&a4->transform.tx;
  v19[7] = v16;
  CGSize size = a4->frame.size;
  v19[0] = a4->frame.origin;
  v19[1] = size;
  CGSize v18 = a4->size;
  v19[2] = a4->center;
  v19[3] = v18;
  [(PXBasicUIViewTileAnimator *)tileAnimator animateTile:v8 toGeometry:v19 userData:v9 withOptions:0 completionHandler:&__block_literal_global_3595];
}

- (void)_layoutTextTile
{
  textTile = self->_textTile;
  textTileUserData = self->_textTileUserData;
  long long v4 = *(_OWORD *)&self->_textTileGeometry.contentSize.height;
  v10[8] = *(_OWORD *)&self->_textTileGeometry.hidden;
  v10[9] = v4;
  long long v5 = *(_OWORD *)&self->_textTileGeometry.contentsRect.size.height;
  v10[10] = *(_OWORD *)&self->_textTileGeometry.contentsRect.origin.y;
  v10[11] = v5;
  long long v6 = *(_OWORD *)&self->_textTileGeometry.transform.c;
  v10[4] = *(_OWORD *)&self->_textTileGeometry.transform.a;
  v10[5] = v6;
  long long v7 = *(_OWORD *)&self->_textTileGeometry.alpha;
  v10[6] = *(_OWORD *)&self->_textTileGeometry.transform.tx;
  v10[7] = v7;
  CGSize size = self->_textTileGeometry.frame.size;
  v10[0] = self->_textTileGeometry.frame.origin;
  v10[1] = size;
  CGSize v9 = self->_textTileGeometry.size;
  v10[2] = self->_textTileGeometry.center;
  v10[3] = v9;
  [(PXPhotosDetailsHeaderPlaceholderView *)self _layoutTile:textTile withGeometry:v10 userData:textTileUserData];
}

- (void)_layoutImageTile
{
  imageTile = self->_imageTile;
  imageTileUserData = self->_imageTileUserData;
  long long v4 = *(_OWORD *)&self->_imageTileGeometry.contentSize.height;
  v10[8] = *(_OWORD *)&self->_imageTileGeometry.hidden;
  v10[9] = v4;
  long long v5 = *(_OWORD *)&self->_imageTileGeometry.contentsRect.size.height;
  v10[10] = *(_OWORD *)&self->_imageTileGeometry.contentsRect.origin.y;
  v10[11] = v5;
  long long v6 = *(_OWORD *)&self->_imageTileGeometry.transform.c;
  v10[4] = *(_OWORD *)&self->_imageTileGeometry.transform.a;
  v10[5] = v6;
  long long v7 = *(_OWORD *)&self->_imageTileGeometry.alpha;
  v10[6] = *(_OWORD *)&self->_imageTileGeometry.transform.tx;
  v10[7] = v7;
  CGSize size = self->_imageTileGeometry.frame.size;
  v10[0] = self->_imageTileGeometry.frame.origin;
  v10[1] = size;
  CGSize v9 = self->_imageTileGeometry.size;
  v10[2] = self->_imageTileGeometry.center;
  v10[3] = v9;
  [(PXPhotosDetailsHeaderPlaceholderView *)self _layoutTile:imageTile withGeometry:v10 userData:imageTileUserData];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)PXPhotosDetailsHeaderPlaceholderView;
  [(PXPhotosDetailsHeaderPlaceholderView *)&v7 layoutSubviews];
  [(PXPhotosDetailsHeaderPlaceholderView *)self bounds];
  self->_imageTileGeometry.frame.origin.x = v3;
  self->_imageTileGeometry.frame.origin.y = v4;
  self->_imageTileGeometry.frame.size.width = v5;
  self->_imageTileGeometry.frame.size.height = v6;
  PXRectGetCenter();
}

- (id)viewForLastBaselineLayout
{
  return self->_labelForLastBaselineLayout;
}

- (PXPhotosDetailsHeaderPlaceholderView)initWithRegionOfInterest:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [v4 coordinateSpace];
  [v4 rectInCoordinateSpace:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  v18.receiver = self;
  v18.super_class = (Class)PXPhotosDetailsHeaderPlaceholderView;
  long long v14 = -[PXPhotosDetailsHeaderPlaceholderView initWithFrame:](&v18, sel_initWithFrame_, v7, v9, v11, v13);
  if (v14)
  {
    long long v15 = objc_alloc_init(PXBasicUIViewTileAnimator);
    tileAnimator = v14->_tileAnimator;
    v14->_tileAnimator = v15;

    [(PXPhotosDetailsHeaderPlaceholderView *)v14 bounds];
    PXRectGetCenter();
  }

  return 0;
}

uint64_t __65__PXPhotosDetailsHeaderPlaceholderView_initWithRegionOfInterest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 handlePreloadedImageRequester:*(void *)(a1 + 32)];
}

@end