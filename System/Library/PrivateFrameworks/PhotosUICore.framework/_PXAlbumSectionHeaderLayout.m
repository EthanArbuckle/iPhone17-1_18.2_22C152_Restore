@interface _PXAlbumSectionHeaderLayout
- (BOOL)allowsFloatingBackground;
- (BOOL)alwaysWantsBackground;
- (BOOL)areAllItemsSelected;
- (BOOL)isInSelectMode;
- (BOOL)wantsBackground;
- (PXAssetsDataSource)dataSource;
- (PXPhotosLayoutSpec)spec;
- (PXPhotosSectionHeaderLayoutViewProvider)viewProvider;
- (PXSelectionSnapshot)selectionSnapshot;
- (PXSimpleIndexPath)sectionIndexPath;
- (_PXAlbumSectionHeaderLayout)init;
- (_PXAlbumSectionHeaderLayout)initWithSpec:(id)a3;
- (_PXAlbumSectionHeaderLayoutInteractionDelegate)interactionDelegate;
- (void)_setAreAllItemsSelected:(BOOL)a3;
- (void)_setWantsBackground:(BOOL)a3;
- (void)_updateWantsBackground;
- (void)didTapHeaderView:(id)a3;
- (void)floatingOffsetDidChange;
- (void)headerView:(id)a3 actionButtonPressed:(id)a4;
- (void)setAllowsFloatingBackground:(BOOL)a3;
- (void)setAlwaysWantsBackground:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)setIsInSelectMode:(BOOL)a3;
- (void)setSectionIndexPath:(PXSimpleIndexPath *)a3;
- (void)setSelectionSnapshot:(id)a3;
- (void)setSpec:(id)a3;
- (void)setViewProvider:(id)a3;
@end

@implementation _PXAlbumSectionHeaderLayout

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewProvider);
  objc_destroyWeak((id *)&self->_interactionDelegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

- (BOOL)allowsFloatingBackground
{
  return self->_allowsFloatingBackground;
}

- (BOOL)alwaysWantsBackground
{
  return self->_alwaysWantsBackground;
}

- (BOOL)wantsBackground
{
  return self->_wantsBackground;
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

- (_PXAlbumSectionHeaderLayoutInteractionDelegate)interactionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
  return (_PXAlbumSectionHeaderLayoutInteractionDelegate *)WeakRetained;
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
  return self->_dataSource;
}

- (BOOL)areAllItemsSelected
{
  return self->_areAllItemsSelected;
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

- (void)headerView:(id)a3 actionButtonPressed:(id)a4
{
  id v22 = a3;
  id v7 = a4;
  v8 = [v22 userData];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v19);
    v20 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v16 handleFailureInMethod:a2, self, @"PXAlbumSectionHeaderLayoutProvider+iOS.m", 394, @"%@ should be an instance inheriting from %@, but it is %@", @"[(id<PXGReusableView>)headerView userData]", v18, v20 object file lineNumber description];
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    [v16 handleFailureInMethod:a2, self, @"PXAlbumSectionHeaderLayoutProvider+iOS.m", 394, @"%@ should be an instance inheriting from %@, but it is nil", @"[(id<PXGReusableView>)headerView userData]", v18 object file lineNumber description];
  }

LABEL_3:
  switch([v8 actionType])
  {
    case 0:
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2 object:self file:@"PXAlbumSectionHeaderLayoutProvider+iOS.m" lineNumber:397 description:@"Code which should be unreachable has been reached"];

      abort();
    case 1:
      v9 = [(_PXAlbumSectionHeaderLayout *)self interactionDelegate];
      v10 = v9;
      v11 = self;
      uint64_t v12 = 1;
      goto LABEL_6;
    case 2:
      v9 = [(_PXAlbumSectionHeaderLayout *)self interactionDelegate];
      v10 = v9;
      v11 = self;
      uint64_t v12 = 0;
LABEL_6:
      [v9 sectionHeader:v11 didToggleSelectedState:v12];
      goto LABEL_10;
    case 3:
      v13 = [(_PXAlbumSectionHeaderLayout *)self interactionDelegate];
      v10 = v13;
      v14 = self;
      uint64_t v15 = 1;
      goto LABEL_9;
    case 4:
      v13 = [(_PXAlbumSectionHeaderLayout *)self interactionDelegate];
      v10 = v13;
      v14 = self;
      uint64_t v15 = 0;
LABEL_9:
      [v13 sectionHeader:v14 didToggleFiltersDisabled:v15];
LABEL_10:

      break;
    default:
      break;
  }
}

- (void)didTapHeaderView:(id)a3
{
  id v4 = [(_PXAlbumSectionHeaderLayout *)self interactionDelegate];
  [v4 didTapSectionHeader:self];
}

- (void)_updateWantsBackground
{
  long long v3 = [(_PXAlbumSectionHeaderLayout *)self viewProvider];
  id v4 = [(PXGSingleViewLayout *)self viewSpriteReference];
  v5 = [v3 sectionHeaderLayout:self viewForSpriteReference:v4];

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if ([(_PXAlbumSectionHeaderLayout *)self alwaysWantsBackground])
  {
    BOOL v7 = 1;
  }
  else
  {
    [(PXGLayout *)self floatingOffset];
    double v9 = v8;
    [v6 baselineToBottomSpacing];
    BOOL v7 = v9 > v10;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53___PXAlbumSectionHeaderLayout__updateWantsBackground__block_invoke;
  v11[3] = &unk_1E5DCFE98;
  v11[4] = self;
  BOOL v12 = v7;
  [(PXGLayout *)self performChangesWithLocalUpdate:v11];
}

- (void)floatingOffsetDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_PXAlbumSectionHeaderLayout;
  [(PXGLayout *)&v3 floatingOffsetDidChange];
  [(_PXAlbumSectionHeaderLayout *)self _updateWantsBackground];
}

- (void)setAllowsFloatingBackground:(BOOL)a3
{
  if (self->_allowsFloatingBackground != a3)
  {
    self->_allowsFloatingBackground = a3;
    [(_PXAlbumSectionHeaderLayout *)self _updateWantsBackground];
  }
}

- (void)setAlwaysWantsBackground:(BOOL)a3
{
  if (self->_alwaysWantsBackground != a3)
  {
    self->_alwaysWantsBackground = a3;
    [(_PXAlbumSectionHeaderLayout *)self _updateWantsBackground];
  }
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
    BOOL v7 = v6;
    char v8 = [(PXSelectionSnapshot *)v6 isEqual:v5];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_selectionSnapshot, a3);
      double v9 = [(PXSelectionSnapshot *)v5 dataSource];
      [(_PXAlbumSectionHeaderLayout *)self sectionIndexPath];
      double v10 = [off_1E5DA6F50 indexPathSetWithIndexPath:&v14];
      v11 = [v9 itemIndexPathsForSections:v10];

      BOOL v12 = [(PXSelectionSnapshot *)v5 selectedIndexPaths];
      uint64_t v13 = [v12 isSupersetOfSet:v11];

      [(_PXAlbumSectionHeaderLayout *)self _setAreAllItemsSelected:v13];
    }
  }
}

- (void)setIsInSelectMode:(BOOL)a3
{
  if (self->_isInSelectMode != a3)
  {
    self->_isInSelectMode = a3;
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
    [(PXGSingleViewLayout *)self viewContentDidChange];
    v5 = v6;
  }
}

- (_PXAlbumSectionHeaderLayout)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAlbumSectionHeaderLayoutProvider+iOS.m", 300, @"%s is not available as initializer", "-[_PXAlbumSectionHeaderLayout init]");

  abort();
}

- (_PXAlbumSectionHeaderLayout)initWithSpec:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXAlbumSectionHeaderLayout;
  id v6 = [(PXGSingleViewLayout *)&v9 init];
  BOOL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_spec, a3);
    v7->_allowsFloatingBackground = 1;
  }

  return v7;
}

@end