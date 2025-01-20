@interface TabGroupPickerViewController
- (BOOL)_shouldShowCheckmarkForTabGroup:(id)a3;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (TabGroupPickerViewController)initWithTabGroupProvider:(id)a3;
- (id)_checkmarkAccessoryForTabGroup:(id)a3;
- (id)_moreButtonAccessoryForTabGroup:(id)a3 inCell:(id)a4;
- (id)_swipeActionsConfigurationForIndexPath:(id)a3;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6;
- (id)willDisappear;
- (int64_t)_collectionView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5;
- (int64_t)_collectionView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5;
- (void)_enumerateTabGroupSectionsWithBlock:(id)a3;
- (void)_reloadData;
- (void)_reloadDataIfNeeded;
- (void)_removeDataUnrelatedToTabGroups;
- (void)_updateTitle;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)doneButtonTapped;
- (void)loadView;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setNeedsReloadData;
- (void)setWillDisappear:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation TabGroupPickerViewController

- (TabGroupPickerViewController)initWithTabGroupProvider:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TabGroupPickerViewController;
  v5 = [(TabGroupPickerViewController *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_tabGroupProvider, v4);
    [v4 registerTabGroupManagerObserver:v6];
    v7 = v6;
  }

  return v6;
}

- (void)loadView
{
  v20.receiver = self;
  v20.super_class = (Class)TabGroupPickerViewController;
  [(TabGroupPickerViewController *)&v20 loadView];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:2];
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __40__TabGroupPickerViewController_loadView__block_invoke;
  v17[3] = &unk_1E6D7A988;
  objc_copyWeak(&v18, &location);
  [v3 setTrailingSwipeActionsConfigurationProvider:v17];
  id v4 = objc_alloc(MEMORY[0x1E4FB1580]);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __40__TabGroupPickerViewController_loadView__block_invoke_2;
  v14 = &unk_1E6D7A9B0;
  id v5 = v3;
  id v15 = v5;
  objc_copyWeak(&v16, &location);
  v6 = (void *)[v4 initWithSectionProvider:&v11];
  id v7 = objc_alloc(MEMORY[0x1E4FB1568]);
  v8 = objc_msgSend(MEMORY[0x1E4FB1BA8], "mainScreen", v11, v12, v13, v14);
  [v8 bounds];
  objc_super v9 = (UICollectionView *)objc_msgSend(v7, "initWithFrame:collectionViewLayout:", v6);
  collectionView = self->_collectionView;
  self->_collectionView = v9;

  [(UICollectionView *)self->_collectionView setAccessibilityIdentifier:@"TabGroupCollectionView"];
  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setDragDelegate:self];
  [(UICollectionView *)self->_collectionView setDropDelegate:self];
  [(UICollectionView *)self->_collectionView setAutoresizingMask:18];
  [(TabGroupPickerViewController *)self setView:self->_collectionView];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

id __40__TabGroupPickerViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = [WeakRetained _swipeActionsConfigurationForIndexPath:v3];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __40__TabGroupPickerViewController_loadView__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:*(void *)(a1 + 32) layoutEnvironment:v5];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [v6 contentInsets];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    id v14 = objc_loadWeakRetained(WeakRetained + 122);
    id v15 = v14;
    double v16 = 12.0;
    if (a2)
    {
      if (a2 == 1)
      {
        if (([v14 hasMultipleProfiles] & 1) == 0
          || ([v15 privateTabGroupIfAvailable],
              objc_super v20 = objc_claimAutoreleasedReturnValue(),
              v20,
              double v18 = v9,
              !v20))
        {
          double v16 = 0.0;
          double v18 = 0.0;
        }
      }
      else if (a2 != 3 || (v17 = [v14 hasMultipleProfiles], double v16 = 0.0, v18 = 0.0, (v17 & 1) != 0))
      {
        double v16 = 12.0;
        double v18 = v9;
      }
    }
    else
    {
      double v18 = 10.0;
    }
    objc_msgSend(v6, "setContentInsets:", v18, v11, v16, v13);
    id v19 = v6;
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (void)viewDidLoad
{
  v48.receiver = self;
  v48.super_class = (Class)TabGroupPickerViewController;
  [(TabGroupPickerViewController *)&v48 viewDidLoad];
  [(TabGroupPickerViewController *)self _updateTitle];
  id v3 = [(TabGroupPickerViewController *)self editButtonItem];
  id v4 = [(TabGroupPickerViewController *)self navigationItem];
  [v4 setLeftBarButtonItem:v3];

  id v5 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_doneButtonTapped];
  doneButton = self->_doneButton;
  self->_doneButton = v5;

  id v7 = self->_doneButton;
  double v8 = [(TabGroupPickerViewController *)self navigationItem];
  [v8 setRightBarButtonItem:v7];

  objc_initWeak(&location, self);
  double v9 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v10 = objc_opt_class();
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __43__TabGroupPickerViewController_viewDidLoad__block_invoke;
  v45[3] = &unk_1E6D7A9D8;
  objc_copyWeak(&v46, &location);
  double v11 = [v9 registrationWithCellClass:v10 configurationHandler:v45];
  double v12 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v13 = objc_opt_class();
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __43__TabGroupPickerViewController_viewDidLoad__block_invoke_2;
  v43[3] = &unk_1E6D7AA00;
  objc_copyWeak(&v44, &location);
  id v14 = [v12 registrationWithCellClass:v13 configurationHandler:v43];
  id v15 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v16 = objc_opt_class();
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __43__TabGroupPickerViewController_viewDidLoad__block_invoke_3;
  v41[3] = &unk_1E6D7A9D8;
  objc_copyWeak(&v42, &location);
  char v17 = [v15 registrationWithCellClass:v16 configurationHandler:v41];
  double v18 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v19 = objc_opt_class();
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __43__TabGroupPickerViewController_viewDidLoad__block_invoke_4;
  v39[3] = &unk_1E6D7A9D8;
  objc_copyWeak(&v40, &location);
  objc_super v20 = [v18 registrationWithCellClass:v19 configurationHandler:v39];
  id v21 = objc_alloc(MEMORY[0x1E4FB1598]);
  collectionView = self->_collectionView;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __43__TabGroupPickerViewController_viewDidLoad__block_invoke_5;
  v34[3] = &unk_1E6D7AA28;
  id v23 = v17;
  id v35 = v23;
  id v24 = v11;
  id v36 = v24;
  id v25 = v20;
  id v37 = v25;
  id v26 = v14;
  id v38 = v26;
  v27 = (UICollectionViewDiffableDataSource *)[v21 initWithCollectionView:collectionView cellProvider:v34];
  dataSource = self->_dataSource;
  self->_dataSource = v27;

  id v29 = objc_alloc_init(MEMORY[0x1E4FB15A0]);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __43__TabGroupPickerViewController_viewDidLoad__block_invoke_6;
  v32[3] = &unk_1E6D7AA50;
  objc_copyWeak(&v33, &location);
  [v29 setCanReorderItemHandler:v32];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __43__TabGroupPickerViewController_viewDidLoad__block_invoke_7;
  v30[3] = &unk_1E6D7AA78;
  objc_copyWeak(&v31, &location);
  [v29 setDidReorderHandler:v30];
  [(UICollectionViewDiffableDataSource *)self->_dataSource setReorderingHandlers:v29];
  [(TabGroupPickerViewController *)self _reloadData];
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v33);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&v42);

  objc_destroyWeak(&v44);
  objc_destroyWeak(&v46);
  objc_destroyWeak(&location);
}

void __43__TabGroupPickerViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    double v11 = WeakRetained;
    if (WeakRetained)
    {
      id v12 = objc_loadWeakRetained(WeakRetained + 122);
      uint64_t v13 = [MEMORY[0x1E4FB1948] cellConfiguration];
      id v14 = [v12 imageForTabGroup:v9];
      [v13 setImage:v14];

      if (![v12 hasMultipleProfiles]
        || ([v9 isNamed] & 1) != 0
        || ([v9 isPrivateBrowsing] & 1) != 0)
      {
        id v15 = [v9 displayTitle];
        [v13 setText:v15];
      }
      else
      {
        id v26 = [v12 activeProfile];
        id v15 = [v26 title];

        id v27 = objc_alloc(MEMORY[0x1E4F28E48]);
        v28 = NSString;
        id v29 = [v9 displayTitle];
        v30 = [v28 stringWithFormat:@"%@ — %@", v15, v29];
        id v31 = (void *)[v27 initWithString:v30];

        uint64_t v33 = *MEMORY[0x1E4FB0700];
        v32 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        objc_msgSend(v31, "addAttribute:value:range:", v33, v32, objc_msgSend(v15, "length"), objc_msgSend(v31, "length") - objc_msgSend(v15, "length"));

        [v13 setAttributedText:v31];
      }

      uint64_t v16 = [v13 textProperties];
      [v16 setNumberOfLines:2];

      [v7 setContentConfiguration:v13];
      char v17 = [MEMORY[0x1E4F1CA48] array];
      double v18 = [v11 _checkmarkAccessoryForTabGroup:v9];
      objc_msgSend(v17, "safari_addObjectUnlessNil:", v18);

      uint64_t v19 = [v11 _moreButtonAccessoryForTabGroup:v9 inCell:v7];
      objc_msgSend(v17, "safari_addObjectUnlessNil:", v19);

      if (![v8 section] && objc_msgSend(v9, "isNamed"))
      {
        id v20 = objc_alloc_init(MEMORY[0x1E4FB1548]);
        [v20 setDisplayedState:1];
        [v17 addObject:v20];
      }
      v34[0] = @"Title";
      id v21 = [v9 title];
      v34[1] = @"isPrivate";
      v35[0] = v21;
      int v22 = [v9 isPrivateBrowsing];
      id v23 = @"false";
      if (v22) {
        id v23 = @"true";
      }
      v35[1] = v23;
      id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
      id v25 = WBSMakeAccessibilityIdentifier();
      [v7 setAccessibilityIdentifier:v25];

      [v7 setAccessories:v17];
    }
  }
}

void __43__TabGroupPickerViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v7 = [MEMORY[0x1E4FB1948] cellConfiguration];
    uint64_t v8 = [v5 row];
    if (v8)
    {
      if (v8 != 1)
      {
LABEL_7:
        [v14 setContentConfiguration:v7];

        goto LABEL_8;
      }
      id v9 = objc_loadWeakRetained(WeakRetained + 122);
      uint64_t v10 = [v9 moveLocalTabsToNewGroupTitle];
      [v7 setText:v10];

      double v11 = @"CreateNewTabGroupFromLocalTabsCell";
    }
    else
    {
      id v9 = _WBSLocalizedString();
      [v7 setText:v9];
      double v11 = @"CreateNewEmptyTabGroupCell";
    }

    id v12 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus"];
    [v7 setImage:v12];

    [v14 setAccessibilityIdentifier:v11];
    uint64_t v13 = [v14 accessibilityTraits];
    [v14 setAccessibilityTraits:*MEMORY[0x1E4FB2540] | v13];
    goto LABEL_7;
  }
LABEL_8:
}

void __43__TabGroupPickerViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v15 = a2;
  id v6 = a4;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v8 = [MEMORY[0x1E4FB1948] cellConfiguration];
    id v9 = [v6 displayTitle];
    [v8 setText:v9];

    id v10 = objc_loadWeakRetained(WeakRetained + 122);
    double v11 = [v10 imageForTabGroup:v6];
    [v8 setImage:v11];

    [v15 setAccessibilityIdentifier:@"PrivateTabGroup"];
    [v15 setContentConfiguration:v8];
    id v12 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v13 = [WeakRetained _checkmarkAccessoryForTabGroup:v6];
    objc_msgSend(v12, "safari_addObjectUnlessNil:", v13);

    id v14 = [WeakRetained _moreButtonAccessoryForTabGroup:v6 inCell:v15];
    objc_msgSend(v12, "safari_addObjectUnlessNil:", v14);

    [v15 setAccessories:v12];
  }
}

void __43__TabGroupPickerViewController_viewDidLoad__block_invoke_4(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained(WeakRetained + 122);
    id v7 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
    uint64_t v8 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"person.crop.rectangle.stack"];
    [v7 setImage:v8];

    id v9 = _WBSLocalizedString();
    [v7 setText:v9];

    id v10 = [v6 activeProfile];
    double v11 = [v10 title];
    [v7 setSecondaryText:v11];

    [v3 setContentConfiguration:v7];
    id v12 = objc_alloc(MEMORY[0x1E4FB1540]);
    uint64_t v13 = [v6 menuForSwitchingProfiles];
    id v14 = (void *)[v12 initWithMenu:v13];

    [v3 setAccessibilityIdentifier:@"ProfileSwitcher"];
    v16[0] = v14;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [v3 setAccessories:v15];
  }
}

id __43__TabGroupPickerViewController_viewDidLoad__block_invoke_5(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  switch([v8 section])
  {
    case 0:
      int v10 = [v9 isPrivateBrowsing];
      double v11 = a1 + 5;
      if (v10) {
        double v11 = a1 + 4;
      }
      goto LABEL_9;
    case 1:
      double v11 = a1 + 4;
      goto LABEL_9;
    case 2:
      double v11 = a1 + 7;
      goto LABEL_9;
    case 3:
      double v11 = a1 + 6;
LABEL_9:
      id v12 = [v7 dequeueConfiguredReusableCellWithRegistration:*v11 forIndexPath:v8 item:v9];
      break;
    default:
      id v12 = 0;
      break;
  }

  return v12;
}

uint64_t __43__TabGroupPickerViewController_viewDidLoad__block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained[124] indexPathForItemIdentifier:v3];
    if ([v6 section]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = [v3 isNamed];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __43__TabGroupPickerViewController_viewDidLoad__block_invoke_7(uint64_t a1, void *a2)
{
  id v15 = a2;
  id v3 = [v15 difference];
  if ([v3 hasChanges])
  {
    id v4 = [v3 insertions];
    id v5 = [v4 firstObject];
    id v6 = [v5 object];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      id v8 = [v15 initialSnapshot];
      id v9 = [v8 itemIdentifiersInSectionWithIdentifier:&unk_1F3C73860];

      int v10 = [v15 finalSnapshot];
      double v11 = [v10 itemIdentifiersInSectionWithIdentifier:&unk_1F3C73860];

      uint64_t v12 = [v11 indexOfObject:v6];
      if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
        [v9 lastObject];
      }
      else {
      uint64_t v13 = [v9 objectAtIndexedSubscript:v12];
      }
      *((unsigned char *)WeakRetained + 1008) = 1;
      id v14 = objc_loadWeakRetained((id *)WeakRetained + 122);
      [v14 moveTabGroup:v6 beforeOrAfterTabGroup:v13];

      *((unsigned char *)WeakRetained + 1008) = 0;
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TabGroupPickerViewController;
  -[TabGroupPickerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  [(TabGroupPickerViewController *)self _reloadData];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TabGroupPickerViewController;
  [(TabGroupPickerViewController *)&v3 viewWillLayoutSubviews];
  [(TabGroupPickerViewController *)self _reloadDataIfNeeded];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TabGroupPickerViewController;
  [(TabGroupPickerViewController *)&v5 viewWillDisappear:a3];
  willDisappear = (void (**)(void))self->_willDisappear;
  if (willDisappear) {
    willDisappear[2]();
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TabGroupPickerViewController;
  [(TabGroupPickerViewController *)&v9 setEditing:a3 animated:a4];
  if (a3)
  {
    id v6 = [(TabGroupPickerViewController *)self navigationItem];
    [v6 setRightBarButtonItem:0];

    [(UICollectionView *)self->_collectionView setEditing:1];
    [(TabGroupPickerViewController *)self _removeDataUnrelatedToTabGroups];
  }
  else
  {
    doneButton = self->_doneButton;
    id v8 = [(TabGroupPickerViewController *)self navigationItem];
    [v8 setRightBarButtonItem:doneButton];

    [(UICollectionView *)self->_collectionView setEditing:0];
    [(TabGroupPickerViewController *)self _reloadData];
  }
}

- (void)_removeDataUnrelatedToTabGroups
{
  id v3 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
  [v3 deleteSectionsWithIdentifiers:&unk_1F3C73E00];
  [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v3 animatingDifferences:1];
}

- (void)doneButtonTapped
{
  id v2 = [(TabGroupPickerViewController *)self presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)setNeedsReloadData
{
  self->_needsReloadData = !self->_isReordering;
  id v2 = [(TabGroupPickerViewController *)self view];
  [v2 setNeedsLayout];
}

- (void)_reloadDataIfNeeded
{
  if (self->_needsReloadData) {
    [(TabGroupPickerViewController *)self _reloadData];
  }
}

- (void)_reloadData
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
  if ([(TabGroupPickerViewController *)self isViewLoaded]
    && WeakRetained
    && !self->_isReordering)
  {
    if ([(UICollectionView *)self->_collectionView hasUncommittedUpdates])
    {
      self->_needsReloadData = 1;
    }
    else
    {
      self->_needsReloadData = 0;
      id v4 = objc_alloc_init(MEMORY[0x1E4FB1360]);
      [(TabGroupPickerViewController *)self _updateTitle];
      [v4 appendSectionsWithIdentifiers:&unk_1F3C73E18];
      objc_super v5 = (void *)MEMORY[0x1E4F1CA48];
      id v6 = [WeakRetained unnamedTabGroup];
      uint64_t v7 = [v5 arrayWithObject:v6];

      id v8 = [WeakRetained namedTabGroups];
      [v7 addObjectsFromArray:v8];

      objc_super v9 = [WeakRetained privateTabGroupIfAvailable];
      if (![(UICollectionView *)self->_collectionView isEditing]
        && [WeakRetained hasMultipleProfiles])
      {
        v21[0] = @"Profile Switcher";
        int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
        [v4 appendItemsWithIdentifiers:v10 intoSectionWithIdentifier:&unk_1F3C73890];

        id v20 = @"Profile Switcher";
        double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
        [v4 reconfigureItemsWithIdentifiers:v11];
      }
      int v12 = [WeakRetained hasMultipleProfiles];
      [v4 appendItemsWithIdentifiers:v7 intoSectionWithIdentifier:&unk_1F3C73860];
      if (v12)
      {
        [v4 reloadItemsWithIdentifiers:v7];
        if (v9)
        {
          uint64_t v19 = v9;
          uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
          [v4 appendItemsWithIdentifiers:v13 intoSectionWithIdentifier:&unk_1F3C738A8];

          double v18 = v9;
          id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
          [v4 reloadItemsWithIdentifiers:v14];
        }
      }
      else
      {
        if (v9)
        {
          char v17 = v9;
          id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
          [v4 appendItemsWithIdentifiers:v15 intoSectionWithIdentifier:&unk_1F3C73860];
        }
        [v4 reloadItemsWithIdentifiers:v7];
      }
      if (![(UICollectionView *)self->_collectionView isEditing])
      {
        [v4 appendItemsWithIdentifiers:&unk_1F3C73E30 intoSectionWithIdentifier:&unk_1F3C73878];
        uint64_t v16 = [WeakRetained moveLocalTabsToNewGroupTitle];

        if (v16)
        {
          [v4 appendItemsWithIdentifiers:&unk_1F3C73E48 intoSectionWithIdentifier:&unk_1F3C73878];
          [v4 reconfigureItemsWithIdentifiers:&unk_1F3C73E48];
        }
      }
      [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v4 animatingDifferences:1];
    }
  }
}

- (void)_enumerateTabGroupSectionsWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *, void *, unsigned char *))a3;
  uint64_t v5 = 0;
  uint64_t v13 = 984;
  char v6 = 1;
  while (1)
  {
    char v14 = v6;
    uint64_t v7 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v13), "numberOfItemsInSection:", v5, v13);
    if (v7 >= 1) {
      break;
    }
LABEL_6:
    char v6 = 0;
    uint64_t v5 = 1;
    if ((v14 & 1) == 0) {
      goto LABEL_7;
    }
  }
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  while (1)
  {
    int v10 = [MEMORY[0x1E4F28D58] indexPathForItem:v9 inSection:v5];
    double v11 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:v10];
    unsigned __int8 v15 = 0;
    v4[2](v4, v11, v10, &v15);
    int v12 = v15;

    if (v12) {
      break;
    }
    if (v8 == ++v9) {
      goto LABEL_6;
    }
  }
LABEL_7:
}

- (BOOL)_shouldShowCheckmarkForTabGroup:(id)a3
{
  p_tabGroupProvider = &self->_tabGroupProvider;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_tabGroupProvider);
  char v6 = [WeakRetained activeTabGroupOrTabGroupVisibleInSwitcher];
  char v7 = [v4 isEqual:v6];

  return v7;
}

- (id)_checkmarkAccessoryForTabGroup:(id)a3
{
  if ([(TabGroupPickerViewController *)self _shouldShowCheckmarkForTabGroup:a3])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4FB14F8]);
    [v3 setDisplayedState:2];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)_moreButtonAccessoryForTabGroup:(id)a3 inCell:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isPrivateBrowsing]
    && (+[Application sharedApplication],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 isPrivateBrowsingLocked],
        v8,
        (v9 & 1) != 0)
    || ([v6 isNamed] & 1) == 0 && !objc_msgSend(v6, "hasTextForPasteboard"))
  {
    int v22 = 0;
  }
  else
  {
    int v10 = [v7 moreButton];

    if (!v10)
    {
      double v11 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
      int v12 = [MEMORY[0x1E4FB1618] clearColor];
      uint64_t v13 = [v11 background];
      [v13 setBackgroundColor:v12];

      char v14 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:2];
      [v11 setPreferredSymbolConfigurationForImage:v14];

      unsigned __int8 v15 = [MEMORY[0x1E4FB1818] systemImageNamed:@"ellipsis.circle"];
      [v11 setImage:v15];

      uint64_t v16 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v11 primaryAction:0];
      [v16 setShowsMenuAsPrimaryAction:1];
      [v7 setMoreButton:v16];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
    double v18 = [WeakRetained menuForTabGroup:v6 variant:2];
    uint64_t v19 = [v7 moreButton];
    [v19 setMenu:v18];

    id v20 = objc_alloc(MEMORY[0x1E4FB1500]);
    id v21 = [v7 moreButton];
    int v22 = (void *)[v20 initWithCustomView:v21 placement:1];

    [v22 setDisplayedState:1];
  }

  return v22;
}

- (id)_swipeActionsConfigurationForIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 section])
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:v4];
    if ([v6 isNamed])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
      uint64_t v5 = [WeakRetained swipeActionsConfigurationForTabGroup:v6 forPickerSheet:1];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  return v5;
}

- (void)_updateTitle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
  if ([WeakRetained hasMultipleProfiles])
  {
    id v3 = NSString;
    id v4 = _WBSLocalizedString();
    uint64_t v5 = [WeakRetained activeProfile];
    id v6 = [v5 title];
    id v7 = objc_msgSend(v3, "stringWithFormat:", v4, v6);
    [(TabGroupPickerViewController *)self setTitle:v7];
  }
  else
  {
    id v4 = _WBSLocalizedString();
    [(TabGroupPickerViewController *)self setTitle:v4];
  }
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v6 = a4;
  if ([v6 section] <= 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
    char v9 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:v6];
    id v7 = [WeakRetained contextMenuConfigurationForTabGroup:v9 variant:1];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  id v7 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
  char v9 = [WeakRetained namedTabGroups];
  uint64_t v10 = [v9 count];

  if ([v7 section] <= 0 && objc_msgSend(v7, "row") <= 0)
  {
    double v11 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v12 = 1;
    goto LABEL_6;
  }
  if ([v7 section] > 0 || objc_msgSend(v7, "row") > v10)
  {
    double v11 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v12 = v10;
LABEL_6:
    id v13 = [v11 indexPathForRow:v12 inSection:0];
    goto LABEL_7;
  }
  id v13 = v7;
LABEL_7:
  char v14 = v13;

  return v14;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
  unint64_t v9 = [v7 section];
  if (v9 >= 2)
  {
    if (v9 == 2)
    {
      BOOL v14 = [v7 row] == 1;
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      char v17 = __72__TabGroupPickerViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
      double v18 = &unk_1E6D7AAA0;
      uint64_t v19 = self;
      id v20 = v7;
      [WeakRetained createTabGroupFromExistingTabs:v14 completionHandler:&v15];
    }
  }
  else
  {
    uint64_t v10 = [(TabGroupPickerViewController *)self presentingViewController];
    [v10 dismissViewControllerAnimated:1 completion:0];

    double v11 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:v7];
    uint64_t v12 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v12 didSwitchToTabGroupFromLocation:4];

    if (([WeakRetained scrollTabSwitcherToTabGroupIfShowing:v11] & 1) == 0)
    {
      id v13 = [v11 uuid];
      [WeakRetained setActiveTabGroupUUID:v13];
    }
  }
  objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v7, 1, v15, v16, v17, v18, v19);
}

void __72__TabGroupPickerViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    id v3 = [*(id *)(a1 + 32) presentingViewController];
    [v3 dismissViewControllerAnimated:1 completion:0];
  }
  BOOL v4 = [*(id *)(a1 + 40) row] == 1;
  uint64_t v5 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v5 didCreateTabGroupFromLocation:4 prepopulatedWithTabs:v4];
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 1;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if ((-[TabGroupPickerViewController isEditing](self, "isEditing") & 1) != 0 || [v6 section])
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    unint64_t v9 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:v6];
    if ([v9 isNamed])
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4FB1710], "_sf_itemWithTabGroup:", v9);
      v11[0] = v10;
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    }
    else
    {
      id v7 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  return v7;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v6 = a5;
  if ([v6 section])
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:v6];
    if ([v8 isNamed]) {
      uint64_t v7 = 3;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  unint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FB15B8]) initWithDropOperation:v7 intent:1];

  return v9;
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5
{
  return 3;
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5
{
  return 3;
}

- (id)willDisappear
{
  return self->_willDisappear;
}

- (void)setWillDisappear:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_willDisappear, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_tabGroupProvider);
}

@end