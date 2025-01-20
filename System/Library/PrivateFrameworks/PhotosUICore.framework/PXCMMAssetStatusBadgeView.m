@interface PXCMMAssetStatusBadgeView
+ (CGSize)preferredSize;
- (UIView)glyphView;
- (int64_t)status;
- (void)_invalidateImageView;
- (void)_updateImageViewIfNeeded;
- (void)becomeReusable;
- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4;
- (void)prepareForReuse;
- (void)setGlyphView:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation PXCMMAssetStatusBadgeView

+ (CGSize)preferredSize
{
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  v3 = [MEMORY[0x1E4FB1618] systemGreenColor];
  v4 = objc_msgSend(v2, "px_circularGlyphViewWithName:backgroundColor:", @"checkmark.circle", v3);

  [v4 frame];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void).cxx_destruct
{
}

- (void)setGlyphView:(id)a3
{
}

- (UIView)glyphView
{
  return self->_glyphView;
}

- (int64_t)status
{
  return self->_status;
}

- (void)_updateImageViewIfNeeded
{
  if (self->_needsUpdateFlags.imageView)
  {
    self->_needsUpdateFlags.imageView = 0;
    unint64_t v3 = [(PXCMMAssetStatusBadgeView *)self status];
    if (v3 < 2)
    {
      double v8 = [(PXCMMAssetStatusBadgeView *)self glyphView];
      [v8 removeFromSuperview];

      [(PXCMMAssetStatusBadgeView *)self setGlyphView:0];
    }
    else
    {
      if (v3 == -1)
      {
        double v9 = [(PXCMMAssetStatusBadgeView *)self glyphView];
        [v9 removeFromSuperview];

        [(PXCMMAssetStatusBadgeView *)self setGlyphView:0];
        double v5 = (void *)MEMORY[0x1E4FB1EB0];
        double v6 = [MEMORY[0x1E4FB1618] systemRedColor];
        double v7 = @"exclamationmark.circle";
      }
      else
      {
        if (v3 != 2) {
          return;
        }
        v4 = [(PXCMMAssetStatusBadgeView *)self glyphView];
        [v4 removeFromSuperview];

        [(PXCMMAssetStatusBadgeView *)self setGlyphView:0];
        double v5 = (void *)MEMORY[0x1E4FB1EB0];
        double v6 = [MEMORY[0x1E4FB1618] systemGreenColor];
        double v7 = @"checkmark.circle";
      }
      objc_msgSend(v5, "px_circularGlyphViewWithName:backgroundColor:", v7, v6);
      id v10 = (id)objc_claimAutoreleasedReturnValue();

      [(PXCMMAssetStatusBadgeView *)self addSubview:v10];
      [(PXCMMAssetStatusBadgeView *)self setGlyphView:v10];
    }
  }
}

- (void)_invalidateImageView
{
  self->_needsUpdateFlags.imageView = 1;
}

- (void)setStatus:(int64_t)a3
{
  if (self->_status != a3)
  {
    self->_status = a3;
    [(PXCMMAssetStatusBadgeView *)self _invalidateImageView];
  }
}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  -[PXCMMAssetStatusBadgeView setStatus:](self, "setStatus:", objc_msgSend(a4, "status", a3));
  [(PXCMMAssetStatusBadgeView *)self _updateImageViewIfNeeded];
}

- (void)prepareForReuse
{
  [(PXCMMAssetStatusBadgeView *)self setHidden:0];
  [(PXCMMAssetStatusBadgeView *)self setUserInteractionEnabled:0];
}

- (void)becomeReusable
{
  [(PXCMMAssetStatusBadgeView *)self setHidden:1];
  [(PXCMMAssetStatusBadgeView *)self setStatus:0];
  [(PXCMMAssetStatusBadgeView *)self _updateImageViewIfNeeded];
}

@end