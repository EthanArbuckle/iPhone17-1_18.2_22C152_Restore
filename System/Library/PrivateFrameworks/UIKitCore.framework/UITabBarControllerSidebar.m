@interface UITabBarControllerSidebar
- (BOOL)_isEditable;
- (BOOL)_isEditing;
- (BOOL)_isVisible;
- (BOOL)isHidden;
- (UIContentConfiguration)footerContentConfiguration;
- (UIContentConfiguration)headerContentConfiguration;
- (UIDeferredMenuElement)navigationOverflowItems;
- (UITabBarControllerSidebarDelegate)delegate;
- (UIView)bottomBarView;
- (_UITabGroup)_displayedGroup;
- (_UITabOutlineView)_outlineView;
- (id)_actualFooterContentConfiguration;
- (id)_actualHeaderContentConfiguration;
- (id)_contextMenuConfigurationForTab:(uint64_t)a1;
- (id)_customizationIdentifier;
- (id)_initWithTabBarController:(id)result;
- (id)_itemsForAddingToDragSession:(void *)a3 tab:;
- (id)_itemsForBeginningDragSession:(void *)a3 tab:;
- (id)_leadingSwipeActionsConfigurationForTab:(uint64_t)a1;
- (id)_sidebarItemForRequest:(uint64_t)a1;
- (id)_toolbarItems;
- (id)_trailingSwipeActionsConfigurationForTab:(uint64_t)a1;
- (id)_updatedSidebarItem:(id)a1;
- (id)_visualStyle;
- (int64_t)preferredLayout;
- (uint64_t)_isSidebarSupportedAndVisible;
- (uint64_t)_resolvedLayout;
- (uint64_t)_sidebarAction:(void *)a3 group:(void *)a4 operationForAcceptingItemsFromDropSession:;
- (void)_didEndDisplayingTab:(uint64_t)a1;
- (void)_editingStateDidChange:(uint64_t)a1;
- (void)_scrollToHeaderAnimated:(BOOL)a3;
- (void)_scrollToTab:(id)a3 atPosition:(unint64_t)a4 animated:(BOOL)a5;
- (void)_setCustomizationIdentifier:(id)a3;
- (void)_setDisplayedGroup:(id)a3;
- (void)_setEditable:(BOOL)a3;
- (void)_setEditing:(BOOL)a3;
- (void)_setHidden:(uint64_t)a3 source:;
- (void)_setSidebarViewDelegate:(uint64_t)a1;
- (void)_setToolbarItems:(id)a3;
- (void)_setVisible:(BOOL)a3;
- (void)_sidebarAction:(void *)a3 group:(void *)a4 acceptItemsFromDropSession:;
- (void)_tabModel;
- (void)_visibilityDidChangeForTabs:(uint64_t)a1;
- (void)_willDisplayTab:(uint64_t)a1;
- (void)reconfigureItemForTab:(id)a3;
- (void)scrollToTarget:(id)a3 animated:(BOOL)a4;
- (void)setBottomBarView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFooterContentConfiguration:(id)a3;
- (void)setHeaderContentConfiguration:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setNavigationOverflowItems:(id)a3;
- (void)setPreferredLayout:(int64_t)a3;
- (void)set_sidebarView:(id)a3;
@end

@implementation UITabBarControllerSidebar

- (id)_actualFooterContentConfiguration
{
  if (a1)
  {
    a1 = (id *)a1[8];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_initWithTabBarController:(id)result
{
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)UITabBarControllerSidebar;
    result = objc_msgSendSuper2(&v3, sel_init);
    if (result)
    {
      *((void *)result + 5) = a2;
      *((unsigned char *)result + 32) = 1;
    }
  }
  return result;
}

- (void)setPreferredLayout:(int64_t)a3
{
  uint64_t v5 = -[UITabBarControllerSidebar _resolvedLayout]((uint64_t)self);
  self->_preferredLayout = a3;
  if (v5 != -[UITabBarControllerSidebar _resolvedLayout]((uint64_t)self))
  {
    -[UITabBarControllerSidebar _visualStyle]((id **)self);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v6 sidebarLayoutDidChange];
  }
}

- (uint64_t)_resolvedLayout
{
  if (result)
  {
    uint64_t v1 = result;
    result = [(id)result preferredLayout];
    if (!result)
    {
      v2 = [*(id *)(v1 + 40) traitCollection];
      uint64_t v3 = [v2 userInterfaceIdiom];

      if ((unint64_t)(v3 - 5) >= 2) {
        return 1;
      }
      else {
        return 2;
      }
    }
  }
  return result;
}

- (int64_t)preferredLayout
{
  return self->_preferredLayout;
}

- (id)_visualStyle
{
  if (a1)
  {
    -[UITabBarController _visualStyle](a1[5]);
    a1 = (id **)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_setEditable:(BOOL)a3
{
  BOOL v3 = a3;
  -[UITabBarControllerSidebar _tabModel](self);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setEditable:v3];
}

- (void)_tabModel
{
  if (a1)
  {
    v2 = (void *)a1[5];
    if (v2) {
      v2 = (void *)v2[145];
    }
    a1 = v2;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(unsigned char *)&self->_delegateImplements = *(unsigned char *)&self->_delegateImplements & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v5 = 2;
    }
    else {
      char v5 = 0;
    }
    *(unsigned char *)&self->_delegateImplements = *(unsigned char *)&self->_delegateImplements & 0xFD | v5;
    if (objc_opt_respondsToSelector()) {
      char v6 = 4;
    }
    else {
      char v6 = 0;
    }
    *(unsigned char *)&self->_delegateImplements = *(unsigned char *)&self->_delegateImplements & 0xFB | v6;
    if (objc_opt_respondsToSelector()) {
      char v7 = 8;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)&self->_delegateImplements = *(unsigned char *)&self->_delegateImplements & 0xF7 | v7;
    if (objc_opt_respondsToSelector()) {
      char v8 = 16;
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)&self->_delegateImplements = *(unsigned char *)&self->_delegateImplements & 0xEF | v8;
    if (objc_opt_respondsToSelector()) {
      char v9 = 32;
    }
    else {
      char v9 = 0;
    }
    *(unsigned char *)&self->_delegateImplements = *(unsigned char *)&self->_delegateImplements & 0xDF | v9;
    if (objc_opt_respondsToSelector()) {
      char v10 = 64;
    }
    else {
      char v10 = 0;
    }
    *(unsigned char *)&self->_delegateImplements = *(unsigned char *)&self->_delegateImplements & 0xBF | v10;
    if (objc_opt_respondsToSelector()) {
      char v11 = 0x80;
    }
    else {
      char v11 = 0;
    }
    *(unsigned char *)&self->_delegateImplements = v11 & 0x80 | *(unsigned char *)&self->_delegateImplements & 0x7F;
    *(_WORD *)&self->_uip_delegateImplements = *(_WORD *)&self->_uip_delegateImplements & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      __int16 v12 = 2;
    }
    else {
      __int16 v12 = 0;
    }
    *(_WORD *)&self->_uip_delegateImplements = *(_WORD *)&self->_uip_delegateImplements & 0xFFFD | v12;
    if (objc_opt_respondsToSelector()) {
      __int16 v13 = 4;
    }
    else {
      __int16 v13 = 0;
    }
    *(_WORD *)&self->_uip_delegateImplements = *(_WORD *)&self->_uip_delegateImplements & 0xFFFB | v13;
    if (objc_opt_respondsToSelector()) {
      __int16 v14 = 8;
    }
    else {
      __int16 v14 = 0;
    }
    *(_WORD *)&self->_uip_delegateImplements = *(_WORD *)&self->_uip_delegateImplements & 0xFFF7 | v14;
    if (objc_opt_respondsToSelector()) {
      __int16 v15 = 16;
    }
    else {
      __int16 v15 = 0;
    }
    *(_WORD *)&self->_uip_delegateImplements = *(_WORD *)&self->_uip_delegateImplements & 0xFFEF | v15;
    if (objc_opt_respondsToSelector()) {
      __int16 v16 = 32;
    }
    else {
      __int16 v16 = 0;
    }
    *(_WORD *)&self->_uip_delegateImplements = *(_WORD *)&self->_uip_delegateImplements & 0xFFDF | v16;
    if (objc_opt_respondsToSelector()) {
      __int16 v17 = 64;
    }
    else {
      __int16 v17 = 0;
    }
    *(_WORD *)&self->_uip_delegateImplements = *(_WORD *)&self->_uip_delegateImplements & 0xFFBF | v17;
    if (objc_opt_respondsToSelector()) {
      __int16 v18 = 128;
    }
    else {
      __int16 v18 = 0;
    }
    *(_WORD *)&self->_uip_delegateImplements = *(_WORD *)&self->_uip_delegateImplements & 0xFF7F | v18;
    if (objc_opt_respondsToSelector()) {
      __int16 v19 = 256;
    }
    else {
      __int16 v19 = 0;
    }
    *(_WORD *)&self->_uip_delegateImplements = *(_WORD *)&self->_uip_delegateImplements & 0xFEFF | v19;
    if (objc_opt_respondsToSelector()) {
      __int16 v20 = 512;
    }
    else {
      __int16 v20 = 0;
    }
    *(_WORD *)&self->_uip_delegateImplements = *(_WORD *)&self->_uip_delegateImplements & 0xFDFF | v20;
    if (objc_opt_respondsToSelector()) {
      __int16 v21 = 1024;
    }
    else {
      __int16 v21 = 0;
    }
    *(_WORD *)&self->_uip_delegateImplements = *(_WORD *)&self->_uip_delegateImplements & 0xFBFF | v21;
    if (objc_opt_respondsToSelector()) {
      __int16 v22 = 2048;
    }
    else {
      __int16 v22 = 0;
    }
    *(_WORD *)&self->_uip_delegateImplements = *(_WORD *)&self->_uip_delegateImplements & 0xF7FF | v22;
    if (objc_opt_respondsToSelector()) {
      __int16 v23 = 4096;
    }
    else {
      __int16 v23 = 0;
    }
    *(_WORD *)&self->_uip_delegateImplements = *(_WORD *)&self->_uip_delegateImplements & 0xEFFF | v23;
    if (objc_opt_respondsToSelector()) {
      __int16 v24 = 0x2000;
    }
    else {
      __int16 v24 = 0;
    }
    *(_WORD *)&self->_uip_delegateImplements = *(_WORD *)&self->_uip_delegateImplements & 0xDFFF | v24;
  }
}

- (_UITabOutlineView)_outlineView
{
  if (!self->_outlineView)
  {
    BOOL v3 = -[UITabBarController _visualStyle]((id *)&self->_tabBarController->super.super.super.isa);
    if (![v3 canDisplaySidebar])
    {
LABEL_10:

      goto LABEL_11;
    }
    int v4 = _UITabBarControllerWantsFloatingTabBar();

    if (v4)
    {
      char v5 = (_UITabOutlineView *)-[_UITabOutlineView initWithSidebar:]((id *)[_UITabOutlineView alloc], self);
      outlineView = self->_outlineView;
      self->_outlineView = v5;

      id WeakRetained = objc_loadWeakRetained((id *)&self->__sidebarViewDelegate);
      char v8 = self->_outlineView;
      if (v8) {
        objc_storeWeak((id *)&v8->_delegate, WeakRetained);
      }

      char v9 = [(UIViewController *)self->_tabBarController title];
      -[_UITabOutlineView setTitle:]((id *)&self->_outlineView->super.super.super.isa, v9);

      if (self->_bottomBarView) {
        -[_UITabOutlineView updateBottomBarView]((uint64_t)self->_outlineView);
      }
      if (self->__overrideBackgroundEffect)
      {
        BOOL v3 = [(UITabBarControllerSidebar *)self _outlineView];
        -[_UITabOutlineView setOverrideBackgroundEffect:]((id *)v3, self->__overrideBackgroundEffect);
        goto LABEL_10;
      }
    }
  }
LABEL_11:
  char v10 = self->_outlineView;
  return v10;
}

- (void)setHidden:(BOOL)a3
{
}

- (void)_setHidden:(uint64_t)a3 source:
{
  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 32) != a2)
    {
      *(unsigned char *)(a1 + 32) = a2;
      *(unsigned char *)(a1 + 16) = *(unsigned char *)(a1 + 16) & 0xFD | (2 * (a3 != 0));
      char v5 = -[UITabBarControllerSidebar _visualStyle]((id **)a1);
      int v6 = [v5 canDisplaySidebar];

      if (v6)
      {
        id v11 = (id)objc_opt_new();
        if (*(unsigned char *)(a1 + 8))
        {
          char v7 = [(id)a1 delegate];
          [v7 tabBarController:*(void *)(a1 + 40) sidebarVisibilityWillChange:a1 animator:v11];
        }
        char v8 = -[UITabBarControllerSidebar _visualStyle]((id **)a1);
        [v8 sidebarVisibilityDidChangeWithAnimator:v11];

        if (*(unsigned char *)(a1 + 8) & 1) == 0 && (*(_WORD *)(a1 + 12))
        {
          char v9 = [(id)a1 _delegate];
          [v9 _tabBarController:*(void *)(a1 + 40) sidebarVisibilityDidChange:a1];
        }
        if (a3)
        {
          char v10 = +[_UITabAnalytics sharedInstance]();
          -[_UITabAnalytics userDidToggleSidebar:source:]((uint64_t)v10, *(void **)(a1 + 40), a3);
        }
      }
    }
  }
}

- (UIContentConfiguration)headerContentConfiguration
{
  v2 = (void *)[(UIContentConfiguration *)self->_headerContentConfiguration copyWithZone:0];
  return (UIContentConfiguration *)v2;
}

- (void)setHeaderContentConfiguration:(id)a3
{
  id v4 = a3;
  headerContentConfiguration = self->_headerContentConfiguration;
  __int16 v12 = (UIContentConfiguration *)v4;
  int v6 = headerContentConfiguration;
  char v7 = v12;
  char v8 = (id *)v12;
  if (v6 == v12) {
    goto LABEL_8;
  }
  if (!v12 || !v6)
  {

    goto LABEL_7;
  }
  char v9 = [(UIContentConfiguration *)v12 isEqual:v6];

  if ((v9 & 1) == 0)
  {
LABEL_7:
    char v7 = self->_headerContentConfiguration;
    char v10 = (UIContentConfiguration *)[(UIContentConfiguration *)v12 copyWithZone:0];
    id v11 = self->_headerContentConfiguration;
    self->_headerContentConfiguration = v10;

    char v8 = [(UITabBarControllerSidebar *)self _outlineView];
    -[_UITabOutlineView headerContentConfigurationDidChange:](v8, (uint64_t)v7);
LABEL_8:
  }
}

- (UIContentConfiguration)footerContentConfiguration
{
  v2 = (void *)[(UIContentConfiguration *)self->_footerContentConfiguration copyWithZone:0];
  return (UIContentConfiguration *)v2;
}

- (void)setFooterContentConfiguration:(id)a3
{
  id v4 = a3;
  footerContentConfiguration = self->_footerContentConfiguration;
  __int16 v12 = (UIContentConfiguration *)v4;
  int v6 = footerContentConfiguration;
  char v7 = v12;
  char v8 = (id *)v12;
  if (v6 == v12) {
    goto LABEL_8;
  }
  if (!v12 || !v6)
  {

    goto LABEL_7;
  }
  char v9 = [(UIContentConfiguration *)v12 isEqual:v6];

  if ((v9 & 1) == 0)
  {
LABEL_7:
    char v7 = self->_footerContentConfiguration;
    char v10 = (UIContentConfiguration *)[(UIContentConfiguration *)v12 copyWithZone:0];
    id v11 = self->_footerContentConfiguration;
    self->_footerContentConfiguration = v10;

    char v8 = [(UITabBarControllerSidebar *)self _outlineView];
    -[_UITabOutlineView footerContentConfigurationDidChange:](v8, (uint64_t)v7);
LABEL_8:
  }
}

- (UIView)bottomBarView
{
  if (*(unsigned char *)&self->_sidebarFlags) {
    v2 = self->_bottomBarView;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setBottomBarView:(id)a3
{
  int v6 = (UIView *)a3;
  char v10 = v6;
  if (v6)
  {
    NSUInteger v7 = [(NSArray *)self->_toolbarItems count];
    int v6 = v10;
    if (v7)
    {
      char v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"UITabBarControllerSidebar.m" lineNumber:261 description:@"Setting a bottomBarView alongside _toolbarItems is not suppported"];

      int v6 = v10;
    }
  }
  if (self->_bottomBarView != v6)
  {
    *(unsigned char *)&self->_sidebarFlags = *(unsigned char *)&self->_sidebarFlags & 0xFE | (v6 != 0);
    objc_storeStrong((id *)&self->_bottomBarView, a3);
    char v8 = [(UITabBarControllerSidebar *)self _outlineView];
    -[_UITabOutlineView updateBottomBarView]((uint64_t)v8);

    int v6 = v10;
  }
}

- (id)_actualHeaderContentConfiguration
{
  if (a1)
  {
    a1 = (id *)a1[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)reconfigureItemForTab:(id)a3
{
  id v4 = a3;
  id v5 = [(UITabBarControllerSidebar *)self _outlineView];
  -[_UITabOutlineView reconfigureItemForTab:](v5, (uint64_t)v4);
}

- (void)scrollToTarget:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  NSUInteger v7 = [(UITabBarControllerSidebar *)self _outlineView];
  -[_UITabOutlineView scrollToTarget:animated:](v7, v6, v4);
}

- (void)setNavigationOverflowItems:(id)a3
{
  id v5 = (UIDeferredMenuElement *)a3;
  if (self->_navigationOverflowItems != v5)
  {
    char v8 = v5;
    objc_storeStrong((id *)&self->_navigationOverflowItems, a3);
    id v6 = [(UITabBarControllerSidebar *)self _outlineView];
    NSUInteger v7 = v6;
    if (v6) {
      [v6 _updateEditBarButtonItem];
    }

    id v5 = v8;
  }
}

- (void)_setSidebarViewDelegate:(uint64_t)a1
{
  if (a1)
  {
    BOOL v3 = (id *)(a1 + 104);
    id obj = a2;
    objc_storeWeak(v3, obj);
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4) {
      objc_storeWeak((id *)(v4 + 440), obj);
    }
  }
}

- (uint64_t)_isSidebarSupportedAndVisible
{
  if (!a1 || ([a1 isHidden] & 1) != 0) {
    return 0;
  }
  BOOL v3 = -[UITabBarControllerSidebar _visualStyle]((id **)a1);
  uint64_t v4 = [v3 canDisplaySidebar];

  return v4;
}

- (void)_willDisplayTab:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    if ((*(unsigned char *)(a1 + 8) & 0x40) != 0)
    {
      BOOL v3 = [(id)a1 delegate];
      [v3 tabBarController:*(void *)(a1 + 40) sidebar:a1 willBeginDisplayingTab:v4];
    }
    else
    {
      if ((*(_WORD *)(a1 + 12) & 0x1000) == 0) {
        goto LABEL_7;
      }
      BOOL v3 = [(id)a1 _delegate];
      [v3 _tabBarController:*(void *)(a1 + 40) sidebar:a1 willBeginDisplayingTab:v4];
    }
  }
LABEL_7:
}

- (void)_didEndDisplayingTab:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    if (*(char *)(a1 + 8) < 0)
    {
      BOOL v3 = [(id)a1 delegate];
      [v3 tabBarController:*(void *)(a1 + 40) sidebar:a1 didEndDisplayingTab:v4];
    }
    else
    {
      if ((*(_WORD *)(a1 + 12) & 0x2000) == 0) {
        goto LABEL_7;
      }
      BOOL v3 = [(id)a1 _delegate];
      [v3 _tabBarController:*(void *)(a1 + 40) sidebar:a1 didEndDisplayingTab:v4];
    }
  }
LABEL_7:
}

- (id)_sidebarItemForRequest:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if ((*(unsigned char *)(a1 + 8) & 2) != 0)
    {
      id v5 = [(id)a1 delegate];
      id v4 = [v5 tabBarController:*(void *)(a1 + 40) sidebar:a1 itemForRequest:v3];
    }
    else
    {
      if ((*(_WORD *)(a1 + 12) & 8) == 0)
      {
        id v4 = +[UITabSidebarItem itemFromRequest:v3];
        goto LABEL_8;
      }
      id v4 = +[UITabSidebarItem itemFromRequest:v3];
      id v5 = [(id)a1 _delegate];
      [v5 _tabBarController:*(void *)(a1 + 40) sidebar:a1 configureItem:v4];
    }
  }
  else
  {
    id v4 = 0;
  }
LABEL_8:

  return v4;
}

- (id)_updatedSidebarItem:(id)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if ((*((unsigned char *)a1 + 8) & 4) != 0)
    {
      id v5 = (void *)[v3 copy];
      id v6 = [a1 delegate];
      [v6 tabBarController:*((void *)a1 + 5) sidebar:a1 updateItem:v5];
    }
    else
    {
      if ((*((_WORD *)a1 + 6) & 0x10) == 0)
      {
        id v5 = 0;
LABEL_8:
        if (v5) {
          NSUInteger v7 = v5;
        }
        else {
          NSUInteger v7 = v4;
        }
        a1 = v7;

        goto LABEL_12;
      }
      id v5 = (void *)[v3 copy];
      id v6 = [a1 _delegate];
      [v6 _tabBarController:*((void *)a1 + 5) sidebar:a1 updateItem:v5];
    }

    goto LABEL_8;
  }
LABEL_12:

  return a1;
}

- (id)_leadingSwipeActionsConfigurationForTab:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      char v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel__leadingSwipeActionsConfigurationForTab_, a1, @"UITabBarControllerSidebar.m", 371, @"Invalid parameter not satisfying: %@", @"tab != nil" object file lineNumber description];
    }
    if ((*(unsigned char *)(a1 + 8) & 8) != 0)
    {
      id v5 = [(id)a1 _delegate];
      uint64_t v6 = [v5 tabBarController:*(void *)(a1 + 40) sidebar:a1 leadingSwipeActionsConfigurationForTab:v4];
    }
    else
    {
      if ((*(_WORD *)(a1 + 12) & 0x20) == 0)
      {
        a1 = 0;
        goto LABEL_10;
      }
      id v5 = [(id)a1 _delegate];
      uint64_t v6 = [v5 _tabBarController:*(void *)(a1 + 40) sidebar:a1 leadingSwipeActionsConfigurationForTab:v4];
    }
    a1 = v6;
  }
LABEL_10:

  return (id)a1;
}

- (id)_trailingSwipeActionsConfigurationForTab:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      char v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel__trailingSwipeActionsConfigurationForTab_, a1, @"UITabBarControllerSidebar.m", 383, @"Invalid parameter not satisfying: %@", @"tab != nil" object file lineNumber description];
    }
    if ((*(unsigned char *)(a1 + 8) & 0x10) != 0)
    {
      id v5 = [(id)a1 _delegate];
      uint64_t v6 = [v5 tabBarController:*(void *)(a1 + 40) sidebar:a1 trailingSwipeActionsConfigurationForTab:v4];
    }
    else
    {
      if ((*(_WORD *)(a1 + 12) & 0x40) == 0)
      {
        a1 = 0;
        goto LABEL_10;
      }
      id v5 = [(id)a1 _delegate];
      uint64_t v6 = [v5 _tabBarController:*(void *)(a1 + 40) sidebar:a1 trailingSwipeActionsConfigurationForTab:v4];
    }
    a1 = v6;
  }
LABEL_10:

  return (id)a1;
}

- (id)_contextMenuConfigurationForTab:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if ((*(unsigned char *)(a1 + 8) & 0x20) != 0)
    {
      id v4 = [(id)a1 delegate];
      uint64_t v5 = [v4 tabBarController:*(void *)(a1 + 40) sidebar:a1 contextMenuConfigurationForTab:v3];
    }
    else
    {
      if ((*(_WORD *)(a1 + 12) & 0x80) == 0)
      {
        a1 = 0;
        goto LABEL_8;
      }
      id v4 = [(id)a1 _delegate];
      uint64_t v5 = [v4 _tabBarController:*(void *)(a1 + 40) sidebar:a1 contextMenuConfigurationForTab:v3];
    }
    a1 = v5;
  }
LABEL_8:

  return (id)a1;
}

- (id)_itemsForBeginningDragSession:(void *)a3 tab:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if ((*(_WORD *)(a1 + 12) & 0x100) != 0)
    {
      NSUInteger v7 = [(id)a1 _delegate];
      a1 = [v7 _tabBarController:*(void *)(a1 + 40) sidebar:a1 itemsForBeginningDragSession:v5 tab:v6];
    }
    else
    {
      a1 = MEMORY[0x1E4F1CBF0];
    }
  }

  return (id)a1;
}

- (id)_itemsForAddingToDragSession:(void *)a3 tab:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if ((*(_WORD *)(a1 + 12) & 0x200) != 0)
    {
      NSUInteger v7 = [(id)a1 _delegate];
      a1 = [v7 _tabBarController:*(void *)(a1 + 40) sidebar:a1 itemsForAddingToDragSession:v5 tab:v6];
    }
    else
    {
      a1 = MEMORY[0x1E4F1CBF0];
    }
  }

  return (id)a1;
}

- (uint64_t)_sidebarAction:(void *)a3 group:(void *)a4 operationForAcceptingItemsFromDropSession:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    if ((*(_WORD *)(a1 + 12) & 0x400) != 0)
    {
      char v10 = [(id)a1 _delegate];
      a1 = [v10 _tabBarController:*(void *)(a1 + 40) sidebar:a1 sidebarAction:v7 group:v8 operationForAcceptingItemsFromDropSession:v9];
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (void)_sidebarAction:(void *)a3 group:(void *)a4 acceptItemsFromDropSession:
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1 && (*(_WORD *)(a1 + 12) & 0x800) != 0)
  {
    id v9 = [(id)a1 _delegate];
    [v9 _tabBarController:*(void *)(a1 + 40) sidebar:a1 sidebarAction:v10 group:v7 acceptItemsFromDropSession:v8];
  }
}

- (BOOL)_isVisible
{
  return ![(UITabBarControllerSidebar *)self isHidden];
}

- (void)_setVisible:(BOOL)a3
{
}

- (void)_scrollToHeaderAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[UITabSidebarScrollTarget targetForHeader];
  [(UITabBarControllerSidebar *)self scrollToTarget:v5 animated:v3];
}

- (void)_scrollToTab:(id)a3 atPosition:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  +[UITabSidebarScrollTarget targetForTab:](UITabSidebarScrollTarget, "targetForTab:", a3, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(UITabBarControllerSidebar *)self scrollToTarget:v7 animated:v5];
}

- (id)_customizationIdentifier
{
  if (self) {
    self = (UITabBarControllerSidebar *)self->_tabBarController;
  }
  return (id)[(UITabBarControllerSidebar *)self customizationIdentifier];
}

- (void)_setCustomizationIdentifier:(id)a3
{
  if (self) {
    self = (UITabBarControllerSidebar *)self->_tabBarController;
  }
  [(UITabBarControllerSidebar *)self setCustomizationIdentifier:a3];
}

- (BOOL)_isEditing
{
  if (self) {
    self = (UITabBarControllerSidebar *)self->_tabBarController;
  }
  return [(UITabBarControllerSidebar *)self isEditing];
}

- (void)_setEditing:(BOOL)a3
{
  if (self) {
    self = (UITabBarControllerSidebar *)self->_tabBarController;
  }
  [(UITabBarControllerSidebar *)self setEditing:a3];
}

- (void)_editingStateDidChange:(uint64_t)a1
{
  if (a1 && (*(_WORD *)(a1 + 12) & 2) != 0)
  {
    id v4 = [(id)a1 _delegate];
    [v4 _tabbarController:*(void *)(a1 + 40) sidebar:a1 editingStateDidChange:a2];
  }
}

- (void)_visibilityDidChangeForTabs:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && (*(_WORD *)(a1 + 12) & 4) != 0)
  {
    id v5 = v3;
    id v4 = [(id)a1 _delegate];
    [v4 _tabBarController:*(void *)(a1 + 40) sidebar:a1 visibilityDidChangeForTabs:v5];

    id v3 = v5;
  }
}

- (id)_toolbarItems
{
  return self->_toolbarItems;
}

- (void)_setToolbarItems:(id)a3
{
  id v5 = a3;
  toolbarItems = self->_toolbarItems;
  __int16 v19 = (NSArray *)v5;
  id v7 = toolbarItems;
  if (v7 == v19)
  {

    id v10 = v19;
LABEL_18:

    id v9 = v19;
    goto LABEL_19;
  }
  if (!v19 || !v7)
  {

    id v9 = v19;
LABEL_8:
    id v11 = (NSArray *)[(NSArray *)v9 copy];
    __int16 v12 = self->_toolbarItems;
    self->_toolbarItems = v11;

    if ([(NSArray *)v19 count] && (*(unsigned char *)&self->_sidebarFlags & 1) != 0)
    {
      __int16 v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2 object:self file:@"UITabBarControllerSidebar.m" lineNumber:543 description:@"Setting _toolbarItems alongside a _bottomBarView is not supported"];
    }
    if ([(NSArray *)v19 count])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        __int16 v13 = self->_bottomBarView;
      }
      else
      {
        __int16 v14 = [UIToolbar alloc];
        __int16 v15 = [(UITabBarControllerSidebar *)self _outlineView];
        [v15 frame];
        __int16 v13 = -[UIToolbar initWithFrame:](v14, "initWithFrame:", 0.0, 0.0);
      }
      [(UIView *)v13 setItems:v19];
    }
    else
    {
      __int16 v13 = 0;
    }
    bottomBarView = self->_bottomBarView;
    self->_bottomBarView = v13;
    __int16 v17 = v13;

    id v10 = [(UITabBarControllerSidebar *)self _outlineView];

    -[_UITabOutlineView updateBottomBarView]((uint64_t)v10);
    goto LABEL_18;
  }
  char v8 = [(NSArray *)v19 isEqual:v7];

  id v9 = v19;
  if ((v8 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_19:
}

- (BOOL)_isEditable
{
  v2 = -[UITabBarControllerSidebar _tabModel](self);
  char v3 = [v2 isEditable];

  return v3;
}

- (_UITabGroup)_displayedGroup
{
  v2 = [(UITabBarControllerSidebar *)self _outlineView];
  char v3 = v2;
  if (v2) {
    v2 = (void *)v2[57];
  }
  id v4 = v2;

  return v4;
}

- (void)_setDisplayedGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(UITabBarControllerSidebar *)self _outlineView];
  -[_UITabOutlineView setDisplayedGroup:]((uint64_t)v5, v4);
}

- (UITabBarControllerSidebarDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UITabBarControllerSidebarDelegate *)WeakRetained;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)set_sidebarView:(id)a3
{
}

- (UIDeferredMenuElement)navigationOverflowItems
{
  return self->_navigationOverflowItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationOverflowItems, 0);
  objc_storeStrong((id *)&self->__sidebarView, 0);
  objc_storeStrong((id *)&self->__overrideBackgroundEffect, 0);
  objc_destroyWeak((id *)&self->__sidebarViewDelegate);
  objc_storeStrong((id *)&self->__activeTransaction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bottomBarView, 0);
  objc_storeStrong((id *)&self->_footerContentConfiguration, 0);
  objc_storeStrong((id *)&self->_headerContentConfiguration, 0);
  objc_storeStrong((id *)&self->_outlineView, 0);
  objc_storeStrong((id *)&self->_toolbarItems, 0);
}

@end