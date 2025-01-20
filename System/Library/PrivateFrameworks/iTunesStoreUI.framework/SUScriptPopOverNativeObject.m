@interface SUScriptPopOverNativeObject
- (BOOL)_isAffectedByWindowNotification:(id)a3;
- (SUDOMElement)sourceDOMElement;
- (UIBarButtonItem)sourceButtonItem;
- (void)_windowDidRotateNotification:(id)a3;
- (void)_windowWillRotateNotification:(id)a3;
- (void)dealloc;
- (void)destroyNativeObject;
- (void)setSourceButtonItem:(id)a3;
- (void)setSourceDOMElement:(id)a3;
- (void)setupNativeObject;
@end

@implementation SUScriptPopOverNativeObject

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptPopOverNativeObject;
  [(SUScriptPopOverNativeObject *)&v3 dealloc];
}

- (void)destroyNativeObject
{
  objc_super v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D808] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F1D840] object:0];
  id v4 = [(SUScriptNativeObject *)self object];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 isPopoverVisible]) {
    [v4 dismissPopoverAnimated:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)SUScriptPopOverNativeObject;
  [(SUScriptNativeObject *)&v5 destroyNativeObject];
}

- (void)setupNativeObject
{
  objc_super v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__windowDidRotateNotification_ name:*MEMORY[0x263F1D808] object:0];
  [v3 addObserver:self selector:sel__windowWillRotateNotification_ name:*MEMORY[0x263F1D840] object:0];
  v4.receiver = self;
  v4.super_class = (Class)SUScriptPopOverNativeObject;
  [(SUScriptNativeObject *)&v4 setupNativeObject];
}

- (void)_windowDidRotateNotification:(id)a3
{
  if (self->_redisplayAfterRotation)
  {
    if (self->_sourceDOMElement)
    {
      objc_super v4 = objc_alloc_init(SUScrollViewScroller);
      objc_super v5 = [(UIWebView *)[(SUDOMElement *)self->_sourceDOMElement webView] scrollView];
      [(SUDOMElement *)self->_sourceDOMElement frame];
      -[UIScrollView convertRect:fromView:](v5, "convertRect:fromView:", 0);
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      [(SUScrollViewScroller *)v4 attachToScrollView:v5];
      uint64_t v14 = [MEMORY[0x263F7B420] weakReferenceWithObject:self];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __60__SUScriptPopOverNativeObject__windowDidRotateNotification___block_invoke;
      v15[3] = &unk_264812158;
      v15[4] = v14;
      v15[5] = v4;
      -[SUScrollViewScroller scrollFrameToVisible:animated:completionBlock:](v4, "scrollFrameToVisible:animated:completionBlock:", 1, v15, v7, v9, v11, v13);
    }
    [(SUScriptObject *)[(SUScriptNativeObject *)self scriptObject] _setIgnoresDismiss:0];
    self->_redisplayAfterRotation = 0;
  }
}

uint64_t __60__SUScriptPopOverNativeObject__windowDidRotateNotification___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) object];
  objc_super v3 = (void *)[v2 object];
  objc_super v4 = (void *)[v2 sourceDOMElement];
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    double v6 = v4;
    double v7 = (void *)[v4 webView];
    [v6 frame];
    objc_msgSend(v7, "convertRect:fromView:", 0);
    objc_msgSend(v3, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v7, 15, 1);
  }
  double v8 = *(void **)(a1 + 40);

  return [v8 detachFromScrollView];
}

- (void)_windowWillRotateNotification:(id)a3
{
  if ([(SUScriptPopOverNativeObject *)self _isAffectedByWindowNotification:a3])
  {
    id v4 = [(SUScriptNativeObject *)self object];
    if (self->_sourceDOMElement)
    {
      BOOL v5 = v4;
      if ([v4 isPopoverVisible])
      {
        if (!objc_msgSend((id)objc_msgSend(v5, "contentViewController"), "presentedViewController"))
        {
          self->_redisplayAfterRotation = 1;
          [(SUScriptObject *)[(SUScriptNativeObject *)self scriptObject] _setIgnoresDismiss:1];
          [v5 dismissPopoverAnimated:0];
        }
      }
    }
  }
}

- (BOOL)_isAffectedByWindowNotification:(id)a3
{
  id v4 = objc_msgSend(-[SUScriptNativeObject object](self, "object"), "contentViewController");
  int v5 = [v4 isViewLoaded];
  if (v5)
  {
    double v6 = (void *)[v4 view];
    uint64_t v7 = [a3 object];
    LOBYTE(v5) = [v6 isDescendantOfView:v7];
  }
  return v5;
}

- (UIBarButtonItem)sourceButtonItem
{
  return self->_sourceButtonItem;
}

- (void)setSourceButtonItem:(id)a3
{
}

- (SUDOMElement)sourceDOMElement
{
  return self->_sourceDOMElement;
}

- (void)setSourceDOMElement:(id)a3
{
}

@end