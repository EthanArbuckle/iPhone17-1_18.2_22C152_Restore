@interface SKUIToolbarButtonsController
- (SKUIToolbarButtonsController)initWithToolbarViewElement:(id)a3;
- (id)addButtonItemWithButtonViewElement:(id)a3;
- (void)_buttonAction:(id)a3;
- (void)_updateButtonItem:(id)a3 withButtonViewElement:(id)a4;
- (void)disconnectAllButtons;
@end

@implementation SKUIToolbarButtonsController

- (SKUIToolbarButtonsController)initWithToolbarViewElement:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIToolbarButtonsController initWithToolbarViewElement:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIToolbarButtonsController;
  v6 = [(SKUIToolbarButtonsController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_toolbarElement, a3);
  }

  return v7;
}

- (id)addButtonItemWithButtonViewElement:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4FB14A8]);
  [v5 setAction:sel__buttonAction_];
  [v5 setTarget:self];
  [(SKUIToolbarButtonsController *)self _updateButtonItem:v5 withButtonViewElement:v4];
  buttonItemElements = self->_buttonItemElements;
  if (!buttonItemElements)
  {
    v7 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:512 capacity:0];
    v8 = self->_buttonItemElements;
    self->_buttonItemElements = v7;

    buttonItemElements = self->_buttonItemElements;
  }
  [(NSMapTable *)buttonItemElements setObject:v4 forKey:v5];

  return v5;
}

- (void)disconnectAllButtons
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_buttonItemElements;
  uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "setTarget:", 0, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMapTable *)self->_buttonItemElements removeAllObjects];
}

- (void)_buttonAction:(id)a3
{
  id v3 = [(NSMapTable *)self->_buttonItemElements objectForKey:a3];
  [v3 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
}

- (void)_updateButtonItem:(id)a3 withButtonViewElement:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  objc_msgSend(v9, "setEnabled:", objc_msgSend(v5, "isEnabled"));
  objc_msgSend(v9, "setStyle:", 2 * (objc_msgSend(v5, "buttonViewType") == 8));
  uint64_t v6 = [v5 buttonImage];
  if (v6)
  {
    NSLog(&cfstr_ToolbarButtons.isa);
  }
  else
  {
    uint64_t v7 = [v5 buttonText];
    long long v8 = [v7 string];
    [v9 setTitle:v8];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolbarElement, 0);

  objc_storeStrong((id *)&self->_buttonItemElements, 0);
}

- (void)initWithToolbarViewElement:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIToolbarButtonsController initWithToolbarViewElement:]";
}

@end