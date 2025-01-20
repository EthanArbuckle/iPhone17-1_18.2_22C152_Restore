@interface SKUIMenuBarViewElementConfiguration
- (BOOL)_needsReload;
- (BOOL)scrollEnabled;
- (SKUIMenuBarViewElementConfigurationDelegate)delegate;
- (SKUIMenuItemViewElement)selectedMenuItemViewElement;
- (_SKUIMenuBarViewElementConfigurationReloadDelegate)_reloadDelegate;
- (id)_initWithMenuBarDocument:(id)a3;
- (id)documentForEntityUniqueIdentifier:(id)a3;
- (id)documentForMenuItemAtIndex:(unint64_t)a3;
- (id)documentOptionsForEntityUniqueIdentifier:(id)a3;
- (id)documentOptionsForMenuItemAtIndex:(unint64_t)a3;
- (int64_t)menuBarStyle;
- (unint64_t)indexOfMenuItemViewElement:(id)a3;
- (unint64_t)numberOfMenuItems;
- (void)_ensureDataLoaded;
- (void)_reloadWithMenuBarStyle:(int64_t)a3 menuItemViewElements:(id)a4 scrollEnabled:(BOOL)a5;
- (void)_setNeedsReload:(BOOL)a3;
- (void)_setReloadDelegate:(id)a3;
- (void)contentWillAppearForMenuItemAtIndex:(unint64_t)a3 withEntityValueProvider:(id)a4 clientContext:(id)a5;
- (void)menuBarDocument:(id)a3 didReplaceDocumentForEntityWithUniqueIdentifier:(id)a4;
- (void)menuBarDocument:(id)a3 didReplaceDocumentForMenuItem:(id)a4;
- (void)menuBarDocument:(id)a3 didSelectMenuItem:(id)a4 animated:(BOOL)a5;
- (void)setDelegate:(id)a3;
@end

@implementation SKUIMenuBarViewElementConfiguration

- (id)_initWithMenuBarDocument:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMenuBarViewElementConfiguration _initWithMenuBarDocument:]();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIMenuBarViewElementConfiguration;
  v6 = [(SKUIMenuBarViewElementConfiguration *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_menuBarDocument, a3);
    [(IKAppMenuBarDocument *)v7->_menuBarDocument setDelegate:v7];
    uint64_t v8 = [(IKAppMenuBarDocument *)v7->_menuBarDocument selectedMenuItem];
    selectedMenuItemViewElement = v7->_selectedMenuItemViewElement;
    v7->_selectedMenuItemViewElement = (SKUIMenuItemViewElement *)v8;

    v7->_needsReload = 1;
  }

  return v7;
}

- (void)menuBarDocument:(id)a3 didReplaceDocumentForEntityWithUniqueIdentifier:(id)a4
{
  id v6 = a4;
  [(SKUIMenuBarViewElementConfiguration *)self _ensureDataLoaded];
  id v5 = [(SKUIMenuBarViewElementConfiguration *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 menuBarViewElementConfiguration:self didReplaceDocumentForEntityUniqueIdentifier:v6];
  }
}

- (void)menuBarDocument:(id)a3 didReplaceDocumentForMenuItem:(id)a4
{
  id v5 = a4;
  [(SKUIMenuBarViewElementConfiguration *)self _ensureDataLoaded];
  NSUInteger v6 = [(NSArray *)self->_menuItemViewElements indexOfObject:v5];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [(SKUIMenuBarViewElementConfiguration *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v7 menuBarViewElementConfiguration:self didReplaceDocumentForMenuItemAtIndex:v6];
    }
  }
}

- (void)menuBarDocument:(id)a3 didSelectMenuItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a4;
  [(SKUIMenuBarViewElementConfiguration *)self _ensureDataLoaded];
  if ([(NSArray *)self->_menuItemViewElements containsObject:v9])
  {
    objc_storeStrong((id *)&self->_selectedMenuItemViewElement, a4);
    uint64_t v8 = [(SKUIMenuBarViewElementConfiguration *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v8 menuBarViewElementConfiguration:self selectMenuItemViewElement:self->_selectedMenuItemViewElement animated:v5];
    }
  }
}

- (int64_t)menuBarStyle
{
  return self->_menuBarStyle;
}

- (unint64_t)numberOfMenuItems
{
  [(SKUIMenuBarViewElementConfiguration *)self _ensureDataLoaded];
  if (!self->_menuBarStyle) {
    return 0;
  }
  menuItemViewElements = self->_menuItemViewElements;

  return [(NSArray *)menuItemViewElements count];
}

- (SKUIMenuItemViewElement)selectedMenuItemViewElement
{
  if (self->_selectedMenuItemViewElement)
  {
    [(SKUIMenuBarViewElementConfiguration *)self _ensureDataLoaded];
    if ([(NSArray *)self->_menuItemViewElements containsObject:self->_selectedMenuItemViewElement]) {
      selectedMenuItemViewElement = self->_selectedMenuItemViewElement;
    }
    else {
      selectedMenuItemViewElement = 0;
    }
    v4 = selectedMenuItemViewElement;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)documentForEntityUniqueIdentifier:(id)a3
{
  id v4 = a3;
  [(SKUIMenuBarViewElementConfiguration *)self _ensureDataLoaded];
  BOOL v5 = [(IKAppMenuBarDocument *)self->_menuBarDocument documentForEntityUniqueIdentifier:v4];

  return v5;
}

- (id)documentForMenuItemAtIndex:(unint64_t)a3
{
  [(SKUIMenuBarViewElementConfiguration *)self _ensureDataLoaded];
  BOOL v5 = [(NSArray *)self->_menuItemViewElements objectAtIndex:a3];
  NSUInteger v6 = [(IKAppMenuBarDocument *)self->_menuBarDocument documentForMenuItem:v5];

  return v6;
}

- (id)documentOptionsForEntityUniqueIdentifier:(id)a3
{
  id v4 = a3;
  [(SKUIMenuBarViewElementConfiguration *)self _ensureDataLoaded];
  BOOL v5 = [(IKAppMenuBarDocument *)self->_menuBarDocument documentOptionsForEntityUniqueIdentifier:v4];

  return v5;
}

- (id)documentOptionsForMenuItemAtIndex:(unint64_t)a3
{
  [(SKUIMenuBarViewElementConfiguration *)self _ensureDataLoaded];
  BOOL v5 = [(NSArray *)self->_menuItemViewElements objectAtIndex:a3];
  NSUInteger v6 = [(IKAppMenuBarDocument *)self->_menuBarDocument documentOptionsForMenuItem:v5];

  return v6;
}

- (unint64_t)indexOfMenuItemViewElement:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(SKUIMenuBarViewElementConfiguration *)self _ensureDataLoaded],
        (menuItemViewElements = self->_menuItemViewElements) != 0))
  {
    unint64_t v6 = [(NSArray *)menuItemViewElements indexOfObject:v4];
  }
  else
  {
    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (void)contentWillAppearForMenuItemAtIndex:(unint64_t)a3 withEntityValueProvider:(id)a4 clientContext:(id)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  [(SKUIMenuBarViewElementConfiguration *)self _ensureDataLoaded];
  v10 = [(NSArray *)self->_menuItemViewElements objectAtIndex:a3];
  menuBarDocument = self->_menuBarDocument;
  if (v8)
  {
    v12 = [v8 entityUniqueIdentifier];
    v13 = [(IKAppMenuBarDocument *)menuBarDocument documentForEntityUniqueIdentifier:v12];

    if (!v13)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F6F0D0]);
      v15 = [v9 _scriptAppContext];
      v16 = (void *)[v14 initWithAppContext:v15];

      if (v16)
      {
        [v16 setEntityValueProvider:v8];
        v18 = @"entityValueProvider";
        v19[0] = v16;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      }
      else
      {
        v17 = 0;
      }

      goto LABEL_9;
    }
  }
  else
  {
    v13 = [(IKAppMenuBarDocument *)menuBarDocument documentForMenuItem:v10];
    if (!v13)
    {
      v17 = 0;
LABEL_9:
      [v10 dispatchEventOfType:17 canBubble:1 isCancelable:0 extraInfo:v17 completionBlock:0];

      v13 = 0;
    }
  }
}

- (void)_ensureDataLoaded
{
  if (self->_needsReload)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_reloadDelegate);
    if (objc_opt_respondsToSelector())
    {
      [WeakRetained _menuBarViewElementConfigurationRequestsReload:self];
      self->_needsReload = 0;
    }
  }
}

- (void)_reloadWithMenuBarStyle:(int64_t)a3 menuItemViewElements:(id)a4 scrollEnabled:(BOOL)a5
{
  self->_menuBarStyle = a3;
  id v7 = (NSArray *)[a4 copy];
  menuItemViewElements = self->_menuItemViewElements;
  self->_menuItemViewElements = v7;

  self->_scrollEnabled = a5;
}

- (SKUIMenuBarViewElementConfigurationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIMenuBarViewElementConfigurationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)scrollEnabled
{
  return self->_scrollEnabled;
}

- (BOOL)_needsReload
{
  return self->_needsReload;
}

- (void)_setNeedsReload:(BOOL)a3
{
  self->_needsReload = a3;
}

- (_SKUIMenuBarViewElementConfigurationReloadDelegate)_reloadDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_reloadDelegate);

  return (_SKUIMenuBarViewElementConfigurationReloadDelegate *)WeakRetained;
}

- (void)_setReloadDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_reloadDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedMenuItemViewElement, 0);
  objc_storeStrong((id *)&self->_menuItemViewElements, 0);

  objc_storeStrong((id *)&self->_menuBarDocument, 0);
}

- (void)_initWithMenuBarDocument:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMenuBarViewElementConfiguration _initWithMenuBarDocument:]";
}

@end