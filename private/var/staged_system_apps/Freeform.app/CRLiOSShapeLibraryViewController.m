@interface CRLiOSShapeLibraryViewController
- (BOOL)allowsInsertDrag;
- (BOOL)insertPageViewControllerShouldAppearInSearchMode:(id)a3;
- (BOOL)insertPageViewControllerShouldChangeSearchText:(id)a3;
- (BOOL)p_canInsertAndConnectBoardItemToSelectedConnectionLine:(id)a3;
- (BOOL)p_didDragOutsidePopover;
- (BOOL)p_didEnterBackground;
- (BOOL)p_dragEnded;
- (BOOL)p_infoIsInsertingViaDrag;
- (BOOL)p_isCompact;
- (BOOL)p_isSidebarLike;
- (BOOL)p_shouldChangeSelectedShapes;
- (BOOL)showLinesInLibrary;
- (BOOL)staysOpenOnSelectionChange;
- (CGPoint)p_unscaledPopoverAnchorPoint;
- (CGSize)p_cachedViewFrameSize;
- (CGSize)p_contentSize;
- (CGSize)preferredContentSize;
- (CRLAccessibilityTimer)p_announcementTimer;
- (CRLShapeCollectionDataSource)p_shapeCollectionDataSource;
- (CRLShapeSearchResultsCollection)p_shapeSearchResultsCollection;
- (CRLiOSInsertPageViewController)p_shapeInsertViewController;
- (CRLiOSPresetCollectionViewController)p_searchViewController;
- (CRLiOSShapeLibraryViewController)initWithDelegate:(id)a3;
- (CRLiOSShapeLibraryViewController)initWithDelegate:(id)a3 shouldChangeSelectedShapes:(BOOL)a4;
- (CRLiOSShapeLibraryViewController)initWithDelegate:(id)a3 unscaledPopoverAnchorPoint:(CGPoint)a4;
- (CRLiOSShapeLibraryViewControllerDelegate)p_delegate;
- (NSArray)p_allPresetCollectionViewControllers;
- (NSArray)p_constraintsForHidingNavigationBar;
- (NSArray)p_constraintsForShowingNavigationBar;
- (NSSet)associatedBoardItems;
- (UINavigationBar)p_navigationBar;
- (UIView)p_draggingView;
- (id)backgroundColorForPresetCollectionViewController:(id)a3;
- (id)contextWithPresetCollectionViewController:(id)a3;
- (id)insertPageViewController:(id)a3 viewControllerAfterViewController:(id)a4;
- (id)insertPageViewController:(id)a3 viewControllerBeforeViewController:(id)a4;
- (id)insertPageViewController:(id)a3 viewControllerForPageAtIndex:(unint64_t)a4;
- (id)insertPageViewControllerDefaultSearchTerm:(id)a3;
- (id)insertPageViewControllerViewControllerForSearch:(id)a3;
- (id)itemsForBeginningDragSessionForPresetCollectionViewController:(id)a3 forCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)p_boardItemFactory;
- (id)p_boardItemForPresetCollectionType:(unint64_t)a3 atIndexPath:(id)a4 context:(id)a5;
- (id)p_createShapeInsertViewController;
- (id)p_editingCoordinator;
- (id)p_interactiveCanvasController;
- (id)p_pageViewControllerWithPages:(id)a3 presetCollectionType:(unint64_t)a4;
- (id)p_pages;
- (id)p_pagesForPresetCollectionType:(unint64_t)a3;
- (id)p_pagesForSegment:(unint64_t)a3;
- (id)p_shapeAtIndexPath:(id)a3 context:(id)a4;
- (id)p_shapeInfoAtIndexPath:(id)a3 boardItemFactory:(id)a4 context:(id)a5;
- (id)p_shapeWithIdentifier:(id)a3 context:(id)a4;
- (unint64_t)insertPageViewController:(id)a3 presentationIndexForViewController:(id)a4;
- (unint64_t)p_integerDefaultForKey:(id)a3;
- (unint64_t)p_pageNumberForPresetCollectionViewController:(id)a3;
- (unint64_t)p_searchState;
- (unint64_t)p_totalNumberOfPagesNeededForPresetCollectionType:(unint64_t)a3;
- (unint64_t)presentationCountForInsertPageViewController:(id)a3;
- (unint64_t)selectedSubpageIndexForInsertPageViewController:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)insertPageViewController:(id)a3 didSelectPageNumber:(unint64_t)a4;
- (void)insertPageViewController:(id)a3 didSelectSubpageAtIndex:(unint64_t)a4;
- (void)insertPageViewController:(id)a3 willSearchWithText:(id)a4 inViewController:(id)a5 searchViewController:(id)a6;
- (void)insertPageViewControllerDidBeginSearch:(id)a3;
- (void)insertPageViewControllerDidEndSearch:(id)a3 cancelledExplicitly:(BOOL)a4;
- (void)insertPageViewControllerWillBeginSearch:(id)a3;
- (void)insertPageViewControllerWillDisappear:(id)a3;
- (void)insertPageViewControllerWillEndSearch:(id)a3 cancelledExplicitly:(BOOL)a4;
- (void)p_changeSelectedShapesToItemAtIndexPath:(id)a3 forPresetCollectionViewController:(id)a4;
- (void)p_closeButtonTapped:(id)a3;
- (void)p_dismissIfNeededWithBlock:(id)a3;
- (void)p_insertShapeAtIndexPath:(id)a3 context:(id)a4;
- (void)p_positionAndInsertBoardItems:(id)a3;
- (void)p_reloadAllPresetCollectionViewControllers;
- (void)p_reloadPages:(id)a3;
- (void)p_reloadPagesIfNeeded:(id)a3;
- (void)p_setAllPresetCollectionViewControllersHidden:(BOOL)a3;
- (void)p_setIntegerDefault:(unint64_t)a3 forKey:(id)a4;
- (void)p_shapeLibraryIndexingDidFinish:(id)a3;
- (void)p_updateForPresentationSemanticContext;
- (void)p_workspaceDidActivate:(id)a3;
- (void)p_workspaceDidEnterBackground:(id)a3;
- (void)p_workspaceWillDeactivate:(id)a3;
- (void)presetCollectionViewController:(id)a3 didSelectPresetAtIndexPath:(id)a4;
- (void)processChanges:(id)a3 forChangeSource:(id)a4;
- (void)setAssociatedBoardItems:(id)a3;
- (void)setP_allPresetCollectionViewControllers:(id)a3;
- (void)setP_announcementTimer:(id)a3;
- (void)setP_cachedViewFrameSize:(CGSize)a3;
- (void)setP_constraintsForHidingNavigationBar:(id)a3;
- (void)setP_constraintsForShowingNavigationBar:(id)a3;
- (void)setP_delegate:(id)a3;
- (void)setP_didDragOutsidePopover:(BOOL)a3;
- (void)setP_didEnterBackground:(BOOL)a3;
- (void)setP_dragEnded:(BOOL)a3;
- (void)setP_draggingView:(id)a3;
- (void)setP_infoIsInsertingViaDrag:(BOOL)a3;
- (void)setP_navigationBar:(id)a3;
- (void)setP_searchState:(unint64_t)a3;
- (void)setP_searchViewController:(id)a3;
- (void)setP_shapeCollectionDataSource:(id)a3;
- (void)setP_shapeInsertViewController:(id)a3;
- (void)setP_shapeSearchResultsCollection:(id)a3;
- (void)setP_shouldChangeSelectedShapes:(BOOL)a3;
- (void)setP_unscaledPopoverAnchorPoint:(CGPoint)a3;
- (void)setShowLinesInLibrary:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CRLiOSShapeLibraryViewController

- (CRLiOSShapeLibraryViewController)initWithDelegate:(id)a3 shouldChangeSelectedShapes:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLiOSShapeLibraryViewController;
  v7 = [(CRLiOSShapeLibraryViewController *)&v11 initWithNibName:0 bundle:0];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v8->_shouldChangeSelectedShapes = a4;
    v8->_unscaledPopoverAnchorPoint = (CGPoint)xmmword_101175160;
    v8->_showLinesInLibrary = 1;
    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v8 selector:"p_shapeLibraryIndexingDidFinish:" name:@"CRLShapeLibraryIndexingDidFinishNotification" object:0];
  }
  return v8;
}

- (CRLiOSShapeLibraryViewController)initWithDelegate:(id)a3
{
  return [(CRLiOSShapeLibraryViewController *)self initWithDelegate:a3 shouldChangeSelectedShapes:0];
}

- (CRLiOSShapeLibraryViewController)initWithDelegate:(id)a3 unscaledPopoverAnchorPoint:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  result = [(CRLiOSShapeLibraryViewController *)self initWithDelegate:a3 shouldChangeSelectedShapes:0];
  if (result)
  {
    result->_unscaledPopoverAnchorPoint.CGFloat x = x;
    result->_unscaledPopoverAnchorPoint.CGFloat y = y;
  }
  return result;
}

- (void)viewDidLoad
{
  v80.receiver = self;
  v80.super_class = (Class)CRLiOSShapeLibraryViewController;
  [(CRLiOSShapeLibraryViewController *)&v80 viewDidLoad];
  v3 = +[UIColor clearColor];
  v4 = [(CRLiOSShapeLibraryViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = +[CRLShapeLibrary sharedLibrary];
  id v6 = [CRLBasicShapeLibrary alloc];
  v7 = +[CRLLocale currentLocale];
  v8 = [(CRLBasicShapeLibrary *)v6 initWithLocale:v7];

  id v9 = [v5 dataLoadStatus];
  v10 = [CRLShapeCollectionDataSource alloc];
  v78 = v5;
  v79 = v8;
  if (v9 == (id)2)
  {
    objc_super v11 = [(CRLShapeCollectionDataSource *)v10 initWithShapeLibrary:v5 basicShapeLibrary:v8];
    shapeCollectionDataSource = self->_shapeCollectionDataSource;
    self->_shapeCollectionDataSource = v11;

    v13 = [[CRLShapeSearchResultsCollection alloc] initWithShapeLibrary:v5 basicShapeLibrary:v8 searchTerm:0];
  }
  else
  {
    v14 = [(CRLShapeCollectionDataSource *)v10 initWithBasicShapeLibrary:v8];
    v15 = self->_shapeCollectionDataSource;
    self->_shapeCollectionDataSource = v14;

    v13 = [[CRLShapeSearchResultsCollection alloc] initWithBasicShapeLibrary:v8 searchTerm:0];
  }
  shapeSearchResultsCollection = self->_shapeSearchResultsCollection;
  self->_shapeSearchResultsCollection = v13;

  id v17 = objc_alloc_init((Class)UINavigationBar);
  [(CRLiOSShapeLibraryViewController *)self setP_navigationBar:v17];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v17 setTranslucent:0];
  v18 = +[UIColor systemGroupedBackgroundColor];
  [v17 setBarTintColor:v18];

  [v17 _setHidesShadow:1];
  v19 = [(CRLiOSShapeLibraryViewController *)self view];
  [v19 addSubview:v17];

  id v20 = objc_alloc((Class)UINavigationItem);
  v21 = +[NSBundle mainBundle];
  v22 = [v21 localizedStringForKey:@"Shapes" value:0 table:0];
  id v23 = [v20 initWithTitle:v22];

  id v76 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:24 target:self action:"p_closeButtonTapped:"];
  v24 = +[NSBundle mainBundle];
  v25 = [v24 localizedStringForKey:@"Done" value:0 table:0];
  [v76 setAccessibilityLabel:v25];

  v77 = v23;
  [v23 setRightBarButtonItem:v76];
  id v86 = v23;
  v26 = +[NSArray arrayWithObjects:&v86 count:1];
  [v17 setItems:v26 animated:0];

  v27 = [(CRLiOSShapeLibraryViewController *)self p_createShapeInsertViewController];
  [(CRLiOSShapeLibraryViewController *)self setP_shapeInsertViewController:v27];
  v28 = [v27 view];
  [v28 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(CRLiOSShapeLibraryViewController *)self addChildViewController:v27];
  v29 = [(CRLiOSShapeLibraryViewController *)self view];
  v30 = [v27 view];
  [v29 addSubview:v30];

  v31 = [(CRLiOSShapeLibraryViewController *)self view];
  v32 = [v31 safeAreaLayoutGuide];

  v75 = [v17 leadingAnchor];
  v74 = [v32 leadingAnchor];
  v73 = [v75 constraintEqualToAnchor:v74];
  v85[0] = v73;
  v67 = v17;
  v71 = [v17 trailingAnchor];
  v70 = [v32 trailingAnchor];
  v69 = [v71 constraintEqualToAnchor:v70];
  v85[1] = v69;
  v68 = [v27 view];
  v66 = [v68 leadingAnchor];
  v65 = [v32 leadingAnchor];
  [v66 constraintEqualToAnchor:v65];
  v64 = v63 = v27;
  v85[2] = v64;
  v62 = [v27 view];
  v61 = [v62 trailingAnchor];
  v60 = [v32 trailingAnchor];
  v33 = [v61 constraintEqualToAnchor:v60];
  v85[3] = v33;
  v34 = [v17 topAnchor];
  v35 = v32;
  v72 = v32;
  v36 = [v32 topAnchor];
  v37 = [v34 constraintEqualToAnchor:v36];
  v85[4] = v37;
  v38 = [v27 view];
  v39 = [v38 bottomAnchor];
  v40 = [v35 bottomAnchor];
  v41 = [v39 constraintEqualToAnchor:v40];
  v85[5] = v41;
  v42 = +[NSArray arrayWithObjects:v85 count:6];
  +[NSLayoutConstraint activateConstraints:v42];

  v43 = [v63 view];
  v44 = [v43 topAnchor];
  v45 = [v67 bottomAnchor];
  v46 = [v44 constraintEqualToAnchor:v45];
  v84 = v46;
  v47 = +[NSArray arrayWithObjects:&v84 count:1];
  [(CRLiOSShapeLibraryViewController *)self setP_constraintsForShowingNavigationBar:v47];

  v48 = [v63 view];
  v49 = [v48 topAnchor];
  v50 = [v72 topAnchor];
  v51 = [v49 constraintEqualToAnchor:v50];
  v83 = v51;
  v52 = +[NSArray arrayWithObjects:&v83 count:1];
  [(CRLiOSShapeLibraryViewController *)self setP_constraintsForHidingNavigationBar:v52];

  [v67 setHidden:1];
  v53 = [(CRLiOSShapeLibraryViewController *)self p_constraintsForHidingNavigationBar];
  +[NSLayoutConstraint activateConstraints:v53];

  [v63 didMoveToParentViewController:self];
  v54 = [[CRLAccessibilityTimer alloc] initWithTargetSerialQueue:&_dispatch_main_q];
  [(CRLiOSShapeLibraryViewController *)self setP_announcementTimer:v54];

  v55 = [(CRLiOSShapeLibraryViewController *)self p_announcementTimer];
  [v55 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];

  uint64_t v82 = objc_opt_class();
  v56 = +[NSArray arrayWithObjects:&v82 count:1];
  id v57 = [(CRLiOSShapeLibraryViewController *)self registerForTraitChanges:v56 withTarget:self action:"p_reloadAllPresetCollectionViewControllers"];

  uint64_t v81 = objc_opt_class();
  v58 = +[NSArray arrayWithObjects:&v81 count:1];
  id v59 = [(CRLiOSShapeLibraryViewController *)self registerForTraitChanges:v58 withTarget:self action:"p_updateForPresentationSemanticContext"];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(CRLShapeCollectionDataSource *)self->_shapeCollectionDataSource setShowLinesInLibrary:[(CRLiOSShapeLibraryViewController *)self showLinesInLibrary]];
  v5.receiver = self;
  v5.super_class = (Class)CRLiOSShapeLibraryViewController;
  [(CRLiOSShapeLibraryViewController *)&v5 viewWillAppear:v3];
  [(CRLiOSShapeLibraryViewController *)self p_updateForPresentationSemanticContext];
}

- (void)viewDidAppear:(BOOL)a3
{
  v21.receiver = self;
  v21.super_class = (Class)CRLiOSShapeLibraryViewController;
  [(CRLiOSShapeLibraryViewController *)&v21 viewDidAppear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  objc_super v5 = [(CRLiOSShapeLibraryViewController *)self view];
  id v6 = [v5 window];
  v7 = [v6 windowScene];

  v8 = +[NSNotification CRLiOSSceneWillResignActive];
  [v4 addObserver:self selector:"p_workspaceWillDeactivate:" name:v8 object:v7];

  id v9 = +[NSNotification CRLiOSSceneDidEnterBackground];
  [v4 addObserver:self selector:"p_workspaceDidEnterBackground:" name:v9 object:v7];

  v10 = +[NSNotification CRLiOSSceneDidBecomeActive];
  [v4 addObserver:self selector:"p_workspaceDidActivate:" name:v10 object:v7];

  objc_super v11 = [(CRLiOSShapeLibraryViewController *)self p_interactiveCanvasController];
  v12 = [v11 changeNotifier];
  v13 = [(CRLiOSShapeLibraryViewController *)self associatedBoardItems];
  v14 = [v13 anyObject];
  v15 = [v14 parentContainerItem];
  [v12 addObserver:self forChangeSource:v15];

  v16 = [(CRLiOSShapeLibraryViewController *)self associatedBoardItems];
  id v17 = [v16 allObjects];
  v18 = [v17 crl_firstObjectPassingTest:&stru_1014E1FD0];

  v19 = [(CRLiOSShapeLibraryViewController *)self p_interactiveCanvasController];
  id v20 = [v19 changeNotifier];
  [v20 addObserver:self forChangeSource:v18];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(CRLiOSShapeLibraryViewController *)self view];
  id v6 = [v5 window];
  v7 = [v6 windowScene];

  v8 = +[NSNotificationCenter defaultCenter];
  id v9 = +[NSNotification CRLiOSSceneWillResignActive];
  [v8 removeObserver:self name:v9 object:v7];

  v10 = +[NSNotification CRLiOSSceneDidEnterBackground];
  [v8 removeObserver:self name:v10 object:v7];

  objc_super v11 = +[NSNotification CRLiOSSceneDidBecomeActive];
  [v8 removeObserver:self name:v11 object:v7];

  v12.receiver = self;
  v12.super_class = (Class)CRLiOSShapeLibraryViewController;
  [(CRLiOSShapeLibraryViewController *)&v12 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(CRLiOSShapeLibraryViewController *)self setP_didDragOutsidePopover:0];
  objc_super v5 = [(CRLiOSShapeLibraryViewController *)self p_shapeSearchResultsCollection];
  [v5 setSearchTerm:0 completionHandler:0];

  id v6 = [(CRLiOSShapeLibraryViewController *)self p_interactiveCanvasController];
  v7 = [v6 changeNotifier];
  v8 = [(CRLiOSShapeLibraryViewController *)self associatedBoardItems];
  id v9 = [v8 anyObject];
  v10 = [v9 parentContainerItem];
  [v7 removeObserver:self forChangeSource:v10];

  objc_super v11 = [(CRLiOSShapeLibraryViewController *)self associatedBoardItems];
  objc_super v12 = [v11 allObjects];
  v13 = [v12 crl_firstObjectPassingTest:&stru_1014E1FF0];

  v14 = [(CRLiOSShapeLibraryViewController *)self p_interactiveCanvasController];
  v15 = [v14 changeNotifier];
  [v15 removeObserver:self forChangeSource:v13];

  [(CRLiOSShapeLibraryViewController *)self setAssociatedBoardItems:0];
  v16.receiver = self;
  v16.super_class = (Class)CRLiOSShapeLibraryViewController;
  [(CRLiOSShapeLibraryViewController *)&v16 viewDidDisappear:v3];
}

- (CGSize)preferredContentSize
{
  BOOL v3 = [(CRLiOSShapeLibraryViewController *)self traitCollection];
  if ([v3 userInterfaceIdiom] != (id)1)
  {

    goto LABEL_5;
  }
  v4 = [(CRLiOSShapeLibraryViewController *)self presentingViewController];

  if (!v4)
  {
LABEL_5:
    v7.receiver = self;
    v7.super_class = (Class)CRLiOSShapeLibraryViewController;
    [(CRLiOSShapeLibraryViewController *)&v7 preferredContentSize];
    goto LABEL_6;
  }
  double v5 = 496.0;
  double v6 = 375.0;
LABEL_6:
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLiOSShapeLibraryViewController;
  -[CRLiOSShapeLibraryViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8 = [(CRLiOSShapeLibraryViewController *)self p_shapeInsertViewController];
  unsigned int v9 = [v8 isViewLoaded];

  if (v9)
  {
    v10 = [(CRLiOSShapeLibraryViewController *)self p_shapeInsertViewController];
    [v10 viewWillTransitionToSize:v7 withTransitionCoordinator:width, height];
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002033E4;
  v11[3] = &unk_1014D98D0;
  v11[4] = self;
  [v7 animateAlongsideTransition:v11 completion:0];
}

- (void)p_workspaceWillDeactivate:(id)a3
{
  id v6 = [(CRLiOSShapeLibraryViewController *)self view];
  [v6 frame];
  -[CRLiOSShapeLibraryViewController setP_cachedViewFrameSize:](self, "setP_cachedViewFrameSize:", v4, v5);
}

- (void)p_workspaceDidEnterBackground:(id)a3
{
}

- (void)p_workspaceDidActivate:(id)a3
{
  if (![(CRLiOSShapeLibraryViewController *)self p_didEnterBackground]) {
    goto LABEL_7;
  }
  [(CRLiOSShapeLibraryViewController *)self setP_didEnterBackground:0];
  [(CRLiOSShapeLibraryViewController *)self p_cachedViewFrameSize];
  double v5 = v4;
  double v7 = v6;
  v8 = [(CRLiOSShapeLibraryViewController *)self view];
  [v8 frame];
  double v10 = v9;
  double v12 = v11;

  if (v5 == v10 && v7 == v12)
  {
LABEL_7:
    v14 = [(CRLiOSShapeLibraryViewController *)self p_pages];
    [(CRLiOSShapeLibraryViewController *)self p_reloadPagesIfNeeded:v14];
  }
  else
  {
    [(CRLiOSShapeLibraryViewController *)self p_reloadAllPresetCollectionViewControllers];
  }

  [(CRLiOSShapeLibraryViewController *)self p_setAllPresetCollectionViewControllersHidden:0];
}

- (void)p_updateForPresentationSemanticContext
{
  BOOL v3 = [(CRLiOSShapeLibraryViewController *)self traitCollection];
  id v4 = [v3 _presentationSemanticContext];

  if (v4 == (id)3)
  {
    double v5 = +[UIColor clearColor];
    double v6 = [(CRLiOSShapeLibraryViewController *)self view];
    [v6 setBackgroundColor:v5];

    double v7 = [(CRLiOSShapeLibraryViewController *)self p_navigationBar];
    [v7 setHidden:1];

    v8 = [(CRLiOSShapeLibraryViewController *)self p_constraintsForShowingNavigationBar];
    +[NSLayoutConstraint deactivateConstraints:v8];

    [(CRLiOSShapeLibraryViewController *)self p_constraintsForHidingNavigationBar];
  }
  else
  {
    double v9 = +[UIColor systemGroupedBackgroundColor];
    double v10 = [(CRLiOSShapeLibraryViewController *)self view];
    [v10 setBackgroundColor:v9];

    double v11 = [(CRLiOSShapeLibraryViewController *)self p_navigationBar];
    [v11 setHidden:0];

    double v12 = [(CRLiOSShapeLibraryViewController *)self p_constraintsForHidingNavigationBar];
    +[NSLayoutConstraint deactivateConstraints:v12];

    [(CRLiOSShapeLibraryViewController *)self p_constraintsForShowingNavigationBar];
  }
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:");
}

- (void)processChanges:(id)a3 forChangeSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = (objc_class *)objc_opt_class();
    double v9 = sub_10024715C(v8, v7);
    double v10 = [(CRLiOSShapeLibraryViewController *)self associatedBoardItems];
    double v11 = [v10 allObjects];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100203874;
    v14[3] = &unk_1014E2018;
    id v12 = v9;
    id v15 = v12;
    if ((objc_msgSend(v11, "crl_allObjectsPassTest:", v14) & 1) == 0) {
      [(CRLiOSShapeLibraryViewController *)self dismissViewControllerAnimated:1 completion:0];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1002038CC;
      v13[3] = &unk_1014E2040;
      v13[4] = self;
      [v6 enumerateObjectsUsingBlock:v13];
    }
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
}

- (id)p_editingCoordinator
{
  BOOL v3 = [(CRLiOSShapeLibraryViewController *)self p_delegate];
  id v4 = [v3 editingCoordinatorForShapeLibraryViewController:self];

  return v4;
}

- (id)p_boardItemFactory
{
  v2 = [(CRLiOSShapeLibraryViewController *)self p_editingCoordinator];
  BOOL v3 = [v2 boardItemFactory];

  return v3;
}

- (id)p_interactiveCanvasController
{
  BOOL v3 = [(CRLiOSShapeLibraryViewController *)self p_delegate];
  id v4 = [v3 interactiveCanvasControllerForShapeLibraryViewController:self];

  return v4;
}

- (id)insertPageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(CRLiOSShapeLibraryViewController *)self p_pages];
  double v9 = (objc_class *)objc_opt_class();
  double v10 = sub_10024715C(v9, v6);

  double v11 = (char *)[v8 indexOfObject:v10];
  id v12 = [(CRLiOSShapeLibraryViewController *)self p_shapeInsertViewController];

  if (v12 != v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2060);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108B3E0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2080);
    }
    id v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v13);
    }
    v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController insertPageViewController:viewControllerBeforeViewController:]");
    id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:411 isFatal:0 description:"Delegate callback called for unexpected insert page view controller."];
  }
  if (v11 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v16 = 0;
  }
  else
  {
    objc_super v16 = 0;
    if ((unint64_t)[v8 count] >= 2 && v11)
    {
      objc_super v16 = [v8 objectAtIndexedSubscript:v11 - 1];
    }
  }

  return v16;
}

- (id)insertPageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(CRLiOSShapeLibraryViewController *)self p_pages];
  double v9 = (objc_class *)objc_opt_class();
  double v10 = sub_10024715C(v9, v6);

  double v11 = (char *)[v8 indexOfObject:v10];
  id v12 = [(CRLiOSShapeLibraryViewController *)self p_shapeInsertViewController];

  if (v12 != v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E20A0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108B468();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E20C0);
    }
    id v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v13);
    }
    v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController insertPageViewController:viewControllerAfterViewController:]");
    id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:428 isFatal:0 description:"Delegate callback called for unexpected insert page view controller."];
  }
  if (v11 == (char *)0x7FFFFFFFFFFFFFFFLL
    || (unint64_t)[v8 count] < 2
    || v11 >= (char *)[v8 count] - 1)
  {
    objc_super v16 = 0;
  }
  else
  {
    objc_super v16 = [v8 objectAtIndexedSubscript:v11 + 1];
  }

  return v16;
}

- (id)insertPageViewController:(id)a3 viewControllerForPageAtIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(CRLiOSShapeLibraryViewController *)self p_shapeInsertViewController];

  if (v7 != v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E20E0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108B4F0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2100);
    }
    v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    double v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController insertPageViewController:viewControllerForPageAtIndex:]");
    double v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:441 isFatal:0 description:"Delegate callback called for unexpected insert page view controller."];
  }
  double v11 = [(CRLiOSShapeLibraryViewController *)self p_pages];
  if ((unint64_t)[v11 count] <= a4)
  {
    id v12 = 0;
  }
  else
  {
    id v12 = [v11 objectAtIndexedSubscript:a4];
  }

  return v12;
}

- (id)insertPageViewControllerViewControllerForSearch:(id)a3
{
  id v4 = [[CRLiOSPresetCollectionViewController alloc] initWithPresetCollectionType:0 delegate:self];
  [(CRLiOSShapeLibraryViewController *)self setP_searchViewController:v4];

  return v4;
}

- (unint64_t)presentationCountForInsertPageViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLiOSShapeLibraryViewController *)self p_shapeInsertViewController];

  if (v5 != v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2120);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108B578();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2140);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController presentationCountForInsertPageViewController:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:457 isFatal:0 description:"Delegate callback called for unexpected insert page view controller."];
  }
  double v9 = [(CRLiOSShapeLibraryViewController *)self p_pages];
  id v10 = [v9 count];

  return (unint64_t)v10;
}

- (unint64_t)insertPageViewController:(id)a3 presentationIndexForViewController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CRLiOSShapeLibraryViewController *)self p_shapeInsertViewController];

  if (v8 != v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2160);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108B600();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2180);
    }
    double v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController insertPageViewController:presentationIndexForViewController:]");
    double v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:462 isFatal:0 description:"Delegate callback called for unexpected insert page view controller."];
  }
  id v12 = (objc_class *)objc_opt_class();
  id v13 = sub_10024715C(v12, v6);

  unint64_t v14 = [(CRLiOSShapeLibraryViewController *)self p_pageNumberForPresetCollectionViewController:v13];
  return v14;
}

- (unint64_t)selectedSubpageIndexForInsertPageViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLiOSShapeLibraryViewController *)self p_shapeInsertViewController];

  if (v5 != v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E21A0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108B688();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E21C0);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController selectedSubpageIndexForInsertPageViewController:]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:469 isFatal:0 description:"Delegate callback called for unexpected insert page view controller."];
  }
  return 0;
}

- (void)insertPageViewController:(id)a3 didSelectPageNumber:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [v6 selectedPageNumberAutosaveName];
  [(CRLiOSShapeLibraryViewController *)self p_setIntegerDefault:a4 forKey:v7];

  id v8 = [(CRLiOSShapeLibraryViewController *)self p_shapeInsertViewController];

  if (v8 != v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E21E0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108B710();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2200);
    }
    double v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController insertPageViewController:didSelectPageNumber:]");
    double v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:480 isFatal:0 description:"Delegate callback called for unexpected insert page view controller."];
  }
  id v12 = [(CRLiOSShapeLibraryViewController *)self p_pages];
  id v13 = [v12 objectAtIndexedSubscript:a4];

  [v13 accessibilityFocusFirstVisiblePreset];
}

- (void)insertPageViewController:(id)a3 didSelectSubpageAtIndex:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [(CRLiOSShapeLibraryViewController *)self p_shapeInsertViewController];

  if (v6 != v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2220);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108B798();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2240);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController insertPageViewController:didSelectSubpageAtIndex:]");
    double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:487 isFatal:0 description:"Delegate callback called for unexpected insert page view controller."];
  }
}

- (void)insertPageViewControllerWillBeginSearch:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLiOSShapeLibraryViewController *)self p_shapeInsertViewController];

  if (v5 != v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2260);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108B820();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2280);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController insertPageViewControllerWillBeginSearch:]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:492 isFatal:0 description:"Delegate callback called for unexpected insert page view controller."];
  }
  double v9 = [(CRLiOSShapeLibraryViewController *)self p_delegate];
  [v9 shapeLibraryViewControllerWillBeginSearch:self];
}

- (void)insertPageViewControllerDidBeginSearch:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLiOSShapeLibraryViewController *)self p_shapeInsertViewController];

  if (v5 != v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E22A0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108B8A8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E22C0);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController insertPageViewControllerDidBeginSearch:]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:497 isFatal:0 description:"Delegate callback called for unexpected insert page view controller."];
  }
  [(CRLiOSShapeLibraryViewController *)self setP_searchState:1];
}

- (BOOL)insertPageViewControllerShouldChangeSearchText:(id)a3
{
  return ![(CRLiOSShapeLibraryViewController *)self p_didDragOutsidePopover];
}

- (void)insertPageViewController:(id)a3 willSearchWithText:(id)a4 inViewController:(id)a5 searchViewController:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(CRLiOSShapeLibraryViewController *)self p_shapeInsertViewController];

  if (v14 != v10)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E22E0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108B9D8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2300);
    }
    id v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108B930(v15);
    }
    objc_super v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController insertPageViewController:willSearchWithText:inViewController:searchViewController:]");
    id v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:506 isFatal:0 description:"Delegate callback called for unexpected insert page view controller."];
  }
  v18 = [(CRLiOSShapeLibraryViewController *)self p_searchState];
  if ([v11 length]) {
    uint64_t v19 = 2;
  }
  else {
    uint64_t v19 = 1;
  }
  unint64_t v20 = [(CRLiOSShapeLibraryViewController *)self p_searchState];
  if (v20 != v19) {
    [(CRLiOSShapeLibraryViewController *)self setP_searchState:v19];
  }
  objc_initWeak(&location, self);
  objc_super v21 = [(CRLiOSShapeLibraryViewController *)self p_shapeSearchResultsCollection];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100205490;
  v25[3] = &unk_1014E2328;
  BOOL v30 = v20 != v19;
  id v22 = v12;
  id v26 = v22;
  v29[1] = v18;
  v29[2] = (id)v19;
  id v23 = v13;
  id v27 = v23;
  id v24 = v11;
  id v28 = v24;
  objc_copyWeak(v29, &location);
  [v21 setSearchTerm:v24 completionHandler:v25];

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
}

- (void)insertPageViewControllerWillEndSearch:(id)a3 cancelledExplicitly:(BOOL)a4
{
  id v5 = a3;
  id v6 = [(CRLiOSShapeLibraryViewController *)self p_shapeInsertViewController];

  if (v6 != v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2348);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108BA60();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2368);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController insertPageViewControllerWillEndSearch:cancelledExplicitly:]");
    double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:546 isFatal:0 description:"Delegate callback called for unexpected insert page view controller."];
  }
  [(CRLiOSShapeLibraryViewController *)self setP_searchState:0];
  id v10 = [(CRLiOSShapeLibraryViewController *)self p_shapeSearchResultsCollection];
  [v10 setSearchTerm:0 completionHandler:0];

  id v11 = [(CRLiOSShapeLibraryViewController *)self p_delegate];
  [v11 shapeLibraryViewControllerDidCancelSearch:self];
}

- (void)insertPageViewControllerDidEndSearch:(id)a3 cancelledExplicitly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CRLiOSShapeLibraryViewController *)self p_shapeInsertViewController];

  if (v7 != v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2388);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108BAE8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E23A8);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    double v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController insertPageViewControllerDidEndSearch:cancelledExplicitly:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:553 isFatal:0 description:"Delegate callback called for unexpected insert page view controller."];
  }
  if (v4)
  {
    id v11 = [(CRLiOSShapeLibraryViewController *)self p_interactiveCanvasController];
    id v12 = [v11 layerHost];
    [v12 becomeFirstResponder];
  }
}

- (BOOL)insertPageViewControllerShouldAppearInSearchMode:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLiOSShapeLibraryViewController *)self p_shapeInsertViewController];

  if (v5 != v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E23C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108BB70();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E23E8);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController insertPageViewControllerShouldAppearInSearchMode:]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:560 isFatal:0 description:"Delegate callback called for unexpected insert page view controller."];
  }
  double v9 = [(CRLiOSShapeLibraryViewController *)self p_delegate];
  unsigned __int8 v10 = [v9 shapeLibraryViewControllerShouldAppearInSearchMode:self];

  return v10;
}

- (void)insertPageViewControllerWillDisappear:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLiOSShapeLibraryViewController *)self p_shapeInsertViewController];

  if (v5 != v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2408);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108BBF8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2428);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController insertPageViewControllerWillDisappear:]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:565 isFatal:0 description:"Delegate callback called for unexpected insert page view controller."];
  }
  if ((id)[(CRLiOSShapeLibraryViewController *)self p_searchState] == (id)2
    || (id)[(CRLiOSShapeLibraryViewController *)self p_searchState] == (id)1)
  {
    double v9 = [(CRLiOSShapeLibraryViewController *)self p_shapeSearchResultsCollection];
    unsigned __int8 v10 = [v9 searchTerm];

    id v11 = &stru_101538650;
    if (v10) {
      id v11 = v10;
    }
    id v12 = v11;
  }
  else
  {
    id v12 = 0;
  }
  id v13 = [(CRLiOSShapeLibraryViewController *)self p_delegate];
  [v13 shapeLibraryViewController:self willDisappearWithSearchTerm:v12];
}

- (id)insertPageViewControllerDefaultSearchTerm:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLiOSShapeLibraryViewController *)self p_shapeInsertViewController];

  if (v5 != v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2448);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108BC80();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2468);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController insertPageViewControllerDefaultSearchTerm:]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:575 isFatal:0 description:"Delegate callback called for unexpected insert page view controller."];
  }
  double v9 = [(CRLiOSShapeLibraryViewController *)self p_delegate];
  unsigned __int8 v10 = [v9 shapeLibraryViewControllerDefaultSearchTerm:self];

  return v10;
}

- (BOOL)allowsInsertDrag
{
  v2 = self;
  BOOL v3 = [(CRLiOSShapeLibraryViewController *)self p_delegate];
  LOBYTE(v2) = [v3 shapeLibraryViewControllerShouldAllowInsertDrag:v2];

  return (char)v2;
}

- (id)backgroundColorForPresetCollectionViewController:(id)a3
{
  return +[UIColor clearColor];
}

- (id)contextWithPresetCollectionViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLiOSShapeLibraryViewController *)self traitCollection];
  if ([v5 userInterfaceIdiom] == (id)1
    && ([(CRLiOSShapeLibraryViewController *)self presentingViewController],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = (void *)v6;
    [(CRLiOSShapeLibraryViewController *)self p_contentSize];
    double v9 = v8;

    if (v9 <= 496.0)
    {
      uint64_t v10 = 1;
      goto LABEL_9;
    }
  }
  else
  {
  }
  if ([(CRLiOSShapeLibraryViewController *)self p_isSidebarLike]) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 0;
  }
LABEL_9:
  unint64_t v11 = [(CRLiOSShapeLibraryViewController *)self p_pageNumberForPresetCollectionViewController:v4];
  BOOL v12 = (id)[(CRLiOSShapeLibraryViewController *)self p_searchState] == (id)2;
  id v13 = [CRLiOSPresetCollectionContext alloc];
  [(CRLiOSShapeLibraryViewController *)self p_contentSize];
  double v15 = v14;
  double v17 = v16;
  v18 = [(CRLiOSShapeLibraryViewController *)self p_editingCoordinator];
  uint64_t v19 = [(CRLiOSShapeLibraryViewController *)self traitCollection];
  unint64_t v20 = -[CRLiOSPresetCollectionContext initWithContextType:contentSize:editingCoordinator:isSearching:pageIndex:subpageIndex:traitCollection:](v13, "initWithContextType:contentSize:editingCoordinator:isSearching:pageIndex:subpageIndex:traitCollection:", v10, v18, v12, v11, 0, v19, v15, v17);

  return v20;
}

- (void)presetCollectionViewController:(id)a3 didSelectPresetAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(CRLiOSShapeLibraryViewController *)self p_editingCoordinator];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100206474;
  v11[3] = &unk_1014E2490;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [v8 canPerformUserActionUsingBlock:v11];
}

- (void)p_changeSelectedShapesToItemAtIndexPath:(id)a3 forPresetCollectionViewController:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = [(CRLiOSShapeLibraryViewController *)self p_interactiveCanvasController];
  double v8 = [v7 editorController];
  id v9 = [v8 mostSpecificCurrentEditorOfClass:objc_opt_class()];
  if (v9)
  {
    id v10 = [(CRLiOSShapeLibraryViewController *)self contextWithPresetCollectionViewController:v6];
    unint64_t v11 = [(CRLiOSShapeLibraryViewController *)self p_shapeAtIndexPath:v16 context:v10];
    id v12 = [v11 pathSourceWithSize:100.0, 100.0];
    +[CRLShapeLibraryPopoverHelper changeShapeForEditor:v9 shapePathSource:v12 interactiveCanvasController:v7];
  }
  [(CRLiOSShapeLibraryViewController *)self dismissViewControllerAnimated:1 completion:0];
  if ([(CRLiOSShapeLibraryViewController *)self p_isCompact])
  {
    id v13 = [v7 layerHost];
    double v14 = [v13 miniFormatterPresenter];
    double v15 = [v8 selectionPath];
    [v14 presentMiniFormatterForSelectionPath:v15];
  }
}

- (id)itemsForBeginningDragSessionForPresetCollectionViewController:(id)a3 forCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v46 = a4;
  id v9 = a5;
  v47 = [(CRLiOSShapeLibraryViewController *)self contextWithPresetCollectionViewController:v8];
  id v10 = (objc_class *)objc_opt_class();
  unint64_t v11 = -[CRLiOSShapeLibraryViewController p_boardItemForPresetCollectionType:atIndexPath:context:](self, "p_boardItemForPresetCollectionType:atIndexPath:context:", [v8 presetCollectionType], v9, v47);
  id v12 = sub_10024715C(v10, v11);

  if (v12)
  {
    v44 = objc_alloc_init(CRLItemProviderItemWriter);
    v56 = v12;
    id v13 = +[NSArray arrayWithObjects:&v56 count:1];
    double v14 = [(CRLiOSShapeLibraryViewController *)self p_interactiveCanvasController];
    v45 = [(CRLItemProviderItemWriter *)v44 createItemProviderWithCopyOfBoardItems:v13 fromInteractiveCanvasController:v14 outCopiedBoardItems:0];

    if (v45)
    {
      double v15 = [v46 cellForItemAtIndexPath:v9];
      id v16 = (objc_class *)objc_opt_class();
      id v22 = sub_100246E2C(v15, v16, 1, v17, v18, v19, v20, v21, (uint64_t)&OBJC_PROTOCOL___CRLiOSPresetCollectionViewCell);

      v52[0] = 0;
      v52[1] = v52;
      v52[2] = 0x3032000000;
      v52[3] = sub_100206DBC;
      v52[4] = sub_100206DCC;
      id v23 = [v22 presetButton];
      id v53 = [v23 imageView];

      id v24 = [(CRLiOSShapeLibraryViewController *)self p_shapeAtIndexPath:v9 context:v47];
      unint64_t v25 = (unint64_t)[v24 shapeType];

      v43 = objc_alloc_init(CRLSwatchRenderingContext);
      if (v25 <= 0x14 && ((1 << v25) & 0x1D8006) != 0)
      {
        double v26 = 45.0;
      }
      else if ((v25 & 0xFFFFFFFFFFFFFFEFLL) == 2 || v25 == 19)
      {
        double v26 = 45.0;
      }
      else
      {
        double v26 = 0.0;
      }
      v50[0] = 0;
      v50[1] = v50;
      v50[2] = 0x3032000000;
      v50[3] = sub_100206DBC;
      v50[4] = sub_100206DCC;
      id v51 = 0;
      id v27 = +[CRLSwatchCache swatchCache];
      id v28 = [v22 presetButton];
      [v28 bounds];
      double v30 = v29;
      double v32 = v31;
      v33 = [v12 pathSource];
      v34 = [(CRLiOSShapeLibraryViewController *)self p_editingCoordinator];
      v35 = [v27 shapeItemWithPresetsForSize:v25 shapeType:v33 shapePathSource:v34 angle:v43 editingCoordinator:v30 renderingContext:v26];

      v55 = v35;
      v36 = +[NSArray arrayWithObjects:&v55 count:1];
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_100206DD4;
      v49[3] = &unk_1014E24F8;
      v49[4] = v35;
      v49[5] = v50;
      v49[6] = v25;
      +[CRLCanvasLayoutController temporaryLayoutControllerForInfos:v36 useInBlock:v49];

      id v37 = [objc_alloc((Class)UIDragItem) initWithItemProvider:v45];
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_10020718C;
      v48[3] = &unk_1014E2520;
      v48[4] = v50;
      v48[5] = v52;
      [v37 setPreviewProvider:v48];
      id v54 = v37;
      v38 = +[NSArray arrayWithObjects:&v54 count:1];

      _Block_object_dispose(v50, 8);
      _Block_object_dispose(v52, 8);
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E24B0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108BDB0();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E24D0);
      }
      v39 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108BD08(v39);
      }
      id v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController itemsForBeginningDragSessionForPresetCollectionViewController:forCollectionView:atIndexPath:]");
      v40 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v40, 687, 0, "invalid nil value for '%{public}s'", "itemProvider");

      v38 = &__NSArray0__struct;
    }
  }
  else
  {
    v38 = &__NSArray0__struct;
  }

  return v38;
}

- (BOOL)staysOpenOnSelectionChange
{
  if ([(CRLiOSShapeLibraryViewController *)self p_canInsertAndConnectBoardItemToSelectedConnectionLine:0])
  {
    return 0;
  }
  else
  {
    return ![(CRLiOSShapeLibraryViewController *)self p_shouldChangeSelectedShapes];
  }
}

- (id)p_boardItemForPresetCollectionType:(unint64_t)a3 atIndexPath:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(CRLiOSShapeLibraryViewController *)self p_boardItemFactory];
  if (a3)
  {
    unint64_t v11 = 0;
  }
  else
  {
    unint64_t v11 = [(CRLiOSShapeLibraryViewController *)self p_shapeInfoAtIndexPath:v8 boardItemFactory:v10 context:v9];
  }

  return v11;
}

- (id)p_shapeInfoAtIndexPath:(id)a3 boardItemFactory:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = [(CRLiOSShapeLibraryViewController *)self p_shapeAtIndexPath:a3 context:a5];
  id v10 = [v9 pathSourceWithSize:100.0, 100.0];
  unint64_t v11 = [(CRLiOSShapeLibraryViewController *)self p_interactiveCanvasController];
  id v12 = [v11 selectionModelTranslator];
  id v13 = [v11 editorController];
  double v14 = [v13 selectionPath];
  double v15 = [v12 infosForSelectionPath:v14];

  uint64_t v16 = objc_opt_class();
  uint64_t v17 = [v15 anyObject];
  uint64_t v18 = sub_1002469D0(v16, v17);

  uint64_t v19 = objc_opt_class();
  uint64_t v20 = [v11 board];
  uint64_t v21 = [v18 getConnectedFromWithBoardItemOwner:v20];
  if (v21)
  {
    id v22 = sub_1002469D0(v19, v21);
  }
  else
  {
    [v11 board];
    id v29 = v8;
    id v23 = v30 = v9;
    [v18 getConnectedToWithBoardItemOwner:v23];
    v25 = id v24 = v10;
    id v22 = sub_1002469D0(v19, v25);

    id v10 = v24;
    id v8 = v29;
    id v9 = v30;
  }

  if (![(CRLiOSShapeLibraryViewController *)self showLinesInLibrary]
    && v18
    && v22
    && [v15 count] == (id)1)
  {
    uint64_t v26 = objc_msgSend(v8, "makeShapeItemForDiagramWithConnectingTo:with:shapeType:", v22, v10, objc_msgSend(v9, "shapeType"));
  }
  else
  {
    uint64_t v26 = [v8 makeShapeItemWithShapeType:[v9 shapeType] pathSource:v10];
  }
  id v27 = (void *)v26;

  return v27;
}

- (void)p_insertShapeAtIndexPath:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CRLiOSShapeLibraryViewController *)self p_boardItemFactory];
  id v9 = [(CRLiOSShapeLibraryViewController *)self p_interactiveCanvasController];
  id v10 = [v9 commandController];
  [v10 openGroup];
  [v10 enableProgressiveEnqueuingInCurrentGroup];
  unint64_t v11 = [(CRLiOSShapeLibraryViewController *)self p_shapeAtIndexPath:v7 context:v6];
  id v12 = [v11 shapeType];

  id v13 = [(CRLiOSShapeLibraryViewController *)self p_shapeInfoAtIndexPath:v7 boardItemFactory:v8 context:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v14 = [v9 canvasEditor];
    double v15 = [v14 infosToConnect];
    id v16 = [v15 count];

    if (v16 == (id)2)
    {
      uint64_t v17 = [v9 canvasEditor];
      uint64_t v18 = [v17 connectionLineItemToUseForConnecting];

      if (v18)
      {
        uint64_t v19 = [v8 makeDuplicateOfBoardItem:v18];
        uint64_t v20 = (void *)v19;
        if (v19) {
          uint64_t v21 = (void *)v19;
        }
        else {
          uint64_t v21 = v13;
        }
        id v22 = v21;

        id v13 = v22;
      }
    }
  }
  uint64_t v23 = objc_opt_class();
  id v24 = sub_1002469D0(v23, v13);
  unint64_t v25 = v24;
  if (v24)
  {
    if (v12 == (id)21)
    {
      uint64_t v26 = [v24 pathSource];
      id v27 = [v26 localizationKey];
    }
    else
    {
      id v27 = +[CRLBasicShapeLibraryShape baseNameForShapeType:v12];
    }
    +[CRLAnalyticsShapeInserted sendShapeInsertedAnalyticsWithShapeIdentifier:v27 isMiniShapePicker:0];
  }
  id v28 = [v9 canvasEditor];
  id v29 = [v28 infosToConnect];
  double v30 = [v8 blockToRunCommandToPostProcessWithNewBoardItem:v13 shapeType:v12 infosToConnect:v29 commandController:v10];

  double v32 = v13;
  double v31 = +[NSArray arrayWithObjects:&v32 count:1];
  [(CRLiOSShapeLibraryViewController *)self p_positionAndInsertBoardItems:v31];

  v30[2](v30);
  [v10 closeGroup];
  [(CRLiOSShapeLibraryViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (BOOL)p_isCompact
{
  BOOL v3 = [(CRLiOSShapeLibraryViewController *)self p_delegate];
  id v4 = [v3 boardViewControllerTraitCollectionForShapeLibraryViewController:self];

  if (objc_msgSend(v4, "crl_isCompactWidth")) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = +[UIDevice crl_phoneUI];
  }

  return v5;
}

- (id)p_pages
{
  return [(CRLiOSShapeLibraryViewController *)self p_pagesForSegment:0];
}

- (id)p_pagesForSegment:(unint64_t)a3
{
  BOOL v5 = [(CRLiOSShapeLibraryViewController *)self p_allPresetCollectionViewControllers];
  id v6 = v5;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t)[v5 count] <= a3)
  {
    id v8 = &__NSArray0__struct;
  }
  else
  {
    id v7 = [(CRLiOSShapeLibraryViewController *)self p_allPresetCollectionViewControllers];
    id v8 = [v7 objectAtIndexedSubscript:a3];
  }

  return v8;
}

- (id)p_createShapeInsertViewController
{
  BOOL v3 = [(CRLiOSShapeLibraryViewController *)self p_pagesForPresetCollectionType:0];
  id v4 = [(CRLiOSShapeLibraryViewController *)self p_pageViewControllerWithPages:v3 presetCollectionType:0];
  id v7 = v3;
  BOOL v5 = +[NSArray arrayWithObjects:&v7 count:1];
  [(CRLiOSShapeLibraryViewController *)self setP_allPresetCollectionViewControllers:v5];

  return v4;
}

- (unint64_t)p_totalNumberOfPagesNeededForPresetCollectionType:(unint64_t)a3
{
  if (a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2540);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108BE4C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2560);
    }
    id v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    BOOL v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController p_totalNumberOfPagesNeededForPresetCollectionType:]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:910 isFatal:0 description:"This method only knows how to count pages of shapes."];
  }
  id v7 = [(CRLiOSShapeLibraryViewController *)self p_shapeCollectionDataSource];
  id v8 = [v7 categoryNames];
  id v9 = [v8 count];

  return (unint64_t)v9;
}

- (id)p_pagesForPresetCollectionType:(unint64_t)a3
{
  unint64_t v5 = -[CRLiOSShapeLibraryViewController p_totalNumberOfPagesNeededForPresetCollectionType:](self, "p_totalNumberOfPagesNeededForPresetCollectionType:");
  id v6 = +[NSMutableArray arrayWithCapacity:v5];
  if (v5)
  {
    unint64_t v7 = v5;
    do
    {
      id v8 = [[CRLiOSPresetCollectionViewController alloc] initWithPresetCollectionType:a3 delegate:self];
      [v6 addObject:v8];

      --v7;
    }
    while (v7);
  }
  if (![v6 count])
  {
    unsigned int v9 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E2580);
    }
    id v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67110402;
      unsigned int v16 = v9;
      __int16 v17 = 2082;
      uint64_t v18 = "-[CRLiOSShapeLibraryViewController p_pagesForPresetCollectionType:]";
      __int16 v19 = 2082;
      uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m";
      __int16 v21 = 1024;
      int v22 = 924;
      __int16 v23 = 2048;
      unint64_t v24 = a3;
      __int16 v25 = 2048;
      unint64_t v26 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Insert pages are empty for type %zi! Requested %zi pages.", buf, 0x36u);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E25A0);
    }
    unint64_t v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController p_pagesForPresetCollectionType:]");
    id v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 924, 0, "Insert pages are empty for type %zi! Requested %zi pages.", a3, v5);
  }

  return v6;
}

- (id)p_pageViewControllerWithPages:(id)a3 presetCollectionType:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [[CRLiOSInsertPageViewController alloc] initWithTransitionStyle:1 navigationOrientation:0 options:0];
  id v8 = v7;
  unint64_t v9 = 0;
  if (!a4)
  {
    [(CRLiOSInsertPageViewController *)v7 setSelectedPageNumberAutosaveName:@"CRLiOSInsertPageViewControllerSelectedPageShapes"];
    [(CRLiOSInsertPageViewController *)v8 setSelectedSubpageAutosaveName:@"CRLiOSInsertPageViewControllerSelectedSubpageShapes"];
    unint64_t v9 = 0;
  }
  id v10 = [(CRLiOSInsertPageViewController *)v8 selectedPageNumberAutosaveName];
  unint64_t v11 = [(CRLiOSShapeLibraryViewController *)self p_integerDefaultForKey:v10];

  if (v11 != 0x7FFFFFFFFFFFFFFFLL && v11 < (unint64_t)[v6 count]) {
    unint64_t v9 = v11;
  }
  id v12 = [v6 objectAtIndexedSubscript:v9];
  [(CRLiOSInsertPageViewController *)v8 setInsertPageViewControllerDataSource:self];
  [(CRLiOSInsertPageViewController *)v8 setInsertPageViewControllerDelegate:self];
  id v13 = [v12 layout];
  [(CRLiOSInsertPageViewController *)v8 setInsertPageViewControllerNavigationDataSource:v13];

  [(CRLiOSShapeLibraryViewController *)self preferredContentSize];
  -[CRLiOSInsertPageViewController setPreferredContentSize:](v8, "setPreferredContentSize:");
  unsigned int v16 = v12;
  double v14 = +[NSArray arrayWithObjects:&v16 count:1];
  [(CRLiOSInsertPageViewController *)v8 setViewControllers:v14];

  return v8;
}

- (void)p_reloadPages:(id)a3
{
}

- (void)p_reloadPagesIfNeeded:(id)a3
{
}

- (unint64_t)p_pageNumberForPresetCollectionViewController:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CRLiOSShapeLibraryViewController *)self p_pages];
  id v6 = [v5 indexOfObject:v4];

  return (unint64_t)v6;
}

- (void)p_reloadAllPresetCollectionViewControllers
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  BOOL v3 = [(CRLiOSShapeLibraryViewController *)self p_allPresetCollectionViewControllers];
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      unint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v7);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v9 = v8;
        id v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v16;
          do
          {
            id v13 = 0;
            do
            {
              if (*(void *)v16 != v12) {
                objc_enumerationMutation(v9);
              }
              [*(id *)(*((void *)&v15 + 1) + 8 * (void)v13) reloadData];
              id v13 = (char *)v13 + 1;
            }
            while (v11 != v13);
            id v11 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v11);
        }

        unint64_t v7 = (char *)v7 + 1;
      }
      while (v7 != v5);
      id v5 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }

  double v14 = [(CRLiOSShapeLibraryViewController *)self p_searchViewController];
  [v14 reloadData];
}

- (void)p_setAllPresetCollectionViewControllersHidden:(BOOL)a3
{
  BOOL v3 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = [(CRLiOSShapeLibraryViewController *)self p_allPresetCollectionViewControllers];
  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v8);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v10 = v9;
        id v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v17;
          do
          {
            double v14 = 0;
            do
            {
              if (*(void *)v17 != v13) {
                objc_enumerationMutation(v10);
              }
              long long v15 = [*(id *)(*((void *)&v16 + 1) + 8 * (void)v14) view];
              [v15 setHidden:v3];

              double v14 = (char *)v14 + 1;
            }
            while (v12 != v14);
            id v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v12);
        }

        id v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      id v6 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }
}

- (void)p_setIntegerDefault:(unint64_t)a3 forKey:(id)a4
{
  id v5 = a4;
  id v7 = +[NSUserDefaults standardUserDefaults];
  id v6 = +[NSNumber numberWithUnsignedInteger:a3];
  [v7 setObject:v6 forKey:v5];
}

- (unint64_t)p_integerDefaultForKey:(id)a3
{
  id v3 = a3;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 objectForKey:v3];

  id v7 = sub_10024715C(v4, v6);

  if (v7) {
    unint64_t v8 = (unint64_t)[v7 integerValue];
  }
  else {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (CGSize)p_contentSize
{
  v2 = [(CRLiOSShapeLibraryViewController *)self p_shapeInsertViewController];
  [v2 contentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (BOOL)p_isSidebarLike
{
  [(CRLiOSShapeLibraryViewController *)self p_contentSize];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(CRLiOSShapeLibraryViewController *)self traitCollection];
  BOOL v8 = [v7 userInterfaceIdiom] == (id)1
    && [v7 verticalSizeClass] == (id)2
    && [v7 horizontalSizeClass] == (id)1
    && v6 >= 736.0
    && v4 <= 375.0;

  return v8;
}

- (void)p_closeButtonTapped:(id)a3
{
}

- (void)p_dismissIfNeededWithBlock:(id)a3
{
  double v4 = (void (**)(void))a3;
  if ([(CRLiOSShapeLibraryViewController *)self p_isCompact])
  {
    [(CRLiOSShapeLibraryViewController *)self dismissViewControllerAnimated:1 completion:v4];
  }
  else if (v4)
  {
    v4[2]();
  }
}

- (BOOL)p_canInsertAndConnectBoardItemToSelectedConnectionLine:(id)a3
{
  id v4 = a3;
  double v5 = [(CRLiOSShapeLibraryViewController *)self p_interactiveCanvasController];
  double v6 = [v5 editorController];
  double v7 = [v6 mostSpecificCurrentEditorOfClass:objc_opt_class()];

  if (!v7
    || (([(CRLiOSShapeLibraryViewController *)self p_unscaledPopoverAnchorPoint],
         v9 == INFINITY)
      ? (BOOL v10 = v8 == INFINITY)
      : (BOOL v10 = 0),
        v10))
  {
    BOOL v12 = 0;
  }
  else
  {
    if (v4) {
      unsigned __int8 v11 = [v7 canHandleInsertAndConnectBoardItem:v4];
    }
    else {
      unsigned __int8 v11 = [v7 currentSelectionIsValidForInsertAndConnectBoardItem];
    }
    BOOL v12 = v11;
  }

  return v12;
}

- (void)p_positionAndInsertBoardItems:(id)a3
{
  id v4 = a3;
  double v5 = +[CRLInsertionContext nonInteractiveInsertionContext];
  double v6 = [(CRLiOSShapeLibraryViewController *)self p_interactiveCanvasController];
  double v7 = [v6 editorController];
  double v8 = [v7 mostSpecificCurrentEditorOfClass:objc_opt_class()];

  if ([v4 count] == (id)1)
  {
    double v9 = [v4 objectAtIndexedSubscript:0];
    unsigned int v10 = [(CRLiOSShapeLibraryViewController *)self p_canInsertAndConnectBoardItemToSelectedConnectionLine:v9];

    if (v10)
    {
      unsigned __int8 v11 = [v4 objectAtIndexedSubscript:0];
      uint64_t v12 = [v8 anyConnectionLine];
      uint64_t v13 = (void *)v12;
      if (v8)
      {
        if (v12)
        {
LABEL_31:
          [v8 insertAndConnectBoardItem:v11 postProcessBlock:0];
          +[CRLInsertionAnimationHelper addInsertionAnimationsToInfo:v11 connectionLineLayout:v13 onInteractiveCanvasController:v6];

          goto LABEL_32;
        }
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E25C0);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10108BF70();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E25E0);
        }
        long long v20 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v20);
        }
        long long v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController p_positionAndInsertBoardItems:]");
        long long v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 1065, 0, "invalid nil value for '%{public}s'", "connectionLineEditor");

        if (v13) {
          goto LABEL_31;
        }
      }
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E2600);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108BED4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E2620);
      }
      long long v23 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v23);
      }
      unint64_t v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSShapeLibraryViewController p_positionAndInsertBoardItems:]");
      __int16 v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSShapeLibraryViewController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 1066, 0, "invalid nil value for '%{public}s'", "selectedConnectionLineLayout");

      goto LABEL_31;
    }
  }
  [(CRLiOSShapeLibraryViewController *)self p_unscaledPopoverAnchorPoint];
  if (v15 != INFINITY || v14 != INFINITY)
  {
    [(CRLiOSShapeLibraryViewController *)self p_unscaledPopoverAnchorPoint];
    if ((sub_100067C90() & 1) == 0)
    {
      [(CRLiOSShapeLibraryViewController *)self p_unscaledPopoverAnchorPoint];
      uint64_t v17 = +[CRLInsertionContext dragInsertionContextWithPreferredCenter:required:fromDragToInsertController:insertFloating:targetZOrder:](CRLInsertionContext, "dragInsertionContextWithPreferredCenter:required:fromDragToInsertController:insertFloating:targetZOrder:", 0, 0, 0, 0x7FFFFFFFFFFFFFFFLL);

      double v5 = (void *)v17;
    }
  }
  long long v18 = [v6 editorController];
  long long v19 = [v18 mostSpecificCurrentEditorOfClass:objc_opt_class() conformingToProtocol:&OBJC_PROTOCOL___CRLBoardItemInsertionEditor];

  [v19 prepareGeometryForInsertingBoardItems:v4 withInsertionContext:v5];
  [v19 insertBoardItems:v4 withInsertionContext:v5 postProcessBlock:0];
  +[CRLInsertionAnimationHelper addInsertionAnimationsToInfos:v4 onInteractiveCanvasController:v6];

LABEL_32:
  unint64_t v26 = [(CRLiOSShapeLibraryViewController *)self p_delegate];
  [v26 shapeLibraryViewController:self didInsertBoardItems:v4];
}

- (id)p_shapeAtIndexPath:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 isSearching])
  {
    double v8 = [(CRLiOSShapeLibraryViewController *)self p_shapeSearchResultsCollection];
    double v9 = [v8 shapeAtIndexPath:v7];
  }
  else
  {
    double v8 = [(CRLiOSShapeLibraryViewController *)self p_shapeCollectionDataSource];
    id v10 = [v7 row];

    double v9 = [v8 shapeAtIndex:v10 categoryIndex:[v6 pageIndex]];
  }

  return v9;
}

- (id)p_shapeWithIdentifier:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(CRLiOSShapeLibraryViewController *)self p_shapeCollectionDataSource];
  id v9 = [v6 pageIndex];

  id v10 = [v8 shapeWithIdentifier:v7 categoryIndex:v9];

  return v10;
}

- (void)p_shapeLibraryIndexingDidFinish:(id)a3
{
  if ([(CRLiOSShapeLibraryViewController *)self p_searchState])
  {
    id v4 = [(CRLiOSShapeLibraryViewController *)self p_shapeSearchResultsCollection];
    [v4 resetSearchResults];

    id v5 = [(CRLiOSShapeLibraryViewController *)self p_searchViewController];
    [v5 reloadData];
  }
}

- (CRLiOSInsertPageViewController)p_shapeInsertViewController
{
  return self->_shapeInsertViewController;
}

- (void)setP_shapeInsertViewController:(id)a3
{
}

- (CRLShapeCollectionDataSource)p_shapeCollectionDataSource
{
  return self->_shapeCollectionDataSource;
}

- (void)setP_shapeCollectionDataSource:(id)a3
{
}

- (CRLShapeSearchResultsCollection)p_shapeSearchResultsCollection
{
  return self->_shapeSearchResultsCollection;
}

- (void)setP_shapeSearchResultsCollection:(id)a3
{
}

- (NSArray)p_allPresetCollectionViewControllers
{
  return self->_allPresetCollectionViewControllers;
}

- (void)setP_allPresetCollectionViewControllers:(id)a3
{
}

- (CGSize)p_cachedViewFrameSize
{
  double width = self->_cachedViewFrameSize.width;
  double height = self->_cachedViewFrameSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setP_cachedViewFrameSize:(CGSize)a3
{
  self->_cachedViewFrameSize = a3;
}

- (CRLiOSShapeLibraryViewControllerDelegate)p_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRLiOSShapeLibraryViewControllerDelegate *)WeakRetained;
}

- (void)setP_delegate:(id)a3
{
}

- (BOOL)p_didEnterBackground
{
  return self->_didEnterBackground;
}

- (void)setP_didEnterBackground:(BOOL)a3
{
  self->_didEnterBackground = a3;
}

- (BOOL)p_dragEnded
{
  return self->_dragEnded;
}

- (void)setP_dragEnded:(BOOL)a3
{
  self->_dragEnded = a3;
}

- (UIView)p_draggingView
{
  return self->_draggingView;
}

- (void)setP_draggingView:(id)a3
{
}

- (BOOL)p_infoIsInsertingViaDrag
{
  return self->_infoIsInsertingViaDrag;
}

- (void)setP_infoIsInsertingViaDrag:(BOOL)a3
{
  self->_infoIsInsertingViaDrag = a3;
}

- (unint64_t)p_searchState
{
  return self->_searchState;
}

- (void)setP_searchState:(unint64_t)a3
{
  self->_searchState = a3;
}

- (CRLiOSPresetCollectionViewController)p_searchViewController
{
  return self->_searchViewController;
}

- (void)setP_searchViewController:(id)a3
{
}

- (CRLAccessibilityTimer)p_announcementTimer
{
  return self->_announcementTimer;
}

- (void)setP_announcementTimer:(id)a3
{
}

- (BOOL)p_didDragOutsidePopover
{
  return self->_didDragOutsidePopover;
}

- (void)setP_didDragOutsidePopover:(BOOL)a3
{
  self->_didDragOutsidePopover = a3;
}

- (UINavigationBar)p_navigationBar
{
  return self->_navigationBar;
}

- (void)setP_navigationBar:(id)a3
{
}

- (NSArray)p_constraintsForShowingNavigationBar
{
  return self->_constraintsForShowingNavigationBar;
}

- (void)setP_constraintsForShowingNavigationBar:(id)a3
{
}

- (NSArray)p_constraintsForHidingNavigationBar
{
  return self->_constraintsForHidingNavigationBar;
}

- (void)setP_constraintsForHidingNavigationBar:(id)a3
{
}

- (BOOL)p_shouldChangeSelectedShapes
{
  return self->_shouldChangeSelectedShapes;
}

- (void)setP_shouldChangeSelectedShapes:(BOOL)a3
{
  self->_shouldChangeSelectedShapes = a3;
}

- (CGPoint)p_unscaledPopoverAnchorPoint
{
  double x = self->_unscaledPopoverAnchorPoint.x;
  double y = self->_unscaledPopoverAnchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setP_unscaledPopoverAnchorPoint:(CGPoint)a3
{
  self->_unscaledPopoverAnchorPoint = a3;
}

- (NSSet)associatedBoardItems
{
  return self->_associatedBoardItems;
}

- (void)setAssociatedBoardItems:(id)a3
{
}

- (BOOL)showLinesInLibrary
{
  return self->_showLinesInLibrary;
}

- (void)setShowLinesInLibrary:(BOOL)a3
{
  self->_showLinesInLibrardouble y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedBoardItems, 0);
  objc_storeStrong((id *)&self->_constraintsForHidingNavigationBar, 0);
  objc_storeStrong((id *)&self->_constraintsForShowingNavigationBar, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_announcementTimer, 0);
  objc_storeStrong((id *)&self->_searchViewController, 0);
  objc_storeStrong((id *)&self->_draggingView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_allPresetCollectionViewControllers, 0);
  objc_storeStrong((id *)&self->_shapeSearchResultsCollection, 0);
  objc_storeStrong((id *)&self->_shapeCollectionDataSource, 0);

  objc_storeStrong((id *)&self->_shapeInsertViewController, 0);
}

@end