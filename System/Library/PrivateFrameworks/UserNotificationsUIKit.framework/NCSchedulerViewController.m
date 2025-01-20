@interface NCSchedulerViewController
+ (id)schedulerWithDeliveryTimes:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isAddIndexPath:(id)a3;
- (BOOL)_isFirstIndexPath:(id)a3;
- (BOOL)_isLastIndexPath:(id)a3;
- (NSArray)deliveryTimes;
- (UICollectionView)collectionView;
- (double)_heightThatFitsCollectionView;
- (id)_addSummaryText;
- (id)_dateComponentsForHour:(unint64_t)a3 minute:(unint64_t)a4;
- (id)_indexPathForCell:(id)a3;
- (id)_initWithDeliveryTimes:(id)a3;
- (id)_summaryTextForCount:(unint64_t)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)_cellCount;
- (unint64_t)_currentDailyDigestCount;
- (void)_addItemAtIndexPath:(id)a3;
- (void)_cancelButtonPressed:(id)a3;
- (void)_deleteItemAtIndexPath:(id)a3;
- (void)_handleAddOrRemoveActionForIndexPath:(id)a3;
- (void)_insertNextTime;
- (void)_reloadCollectionViewHeight;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)schedulerCell:(id)a3 didChangeTime:(id)a4;
- (void)schedulerCellButtonPressed:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)viewDidLoad;
@end

@implementation NCSchedulerViewController

+ (id)schedulerWithDeliveryTimes:(id)a3
{
  id v3 = a3;
  id v4 = [[NCSchedulerViewController alloc] _initWithDeliveryTimes:v3];

  return v4;
}

- (id)_initWithDeliveryTimes:(id)a3
{
  id v4 = a3;
  NCRegisterUserNotificationsUILogging();
  v5 = NCUserNotificationsUIKitFrameworkBundle();
  v6 = [v5 localizedStringForKey:@"NOTIFICATION_DIGEST_ONBOARDING_SCHEDULER_TITLE" value:&stru_1F2F516F8 table:0];
  v7 = NCUserNotificationsUIKitFrameworkBundle();
  v8 = [v7 localizedStringForKey:@"NOTIFICATION_DIGEST_ONBOARDING_SCHEDULER_DESCRIPTION" value:&stru_1F2F516F8 table:0];
  v15.receiver = self;
  v15.super_class = (Class)NCSchedulerViewController;
  v9 = [(NCOnboardingViewController *)&v15 initWithTitle:v6 detailText:v8 contentLayout:3];

  if (v9)
  {
    if (v4)
    {
      uint64_t v10 = [v4 mutableCopy];
      mutableDeliveryTimes = v9->_mutableDeliveryTimes;
      v9->_mutableDeliveryTimes = (NSMutableArray *)v10;
    }
    else
    {
      v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v13 = v9->_mutableDeliveryTimes;
      v9->_mutableDeliveryTimes = v12;

      [(NCSchedulerViewController *)v9 _insertNextTime];
      [(NCSchedulerViewController *)v9 _insertNextTime];
    }
  }

  return v9;
}

- (void)viewDidLoad
{
  v59.receiver = self;
  v59.super_class = (Class)NCSchedulerViewController;
  [(NCOnboardingViewController *)&v59 viewDidLoad];
  id v3 = NCUserNotificationsUIKitFrameworkBundle();
  id v4 = [v3 localizedStringForKey:@"NOTIFICATION_DIGEST_ONBOARDING_SCHEDULER_NEXT_BUTTON" value:&stru_1F2F516F8 table:0];
  [(NCOnboardingViewController *)self setNextButtonText:v4];

  id v5 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v6 = NCUserNotificationsUIKitFrameworkBundle();
  v7 = [v6 localizedStringForKey:@"NOTIFICATION_DIGEST_ONBOARDING_SCHEDULER_CANCEL" value:&stru_1F2F516F8 table:0];
  v8 = (void *)[v5 initWithTitle:v7 style:0 target:self action:sel__cancelButtonPressed_];

  v9 = [(OBBaseWelcomeController *)self navigationItem];
  [v9 setRightBarButtonItem:v8];

  uint64_t v10 = [(NCSchedulerViewController *)self navigationController];
  v11 = [v10 view];
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [(NCSchedulerViewController *)self contentView];
  }
  v14 = v13;

  [v14 frame];
  double v16 = v15 + -48.0;
  v17 = [(NCSchedulerViewController *)self _addSummaryText];
  +[NCSchedulerViewCell preferredHeightForText:v17 width:v16];
  double v19 = v18;

  v20 = [(NCSchedulerViewController *)self _summaryTextForCount:12];
  +[NCSchedulerViewCell preferredHeightForText:v20 width:v16];
  double v22 = v21;

  if (v19 >= v22) {
    double v23 = v19;
  }
  else {
    double v23 = v22;
  }
  self->_dynamicCellHeight = v23;
  id v24 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  [v24 setMinimumLineSpacing:0.0];
  objc_msgSend(v24, "setItemSize:", v16, self->_dynamicCellHeight);
  +[NCSchedulerViewHeader preferredHeightForWidth:v16];
  self->_dynamicHeaderHeight = v25;
  objc_msgSend(v24, "setHeaderReferenceSize:", v16, v25);
  id v26 = objc_alloc(MEMORY[0x1E4FB1568]);
  v27 = (UICollectionView *)objc_msgSend(v26, "initWithFrame:collectionViewLayout:", v24, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  collectionView = self->_collectionView;
  self->_collectionView = v27;

  [(UICollectionView *)self->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", 0.0, 24.0, 0.0, 24.0);
  [(UICollectionView *)self->_collectionView setDataSource:self];
  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setScrollEnabled:0];
  [(UICollectionView *)self->_collectionView setAutomaticallyAdjustsScrollIndicatorInsets:0];
  v29 = self->_collectionView;
  uint64_t v30 = objc_opt_class();
  uint64_t v31 = *MEMORY[0x1E4FB2770];
  v32 = +[NCSchedulerViewHeader reuseIdentifier];
  [(UICollectionView *)v29 registerClass:v30 forSupplementaryViewOfKind:v31 withReuseIdentifier:v32];

  v33 = self->_collectionView;
  uint64_t v34 = objc_opt_class();
  v35 = +[NCSchedulerViewCell reuseIdentifier];
  [(UICollectionView *)v33 registerClass:v34 forCellWithReuseIdentifier:v35];

  v36 = [(NCSchedulerViewController *)self contentView];
  [v36 addSubview:self->_collectionView];

  id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v38 = [(UICollectionView *)self->_collectionView leadingAnchor];
  v39 = [(NCSchedulerViewController *)self contentView];
  v40 = [v39 leadingAnchor];
  v41 = [v38 constraintEqualToAnchor:v40];
  [v37 addObject:v41];

  v42 = [(NCSchedulerViewController *)self contentView];
  v43 = [v42 trailingAnchor];
  v44 = [(UICollectionView *)self->_collectionView trailingAnchor];
  v45 = [v43 constraintEqualToAnchor:v44];
  [v37 addObject:v45];

  v46 = [(UICollectionView *)self->_collectionView topAnchor];
  v47 = [(NCSchedulerViewController *)self contentView];
  v48 = [v47 topAnchor];
  v49 = [v46 constraintEqualToAnchor:v48];
  [v37 addObject:v49];

  v50 = [(NCSchedulerViewController *)self contentView];
  v51 = [v50 bottomAnchor];
  v52 = [(UICollectionView *)self->_collectionView bottomAnchor];
  v53 = [v51 constraintEqualToAnchor:v52];
  [v37 addObject:v53];

  [(NCSchedulerViewController *)self _heightThatFitsCollectionView];
  double v55 = v54;
  v56 = [(UICollectionView *)self->_collectionView heightAnchor];
  v57 = [v56 constraintEqualToConstant:v55];
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v57;

  [v37 addObject:self->_heightConstraint];
  [MEMORY[0x1E4F28DC8] activateConstraints:v37];
  [(UICollectionView *)self->_collectionView reloadData];
}

- (NSArray)deliveryTimes
{
  v2 = (void *)[(NSMutableArray *)self->_mutableDeliveryTimes copy];

  return (NSArray *)v2;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v6 = *MEMORY[0x1E4FB2770];
  id v7 = a5;
  id v8 = a3;
  v9 = +[NCSchedulerViewHeader reuseIdentifier];
  uint64_t v10 = [v8 dequeueReusableSupplementaryViewOfKind:v6 withReuseIdentifier:v9 forIndexPath:v7];

  return v10;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NCSchedulerViewCell reuseIdentifier];
  v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  BOOL v10 = [(NCSchedulerViewController *)self _isFirstIndexPath:v6];
  BOOL v11 = [(NCSchedulerViewController *)self _isLastIndexPath:v6];
  if ([(NCSchedulerViewController *)self _isAddIndexPath:v6])
  {
    v12 = [MEMORY[0x1E4FB1618] systemBlueColor];
    id v13 = [(NCSchedulerViewController *)self _addSummaryText];
    LOBYTE(v18) = v11;
    [v9 configureWithSymbolName:@"plus" symbolColor:v12 title:v13 timeOfDay:0 delegate:self top:v10 bottom:v18];
LABEL_11:

    goto LABEL_12;
  }
  unint64_t v14 = [v6 item];
  if (v14 >= [(NSMutableArray *)self->_mutableDeliveryTimes count]) {
    goto LABEL_13;
  }
  v12 = -[NCSchedulerViewController _summaryTextForCount:](self, "_summaryTextForCount:", [v6 item] + 1);
  if (v10) {
    double v15 = 0;
  }
  else {
    double v15 = @"minus";
  }
  if (v10)
  {
    id v13 = 0;
  }
  else
  {
    id v13 = [MEMORY[0x1E4FB1618] systemRedColor];
  }
  double v16 = -[NSMutableArray objectAtIndex:](self->_mutableDeliveryTimes, "objectAtIndex:", [v6 item]);
  LOBYTE(v18) = v11;
  [v9 configureWithSymbolName:v15 symbolColor:v13 title:v12 timeOfDay:v16 delegate:self top:v10 bottom:v18];

  if (!v10) {
    goto LABEL_11;
  }
LABEL_12:

LABEL_13:

  return v9;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  if (-[NCSchedulerViewController _isAddIndexPath:](self, "_isAddIndexPath:")) {
    [(NCSchedulerViewController *)self _handleAddOrRemoveActionForIndexPath:v5];
  }
}

- (void)schedulerCell:(id)a3 didChangeTime:(id)a4
{
  id v13 = a4;
  id v6 = [(NCSchedulerViewController *)self _indexPathForCell:a3];
  id v7 = v6;
  if (v6)
  {
    unint64_t v8 = [v6 item];
    if (v8 < [(NSMutableArray *)self->_mutableDeliveryTimes count])
    {
      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_mutableDeliveryTimes, "replaceObjectAtIndex:withObject:", [v7 item], v13);
      v9 = [(NSMutableArray *)self->_mutableDeliveryTimes sortedArrayUsingComparator:&__block_literal_global_21];
      BOOL v10 = (NSMutableArray *)[v9 mutableCopy];

      mutableDeliveryTimes = self->_mutableDeliveryTimes;
      self->_mutableDeliveryTimes = v10;
      v12 = v10;

      [(UICollectionView *)self->_collectionView reloadData];
    }
  }
}

uint64_t __57__NCSchedulerViewController_schedulerCell_didChangeTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 hour];
  if (v6 <= [v5 hour])
  {
    uint64_t v8 = [v4 hour];
    uint64_t v7 = -1;
    if (v8 == [v5 hour])
    {
      uint64_t v9 = [v4 minute];
      if (v9 >= [v5 minute]) {
        uint64_t v7 = 1;
      }
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (void)schedulerCellButtonPressed:(id)a3
{
  id v4 = [(NCSchedulerViewController *)self _indexPathForCell:a3];
  if (v4)
  {
    id v5 = v4;
    [(NCSchedulerViewController *)self _handleAddOrRemoveActionForIndexPath:v4];
    id v4 = v5;
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)NCSchedulerViewController;
  [(NCSchedulerViewController *)&v4 touchesBegan:a3 withEvent:a4];
}

- (unint64_t)_currentDailyDigestCount
{
  return [(NSMutableArray *)self->_mutableDeliveryTimes count];
}

- (void)_insertNextTime
{
  if (![(NCSchedulerViewController *)self _currentDailyDigestCount])
  {
    id v3 = self;
    uint64_t v4 = 8;
    goto LABEL_5;
  }
  if ([(NCSchedulerViewController *)self _currentDailyDigestCount] == 1)
  {
    id v3 = self;
    uint64_t v4 = 18;
LABEL_5:
    uint64_t v5 = 0;
LABEL_6:
    uint64_t v6 = [(NCSchedulerViewController *)v3 _dateComponentsForHour:v4 minute:v5];
    goto LABEL_7;
  }
  uint64_t v7 = [(NSMutableArray *)self->_mutableDeliveryTimes lastObject];
  unint64_t v8 = [v7 hour];

  if (v8 > 0x16
    || ([(NCSchedulerViewController *)self _dateComponentsForHour:v8 + 1 minute:0],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v9 = [(NSMutableArray *)self->_mutableDeliveryTimes lastObject];
    unint64_t v10 = [v9 minute];

    if (v10 > 0x3A)
    {
      id v3 = self;
      uint64_t v4 = v8;
      uint64_t v5 = 59;
    }
    else
    {
      uint64_t v5 = v10 + 1;
      id v3 = self;
      uint64_t v4 = v8;
    }
    goto LABEL_6;
  }
LABEL_7:
  id v11 = (id)v6;
  [(NSMutableArray *)self->_mutableDeliveryTimes addObject:v6];
}

- (void)_handleAddOrRemoveActionForIndexPath:(id)a3
{
  id v5 = a3;
  if (-[NCSchedulerViewController _isAddIndexPath:](self, "_isAddIndexPath:"))
  {
    [(NCSchedulerViewController *)self _addItemAtIndexPath:v5];
  }
  else
  {
    unint64_t v4 = [v5 item];
    if (v4 < [(NSMutableArray *)self->_mutableDeliveryTimes count]) {
      [(NCSchedulerViewController *)self _deleteItemAtIndexPath:v5];
    }
  }
}

- (unint64_t)_cellCount
{
  unint64_t v2 = [(NCSchedulerViewController *)self _currentDailyDigestCount];
  if (v2 + 1 < 0xC) {
    return v2 + 1;
  }
  else {
    return 12;
  }
}

- (BOOL)_isFirstIndexPath:(id)a3
{
  return [a3 item] == 0;
}

- (BOOL)_isLastIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NCSchedulerViewController *)self _cellCount] - 1;
  uint64_t v6 = [v4 item];

  return v5 == v6;
}

- (BOOL)_isAddIndexPath:(id)a3
{
  BOOL v4 = [(NCSchedulerViewController *)self _isLastIndexPath:a3];
  if (v4) {
    LOBYTE(v4) = [(NCSchedulerViewController *)self _currentDailyDigestCount] < 0xC;
  }
  return v4;
}

- (double)_heightThatFitsCollectionView
{
  double dynamicCellHeight = self->_dynamicCellHeight;
  return self->_dynamicHeaderHeight
       + dynamicCellHeight * (double)[(NCSchedulerViewController *)self _cellCount];
}

- (void)_reloadCollectionViewHeight
{
  [(NCSchedulerViewController *)self _heightThatFitsCollectionView];
  double v4 = v3;
  [(NSLayoutConstraint *)self->_heightConstraint constant];
  if (v4 != v5)
  {
    [(NSLayoutConstraint *)self->_heightConstraint setConstant:v4];
    [(UICollectionView *)self->_collectionView setNeedsLayout];
    collectionView = self->_collectionView;
    [(UICollectionView *)collectionView layoutIfNeeded];
  }
}

- (id)_indexPathForCell:(id)a3
{
  id v4 = a3;
  double v5 = [(UICollectionView *)self->_collectionView visibleCells];
  uint64_t v6 = [(UICollectionView *)self->_collectionView indexPathsForVisibleItems];
  uint64_t v7 = [v5 count];
  unint64_t v8 = (os_log_t *)MEMORY[0x1E4FB3788];
  if (v7)
  {
    unint64_t v9 = 0;
    while (1)
    {
      id v10 = [v5 objectAtIndex:v9];

      unint64_t v11 = [v6 count];
      if (v10 == v4) {
        break;
      }
      if (++v9 >= [v5 count]) {
        goto LABEL_11;
      }
    }
    if (v9 >= v11)
    {
      id v13 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
        -[NCSchedulerViewController _indexPathForCell:](v13);
      }
    }
    else
    {
      v12 = [v6 objectAtIndex:v9];
      if (v12) {
        goto LABEL_14;
      }
    }
  }
LABEL_11:
  unint64_t v14 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
    -[NCSchedulerViewController _indexPathForCell:](v14);
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (void)_deleteItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  collectionView = self->_collectionView;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__NCSchedulerViewController__deleteItemAtIndexPath___block_invoke;
  v11[3] = &unk_1E6A93A88;
  v11[4] = self;
  id v12 = v4;
  id v13 = v5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__NCSchedulerViewController__deleteItemAtIndexPath___block_invoke_2;
  v9[3] = &unk_1E6A93E38;
  v9[4] = self;
  id v10 = v13;
  id v7 = v13;
  id v8 = v4;
  [(UICollectionView *)collectionView performBatchUpdates:v11 completion:v9];
}

void __52__NCSchedulerViewController__deleteItemAtIndexPath___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _currentDailyDigestCount];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1224), "removeObjectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "item"));
  [*(id *)(a1 + 32) _reloadCollectionViewHeight];
  for (unint64_t i = [*(id *)(a1 + 40) item]; i < objc_msgSend(*(id *)(a1 + 32), "_cellCount"); ++i)
  {
    id v4 = *(void **)(a1 + 48);
    id v5 = [MEMORY[0x1E4F28D58] indexPathForItem:i inSection:0];
    [v4 addObject:v5];
  }
  if (v2 != 12)
  {
    uint64_t v6 = [*(id *)(a1 + 32) collectionView];
    v8[0] = *(void *)(a1 + 40);
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [v6 deleteItemsAtIndexPaths:v7];
  }
}

void __52__NCSchedulerViewController__deleteItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) collectionView];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__NCSchedulerViewController__deleteItemAtIndexPath___block_invoke_4;
  v4[3] = &unk_1E6A93E38;
  double v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 performBatchUpdates:&__block_literal_global_38_0 completion:v4];
}

void __52__NCSchedulerViewController__deleteItemAtIndexPath___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) collectionView];
  [v2 reloadItemsAtIndexPaths:*(void *)(a1 + 40)];
}

- (void)_addItemAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NCSchedulerViewController *)self _currentDailyDigestCount];
  collectionView = self->_collectionView;
  if (v5 == 11)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __49__NCSchedulerViewController__addItemAtIndexPath___block_invoke;
    v16[3] = &unk_1E6A91A68;
    id v7 = &v17;
    v16[4] = self;
    id v17 = v4;
    id v8 = v4;
    unint64_t v9 = v16;
    id v10 = collectionView;
    unint64_t v11 = 0;
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __49__NCSchedulerViewController__addItemAtIndexPath___block_invoke_2;
    v14[3] = &unk_1E6A91A68;
    id v7 = &v15;
    v14[4] = self;
    id v15 = v4;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __49__NCSchedulerViewController__addItemAtIndexPath___block_invoke_3;
    v13[3] = &unk_1E6A93220;
    v13[4] = self;
    id v12 = v4;
    unint64_t v9 = v14;
    unint64_t v11 = v13;
    id v10 = collectionView;
  }
  [(UICollectionView *)v10 performBatchUpdates:v9 completion:v11];
}

void __49__NCSchedulerViewController__addItemAtIndexPath___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _insertNextTime];
  id v2 = [*(id *)(a1 + 32) collectionView];
  v4[0] = *(void *)(a1 + 40);
  double v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v2 reloadItemsAtIndexPaths:v3];
}

void __49__NCSchedulerViewController__addItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _insertNextTime];
  [*(id *)(a1 + 32) _reloadCollectionViewHeight];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (unint64_t i = [*(id *)(a1 + 40) item]; i < objc_msgSend(*(id *)(a1 + 32), "_cellCount") - 1; ++i)
  {
    id v4 = [MEMORY[0x1E4F28D58] indexPathForItem:i inSection:0];
    [v2 addObject:v4];
  }
  unint64_t v5 = [*(id *)(a1 + 32) collectionView];
  [v5 reloadItemsAtIndexPaths:v2];

  uint64_t v6 = [*(id *)(a1 + 32) collectionView];
  v8[0] = *(void *)(a1 + 40);
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v6 insertItemsAtIndexPaths:v7];
}

void __49__NCSchedulerViewController__addItemAtIndexPath___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    double v3 = [*(id *)(a1 + 32) scrollView];
    [v3 contentSize];
    double v5 = v4;
    uint64_t v6 = [*(id *)(a1 + 32) scrollView];
    [v6 bounds];
    double v8 = v5 - v7;
    unint64_t v9 = [*(id *)(a1 + 32) scrollView];
    [v9 contentInset];
    double v11 = v8 + v10;

    if (v11 > 0.0)
    {
      id v12 = [*(id *)(a1 + 32) scrollView];
      objc_msgSend(v12, "setContentOffset:animated:", 1, 0.0, v11);
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_summaryTextForCount:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      double v3 = NCUserNotificationsUIKitFrameworkBundle();
      double v4 = v3;
      double v5 = @"NOTIFICATION_DIGEST_LABEL_FIRST_SUMMARY";
      goto LABEL_14;
    case 2uLL:
      double v3 = NCUserNotificationsUIKitFrameworkBundle();
      double v4 = v3;
      double v5 = @"NOTIFICATION_DIGEST_LABEL_SECOND_SUMMARY";
      goto LABEL_14;
    case 3uLL:
      double v3 = NCUserNotificationsUIKitFrameworkBundle();
      double v4 = v3;
      double v5 = @"NOTIFICATION_DIGEST_LABEL_THIRD_SUMMARY";
      goto LABEL_14;
    case 4uLL:
      double v3 = NCUserNotificationsUIKitFrameworkBundle();
      double v4 = v3;
      double v5 = @"NOTIFICATION_DIGEST_LABEL_FOURTH_SUMMARY";
      goto LABEL_14;
    case 5uLL:
      double v3 = NCUserNotificationsUIKitFrameworkBundle();
      double v4 = v3;
      double v5 = @"NOTIFICATION_DIGEST_LABEL_FIFTH_SUMMARY";
      goto LABEL_14;
    case 6uLL:
      double v3 = NCUserNotificationsUIKitFrameworkBundle();
      double v4 = v3;
      double v5 = @"NOTIFICATION_DIGEST_LABEL_SIXTH_SUMMARY";
      goto LABEL_14;
    case 7uLL:
      double v3 = NCUserNotificationsUIKitFrameworkBundle();
      double v4 = v3;
      double v5 = @"NOTIFICATION_DIGEST_LABEL_SEVENTH_SUMMARY";
      goto LABEL_14;
    case 8uLL:
      double v3 = NCUserNotificationsUIKitFrameworkBundle();
      double v4 = v3;
      double v5 = @"NOTIFICATION_DIGEST_LABEL_EIGHTH_SUMMARY";
      goto LABEL_14;
    case 9uLL:
      double v3 = NCUserNotificationsUIKitFrameworkBundle();
      double v4 = v3;
      double v5 = @"NOTIFICATION_DIGEST_LABEL_NINTH_SUMMARY";
      goto LABEL_14;
    case 0xAuLL:
      double v3 = NCUserNotificationsUIKitFrameworkBundle();
      double v4 = v3;
      double v5 = @"NOTIFICATION_DIGEST_LABEL_TENTH_SUMMARY";
      goto LABEL_14;
    case 0xBuLL:
      double v3 = NCUserNotificationsUIKitFrameworkBundle();
      double v4 = v3;
      double v5 = @"NOTIFICATION_DIGEST_LABEL_ELEVENTH_SUMMARY";
      goto LABEL_14;
    case 0xCuLL:
      double v3 = NCUserNotificationsUIKitFrameworkBundle();
      double v4 = v3;
      double v5 = @"NOTIFICATION_DIGEST_LABEL_TWELFTH_SUMMARY";
LABEL_14:
      uint64_t v6 = [v3 localizedStringForKey:v5 value:&stru_1F2F516F8 table:0];

      break;
    default:
      uint64_t v6 = 0;
      break;
  }

  return v6;
}

- (id)_addSummaryText
{
  id v2 = NCUserNotificationsUIKitFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"NOTIFICATION_DIGEST_SETTINGS_ADD_SUMMARY" value:&stru_1F2F516F8 table:0];

  return v3;
}

- (id)_dateComponentsForHour:(unint64_t)a3 minute:(unint64_t)a4
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v6 setHour:a3];
  [v6 setMinute:a4];

  return v6;
}

- (void)_cancelButtonPressed:(id)a3
{
  id v3 = [(NCSchedulerViewController *)self navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_mutableDeliveryTimes, 0);

  objc_storeStrong((id *)&self->_heightConstraint, 0);
}

- (void)_indexPathForCell:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7C04000, log, OS_LOG_TYPE_ERROR, "Cannot find cell in visibleCells", v1, 2u);
}

- (void)_indexPathForCell:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7C04000, log, OS_LOG_TYPE_ERROR, "Collection view's visibleCells count does not equal indexPathsForVisibleItems count, and thus can't get index for cell.", v1, 2u);
}

@end