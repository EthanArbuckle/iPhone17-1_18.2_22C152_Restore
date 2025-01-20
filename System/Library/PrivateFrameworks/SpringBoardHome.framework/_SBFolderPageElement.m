@interface _SBFolderPageElement
- (BOOL)isGridImagePossible;
- (CALayer)gridLayer;
- (SBFolderIcon)folderIcon;
- (SBIconGridImage)gridImage;
- (UIImage)image;
- (unint64_t)firstVisibleMiniIconIndex;
- (unint64_t)firstVisibleRowForGap;
- (unint64_t)pageIndex;
- (unint64_t)visibleRow;
- (void)setFolderIcon:(id)a3;
- (void)setGridImagePossible:(BOOL)a3;
- (void)setGridLayer:(id)a3;
- (void)setImage:(id)a3;
- (void)setPageIndex:(unint64_t)a3;
- (void)setVisibleRow:(unint64_t)a3;
@end

@implementation _SBFolderPageElement

- (unint64_t)pageIndex
{
  return self->_pageIndex;
}

- (void)setImage:(id)a3
{
}

- (unint64_t)firstVisibleMiniIconIndex
{
  v3 = [(_SBFolderPageElement *)self gridImage];
  unint64_t v4 = [(_SBFolderPageElement *)self visibleRow];
  unint64_t v5 = [v3 numberOfColumns] * v4;

  return v5;
}

- (void)setPageIndex:(unint64_t)a3
{
  self->_pageIndex = a3;
}

- (void)setFolderIcon:(id)a3
{
}

- (unint64_t)visibleRow
{
  return self->_visibleRow;
}

- (void)setVisibleRow:(unint64_t)a3
{
  self->_visibleRow = a3;
}

- (void)setGridImagePossible:(BOOL)a3
{
  self->_gridImagePossible = a3;
}

- (SBIconGridImage)gridImage
{
  v2 = [(_SBFolderPageElement *)self image];
  v3 = self;
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v2;
  }
  else {
    unint64_t v4 = 0;
  }
  unint64_t v5 = v4;

  return v5;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)isGridImagePossible
{
  return self->_gridImagePossible;
}

- (CALayer)gridLayer
{
  return self->_gridLayer;
}

- (void)setGridLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_folderIcon);
  objc_storeStrong((id *)&self->_gridLayer, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (unint64_t)firstVisibleRowForGap
{
  return 0;
}

- (SBFolderIcon)folderIcon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folderIcon);
  return (SBFolderIcon *)WeakRetained;
}

@end