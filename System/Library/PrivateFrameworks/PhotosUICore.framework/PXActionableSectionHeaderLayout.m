@interface PXActionableSectionHeaderLayout
- (BOOL)alwaysWantsBackground;
- (BOOL)areAllItemsSelected;
- (BOOL)isInSelectMode;
- (BOOL)isTopHeader;
- (BOOL)wantsBackground;
- (PXActionableSectionHeaderLayout)init;
- (PXActionableSectionHeaderLayout)initWithSpec:(id)a3;
- (PXActionableSectionHeaderLayoutInteractionDelegate)interactionDelegate;
- (PXAssetsDataSource)dataSource;
- (PXPhotosLayoutSpec)spec;
- (PXPhotosSectionHeaderLayoutViewProvider)viewProvider;
- (PXSelectionSnapshot)selectionSnapshot;
- (PXSimpleIndexPath)sectionIndexPath;
- (id)axGroup;
- (void)_setAreAllItemsSelected:(BOOL)a3;
- (void)_setWantsBackground:(BOOL)a3;
- (void)floatingOffsetDidChange;
- (void)headerViewDidPressActionButton:(id)a3 inHeaderView:(id)a4;
- (void)scrollSpeedRegimeDidChange;
- (void)setAlwaysWantsBackground:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)setIsInSelectMode:(BOOL)a3;
- (void)setSectionIndexPath:(PXSimpleIndexPath *)a3;
- (void)setSelectionSnapshot:(id)a3;
- (void)setSpec:(id)a3;
- (void)setViewProvider:(id)a3;
@end

@implementation PXActionableSectionHeaderLayout

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewProvider);
  objc_destroyWeak((id *)&self->_interactionDelegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

- (void)setViewProvider:(id)a3
{
}

- (PXPhotosSectionHeaderLayoutViewProvider)viewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewProvider);
  return (PXPhotosSectionHeaderLayoutViewProvider *)WeakRetained;
}

- (void)setInteractionDelegate:(id)a3
{
}

- (PXActionableSectionHeaderLayoutInteractionDelegate)interactionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
  return (PXActionableSectionHeaderLayoutInteractionDelegate *)WeakRetained;
}

- (void)setAlwaysWantsBackground:(BOOL)a3
{
  self->_alwaysWantsBackground = a3;
}

- (BOOL)alwaysWantsBackground
{
  return self->_alwaysWantsBackground;
}

- (BOOL)wantsBackground
{
  return self->_wantsBackground;
}

- (BOOL)areAllItemsSelected
{
  return self->_areAllItemsSelected;
}

- (void)setSectionIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  *(_OWORD *)&self->_sectionIndexPath.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
  *(_OWORD *)&self->_sectionIndexPath.item = v3;
}

- (PXSimpleIndexPath)sectionIndexPath
{
  long long v3 = *(_OWORD *)&self[32].item;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[32].dataSourceIdentifier;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (void)setDataSource:(id)a3
{
}

- (PXAssetsDataSource)dataSource
{
  return (PXAssetsDataSource *)objc_getProperty(self, a2, 1000, 1);
}

- (PXSelectionSnapshot)selectionSnapshot
{
  return self->_selectionSnapshot;
}

- (BOOL)isInSelectMode
{
  return self->_isInSelectMode;
}

- (PXPhotosLayoutSpec)spec
{
  return self->_spec;
}

- (id)axGroup
{
  long long v3 = objc_alloc_init(PXGBasicAXGroup);
  v4 = [(PXActionableSectionHeaderLayout *)self accessibilityElements];
  [(PXGBasicAXGroup *)v3 setAccessibilityElements:v4];

  return v3;
}

- (void)headerViewDidPressActionButton:(id)a3 inHeaderView:(id)a4
{
  id v7 = a3;
  id v14 = [a4 userData];
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v12);
    v13 = objc_msgSend(v14, "px_descriptionForAssertionMessage");
    [v9 handleFailureInMethod:a2, self, @"PXActionableSectionHeaderLayoutProvider+iOS.m", 542, @"%@ should be an instance inheriting from %@, but it is %@", @"[(id<PXGReusableView>)headerView userData]", v11, v13 object file lineNumber description];
  }
  else
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v9 handleFailureInMethod:a2, self, @"PXActionableSectionHeaderLayoutProvider+iOS.m", 542, @"%@ should be an instance inheriting from %@, but it is nil", @"[(id<PXGReusableView>)headerView userData]", v11 object file lineNumber description];
  }

LABEL_3:
  v8 = [(PXActionableSectionHeaderLayout *)self interactionDelegate];
  objc_msgSend(v8, "sectionHeader:didPressButtonForActionType:sender:", self, objc_msgSend(v14, "actionType"), v7);
}

- (void)floatingOffsetDidChange
{
  v14.receiver = self;
  v14.super_class = (Class)PXActionableSectionHeaderLayout;
  [(PXGLayout *)&v14 floatingOffsetDidChange];
  long long v3 = [(PXActionableSectionHeaderLayout *)self viewProvider];
  v4 = [(PXGSingleViewLayout *)self viewSpriteReference];
  v5 = [v3 sectionHeaderLayout:self viewForSpriteReference:v4];

  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    uint64_t v7 = [v6 backgroundStyle];
    [(PXGLayout *)self floatingOffset];
    double v9 = v8;
    double v10 = 0.0;
    if (v7 != 3) {
      objc_msgSend(v6, "baselineToBottomSpacing", 0.0);
    }
    BOOL v11 = v9 > v10 || [(PXActionableSectionHeaderLayout *)self alwaysWantsBackground];
  }
  else
  {
    BOOL v11 = 0;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__PXActionableSectionHeaderLayout_floatingOffsetDidChange__block_invoke;
  v12[3] = &unk_1E5DCFE98;
  v12[4] = self;
  BOOL v13 = v11;
  [(PXGLayout *)self performChangesWithLocalUpdate:v12];
}

uint64_t __58__PXActionableSectionHeaderLayout_floatingOffsetDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setWantsBackground:*(unsigned __int8 *)(a1 + 40)];
}

- (void)scrollSpeedRegimeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXActionableSectionHeaderLayout;
  [(PXGLayout *)&v3 scrollSpeedRegimeDidChange];
  [(PXGSingleViewLayout *)self viewContentDidChange];
}

- (void)_setWantsBackground:(BOOL)a3
{
  if (self->_wantsBackground != a3)
  {
    self->_wantsBackground = a3;
    [(PXGSingleViewLayout *)self viewContentDidChange];
  }
}

- (void)_setAreAllItemsSelected:(BOOL)a3
{
  if (self->_areAllItemsSelected != a3)
  {
    self->_areAllItemsSelected = a3;
    [(PXGSingleViewLayout *)self viewContentDidChange];
  }
}

- (void)setSelectionSnapshot:(id)a3
{
  v5 = (PXSelectionSnapshot *)a3;
  id v6 = self->_selectionSnapshot;
  if (v6 == v5)
  {
  }
  else
  {
    uint64_t v7 = v6;
    char v8 = [(PXSelectionSnapshot *)v6 isEqual:v5];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_selectionSnapshot, a3);
      double v9 = [(PXSelectionSnapshot *)v5 dataSource];
      [(PXActionableSectionHeaderLayout *)self sectionIndexPath];
      double v10 = [off_1E5DA6F50 indexPathSetWithIndexPath:&v14];
      BOOL v11 = [v9 itemIndexPathsForSections:v10];

      v12 = [(PXSelectionSnapshot *)v5 selectedIndexPaths];
      uint64_t v13 = [v12 isSupersetOfSet:v11];

      [(PXActionableSectionHeaderLayout *)self _setAreAllItemsSelected:v13];
    }
  }
}

- (void)setIsInSelectMode:(BOOL)a3
{
  if (self->_isInSelectMode != a3)
  {
    self->_isInSelectMode = a3;
    [(PXGSingleViewLayout *)self viewSizeDidChange];
    [(PXGSingleViewLayout *)self viewContentDidChange];
  }
}

- (void)setSpec:(id)a3
{
  v5 = (PXPhotosLayoutSpec *)a3;
  if (self->_spec != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    [(PXGSingleViewLayout *)self viewSizeDidChange];
    [(PXGSingleViewLayout *)self viewContentDidChange];
    v5 = v6;
  }
}

- (BOOL)isTopHeader
{
  [(PXActionableSectionHeaderLayout *)self sectionIndexPath];
  return v3 == *(void *)off_1E5DAAED8;
}

- (PXActionableSectionHeaderLayout)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXActionableSectionHeaderLayoutProvider+iOS.m", 464, @"%s is not available as initializer", "-[PXActionableSectionHeaderLayout init]");

  abort();
}

- (PXActionableSectionHeaderLayout)initWithSpec:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXActionableSectionHeaderLayout;
  id v6 = [(PXGSingleViewLayout *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_spec, a3);
  }

  return v7;
}

@end