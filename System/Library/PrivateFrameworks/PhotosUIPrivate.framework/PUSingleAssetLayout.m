@interface PUSingleAssetLayout
- (CGRect)assetRect;
- (CGRect)contentBounds;
- (CGRect)contentsRect;
- (NSString)cornerCurve;
- (PUAssetReference)assetReference;
- (UIEdgeInsets)cropInsets;
- (double)cornerRadius;
- (id)layoutInfoForTileWithIndexPath:(id)a3 kind:(id)a4;
- (id)layoutInfosForTilesInRect:(CGRect)a3;
- (unint64_t)cornerMask;
- (void)_invalidateSingleAssetLayout;
- (void)setAssetRect:(CGRect)a3;
- (void)setAssetReference:(id)a3;
- (void)setContentsRect:(CGRect)a3;
- (void)setCornerCurve:(id)a3;
- (void)setCornerMask:(unint64_t)a3;
- (void)setCornerRadius:(double)a3;
- (void)setCropInsets:(UIEdgeInsets)a3;
@end

@implementation PUSingleAssetLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cornerCurve, 0);
  objc_storeStrong((id *)&self->_assetReference, 0);
}

- (unint64_t)cornerMask
{
  return self->_cornerMask;
}

- (NSString)cornerCurve
{
  return self->_cornerCurve;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (CGRect)contentsRect
{
  double x = self->_contentsRect.origin.x;
  double y = self->_contentsRect.origin.y;
  double width = self->_contentsRect.size.width;
  double height = self->_contentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIEdgeInsets)cropInsets
{
  double top = self->_cropInsets.top;
  double left = self->_cropInsets.left;
  double bottom = self->_cropInsets.bottom;
  double right = self->_cropInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGRect)assetRect
{
  double x = self->_assetRect.origin.x;
  double y = self->_assetRect.origin.y;
  double width = self->_assetRect.size.width;
  double height = self->_assetRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAssetReference:(id)a3
{
}

- (PUAssetReference)assetReference
{
  return self->_assetReference;
}

- (id)layoutInfoForTileWithIndexPath:(id)a3 kind:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PUSingleAssetLayout *)self assetReference];
  v9 = [v8 indexPath];
  [(PUSingleAssetLayout *)self assetRect];
  CGFloat v43 = v10;
  CGFloat v45 = v11;
  double v46 = v12;
  double v47 = v13;
  [(PUSingleAssetLayout *)self cornerRadius];
  uint64_t v44 = v14;
  v15 = [(PUSingleAssetLayout *)self cornerCurve];
  unint64_t v16 = [(PUSingleAssetLayout *)self cornerMask];
  [(PUSingleAssetLayout *)self cropInsets];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  [(PUSingleAssetLayout *)self contentsRect];
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  if (![v6 isEqual:v9]) {
    goto LABEL_5;
  }
  uint64_t v41 = v30;
  double v42 = v24;
  if (![v7 isEqual:@"PUTileKindItemContent"]) {
    goto LABEL_5;
  }
  v50.origin.double x = v43;
  v50.origin.double y = v45;
  v50.size.double width = v47;
  v50.size.double height = v46;
  if (CGRectIsInfinite(v50)) {
    goto LABEL_5;
  }
  v51.origin.double x = v43;
  v51.origin.double y = v45;
  v51.size.double width = v47;
  v51.size.double height = v46;
  if (!CGRectIsNull(v51))
  {
    v35 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v6 kind:v7];
    v36 = [PUCroppedTileLayoutInfo alloc];
    v52.origin.double x = v43;
    v52.origin.double y = v45;
    v52.size.double width = v47;
    v52.size.double height = v46;
    double MidX = CGRectGetMidX(v52);
    v53.origin.double x = v43;
    v53.origin.double y = v45;
    v53.size.double width = v47;
    v53.size.double height = v46;
    double MidY = CGRectGetMidY(v53);
    v39 = [(PUTilingLayout *)self coordinateSystem];
    long long v40 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v48[0] = *MEMORY[0x1E4F1DAB8];
    v48[1] = v40;
    v48[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    v33 = -[PUCroppedTileLayoutInfo initWithTileIdentifier:center:size:cropInsets:verticalLegibilityFraction:alpha:cornerRadius:cornerCurve:cornerMask:transform:zPosition:contentsRect:coordinateSystem:](v36, "initWithTileIdentifier:center:size:cropInsets:verticalLegibilityFraction:alpha:cornerRadius:cornerCurve:cornerMask:transform:zPosition:contentsRect:coordinateSystem:", v35, v15, v16, v48, v39, MidX, MidY, v47, v46, v18, v20, v22, v42, 0, 0x3FF0000000000000, v44,
            0,
            v26,
            v28,
            v41,
            v32);
  }
  else
  {
LABEL_5:
    v33 = 0;
  }

  return v33;
}

- (id)layoutInfosForTilesInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v19[1] = *MEMORY[0x1E4F143B8];
  [(PUSingleAssetLayout *)self assetRect];
  v21.origin.CGFloat x = v8;
  v21.origin.CGFloat y = v9;
  v21.size.CGFloat width = v10;
  v21.size.CGFloat height = v11;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  if (CGRectIntersectsRect(v20, v21))
  {
    double v12 = [(PUSingleAssetLayout *)self assetReference];
    double v13 = [v12 indexPath];
    uint64_t v14 = [(PUSingleAssetLayout *)self layoutInfoForTileWithIndexPath:v13 kind:@"PUTileKindItemContent"];
    v19[0] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  }
  else
  {
    v15 = 0;
  }
  if (v15) {
    unint64_t v16 = v15;
  }
  else {
    unint64_t v16 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v17 = v16;

  return v17;
}

- (CGRect)contentBounds
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(PUTilingLayout *)self visibleRect];
  double v6 = v2;
  double v7 = v3;
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v7;
  result.origin.CGFloat x = v6;
  return result;
}

- (void)setCornerMask:(unint64_t)a3
{
  if (self->_cornerMask != a3)
  {
    self->_cornerMask = a3;
    [(PUSingleAssetLayout *)self _invalidateSingleAssetLayout];
  }
}

- (void)setCornerCurve:(id)a3
{
  CGFloat v8 = (NSString *)a3;
  double v4 = self->_cornerCurve;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      double v6 = (NSString *)[(NSString *)v8 copy];
      cornerCurve = self->_cornerCurve;
      self->_cornerCurve = v6;

      [(PUSingleAssetLayout *)self _invalidateSingleAssetLayout];
    }
  }
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    [(PUSingleAssetLayout *)self _invalidateSingleAssetLayout];
  }
}

- (void)setContentsRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_contentsRect = &self->_contentsRect;
  if (!CGRectEqualToRect(a3, self->_contentsRect))
  {
    p_contentsRect->origin.CGFloat x = x;
    p_contentsRect->origin.CGFloat y = y;
    p_contentsRect->size.CGFloat width = width;
    p_contentsRect->size.CGFloat height = height;
    [(PUSingleAssetLayout *)self _invalidateSingleAssetLayout];
  }
}

- (void)setCropInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_cropInsets.left
    || a3.top != self->_cropInsets.top
    || a3.right != self->_cropInsets.right
    || a3.bottom != self->_cropInsets.bottom)
  {
    self->_cropInsets = a3;
    [(PUSingleAssetLayout *)self _invalidateSingleAssetLayout];
  }
}

- (void)setAssetRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_assetRect = &self->_assetRect;
  if (!CGRectEqualToRect(a3, self->_assetRect))
  {
    p_assetRect->origin.CGFloat x = x;
    p_assetRect->origin.CGFloat y = y;
    p_assetRect->size.CGFloat width = width;
    p_assetRect->size.CGFloat height = height;
    [(PUSingleAssetLayout *)self _invalidateSingleAssetLayout];
  }
}

- (void)_invalidateSingleAssetLayout
{
  BOOL v5 = objc_alloc_init(PUTilingLayoutInvalidationContext);
  double v3 = [(PUSingleAssetLayout *)self assetReference];
  double v4 = [v3 indexPath];
  if (v4) {
    [(PUTilingLayoutInvalidationContext *)v5 invalidateTileWithIndexPath:v4 kind:@"PUTileKindItemContent"];
  }
  [(PUTilingLayout *)self invalidateLayoutWithContext:v5];
}

@end