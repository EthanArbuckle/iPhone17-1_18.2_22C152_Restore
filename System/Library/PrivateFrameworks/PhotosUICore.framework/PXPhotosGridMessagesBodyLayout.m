@interface PXPhotosGridMessagesBodyLayout
- (PXAssetsDataSource)dataSource;
- (PXPhotosGridAssetDecorationSource)assetDecorationSource;
- (PXPhotosGridMessagesBodyLayout)init;
- (PXPhotosGridMessagesLayoutSpec)spec;
- (double)cornerRadiusForShadowSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)assetForItemIndex:(int64_t)a3;
- (id)assetReferenceForItemIndex:(int64_t)a3;
- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4;
- (id)shadowForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)section;
- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3;
- (unint64_t)supportedDisplayAssetPresentationStylesInLayout:(id)a3;
- (void)_updateNumberOfColumns;
- (void)setDataSource:(id)a3 section:(int64_t)a4;
- (void)setSpec:(id)a3;
@end

@implementation PXPhotosGridMessagesBodyLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_assetDecorationSource, 0);
  objc_storeStrong((id *)&self->_contentShadow, 0);
  objc_storeStrong((id *)&self->_cachedClampedFetchResult, 0);
}

- (PXPhotosGridMessagesLayoutSpec)spec
{
  return self->_spec;
}

- (PXAssetsDataSource)dataSource
{
  return self->_dataSource;
}

- (int64_t)section
{
  return self->_section;
}

- (PXPhotosGridAssetDecorationSource)assetDecorationSource
{
  return self->_assetDecorationSource;
}

- (double)cornerRadiusForShadowSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  v4 = [(PXPhotosGridMessagesBodyLayout *)self spec];
  [v4 itemCornerRadius];
  double v6 = v5;

  return v6;
}

- (id)shadowForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return self->_contentShadow;
}

- (unint64_t)supportedDisplayAssetPresentationStylesInLayout:(id)a3
{
  return 1;
}

- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v17);
    v18 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v14 handleFailureInMethod:a2, self, @"PXPhotosGridMessagesBodyLayout.m", 106, @"%@ should be an instance inheriting from %@, but it is %@", @"layout", v16, v18 object file lineNumber description];
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    [v14 handleFailureInMethod:a2, self, @"PXPhotosGridMessagesBodyLayout.m", 106, @"%@ should be an instance inheriting from %@, but it is nil", @"layout", v16 object file lineNumber description];
  }

LABEL_3:
  uint64_t v7 = [v6 itemForSpriteIndex:0];
  uint64_t v8 = [v6 numberOfItems] - v7;
  BOOL v9 = self->_cachedClampedItemRange.location == v7 && self->_cachedClampedItemRange.length == v8;
  if (!v9 || (cachedClampedFetchResult = self->_cachedClampedFetchResult) == 0)
  {
    v12 = [(PXPhotosGridMessagesBodyLayout *)self dataSource];
    v19[0] = [v12 identifier];
    v19[1] = [(PXPhotosGridMessagesBodyLayout *)self section];
    int64x2_t v20 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    [v12 assetsInSectionIndexPath:v19];
    objc_claimAutoreleasedReturnValue();
    PXDisplayAssetFetchResultSubfetchResultWithRange();
  }
  v11 = cachedClampedFetchResult;

  return v11;
}

- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3
{
  return 1;
}

- (id)assetReferenceForItemIndex:(int64_t)a3
{
  double v5 = [(PXPhotosGridMessagesBodyLayout *)self dataSource];
  v8[0] = [v5 identifier];
  v8[1] = [(PXPhotosGridMessagesBodyLayout *)self section];
  v8[2] = a3;
  v8[3] = 0x7FFFFFFFFFFFFFFFLL;
  id v6 = [v5 assetReferenceAtItemIndexPath:v8];

  return v6;
}

- (id)assetForItemIndex:(int64_t)a3
{
  double v5 = [(PXPhotosGridMessagesBodyLayout *)self dataSource];
  v8[0] = [v5 identifier];
  v8[1] = [(PXPhotosGridMessagesBodyLayout *)self section];
  v8[2] = a3;
  v8[3] = 0x7FFFFFFFFFFFFFFFLL;
  id v6 = [v5 assetAtItemIndexPath:v8];

  return v6;
}

- (void)setDataSource:(id)a3 section:(int64_t)a4
{
  id v7 = a3;
  if (*(_OWORD *)&self->_section != __PAIR128__((unint64_t)v7, a4))
  {
    id v10 = v7;
    objc_storeStrong((id *)&self->_dataSource, a3);
    self->_section = a4;
    uint64_t v8 = [(PXPhotosGridMessagesBodyLayout *)self assetDecorationSource];
    [v8 setDataSource:v10 section:a4];

    self->_cachedClampedItemRange = (_NSRange)xmmword_1AB359BD0;
    cachedClampedFetchResult = self->_cachedClampedFetchResult;
    self->_cachedClampedFetchResult = 0;

    [(PXPhotosGridMessagesBodyLayout *)self _updateNumberOfColumns];
    id v7 = v10;
  }
}

- (void)_updateNumberOfColumns
{
  v3 = [(PXPhotosGridMessagesBodyLayout *)self dataSource];
  if ([v3 numberOfSections] < 1)
  {
    uint64_t v5 = 0;
  }
  else
  {
    v4 = [(PXPhotosGridMessagesBodyLayout *)self dataSource];
    uint64_t v5 = [v4 numberOfItemsInSection:0];
  }
  id v7 = [(PXPhotosGridMessagesBodyLayout *)self spec];
  if (v7)
  {
    id v6 = [(PXPhotosGridMessagesBodyLayout *)self spec];
    -[PXGGridLayout setNumberOfColumns:](self, "setNumberOfColumns:", [v6 numberOfColumnsForNumberOfItems:v5]);
  }
  else
  {
    [(PXGGridLayout *)self setNumberOfColumns:4];
  }
}

- (void)setSpec:(id)a3
{
  BOOL v9 = (PXPhotosGridMessagesLayoutSpec *)a3;
  if (self->_spec != v9)
  {
    objc_storeStrong((id *)&self->_spec, a3);
    [(PXPhotosGridMessagesLayoutSpec *)v9 interItemSpacing];
    -[PXGGridLayout setInterItemSpacing:](self, "setInterItemSpacing:");
    [(PXPhotosGridMessagesLayoutSpec *)v9 padding];
    -[PXGGridLayout setPadding:](self, "setPadding:");
    [(PXPhotosGridMessagesLayoutSpec *)v9 itemCornerRadius];
    *(float *)&double v5 = v5;
    LODWORD(v6) = LODWORD(v5);
    LODWORD(v7) = LODWORD(v5);
    LODWORD(v8) = LODWORD(v5);
    -[PXGGridLayout setItemCornerRadius:](self, "setItemCornerRadius:", v5, v6, v7, v8);
    [(PXPhotosGridMessagesBodyLayout *)self _updateNumberOfColumns];
  }
}

- (PXPhotosGridMessagesBodyLayout)init
{
  v17.receiver = self;
  v17.super_class = (Class)PXPhotosGridMessagesBodyLayout;
  v2 = [(PXGGridLayout *)&v17 init];
  v3 = v2;
  if (v2)
  {
    [(PXGGridLayout *)v2 setMediaKind:2];
    [(PXGGridLayout *)v3 setPresentationType:0];
    [(PXGItemsLayout *)v3 setLazy:1];
    [(PXGLayout *)v3 setContentSource:v3];
    [(PXGGridLayout *)v3 setContentMode:1];
    [(PXGGridLayout *)v3 setEnablePerItemMargin:1];
    v4 = +[PXMessagesUISettings sharedInstance];
    double v5 = objc_alloc_init(PXPhotosGridAssetDecorationSource);
    [(PXPhotosGridAssetDecorationSource *)v5 setDecoratedLayout:v3];
    [(PXPhotosGridAssetDecorationSource *)v5 setForbiddenBadges:0xFFFFFFFDFFFFFFFFLL];
    assetDecorationSource = v3->_assetDecorationSource;
    v3->_assetDecorationSource = v5;
    double v7 = v5;

    double v8 = (NSShadow *)objc_alloc_init(MEMORY[0x1E4FB0858]);
    contentShadow = v3->_contentShadow;
    v3->_contentShadow = v8;

    [v4 gridShadowXOffset];
    double v11 = v10;
    [v4 gridShadowYOffset];
    -[NSShadow setShadowOffset:](v3->_contentShadow, "setShadowOffset:", v11, v12);
    [v4 gridShadowBlurRadius];
    -[NSShadow setShadowBlurRadius:](v3->_contentShadow, "setShadowBlurRadius:");
    v13 = (void *)MEMORY[0x1E4FB1618];
    [v4 gridShadowAlpha];
    v15 = [v13 colorWithWhite:0.0 alpha:v14];
    [(NSShadow *)v3->_contentShadow setShadowColor:v15];
  }
  return v3;
}

@end