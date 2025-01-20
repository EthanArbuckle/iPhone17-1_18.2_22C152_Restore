@interface SFStartPageCollectionViewController
- ($0AC6E346AE4835514AAA8AC86D8F4844)_gridLocationForIndexPath:(id)a3 inSection:(id)a4;
- ($4E34F1DA1F1A31EFC59C0F9E582921FC)_siteIconLayoutForEnvironment:(SEL)a3 sectionInsets:(id)a4;
- (BOOL)_canDrop;
- (BOOL)_shouldShowContextMenuForCellAtIndexPath:(id)a3 fromPoint:(CGPoint)a4;
- (BOOL)_supportsPaginatedSectionLayouts;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)displaysSectionHeaders;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)hidesEmptyNavigationBar;
- (BOOL)isTrackingDropSession;
- (BOOL)wantsWallpaperHiddenForCurrentBackgroundStyle;
- (NSDirectionalEdgeInsets)_sectionContentInsets;
- (SFStartPageCollectionDataSource)dataSource;
- (SFStartPageCollectionDataSource)strongDataSource;
- (SFStartPageCollectionDelegate)delegate;
- (SFStartPageCollectionViewController)initWithVisualStyleProvider:(id)a3;
- (UIScrollView)scrollView;
- (double)_effectiveLayoutWidth;
- (double)scrollDistance;
- (id)_attributedRichLinkSectionLayoutForEnvironment:(id)a3 maximumNumberOfPages:(int64_t)a4 numberOfItems:(int64_t)a5;
- (id)_bannerSectionLayoutForEnvironment:(id)a3 includingHeader:(BOOL)a4;
- (id)_collectionView:(id)a3 supplementaryViewWithKind:(id)a4 forIndexPath:(id)a5;
- (id)_currentSnapshot;
- (id)_customizationSection;
- (id)_dragPreviewParametersForSourceView:(id)a3 atIndexPath:(id)a4;
- (id)_layoutForSectionAtIndex:(int64_t)a3 inEnvironment:(id)a4;
- (id)_makeCollectionViewLayout;
- (id)_previewForCellAtIndexPath:(id)a3;
- (id)_reuseIdentifierForCellWithIdentifier:(id)a3 indexPath:(id)a4;
- (id)_reuseIdentifierForCellWithIdentifier:(id)a3 section:(id)a4;
- (id)_sectionForIdentifier:(id)a3;
- (id)_siteCardSectionLayoutForEnvironment:(id)a3 numberOfItems:(int64_t)a4;
- (id)_siteIconSectionLayoutForEnvironment:(id)a3;
- (id)_siteRowSectionLayoutForEnvironment:(id)a3;
- (id)_squareRichLinkSectionLayoutForEnvironment:(id)a3 numberOfItems:(int64_t)a4;
- (id)_toggleExpandedActionForSectionIdentifier:(id)a3;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4;
- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4;
- (id)sections;
- (int64_t)_collapsedCapacityForSection:(id)a3;
- (int64_t)_collectionView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5;
- (int64_t)_collectionView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5;
- (int64_t)_numberOfColumnsInSection:(id)a3;
- (int64_t)_numberOfItemsPerPageInSection:(id)a3;
- (unint64_t)_itemLimitForSection:(id)a3;
- (void)_applyCurrentSnapshotAnimatingDifferences:(BOOL)a3;
- (void)_applyStylingToLayoutGroup:(id)a3 withSectionItemType:(int64_t)a4 defaultInterItemSpacing:(double)a5;
- (void)_configureCell:(id)a3 forIdentifier:(id)a4 indexPath:(id)a5;
- (void)_configureHeader:(id)a3 forSection:(id)a4 atIndexPath:(id)a5;
- (void)_receivedTapToDismissGesture;
- (void)_setUpDataSource:(id)a3;
- (void)_updateCustomTopBackdrops;
- (void)_updateInteractionEnabled;
- (void)_updateInteractionEnabledForView:(id)a3;
- (void)_updateNavigationItemAnimated:(BOOL)a3;
- (void)cancelGestures;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)configureModelWithIdentifier:(id)a3 usingBlock:(id)a4;
- (void)ignorePreviousLayoutSize;
- (void)keyboardDidChangeFrame:(id)a3;
- (void)presentViewController:(id)a3 fromItemWithIdentifier:(id)a4;
- (void)reloadDataAnimatingDifferences:(BOOL)a3;
- (void)reloadNavigationItemAnimated:(BOOL)a3;
- (void)reloadSection:(id)a3 animated:(BOOL)a4;
- (void)scrollToTop;
- (void)scrollViewDidScroll:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplaysSectionHeaders:(BOOL)a3;
- (void)setHidesEmptyNavigationBar:(BOOL)a3;
- (void)setStrongDataSource:(id)a3;
- (void)updateBackgroundStyle;
- (void)updateCollectionViewContentInset;
- (void)updateKeyboardBottomInsetFromKeyboardFrame:(CGRect)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SFStartPageCollectionViewController

uint64_t __81__SFStartPageCollectionViewController__applyCurrentSnapshotAnimatingDifferences___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 992) itemIdentifierForIndexPath:a2];
}

id __64__SFStartPageCollectionViewController__makeCollectionViewLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = [WeakRetained _layoutForSectionAtIndex:a2 inEnvironment:v5];
  }
  else
  {
    v9 = WBS_LOG_CHANNEL_PREFIXStartPage();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __64__SFStartPageCollectionViewController__makeCollectionViewLayout__block_invoke_cold_1(v9);
    }
    v10 = (void *)MEMORY[0x1E4FB1338];
    v11 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
    v12 = [MEMORY[0x1E4FB1308] estimatedDimension:100.0];
    v13 = [v10 sizeWithWidthDimension:v11 heightDimension:v12];

    v14 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v13];
    v15 = (void *)MEMORY[0x1E4FB1318];
    v19[0] = v14;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    v17 = [v15 horizontalGroupWithLayoutSize:v13 subitems:v16];

    v8 = [MEMORY[0x1E4FB1330] sectionWithGroup:v17];
  }

  return v8;
}

- (void)_applyCurrentSnapshotAnimatingDifferences:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = [(SFStartPageCollectionViewController *)self viewIfLoaded];
  v6 = [v5 window];

  if (v6)
  {
    v7 = [(UICollectionViewDiffableDataSource *)self->_collectionDataSource snapshot];
    v8 = [v7 sectionIdentifiers];
    uint64_t v9 = [v8 count];

    v10 = [(UICollectionViewDiffableDataSource *)self->_collectionDataSource snapshot];
    v11 = [(SFStartPageCollectionViewController *)self _currentSnapshot];
    v12 = [v11 sectionIdentifiers];
    uint64_t v13 = [v12 count];

    char v14 = [v11 isEqual:v10];
    char v15 = v14 ^ 1;
    if ((v14 & 1) == 0)
    {
      v16 = (void *)MEMORY[0x1E4F1CAD0];
      v17 = [v10 sectionIdentifiers];
      v18 = [v16 setWithArray:v17];

      v19 = [v11 sectionIdentifiers];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __81__SFStartPageCollectionViewController__applyCurrentSnapshotAnimatingDifferences___block_invoke;
      v49[3] = &unk_1E54ECE78;
      id v50 = v18;
      id v51 = v10;
      v52 = self;
      id v53 = v11;
      id v20 = v18;
      [v19 enumerateObjectsUsingBlock:v49];
    }
    v38 = v10;
    collectionDataSource = self->_collectionDataSource;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __81__SFStartPageCollectionViewController__applyCurrentSnapshotAnimatingDifferences___block_invoke_3;
    v47[3] = &unk_1E54EA208;
    BOOL v22 = v9 == 0;
    v47[4] = self;
    char v48 = v15;
    [(UICollectionViewDiffableDataSource *)collectionDataSource applySnapshot:v11 animatingDifferences:v3 completion:v47];
    if (self->_hasAppliedInitialSnapshot && v22 == (v13 == 0)
      || ([(SFStartPageCollectionViewController *)self updateBackgroundStyle],
          self->_hasAppliedInitialSnapshot))
    {
      v37 = v11;
      BOOL v36 = v3;
      uint64_t v23 = *MEMORY[0x1E4FB2770];
      [(UICollectionView *)self->_collectionView indexPathsForVisibleSupplementaryElementsOfKind:*MEMORY[0x1E4FB2770]];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v24 = [obj countByEnumeratingWithState:&v43 objects:v54 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v44 != v26) {
              objc_enumerationMutation(obj);
            }
            v28 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            v29 = [(UICollectionView *)self->_collectionView supplementaryViewForElementKind:v23 atIndexPath:v28];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v30 = -[UICollectionViewDiffableDataSource sectionIdentifierForIndex:](self->_collectionDataSource, "sectionIdentifierForIndex:", [v28 section]);
              if (v30) {
                [(SFStartPageCollectionViewController *)self _configureHeader:v29 forSection:v30 atIndexPath:v28];
              }
            }
          }
          uint64_t v25 = [obj countByEnumeratingWithState:&v43 objects:v54 count:16];
        }
        while (v25);
      }
      v31 = [(UICollectionView *)self->_collectionView indexPathsForVisibleItems];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __81__SFStartPageCollectionViewController__applyCurrentSnapshotAnimatingDifferences___block_invoke_4;
      v42[3] = &unk_1E54ECEA0;
      v42[4] = self;
      v32 = objc_msgSend(v31, "safari_mapObjectsUsingBlock:", v42);
      v11 = v37;
      [v37 reconfigureItemsWithIdentifiers:v32];

      v33 = v38;
      if ([obj count] || objc_msgSend(v31, "count"))
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __81__SFStartPageCollectionViewController__applyCurrentSnapshotAnimatingDifferences___block_invoke_5;
        aBlock[3] = &unk_1E54E9A60;
        aBlock[4] = self;
        id v41 = v37;
        v34 = _Block_copy(aBlock);
        v35 = v34;
        if (v36) {
          (*((void (**)(void *))v34 + 2))(v34);
        }
        else {
          [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v34];
        }
      }
    }
    else
    {
      self->_hasAppliedInitialSnapshot = 1;
      v33 = v10;
    }
  }
}

- (void)_configureHeader:(id)a3 forSection:(id)a4 atIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  double v9 = 0.0;
  if (([v7 usesLargeTitle] & 1) == 0 && (objc_msgSend(v7, "showsTopSeparator") & 1) == 0)
  {
    -[SFStartPageVisualStyleProviding sectionHeaderBottomGapForSectionItemType:](self->_visualStyleProvider, "sectionHeaderBottomGapForSectionItemType:", [v7 itemType]);
    double v9 = v10;
  }
  [v8 setBottomGap:v9];
  visualStyleProvider = self->_visualStyleProvider;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__SFStartPageCollectionViewController__configureHeader_forSection_atIndexPath___block_invoke;
  v13[3] = &unk_1E54ECE28;
  v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  [v8 configureUsingSection:v12 visualStyleProvider:visualStyleProvider resolvingActionsUsingBlock:v13];
}

- (void)reloadDataAnimatingDifferences:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(SFStartPageCollectionViewController *)self _appearState];
  if (!self->_isPresentingContextMenu
    && (int v6 = v5,
        [(SFStartPageCollectionViewController *)self viewIfLoaded],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 window],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8)
    && v6)
  {
    if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
    {
      double v9 = WBS_LOG_CHANNEL_PREFIXStartPage();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[SFStartPageCollectionViewController reloadDataAnimatingDifferences:](v9);
      }
    }
    BOOL v10 = v6 == 2 && v3;
    [(SFStartPageCollectionViewController *)self _applyCurrentSnapshotAnimatingDifferences:v10];
  }
  else
  {
    self->_hasDeferredUpdates = 1;
  }
}

- (id)_currentSnapshot
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v4 = [WeakRetained sectionsForStartPageCollectionViewController:self];
  int v5 = (void *)v4;
  int v6 = (void *)MEMORY[0x1E4F1CBF0];
  if (v4) {
    int v6 = (void *)v4;
  }
  id v7 = v6;

  if (![WeakRetained customizationControlPolicyForStartPageCollectionViewController:self])
  {
    id v8 = [(SFStartPageCollectionViewController *)self _customizationSection];
    uint64_t v9 = [v7 arrayByAddingObject:v8];

    id v7 = (id)v9;
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  [v10 appendSectionsWithIdentifiers:v7];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "effectiveItemIdentifiersWithMaximumCount:", -[SFStartPageCollectionViewController _itemLimitForSection:](self, "_itemLimitForSection:", v16, (void)v19));
        if (v17) {
          [v10 appendItemsWithIdentifiers:v17 intoSectionWithIdentifier:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  return v10;
}

- (unint64_t)_itemLimitForSection:(id)a3
{
  id v4 = a3;
  if ([v4 itemType])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    char v6 = [WeakRetained startPageCollectionViewController:self isSectionExpanded:v4];

    if (v6) {
      unint64_t v7 = -1;
    }
    else {
      unint64_t v7 = [(SFStartPageCollectionViewController *)self _collapsedCapacityForSection:v4];
    }
  }
  else
  {
    unint64_t v7 = 1;
  }

  return v7;
}

id __79__SFStartPageCollectionViewController__configureHeader_forSection_atIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identifier];
  int v5 = [v4 hasPrefix:*MEMORY[0x1E4F99028]];

  if (v5)
  {
    char v6 = *(void **)(a1 + 32);
    unint64_t v7 = [*(id *)(a1 + 40) identifier];
    id v8 = [v6 _toggleExpandedActionForSectionIdentifier:v7];
  }
  else
  {
    id v8 = v3;
  }

  return v8;
}

id __56__SFStartPageCollectionViewController__setUpDataSource___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  char v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  id v11 = [WeakRetained _reuseIdentifierForCellWithIdentifier:v7 indexPath:v8];
  uint64_t v12 = [v9 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v8];

  [WeakRetained _configureCell:v12 forIdentifier:v7 indexPath:v8];
  uint64_t v13 = NSString;
  uint64_t v14 = [WeakRetained sections];
  uint64_t v15 = [v8 section];

  v16 = [v14 objectAtIndexedSubscript:v15];
  v17 = [v16 identifier];
  v18 = [v13 stringWithFormat:@"%@Content", v17];
  [v12 setAccessibilityIdentifier:v18];

  return v12;
}

- (id)_reuseIdentifierForCellWithIdentifier:(id)a3 indexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SFStartPageCollectionViewController *)self sections];
  uint64_t v9 = [v6 section];

  id v10 = [v8 objectAtIndexedSubscript:v9];

  id v11 = [(SFStartPageCollectionViewController *)self _reuseIdentifierForCellWithIdentifier:v7 section:v10];

  return v11;
}

- (id)_reuseIdentifierForCellWithIdentifier:(id)a3 section:(id)a4
{
  id v5 = a4;
  switch([v5 itemType])
  {
    case 0:
      id v6 = [v5 contentBanner];
      uint64_t v7 = [v6 contentVariant];
      id v8 = off_1E54E83D8;
      switch(v7)
      {
        case 0:
          break;
        case 1:
          id v8 = off_1E54E84E0;
          break;
        case 2:
          if ([MEMORY[0x1E4F97EA0] is2024PrivacyReportEnabled]
            && _SFDeviceIsPad()
            && ![v6 isPrivateBrowsingEnabled])
          {
            id v8 = off_1E54E8540;
          }
          else
          {
            id v8 = off_1E54E8548;
          }
          break;
        case 3:
          id v8 = off_1E54E8560;
          break;
        case 4:
        case 5:
          id v8 = off_1E54E8558;
          break;
        case 6:
          id v8 = off_1E54E83E0;
          break;
        default:

          goto LABEL_10;
      }
      id v4 = [(__objc2_class *)*v8 reuseIdentifier];

      break;
    case 1:
LABEL_10:
      uint64_t v9 = SFStartPageFooterCell;
      goto LABEL_11;
    case 2:
      uint64_t v9 = SFSiteIconCell;
      goto LABEL_11;
    case 3:
      uint64_t v9 = SFSiteCardCell;
      goto LABEL_11;
    case 4:
      uint64_t v9 = SFAttributedRichLinkCell;
      goto LABEL_11;
    case 5:
      uint64_t v9 = SFSiteRowCell;
      goto LABEL_11;
    case 6:
      uint64_t v9 = SFSquareRichLinkCell;
LABEL_11:
      id v4 = [(__objc2_class *)v9 reuseIdentifier];
      break;
    default:
      break;
  }

  return v4;
}

- (void)_configureCell:(id)a3 forIdentifier:(id)a4 indexPath:(id)a5
{
  id v27 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(SFStartPageCollectionViewController *)self sections];
  uint64_t v11 = [v9 section];

  uint64_t v12 = [v10 objectAtIndexedSubscript:v11];

  uint64_t v13 = [v12 itemType];
  if (objc_opt_respondsToSelector()) {
    [v27 setBackdropCaptureView:self->_cellBackdropCaptureView];
  }
  switch(v13)
  {
    case 0:
      uint64_t v14 = [v12 contentBanner];
      switch([v14 contentVariant])
      {
        case 0:
        case 1:
          id v26 = v27;
          id v15 = [v12 contentBanner];
          [v26 configureUsingBanner:v15];

          goto LABEL_9;
        case 2:
          id v15 = v8;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v17 = v27;
            objc_msgSend(v17, "setNumberOfTrackers:", objc_msgSend(v15, "numberOfTrackers"));
            objc_msgSend(v17, "setPrivateBrowsingEnabled:", objc_msgSend(v15, "isPrivateBrowsingEnabled"));
            v18 = [v12 contentBanner];
            [v17 configureUsingBanner:v18];
            goto LABEL_8;
          }
          v16 = v27;
LABEL_6:
          [v16 configureUsingBanner:v15];
          break;
        case 3:
        case 4:
        case 5:
        case 6:
          id v15 = [v12 contentBanner];
          v16 = v27;
          goto LABEL_6;
        default:
          goto LABEL_10;
      }
      goto LABEL_9;
    case 1:
      id v17 = v27;
      uint64_t v14 = [v12 actions];
      id v15 = [v14 objectAtIndexedSubscript:0];
      v18 = [v15 makeUIAction];
      [v17 setAction:v18];
LABEL_8:

LABEL_9:
LABEL_10:

      [(SFStartPageCollectionViewController *)self _updateInteractionEnabledForView:v27];
      break;
    case 2:
      id v19 = v27;
      [v19 setVisualEffectGroupName:@"start-page-cell"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v20 = [v12 supplementaryAction];
        long long v21 = [(SFStartPageVisualStyleProviding *)self->_visualStyleProvider backgroundEffectForSupplementaryActions];
        long long v22 = [v20 makeUIAction];
        [v19 configureUsingAction:v22 backgroundEffect:v21];

        uint64_t v23 = [(SFStartPageVisualStyleProviding *)self->_visualStyleProvider tintColorForSupplementaryActions];
        [v19 setTintColor:v23];
      }
      else
      {
        long long v20 = [v12 siteIconConfigurationProvider];
        ((void (**)(void, id, id))v20)[2](v20, v19, v8);
      }

      goto LABEL_20;
    case 3:
      id v24 = v27;
      uint64_t v25 = [v12 siteCardConfigurationProvider];
      goto LABEL_17;
    case 4:
      id v24 = v27;
      uint64_t v25 = [v12 attributedRichLinkConfigurationProvider];
      goto LABEL_17;
    case 5:
      id v24 = v27;
      uint64_t v25 = [v12 siteRowConfigurationProvider];
      goto LABEL_17;
    case 6:
      id v24 = v27;
      uint64_t v25 = [v12 squareRichLinkConfigurationProvider];
LABEL_17:
      id v19 = (id)v25;
      (*(void (**)(uint64_t, id, id))(v25 + 16))(v25, v24, v8);

LABEL_20:
      break;
    default:
      break;
  }
}

- (id)_layoutForSectionAtIndex:(int64_t)a3 inEnvironment:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(SFStartPageCollectionViewController *)self sections];
  id v8 = [v7 objectAtIndexedSubscript:a3];
  switch([v8 itemType])
  {
    case 0:
      id v9 = [v8 title];
      if ([v9 length] || objc_msgSend(v8, "showsTopSeparator"))
      {
        self = [(SFStartPageCollectionViewController *)self _bannerSectionLayoutForEnvironment:v6 includingHeader:1];
      }
      else
      {
        uint64_t v12 = [v8 actions];
        -[SFStartPageCollectionViewController _bannerSectionLayoutForEnvironment:includingHeader:](self, "_bannerSectionLayoutForEnvironment:includingHeader:", v6, [v12 count] != 0);
        self = (SFStartPageCollectionViewController *)objc_claimAutoreleasedReturnValue();
      }
      break;
    case 1:
      id v10 = [(SFStartPageCollectionViewController *)self _bannerSectionLayoutForEnvironment:v6 includingHeader:0];
      goto LABEL_11;
    case 2:
      id v10 = [(SFStartPageCollectionViewController *)self _siteIconSectionLayoutForEnvironment:v6];
      goto LABEL_11;
    case 3:
      -[SFStartPageCollectionViewController _siteCardSectionLayoutForEnvironment:numberOfItems:](self, "_siteCardSectionLayoutForEnvironment:numberOfItems:", v6, [v8 effectiveItemIdentifiersCount]);
      id v10 = (SFStartPageCollectionViewController *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 4:
      -[SFStartPageCollectionViewController _attributedRichLinkSectionLayoutForEnvironment:maximumNumberOfPages:numberOfItems:](self, "_attributedRichLinkSectionLayoutForEnvironment:maximumNumberOfPages:numberOfItems:", v6, [v8 maximumNumberOfPages], objc_msgSend(v8, "effectiveItemIdentifiersCount"));
      id v10 = (SFStartPageCollectionViewController *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 5:
      id v10 = [(SFStartPageCollectionViewController *)self _siteRowSectionLayoutForEnvironment:v6];
      goto LABEL_11;
    case 6:
      -[SFStartPageCollectionViewController _squareRichLinkSectionLayoutForEnvironment:numberOfItems:](self, "_squareRichLinkSectionLayoutForEnvironment:numberOfItems:", v6, [v8 effectiveItemIdentifiersCount]);
      id v10 = (SFStartPageCollectionViewController *)objc_claimAutoreleasedReturnValue();
LABEL_11:
      self = v10;
      break;
    default:
      break;
  }

  return self;
}

- (id)sections
{
  v2 = [(UICollectionViewDiffableDataSource *)self->_collectionDataSource snapshot];
  id v3 = [v2 sectionIdentifiers];

  return v3;
}

- ($4E34F1DA1F1A31EFC59C0F9E582921FC)_siteIconLayoutForEnvironment:(SEL)a3 sectionInsets:(id)a4
{
  double trailing = a5.trailing;
  double leading = a5.leading;
  id v9 = a4;
  id v10 = [v9 container];
  [v10 effectiveContentSize];
  double v12 = v11;
  double v14 = v13 - leading - trailing;

  -[SFStartPageVisualStyleProviding siteIconSizeForContainerSize:](self->_visualStyleProvider, "siteIconSizeForContainerSize:", v14, v12);
  double v16 = v15;
  visualStyleProvider = self->_visualStyleProvider;
  v18 = [v9 traitCollection];

  int64_t v19 = [(SFStartPageVisualStyleProviding *)visualStyleProvider numberOfColumnsForSectionItemType:2 sectionWidth:v18 traitCollection:v14];
  -[SFStartPageVisualStyleProviding rowSpacingForSectionItemType:containerSize:](self->_visualStyleProvider, "rowSpacingForSectionItemType:containerSize:", 2, v14, v12);
  double v21 = v20;
  retstr->var0 = v16;
  retstr->var1 = v19;
  retstr->var2 = _SFFloorFloatToPixels((v14 - v16 * (double)v19) / (double)(v19 - 1));
  retstr->var3 = v21;
  return result;
}

- (int64_t)_numberOfColumnsInSection:(id)a3
{
  id v4 = a3;
  [(SFStartPageCollectionViewController *)self _effectiveLayoutWidth];
  double v6 = v5;
  [(SFStartPageCollectionViewController *)self _sectionContentInsets];
  double v9 = v6 - v7 - v8;
  visualStyleProvider = self->_visualStyleProvider;
  uint64_t v11 = [v4 itemType];

  double v12 = [(SFStartPageCollectionViewController *)self traitCollection];
  int64_t v13 = [(SFStartPageVisualStyleProviding *)visualStyleProvider numberOfColumnsForSectionItemType:v11 sectionWidth:v12 traitCollection:v9];

  return v13;
}

- (double)_effectiveLayoutWidth
{
  id v3 = [(SFStartPageCollectionViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;
  double v7 = v6;

  return self->_lastLayoutWidth - v5 - v7;
}

- (id)_siteIconSectionLayoutForEnvironment:(id)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SFStartPageCollectionViewController *)self _sectionContentInsets];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(SFStartPageCollectionViewController *)self _siteIconLayoutForEnvironment:v4 sectionInsets:v5];

  int64_t v13 = [MEMORY[0x1E4FB1308] absoluteDimension:0.0];
  double v14 = (void *)MEMORY[0x1E4FB1338];
  double v15 = [MEMORY[0x1E4FB1308] uniformAcrossSiblingsWithEstimate:100.0];
  double v16 = [v14 sizeWithWidthDimension:v13 heightDimension:v15];

  id v17 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v16];
  v18 = (void *)MEMORY[0x1E4FB1338];
  int64_t v19 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  double v20 = [MEMORY[0x1E4FB1308] estimatedDimension:100.0];
  double v21 = [v18 sizeWithWidthDimension:v19 heightDimension:v20];

  long long v22 = [MEMORY[0x1E4FB1318] horizontalGroupWithLayoutSize:v21 subitem:v17 count:0];
  if ([MEMORY[0x1E4F97EA0] is2024ReadingListEnabled])
  {
    [(SFStartPageCollectionViewController *)self _applyStylingToLayoutGroup:v22 withSectionItemType:2 defaultInterItemSpacing:0.0];
  }
  else
  {
    uint64_t v23 = [MEMORY[0x1E4FB1340] fixedSpacing:0.0];
    [v22 setInterItemSpacing:v23];
  }
  id v24 = [MEMORY[0x1E4FB1330] sectionWithGroup:v22];
  uint64_t v25 = v24;
  if (self->_displaysSectionHeaders)
  {
    id v26 = headerSupplementaryItemLayout();
    v29[0] = v26;
    id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    [v25 setBoundarySupplementaryItems:v27];
  }
  else
  {
    [v24 setBoundarySupplementaryItems:MEMORY[0x1E4F1CBF0]];
  }
  objc_msgSend(v25, "setContentInsets:", v6, v8, v10, v12);
  [v25 setInterGroupSpacing:0.0];

  return v25;
}

- (id)_bannerSectionLayoutForEnvironment:(id)a3 includingHeader:(BOOL)a4
{
  v45[1] = *MEMORY[0x1E4F143B8];
  double v6 = (void *)MEMORY[0x1E4FB1338];
  double v7 = (void *)MEMORY[0x1E4FB1308];
  id v8 = a3;
  double v9 = [v7 fractionalWidthDimension:1.0];
  double v10 = [MEMORY[0x1E4FB1308] estimatedDimension:78.0];
  double v11 = [v6 sizeWithWidthDimension:v9 heightDimension:v10];

  double v12 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v11];
  int64_t v13 = (void *)MEMORY[0x1E4FB1338];
  double v14 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  double v15 = [MEMORY[0x1E4FB1308] estimatedDimension:78.0];
  double v16 = [v13 sizeWithWidthDimension:v14 heightDimension:v15];

  id v17 = (void *)MEMORY[0x1E4FB1318];
  v45[0] = v12;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
  int64_t v19 = [v17 horizontalGroupWithLayoutSize:v16 subitems:v18];

  double v20 = [MEMORY[0x1E4FB1330] sectionWithGroup:v19];
  double v21 = v20;
  if (a4)
  {
    long long v22 = headerSupplementaryItemLayout();
    long long v44 = v22;
    uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
    [v21 setBoundarySupplementaryItems:v23];
  }
  else
  {
    [v20 setBoundarySupplementaryItems:MEMORY[0x1E4F1CBF0]];
  }
  [(SFStartPageCollectionViewController *)self _sectionContentInsets];
  objc_msgSend(v21, "setContentInsets:");
  id v24 = [v8 container];

  [v24 effectiveContentSize];
  double v26 = v25;
  double v28 = v27;
  [v21 contentInsets];
  double v31 = v26 - v29 - v30;

  -[SFStartPageVisualStyleProviding rowSpacingForSectionItemType:containerSize:](self->_visualStyleProvider, "rowSpacingForSectionItemType:containerSize:", 0, v31, v28);
  objc_msgSend(v21, "setInterGroupSpacing:");
  [(SFStartPageCollectionViewController *)self _sectionContentInsets];
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  int v40 = [MEMORY[0x1E4F97EA0] is2024PrivacyReportEnabled];
  double v41 = v37 + 8.0;
  if (v40) {
    double v42 = v33 + 8.0;
  }
  else {
    double v42 = v33;
  }
  if (!v40) {
    double v41 = v37;
  }
  objc_msgSend(v21, "setContentInsets:", v42, v35, v41, v39);

  return v21;
}

- (NSDirectionalEdgeInsets)_sectionContentInsets
{
  id v3 = [(SFStartPageCollectionViewController *)self view];
  [v3 directionalLayoutMargins];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[SFStartPageVisualStyleProviding sectionContentInsetsWithViewLayoutMargins:](self->_visualStyleProvider, "sectionContentInsetsWithViewLayoutMargins:", v5, v7, v9, v11);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v20 = [(SFStartPageCollectionViewController *)self view];
  [v20 bounds];
  double v21 = CGRectGetWidth(v27) - v19 - v15;

  if (v21 < 200.0)
  {
    long long v22 = [(SFStartPageCollectionViewController *)self view];
    [v22 bounds];
    double v21 = CGRectGetWidth(v28) + -16.0 + -16.0;

    double v19 = 16.0;
    double v15 = 16.0;
  }
  if (((int)v21 & 0x80000001) == 1) {
    double v23 = v19 + 1.0;
  }
  else {
    double v23 = v19;
  }
  double v24 = v13;
  double v25 = v15;
  double v26 = v17;
  result.double trailing = v23;
  result.bottom = v26;
  result.double leading = v25;
  result.top = v24;
  return result;
}

- (void)_applyStylingToLayoutGroup:(id)a3 withSectionItemType:(int64_t)a4 defaultInterItemSpacing:(double)a5
{
  id v10 = a3;
  double v8 = [(SFStartPageVisualStyleProviding *)self->_visualStyleProvider interItemSpacingForSectionItemType:a4];
  if (v8)
  {
    [v10 setInterItemSpacing:v8];
  }
  else
  {
    double v9 = [MEMORY[0x1E4FB1340] fixedSpacing:a5];
    [v10 setInterItemSpacing:v9];
  }
}

- (void)_updateInteractionEnabledForView:(id)a3
{
  collectionView = self->_collectionView;
  id v7 = a3;
  if ([(UICollectionView *)collectionView hasActiveDrag])
  {
    [v7 setUserInteractionEnabled:0];
    uint64_t v5 = 2;
  }
  else
  {
    BOOL v6 = [(UICollectionView *)self->_collectionView hasActiveDrop];
    [v7 setUserInteractionEnabled:!v6];
    if (v6) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  [v7 setTintAdjustmentMode:v5];
}

- (id)_toggleExpandedActionForSectionIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFStartPageCollectionViewController *)self _sectionForIdentifier:v4];
  uint64_t v6 = [(SFStartPageCollectionViewController *)self _collapsedCapacityForSection:v5];
  if ([v5 effectiveItemIdentifiersCount] > v6
    || [v5 maximumNumberOfPages]
    && (uint64_t v7 = [v5 effectiveItemIdentifiersCount],
        v7 > [(SFStartPageCollectionViewController *)self _numberOfItemsPerPageInSection:v5]))
  {
    double v8 = [(UICollectionViewDiffableDataSource *)self->_collectionDataSource snapshot];
    uint64_t v9 = [v8 numberOfItemsInSection:v5];

    objc_initWeak(&location, self);
    id v10 = (void *)MEMORY[0x1E4FB13F0];
    double v11 = [NSString stringWithFormat:@"%@.%@", *MEMORY[0x1E4F99028], v4];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __81__SFStartPageCollectionViewController__toggleExpandedActionForSectionIdentifier___block_invoke;
    v14[3] = &unk_1E54EA9B0;
    objc_copyWeak(&v16, &location);
    id v15 = v4;
    double v12 = [v10 actionWithTitle:&stru_1EDA07C28 image:0 identifier:v11 handler:v14];

    [v12 setState:v9 > v6];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (int64_t)_collapsedCapacityForSection:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SFStartPageCollectionViewController *)self _numberOfColumnsInSection:v4];
  uint64_t v6 = [(SFStartPageCollectionViewController *)self traitCollection];
  uint64_t v7 = [v6 horizontalSizeClass];

  uint64_t v8 = [v4 maximumNumberOfPages];
  uint64_t v9 = v8;
  if (v7 == 1)
  {
    int64_t v10 = [v4 numberOfRowsVisibleWhenCollapsedInCompactWidth] * v5;
    if (!v9) {
      goto LABEL_9;
    }
  }
  else
  {
    if (!v8
      || ![(SFStartPageCollectionViewController *)self _supportsPaginatedSectionLayouts])
    {
      int64_t v10 = [v4 numberOfRowsVisibleWhenCollapsed] * v5;
      goto LABEL_9;
    }
    int64_t v10 = [v4 numberOfRowsVisibleWhenCollapsed] * v5;
  }
  v10 *= [v4 maximumNumberOfPages];
LABEL_9:

  return v10;
}

- (id)_sectionForIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SFStartPageCollectionViewController *)self sections];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__SFStartPageCollectionViewController__sectionForIdentifier___block_invoke;
  v9[3] = &unk_1E54ECDB0;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "safari_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __81__SFStartPageCollectionViewController__applyCurrentSnapshotAnimatingDifferences___block_invoke_5(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 992) applySnapshot:*(void *)(a1 + 40) animatingDifferences:1];
}

- (id)_customizationSection
{
  cachedCustomizationSection = self->_cachedCustomizationSection;
  if (!cachedCustomizationSection)
  {
    objc_initWeak(&location, self);
    id v4 = _WBSLocalizedString();
    int64_t v5 = (void *)MEMORY[0x1E4F98930];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    double v12 = __60__SFStartPageCollectionViewController__customizationSection__block_invoke;
    double v13 = &unk_1E54EA1B8;
    objc_copyWeak(&v14, &location);
    id v6 = [v5 actionWithTitle:v4 image:0 identifier:0 handler:&v10];
    objc_msgSend(MEMORY[0x1E4F98EA8], "footerSectionWithIdentifier:action:", @"com.apple.mobilesafari.framework-customization-section", v6, v10, v11, v12, v13);
    uint64_t v7 = (WBSStartPageSection *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = self->_cachedCustomizationSection;
    self->_cachedCustomizationSection = v7;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    cachedCustomizationSection = self->_cachedCustomizationSection;
  }

  return cachedCustomizationSection;
}

- (void)_updateCustomTopBackdrops
{
  id v3 = [(SFStartPageCollectionViewController *)self navigationController];
  id v21 = v3;
  if (!self->_statusBarBackdrop)
  {
    statusBarBackdrop = 0;
    goto LABEL_5;
  }
  if ([v3 isNavigationBarHidden])
  {
    statusBarBackdrop = self->_statusBarBackdrop;
LABEL_5:
    double v5 = 0.0;
    [(UIVisualEffectView *)statusBarBackdrop setAlpha:0.0];
    p_navigationBarBackdrop = (id *)&self->_navigationBarBackdrop;
    goto LABEL_12;
  }
  uint64_t v7 = [v21 view];
  [v7 safeAreaInsets];
  double v9 = v8;

  uint64_t v10 = [(SFStartPageCollectionViewController *)self view];
  [v10 safeAreaInsets];
  double v12 = v11;

  double v13 = [(SFStartPageCollectionViewController *)self view];
  [v13 bounds];
  double Width = CGRectGetWidth(v23);

  double v5 = 0.0;
  -[UIVisualEffectView setFrame:](self->_statusBarBackdrop, "setFrame:", 0.0, 0.0, Width, v9);
  -[UIVisualEffectView setFrame:](self->_navigationBarBackdrop, "setFrame:", 0.0, v9, Width, v12 - v9);
  p_navigationBarBackdrop = (id *)&self->_navigationBarSeparator;
  -[UIView setFrame:](self->_navigationBarSeparator, "setFrame:", 0.0, v12, Width, _SFOnePixel());
  id v15 = [(SFStartPageCollectionViewController *)self navigationItem];
  int v16 = objc_msgSend(v15, "sf_isEmpty");

  if (v16)
  {
    [(SFStartPageCollectionViewController *)self scrollDistance];
    [(UIVisualEffectView *)self->_statusBarBackdrop setAlpha:_SFClampPercent(v17, v12 - v9, v12 - v9 + 16.0)];
    navigationBarBackdrop = self->_navigationBarBackdrop;
    double v19 = 0.0;
  }
  else
  {
    double v5 = 1.0;
    if (!self->_wantsWallpaperHiddenForCurrentBackgroundStyle)
    {
      [(SFStartPageCollectionViewController *)self scrollDistance];
      double v5 = _SFClampPercent(v20, 0.0, 16.0);
    }
    [(UIVisualEffectView *)self->_statusBarBackdrop setAlpha:v5];
    navigationBarBackdrop = self->_navigationBarBackdrop;
    double v19 = v5;
  }
  [(UIVisualEffectView *)navigationBarBackdrop setAlpha:v19];
LABEL_12:
  [*p_navigationBarBackdrop setAlpha:v5];
}

- (double)scrollDistance
{
  [(UICollectionView *)self->_collectionView contentOffset];
  double v4 = v3;
  [(UICollectionView *)self->_collectionView adjustedContentInset];
  return v4 + v5;
}

void __81__SFStartPageCollectionViewController__applyCurrentSnapshotAnimatingDifferences___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![v3 itemType] && objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3))
  {
    double v4 = [*(id *)(a1 + 40) sectionIdentifiers];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __81__SFStartPageCollectionViewController__applyCurrentSnapshotAnimatingDifferences___block_invoke_2;
    v8[3] = &unk_1E54ECE50;
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void **)(a1 + 56);
    id v9 = v5;
    uint64_t v10 = v6;
    id v11 = v7;
    [v4 enumerateObjectsUsingBlock:v8];
  }
}

uint64_t __61__SFStartPageCollectionViewController__sectionForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)viewLayoutMarginsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)SFStartPageCollectionViewController;
  [(SFStartPageCollectionViewController *)&v4 viewLayoutMarginsDidChange];
  id v3 = [(UICollectionView *)self->_collectionView collectionViewLayout];
  [v3 invalidateLayout];
}

uint64_t __81__SFStartPageCollectionViewController__applyCurrentSnapshotAnimatingDifferences___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1112));
  if (*(unsigned char *)(a1 + 40))
  {
    objc_super v4 = WeakRetained;
    if (objc_opt_respondsToSelector()) {
      [v4 startPageCollectionViewControllerDidUpdateContent:*(void *)(a1 + 32)];
    }
  }

  return MEMORY[0x1F4181870]();
}

- (void)setHidesEmptyNavigationBar:(BOOL)a3
{
  if (self->_hidesEmptyNavigationBar != a3)
  {
    self->_hidesEmptyNavigationBar = a3;
    [(SFStartPageCollectionViewController *)self reloadNavigationItemAnimated:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SFStartPageCollectionViewController;
  -[SFStartPageCollectionViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  [(SFStartPageCollectionViewController *)self _updateNavigationItemAnimated:v3];
}

- (void)updateBackgroundStyle
{
  id v16 = [(SFStartPageCollectionViewController *)self traitCollection];
  BOOL v3 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  int v4 = objc_msgSend(v16, "sf_usesVibrantAppearance");
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4FB1618] clearColor];
  }
  else
  {
    uint64_t v6 = [(UICollectionViewDiffableDataSource *)self->_collectionDataSource snapshot];
    uint64_t v7 = [v6 sectionIdentifiers];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      char v9 = 0;
      goto LABEL_7;
    }
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_colorNamed:", @"StartPageEmptyContentBackground");
  }
  uint64_t v10 = (void *)v5;
  char v9 = v4 ^ 1;

  BOOL v3 = v10;
LABEL_7:
  if (objc_msgSend(v16, "sf_usesVibrantAppearance"))
  {
    id v11 = objc_msgSend(v16, "sf_backgroundBlurEffect");
    BOOL v12 = v11 == 0;
  }
  else
  {
    BOOL v12 = 0;
  }
  [(_UIVisualEffectBackdropView *)self->_cellBackdropCaptureView setRenderMode:v12];
  double v13 = [(UICollectionView *)self->_collectionView backgroundColor];
  char v14 = WBSIsEqual();

  if ((v14 & 1) == 0)
  {
    [(UICollectionView *)self->_collectionView setBackgroundColor:v3];
    self->_wantsWallpaperHiddenForCurrentBackgroundStyle = v9;
    [(SFStartPageCollectionViewController *)self _updateCustomTopBackdrops];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained startPageCollectionViewControllerDidChangeBackgroundStyle:self];
  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFStartPageCollectionViewController;
  [(SFStartPageCollectionViewController *)&v4 viewIsAppearing:a3];
  [(SFStartPageCollectionViewController *)self navigationBarPositionDidChange];
  [MEMORY[0x1E4FB1A90] visiblePeripheralFrame];
  -[SFStartPageCollectionViewController updateKeyboardBottomInsetFromKeyboardFrame:](self, "updateKeyboardBottomInsetFromKeyboardFrame:");
}

- (void)_updateNavigationItemAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  [WeakRetained startPageCollectionViewControllerWillUpdateNavigationBar:self];

  id v10 = [(SFStartPageCollectionViewController *)self navigationController];
  uint64_t v6 = [v10 topViewController];

  if (v6 == self)
  {
    uint64_t v7 = [(SFStartPageCollectionViewController *)self navigationItem];
    uint64_t v8 = v7;
    if (self->_hidesEmptyNavigationBar) {
      uint64_t v9 = objc_msgSend(v7, "sf_isEmpty");
    }
    else {
      uint64_t v9 = 0;
    }
    [v10 setNavigationBarHidden:v9 animated:v3];
  }
}

- (void)reloadNavigationItemAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(SFStartPageCollectionViewController *)self parentViewController];

  if (v5)
  {
    [(SFStartPageCollectionViewController *)self _updateNavigationItemAnimated:v3];
    if (v3)
    {
      double v6 = *MEMORY[0x1E4FB2E08];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __68__SFStartPageCollectionViewController_reloadNavigationItemAnimated___block_invoke;
      v7[3] = &unk_1E54E9858;
      v7[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v7 animations:v6];
    }
    else
    {
      [(SFStartPageCollectionViewController *)self _updateCustomTopBackdrops];
    }
    [(SFStartPageCollectionViewController *)self setNeedsStatusBarAppearanceUpdate];
  }
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SFStartPageCollectionViewController;
  [(SFStartPageCollectionViewController *)&v3 viewWillLayoutSubviews];
  [(SFStartPageCollectionViewController *)self _updateCustomTopBackdrops];
}

- (void)updateCollectionViewContentInset
{
  objc_super v3 = [(SFStartPageCollectionViewController *)self navigationController];
  id v28 = [v3 navigationBar];

  [(SFStartPageCollectionViewController *)self scrollDistance];
  double v5 = v4;
  -[SFStartPageVisualStyleProviding collectionViewContentInsetsWithNavigationBarPosition:](self->_visualStyleProvider, "collectionViewContentInsetsWithNavigationBarPosition:", [v28 barPosition]);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained startPageCollectionViewControllerTopPadding:self];
  double v16 = v15;

  if (v16 != -1.0) {
    double v7 = v16;
  }
  double keyboardBottomInset = self->_keyboardBottomInset;
  [(UICollectionView *)self->_collectionView safeAreaInsets];
  double v19 = fmax(keyboardBottomInset - v18, 0.0);
  if (self->_keyboardBottomInset <= v11) {
    double v20 = v11;
  }
  else {
    double v20 = v19;
  }
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", v7, v9, v20, v13);
  double v22 = *MEMORY[0x1E4FB2848];
  double v21 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v23 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  int v24 = [(SFStartPageCollectionViewController *)self _isInPopoverPresentation];
  double v25 = 7.0;
  double v26 = fmax(7.0, v19);
  if (v24) {
    double v27 = v26;
  }
  else {
    double v27 = v19;
  }
  if (!v24) {
    double v25 = v22;
  }
  -[UICollectionView setVerticalScrollIndicatorInsets:](self->_collectionView, "setVerticalScrollIndicatorInsets:", v25, v21, v27, v23);
  if (v5 < 1.0) {
    [(SFStartPageCollectionViewController *)self scrollToTop];
  }
}

- (void)scrollToTop
{
  objc_super v3 = [(SFStartPageCollectionViewController *)self navigationController];
  double v4 = [v3 viewControllers];
  double v5 = [v4 firstObject];
  if (v5 != self)
  {

LABEL_3:
    [(UICollectionView *)self->_collectionView adjustedContentInset];
    collectionView = self->_collectionView;
    -[UICollectionView setContentOffset:animated:](collectionView, "setContentOffset:animated:", 0, 0.0, -v6);
    return;
  }
  double v8 = [(SFStartPageCollectionViewController *)self navigationItem];
  double v9 = [v8 title];
  uint64_t v10 = [v9 length];

  if (!v10) {
    goto LABEL_3;
  }
  double v11 = [(SFStartPageCollectionViewController *)self navigationController];
  double v12 = [v11 navigationBar];
  objc_msgSend(v12, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v14 = v13;

  double v15 = [(SFStartPageCollectionViewController *)self navigationController];
  double v16 = [v15 navigationBar];
  [v16 frame];
  double v18 = -(v14 + v17);

  -[UICollectionView setContentOffset:](self->_collectionView, "setContentOffset:", 0.0, v18);
  double v19 = self->_collectionView;

  -[UICollectionView setContentOffset:](v19, "setContentOffset:", 0.0, v18);
}

- (void)scrollViewDidScroll:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained startPageCollectionViewControllerDidScroll:self];

  [(SFStartPageCollectionViewController *)self _updateCustomTopBackdrops];
}

- (BOOL)wantsWallpaperHiddenForCurrentBackgroundStyle
{
  return self->_wantsWallpaperHiddenForCurrentBackgroundStyle;
}

- (void)updateKeyboardBottomInsetFromKeyboardFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  IsEmptdouble y = CGRectIsEmpty(a3);
  double v9 = 0.0;
  if (!IsEmpty)
  {
    -[UICollectionView convertRect:fromView:](self->_collectionView, "convertRect:fromView:", 0, x, y, width, height);
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    [(UICollectionView *)self->_collectionView bounds];
    double MaxY = CGRectGetMaxY(v20);
    v21.origin.double x = v11;
    v21.origin.double y = v13;
    v21.size.double width = v15;
    v21.size.double height = v17;
    double v9 = MaxY - CGRectGetMinY(v21);
  }
  if (v9 != self->_keyboardBottomInset)
  {
    self->_double keyboardBottomInset = v9;
    [(SFStartPageCollectionViewController *)self updateCollectionViewContentInset];
  }
}

uint64_t __83__SFStartPageCollectionViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyCurrentSnapshotAnimatingDifferences:0];
}

id __56__SFStartPageCollectionViewController__setUpDataSource___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  double v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  CGFloat v11 = [WeakRetained _collectionView:v9 supplementaryViewWithKind:v8 forIndexPath:v7];

  double v12 = NSString;
  CGFloat v13 = [WeakRetained sections];
  uint64_t v14 = [v7 section];

  CGFloat v15 = [v13 objectAtIndexedSubscript:v14];
  double v16 = [v15 identifier];
  CGFloat v17 = [v12 stringWithFormat:@"%@Header", v16];
  [v11 setAccessibilityIdentifier:v17];

  return v11;
}

- (id)_collectionView:(id)a3 supplementaryViewWithKind:(id)a4 forIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CGFloat v11 = [(SFStartPageCollectionViewController *)self sections];
  double v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v10, "section"));

  if ([v9 isEqualToString:*MEMORY[0x1E4FB2770]])
  {
    CGFloat v13 = +[SFStartPageSectionHeader reuseIdentifier];
    uint64_t v14 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:v13 forIndexPath:v10];

    [(SFStartPageCollectionViewController *)self _configureHeader:v14 forSection:v12 atIndexPath:v10];
    [(SFStartPageCollectionViewController *)self _updateInteractionEnabledForView:v14];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (void)viewDidLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)SFStartPageCollectionViewController;
  [(SFStartPageCollectionViewController *)&v9 viewDidLayoutSubviews];
  int64_t v3 = [(SFStartPageCollectionViewController *)self interfaceOrientation];
  [(UICollectionView *)self->_collectionView bounds];
  CGFloat Width = CGRectGetWidth(v10);
  if (Width != 0.0)
  {
    double v5 = Width;
    if (Width == self->_lastLayoutWidth)
    {
      if (!self->_shouldIgnoreLastLayoutSize) {
        return;
      }
    }
    else if (!self->_shouldIgnoreLastLayoutSize && v3 == self->_lastLayoutOrientation)
    {
      double v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      int v7 = [v6 BOOLForKey:@"DebugStartPageAllowsAnimatedReloadOnResize"];

      self->_lastLayoutCGFloat Width = v5;
      self->_lastLayoutOrientation = v3;
      self->_shouldIgnoreLastLayoutSize = 0;
      if (!v7)
      {
LABEL_11:
        [(SFStartPageCollectionViewController *)self reloadDataAnimatingDifferences:0];
        return;
      }
LABEL_9:
      if ([MEMORY[0x1E4FB1EB0] areAnimationsEnabled])
      {
        id v8 = [(SFStartPageCollectionViewController *)self traitCollection];
        -[SFStartPageCollectionViewController reloadDataAnimatingDifferences:](self, "reloadDataAnimatingDifferences:", [v8 _presentationSemanticContext] != 3);

        return;
      }
      goto LABEL_11;
    }
    self->_lastLayoutCGFloat Width = Width;
    self->_lastLayoutOrientation = v3;
    self->_shouldIgnoreLastLayoutSize = 0;
    goto LABEL_9;
  }
}

- (void)viewDidLoad
{
  v94[1] = *MEMORY[0x1E4F143B8];
  v90.receiver = self;
  v90.super_class = (Class)SFStartPageCollectionViewController;
  [(SFStartPageCollectionViewController *)&v90 viewDidLoad];
  int64_t v3 = [(SFStartPageCollectionViewController *)self view];
  double v4 = [SFStartPageBackgroundUIVisualEffectBackdropView alloc];
  [v3 bounds];
  double v5 = -[SFStartPageBackgroundUIVisualEffectBackdropView initWithFrame:](v4, "initWithFrame:");
  cellBackdropCaptureView = self->_cellBackdropCaptureView;
  self->_cellBackdropCaptureView = v5;

  [(_UIVisualEffectBackdropView *)self->_cellBackdropCaptureView setAutoresizingMask:18];
  [v3 addSubview:self->_cellBackdropCaptureView];
  id v7 = objc_alloc(MEMORY[0x1E4FB1568]);
  [v3 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [(SFStartPageCollectionViewController *)self _makeCollectionViewLayout];
  CGFloat v17 = (UICollectionView *)objc_msgSend(v7, "initWithFrame:collectionViewLayout:", v16, v9, v11, v13, v15);
  collectionView = self->_collectionView;
  self->_collectionView = v17;

  [(UICollectionView *)self->_collectionView setAccessibilityIdentifier:@"StartPageCollectionView"];
  [(UICollectionView *)self->_collectionView setAlwaysBounceVertical:1];
  [(UICollectionView *)self->_collectionView setAutoresizingMask:18];
  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setKeyboardDismissMode:2];
  [(UICollectionView *)self->_collectionView setDragInteractionEnabled:1];
  [(UICollectionView *)self->_collectionView setDragDelegate:self];
  [(UICollectionView *)self->_collectionView setDropDelegate:self];
  double v19 = self->_collectionView;
  uint64_t v20 = objc_opt_class();
  CGRect v21 = +[SFBannerCell reuseIdentifier];
  [(UICollectionView *)v19 registerClass:v20 forCellWithReuseIdentifier:v21];

  double v22 = self->_collectionView;
  uint64_t v23 = objc_opt_class();
  int v24 = +[SFPrivateRelayPromptBannerCell reuseIdentifier];
  [(UICollectionView *)v22 registerClass:v23 forCellWithReuseIdentifier:v24];

  double v25 = self->_collectionView;
  uint64_t v26 = objc_opt_class();
  double v27 = +[SFAttributedRichLinkCell reuseIdentifier];
  [(UICollectionView *)v25 registerClass:v26 forCellWithReuseIdentifier:v27];

  id v28 = self->_collectionView;
  uint64_t v29 = objc_opt_class();
  double v30 = +[SFInteractiveBannerCell reuseIdentifier];
  [(UICollectionView *)v28 registerClass:v29 forCellWithReuseIdentifier:v30];

  double v31 = self->_collectionView;
  uint64_t v32 = objc_opt_class();
  double v33 = +[SFPrivacyReportBannerCell reuseIdentifier];
  [(UICollectionView *)v31 registerClass:v32 forCellWithReuseIdentifier:v33];

  double v34 = self->_collectionView;
  uint64_t v35 = objc_opt_class();
  double v36 = +[SFPrivateBrowsingExplanationModuleCell reuseIdentifier];
  [(UICollectionView *)v34 registerClass:v35 forCellWithReuseIdentifier:v36];

  double v37 = self->_collectionView;
  uint64_t v38 = objc_opt_class();
  double v39 = +[SFStartPageFooterCell reuseIdentifier];
  [(UICollectionView *)v37 registerClass:v38 forCellWithReuseIdentifier:v39];

  int v40 = self->_collectionView;
  uint64_t v41 = objc_opt_class();
  double v42 = +[SFSquareRichLinkCell reuseIdentifier];
  [(UICollectionView *)v40 registerClass:v41 forCellWithReuseIdentifier:v42];

  [MEMORY[0x1E4F97EA0] is2024ReadingListEnabled];
  long long v43 = self->_collectionView;
  uint64_t v44 = objc_opt_class();
  long long v45 = +[SFSiteCardCell reuseIdentifier];
  [(UICollectionView *)v43 registerClass:v44 forCellWithReuseIdentifier:v45];

  long long v46 = self->_collectionView;
  uint64_t v47 = objc_opt_class();
  char v48 = +[SFSiteIconCell reuseIdentifier];
  [(UICollectionView *)v46 registerClass:v47 forCellWithReuseIdentifier:v48];

  v49 = self->_collectionView;
  uint64_t v50 = objc_opt_class();
  id v51 = +[SFSiteRowCell reuseIdentifier];
  [(UICollectionView *)v49 registerClass:v50 forCellWithReuseIdentifier:v51];

  v52 = self->_collectionView;
  uint64_t v53 = objc_opt_class();
  v54 = +[SFStartPageSectionHeader reuseIdentifier];
  [(UICollectionView *)v52 registerClass:v53 forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:v54];

  if ([MEMORY[0x1E4F97EA0] is2024PrivacyReportEnabled])
  {
    uint64_t v55 = self->_collectionView;
    uint64_t v56 = objc_opt_class();
    v57 = +[SFPrivacyRedesignBannerCell reuseIdentifier];
    [(UICollectionView *)v55 registerClass:v56 forCellWithReuseIdentifier:v57];
  }
  v58 = self->_collectionView;
  uint64_t v59 = objc_opt_class();
  v60 = +[SFBannerMessageAndButtonsCell reuseIdentifier];
  [(UICollectionView *)v58 registerClass:v59 forCellWithReuseIdentifier:v60];

  [(SFStartPageCollectionViewController *)self _setUpDataSource:self->_collectionView];
  [(SFStartPageCollectionViewController *)self setContentScrollView:self->_collectionView forEdge:15];
  [v3 addSubview:self->_collectionView];
  v61 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  contextMenuToItemIdentifierMap = self->_contextMenuToItemIdentifierMap;
  self->_contextMenuToItemIdentifierMap = v61;

  v63 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__receivedTapToDismissGesture];
  tapToDismissGestureRecognizer = self->_tapToDismissGestureRecognizer;
  self->_tapToDismissGestureRecognizer = v63;

  [(UITapGestureRecognizer *)self->_tapToDismissGestureRecognizer setCancelsTouchesInView:0];
  [(UITapGestureRecognizer *)self->_tapToDismissGestureRecognizer setDelegate:self];
  [(UICollectionView *)self->_collectionView addGestureRecognizer:self->_tapToDismissGestureRecognizer];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    int v66 = [WeakRetained startPageCollectionViewControllerShouldInstallCustomBackdrops:self];
  }
  else {
    int v66 = 0;
  }

  uint64_t v93 = *MEMORY[0x1E4FB0700];
  v67 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_alternateLabelColor");
  v94[0] = v67;
  v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:&v93 count:1];

  v69 = [(SFStartPageCollectionViewController *)self navigationItem];
  id v70 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
  v71 = v70;
  if (v66) {
    [v70 configureWithTransparentBackground];
  }
  else {
    [v70 configureWithDefaultBackground];
  }
  [v71 setLargeTitleTextAttributes:v68];
  [v69 setStandardAppearance:v71];

  id v72 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
  [v72 configureWithTransparentBackground];
  [v72 setTitleTextAttributes:v68];
  [v72 setLargeTitleTextAttributes:v68];
  [v69 setScrollEdgeAppearance:v72];

  v73 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v73 addObserver:self selector:sel_keyboardDidChangeFrame_ name:*MEMORY[0x1E4FB2C58] object:0];
  [v73 addObserver:self selector:sel_keyboardDidChangeFrame_ name:*MEMORY[0x1E4FB2BB8] object:0];
  [v73 addObserver:self selector:sel_keyboardDidChangeFrame_ name:*MEMORY[0x1E4FB2C50] object:0];
  if (v66)
  {
    v74 = objc_opt_new();
    v75 = [v74 backgroundEffect];

    v76 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v75];
    statusBarBackdrop = self->_statusBarBackdrop;
    self->_statusBarBackdrop = v76;

    [(UIVisualEffectView *)self->_statusBarBackdrop _setGroupName:@"com.apple.mobilesafari.CustomStartPageTopBackdrop"];
    [(UIVisualEffectView *)self->_statusBarBackdrop setTranslatesAutoresizingMaskIntoConstraints:0];
    [v3 addSubview:self->_statusBarBackdrop];
    v78 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v75];
    navigationBarBackdrop = self->_navigationBarBackdrop;
    self->_navigationBarBackdrop = v78;

    [(UIVisualEffectView *)self->_navigationBarBackdrop _setGroupName:@"com.apple.mobilesafari.CustomStartPageTopBackdrop"];
    [(UIVisualEffectView *)self->_navigationBarBackdrop setTranslatesAutoresizingMaskIntoConstraints:0];
    [v3 addSubview:self->_navigationBarBackdrop];
    v80 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    navigationBarSeparator = self->_navigationBarSeparator;
    self->_navigationBarSeparator = v80;

    [(UIView *)self->_navigationBarSeparator setTranslatesAutoresizingMaskIntoConstraints:0];
    v82 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_barHairlineShadowColor");
    [(UIView *)self->_navigationBarSeparator setBackgroundColor:v82];

    [v3 addSubview:self->_navigationBarSeparator];
  }
  v92[0] = objc_opt_class();
  v92[1] = objc_opt_class();
  v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:2];
  id v84 = (id)[(SFStartPageCollectionViewController *)self registerForTraitChanges:v83 withTarget:self action:sel_updateBackgroundStyle];

  objc_initWeak(&location, self);
  uint64_t v91 = objc_opt_class();
  v85 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v91 count:1];
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = __50__SFStartPageCollectionViewController_viewDidLoad__block_invoke;
  v87[3] = &unk_1E54EB540;
  objc_copyWeak(&v88, &location);
  id v86 = (id)[(SFStartPageCollectionViewController *)self registerForTraitChanges:v85 withHandler:v87];

  objc_destroyWeak(&v88);
  objc_destroyWeak(&location);
}

- (void)setDelegate:(id)a3
{
}

- (void)setDataSource:(id)a3
{
  id obj = (SFStartPageCollectionDataSource *)a3;
  id WeakRetained = (SFStartPageCollectionDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);

  double v5 = obj;
  if (WeakRetained != obj)
  {
    strongDataSource = self->_strongDataSource;
    if (strongDataSource != obj)
    {
      self->_strongDataSource = 0;
    }
    objc_storeWeak((id *)&self->_dataSource, obj);
    double v5 = obj;
    if (self->_collectionDataSource)
    {
      [(SFStartPageCollectionViewController *)self reloadDataAnimatingDifferences:0];
      [(SFStartPageCollectionViewController *)self reloadNavigationItemAnimated:0];
      double v5 = obj;
    }
  }
}

- (SFStartPageCollectionViewController)initWithVisualStyleProvider:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFStartPageCollectionViewController;
  double v6 = [(SFStartPageCollectionViewController *)&v10 initWithNibName:0 bundle:0];
  id v7 = v6;
  if (v6)
  {
    v6->_displaysSectionHeaders = 1;
    v6->_hidesEmptyNavigationBar = 1;
    objc_storeStrong((id *)&v6->_visualStyleProvider, a3);
    double v8 = v7;
  }

  return v7;
}

- (void)_setUpDataSource:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4FB1598]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__SFStartPageCollectionViewController__setUpDataSource___block_invoke;
  v10[3] = &unk_1E54ECDD8;
  objc_copyWeak(&v11, &location);
  double v6 = (UICollectionViewDiffableDataSource *)[v5 initWithCollectionView:v4 cellProvider:v10];
  collectionDataSource = self->_collectionDataSource;
  self->_collectionDataSource = v6;

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__SFStartPageCollectionViewController__setUpDataSource___block_invoke_2;
  v8[3] = &unk_1E54ECE00;
  objc_copyWeak(&v9, &location);
  [(UICollectionViewDiffableDataSource *)self->_collectionDataSource setSupplementaryViewProvider:v8];
  [(SFStartPageCollectionViewController *)self reloadDataAnimatingDifferences:0];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (id)_makeCollectionViewLayout
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1588]);
  [(SFStartPageVisualStyleProviding *)self->_visualStyleProvider defaultRowSpacing];
  objc_msgSend(v3, "setInterSectionSpacing:");
  id v4 = objc_alloc(MEMORY[0x1E4FB1580]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__SFStartPageCollectionViewController__makeCollectionViewLayout__block_invoke;
  v7[3] = &unk_1E54ECEC8;
  objc_copyWeak(&v8, &location);
  id v5 = (void *)[v4 initWithSectionProvider:v7 configuration:v3];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);

  return v5;
}

- (void)reloadSection:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v32[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(SFStartPageCollectionViewController *)self isViewLoaded])
  {
    id v7 = [(SFStartPageCollectionViewController *)self traitCollection];
    uint64_t v8 = [v7 _presentationSemanticContext];

    BOOL v9 = v8 != 3 && v4;
    objc_super v10 = [(UICollectionViewDiffableDataSource *)self->_collectionDataSource snapshot];
    id v11 = [(SFStartPageCollectionViewController *)self _currentSnapshot];
    uint64_t v12 = [v10 indexOfSectionIdentifier:v6];
    uint64_t v13 = [v11 indexOfSectionIdentifier:v6];
    unint64_t v14 = v13;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_21:

        goto LABEL_22;
      }
      double v15 = [v10 sectionIdentifiers];
      unint64_t v16 = [v15 count];

      if (v14 > v16)
      {
        [(SFStartPageCollectionViewController *)self reloadDataAnimatingDifferences:v9];
        goto LABEL_21;
      }
      int v24 = [v11 sectionIdentifiers];
      double v18 = [v24 objectAtIndexedSubscript:v14];

      double v25 = [v10 sectionIdentifiers];
      uint64_t v26 = [v25 count];

      if (v14 == v26)
      {
        v32[0] = v18;
        double v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
        [v10 appendSectionsWithIdentifiers:v27];
      }
      else
      {
        double v31 = v18;
        double v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
        id v28 = [v10 sectionIdentifiers];
        uint64_t v29 = [v28 objectAtIndexedSubscript:v14];
        [v10 insertSectionsWithIdentifiers:v27 beforeSectionWithIdentifier:v29];
      }
      double v19 = [v11 itemIdentifiersInSectionWithIdentifier:v18];
      [v10 appendItemsWithIdentifiers:v19 intoSectionWithIdentifier:v18];
    }
    else
    {
      CGFloat v17 = [v10 sectionIdentifiers];
      double v18 = [v17 objectAtIndexedSubscript:v12];

      if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v20 = objc_alloc_init(MEMORY[0x1E4FB1358]);
        CGRect v21 = [v11 itemIdentifiersInSectionWithIdentifier:v18];
        [v20 appendItems:v21];

        [(UICollectionViewDiffableDataSource *)self->_collectionDataSource applySnapshot:v20 toSection:v18 animatingDifferences:v9];
        if ([MEMORY[0x1E4F97EA0] is2024PrivacyReportEnabled])
        {
          double v22 = [v6 identifier];
          int v23 = [v22 isEqualToString:*MEMORY[0x1E4F988A8]];

          if (v23) {
            [(SFStartPageCollectionViewController *)self reloadDataAnimatingDifferences:v9];
          }
        }

        goto LABEL_20;
      }
      double v30 = v18;
      double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
      [v10 deleteSectionsWithIdentifiers:v19];
    }

    [(UICollectionViewDiffableDataSource *)self->_collectionDataSource applySnapshot:v10 animatingDifferences:v9];
LABEL_20:

    goto LABEL_21;
  }
LABEL_22:
}

void __81__SFStartPageCollectionViewController__applyCurrentSnapshotAnimatingDifferences___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (![v5 itemType])
  {
    id v6 = [v5 contentBanner];
    uint64_t v7 = [v6 contentVariant];
    uint64_t v8 = [*(id *)(a1 + 32) contentBanner];
    uint64_t v9 = [v8 contentVariant];

    if (v7 == v9)
    {
      objc_super v10 = [*(id *)(a1 + 32) itemIdentifiers];
      uint64_t v11 = [v10 count];

      if (v11)
      {
        uint64_t v12 = [*(id *)(a1 + 32) itemIdentifiers];
        uint64_t v13 = [v12 objectAtIndexedSubscript:0];

        unint64_t v14 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:a3];
        double v15 = [*(id *)(*(void *)(a1 + 40) + 1000) cellForItemAtIndexPath:v14];
        unint64_t v16 = [v15 reuseIdentifier];

        if (!v16
          || ([*(id *)(a1 + 40) _reuseIdentifierForCellWithIdentifier:v13 section:*(void *)(a1 + 32)], CGFloat v17 = objc_claimAutoreleasedReturnValue(), v18 = objc_msgSend(v16, "isEqualToString:", v17), v17, (v18 & 1) == 0))
        {
          double v19 = *(void **)(a1 + 48);
          v21[0] = *(void *)(a1 + 32);
          id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
          [v19 reloadSectionsWithIdentifiers:v20];
        }
      }
    }
  }
}

uint64_t __83__SFStartPageCollectionViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __83__SFStartPageCollectionViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke_2;
  v2[3] = &unk_1E54E9858;
  v2[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SFStartPageCollectionViewController;
  [(SFStartPageCollectionViewController *)&v10 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (a3)
  {
    if (self->_hasDeferredUpdates)
    {
      self->_hasDeferredUpdates = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __83__SFStartPageCollectionViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke;
      aBlock[3] = &unk_1E54E9858;
      aBlock[4] = self;
      id v6 = (void (**)(void))_Block_copy(aBlock);
      if (self->_hasMadeFirstCommit
        && (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
            int v8 = [WeakRetained startPageCollectionViewControllerShouldDeferLoadingContentUntilKeyboardAnimatesIn:self], WeakRetained, !v8))
      {
        v6[2](v6);
      }
      else
      {
        [(id)*MEMORY[0x1E4FB2608] _performBlockAfterCATransactionCommits:v6];
      }
    }
    self->_hasMadeFirstCommit = 1;
  }
}

void __50__SFStartPageCollectionViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained[125] collectionViewLayout];
    [v2 invalidateLayout];

    id WeakRetained = v3;
  }
}

- (void)ignorePreviousLayoutSize
{
  self->_shouldIgnoreLastLayoutSize = 1;
}

- (void)setStrongDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_strongDataSource, a3);
  id v5 = a3;
  [(SFStartPageCollectionViewController *)self setDataSource:v5];
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)self->_collectionView;
}

- (void)setDisplaysSectionHeaders:(BOOL)a3
{
  if (self->_displaysSectionHeaders != a3)
  {
    self->_displaysSectionHeaders = a3;
    id v3 = [(UICollectionView *)self->_collectionView collectionViewLayout];
    [v3 invalidateLayout];
  }
}

- (void)configureModelWithIdentifier:(id)a3 usingBlock:(id)a4
{
  objc_super v10 = (void (**)(id, void *))a4;
  id v6 = [(UICollectionViewDiffableDataSource *)self->_collectionDataSource indexPathForItemIdentifier:a3];
  if (v6)
  {
    uint64_t v7 = [(UICollectionView *)self->_collectionView cellForItemAtIndexPath:v6];
    if (v7)
    {
      int v8 = [(SFStartPageCollectionViewController *)self sections];
      uint64_t v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));

      if ((unint64_t)([v9 itemType] - 2) <= 4) {
        v10[2](v10, v7);
      }
    }
  }
}

- (void)presentViewController:(id)a3 fromItemWithIdentifier:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F97FD8];
  id v8 = a4;
  id v9 = objc_alloc_init(v7);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  char v18 = __84__SFStartPageCollectionViewController_presentViewController_fromItemWithIdentifier___block_invoke;
  double v19 = &unk_1E54E9A60;
  id v20 = self;
  id v10 = v6;
  id v21 = v10;
  [v9 setHandler:&v16];
  uint64_t v11 = -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](self->_collectionDataSource, "indexPathForItemIdentifier:", v8, v16, v17, v18, v19, v20);

  if (v11)
  {
    uint64_t v12 = [(UICollectionView *)self->_collectionView cellForItemAtIndexPath:v11];
    if (v12)
    {
      [v10 setModalPresentationStyle:7];
      uint64_t v13 = [v10 popoverPresentationController];
      [v13 setSourceView:v12];
    }
    else
    {
      unint64_t v14 = [(UICollectionView *)self->_collectionView collectionViewLayout];
      uint64_t v13 = [v14 layoutAttributesForItemAtIndexPath:v11];

      if (v13)
      {
        [v10 setModalPresentationStyle:7];
        double v15 = [v10 popoverPresentationController];
        [v15 setSourceView:self->_collectionView];
        [v13 frame];
        objc_msgSend(v15, "setSourceRect:");
      }
    }
  }
}

uint64_t __84__SFStartPageCollectionViewController_presentViewController_fromItemWithIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (BOOL)isTrackingDropSession
{
  return self->_hasActiveDrag || [(UICollectionView *)self->_collectionView hasActiveDrop];
}

- (void)_receivedTapToDismissGesture
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained startPageCollectionViewControllerDidCompleteDismissGesture:self];
}

- (void)keyboardDidChangeFrame:(id)a3
{
  BOOL v4 = [a3 userInfo];
  id v6 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];

  id v5 = v6;
  if (v6)
  {
    [v6 CGRectValue];
    -[SFStartPageCollectionViewController updateKeyboardBottomInsetFromKeyboardFrame:](self, "updateKeyboardBottomInsetFromKeyboardFrame:");
    id v5 = v6;
  }
}

uint64_t __68__SFStartPageCollectionViewController_reloadNavigationItemAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCustomTopBackdrops];
}

- (BOOL)_shouldShowContextMenuForCellAtIndexPath:(id)a3 fromPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v7 = [(UICollectionView *)self->_collectionView cellForItemAtIndexPath:a3];
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v7, "convertPoint:fromView:", self->_collectionView, x, y);
    char v8 = objc_msgSend(v7, "shouldShowContextMenuFromPoint:");
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v8 = a4;
  if (-[SFStartPageCollectionViewController _shouldShowContextMenuForCellAtIndexPath:fromPoint:](self, "_shouldShowContextMenuForCellAtIndexPath:fromPoint:", v8, x, y))
  {
    id v9 = [(SFStartPageCollectionViewController *)self sections];
    id v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v8, "section"));

    uint64_t v11 = [(UICollectionViewDiffableDataSource *)self->_collectionDataSource itemIdentifierForIndexPath:v8];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v13 = [v10 contextMenuProvider];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v12 = ((void (**)(void, void *, id))v13)[2](v13, v11, WeakRetained);

      if (v12) {
        [(NSMapTable *)self->_contextMenuToItemIdentifierMap setObject:v11 forKey:v12];
      }
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  [(SFStartPageCollectionViewController *)self collectionView:a3 willEndContextMenuInteractionWithConfiguration:v8 animator:v9];
  id v10 = [v9 previewViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v9 setPreferredCommitStyle:1];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __112__SFStartPageCollectionViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
    v16[3] = &unk_1E54E9A60;
    v16[4] = self;
    id v17 = v10;
    [v9 addAnimations:v16];
  }
  else
  {
    uint64_t v11 = [(NSMapTable *)self->_contextMenuToItemIdentifierMap objectForKey:v8];
    uint64_t v12 = [(UICollectionViewDiffableDataSource *)self->_collectionDataSource indexPathForItemIdentifier:v11];
    if (v12)
    {
      uint64_t v13 = [(SFStartPageCollectionViewController *)self sections];
      unint64_t v14 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v12, "section"));

      double v15 = [v14 contextMenuCommitHandler];
      ((void (**)(void, id, void *, id))v15)[2](v15, v8, v11, v9);
    }
  }
}

void __112__SFStartPageCollectionViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  [v2 pushViewController:*(void *)(a1 + 40) animated:1];
}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(NSMapTable *)self->_contextMenuToItemIdentifierMap objectForKey:a4];
  id v8 = [(UICollectionViewDiffableDataSource *)self->_collectionDataSource indexPathForItemIdentifier:v7];
  if (v8)
  {
    id v9 = [v6 cellForItemAtIndexPath:v8];
    if (v9)
    {
      if (objc_opt_respondsToSelector())
      {
        id v10 = [v9 contextMenuPreviewView];
      }
      else
      {
        id v10 = 0;
      }
      uint64_t v11 = [v10 window];

      if (v11) {
        uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v10];
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMapTable *)self->_contextMenuToItemIdentifierMap objectForKey:v7];
  id v9 = [(UICollectionViewDiffableDataSource *)self->_collectionDataSource indexPathForItemIdentifier:v8];
  if (v9)
  {
    id v10 = [(SFStartPageCollectionViewController *)self sections];
    uint64_t v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v9, "section"));

    uint64_t v12 = [v11 contextMenuDismissHandler];
    ((void (**)(void, id, void *))v12)[2](v12, v7, v8);
  }
  uint64_t v13 = [(SFStartPageCollectionViewController *)self collectionView:v6 previewForHighlightingContextMenuWithConfiguration:v7];

  return v13;
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  self->_isPresentingContextMenu = 1;
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __110__SFStartPageCollectionViewController_collectionView_willEndContextMenuInteractionWithConfiguration_animator___block_invoke;
  v5[3] = &unk_1E54E9858;
  v5[4] = self;
  objc_msgSend(a5, "addAnimations:", v5, a4);
}

unsigned char *__110__SFStartPageCollectionViewController_collectionView_willEndContextMenuInteractionWithConfiguration_animator___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1012) = 0;
  NSDirectionalEdgeInsets result = *(unsigned char **)(a1 + 32);
  if (result[1010])
  {
    NSDirectionalEdgeInsets result = (unsigned char *)[result reloadDataAnimatingDifferences:1];
    *(unsigned char *)(*(void *)(a1 + 32) + 1010) = 0;
  }
  return result;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(SFStartPageCollectionViewController *)self sections];
  uint64_t v7 = [v5 section];

  id v8 = [v6 objectAtIndexedSubscript:v7];

  if ([v8 itemType])
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    id v10 = [v8 contentBanner];
    unint64_t v11 = [v10 contentVariant];

    if (v11 <= 6) {
      unsigned int v9 = (6u >> v11) & 1;
    }
    else {
      LOBYTE(v9) = 1;
    }
  }

  return v9;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  uint64_t v7 = [(SFStartPageCollectionViewController *)self sections];
  id v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));

  unsigned int v9 = [(UICollectionViewDiffableDataSource *)self->_collectionDataSource itemIdentifierForIndexPath:v6];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v11 = [v8 itemType];
  if ((unint64_t)(v11 - 3) < 4) {
    goto LABEL_2;
  }
  if (v11 == 2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_2:
      uint64_t v12 = [(SFStartPageCollectionViewController *)self _gridLocationForIndexPath:v6 inSection:v8];
      objc_msgSend(WeakRetained, "startPageCollectionViewController:didSelectItemWithIdentifier:atGridLocation:", self, v9, v12, v13);
      goto LABEL_10;
    }
    double v15 = [v8 supplementaryAction];
    [v15 performAction];
  }
  else
  {
    if (v11) {
      goto LABEL_10;
    }
    [v16 deselectItemAtIndexPath:v6 animated:1];
    unint64_t v14 = [v8 contentBanner];
    double v15 = [v14 action];

    if (v15) {
      v15[2](v15);
    }
  }

LABEL_10:
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_gridLocationForIndexPath:(id)a3 inSection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SFStartPageCollectionViewController *)self _effectiveLayoutWidth];
  double v9 = v8;
  [(SFStartPageCollectionViewController *)self _sectionContentInsets];
  double v12 = v9 - v10 - v11;
  visualStyleProvider = self->_visualStyleProvider;
  uint64_t v14 = [v6 itemType];

  double v15 = [(SFStartPageCollectionViewController *)self traitCollection];
  uint64_t v16 = [(SFStartPageVisualStyleProviding *)visualStyleProvider numberOfColumnsForSectionItemType:v14 sectionWidth:v15 traitCollection:v12];

  uint64_t v17 = [v7 item] / v16;
  uint64_t v18 = [v7 item];

  int64_t v19 = v18 % v16;
  int64_t v20 = v17;
  result.var1 = v20;
  result.var0 = v19;
  return result;
}

- (void)cancelGestures
{
}

void __60__SFStartPageCollectionViewController__customizationSection__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 139);
    [v2 beginCustomizationForStartPageCollectionViewController:v3];

    id WeakRetained = v3;
  }
}

- (int64_t)_numberOfItemsPerPageInSection:(id)a3
{
  id v4 = a3;
  id v5 = [(SFStartPageCollectionViewController *)self traitCollection];
  if ([v5 horizontalSizeClass] == 1) {
    uint64_t v6 = [v4 numberOfRowsVisibleWhenCollapsedInCompactWidth];
  }
  else {
    uint64_t v6 = [v4 numberOfRowsVisibleWhenCollapsed];
  }
  uint64_t v7 = v6;

  int64_t v8 = [(SFStartPageCollectionViewController *)self _numberOfColumnsInSection:v4] * v7;
  return v8;
}

void __81__SFStartPageCollectionViewController__toggleExpandedActionForSectionIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 139);
    if ([MEMORY[0x1E4F97EA0] is2024CloudTabsEnabled]
      && ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4F98878]] & 1) != 0
      || [MEMORY[0x1E4F97EA0] is2024SuggestionsEnabled]
      && [*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4F988C8]])
    {
      [v3 startPageCollectionViewController:v6 shouldExpandSectionWithIdentifier:*(void *)(a1 + 32)];
    }
    else
    {
      id v4 = [v6 _sectionForIdentifier:*(void *)(a1 + 32)];
      id v5 = objc_loadWeakRetained(v6 + 137);
      [v5 startPageCollectionViewController:v6 toggleSectionExpanded:v4];

      [v6 reloadDataAnimatingDifferences:1];
    }

    id WeakRetained = v6;
  }
}

- (id)_siteCardSectionLayoutForEnvironment:(id)a3 numberOfItems:(int64_t)a4
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(SFStartPageCollectionViewController *)self _sectionContentInsets];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = [v6 container];
  [v15 effectiveContentSize];
  double v17 = v16;
  double v19 = v18 - v10 - v14;

  uint64_t v53 = v6;
  visualStyleProvider = self->_visualStyleProvider;
  id v21 = [v6 traitCollection];
  uint64_t v22 = [(SFStartPageVisualStyleProviding *)visualStyleProvider numberOfColumnsForSectionItemType:3 sectionWidth:v21 traitCollection:v19];

  uint64_t v23 = [MEMORY[0x1E4FB1308] estimatedDimension:112.0];
  int v24 = (void *)MEMORY[0x1E4FB1338];
  double v25 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0 / (double)v22];
  uint64_t v26 = [v24 sizeWithWidthDimension:v25 heightDimension:v23];

  v52 = (void *)v26;
  uint64_t v27 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v26];
  BOOL v28 = [(SFStartPageCollectionViewController *)self _supportsPaginatedSectionLayouts];
  uint64_t v29 = (void *)MEMORY[0x1E4FB1338];
  double v30 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  double v31 = (void *)v23;
  uint64_t v32 = [v29 sizeWithWidthDimension:v30 heightDimension:v23];

  id v51 = (void *)v27;
  double v33 = [MEMORY[0x1E4FB1318] horizontalGroupWithLayoutSize:v32 repeatingSubitem:v27 count:v22];
  if (v28)
  {
    [(SFStartPageCollectionViewController *)self _applyStylingToLayoutGroup:v33 withSectionItemType:3 defaultInterItemSpacing:0.0];
    double v34 = self->_visualStyleProvider;
    uint64_t v35 = [(SFStartPageCollectionViewController *)self traitCollection];
    uint64_t v36 = -[SFStartPageVisualStyleProviding numberOfRowsForSection:traitCollectionIsHorizontalCompact:](v34, "numberOfRowsForSection:traitCollectionIsHorizontalCompact:", 3, [v35 horizontalSizeClass] == 1);

    if (v36 < 2)
    {
      uint64_t v38 = 1;
    }
    else
    {
      uint64_t v37 = v36 - 1;
      uint64_t v38 = 1;
      int64_t v39 = v22;
      do
      {
        if (v39 < a4) {
          ++v38;
        }
        v39 += v22;
        --v37;
      }
      while (v37);
    }
    uint64_t v41 = (void *)MEMORY[0x1E4FB1338];
    double v42 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:0.9];
    int v40 = v31;
    long long v43 = [v41 sizeWithWidthDimension:v42 heightDimension:v31];

    uint64_t v44 = [MEMORY[0x1E4FB1318] verticalGroupWithLayoutSize:v43 repeatingSubitem:v33 count:v38];

    double v33 = (void *)v44;
  }
  else
  {
    int v40 = v31;
  }

  -[SFStartPageCollectionViewController _siteIconLayoutForEnvironment:sectionInsets:](self, "_siteIconLayoutForEnvironment:sectionInsets:", v53, v8, v10, v12, v14);
  if ([MEMORY[0x1E4F97EA0] is2024ReadingListEnabled])
  {
    [(SFStartPageCollectionViewController *)self _applyStylingToLayoutGroup:v33 withSectionItemType:3 defaultInterItemSpacing:0.0];
  }
  else
  {
    long long v45 = [MEMORY[0x1E4FB1340] flexibleSpacing:0.0];
    [v33 setInterItemSpacing:v45];
  }
  long long v46 = [MEMORY[0x1E4FB1330] sectionWithGroup:v33];
  uint64_t v47 = v46;
  if (self->_displaysSectionHeaders)
  {
    char v48 = headerSupplementaryItemLayout();
    v54[0] = v48;
    v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
    [v47 setBoundarySupplementaryItems:v49];
  }
  else
  {
    [v46 setBoundarySupplementaryItems:MEMORY[0x1E4F1CBF0]];
  }
  objc_msgSend(v47, "setContentInsets:", v8, v10, v12, v14);
  -[SFStartPageVisualStyleProviding rowSpacingForSectionItemType:containerSize:](self->_visualStyleProvider, "rowSpacingForSectionItemType:containerSize:", 3, v19, v17);
  objc_msgSend(v47, "setInterGroupSpacing:");
  if ([(SFStartPageCollectionViewController *)self _supportsPaginatedSectionLayouts]) {
    [v47 setOrthogonalScrollingBehavior:4];
  }

  return v47;
}

- (id)_attributedRichLinkSectionLayoutForEnvironment:(id)a3 maximumNumberOfPages:(int64_t)a4 numberOfItems:(int64_t)a5
{
  int64_t v49 = a5;
  v51[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  [(SFStartPageCollectionViewController *)self _sectionContentInsets];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [v7 container];
  [v16 effectiveContentSize];
  double v18 = v17;
  double v20 = v19 - v11 - v15;

  visualStyleProvider = self->_visualStyleProvider;
  uint64_t v22 = [v7 traitCollection];
  uint64_t v23 = [(SFStartPageVisualStyleProviding *)visualStyleProvider numberOfColumnsForSectionItemType:4 sectionWidth:v22 traitCollection:v20];

  uint64_t v24 = [MEMORY[0x1E4FB1308] estimatedDimension:150.0];
  double v25 = (void *)MEMORY[0x1E4FB1338];
  uint64_t v26 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0 / (double)v23];
  uint64_t v27 = [v25 sizeWithWidthDimension:v26 heightDimension:v24];

  BOOL v28 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v27];
  -[SFStartPageCollectionViewController _siteIconLayoutForEnvironment:sectionInsets:](self, "_siteIconLayoutForEnvironment:sectionInsets:", v7, v9, v11, v13, v15);

  BOOL v29 = [(SFStartPageCollectionViewController *)self _supportsPaginatedSectionLayouts];
  double v30 = (void *)MEMORY[0x1E4FB1338];
  double v31 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  uint64_t v50 = (void *)v24;
  uint64_t v32 = [v30 sizeWithWidthDimension:v31 heightDimension:v24];

  double v33 = [MEMORY[0x1E4FB1318] horizontalGroupWithLayoutSize:v32 repeatingSubitem:v28 count:v23];
  int64_t v34 = a4;
  if (a4 >= 2 && v29)
  {
    [(SFStartPageCollectionViewController *)self _applyStylingToLayoutGroup:v33 withSectionItemType:4 defaultInterItemSpacing:0.0];
    uint64_t v35 = (void *)MEMORY[0x1E4FB1338];
    uint64_t v36 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:0.9];
    uint64_t v37 = [v35 sizeWithWidthDimension:v36 heightDimension:v50];

    if (v23 >= v49)
    {
      uint64_t v40 = 1;
    }
    else
    {
      uint64_t v38 = self->_visualStyleProvider;
      int64_t v39 = [(SFStartPageCollectionViewController *)self traitCollection];
      uint64_t v40 = -[SFStartPageVisualStyleProviding numberOfRowsForSection:traitCollectionIsHorizontalCompact:](v38, "numberOfRowsForSection:traitCollectionIsHorizontalCompact:", 4, [v39 horizontalSizeClass] == 1);
    }
    uint64_t v41 = objc_msgSend(MEMORY[0x1E4FB1318], "verticalGroupWithLayoutSize:repeatingSubitem:count:", v37, v33, v40, v49);

    double v33 = (void *)v41;
  }

  if ([MEMORY[0x1E4F97EA0] is2024SuggestionsEnabled])
  {
    [(SFStartPageCollectionViewController *)self _applyStylingToLayoutGroup:v33 withSectionItemType:4 defaultInterItemSpacing:0.0];
  }
  else
  {
    double v42 = [MEMORY[0x1E4FB1340] fixedSpacing:0.0];
    [v33 setInterItemSpacing:v42];
  }
  long long v43 = objc_msgSend(MEMORY[0x1E4FB1330], "sectionWithGroup:", v33, v49);
  uint64_t v44 = v43;
  if (self->_displaysSectionHeaders)
  {
    long long v45 = headerSupplementaryItemLayout();
    v51[0] = v45;
    long long v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
    [v44 setBoundarySupplementaryItems:v46];
  }
  else
  {
    [v43 setBoundarySupplementaryItems:MEMORY[0x1E4F1CBF0]];
  }
  -[SFStartPageVisualStyleProviding rowSpacingForSectionItemType:containerSize:](self->_visualStyleProvider, "rowSpacingForSectionItemType:containerSize:", 4, v20, v18);
  objc_msgSend(v44, "setInterGroupSpacing:");
  objc_msgSend(v44, "setContentInsets:", v9, v11, v13, v15);
  BOOL v47 = [(SFStartPageCollectionViewController *)self _supportsPaginatedSectionLayouts];
  if (v34 >= 2 && v47 && [MEMORY[0x1E4F97EA0] is2024SuggestionsEnabled]) {
    [v44 setOrthogonalScrollingBehavior:4];
  }

  return v44;
}

- (id)_squareRichLinkSectionLayoutForEnvironment:(id)a3 numberOfItems:(int64_t)a4
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(SFStartPageCollectionViewController *)self _sectionContentInsets];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = [v6 container];
  [v15 effectiveContentSize];
  double v17 = v16;
  double v19 = v18 - v10 - v14;

  visualStyleProvider = self->_visualStyleProvider;
  id v21 = [v6 traitCollection];

  int64_t v22 = [(SFStartPageVisualStyleProviding *)visualStyleProvider numberOfColumnsForSectionItemType:6 sectionWidth:v21 traitCollection:v19];
  uint64_t v23 = [MEMORY[0x1E4FB1308] estimatedDimension:200.0];
  uint64_t v24 = (void *)MEMORY[0x1E4FB1338];
  double v25 = 1.0;
  uint64_t v26 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0 / (double)v22];
  uint64_t v27 = [v24 sizeWithWidthDimension:v26 heightDimension:v23];

  BOOL v28 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v27];
  BOOL v29 = [(SFStartPageCollectionViewController *)self traitCollection];
  uint64_t v30 = [v29 horizontalSizeClass];

  if (v30 == 1)
  {
    double v31 = (void *)MEMORY[0x1E4FB1338];
    uint64_t v32 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
    double v33 = [v31 sizeWithWidthDimension:v32 heightDimension:v23];

    int64_t v34 = [MEMORY[0x1E4FB1318] horizontalGroupWithLayoutSize:v33 repeatingSubitem:v28 count:v22];
    [(SFStartPageCollectionViewController *)self _applyStylingToLayoutGroup:v34 withSectionItemType:6 defaultInterItemSpacing:0.0];
    uint64_t v35 = (void *)MEMORY[0x1E4FB1338];
    uint64_t v36 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:0.9];
    uint64_t v37 = [v35 sizeWithWidthDimension:v36 heightDimension:v23];

    if (v22 >= a4) {
      uint64_t v38 = 1;
    }
    else {
      uint64_t v38 = [(SFStartPageVisualStyleProviding *)self->_visualStyleProvider numberOfRowsForSection:6 traitCollectionIsHorizontalCompact:1];
    }
    double v42 = [MEMORY[0x1E4FB1318] verticalGroupWithLayoutSize:v37 repeatingSubitem:v34 count:v38];
  }
  else
  {
    if ((_SFDeviceIsPad() & 1) == 0)
    {
      int64_t v39 = [(SFStartPageCollectionViewController *)self view];
      if (objc_msgSend(v39, "_sf_hasLandscapeAspectRatio")) {
        double v25 = 0.9;
      }
      else {
        double v25 = 1.0;
      }
    }
    uint64_t v40 = (void *)MEMORY[0x1E4FB1338];
    uint64_t v41 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:v25];
    double v33 = [v40 sizeWithWidthDimension:v41 heightDimension:v23];

    double v42 = [MEMORY[0x1E4FB1318] horizontalGroupWithLayoutSize:v33 repeatingSubitem:v28 count:v22];
  }

  [(SFStartPageCollectionViewController *)self _applyStylingToLayoutGroup:v42 withSectionItemType:6 defaultInterItemSpacing:0.0];
  long long v43 = [MEMORY[0x1E4FB1330] sectionWithGroup:v42];
  uint64_t v44 = v43;
  if (self->_displaysSectionHeaders)
  {
    long long v45 = headerSupplementaryItemLayout();
    v48[0] = v45;
    long long v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
    [v44 setBoundarySupplementaryItems:v46];
  }
  else
  {
    [v43 setBoundarySupplementaryItems:MEMORY[0x1E4F1CBF0]];
  }
  objc_msgSend(v44, "setContentInsets:", v8, v10, v12, v14);
  -[SFStartPageVisualStyleProviding rowSpacingForSectionItemType:containerSize:](self->_visualStyleProvider, "rowSpacingForSectionItemType:containerSize:", 4, v19, v17);
  objc_msgSend(v44, "setInterGroupSpacing:");
  if ([(SFStartPageCollectionViewController *)self _supportsPaginatedSectionLayouts]) {
    [v44 setOrthogonalScrollingBehavior:4];
  }

  return v44;
}

- (id)_siteRowSectionLayoutForEnvironment:(id)a3
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4FB1338];
  id v5 = (void *)MEMORY[0x1E4FB1308];
  id v6 = a3;
  double v7 = [v5 fractionalWidthDimension:1.0];
  double v8 = [MEMORY[0x1E4FB1308] estimatedDimension:40.0];
  double v9 = [v4 sizeWithWidthDimension:v7 heightDimension:v8];

  double v10 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v9];
  [(SFStartPageCollectionViewController *)self _sectionContentInsets];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v19 = [v6 container];
  [v19 effectiveContentSize];
  double v21 = v20;
  double v23 = v22 - v14 - v18;

  visualStyleProvider = self->_visualStyleProvider;
  double v25 = [v6 traitCollection];
  uint64_t v26 = [(SFStartPageVisualStyleProviding *)visualStyleProvider numberOfColumnsForSectionItemType:5 sectionWidth:v25 traitCollection:v23];

  -[SFStartPageCollectionViewController _siteIconLayoutForEnvironment:sectionInsets:](self, "_siteIconLayoutForEnvironment:sectionInsets:", v6, v12, v14, v16, v18, 0, 0);
  uint64_t v27 = (void *)MEMORY[0x1E4FB1338];
  BOOL v28 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  BOOL v29 = [MEMORY[0x1E4FB1308] estimatedDimension:40.0];
  uint64_t v30 = [v27 sizeWithWidthDimension:v28 heightDimension:v29];

  double v31 = [MEMORY[0x1E4FB1318] horizontalGroupWithLayoutSize:v30 subitem:v10 count:v26];
  uint64_t v32 = [(SFStartPageVisualStyleProviding *)self->_visualStyleProvider interItemSpacingForSectionItemType:5];
  if (v32)
  {
    [v31 setInterItemSpacing:v32];
  }
  else
  {
    double v33 = [MEMORY[0x1E4FB1340] fixedSpacing:0.0];
    [v31 setInterItemSpacing:v33];
  }
  int64_t v34 = [MEMORY[0x1E4FB1330] sectionWithGroup:v31];
  uint64_t v35 = v34;
  if (self->_displaysSectionHeaders)
  {
    uint64_t v36 = headerSupplementaryItemLayout();
    v39[0] = v36;
    uint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
    [v35 setBoundarySupplementaryItems:v37];
  }
  else
  {
    [v34 setBoundarySupplementaryItems:MEMORY[0x1E4F1CBF0]];
  }
  objc_msgSend(v35, "setContentInsets:", v12, v14, v16, v18);
  -[SFStartPageVisualStyleProviding rowSpacingForSectionItemType:containerSize:](self->_visualStyleProvider, "rowSpacingForSectionItemType:containerSize:", 5, v23, v21);
  objc_msgSend(v35, "setInterGroupSpacing:");

  return v35;
}

- (BOOL)_supportsPaginatedSectionLayouts
{
  id v2 = [(SFStartPageCollectionViewController *)self traitCollection];
  if ([v2 horizontalSizeClass] == 1) {
    LOBYTE(v3) = 1;
  }
  else {
    int v3 = _SFDeviceIsPad() ^ 1;
  }

  return v3;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  [v8 locationInView:a3];
  if (-[SFStartPageCollectionViewController _shouldShowContextMenuForCellAtIndexPath:fromPoint:](self, "_shouldShowContextMenuForCellAtIndexPath:fromPoint:", v9))
  {
    double v10 = [(SFStartPageCollectionViewController *)self sections];
    double v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v9, "section"));

    double v12 = [(UICollectionViewDiffableDataSource *)self->_collectionDataSource itemIdentifierForIndexPath:v9];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v13 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      double v14 = [v11 dragItemProvider];
      double v15 = ((void (**)(void, void *, id))v14)[2](v14, v12, v8);

      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      double v19 = __95__SFStartPageCollectionViewController_collectionView_itemsForBeginningDragSession_atIndexPath___block_invoke;
      double v20 = &unk_1E54ECEF0;
      double v21 = self;
      id v22 = v9;
      [v15 setPreviewProvider:&v17];
      if (v15)
      {
        self->_hasActiveDrag = 1;
        v23[0] = v15;
        double v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v23, 1, v17, v18, v19, v20, v21);
      }
      else
      {
        double v13 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
  }
  else
  {
    double v13 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

id __95__SFStartPageCollectionViewController_collectionView_itemsForBeginningDragSession_atIndexPath___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _previewForCellAtIndexPath:*(void *)(a1 + 40)];
  int v3 = [v2 window];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) _dragPreviewParametersForSourceView:v2 atIndexPath:*(void *)(a1 + 40)];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1718]) initWithView:v2 parameters:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(SFStartPageCollectionViewController *)self _previewForCellAtIndexPath:v5];
  if (v6)
  {
    double v7 = [(SFStartPageCollectionViewController *)self _dragPreviewParametersForSourceView:v6 atIndexPath:v5];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (id)_previewForCellAtIndexPath:(id)a3
{
  int v3 = [(UICollectionView *)self->_collectionView cellForItemAtIndexPath:a3];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 contextMenuPreviewView];
  }
  else
  {
    id v4 = 0;
  }
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = v3;
  }
  id v6 = v5;

  return v6;
}

- (id)_dragPreviewParametersForSourceView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  double v7 = (objc_class *)MEMORY[0x1E4FB1720];
  id v8 = a4;
  id v9 = objc_alloc_init(v7);
  double v10 = [MEMORY[0x1E4FB1618] clearColor];
  [v9 setBackgroundColor:v10];

  double v11 = [(SFStartPageCollectionViewController *)self sections];
  uint64_t v12 = [v8 section];

  double v13 = [v11 objectAtIndexedSubscript:v12];

  uint64_t v14 = [v13 itemType];
  if ((unint64_t)(v14 - 3) >= 2 && v14 == 2)
  {
    +[_SFSiteIcon cornerRadius];
    double v15 = [MEMORY[0x1E4FB1618] clearColor];
    [v9 setBackgroundColor:v15];
  }
  double v16 = (void *)MEMORY[0x1E4FB14C0];
  [v6 bounds];
  uint64_t v17 = objc_msgSend(v16, "bezierPathWithRoundedRect:cornerRadius:");
  [v9 setVisiblePath:v17];

  return v9;
}

- (BOOL)_canDrop
{
  id v2 = [(SFStartPageCollectionViewController *)self sections];
  char v3 = objc_msgSend(v2, "safari_containsObjectPassingTest:", &__block_literal_global_53);

  return v3;
}

BOOL __47__SFStartPageCollectionViewController__canDrop__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 dropHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F97E48];
  id v6 = a4;
  double v7 = [v5 sharedLogger];
  [v7 didStartDragWithDragContentType:5];

  id v8 = [(UICollectionView *)self->_collectionView window];
  [v6 setLocalContext:v8];

  [(SFStartPageCollectionViewController *)self _updateInteractionEnabled];
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  self->_hasActiveDrag = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__SFStartPageCollectionViewController_collectionView_dragSessionDidEnd___block_invoke;
  block[3] = &unk_1E54E9858;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __72__SFStartPageCollectionViewController_collectionView_dragSessionDidEnd___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateInteractionEnabled];
}

- (void)_updateInteractionEnabled
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = [(UICollectionView *)self->_collectionView visibleSupplementaryViewsOfKind:*MEMORY[0x1E4FB2770]];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [(SFStartPageCollectionViewController *)self _updateInteractionEnabledForView:*(void *)(*((void *)&v10 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  id v8 = [(SFStartPageCollectionViewController *)self sections];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__SFStartPageCollectionViewController__updateInteractionEnabled__block_invoke;
  v9[3] = &unk_1E54ECF38;
  void v9[4] = self;
  [v8 enumerateObjectsUsingBlock:v9];
}

void __64__SFStartPageCollectionViewController__updateInteractionEnabled__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if (![v7 itemType] || objc_msgSend(v7, "itemType") == 1)
  {
    uint64_t v5 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:a3];
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 1000) cellForItemAtIndexPath:v5];
    [*(id *)(a1 + 32) _updateInteractionEnabledForView:v6];
  }
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5
{
  return 3;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy__8;
  int64_t v39 = __Block_byref_object_dispose__8;
  id v40 = 0;
  [v9 locationInView:v8];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  BOOL v29 = __100__SFStartPageCollectionViewController_collectionView_dropSessionDidUpdate_withDestinationIndexPath___block_invoke;
  uint64_t v30 = &unk_1E54ECF60;
  uint64_t v32 = &v35;
  id v15 = v8;
  id v31 = v15;
  uint64_t v33 = v12;
  uint64_t v34 = v14;
  [v15 performUsingPresentationValues:&v27];
  id v16 = (id)v36[5];

  unint64_t v17 = objc_msgSend(v16, "section", v27, v28, v29, v30);
  uint64_t v18 = [(SFStartPageCollectionViewController *)self sections];
  double v19 = v18;
  if (v16 && v17 < [v18 count])
  {
    double v20 = [v19 objectAtIndexedSubscript:v17];
    double v21 = [v20 dropOperationProvider];
    uint64_t v22 = ((uint64_t (**)(void, uint64_t, id))v21)[2](v21, [v16 item], v9);

    id v23 = objc_alloc(MEMORY[0x1E4FB15B8]);
    if ((v22 & 0xFFFFFFFFFFFFFFFELL) == 2) {
      uint64_t v24 = 1;
    }
    else {
      uint64_t v24 = 2;
    }
    double v25 = (void *)[v23 initWithDropOperation:v22 intent:v24];
  }
  else
  {
    double v25 = (void *)[objc_alloc(MEMORY[0x1E4FB15B8]) initWithDropOperation:0];
  }

  _Block_object_dispose(&v35, 8);

  return v25;
}

void __100__SFStartPageCollectionViewController_collectionView_dropSessionDidUpdate_withDestinationIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "indexPathForItemAtPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v10 = a4;
  uint64_t v5 = [(SFStartPageCollectionViewController *)self sections];
  uint64_t v6 = [v10 destinationIndexPath];
  id v7 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));

  id v8 = [v7 dropHandler];

  if (v8)
  {
    id v9 = [v7 dropHandler];
    ((void (**)(void, id))v9)[2](v9, v10);
  }
}

- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__SFStartPageCollectionViewController_collectionView_dropSessionDidExit___block_invoke;
  block[3] = &unk_1E54E9858;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __73__SFStartPageCollectionViewController_collectionView_dropSessionDidExit___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateInteractionEnabled];
}

- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__SFStartPageCollectionViewController_collectionView_dropSessionDidEnd___block_invoke;
  block[3] = &unk_1E54E9858;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __72__SFStartPageCollectionViewController_collectionView_dropSessionDidEnd___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateInteractionEnabled];
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5
{
  return 3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (self->_tapToDismissGestureRecognizer == a3)
  {
    id v9 = [v6 view];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v8 = 0;
    }
    else
    {
      collectionView = self->_collectionView;
      [v7 locationInView:collectionView];
      uint64_t v11 = -[UICollectionView indexPathForItemAtPoint:](collectionView, "indexPathForItemAtPoint:");
      BOOL v8 = v11 == 0;
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (SFStartPageCollectionDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (SFStartPageCollectionDataSource *)WeakRetained;
}

- (SFStartPageCollectionDataSource)strongDataSource
{
  return self->_strongDataSource;
}

- (SFStartPageCollectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFStartPageCollectionDelegate *)WeakRetained;
}

- (BOOL)displaysSectionHeaders
{
  return self->_displaysSectionHeaders;
}

- (BOOL)hidesEmptyNavigationBar
{
  return self->_hidesEmptyNavigationBar;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_strongDataSource, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_contextMenuToItemIdentifierMap, 0);
  objc_storeStrong((id *)&self->_visualStyleProvider, 0);
  objc_storeStrong((id *)&self->_tapToDismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_statusBarBackdrop, 0);
  objc_storeStrong((id *)&self->_navigationBarSeparator, 0);
  objc_storeStrong((id *)&self->_navigationBarBackdrop, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_collectionDataSource, 0);
  objc_storeStrong((id *)&self->_cellBackdropCaptureView, 0);

  objc_storeStrong((id *)&self->_cachedCustomizationSection, 0);
}

- (void)reloadDataAnimatingDifferences:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18C354000, log, OS_LOG_TYPE_FAULT, "Attempting to update current snapshot while not on the main thread", v1, 2u);
}

void __64__SFStartPageCollectionViewController__makeCollectionViewLayout__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18C354000, log, OS_LOG_TYPE_FAULT, "Attempted to provide a start page section layout using a nil collection view controller", v1, 2u);
}

@end