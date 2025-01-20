@interface PXUIImageTile
- (BOOL)_needsUpdate;
- (BOOL)drawsFocusRing;
- (CGRect)_contentsRect;
- (CGSize)_contentSize;
- (PXImageRequester)imageRequester;
- (PXImageViewSpec)_spec;
- (UIView)view;
- (double)_displayScale;
- (int64_t)_animationCount;
- (void)_invalidateImage;
- (void)_invalidateImageRequester;
- (void)_invalidateImageView;
- (void)_performChanges:(id)a3;
- (void)_setAnimationCount:(int64_t)a3;
- (void)_setContentSize:(CGSize)a3;
- (void)_setContentsRect:(CGRect)a3;
- (void)_setDisplayScale:(double)a3;
- (void)_setNeedsUpdate;
- (void)_setSpec:(id)a3;
- (void)_updateIfNeeded;
- (void)_updateImageIfNeeded;
- (void)_updateImageRequesterIfNeeded;
- (void)_updateImageViewIfNeeded;
- (void)becomeReusable;
- (void)didAnimateToGeometry:(PXTileGeometry *)a3 toUserData:(id)a4 withOptions:(id)a5;
- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)prepareForReuse;
- (void)setDrawsFocusRing:(BOOL)a3;
- (void)setImageRequester:(id)a3;
- (void)willAnimateToGeometry:(PXTileGeometry *)a3 toUserData:(id)a4 withOptions:(id)a5;
@end

@implementation PXUIImageTile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__spec, 0);
  objc_storeStrong((id *)&self->_imageRequester, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

- (int64_t)_animationCount
{
  return self->__animationCount;
}

- (CGRect)_contentsRect
{
  double x = self->__contentsRect.origin.x;
  double y = self->__contentsRect.origin.y;
  double width = self->__contentsRect.size.width;
  double height = self->__contentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)_displayScale
{
  return self->__displayScale;
}

- (CGSize)_contentSize
{
  double width = self->__contentSize.width;
  double height = self->__contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PXImageViewSpec)_spec
{
  return self->__spec;
}

- (BOOL)drawsFocusRing
{
  return self->_drawsFocusRing;
}

- (PXImageRequester)imageRequester
{
  return self->_imageRequester;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXImageRequesterObservationContext != a5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXUIImageTile.m" lineNumber:303 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v10 = v9;
  if ((v6 & 4) != 0)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46__PXUIImageTile_observable_didChange_context___block_invoke;
    v12[3] = &unk_1E5DD36F8;
    v12[4] = self;
    [(PXUIImageTile *)self _performChanges:v12];
  }
}

uint64_t __46__PXUIImageTile_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateImage];
}

- (void)prepareForReuse
{
}

- (void)becomeReusable
{
  [(PXUIImageTile *)self setImageRequester:0];
  imageView = self->_imageView;
  [(PXImageUIView *)imageView setHidden:1];
}

- (void)_setDisplayScale:(double)a3
{
  if (self->__displayScale != a3)
  {
    self->__displayScale = a3;
    [(PXUIImageTile *)self _invalidateImageRequester];
  }
}

- (void)_setContentSize:(CGSize)a3
{
  if (a3.width != self->__contentSize.width || a3.height != self->__contentSize.height)
  {
    self->__contentSize = a3;
    [(PXUIImageTile *)self _invalidateImageRequester];
  }
}

- (void)setDrawsFocusRing:(BOOL)a3
{
  if (self->_drawsFocusRing != a3)
  {
    self->_drawsFocusRing = a3;
    imageView = self->_imageView;
    if (imageView) {
      -[PXImageUIView setDrawsFocusRing:](imageView, "setDrawsFocusRing:");
    }
  }
}

- (void)setImageRequester:(id)a3
{
  v5 = (PXImageRequester *)a3;
  imageRequester = self->_imageRequester;
  if (imageRequester != v5)
  {
    [(PXImageRequester *)imageRequester unregisterChangeObserver:self context:PXImageRequesterObservationContext];
    objc_storeStrong((id *)&self->_imageRequester, a3);
    [(PXImageRequester *)self->_imageRequester registerChangeObserver:self context:PXImageRequesterObservationContext];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __35__PXUIImageTile_setImageRequester___block_invoke;
    v7[3] = &unk_1E5DD36F8;
    v7[4] = self;
    [(PXUIImageTile *)self _performChanges:v7];
  }
}

uint64_t __35__PXUIImageTile_setImageRequester___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateImageRequester];
  v2 = *(void **)(a1 + 32);
  return [v2 _invalidateImage];
}

- (void)didAnimateToGeometry:(PXTileGeometry *)a3 toUserData:(id)a4 withOptions:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__PXUIImageTile_didAnimateToGeometry_toUserData_withOptions___block_invoke;
  v5[3] = &unk_1E5DD36F8;
  v5[4] = self;
  -[PXUIImageTile _performChanges:](self, "_performChanges:", v5, a4, a5);
}

uint64_t __61__PXUIImageTile_didAnimateToGeometry_toUserData_withOptions___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 _animationCount] - 1;
  return [v1 _setAnimationCount:v2];
}

- (void)willAnimateToGeometry:(PXTileGeometry *)a3 toUserData:(id)a4 withOptions:(id)a5
{
  id v7 = a5;
  self->_animationFlags = 0;
  if ([v7 flags])
  {
    self->_animationFlags |= 2uLL;
  }
  else
  {
    v8 = [(PXUIImageTile *)self view];
    if (([v7 flags] & 2) != 0)
    {
      [v8 bounds];
      if (a3->size.width == v10 && a3->size.height == v9)
      {
        v12 = [(PXUIImageTile *)self _spec];
        v13 = [v12 overlaySpecs];
        uint64_t v14 = [v13 count];

        if (v14) {
          self->_animationFlags |= 1uLL;
        }
      }
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__PXUIImageTile_willAnimateToGeometry_toUserData_withOptions___block_invoke;
  v15[3] = &unk_1E5DD36F8;
  v15[4] = self;
  [(PXUIImageTile *)self _performChanges:v15];
}

uint64_t __62__PXUIImageTile_willAnimateToGeometry_toUserData_withOptions___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 _animationCount] + 1;
  return [v1 _setAnimationCount:v2];
}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  char v6 = [a4 viewSpec];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 imageSpec];

    char v6 = (void *)v7;
  }
  [(PXUIImageTile *)self _setSpec:v6];
  if (v6)
  {
    [v6 displayScale];
    uint64_t v9 = v8;
  }
  else
  {
    double v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v10 scale];
    uint64_t v9 = v11;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  long long v12 = *(_OWORD *)&a3->contentSize.height;
  long long v27 = *(_OWORD *)&a3->hidden;
  long long v28 = v12;
  long long v13 = *(_OWORD *)&a3->contentsRect.size.height;
  long long v29 = *(_OWORD *)&a3->contentsRect.origin.y;
  long long v30 = v13;
  long long v14 = *(_OWORD *)&a3->transform.c;
  long long v23 = *(_OWORD *)&a3->transform.a;
  long long v24 = v14;
  long long v15 = *(_OWORD *)&a3->alpha;
  long long v25 = *(_OWORD *)&a3->transform.tx;
  long long v26 = v15;
  CGSize size = a3->frame.size;
  CGPoint origin = a3->frame.origin;
  CGSize v20 = size;
  CGSize v17 = a3->size;
  CGPoint center = a3->center;
  v18[2] = __47__PXUIImageTile_didApplyGeometry_withUserData___block_invoke;
  v18[3] = &unk_1E5DC1BB0;
  v18[4] = self;
  CGSize v22 = v17;
  uint64_t v31 = v9;
  [(PXUIImageTile *)self _performChanges:v18];
}

uint64_t __47__PXUIImageTile_didApplyGeometry_withUserData___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setContentSize:", *(double *)(a1 + 176), *(double *)(a1 + 184));
  [*(id *)(a1 + 32) _setDisplayScale:*(double *)(a1 + 232)];
  uint64_t v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 192);
  double v4 = *(double *)(a1 + 200);
  double v5 = *(double *)(a1 + 208);
  double v6 = *(double *)(a1 + 216);
  return objc_msgSend(v2, "_setContentsRect:", v3, v4, v5, v6);
}

- (void)_setContentsRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(self->__contentsRect, a3))
  {
    self->__contentsRect.origin.CGFloat x = x;
    self->__contentsRect.origin.CGFloat y = y;
    self->__contentsRect.size.CGFloat width = width;
    self->__contentsRect.size.CGFloat height = height;
    id v8 = [(PXUIImageTile *)self view];
    objc_msgSend(v8, "setContentsRect:", self->__contentsRect.origin.x, self->__contentsRect.origin.y, self->__contentsRect.size.width, self->__contentsRect.size.height);
  }
}

- (void)_setSpec:(id)a3
{
  double v5 = (PXImageViewSpec *)a3;
  if (self->__spec != v5)
  {
    objc_storeStrong((id *)&self->__spec, a3);
    [(PXImageUIView *)self->_imageView setSpec:v5];
  }
}

- (UIView)view
{
  imageView = self->_imageView;
  if (!imageView)
  {
    double v4 = objc_alloc_init(PXImageUIView);
    double v5 = self->_imageView;
    self->_imageView = v4;

    [(PXImageUIView *)self->_imageView setContentMode:2];
    [(PXImageUIView *)self->_imageView setClipsToBounds:0];
    [(PXImageUIView *)self->_imageView setDrawsFocusRing:[(PXUIImageTile *)self drawsFocusRing]];
    [(PXImageUIView *)self->_imageView setSpec:self->__spec];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __21__PXUIImageTile_view__block_invoke;
    v7[3] = &unk_1E5DD36F8;
    v7[4] = self;
    [(PXUIImageTile *)self _performChanges:v7];
    imageView = self->_imageView;
  }
  return (UIView *)imageView;
}

uint64_t __21__PXUIImageTile_view__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateImageView];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _invalidateImage];
}

- (void)_updateImageIfNeeded
{
  if (self->_needsUpdateFlags.image)
  {
    self->_needsUpdateFlags.image = 0;
    id v4 = [(PXUIImageTile *)self imageRequester];
    double v3 = [v4 image];
    [(PXImageUIView *)self->_imageView setImage:v3];
  }
}

- (void)_invalidateImage
{
  self->_needsUpdateFlags.image = 1;
  [(PXUIImageTile *)self _setNeedsUpdate];
}

- (void)_updateImageRequesterIfNeeded
{
  if (self->_needsUpdateFlags.imageRequester)
  {
    self->_needsUpdateFlags.imageRequester = 0;
    [(PXUIImageTile *)self _contentSize];
    uint64_t v4 = v3;
    uint64_t v6 = v5;
    [(PXUIImageTile *)self _displayScale];
    uint64_t v8 = v7;
    uint64_t v9 = [(PXUIImageTile *)self imageRequester];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__PXUIImageTile__updateImageRequesterIfNeeded__block_invoke;
    v10[3] = &unk_1E5DC1B88;
    v10[5] = v4;
    v10[6] = v6;
    v10[7] = v8;
    v10[4] = self;
    [v9 performChanges:v10];
  }
}

void __46__PXUIImageTile__updateImageRequesterIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  id v7 = a2;
  objc_msgSend(v7, "setContentSize:", v3, v4);
  [v7 setScale:*(double *)(a1 + 56)];
  [*(id *)(*(void *)(a1 + 32) + 16) bounds];
  objc_msgSend(v7, "setViewportSize:", v5, v6);
}

- (void)_invalidateImageRequester
{
  self->_needsUpdateFlags.imageRequester = 1;
  [(PXUIImageTile *)self _setNeedsUpdate];
}

- (void)_updateImageViewIfNeeded
{
  if (self->_needsUpdateFlags.imageView)
  {
    self->_needsUpdateFlags.imageView = 0;
    BOOL v3 = [(PXUIImageTile *)self _animationCount] > 0;
    imageView = self->_imageView;
    unint64_t animationFlags = self->_animationFlags;
    [(PXImageUIView *)imageView setAnimating:v3 withFlags:animationFlags];
  }
}

- (void)_invalidateImageView
{
  self->_needsUpdateFlags.imageView = 1;
  [(PXUIImageTile *)self _setNeedsUpdate];
}

- (void)_setNeedsUpdate
{
  if (!self->_isPerformingChanges && !self->_isPerformingUpdates)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PXUIImageTile.m" lineNumber:98 description:@"not inside -performChanges: or _updateIfNeeded"];
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.imageView || self->_needsUpdateFlags.imageRequester || self->_needsUpdateFlags.image;
}

- (void)_updateIfNeeded
{
  if ([(PXUIImageTile *)self _needsUpdate])
  {
    BOOL isPerformingUpdates = self->_isPerformingUpdates;
    self->_BOOL isPerformingUpdates = 1;
    [(PXUIImageTile *)self _updateImageViewIfNeeded];
    [(PXUIImageTile *)self _updateImageRequesterIfNeeded];
    [(PXUIImageTile *)self _updateImageIfNeeded];
    self->_BOOL isPerformingUpdates = isPerformingUpdates;
    if ([(PXUIImageTile *)self _needsUpdate])
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2 object:self file:@"PXUIImageTile.m" lineNumber:86 description:@"update still needed after update pass"];
    }
  }
}

- (void)_performChanges:(id)a3
{
  id v4 = (void (**)(void))a3;
  BOOL isPerformingChanges = self->_isPerformingChanges;
  self->_BOOL isPerformingChanges = 1;
  double v6 = v4;
  if (v4)
  {
    v4[2](v4);
    id v4 = v6;
  }
  self->_BOOL isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges)
  {
    [(PXUIImageTile *)self _updateIfNeeded];
    id v4 = v6;
  }
}

- (void)_setAnimationCount:(int64_t)a3
{
  if (self->__animationCount != a3)
  {
    self->__animationCount = a3;
    [(PXUIImageTile *)self _invalidateImageView];
  }
}

@end