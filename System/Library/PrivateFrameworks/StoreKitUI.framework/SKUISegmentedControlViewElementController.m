@interface SKUISegmentedControlViewElementController
- (SKUIClientContext)clientContext;
- (SKUISegmentedControlViewElement)viewElement;
- (SKUISegmentedControlViewElementController)initWithViewElement:(id)a3;
- (SKUISegmentedControlViewElementController)initWithViewElement:(id)a3 segmentedControl:(id)a4;
- (UIViewController)parentViewController;
- (double)desiredSegmentWidth;
- (id)_segmentedControl;
- (int64_t)defaultMaximumNumberOfVisibleItems;
- (void)_cancelMenuAction:(id)a3;
- (void)_connectToSegmentedControl:(id)a3;
- (void)_destroyMenuSheetViewController;
- (void)_destroyPopoverController;
- (void)_reloadPropertiesForSegmentedControl:(id)a3;
- (void)_showMoreListSheetWithTitles:(id)a3 selectedIndex:(int64_t)a4;
- (void)_showPopoverMoreListWithTitles:(id)a3;
- (void)dealloc;
- (void)menuPopover:(id)a3 didSelectMenuItemAtIndex:(int64_t)a4;
- (void)menuPopover:(id)a3 willRepositionToRect:(CGRect *)a4 inView:(id *)a5;
- (void)menuPopoverDidCancel:(id)a3;
- (void)menuViewController:(id)a3 didSelectItemAtIndex:(int64_t)a4;
- (void)reloadAfterDocumentUpdate;
- (void)segmentedControl:(id)a3 didSelectSegmentIndex:(int64_t)a4;
- (void)segmentedControl:(id)a3 showMoreListWithTitles:(id)a4;
- (void)setClientContext:(id)a3;
- (void)setDefaultMaximumNumberOfVisibleItems:(int64_t)a3;
- (void)setDesiredSegmentWidth:(double)a3;
- (void)setParentViewController:(id)a3;
@end

@implementation SKUISegmentedControlViewElementController

- (SKUISegmentedControlViewElementController)initWithViewElement:(id)a3
{
  return [(SKUISegmentedControlViewElementController *)self initWithViewElement:a3 segmentedControl:0];
}

- (SKUISegmentedControlViewElementController)initWithViewElement:(id)a3 segmentedControl:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUISegmentedControlViewElementController initWithViewElement:segmentedControl:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUISegmentedControlViewElementController;
  v9 = [(SKUISegmentedControlViewElementController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_defaultMaximumNumberOfVisibleItems = -1;
    v9->_desiredSegmentWidth = 100.0;
    objc_storeStrong((id *)&v9->_viewElement, a3);
    if (v8)
    {
      objc_storeStrong((id *)&v10->_segmentedControl, a4);
      [(SKUISegmentedControlViewElementController *)v10 _connectToSegmentedControl:v8];
    }
  }

  return v10;
}

- (void)dealloc
{
  [(UIBarButtonItem *)self->_menuSheetCancelButtonItem setTarget:0];
  [(SKUIMenuViewController *)self->_menuSheetViewController setDelegate:0];
  [(SKUIMenuPopoverController *)self->_popoverMenuViewController setDelegate:0];
  [(SKUIFlexibleSegmentedControl *)self->_segmentedControl setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUISegmentedControlViewElementController;
  [(SKUISegmentedControlViewElementController *)&v3 dealloc];
}

- (void)reloadAfterDocumentUpdate
{
  if (self->_segmentedControl && [(SKUISegmentedControlViewElement *)self->_viewElement updateType])
  {
    segmentedControl = self->_segmentedControl;
    [(SKUISegmentedControlViewElementController *)self _connectToSegmentedControl:segmentedControl];
  }
}

- (void)setDefaultMaximumNumberOfVisibleItems:(int64_t)a3
{
  if (self->_defaultMaximumNumberOfVisibleItems != a3)
  {
    self->_defaultMaximumNumberOfVisibleItems = a3;
    [(SKUISegmentedControlViewElementController *)self _reloadPropertiesForSegmentedControl:self->_segmentedControl];
  }
}

- (void)setDesiredSegmentWidth:(double)a3
{
  if (self->_desiredSegmentWidth != a3)
  {
    self->_desiredSegmentWidth = a3;
    -[SKUIFlexibleSegmentedControl setDesiredSegmentWidth:](self->_segmentedControl, "setDesiredSegmentWidth:");
  }
}

- (void)segmentedControl:(id)a3 didSelectSegmentIndex:(int64_t)a4
{
}

- (void)segmentedControl:(id)a3 showMoreListWithTitles:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (SKUIUserInterfaceIdiom(self->_clientContext) == 1)
  {
    [(SKUISegmentedControlViewElementController *)self _showPopoverMoreListWithTitles:v6];
  }
  else
  {
    id v7 = [v8 itemTitles];
    -[SKUISegmentedControlViewElementController _showMoreListSheetWithTitles:selectedIndex:](self, "_showMoreListSheetWithTitles:selectedIndex:", v7, [v8 selectedSegmentIndex]);
  }
}

- (void)menuPopoverDidCancel:(id)a3
{
  [(SKUIFlexibleSegmentedControl *)self->_segmentedControl cancelMoreList];

  [(SKUISegmentedControlViewElementController *)self _destroyPopoverController];
}

- (void)menuPopover:(id)a3 didSelectMenuItemAtIndex:(int64_t)a4
{
  int64_t v5 = [(SKUIFlexibleSegmentedControl *)self->_segmentedControl moreListIndex] + a4;
  [(SKUISegmentedControlViewElement *)self->_viewElement dispatchEventOfType:2 forItemAtIndex:v5];
  [(SKUIFlexibleSegmentedControl *)self->_segmentedControl setSelectedSegmentIndex:v5];

  [(SKUISegmentedControlViewElementController *)self _destroyPopoverController];
}

- (void)menuPopover:(id)a3 willRepositionToRect:(CGRect *)a4 inView:(id *)a5
{
  [(SKUIFlexibleSegmentedControl *)self->_segmentedControl frameForSegmentWithIndex:[(SKUIFlexibleSegmentedControl *)self->_segmentedControl moreListIndex]];
  a4->origin.x = v6;
  a4->origin.y = v7;
  a4->size.width = v8;
  a4->size.height = v9;
}

- (void)menuViewController:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  -[SKUISegmentedControlViewElement dispatchEventOfType:forItemAtIndex:](self->_viewElement, "dispatchEventOfType:forItemAtIndex:", 2);
  [(SKUIFlexibleSegmentedControl *)self->_segmentedControl cancelMoreList];
  [(SKUIFlexibleSegmentedControl *)self->_segmentedControl setSelectedSegmentIndex:a4];
  [(SKUIMenuViewController *)self->_menuSheetViewController dismissViewControllerAnimated:1 completion:0];

  [(SKUISegmentedControlViewElementController *)self _destroyMenuSheetViewController];
}

- (void)_cancelMenuAction:(id)a3
{
  [(SKUIFlexibleSegmentedControl *)self->_segmentedControl cancelMoreList];
  [(SKUIMenuViewController *)self->_menuSheetViewController dismissViewControllerAnimated:1 completion:0];

  [(SKUISegmentedControlViewElementController *)self _destroyMenuSheetViewController];
}

- (void)_connectToSegmentedControl:(id)a3
{
  id v8 = a3;
  [v8 setDelegate:self];
  [v8 setDesiredSegmentWidth:self->_desiredSegmentWidth];
  v4 = [(SKUISegmentedControlViewElement *)self->_viewElement segmentItemTitles];
  [v8 setItemTitles:v4];

  int64_t v5 = [(SKUISegmentedControlViewElement *)self->_viewElement moreListTitle];
  [v8 setMoreListTitle:v5];

  objc_msgSend(v8, "setSelectedSegmentIndex:", -[SKUISegmentedControlViewElement initialSelectedItemIndex](self->_viewElement, "initialSelectedItemIndex"));
  CGFloat v6 = [(SKUISegmentedControlViewElement *)self->_viewElement style];
  CGFloat v7 = SKUIViewElementPlainColorWithStyle(v6, 0);
  [v8 setTintColor:v7];

  [(SKUISegmentedControlViewElementController *)self _reloadPropertiesForSegmentedControl:v8];
}

- (void)_destroyMenuSheetViewController
{
  [(SKUIMenuViewController *)self->_menuSheetViewController setDelegate:0];
  [(SKUIMenuViewController *)self->_menuSheetViewController dismissViewControllerAnimated:1 completion:0];
  menuSheetViewController = self->_menuSheetViewController;
  self->_menuSheetViewController = 0;

  [(UIBarButtonItem *)self->_menuSheetCancelButtonItem setTarget:0];
  menuSheetCancelButtonItem = self->_menuSheetCancelButtonItem;
  self->_menuSheetCancelButtonItem = 0;
}

- (void)_destroyPopoverController
{
  [(SKUIMenuPopoverController *)self->_popoverMenuViewController setDelegate:0];
  popoverMenuViewController = self->_popoverMenuViewController;
  self->_popoverMenuViewController = 0;
}

- (void)_reloadPropertiesForSegmentedControl:(id)a3
{
  id v8 = a3;
  int64_t defaultMaximumNumberOfVisibleItems = [(SKUISegmentedControlViewElement *)self->_viewElement maximumNumberOfVisibleItems];
  if (defaultMaximumNumberOfVisibleItems > 0
    || (int64_t defaultMaximumNumberOfVisibleItems = self->_defaultMaximumNumberOfVisibleItems,
        defaultMaximumNumberOfVisibleItems >= 1))
  {
    [v8 setMaximumNumberOfVisibleItems:defaultMaximumNumberOfVisibleItems];
  }
  int64_t v5 = [(SKUISegmentedControlViewElement *)self->_viewElement style];
  CGFloat v6 = [v5 valueForStyle:@"itml-segmented-control-width"];
  uint64_t v7 = [v6 isEqualToString:@"full"];

  [v8 setSizesSegmentsToFitWidth:v7];
}

- (id)_segmentedControl
{
  segmentedControl = self->_segmentedControl;
  if (!segmentedControl)
  {
    v4 = objc_alloc_init(SKUIFlexibleSegmentedControl);
    int64_t v5 = self->_segmentedControl;
    self->_segmentedControl = v4;

    [(SKUISegmentedControlViewElementController *)self _connectToSegmentedControl:self->_segmentedControl];
    segmentedControl = self->_segmentedControl;
  }

  return segmentedControl;
}

- (void)_showMoreListSheetWithTitles:(id)a3 selectedIndex:(int64_t)a4
{
  if (!self->_menuSheetViewController)
  {
    id v6 = a3;
    id v26 = [(SKUISegmentedControlViewElementController *)self parentViewController];
    uint64_t v7 = [v26 navigationController];
    id v8 = v7;
    if (v7)
    {
      CGFloat v9 = [v7 navigationBar];
      uint64_t v10 = [v9 barStyle];
    }
    else
    {
      uint64_t v10 = 0;
    }
    v11 = [[SKUIMenuViewController alloc] initWithMenuTitles:v6];

    menuSheetViewController = self->_menuSheetViewController;
    self->_menuSheetViewController = v11;

    [(SKUIMenuViewController *)self->_menuSheetViewController setDelegate:self];
    [(SKUIMenuViewController *)self->_menuSheetViewController setIndexOfCheckedTitle:a4];
    v13 = self->_menuSheetViewController;
    v14 = [(SKUIFlexibleSegmentedControl *)self->_segmentedControl moreListTitle];
    [(SKUIMenuViewController *)v13 setTitle:v14];

    if (v10 == 1) {
      [(SKUIMenuViewController *)self->_menuSheetViewController setMenuStyle:1];
    }
    v15 = (UIBarButtonItem *)objc_alloc_init(MEMORY[0x1E4FB14A8]);
    menuSheetCancelButtonItem = self->_menuSheetCancelButtonItem;
    self->_menuSheetCancelButtonItem = v15;

    [(UIBarButtonItem *)self->_menuSheetCancelButtonItem setAction:sel__cancelMenuAction_];
    [(UIBarButtonItem *)self->_menuSheetCancelButtonItem setStyle:2];
    [(UIBarButtonItem *)self->_menuSheetCancelButtonItem setTarget:self];
    v17 = self->_menuSheetCancelButtonItem;
    v18 = [(SKUISegmentedControlViewElementController *)self clientContext];
    v19 = v18;
    if (v18) {
      [v18 localizedStringForKey:@"CANCEL"];
    }
    else {
    v20 = +[SKUIClientContext localizedStringForKey:@"CANCEL" inBundles:0];
    }
    [(UIBarButtonItem *)v17 setTitle:v20];

    v21 = [(SKUIMenuViewController *)self->_menuSheetViewController navigationItem];
    [v21 setLeftBarButtonItem:self->_menuSheetCancelButtonItem];

    v22 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:self->_menuSheetViewController];
    v23 = [v22 navigationBar];
    [v23 setBarStyle:v10];

    v24 = [v22 view];
    [v24 setSemanticContentAttribute:storeSemanticContentAttribute()];

    v25 = [v22 navigationBar];
    [v25 setSemanticContentAttribute:storeSemanticContentAttribute()];

    [v26 presentViewController:v22 animated:1 completion:0];
  }
}

- (void)_showPopoverMoreListWithTitles:(id)a3
{
  if (!self->_popoverMenuViewController)
  {
    id v4 = a3;
    int64_t v5 = [[SKUIMenuPopoverController alloc] initWithMenuTitles:v4];

    popoverMenuViewController = self->_popoverMenuViewController;
    self->_popoverMenuViewController = v5;

    [(SKUIMenuPopoverController *)self->_popoverMenuViewController setDelegate:self];
    [(SKUIFlexibleSegmentedControl *)self->_segmentedControl frameForSegmentWithIndex:[(SKUIFlexibleSegmentedControl *)self->_segmentedControl moreListIndex]];
    uint64_t v7 = self->_popoverMenuViewController;
    segmentedControl = self->_segmentedControl;
    -[SKUIMenuPopoverController presentFromRect:inView:permittedArrowDirections:animated:](v7, "presentFromRect:inView:permittedArrowDirections:animated:", segmentedControl, 15, 1);
  }
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (int64_t)defaultMaximumNumberOfVisibleItems
{
  return self->_defaultMaximumNumberOfVisibleItems;
}

- (double)desiredSegmentWidth
{
  return self->_desiredSegmentWidth;
}

- (SKUISegmentedControlViewElement)viewElement
{
  return self->_viewElement;
}

- (UIViewController)parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setParentViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_popoverMenuViewController, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_menuSheetViewController, 0);
  objc_storeStrong((id *)&self->_menuSheetCancelButtonItem, 0);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithViewElement:segmentedControl:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISegmentedControlViewElementController initWithViewElement:segmentedControl:]";
}

@end