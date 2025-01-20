@interface _PXContentSyndicationSectionHeaderLayout
- (BOOL)isInSelectMode;
- (PXAssetCollectionActionManager)assetCollectionManager;
- (PXAssetsDataSource)dataSource;
- (PXContentSyndicationSectionHeaderView)sectionHeaderContentView;
- (PXContentSyndicationSocialLayerHighlightProvider)socialLayerHighlightProvider;
- (PXDisplayAsset)referenceAssetForHighlight;
- (PXPhotosLayoutSpec)spec;
- (PXSelectionSnapshot)selectionSnapshot;
- (PXSimpleIndexPath)sectionIndexPath;
- (SLHighlight)socialLayerHighlight;
- (_PXContentSyndicationSectionHeaderLayout)init;
- (_PXContentSyndicationSectionHeaderLayout)initWithSpec:(id)a3 socialLayerHighlightProvider:(id)a4;
- (id)additionalContextMenuActionsForAttributionViewInContentSyndicationHeaderView:(id)a3;
- (void)_updateReferenceAssetForHighlightIfNeeded;
- (void)setAssetCollectionManager:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setIsInSelectMode:(BOOL)a3;
- (void)setReferenceAssetForHighlight:(id)a3;
- (void)setSectionHeaderContentView:(id)a3;
- (void)setSectionIndexPath:(PXSimpleIndexPath *)a3;
- (void)setSelectionSnapshot:(id)a3;
- (void)setSocialLayerHighlight:(id)a3;
- (void)setSpec:(id)a3;
- (void)socialLayerHighlightProvider:(id)a3 didChangeSocialLayerHighlight:(id)a4 forAsset:(id)a5;
@end

@implementation _PXContentSyndicationSectionHeaderLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionManager, 0);
  objc_storeStrong((id *)&self->_socialLayerHighlight, 0);
  objc_storeStrong((id *)&self->_sectionHeaderContentView, 0);
  objc_storeStrong((id *)&self->_referenceAssetForHighlight, 0);
  objc_storeStrong((id *)&self->_socialLayerHighlightProvider, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

- (void)setAssetCollectionManager:(id)a3
{
}

- (PXAssetCollectionActionManager)assetCollectionManager
{
  return self->_assetCollectionManager;
}

- (void)setSocialLayerHighlight:(id)a3
{
}

- (SLHighlight)socialLayerHighlight
{
  return self->_socialLayerHighlight;
}

- (void)setSectionHeaderContentView:(id)a3
{
}

- (PXContentSyndicationSectionHeaderView)sectionHeaderContentView
{
  return self->_sectionHeaderContentView;
}

- (PXDisplayAsset)referenceAssetForHighlight
{
  return self->_referenceAssetForHighlight;
}

- (PXContentSyndicationSocialLayerHighlightProvider)socialLayerHighlightProvider
{
  return self->_socialLayerHighlightProvider;
}

- (void)setSectionIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  *(_OWORD *)&self->_sectionIndexPath.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
  *(_OWORD *)&self->_sectionIndexPath.item = v3;
}

- (PXSimpleIndexPath)sectionIndexPath
{
  long long v3 = *(_OWORD *)&self[33].section;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[32].subitem;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXAssetsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setSelectionSnapshot:(id)a3
{
}

- (PXSelectionSnapshot)selectionSnapshot
{
  return self->_selectionSnapshot;
}

- (void)setIsInSelectMode:(BOOL)a3
{
  self->_isInSelectMode = a3;
}

- (BOOL)isInSelectMode
{
  return self->_isInSelectMode;
}

- (PXPhotosLayoutSpec)spec
{
  return self->_spec;
}

- (id)additionalContextMenuActionsForAttributionViewInContentSyndicationHeaderView:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  v5 = @"PXAssetCollectionActionTypeContentSyndicationRemoveSuggestion";
  v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"trash"];
  v7 = [(_PXContentSyndicationSectionHeaderLayout *)self assetCollectionManager];
  if ([v7 canPerformActionType:@"PXAssetCollectionActionTypeContentSyndicationRemoveSuggestion"])
  {
    v8 = [v7 localizedTitleForActionType:@"PXAssetCollectionActionTypeContentSyndicationRemoveSuggestion" useCase:0];
    v9 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __121___PXContentSyndicationSectionHeaderLayout_additionalContextMenuActionsForAttributionViewInContentSyndicationHeaderView___block_invoke;
    v16 = &unk_1E5DCC0B8;
    id v17 = v7;
    v10 = @"PXAssetCollectionActionTypeContentSyndicationRemoveSuggestion";
    v18 = @"PXAssetCollectionActionTypeContentSyndicationRemoveSuggestion";
    v11 = [v9 actionWithTitle:v8 image:v6 identifier:0 handler:&v13];
    objc_msgSend(v4, "addObject:", v11, v13, v14, v15, v16);
  }
  return v4;
}

- (void)socialLayerHighlightProvider:(id)a3 didChangeSocialLayerHighlight:(id)a4 forAsset:(id)a5
{
  id v7 = a4;
  id v13 = [(PXGSingleViewLayout *)self contentView];
  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v11);
    v12 = objc_msgSend(v13, "px_descriptionForAssertionMessage");
    [v8 handleFailureInMethod:a2, self, @"PXContentSyndicationSectionHeaderLayoutProvider.m", 171, @"%@ should be an instance inheriting from %@, but it is %@", @"self.contentView", v10, v12 object file lineNumber description];
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [v8 handleFailureInMethod:a2, self, @"PXContentSyndicationSectionHeaderLayoutProvider.m", 171, @"%@ should be an instance inheriting from %@, but it is nil", @"self.contentView", v10 object file lineNumber description];
  }

LABEL_3:
  [v13 setSocialLayerHighlight:v7];

  [(PXGSingleViewLayout *)self viewSizeDidChange];
}

- (void)_updateReferenceAssetForHighlightIfNeeded
{
  long long v3 = [(_PXContentSyndicationSectionHeaderLayout *)self dataSource];
  int v4 = [v3 containsAnyItems];

  if (v4)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    v5 = [(_PXContentSyndicationSectionHeaderLayout *)self dataSource];
    v6 = v5;
    if (v5)
    {
      [v5 firstItemIndexPath];
    }
    else
    {
      long long v10 = 0u;
      long long v11 = 0u;
    }

    id v7 = [(_PXContentSyndicationSectionHeaderLayout *)self dataSource];
    v9[0] = v10;
    v9[1] = v11;
    v8 = [v7 assetAtItemIndexPath:v9];

    [(_PXContentSyndicationSectionHeaderLayout *)self setReferenceAssetForHighlight:v8];
  }
  else
  {
    [(_PXContentSyndicationSectionHeaderLayout *)self setReferenceAssetForHighlight:0];
  }
}

- (void)setReferenceAssetForHighlight:(id)a3
{
  long long v11 = (PXDisplayAsset *)a3;
  p_referenceAssetForHighlight = &self->_referenceAssetForHighlight;
  v6 = self->_referenceAssetForHighlight;
  id v7 = v11;
  if (v6 == v11) {
    goto LABEL_7;
  }
  v8 = v6;
  char v9 = -[PXDisplayAsset isEqual:](v6, "isEqual:");

  if ((v9 & 1) == 0)
  {
    if (*p_referenceAssetForHighlight)
    {
      long long v10 = [(_PXContentSyndicationSectionHeaderLayout *)self socialLayerHighlightProvider];
      [v10 unregisterChangeObserver:self forAsset:*p_referenceAssetForHighlight];
    }
    objc_storeStrong((id *)&self->_referenceAssetForHighlight, a3);
    if (*p_referenceAssetForHighlight)
    {
      id v7 = [(_PXContentSyndicationSectionHeaderLayout *)self socialLayerHighlightProvider];
      [v7 registerChangeObserver:self forAsset:*p_referenceAssetForHighlight];
LABEL_7:
    }
  }
}

- (void)setDataSource:(id)a3
{
  v8 = (PXAssetsDataSource *)a3;
  v5 = self->_dataSource;
  if (v5 == v8)
  {
  }
  else
  {
    v6 = v5;
    char v7 = [(PXAssetsDataSource *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_dataSource, a3);
      [(_PXContentSyndicationSectionHeaderLayout *)self _updateReferenceAssetForHighlightIfNeeded];
    }
  }
}

- (void)setSpec:(id)a3
{
  v5 = (PXPhotosLayoutSpec *)a3;
  if (self->_spec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    [(PXGSingleViewLayout *)self viewContentDidChange];
    v5 = v6;
  }
}

- (_PXContentSyndicationSectionHeaderLayout)init
{
  int v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXContentSyndicationSectionHeaderLayoutProvider.m", 120, @"%s is not available as initializer", "-[_PXContentSyndicationSectionHeaderLayout init]");

  abort();
}

- (_PXContentSyndicationSectionHeaderLayout)initWithSpec:(id)a3 socialLayerHighlightProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_PXContentSyndicationSectionHeaderLayout;
  char v9 = [(PXGSingleViewLayout *)&v16 init];
  long long v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_spec, a3);
    objc_storeStrong((id *)&v10->_socialLayerHighlightProvider, a4);
    long long v11 = [PXContentSyndicationSectionHeaderView alloc];
    uint64_t v12 = -[PXContentSyndicationSectionHeaderView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    sectionHeaderContentView = v10->_sectionHeaderContentView;
    v10->_sectionHeaderContentView = (PXContentSyndicationSectionHeaderView *)v12;

    [(PXContentSyndicationSectionHeaderView *)v10->_sectionHeaderContentView setDelegate:v10];
    [(PXGSingleViewLayout *)v10 setContentView:v10->_sectionHeaderContentView];
    uint64_t v14 = [(PXPhotosLayoutSpec *)v10->_spec sectionHeaderSpec];
    [(PXContentSyndicationSectionHeaderView *)v10->_sectionHeaderContentView setSpec:v14];
  }
  return v10;
}

@end