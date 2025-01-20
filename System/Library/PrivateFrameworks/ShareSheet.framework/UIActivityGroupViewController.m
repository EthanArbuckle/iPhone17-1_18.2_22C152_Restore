@interface UIActivityGroupViewController
- (BOOL)activityIndexDidChangeWhileDragging;
- (BOOL)allowsUserCustomization;
- (BOOL)canBecomeFirstResponder;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasActivities;
- (BOOL)isEmbedded;
- (BOOL)isPicker;
- (CGPoint)initialDraggingLocation;
- (CGSize)collectionView:(id)a3 layout:(id)a4 preferredSizeForItemAtIndexPath:(id)a5;
- (NSArray)activities;
- (NSArray)visibleActivities;
- (NSArray)visibleActivityProxies;
- (NSIndexPath)indexPathForMenuActivity;
- (UIActivityGroupViewController)initWithActivityCategory:(int64_t)a3 activityProxies:(id)a4;
- (UIActivityGroupViewController)initWithActivityCategory:(int64_t)a3 userDefaults:(id)a4;
- (UIActivityGroupViewController)initWithActivityCategory:(int64_t)a3 userDefaults:(id)a4 userDefaultsIdentifier:(id)a5;
- (UIActivityGroupViewController)initWithCoder:(id)a3;
- (UIActivityGroupViewController)initWithCollectionViewLayout:(id)a3;
- (UIActivityGroupViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIActivityGroupViewControllerDataSource)dataSource;
- (UIActivityGroupViewControllerDelegate)delegate;
- (UIEdgeInsets)externalSafeInset;
- (UILongPressGestureRecognizer)editingGestureRecognizer;
- (_UIActivityUserDefaults)userDefaults;
- (_UIUserDefaultsActivity)userDefaultsActivity;
- (id)_titleTextForActivity:(id)a3;
- (id)activityForItemAtIndexPath:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 layout:(id)a4 moveItemAtIndexPath:(id)a5 toIndexPath:(id)a6;
- (id)collectionView:(id)a3 layout:(id)a4 needsContainerViewForDraggingItemAtIndexPath:(id)a5;
- (id)targetIndexPathForMoveFromRowAtIndexPath:(id)a3 toProposedIndexPath:(id)a4;
- (int64_t)activityCategory;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_dismissPresentedMenuControllers;
- (void)_performHideActivityForMenuController:(id)a3;
- (void)_setActivities:(id)a3 animated:(BOOL)a4;
- (void)_setVisibleActivities:(id)a3 animated:(BOOL)a4;
- (void)_updateItemSizeIfNeeded;
- (void)_updateVisibleActivitiesAnimated:(BOOL)a3;
- (void)activityUserDefaultsDidChange:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)handleEditingGesture:(id)a3;
- (void)hideItemAtIndexPath:(id)a3;
- (void)ignoreUserDefaultsChangesWhileUsingBlock:(id)a3;
- (void)registerClassForContentSizeCategoryChanges;
- (void)registerForActivityUserDefaultsChanges;
- (void)setActivities:(id)a3;
- (void)setActivities:(id)a3 animated:(BOOL)a4;
- (void)setActivityCategory:(int64_t)a3;
- (void)setActivityIndexDidChangeWhileDragging:(BOOL)a3;
- (void)setAllowsUserCustomization:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEditingGestureRecognizer:(id)a3;
- (void)setEmbedded:(BOOL)a3;
- (void)setExternalSafeInset:(UIEdgeInsets)a3;
- (void)setHasActivities:(BOOL)a3;
- (void)setIndexPathForMenuActivity:(id)a3;
- (void)setInitialDraggingLocation:(CGPoint)a3;
- (void)setPicker:(BOOL)a3;
- (void)setUserDefaults:(id)a3;
- (void)setUserDefaultsActivity:(id)a3;
- (void)setVisibleActivities:(id)a3;
- (void)setVisibleActivityProxies:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)unregisterForActivityUserDefaultsChanges;
- (void)updateActivityProxies:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation UIActivityGroupViewController

- (UIActivityGroupViewController)initWithCollectionViewLayout:(id)a3
{
  return [(UIActivityGroupViewController *)self initWithActivityCategory:0 userDefaults:0];
}

- (UIActivityGroupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return [(UIActivityGroupViewController *)self initWithActivityCategory:0 userDefaults:0];
}

- (UIActivityGroupViewController)initWithCoder:(id)a3
{
  return [(UIActivityGroupViewController *)self initWithActivityCategory:0 userDefaults:0];
}

- (UIActivityGroupViewController)initWithActivityCategory:(int64_t)a3 activityProxies:(id)a4
{
  v6 = @"UIActivityCategoryShare";
  if (a3 != 1) {
    v6 = 0;
  }
  if (a3) {
    v7 = v6;
  }
  else {
    v7 = @"UIActivityCategoryAction";
  }
  [(UIActivityGroupViewController *)self setVisibleActivityProxies:a4];
  return [(UIActivityGroupViewController *)self initWithActivityCategory:a3 userDefaults:0 userDefaultsIdentifier:v7];
}

- (UIActivityGroupViewController)initWithActivityCategory:(int64_t)a3 userDefaults:(id)a4
{
  return -[UIActivityGroupViewController initWithActivityCategory:userDefaults:userDefaultsIdentifier:](self, "initWithActivityCategory:userDefaults:userDefaultsIdentifier:");
}

- (UIActivityGroupViewController)initWithActivityCategory:(int64_t)a3 userDefaults:(id)a4 userDefaultsIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = objc_alloc_init(_UIActivityGroupViewFlowLayout);
  [(_UIActivityGroupViewFlowLayout *)v10 _setWantsRightToLeftHorizontalMirroringIfNeeded:1];
  [(UIActivityGroupViewController *)self setAllowsUserCustomization:1];
  [(UIActivityGroupViewController *)self setPicker:1];
  v18.receiver = self;
  v18.super_class = (Class)UIActivityGroupViewController;
  v11 = [(UIActivityGroupViewController *)&v18 initWithCollectionViewLayout:v10];
  v12 = v11;
  if (v11)
  {
    [(UIActivityGroupViewController *)v11 setActivityCategory:a3];
    if (v8)
    {
      v13 = [[_UIActivityUserDefaults alloc] initWithUnderlyingUserDefaults:v8 activityDefaultsKey:v9];
      [(UIActivityGroupViewController *)v12 setUserDefaults:v13];

      if ([(UIActivityGroupViewController *)v12 allowsUserCustomization])
      {
        v14 = [_UIUserDefaultsHostActivity alloc];
        v15 = [(UIActivityGroupViewController *)v12 userDefaults];
        v16 = [(_UIUserDefaultsActivity *)v14 initWithUserDefaults:v15 activityCategory:a3];
        [(UIActivityGroupViewController *)v12 setUserDefaultsActivity:v16];
      }
      [(UIActivityGroupViewController *)v12 registerClassForContentSizeCategoryChanges];
    }
  }

  return v12;
}

- (void)dealloc
{
  [(UIActivityGroupViewController *)self unregisterForActivityUserDefaultsChanges];
  v3.receiver = self;
  v3.super_class = (Class)UIActivityGroupViewController;
  [(UIActivityGroupViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v22.receiver = self;
  v22.super_class = (Class)UIActivityGroupViewController;
  [(UIActivityGroupViewController *)&v22 viewDidLoad];
  objc_super v3 = [MEMORY[0x1E4FB1618] clearColor];
  v4 = [(UIActivityGroupViewController *)self collectionView];
  [v4 setBackgroundColor:v3];

  v5 = [(UIActivityGroupViewController *)self collectionView];
  [v5 setOpaque:0];

  v6 = [(UIActivityGroupViewController *)self collectionView];
  [v6 setShowsHorizontalScrollIndicator:0];

  v7 = [(UIActivityGroupViewController *)self collectionView];
  [v7 setAlwaysBounceHorizontal:1];

  id v8 = [(UIActivityGroupViewController *)self collectionView];
  [v8 setDelaysContentTouches:0];

  id v9 = [(UIActivityGroupViewController *)self collectionView];
  [v9 setClipsToBounds:1];

  v10 = [(UIActivityGroupViewController *)self collectionView];
  [v10 setPrefetchDataSource:self];

  v11 = [(UIActivityGroupViewController *)self collectionView];
  [v11 _setFirstResponderKeyboardAvoidanceEnabled:0];

  v12 = [(UIActivityGroupViewController *)self collectionView];
  [v12 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"activity"];

  v13 = [(UIActivityGroupViewController *)self collectionView];
  [v13 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"placeholder"];

  v14 = [(UIActivityGroupViewController *)self collectionView];
  [v14 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"userDefaults"];

  uint64_t v15 = [(UIActivityGroupViewController *)self userDefaults];
  if (v15)
  {
    v16 = (void *)v15;
    BOOL v17 = [(UIActivityGroupViewController *)self allowsUserCustomization];

    if (v17)
    {
      objc_super v18 = [[_UIActivityDragGestureRecognizer alloc] initWithTarget:self action:sel_handleEditingGesture_];
      [(_UIActivityDragGestureRecognizer *)v18 setDelegate:self];
      [(_UIActivityDragGestureRecognizer *)v18 setMinimumPressDuration:0.35];
      v19 = [(UIActivityGroupViewController *)self collectionView];
      [v19 addGestureRecognizer:v18];

      v20 = [(UIActivityGroupViewController *)self activityGroupViewLayout];
      [v20 setEditingGestureRecognizer:v18];

      editingGestureRecognizer = self->_editingGestureRecognizer;
      self->_editingGestureRecognizer = &v18->super;

      [(UIActivityGroupViewController *)self registerForActivityUserDefaultsChanges];
    }
  }
}

- (void)setExternalSafeInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  double v7 = self->_externalSafeInset.top;
  if (self->_externalSafeInset.left != a3.left
    || v7 != top
    || self->_externalSafeInset.right != a3.right
    || self->_externalSafeInset.bottom != a3.bottom)
  {
    self->_externalSafeInset.double top = top;
    self->_externalSafeInset.double left = a3.left;
    self->_externalSafeInset.double bottom = a3.bottom;
    self->_externalSafeInset.double right = a3.right;
    id v11 = [(UIActivityGroupViewController *)self activityGroupViewLayout];
    objc_msgSend(v11, "setExternalSafeInset:", top, left, bottom, right);
    [v11 invalidateLayout];
  }
}

- (void)setActivities:(id)a3
{
}

- (void)setActivities:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  v6 = [(UIActivityGroupViewController *)self userDefaultsActivity];

  if (v6)
  {
    double v7 = [(UIActivityGroupViewController *)self userDefaults];
    uint64_t v8 = [v7 activitiesOrderedByUserActivityOrderForActivities:v11];

    id v9 = [(UIActivityGroupViewController *)self userDefaultsActivity];
    [v9 setAvailableActivities:v8];

    id v10 = (id)v8;
  }
  else
  {
    id v10 = v11;
  }
  id v12 = v10;
  [(UIActivityGroupViewController *)self _setActivities:v10 animated:v4];
}

- (void)_setActivities:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (self->_activities != a3)
  {
    v6 = (NSArray *)[a3 copy];
    activities = self->_activities;
    self->_activities = v6;
  }
  [(UIActivityGroupViewController *)self _updateVisibleActivitiesAnimated:v4];
}

- (void)_updateVisibleActivitiesAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(UIActivityGroupViewController *)self activities];
  v6 = [(UIActivityGroupViewController *)self userDefaults];

  if (v6)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__UIActivityGroupViewController__updateVisibleActivitiesAnimated___block_invoke;
    v12[3] = &unk_1E5A23BD8;
    v12[4] = self;
    double v7 = [MEMORY[0x1E4F28F60] predicateWithBlock:v12];
    uint64_t v8 = [v5 filteredArrayUsingPredicate:v7];

    v5 = (void *)v8;
  }
  id v9 = [(UIActivityGroupViewController *)self userDefaultsActivity];

  if (v9)
  {
    id v10 = [(UIActivityGroupViewController *)self userDefaultsActivity];
    uint64_t v11 = [v5 arrayByAddingObject:v10];

    v5 = (void *)v11;
  }
  [(UIActivityGroupViewController *)self _setVisibleActivities:v5 animated:v3];
}

uint64_t __66__UIActivityGroupViewController__updateVisibleActivitiesAnimated___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  BOOL v4 = [v2 userDefaults];
  int v5 = [v4 activityIsHidden:v3];

  return v5 ^ 1u;
}

- (void)_setVisibleActivities:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (NSArray *)a3;
  uint64_t v7 = [(NSArray *)v6 count];
  self->_BOOL hasActivities = v7 != 0;
  if (v7)
  {
    if (v4
      && ([(NSArray *)self->_visibleActivities count]
       || ([(UIActivityGroupViewController *)self view],
           uint64_t v8 = objc_claimAutoreleasedReturnValue(),
           [v8 alpha],
           double v10 = v9,
           v8,
           v10 != 1.0)))
    {
      v20 = [(UIActivityGroupViewController *)self collectionView];
      uint64_t v36 = MEMORY[0x1E4F143A8];
      uint64_t v37 = 3221225472;
      v38 = __64__UIActivityGroupViewController__setVisibleActivities_animated___block_invoke;
      v39 = &unk_1E5A215A0;
      v40 = self;
      v41 = v6;
      [v20 performBatchUpdates:&v36 completion:0];
    }
    else
    {
      if (self->_visibleActivities != v6)
      {
        uint64_t v11 = (NSArray *)[(NSArray *)v6 copy];
        visibleActivities = self->_visibleActivities;
        self->_visibleActivities = v11;
      }
      v13 = [(UIActivityGroupViewController *)self collectionView];
      [v13 reloadData];
    }
    v21 = [(UIActivityGroupViewController *)self view];
    [v21 alpha];
    double v23 = v22;

    if (v23 < 1.0)
    {
      BOOL v17 = (void *)MEMORY[0x1E4FB1EB0];
      double v18 = 0.35;
      if (!v4) {
        double v18 = 0.0;
      }
      uint64_t v31 = MEMORY[0x1E4F143A8];
      uint64_t v32 = 3221225472;
      v33 = __64__UIActivityGroupViewController__setVisibleActivities_animated___block_invoke_4;
      v34 = &unk_1E5A21900;
      v35 = self;
      v19 = &v31;
LABEL_17:
      objc_msgSend(v17, "animateWithDuration:animations:", v19, v18, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40);
    }
  }
  else
  {
    v14 = [(UIActivityGroupViewController *)self view];
    [v14 alpha];
    double v16 = v15;

    if (v16 == 1.0)
    {
      BOOL v17 = (void *)MEMORY[0x1E4FB1EB0];
      double v18 = 0.35;
      if (!v4) {
        double v18 = 0.0;
      }
      uint64_t v26 = MEMORY[0x1E4F143A8];
      uint64_t v27 = 3221225472;
      v28 = __64__UIActivityGroupViewController__setVisibleActivities_animated___block_invoke_5;
      v29 = &unk_1E5A21900;
      v30 = self;
      v19 = &v26;
      goto LABEL_17;
    }
  }
  BOOL hasActivities = self->_hasActivities;
  v25 = [(UIActivityGroupViewController *)self collectionView];
  [v25 setScrollEnabled:hasActivities];
}

void __64__UIActivityGroupViewController__setVisibleActivities_animated___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 1048);
  uint64_t v3 = [*(id *)(a1 + 40) copy];
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(void **)(v4 + 1048);
  *(void *)(v4 + 1048) = v3;

  v6 = [MEMORY[0x1E4F1CA48] array];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __64__UIActivityGroupViewController__setVisibleActivities_animated___block_invoke_2;
  v20[3] = &unk_1E5A23C00;
  v20[4] = *(void *)(a1 + 32);
  id v21 = v6;
  id v7 = v6;
  [v2 enumerateObjectsUsingBlock:v20];
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  double v9 = *(void **)(*(void *)(a1 + 32) + 1048);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  double v16 = __64__UIActivityGroupViewController__setVisibleActivities_animated___block_invoke_3;
  BOOL v17 = &unk_1E5A23C00;
  id v18 = v2;
  id v19 = v8;
  id v10 = v8;
  id v11 = v2;
  [v9 enumerateObjectsUsingBlock:&v14];
  id v12 = objc_msgSend(*(id *)(a1 + 32), "collectionView", v14, v15, v16, v17);
  [v12 deleteItemsAtIndexPaths:v7];

  v13 = [*(id *)(a1 + 32) collectionView];
  [v13 insertItemsAtIndexPaths:v10];
}

void __64__UIActivityGroupViewController__setVisibleActivities_animated___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (([*(id *)(*(void *)(a1 + 32) + 1048) containsObject:a2] & 1) == 0)
  {
    int v5 = *(void **)(a1 + 40);
    id v6 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:0];
    [v5 addObject:v6];
  }
}

void __64__UIActivityGroupViewController__setVisibleActivities_animated___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (([*(id *)(a1 + 32) containsObject:a2] & 1) == 0)
  {
    int v5 = *(void **)(a1 + 40);
    id v6 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:0];
    [v5 addObject:v6];
  }
}

void __64__UIActivityGroupViewController__setVisibleActivities_animated___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

void __64__UIActivityGroupViewController__setVisibleActivities_animated___block_invoke_5(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:0.35];
}

- (void)updateActivityProxies:(id)a3
{
  [(UIActivityGroupViewController *)self setVisibleActivityProxies:a3];
  id v4 = [(UIActivityGroupViewController *)self collectionView];
  [v4 reloadData];
}

- (BOOL)canBecomeFirstResponder
{
  id v2 = [(UIActivityGroupViewController *)self userDefaults];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(UIActivityGroupViewController *)self isEditing] != a3)
  {
    id v7 = [(UIActivityGroupViewController *)self userDefaults];

    if (v7)
    {
      v8.receiver = self;
      v8.super_class = (Class)UIActivityGroupViewController;
      [(UIActivityGroupViewController *)&v8 setEditing:v5 animated:v4];
    }
  }
}

- (void)_performHideActivityForMenuController:(id)a3
{
  BOOL v4 = [(UIActivityGroupViewController *)self indexPathForMenuActivity];

  if (v4)
  {
    id v5 = [(UIActivityGroupViewController *)self indexPathForMenuActivity];
    [(UIActivityGroupViewController *)self hideItemAtIndexPath:v5];
  }
}

- (id)activityForItemAtIndexPath:(id)a3
{
  if (a3)
  {
    BOOL v4 = -[NSArray objectAtIndexedSubscript:](self->_visibleActivities, "objectAtIndexedSubscript:", [a3 item]);
  }
  else
  {
    BOOL v4 = 0;
  }
  return v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = [(UIActivityGroupViewController *)self visibleActivityProxies];

  if (v5)
  {
    id v6 = [(UIActivityGroupViewController *)self visibleActivityProxies];
    int64_t v7 = [v6 count];

    return v7;
  }
  else
  {
    visibleActivities = self->_visibleActivities;
    return [(NSArray *)visibleActivities count];
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(UIActivityGroupViewController *)self visibleActivityProxies];

  if (v8)
  {
    double v9 = [v6 dequeueReusableCellWithReuseIdentifier:@"activity" forIndexPath:v7];
    id v10 = [v9 titleLabel];
    [v10 setText:@"Hello"];

    id v11 = [v9 titleLabel];
    [v11 setAlpha:0.0];

    id v12 = [(UIActivityGroupViewController *)self visibleActivityProxies];
    v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
    [v9 setActivityProxy:v13];

    uint64_t v14 = [(UIActivityGroupViewController *)self visibleActivityProxies];
    uint64_t v15 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
    LODWORD(v12) = [v15 iconImageSlotID];

    double v16 = [(UIActivityGroupViewController *)self visibleActivityProxies];
    BOOL v17 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
    id v18 = [v17 activityTitle];
    int v19 = [v18 slotIdentifier];

    v20 = (void *)*MEMORY[0x1E4FB2608];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __71__UIActivityGroupViewController_collectionView_cellForItemAtIndexPath___block_invoke;
    v38[3] = &unk_1E5A219C0;
    int v40 = (int)v12;
    id v21 = v9;
    id v39 = v21;
    int v41 = v19;
    [v20 _performBlockAfterCATransactionCommits:v38];
    double v22 = v39;
  }
  else
  {
    double v22 = [(UIActivityGroupViewController *)self activityForItemAtIndexPath:v7];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v24 = [(UIActivityGroupViewController *)self userDefaultsActivity];

    v25 = @"activity";
    if (isKindOfClass) {
      v25 = @"placeholder";
    }
    if (v22 == v24) {
      uint64_t v26 = @"userDefaults";
    }
    else {
      uint64_t v26 = v25;
    }
    id v21 = [v6 dequeueReusableCellWithReuseIdentifier:v26 forIndexPath:v7];
    objc_msgSend(v21, "setSequence:", objc_msgSend(v21, "sequence") + 1);
    if (isKindOfClass)
    {
      uint64_t v27 = @"\n";
    }
    else
    {
      uint64_t v27 = [(UIActivityGroupViewController *)self _titleTextForActivity:v22];
    }
    v28 = [v21 titleLabel];
    [v28 setText:v27];

    if (isKindOfClass)
    {
      v29 = [v21 imageView];
      [v29 setImage:0];
    }
    else
    {

      v30 = [v21 imageView];
      [v30 setImage:0];

      uint64_t v31 = (void *)[v21 sequence];
      id location = 0;
      objc_initWeak(&location, v21);
      uint64_t v32 = [(UIActivityGroupViewController *)self traitCollection];
      objc_msgSend(v22, "setUserInterfaceStyle:", objc_msgSend(v32, "userInterfaceStyle"));

      v33 = [v22 _activityImageLoader];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __71__UIActivityGroupViewController_collectionView_cellForItemAtIndexPath___block_invoke_2;
      v35[3] = &unk_1E5A23C28;
      objc_copyWeak(v36, &location);
      v36[1] = v31;
      [v33 getResourceWithBlock:v35];

      objc_destroyWeak(v36);
      objc_destroyWeak(&location);
    }
    [v21 setNeedsLayout];
  }

  return v21;
}

void __71__UIActivityGroupViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  id v23 = [MEMORY[0x1E4F39B58] objectForSlot:*(unsigned int *)(a1 + 40)];
  uint64_t v2 = *MEMORY[0x1E4F3A3D0];
  uint64_t v3 = [*(id *)(a1 + 32) imageSlot];
  BOOL v4 = [v3 layer];
  [v4 setContentsGravity:v2];

  id v5 = [*(id *)(a1 + 32) imageSlot];
  id v6 = [v5 layer];
  [v6 setContents:v23];

  id v7 = [MEMORY[0x1E4F39B58] objectForSlot:*(unsigned int *)(a1 + 44)];
  objc_super v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v8 scale];
  double v10 = v9;
  id v11 = [*(id *)(a1 + 32) titleSlot];
  id v12 = [v11 layer];
  [v12 setContentsScale:v10];

  v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v13 scale];
  double v15 = v14;
  double v16 = [*(id *)(a1 + 32) titleSlot];
  BOOL v17 = [v16 layer];
  [v17 setRasterizationScale:v15];

  uint64_t v18 = *MEMORY[0x1E4F3A3C0];
  int v19 = [*(id *)(a1 + 32) titleSlot];
  v20 = [v19 layer];
  [v20 setContentsGravity:v18];

  id v21 = [*(id *)(a1 + 32) titleSlot];
  double v22 = [v21 layer];
  [v22 setContents:v7];
}

void __71__UIActivityGroupViewController_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = WeakRetained;
  if (WeakRetained && [WeakRetained sequence] == *(void *)(a1 + 40))
  {
    id v5 = [v4 imageView];
    [v5 setImage:v6];
  }
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = [(UIActivityGroupViewController *)self activityForItemAtIndexPath:*(void *)(*((void *)&v12 + 1) + 8 * v9)];
        id v11 = [v10 _activityImageLoader];
        [v11 loadResourceIfNeeded];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)_titleTextForActivity:(id)a3
{
  return (id)[a3 activityTitle];
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  objc_msgSend(a4, "contentView", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 updateConstraintsIfNeeded];
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5 = [(UIActivityGroupViewController *)self visibleActivityProxies];

  return v5 || self->_hasActivities;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(UIActivityGroupViewController *)self visibleActivityProxies];

  if (v6)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    uint64_t v8 = [(UIActivityGroupViewController *)self activityForItemAtIndexPath:v5];
    uint64_t v9 = [(UIActivityGroupViewController *)self userDefaultsActivity];

    if (v8 == v9)
    {
      LOBYTE(v7) = 1;
    }
    else if (self->_hasActivities)
    {
      int v7 = [(UIActivityGroupViewController *)self isEditing] ^ 1;
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(UIActivityGroupViewController *)self visibleActivityProxies];

  if (v6)
  {
    id v15 = [(UIActivityGroupViewController *)self delegate];
    uint64_t v7 = [v5 item];

    [v15 activityGroupViewController:self didSelectActivityAtIndex:v7];
  }
  else
  {
    uint64_t v8 = [(UIActivityGroupViewController *)self collectionView];
    uint64_t v9 = [v8 cellForItemAtIndexPath:v5];
    [v9 setHighlighted:0];

    id v15 = [(UIActivityGroupViewController *)self activityForItemAtIndexPath:v5];

    double v10 = [(UIActivityGroupViewController *)self dataSource];
    if (v10)
    {
      id v11 = [v15 activityType];
      int v12 = [v11 isEqualToString:@"com.apple.UIKit.activity.UserDefaults"];

      if (v12)
      {
        long long v13 = objc_msgSend(v10, "activityGroupViewController:availableActivitiesInCategory:", self, -[UIActivityGroupViewController activityCategory](self, "activityCategory"));
        [v15 setAvailableActivities:v13];
      }
    }
    long long v14 = [(UIActivityGroupViewController *)self delegate];
    [v14 activityGroupViewController:self didSelectActivity:v15];
  }
}

- (void)_updateItemSizeIfNeeded
{
  uint64_t v3 = [(UIActivityGroupViewController *)self collectionViewLayout];
  [v3 collectionViewContentSize];
  double v5 = v4;

  -[UIActivityGroupViewController setPreferredContentSize:](self, "setPreferredContentSize:", 0.0, v5);
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)UIActivityGroupViewController;
  [(UIActivityGroupViewController *)&v3 viewDidLayoutSubviews];
  [(UIActivityGroupViewController *)self _updateItemSizeIfNeeded];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIActivityGroupViewController;
  [(UIActivityGroupViewController *)&v4 viewWillDisappear:a3];
  [(UIActivityGroupViewController *)self _dismissPresentedMenuControllers];
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIActivityGroupViewController;
  [(UIActivityGroupViewController *)&v5 traitCollectionDidChange:a3];
  objc_super v4 = [(UIActivityGroupViewController *)self collectionViewLayout];
  [v4 invalidateLayout];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(UIActivityGroupViewController *)self editingGestureRecognizer];

  if (v5 == v4)
  {
    uint64_t v7 = [(UIActivityGroupViewController *)self activityGroupViewLayout];
    uint64_t v8 = [v7 indexPathForItemRecognizedByGesture:v4];

    uint64_t v9 = [(UIActivityGroupViewController *)self activityForItemAtIndexPath:v8];
    uint64_t v10 = [(UIActivityGroupViewController *)self userDefaultsActivity];
    if (v9 == (void *)v10)
    {
      BOOL v6 = 0;
      long long v14 = v9;
    }
    else
    {
      id v11 = (void *)v10;
      int v12 = [v9 activityType];
      char v13 = [v12 isEqualToString:@"com.apple.UIKit.activity.AirDrop"];

      if (v13)
      {
        BOOL v6 = 0;
LABEL_12:

        goto LABEL_13;
      }
      id v15 = [(UIActivityGroupViewController *)self collectionView];
      long long v14 = [v15 cellForItemAtIndexPath:v8];

      BOOL v6 = ([v14 isHighlighted] & 1) != 0 || objc_msgSend(v14, "isSelected");
    }

    goto LABEL_12;
  }
  BOOL v6 = 1;
LABEL_13:

  return v6;
}

- (void)handleEditingGesture:(id)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 state] == 1)
  {
    [(UIActivityGroupViewController *)self setIndexPathForMenuActivity:0];
    [(UIActivityGroupViewController *)self setActivityIndexDidChangeWhileDragging:0];
    [(UIActivityGroupViewController *)self becomeFirstResponder];
    [(UIActivityGroupViewController *)self setEditing:1 animated:1];
  }
  if ([v4 state] == 3 || objc_msgSend(v4, "state") == 4 || objc_msgSend(v4, "state") == 5)
  {
    [(UIActivityGroupViewController *)self setEditing:0 animated:1];
    if (!-[UIActivityGroupViewController activityIndexDidChangeWhileDragging](self, "activityIndexDidChangeWhileDragging")&& [v4 state] == 3)
    {
      id v5 = [(UIActivityGroupViewController *)self activityGroupViewLayout];
      BOOL v6 = [v5 indexPathForItemRecognizedByGesture:v4];

      uint64_t v7 = [(UIActivityGroupViewController *)self activityForItemAtIndexPath:v6];
      uint64_t v8 = [(UIActivityGroupViewController *)self userDefaults];
      int v9 = [v8 canHideActivity:v7];

      if (v9)
      {
        [(UIActivityGroupViewController *)self setIndexPathForMenuActivity:v6];
        if (v6)
        {
          uint64_t v10 = [(UIActivityGroupViewController *)self collectionView];
          id v11 = [v10 layoutAttributesForItemAtIndexPath:v6];
          [v11 frame];
          CGFloat v13 = v12;
          CGFloat v15 = v14;
          CGFloat v17 = v16;
          CGFloat v19 = v18;

          v32.origin.double x = v13;
          v32.origin.double y = v15;
          v32.size.double width = v17;
          v32.size.double height = v19;
          CGRect v33 = CGRectInset(v32, 5.0, 5.0);
          double x = v33.origin.x;
          double y = v33.origin.y;
          double width = v33.size.width;
          double height = v33.size.height;
          v24 = [MEMORY[0x1E4FB1978] sharedMenuController];
          id v25 = objc_alloc(MEMORY[0x1E4FB1990]);
          uint64_t v26 = _ShareSheetBundle();
          uint64_t v27 = [v26 localizedStringForKey:@"Hide" value:@"Hide" table:@"Localizable"];
          v28 = (void *)[v25 initWithTitle:v27 action:sel__performHideActivityForMenuController_];
          v31[0] = v28;
          v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];

          [v24 setMenuItems:v29];
          v30 = [(UIActivityGroupViewController *)self collectionView];
          objc_msgSend(v24, "showMenuFromView:rect:", v30, x, y, width, height);
        }
      }
    }
  }
}

- (void)_dismissPresentedMenuControllers
{
  int v9 = [MEMORY[0x1E4FB1978] sharedMenuController];
  uint64_t v3 = [v9 isMenuVisible];
  id v4 = v9;
  if (v3)
  {
    id v5 = [v9 menuItems];
    if ([v5 count] == 1)
    {
      BOOL v6 = [v5 firstObject];
      uint64_t v7 = (char *)[v6 action];

      if (v7 == sel__performHideActivityForMenuController_)
      {
        uint64_t v8 = [(UIActivityGroupViewController *)self collectionView];
        [v9 hideMenuFromView:v8];
      }
    }

    id v4 = v9;
  }
  MEMORY[0x1F41817F8](v3, v4);
}

- (id)targetIndexPathForMoveFromRowAtIndexPath:(id)a3 toProposedIndexPath:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(UIActivityGroupViewController *)self activityForItemAtIndexPath:v5];
  if (!v6)
  {
    double v12 = 0;
    goto LABEL_10;
  }
  uint64_t v7 = [(UIActivityGroupViewController *)self userDefaultsActivity];

  if (v6 == v7)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v11 = [v5 item] - 1;
  }
  else
  {
    uint64_t v8 = [v6 activityType];
    int v9 = [v8 isEqualToString:@"com.apple.UIKit.activity.AirDrop"];

    if (!v9)
    {
      id v13 = v5;
      goto LABEL_9;
    }
    uint64_t v10 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v11 = [v5 item] + 1;
  }
  objc_msgSend(v10, "indexPathForItem:inSection:", v11, objc_msgSend(v5, "section"));
  id v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
  double v12 = v13;
LABEL_10:

  return v12;
}

- (id)collectionView:(id)a3 layout:(id)a4 moveItemAtIndexPath:(id)a5 toIndexPath:(id)a6
{
  id v8 = a5;
  int v9 = [(UIActivityGroupViewController *)self targetIndexPathForMoveFromRowAtIndexPath:v8 toProposedIndexPath:a6];
  if (v9)
  {
    uint64_t v10 = [(UIActivityGroupViewController *)self activityForItemAtIndexPath:v8];
    uint64_t v11 = [(UIActivityGroupViewController *)self activities];
    uint64_t v12 = [v11 indexOfObject:v10];

    id v13 = [(UIActivityGroupViewController *)self activityForItemAtIndexPath:v9];
    double v14 = [(UIActivityGroupViewController *)self activities];
    uint64_t v15 = [v14 indexOfObject:v13];

    double v16 = [(UIActivityGroupViewController *)self activities];
    CGFloat v17 = (NSArray *)[v16 mutableCopy];

    [(NSArray *)v17 removeObjectAtIndex:v12];
    [(NSArray *)v17 insertObject:v10 atIndex:v15];
    activities = self->_activities;
    self->_activities = v17;
    CGFloat v19 = v17;

    v20 = (void *)[(NSArray *)self->_visibleActivities mutableCopy];
    objc_msgSend(v20, "removeObjectAtIndex:", objc_msgSend(v8, "item"));
    objc_msgSend(v20, "insertObject:atIndex:", v10, objc_msgSend(v9, "item"));
    objc_storeStrong((id *)&self->_visibleActivities, v20);
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    uint64_t v26 = __87__UIActivityGroupViewController_collectionView_layout_moveItemAtIndexPath_toIndexPath___block_invoke;
    uint64_t v27 = &unk_1E5A215A0;
    v28 = self;
    id v29 = v20;
    id v21 = v20;
    [(UIActivityGroupViewController *)self ignoreUserDefaultsChangesWhileUsingBlock:&v24];
    -[UIActivityGroupViewController setActivityIndexDidChangeWhileDragging:](self, "setActivityIndexDidChangeWhileDragging:", 1, v24, v25, v26, v27, v28);
    id v22 = v9;
  }
  return v9;
}

void __87__UIActivityGroupViewController_collectionView_layout_moveItemAtIndexPath_toIndexPath___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userDefaults];
  [v2 updateUserActivityOrderWithOrderedPartialActivities:*(void *)(a1 + 40)];
}

- (id)collectionView:(id)a3 layout:(id)a4 needsContainerViewForDraggingItemAtIndexPath:(id)a5
{
  BOOL v6 = [(UIActivityGroupViewController *)self parentViewController];
  if (!v6) {
    BOOL v6 = self;
  }
  uint64_t v7 = [(UIActivityGroupViewController *)v6 view];

  return v7;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 preferredSizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [(UIActivityGroupViewController *)self traitCollection];
  id v8 = [(UIActivityGroupViewController *)self view];
  [v8 frame];
  double v10 = v9;
  uint64_t v11 = [v7 preferredContentSizeCategory];
  uint64_t v12 = [(UIActivityGroupViewController *)self activityForItemAtIndexPath:v6];

  id v13 = [(UIActivityGroupViewController *)self _titleTextForActivity:v12];
  [v7 displayScale];
  +[_UIActivityGroupActivityCell preferredSizeForSheetWidth:v11 sizeCategory:v13 titleLabelText:v10 screenScale:v14];
  double v16 = v15;
  double v18 = v17;

  double v19 = v16;
  double v20 = v18;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (void)hideItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__UIActivityGroupViewController_hideItemAtIndexPath___block_invoke;
  v6[3] = &unk_1E5A215A0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(UIActivityGroupViewController *)self ignoreUserDefaultsChangesWhileUsingBlock:v6];
}

void __53__UIActivityGroupViewController_hideItemAtIndexPath___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) activityForItemAtIndexPath:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) userDefaults];
  [v2 setActivity:v3 asHidden:1];

  [*(id *)(a1 + 32) _updateVisibleActivitiesAnimated:1];
}

- (void)registerForActivityUserDefaultsChanges
{
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v3 = [(UIActivityGroupViewController *)self userDefaults];
  [v4 addObserver:self selector:sel_activityUserDefaultsDidChange_ name:@"_UIActivityUserDefaultsDidChangeNotification" object:v3];
}

- (void)unregisterForActivityUserDefaultsChanges
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"_UIActivityUserDefaultsDidChangeNotification" object:0];
}

- (void)ignoreUserDefaultsChangesWhileUsingBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  [(UIActivityGroupViewController *)self unregisterForActivityUserDefaultsChanges];
  v4[2](v4);

  [(UIActivityGroupViewController *)self registerForActivityUserDefaultsChanges];
}

- (void)activityUserDefaultsDidChange:(id)a3
{
  id v4 = [(UIActivityGroupViewController *)self userDefaults];
  id v5 = [(UIActivityGroupViewController *)self activities];
  id v9 = [v4 activitiesOrderedByUserActivityOrderForActivities:v5];

  id v6 = [(UIActivityGroupViewController *)self userDefaultsActivity];
  [v6 setAvailableActivities:v9];

  id v7 = [(UIActivityGroupViewController *)self presentedViewController];
  BOOL v8 = v7 == 0;

  [(UIActivityGroupViewController *)self _setActivities:v9 animated:v8];
}

- (void)registerClassForContentSizeCategoryChanges
{
  if (registerClassForContentSizeCategoryChanges_onceToken != -1) {
    dispatch_once(&registerClassForContentSizeCategoryChanges_onceToken, &__block_literal_global_53);
  }
}

void __75__UIActivityGroupViewController_registerClassForContentSizeCategoryChanges__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 addObserver:objc_opt_class() selector:sel_invalidatePreferredSizes name:*MEMORY[0x1E4FB27A8] object:0];
}

- (UIActivityGroupViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIActivityGroupViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)activityCategory
{
  return self->_activityCategory;
}

- (void)setActivityCategory:(int64_t)a3
{
  self->_activityCategordouble y = a3;
}

- (NSArray)activities
{
  return self->_activities;
}

- (BOOL)hasActivities
{
  return self->_hasActivities;
}

- (void)setHasActivities:(BOOL)a3
{
  self->_BOOL hasActivities = a3;
}

- (NSArray)visibleActivities
{
  return self->_visibleActivities;
}

- (void)setVisibleActivities:(id)a3
{
}

- (_UIActivityUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (_UIUserDefaultsActivity)userDefaultsActivity
{
  return self->_userDefaultsActivity;
}

- (void)setUserDefaultsActivity:(id)a3
{
}

- (UILongPressGestureRecognizer)editingGestureRecognizer
{
  return self->_editingGestureRecognizer;
}

- (void)setEditingGestureRecognizer:(id)a3
{
}

- (CGPoint)initialDraggingLocation
{
  double x = self->_initialDraggingLocation.x;
  double y = self->_initialDraggingLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialDraggingLocation:(CGPoint)a3
{
  self->_initialDraggingLocation = a3;
}

- (BOOL)activityIndexDidChangeWhileDragging
{
  return self->_activityIndexDidChangeWhileDragging;
}

- (void)setActivityIndexDidChangeWhileDragging:(BOOL)a3
{
  self->_activityIndexDidChangeWhileDragging = a3;
}

- (NSIndexPath)indexPathForMenuActivity
{
  return self->_indexPathForMenuActivity;
}

- (void)setIndexPathForMenuActivity:(id)a3
{
}

- (BOOL)allowsUserCustomization
{
  return self->_allowsUserCustomization;
}

- (void)setAllowsUserCustomization:(BOOL)a3
{
  self->_allowsUserCustomization = a3;
}

- (NSArray)visibleActivityProxies
{
  return self->_visibleActivityProxies;
}

- (void)setVisibleActivityProxies:(id)a3
{
}

- (BOOL)isEmbedded
{
  return self->_embedded;
}

- (void)setEmbedded:(BOOL)a3
{
  self->_embedded = a3;
}

- (BOOL)isPicker
{
  return self->_picker;
}

- (void)setPicker:(BOOL)a3
{
  self->_picker = a3;
}

- (UIEdgeInsets)externalSafeInset
{
  double top = self->_externalSafeInset.top;
  double left = self->_externalSafeInset.left;
  double bottom = self->_externalSafeInset.bottom;
  double right = self->_externalSafeInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIActivityGroupViewControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (UIActivityGroupViewControllerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_visibleActivityProxies, 0);
  objc_storeStrong((id *)&self->_indexPathForMenuActivity, 0);
  objc_storeStrong((id *)&self->_editingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_userDefaultsActivity, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_visibleActivities, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end