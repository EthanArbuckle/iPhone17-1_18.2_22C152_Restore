@interface SUNavigationMenuViewController
- (SUNavigationMenu)navigationMenu;
- (SUNavigationMenuViewController)init;
- (SUNavigationMenuViewController)initWithNavigationMenu:(id)a3;
- (id)titleOfMenuItemAtIndex:(int64_t)a3;
- (int64_t)numberOfMenuItems;
- (void)_cancelAction:(id)a3;
- (void)_protocolButtonAction:(id)a3;
- (void)dealloc;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SUNavigationMenuViewController

- (SUNavigationMenuViewController)init
{
  return [(SUNavigationMenuViewController *)self initWithNavigationMenu:0];
}

- (SUNavigationMenuViewController)initWithNavigationMenu:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUNavigationMenuViewController;
  v4 = [(SUMenuViewController *)&v7 init];
  if (v4)
  {
    v5 = (SUNavigationMenu *)a3;
    v4->_navigationMenu = v5;
    [(SUMenuViewController *)v4 setSelectedIndex:[(SUNavigationMenu *)v5 initialSelectedIndex]];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUNavigationMenuViewController;
  [(SUMenuViewController *)&v3 dealloc];
}

- (int64_t)numberOfMenuItems
{
  v2 = [(SUNavigationMenu *)self->_navigationMenu menuItems];

  return [(NSArray *)v2 count];
}

- (id)titleOfMenuItemAtIndex:(int64_t)a3
{
  id v3 = [(NSArray *)[(SUNavigationMenu *)self->_navigationMenu menuItems] objectAtIndex:a3];

  return (id)[v3 title];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SUClientInterface *)[(SUViewController *)self clientInterface] appearance];
  v6 = [(SUViewController *)self navigationItem];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") != 1)
  {
    objc_super v7 = [(SUNavigationMenu *)self->_navigationMenu cancelTitle];
    if (![(NSString *)v7 length]) {
      objc_super v7 = (NSString *)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"CANCEL", &stru_26DB8C5F8, 0);
    }
    v8 = [[SUBarButtonItem alloc] initWithTitle:v7 style:0 target:self action:sel__cancelAction_];
    [(SUUIAppearance *)v5 styleBarButtonItem:v8];
    [(SUNavigationItem *)v6 setLeftBarButtonItem:v8];
  }
  v9 = [(SUNavigationMenu *)self->_navigationMenu openTitle];
  if (!v9) {
    v9 = [(SUNavigationMenu *)self->_navigationMenu closedTitle];
  }
  [(SUViewController *)self setTitle:v9];
  id v10 = [(SUNavigationMenu *)self->_navigationMenu navigationButtonForLocation:@"left"];
  id v11 = [(SUNavigationMenu *)self->_navigationMenu navigationButtonForLocation:@"right"];
  if (v10)
  {
    if ([(SUNavigationItem *)v6 leftBarButtonItem])
    {
      if (!v11) {
        id v11 = v10;
      }
      goto LABEL_14;
    }
    v12 = -[SUBarButtonItem initWithTitle:style:target:action:]([SUBarButtonItem alloc], "initWithTitle:style:target:action:", [v10 buttonTitle], 0, self, sel__protocolButtonAction_);
    [(SUUIAppearance *)v5 styleBarButtonItem:v12];
    [(SUNavigationItem *)v6 setLeftBarButtonItem:v12];
  }
  if (v11)
  {
LABEL_14:
    v13 = -[SUBarButtonItem initWithTitle:style:target:action:]([SUBarButtonItem alloc], "initWithTitle:style:target:action:", [v11 buttonTitle], 0, self, sel__protocolButtonAction_);
    [(SUUIAppearance *)v5 styleBarButtonItem:v13];
    [(SUNavigationItem *)v6 setRightBarButtonItem:v13];
  }
  v14.receiver = self;
  v14.super_class = (Class)SUNavigationMenuViewController;
  [(SUViewController *)&v14 viewWillAppear:v3];
}

- (void)_cancelAction:(id)a3
{
  if (![(SUMenuViewController *)self _sendDidCancel])
  {
    [(UIViewController *)self dismissAnimated:1];
  }
}

- (void)_protocolButtonAction:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return;
  }
  id v6 = (id)[(SUNavigationItem *)[(SUViewController *)self navigationItem] leftBarButtonItem];
  navigationMenu = self->_navigationMenu;
  if (v6 == a3) {
    goto LABEL_5;
  }
  uint64_t v5 = [(SUNavigationMenu *)navigationMenu navigationButtonForLocation:@"right"];
  if (!v5)
  {
    navigationMenu = self->_navigationMenu;
LABEL_5:
    uint64_t v5 = [(SUNavigationMenu *)navigationMenu navigationButtonForLocation:@"left", v5];
    if (!v5) {
      return;
    }
  }
  [(SUMenuViewControllerDelegate *)self->super._delegate menuViewController:self didTapButton:v5];
  v8 = self;

  v9 = v8;
}

- (SUNavigationMenu)navigationMenu
{
  return self->_navigationMenu;
}

@end