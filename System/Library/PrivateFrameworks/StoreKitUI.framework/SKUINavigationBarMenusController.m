@interface SKUINavigationBarMenusController
- (SKUINavigationBarMenusController)initWithMenuViewElements:(id)a3;
- (id)_menuViewElementForView:(id)a3;
- (id)view;
- (void)_destroyPopover;
- (void)_menuButtonAction:(id)a3;
- (void)dealloc;
- (void)menuPopover:(id)a3 didSelectMenuItemAtIndex:(int64_t)a4;
- (void)menuPopover:(id)a3 willRepositionToRect:(CGRect *)a4 inView:(id *)a5;
- (void)reloadSectionViews;
- (void)willAppearInNavigationBar;
@end

@implementation SKUINavigationBarMenusController

- (SKUINavigationBarMenusController)initWithMenuViewElements:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUINavigationBarMenusController initWithMenuViewElements:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUINavigationBarMenusController;
  v5 = [(SKUINavigationBarMenusController *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    menuViewElements = v5->_menuViewElements;
    v5->_menuViewElements = (NSArray *)v6;
  }
  return v5;
}

- (void)dealloc
{
  [(SKUINavigationBarMenusView *)self->_menusView setButtonTarget:0 action:0];
  [(SKUIMenuPopoverController *)self->_popoverController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUINavigationBarMenusController;
  [(SKUINavigationBarSectionController *)&v3 dealloc];
}

- (void)reloadSectionViews
{
  objc_super v3 = [(SKUINavigationBarSectionController *)self context];
  [v3 maximumNavigationBarWidth];
  uint64_t v5 = (uint64_t)v4;

  menusView = self->_menusView;
  menuViewElements = self->_menuViewElements;
  v8 = [(SKUINavigationBarSectionController *)self viewLayoutContext];
  [(SKUINavigationBarMenusView *)menusView reloadWithMenus:menuViewElements width:v5 context:v8];

  v9.receiver = self;
  v9.super_class = (Class)SKUINavigationBarMenusController;
  [(SKUINavigationBarSectionController *)&v9 reloadSectionViews];
}

- (id)view
{
  menusView = self->_menusView;
  if (!menusView)
  {
    double v4 = objc_alloc_init(SKUINavigationBarMenusView);
    uint64_t v5 = self->_menusView;
    self->_menusView = v4;

    uint64_t v6 = self->_menusView;
    v7 = [MEMORY[0x1E4FB1618] clearColor];
    [(SKUIViewReuseView *)v6 setBackgroundColor:v7];

    [(SKUINavigationBarMenusView *)self->_menusView setButtonTarget:self action:sel__menuButtonAction_];
    -[SKUINavigationBarMenusView setContentInset:](self->_menusView, "setContentInset:", 1.0, 20.0, 0.0, 20.0);
    menusView = self->_menusView;
  }

  return menusView;
}

- (void)willAppearInNavigationBar
{
  objc_super v3 = [(SKUINavigationBarSectionController *)self viewLayoutContext];
  double v4 = [(SKUINavigationBarSectionController *)self context];
  [v4 maximumNavigationBarWidth];
  uint64_t v6 = (uint64_t)v5;

  +[SKUINavigationBarMenusView requestLayoutWithMenus:self->_menuViewElements width:v6 context:v3];
  v7.receiver = self;
  v7.super_class = (Class)SKUINavigationBarMenusController;
  [(SKUINavigationBarSectionController *)&v7 willAppearInNavigationBar];
}

- (void)menuPopover:(id)a3 didSelectMenuItemAtIndex:(int64_t)a4
{
  id v6 = [(SKUINavigationBarMenusController *)self _menuViewElementForView:self->_focusedMenuButton];
  [v6 dispatchEventOfType:2 forItemAtIndex:a4];
  [(SKUINavigationBarMenusController *)self _destroyPopover];
}

- (void)menuPopover:(id)a3 willRepositionToRect:(CGRect *)a4 inView:(id *)a5
{
  [(UIControl *)self->_focusedMenuButton frame];
  a4->origin.x = v6;
  a4->origin.y = v7;
  a4->size.width = v8;
  a4->size.height = v9;
}

- (void)_menuButtonAction:(id)a3
{
  id v14 = a3;
  popoverController = self->_popoverController;
  if (popoverController)
  {
    [(SKUIMenuPopoverController *)popoverController setDelegate:0];
    [(SKUIMenuPopoverController *)self->_popoverController dismissAnimated:1];
    focusedMenuButton = self->_focusedMenuButton;
    self->_focusedMenuButton = 0;

    CGFloat v7 = self->_popoverController;
    self->_popoverController = 0;
  }
  CGFloat v8 = [(SKUINavigationBarMenusController *)self _menuViewElementForView:v14];
  if (v8)
  {
    objc_storeStrong((id *)&self->_focusedMenuButton, a3);
    CGFloat v9 = [SKUIMenuPopoverController alloc];
    v10 = [v8 menuItemTitles];
    v11 = -[SKUIMenuPopoverController initWithMenuTitles:selectedIndex:](v9, "initWithMenuTitles:selectedIndex:", v10, [v8 selectedItemIndex]);
    v12 = self->_popoverController;
    self->_popoverController = v11;

    [(SKUIMenuPopoverController *)self->_popoverController setDelegate:self];
    v13 = self->_popoverController;
    [(UIControl *)self->_focusedMenuButton frame];
    -[SKUIMenuPopoverController presentFromRect:inView:permittedArrowDirections:animated:](v13, "presentFromRect:inView:permittedArrowDirections:animated:", self->_menusView, 15, 1);
  }
}

- (void)_destroyPopover
{
  [(SKUIMenuPopoverController *)self->_popoverController setDelegate:0];
  focusedMenuButton = self->_focusedMenuButton;
  self->_focusedMenuButton = 0;

  popoverController = self->_popoverController;
  self->_popoverController = 0;
}

- (id)_menuViewElementForView:(id)a3
{
  menusView = self->_menusView;
  id v5 = a3;
  CGFloat v6 = [(SKUIViewReuseView *)menusView allExistingViews];
  uint64_t v7 = [v6 indexOfObjectIdenticalTo:v5];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    CGFloat v8 = 0;
  }
  else
  {
    CGFloat v8 = [(NSArray *)self->_menuViewElements objectAtIndex:v7];
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popoverController, 0);
  objc_storeStrong((id *)&self->_menuViewElements, 0);
  objc_storeStrong((id *)&self->_menusView, 0);

  objc_storeStrong((id *)&self->_focusedMenuButton, 0);
}

- (void)initWithMenuViewElements:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUINavigationBarMenusController initWithMenuViewElements:]";
}

@end