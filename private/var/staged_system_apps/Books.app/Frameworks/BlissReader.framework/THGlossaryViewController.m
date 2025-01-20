@interface THGlossaryViewController
+ (id)newViewController;
- (BOOL)followAnchor:(id)a3 pulse:(BOOL)a4;
- (BOOL)followGlossaryAnchor:(id)a3;
- (BOOL)followLink:(id)a3;
- (BOOL)followLink:(id)a3 animated:(BOOL)a4;
- (BOOL)glossaryEntryLayoutHasFooter;
- (BOOL)glossaryEntryLayoutIncludePortion:(int)a3;
- (BOOL)isGlossaryVisible;
- (BOOL)p_isCollapsed;
- (BOOL)p_isCompact;
- (BOOL)pendingShowFirstEntry;
- (BOOL)shouldAnimateShowEntry;
- (BOOL)shouldDismissAfterRotate;
- (BOOL)splitViewController:(id)a3 collapseSecondaryViewController:(id)a4 ontoPrimaryViewController:(id)a5;
- (BOOL)touchBarWantsSearch;
- (CGRect)glossaryEntryLayoutViewFrame;
- (CGSize)glossaryEntryLayoutContentSize;
- (IMTheme)theme;
- (THBookViewController)bookViewController;
- (THGlossaryController)glossaryController;
- (THGlossaryDefinitionsViewController)definitionsViewController;
- (THGlossaryLinkResolver)glossaryLinkResolver;
- (THGlossaryTermsViewController)termsViewController;
- (THGlossaryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (THModelGlossaryEntry)lastDisplayedEntry;
- (UINavigationController)detailNavigationController;
- (UINavigationController)masterNavigationController;
- (UISplitViewController)glossarySplitViewController;
- (UIView)rotationSnapshot;
- (UIViewController)originalViewController;
- (double)glossaryEntryLayoutDefaultHeightForPortion:(int)a3;
- (double)glossaryEntryLayoutTopMarginForPortion:(int)a3;
- (double)glossaryEntryLayoutValueForDistance:(int)a3;
- (id)displayedEntry;
- (id)documentNavigatorForGlossaryDefinitionsViewController:(id)a3;
- (id)documentRoot;
- (id)glossaryEntryLayoutBackgroundColor;
- (id)glossaryEntryLayoutForegroundColor;
- (id)splitViewController:(id)a3 separateSecondaryViewControllerFromPrimaryViewController:(id)a4;
- (int)glossaryEntryLayoutFloatingStyle;
- (int64_t)layoutOrientation;
- (int64_t)overrideUserInterfaceStyle;
- (int64_t)p_interfaceOrientation;
- (int64_t)targetOrientation;
- (void)_applyColors;
- (void)dealloc;
- (void)didScrollToEntry:(id)a3;
- (void)displayEntry:(id)a3;
- (void)displayEntry:(id)a3 whenCollapsed:(BOOL)a4;
- (void)displayEntryByPath:(id)a3;
- (void)furtherInitWithGlossaryController:(id)a3;
- (void)handleDone:(id)a3;
- (void)loadView;
- (void)p_configureToolbarsForCollapsed:(BOOL)a3;
- (void)p_setupChildViewControllers;
- (void)releaseChildViewControllers;
- (void)setBookViewController:(id)a3;
- (void)setDefinitionsViewController:(id)a3;
- (void)setDetailNavigationController:(id)a3;
- (void)setGlossaryController:(id)a3;
- (void)setGlossaryLinkResolver:(id)a3;
- (void)setGlossarySplitViewController:(id)a3;
- (void)setLastDisplayedEntry:(id)a3;
- (void)setMasterNavigationController:(id)a3;
- (void)setOriginalViewController:(id)a3;
- (void)setPendingShowFirstEntry:(BOOL)a3;
- (void)setRotationSnapshot:(id)a3;
- (void)setTargetOrientation:(int64_t)a3;
- (void)setTermsViewController:(id)a3;
- (void)setTheme:(id)a3;
- (void)showEntry:(id)a3;
- (void)showEntryAtIndex:(unint64_t)a3;
- (void)showEntryAtPath:(id)a3;
- (void)showFirstEntry;
- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4;
- (void)unload;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation THGlossaryViewController

+ (id)newViewController
{
  v2 = [THGlossaryViewController alloc];

  return [(THGlossaryViewController *)v2 initWithNibName:0 bundle:0];
}

- (THGlossaryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)THGlossaryViewController;
  result = [(THGlossaryViewController *)&v5 initWithNibName:a3 bundle:a4];
  if (result) {
    result->_targetOrientation = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)p_setupChildViewControllers
{
  v3 = +[THGlossaryTermsViewController newViewController];
  self->_termsViewController = v3;
  [(THGlossaryTermsViewController *)v3 setEdgesForExtendedLayout:15];
  [(THGlossaryTermsViewController *)self->_termsViewController setNavigationDelegate:self];
  [(THGlossaryTermsViewController *)self->_termsViewController setGlossaryController:self->_glossaryController];
  -[THGlossaryTermsViewController setTitle:](self->_termsViewController, "setTitle:", [(id)THBundle() localizedStringForKey:@"Index" value:&stru_46D7E8 table:0]);
  self->_masterNavigationController = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:self->_termsViewController];
  v4 = [[THGlossaryDefinitionsViewController alloc] initWithNibName:0 bundle:0];
  self->_definitionsViewController = v4;
  [(THGlossaryDefinitionsViewController *)v4 setEdgesForExtendedLayout:14];
  [(THGlossaryDefinitionsViewController *)self->_definitionsViewController setDelegate:self];
  [(THGlossaryDefinitionsViewController *)self->_definitionsViewController setGlossaryViewController:self];
  [(THGlossaryDefinitionsViewController *)self->_definitionsViewController setGlossaryController:self->_glossaryController];
  -[THGlossaryDefinitionsViewController setTitle:](self->_definitionsViewController, "setTitle:", [(id)THBundle() localizedStringForKey:@"Glossary" value:&stru_46D7E8 table:0]);
  self->_detailNavigationController = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:self->_definitionsViewController];
  self->_glossarySplitViewController = (UISplitViewController *)objc_alloc_init((Class)UISplitViewController);
  detailNavigationController = self->_detailNavigationController;
  v6[0] = self->_masterNavigationController;
  v6[1] = detailNavigationController;
  [(UISplitViewController *)self->_glossarySplitViewController setViewControllers:+[NSArray arrayWithObjects:v6 count:2]];
  [(UISplitViewController *)self->_glossarySplitViewController setMinimumPrimaryColumnWidth:320.0];
  [(UISplitViewController *)self->_glossarySplitViewController setDelegate:self];
}

- (void)releaseChildViewControllers
{
  [(THGlossaryViewController *)self setMasterNavigationController:0];
  [(THGlossaryViewController *)self setDetailNavigationController:0];
  [(THGlossaryTermsViewController *)[(THGlossaryViewController *)self termsViewController] setNavigationDelegate:0];
  [(THGlossaryViewController *)self setTermsViewController:0];
  [(THGlossaryDefinitionsViewController *)[(THGlossaryViewController *)self definitionsViewController] setDelegate:0];
  [(THGlossaryDefinitionsViewController *)[(THGlossaryViewController *)self definitionsViewController] setGlossaryViewController:0];
  [(THGlossaryViewController *)self setDefinitionsViewController:0];
  [(UISplitViewController *)[(THGlossaryViewController *)self glossarySplitViewController] setDelegate:0];

  [(THGlossaryViewController *)self setGlossarySplitViewController:0];
}

- (void)dealloc
{
  [(THGlossaryViewController *)self setLastDisplayedEntry:0];
  [(THGlossaryViewController *)self setGlossaryController:0];
  [(THGlossaryViewController *)self setGlossaryLinkResolver:0];
  [(THGlossaryViewController *)self releaseChildViewControllers];
  [(UIView *)self->_rotationSnapshot removeFromSuperview];

  v3.receiver = self;
  v3.super_class = (Class)THGlossaryViewController;
  [(THGlossaryViewController *)&v3 dealloc];
}

- (void)handleDone:(id)a3
{
  bookViewController = self->_bookViewController;
  v4 = [(THGlossaryViewController *)self originalViewController];

  [(THBookViewController *)bookViewController hideGlossaryWithDestinationViewController:v4];
}

- (int64_t)p_interfaceOrientation
{
  id v2 = [self bc_windowForViewController].windowScene;

  return (int64_t)[v2 interfaceOrientation];
}

- (void)furtherInitWithGlossaryController:(id)a3
{
  -[THGlossaryViewController setGlossaryController:](self, "setGlossaryController:");
  objc_super v5 = +[THGlossaryLinkResolver glossaryLinkResolverWithGlossaryController:a3];

  [(THGlossaryViewController *)self setGlossaryLinkResolver:v5];
}

- (id)documentRoot
{
  id v2 = [(THBookViewController *)[(THGlossaryViewController *)self bookViewController] documentViewController];

  return [(THDocumentViewController *)v2 documentRoot];
}

- (BOOL)p_isCompact
{
  if ([(THGlossaryViewController *)self parentViewController])
  {
    if (([(THGlossaryViewController *)self im_isCompactWidth] & 1) == 0)
    {
      return [(THGlossaryViewController *)self im_isCompactHeight];
    }
    return 1;
  }
  if ([(THBookViewController *)[(THGlossaryViewController *)self bookViewController] im_isCompactHeight])return 1; {
  v4 = [(THGlossaryViewController *)self bookViewController];
  }

  return [(THBookViewController *)v4 im_isCompactWidth];
}

- (BOOL)p_isCollapsed
{
  id v2 = [(THGlossaryViewController *)self glossarySplitViewController];

  return [(UISplitViewController *)v2 isCollapsed];
}

- (void)p_configureToolbarsForCollapsed:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(IMTheme *)[(THGlossaryViewController *)self theme] backgroundColorForTraitEnvironment:self];
  if (!v5) {
    id v5 = +[UIColor bc_booksBackground];
  }
  [(-[THGlossaryViewController glossarySplitViewController](self, "glossarySplitViewController"), "view") setBackgroundColor:v5];
  id v6 = [(THGlossaryTermsViewController *)[(THGlossaryViewController *)self termsViewController] navigationItem];
  if (v6)
  {
    v7 = v6;
    if (v3)
    {
      id v8 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"handleDone:"];
      [v7 setRightBarButtonItem:v8];
    }
    else
    {
      [v6 setRightBarButtonItem:0];
    }
  }
  id v9 = [(THGlossaryDefinitionsViewController *)[(THGlossaryViewController *)self definitionsViewController] navigationItem];
  if (v9)
  {
    v10 = v9;
    id v11 = [(IMTheme *)[(THGlossaryViewController *)self theme] contentTextColor];
    if (!v11) {
      id v11 = +[UIColor bc_booksLabelColor];
    }
    [v10 setLeftItemsSupplementBackButton:1];
    id v13 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"handleDone:"];
    v12 = [(UISplitViewController *)[(THGlossaryViewController *)self glossarySplitViewController] displayModeButtonItem];
    [(UIBarButtonItem *)v12 setTintColor:v11];
    [v10 setLeftBarButtonItem:v12];
    [v10 setRightBarButtonItem:v13];
  }
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryViewController;
  [(THGlossaryViewController *)&v3 loadView];
  [(THGlossaryViewController *)self p_setupChildViewControllers];
  [(THGlossaryViewController *)self addChildViewController:[(THGlossaryViewController *)self glossarySplitViewController]];
  [[self view] addSubview:[-[THGlossaryViewController glossarySplitViewController](self, "glossarySplitViewController") view]];
  [(UISplitViewController *)[(THGlossaryViewController *)self glossarySplitViewController] didMoveToParentViewController:self];
  [(THGlossaryViewController *)self _applyColors];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THGlossaryViewController;
  [(THGlossaryViewController *)&v4 viewDidAppear:a3];
  if ([(THGlossaryViewController *)self pendingShowFirstEntry])
  {
    [(THGlossaryViewController *)self showEntryAtIndex:0];
    [(THGlossaryViewController *)self setPendingShowFirstEntry:0];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_shouldDismissAfterRotate)
  {
    self->_shouldDismissAfterRotate = 0;
    [(UIView *)[(THGlossaryViewController *)self rotationSnapshot] removeFromSuperview];
    [(THGlossaryViewController *)self setRotationSnapshot:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)THGlossaryViewController;
  [(THGlossaryViewController *)&v5 viewDidDisappear:v3];
}

- (int64_t)layoutOrientation
{
  if (self->_targetOrientation == 0x7FFFFFFFFFFFFFFFLL) {
    return [(THGlossaryViewController *)self p_interfaceOrientation];
  }
  else {
    return self->_targetOrientation;
  }
}

- (BOOL)shouldAnimateShowEntry
{
  return ![(THGlossaryViewController *)self p_isCollapsed];
}

- (BOOL)isGlossaryVisible
{
  unsigned int v3 = [(THGlossaryViewController *)self isViewLoaded];
  if (v3) {
    LOBYTE(v3) = [[self view] superview] != 0;
  }
  return v3;
}

- (void)setTheme:(id)a3
{
  if ((-[IMTheme isEqual:](self->_theme, "isEqual:") & 1) == 0)
  {
    id v5 = a3;

    self->_theme = (IMTheme *)a3;
    [(THGlossaryViewController *)self _applyColors];
  }
}

- (void)_applyColors
{
  unsigned int v3 = [(THGlossaryViewController *)self theme];
  id v4 = [(IMTheme *)v3 backgroundColorForTraitEnvironment:self];
  if (!v4) {
    id v4 = +[UIColor bc_booksBackground];
  }
  [self view].backgroundColor = v4;
  id v5 = [(IMTheme *)v3 keyColor];
  if (!v5) {
    id v5 = +[UIColor bc_booksKeyColor];
  }
  [self view].tintColor = v5;
  [(THGlossaryViewController *)self p_configureToolbarsForCollapsed:[(THGlossaryViewController *)self p_isCollapsed]];
  [(THGlossaryTermsViewController *)self->_termsViewController setTheme:v3];
  [(THGlossaryDefinitionsViewController *)self->_definitionsViewController setTheme:v3];
  id v6 = [(IMTheme *)v3 contentTextColor];
  if (!v6) {
    id v6 = +[UIColor bc_booksLabelColor];
  }
  masterNavigationController = self->_masterNavigationController;
  detailNavigationController = self->_detailNavigationController;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v21[0] = masterNavigationController;
  v21[1] = detailNavigationController;
  id v9 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2, 0);
  id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_msgSend(objc_msgSend(v14, "navigationBar"), "setBarTintColor:", v4);
        NSAttributedStringKey v19 = NSForegroundColorAttributeName;
        id v20 = v6;
        objc_msgSend(objc_msgSend(v14, "navigationBar"), "setTitleTextAttributes:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
      }
      id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v22 count:16];
    }
    while (v11);
  }
}

- (int64_t)overrideUserInterfaceStyle
{
  objc_opt_class();
  [(THGlossaryViewController *)self theme];
  int64_t result = (int64_t)[(id)TSUDynamicCast() userInterfaceStyle];
  if ((unint64_t)result <= 1) {
    return 1;
  }
  return result;
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
  v4[2] = sub_BBBD4;
  v4[3] = &unk_456E38;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)displayEntry:(id)a3 whenCollapsed:(BOOL)a4
{
  if (a3)
  {
    BOOL v6 = a4;
    v7 = [(THGlossaryTermsViewController *)[(THGlossaryViewController *)self termsViewController] glossaryIndex];
    if ([(THGlossaryIndex *)v7 indexForEntry:a3] == 0x7FFFFFFFFFFFFFFFLL) {
      v7 = +[THGlossaryIndex alphabeticalIndexForEntries:](THGlossaryIndex, "alphabeticalIndexForEntries:", +[NSArray arrayWithObject:a3]);
    }
    [(THGlossaryDefinitionsViewController *)[(THGlossaryViewController *)self definitionsViewController] displayIndex:v7 withEntry:a3 animated:[(THGlossaryViewController *)self shouldAnimateShowEntry]];
    if (v6)
    {
      if ([(THGlossaryViewController *)self p_isCollapsed])
      {
        id v8 = [(THGlossaryViewController *)self masterNavigationController];
        id v9 = [(THGlossaryViewController *)self detailNavigationController];
        if ([(UINavigationController *)v8 topViewController] != (UIViewController *)v9) {
          [(UINavigationController *)v8 pushViewController:v9 animated:1];
        }
      }
    }
  }

  -[THGlossaryViewController setLastDisplayedEntry:](self, "setLastDisplayedEntry:", a3, a4);
}

- (void)displayEntry:(id)a3
{
}

- (void)displayEntryByPath:(id)a3
{
  id v4 = [(THGlossaryController *)self->_glossaryController entryForPath:a3];

  [(THGlossaryViewController *)self displayEntry:v4 whenCollapsed:1];
}

- (id)displayedEntry
{
  id v2 = [(THGlossaryViewController *)self definitionsViewController];

  return [(THGlossaryDefinitionsViewController *)v2 displayedEntry];
}

- (void)didScrollToEntry:(id)a3
{
  [(THGlossaryTermsViewController *)[(THGlossaryViewController *)self termsViewController] selectEntry:a3 scrollPosition:0 animated:1];

  [(THGlossaryViewController *)self setLastDisplayedEntry:a3];
}

- (void)showEntry:(id)a3
{
  [(THGlossaryDefinitionsViewController *)[(THGlossaryViewController *)self definitionsViewController] displayIndex:[(THGlossaryController *)self->_glossaryController alphabeticalTermIndex] withEntry:a3 animated:0];
  [(THGlossaryTermsViewController *)[(THGlossaryViewController *)self termsViewController] clearSearch];
  [(THGlossaryTermsViewController *)[(THGlossaryViewController *)self termsViewController] selectEntry:a3 scrollPosition:1 animated:0];

  [(THGlossaryViewController *)self setLastDisplayedEntry:a3];
}

- (void)showEntryAtPath:(id)a3
{
  id v4 = [(THGlossaryController *)self->_glossaryController entryForPath:a3];

  [(THGlossaryViewController *)self showEntry:v4];
}

- (void)showEntryAtIndex:(unint64_t)a3
{
  id v4 = [[self->_glossaryController alphabeticalTermIndex] entryAtIndex:a3];

  [(THGlossaryViewController *)self showEntry:v4];
}

- (void)showFirstEntry
{
}

- (void)unload
{
  id v2 = [(THGlossaryViewController *)self definitionsViewController];

  [(THGlossaryDefinitionsViewController *)v2 unload];
}

- (BOOL)followGlossaryAnchor:(id)a3
{
  if (![a3 glossaryEntry]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THGlossaryViewController followGlossaryAnchor:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THGlossaryViewController.m") lineNumber:442 description:@"Attempt to follow nil glossary anchor."];
  }
  id v5 = [a3 glossaryEntry];
  if (v5)
  {
    objc_opt_class();
    BOOL v6 = (void *)TSUDynamicCast();
    if (!v6) {
      BOOL v6 = a3;
    }
    -[THGlossaryViewController showEntry:](self, "showEntry:", [v6 glossaryEntry]);
  }
  return v5 != 0;
}

- (id)documentNavigatorForGlossaryDefinitionsViewController:(id)a3
{
  unsigned int v3 = [(THGlossaryViewController *)self bookViewController];

  return [(THBookViewController *)v3 documentNavigator];
}

- (BOOL)followAnchor:(id)a3 pulse:(BOOL)a4
{
  if (!a3) {
    return 0;
  }
  BOOL v4 = a4;
  if ([a3 glossaryEntry])
  {
    return [(THGlossaryViewController *)self followGlossaryAnchor:a3];
  }
  else
  {
    [(THBookViewController *)[(THGlossaryViewController *)self bookViewController] recordOutgoingMajorNavigationJump];
    BOOL v7 = [(THBookViewController *)[(THGlossaryViewController *)self bookViewController] followAnchor:a3 pulse:v4];
    [(THBookViewController *)[(THGlossaryViewController *)self bookViewController] recordCurrentLocationInHistory];
    [(THBookViewController *)[(THGlossaryViewController *)self bookViewController] updateNavigationAffordances];
    return v7;
  }
}

- (BOOL)followLink:(id)a3
{
  return [(THGlossaryViewController *)self followLink:a3 animated:1];
}

- (BOOL)followLink:(id)a3 animated:(BOOL)a4
{
  id v7 = [(THGlossaryLinkResolver *)[(THGlossaryViewController *)self glossaryLinkResolver] anchorFromAbsoluteLink:a3];
  if (v7)
  {
    return [(THGlossaryViewController *)self followAnchor:v7 pulse:1];
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    id v10 = sub_BC218;
    id v11 = &unk_458E48;
    uint64_t v12 = self;
    id v13 = a3;
    BOOL v14 = a4;
    if (+[NSThread isMainThread]) {
      v10((uint64_t)block);
    }
    else {
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    return 1;
  }
}

- (int)glossaryEntryLayoutFloatingStyle
{
  if ([(THGlossaryViewController *)self p_isCompact]) {
    return 2;
  }
  if ([(THGlossaryDefinitionsViewController *)[(THGlossaryViewController *)self definitionsViewController] im_isCompactWidth])return 2; {
  return 1;
  }
}

- (CGRect)glossaryEntryLayoutViewFrame
{
  if ([(THGlossaryDefinitionsViewController *)[(THGlossaryViewController *)self definitionsViewController] isViewLoaded])
  {
    id v3 = [(THGlossaryDefinitionsViewController *)[(THGlossaryViewController *)self definitionsViewController] view];
    if (v3)
    {
      [v3 frame];
      TSDRectWithSize();
      CGFloat x = v4;
      CGFloat y = v6;
      double width = v8;
      CGFloat height = v10;
    }
    else
    {
      CGFloat x = CGRectZero.origin.x;
      CGFloat y = CGRectZero.origin.y;
      double width = CGRectZero.size.width;
      CGFloat height = CGRectZero.size.height;
    }
    [self view].safeAreaInsets;
    double v17 = v16;
    [self view].safeAreaInsets
    double v12 = width - (v17 + v18);
  }
  else
  {
    [(-[THGlossaryViewController bookViewController](self, "bookViewController")) view].frame
    TSDRectWithSize();
    CGFloat x = v13;
    CGFloat y = v14;
    CGFloat height = v15;
  }
  double v19 = x;
  double v20 = y;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.double width = v12;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (CGSize)glossaryEntryLayoutContentSize
{
  [(THGlossaryViewController *)self glossaryEntryLayoutViewFrame];
  double v3 = v2;
  double v5 = v4;
  result.CGFloat height = v5;
  result.double width = v3;
  return result;
}

- (double)glossaryEntryLayoutValueForDistance:(int)a3
{
  double v5 = (char *)[(THGlossaryViewController *)self layoutOrientation] - 3;
  if ([(THGlossaryViewController *)self p_isCompact])
  {
    double result = 0.0;
    switch(a3)
    {
      case 0:
      case 1:
        double result = 15.0;
        break;
      case 2:
        goto LABEL_6;
      case 4:
      case 5:
      case 6:
        double result = 8.0;
        break;
      default:
        return result;
    }
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_BC570;
    v10[3] = &unk_458E70;
    v10[4] = self;
    BOOL v11 = (unint64_t)v5 < 2;
    switch(a3)
    {
      case 0:
        double v7 = dbl_344420[(unint64_t)v5 < 2];
        goto LABEL_14;
      case 1:
        BOOL v8 = (unint64_t)v5 < 2;
        id v9 = dbl_344420;
        goto LABEL_10;
      case 2:
LABEL_6:
        BOOL v8 = (unint64_t)v5 < 2;
        id v9 = (double *)&unk_344410;
LABEL_10:
        double result = v9[v8];
        break;
      case 3:
        if ((unint64_t)v5 >= 2) {
          double v7 = 33.0;
        }
        else {
          double v7 = 0.0;
        }
LABEL_14:
        double result = v7 + sub_BC570((uint64_t)v10);
        break;
      default:
        double result = 0.0;
        break;
    }
  }
  return result;
}

- (double)glossaryEntryLayoutDefaultHeightForPortion:(int)a3
{
  return dbl_344440[5
                  * ((char *)[(THGlossaryViewController *)self layoutOrientation] - 5 < (char *)0xFFFFFFFFFFFFFFFELL)
                  + a3];
}

- (double)glossaryEntryLayoutTopMarginForPortion:(int)a3
{
  return dbl_344490[5
                  * ((char *)[(THGlossaryViewController *)self layoutOrientation] - 5 < (char *)0xFFFFFFFFFFFFFFFELL)
                  + a3];
}

- (id)glossaryEntryLayoutBackgroundColor
{
  id v3 = [(IMTheme *)[(THGlossaryViewController *)self theme] backgroundColorForTraitEnvironment:self];
  if (!v3) {
    id v3 = [[UIColor bc_booksBackground] resolvedColorWithTraitCollection:[self traitCollection]];
  }

  return +[TSUColor colorWithUIColor:v3];
}

- (id)glossaryEntryLayoutForegroundColor
{
  id v3 = [(IMTheme *)[(THGlossaryViewController *)self theme] contentTextColor];
  if (!v3) {
    id v3 = +[UIColor bc_booksLabelColor];
  }
  id v4 = [v3 resolvedColorWithTraitCollection:[self traitCollection]];

  return +[TSUColor colorWithUIColor:v4];
}

- (BOOL)glossaryEntryLayoutHasFooter
{
  return 1;
}

- (BOOL)glossaryEntryLayoutIncludePortion:(int)a3
{
  return 1;
}

- (BOOL)touchBarWantsSearch
{
  return 1;
}

- (THGlossaryController)glossaryController
{
  return self->_glossaryController;
}

- (void)setGlossaryController:(id)a3
{
  self->_glossaryController = (THGlossaryController *)a3;
}

- (THBookViewController)bookViewController
{
  return self->_bookViewController;
}

- (void)setBookViewController:(id)a3
{
  self->_bookViewController = (THBookViewController *)a3;
}

- (THGlossaryLinkResolver)glossaryLinkResolver
{
  return self->_glossaryLinkResolver;
}

- (void)setGlossaryLinkResolver:(id)a3
{
}

- (THGlossaryTermsViewController)termsViewController
{
  return self->_termsViewController;
}

- (void)setTermsViewController:(id)a3
{
}

- (THGlossaryDefinitionsViewController)definitionsViewController
{
  return self->_definitionsViewController;
}

- (void)setDefinitionsViewController:(id)a3
{
}

- (THModelGlossaryEntry)lastDisplayedEntry
{
  return self->_lastDisplayedEntry;
}

- (void)setLastDisplayedEntry:(id)a3
{
}

- (BOOL)shouldDismissAfterRotate
{
  return self->_shouldDismissAfterRotate;
}

- (UIViewController)originalViewController
{
  return self->_originalViewController;
}

- (void)setOriginalViewController:(id)a3
{
  self->_originalViewController = (UIViewController *)a3;
}

- (IMTheme)theme
{
  return self->_theme;
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

- (UISplitViewController)glossarySplitViewController
{
  return self->_glossarySplitViewController;
}

- (void)setGlossarySplitViewController:(id)a3
{
}

- (int64_t)targetOrientation
{
  return self->_targetOrientation;
}

- (void)setTargetOrientation:(int64_t)a3
{
  self->_targetOrientation = a3;
}

- (UIView)rotationSnapshot
{
  return self->_rotationSnapshot;
}

- (void)setRotationSnapshot:(id)a3
{
}

- (BOOL)pendingShowFirstEntry
{
  return self->_pendingShowFirstEntry;
}

- (void)setPendingShowFirstEntry:(BOOL)a3
{
  self->_pendingShowFirstEntrCGFloat y = a3;
}

@end