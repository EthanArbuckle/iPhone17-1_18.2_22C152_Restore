@interface ICSETableViewController
- (BOOL)inhibitSearchCancelAnimation;
- (BOOL)isAccountPickerController;
- (BOOL)isFolderPickerController;
- (BOOL)isNotePickerController;
- (BOOL)isRootController;
- (BOOL)isShowingSearchResults;
- (BOOL)keyboardResizerAutoscrollAboveKeyboard;
- (BOOL)searchBarHidden;
- (BOOL)searchBarShouldBeginEditing:(id)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)tableViewHidesEmptyCells;
- (ICSEContainerViewController)containerViewController;
- (ICSEFolderListViewState)folderListViewState;
- (ICSETableViewControllerDelegate)delegate;
- (ICSETableViewItem)representedItem;
- (ICScrollViewKeyboardResizer)scrollViewResizer;
- (NSArray)accounts;
- (NSArray)allFolders;
- (NSArray)folderSortDescriptors;
- (NSArray)nonPinnedNoteItems;
- (NSArray)pinnedNoteItems;
- (NSArray)searchTableViewItems;
- (NSArray)tableViewItems;
- (NSLayoutConstraint)createNewNoteToolbarBottomConstraint;
- (NSLayoutConstraint)createNewNoteToolbarHeightConstraint;
- (NSLayoutConstraint)searchBarActiveTopConstraint;
- (NSLayoutConstraint)searchBarZeroHeightConstraint;
- (NSLayoutConstraint)searchCancelButtonMaxWidthConstraint;
- (NSLayoutConstraint)searchCancelTrailingConstraint;
- (NSMutableArray)folderTableViewItems;
- (NSOperationQueue)queryOperationQueue;
- (NSString)accountPickerBackButtonTitle;
- (NSString)folderPickerBackButtonTitle;
- (NSString)folderPickerTitle;
- (NSString)searchString;
- (UIBarButtonItem)backBarButtonItem;
- (UIBarButtonItem)cancelButton;
- (UIButton)createNewNoteButton;
- (UIButton)searchCancelButton;
- (UISearchBar)searchBar;
- (UITableView)tableView;
- (UIToolbar)createNewNoteToolbar;
- (double)consumedBottomAreaForResizer:(id)a3;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (double)topInsetForResizer:(id)a3;
- (id)itemForIndexPath:(id)a3;
- (id)itemsForSection:(unint64_t)a3;
- (id)matchingFoldersForString:(id)a3;
- (id)noteItemsForContainer:(id)a3 hideNonSystemPaperNotes:(BOOL)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)queryRequestIndex;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)tableViewType;
- (void)backButtonPressed:(id)a3;
- (void)cancelButtonPressed:(id)a3;
- (void)collapseFolderListItem:(id)a3 atIndexPath:(id)a4;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)dealloc;
- (void)didDisppearInContainer:(id)a3;
- (void)expandFolderListItem:(id)a3 atIndexPath:(id)a4;
- (void)performSearchForString:(id)a3;
- (void)pushFolderViewForNote:(id)a3;
- (void)rebuildTableItems;
- (void)refreshTableView;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchCancelButtonPressed:(id)a3;
- (void)selectNote:(id)a3 orFolder:(id)a4 prefersSystemPaper:(BOOL)a5;
- (void)setAccounts:(id)a3;
- (void)setAllFolders:(id)a3;
- (void)setBackBarButtonItem:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setContainerViewController:(id)a3;
- (void)setCreateNewNoteButton:(id)a3;
- (void)setCreateNewNoteToolbar:(id)a3;
- (void)setCreateNewNoteToolbarBottomConstraint:(id)a3;
- (void)setCreateNewNoteToolbarHeightConstraint:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFolderListViewState:(id)a3;
- (void)setFolderTableViewItems:(id)a3;
- (void)setInhibitSearchCancelAnimation:(BOOL)a3;
- (void)setIsShowingSearchResults:(BOOL)a3;
- (void)setIsShowingSearchResults:(BOOL)a3 animated:(BOOL)a4;
- (void)setNonPinnedNoteItems:(id)a3;
- (void)setPinnedNoteItems:(id)a3;
- (void)setQueryOperationQueue:(id)a3;
- (void)setQueryRequestIndex:(int64_t)a3;
- (void)setRepresentedItem:(id)a3;
- (void)setScrollViewResizer:(id)a3;
- (void)setSearchBar:(id)a3;
- (void)setSearchBarActiveTopConstraint:(id)a3;
- (void)setSearchBarHidden:(BOOL)a3;
- (void)setSearchBarZeroHeightConstraint:(id)a3;
- (void)setSearchCancelButton:(id)a3;
- (void)setSearchCancelButtonMaxWidthConstraint:(id)a3;
- (void)setSearchCancelTrailingConstraint:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setSearchTableViewItems:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTableViewHidesEmptyCells:(BOOL)a3;
- (void)setTableViewItems:(id)a3;
- (void)setTableViewType:(unint64_t)a3;
- (void)setUpForIsShowingSearchResults:(BOOL)a3 animated:(BOOL)a4;
- (void)setupSearchResultsWithSearchString:(id)a3 notes:(id)a4;
- (void)showOrHideCreateNewNoteButton;
- (void)showOrHideEmptyTableCellsIfNecessary;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)tableViewCell:(id)a3 setCollapsed:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willAppearInContainer:(id)a3;
@end

@implementation ICSETableViewController

- (NSString)accountPickerBackButtonTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Location" value:&stru_1000F2510 table:0];

  return (NSString *)v3;
}

- (NSString)folderPickerTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Choose Folder" value:&stru_1000F2510 table:0];

  return (NSString *)v3;
}

- (NSString)folderPickerBackButtonTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Folders" value:&stru_1000F2510 table:0];

  return (NSString *)v3;
}

- (void)viewDidLoad
{
  v79.receiver = self;
  v79.super_class = (Class)ICSETableViewController;
  [(ICSETableViewController *)&v79 viewDidLoad];
  id v3 = [objc_alloc((Class)ICScrollViewKeyboardResizer) initWithDelegate:self];
  [(ICSETableViewController *)self setScrollViewResizer:v3];

  v4 = objc_alloc_init(ICSEFolderListViewState);
  [(ICSETableViewController *)self setFolderListViewState:v4];

  if (UIAccessibilityDarkerSystemColorsEnabled()) {
    +[UIColor ICDarkenedTintColor];
  }
  else {
  v75 = +[UIColor ICTintColor];
  }
  v5 = [(ICSETableViewController *)self view];
  [v5 setTintColor:v75];

  v6 = [(ICSETableViewController *)self navigationController];
  v7 = [v6 navigationBar];
  [v7 setTintColor:v75];

  if (+[UIDevice ic_isVision])
  {
    v8 = +[UIShape capsuleShape];
    v9 = [v8 shapeByApplyingInset:-8.0];

    v10 = +[UIHoverStyle styleWithShape:v9];
    v11 = [(ICSETableViewController *)self searchCancelButton];
    [v11 setHoverStyle:v10];
  }
  v12 = [(ICSETableViewController *)self navigationController];
  v13 = [v12 navigationBar];
  [v13 setForceFullHeightInLandscape:1];

  v14 = [(ICSETableViewController *)self navigationItem];
  [v14 setHidesBackButton:1];

  v15 = [(ICSETableViewController *)self navigationItem];
  [v15 setLeftItemsSupplementBackButton:0];

  v16 = [(ICSETableViewController *)self tableView];
  +[ICSETableViewItem configureTableViewNibs:v16];

  v17 = +[UIColor systemGroupedBackgroundColor];
  v18 = [(ICSETableViewController *)self tableView];
  [v18 setBackgroundColor:v17];

  v19 = +[UIColor systemBackgroundColor];
  v20 = [(ICSETableViewController *)self view];
  [v20 setBackgroundColor:v19];

  [(ICSETableViewController *)self setTableViewHidesEmptyCells:1];
  v21 = [(ICSETableViewController *)self tableView];
  [v21 setDelegate:self];

  v22 = [(ICSETableViewController *)self tableView];
  [v22 setDataSource:self];

  id v23 = objc_alloc_init((Class)UIView);
  v24 = [(ICSETableViewController *)self tableView];
  [v24 setBackgroundView:v23];

  v25 = +[UIColor separatorColor];
  v26 = [(ICSETableViewController *)self tableView];
  [v26 setSeparatorColor:v25];

  v27 = [(ICSETableViewController *)self tableView];
  [v27 setRowHeight:UITableViewAutomaticDimension];

  if (ICAccessibilityAccessibilityLargerTextSizesEnabled()) {
    double v28 = 88.0;
  }
  else {
    double v28 = 44.0;
  }
  v29 = [(ICSETableViewController *)self tableView];
  [v29 setEstimatedRowHeight:v28];

  v30 = [(ICSETableViewController *)self tableView];
  [v30 setSectionHeaderHeight:UITableViewAutomaticDimension];

  v31 = +[UIColor systemBackgroundColor];
  v32 = [(ICSETableViewController *)self navigationController];
  v33 = [v32 navigationBar];
  [v33 setBackgroundColor:v31];

  v34 = [(ICSETableViewController *)self navigationController];
  v35 = [v34 navigationBar];
  [v35 _setHidesShadow:1];

  id v36 = +[ICSearchQueryOperation newOperationQueueWithName:@"com.apple.notes.sharing-extension-query-operation-queue"];
  [(ICSETableViewController *)self setQueryOperationQueue:v36];

  v37 = [(ICSETableViewController *)self backBarButtonItem];
  [v37 _setShowsBackButtonIndicator:1];

  v38 = [(ICSETableViewController *)self searchBar];
  [v38 setDelegate:self];

  v39 = +[NSNotificationCenter defaultCenter];
  [v39 addObserver:self selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

  v40 = [(ICSETableViewController *)self backBarButtonItem];
  [v40 setTitlePositionAdjustment:0 forBarMetrics:16.0];

  unsigned __int8 v41 = +[UIDevice ic_isVision];
  if (v41)
  {
    v42 = 0;
  }
  else
  {
    v42 = +[UIColor systemGroupedBackgroundColor];
  }
  v43 = [(ICSETableViewController *)self createNewNoteToolbar];
  [v43 setBarTintColor:v42];

  if ((v41 & 1) == 0) {
  objc_initWeak(&location, self);
  }
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_100015428;
  v76[3] = &unk_1000EE538;
  objc_copyWeak(&v77, &location);
  v74 = +[UIAction actionWithHandler:v76];
  v44 = +[UIButtonConfiguration ic_filledTintedButtonConfiguration];
  [v44 setCornerStyle:3];
  v45 = +[NSBundle mainBundle];
  v46 = [v45 localizedStringForKey:@"Create New Note" value:&stru_1000F2510 table:0];
  [v44 setTitle:v46];

  [v44 setTitleTextAttributesTransformer:&stru_1000EE578];
  v47 = +[UIButton buttonWithConfiguration:v44 primaryAction:v74];
  [v47 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v48 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v47];
  v49 = [(ICSETableViewController *)self createNewNoteToolbar];
  id v50 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 menu:0];
  v81[0] = v50;
  v81[1] = v48;
  id v51 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 menu:0];
  v81[2] = v51;
  v52 = +[NSArray arrayWithObjects:v81 count:3];
  [v49 setItems:v52];

  if (+[UIDevice ic_isVision]) {
    double v53 = 85.0;
  }
  else {
    double v53 = 50.0;
  }
  v54 = [v47 widthAnchor];
  v55 = [v54 constraintGreaterThanOrEqualToConstant:360.0];
  v80[0] = v55;
  v56 = [v47 heightAnchor];
  v57 = [v56 constraintGreaterThanOrEqualToConstant:v53];
  v80[1] = v57;
  v58 = +[NSArray arrayWithObjects:v80 count:2];
  +[NSLayoutConstraint activateConstraints:v58];

  [(ICSETableViewController *)self setCreateNewNoteButton:v47];
  v59 = [(ICSETableViewController *)self createNewNoteToolbarHeightConstraint];
  [v59 setConstant:v53 + 16.0];

  if (+[ICDeviceSupport deviceIsVision])
  {
    v60 = [(ICSETableViewController *)self createNewNoteToolbarBottomConstraint];
    [v60 setConstant:-8.0];
  }
  else
  {
    v60 = [(ICSETableViewController *)self createNewNoteToolbarBottomConstraint];
    [v60 setConstant:0.0];
  }

  v61 = [(ICSETableViewController *)self tableView];
  uint64_t v62 = objc_opt_class();
  v63 = (objc_class *)objc_opt_class();
  v64 = NSStringFromClass(v63);
  [v61 registerClass:v62 forHeaderFooterViewReuseIdentifier:v64];

  v65 = [(ICSETableViewController *)self tableView];
  uint64_t v66 = objc_opt_class();
  v67 = (objc_class *)objc_opt_class();
  v68 = NSStringFromClass(v67);
  [v65 registerClass:v66 forHeaderFooterViewReuseIdentifier:v68];

  v69 = [(ICSETableViewController *)self tableView];
  uint64_t v70 = objc_opt_class();
  v71 = (objc_class *)objc_opt_class();
  v72 = NSStringFromClass(v71);
  [v69 registerClass:v70 forCellReuseIdentifier:v72];

  objc_destroyWeak(v73);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICSETableViewController;
  [(ICSETableViewController *)&v4 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v30.receiver = self;
  v30.super_class = (Class)ICSETableViewController;
  [(ICSETableViewController *)&v30 viewWillAppear:a3];
  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"notesContextRefreshNotification:" name:ICNotesContextRefreshNotification object:0];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"extensionHostDidBecomeActive:" name:NSExtensionHostDidBecomeActiveNotification object:0];

  v6 = [(ICSETableViewController *)self searchBar];
  [v6 resignFirstResponder];

  [(ICSETableViewController *)self setUpForIsShowingSearchResults:[(ICSETableViewController *)self isShowingSearchResults] animated:0];
  if (![(ICSETableViewController *)self isNotePickerController])
  {
    v20 = [(ICSETableViewController *)self navigationItem];
    [v20 setLeftBarButtonItem:0];

    v19 = [(ICSETableViewController *)self backBarButtonItem];
    v21 = [(ICSETableViewController *)self navigationItem];
    [(ICNavigationTitleView *)v21 setLeftBarButtonItem:v19];
LABEL_14:

    goto LABEL_15;
  }
  v7 = [(ICSETableViewController *)self navigationController];
  v8 = [v7 navigationItem];
  [v8 setLeftBarButtonItems:0];

  v9 = [(ICSETableViewController *)self representedItem];
  uint64_t v10 = [v9 folder];
  if (v10)
  {
    v11 = (void *)v10;
    v12 = [(ICSETableViewController *)self representedItem];
    v13 = [v12 folder];
    unsigned int v14 = [v13 isSharedViaICloud];

    if (v14)
    {
      v15 = [(ICSETableViewController *)self representedItem];
      v16 = [v15 folder];
      unsigned int v17 = [v16 isOwnedByCurrentUser];

      if (v17)
      {
        v18 = +[NSBundle mainBundle];
        v19 = [v18 localizedStringForKey:@"Shared by Me" value:&stru_1000F2510 table:0];
      }
      else
      {
        v22 = [(ICSETableViewController *)self representedItem];
        id v23 = [v22 folder];
        v18 = [v23 sharedOwnerName];

        if ([v18 length])
        {
          v24 = +[NSBundle mainBundle];
          v25 = [v24 localizedStringForKey:@"Shared by %@" value:&stru_1000F2510 table:0];
          v19 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v25, v18);
        }
        else
        {
          v24 = +[NSBundle mainBundle];
          v19 = [v24 localizedStringForKey:@"Shared to Me" value:&stru_1000F2510 table:0];
        }
      }
      v21 = objc_alloc_init(ICNavigationTitleView);
      v26 = [(ICSETableViewController *)self title];
      v27 = [(ICNavigationTitleView *)v21 titleLabel];
      [v27 setText:v26];

      double v28 = [(ICNavigationTitleView *)v21 subtitleLabel];
      [v28 setText:v19];

      v29 = [(ICSETableViewController *)self navigationItem];
      [v29 setTitleView:v21];

      goto LABEL_14;
    }
  }
  else
  {
  }
  v19 = [(ICSETableViewController *)self navigationItem];
  [v19 setTitleView:0];
LABEL_15:

  [(ICSETableViewController *)self refreshTableView];
}

- (void)viewDidLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)ICSETableViewController;
  [(ICSETableViewController *)&v8 viewDidLayoutSubviews];
  id v3 = [(ICSETableViewController *)self view];
  uint64_t v4 = [v3 window];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [(ICSETableViewController *)self scrollViewResizer];
    unsigned __int8 v7 = [v6 isAutoResizing];

    if (v7) {
      return;
    }
    id v3 = [(ICSETableViewController *)self scrollViewResizer];
    [v3 startAutoResizing];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICSETableViewController;
  [(ICSETableViewController *)&v4 viewDidAppear:a3];
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
  [(ICSETableViewController *)self showOrHideCreateNewNoteButton];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ICSETableViewController;
  [(ICSETableViewController *)&v8 viewWillDisappear:a3];
  objc_super v4 = [(ICSETableViewController *)self scrollViewResizer];
  [v4 stopAutoResizing];

  v5 = [(ICSETableViewController *)self searchBar];
  [v5 resignFirstResponder];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:ICNotesContextRefreshNotification object:0];

  unsigned __int8 v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self name:NSExtensionHostDidBecomeActiveNotification object:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICSETableViewController;
  [(ICSETableViewController *)&v6 viewDidDisappear:a3];
  objc_super v4 = [(ICSETableViewController *)self searchBar];
  [v4 resignFirstResponder];

  [(ICSETableViewController *)self setInhibitSearchCancelAnimation:0];
  v5 = [(ICSETableViewController *)self searchBar];
  [v5 resignFirstResponder];
}

- (void)willAppearInContainer:(id)a3
{
  objc_super v4 = [(ICSETableViewController *)self searchBar];
  [v4 resignFirstResponder];

  if ([(ICSETableViewController *)self isNotePickerController])
  {
    v5 = [(ICSETableViewController *)self navigationController];
    objc_super v6 = [v5 navigationItem];
    [v6 setLeftBarButtonItems:0];
  }
  [(ICSETableViewController *)self refreshTableView];
  id v7 = [(ICSETableViewController *)self view];
  [v7 layoutIfNeeded];
}

- (void)didDisppearInContainer:(id)a3
{
  objc_super v4 = [(ICSETableViewController *)self searchBar];
  [v4 resignFirstResponder];

  [(ICSETableViewController *)self setInhibitSearchCancelAnimation:0];
}

- (void)viewSafeAreaInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)ICSETableViewController;
  [(ICSETableViewController *)&v4 viewSafeAreaInsetsDidChange];
  id v3 = [(ICSETableViewController *)self scrollViewResizer];
  [v3 reapplyInsets];
}

- (BOOL)isRootController
{
  v2 = self;
  id v3 = [(ICSETableViewController *)self navigationController];
  objc_super v4 = [v3 viewControllers];
  v5 = [v4 firstObject];
  LOBYTE(v2) = v5 == v2;

  return (char)v2;
}

- (BOOL)isAccountPickerController
{
  return [(ICSETableViewController *)self tableViewType] == 0;
}

- (BOOL)isFolderPickerController
{
  return (id)[(ICSETableViewController *)self tableViewType] == (id)1;
}

- (BOOL)isNotePickerController
{
  return (id)[(ICSETableViewController *)self tableViewType] == (id)2;
}

- (void)cancelButtonPressed:(id)a3
{
  objc_super v4 = [(ICSETableViewController *)self searchBar];
  [v4 resignFirstResponder];

  id v6 = [(ICSETableViewController *)self containerViewController];
  v5 = [v6 rootViewController];
  [v5 setIsShowingSearchResults:0 animated:1];
}

- (void)backButtonPressed:(id)a3
{
  objc_super v4 = [(ICSETableViewController *)self searchBar];
  [v4 resignFirstResponder];

  if ([(ICSETableViewController *)self isRootController])
  {
    id v7 = [(ICSETableViewController *)self containerViewController];
    v5 = [v7 rootViewController];
    [v5 setIsShowingSearchResults:0 animated:1];
  }
  else
  {
    id v7 = [(ICSETableViewController *)self navigationController];
    id v6 = [v7 popViewControllerAnimated:1];
  }
}

- (void)setTableViewItems:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewItems, a3);

  [(ICSETableViewController *)self showOrHideEmptyTableCellsIfNecessary];
}

- (void)setAccounts:(id)a3
{
  id v14 = a3;
  objc_storeStrong((id *)&self->_accounts, a3);
  if (!-[ICSETableViewController tableViewType](self, "tableViewType") && [v14 count] == (id)1)
  {
    v5 = [v14 objectAtIndexedSubscript:0];
    if (v5)
    {
      id v6 = [(ICSETableViewController *)self delegate];
      id v7 = [v6 currentSelectedNoteForTableViewController:self];

      objc_super v8 = [(ICSETableViewController *)self delegate];
      v9 = [v8 currentSelectedFolderForTableViewController:self];

      if ([v5 hasAnyCustomFoldersIncludingSystem:1])
      {
        [(ICSETableViewController *)self setTableViewType:1];
        uint64_t v10 = +[ICSETableViewItem tableViewItemFromObject:v5 selectedNote:v7 selectedFolder:v9 isSearchResult:0 isAccountPicker:0];
        representedItem = self->_representedItem;
        self->_representedItem = v10;
      }
      else
      {
        [(ICSETableViewController *)self setTableViewType:2];
        representedItem = [v5 defaultFolder];
        v12 = +[ICSETableViewItem tableViewItemFromObject:representedItem selectedNote:v7 selectedFolder:v9 isSearchResult:0 isAccountPicker:0];
        v13 = self->_representedItem;
        self->_representedItem = v12;
      }
    }
  }
  [(ICSETableViewController *)self refreshTableView];
}

- (void)setRepresentedItem:(id)a3
{
  objc_storeStrong((id *)&self->_representedItem, a3);

  [(ICSETableViewController *)self refreshTableView];
}

- (void)setTableViewHidesEmptyCells:(BOOL)a3
{
  if (self->_tableViewHidesEmptyCells != a3)
  {
    BOOL v3 = a3;
    self->_tableViewHidesEmptyCells = a3;
    id v6 = a3 ? objc_alloc_init((Class)UIView) : 0;
    v5 = [(ICSETableViewController *)self tableView];
    [v5 setTableFooterView:v6];

    if (v3)
    {
    }
  }
}

- (void)setSearchBarHidden:(BOOL)a3
{
  BOOL v3 = a3;
  self->_searchBarHidden = a3;
  id v5 = [(ICSETableViewController *)self view];
  if (self->_searchBarHidden) {
    float v6 = 999.0;
  }
  else {
    float v6 = 1.0;
  }
  id v7 = [(ICSETableViewController *)self searchBarZeroHeightConstraint];
  *(float *)&double v8 = v6;
  [v7 setPriority:v8];

  id v9 = [(ICSETableViewController *)self searchCancelButton];
  [v9 setHidden:v3];
}

- (void)showOrHideEmptyTableCellsIfNecessary
{
  BOOL v3 = 1;
  objc_super v4 = [(ICSETableViewController *)self itemsForSection:1];
  id v5 = [v4 count];
  float v6 = [(ICSETableViewController *)self itemsForSection:0];
  uint64_t v7 = (uint64_t)[v6 count];

  if ([(ICSETableViewController *)self isShowingSearchResults] && v5 == (id)-v7)
  {
    double v8 = [(ICSETableViewController *)self searchBar];
    id v9 = [v8 text];
    uint64_t v10 = [v9 ic_trimmedString];
    BOOL v3 = [v10 length] != 0;
  }

  [(ICSETableViewController *)self setTableViewHidesEmptyCells:v3];
}

- (void)rebuildTableItems
{
  v2 = self;
  BOOL v3 = [(ICSETableViewController *)self delegate];
  objc_super v4 = [v3 currentSelectedNoteForTableViewController:v2];

  id v5 = [(ICSETableViewController *)v2 delegate];
  float v6 = [v5 currentSelectedFolderForTableViewController:v2];

  uint64_t v7 = &_s10Foundation3URLVSHAAMc_ptr;
  double v8 = +[NSMutableArray array];
  [(ICSETableViewController *)v2 setFolderTableViewItems:v8];

  [(ICSETableViewController *)v2 setPinnedNoteItems:0];
  [(ICSETableViewController *)v2 setNonPinnedNoteItems:0];
  v67 = v2;
  if ([(ICSETableViewController *)v2 isAccountPickerController])
  {
    id v9 = +[NSMutableArray array];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    uint64_t v10 = [(ICSETableViewController *)v2 accounts];
    id v11 = [v10 countByEnumeratingWithState:&v72 objects:v77 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v73;
      do
      {
        id v14 = 0;
        do
        {
          if (*(void *)v73 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = +[ICSETableViewItem tableViewItemFromObject:*(void *)(*((void *)&v72 + 1) + 8 * (void)v14) selectedNote:v4 selectedFolder:v6 isSearchResult:0 isAccountPicker:1];
          [v9 addObject:v15];

          id v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v72 objects:v77 count:16];
      }
      while (v12);
    }

    v2 = v67;
  }
  else if ([(ICSETableViewController *)v2 isFolderPickerController])
  {
    v16 = [(ICSETableViewController *)v2 folderListViewState];
    [v16 removeAccounts];

    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    unsigned int v17 = [(ICSETableViewController *)v2 accounts];
    id v18 = [v17 countByEnumeratingWithState:&v68 objects:v76 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v69;
      do
      {
        v21 = 0;
        do
        {
          if (*(void *)v69 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v68 + 1) + 8 * (void)v21);
          id v23 = [(ICSETableViewController *)v2 folderListViewState];
          [v23 addAccount:v22];

          v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        id v19 = [v17 countByEnumeratingWithState:&v68 objects:v76 count:16];
      }
      while (v19);
    }

    id v9 = +[NSMutableArray array];
    v24 = [(ICSETableViewController *)v2 folderListViewState];
    v25 = (char *)[v24 countOfAccounts];

    if (v25)
    {
      v26 = 0;
      v61 = v25;
      do
      {
        v65 = [v7[246] array];
        v27 = [(ICSETableViewController *)v2 folderListViewState];
        double v28 = [v27 accountItemAtIndex:v26];

        objc_opt_class();
        v29 = [v28 noteContainer];
        uint64_t v30 = ICCheckedDynamicCast();

        if (v25 != (char *)1)
        {
          v31 = +[ICSETableViewHeaderItem headerItemWithAccount:v30];
          [v31 setFolderListItem:v28];
          [v31 setIsInFolderList:1];
          [v9 addObject:v31];
        }
        v64 = v28;
        v32 = objc_alloc_init(ICSETableViewItem);
        v63 = (void *)v30;
        [(ICSETableViewItem *)v32 setAccount:v30];
        [(ICSETableViewItem *)v32 setIsSystemPaperFolder:1];
        [(ICSETableViewItem *)v32 setSelectedNote:v4];
        [(ICSETableViewItem *)v32 setSelectedFolder:v6];
        v33 = +[NSBundle mainBundle];
        v34 = [v33 localizedStringForKey:@"Quick Notes" value:&stru_1000F2510 table:0];
        [(ICSETableViewItem *)v32 setTitle:v34];

        [(ICSETableViewItem *)v32 setIsInFolderList:1];
        [v9 addObject:v32];
        uint64_t v62 = v32;
        [v65 addObject:v32];
        v35 = [(ICSETableViewController *)v2 folderListViewState];
        id v36 = (char *)[v35 countOfItemsInAccountAtIndex:v26];

        if (v36)
        {
          for (i = 0; i != v36; ++i)
          {
            v38 = +[NSIndexPath indexPathForRow:i inSection:v26];
            v39 = [(ICSETableViewController *)v2 folderListViewState];
            v40 = [v39 itemAtIndexPath:v38];

            unsigned __int8 v41 = +[ICSETableViewItem tableViewItemFromObject:v40 selectedNote:v4 selectedFolder:v6 isSearchResult:0 isAccountPicker:0];
            if ([v40 isAccount])
            {
              [v41 setIsAccountFolder:1];
              [v41 setIsAccountHeader:0];
              v42 = [v41 account];
              [v42 allItemsFolderLocalizedTitle];
              uint64_t v66 = v38;
              v43 = v9;
              v44 = v36;
              v45 = v6;
              v46 = v4;
              id v48 = v47 = v26;
              [v41 setTitle:v48];

              v26 = v47;
              objc_super v4 = v46;
              float v6 = v45;
              id v36 = v44;
              id v9 = v43;
              v38 = v66;
            }
            v49 = [v41 title];

            if (v49)
            {
              [v41 setIsInFolderList:1];
              [v9 addObject:v41];
              [v65 addObject:v41];
            }

            v2 = v67;
          }
        }
        id v50 = [(ICSETableViewController *)v2 folderTableViewItems];
        [v50 addObject:v65];

        ++v26;
        v25 = v61;
        uint64_t v7 = &_s10Foundation3URLVSHAAMc_ptr;
      }
      while (v26 != v61);
    }
  }
  else
  {
    id v51 = [(ICSETableViewController *)v2 representedItem];
    v52 = [v51 folder];

    double v53 = [(ICSETableViewController *)v2 representedItem];
    v54 = v53;
    if (v52)
    {
      v55 = [v53 folder];
      v56 = [(ICSETableViewController *)v2 representedItem];
      id v9 = -[ICSETableViewController noteItemsForContainer:hideNonSystemPaperNotes:](v2, "noteItemsForContainer:hideNonSystemPaperNotes:", v55, [v56 isSystemPaperFolder]);
    }
    else
    {
      v57 = [v53 account];

      if (v57)
      {
        v58 = [(ICSETableViewController *)v2 representedItem];
        v59 = [v58 account];
        v60 = [(ICSETableViewController *)v2 representedItem];
        id v9 = -[ICSETableViewController noteItemsForContainer:hideNonSystemPaperNotes:](v2, "noteItemsForContainer:hideNonSystemPaperNotes:", v59, [v60 isSystemPaperFolder]);
      }
      else
      {
        id v9 = &__NSArray0__struct;
      }
    }
  }
  [(ICSETableViewController *)v2 setTableViewItems:v9];
}

- (void)refreshTableView
{
  BOOL v3 = +[ICNoteContext sharedContext];
  [v3 refreshAll];

  if (![(ICSETableViewController *)self isShowingSearchResults])
  {
    [(ICSETableViewController *)self rebuildTableItems];
    if ([(ICSETableViewController *)self isNotePickerController]
      && [(ICSETableViewController *)self isRootController])
    {
      uint64_t v7 = 0;
      char v8 = 1;
    }
    else
    {
      BOOL v3 = [(ICSETableViewController *)self cancelButton];
      uint64_t v10 = v3;
      uint64_t v7 = +[NSArray arrayWithObjects:&v10 count:1];
      char v8 = 0;
    }
    id v9 = [(ICSETableViewController *)self navigationItem];
    [v9 setRightBarButtonItems:v7];

    if ((v8 & 1) == 0)
    {
    }
    float v6 = [(ICSETableViewController *)self tableView];
    [v6 reloadData];
    goto LABEL_11;
  }
  objc_super v4 = [(ICSETableViewController *)self searchString];
  id v5 = [v4 length];

  if (v5)
  {
    float v6 = [(ICSETableViewController *)self searchString];
    [(ICSETableViewController *)self performSearchForString:v6];
LABEL_11:
  }
  [(ICSETableViewController *)self showOrHideCreateNewNoteButton];
}

- (void)showOrHideCreateNewNoteButton
{
  unsigned int v3 = [(ICSETableViewController *)self isNotePickerController];
  objc_super v4 = [(ICSETableViewController *)self createNewNoteToolbar];
  id v5 = v4;
  if (v3)
  {
    [v4 setHidden:0];

    float v6 = [(ICSETableViewController *)self createNewNoteToolbar];
    [v6 bounds];
    double v8 = v7;

    id v9 = [(ICSETableViewController *)self tableView];
    [v9 setContentInset:0.0, 0.0, v8, 0.0];

    uint64_t v10 = [(ICSETableViewController *)self tableView];
    double top = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
    id v19 = v10;
    double v14 = v8;
  }
  else
  {
    [v4 setHidden:1];

    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
    id v18 = [(ICSETableViewController *)self tableView];
    [v18 setContentInset:UIEdgeInsetsZero.top, left, bottom, right];

    uint64_t v10 = [(ICSETableViewController *)self tableView];
    id v19 = v10;
    double top = UIEdgeInsetsZero.top;
    double v12 = left;
    double v14 = bottom;
    double v13 = right;
  }
  [v10 setScrollIndicatorInsets:top, v12, v14, v13];
}

- (id)noteItemsForContainer:(id)a3 hideNonSystemPaperNotes:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(ICSETableViewController *)self delegate];
  v35 = [v7 currentSelectedNoteForTableViewController:self];

  double v8 = [(ICSETableViewController *)self delegate];
  v34 = [v8 currentSelectedFolderForTableViewController:self];

  id v9 = [v6 visibleNotes];
  uint64_t v10 = v9;
  if (v4)
  {
    uint64_t v11 = [v9 ic_objectsPassingTest:&stru_1000EE5B8];

    uint64_t v10 = (void *)v11;
  }
  double v12 = [v6 customNoteSortType];
  double v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = +[ICFolderCustomNoteSortType noteSortTypeDefaultAscending];
  }
  id v15 = v14;

  v33 = v15;
  v16 = +[ICNoteListSortUtilities sortDescriptorsForCurrentTypeIncludingPinnedNotes:1 folderNoteSortType:v15];
  unsigned int v17 = [v10 sortedArrayUsingDescriptors:v16];

  id v18 = objc_alloc_init((Class)NSMutableArray);
  id v19 = objc_alloc_init((Class)NSMutableArray);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v20 = v17;
  id v21 = [v20 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v37;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v37 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if ([v25 isPinned]) {
          v26 = v18;
        }
        else {
          v26 = v19;
        }
        [v26 addObject:v25];
      }
      id v22 = [v20 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v22);
  }

  v27 = +[ICSETableViewItem tableViewItemsForObjects:v18 selectedNote:v35 selectedFolder:v34 isSearchResult:0 noteContainer:v6 isAccountPicker:0];
  id v28 = [v27 copy];
  [(ICSETableViewController *)self setPinnedNoteItems:v28];

  v29 = +[ICSETableViewItem tableViewItemsForObjects:v19 selectedNote:v35 selectedFolder:v34 isSearchResult:0 noteContainer:v6 isAccountPicker:0];
  id v30 = [v29 copy];
  [(ICSETableViewController *)self setNonPinnedNoteItems:v30];

  id v31 = v27;
  [v31 addObjectsFromArray:v29];

  return v31;
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v4 = [(ICSETableViewController *)self tableView];
  id v5 = [v4 visibleCells];

  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 contentSizeCategoryDidChange];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  uint64_t v11 = [(ICSETableViewController *)self tableView];
  [v11 reloadData];
}

- (NSArray)folderSortDescriptors
{
  v2 = +[NSSortDescriptor sortDescriptorWithKey:@"accountNameForAccountListSorting" ascending:1];
  unsigned int v3 = +[NSSortDescriptor sortDescriptorWithKey:@"sortOrder", 1, "compare:", v2 ascending selector];
  v7[1] = v3;
  BOOL v4 = +[NSSortDescriptor sortDescriptorWithKey:@"nestedTitleForSorting" ascending:1 selector:"localizedStandardCompare:"];
  v7[2] = v4;
  id v5 = +[NSArray arrayWithObjects:v7 count:3];

  return (NSArray *)v5;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if ([(ICSETableViewController *)self isShowingSearchResults])
  {
    if (a4 == 1)
    {
      id v6 = +[NSBundle mainBundle];
      id v7 = v6;
      CFStringRef v8 = @"Notes";
    }
    else
    {
      if (a4)
      {
        long long v15 = &stru_1000F2510;
        goto LABEL_17;
      }
      id v6 = +[NSBundle mainBundle];
      id v7 = v6;
      CFStringRef v8 = @"Folders";
    }
    long long v15 = [v6 localizedStringForKey:v8 value:&stru_1000F2510 table:0];

LABEL_17:
    unsigned int v17 = [(ICSETableViewController *)self tableView];
    id v18 = (objc_class *)objc_opt_class();
    id v19 = NSStringFromClass(v18);
    id v10 = [v17 dequeueReusableHeaderFooterViewWithIdentifier:v19];

    [v10 setTypeLabelText:v15];
    id v20 = +[NSBundle mainBundle];
    id v21 = [v20 localizedStringForKey:@"%ld Found" value:&stru_1000F2510 table:0];

    id v22 = [(ICSETableViewController *)self searchTableViewItems];
    uint64_t v23 = [v22 objectAtIndexedSubscript:a4];
    v24 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v21, [v23 count]);
    [v10 setCountLabelText:v24];

    goto LABEL_18;
  }
  if ([(ICSETableViewController *)self isAccountPickerController]
    && ![(ICSETableViewController *)self isShowingSearchResults])
  {
    if (a4 == 1)
    {
      v25 = +[NSBundle mainBundle];
      v26 = v25;
      CFStringRef v27 = @"Save To Location:";
    }
    else
    {
      if (a4)
      {
        long long v38 = 0;
LABEL_33:
        long long v15 = [v38 localizedUppercaseString];

        if (!v15 || ![(__CFString *)v15 length])
        {
          id v10 = 0;
          goto LABEL_19;
        }
        long long v39 = [(ICSETableViewController *)self tableView];
        v40 = (objc_class *)objc_opt_class();
        unsigned __int8 v41 = NSStringFromClass(v40);
        id v10 = [v39 dequeueReusableHeaderFooterViewWithIdentifier:v41];

        id v21 = [v10 textLabel];
        [v21 setText:v15];
LABEL_18:

LABEL_19:
        goto LABEL_25;
      }
      v25 = +[NSBundle mainBundle];
      v26 = v25;
      CFStringRef v27 = @"Save To New Note In:";
    }
    long long v38 = [v25 localizedStringForKey:v27 value:&stru_1000F2510 table:0];

    goto LABEL_33;
  }
  if (![(ICSETableViewController *)self isFolderPickerController]
    || [(ICSETableViewController *)self isShowingSearchResults])
  {
    if ([(ICSETableViewController *)self isNotePickerController])
    {
      id v9 = [(ICSETableViewController *)self pinnedNoteItems];
      id v10 = [v9 count];

      if (!v10) {
        goto LABEL_25;
      }
      uint64_t v11 = [(ICSETableViewController *)self tableView];
      long long v12 = (objc_class *)objc_opt_class();
      long long v13 = NSStringFromClass(v12);
      id v10 = [v11 dequeueReusableHeaderFooterViewWithIdentifier:v13];

      if (a4 == 1)
      {
        long long v14 = +[NSBundle mainBundle];
        long long v15 = v14;
        CFStringRef v16 = @"Notes";
      }
      else
      {
        if (a4) {
          goto LABEL_25;
        }
        long long v14 = +[NSBundle mainBundle];
        long long v15 = v14;
        CFStringRef v16 = @"Pinned";
      }
      uint64_t v37 = [(__CFString *)v14 localizedStringForKey:v16 value:&stru_1000F2510 table:0];
      goto LABEL_39;
    }
    goto LABEL_24;
  }
  id v28 = [(ICSETableViewController *)self accounts];
  id v29 = [v28 count];

  if (v29 == (id)1)
  {
LABEL_24:
    id v10 = 0;
    goto LABEL_25;
  }
  id v31 = [(ICSETableViewController *)self tableView];
  v32 = (objc_class *)objc_opt_class();
  v33 = NSStringFromClass(v32);
  id v10 = [v31 dequeueReusableHeaderFooterViewWithIdentifier:v33];

  v34 = [(ICSETableViewController *)self accounts];
  id v35 = [v34 count];

  if ((unint64_t)v35 > a4)
  {
    long long v36 = [(ICSETableViewController *)self accounts];
    long long v15 = [v36 objectAtIndexedSubscript:a4];

    uint64_t v37 = [(__CFString *)v15 localizedName];
LABEL_39:
    id v21 = (void *)v37;
    [v10 setTypeLabelText:v37];
    goto LABEL_18;
  }
LABEL_25:

  return v10;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100017860;
  v6[3] = &unk_1000EE0C0;
  id v7 = a4;
  id v5 = v7;
  +[UIView performWithoutAnimation:v6];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ([(ICSETableViewController *)self isShowingSearchResults])
  {
    BOOL v4 = [(ICSETableViewController *)self searchTableViewItems];
    goto LABEL_7;
  }
  if (![(ICSETableViewController *)self isAccountPickerController])
  {
    if (![(ICSETableViewController *)self isFolderPickerController])
    {
      if (![(ICSETableViewController *)self isNotePickerController]) {
        return 1;
      }
      id v6 = [(ICSETableViewController *)self pinnedNoteItems];
      if ([v6 count]) {
        int64_t v5 = 2;
      }
      else {
        int64_t v5 = 1;
      }
      goto LABEL_8;
    }
    BOOL v4 = [(ICSETableViewController *)self accounts];
LABEL_7:
    id v6 = v4;
    int64_t v5 = (int64_t)[v4 count];
LABEL_8:

    return v5;
  }
  return 2;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  BOOL v4 = [(ICSETableViewController *)self tableView];
  uint64_t v5 = (uint64_t)[v4 numberOfSections];

  if (v5 < 2) {
    return UITableViewAutomaticDimension;
  }
  id v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
  [v6 pointSize];
  double v8 = v7 * 3.0;

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.1;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if (![(ICSETableViewController *)self isShowingSearchResults]
    && [(ICSETableViewController *)self isAccountPickerController]
    && [v5 section] == (id)1
    || [(ICSETableViewController *)self isFolderPickerController])
  {
    double v6 = UITableViewAutomaticDimension;
  }
  else
  {
    double v7 = [(ICSETableViewController *)self itemForIndexPath:v5];
    [v7 cellHeight];
    double v6 = v8;
  }
  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(ICSETableViewController *)self isShowingSearchResults])
  {
LABEL_2:
    uint64_t v6 = [(ICSETableViewController *)self itemsForSection:a4];
LABEL_3:
    id v7 = (id)v6;
LABEL_4:
    id v8 = [v7 count];

    return (int64_t)v8;
  }
  unsigned __int8 v10 = [(ICSETableViewController *)self isAccountPickerController];
  if (a4 == 1 && (v10 & 1) != 0) {
    return 1;
  }
  if ([(ICSETableViewController *)self isFolderPickerController])
  {
    uint64_t v11 = [(ICSETableViewController *)self folderTableViewItems];
    id v12 = [v11 count];

    if ((unint64_t)v12 > a4)
    {
      long long v13 = [(ICSETableViewController *)self folderTableViewItems];
      long long v14 = [v13 objectAtIndexedSubscript:a4];
      id v7 = [v14 copy];

      goto LABEL_4;
    }
  }
  if (![(ICSETableViewController *)self isNotePickerController]) {
    goto LABEL_2;
  }
  long long v15 = [(ICSETableViewController *)self pinnedNoteItems];
  id v16 = [v15 count];

  if (!v16 || a4 == 1)
  {
    uint64_t v6 = [(ICSETableViewController *)self nonPinnedNoteItems];
    goto LABEL_3;
  }
  if (!a4)
  {
    uint64_t v6 = [(ICSETableViewController *)self pinnedNoteItems];
    goto LABEL_3;
  }
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ICSETableViewController *)self isShowingSearchResults]
    || ![(ICSETableViewController *)self isAccountPickerController])
  {
    long long v14 = [(ICSETableViewController *)self itemForIndexPath:v7];
    if ([v14 isSearchResult])
    {
      id v19 = [v14 folder];

      if (v19 || ([v14 note], id v20 = objc_claimAutoreleasedReturnValue(), v20, v20))
      {
        id v21 = [v14 cellIdentifier];
        uint64_t v11 = [v6 dequeueReusableCellWithIdentifier:v21 forIndexPath:v7];

        id v22 = [(ICSETableViewController *)self accounts];
        objc_msgSend(v11, "setShowAccountName:", (unint64_t)objc_msgSend(v22, "count") > 1);

        [v11 setItem:v14];
      }
      else
      {
        uint64_t v37 = os_log_create("com.apple.notes", "SharingExtension");
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          sub_1000B5DF0(v37);
        }

        uint64_t v11 = 0;
      }
LABEL_39:

      if (!v11) {
        goto LABEL_40;
      }
LABEL_28:
      id v36 = v11;
      goto LABEL_41;
    }
    id v23 = v14;
    if ([(ICSETableViewController *)self isFolderPickerController])
    {
      id v24 = [v7 section];
      v25 = [(ICSETableViewController *)self folderTableViewItems];
      if (v24 >= [v25 count])
      {
      }
      else
      {
        unsigned __int8 v26 = [(ICSETableViewController *)self isShowingSearchResults];

        if ((v26 & 1) == 0)
        {
          CFStringRef v27 = [(ICSETableViewController *)self folderTableViewItems];
          id v28 = objc_msgSend(v27, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));

LABEL_34:
          uint64_t v38 = [v28 objectAtIndexedSubscript:[v7 row]];

          id v23 = (id)v38;
          goto LABEL_35;
        }
      }
    }
    if ([(ICSETableViewController *)self isNotePickerController]
      && ![(ICSETableViewController *)self isShowingSearchResults])
    {
      id v29 = [(ICSETableViewController *)self pinnedNoteItems];
      id v30 = [v29 count];

      if (!v30 || (id v31 = [v7 section], v31 == (id)1))
      {
        uint64_t v32 = [(ICSETableViewController *)self nonPinnedNoteItems];
        goto LABEL_33;
      }
      if (!v31)
      {
        uint64_t v32 = [(ICSETableViewController *)self pinnedNoteItems];
LABEL_33:
        id v28 = (void *)v32;
        goto LABEL_34;
      }
    }
LABEL_35:
    if (v23)
    {
      long long v39 = [v23 cellIdentifier];
      uint64_t v11 = [v6 dequeueReusableCellWithIdentifier:v39 forIndexPath:v7];

      [v11 setTableViewItem:v23];
      [v11 setDelegate:self];
      [v11 setNeedsUpdateConstraints];
    }
    else
    {
      uint64_t v11 = 0;
    }

    goto LABEL_39;
  }
  id v8 = [(ICSETableViewController *)self tableView];
  id v9 = (objc_class *)objc_opt_class();
  unsigned __int8 v10 = NSStringFromClass(v9);
  uint64_t v11 = [v8 dequeueReusableCellWithIdentifier:v10];

  if ((+[UIDevice ic_isVision] & 1) == 0)
  {
    id v12 = +[UIColor ICTintColor];
    [v11 setTintColor:v12];
  }
  id v13 = [v7 section];
  if (v13 == (id)1)
  {
    v33 = +[NSBundle mainBundle];
    v34 = [v33 localizedStringForKey:@"Choose Note or Folder" value:&stru_1000F2510 table:0];
    id v35 = [v11 textLabel];
    [v35 setText:v34];

    [v11 setAccessoryType:1];
  }
  else if (!v13)
  {
    long long v14 = [(ICSETableViewController *)self itemForIndexPath:v7];
    if ([v14 isChecked]) {
      uint64_t v15 = 3;
    }
    else {
      uint64_t v15 = 0;
    }
    [v11 setAccessoryType:v15];
    id v16 = [v14 account];
    unsigned int v17 = [v16 localizedName];
    id v18 = [v11 textLabel];
    [v18 setText:v17];

    goto LABEL_39;
  }
  if (v11) {
    goto LABEL_28;
  }
LABEL_40:
  id v36 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
LABEL_41:
  v40 = v36;

  return v40;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(ICSETableViewController *)self isAccountPickerController]
    && ![(ICSETableViewController *)self isShowingSearchResults])
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    id v6 = [(ICSETableViewController *)self itemForIndexPath:v5];
    unsigned __int8 v7 = [v6 isSelectable];
  }
  return v7;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  if ([(ICSETableViewController *)self tableView:a3 shouldHighlightRowAtIndexPath:v6])
  {
    unsigned __int8 v7 = v6;
  }
  else
  {
    unsigned __int8 v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (void)selectNote:(id)a3 orFolder:(id)a4 prefersSystemPaper:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  [(ICSETableViewController *)self setInhibitSearchCancelAnimation:1];
  unsigned __int8 v10 = [(ICSETableViewController *)self searchBar];
  [v10 resignFirstResponder];

  uint64_t v11 = [(ICSETableViewController *)self delegate];
  [v11 tableController:self didSelectNote:v9 folder:v8 prefersSystemPaper:v5];

  id v13 = [(ICSETableViewController *)self containerViewController];
  id v12 = [v13 rootViewController];
  [v12 setIsShowingSearchResults:0 animated:1];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v27 = [(ICSETableViewController *)self itemForIndexPath:v6];
  id v8 = [v27 note];

  if (v8)
  {
    id v9 = [v27 note];
    unsigned __int8 v10 = [v27 folder];
    uint64_t v11 = [v27 note];
    -[ICSETableViewController selectNote:orFolder:prefersSystemPaper:](self, "selectNote:orFolder:prefersSystemPaper:", v9, v10, [v11 isSystemPaper]);

    goto LABEL_20;
  }
  if ([v27 isAccountPicker])
  {
    id v9 = [v27 account];
    unsigned __int8 v10 = [v9 defaultFolder];
    [(ICSETableViewController *)self selectNote:0 orFolder:v10 prefersSystemPaper:0];
    goto LABEL_20;
  }
  id v12 = [(ICSETableViewController *)self storyboard];
  id v9 = [v12 instantiateViewControllerWithIdentifier:@"tableController"];

  [v9 setRepresentedItem:v27];
  if (v27 || ![(ICSETableViewController *)self isAccountPickerController])
  {
    [v9 setTableViewType:2];
    uint64_t v13 = [v27 title];
  }
  else
  {
    [v9 setTableViewType:1];
    uint64_t v13 = [(ICSETableViewController *)self folderPickerTitle];
  }
  long long v14 = (void *)v13;
  [v9 setTitle:v13];

  uint64_t v15 = [(ICSETableViewController *)self containerViewController];
  [v9 setContainerViewController:v15];

  id v16 = [(ICSETableViewController *)self delegate];
  [v9 setDelegate:v16];

  unsigned int v17 = [(ICSETableViewController *)self accounts];
  [v9 setAccounts:v17];

  uint64_t v18 = [v27 folder];
  if (v18)
  {
    id v19 = (void *)v18;
    unsigned int v20 = [(ICSETableViewController *)self isShowingSearchResults];

    if (v20) {
      [v9 setSearchBarHidden:1];
    }
  }
  unsigned __int8 v10 = [(ICSETableViewController *)self title];
  if ([(ICSETableViewController *)self isAccountPickerController])
  {
    uint64_t v21 = [(ICSETableViewController *)self accountPickerBackButtonTitle];
LABEL_16:
    id v22 = (void *)v21;

    unsigned __int8 v10 = v22;
    goto LABEL_17;
  }
  if ([(ICSETableViewController *)self isFolderPickerController])
  {
    uint64_t v21 = [(ICSETableViewController *)self folderPickerBackButtonTitle];
    goto LABEL_16;
  }
LABEL_17:
  if ([(ICSETableViewController *)self isShowingSearchResults])
  {
    id v23 = +[NSBundle mainBundle];
    uint64_t v24 = [v23 localizedStringForKey:@"Search" value:&stru_1000F2510 table:0];

    unsigned __int8 v10 = (void *)v24;
  }
  v25 = [v9 backBarButtonItem];
  [v25 setTitle:v10];

  [(ICSETableViewController *)self setInhibitSearchCancelAnimation:1];
  unsigned __int8 v26 = [(ICSETableViewController *)self navigationController];
  [v26 pushViewController:v9 animated:1];

LABEL_20:
  [v7 deselectRowAtIndexPath:v6 animated:1];
}

- (void)pushFolderViewForNote:(id)a3
{
  if (!a3) {
    return;
  }
  id v31 = [a3 folder];
  if (![(ICSETableViewController *)self isShowingSearchResults])
  {
    if ([(ICSETableViewController *)self isAccountPickerController])
    {
      BOOL v4 = [(ICSETableViewController *)self accounts];
      if ((unint64_t)[v4 count] >= 2)
      {

LABEL_8:
        id v7 = [(ICSETableViewController *)self storyboard];
        id v8 = [v7 instantiateViewControllerWithIdentifier:@"tableController"];

        int v9 = 1;
        [v8 setTableViewType:1];
        unsigned __int8 v10 = [(ICSETableViewController *)self folderPickerTitle];
        [v8 setTitle:v10];

        uint64_t v11 = [(ICSETableViewController *)self containerViewController];
        [v8 setContainerViewController:v11];

        id v12 = [(ICSETableViewController *)self delegate];
        [v8 setDelegate:v12];

        uint64_t v13 = [(ICSETableViewController *)self accounts];
        [v8 setAccounts:v13];

        long long v14 = [(ICSETableViewController *)self accountPickerBackButtonTitle];
        uint64_t v15 = [v8 backBarButtonItem];
        [v15 setTitle:v14];

        id v16 = [(ICSETableViewController *)self navigationController];
        [v16 pushViewController:v8 animated:0];

LABEL_10:
        if (v31
          && ([(ICSETableViewController *)self isFolderPickerController]
           || [(ICSETableViewController *)self isAccountPickerController]))
        {
          unsigned int v17 = [(ICSETableViewController *)self delegate];
          uint64_t v18 = [v17 currentSelectedNoteForTableViewController:self];

          id v19 = [(ICSETableViewController *)self delegate];
          unsigned int v20 = [v19 currentSelectedFolderForTableViewController:self];

          uint64_t v21 = +[ICSETableViewItem tableViewItemFromObject:v31 selectedNote:v18 selectedFolder:v20 isSearchResult:0 isAccountPicker:0];
          if (v21)
          {
            id v22 = [(ICSETableViewController *)self storyboard];
            id v23 = [v22 instantiateViewControllerWithIdentifier:@"tableController"];

            uint64_t v24 = [(ICSETableViewController *)self containerViewController];
            [v23 setContainerViewController:v24];

            [v23 setTableViewType:2];
            [v23 setRepresentedItem:v21];
            v25 = [v21 title];
            [v23 setTitle:v25];

            unsigned __int8 v26 = [(ICSETableViewController *)self delegate];
            [v23 setDelegate:v26];

            id v27 = [(ICSETableViewController *)self accounts];
            [v23 setAccounts:v27];

            if ((v9 | [(ICSETableViewController *)self isFolderPickerController]) == 1)
            {
              id v28 = [(ICSETableViewController *)self folderPickerBackButtonTitle];
              id v29 = [v23 backBarButtonItem];
              [v29 setTitle:v28];
            }
            id v30 = [(ICSETableViewController *)self navigationController];
            [v30 pushViewController:v23 animated:0];
          }
        }
        goto LABEL_18;
      }
      BOOL v5 = [v31 account];
      unsigned int v6 = [v5 hasAnyCustomFoldersIncludingSystem:1];

      if (v6) {
        goto LABEL_8;
      }
    }
    int v9 = 0;
    goto LABEL_10;
  }
LABEL_18:
}

- (id)itemForIndexPath:(id)a3
{
  id v4 = a3;
  if ([(ICSETableViewController *)self isFolderPickerController]
    && ![(ICSETableViewController *)self isShowingSearchResults])
  {
    id v5 = [v4 section];
    unsigned int v6 = [(ICSETableViewController *)self folderTableViewItems];
    if (v5 >= [v6 count])
    {
    }
    else
    {
      id v7 = [v4 row];
      id v8 = [(ICSETableViewController *)self folderTableViewItems];
      int v9 = [v8 objectAtIndexedSubscript:[v4 section]];
      id v10 = [v9 count];

      if (v7 < v10)
      {
        uint64_t v11 = [(ICSETableViewController *)self folderTableViewItems];
        id v12 = [v11 objectAtIndexedSubscript:[v4 section]];
        uint64_t v13 = [v12 objectAtIndexedSubscript:[v4 row]];

        goto LABEL_13;
      }
    }
  }
  long long v14 = (char *)[v4 row];
  if (![(ICSETableViewController *)self isShowingSearchResults]
    && [v4 section] == (id)1)
  {
    uint64_t v15 = [(ICSETableViewController *)self tableView];
    id v16 = [v15 numberOfRowsInSection:0];

    long long v14 = &v14[(void)v16];
  }
  uint64_t v11 = -[ICSETableViewController itemsForSection:](self, "itemsForSection:", [v4 section]);
  if (v14 >= [v11 count])
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = [v11 objectAtIndexedSubscript:v14];
  }
LABEL_13:

  return v13;
}

- (id)itemsForSection:(unint64_t)a3
{
  unsigned int v5 = [(ICSETableViewController *)self isShowingSearchResults];
  if (a3 <= 1 && v5)
  {
    unsigned int v6 = [(ICSETableViewController *)self searchTableViewItems];
    id v7 = [v6 objectAtIndexedSubscript:a3];
  }
  else if (!a3 {
         || a3 == 1
  }
         && [(ICSETableViewController *)self isNotePickerController]
         && ([(ICSETableViewController *)self pinnedNoteItems],
             id v8 = objc_claimAutoreleasedReturnValue(),
             v8,
             v8))
  {
    id v7 = [(ICSETableViewController *)self tableViewItems];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)tableViewCell:(id)a3 setCollapsed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(ICSETableViewController *)self tableView];
  id v10 = [v7 indexPathForCell:v6];

  id v8 = [v6 tableViewItem];

  int v9 = [v8 folderListItem];

  if (v10 && v9)
  {
    if (v4) {
      [(ICSETableViewController *)self collapseFolderListItem:v9 atIndexPath:v10];
    }
    else {
      [(ICSETableViewController *)self expandFolderListItem:v9 atIndexPath:v10];
    }
  }
}

- (void)collapseFolderListItem:(id)a3 atIndexPath:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (([v14 isCollapsible] & 1) == 0) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "item.isCollapsible", "-[ICSETableViewController collapseFolderListItem:atIndexPath:]", 1, 0, @"Trying to collapse item that is not collapsible");
  }
  if ([v14 isCollapsible] && (objc_msgSend(v14, "isCollapsed") & 1) == 0)
  {
    id v7 = (char *)[v14 countOfVisibleDescendants];
    id v8 = [(ICSETableViewController *)self tableView];
    [v8 beginUpdates];

    [v14 setCollapsed:1];
    [(ICSETableViewController *)self rebuildTableItems];
    int v9 = +[NSMutableArray array];
    for (i = [v6 row] + 1; i <= [v6 row]; ++i)
    {
      uint64_t v11 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", i, [v6 section]);
      [v9 addObject:v11];
    }
    id v12 = [(ICSETableViewController *)self tableView];
    [v12 deleteRowsAtIndexPaths:v9 withRowAnimation:3];

    uint64_t v13 = [(ICSETableViewController *)self tableView];
    [v13 endUpdates];
  }
}

- (void)expandFolderListItem:(id)a3 atIndexPath:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (([v14 isCollapsible] & 1) == 0) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "item.isCollapsible", "-[ICSETableViewController expandFolderListItem:atIndexPath:]", 1, 0, @"Trying to expand item that is not collapsible");
  }
  if ([v14 isCollapsible] && objc_msgSend(v14, "isCollapsed"))
  {
    id v7 = [(ICSETableViewController *)self tableView];
    [v7 beginUpdates];

    [v14 setCollapsed:0];
    [(ICSETableViewController *)self rebuildTableItems];
    id v8 = (char *)[v14 countOfVisibleDescendants];
    int v9 = +[NSMutableArray array];
    for (i = [v6 row] + 1; i <= [v6 row]; ++i)
    {
      uint64_t v11 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", i, [v6 section]);
      [v9 addObject:v11];
    }
    id v12 = [(ICSETableViewController *)self tableView];
    [v12 insertRowsAtIndexPaths:v9 withRowAnimation:3];

    uint64_t v13 = [(ICSETableViewController *)self tableView];
    [v13 endUpdates];
  }
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  [a4 ic_trimmedString:a3];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if ([v6 length])
  {
    [(ICSETableViewController *)self performSearchForString:v6];
  }
  else
  {
    [(ICSETableViewController *)self setSearchTableViewItems:&off_1000F4400];
    [(ICSETableViewController *)self showOrHideEmptyTableCellsIfNecessary];
    unsigned int v5 = [(ICSETableViewController *)self tableView];
    [v5 reloadData];
  }
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  return 1;
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v3 = [(ICSETableViewController *)self searchBar];
  [v3 resignFirstResponder];
}

- (void)searchCancelButtonPressed:(id)a3
{
  BOOL v4 = [(ICSETableViewController *)self searchBar];
  [v4 resignFirstResponder];

  unsigned int v5 = [(ICSETableViewController *)self searchBar];
  [v5 setText:&stru_1000F2510];

  [(ICSETableViewController *)self setIsShowingSearchResults:0];
  [(ICSETableViewController *)self setSearchTableViewItems:&off_1000F4418];
  id v6 = [(ICSETableViewController *)self tableView];
  [v6 reloadData];
}

- (void)setIsShowingSearchResults:(BOOL)a3
{
}

- (void)setIsShowingSearchResults:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_isShowingSearchResults != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_isShowingSearchResults = a3;
    if (![(ICSETableViewController *)self inhibitSearchCancelAnimation]) {
      [(ICSETableViewController *)self setUpForIsShowingSearchResults:v5 animated:v4];
    }
  }
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
  UIAccessibilityNotifications v7 = UIAccessibilityScreenChangedNotification;

  UIAccessibilityPostNotification(v7, 0);
}

- (void)setUpForIsShowingSearchResults:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  self->_isShowingSearchResults = a3;
  if (a3)
  {
    id v7 = [(ICSETableViewController *)self tableView];
    [v7 setTableFooterView:0];
    double v8 = 16.0;
    double v9 = 10.0;
    double v10 = 500.0;
  }
  else
  {
    id v7 = objc_alloc_init((Class)UIView);
    uint64_t v11 = [(ICSETableViewController *)self tableView];
    [v11 setTableFooterView:v7];

    double v8 = 8.0;
    double v10 = 0.0;
    double v9 = -2.0;
  }

  id v12 = [(ICSETableViewController *)self tableView];
  [v12 reloadData];

  if (v4) {
    double v13 = 0.25;
  }
  else {
    double v13 = 0.0;
  }
  id v14 = [(ICSETableViewController *)self searchCancelTrailingConstraint];
  [v14 setConstant:v8];

  uint64_t v15 = [(ICSETableViewController *)self searchCancelButtonMaxWidthConstraint];
  [v15 setConstant:v10];

  id v16 = [(ICSETableViewController *)self searchBarActiveTopConstraint];
  [v16 setConstant:v9];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100019388;
  v17[3] = &unk_1000EE5E0;
  v17[4] = self;
  BOOL v18 = a3;
  BOOL v19 = v4;
  +[UIView animateWithDuration:v17 animations:v13];
  [(ICSETableViewController *)self showOrHideEmptyTableCellsIfNecessary];
}

- (void)performSearchForString:(id)a3
{
  id v5 = a3;
  id v6 = os_log_create("com.apple.notes", "SharingExtension");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = objc_opt_class();
    id v16 = v15;
    unsigned int v17 = NSStringFromSelector(a2);
    *(_DWORD *)id location = 138413314;
    *(void *)&location[4] = v15;
    __int16 v25 = 2048;
    unsigned __int8 v26 = self;
    __int16 v27 = 2112;
    id v28 = v17;
    __int16 v29 = 2048;
    id v30 = [v5 hash];
    __int16 v31 = 2048;
    id v32 = [v5 length];
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%@(%p) %@] Search query string: hash=%lu, length=%lu", location, 0x34u);
  }
  if (!v5) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((searchString) != nil)", "-[ICSETableViewController performSearchForString:]", 1, 0, @"Expected non-nil value for '%s'", "searchString");
  }
  [(ICSETableViewController *)self setSearchString:v5];
  id v7 = [(ICSETableViewController *)self queryOperationQueue];
  [v7 cancelAllOperations];

  double v8 = +[ICNoteContext sharedContext];
  double v9 = [v8 managedObjectContext];

  id v10 = [objc_alloc((Class)ICSearchQueryOperation) initWithSearchSuggestionsResponder:0 searchString:v5 performNLSearch:1 performTopHitSearch:0 tokens:&__NSArray0__struct modernResultsOnly:0];
  uint64_t v11 = (char *)[(ICSETableViewController *)self queryRequestIndex] + 1;
  [(ICSETableViewController *)self setQueryRequestIndex:v11];
  [v10 setRequestIndex:v11];
  objc_initWeak((id *)location, v10);
  objc_initWeak(&from, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100019784;
  v18[3] = &unk_1000EE630;
  objc_copyWeak(&v21, (id *)location);
  v18[4] = self;
  id v12 = v9;
  id v19 = v12;
  objc_copyWeak(&v22, &from);
  id v13 = v5;
  id v20 = v13;
  [v10 setCompletionBlock:v18];
  id v14 = [(ICSETableViewController *)self queryOperationQueue];
  [v14 addOperation:v10];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&from);
  objc_destroyWeak((id *)location);
}

- (void)setupSearchResultsWithSearchString:(id)a3 notes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(ICSETableViewController *)self delegate];
  double v9 = [v8 currentSelectedNoteForTableViewController:self];

  id v10 = [(ICSETableViewController *)self delegate];
  uint64_t v11 = [v10 currentSelectedFolderForTableViewController:self];

  id v12 = [(ICSETableViewController *)self matchingFoldersForString:v7];

  id v13 = +[ICSETableViewItem tableViewItemsForObjects:v12 selectedNote:v9 selectedFolder:v11 isSearchResult:1 noteContainer:0 isAccountPicker:0];
  id v14 = +[ICSETableViewItem tableViewItemsForObjects:v6 selectedNote:v9 selectedFolder:v11 isSearchResult:1 noteContainer:0 isAccountPicker:0];

  v17[0] = v13;
  v17[1] = v14;
  uint64_t v15 = +[NSArray arrayWithObjects:v17 count:2];
  [(ICSETableViewController *)self setSearchTableViewItems:v15];

  [(ICSETableViewController *)self showOrHideEmptyTableCellsIfNecessary];
  id v16 = [(ICSETableViewController *)self tableView];
  [v16 reloadData];
}

- (NSArray)allFolders
{
  allFolders = self->_allFolders;
  if (!allFolders)
  {
    self->_allFolders = (NSArray *)&__NSArray0__struct;

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    BOOL v4 = [(ICSETableViewController *)self accounts];
    id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        double v8 = 0;
        do
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          double v9 = self->_allFolders;
          id v10 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v8) visibleFolders];
          uint64_t v11 = [v10 ic_objectsPassingTest:&stru_1000EE670];
          id v12 = [(NSArray *)v9 ic_arrayByAddingObjectsFromNonNilArray:v11];
          id v13 = self->_allFolders;
          self->_allFolders = v12;

          double v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }

    allFolders = self->_allFolders;
  }

  return allFolders;
}

- (id)matchingFoldersForString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(ICSETableViewController *)self allFolders];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001A010;
    v8[3] = &unk_1000EE698;
    id v9 = v4;
    id v6 = [v5 ic_objectsPassingTest:v8];
  }
  else
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((string) != nil)", "-[ICSETableViewController matchingFoldersForString:]", 1, 0, @"Expected non-nil value for '%s'", "string");
    id v6 = &__NSArray0__struct;
  }

  return v6;
}

- (double)consumedBottomAreaForResizer:(id)a3
{
  id v3 = [(ICSETableViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;

  return v5;
}

- (double)topInsetForResizer:(id)a3
{
  id v3 = [(ICSETableViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;

  return v5;
}

- (BOOL)keyboardResizerAutoscrollAboveKeyboard
{
  return 1;
}

- (ICSETableViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICSETableViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ICSEContainerViewController)containerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  return (ICSEContainerViewController *)WeakRetained;
}

- (void)setContainerViewController:(id)a3
{
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);

  return (UITableView *)WeakRetained;
}

- (void)setTableView:(id)a3
{
}

- (NSArray)accounts
{
  return self->_accounts;
}

- (unint64_t)tableViewType
{
  return self->_tableViewType;
}

- (void)setTableViewType:(unint64_t)a3
{
  self->_tableViewType = a3;
}

- (BOOL)isShowingSearchResults
{
  return self->_isShowingSearchResults;
}

- (UISearchBar)searchBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);

  return (UISearchBar *)WeakRetained;
}

- (void)setSearchBar:(id)a3
{
}

- (BOOL)searchBarHidden
{
  return self->_searchBarHidden;
}

- (UIToolbar)createNewNoteToolbar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_createNewNoteToolbar);

  return (UIToolbar *)WeakRetained;
}

- (void)setCreateNewNoteToolbar:(id)a3
{
}

- (NSLayoutConstraint)createNewNoteToolbarHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_createNewNoteToolbarHeightConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setCreateNewNoteToolbarHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)createNewNoteToolbarBottomConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_createNewNoteToolbarBottomConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setCreateNewNoteToolbarBottomConstraint:(id)a3
{
}

- (UIButton)createNewNoteButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_createNewNoteButton);

  return (UIButton *)WeakRetained;
}

- (void)setCreateNewNoteButton:(id)a3
{
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (UIButton)searchCancelButton
{
  return self->_searchCancelButton;
}

- (void)setSearchCancelButton:(id)a3
{
}

- (NSLayoutConstraint)searchCancelButtonMaxWidthConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchCancelButtonMaxWidthConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setSearchCancelButtonMaxWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)searchBarActiveTopConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBarActiveTopConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setSearchBarActiveTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)searchBarZeroHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchBarZeroHeightConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setSearchBarZeroHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)searchCancelTrailingConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchCancelTrailingConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setSearchCancelTrailingConstraint:(id)a3
{
}

- (BOOL)tableViewHidesEmptyCells
{
  return self->_tableViewHidesEmptyCells;
}

- (BOOL)inhibitSearchCancelAnimation
{
  return self->_inhibitSearchCancelAnimation;
}

- (void)setInhibitSearchCancelAnimation:(BOOL)a3
{
  self->_inhibitSearchCancelAnimation = a3;
}

- (UIBarButtonItem)backBarButtonItem
{
  return self->_backBarButtonItem;
}

- (void)setBackBarButtonItem:(id)a3
{
}

- (ICSETableViewItem)representedItem
{
  return self->_representedItem;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
}

- (NSOperationQueue)queryOperationQueue
{
  return self->_queryOperationQueue;
}

- (void)setQueryOperationQueue:(id)a3
{
}

- (int64_t)queryRequestIndex
{
  return self->_queryRequestIndex;
}

- (void)setQueryRequestIndex:(int64_t)a3
{
  self->_queryRequestIndex = a3;
}

- (void)setAllFolders:(id)a3
{
}

- (NSMutableArray)folderTableViewItems
{
  return self->_folderTableViewItems;
}

- (void)setFolderTableViewItems:(id)a3
{
}

- (NSArray)pinnedNoteItems
{
  return self->_pinnedNoteItems;
}

- (void)setPinnedNoteItems:(id)a3
{
}

- (NSArray)nonPinnedNoteItems
{
  return self->_nonPinnedNoteItems;
}

- (void)setNonPinnedNoteItems:(id)a3
{
}

- (NSArray)tableViewItems
{
  return self->_tableViewItems;
}

- (NSArray)searchTableViewItems
{
  return self->_searchTableViewItems;
}

- (void)setSearchTableViewItems:(id)a3
{
}

- (ICSEFolderListViewState)folderListViewState
{
  return self->_folderListViewState;
}

- (void)setFolderListViewState:(id)a3
{
}

- (ICScrollViewKeyboardResizer)scrollViewResizer
{
  return self->_scrollViewResizer;
}

- (void)setScrollViewResizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollViewResizer, 0);
  objc_storeStrong((id *)&self->_folderListViewState, 0);
  objc_storeStrong((id *)&self->_searchTableViewItems, 0);
  objc_storeStrong((id *)&self->_tableViewItems, 0);
  objc_storeStrong((id *)&self->_nonPinnedNoteItems, 0);
  objc_storeStrong((id *)&self->_pinnedNoteItems, 0);
  objc_storeStrong((id *)&self->_folderTableViewItems, 0);
  objc_storeStrong((id *)&self->_allFolders, 0);
  objc_storeStrong((id *)&self->_queryOperationQueue, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_representedItem, 0);
  objc_storeStrong((id *)&self->_backBarButtonItem, 0);
  objc_destroyWeak((id *)&self->_searchCancelTrailingConstraint);
  objc_destroyWeak((id *)&self->_searchBarZeroHeightConstraint);
  objc_destroyWeak((id *)&self->_searchBarActiveTopConstraint);
  objc_destroyWeak((id *)&self->_searchCancelButtonMaxWidthConstraint);
  objc_storeStrong((id *)&self->_searchCancelButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_destroyWeak((id *)&self->_createNewNoteButton);
  objc_destroyWeak((id *)&self->_createNewNoteToolbarBottomConstraint);
  objc_destroyWeak((id *)&self->_createNewNoteToolbarHeightConstraint);
  objc_destroyWeak((id *)&self->_createNewNoteToolbar);
  objc_destroyWeak((id *)&self->_searchBar);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_destroyWeak((id *)&self->_containerViewController);

  objc_destroyWeak((id *)&self->_delegate);
}

@end