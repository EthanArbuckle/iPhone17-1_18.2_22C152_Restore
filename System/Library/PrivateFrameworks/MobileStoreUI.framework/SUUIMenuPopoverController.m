@interface SUUIMenuPopoverController
- (NSArray)menuTitles;
- (SUUIMenuPopoverController)initWithMenuTitles:(id)a3;
- (SUUIMenuPopoverController)initWithMenuTitles:(id)a3 selectedIndex:(int64_t)a4;
- (SUUIMenuPopoverDelegate)delegate;
- (void)_destroyPopoverController;
- (void)dealloc;
- (void)dismissAnimated:(BOOL)a3;
- (void)menuViewController:(id)a3 didSelectItemAtIndex:(int64_t)a4;
- (void)popoverController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5;
- (void)popoverControllerDidDismissPopover:(id)a3;
- (void)presentFromRect:(CGRect)a3 inView:(id)a4 permittedArrowDirections:(unint64_t)a5 animated:(BOOL)a6;
- (void)setDelegate:(id)a3;
@end

@implementation SUUIMenuPopoverController

- (SUUIMenuPopoverController)initWithMenuTitles:(id)a3
{
  return [(SUUIMenuPopoverController *)self initWithMenuTitles:a3 selectedIndex:-1];
}

- (SUUIMenuPopoverController)initWithMenuTitles:(id)a3 selectedIndex:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUIMenuPopoverController;
  v7 = [(SUUIMenuPopoverController *)&v11 init];
  if (v7)
  {
    v8 = [[SUUIMenuViewController alloc] initWithMenuTitles:v6];
    menuViewController = v7->_menuViewController;
    v7->_menuViewController = v8;

    [(SUUIMenuViewController *)v7->_menuViewController setDelegate:v7];
    [(SUUIMenuViewController *)v7->_menuViewController setIndexOfCheckedTitle:a4];
  }

  return v7;
}

- (void)dealloc
{
  [(SUUIMenuViewController *)self->_menuViewController setDelegate:0];
  [(UIPopoverController *)self->_popoverController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUIMenuPopoverController;
  [(SUUIMenuPopoverController *)&v3 dealloc];
}

- (void)dismissAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = self->_popoverController;
  [(SUUIMenuPopoverController *)self _destroyPopoverController];
  [(UIPopoverController *)v5 dismissPopoverAnimated:v3];
}

- (NSArray)menuTitles
{
  return [(SUUIMenuViewController *)self->_menuViewController menuTitles];
}

- (void)presentFromRect:(CGRect)a3 inView:(id)a4 permittedArrowDirections:(unint64_t)a5 animated:(BOOL)a6
{
  if (!self->_popoverController)
  {
    BOOL v6 = a6;
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    id v17 = a4;
    v13 = [(SUUIMenuPopoverController *)self menuTitles];
    double v14 = (float)((float)(unint64_t)[v13 count] * 45.0);

    -[SUUIMenuViewController setPreferredContentSize:](self->_menuViewController, "setPreferredContentSize:", 320.0, v14);
    v15 = (UIPopoverController *)[objc_alloc(MEMORY[0x263F82AA0]) initWithContentViewController:self->_menuViewController];
    popoverController = self->_popoverController;
    self->_popoverController = v15;

    [(UIPopoverController *)self->_popoverController setDelegate:self];
    -[UIPopoverController setPopoverContentSize:](self->_popoverController, "setPopoverContentSize:", 320.0, v14);
    -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](self->_popoverController, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v17, a5, v6, x, y, width, height);
  }
}

- (void)menuViewController:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    [v9 menuPopover:self didSelectMenuItemAtIndex:a4];
  }
  [(SUUIMenuPopoverController *)self dismissAnimated:1];
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  [(SUUIMenuPopoverController *)self _destroyPopoverController];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 menuPopoverDidCancel:self];
  }
}

- (void)popoverController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)p_delegate);
    [v11 menuPopover:self willRepositionToRect:a4 inView:a5];
  }
}

- (void)_destroyPopoverController
{
  [(SUUIMenuViewController *)self->_menuViewController setDelegate:0];
  menuViewController = self->_menuViewController;
  self->_menuViewController = 0;

  [(UIPopoverController *)self->_popoverController setDelegate:0];
  popoverController = self->_popoverController;
  self->_popoverController = 0;
}

- (SUUIMenuPopoverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIMenuPopoverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popoverController, 0);
  objc_storeStrong((id *)&self->_menuViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end