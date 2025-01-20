@interface SUNativeScriptMenuViewController
- (BOOL)isMenuItemEnabledAtIndex:(int64_t)a3;
- (NSArray)menuItems;
- (SUScriptFunction)action;
- (id)copyScriptViewController;
- (id)titleOfMenuItemAtIndex:(int64_t)a3;
- (int64_t)numberOfMenuItems;
- (void)dealloc;
- (void)performActionForMenuItemAtIndex:(int64_t)a3;
- (void)setAction:(id)a3;
- (void)setMenuItems:(id)a3;
@end

@implementation SUNativeScriptMenuViewController

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUNativeScriptMenuViewController;
  [(SUMenuViewController *)&v3 dealloc];
}

- (void)setMenuItems:(id)a3
{
  menuItems = self->_menuItems;
  if (menuItems != a3)
  {

    self->_menuItems = (NSArray *)a3;
    [(SUMenuViewController *)self reload];
  }
}

- (id)copyScriptViewController
{
  objc_super v3 = objc_alloc_init(SUScriptMenuViewController);
  [(SUScriptViewController *)v3 setNativeViewController:self];
  return v3;
}

- (BOOL)isMenuItemEnabledAtIndex:(int64_t)a3
{
  id v3 = [(NSArray *)self->_menuItems objectAtIndex:a3];

  return [v3 enabled];
}

- (int64_t)numberOfMenuItems
{
  return [(NSArray *)self->_menuItems count];
}

- (void)performActionForMenuItemAtIndex:(int64_t)a3
{
  if (self->_action)
  {
    id v4 = [(NSArray *)self->_menuItems objectAtIndex:a3];
    action = self->_action;
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v4, 0);
    [(SUScriptFunction *)action callWithArguments:v6];
  }
  else
  {
    [(UIViewController *)self dismissAnimated:1];
  }
}

- (id)titleOfMenuItemAtIndex:(int64_t)a3
{
  id v3 = [(NSArray *)self->_menuItems objectAtIndex:a3];

  return (id)[v3 title];
}

- (SUScriptFunction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (NSArray)menuItems
{
  return self->_menuItems;
}

@end