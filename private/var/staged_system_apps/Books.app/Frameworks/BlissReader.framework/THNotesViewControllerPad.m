@interface THNotesViewControllerPad
- (BOOL)p_detailsViewIsCompactWidth;
- (BOOL)p_isCollapsed;
- (BOOL)p_isEditing;
- (BOOL)p_isToolbarHidden:(BOOL)a3;
- (BOOL)p_studyButtonShouldBeEnabled;
- (BOOL)splitViewController:(id)a3 collapseSecondaryViewController:(id)a4 ontoPrimaryViewController:(id)a5;
- (NSString)pendingBookSearchText;
- (THNotesNoSearchResultsViewController)noSearchResultsViewController;
- (THNotesViewControllerPad)initWithNibName:(id)a3 bundle:(id)a4;
- (UIBarButtonItem)actionButtonItem;
- (UIBarButtonItem)deleteButtonItem;
- (UIBarButtonItem)selectAllButtonItem;
- (UIBarButtonItem)selectButtonItem;
- (UIBarButtonItem)studyButtonItem;
- (UINavigationController)detailNavigationController;
- (UINavigationController)masterNavigationController;
- (UISplitViewController)notesSplitViewController;
- (UIViewController)detailParentViewController;
- (double)activityIndicatorCellHeight;
- (double)cellMargin;
- (double)chapterTitleHeightForAllChapters;
- (double)colorBarHorizontalInset;
- (double)dateLabelHorizontalInset;
- (double)firstNoteBelowSectionAdjustment;
- (double)highlightColorBarDescent;
- (double)highlightEditingWidthAdjustment;
- (double)highlightLeftInset;
- (double)highlightRightInset;
- (double)marginAboveNote;
- (double)marginAboveSeparator;
- (double)noteLabelHorizontalInset;
- (double)rightMargin;
- (double)sectionTitleHeight;
- (double)sectionTitleHeightForAllChapters;
- (id)p_noteCountLabelTextForChapter:(id)a3;
- (id)p_textForSelectAllButton:(int64_t)a3;
- (id)sidebarContentViewController:(id)a3 viewControllerForSectionProvider:(id)a4;
- (id)splitViewController:(id)a3 separateSecondaryViewControllerFromPrimaryViewController:(id)a4;
- (int64_t)p_interfaceOrientation;
- (unint64_t)maxLines;
- (unint64_t)maxNoteLabelLines;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)cleanup;
- (void)dealloc;
- (void)endEditingDidDelete:(BOOL)a3;
- (void)finishedDismissing;
- (void)handleDone:(id)a3;
- (void)handleEdit:(id)a3;
- (void)handleSelectAll:(id)a3;
- (void)handleStudy:(id)a3;
- (void)hideForEnterStudyModeWithPrepare:(id)a3 duration:(double)a4 completion:(id)a5;
- (void)hideWithPrepare:(id)a3 duration:(double)a4 completion:(id)a5;
- (void)p_configureToolbarsForEditing:(BOOL)a3 collapsed:(BOOL)a4;
- (void)p_layoutViewsForOrientation:(int64_t)a3 duration:(double)a4;
- (void)p_returnToOriginalViewController;
- (void)p_setDeselectAllButtonText;
- (void)p_setSelectAllButtonText;
- (void)p_showCorrectView:(BOOL)a3;
- (void)p_showNoResultsView:(BOOL)a3 firstLaunch:(BOOL)a4 allowPush:(BOOL)a5;
- (void)p_updateChapterHeader;
- (void)p_updateEditButtons;
- (void)sectionProvidersDidChange;
- (void)setActionButtonItem:(id)a3;
- (void)setDeleteButtonItem:(id)a3;
- (void)setDetailNavigationController:(id)a3;
- (void)setDetailParentViewController:(id)a3;
- (void)setMasterNavigationController:(id)a3;
- (void)setNoSearchResultsViewController:(id)a3;
- (void)setNotesSplitViewController:(id)a3;
- (void)setPendingBookSearchText:(id)a3;
- (void)setSelectAllButtonItem:(id)a3;
- (void)setSelectButtonItem:(id)a3;
- (void)setStudyButtonItem:(id)a3;
- (void)showForExitStudyModeWithPrepare:(id)a3 duration:(double)a4 completion:(id)a5;
- (void)showWithPrepare:(id)a3 duration:(double)a4 completion:(id)a5;
- (void)sidebarContentViewController:(id)a3 willSelectSectionProvider:(id)a4;
- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4;
- (void)tableViewController:(id)a3 didLoadContentNode:(id)a4;
- (void)tableViewController:(id)a3 navigateToNote:(id)a4;
- (void)tableViewController:(id)a3 renderingInProgress:(BOOL)a4;
- (void)tableViewController:(id)a3 searchBookForText:(id)a4;
- (void)tableViewControllerDidChangeSelection:(id)a3;
- (void)tableViewControllerDidDeleteNote:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation THNotesViewControllerPad

- (THNotesViewControllerPad)initWithNibName:(id)a3 bundle:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)THNotesViewControllerPad;
  v4 = [(THNotesViewController *)&v6 initWithNibName:a3 bundle:a4];
  if (v4) {
    [(THNotesViewControllerPad *)v4 registerForTraitChanges:+[UITraitCollection bc_allAPITraits] withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v4;
}

- (void)dealloc
{
  [(THNotesViewControllerPad *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)THNotesViewControllerPad;
  [(THNotesViewController *)&v3 dealloc];
}

- (void)cleanup
{
  self->_masterNavigationController = 0;
  self->_detailNavigationController = 0;

  self->_detailParentViewController = 0;
  self->_actionButtonItem = 0;

  self->_deleteButtonItem = 0;
  self->_selectAllButtonItem = 0;

  self->_studyButtonItem = 0;
  self->_selectButtonItem = 0;
  [(UISplitViewController *)self->_notesSplitViewController setDelegate:0];

  self->_notesSplitViewController = 0;
  self->_noSearchResultsViewController = 0;

  self->_pendingBookSearchText = 0;
  v3.receiver = self;
  v3.super_class = (Class)THNotesViewControllerPad;
  [(THNotesViewController *)&v3 cleanup];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)THNotesViewControllerPad;
  [(THNotesViewController *)&v6 viewDidLoad];
  v8 = [(THNotesViewController *)self notesDetailViewController];
  [(UINavigationController *)[(THNotesViewControllerPad *)self detailNavigationController] setViewControllers:+[NSArray arrayWithObjects:&v8 count:1]];
  objc_super v3 = [(THNotesViewControllerPad *)self notesSplitViewController];
  id v4 = [(UISplitViewController *)v3 view];
  [self view].bounds;
  [v4 setFrame:];
  [v4 setBackgroundColor:[UIColor bc_booksBackground]];
  [(THNotesViewControllerPad *)self addChildViewController:v3];
  [self.view insertSubview:v4 atIndex:0];
  v7[0] = [(THNotesViewControllerPad *)self masterNavigationController];
  v7[1] = [(THNotesViewControllerPad *)self detailNavigationController];
  [(UISplitViewController *)v3 setViewControllers:+[NSArray arrayWithObjects:v7 count:2]];
  [(THNotesDetailTableViewController *)[(THNotesViewController *)self notesDetailViewController] setDelegate:self];
  if (!self->_noSearchResultsViewController)
  {
    self->_noSearchResultsViewController = objc_alloc_init(THNotesNoSearchResultsViewController);
    [(THNotesDetailTableViewController *)[(THNotesViewController *)self notesDetailViewController] addChildViewController:[(THNotesViewControllerPad *)self noSearchResultsViewController]];
    id v5 = [(THNotesNoSearchResultsViewController *)self->_noSearchResultsViewController view];
    [(-[THNotesViewController notesDetailViewController](self, "notesDetailViewController")) view] addSubview:v5;
    [v5 setHidden:1];
  }
  -[THNotesSidebarViewController setTitle:](-[THNotesViewController notesSidebarViewController](self, "notesSidebarViewController"), "setTitle:", [(id)THBundle() localizedStringForKey:@"Chapters" value:&stru_46D7E8 table:0]);
  [(THNotesViewControllerPad *)self p_layoutViewsForOrientation:[(THNotesViewControllerPad *)self p_interfaceOrientation] duration:0.0];
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)THNotesViewControllerPad;
  [(THNotesViewControllerPad *)&v13 viewWillLayoutSubviews];
  [(-[THNotesViewController notesDetailViewController](self, "notesDetailViewController")) view].frame
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (([(THNotesViewControllerPad *)self im_isCompactWidth] & 1) != 0
    || [(THNotesViewControllerPad *)self im_isCompactHeight])
  {
    [(UIToolbar *)[(UINavigationController *)[(THNotesViewControllerPad *)self detailNavigationController] toolbar] bounds];
    double Height = CGRectGetHeight(v14);
    [(-[THNotesViewControllerPad detailNavigationController](self, "detailNavigationController")) view].safeAreaInsets;
    double v10 = v10 - (Height + v12);
  }
  [(-[THNotesViewControllerPad noSearchResultsViewController](self, "noSearchResultsViewController")) view].frame = CGRectMake(v4, v6, v8, v10);
}

- (BOOL)p_isEditing
{
  v2 = [(THNotesDetailTableViewController *)[(THNotesViewController *)self notesDetailViewController] tableView];

  return [(UITableView *)v2 isEditing];
}

- (BOOL)p_isCollapsed
{
  v2 = [(THNotesViewControllerPad *)self notesSplitViewController];

  return [(UISplitViewController *)v2 isCollapsed];
}

- (BOOL)p_isToolbarHidden:(BOOL)a3
{
  if ([(THNotesViewControllerPad *)self im_isCompactWidth]) {
    return 0;
  }
  else {
    return [(THNotesViewControllerPad *)self im_isCompactHeight] ^ 1;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THNotesViewControllerPad;
  [(THNotesViewController *)&v5 viewWillAppear:a3];
  [(UISplitViewController *)[(THNotesViewControllerPad *)self notesSplitViewController] setPreferredDisplayMode:0];
  BOOL v4 = [(THNotesViewControllerPad *)self p_isCollapsed];
  [(-[THNotesDetailTableViewController navigationController](-[THNotesViewController notesDetailViewController](self, "notesDetailViewController"), "navigationController")) setToolbarHidden:[self p_isToolbarHidden:v4]];
  [(THNotesViewControllerPad *)self p_configureToolbarsForEditing:0 collapsed:v4];
  [(THNotesViewControllerPad *)self p_showCorrectView:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(THNotesViewControllerPad *)self isViewLoaded])
  {
    id v5 = [(THNotesViewControllerPad *)self view];
    long long v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v11[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v11[1] = v6;
    v11[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [v5 setTransform:v11];
  }
  if ([(THNotesViewController *)self shouldDismissAfterRotate])
  {
    [(THNotesViewController *)self setShouldDismissAfterRotate:0];
    double v7 = [(THNotesViewControllerPad *)self notesSplitViewController];
    [v7 view].frame
    -[UISplitViewController viewWillTransitionToSize:withTransitionCoordinator:](v7, "viewWillTransitionToSize:withTransitionCoordinator:", [(THNotesViewControllerPad *)self transitionCoordinator], v8, v9);
    [(THNotesViewControllerPad *)self p_layoutViewsForOrientation:[(THNotesViewControllerPad *)self p_interfaceOrientation] duration:0.0];
  }
  [(THNotesSidebarViewController *)[(THNotesViewController *)self notesSidebarViewController] cancelSearch];
  v10.receiver = self;
  v10.super_class = (Class)THNotesViewControllerPad;
  [(THNotesViewControllerPad *)&v10 viewDidDisappear:v3];
}

- (int64_t)p_interfaceOrientation
{
  id v2 = [self bc_windowForViewController].windowScene;

  return (int64_t)[v2 interfaceOrientation];
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  BOOL v5 = [(THNotesViewControllerPad *)self p_isCollapsed];
  [(-[THNotesDetailTableViewController navigationController](-[THNotesViewController notesDetailViewController](self, "notesDetailViewController"), "navigationController")) setToolbarHidden:[self p_isToolbarHidden:v5]];
  id v6 = [(THNotesViewControllerPad *)self isEditing];

  [(THNotesViewControllerPad *)self p_configureToolbarsForEditing:v6 collapsed:v5];
}

- (void)sectionProvidersDidChange
{
  if ([(THNotesViewControllerPad *)self p_isEditing])
  {
    [(THNotesDetailTableViewController *)[(THNotesViewController *)self notesDetailViewController] deselectAllNotes];
    [(THNotesViewControllerPad *)self p_setSelectAllButtonText];
    [(THNotesViewControllerPad *)self p_updateEditButtons];
  }
  [(THNotesViewControllerPad *)self p_updateChapterHeader];
  [(UIBarButtonItem *)self->_studyButtonItem setEnabled:[(THNotesViewControllerPad *)self p_studyButtonShouldBeEnabled]];

  [(THNotesViewControllerPad *)self p_showCorrectView:0];
}

- (void)p_showNoResultsView:(BOOL)a3 firstLaunch:(BOOL)a4 allowPush:(BOOL)a5
{
  BOOL v5 = a5;
  if (a3)
  {
    BOOL v7 = a4;
    [(UIView *)[(THNotesNoSearchResultsViewController *)self->_noSearchResultsViewController firstLaunchView] setHidden:!a4];
    [(UIView *)[(THNotesNoSearchResultsViewController *)self->_noSearchResultsViewController noResultsView] setHidden:v7];
    unint64_t v8 = [(THNotesSidebarViewController *)[(THNotesViewController *)self notesSidebarViewController] providerIndex];
    if (!v7)
    {
      [self->_noSearchResultsViewController setMessageType:[self searchText].length == 0];
      [(THNotesNoSearchResultsViewController *)self->_noSearchResultsViewController setChapterIndex:v8];
      [(THNotesNoSearchResultsViewController *)self->_noSearchResultsViewController setResults:[(THNotesViewController *)self numberOfNotes]];
    }
    if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
      id v9 = 0;
    }
    else {
      id v9 = [(NSArray *)[(THNotesViewController *)self sectionProviders] objectAtIndex:v8];
    }
    BOOL v11 = ![v9 hasGlossaryTerms]
       || ![(THNotesViewControllerPad *)self p_studyButtonShouldBeEnabled];
    [(THNotesNoSearchResultsViewController *)self->_noSearchResultsViewController setFooterType:v11];
    [(UITableView *)[(THNotesDetailTableViewController *)[(THNotesViewController *)self notesDetailViewController] tableView] setHidden:1];
    objc_super v10 = (UITableView *)[(THNotesNoSearchResultsViewController *)self->_noSearchResultsViewController view];
  }
  else
  {
    if ([self->_noSearchResultsViewController isViewLoaded])[self->_noSearchResultsViewController view].hidden = 1; {
    objc_super v10 = [(THNotesDetailTableViewController *)[(THNotesViewController *)self notesDetailViewController] tableView];
    }
  }
  [(UITableView *)v10 setHidden:0];
  if (v5)
  {
    if ([(THNotesViewControllerPad *)self p_isCollapsed])
    {
      double v12 = [(THNotesViewControllerPad *)self masterNavigationController];
      objc_super v13 = [(THNotesViewControllerPad *)self detailNavigationController];
      if ([(UINavigationController *)v12 topViewController] != (UIViewController *)v13)
      {
        BOOL v14 = +[UIView areAnimationsEnabled];
        [(UINavigationController *)v12 pushViewController:v13 animated:v14];
      }
    }
  }
}

- (void)p_configureToolbarsForEditing:(BOOL)a3 collapsed:(BOOL)a4
{
  BOOL v37 = a4;
  BOOL v4 = a3;

  self->_actionButtonItem = 0;
  self->_deleteButtonItem = 0;

  self->_selectAllButtonItem = 0;
  p_studyButtonItem = (id *)&self->_studyButtonItem;

  self->_studyButtonItem = 0;
  p_selectButtonItem = (id *)&self->_selectButtonItem;

  self->_selectButtonItem = 0;
  v39 = [(THNotesViewController *)self notesSidebarViewController];
  unint64_t v8 = [(THNotesViewController *)self notesDetailViewController];
  id v9 = objc_alloc((Class)UIBarButtonItem);
  BOOL v38 = v4;
  if (v4)
  {
    self->_actionButtonItem = (UIBarButtonItem *)[v9 initWithBarButtonSystemItem:9 target:self action:"handleAction:"];
    self->_deleteButtonItem = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:16 target:self action:"handleDelete:"];
    uint64_t v10 = [(THNotesDetailTableViewController *)v8 areAllNotesSelected];
    id v11 = [objc_alloc((Class)NSSet) initWithObjects:[self p_textForSelectAllButton:0], [self p_textForSelectAllButton:1], nil];
    double v12 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:[self p_textForSelectAllButton:v10] style:0 target:self action:"handleSelectAll:"];
    self->_selectAllButtonItem = v12;
    [(UIBarButtonItem *)v12 setPossibleTitles:v11];
    [(UIBarButtonItem *)self->_selectAllButtonItem setTag:v10];

    [(THNotesViewControllerPad *)self p_updateEditButtons];
  }
  else
  {
    id *p_studyButtonItem = [v9 initWithTitle:[THBundle localizedStringForKey:@"Study Cards" value:&stru_46D7E8 table:0] style:0 target:self action:@"handleStudy:"];
    id *p_selectButtonItem = [objc_alloc((Class)UIBarButtonItem) initWithTitle:[THBundle localizedStringForKey:@"Select" value:&stru_46D7E8 table:0] style:0 target:self action:@"handleEdit:"];
  }
  objc_super v13 = v8;
  BOOL v14 = v39;
  unsigned int v15 = [[v13 navigationController] isToolbarHidden];
  id v16 = [(THNotesSidebarViewController *)v39 navigationItem];
  if (v16)
  {
    v17 = v16;
    if (v37)
    {
      id v18 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"handleDone:"];
      [v17 setRightBarButtonItem:v18];
    }
    else
    {
      [v16 setRightBarButtonItem:0];
    }
  }
  id v19 = [(THNotesDetailTableViewController *)v13 navigationItem];
  if (v19)
  {
    v20 = v19;
    [v19 setLeftItemsSupplementBackButton:1];
    id v21 = objc_alloc_init((Class)NSMutableArray);
    id v22 = objc_alloc_init((Class)NSMutableArray);
    id v23 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"handleDone:"];
    [v22 addObject:v23];

    if (v38)
    {
      if (v15)
      {
        [v21 addObject:self->_actionButtonItem];
        id v24 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:6 target:0 action:0];
        [v24 setWidth:20.0];
        [v21 addObject:v24];

        p_selectAllButtonItem = &self->_selectAllButtonItem;
        p_deleteButtonItem = &self->_deleteButtonItem;
LABEL_13:
        [v21 addObject:*p_deleteButtonItem];
        [v22 addObject:*p_selectAllButtonItem];
      }
    }
    else
    {
      p_deleteButtonItem = &self->_studyButtonItem;
      p_selectAllButtonItem = &self->_selectButtonItem;
      if (v15) {
        goto LABEL_13;
      }
    }
    [v20 setLeftBarButtonItems:v21];
    [v20 setRightBarButtonItems:v22];

    BOOL v14 = v39;
  }
  id v27 = objc_alloc_init((Class)NSMutableArray);
  v28 = v27;
  if ((v15 & 1) == 0)
  {
    v29 = &self->_studyButtonItem;
    v30 = &self->_selectButtonItem;
    if (v38)
    {
      [v27 addObject:self->_actionButtonItem];
      id v31 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:6 target:0 action:0];
      [v31 setWidth:20.0];
      [v28 addObject:v31];

      v30 = &self->_selectAllButtonItem;
      v29 = &self->_deleteButtonItem;
    }
    [v28 addObject:*v29];
    id v32 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
    [v28 addObject:v32];

    [v28 addObject:*v30];
  }
  [(THNotesDetailTableViewController *)v13 setToolbarItems:v28];

  if (*p_studyButtonItem) {
    [*p_studyButtonItem setEnabled:[self p_studyButtonShouldBeEnabled]];
  }
  if (*p_selectButtonItem)
  {
    id v33 = [(THNotesSidebarViewController *)v14 providerIndex];
    BOOL v34 = v33 != (id)0x7FFFFFFFFFFFFFFFLL
       && [[-[THNotesViewController sectionProviders](self, "sectionProviders") objectAtIndex:v33] annotationCount] != 0;
    [*p_selectButtonItem setEnabled:v34];
  }
  id v35 = +[UIColor bc_booksKeyColor];
  id v36 = [(THNotesViewControllerPad *)self view];

  [v36 setTintColor:v35];
}

- (void)p_layoutViewsForOrientation:(int64_t)a3 duration:(double)a4
{
  [(UISplitViewController *)[(THNotesViewControllerPad *)self notesSplitViewController] setPreferredDisplayMode:0];

  [(THNotesViewControllerPad *)self p_updateEditButtons];
}

- (id)p_noteCountLabelTextForChapter:(id)a3
{
  if (![a3 needsMigration]) {
    return +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", @"%lu", [a3 annotationCount]);
  }

  return +[NSString stringWithUTF8String:"…"];
}

- (void)p_updateChapterHeader
{
  unint64_t v3 = [(THNotesSidebarViewController *)[(THNotesViewController *)self notesSidebarViewController] providerIndex];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [(NSArray *)[(THNotesViewController *)self sectionProviders] objectAtIndex:v3];
    if (objc_msgSend(-[THNotesViewController searchText](self, "searchText"), "length"))
    {
      id v9 = (char *)[v8 annotationCount];
      if (v9 == (unsigned char *)&dword_0 + 1)
      {
        uint64_t v10 = (void *)THBundle();
        CFStringRef v11 = @"1 Result";
        goto LABEL_13;
      }
      id v5 = v9;
      if (v9)
      {
        id v6 = (void *)THBundle();
        CFStringRef v7 = @"%lu Results";
        goto LABEL_18;
      }
LABEL_9:
      uint64_t v10 = (void *)THBundle();
      CFStringRef v11 = @"No Results Found";
LABEL_13:
      double v12 = (NSString *)[v10 localizedStringForKey:v11 value:&stru_46D7E8 table:0];
      goto LABEL_14;
    }
LABEL_10:
    uint64_t v10 = (void *)THBundle();
    CFStringRef v11 = @"My Notes";
    goto LABEL_13;
  }
  if (!objc_msgSend(-[THNotesViewController searchText](self, "searchText"), "length")) {
    goto LABEL_10;
  }
  unint64_t v4 = [(THNotesViewController *)self numberOfNotes];
  if (v4 == 1)
  {
    uint64_t v10 = (void *)THBundle();
    CFStringRef v11 = @"All Chapters: 1 Result";
    goto LABEL_13;
  }
  id v5 = (id)v4;
  if (!v4) {
    goto LABEL_9;
  }
  id v6 = (void *)THBundle();
  CFStringRef v7 = @"All Chapters: %lu Results";
LABEL_18:
  double v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", [v6 localizedStringForKey:v7 value:&stru_46D7E8 table:0], v5);
LABEL_14:
  objc_super v13 = v12;
  BOOL v14 = [(THNotesViewController *)self notesDetailViewController];

  [(THNotesDetailTableViewController *)v14 setTitle:v13];
}

- (void)endEditingDidDelete:(BOOL)a3
{
  BOOL v3 = a3;
  [(THNotesDetailTableViewController *)[(THNotesViewController *)self notesDetailViewController] setEditing:0 animated:1];
  [(THNotesViewControllerPad *)self p_configureToolbarsForEditing:0 collapsed:[(THNotesViewControllerPad *)self p_isCollapsed]];
  if (v3)
  {
    [(THNotesViewController *)self noteWasDeleted];
  }
}

- (BOOL)p_studyButtonShouldBeEnabled
{
  if (objc_msgSend(-[THNotesViewController searchText](self, "searchText"), "length")) {
    return 0;
  }
  unint64_t v3 = [(THNotesSidebarViewController *)[(THNotesViewController *)self notesSidebarViewController] providerIndex];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  id v5 = [(NSArray *)[(THNotesViewController *)self sectionProviders] objectAtIndex:v3];
  if ([v5 annotationCountForStudyCards]) {
    unsigned __int8 v6 = 1;
  }
  else {
    unsigned __int8 v6 = [v5 hasGlossaryTerms];
  }
  return [v5 shouldEnableStudyButton] & v6;
}

- (void)p_showCorrectView:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(THNotesSidebarViewController *)[(THNotesViewController *)self notesSidebarViewController] providerIndex];
  unint64_t v6 = [(THNotesViewController *)self numberOfNotes];
  BOOL v7 = v5 != 0x7FFFFFFFFFFFFFFFLL
    && [(-[NSArray objectAtIndex:](-[THNotesViewController sectionProviders](self, "sectionProviders"), "objectAtIndex:", v5)) annotationCount] != 0;
  [(UIBarButtonItem *)self->_selectButtonItem setEnabled:v7];
  if ([(THNotesViewController *)self notesExist])
  {
    if (v7 || !v6)
    {
      id v8 = self;
      uint64_t v9 = 0;
    }
    else
    {
      id v8 = self;
      uint64_t v9 = 1;
    }
    uint64_t v10 = 0;
  }
  else
  {
    id v8 = self;
    uint64_t v9 = 1;
    uint64_t v10 = 1;
  }

  [(THNotesViewControllerPad *)v8 p_showNoResultsView:v9 firstLaunch:v10 allowPush:v3];
}

- (void)p_returnToOriginalViewController
{
  self->_pendingBookSearchText = 0;
}

- (void)showWithPrepare:(id)a3 duration:(double)a4 completion:(id)a5
{
  if (a3) {
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  }
  [self.view setAlpha:0.0];
  [self view].setHidden:0;
  +[CATransaction begin];
  +[CATransaction setAnimationDuration:a4];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_F7A50;
  v8[3] = &unk_457868;
  v8[4] = a5;
  +[CATransaction setCompletionBlock:v8];
  [self view].alpha = 1.0;
  +[CATransaction commit];
}

- (void)hideWithPrepare:(id)a3 duration:(double)a4 completion:(id)a5
{
  if (a3) {
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  }
  +[CATransaction begin];
  +[CATransaction setAnimationDuration:a4];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_F7B40;
  v8[3] = &unk_456E88;
  v8[4] = self;
  void v8[5] = a5;
  +[CATransaction setCompletionBlock:v8];
  [self view].setAlpha:0.0;
  +[CATransaction commit];
}

- (void)showForExitStudyModeWithPrepare:(id)a3 duration:(double)a4 completion:(id)a5
{
  if (a3) {
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  }
  [self.view setAlpha:0.0];
  [self view].setHidden:0;
  +[CATransaction begin];
  +[CATransaction setAnimationDuration:a4];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_F7C94;
  v8[3] = &unk_457868;
  v8[4] = a5;
  +[CATransaction setCompletionBlock:v8];
  [self view].setAlpha:1.0;
  +[CATransaction commit];
}

- (void)hideForEnterStudyModeWithPrepare:(id)a3 duration:(double)a4 completion:(id)a5
{
  if (a3) {
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  }
  +[CATransaction begin];
  +[CATransaction setAnimationDuration:a4];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_F7D84;
  v8[3] = &unk_456E88;
  v8[4] = self;
  void v8[5] = a5;
  +[CATransaction setCompletionBlock:v8];
  [self.view setAlpha:0.0];
  +[CATransaction commit];
}

- (void)finishedDismissing
{
  id v2 = [(THNotesViewController *)self notesDetailViewController];

  [(THNotesDetailTableViewController *)v2 reloadWithSections:0];
}

- (id)sidebarContentViewController:(id)a3 viewControllerForSectionProvider:(id)a4
{
  if (!-[THNotesViewControllerPad isCollapsedForSidebarContentViewController:](self, "isCollapsedForSidebarContentViewController:", a3, a4))return 0; {
  [(THNotesViewController *)self updateSectionProviders];
  }
  [(THNotesViewControllerPad *)self p_showCorrectView:0];
  [(UINavigationController *)[(THNotesViewControllerPad *)self detailNavigationController] setToolbarHidden:1 animated:0];
  [(UINavigationController *)[(THNotesViewControllerPad *)self detailNavigationController] setNavigationBarHidden:1 animated:0];

  return [(THNotesViewControllerPad *)self detailNavigationController];
}

- (void)sidebarContentViewController:(id)a3 willSelectSectionProvider:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)THNotesViewControllerPad;
  [(THNotesViewController *)&v5 sidebarContentViewController:a3 willSelectSectionProvider:a4];
  if ([(THNotesViewControllerPad *)self p_isEditing]) {
    [(THNotesViewControllerPad *)self endEditingDidDelete:0];
  }
  [(THNotesViewController *)self updateSectionProviders];
  if ([(THNotesViewControllerPad *)self p_isCollapsed]) {
    [(THNotesViewControllerPad *)self p_showCorrectView:1];
  }
}

- (BOOL)splitViewController:(id)a3 collapseSecondaryViewController:(id)a4 ontoPrimaryViewController:(id)a5
{
  return 0;
}

- (id)splitViewController:(id)a3 separateSecondaryViewControllerFromPrimaryViewController:(id)a4
{
  return 0;
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_F8050;
  v4[3] = &unk_456E38;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)handleStudy:(id)a3
{
  unint64_t v4 = [(THNotesSidebarViewController *)[(THNotesViewController *)self notesSidebarViewController] providerIndex];
  if (v4 >= [(NSArray *)[(THNotesViewController *)self sectionProviders] count])
  {
    id v15 = +[TSUAssertionHandler currentHandler];
    id v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewControllerPad handleStudy:]");
    v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewControllerPad.m"];
    [v15 handleFailureInFunction:v16 file:v17 lineNumber:859 description:@"Study button should be disabled until a chapter is selected"];
  }
  else
  {
    id v5 = [(NSArray *)[(THNotesViewController *)self sectionProviders] objectAtIndex:v4];
    id v6 = objc_alloc_init((Class)NSMutableArray);
    id v7 = [v5 navigationUnits];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          [v6 addObjectsFromArray:[*(id *)(*((void *)&v18 + 1) + 8 * i) contentNodes]];
        }
        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    id v12 = [[-[THDocumentViewController documentViewController](-[THBookViewController bookViewController](-[THNotesViewController notesViewController](self, "notesViewController"), "bookViewController"), "documentViewController") documentRoot] context];
    if ([v7 count] == (char *)&dword_0 + 1)
    {
      objc_super v13 = (THNavigationUnit *)[v7 lastObject];
      id v14 = 0;
    }
    else
    {
      id v14 = [v5 title];
      objc_super v13 = [[THNavigationUnit alloc] initWithContext:v12 contentNodes:v6];
    }
    [(THBookViewController *)[(THNotesViewController *)self bookViewController] showStudyCardsForNavigationUnit:v13 useChapterTitle:v14];
  }
}

- (void)handleEdit:(id)a3
{
  [(THNotesDetailTableViewController *)[(THNotesViewController *)self notesDetailViewController] setEditing:1 animated:1];
  [(THNotesDetailTableViewController *)[(THNotesViewController *)self notesDetailViewController] startEditing];
  [(THNotesViewControllerPad *)self p_configureToolbarsForEditing:1 collapsed:[(THNotesViewControllerPad *)self p_isCollapsed]];
  [(UIBarButtonItem *)self->_actionButtonItem setEnabled:0];
  deleteButtonItem = self->_deleteButtonItem;

  [(UIBarButtonItem *)deleteButtonItem setEnabled:0];
}

- (void)handleDone:(id)a3
{
  if ([(THNotesViewControllerPad *)self p_isEditing])
  {
    [(THNotesViewController *)self dismissActivityController:1];
    [(THNotesDetailTableViewController *)[(THNotesViewController *)self notesDetailViewController] deselectAllNotes];
    [(THNotesViewControllerPad *)self endEditingDidDelete:0];
    [(THNotesViewControllerPad *)self p_showCorrectView:1];
  }
  else
  {
    [(THNotesViewControllerPad *)self p_returnToOriginalViewController];
  }
}

- (id)p_textForSelectAllButton:(int64_t)a3
{
  unint64_t v4 = (void *)THBundle();
  if (a3) {
    CFStringRef v5 = @"Deselect All";
  }
  else {
    CFStringRef v5 = @"Select All";
  }

  return [v4 localizedStringForKey:v5 value:&stru_46D7E8 table:0];
}

- (void)p_setSelectAllButtonText
{
  [(UIBarButtonItem *)self->_selectAllButtonItem setTag:0];
  id v3 = [(THNotesViewControllerPad *)self p_textForSelectAllButton:0];
  selectAllButtonItem = self->_selectAllButtonItem;

  [(UIBarButtonItem *)selectAllButtonItem setTitle:v3];
}

- (void)p_setDeselectAllButtonText
{
  [(UIBarButtonItem *)self->_selectAllButtonItem setTag:1];
  id v3 = [(THNotesViewControllerPad *)self p_textForSelectAllButton:1];
  selectAllButtonItem = self->_selectAllButtonItem;

  [(UIBarButtonItem *)selectAllButtonItem setTitle:v3];
}

- (void)handleSelectAll:(id)a3
{
  [(THNotesViewController *)self dismissActivityController:1];
  id v4 = [(UIBarButtonItem *)self->_selectAllButtonItem tag];
  CFStringRef v5 = [(THNotesViewController *)self notesDetailViewController];
  if (v4)
  {
    [(THNotesDetailTableViewController *)v5 deselectAllNotes];
  }
  else if (![(THNotesDetailTableViewController *)v5 selectAllNotes])
  {
    goto LABEL_5;
  }
  [(THNotesViewControllerPad *)self p_setDeselectAllButtonText];
LABEL_5:

  [(THNotesViewControllerPad *)self p_updateEditButtons];
}

- (void)p_updateEditButtons
{
  if ([(NSMutableDictionary *)[(THNotesDetailTableViewController *)[(THNotesViewController *)self notesDetailViewController] selectedNotes] count])
  {
    [(UIBarButtonItem *)self->_deleteButtonItem setEnabled:[(THAnnotationStorageController *)[(THNotesViewController *)self annotationController] canModifyAnnotations]];
    actionButtonItem = self->_actionButtonItem;
    [(UIBarButtonItem *)actionButtonItem setEnabled:1];
  }
  else
  {
    [(UIBarButtonItem *)self->_deleteButtonItem setEnabled:0];
    [(UIBarButtonItem *)self->_actionButtonItem setEnabled:0];
    [(THNotesViewControllerPad *)self p_setSelectAllButtonText];
  }
}

- (BOOL)p_detailsViewIsCompactWidth
{
  unsigned int v3 = [(THBookViewController *)[(THNotesViewController *)self bookViewController] im_isCompactWidth];
  if (v3 != [(THBookViewController *)[(THNotesViewController *)self bookViewController] im_isCompactHeight])LOBYTE(v3) = (char *)[(UISplitViewController *)[(THNotesViewControllerPad *)self notesSplitViewController] displayMode] != (char *)&dword_0 + 1; {
  return v3;
  }
}

- (void)tableViewControllerDidChangeSelection:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THNotesViewControllerPad;
  -[THNotesViewController tableViewControllerDidChangeSelection:](&v5, "tableViewControllerDidChangeSelection:");
  if ([a3 areAllNotesSelected]) {
    [(THNotesViewControllerPad *)self p_setDeselectAllButtonText];
  }
  else {
    [(THNotesViewControllerPad *)self p_setSelectAllButtonText];
  }
  [(THNotesViewControllerPad *)self p_updateEditButtons];
}

- (void)tableViewControllerDidDeleteNote:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THNotesViewControllerPad;
  [(THNotesViewController *)&v4 tableViewControllerDidDeleteNote:a3];
  [(THNotesViewController *)self noteWasDeleted];
}

- (void)tableViewController:(id)a3 navigateToNote:(id)a4
{
  id v6 = [(THDocumentViewController *)[(THBookViewController *)[(THNotesViewController *)self bookViewController] documentViewController] documentRoot];
  id v7 = [v6 modelStorageAnchorForAnnotation:a4];
  if ([a4 annotationAbsolutePhysicalPageIndex] != (id)0x7FFFFFFFFFFFFFFFLL
    && ![v6 reflowablePaginationController])
  {
    [v7 setAbsolutePageIndex:[a4 annotationAbsolutePhysicalPageIndex]];
  }
  +[CATransaction begin];
  [(THBookViewController *)[(THNotesViewController *)self bookViewController] recordOutgoingMajorNavigationJump];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_F8880;
  v8[3] = &unk_456DE0;
  v8[4] = self;
  [(THBookViewController *)[(THNotesViewController *)self bookViewController] navigateFromNotesViewToAnchorInDVC:v7 completion:v8];
  +[CATransaction commit];
}

- (void)tableViewController:(id)a3 searchBookForText:(id)a4
{
  if (self->_pendingBookSearchText) {
    [TSUAssertionHandler currentHandler][TSUAssertionHandler handleFailureInFunction:@"-[THNotesViewControllerPad tableViewController:searchBookForText:]" file:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewControllerPad.m" lineNumber:1052 description:@"expected nil value for '%s'", "_pendingBookSearchText"];
  }
  self->_pendingBookSearchText = [a4 copy:a3];

  [(THNotesViewControllerPad *)self handleDone:0];
}

- (void)tableViewController:(id)a3 didLoadContentNode:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)THNotesViewControllerPad;
  [(THNotesViewController *)&v7 tableViewController:a3 didLoadContentNode:a4];
  unint64_t v5 = [(THNotesSidebarViewController *)[(THNotesViewController *)self notesSidebarViewController] providerIndex];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(-[NSArray objectAtIndex:](-[THNotesViewController sectionProviders](self, "sectionProviders"), "objectAtIndex:", v5), "needsMigration"))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_F8A64;
      block[3] = &unk_456DE0;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)tableViewController:(id)a3 renderingInProgress:(BOOL)a4
{
}

- (double)marginAboveNote
{
  return 18.0;
}

- (double)rightMargin
{
  return 58.0;
}

- (double)marginAboveSeparator
{
  return 18.0;
}

- (double)highlightColorBarDescent
{
  return 5.0;
}

- (double)sectionTitleHeight
{
  return 44.0;
}

- (double)chapterTitleHeightForAllChapters
{
  return 34.0;
}

- (double)sectionTitleHeightForAllChapters
{
  return 44.0;
}

- (double)highlightEditingWidthAdjustment
{
  return 38.0;
}

- (double)highlightLeftInset
{
  return 61.0;
}

- (double)highlightRightInset
{
  return 58.0;
}

- (double)firstNoteBelowSectionAdjustment
{
  return -8.0;
}

- (double)cellMargin
{
  unsigned int v2 = [(THNotesViewControllerPad *)self p_detailsViewIsCompactWidth];
  double result = 20.0;
  if (v2) {
    return 10.0;
  }
  return result;
}

- (double)activityIndicatorCellHeight
{
  return 40.0;
}

- (unint64_t)maxLines
{
  return 20;
}

- (unint64_t)maxNoteLabelLines
{
  return 0;
}

- (double)noteLabelHorizontalInset
{
  unsigned int v2 = [(THNotesViewControllerPad *)self p_detailsViewIsCompactWidth];
  double result = 61.0;
  if (v2) {
    return 46.0;
  }
  return result;
}

- (double)colorBarHorizontalInset
{
  unsigned int v2 = [(THNotesViewControllerPad *)self p_detailsViewIsCompactWidth];
  double result = 47.0;
  if (v2) {
    return 32.0;
  }
  return result;
}

- (double)dateLabelHorizontalInset
{
  unsigned int v2 = [(THNotesViewControllerPad *)self p_detailsViewIsCompactWidth];
  double result = 34.0;
  if (v2) {
    return 19.0;
  }
  return result;
}

- (UINavigationController)masterNavigationController
{
  return self->_masterNavigationController;
}

- (void)setMasterNavigationController:(id)a3
{
}

- (UINavigationController)detailNavigationController
{
  return self->_detailNavigationController;
}

- (void)setDetailNavigationController:(id)a3
{
}

- (UISplitViewController)notesSplitViewController
{
  return self->_notesSplitViewController;
}

- (void)setNotesSplitViewController:(id)a3
{
}

- (UIViewController)detailParentViewController
{
  return self->_detailParentViewController;
}

- (void)setDetailParentViewController:(id)a3
{
}

- (THNotesNoSearchResultsViewController)noSearchResultsViewController
{
  return self->_noSearchResultsViewController;
}

- (void)setNoSearchResultsViewController:(id)a3
{
}

- (NSString)pendingBookSearchText
{
  return self->_pendingBookSearchText;
}

- (void)setPendingBookSearchText:(id)a3
{
}

- (UIBarButtonItem)studyButtonItem
{
  return self->_studyButtonItem;
}

- (void)setStudyButtonItem:(id)a3
{
}

- (UIBarButtonItem)selectButtonItem
{
  return self->_selectButtonItem;
}

- (void)setSelectButtonItem:(id)a3
{
}

- (UIBarButtonItem)selectAllButtonItem
{
  return self->_selectAllButtonItem;
}

- (void)setSelectAllButtonItem:(id)a3
{
}

- (UIBarButtonItem)deleteButtonItem
{
  return self->_deleteButtonItem;
}

- (void)setDeleteButtonItem:(id)a3
{
}

- (UIBarButtonItem)actionButtonItem
{
  return self->_actionButtonItem;
}

- (void)setActionButtonItem:(id)a3
{
}

@end