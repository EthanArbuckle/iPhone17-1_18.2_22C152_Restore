@interface SUUIToolbarController
- (BOOL)toolbarButtonsController:(id)a3 shouldDispatchEventForButton:(id)a4;
- (NSArray)toolbarItems;
- (SUUIToolbarController)initWithToolbarViewElement:(id)a3;
- (SUUIToolbarControllerDelegate)delegate;
- (SUUIToolbarViewElement)toolbarViewElement;
- (id)_barButtonItemWithButtonElement:(id)a3;
- (id)_barButtonItemWithElement:(id)a3;
- (void)dealloc;
- (void)detachFromNavigationController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateToolbarForNavigationController:(id)a3;
@end

@implementation SUUIToolbarController

- (SUUIToolbarController)initWithToolbarViewElement:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIToolbarController;
  v6 = [(SUUIToolbarController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_viewElement, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(SUUIToolbarButtonsController *)self->_buttonsController disconnectAllButtons];
  v3.receiver = self;
  v3.super_class = (Class)SUUIToolbarController;
  [(SUUIToolbarController *)&v3 dealloc];
}

- (void)updateToolbarForNavigationController:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263EFF980];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  viewElement = self->_viewElement;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __62__SUUIToolbarController_updateToolbarForNavigationController___block_invoke;
  v14 = &unk_265403818;
  v15 = self;
  v8 = (NSArray *)v6;
  v16 = v8;
  [(SUUIViewElement *)viewElement enumerateChildrenUsingBlock:&v11];
  toolbarItems = self->_toolbarItems;
  self->_toolbarItems = v8;
  v10 = v8;

  objc_msgSend(v5, "setToolbarHidden:", -[NSArray count](v10, "count", v11, v12, v13, v14, v15) == 0);
}

void __62__SUUIToolbarController_updateToolbarForNavigationController___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (SUUIIKViewElementTypeIsButton([v4 elementType]))
  {
    objc_super v3 = [*(id *)(a1 + 32) _barButtonItemWithElement:v4];
    if (v3) {
      [*(id *)(a1 + 40) addObject:v3];
    }
  }
  else
  {
    NSLog(&cfstr_UnexpectedElem.isa);
  }
}

- (void)detachFromNavigationController:(id)a3
{
  buttonsController = self->_buttonsController;
  id v7 = a3;
  [(SUUIToolbarButtonsController *)buttonsController disconnectAllButtons];
  id v5 = self->_buttonsController;
  self->_buttonsController = 0;

  toolbarItems = self->_toolbarItems;
  self->_toolbarItems = 0;

  [v7 setToolbarHidden:1];
}

- (BOOL)toolbarButtonsController:(id)a3 shouldDispatchEventForButton:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained
    && (id v7 = WeakRetained,
        id v8 = objc_loadWeakRetained((id *)&self->_delegate),
        char v9 = objc_opt_respondsToSelector(),
        v8,
        v7,
        (v9 & 1) != 0))
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    char v11 = [v10 toolbarController:self shouldDispatchEventForButton:v5];
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (id)_barButtonItemWithElement:(id)a3
{
  id v4 = a3;
  if (SUUIIKViewElementTypeIsButton([v4 elementType]))
  {
    id v5 = [(SUUIToolbarController *)self _barButtonItemWithButtonElement:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_barButtonItemWithButtonElement:(id)a3
{
  id v4 = a3;
  buttonsController = self->_buttonsController;
  if (!buttonsController)
  {
    id v6 = [[SUUIToolbarButtonsController alloc] initWithToolbarViewElement:self->_viewElement];
    id v7 = self->_buttonsController;
    self->_buttonsController = v6;

    buttonsController = self->_buttonsController;
  }
  id v8 = [(SUUIToolbarButtonsController *)buttonsController addButtonItemWithButtonViewElement:v4];

  return v8;
}

- (SUUIToolbarViewElement)toolbarViewElement
{
  return self->_viewElement;
}

- (NSArray)toolbarItems
{
  return self->_toolbarItems;
}

- (SUUIToolbarControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIToolbarControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_toolbarItems, 0);
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_buttonsController, 0);
}

@end