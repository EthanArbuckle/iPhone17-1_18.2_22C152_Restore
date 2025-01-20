@interface UIRecentsInputViewController
- (BOOL)canManageList;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (NSLayoutConstraint)heightConstraint;
- (NSLayoutConstraint)widthConstraint;
- (NSString)clearAllString;
- (NSString)enterNewString;
- (NSString)previouslyUsedString;
- (UILexicon)recentInputs;
- (UIRecentsInputViewControllerDelegate)recentInputDelegate;
- (UIView)customHeaderView;
- (UIView)headerContainerView;
- (UIView)headerView;
- (UIViewController)headerContainerViewController;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)indexPathForPreferredFocusedViewInTableView:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)containingEffectStyle;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_delete:(id)a3;
- (void)_overrideTraitCollectionForHeaderViewController;
- (void)didSelectButtonAtIndexPath:(id)a3;
- (void)ensureConstraints;
- (void)scrollViewDidChangeContentSize:(id)a3;
- (void)setCanManageList:(BOOL)a3;
- (void)setClearAllString:(id)a3;
- (void)setContainingEffectStyle:(int64_t)a3;
- (void)setCustomHeaderView:(id)a3;
- (void)setEnterNewString:(id)a3;
- (void)setHeaderContainerView:(id)a3;
- (void)setHeaderContainerViewController:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setPreviouslyUsedString:(id)a3;
- (void)setRecentInputDelegate:(id)a3;
- (void)setRecentInputs:(id)a3;
- (void)setWidthConstraint:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateTableViewWidth;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation UIRecentsInputViewController

- (void)didSelectButtonAtIndexPath:(id)a3
{
  id v11 = a3;
  v4 = +[UIKeyboardImpl sharedInstance];
  if ([v11 section])
  {
    if (-[UIRecentsInputViewController canManageList](self, "canManageList") && ![v11 row])
    {
      [v4 clearRecentInput];
      [(UIRecentsInputViewController *)self setRecentInputs:0];
    }
    if (-[UIRecentsInputViewController canManageList](self, "canManageList") && [v11 row] == 1
      || !-[UIRecentsInputViewController canManageList](self, "canManageList") && ![v11 row])
    {
      v5 = +[_UIStatistics recentsInputViewNewEntryCount];
      [v5 incrementValueBy:1];
    }
    v6 = [(UIRecentsInputViewController *)self recentInputDelegate];
    [v6 switchToKeyboard];
  }
  else
  {
    v7 = [(UILexicon *)self->_recentInputs entries];
    v8 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v11, "row"));
    v6 = [v8 userInput];

    [v4 handleClearWithInsertBeforeAdvance:v6];
    v9 = [(UIRecentsInputViewController *)self recentInputDelegate];
    [v9 didSelectRecentInput];

    v10 = +[_UIStatistics recentsInputViewItemSelectedCount];
    [v10 incrementValueBy:1];
  }
}

- (void)ensureConstraints
{
  id v14 = [MEMORY[0x1E4F1CA48] array];
  v3 = [(UIRecentsInputViewController *)self widthConstraint];

  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E4F5B268];
    v5 = [(UITableViewController *)self tableView];
    v6 = [v4 constraintWithItem:v5 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:0.0];
    [(UIRecentsInputViewController *)self setWidthConstraint:v6];

    v7 = [(UIRecentsInputViewController *)self widthConstraint];
    [v14 addObject:v7];
  }
  v8 = [(UIRecentsInputViewController *)self heightConstraint];

  if (!v8)
  {
    v9 = (void *)MEMORY[0x1E4F5B268];
    v10 = [(UITableViewController *)self tableView];
    id v11 = [v9 constraintWithItem:v10 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:0.0];
    [(UIRecentsInputViewController *)self setHeightConstraint:v11];

    v12 = [(UIRecentsInputViewController *)self heightConstraint];
    [v14 addObject:v12];
  }
  v13 = [(UITableViewController *)self tableView];
  [v13 addConstraints:v14];
}

- (void)updateTableViewWidth
{
  v33[1] = *MEMORY[0x1E4F143B8];
  [(UIRecentsInputViewController *)self ensureConstraints];
  uint64_t v32 = *(void *)off_1E52D2040;
  v3 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleHeadline"];
  v33[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];

  uint64_t v28 = 0;
  v29 = (double *)&v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  v5 = [(UILexicon *)self->_recentInputs entries];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __52__UIRecentsInputViewController_updateTableViewWidth__block_invoke;
  v25[3] = &unk_1E52F3CA0;
  id v6 = v4;
  id v26 = v6;
  v27 = &v28;
  [v5 enumerateObjectsUsingBlock:v25];

  v7 = [(UIRecentsInputViewController *)self previouslyUsedString];
  [v7 sizeWithAttributes:v6];
  double v9 = v8;

  if (v9 > v29[3]) {
    v29[3] = v9;
  }
  v10 = [(UIRecentsInputViewController *)self clearAllString];
  [v10 sizeWithAttributes:v6];
  double v12 = v11;

  if (v12 > v29[3]) {
    v29[3] = v12;
  }
  v13 = [(UIRecentsInputViewController *)self enterNewString];
  [v13 sizeWithAttributes:v6];
  double v15 = v14;

  v16 = v29;
  double v17 = v29[3];
  if (v15 > v17)
  {
    v29[3] = v15;
    double v17 = v15;
  }
  v16[3] = v17 + 80.0;
  v18 = [(UITableViewController *)self tableView];
  [v18 layoutMargins];
  double v20 = v19;
  double v22 = v21;

  if (v20 + v22 + v29[3] <= 960.0) {
    double v23 = v20 + v22 + v29[3];
  }
  else {
    double v23 = 960.0;
  }
  v29[3] = v23;
  v24 = [(UIRecentsInputViewController *)self widthConstraint];
  [v24 setConstant:v23];

  _Block_object_dispose(&v28, 8);
}

void __52__UIRecentsInputViewController_updateTableViewWidth__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 userInput];
  [v3 sizeWithAttributes:*(void *)(a1 + 32)];
  double v5 = v4;

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v5 > *(double *)(v6 + 24)) {
    *(double *)(v6 + 24) = v5;
  }
}

- (void)setRecentInputs:(id)a3
{
  id v11 = a3;
  objc_storeStrong((id *)&self->_recentInputs, a3);
  double v5 = +[_UIStatistics recentsInputViewNumberOfItems];
  uint64_t v6 = [(UILexicon *)self->_recentInputs entries];
  objc_msgSend(v5, "recordDistributionValue:", (double)(unint64_t)objc_msgSend(v6, "count"));

  [(UIRecentsInputViewController *)self updateTableViewWidth];
  v7 = [(UITableViewController *)self tableView];
  [v7 reloadData];

  double v8 = [v11 entries];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    v10 = [(UIRecentsInputViewController *)self recentInputDelegate];
    [v10 switchToKeyboard];
  }
}

- (void)viewDidLoad
{
  v58[4] = *MEMORY[0x1E4F143B8];
  v57.receiver = self;
  v57.super_class = (Class)UIRecentsInputViewController;
  [(UIViewController *)&v57 viewDidLoad];
  [(UIRecentsInputViewController *)self ensureConstraints];
  if ([(UIRecentsInputViewController *)self canManageList])
  {
    v3 = [(UIRecentsInputViewController *)self clearAllString];

    if (!v3)
    {
      double v4 = _UINSLocalizedStringWithDefaultValue(@"Clear All", @"Clear All");
      [(UIRecentsInputViewController *)self setClearAllString:v4];
    }
  }
  double v5 = [(UIRecentsInputViewController *)self enterNewString];

  if (!v5)
  {
    uint64_t v6 = _UINSLocalizedStringWithDefaultValue(@"Enter New…", @"Enter New…");
    [(UIRecentsInputViewController *)self setEnterNewString:v6];
  }
  v7 = [(UIRecentsInputViewController *)self previouslyUsedString];

  if (!v7)
  {
    double v8 = _UINSLocalizedStringWithDefaultValue(@"Previously-Used Emails", @"Previously-Used Emails");
    [(UIRecentsInputViewController *)self setPreviouslyUsedString:v8];
  }
  uint64_t v9 = [(UITableViewController *)self tableView];
  [v9 setMaskView:0];

  v10 = [(UITableViewController *)self tableView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v11 = [(UITableViewController *)self tableView];
  [v11 registerClass:objc_opt_class() forCellReuseIdentifier:@"recentInputCell"];

  double v12 = [(UIRecentsInputViewController *)self customHeaderView];

  if (v12)
  {
    v13 = [(UIRecentsInputViewController *)self customHeaderView];
    [(UIRecentsInputViewController *)self setHeaderView:v13];
  }
  else
  {
    double v14 = objc_alloc_init(_UIRecentsAccessoryDefaultView);
    [(UIRecentsInputViewController *)self setHeaderView:v14];

    double v15 = [(UIRecentsInputViewController *)self previouslyUsedString];
    v16 = [(UIRecentsInputViewController *)self headerView];
    double v17 = [v16 titleLabel];
    [v17 setText:v15];

    v13 = [(UIRecentsInputViewController *)self headerView];
    [v13 intrinsicContentSize];
    double v19 = v18;
    double v20 = [(UIRecentsInputViewController *)self headerView];
    [v20 intrinsicContentSize];
    double v22 = v21;
    double v23 = [(UIRecentsInputViewController *)self headerView];
    objc_msgSend(v23, "setFrame:", 0.0, 0.0, v19, v22);
  }
  v24 = [(UIRecentsInputViewController *)self headerView];
  [v24 frame];
  double v26 = v25;
  double v28 = v27;

  v29 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, v26, v28);
  [(UIRecentsInputViewController *)self setHeaderContainerView:v29];

  uint64_t v30 = [(UIRecentsInputViewController *)self headerContainerView];
  [v30 setClipsToBounds:0];

  uint64_t v31 = objc_alloc_init(UIViewController);
  uint64_t v32 = [(UIRecentsInputViewController *)self headerContainerView];
  [(UIViewController *)v31 setView:v32];

  [(UIRecentsInputViewController *)self setHeaderContainerViewController:v31];
  v33 = [(UIRecentsInputViewController *)self headerContainerViewController];
  [(UIViewController *)self addChildViewController:v33];

  v34 = [(UIRecentsInputViewController *)self headerContainerViewController];
  v35 = [v34 view];
  v36 = [(UITableViewController *)self tableView];
  [v36 setTableHeaderView:v35];

  v37 = [(UIRecentsInputViewController *)self headerContainerViewController];
  [v37 didMoveToParentViewController:self];

  v38 = [(UIRecentsInputViewController *)self headerView];
  [v38 setTranslatesAutoresizingMaskIntoConstraints:0];

  v39 = [(UIRecentsInputViewController *)self headerContainerView];
  v40 = [(UIRecentsInputViewController *)self headerView];
  [v39 addSubview:v40];

  v41 = (void *)MEMORY[0x1E4F5B268];
  v42 = [(UIRecentsInputViewController *)self headerView];
  v43 = [(UIRecentsInputViewController *)self headerContainerView];
  v44 = [v41 constraintWithItem:v42 attribute:9 relatedBy:0 toItem:v43 attribute:9 multiplier:1.0 constant:0.0];

  v45 = (void *)MEMORY[0x1E4F5B268];
  v46 = [(UIRecentsInputViewController *)self headerView];
  v47 = [(UIRecentsInputViewController *)self headerContainerView];
  v48 = [v45 constraintWithItem:v46 attribute:4 relatedBy:0 toItem:v47 attribute:4 multiplier:1.0 constant:0.0];

  v49 = (void *)MEMORY[0x1E4F5B268];
  v50 = [(UIRecentsInputViewController *)self headerView];
  v51 = [v49 constraintWithItem:v50 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:v26];

  v52 = (void *)MEMORY[0x1E4F5B268];
  v53 = [(UIRecentsInputViewController *)self headerView];
  v54 = [v52 constraintWithItem:v53 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:v28];

  v55 = (void *)MEMORY[0x1E4F5B268];
  v58[0] = v44;
  v58[1] = v48;
  v58[2] = v51;
  v58[3] = v54;
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:4];
  [v55 activateConstraints:v56];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIRecentsInputViewController *)self _overrideTraitCollectionForHeaderViewController];
  v5.receiver = self;
  v5.super_class = (Class)UIRecentsInputViewController;
  [(UITableViewController *)&v5 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIRecentsInputViewController;
  [(UITableViewController *)&v4 viewDidAppear:a3];
  BOOL v3 = +[_UIStatistics recentsInputViewPresentationCount];
  [v3 incrementValueBy:1];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    if ([(UIRecentsInputViewController *)self canManageList]) {
      int64_t v9 = 2;
    }
    else {
      int64_t v9 = 1;
    }
  }
  else if (a4)
  {
    int64_t v9 = 0;
  }
  else
  {
    v7 = [(UIRecentsInputViewController *)self recentInputs];
    double v8 = [v7 entries];
    int64_t v9 = [v8 count];
  }
  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"recentInputCell" forIndexPath:v6];
  [v7 setFocusStyle:1];
  double v8 = [(UIRecentsInputViewController *)self recentInputDelegate];
  int64_t v9 = [v8 textInputTraits];
  [v7 setTextInputTraits:v9];

  if ([v6 section])
  {
    if ([v6 section] != 1) {
      goto LABEL_16;
    }
    BOOL v10 = [(UIRecentsInputViewController *)self canManageList];
    uint64_t v11 = [v6 row];
    if (v10)
    {
      if (!v11)
      {
        uint64_t v17 = [(UIRecentsInputViewController *)self clearAllString];
LABEL_14:
        double v15 = (void *)v17;
        if (!v17) {
          goto LABEL_16;
        }
        goto LABEL_15;
      }
      if ([v6 row] != 1) {
        goto LABEL_16;
      }
    }
    else if (v11)
    {
      goto LABEL_16;
    }
    uint64_t v17 = [(UIRecentsInputViewController *)self enterNewString];
    goto LABEL_14;
  }
  double v12 = [(UIRecentsInputViewController *)self recentInputs];
  v13 = [v12 entries];
  double v14 = objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v6, "row"));
  double v15 = [v14 userInput];

  if ([(UIRecentsInputViewController *)self canManageList])
  {
    v16 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:sel__delete_];
    [(UILongPressGestureRecognizer *)v16 setMinimumPressDuration:2.0];
    [v7 addGestureRecognizer:v16];
  }
  if (v15)
  {
LABEL_15:
    objc_msgSend(v7, "setInputText:withBlurStyle:", v15, -[UIRecentsInputViewController containingEffectStyle](self, "containingEffectStyle"));
  }
LABEL_16:

  return v7;
}

- (id)indexPathForPreferredFocusedViewInTableView:(id)a3
{
  return (id)[MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result = 22.0;
  if (!a4) {
    return 16.0;
  }
  return result;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return @" ";
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)scrollViewDidChangeContentSize:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 window];
  [v5 bounds];
  double v7 = v6;

  [v4 contentSize];
  double v9 = v8;

  if (v9 <= v7) {
    double v7 = v9;
  }
  id v10 = [(UIRecentsInputViewController *)self heightConstraint];
  [v10 setConstant:v7];
}

- (void)_delete:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1)
  {
    objc_super v5 = [v4 view];
    double v6 = [v5 floatingLabel];
    double v7 = [v6 text];

    double v8 = +[UIAlertController alertControllerWithTitle:v7 message:0 preferredStyle:0];
    objc_initWeak(&location, self);
    double v9 = _UINSLocalizedStringWithDefaultValue(@"Delete", @"Delete");
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __40__UIRecentsInputViewController__delete___block_invoke;
    v14[3] = &unk_1E52F3CF0;
    objc_copyWeak(&v16, &location);
    id v10 = v7;
    id v15 = v10;
    uint64_t v11 = +[UIAlertAction actionWithTitle:v9 style:2 handler:v14];

    [v8 addAction:v11];
    double v12 = _UINSLocalizedStringWithDefaultValue(@"Cancel", @"Cancel");
    v13 = +[UIAlertAction actionWithTitle:v12 style:1 handler:&__block_literal_global_317];

    [v8 addAction:v13];
    [(UIViewController *)self presentViewController:v8 animated:1 completion:&__block_literal_global_123_0];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __40__UIRecentsInputViewController__delete___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = +[UIKeyboardImpl sharedInstance];
  uint64_t v4 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__UIRecentsInputViewController__delete___block_invoke_2;
  v5[3] = &unk_1E52F3CC8;
  v5[4] = WeakRetained;
  [v3 removeRecentInput:v4 completionHandler:v5];
}

uint64_t __40__UIRecentsInputViewController__delete___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setRecentInputs:a2];
}

- (void)_overrideTraitCollectionForHeaderViewController
{
  BOOL v3 = [(UIRecentsInputViewController *)self recentInputDelegate];
  uint64_t v4 = [v3 textInputTraits];
  uint64_t v5 = [v4 keyboardAppearance];

  uint64_t v6 = 2;
  if (v5 != 1 && v5 != 9)
  {
    if (v5 != 2) {
      return;
    }
    uint64_t v6 = 1;
  }
  id v8 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:v6];
  double v7 = [(UIRecentsInputViewController *)self headerContainerViewController];
  [(UIViewController *)self setOverrideTraitCollection:v8 forChildViewController:v7];
}

- (UIRecentsInputViewControllerDelegate)recentInputDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recentInputDelegate);
  return (UIRecentsInputViewControllerDelegate *)WeakRetained;
}

- (void)setRecentInputDelegate:(id)a3
{
}

- (UILexicon)recentInputs
{
  return self->_recentInputs;
}

- (int64_t)containingEffectStyle
{
  return self->_containingEffectStyle;
}

- (void)setContainingEffectStyle:(int64_t)a3
{
  self->_containingEffectStyle = a3;
}

- (BOOL)canManageList
{
  return self->_canManageList;
}

- (void)setCanManageList:(BOOL)a3
{
  self->_canManageList = a3;
}

- (UIView)customHeaderView
{
  return self->_customHeaderView;
}

- (void)setCustomHeaderView:(id)a3
{
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (NSString)previouslyUsedString
{
  return self->_previouslyUsedString;
}

- (void)setPreviouslyUsedString:(id)a3
{
}

- (NSString)clearAllString
{
  return self->_clearAllString;
}

- (void)setClearAllString:(id)a3
{
}

- (NSString)enterNewString
{
  return self->_enterNewString;
}

- (void)setEnterNewString:(id)a3
{
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (UIView)headerContainerView
{
  return self->_headerContainerView;
}

- (void)setHeaderContainerView:(id)a3
{
}

- (UIViewController)headerContainerViewController
{
  return self->_headerContainerViewController;
}

- (void)setHeaderContainerViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerContainerViewController, 0);
  objc_storeStrong((id *)&self->_headerContainerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_enterNewString, 0);
  objc_storeStrong((id *)&self->_clearAllString, 0);
  objc_storeStrong((id *)&self->_previouslyUsedString, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_customHeaderView, 0);
  objc_storeStrong((id *)&self->_recentInputs, 0);
  objc_destroyWeak((id *)&self->_recentInputDelegate);
}

@end