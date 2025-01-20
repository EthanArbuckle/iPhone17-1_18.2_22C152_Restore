@interface PXRoundedCornerOverlayView
- (BOOL)_needsUpdate;
- (BOOL)continuousCorners;
- (PXFocusInfo)focusInfo;
- (PXRoundedCornerOverlayView)initWithFrame:(CGRect)a3;
- (UIColor)overlayColor;
- (double)cornerRadius;
- (double)displayScale;
- (unint64_t)cornersToRound;
- (void)_invalidateImage;
- (void)_setNeedsUpdate;
- (void)_updateIfNeeded;
- (void)_updateImageIfNeeded;
- (void)performChanges:(id)a3;
- (void)setContinuousCorners:(BOOL)a3;
- (void)setCornerRadius:(double)a3;
- (void)setCornersToRound:(unint64_t)a3;
- (void)setDisplayScale:(double)a3;
- (void)setOverlayColor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PXRoundedCornerOverlayView

- (void).cxx_destruct
{
}

- (double)displayScale
{
  return self->_displayScale;
}

- (UIColor)overlayColor
{
  return self->_overlayColor;
}

- (BOOL)continuousCorners
{
  return self->_continuousCorners;
}

- (unint64_t)cornersToRound
{
  return self->_cornersToRound;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXRoundedCornerOverlayView;
  [(PXRoundedCornerOverlayView *)&v10 traitCollectionDidChange:v4];
  uint64_t v5 = [(PXRoundedCornerOverlayView *)self image];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(PXRoundedCornerOverlayView *)self traitCollection];
    int v8 = [v7 hasDifferentColorAppearanceComparedToTraitCollection:v4];

    if (v8)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __55__PXRoundedCornerOverlayView_traitCollectionDidChange___block_invoke;
      v9[3] = &unk_1E5DBAB68;
      v9[4] = self;
      [(PXRoundedCornerOverlayView *)self performChanges:v9];
    }
  }
}

uint64_t __55__PXRoundedCornerOverlayView_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateImage];
}

- (void)_updateImageIfNeeded
{
  if (self->_needsUpdateFlags.image)
  {
    self->_needsUpdateFlags.image = 0;
    [(PXRoundedCornerOverlayView *)self displayScale];
    uint64_t v4 = v3;
    [(PXRoundedCornerOverlayView *)self cornerRadius];
    uint64_t v6 = v5;
    BOOL v7 = [(PXRoundedCornerOverlayView *)self continuousCorners];
    int v8 = [(PXRoundedCornerOverlayView *)self overlayColor];
    unint64_t v9 = [(PXRoundedCornerOverlayView *)self cornersToRound];
    objc_super v10 = NSString;
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    id v13 = v8;
    v14 = [v10 stringWithFormat:@"%@-%.2f-%.2f-%@-%lu", v12, v4, v6, objc_msgSend(v13, "CGColor"), v9];

    v15 = (void *)MEMORY[0x1E4FB1818];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __50__PXRoundedCornerOverlayView__updateImageIfNeeded__block_invoke;
    v18[3] = &unk_1E5DB3788;
    BOOL v23 = v7;
    uint64_t v20 = v6;
    uint64_t v21 = v4;
    id v19 = v13;
    unint64_t v22 = v9;
    id v16 = v13;
    v17 = [v15 _cachedImageForKey:v14 fromBlock:v18];
    [(PXRoundedCornerOverlayView *)self setImage:v17];
  }
}

void __50__PXRoundedCornerOverlayView__updateImageIfNeeded__block_invoke()
{
}

- (void)_invalidateImage
{
  self->_needsUpdateFlags.image = 1;
  [(PXRoundedCornerOverlayView *)self _setNeedsUpdate];
}

- (void)_setNeedsUpdate
{
  if (!self->_isPerformingChanges && !self->_isPerformingUpdates)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PXRoundedCornerOverlayView.m" lineNumber:132 description:@"not inside -performChanges: or _updateIfNeeded"];
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.image;
}

- (void)_updateIfNeeded
{
  if ([(PXRoundedCornerOverlayView *)self _needsUpdate])
  {
    BOOL isPerformingUpdates = self->_isPerformingUpdates;
    self->_BOOL isPerformingUpdates = 1;
    [(PXRoundedCornerOverlayView *)self _updateImageIfNeeded];
    self->_BOOL isPerformingUpdates = isPerformingUpdates;
    if ([(PXRoundedCornerOverlayView *)self _needsUpdate])
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2 object:self file:@"PXRoundedCornerOverlayView.m" lineNumber:122 description:@"update still needed after update pass"];
    }
  }
}

- (void)performChanges:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  BOOL isPerformingChanges = self->_isPerformingChanges;
  self->_BOOL isPerformingChanges = 1;
  BOOL v7 = v4;
  if (v4)
  {
    uint64_t v6 = [(PXRoundedCornerOverlayView *)self mutableChangeObject];
    v7[2](v7, v6);
  }
  self->_BOOL isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges) {
    [(PXRoundedCornerOverlayView *)self _updateIfNeeded];
  }
}

- (PXFocusInfo)focusInfo
{
  if (self->_continuousCorners) {
    uint64_t v3 = (id *)MEMORY[0x1E4F39EA8];
  }
  else {
    uint64_t v3 = (id *)MEMORY[0x1E4F39EA0];
  }
  id v4 = *v3;
  [(PXRoundedCornerOverlayView *)self cornerRadius];
  id v5 = +[PXFocusInfo focusInfoWithView:cornerRadius:cornerCurve:](PXFocusInfo, "focusInfoWithView:cornerRadius:cornerCurve:", self, v4);

  return (PXFocusInfo *)v5;
}

- (void)setDisplayScale:(double)a3
{
  if (self->_displayScale != a3)
  {
    self->_displayScale = a3;
    [(PXRoundedCornerOverlayView *)self _invalidateImage];
  }
}

- (void)setOverlayColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_overlayColor != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_overlayColor, a3);
    [(PXRoundedCornerOverlayView *)self _invalidateImage];
    id v5 = v6;
  }
}

- (void)setContinuousCorners:(BOOL)a3
{
  if (self->_continuousCorners != a3)
  {
    self->_continuousCorners = a3;
    [(PXRoundedCornerOverlayView *)self _invalidateImage];
  }
}

- (void)setCornersToRound:(unint64_t)a3
{
  if (self->_cornersToRound != a3)
  {
    self->_cornersToRound = a3;
    [(PXRoundedCornerOverlayView *)self _invalidateImage];
  }
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    [(PXRoundedCornerOverlayView *)self _invalidateImage];
  }
}

- (PXRoundedCornerOverlayView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXRoundedCornerOverlayView;
  result = -[PXRoundedCornerOverlayView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_cornersToRound = -1;
    result->_continuousCorners = 1;
  }
  return result;
}

@end