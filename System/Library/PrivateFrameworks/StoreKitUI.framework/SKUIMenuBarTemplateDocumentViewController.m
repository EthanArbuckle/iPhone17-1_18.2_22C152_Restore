@interface SKUIMenuBarTemplateDocumentViewController
- (BOOL)_isFirstViewControllerOnNavigationStack;
- (SKUIMenuBarTemplateDocumentViewController)initWithTemplateElement:(id)a3;
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

@implementation SKUIMenuBarTemplateDocumentViewController

- (SKUIMenuBarTemplateDocumentViewController)initWithTemplateElement:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMenuBarTemplateDocumentViewController initWithTemplateElement:]();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIMenuBarTemplateDocumentViewController;
  v6 = [(SKUIMenuBarTemplateDocumentViewController *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_templateElement, a3);
    uint64_t v8 = [(SKUIMenuBarTemplateElement *)v7->_templateElement menuBar];
    menuBarViewElement = v7->_menuBarViewElement;
    v7->_menuBarViewElement = (SKUIMenuBarViewElement *)v8;

    uint64_t v10 = [(SKUIMenuBarViewElement *)v7->_menuBarViewElement configuration];
    menuBarViewElementConfiguration = v7->_menuBarViewElementConfiguration;
    v7->_menuBarViewElementConfiguration = (SKUIMenuBarViewElementConfiguration *)v10;

    [(SKUIMenuBarViewElementConfiguration *)v7->_menuBarViewElementConfiguration setDelegate:v7];
    uint64_t v12 = [(SKUIMenuBarViewElementConfiguration *)v7->_menuBarViewElementConfiguration selectedMenuItemViewElement];
    pendingSelectedMenuItemViewElement = v7->_pendingSelectedMenuItemViewElement;
    v7->_pendingSelectedMenuItemViewElement = (SKUIMenuItemViewElement *)v12;

    v7->_scrollingTabAppearanceStatus.progress = 1.0;
    *(void *)&v7->_scrollingTabAppearanceStatus.isBouncingOffTheEdge = 0;
    [(SKUIMenuBarTemplateDocumentViewController *)v7 _reloadContentViewController];
  }

  return v7;
}

- (void)dealloc
{
  scrollingSegmentedController = self->_scrollingSegmentedController;
  if (scrollingSegmentedController)
  {
    [(SKUIScrollingSegmentedController *)scrollingSegmentedController setDelegate:0];
    [(SKUIMenuBarTemplateDocumentViewController *)self _removeContentViewController:self->_scrollingSegmentedController];
  }
  horizontalScrollingContainerViewController = self->_horizontalScrollingContainerViewController;
  if (horizontalScrollingContainerViewController)
  {
    [(SKUIHorizontalScrollingContainerViewController *)horizontalScrollingContainerViewController setDelegate:0];
    [(SKUIMenuBarTemplateDocumentViewController *)self _removeContentViewController:self->_horizontalScrollingContainerViewController];
  }
  v5.receiver = self;
  v5.super_class = (Class)SKUIMenuBarTemplateDocumentViewController;
  [(SKUIViewController *)&v5 dealloc];
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)SKUIMenuBarTemplateDocumentViewController;
  -[SKUIMenuBarTemplateDocumentViewController setPreferredContentSize:](&v6, sel_setPreferredContentSize_);
  -[SKUIHorizontalScrollingContainerViewController setPreferredContentSize:](self->_horizontalScrollingContainerViewController, "setPreferredContentSize:", width, height);
  -[SKUIScrollingSegmentedController setPreferredContentSize:](self->_scrollingSegmentedController, "setPreferredContentSize:", width, height);
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)SKUIMenuBarTemplateDocumentViewController;
  [(SKUIMenuBarTemplateDocumentViewController *)&v7 viewDidLoad];
  v3 = [(SKUIMenuBarTemplateDocumentViewController *)self view];
  v4 = [(SKUIMenuBarTemplateDocumentViewController *)self _contentViewController];
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
  v2 = [(SKUIMenuBarTemplateDocumentViewController *)self _contentViewController];
  v3 = [v2 contentScrollView];

  return v3;
}

- (void)setClientContext:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKUIMenuBarTemplateDocumentViewController;
  [(SKUIViewController *)&v6 setClientContext:v4];
  [(SKUIViewController *)self->_menuBarSectionsViewController setClientContext:v4];
  unint64_t v5 = self->_menuBarStyle - 1;
  if (v5 <= 2) {
    [*(id *)((char *)&self->super.super.super.super.isa + *off_1E6425500[v5]) setClientContext:v4];
  }
}

- (void)setOperationQueue:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKUIMenuBarTemplateDocumentViewController;
  [(SKUIViewController *)&v6 setOperationQueue:v4];
  [(SKUIViewController *)self->_menuBarSectionsViewController setOperationQueue:v4];
  unint64_t v5 = self->_menuBarStyle - 1;
  if (v5 <= 2) {
    [*(id *)((char *)&self->super.super.super.super.isa + *off_1E6425500[v5]) setOperationQueue:v4];
  }
}

- (void)documentDidUpdate:(id)a3
{
  menuBarViewElementConfiguration = self->_menuBarViewElementConfiguration;
  id v5 = a3;
  [(SKUIMenuBarViewElementConfiguration *)menuBarViewElementConfiguration setDelegate:0];
  objc_super v6 = [v5 templateElement];

  templateElement = self->_templateElement;
  self->_templateElement = v6;

  uint64_t v8 = [(SKUIMenuBarTemplateElement *)self->_templateElement menuBar];
  menuBarViewElement = self->_menuBarViewElement;
  self->_menuBarViewElement = v8;

  uint64_t v10 = [(SKUIMenuBarViewElement *)self->_menuBarViewElement configuration];
  v11 = self->_menuBarViewElementConfiguration;
  self->_menuBarViewElementConfiguration = v10;

  [(SKUIMenuBarViewElementConfiguration *)self->_menuBarViewElementConfiguration setDelegate:self];
  dynamicPageSectionIndexMapper = self->_dynamicPageSectionIndexMapper;
  v13 = [(SKUIViewElement *)self->_menuBarViewElement entityProvider];
  [(SKUIDynamicPageSectionIndexMapper *)dynamicPageSectionIndexMapper setEntityProvider:v13];

  [(SKUIMenuBarTemplateDocumentViewController *)self _reloadContentViewController];
}

- (void)documentMediaQueriesDidUpdate:(id)a3
{
  menuBarSectionsViewController = self->_menuBarSectionsViewController;
  id v5 = [(SKUIMenuBarTemplateDocumentViewController *)self _colorScheme];
  [(SKUIStorePageSectionsViewController *)menuBarSectionsViewController setColorScheme:v5];

  objc_super v6 = self->_menuBarSectionsViewController;

  [(SKUIStorePageSectionsViewController *)v6 invalidateAndReload];
}

- (id)navigationPaletteView
{
  if ([(SKUIMenuBarTemplateDocumentViewController *)self _isFirstViewControllerOnNavigationStack])
  {
    v3 = [(SKUIMenuBarSectionsViewController *)self->_menuBarSectionsViewController view];
    id v4 = [(SKUIMenuBarSectionsViewController *)self->_menuBarSectionsViewController contentScrollView];
    [(SKUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost *)v3 layoutIfNeeded];
    [v4 layoutIfNeeded];
    [v4 contentSize];
    [(SKUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost *)v3 frame];
    -[SKUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost setFrame:](v3, "setFrame:");
  }
  else
  {
    embeddedPaletteHost = self->_embeddedPaletteHost;
    if (!embeddedPaletteHost)
    {
      objc_super v6 = [SKUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost alloc];
      [(SKUIMenuBarTemplateDocumentViewController *)self titleViewHeight];
      uint64_t v8 = -[SKUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost initWithFrame:](v6, "initWithFrame:", 0.0, 0.0, 0.0, v7 + 7.0);
      v9 = self->_embeddedPaletteHost;
      self->_embeddedPaletteHost = v8;

      uint64_t v10 = [(SKUIMenuBarTemplateDocumentViewController *)self titleView];
      [v10 sizeToFit];
      [(SKUIMenuBarTemplateDocumentViewControllerEmbeddedPaletteHost *)self->_embeddedPaletteHost setTitleView:v10];

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
    uint64_t v11 = [(SKUIMenuBarTemplateDocumentViewController *)self _dynamicPageSectionIndexMapper];
    if (v11)
    {
      uint64_t v10 = (void *)v11;
      id v9 = [(SKUIViewElement *)self->_menuBarViewElement entityProvider];
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
        [(SKUIMenuBarTemplateDocumentViewController *)self _recordEntityUniqueIdentifier:v15 forEntityIndex:i];
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
        id v9 = [(SKUIMenuBarTemplateDocumentViewController *)self _newChildViewControllerForEntityAtIndex:v8];
        [(SKUIMenuBarTemplateDocumentViewController *)self _replaceViewControllerAtIndex:v8 withViewController:v9];
        uint64_t v10 = v7;
LABEL_4:
      }
    }
  }
}

- (void)menuBarViewElementConfiguration:(id)a3 didReplaceDocumentForMenuItemAtIndex:(unint64_t)a4
{
  id v6 = [(SKUIMenuBarTemplateDocumentViewController *)self _newChildViewControllerForEntityAtIndex:a4];
  [(SKUIMenuBarTemplateDocumentViewController *)self _replaceViewControllerAtIndex:a4 withViewController:v6];
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
      [(SKUIScrollingSegmentedController *)self->_scrollingSegmentedController selectViewControllerAtIndex:v9 animated:v5];
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
  BOOL v5 = [(SKUINavigationBarController *)[SKUIMenuBarNavigationBarController alloc] initWithNavigationBarViewElement:v4];

  if ([(SKUIMenuBarTemplateDocumentViewController *)self _isFirstViewControllerOnNavigationStack])
  {
    id v6 = [(SKUIMenuBarTemplateDocumentViewController *)self titleView];
    [(SKUIMenuBarNavigationBarController *)v5 setTitleView:v6];
  }

  return v5;
}

- (void)scrollingSegmentedController:(id)a3 willDisplayViewControllerAtIndex:(unint64_t)a4
{
}

- (void)scrollingTabAppearanceStatusWasUpdated:(id)a3
{
  self->_scrollingTabAppearanceStatus = ($D35E09B864CB17FEE2308AEA3FA0107F)a3;
  -[SKUIScrollingSegmentedController scrollingTabAppearanceStatusWasUpdated:](self->_scrollingSegmentedController, "scrollingTabAppearanceStatusWasUpdated:");
}

- (UIScrollView)scrollingTabNestedPagingScrollView
{
  return [(SKUIScrollingSegmentedController *)self->_scrollingSegmentedController scrollingTabNestedPagingScrollView];
}

- (id)scrollingTabViewControllerInNestedPagingScrollViewAtPageIndex:(unint64_t)a3
{
  return [(SKUIScrollingSegmentedController *)self->_scrollingSegmentedController scrollingTabViewControllerInNestedPagingScrollViewAtPageIndex:a3];
}

- (UIView)titleView
{
  return (UIView *)[(SKUIScrollingSegmentedController *)self->_scrollingSegmentedController navigationBarTitleView];
}

- (double)titleViewHeight
{
  v3 = [(SKUIScrollingSegmentedController *)self->_scrollingSegmentedController navigationBarTitleView];
  [v3 layoutMargins];
  double v5 = v4;
  double v7 = v6;

  id v8 = [(SKUIScrollingSegmentedController *)self->_scrollingSegmentedController navigationBarTitleView];
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
    [(SKUIMenuBarTemplateDocumentViewController *)self addChildViewController:v7];
    if ([(SKUIMenuBarTemplateDocumentViewController *)self isViewLoaded])
    {
      double v5 = [(SKUIMenuBarTemplateDocumentViewController *)self view];
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
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v4 = [(SKUIMenuBarTemplateDocumentViewController *)self _dynamicPageSectionIndexMapper];
  double v5 = v4;
  if (v4) {
    uint64_t v6 = [v4 totalNumberOfEntities];
  }
  else {
    uint64_t v6 = [(SKUIMenuBarViewElementConfiguration *)self->_menuBarViewElementConfiguration numberOfMenuItems];
  }
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = 0;
    do
    {
      id v9 = [(SKUIMenuBarTemplateDocumentViewController *)self _newChildViewControllerForEntityAtIndex:v8];
      [v3 addObject:v9];

      ++v8;
    }
    while (v7 != v8);
  }

  return v3;
}

- (id)_colorScheme
{
  v2 = [(SKUIMenuBarTemplateElement *)self->_templateElement style];
  id v3 = [v2 ikBackgroundColor];
  double v4 = [v3 color];

  if (!v4)
  {
    double v4 = [MEMORY[0x1E4FB1618] clearColor];
  }
  double v5 = objc_alloc_init(SKUIColorScheme);
  [(SKUIColorScheme *)v5 setBackgroundColor:v4];

  return v5;
}

- (id)_contentViewController
{
  unint64_t v2 = self->_menuBarStyle - 1;
  if (v2 > 2) {
    id v3 = 0;
  }
  else {
    id v3 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E6425500[v2]);
  }

  return v3;
}

- (id)_dynamicPageSectionIndexMapper
{
  if (!self->_dynamicPageSectionIndexMapper
    && [(SKUIViewElement *)self->_menuBarViewElement isDynamicContainer])
  {
    id v3 = objc_alloc_init(SKUIDynamicPageSectionIndexMapper);
    dynamicPageSectionIndexMapper = self->_dynamicPageSectionIndexMapper;
    self->_dynamicPageSectionIndexMapper = v3;

    double v5 = self->_dynamicPageSectionIndexMapper;
    uint64_t v6 = [(SKUIViewElement *)self->_menuBarViewElement entityProvider];
    [(SKUIDynamicPageSectionIndexMapper *)v5 setEntityProvider:v6];
  }
  uint64_t v7 = self->_dynamicPageSectionIndexMapper;

  return v7;
}

- (unint64_t)_menuItemIndexForEntityIndex:(unint64_t)a3 entityValueProvider:(id *)a4
{
  uint64_t v7 = [(SKUIMenuBarTemplateDocumentViewController *)self _dynamicPageSectionIndexMapper];
  if (!v7)
  {
    double v10 = 0;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v8 = [(SKUIViewElement *)self->_menuBarViewElement entityProvider];
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
  unint64_t v5 = [(SKUIMenuBarTemplateDocumentViewController *)self _menuItemIndexForEntityIndex:a3 entityValueProvider:&v18];
  id v6 = v18;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 entityUniqueIdentifier];
    [(SKUIMenuBarTemplateDocumentViewController *)self _recordEntityUniqueIdentifier:v8 forEntityIndex:a3];
    id v9 = [(SKUIMenuBarViewElementConfiguration *)self->_menuBarViewElementConfiguration documentForEntityUniqueIdentifier:v8];
    double v10 = [(SKUIMenuBarViewElementConfiguration *)self->_menuBarViewElementConfiguration documentOptionsForEntityUniqueIdentifier:v8];

    if (!v9) {
      goto LABEL_6;
    }
LABEL_5:
    uint64_t v11 = [SKUIDocumentContainerViewController alloc];
    uint64_t v12 = [(SKUIViewController *)self clientContext];
    v13 = [(SKUIDocumentContainerViewController *)v11 initWithDocument:v9 options:v10 clientContext:v12];

    if (v13) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v9 = [(SKUIMenuBarViewElementConfiguration *)self->_menuBarViewElementConfiguration documentForMenuItemAtIndex:v5];
  double v10 = [(SKUIMenuBarViewElementConfiguration *)self->_menuBarViewElementConfiguration documentOptionsForMenuItemAtIndex:v5];
  if (v9) {
    goto LABEL_5;
  }
LABEL_6:
  v13 = (SKUIDocumentContainerViewController *)objc_alloc_init(MEMORY[0x1E4FB1EC0]);
LABEL_7:
  if (self->_menuBarStyle == 1)
  {
    v14 = [(SKUIMenuBarViewElement *)self->_menuBarViewElement titleForMenuItemAtIndex:a3];
    id v15 = [v14 text];
    uint64_t v16 = [v15 string];
    [(SKUIDocumentContainerViewController *)v13 setTitle:v16];
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
      uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
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
  int64_t v3 = [(SKUIMenuBarViewElementConfiguration *)self->_menuBarViewElementConfiguration menuBarStyle];
  int64_t menuBarStyle = self->_menuBarStyle;
  if (menuBarStyle != v3)
  {
    switch(menuBarStyle)
    {
      case 3:
        uint64_t v6 = 1080;
        break;
      case 2:
        [(SKUIHorizontalScrollingContainerViewController *)self->_horizontalScrollingContainerViewController setDelegate:0];
        [(SKUIMenuBarTemplateDocumentViewController *)self _removeContentViewController:self->_horizontalScrollingContainerViewController];
        uint64_t v6 = 1088;
        break;
      case 1:
        p_scrollingSegmentedController = &self->_scrollingSegmentedController;
        [(SKUIScrollingSegmentedController *)self->_scrollingSegmentedController setDelegate:0];
LABEL_9:
        [(SKUIMenuBarTemplateDocumentViewController *)self _removeContentViewController:*p_scrollingSegmentedController];
        uint64_t v7 = *p_scrollingSegmentedController;
        *p_scrollingSegmentedController = 0;

        goto LABEL_10;
      default:
LABEL_10:
        embeddedPaletteHost = self->_embeddedPaletteHost;
        self->_embeddedPaletteHost = 0;

        goto LABEL_11;
    }
    p_scrollingSegmentedController = (SKUIScrollingSegmentedController **)((char *)self + v6);
    goto LABEL_9;
  }
LABEL_11:
  self->_int64_t menuBarStyle = v3;
  if (v3 == 3)
  {
    if (self->_loadingDocumentViewController) {
      return;
    }
    id v11 = [(SKUIViewElement *)self->_menuBarViewElement firstChildForElementType:4];
    uint64_t v12 = [[SKUILoadingDocumentViewController alloc] initWithActivityIndicatorElement:v11];
    loadingDocumentViewController = self->_loadingDocumentViewController;
    self->_loadingDocumentViewController = v12;

    v14 = self->_loadingDocumentViewController;
    id v15 = [(SKUIViewController *)self clientContext];
    [(SKUIViewController *)v14 setClientContext:v15];

    uint64_t v16 = self->_loadingDocumentViewController;
    id v17 = [(SKUIViewController *)self operationQueue];
    [(SKUIViewController *)v16 setOperationQueue:v17];

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
      pendingSelectedMenuItemViewElement = [(SKUIMenuBarTemplateDocumentViewController *)self _childViewControllersForMenuItems];
      [(SKUIScrollingSegmentedController *)scrollingSegmentedController setViewControllers:pendingSelectedMenuItemViewElement];
    }
    else
    {
      v32 = objc_alloc_init(SKUIScrollingSegmentedController);
      v33 = self->_scrollingSegmentedController;
      self->_scrollingSegmentedController = v32;

      v34 = self->_scrollingSegmentedController;
      v35 = [(SKUIViewController *)self clientContext];
      [(SKUIScrollingSegmentedController *)v34 setClientContext:v35];

      v36 = self->_scrollingSegmentedController;
      v37 = [(SKUIViewController *)self operationQueue];
      [(SKUIViewController *)v36 setOperationQueue:v37];

      [(SKUIScrollingSegmentedController *)self->_scrollingSegmentedController setDelegate:self];
      -[SKUIScrollingSegmentedController scrollingTabAppearanceStatusWasUpdated:](self->_scrollingSegmentedController, "scrollingTabAppearanceStatusWasUpdated:", *(void *)&self->_scrollingTabAppearanceStatus.progress, *(void *)&self->_scrollingTabAppearanceStatus.isBouncingOffTheEdge);
      v38 = self->_scrollingSegmentedController;
      v39 = [(SKUIMenuBarTemplateDocumentViewController *)self _childViewControllersForMenuItems];
      [(SKUIScrollingSegmentedController *)v38 setViewControllers:v39];

      if (!self->_pendingSelectedMenuItemViewElement) {
        goto LABEL_29;
      }
      unint64_t v40 = -[SKUIMenuBarViewElementConfiguration indexOfMenuItemViewElement:](self->_menuBarViewElementConfiguration, "indexOfMenuItemViewElement:");
      if (v40 != 0x7FFFFFFFFFFFFFFFLL) {
        [(SKUIScrollingSegmentedController *)self->_scrollingSegmentedController selectViewControllerAtIndex:v40 animated:0];
      }
      pendingSelectedMenuItemViewElement = self->_pendingSelectedMenuItemViewElement;
      self->_pendingSelectedMenuItemViewElement = 0;
    }

LABEL_29:
    id v11 = [(SKUIMenuBarViewElement *)self->_menuBarViewElement style];
    v41 = [v11 valueForStyle:*MEMORY[0x1E4F6EFD0]];
    v42 = [(SKUIScrollingSegmentedController *)self->_scrollingSegmentedController navigationBarTitleView];
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
      double v44 = SKUIViewElementPaddingForStyle(v11, &v55);
      if (!v55)
      {
LABEL_33:
        v45 = objc_msgSend(v11, "valueForStyle:", *MEMORY[0x1E4F6EFC8], v44);
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
    v20 = objc_alloc_init(SKUIHorizontalScrollingContainerViewController);
    v21 = self->_horizontalScrollingContainerViewController;
    self->_horizontalScrollingContainerViewController = v20;

    [(SKUIHorizontalScrollingContainerViewController *)self->_horizontalScrollingContainerViewController setDelegate:self];
    horizontalScrollingContainerViewController = self->_horizontalScrollingContainerViewController;
  }
  v22 = [(SKUIMenuBarTemplateDocumentViewController *)self _childViewControllersForMenuItems];
  [(SKUIHorizontalScrollingContainerViewController *)horizontalScrollingContainerViewController setViewControllers:v22];

  menuBarSectionsViewController = self->_menuBarSectionsViewController;
  if (!menuBarSectionsViewController)
  {
    v24 = [[SKUIMenuBarSectionsViewController alloc] initWithLayoutStyle:0];
    v25 = self->_menuBarSectionsViewController;
    self->_menuBarSectionsViewController = v24;

    v26 = self->_menuBarSectionsViewController;
    v27 = [(SKUIViewController *)self clientContext];
    [(SKUIViewController *)v26 setClientContext:v27];

    v28 = self->_menuBarSectionsViewController;
    v29 = [(SKUIViewController *)self operationQueue];
    [(SKUIViewController *)v28 setOperationQueue:v29];

    v30 = self->_menuBarSectionsViewController;
    [(SKUIMenuBarTemplateDocumentViewController *)self preferredContentSize];
    -[SKUIMenuBarSectionsViewController setPreferredContentSize:](v30, "setPreferredContentSize:");
    v31 = [(SKUIMenuBarSectionsViewController *)self->_menuBarSectionsViewController view];
    [v31 frame];
    if (CGRectIsEmpty(v56))
    {
      if ([(SKUIMenuBarTemplateDocumentViewController *)self isViewLoaded]) {
        [(SKUIMenuBarTemplateDocumentViewController *)self view];
      }
      else {
      v47 = [MEMORY[0x1E4FB1BA8] mainScreen];
      }
      [v47 bounds];
      objc_msgSend(v31, "setFrame:");
    }
    menuBarSectionsViewController = self->_menuBarSectionsViewController;
  }
  v48 = [(SKUIMenuBarTemplateDocumentViewController *)self _colorScheme];
  [(SKUIStorePageSectionsViewController *)menuBarSectionsViewController setColorScheme:v48];

  [(SKUIMenuBarSectionsViewController *)self->_menuBarSectionsViewController setNumberOfIterationsForShelfPageSections:1];
  [(SKUIStorePageSectionsViewController *)self->_menuBarSectionsViewController _setRendersWithPerspective:[(SKUIViewElement *)self->_templateElement rendersWithPerspective]];
  [(SKUIStorePageSectionsViewController *)self->_menuBarSectionsViewController _setRendersWithParallax:[(SKUIViewElement *)self->_templateElement rendersWithParallax]];
  v49 = self->_menuBarSectionsViewController;
  v50 = [(SKUIMenuBarTemplateDocumentViewController *)self _zoomingShelfPageSplitsDescription];
  [(SKUIStorePageSectionsViewController *)v49 setSectionsWithSplitsDescription:v50];

  v51 = [(SKUIStorePageSectionsViewController *)self->_menuBarSectionsViewController sections];
  v52 = [v51 firstObject];

  v53 = [v52 configuration];
  v54 = [v53 shelfCollectionView];
  [(SKUIHorizontalScrollingContainerViewController *)self->_horizontalScrollingContainerViewController setMenuBarCollectionView:v54];
  id v18 = self->_horizontalScrollingContainerViewController;

  if (v18)
  {
LABEL_37:
    [(SKUIMenuBarTemplateDocumentViewController *)self _addContentViewController:v18];
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
    id v9 = &OBJC_IVAR___SKUIMenuBarTemplateDocumentViewController__scrollingSegmentedController;
  }
  else
  {
    if (menuBarStyle != 2) {
      goto LABEL_6;
    }
    id v9 = &OBJC_IVAR___SKUIMenuBarTemplateDocumentViewController__horizontalScrollingContainerViewController;
  }
  id v10 = v6;
  id v6 = (id)[*(id *)((char *)&self->super.super.super.super.isa + *v9) replaceViewControllerAtIndex:a3 withViewController:v6];
  id v7 = v10;
LABEL_6:

  MEMORY[0x1F41817F8](v6, v7);
}

- (BOOL)_isFirstViewControllerOnNavigationStack
{
  unint64_t v2 = self;
  int64_t v3 = [(SKUIMenuBarTemplateDocumentViewController *)self navigationController];
  double v4 = [v3 viewControllers];
  unint64_t v5 = [v4 firstObject];
  LOBYTE(v2) = SKUIViewControllerIsDescendent(v2, v5);

  return (char)v2;
}

- (void)_willDisplayViewControllerAtIndex:(unint64_t)a3
{
  id v8 = 0;
  unint64_t v4 = [(SKUIMenuBarTemplateDocumentViewController *)self _menuItemIndexForEntityIndex:a3 entityValueProvider:&v8];
  menuBarViewElementConfiguration = self->_menuBarViewElementConfiguration;
  id v6 = v8;
  id v7 = [(SKUIViewController *)self clientContext];
  [(SKUIMenuBarViewElementConfiguration *)menuBarViewElementConfiguration contentWillAppearForMenuItemAtIndex:v4 withEntityValueProvider:v6 clientContext:v7];
}

- (id)_zoomingShelfPageSplitsDescription
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (self->_menuBarStyle == 2)
  {
    int64_t v3 = objc_alloc_init(SKUIStorePageSplitsDescription);
    unint64_t v4 = self->_menuBarViewElement;
    unint64_t v5 = (objc_class *)SKUIPageComponentClassForComponentType([(SKUIViewElement *)v4 pageComponentType]);
    if (v5)
    {
      id v6 = (void *)[[v5 alloc] initWithViewElement:v4];
      id v7 = objc_alloc_init(SKUIStorePageSplit);
      v10[0] = v6;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
      [(SKUIStorePageSplit *)v7 setPageComponents:v8];

      [(SKUIStorePageSplitsDescription *)v3 setTopSplit:v7];
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

- (void)initWithTemplateElement:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMenuBarTemplateDocumentViewController initWithTemplateElement:]";
}

@end