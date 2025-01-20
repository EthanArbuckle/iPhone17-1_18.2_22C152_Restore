@interface SFPopoverSizingTableViewController
+ (UITableViewCell)tableViewCellForSizeEstimation;
+ (double)bottomContentPadding;
+ (double)caculateHeightForTableView:(id)a3 targetGlobalRow:(int64_t)a4 outGlobalRow:(int64_t *)a5;
+ (void)initialize;
- (BOOL)_needsTranslucentAppearanceUpdate;
- (BOOL)hasTranslucentAppearance;
- (CGSize)preferredContentSize;
- (id)_backgroundBlurEffect;
- (id)backgroundColorUsingTranslucentAppearance:(BOOL)a3;
- (int64_t)maximumNumberOfRows;
- (int64_t)minimumNumberOfRows;
- (void)_updateTranslucentAppearanceIfNeeded;
- (void)cancelKeyPressed;
- (void)didMoveToParentViewController:(id)a3;
- (void)setNeedsUpdatePreferredContentSize;
- (void)updatePreferredContentSize;
- (void)updateTranslucentAppearance;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SFPopoverSizingTableViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    v3 = (void *)estimatedRowHeightCache;
    estimatedRowHeightCache = v2;

    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v4 = *MEMORY[0x1E4FB27A8];
    v5 = [MEMORY[0x1E4F28F08] mainQueue];
    uint64_t v6 = [v8 addObserverForName:v4 object:0 queue:v5 usingBlock:&__block_literal_global_44];
    v7 = (void *)estimatedRowHeightCacheInvalidationToken;
    estimatedRowHeightCacheInvalidationToken = v6;
  }
}

uint64_t __48__SFPopoverSizingTableViewController_initialize__block_invoke()
{
  return [(id)estimatedRowHeightCache removeAllObjects];
}

+ (double)bottomContentPadding
{
  return 12.0;
}

+ (UITableViewCell)tableViewCellForSizeEstimation
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:0];
  v3 = [v2 textLabel];
  [v3 setText:@"A"];

  return (UITableViewCell *)v2;
}

- (int64_t)minimumNumberOfRows
{
  return 5;
}

- (int64_t)maximumNumberOfRows
{
  return 12;
}

+ (double)caculateHeightForTableView:(id)a3 targetGlobalRow:(int64_t)a4 outGlobalRow:(int64_t *)a5
{
  id v7 = a3;
  uint64_t v8 = [v7 numberOfSections];
  if ([v7 style])
  {
    double MaxY = 0.0;
    if (v8 >= 1)
    {
      uint64_t v10 = 0;
      int64_t v11 = 0;
      do
      {
        v11 += [v7 numberOfRowsInSection:v10++];
        BOOL v12 = v11 <= a4 && v10 < v8;
      }
      while (v12);
      if (v11)
      {
        if (v11 - 1 >= a4) {
          int64_t v13 = a4;
        }
        else {
          int64_t v13 = v11 - 1;
        }
        if (a5) {
          *a5 = v13;
        }
        if (v11 - 1 <= a4)
        {
          if (v8 == v10)
          {
            objc_msgSend(v7, "_contentSize", v13);
            double MaxY = v27;
          }
          else
          {
            [v7 rectForFooterInSection:v10 - 1];
            double MaxY = CGRectGetMaxY(v38) + 20.0;
          }
        }
        else
        {
          v14 = [v7 indexPathForRowAtGlobalRow:v13];
          [v7 rectForRowAtIndexPath:v14];
          double MaxY = CGRectGetMaxY(v33);
        }
      }
    }
  }
  else if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a5)
    {
      if ([v7 numberOfSections] < 1)
      {
        int64_t v15 = 0;
      }
      else
      {
        int64_t v15 = 0;
        uint64_t v16 = 0;
        do
          v15 += [v7 numberOfRowsInSection:v16++];
        while (v16 < [v7 numberOfSections]);
      }
      *a5 = v15;
    }
    [v7 contentSize];
    double v30 = v29;
    [(id)objc_opt_class() bottomContentPadding];
    double MaxY = v30 + v31;
  }
  else if ([v7 numberOfSections] < 1)
  {
    int64_t v17 = 0;
    double MaxY = 0.0;
LABEL_40:
    if (a5) {
      *a5 = v17;
    }
  }
  else
  {
    int64_t v17 = 0;
    uint64_t v18 = 0;
    double MaxY = 0.0;
    while (1)
    {
      [v7 rectForHeaderInSection:v18];
      CGFloat Height = CGRectGetHeight(v34);
      double v20 = Height + 22.0;
      BOOL v12 = Height <= 0.0;
      double v21 = -0.0;
      if (!v12) {
        double v21 = v20;
      }
      double v22 = MaxY + v21;
      [v7 rectForFooterInSection:v18];
      double MaxY = CGRectGetHeight(v35) + v22;
      uint64_t v23 = [v7 numberOfRowsInSection:v18];
      if (v23 >= 1) {
        break;
      }
LABEL_30:
      if (++v18 >= [v7 numberOfSections]) {
        goto LABEL_40;
      }
    }
    uint64_t v24 = v23;
    uint64_t v25 = 0;
    while (1)
    {
      v26 = [MEMORY[0x1E4F28D58] indexPathForRow:v25 inSection:v18];
      [v7 rectForRowAtIndexPath:v26];
      double MaxY = MaxY + CGRectGetHeight(v36);
      if (a4 - 1 == v17) {
        break;
      }

      ++v25;
      ++v17;
      if (v24 == v25) {
        goto LABEL_30;
      }
    }
    if (v25 + 1 < v24)
    {
      v28 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:");
      [v7 rectForRowAtIndexPath:v28];
      double MaxY = MaxY + CGRectGetHeight(v37) * 0.5;
    }
    if (a5) {
      *a5 = a4;
    }
  }
  return MaxY;
}

- (CGSize)preferredContentSize
{
  int64_t v3 = [(SFPopoverSizingTableViewController *)self maximumNumberOfRows];
  int64_t v4 = v3;
  if (v3 >= [(SFPopoverSizingTableViewController *)self minimumNumberOfRows]) {
    int64_t v4 = [(SFPopoverSizingTableViewController *)self minimumNumberOfRows];
  }
  v5 = [(SFPopoverSizingTableViewController *)self tableView];
  uint64_t v18 = -1;
  +[SFPopoverSizingTableViewController caculateHeightForTableView:v5 targetGlobalRow:v3 outGlobalRow:&v18];
  double v7 = v6;
  uint64_t v8 = v4 - v18;
  if (v4 > v18)
  {
    v9 = objc_opt_class();
    uint64_t v10 = [(id)estimatedRowHeightCache objectForKey:v9];
    if (!v10)
    {
      int64_t v11 = [v9 tableViewCellForSizeEstimation];
      BOOL v12 = NSNumber;
      objc_msgSend(v11, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
      uint64_t v10 = [v12 numberWithDouble:v13];
      [(id)estimatedRowHeightCache setObject:v10 forKey:v9];
    }
    [v10 doubleValue];
    double v15 = v14;

    double v7 = v7 + v15 * (double)v8;
  }
  if (![v5 style]) {
    double v7 = v7 - _SFOnePixel();
  }

  double v16 = 0.0;
  double v17 = v7;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)updatePreferredContentSize
{
  [(SFPopoverSizingTableViewController *)self preferredContentSize];

  -[SFPopoverSizingTableViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)viewDidLoad
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)SFPopoverSizingTableViewController;
  [(SFPopoverSizingTableViewController *)&v5 viewDidLoad];
  v6[0] = objc_opt_class();
  int64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  id v4 = (id)[(SFPopoverSizingTableViewController *)self registerForTraitChanges:v3 withTarget:self action:sel_setNeedsUpdatePreferredContentSize];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFPopoverSizingTableViewController;
  [(SFPopoverSizingTableViewController *)&v4 viewWillAppear:a3];
  [(SFPopoverSizingTableViewController *)self _updateTranslucentAppearanceIfNeeded];
  [(SFPopoverSizingTableViewController *)self updatePreferredContentSize];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFPopoverSizingTableViewController;
  [(SFPopoverSizingTableViewController *)&v4 viewDidAppear:a3];
  [(SFPopoverSizingTableViewController *)self _updateTranslucentAppearanceIfNeeded];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SFPopoverSizingTableViewController;
  id v6 = a4;
  [(SFPopoverSizingTableViewController *)&v8 willTransitionToTraitCollection:a3 withTransitionCoordinator:v6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __96__SFPopoverSizingTableViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v7[3] = &unk_1E54EC740;
  v7[4] = self;
  [v6 animateAlongsideTransition:v7 completion:0];
}

uint64_t __96__SFPopoverSizingTableViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTranslucentAppearanceIfNeeded];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SFPopoverSizingTableViewController;
  id v7 = a4;
  -[SFPopoverSizingTableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__SFPopoverSizingTableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E54EC740;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

uint64_t __89__SFPopoverSizingTableViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTranslucentAppearanceIfNeeded];
}

- (void)willMoveToParentViewController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SFPopoverSizingTableViewController;
  -[SFPopoverSizingTableViewController willMoveToParentViewController:](&v7, sel_willMoveToParentViewController_);
  int v5 = [(SFPopoverSizingTableViewController *)self _isInPopoverPresentation];
  if (a3)
  {
    if (v5)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __69__SFPopoverSizingTableViewController_willMoveToParentViewController___block_invoke;
      block[3] = &unk_1E54E9858;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __69__SFPopoverSizingTableViewController_willMoveToParentViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTranslucentAppearanceIfNeeded];
}

- (void)didMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFPopoverSizingTableViewController;
  -[SFPopoverSizingTableViewController didMoveToParentViewController:](&v5, sel_didMoveToParentViewController_);
  if (a3) {
    [(SFPopoverSizingTableViewController *)self updatePreferredContentSize];
  }
}

- (void)setNeedsUpdatePreferredContentSize
{
  self->_updatePreferredContentSizeAfterNextLayout = 1;
}

- (void)viewDidLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)SFPopoverSizingTableViewController;
  [(SFPopoverSizingTableViewController *)&v12 viewDidLayoutSubviews];
  if (self->_updatePreferredContentSizeAfterNextLayout)
  {
    self->_updatePreferredContentSizeAfterNextLayout = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__SFPopoverSizingTableViewController_viewDidLayoutSubviews__block_invoke;
    v11[3] = &unk_1E54E9858;
    v11[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v11];
  }
  else
  {
    int64_t v3 = [(SFPopoverSizingTableViewController *)self tableView];
    [v3 contentSize];
    double v5 = v4;
    double v7 = v6;

    if (self->_lastLayoutContentSize.width != v5 || self->_lastLayoutContentSize.height != v7)
    {
      self->_lastLayoutContentSize.double width = v5;
      self->_lastLayoutContentSize.double height = v7;
      objc_super v9 = (void *)*MEMORY[0x1E4FB2608];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __59__SFPopoverSizingTableViewController_viewDidLayoutSubviews__block_invoke_2;
      v10[3] = &unk_1E54E9858;
      v10[4] = self;
      [v9 _performBlockAfterCATransactionCommits:v10];
    }
  }
}

uint64_t __59__SFPopoverSizingTableViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updatePreferredContentSize];
}

uint64_t __59__SFPopoverSizingTableViewController_viewDidLayoutSubviews__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updatePreferredContentSize];
}

- (void)_updateTranslucentAppearanceIfNeeded
{
  if ([(SFPopoverSizingTableViewController *)self _needsTranslucentAppearanceUpdate])
  {
    [(SFPopoverSizingTableViewController *)self updateTranslucentAppearance];
  }
}

- (BOOL)_needsTranslucentAppearanceUpdate
{
  if (!self->_didUpdateTranslucentAppearanceAtLeastOnce) {
    return 1;
  }
  BOOL didHaveTranslucentAppearance = self->_didHaveTranslucentAppearance;
  if (didHaveTranslucentAppearance != [(SFPopoverSizingTableViewController *)self hasTranslucentAppearance])return 1; {
  double v4 = [(SFPopoverSizingTableViewController *)self _backgroundBlurEffect];
  }
  double v5 = v4;
  BOOL v6 = v4 != self->_backgroundBlurEffect && !-[UIBlurEffect isEqual:](v4, "isEqual:");

  return v6;
}

- (BOOL)hasTranslucentAppearance
{
  int v3 = [(SFPopoverSizingTableViewController *)self _isInPopoverPresentation];
  if (v3) {
    LOBYTE(v3) = ![(UIViewController *)self safari_isPresentedByActivityViewController];
  }
  return v3;
}

- (void)updateTranslucentAppearance
{
  self->_didUpdateTranslucentAppearanceAtLeastOnce = 1;
  id v8 = [(SFPopoverSizingTableViewController *)self tableView];
  BOOL v3 = [(SFPopoverSizingTableViewController *)self hasTranslucentAppearance];
  self->_BOOL didHaveTranslucentAppearance = v3;
  double v4 = [(SFPopoverSizingTableViewController *)self backgroundColorUsingTranslucentAppearance:v3];
  [v8 setBackgroundColor:v4];

  double v5 = [(SFPopoverSizingTableViewController *)self _backgroundBlurEffect];
  backgroundBlurEffect = self->_backgroundBlurEffect;
  self->_backgroundBlurEffect = v5;

  if (self->_backgroundBlurEffect)
  {
    double v7 = objc_msgSend(MEMORY[0x1E4FB1EA0], "effectForBlurEffect:");
    [v8 setSeparatorEffect:v7];
  }
  else
  {
    objc_msgSend(v8, "setSeparatorEffect:");
  }
  [v8 reloadData];
}

- (id)_backgroundBlurEffect
{
  BOOL v3 = [(SFPopoverSizingTableViewController *)self traitCollection];
  double v4 = objc_msgSend(v3, "sf_backgroundBlurEffect");

  if (v4)
  {
    id v5 = v4;
LABEL_3:
    BOOL v6 = v5;
    goto LABEL_9;
  }
  double v7 = [(SFPopoverSizingTableViewController *)self tableView];
  if ([v7 style])
  {
  }
  else
  {
    BOOL v8 = [(SFPopoverSizingTableViewController *)self hasTranslucentAppearance];

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E4FB14C8], "_sf_defaultPopoverBackgroundEffect");
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
  }
  BOOL v6 = 0;
LABEL_9:

  return v6;
}

- (id)backgroundColorUsingTranslucentAppearance:(BOOL)a3
{
  if (a3) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  BOOL v3 = [MEMORY[0x1E4FB1618] tableBackgroundColor];
  }

  return v3;
}

- (void)cancelKeyPressed
{
}

- (void).cxx_destruct
{
}

@end