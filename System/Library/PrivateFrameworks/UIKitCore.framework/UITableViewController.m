@interface UITableViewController
- (BOOL)_viewControllerWasSelected;
- (BOOL)clearsSelectionOnViewWillAppear;
- (BOOL)respondsToSelector:(SEL)a3;
- (UIRefreshControl)refreshControl;
- (UITableView)tableView;
- (UITableViewController)init;
- (UITableViewController)initWithCoder:(NSCoder *)coder;
- (UITableViewController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
- (UITableViewController)initWithStyle:(UITableViewStyle)style;
- (UITableViewDataSource)_staticDataSource;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_existingTableView;
- (id)previewViewControllerForLocation:(CGPoint)a3 inSourceView:(id)a4;
- (id)previewViewControllerForRowAtIndexPath:(id)a3;
- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)_filteredDataType;
- (int64_t)_resolvedDataSourceFilterTypeForScreen:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 indentationLevelForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_applyDefaultDataSourceToTable:(id)a3;
- (void)_limitedUIDidChange;
- (void)_refreshFilteredDataSourceFilterTypeForScreen:(id)a3;
- (void)_setFilteredDataType:(int64_t)a3;
- (void)_setStaticDataSource:(id)a3;
- (void)_willChangeToIdiom:(int64_t)a3 onScreen:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)loadView;
- (void)previewingContext:(id)a3 commitViewController:(id)a4;
- (void)setClearsSelectionOnViewWillAppear:(BOOL)clearsSelectionOnViewWillAppear;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setRefreshControl:(UIRefreshControl *)refreshControl;
- (void)setTableView:(UITableView *)tableView;
- (void)tableView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willPresentPreviewViewController:(id)a3 forLocation:(CGPoint)a4 inSourceView:(id)a5;
@end

@implementation UITableViewController

- (void)_willChangeToIdiom:(int64_t)a3 onScreen:(id)a4
{
}

- (BOOL)_viewControllerWasSelected
{
  v2 = [(UITableViewController *)self tableView];
  char v3 = [v2 _highlightFirstVisibleRowIfAppropriate];

  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UITableViewController;
  [(UIViewController *)&v5 viewDidAppear:a3];
  v4 = [(UITableViewController *)self tableView];
  [v4 flashScrollIndicators];
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (!self->_staticDataSource
    && (sel_tableView_titleForHeaderInSection_ != a3 ? (BOOL v4 = sel_tableView_titleForFooterInSection_ == a3) : (BOOL v4 = 1),
        !v4 ? (BOOL v5 = sel_tableView_heightForHeaderInSection_ == a3) : (BOOL v5 = 1),
        !v5 ? (BOOL v6 = sel_tableView_heightForFooterInSection_ == a3) : (BOOL v6 = 1),
        !v6 ? (BOOL v7 = sel_tableView_viewForHeaderInSection_ == a3) : (BOOL v7 = 1),
        !v7 ? (BOOL v8 = sel_tableView_viewForFooterInSection_ == a3) : (BOOL v8 = 1),
        !v8 ? (BOOL v9 = sel_tableView_heightForRowAtIndexPath_ == a3) : (BOOL v9 = 1),
        !v9 ? (BOOL v10 = sel_tableView_indentationLevelForRowAtIndexPath_ == a3) : (BOOL v10 = 1),
        v10))
  {
    v11 = (objc_class *)objc_opt_class();
    MethodImplementation = class_getMethodImplementation(v11, a3);
    v13 = (objc_class *)objc_opt_class();
    return class_getMethodImplementation(v13, a3) != MethodImplementation;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)UITableViewController;
    return [(UITableViewController *)&v15 respondsToSelector:a3];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v38.receiver = self;
  v38.super_class = (Class)UITableViewController;
  -[UIViewController viewWillAppear:](&v38, sel_viewWillAppear_);
  BOOL v5 = [(UITableViewController *)self tableView];
  BOOL v6 = &OBJC_IVAR____UISearchBarVisualProviderLegacy__leftButton;
  if ([v5 numberOfSections])
  {
    if (*(unsigned char *)&self->_tableViewControllerFlags)
    {
      v32 = v5;
      id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
      BOOL v8 = [(UITableViewController *)self tableView];
      BOOL v9 = [v8 indexPathsForSelectedRows];
      BOOL v10 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v9, "count"));

      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v11 = [(UITableViewController *)self tableView];
      v12 = [v11 indexPathsForSelectedRows];

      uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v35 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v34 + 1) + 8 * i);
            v18 = [(UITableViewController *)self tableView];
            char v19 = [v18 _isRowMultiSelect:v17 followingMacBehavior:0];

            if ((v19 & 1) == 0) {
              [v10 addObject:v17];
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
        }
        while (v14);
      }

      v20 = [(UIViewController *)self transitionCoordinator];
      BOOL v5 = v32;
      [v32 _deselectRowsAtIndexPaths:v10 animated:v3 transitionCoordinator:v20];

      BOOL v6 = &OBJC_IVAR____UISearchBarVisualProviderLegacy__leftButton;
    }
  }
  else
  {
    [v5 reloadData];
  }
  keyboardSupport = self->_keyboardSupport;
  if (!keyboardSupport)
  {
    v22 = [[UIAutoRespondingScrollViewControllerKeyboardSupport alloc] initWithViewController:self];
    v23 = self->_keyboardSupport;
    self->_keyboardSupport = v22;

    keyboardSupport = self->_keyboardSupport;
  }
  if (![(UIAutoRespondingScrollViewControllerKeyboardSupport *)keyboardSupport registeredForNotifications])
  {
    v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v25 = [(UIViewController *)self _screen];
    [v24 addObserver:self->_keyboardSupport selector:sel__keyboardWillShow_ name:@"UIKeyboardPrivateWillShowNotification" object:v25];
    [v24 addObserver:self->_keyboardSupport selector:sel__keyboardWillHide_ name:@"UIKeyboardPrivateWillHideNotification" object:v25];
    [v24 addObserver:self->_keyboardSupport selector:sel__keyboardDidShow_ name:@"UIKeyboardPrivateDidShowNotification" object:v25];
    [v24 addObserver:self->_keyboardSupport selector:sel__keyboardDidHide_ name:@"UIKeyboardPrivateDidHideNotification" object:v25];
    [v24 addObserver:self->_keyboardSupport selector:sel__keyboardDidChangeFrame_ name:@"UIKeyboardPrivateDidChangeFrameNotification" object:v25];
    [(UIAutoRespondingScrollViewControllerKeyboardSupport *)self->_keyboardSupport setRegisteredForNotifications:1];
  }
  [(UIAutoRespondingScrollViewControllerKeyboardSupport *)self->_keyboardSupport setViewIsDisappearing:0];
  uint64_t v26 = v6[1012];
  if ((*((unsigned char *)&self->super.super.super.isa + v26) & 8) == 0)
  {
    v27 = [(UIViewController *)self traitCollection];
    uint64_t v28 = [v27 userInterfaceIdiom];

    if (v28 == 3)
    {
      v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v29 addObserver:self selector:sel__limitedUIDidChange name:@"UIScreenCarScreenLimitedUIDidChangeNotification" object:0];

      *((unsigned char *)&self->super.super.super.isa + v26) |= 8u;
    }
  }
  if (![(UIViewController *)self _isInViewControllerThatHandlesKeyboardAvoidance])
  {
    [(UIAutoRespondingScrollViewControllerKeyboardSupport *)self->_keyboardSupport adjustmentForKeyboard];
    double v33 = v30;
    v31 = [(UITableViewController *)self tableView];
    [v31 _adjustForAutomaticKeyboardInfo:0 animated:0 lastAdjustment:&v33];

    [(UIAutoRespondingScrollViewControllerKeyboardSupport *)self->_keyboardSupport setAdjustmentForKeyboard:v33];
  }
}

- (UITableView)tableView
{
  BOOL v3 = [(UIViewController *)self view];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_4;
  }
  BOOL v4 = [(UIViewController *)self _embeddedView];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = v4;
LABEL_4:
    id v5 = v3;
    BOOL v4 = v5;
    goto LABEL_6;
  }
  id v5 = 0;
LABEL_6:

  return (UITableView *)v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  staticDataSource = self->_staticDataSource;
  if (staticDataSource) {
    return [(UITableViewDataSource *)staticDataSource numberOfSectionsInTableView:a3];
  }
  else {
    return 1;
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UITableViewController;
  -[UIViewController setEditing:animated:](&v8, sel_setEditing_animated_);
  id v7 = [(UITableViewController *)self tableView];
  [v7 setEditing:v5 animated:v4];
}

- (void)loadView
{
  BOOL v3 = [(UIViewController *)self nibName];
  if (v3)
  {
    v22.receiver = self;
    v22.super_class = (Class)UITableViewController;
    [(UIViewController *)&v22 loadView];
    BOOL v4 = [(UITableViewController *)self _existingTableView];
    if (!v4)
    {
      BOOL v5 = [(UIViewController *)self storyboardIdentifier];
      if (v5)
      {
        BOOL v6 = [(UIViewController *)self storyboard];
        id v7 = [v6 name];
        objc_super v8 = v7;
        if (v7)
        {
          id v9 = v7;
        }
        else
        {
          id v9 = [v6 description];
        }
        char v19 = v9;

        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%s instantiated view controller with identifier \"%@\" from storyboard \"%@\", but didn't get a UITableView.", "-[UITableViewController loadView]", v5, v19 format];
      }
      else
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%s loaded the \"%@\" nib but didn't get a UITableView.", "-[UITableViewController loadView]", v3 format];
      }
    }
    v20 = [(UITableView *)v4 delegate];

    if (!v20) {
      [(UITableView *)v4 setDelegate:self];
    }
    v21 = [(UITableView *)v4 dataSource];

    if (!v21) {
      [(UITableViewController *)self _applyDefaultDataSourceToTable:v4];
    }
  }
  else
  {
    if (dyld_program_sdk_at_least())
    {
      double v10 = *MEMORY[0x1E4F1DB28];
      double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    else
    {
      uint64_t v14 = [(UIViewController *)self _screen];
      [v14 _applicationFrame];
      double v10 = v15;
      double v11 = v16;
      double v12 = v17;
      double v13 = v18;
    }
    BOOL v4 = -[UITableView initWithFrame:style:]([UITableView alloc], "initWithFrame:style:", self->_tableViewStyle, v10, v11, v12, v13);
    [(UIView *)v4 setAutoresizingMask:18];
    [(UITableViewController *)self _applyDefaultDataSourceToTable:v4];
    [(UITableView *)v4 setDelegate:self];
    [(UIViewController *)self setView:v4];
  }
  [(UITableView *)v4 setEditing:[(UIViewController *)self isEditing]];
}

- (void)_applyDefaultDataSourceToTable:(id)a3
{
  filteredDataSource = self->_filteredDataSource;
  id v7 = a3;
  if (filteredDataSource)
  {
    [(_UIFilteredDataSource *)filteredDataSource setTableDataSource:self];
    BOOL v5 = self->_filteredDataSource;
    BOOL v6 = v7;
  }
  else
  {
    BOOL v6 = v7;
    BOOL v5 = self;
  }
  [v6 setDataSource:v5];
}

- (UITableViewController)init
{
  return [(UITableViewController *)self initWithStyle:0];
}

- (void)_refreshFilteredDataSourceFilterTypeForScreen:(id)a3
{
  filteredDataSource = self->_filteredDataSource;
  int64_t v4 = [(UITableViewController *)self _resolvedDataSourceFilterTypeForScreen:a3];
  [(_UIFilteredDataSource *)filteredDataSource setFilterType:v4];
}

- (int64_t)_resolvedDataSourceFilterTypeForScreen:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  int64_t filteredDataType = self->_filteredDataType;
  if (filteredDataType)
  {
    int v7 = 0;
  }
  else
  {
    int v7 = [v4 _areListsLimited];
    int64_t filteredDataType = self->_filteredDataType;
  }
  if (filteredDataType == 1) {
    unsigned int v8 = [v5 _areMusicListsLimited];
  }
  else {
    unsigned int v8 = 0;
  }
  int64_t v9 = v7 | v8;

  return v9;
}

- (UITableViewController)initWithStyle:(UITableViewStyle)style
{
  if (dyld_program_sdk_at_least())
  {
    v9.receiver = self;
    v9.super_class = (Class)UITableViewController;
    BOOL v5 = [(UIViewController *)&v9 initWithNibName:0 bundle:0];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UITableViewController;
    BOOL v5 = [(UIViewController *)&v8 init];
  }
  BOOL v6 = v5;
  if (v5)
  {
    v5->_tableViewStyle = style;
    _UITableViewControllerCommonInit(v5);
  }
  return v6;
}

- (void)setClearsSelectionOnViewWillAppear:(BOOL)clearsSelectionOnViewWillAppear
{
  *(unsigned char *)&self->_tableViewControllerFlags = *(unsigned char *)&self->_tableViewControllerFlags & 0xFE | clearsSelectionOnViewWillAppear;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_keyboardSupport)
  {
    BOOL v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self->_keyboardSupport];

    [(UIAutoRespondingScrollViewControllerKeyboardSupport *)self->_keyboardSupport setViewIsDisappearing:1];
    [(UIAutoRespondingScrollViewControllerKeyboardSupport *)self->_keyboardSupport setRegisteredForNotifications:0];
  }
  if ((*(unsigned char *)&self->_tableViewControllerFlags & 8) != 0)
  {
    BOOL v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:self name:@"UIScreenCarScreenLimitedUIDidChangeNotification" object:0];

    *(unsigned char *)&self->_tableViewControllerFlags &= ~8u;
  }
  v7.receiver = self;
  v7.super_class = (Class)UITableViewController;
  [(UIViewController *)&v7 viewWillDisappear:v3];
}

- (UITableViewController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  v7.receiver = self;
  v7.super_class = (Class)UITableViewController;
  id v4 = [(UIViewController *)&v7 initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  BOOL v5 = v4;
  if (v4) {
    _UITableViewControllerCommonInit(v4);
  }
  return v5;
}

- (UITableViewController)initWithCoder:(NSCoder *)coder
{
  id v4 = coder;
  v10.receiver = self;
  v10.super_class = (Class)UITableViewController;
  BOOL v5 = [(UIViewController *)&v10 initWithCoder:v4];
  BOOL v6 = v5;
  if (v5)
  {
    _UITableViewControllerCommonInit(v5);
    if ([(NSCoder *)v4 containsValueForKey:@"UIClearsSelectionOnViewWillAppear"]) {
      *(unsigned char *)&v6->_tableViewControllerFlags = *(unsigned char *)&v6->_tableViewControllerFlags & 0xFE | [(NSCoder *)v4 decodeBoolForKey:@"UIClearsSelectionOnViewWillAppear"];
    }
    uint64_t v7 = [(NSCoder *)v4 decodeObjectForKey:@"UITableViewControllerStaticDataSource"];
    staticDataSource = v6->_staticDataSource;
    v6->_staticDataSource = (UITableViewDataSource *)v7;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UITableViewController;
  [(UIViewController *)&v6 encodeWithCoder:v4];
  if ((*(unsigned char *)&self->_tableViewControllerFlags & 1) == 0) {
    [v4 encodeBool:0 forKey:@"UIClearsSelectionOnViewWillAppear"];
  }
  staticDataSource = self->_staticDataSource;
  if (staticDataSource) {
    [v4 encodeObject:staticDataSource forKey:@"UITableViewControllerStaticDataSource"];
  }
}

- (void)dealloc
{
  BOOL v3 = [(UITableViewController *)self _existingTableView];
  id v4 = [v3 dataSource];
  filteredDataSource = self->_filteredDataSource;

  if (v4 == filteredDataSource) {
    [v3 setDataSource:0];
  }
  if (self->_keyboardSupport)
  {
    objc_super v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:self->_keyboardSupport];
  }
  if ((*(unsigned char *)&self->_tableViewControllerFlags & 8) != 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 removeObserver:self name:@"UIScreenCarScreenLimitedUIDidChangeNotification" object:0];

    *(unsigned char *)&self->_tableViewControllerFlags &= ~8u;
  }

  v8.receiver = self;
  v8.super_class = (Class)UITableViewController;
  [(UIViewController *)&v8 dealloc];
}

- (id)_existingTableView
{
  v2 = [(UIViewController *)self _existingView];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)setTableView:(UITableView *)tableView
{
  double v11 = tableView;
  id v4 = [(UITableViewController *)self _existingTableView];
  if (v4 != v11)
  {
    BOOL v5 = [(UITableView *)v4 dataSource];
    objc_super v6 = v5;
    if (v5 == self || v5 == (UITableViewController *)self->_filteredDataSource) {
      [(UITableView *)v4 setDataSource:0];
    }
    uint64_t v7 = [(UITableView *)v4 delegate];

    if (v7 == self) {
      [(UITableView *)v4 setDelegate:0];
    }
    objc_super v8 = [(UIScrollView *)v4 _refreshControl];
    [(UIViewController *)self setView:v11];
    [(UIScrollView *)v11 _setRefreshControl:v8];
    objc_super v9 = [(UITableView *)v11 dataSource];

    if (!v9) {
      [(UITableViewController *)self _applyDefaultDataSourceToTable:v11];
    }
    objc_super v10 = [(UITableView *)v11 delegate];

    if (!v10) {
      [(UITableView *)v11 setDelegate:self];
    }
  }
}

- (BOOL)clearsSelectionOnViewWillAppear
{
  return *(unsigned char *)&self->_tableViewControllerFlags & 1;
}

- (void)_limitedUIDidChange
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__UITableViewController__limitedUIDidChange__block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __44__UITableViewController__limitedUIDidChange__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 _screen];
  [v1 _refreshFilteredDataSourceFilterTypeForScreen:v2];
}

- (void)setRefreshControl:(UIRefreshControl *)refreshControl
{
  id v4 = refreshControl;
  id v5 = [(UITableViewController *)self tableView];
  [v5 setRefreshControl:v4];
}

- (UIRefreshControl)refreshControl
{
  id v2 = [(UITableViewController *)self tableView];
  id v3 = [v2 refreshControl];

  return (UIRefreshControl *)v3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result = (int64_t)self->_staticDataSource;
  if (result) {
    return [(id)result tableView:a3 numberOfRowsInSection:a4];
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return [(UITableViewDataSource *)self->_staticDataSource tableView:a3 cellForRowAtIndexPath:a4];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return [(UITableViewDataSource *)self->_staticDataSource tableView:a3 titleForHeaderInSection:a4];
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return [(UITableViewDataSource *)self->_staticDataSource tableView:a3 titleForFooterInSection:a4];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return [(UITableViewDataSource *)self->_staticDataSource tableView:a3 viewForHeaderInSection:a4];
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return [(UITableViewDataSource *)self->_staticDataSource tableView:a3 viewForFooterInSection:a4];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  staticDataSource = self->_staticDataSource;
  if (!staticDataSource) {
    return 0.0;
  }
  [(UITableViewDataSource *)staticDataSource tableView:a3 heightForHeaderInSection:a4];
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  staticDataSource = self->_staticDataSource;
  if (!staticDataSource) {
    return 0.0;
  }
  [(UITableViewDataSource *)staticDataSource tableView:a3 heightForFooterInSection:a4];
  return result;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  staticDataSource = self->_staticDataSource;
  if (staticDataSource) {
    [(UITableViewDataSource *)staticDataSource tableView:a3 heightForRowAtIndexPath:a4];
  }
  else {
    [a3 rowHeight];
  }
  return result;
}

- (int64_t)tableView:(id)a3 indentationLevelForRowAtIndexPath:(id)a4
{
  int64_t result = (int64_t)self->_staticDataSource;
  if (result) {
    return [(id)result tableView:a3 indentationLevelForRowAtIndexPath:a4];
  }
  return result;
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  if (([a3 isEditing] & 1) == 0)
  {
    [(UITableViewController *)self setEditing:0 animated:1];
  }
}

- (void)tableView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  id v5 = a3;
  if (dyld_program_sdk_at_least() && [v5 isEditing]) {
    [(UITableViewController *)self setEditing:1 animated:1];
  }
}

- (int64_t)_filteredDataType
{
  return self->_filteredDataType;
}

- (void)_setFilteredDataType:(int64_t)a3
{
  self->_int64_t filteredDataType = a3;
  id v4 = [(UIViewController *)self _screen];
  [(UITableViewController *)self _refreshFilteredDataSourceFilterTypeForScreen:v4];

  id v5 = [(UITableViewController *)self tableView];
  [v5 reloadData];
}

- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a3;
  if ([(UITableViewController *)self _shouldRespondToPreviewingMethods])
  {
    objc_super v9 = [v8 sourceView];
    objc_super v10 = -[UITableViewController previewViewControllerForLocation:inSourceView:](self, "previewViewControllerForLocation:inSourceView:", v9, x, y);
  }
  else
  {
    [(UIResponder *)self doesNotRecognizeSelector:a2];
    objc_super v10 = 0;
  }

  return v10;
}

- (void)previewingContext:(id)a3 commitViewController:(id)a4
{
  id v8 = a4;
  if ([(UITableViewController *)self _shouldRespondToPreviewingMethods])
  {
    id v6 = v8;
    id v7 = v6;
    if (objc_opt_respondsToSelector())
    {
      id v7 = [(UITableViewController *)self committedViewControllerForPreviewViewController:v6];

      if (!v7) {
        id v7 = v6;
      }
    }
    if (objc_opt_respondsToSelector())
    {
      [(UITableViewController *)self commitPreviewViewController:v6 committedViewController:v7];
    }
    else if (objc_opt_respondsToSelector())
    {
      [(UITableViewController *)self commitPreviewViewController:v6];
    }
  }
  else
  {
    [(UIResponder *)self doesNotRecognizeSelector:a2];
  }
}

- (id)previewViewControllerForRowAtIndexPath:(id)a3
{
  return 0;
}

- (id)previewViewControllerForLocation:(CGPoint)a3 inSourceView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(UIViewController *)self isEditing]
    || ![(UITableViewController *)self _shouldRespondToPreviewingMethods])
  {
    objc_super v10 = 0;
  }
  else
  {
    id v8 = [(UITableViewController *)self tableView];
    objc_msgSend(v8, "convertPoint:fromView:", v7, x, y);
    objc_super v9 = objc_msgSend(v8, "indexPathForRowAtPoint:");
    objc_super v10 = [(UITableViewController *)self previewViewControllerForRowAtIndexPath:v9];
  }
  return v10;
}

- (void)willPresentPreviewViewController:(id)a3 forLocation:(CGPoint)a4 inSourceView:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v14 = a3;
  id v9 = a5;
  if ([(UITableViewController *)self _shouldRespondToPreviewingMethods])
  {
    objc_super v10 = [(UITableViewController *)self tableView];
    objc_msgSend(v10, "convertPoint:fromView:", v9, x, y);
    double v11 = objc_msgSend(v10, "indexPathForRowAtPoint:");
    double v12 = [v10 cellForRowAtIndexPath:v11];
    double v13 = [v14 presentationController];
    [v13 setSourceView:v12];
    [v12 bounds];
    objc_msgSend(v13, "setSourceRect:");
    [(UITableViewController *)self willPresentPreviewViewController:v14 forRowAtIndexPath:v11];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredDataSource, 0);
  objc_storeStrong((id *)&self->_staticDataSource, 0);
  objc_storeStrong((id *)&self->_keyboardSupport, 0);
}

- (UITableViewDataSource)_staticDataSource
{
  return self->_staticDataSource;
}

- (void)_setStaticDataSource:(id)a3
{
  id v5 = (UITableViewDataSource *)a3;
  if (self->_staticDataSource != v5)
  {
    double v11 = v5;
    objc_storeStrong((id *)&self->_staticDataSource, a3);
    BOOL v6 = [(UIViewController *)self isViewLoaded];
    id v5 = v11;
    if (v6)
    {
      id v7 = [(UITableViewController *)self tableView];
      id v8 = [v7 delegate];

      if (v8 == self)
      {
        [v7 setDelegate:0];
        [v7 setDelegate:self];
      }
      id v9 = [v7 dataSource];
      filteredDataSource = self->_filteredDataSource;

      if (v9 == filteredDataSource) {
        [(UITableViewController *)self _applyDefaultDataSourceToTable:v7];
      }
      [v7 reloadData];

      id v5 = v11;
    }
  }
}

@end