@interface UITabOutlineView
@end

@implementation UITabOutlineView

id __41___UITabOutlineView__createViewHierarchy__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [[UICollectionLayoutListConfiguration alloc] initWithAppearance:3];
  v7 = +[UIColor clearColor];
  [(UICollectionLayoutListConfiguration *)v6 setBackgroundColor:v7];

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __41___UITabOutlineView__createViewHierarchy__block_invoke_2;
  v30[3] = &unk_1E5310B08;
  objc_copyWeak(&v31, (id *)(a1 + 32));
  [(UICollectionLayoutListConfiguration *)v6 setLeadingSwipeActionsConfigurationProvider:v30];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __41___UITabOutlineView__createViewHierarchy__block_invoke_3;
  v28 = &unk_1E5310B08;
  objc_copyWeak(&v29, (id *)(a1 + 32));
  [(UICollectionLayoutListConfiguration *)v6 setTrailingSwipeActionsConfigurationProvider:&v25];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained) {
    id v10 = WeakRetained[56];
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;
  int v12 = objc_msgSend(v11, "isEditing", v25, v26, v27, v28);

  if (a2 >= 1) {
    [(UICollectionLayoutListConfiguration *)v6 setHeaderMode:2];
  }
  if ((v12 & 1) == 0)
  {
    if (a2 || !v9)
    {
      if (!v9) {
        goto LABEL_14;
      }
    }
    else
    {
      v13 = [v9 _headerContentConfiguration];
      BOOL v14 = v13 == 0;

      if (!v14) {
        [(UICollectionLayoutListConfiguration *)v6 setHeaderMode:1];
      }
    }
    v15 = [v9 _footerContentConfiguration];
    if (v15)
    {
      BOOL v16 = [v9[68] numberOfSections] - 1 == a2;

      if (v16) {
        [(UICollectionLayoutListConfiguration *)v6 setFooterMode:1];
      }
    }
  }
LABEL_14:
  v17 = [off_1E52D2B28 sectionWithListConfiguration:v6 layoutEnvironment:v5];
  v18 = v17;
  if (v12)
  {
    [v17 setInterGroupSpacing:2.0];
    if (!a2)
    {
      if (*((unsigned char *)v9 + 416))
      {
        v19 = [off_1E52D2B08 fractionalWidthDimension:1.0];
        v20 = [off_1E52D2B08 estimatedDimension:32.0];
        v21 = [off_1E52D2B30 sizeWithWidthDimension:v19 heightDimension:v20];

        v22 = [off_1E52D2AF8 boundarySupplementaryItemWithLayoutSize:v21 elementKind:@"UITabOutlineView.EditHeader" alignment:1];
        v32[0] = v22;
        v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
        [v18 setBoundarySupplementaryItems:v23];
      }
    }
  }

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);

  return v18;
}

id __41___UITabOutlineView__createViewHierarchy__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _leadingSwipeActionsConfigurationForItemAtIndexPath:v3];

  return v5;
}

id __41___UITabOutlineView__createViewHierarchy__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained _trailingSwipeActionsConfigurationForItemAtIndexPath:v3];

  return v5;
}

void __41___UITabOutlineView__createViewHierarchy__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v7) {
      v7[868] &= ~1u;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __41___UITabOutlineView__createViewHierarchy__block_invoke_5;
    v12[3] = &unk_1E5310B30;
    objc_copyWeak(&v15, v10);
    id v13 = v9;
    id v14 = v8;
    [v7 setConfigurationUpdateHandler:v12];

    objc_destroyWeak(&v15);
  }
}

void __41___UITabOutlineView__createViewHierarchy__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _updateConfigurationForCell:v8 inState:v5 content:*(void *)(a1 + 32) indexPath:*(void *)(a1 + 40)];
  }
}

id __41___UITabOutlineView__createViewHierarchy__block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    int v12 = [WeakRetained contentByIdentifier];
    id v13 = [v12 objectForKey:v9];

    id v14 = [v7 dequeueConfiguredReusableCellWithRegistration:*(void *)(a1 + 32) forIndexPath:v8 item:v13];
    id v15 = [v11 dataSource];
    BOOL v16 = objc_msgSend(v15, "sectionIdentifierForIndex:", objc_msgSend(v8, "section"));

    v17 = [v11 dataSource];
    v18 = [v17 snapshotForSection:v16];

    uint64_t v19 = [v18 levelOfItem:v9];
    if (v19 <= 1) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = v19;
    }
    [v14 setIndentationLevel:v20 - 1];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

void __41___UITabOutlineView__createViewHierarchy__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if ([v5 isEqualToString:@"UICollectionElementKindSectionHeader"])
    {
      uint64_t v7 = [WeakRetained _headerContentConfiguration];
LABEL_6:
      id v8 = (void *)v7;
LABEL_7:
      [v16 setContentConfiguration:v8];

      goto LABEL_8;
    }
    if ([v5 isEqualToString:@"UICollectionElementKindSectionFooter"])
    {
      uint64_t v7 = [WeakRetained _footerContentConfiguration];
      goto LABEL_6;
    }
    if ([v5 isEqualToString:@"UITabOutlineView.EditHeader"])
    {
      id v8 = +[UIListContentConfiguration cellConfiguration];
      id v9 = _UINSLocalizedStringWithDefaultValue(@"Drag to customize items in the sidebar or tab bar.", @"Drag to customize items in the sidebar or tab bar.");
      [v8 setText:v9];

      id v10 = +[UIColor secondaryLabelColor];
      id v11 = [v8 textProperties];
      [v11 setColor:v10];

      int v12 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleFootnote"];
      id v13 = [v8 textProperties];
      [v13 setFont:v12];

      id v14 = [v8 textProperties];
      [v14 setNumberOfLines:0];

      id v15 = [v8 textProperties];
      [v15 setAdjustsFontSizeToFitWidth:0];

      goto LABEL_7;
    }
  }
LABEL_8:
}

id __41___UITabOutlineView__createViewHierarchy__block_invoke_8(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"UICollectionElementKindSectionHeader"])
  {
    id v10 = a1 + 4;
LABEL_7:
    id v11 = [v7 dequeueConfiguredReusableSupplementaryViewWithRegistration:*v10 forIndexPath:v9];
    goto LABEL_8;
  }
  if ([v8 isEqualToString:@"UICollectionElementKindSectionFooter"])
  {
    id v10 = a1 + 5;
    goto LABEL_7;
  }
  if ([v8 isEqualToString:@"UITabOutlineView.EditHeader"])
  {
    id v10 = a1 + 6;
    goto LABEL_7;
  }
  id v11 = 0;
LABEL_8:

  return v11;
}

uint64_t __41___UITabOutlineView__createViewHierarchy__block_invoke_9(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained contentByIdentifier];
  v6 = [v5 objectForKey:v3];

  id v7 = [v6 tab];

  if (v7 && (!WeakRetained ? (id v8 = 0) : (id v8 = (void *)WeakRetained[56]), [v8 isEditing])) {
    uint64_t v9 = [v7 _canBeReordered];
  }
  else {
    uint64_t v9 = 0;
  }

  return v9;
}

void __41___UITabOutlineView__createViewHierarchy__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained activeTransaction];
  if (WeakRetained) {
    id v3 = (void *)WeakRetained[56];
  }
  else {
    id v3 = 0;
  }
  if ([v3 isEditing] && !v2)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    id v5 = v4;
    if (WeakRetained) {
      uint64_t v6 = WeakRetained[56];
    }
    else {
      uint64_t v6 = 0;
    }
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 40), v6);
  }
  else if (v2)
  {
    goto LABEL_7;
  }
  [WeakRetained _activateNewSidebarTransaction];
LABEL_7:
}

void __41___UITabOutlineView__createViewHierarchy__block_invoke_11(uint64_t a1, void *a2)
{
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [WeakRetained activeTransaction];
  id v5 = v11;
  uint64_t v6 = (void *)v4;
  if (!v4)
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v11);
    uint64_t v9 = v8;
    if (WeakRetained) {
      uint64_t v10 = WeakRetained[56];
    }
    else {
      uint64_t v10 = 0;
    }
    [v8 handleFailureInMethod:*(void *)(a1 + 40), WeakRetained, @"_UITabOutlineView.m", 472, @"UIKit internal error: UITabBarController sidebar received a did reorder callback, but we don't have an active transaction. Tab model: %@", v10 object file lineNumber description];

    id v5 = v11;
  }
  [v6 updateUsingTransaction:v5];
  if (WeakRetained) {
    id v7 = (void *)WeakRetained[56];
  }
  else {
    id v7 = 0;
  }
  if (([v7 isEditing] & 1) == 0) {
    [WeakRetained _commitCurrentSidebarTransaction];
  }
}

void __41___UITabOutlineView__createViewHierarchy__block_invoke_12(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained editingCollapsedSectionIdentifiers];
    [v6 removeObject:v3];

    id v7 = [v5 collapsedSectionIdentifiers];
    [v7 removeObject:v3];

    id v8 = v5[56];
    uint64_t v9 = [v8 customizationStore];
    uint64_t v10 = [v5 dataSource];

    id v11 = [v10 snapshot];
    int v12 = [v11 sectionIdentifiers];
    [v9 removeCollapsedSectionIdentifier:v3 availableIdentifiers:v12];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41___UITabOutlineView__createViewHierarchy__block_invoke_13;
    block[3] = &unk_1E52D9F70;
    block[4] = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __41___UITabOutlineView__createViewHierarchy__block_invoke_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSelectedItemAnimated:1];
}

void __41___UITabOutlineView__createViewHierarchy__block_invoke_14(uint64_t a1, void *a2)
{
  id v22 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained dataSource];
    id v7 = [v6 snapshot];

    id v8 = [v5 editingCollapsedSectionIdentifiers];
    [v8 addObject:v22];

    uint64_t v9 = [v5 collapsedSectionIdentifiers];
    [v9 addObject:v22];

    id v10 = v5[56];
    id v11 = [v10 customizationStore];
    int v12 = [v7 sectionIdentifiers];
    [v11 addCollapsedSectionIdentifier:v22 availableIdentifiers:v12];

    id v13 = [v5 collectionView];
    id v14 = [v13 indexPathsForSelectedItems];

    if (([v5 isEditing] & 1) == 0 && objc_msgSend(v14, "count") == 1)
    {
      id v15 = [v7 sectionIdentifierForSectionContainingItemIdentifier:v22];
      uint64_t v16 = [v7 indexOfSectionIdentifier:v15];
      v17 = [v14 objectAtIndexedSubscript:0];
      if ([v17 section] == v16)
      {
        v18 = [v5 dataSource];
        uint64_t v19 = [v18 itemIdentifierForIndexPath:v17];

        uint64_t v20 = [v5 dataSource];
        v21 = [v20 snapshotForSection:v15];

        if (v19 && [v21 containsItem:v19]) {
          objc_storeStrong((id *)(*(void *)(a1 + 32) + 424), a2);
        }
      }
    }
  }
}

void __68___UITabOutlineView__dataSourceUpdateGroupCompletionCreateIfNeeded___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[73];
    WeakRetained[73] = 0;
    id v3 = WeakRetained;

    id WeakRetained = v3;
  }
}

void __40___UITabOutlineView_updateBottomBarView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    [WeakRetained setNeedsLayout];
    BOOL v3 = +[UIView _isInAnimationBlockWithAnimationsEnabled];
    v2 = v4;
    if (v3)
    {
      [v4 layoutIfNeeded];
      v2 = v4;
    }
  }
}

void __51___UITabOutlineView__tabModel_tabContentDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    v2 = [WeakRetained updatedTabsDuringApplySnapshot];
    BOOL v3 = (void *)v4[74];
    v4[74] = 0;

    if ([v2 count]) {
      [v4 _reconfigureItemsInDataSourceForTabs:v2 animated:1];
    }

    id WeakRetained = v4;
  }
}

void __45___UITabOutlineView__updateEditBarButtonItem__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (!*((unsigned char *)WeakRetained + 411))
  {
    BOOL v3 = WeakRetained;
    [WeakRetained[56] setEditing:*(unsigned char *)(a1 + 40) == 0];
    id WeakRetained = v3;
  }
}

void __45___UITabOutlineView__updateEditBarButtonItem__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) navigationBar];
  [v1 layoutIfNeeded];
}

void __41___UITabOutlineView_setEditing_animated___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  BOOL v3 = [*(id *)(a1 + 32) collectionView];
  [v3 setEditing:v2];

  id v6 = [*(id *)(a1 + 32) dataSource];
  uint64_t v4 = [*(id *)(a1 + 32) dataSource];
  id v5 = [v4 snapshot];
  [v6 applySnapshot:v5 animatingDifferences:1];
}

void __41___UITabOutlineView_setEditing_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  BOOL v3 = [*(id *)(a1 + 32) collectionView];
  [v3 setEditing:v2];

  id v6 = [*(id *)(a1 + 32) dataSource];
  uint64_t v4 = [*(id *)(a1 + 32) dataSource];
  id v5 = [v4 snapshot];
  [v6 applySnapshot:v5 animatingDifferences:0];
}

void __53___UITabOutlineView__commitCurrentSidebarTransaction__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) activeTransaction];
  [v1 commit];
}

void __38___UITabOutlineView__tabsByIdentifier__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [v5 tab];

  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [v5 tab];
    [v7 setObject:v8 forKey:v9];
  }
}

void __61___UITabOutlineView_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    BOOL v3 = *(void **)(v2 + 448);
  }
  else {
    BOOL v3 = 0;
  }
  if ([v3 isEditing])
  {
    uint64_t v4 = [*(id *)(a1 + 32) activeTransaction];

    if (!v4)
    {
      int v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"_UITabOutlineView.m" lineNumber:1655 description:@"Cannot edit an item without an active transaction"];
    }
    id v5 = [*(id *)(a1 + 32) activeTransaction];
    [v5 updateTab:*(void *)(a1 + 40) toHidden:0];

    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      id v7 = *(void **)(v6 + 448);
    }
    else {
      id v7 = 0;
    }
    uint64_t v8 = *(void *)(a1 + 40);
    [v7 visibilityDidChangeForTab:v8 editing:1];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      id v10 = *(void **)(v9 + 448);
    }
    else {
      id v10 = 0;
    }
    id v11 = *(id *)(a1 + 40);
    [v10 selectElement:v11 notifyOnReselection:1];
    -[_UITabOutlineView delegate](*(id **)(a1 + 32));
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    [v13 outlineView:*(void *)(a1 + 32) didSelectTab:v11];
  }
}

uint64_t __63___UITabOutlineView_collectionView_didDeselectItemAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activeTransaction];
  [v2 updateTab:*(void *)(a1 + 40) toHidden:1];

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    uint64_t v4 = *(void **)(v3 + 448);
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  return [v4 visibilityDidChangeForTab:v5 editing:1];
}

uint64_t __94___UITabOutlineView_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) collectionView];
  [v2 selectItemAtIndexPath:*(void *)(a1 + 40) animated:1 scrollPosition:0];

  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v5 = *(void **)(a1 + 32);
  return [v5 collectionView:v3 didSelectItemAtIndexPath:v4];
}

void __71___UITabOutlineView_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void *)(v4 + 464);
  }
  else {
    uint64_t v5 = 0;
  }
  id v13 = v3;
  -[UITabBarControllerSidebar _willDisplayTab:](v5, v3);
  uint64_t v6 = *(unsigned char **)(a1 + 32);
  if (v6[434]
    || ([v6 updatedTabsDuringApplySnapshot],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 containsObject:v13],
        v7,
        v8))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      *(unsigned char *)(v9 + 868) &= ~1u;
    }
    id v10 = [*(id *)(a1 + 48) configurationState];
    id v11 = +[_UITabSidebarContent contentForTab:v13];
    [*(id *)(a1 + 32) _updateConfigurationForCell:*(void *)(a1 + 40) inState:v10 content:v11 indexPath:*(void *)(a1 + 56)];
    int v12 = [*(id *)(a1 + 32) updatedTabsDuringApplySnapshot];
    [v12 removeObject:v13];
  }
}

@end