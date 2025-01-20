@interface PXTilingLayout
- (BOOL)allowHorizontalFlip;
- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6;
- (BOOL)shouldFlipHorizontally;
- (CGPoint)visibleOrigin;
- (CGRect)contentBounds;
- (CGRect)scrollBounds;
- (CGRect)visibleRect;
- (CGSize)referenceSize;
- (CGSize)visibleSize;
- (PXScrollInfo)scrollInfo;
- (PXTilingCoordinateSpace)coordinateSpace;
- (PXTilingLayout)init;
- (PXTilingLayoutObserver)observer;
- (UIEdgeInsets)contentInset;
- (void)coordinateSpaceIdentifier;
- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5;
- (void)invalidateLayout;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setObserver:(id)a3;
- (void)setReferenceSize:(CGSize)a3;
- (void)setVisibleOrigin:(CGPoint)a3;
- (void)setVisibleSize:(CGSize)a3;
@end

@implementation PXTilingLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinateSpace, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_scrollInfo, 0);
}

- (PXTilingCoordinateSpace)coordinateSpace
{
  return self->_coordinateSpace;
}

- (void)setObserver:(id)a3
{
}

- (PXTilingLayoutObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (PXTilingLayoutObserver *)WeakRetained;
}

- (void)coordinateSpaceIdentifier
{
  return self->_coordinateSpaceIdentifier;
}

- (PXScrollInfo)scrollInfo
{
  return self->_scrollInfo;
}

- (void)setVisibleOrigin:(CGPoint)a3
{
  self->_visibleOrigin = a3;
}

- (CGPoint)visibleOrigin
{
  double x = self->_visibleOrigin.x;
  double y = self->_visibleOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setVisibleSize:(CGSize)a3
{
  self->_visibleSize = a3;
}

- (CGSize)visibleSize
{
  double width = self->_visibleSize.width;
  double height = self->_visibleSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setReferenceSize:(CGSize)a3
{
  self->_referenceSize = a3;
}

- (CGSize)referenceSize
{
  double width = self->_referenceSize.width;
  double height = self->_referenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)shouldFlipHorizontally
{
  if (objc_msgSend(MEMORY[0x1E4F1CA20], "px_currentCharacterDirection") != 2)
  {
    v3 = +[PXTilingSettings sharedInstance];
    int v4 = [v3 flipLayoutsHorizontally];

    if (!v4) {
      return 0;
    }
  }
  return [(PXTilingLayout *)self allowHorizontalFlip];
}

- (BOOL)allowHorizontalFlip
{
  return 1;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(PXTilingLayout *)self observer];
  [v5 tilingLayout:self invalidatedWithContext:v4];
}

- (void)invalidateLayout
{
  v3 = objc_alloc_init(PXTilingLayoutInvalidationContext);
  [(PXTilingLayoutInvalidationContext *)v3 setTag:@"Generic Invalidate Everything"];
  [(PXTilingLayoutInvalidationContext *)v3 invalidateEverything];
  [(PXTilingLayout *)self invalidateLayoutWithContext:v3];
}

- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6
{
  v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  [v8 handleFailureInMethod:a2 object:self file:@"PXTilingLayout.m" lineNumber:55 description:@"must be implemented by concrete subclass"];

  return 0;
}

- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 handleFailureInMethod:a2 object:self file:@"PXTilingLayout.m" lineNumber:51 description:@"must be implemented by concrete subclass"];
}

- (CGRect)scrollBounds
{
}

- (CGRect)contentBounds
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXTilingLayout.m" lineNumber:39 description:@"must be implemented by concrete subclass"];

  double v5 = *MEMORY[0x1E4F1DB20];
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (CGRect)visibleRect
{
  [(PXTilingLayout *)self visibleOrigin];
  double v4 = v3;
  double v6 = v5;
  [(PXTilingLayout *)self visibleSize];
  double v8 = v7;
  double v10 = v9;
  double v11 = v4;
  double v12 = v6;
  result.size.double height = v10;
  result.size.double width = v8;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (PXTilingLayout)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXTilingLayout;
  v2 = [(PXTilingLayout *)&v6 init];
  if (v2)
  {
    double v3 = objc_alloc_init(PXTilingCoordinateSpace);
    coordinateSpace = v2->_coordinateSpace;
    v2->_coordinateSpace = v3;

    v2->_coordinateSpaceIdentifier = [(PXTilingCoordinateSpace *)v2->_coordinateSpace identifier];
  }
  return v2;
}

@end