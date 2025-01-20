@interface PXAssetUIImageViewTile
- (BOOL)shouldAllowFocus;
- (CGRect)_desiredContentsRect;
- (CGSize)_contentSize;
- (PXAssetUIImageViewTile)init;
- (PXImageRequester)imageRequester;
- (UIColor)placeholderColor;
- (UIImage)image;
- (UIImage)placeholderImage;
- (UIView)view;
- (double)cornerRadius;
- (void)_setContentSize:(CGSize)a3;
- (void)_setDesiredContentsRect:(CGRect)a3;
- (void)_updateContentView;
- (void)_updateImageRequester;
- (void)_updateImageView;
- (void)becomeReusable;
- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)prepareForReuse;
- (void)setCornerRadius:(double)a3;
- (void)setImageRequester:(id)a3;
- (void)setPlaceholderColor:(id)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setShouldAllowFocus:(BOOL)a3;
@end

@implementation PXAssetUIImageViewTile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_placeholderColor, 0);
  objc_storeStrong((id *)&self->_imageRequester, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

- (CGRect)_desiredContentsRect
{
  double x = self->__desiredContentsRect.origin.x;
  double y = self->__desiredContentsRect.origin.y;
  double width = self->__desiredContentsRect.size.width;
  double height = self->__desiredContentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)_contentSize
{
  double width = self->__contentSize.width;
  double height = self->__contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)shouldAllowFocus
{
  return self->_shouldAllowFocus;
}

- (void)setPlaceholderImage:(id)a3
{
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (UIColor)placeholderColor
{
  return self->_placeholderColor;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (PXImageRequester)imageRequester
{
  return self->_imageRequester;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)PXImageRequesterObserverContext_170255 == a5)
  {
    char v5 = a4;
    id v7 = a3;
    id v8 = [(PXAssetUIImageViewTile *)self imageRequester];

    if ((v5 & 0x84) != 0 && v8 == v7)
    {
      [(PXAssetUIImageViewTile *)self imageDidChange];
    }
  }
}

- (void)_updateImageView
{
  id v24 = [(PXAssetUIImageViewTile *)self imageRequester];
  v3 = [(PXFocusableUIImageView *)self->_imageView image];
  v4 = [v24 image];

  if (v3 != v4)
  {
    imageView = self->_imageView;
    v6 = [v24 image];
    [(PXFocusableUIImageView *)imageView setImage:v6];
  }
  id v7 = [(PXFocusableUIImageView *)self->_imageView layer];
  if (v24)
  {
    [v24 contentsRect];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    [v7 contentsRect];
    v27.origin.double x = v16;
    v27.origin.double y = v17;
    v27.size.double width = v18;
    v27.size.double height = v19;
    v26.origin.double x = v9;
    v26.origin.double y = v11;
    v26.size.double width = v13;
    v26.size.double height = v15;
    if (CGRectEqualToRect(v26, v27)) {
      goto LABEL_8;
    }
    [v24 contentsRect];
  }
  else
  {
    double v20 = *(double *)off_1E5DAB010;
    double v21 = *((double *)off_1E5DAB010 + 1);
    double v22 = *((double *)off_1E5DAB010 + 2);
    double v23 = *((double *)off_1E5DAB010 + 3);
  }
  objc_msgSend(v7, "setContentsRect:", v20, v21, v22, v23);
LABEL_8:
}

- (void)_updateImageRequester
{
  [(PXAssetUIImageViewTile *)self _contentSize];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  [(PXAssetUIImageViewTile *)self _desiredContentsRect];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  [(PXFocusableUIImageView *)self->_imageView bounds];
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  CGFloat v19 = [(PXAssetUIImageViewTile *)self imageRequester];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __47__PXAssetUIImageViewTile__updateImageRequester__block_invoke;
  v20[3] = &__block_descriptor_96_e35_v16__0___PXMutableImageRequester__8l;
  v20[4] = v4;
  v20[5] = v6;
  v20[6] = v8;
  v20[7] = v10;
  v20[8] = v12;
  v20[9] = v14;
  v20[10] = v16;
  v20[11] = v18;
  [v19 performChanges:v20];
}

void __47__PXAssetUIImageViewTile__updateImageRequester__block_invoke(double *a1, void *a2)
{
  double v3 = a1[4];
  double v4 = a1[5];
  id v5 = a2;
  objc_msgSend(v5, "setContentSize:", v3, v4);
  objc_msgSend(v5, "setDesiredContentsRect:", a1[6], a1[7], a1[8], a1[9]);
  objc_msgSend(v5, "setViewportSize:", a1[10], a1[11]);
}

- (void)_setContentSize:(CGSize)a3
{
  if (self->__contentSize.width != a3.width || self->__contentSize.height != a3.height) {
    self->__contentSize = a3;
  }
}

- (void)_setDesiredContentsRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(self->__desiredContentsRect, a3))
  {
    self->__desiredContentsRect.origin.CGFloat x = x;
    self->__desiredContentsRect.origin.CGFloat y = y;
    self->__desiredContentsRect.size.CGFloat width = width;
    self->__desiredContentsRect.size.CGFloat height = height;
  }
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    [(PXAssetUIImageViewTile *)self _updateContentView];
  }
}

- (void)setImageRequester:(id)a3
{
  id v5 = (PXImageRequester *)a3;
  imageRequester = self->_imageRequester;
  uint64_t v7 = v5;
  if (imageRequester != v5)
  {
    [(PXImageRequester *)imageRequester unregisterChangeObserver:self context:PXImageRequesterObserverContext_170255];
    objc_storeStrong((id *)&self->_imageRequester, a3);
    [(PXAssetUIImageViewTile *)self _updateImageRequester];
    [(PXAssetUIImageViewTile *)self _updateImageView];
    [(PXImageRequester *)v7 registerChangeObserver:self context:PXImageRequesterObserverContext_170255];
  }
}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  -[PXAssetUIImageViewTile _setContentSize:](self, "_setContentSize:", a3->contentSize.width, a3->contentSize.height);
  -[PXAssetUIImageViewTile _setDesiredContentsRect:](self, "_setDesiredContentsRect:", a3->contentsRect.origin.x, a3->contentsRect.origin.y, a3->contentsRect.size.width, a3->contentsRect.size.height);
  [(PXAssetUIImageViewTile *)self _updateImageRequester];
}

- (void)prepareForReuse
{
  [(PXFocusableUIImageView *)self->_imageView setReusable:0];
  id v3 = [(PXAssetUIImageViewTile *)self view];
  [v3 setHidden:0];
}

- (void)becomeReusable
{
  [(PXFocusableUIImageView *)self->_imageView setReusable:1];
  id v3 = [(PXAssetUIImageViewTile *)self view];
  [v3 setHidden:1];

  [(PXAssetUIImageViewTile *)self setImageRequester:0];
  -[PXAssetUIImageViewTile _setContentSize:](self, "_setContentSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v4 = *(double *)off_1E5DAB010;
  double v5 = *((double *)off_1E5DAB010 + 1);
  double v6 = *((double *)off_1E5DAB010 + 2);
  double v7 = *((double *)off_1E5DAB010 + 3);
  -[PXAssetUIImageViewTile _setDesiredContentsRect:](self, "_setDesiredContentsRect:", v4, v5, v6, v7);
}

- (void)_updateContentView
{
  imageView = self->_imageView;
  if (!imageView)
  {
    double v4 = [PXFocusableUIImageView alloc];
    double v5 = -[PXFocusableUIImageView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v6 = self->_imageView;
    self->_imageView = v5;

    [(PXFocusableUIImageView *)self->_imageView setDrawsFocusRing:1];
    double v7 = [(PXFocusableUIImageView *)self->_imageView layer];
    [v7 setAllowsGroupOpacity:0];

    imageView = self->_imageView;
  }
  [(PXFocusableUIImageView *)imageView setOpaque:1];
  [(PXFocusableUIImageView *)self->_imageView setClipsToBounds:1];
  if (self->_hasPlaceholder) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }
  [(PXFocusableUIImageView *)self->_imageView setContentMode:v8];
  uint64_t v9 = self->_imageView;
  uint64_t v10 = [(PXAssetUIImageViewTile *)self placeholderColor];
  [(PXFocusableUIImageView *)v9 setBackgroundColor:v10];

  [(PXAssetUIImageViewTile *)self cornerRadius];
  if (v11 == 0.0)
  {
    uint64_t v17 = [(PXFocusableUIImageView *)self->_imageView layer];
    [v17 setCornerRadius:0.0];
  }
  else
  {
    [(PXAssetUIImageViewTile *)self cornerRadius];
    double v13 = v12;
    uint64_t v14 = [(PXFocusableUIImageView *)self->_imageView layer];
    [v14 setCornerRadius:v13];

    uint64_t v15 = *MEMORY[0x1E4F39EA8];
    uint64_t v16 = [(PXFocusableUIImageView *)self->_imageView layer];
    [v16 setCornerCurve:v15];

    uint64_t v17 = [(PXFocusableUIImageView *)self->_imageView layer];
    [v17 setAllowsGroupOpacity:0];
  }

  if (self->_shouldAllowFocus)
  {
    [(PXFocusableUIImageView *)self->_imageView setClipsToBounds:0];
    [(PXFocusableUIImageView *)self->_imageView setUserInteractionEnabled:1];
  }
  [(PXAssetUIImageViewTile *)self _updateImageView];
  uint64_t v18 = self->_imageView;
  objc_storeStrong((id *)&self->_contentView, v18);
}

- (void)setShouldAllowFocus:(BOOL)a3
{
  if (self->_shouldAllowFocus != a3)
  {
    self->_shouldAllowFocus = a3;
    if (self->_contentView) {
      [(PXAssetUIImageViewTile *)self _updateContentView];
    }
  }
}

- (void)setPlaceholderColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_placeholderColor != v5)
  {
    objc_storeStrong((id *)&self->_placeholderColor, a3);
    if (self->_contentView) {
      [(PXAssetUIImageViewTile *)self _updateContentView];
    }
  }
}

- (UIImage)image
{
  v2 = [(PXAssetUIImageViewTile *)self imageRequester];
  id v3 = [v2 image];

  return (UIImage *)v3;
}

- (UIView)view
{
  contentView = self->_contentView;
  if (!contentView)
  {
    [(PXAssetUIImageViewTile *)self _updateContentView];
    contentView = self->_contentView;
  }
  return contentView;
}

- (PXAssetUIImageViewTile)init
{
  v7.receiver = self;
  v7.super_class = (Class)PXAssetUIImageViewTile;
  v2 = [(PXAssetUIImageViewTile *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
    placeholderColor = v2->_placeholderColor;
    v2->_placeholderColor = (UIColor *)v3;

    CGSize v5 = (CGSize)*((_OWORD *)off_1E5DAB010 + 1);
    v2->__desiredContentsRect.origin = *(CGPoint *)off_1E5DAB010;
    v2->__desiredContentsRect.size = v5;
    *(_WORD *)&v2->_hasPlaceholder = 0;
  }
  return v2;
}

@end