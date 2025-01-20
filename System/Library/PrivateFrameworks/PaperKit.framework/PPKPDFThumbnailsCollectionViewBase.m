@interface PPKPDFThumbnailsCollectionViewBase
- (BOOL)_canEditDocument;
- (BOOL)allowsPageReordering;
- (BOOL)largeThumbnails;
- (BOOL)shouldDisplayActionButtonForPage:(id)a3;
- (PPKPDFThumbnailViewBase)thumbnailView;
- (UICollectionView)collectionView;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4;
- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4;
- (id)contextMenuForBackgroundAtLocation:(CGPoint)a3;
- (id)contextMenuForPage:(id)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)currentPage;
- (id)initFromThumbnailView:(id)a3;
- (id)itemsForDragWithSession:(id)a3 atIndexPath:(id)a4;
- (id)makeDatasource;
- (id)previewForCollectionView:(id)a3 contextMenuInteraction:(id)a4;
- (id)previewForCollectionView:(id)a3 indexPath:(id)a4;
- (id)supportedUTTypes;
- (void)_insertFileAtURL:(id)a3 type:(id)a4 atIndex:(unint64_t)a5 completionHandler:(id)a6;
- (void)_selectAndScrollToCurrentPageIfNeeded;
- (void)_updateActionsButtonVisibilityAtIndexPath:(id)a3;
- (void)_updateMetricsIfNeeded;
- (void)_updateScrubber;
- (void)applySnapshotWithAnimation:(BOOL)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)configureCell:(id)a3 withPage:(id)a4 indexPath:(id)a5;
- (void)currentPageChanged:(id)a3;
- (void)documentChanged:(id)a3;
- (void)documentMutated:(id)a3;
- (void)movePageWithTransaction:(id)a3;
- (void)pageChanged:(id)a3;
- (void)reloadPage:(id)a3;
- (void)reloadPageAt:(int64_t)a3;
- (void)setAllowsPageReordering:(BOOL)a3;
- (void)setCollectionView:(id)a3;
- (void)setLargeThumbnails:(BOOL)a3;
- (void)setThumbnailView:(id)a3;
- (void)updateIconsImages;
@end

@implementation PPKPDFThumbnailsCollectionViewBase

- (id)initFromThumbnailView:(id)a3
{
  v42[4] = *MEMORY[0x263EF8340];
  id obj = a3;
  v41.receiver = self;
  v41.super_class = (Class)PPKPDFThumbnailsCollectionViewBase;
  v4 = [(PPKPDFThumbnailsCollectionViewBase *)&v41 init];
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_thumbnailView, obj);
    id v37 = objc_alloc_init(MEMORY[0x263F82570]);
    [v37 setScrollDirection:0];
    [v37 setMinimumLineSpacing:0.0];
    objc_msgSend(v37, "setEstimatedItemSize:", *MEMORY[0x263F833F8], *(double *)(MEMORY[0x263F833F8] + 8));
    objc_initWeak(&location, v5);
    v6 = [PPKLayoutCompleteCollectionView alloc];
    [obj bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __60__PPKPDFThumbnailsCollectionViewBase_initFromThumbnailView___block_invoke;
    v38[3] = &unk_2640D3B18;
    objc_copyWeak(&v39, &location);
    uint64_t v15 = -[PPKLayoutCompleteCollectionView initWithFrame:collectionViewLayout:layoutCompletion:](v6, "initWithFrame:collectionViewLayout:layoutCompletion:", v37, v38, v8, v10, v12, v14);
    collectionView = v5->_collectionView;
    v5->_collectionView = (UICollectionView *)v15;

    [(PPKPDFThumbnailsCollectionViewBase *)v5 addSubview:v5->_collectionView];
    [(UICollectionView *)v5->_collectionView setAllowsFocus:1];
    [(UICollectionView *)v5->_collectionView setDragInteractionEnabled:1];
    [(UICollectionView *)v5->_collectionView setDragDelegate:v5];
    [(UICollectionView *)v5->_collectionView setDropDelegate:v5];
    [(UICollectionView *)v5->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
    v30 = (void *)MEMORY[0x263F08938];
    v35 = [(UICollectionView *)v5->_collectionView bottomAnchor];
    v34 = [(PPKPDFThumbnailsCollectionViewBase *)v5 bottomAnchor];
    v33 = [v35 constraintEqualToAnchor:v34];
    v42[0] = v33;
    v32 = [(UICollectionView *)v5->_collectionView topAnchor];
    v31 = [(PPKPDFThumbnailsCollectionViewBase *)v5 topAnchor];
    v17 = [v32 constraintEqualToAnchor:v31];
    v42[1] = v17;
    v18 = [(UICollectionView *)v5->_collectionView leadingAnchor];
    v19 = [(PPKPDFThumbnailsCollectionViewBase *)v5 leadingAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v42[2] = v20;
    v21 = [(UICollectionView *)v5->_collectionView trailingAnchor];
    v22 = [(PPKPDFThumbnailsCollectionViewBase *)v5 trailingAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    v42[3] = v23;
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:4];
    [v30 activateConstraints:v24];

    [(UICollectionView *)v5->_collectionView registerClass:NSClassFromString(&cfstr_Ppkpdficoncoll.isa) forCellWithReuseIdentifier:@"PDFIconCollectionViewCell"];
    uint64_t v25 = [(PPKPDFThumbnailsCollectionViewBase *)v5 makeDatasource];
    dataSource = v5->_dataSource;
    v5->_dataSource = (UICollectionViewDiffableDataSource *)v25;

    [(UICollectionView *)v5->_collectionView setDataSource:v5->_dataSource];
    [(UICollectionView *)v5->_collectionView setDelegate:v5];
    v27 = [MEMORY[0x263F825C8] clearColor];
    [(UICollectionView *)v5->_collectionView setBackgroundColor:v27];

    v28 = (void *)[objc_alloc(MEMORY[0x263F82628]) initWithDelegate:v5];
    [(UICollectionView *)v5->_collectionView addInteraction:v28];
    [(PPKPDFThumbnailsCollectionViewBase *)v5 _updateMetricsIfNeeded];

    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __60__PPKPDFThumbnailsCollectionViewBase_initFromThumbnailView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _selectAndScrollToCurrentPageIfNeeded];
}

- (id)makeDatasource
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x263F82560]);
  collectionView = self->_collectionView;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__PPKPDFThumbnailsCollectionViewBase_makeDatasource__block_invoke;
  v11[3] = &unk_2640D3B40;
  objc_copyWeak(&v12, &location);
  v5 = (void *)[v3 initWithCollectionView:collectionView cellProvider:v11];
  v6 = [v5 reorderingHandlers];
  [v6 setCanReorderItemHandler:&__block_literal_global_0];

  double v7 = [v5 reorderingHandlers];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__PPKPDFThumbnailsCollectionViewBase_makeDatasource__block_invoke_3;
  v9[3] = &unk_2640D3B88;
  objc_copyWeak(&v10, &location);
  [v7 setDidReorderHandler:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v5;
}

id __52__PPKPDFThumbnailsCollectionViewBase_makeDatasource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  double v9 = [a2 dequeueReusableCellWithReuseIdentifier:@"PDFIconCollectionViewCell" forIndexPath:v7];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v11 = WeakRetained;
  if (v8 && WeakRetained) {
    [WeakRetained configureCell:v9 withPage:v8 indexPath:v7];
  }

  return v9;
}

uint64_t __52__PPKPDFThumbnailsCollectionViewBase_makeDatasource__block_invoke_2()
{
  return 1;
}

void __52__PPKPDFThumbnailsCollectionViewBase_makeDatasource__block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained movePageWithTransaction:v5];
  }
}

- (void)reloadPageAt:(int64_t)a3
{
  dataSource = self->_dataSource;
  id v5 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:0];
  id v7 = [(UICollectionViewDiffableDataSource *)dataSource itemIdentifierForIndexPath:v5];

  v6 = v7;
  if (v7)
  {
    [(PPKPDFThumbnailsCollectionViewBase *)self reloadPage:v7];
    v6 = v7;
  }
}

- (void)configureCell:(id)a3 withPage:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = os_log_create("com.apple.PaperKit", "PDFThumbnailsCollectionViewBase");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[PPKPDFThumbnailsCollectionViewBase configureCell:withPage:indexPath:](v10, v11);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  uint64_t v13 = [WeakRetained layoutMode];
  [WeakRetained thumbnailSize];
  if (v13) {
    [v8 setThumbnailHeight:v14];
  }
  else {
    objc_msgSend(v8, "setThumbnailWidth:");
  }
  [v8 setHasLargeThumbnail:self->_largeThumbnails];
  [v9 boundsForBox:1];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  memset(&v50, 0, sizeof(v50));
  CGAffineTransformMakeRotation(&v50, (double)[v9 rotation] / 180.0 * 3.14159265);
  CGAffineTransform v49 = v50;
  v51.origin.x = v16;
  v51.origin.y = v18;
  v51.size.width = v20;
  v51.size.height = v22;
  CGRect v52 = CGRectApplyAffineTransform(v51, &v49);
  objc_msgSend(v8, "updateAspectConstraintWithSize:", v52.size.width, v52.size.height);
  [v8 setPage:v9];
  [(PPKPDFThumbnailsCollectionViewBase *)self updateImageForCell:v8 indexPath:v10 page:v9];
  objc_initWeak((id *)&v49, self);
  objc_initWeak(&location, v8);
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __71__PPKPDFThumbnailsCollectionViewBase_configureCell_withPage_indexPath___block_invoke;
  v44[3] = &unk_2640D3BD8;
  objc_copyWeak(&v46, (id *)&v49);
  objc_copyWeak(&v47, &location);
  id v23 = v9;
  id v45 = v23;
  v24 = [v8 actionsButton];
  [v24 _setMenuProvider:v44];

  uint64_t v25 = [v8 actionsButton];
  [v25 setShowsMenuAsPrimaryAction:1];

  LODWORD(v25) = [(PPKPDFThumbnailsCollectionViewBase *)self shouldDisplayActionButtonForPage:v23];
  v26 = [v8 actionsButton];
  [v26 setHidden:v25 ^ 1];

  [v8 invalidateIntrinsicContentSize];
  v27 = [v23 document];
  uint64_t v28 = [v27 indexForPage:v23];

  v29 = NSString;
  v30 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.PaperKit"];
  v31 = [v30 localizedStringForKey:@"Thumbnail for page %ld" value:&stru_26C165408 table:@"Localizable"];
  uint64_t v32 = v28 + 1;
  v33 = objc_msgSend(v29, "stringWithFormat:", v31, v28 + 1);
  [v8 setAccessibilityLabel:v33];

  v34 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.PaperKit"];
  v35 = [v34 localizedStringForKey:@"PDF thumbnail" value:&stru_26C165408 table:@"Localizable"];
  [v8 setAccessibilityIdentifier:v35];

  v36 = NSString;
  id v37 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.PaperKit"];
  v38 = [v37 localizedStringForKey:@"Page actions for page %ld" value:&stru_26C165408 table:@"Localizable"];
  id v39 = objc_msgSend(v36, "stringWithFormat:", v38, v32);
  v40 = [v8 actionsButton];
  [v40 setAccessibilityLabel:v39];

  objc_super v41 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.PaperKit"];
  v42 = [v41 localizedStringForKey:@"Page actions" value:&stru_26C165408 table:@"Localizable"];
  v43 = [v8 actionsButton];
  [v43 setAccessibilityIdentifier:v42];

  objc_destroyWeak(&v47);
  objc_destroyWeak(&v46);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)&v49);
}

id __71__PPKPDFThumbnailsCollectionViewBase_configureCell_withPage_indexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = (void *)MEMORY[0x263F14C08];
    id v9 = objc_loadWeakRetained((id *)(a1 + 48));
    id v10 = [v9 window];
    double v11 = [v8 activeToolPickerForWindow:v10];

    if (v11)
    {
      id v12 = objc_alloc(MEMORY[0x263F14AD8]);
      uint64_t v25 = MEMORY[0x263EF8330];
      uint64_t v26 = 3221225472;
      v27 = __71__PPKPDFThumbnailsCollectionViewBase_configureCell_withPage_indexPath___block_invoke_2;
      uint64_t v28 = &unk_2640D3BB0;
      objc_copyWeak(&v30, (id *)(a1 + 48));
      id v29 = v11;
      uint64_t v13 = [v12 initWithHandler:&v25];
      double v14 = (void *)WeakRetained[54];
      WeakRetained[54] = v13;

      double v15 = (void *)WeakRetained[54];
      CAFrameRateRange v32 = CAFrameRateRangeMake(30.0, 120.0, 30.0);
      float minimum = v32.minimum;
      float maximum = v32.maximum;
      float preferred = v32.preferred;
      double v19 = objc_msgSend(MEMORY[0x263EFF9F0], "mainRunLoop", v25, v26, v27, v28);
      *(float *)&double v20 = minimum;
      *(float *)&double v21 = maximum;
      *(float *)&double v22 = preferred;
      objc_msgSend(v15, "startWithPreferredFramesPerSecond:addToRunLoop:forMode:", v19, *MEMORY[0x263EFF588], v20, v21, v22);

      objc_destroyWeak(&v30);
    }
    id v23 = [WeakRetained contextMenuForPage:*(void *)(a1 + 32)];
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

uint64_t __71__PPKPDFThumbnailsCollectionViewBase_configureCell_withPage_indexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained actionsButton];
  uint64_t v4 = [v3 isHeld];

  int v5 = [*(id *)(a1 + 32) _isLockedHidden];
  if (v4)
  {
    if ((v5 & 1) == 0) {
      [*(id *)(a1 + 32) _lockHidden];
    }
  }
  else if (v5)
  {
    [*(id *)(a1 + 32) _unlockHidden];
  }
  return v4;
}

- (void)applySnapshotWithAnimation:(BOOL)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  if (!self->_isApplyingCollectionViewTransaction)
  {
    BOOL v3 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
    id v6 = [WeakRetained PDFView];
    id v7 = [v6 document];

    if (WeakRetained) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8 && ([v7 isLocked] & 1) == 0)
    {
      id v9 = objc_alloc_init(MEMORY[0x263F82358]);
      v18[0] = @"Thumbnails";
      id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
      [v9 appendSectionsWithIdentifiers:v10];

      if ([v7 pageCount])
      {
        unint64_t v11 = 0;
        do
        {
          uint64_t v12 = [v7 pageAtIndex:v11];
          uint64_t v13 = (void *)v12;
          if (v12)
          {
            uint64_t v17 = v12;
            double v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
            [v9 appendItemsWithIdentifiers:v14 intoSectionWithIdentifier:@"Thumbnails"];
          }
          ++v11;
        }
        while ([v7 pageCount] > v11);
      }
      dataSource = self->_dataSource;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __65__PPKPDFThumbnailsCollectionViewBase_applySnapshotWithAnimation___block_invoke;
      v16[3] = &unk_2640D3C00;
      v16[4] = self;
      [(UICollectionViewDiffableDataSource *)dataSource applySnapshot:v9 animatingDifferences:v3 completion:v16];
    }
  }
}

uint64_t __65__PPKPDFThumbnailsCollectionViewBase_applySnapshotWithAnimation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _selectAndScrollToCurrentPageIfNeeded];
}

- (BOOL)allowsPageReordering
{
  return [(UICollectionView *)self->_collectionView dragInteractionEnabled];
}

- (void)setAllowsPageReordering:(BOOL)a3
{
}

- (void)setLargeThumbnails:(BOOL)a3
{
  if (self->_largeThumbnails != a3)
  {
    self->_largeThumbnails = a3;
    [(PPKPDFThumbnailsCollectionViewBase *)self _updateMetricsIfNeeded];
  }
}

- (void)_updateMetricsIfNeeded
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v3 = [(PPKPDFThumbnailsCollectionViewBase *)self largeThumbnails];
  double v4 = 5.0;
  double v5 = 8.0;
  if (v3) {
    double v4 = 8.0;
  }
  else {
    double v5 = 2.0;
  }
  self->_SectionVerticalEdgesInset = v4;
  self->_ImageCornerRadius = v5;
  id v6 = [(UICollectionView *)self->_collectionView collectionViewLayout];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v8 = [(UICollectionView *)self->_collectionView collectionViewLayout];
    objc_msgSend(v8, "setSectionInset:", self->_SectionVerticalEdgesInset, 0.0, self->_SectionVerticalEdgesInset, 0.0);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = [(UICollectionView *)self->_collectionView preparedCells];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "setHasLargeThumbnail:", -[PPKPDFThumbnailsCollectionViewBase largeThumbnails](self, "largeThumbnails"));
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)updateIconsImages
{
}

- (id)currentPage
{
  BOOL v3 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
  double v4 = v3;
  if (v3 && [v3 count])
  {
    double v5 = [v4 firstObject];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
    id v7 = [WeakRetained PDFView];
    BOOL v8 = [v7 document];
    id v9 = objc_msgSend(v8, "pageAtIndex:", objc_msgSend(v5, "item"));
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)documentChanged:(id)a3
{
}

- (void)documentMutated:(id)a3
{
}

- (void)currentPageChanged:(id)a3
{
  [(PPKPDFThumbnailsCollectionViewBase *)self _updateScrubber];
  [(PPKPDFThumbnailsCollectionViewBase *)self _selectAndScrollToCurrentPageIfNeeded];
}

- (void)pageChanged:(id)a3
{
  if (!self->_isApplyingCollectionViewTransaction)
  {
    double v4 = (void *)MEMORY[0x263F8C6D0];
    id v5 = a3;
    [v4 cancelPreviousPerformRequestsWithTarget:self selector:sel_pageChanged_ object:0];
    id v7 = [v5 userInfo];

    id v6 = [v7 objectForKey:@"page"];
    if (v6) {
      [(PPKPDFThumbnailsCollectionViewBase *)self reloadPage:v6];
    }
  }
}

- (void)reloadPage:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
  id v6 = [v5 itemIdentifiers];
  char v7 = [v6 containsObject:v4];

  if (v7)
  {
    v10[0] = v4;
    BOOL v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    [v5 reconfigureItemsWithIdentifiers:v8];

    [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v5 animatingDifferences:0];
  }
  else
  {
    id v9 = os_log_create("com.apple.PaperKit", "PDFThumbnailsCollectionViewBase");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PPKPDFThumbnailsCollectionViewBase reloadPage:](v9);
    }
  }
}

- (void)_updateScrubber
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  uint64_t v4 = [WeakRetained layoutMode];

  id v5 = [(UICollectionView *)self->_collectionView collectionViewLayout];
  if (v5) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    id v7 = v5;
    if (v4 == 1) {
      [v5 setScrollDirection:1];
    }
    [(UICollectionView *)self->_collectionView setCollectionViewLayout:v7];
    id v5 = v7;
  }
}

- (void)_selectAndScrollToCurrentPageIfNeeded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  BOOL v3 = [WeakRetained PDFView];
  uint64_t v4 = [v3 document];
  id v5 = [v3 currentPage];
  BOOL v6 = [v5 document];
  int v7 = [v6 indexForPage:v5];

  int v8 = [v4 pageCount];
  int v9 = v7 & ~(v7 >> 31);
  if (v9 >= v8 - 1) {
    int v9 = v8 - 1;
  }
  unint64_t v10 = v9;
  uint64_t v11 = [MEMORY[0x263F088C8] indexPathForRow:v9 inSection:0];
  uint64_t v12 = [(UICollectionView *)self->_collectionView dataSource];
  uint64_t v13 = [v12 numberOfSectionsInCollectionView:self->_collectionView];

  if (v13)
  {
    if ([(UICollectionView *)self->_collectionView numberOfItemsInSection:0] > v10)
    {
      [(UICollectionView *)self->_collectionView scrollToItemAtIndexPath:v11 atScrollPosition:0 animated:1];
      long long v14 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
      char v15 = [v14 containsObject:v11];

      if ((v15 & 1) == 0)
      {
        [(UICollectionView *)self->_collectionView selectItemAtIndexPath:v11 animated:1 scrollPosition:0];
        [(PPKPDFThumbnailsCollectionViewBase *)self _updateActionsButtonVisibilityAtIndexPath:v11];
      }
    }
  }
}

- (BOOL)_canEditDocument
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  BOOL v3 = [WeakRetained PDFView];
  uint64_t v4 = [v3 document];

  id v5 = [v4 delegate];
  if (objc_opt_respondsToSelector()) {
    char v6 = [v5 documentCanBeEdited:v4];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (void)_updateActionsButtonVisibilityAtIndexPath:(id)a3
{
  p_thumbnailView = &self->_thumbnailView;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_thumbnailView);
  int v7 = [WeakRetained PDFView];
  int v8 = [v7 document];
  objc_msgSend(v8, "pageAtIndex:", objc_msgSend(v5, "item"));
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  int v9 = [(UICollectionView *)self->_collectionView cellForItemAtIndexPath:v5];

  if (v13) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    uint64_t v11 = [(PPKPDFThumbnailsCollectionViewBase *)self shouldDisplayActionButtonForPage:v13] ^ 1;
    uint64_t v12 = [v9 actionsButton];
    [v12 setHidden:v11];
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  p_thumbnailView = &self->_thumbnailView;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_thumbnailView);
  id v12 = [WeakRetained PDFView];

  int v8 = [v12 document];
  int v9 = objc_msgSend(v8, "pageAtIndex:", objc_msgSend(v6, "item"));
  [v12 goToPage:v9];

  [(PPKPDFThumbnailsCollectionViewBase *)self _updateActionsButtonVisibilityAtIndexPath:v6];
  id v10 = objc_loadWeakRetained((id *)p_thumbnailView);
  uint64_t v11 = [v10 thumbnailContextMenuDelegate];

  [v11 didSelectPage];
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  id v10 = [WeakRetained PDFView];
  uint64_t v11 = [v10 document];

  if (v11)
  {
    id v12 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:v8];
    if (v12)
    {
      objc_initWeak(&location, self);
      id v13 = (void *)MEMORY[0x263F82610];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __102__PPKPDFThumbnailsCollectionViewBase_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke;
      v16[3] = &unk_2640D3C28;
      objc_copyWeak(&v18, &location);
      id v17 = v12;
      long long v14 = [v13 configurationWithIdentifier:v8 previewProvider:0 actionProvider:v16];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      long long v14 = 0;
    }
  }
  else
  {
    long long v14 = 0;
  }

  return v14;
}

id __102__PPKPDFThumbnailsCollectionViewBase_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = [WeakRetained contextMenuForPage:*(void *)(a1 + 32)];

  return v3;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = -[UICollectionView indexPathForItemAtPoint:](self->_collectionView, "indexPathForItemAtPoint:", x, y);
  if (v8)
  {
    int v9 = -[PPKPDFThumbnailsCollectionViewBase collectionView:contextMenuConfigurationForItemAtIndexPath:point:](self, "collectionView:contextMenuConfigurationForItemAtIndexPath:point:", self->_collectionView, v8, x, y);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
    uint64_t v11 = [WeakRetained PDFView];
    id v12 = [v11 document];

    id v13 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", objc_msgSend(v12, "pageCount") - 1, 0);
    objc_initWeak(&location, self);
    long long v14 = (void *)MEMORY[0x263F82610];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __92__PPKPDFThumbnailsCollectionViewBase_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
    v16[3] = &unk_2640D3C50;
    objc_copyWeak(v17, &location);
    v17[1] = *(id *)&x;
    v17[2] = *(id *)&y;
    int v9 = [v14 configurationWithIdentifier:v13 previewProvider:0 actionProvider:v16];
    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }
  return v9;
}

id __92__PPKPDFThumbnailsCollectionViewBase_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = objc_msgSend(WeakRetained, "contextMenuForBackgroundAtLocation:", *(double *)(a1 + 40), *(double *)(a1 + 48));

  return v3;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  return [(PPKPDFThumbnailsCollectionViewBase *)self previewForCollectionView:self->_collectionView contextMenuInteraction:a3];
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  return [(PPKPDFThumbnailsCollectionViewBase *)self previewForCollectionView:self->_collectionView contextMenuInteraction:a3];
}

- (id)previewForCollectionView:(id)a3 contextMenuInteraction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 locationInView:v6];
  double v9 = v8;
  double v11 = v10;
  id v12 = objc_msgSend(v6, "indexPathForItemAtPoint:");
  if (v12)
  {
    id v13 = [(PPKPDFThumbnailsCollectionViewBase *)self previewForCollectionView:v6 indexPath:v12];
  }
  else
  {
    if (!self->_backgroundOnePixelView)
    {
      long long v14 = (UIView *)objc_opt_new();
      backgroundOnePixelView = self->_backgroundOnePixelView;
      self->_backgroundOnePixelView = v14;

      long long v16 = [MEMORY[0x263F825C8] clearColor];
      [(UIView *)self->_backgroundOnePixelView setBackgroundColor:v16];

      [v6 addSubview:self->_backgroundOnePixelView];
    }
    [v7 locationInView:self];
    double v18 = v17;
    double v20 = v19;
    -[UIView setFrame:](self->_backgroundOnePixelView, "setFrame:", v9, v11, 0.0, 0.0);
    id v21 = objc_alloc_init(MEMORY[0x263F82AD0]);
    double v22 = [MEMORY[0x263F825C8] clearColor];
    [v21 setBackgroundColor:v22];

    id v23 = objc_msgSend(objc_alloc(MEMORY[0x263F82AE0]), "initWithContainer:center:", self, v18, v20);
    id v13 = (void *)[objc_alloc(MEMORY[0x263F82CC8]) initWithView:self->_backgroundOnePixelView parameters:v21 target:v23];
  }
  return v13;
}

- (id)previewForCollectionView:(id)a3 indexPath:(id)a4
{
  if (a4)
  {
    uint64_t v4 = [a3 cellForItemAtIndexPath:a4];
    id v5 = objc_alloc_init(MEMORY[0x263F82AD0]);
    id v6 = [MEMORY[0x263F825C8] clearColor];
    [v5 setBackgroundColor:v6];

    id v7 = (void *)MEMORY[0x263F824C0];
    double v8 = [v4 imageView];
    [v8 bounds];
    double v9 = objc_msgSend(v7, "bezierPathWithRoundedRect:cornerRadius:");
    [v5 setVisiblePath:v9];

    id v10 = objc_alloc(MEMORY[0x263F82AE0]);
    double v11 = [v4 imageView];
    [v11 center];
    id v12 = objc_msgSend(v10, "initWithContainer:center:", v4);

    id v13 = objc_alloc(MEMORY[0x263F82CC8]);
    long long v14 = [v4 imageView];
    char v15 = (void *)[v13 initWithView:v14 parameters:v5 target:v12];
  }
  else
  {
    char v15 = 0;
  }
  return v15;
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = [a4 identifier];
  double v8 = [(PPKPDFThumbnailsCollectionViewBase *)self previewForCollectionView:v6 indexPath:v7];

  return v8;
}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = [a4 identifier];
  double v8 = [(PPKPDFThumbnailsCollectionViewBase *)self previewForCollectionView:v6 indexPath:v7];

  return v8;
}

- (id)contextMenuForBackgroundAtLocation:(CGPoint)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  id v6 = [WeakRetained thumbnailContextMenuDelegate];

  id v7 = [v6 pasteActionForPage:0];
  if (v7) {
    [v4 addObject:v7];
  }
  double v8 = [MEMORY[0x263F82940] menuWithTitle:&stru_26C165408 image:0 identifier:0 options:0 children:v4];

  return v8;
}

- (id)contextMenuForPage:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v7 = [WeakRetained thumbnailContextMenuDelegate];
  double v8 = v7;
  if (v7)
  {
    double v9 = [v7 menuElementsForPage:v4];
    if ([v9 count]) {
      [v6 addObjectsFromArray:v9];
    }
  }
  id v10 = [WeakRetained PDFView];
  double v11 = [v10 document];
  uint64_t v12 = [v11 indexForPage:v4] + 1;

  id v13 = (void *)MEMORY[0x263F08A30];
  long long v14 = [NSNumber numberWithInteger:v12];
  char v15 = [v13 localizedStringFromNumber:v14 numberStyle:1];

  long long v16 = NSString;
  double v17 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.PaperKit"];
  double v18 = [v17 localizedStringForKey:@"Page %@" value:&stru_26C165408 table:@"Localizable"];
  double v19 = objc_msgSend(v16, "stringWithFormat:", v18, v15);

  double v20 = [MEMORY[0x263F82940] menuWithTitle:v19 image:0 identifier:0 options:0 children:v6];

  return v20;
}

- (BOOL)shouldDisplayActionButtonForPage:(id)a3
{
  id v4 = [(PPKPDFThumbnailsCollectionViewBase *)self contextMenuForPage:a3];
  id v5 = [v4 children];
  if ([v5 count]) {
    BOOL v6 = ![(UICollectionView *)self->_collectionView hasActiveDrag];
  }
  else {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  return [(PPKPDFThumbnailsCollectionViewBase *)self itemsForDragWithSession:a4 atIndexPath:a5];
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(PPKPDFThumbnailsCollectionViewBase *)self _updateActionsButtonVisibilityAtIndexPath:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v5 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
  dispatch_time_t v6 = dispatch_time(0, 100000000);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__PPKPDFThumbnailsCollectionViewBase_collectionView_dragSessionDidEnd___block_invoke;
  v8[3] = &unk_2640D3C78;
  id v9 = v5;
  long long v10 = self;
  id v7 = v5;
  dispatch_after(v6, MEMORY[0x263EF83A0], v8);
}

void __71__PPKPDFThumbnailsCollectionViewBase_collectionView_dragSessionDidEnd___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "_updateActionsButtonVisibilityAtIndexPath:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  v16[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  long long v10 = [MEMORY[0x263F1D920] typeWithIdentifier:@"com.adobe.pdf"];
  long long v11 = [v10 identifier];
  v16[0] = v11;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  int v13 = [v8 hasItemsConformingToTypeIdentifiers:v12];

  if (v13)
  {
    long long v14 = [(PPKPDFThumbnailsCollectionViewBase *)self itemsForDragWithSession:v8 atIndexPath:v9];
  }
  else
  {
    long long v14 = (void *)MEMORY[0x263EFFA68];
  }

  return v14;
}

- (id)itemsForDragWithSession:(id)a3 atIndexPath:(id)a4
{
  v29[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  long long v10 = [WeakRetained thumbnailContextMenuDelegate];

  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  long long v11 = (void *)MEMORY[0x263F82A18];
  uint64_t v12 = [(PPKPDFThumbnailsCollectionViewBase *)self _dragDataOwner];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __74__PPKPDFThumbnailsCollectionViewBase_itemsForDragWithSession_atIndexPath___block_invoke;
  v19[3] = &unk_2640D3CA0;
  double v22 = &v23;
  id v13 = v10;
  id v20 = v13;
  id v14 = v7;
  id v21 = v14;
  [v11 _performAsDataOwner:v12 block:v19];
  id v15 = objc_alloc(MEMORY[0x263F826C8]);
  long long v16 = (void *)[v15 initWithItemProvider:v24[5]];
  [v16 setLocalObject:v8];
  v29[0] = v16;
  double v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];

  _Block_object_dispose(&v23, 8);
  return v17;
}

uint64_t __74__PPKPDFThumbnailsCollectionViewBase_itemsForDragWithSession_atIndexPath___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F088E0]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) item];
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  return [v5 registerFileRepresentationsForPage:v6 toItemProvider:v7];
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if ([(PPKPDFThumbnailsCollectionViewBase *)self _canEditDocument])
  {
    id v9 = [v8 localDragSession];

    if (v9)
    {
      int v10 = [v7 hasActiveDrag];
      id v11 = objc_alloc(MEMORY[0x263F82568]);
      if (v10) {
        uint64_t v12 = 3;
      }
      else {
        uint64_t v12 = 2;
      }
      uint64_t v26 = [v11 initWithDropOperation:v12 intent:1];
      goto LABEL_24;
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v13 = [v8 items];
    uint64_t v30 = [v13 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v30)
    {
      uint64_t v14 = *(void *)v39;
      CAFrameRateRange v32 = v13;
      id v33 = v7;
      uint64_t v29 = *(void *)v39;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v39 != v14) {
            objc_enumerationMutation(v13);
          }
          uint64_t v31 = v15;
          long long v16 = *(void **)(*((void *)&v38 + 1) + 8 * v15);
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          double v17 = [(PPKPDFThumbnailsCollectionViewBase *)self supportedUTTypes];
          uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v35;
            while (2)
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v35 != v20) {
                  objc_enumerationMutation(v17);
                }
                double v22 = *(void **)(*((void *)&v34 + 1) + 8 * i);
                uint64_t v23 = [v16 itemProvider];
                v24 = [v22 identifier];
                char v25 = [v23 hasItemConformingToTypeIdentifier:v24];

                if (v25)
                {
                  v27 = (void *)[objc_alloc(MEMORY[0x263F82568]) initWithDropOperation:2 intent:1];

                  id v7 = v33;
                  goto LABEL_25;
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v42 count:16];
              if (v19) {
                continue;
              }
              break;
            }
          }

          uint64_t v15 = v31 + 1;
          id v13 = v32;
          id v7 = v33;
          uint64_t v14 = v29;
        }
        while (v31 + 1 != v30);
        uint64_t v30 = [v32 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v30);
    }
  }
  uint64_t v26 = [objc_alloc(MEMORY[0x263F82568]) initWithDropOperation:1];
LABEL_24:
  v27 = (void *)v26;
LABEL_25:

  return v27;
}

- (id)supportedUTTypes
{
  if (supportedUTTypes_onceToken != -1) {
    dispatch_once(&supportedUTTypes_onceToken, &__block_literal_global_222);
  }
  id v2 = (void *)supportedUTTypes_supportedTypes;
  return v2;
}

void __54__PPKPDFThumbnailsCollectionViewBase_supportedUTTypes__block_invoke()
{
  v3[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F1DB18];
  v3[0] = *MEMORY[0x263F1DBF0];
  v3[1] = v0;
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:2];
  id v2 = (void *)supportedUTTypes_supportedTypes;
  supportedUTTypes_supportedTypes = v1;
}

- (void)_insertFileAtURL:(id)a3 type:(id)a4 atIndex:(unint64_t)a5 completionHandler:(id)a6
{
  id v12 = a3;
  id v9 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  id v11 = [WeakRetained thumbnailDataSourceDelegate];

  if (v11) {
    [v11 insertFileAtURL:v12 atIndex:a5 completionHandler:v9];
  }
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v20 = a3;
  id v19 = a4;
  id v21 = [v19 destinationIndexPath];
  if (!v21)
  {
    id v21 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v20, "numberOfItemsInSection:", 0), 0);
  }
  if (([v20 hasActiveDrag] & 1) == 0)
  {
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    uint64_t v37 = 0;
    uint64_t v37 = [v21 item];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v5 = [v19 items];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v39 count:16];
    if (v6)
    {
      uint64_t v23 = *(void *)v33;
      id obj = v5;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v33 != v23) {
            objc_enumerationMutation(obj);
          }
          id v8 = [*(id *)(*((void *)&v32 + 1) + 8 * i) dragItem];
          id v9 = [v8 itemProvider];

          if (v9)
          {
            long long v30 = 0u;
            long long v31 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            int v10 = [(PPKPDFThumbnailsCollectionViewBase *)self supportedUTTypes];
            uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v38 count:16];
            if (v11)
            {
              uint64_t v12 = *(void *)v29;
              while (2)
              {
                for (uint64_t j = 0; j != v11; ++j)
                {
                  if (*(void *)v29 != v12) {
                    objc_enumerationMutation(v10);
                  }
                  uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8 * j);
                  uint64_t v15 = [v14 identifier];
                  int v16 = [v9 hasItemConformingToTypeIdentifier:v15];

                  if (v16)
                  {
                    double v17 = [v14 identifier];
                    v25[0] = MEMORY[0x263EF8330];
                    v25[1] = 3221225472;
                    v25[2] = __80__PPKPDFThumbnailsCollectionViewBase_collectionView_performDropWithCoordinator___block_invoke;
                    v25[3] = &unk_2640D3CF0;
                    v25[4] = self;
                    v25[5] = v14;
                    v27 = v36;
                    id v26 = v9;
                    id v18 = (id)[v26 loadFileRepresentationForTypeIdentifier:v17 completionHandler:v25];

                    goto LABEL_20;
                  }
                }
                uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v38 count:16];
                if (v11) {
                  continue;
                }
                break;
              }
            }
LABEL_20:
          }
        }
        uint64_t v5 = obj;
        uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
      }
      while (v6);
    }

    _Block_object_dispose(v36, 8);
  }
}

void __80__PPKPDFThumbnailsCollectionViewBase_collectionView_performDropWithCoordinator___block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    uint64_t v8 = a1[7];
    uint64_t v9 = *(void *)(*(void *)(v8 + 8) + 24);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __80__PPKPDFThumbnailsCollectionViewBase_collectionView_performDropWithCoordinator___block_invoke_2;
    v11[3] = &unk_2640D3CC8;
    void v11[4] = v8;
    [v6 _insertFileAtURL:a2 type:v7 atIndex:v9 completionHandler:v11];
  }
  else
  {
    int v10 = os_log_create("com.apple.PaperKit", "PDFThumbnailsCollectionViewBase");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __80__PPKPDFThumbnailsCollectionViewBase_collectionView_performDropWithCoordinator___block_invoke_cold_1((uint64_t)a1, (uint64_t)v5, v10);
    }
  }
}

uint64_t __80__PPKPDFThumbnailsCollectionViewBase_collectionView_performDropWithCoordinator___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += a2;
  return result;
}

- (void)movePageWithTransaction:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [v10 difference];
  int v5 = [v4 hasChanges];

  uint64_t v6 = v10;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
    uint64_t v8 = [WeakRetained thumbnailDataSourceDelegate];
    if (v8)
    {
      self->_isApplyingCollectionViewTransaction = 1;
      uint64_t v9 = [v10 difference];
      [v8 handlePageOrderedCollectionDifference:v9];

      self->_isApplyingCollectionViewTransaction = 0;
    }

    uint64_t v6 = v10;
  }
}

- (PPKPDFThumbnailViewBase)thumbnailView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  return (PPKPDFThumbnailViewBase *)WeakRetained;
}

- (void)setThumbnailView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (BOOL)largeThumbnails
{
  return self->_largeThumbnails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_displayLinkObserver, 0);
  objc_storeStrong((id *)&self->_backgroundOnePixelView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_thumbnailView);
}

- (void)configureCell:(void *)a1 withPage:(NSObject *)a2 indexPath:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 134217984;
  uint64_t v4 = [a1 item];
  _os_log_debug_impl(&dword_20C2D7000, a2, OS_LOG_TYPE_DEBUG, "Configuring cell n°%lu", (uint8_t *)&v3, 0xCu);
}

- (void)reloadPage:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20C2D7000, log, OS_LOG_TYPE_ERROR, "Page was gone when we tried to reload it", v1, 2u);
}

void __80__PPKPDFThumbnailsCollectionViewBase_collectionView_performDropWithCoordinator___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_20C2D7000, log, OS_LOG_TYPE_ERROR, "Item provider %@ returned a nil URL. Error: %@", (uint8_t *)&v4, 0x16u);
}

@end