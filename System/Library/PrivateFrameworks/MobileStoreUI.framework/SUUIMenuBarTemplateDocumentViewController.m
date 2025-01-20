@interface SUUIMenuBarTemplateDocumentViewController
- (BOOL)_isFirstViewControllerOnNavigationStack;
- (SUUIMenuBarTemplateDocumentViewController)initWithTemplateElement:(id)a3;
- (UIScrollView)scrollingTabNestedPagingScrollView;
- (UIView)titleView;
- (double)titleViewHeight;
- (id)_childViewControllersForMenuItems;
- (id)_colorScheme;
- (id)_contentViewController;
- (id)_dynamicPageSectionIndexMapper;
- (id)_newChildViewControllerForEntityAtIndex:(unint64_t)a3;
- (id)_zoomingShelfPageSplitsDescription;
- (id)contentScrollView;
- (id)navigationBarControllerWithViewElement:(id)a3;
- (id)navigationPaletteView;
- (id)scrollingTabViewControllerInNestedPagingScrollViewAtPageIndex:(unint64_t)a3;
- (unint64_t)_menuItemIndexForEntityIndex:(unint64_t)a3 entityValueProvider:(id *)a4;
- (void)_addContentViewController:(id)a3;
- (void)_recordEntityUniqueIdentifier:(id)a3 forEntityIndex:(unint64_t)a4;
- (void)_reloadContentViewController;
- (void)_removeContentViewController:(id)a3;
- (void)_replaceViewControllerAtIndex:(unint64_t)a3 withViewController:(id)a4;
- (void)_willDisplayViewControllerAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)documentDidUpdate:(id)a3;
- (void)documentMediaQueriesDidUpdate:(id)a3;
- (void)horizontalScrollingContainerViewController:(id)a3 willDisplayViewControllerAtIndex:(unint64_t)a4;
- (void)menuBarViewElementConfiguration:(id)a3 didReplaceDocumentForEntityUniqueIdentifier:(id)a4;
- (void)menuBarViewElementConfiguration:(id)a3 didReplaceDocumentForMenuItemAtIndex:(unint64_t)a4;
- (void)menuBarViewElementConfiguration:(id)a3 selectMenuItemViewElement:(id)a4 animated:(BOOL)a5;
- (void)scrollingSegmentedController:(id)a3 willDisplayViewControllerAtIndex:(unint64_t)a4;
- (void)scrollingTabAppearanceStatusWasUpdated:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)viewDidLoad;
@end

@implementation SUUIMenuBarTemplateDocumentViewController

- (SUUIMenuBarTemplateDocumentViewController)initWithTemplateElement:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUIMenuBarTemplateDocumentViewController;
  v6 = [(SUUIMenuBarTemplateDocumentViewController *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_templateElement, a3);
    uint64_t v8 = [(SUUIMenuBarTemplateElement *)v7->_templateElement menuBar];
    menuBarViewElement = v7->_menuBarViewElement;
    v7->_menuBarViewElement = (SUUIMenuBarViewElement *)v8;

    uint64_t v10 = [(SUUIMenuBarViewElement *)v7->_menuBarViewElement configuration];
    menuBarViewElementConfiguration = v7->_menuBarViewElementConfiguration;
    v7->_menuBarViewElementConfiguration = (SUUIMenuBarViewElementConfiguration *)v10;

    [(SUUIMenuBarViewElementConfiguration *)v7->_menuBarViewElementConfiguration setDelegate:v7];
    uint64_t v12 = [(SUUIMenuBarViewElementConfiguration *)v7->_menuBarViewElementConfiguration selectedMenuItemViewElement];
    pendingSelectedMenuItemViewElement = v7->_pendingSelectedMenuItemViewElement;
    v7->_pendingSelectedMenuItemViewElement = (SUUIMenuItemViewElement *)v12;

    v7->_scrollingTabAppearanceStatus.progress = 1.0;
    *(void *)&v7->_scrollingTabAppearanceStatus.isBouncingOffTheEdge = 0;
    [(SUUIMenuBarTemplateDocumentViewController *)v7 _reloadContentViewController];
  }

  return v7;
}

- (void)dealloc
{
  scrollingSegmentedController = self->_scrollingSegmentedController;
  if (scrollingSegmentedController)
  {
    [(SUUIScrollingSegmentedController *)scrollingSegmentedController setDelegate:0];
    [(SUUIMenuBarTemplateDocumentViewController *)self _removeContentViewController:self->_scrollingSegmentedController];
  }
  horizontalScrollingContainerViewController = self->_horizontalScrollingContainerViewController;
  if (horizontalScrollingContainerViewController)
  {
    [(SUUIHorizontalScrollingContainerViewController *)horizontalScrollingContainerViewController setDelegate:0];
    [(SUUIMenuBarTemplateDocumentViewController *)self _removeContentViewController:self->_horizontalScrollingContainerViewController];
  }
  v5.receiver = self;
  v5.super_class = (Class)SUUIMenuBarTemplateDocumentViewController;
  [(SUUIViewController *)&v5 dealloc];
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)SUUIMenuBarTemplateDocumentViewController;
  -[SUUIMenuBarTemplateDocumentViewController setPreferredContentSize:](&v6, sel_setPreferredContentSize_);
  -[SUUIHorizontalScrollingContainerViewController setPreferredContentSize:](self->_horizontalScrollingContainerViewController, "setPreferredContentSize:", width, height);
  -[SUUIScrollingSegmentedController setPreferredContentSize:](self->_scrollingSegmentedController, "setPreferredContentSize:", width, height);
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIMenuBarTemplateDocumentViewController;
  [(SUUIMenuBarTemplateDocumentViewController *)&v7 viewDidLoad];
  v3 = [(SUUIMenuBarTemplateDocumentViewController *)self view];
  v4 = [(SUUIMenuBarTemplateDocumentViewController *)self _contentViewController];
  objc_super v5 = v4;
  if (v4)
  {
    objc_super v6 = [v4 view];
    [v3 bounds];
    objc_msgSend(v6, "setFrame:");
    [v6 setAutoresizingMask:18];
    [v3 addSubview:v6];
  }
}

- (id)contentScrollView
{
  v2 = [(SUUIMenuBarTemplateDocumentViewController *)self _contentViewController];
  v3 = [v2 contentScrollView];

  return v3;
}

- (void)setClientContext:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SUUIMenuBarTemplateDocumentViewController;
  [(SUUIViewController *)&v6 setClientContext:v4];
  [(SUUIViewController *)self->_menuBarSectionsViewController setClientContext:v4];
  unint64_t v5 = self->_menuBarStyle - 1;
  if (v5 <= 2) {
    [*(id *)((char *)&self->super.super.super.super.isa + *off_265400788[v5]) setClientContext:v4];
  }
}

- (void)setOperationQueue:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SUUIMenuBarTemplateDocumentViewController;
  [(SUUIViewController *)&v6 setOperationQueue:v4];
  [(SUUIViewController *)self->_menuBarSectionsViewController setOperationQueue:v4];
  unint64_t v5 = self->_menuBarStyle - 1;
  if (v5 <= 2) {
    [*(id *)((char *)&self->super.super.super.super.isa + *off_265400788[v5]) setOperationQueue:v4];
  }
}

- (void)documentDidUpdate:(id)a3
{
  menuBarViewElementConfiguration = self->_menuBarViewElementConfiguration;
  id v5 = a3;
  [(SUUIMenuBarViewElementConfiguration *)menuBarViewElementConfiguration setDelegate:0];
  objc_super v6 = [v5 templateElement];

  templateElement = self->_templateElement;
  self->_templateElement = v6;

  uint64_t v8 = [(SUUIMenuBarTemplateElement *)self->_templateElement menuBar];
  menuBarViewElement = self->_menuBarViewElement;
  self->_menuBarViewElement = v8;

  uint64_t v10 = [(SUUIMenuBarViewElement *)self->_menuBarViewElement configuration];
  v11 = self->_menuBarViewElementConfiguration;
  self->_menuBarViewElementConfiguration = v10;

  [(SUUIMenuBarViewElementConfiguration *)self->_menuBarViewElementConfiguration setDelegate:self];
  dynamicPageSectionIndexMapper = self->_dynamicPageSectionIndexMapper;
  v13 = [(SUUIViewElement *)self->_menuBarViewElement entityProvider];
  [(SUUIDynamicPageSectionIndexMapper *)dynamicPageSectionIndexMapper setEntityProvider:v13];

  [(SUUIMenuBarTemplateDocumentViewController *)self _reloadContentViewController];
}

- (void)documentMediaQueriesDidUpdate:(id)a3
{
  menuBarSectionsViewController = self->_menuBarSectionsViewController;
  id v5 = [(SUUIMenuBarTemplateDocumentViewController *)self _colorScheme];
  [(SUUIStorePageSectionsViewController *)menuBarSectionsViewController setColorScheme:v5];

  objc_super v6 = self->_menuBarSectionsViewController;
  [(SUUIStorePageSectionsViewController *)v6 invalidateAndReload];
}

- (id)navigationPaletteView
{
  if ([(SUUIMenuBarTemplateDocumentViewController *)self _isFirstViewControllerOnNavigationStack])
  {
    v3 = [(SUUIMenuBarSectionsViewController *)self->_menuBarSectionsViewController view];
    id v4 = [(SUUIMenuBarSectionsViewController *)self->_menuBarSectionsViewController contentScrollView];
    [(SUUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost *)v3 layoutIfNeeded];
    [v4 layoutIfNeeded];
    [v4 contentSize];
    [(SUUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost *)v3 frame];
    -[SUUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost setFrame:](v3, "setFrame:");
  }
  else
  {
    embeddedPaletteHost = self->_embeddedPaletteHost;
    if (!embeddedPaletteHost)
    {
      objc_super v6 = [SUUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost alloc];
      [(SUUIMenuBarTemplateDocumentViewController *)self titleViewHeight];
      uint64_t v8 = -[SUUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost initWithFrame:](v6, "initWithFrame:", 0.0, 0.0, 0.0, v7 + 7.0);
      v9 = self->_embeddedPaletteHost;
      self->_embeddedPaletteHost = v8;

      uint64_t v10 = [(SUUIMenuBarTemplateDocumentViewController *)self titleView];
      [v10 sizeToFit];
      [(SUUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost *)self->_embeddedPaletteHost setTitleView:v10];

      embeddedPaletteHost = self->_embeddedPaletteHost;
    }
    v3 = embeddedPaletteHost;
  }
  return v3;
}

- (void)horizontalScrollingContainerViewController:(id)a3 willDisplayViewControllerAtIndex:(unint64_t)a4
{
}

- (void)menuBarViewElementConfiguration:(id)a3 didReplaceDocumentForEntityUniqueIdentifier:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if (v6)
  {
    double v7 = [(NSMutableDictionary *)self->_entityUniqueIdentifierToEntityIndex objectForKey:v6];
    if (v7) {
      goto LABEL_3;
    }
    uint64_t v11 = [(SUUIMenuBarTemplateDocumentViewController *)self _dynamicPageSectionIndexMapper];
    if (v11)
    {
      uint64_t v10 = (void *)v11;
      id v9 = [(SUUIViewElement *)self->_menuBarViewElement entityProvider];
      uint64_t v18 = [v10 totalNumberOfEntities];
      if (!v18) {
        goto LABEL_4;
      }
      double v7 = 0;
      for (uint64_t i = 0; i != v18; ++i)
      {
        v13 = objc_msgSend(v10, "entityIndexPathForGlobalIndex:", i, v17);
        v14 = [v9 entityValueProviderAtIndexPath:v13];
        id v15 = [v14 entityUniqueIdentifier];
        [(SUUIMenuBarTemplateDocumentViewController *)self _recordEntityUniqueIdentifier:v15 forEntityIndex:i];
        if (v15 == v6 || [v15 isEqual:v6])
        {
          uint64_t v16 = [NSNumber numberWithUnsignedInteger:i];

          double v7 = (void *)v16;
        }
      }
      if (v7)
      {
LABEL_3:
        uint64_t v8 = objc_msgSend(v7, "unsignedIntegerValue", v17);
        id v9 = [(SUUIMenuBarTemplateDocumentViewController *)self _newChildViewControllerForEntityAtIndex:v8];
        [(SUUIMenuBarTemplateDocumentViewController *)self _replaceViewControllerAtIndex:v8 withViewController:v9];
        uint64_t v10 = v7;
LABEL_4:
      }
    }
  }
}

- (void)menuBarViewElementConfiguration:(id)a3 didReplaceDocumentForMenuItemAtIndex:(unint64_t)a4
{
  id v6 = [(SUUIMenuBarTemplateDocumentViewController *)self _newChildViewControllerForEntityAtIndex:a4];
  [(SUUIMenuBarTemplateDocumentViewController *)self _replaceViewControllerAtIndex:a4 withViewController:v6];
}

- (void)menuBarViewElementConfiguration:(id)a3 selectMenuItemViewElement:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a3;
  id v8 = a4;
  if (self->_scrollingSegmentedController)
  {
    uint64_t v9 = [v10 indexOfMenuItemViewElement:v8];
    if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
      [(SUUIScrollingSegmentedController *)self->_scrollingSegmentedController selectViewControllerAtIndex:v9 animated:v5];
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_pendingSelectedMenuItemViewElement, a4);
  }
}

- (id)navigationBarControllerWithViewElement:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SUUINavigationBarController *)[SUUIMenuBarNavigationBarController alloc] initWithNavigationBarViewElement:v4];

  if ([(SUUIMenuBarTemplateDocumentViewController *)self _isFirstViewControllerOnNavigationStack])
  {
    id v6 = [(SUUIMenuBarTemplateDocumentViewController *)self titleView];
    [(SUUIMenuBarNavigationBarController *)v5 setTitleView:v6];
  }
  return v5;
}

- (void)scrollingSegmentedController:(id)a3 willDisplayViewControllerAtIndex:(unint64_t)a4
{
}

- (void)scrollingTabAppearanceStatusWasUpdated:(id)a3
{
  self->_scrollingTabAppearanceStatus = ($D35E09B864CB17FEE2308AEA3FA0107F)a3;
  -[SUUIScrollingSegmentedController scrollingTabAppearanceStatusWasUpdated:](self->_scrollingSegmentedController, "scrollingTabAppearanceStatusWasUpdated:");
}

- (UIScrollView)scrollingTabNestedPagingScrollView
{
  return [(SUUIScrollingSegmentedController *)self->_scrollingSegmentedController scrollingTabNestedPagingScrollView];
}

- (id)scrollingTabViewControllerInNestedPagingScrollViewAtPageIndex:(unint64_t)a3
{
  return [(SUUIScrollingSegmentedController *)self->_scrollingSegmentedController scrollingTabViewControllerInNestedPagingScrollViewAtPageIndex:a3];
}

- (UIView)titleView
{
  return (UIView *)[(SUUIScrollingSegmentedController *)self->_scrollingSegmentedController navigationBarTitleView];
}

- (double)titleViewHeight
{
  v3 = [(SUUIScrollingSegmentedController *)self->_scrollingSegmentedController navigationBarTitleView];
  [v3 layoutMargins];
  double v5 = v4;
  double v7 = v6;

  id v8 = [(SUUIScrollingSegmentedController *)self->_scrollingSegmentedController navigationBarTitleView];
  [v8 segmentedControlMinimumHeight];
  double v10 = v9;

  return v7 + v5 + v10;
}

- (void)_addContentViewController:(id)a3
{
  id v7 = a3;
  double v4 = [v7 parentViewController];

  if (!v4)
  {
    [(SUUIMenuBarTemplateDocumentViewController *)self addChildViewController:v7];
    if ([(SUUIMenuBarTemplateDocumentViewController *)self isViewLoaded])
    {
      double v5 = [(SUUIMenuBarTemplateDocumentViewController *)self view];
      double v6 = [v7 view];
      [v5 bounds];
      objc_msgSend(v6, "setFrame:");
      [v6 setAutoresizingMask:18];
      [v5 addSubview:v6];
    }
    [v7 didMoveToParentViewController:self];
  }
}

- (id)_childViewControllersForMenuItems
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  double v4 = [(SUUIMenuBarTemplateDocumentViewController *)self _dynamicPageSectionIndexMapper];
  double v5 = v4;
  if (v4) {
    uint64_t v6 = [v4 totalNumberOfEntities];
  }
  else {
    uint64_t v6 = [(SUUIMenuBarViewElementConfiguration *)self->_menuBarViewElementConfiguration numberOfMenuItems];
  }
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = 0;
    do
    {
      id v9 = [(SUUIMenuBarTemplateDocumentViewController *)self _newChildViewControllerForEntityAtIndex:v8];
      [v3 addObject:v9];

      ++v8;
    }
    while (v7 != v8);
  }

  return v3;
}

- (id)_colorScheme
{
  v2 = [(SUUIMenuBarTemplateElement *)self->_templateElement style];
  id v3 = [v2 ikBackgroundColor];
  double v4 = [v3 color];

  if (!v4)
  {
    double v4 = [MEMORY[0x263F825C8] clearColor];
  }
  double v5 = objc_alloc_init(SUUIColorScheme);
  [(SUUIColorScheme *)v5 setBackgroundColor:v4];

  return v5;
}

- (id)_contentViewController
{
  unint64_t v2 = self->_menuBarStyle - 1;
  if (v2 > 2) {
    id v3 = 0;
  }
  else {
    id v3 = *(id *)((char *)&self->super.super.super.super.isa + *off_265400788[v2]);
  }
  return v3;
}

- (id)_dynamicPageSectionIndexMapper
{
  if (!self->_dynamicPageSectionIndexMapper
    && [(SUUIViewElement *)self->_menuBarViewElement isDynamicContainer])
  {
    id v3 = objc_alloc_init(SUUIDynamicPageSectionIndexMapper);
    dynamicPageSectionIndexMapper = self->_dynamicPageSectionIndexMapper;
    self->_dynamicPageSectionIndexMapper = v3;

    double v5 = self->_dynamicPageSectionIndexMapper;
    uint64_t v6 = [(SUUIViewElement *)self->_menuBarViewElement entityProvider];
    [(SUUIDynamicPageSectionIndexMapper *)v5 setEntityProvider:v6];
  }
  uint64_t v7 = self->_dynamicPageSectionIndexMapper;
  return v7;
}

- (unint64_t)_menuItemIndexForEntityIndex:(unint64_t)a3 entityValueProvider:(id *)a4
{
  uint64_t v7 = [(SUUIMenuBarTemplateDocumentViewController *)self _dynamicPageSectionIndexMapper];
  if (!v7)
  {
    double v10 = 0;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v8 = [(SUUIViewElement *)self->_menuBarViewElement entityProvider];
  id v9 = [v7 entityIndexPathForGlobalIndex:a3];
  double v10 = [v8 entityValueProviderAtIndexPath:v9];

  a3 = 0;
  if (a4) {
LABEL_3:
  }
    *a4 = v10;
LABEL_4:

  return a3;
}

- (id)_newChildViewControllerForEntityAtIndex:(unint64_t)a3
{
  id v18 = 0;
  unint64_t v5 = [(SUUIMenuBarTemplateDocumentViewController *)self _menuItemIndexForEntityIndex:a3 entityValueProvider:&v18];
  id v6 = v18;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 entityUniqueIdentifier];
    [(SUUIMenuBarTemplateDocumentViewController *)self _recordEntityUniqueIdentifier:v8 forEntityIndex:a3];
    id v9 = [(SUUIMenuBarViewElementConfiguration *)self->_menuBarViewElementConfiguration documentForEntityUniqueIdentifier:v8];
    double v10 = [(SUUIMenuBarViewElementConfiguration *)self->_menuBarViewElementConfiguration documentOptionsForEntityUniqueIdentifier:v8];

    if (!v9) {
      goto LABEL_6;
    }
LABEL_5:
    uint64_t v11 = [SUUIDocumentContainerViewController alloc];
    uint64_t v12 = [(SUUIViewController *)self clientContext];
    v13 = [(SUUIDocumentContainerViewController *)v11 initWithDocument:v9 options:v10 clientContext:v12];

    if (v13) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v9 = [(SUUIMenuBarViewElementConfiguration *)self->_menuBarViewElementConfiguration documentForMenuItemAtIndex:v5];
  double v10 = [(SUUIMenuBarViewElementConfiguration *)self->_menuBarViewElementConfiguration documentOptionsForMenuItemAtIndex:v5];
  if (v9) {
    goto LABEL_5;
  }
LABEL_6:
  v13 = (SUUIDocumentContainerViewController *)objc_alloc_init(MEMORY[0x263F82E10]);
LABEL_7:
  if (self->_menuBarStyle == 1)
  {
    v14 = [(SUUIMenuBarViewElement *)self->_menuBarViewElement titleForMenuItemAtIndex:a3];
    id v15 = [v14 text];
    uint64_t v16 = [v15 string];
    [(SUUIDocumentContainerViewController *)v13 setTitle:v16];
  }
  return v13;
}

- (void)_recordEntityUniqueIdentifier:(id)a3 forEntityIndex:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v11 = v6;
    entityUniqueIdentifierToEntityIndex = self->_entityUniqueIdentifierToEntityIndex;
    if (!entityUniqueIdentifierToEntityIndex)
    {
      uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v9 = self->_entityUniqueIdentifierToEntityIndex;
      self->_entityUniqueIdentifierToEntityIndex = v8;

      entityUniqueIdentifierToEntityIndex = self->_entityUniqueIdentifierToEntityIndex;
    }
    double v10 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)entityUniqueIdentifierToEntityIndex setObject:v10 forKey:v11];

    id v6 = v11;
  }
}

- (void)_reloadContentViewController
{
  int64_t v3 = [(SUUIMenuBarViewElementConfiguration *)self->_menuBarViewElementConfiguration menuBarStyle];
  int64_t menuBarStyle = self->_menuBarStyle;
  if (menuBarStyle != v3)
  {
    switch(menuBarStyle)
    {
      case 3:
        uint64_t v6 = 1080;
        break;
      case 2:
        [(SUUIHorizontalScrollingContainerViewController *)self->_horizontalScrollingContainerViewController setDelegate:0];
        [(SUUIMenuBarTemplateDocumentViewController *)self _removeContentViewController:self->_horizontalScrollingContainerViewController];
        uint64_t v6 = 1088;
        break;
      case 1:
        p_scrollingSegmentedController = &self->_scrollingSegmentedController;
        [(SUUIScrollingSegmentedController *)self->_scrollingSegmentedController setDelegate:0];
LABEL_9:
        [(SUUIMenuBarTemplateDocumentViewController *)self _removeContentViewController:*p_scrollingSegmentedController];
        uint64_t v7 = *p_scrollingSegmentedController;
        *p_scrollingSegmentedController = 0;

        goto LABEL_10;
      default:
LABEL_10:
        embeddedPaletteHost = self->_embeddedPaletteHost;
        self->_embeddedPaletteHost = 0;

        goto LABEL_11;
    }
    p_scrollingSegmentedController = (SUUIScrollingSegmentedController **)((char *)self + v6);
    goto LABEL_9;
  }
LABEL_11:
  self->_int64_t menuBarStyle = v3;
  if (v3 == 3)
  {
    if (self->_loadingDocumentViewController) {
      return;
    }
    id v11 = [(SUUIViewElement *)self->_menuBarViewElement firstChildForElementType:4];
    uint64_t v12 = [[SUUILoadingDocumentViewController alloc] initWithActivityIndicatorElement:v11];
    loadingDocumentViewController = self->_loadingDocumentViewController;
    self->_loadingDocumentViewController = v12;

    v14 = self->_loadingDocumentViewController;
    id v15 = [(SUUIViewController *)self clientContext];
    [(SUUIViewController *)v14 setClientContext:v15];

    uint64_t v16 = self->_loadingDocumentViewController;
    id v17 = [(SUUIViewController *)self operationQueue];
    [(SUUIViewController *)v16 setOperationQueue:v17];

    id v18 = self->_loadingDocumentViewController;
LABEL_36:

    if (!v18) {
      return;
    }
    goto LABEL_37;
  }
  if (v3 != 2)
  {
    if (v3 != 1) {
      return;
    }
    scrollingSegmentedController = self->_scrollingSegmentedController;
    if (scrollingSegmentedController)
    {
      pendingSelectedMenuItemViewElement = [(SUUIMenuBarTemplateDocumentViewController *)self _childViewControllersForMenuItems];
      [(SUUIScrollingSegmentedController *)scrollingSegmentedController setViewControllers:pendingSelectedMenuItemViewElement];
    }
    else
    {
      v32 = objc_alloc_init(SUUIScrollingSegmentedController);
      v33 = self->_scrollingSegmentedController;
      self->_scrollingSegmentedController = v32;

      v34 = self->_scrollingSegmentedController;
      v35 = [(SUUIViewController *)self clientContext];
      [(SUUIScrollingSegmentedController *)v34 setClientContext:v35];

      v36 = self->_scrollingSegmentedController;
      v37 = [(SUUIViewController *)self operationQueue];
      [(SUUIViewController *)v36 setOperationQueue:v37];

      [(SUUIScrollingSegmentedController *)self->_scrollingSegmentedController setDelegate:self];
      -[SUUIScrollingSegmentedController scrollingTabAppearanceStatusWasUpdated:](self->_scrollingSegmentedController, "scrollingTabAppearanceStatusWasUpdated:", *(void *)&self->_scrollingTabAppearanceStatus.progress, *(void *)&self->_scrollingTabAppearanceStatus.isBouncingOffTheEdge);
      v38 = self->_scrollingSegmentedController;
      v39 = [(SUUIMenuBarTemplateDocumentViewController *)self _childViewControllersForMenuItems];
      [(SUUIScrollingSegmentedController *)v38 setViewControllers:v39];

      if (!self->_pendingSelectedMenuItemViewElement) {
        goto LABEL_29;
      }
      unint64_t v40 = -[SUUIMenuBarViewElementConfiguration indexOfMenuItemViewElement:](self->_menuBarViewElementConfiguration, "indexOfMenuItemViewElement:");
      if (v40 != 0x7FFFFFFFFFFFFFFFLL) {
        [(SUUIScrollingSegmentedController *)self->_scrollingSegmentedController selectViewControllerAtIndex:v40 animated:0];
      }
      pendingSelectedMenuItemViewElement = self->_pendingSelectedMenuItemViewElement;
      self->_pendingSelectedMenuItemViewElement = 0;
    }

LABEL_29:
    id v11 = [(SUUIMenuBarViewElement *)self->_menuBarViewElement style];
    v41 = [v11 valueForStyle:*MEMORY[0x263F4B388]];
    v42 = [(SUUIScrollingSegmentedController *)self->_scrollingSegmentedController navigationBarTitleView];
    v43 = v42;
    if (v41)
    {
      [v42 setLayoutStyle:1];
      [v41 UIEdgeInsetsValue];
    }
    else
    {
      [v42 setLayoutStyle:0];
      char v55 = 0;
      double v44 = SUUIViewElementPaddingForStyle(v11, &v55);
      if (!v55)
      {
LABEL_33:
        v45 = objc_msgSend(v11, "valueForStyle:", *MEMORY[0x263F4B378], v44);
        if ([v45 length])
        {
          [v45 floatValue];
          [v43 setSegmentedControlMinimumHeight:v46];
        }
        id v18 = self->_scrollingSegmentedController;

        goto LABEL_36;
      }
    }
    objc_msgSend(v43, "setLayoutMargins:");
    goto LABEL_33;
  }
  horizontalScrollingContainerViewController = self->_horizontalScrollingContainerViewController;
  if (!horizontalScrollingContainerViewController)
  {
    v20 = objc_alloc_init(SUUIHorizontalScrollingContainerViewController);
    v21 = self->_horizontalScrollingContainerViewController;
    self->_horizontalScrollingContainerViewController = v20;

    [(SUUIHorizontalScrollingContainerViewController *)self->_horizontalScrollingContainerViewController setDelegate:self];
    horizontalScrollingContainerViewController = self->_horizontalScrollingContainerViewController;
  }
  v22 = [(SUUIMenuBarTemplateDocumentViewController *)self _childViewControllersForMenuItems];
  [(SUUIHorizontalScrollingContainerViewController *)horizontalScrollingContainerViewController setViewControllers:v22];

  menuBarSectionsViewController = self->_menuBarSectionsViewController;
  if (!menuBarSectionsViewController)
  {
    v24 = [[SUUIMenuBarSectionsViewController alloc] initWithLayoutStyle:0];
    v25 = self->_menuBarSectionsViewController;
    self->_menuBarSectionsViewController = v24;

    v26 = self->_menuBarSectionsViewController;
    v27 = [(SUUIViewController *)self clientContext];
    [(SUUIViewController *)v26 setClientContext:v27];

    v28 = self->_menuBarSectionsViewController;
    v29 = [(SUUIViewController *)self operationQueue];
    [(SUUIViewController *)v28 setOperationQueue:v29];

    v30 = self->_menuBarSectionsViewController;
    [(SUUIMenuBarTemplateDocumentViewController *)self preferredContentSize];
    -[SUUIMenuBarSectionsViewController setPreferredContentSize:](v30, "setPreferredContentSize:");
    v31 = [(SUUIMenuBarSectionsViewController *)self->_menuBarSectionsViewController view];
    [v31 frame];
    if (CGRectIsEmpty(v56))
    {
      if ([(SUUIMenuBarTemplateDocumentViewController *)self isViewLoaded]) {
        [(SUUIMenuBarTemplateDocumentViewController *)self view];
      }
      else {
      v47 = [MEMORY[0x263F82B60] mainScreen];
      }
      [v47 bounds];
      objc_msgSend(v31, "setFrame:");
    }
    menuBarSectionsViewController = self->_menuBarSectionsViewController;
  }
  v48 = [(SUUIMenuBarTemplateDocumentViewController *)self _colorScheme];
  [(SUUIStorePageSectionsViewController *)menuBarSectionsViewController setColorScheme:v48];

  [(SUUIMenuBarSectionsViewController *)self->_menuBarSectionsViewController setNumberOfIterationsForShelfPageSections:1];
  [(SUUIStorePageSectionsViewController *)self->_menuBarSectionsViewController _setRendersWithPerspective:[(SUUIViewElement *)self->_templateElement rendersWithPerspective]];
  [(SUUIStorePageSectionsViewController *)self->_menuBarSectionsViewController _setRendersWithParallax:[(SUUIViewElement *)self->_templateElement rendersWithParallax]];
  v49 = self->_menuBarSectionsViewController;
  v50 = [(SUUIMenuBarTemplateDocumentViewController *)self _zoomingShelfPageSplitsDescription];
  [(SUUIStorePageSectionsViewController *)v49 setSectionsWithSplitsDescription:v50];

  v51 = [(SUUIStorePageSectionsViewController *)self->_menuBarSectionsViewController sections];
  v52 = [v51 firstObject];

  v53 = [v52 configuration];
  v54 = [v53 shelfCollectionView];
  [(SUUIHorizontalScrollingContainerViewController *)self->_horizontalScrollingContainerViewController setMenuBarCollectionView:v54];
  id v18 = self->_horizontalScrollingContainerViewController;

  if (v18)
  {
LABEL_37:
    [(SUUIMenuBarTemplateDocumentViewController *)self _addContentViewController:v18];
  }
}

- (void)_removeContentViewController:(id)a3
{
  id v6 = a3;
  int64_t v3 = [v6 parentViewController];
  if (v3) {
    [v6 willMoveToParentViewController:0];
  }
  if ([v6 isViewLoaded])
  {
    double v4 = [v6 view];
    unint64_t v5 = [v4 superview];

    if (v5) {
      [v4 removeFromSuperview];
    }
  }
  if (v3) {
    [v6 removeFromParentViewController];
  }
}

- (void)_replaceViewControllerAtIndex:(unint64_t)a3 withViewController:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  int64_t menuBarStyle = self->_menuBarStyle;
  if (menuBarStyle == 1)
  {
    id v9 = &OBJC_IVAR___SUUIMenuBarTemplateDocumentViewController__scrollingSegmentedController;
  }
  else
  {
    if (menuBarStyle != 2) {
      goto LABEL_6;
    }
    id v9 = &OBJC_IVAR___SUUIMenuBarTemplateDocumentViewController__horizontalScrollingContainerViewController;
  }
  id v10 = v6;
  id v6 = (id)[*(id *)((char *)&self->super.super.super.super.isa + *v9) replaceViewControllerAtIndex:a3 withViewController:v6];
  id v7 = v10;
LABEL_6:
  MEMORY[0x270F9A758](v6, v7);
}

- (BOOL)_isFirstViewControllerOnNavigationStack
{
  unint64_t v2 = self;
  int64_t v3 = [(SUUIMenuBarTemplateDocumentViewController *)self navigationController];
  double v4 = [v3 viewControllers];
  unint64_t v5 = [v4 firstObject];
  LOBYTE(v2) = SUUIViewControllerIsDescendent(v2, v5);

  return (char)v2;
}

- (void)_willDisplayViewControllerAtIndex:(unint64_t)a3
{
  id v8 = 0;
  unint64_t v4 = [(SUUIMenuBarTemplateDocumentViewController *)self _menuItemIndexForEntityIndex:a3 entityValueProvider:&v8];
  menuBarViewElementConfiguration = self->_menuBarViewElementConfiguration;
  id v6 = v8;
  id v7 = [(SUUIViewController *)self clientContext];
  [(SUUIMenuBarViewElementConfiguration *)menuBarViewElementConfiguration contentWillAppearForMenuItemAtIndex:v4 withEntityValueProvider:v6 clientContext:v7];
}

- (id)_zoomingShelfPageSplitsDescription
{
  v10[1] = *MEMORY[0x263EF8340];
  if (self->_menuBarStyle == 2)
  {
    int64_t v3 = objc_alloc_init(SUUIStorePageSplitsDescription);
    unint64_t v4 = self->_menuBarViewElement;
    unint64_t v5 = (objc_class *)SUUIPageComponentClassForComponentType([(SUUIViewElement *)v4 pageComponentType]);
    if (v5)
    {
      id v6 = (void *)[[v5 alloc] initWithViewElement:v4];
      id v7 = objc_alloc_init(SUUIStorePageSplit);
      v10[0] = v6;
      id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
      [(SUUIStorePageSplit *)v7 setPageComponents:v8];

      [(SUUIStorePageSplitsDescription *)v3 setTopSplit:v7];
    }
  }
  else
  {
    int64_t v3 = 0;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_scrollingSegmentedController, 0);
  objc_storeStrong((id *)&self->_pendingSelectedMenuItemViewElement, 0);
  objc_storeStrong((id *)&self->_menuBarViewElementConfiguration, 0);
  objc_storeStrong((id *)&self->_menuBarViewElement, 0);
  objc_storeStrong((id *)&self->_menuBarSectionsViewController, 0);
  objc_storeStrong((id *)&self->_loadingDocumentViewController, 0);
  objc_storeStrong((id *)&self->_horizontalScrollingContainerViewController, 0);
  objc_storeStrong((id *)&self->_entityUniqueIdentifierToEntityIndex, 0);
  objc_storeStrong((id *)&self->_dynamicPageSectionIndexMapper, 0);
  objc_storeStrong((id *)&self->_embeddedPaletteHost, 0);
}

@end