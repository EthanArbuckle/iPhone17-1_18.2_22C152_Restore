@interface SUScriptDocumentInteractionControllerNativeObject
- (BOOL)_isAffectedByWindowNotification:(id)a3;
- (void)_windowDidRotateNotification:(id)a3;
- (void)_windowWillRotateNotification:(id)a3;
- (void)dealloc;
- (void)destroyNativeObject;
- (void)documentInteractionController:(id)a3 willBeginSendingToApplication:(id)a4;
- (void)documentInteractionControllerDidDismissOpenInMenu:(id)a3;
- (void)documentInteractionControllerWillPresentOpenInMenu:(id)a3;
- (void)presentUsingBlock:(id)a3;
- (void)setupNativeObject;
@end

@implementation SUScriptDocumentInteractionControllerNativeObject

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptDocumentInteractionControllerNativeObject;
  [(SUScriptDocumentInteractionControllerNativeObject *)&v3 dealloc];
}

- (void)presentUsingBlock:(id)a3
{
  id presentationBlock = self->_presentationBlock;
  if (presentationBlock != a3)
  {

    self->_id presentationBlock = (id)[a3 copy];
  }
  if (a3)
  {
    v6 = (void (*)(id))*((void *)a3 + 2);
    v6(a3);
  }
}

- (void)destroyNativeObject
{
  id v3 = [(SUScriptNativeObject *)self object];
  if ((SUScriptDocumentInteractionControllerNativeObject *)[v3 delegate] == self) {
    [v3 setDelegate:0];
  }
  v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F1D808] object:0];
  [v4 removeObserver:self name:*MEMORY[0x263F1D840] object:0];
  v5.receiver = self;
  v5.super_class = (Class)SUScriptDocumentInteractionControllerNativeObject;
  [(SUScriptNativeObject *)&v5 destroyNativeObject];
}

- (void)setupNativeObject
{
  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "setDelegate:", self);
  id v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__windowDidRotateNotification_ name:*MEMORY[0x263F1D808] object:0];
  [v3 addObserver:self selector:sel__windowWillRotateNotification_ name:*MEMORY[0x263F1D840] object:0];
  v4.receiver = self;
  v4.super_class = (Class)SUScriptDocumentInteractionControllerNativeObject;
  [(SUScriptNativeObject *)&v4 setupNativeObject];
}

- (void)documentInteractionControllerWillPresentOpenInMenu:(id)a3
{
  self->_didPickApplication = 0;
  self->_isVisible = 1;
}

- (void)documentInteractionControllerDidDismissOpenInMenu:(id)a3
{
  if (!self->_didPickApplication) {
    objc_msgSend((id)-[SUScriptObject _cancelFunction](-[SUScriptNativeObject scriptObject](self, "scriptObject", a3), "_cancelFunction"), "callWithArguments:", 0);
  }
  self->_isVisible = 0;
}

- (void)documentInteractionController:(id)a3 willBeginSendingToApplication:(id)a4
{
  v6 = (void *)[(SUScriptObject *)[(SUScriptNativeObject *)self scriptObject] _openWithFunction];
  objc_msgSend(v6, "callWithArguments:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", a4, 0));
  self->_didPickApplication = 1;
}

- (void)_windowDidRotateNotification:(id)a3
{
  if (self->_redisplayAfterRotation)
  {
    id presentationBlock = (void (**)(id, SEL, id))self->_presentationBlock;
    if (presentationBlock) {
      presentationBlock[2](presentationBlock, a2, a3);
    }
  }
  self->_redisplayAfterRotation = 0;
}

- (void)_windowWillRotateNotification:(id)a3
{
  if ([(SUScriptDocumentInteractionControllerNativeObject *)self _isAffectedByWindowNotification:a3]&& self->_isVisible)
  {
    self->_redisplayAfterRotation = 1;
    id v4 = [(SUScriptNativeObject *)self object];
    [v4 dismissMenuAnimated:0];
  }
}

- (BOOL)_isAffectedByWindowNotification:(id)a3
{
  [MEMORY[0x263F1C5C0] currentDevice];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") != 1) {
    return 0;
  }
  id v5 = [(SUScriptObject *)[(SUScriptNativeObject *)self scriptObject] parentViewController];
  if (![v5 isViewLoaded]) {
    return 0;
  }
  v6 = (void *)[v5 view];
  uint64_t v7 = [a3 object];

  return [v6 isDescendantOfView:v7];
}

@end