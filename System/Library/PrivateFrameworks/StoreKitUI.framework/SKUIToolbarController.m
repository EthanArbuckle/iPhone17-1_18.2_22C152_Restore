@interface SKUIToolbarController
- (BOOL)toolbarButtonsController:(id)a3 shouldDispatchEventForButton:(id)a4;
- (NSArray)toolbarItems;
- (SKUIToolbarController)initWithToolbarViewElement:(id)a3;
- (SKUIToolbarControllerDelegate)delegate;
- (SKUIToolbarViewElement)toolbarViewElement;
- (id)_barButtonItemWithButtonElement:(id)a3;
- (id)_barButtonItemWithElement:(id)a3;
- (void)dealloc;
- (void)detachFromNavigationController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateToolbarForNavigationController:(id)a3;
@end

@implementation SKUIToolbarController

- (SKUIToolbarController)initWithToolbarViewElement:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIToolbarController initWithToolbarViewElement:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIToolbarController;
  v6 = [(SKUIToolbarController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_viewElement, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(SKUIToolbarButtonsController *)self->_buttonsController disconnectAllButtons];
  v3.receiver = self;
  v3.super_class = (Class)SKUIToolbarController;
  [(SKUIToolbarController *)&v3 dealloc];
}

- (void)updateToolbarForNavigationController:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  viewElement = self->_viewElement;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __62__SKUIToolbarController_updateToolbarForNavigationController___block_invoke;
  v14 = &unk_1E64243A8;
  v15 = self;
  v8 = (NSArray *)v6;
  v16 = v8;
  [(SKUIViewElement *)viewElement enumerateChildrenUsingBlock:&v11];
  toolbarItems = self->_toolbarItems;
  self->_toolbarItems = v8;
  v10 = v8;

  objc_msgSend(v5, "setToolbarHidden:", -[NSArray count](v10, "count", v11, v12, v13, v14, v15) == 0);
}

void __62__SKUIToolbarController_updateToolbarForNavigationController___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (SKUIIKViewElementTypeIsButton([v4 elementType]))
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
  [(SKUIToolbarButtonsController *)buttonsController disconnectAllButtons];
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
  if (SKUIIKViewElementTypeIsButton([v4 elementType]))
  {
    id v5 = [(SKUIToolbarController *)self _barButtonItemWithButtonElement:v4];
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
    id v6 = [[SKUIToolbarButtonsController alloc] initWithToolbarViewElement:self->_viewElement];
    id v7 = self->_buttonsController;
    self->_buttonsController = v6;

    buttonsController = self->_buttonsController;
  }
  id v8 = [(SKUIToolbarButtonsController *)buttonsController addButtonItemWithButtonViewElement:v4];

  return v8;
}

- (SKUIToolbarViewElement)toolbarViewElement
{
  return self->_viewElement;
}

- (NSArray)toolbarItems
{
  return self->_toolbarItems;
}

- (SKUIToolbarControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIToolbarControllerDelegate *)WeakRetained;
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

- (void)initWithToolbarViewElement:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIToolbarController initWithToolbarViewElement:]";
}

@end