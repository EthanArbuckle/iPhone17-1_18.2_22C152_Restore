@interface TTRUndoManager
+ (void)withActionName:(id)a3 block:(id)a4;
- (BOOL)disableRemoveAllActions;
- (BOOL)shouldSuppressWillRegisterUndoNotifications;
- (NSString)debugIdentifier;
- (NSString)debug_redoStackDescription;
- (NSString)debug_undoStackDescription;
- (TTRUndoManager)initWithDebugIdentifier:(id)a3;
- (id)description;
- (void)_prepareToRegisterUndo;
- (void)_registerLogUserAction:(id)a3;
- (void)registerUndoWithTarget:(id)a3 handler:(id)a4;
- (void)registerUndoWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5;
- (void)removeAllActions;
- (void)setDebugIdentifier:(id)a3;
- (void)setDisableRemoveAllActions:(BOOL)a3;
- (void)setShouldSuppressWillRegisterUndoNotifications:(BOOL)a3;
@end

@implementation TTRUndoManager

- (TTRUndoManager)initWithDebugIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TTRUndoManager;
  v5 = [(TTRUndoManager *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    debugIdentifier = v5->_debugIdentifier;
    v5->_debugIdentifier = (NSString *)v6;
  }
  return v5;
}

+ (void)withActionName:(id)a3 block:(id)a4
{
  id v11 = a3;
  v5 = (void (**)(void))a4;
  uint64_t v6 = (id *)perThreadActionContext();
  id v7 = *v6;
  v8 = objc_alloc_init(TTRUndoManagerActionContext);
  *uint64_t v6 = v8;
  if (v5) {
    v5[2](v5);
  }
  *uint64_t v6 = v7;
  objc_super v9 = [(TTRUndoManagerActionContext *)v8 undoManagerOfLastRegisteredUndo];
  v10 = v9;
  if (v9)
  {
    [v9 _registerLogUserAction:v11];
    [v10 setActionName:v11];
  }
}

- (void)registerUndoWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(TTRUndoManager *)self isUndoRegistrationEnabled])
  {
    [(TTRUndoManager *)self _prepareToRegisterUndo];
    v10.receiver = self;
    v10.super_class = (Class)TTRUndoManager;
    [(TTRUndoManager *)&v10 registerUndoWithTarget:v8 selector:a4 object:v9];
  }
}

- (void)registerUndoWithTarget:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(TTRUndoManager *)self isUndoRegistrationEnabled])
  {
    [(TTRUndoManager *)self _prepareToRegisterUndo];
    v8.receiver = self;
    v8.super_class = (Class)TTRUndoManager;
    [(TTRUndoManager *)&v8 registerUndoWithTarget:v6 handler:v7];
  }
}

- (void)removeAllActions
{
  if (![(TTRUndoManager *)self disableRemoveAllActions])
  {
    v4.receiver = self;
    v4.super_class = (Class)TTRUndoManager;
    [(TTRUndoManager *)&v4 removeAllActions];
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"TTRUndoManagerDidRemoveAllActionsNotification" object:self];
  }
}

- (void)_prepareToRegisterUndo
{
  id v4 = *(id *)perThreadActionContext();
  if (v4) {
    [v4 setUndoManagerOfLastRegisteredUndo:self];
  }
  if (![(TTRUndoManager *)self shouldSuppressWillRegisterUndoNotifications])
  {
    [(TTRUndoManager *)self setShouldSuppressWillRegisterUndoNotifications:1];
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"TTRUndoManagerWillRegisterUndoNotification" object:self];

    [(TTRUndoManager *)self setShouldSuppressWillRegisterUndoNotifications:0];
  }
}

- (void)_registerLogUserAction:(id)a3
{
  id v4 = a3;
  if (_registerLogUserAction__onceToken[0] != -1) {
    dispatch_once(_registerLogUserAction__onceToken, &__block_literal_global_1);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__TTRUndoManager__registerLogUserAction___block_invoke_2;
  v6[3] = &unk_1E61D3B30;
  id v7 = v4;
  id v5 = v4;
  [(TTRUndoManager *)self registerUndoWithTarget:self handler:v6];
}

void __41__TTRUndoManager__registerLogUserAction___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.reminderkit", "userAction");
  v1 = (void *)_registerLogUserAction__logObject;
  _registerLogUserAction__logObject = (uint64_t)v0;
}

void __41__TTRUndoManager__registerLogUserAction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isUndoing])
  {
    id v4 = _registerLogUserAction__logObject;
    if (os_log_type_enabled((os_log_t)_registerLogUserAction__logObject, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)objc_super v8 = 138412290;
      *(void *)&v8[4] = v5;
      id v6 = "Undo %@";
LABEL_7:
      _os_log_impl(&dword_1B90A0000, v4, OS_LOG_TYPE_INFO, v6, v8, 0xCu);
    }
  }
  else if ([v3 isRedoing])
  {
    id v4 = _registerLogUserAction__logObject;
    if (os_log_type_enabled((os_log_t)_registerLogUserAction__logObject, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)objc_super v8 = 138412290;
      *(void *)&v8[4] = v7;
      id v6 = "Redo %@";
      goto LABEL_7;
    }
  }
  objc_msgSend(v3, "_registerLogUserAction:", *(void *)(a1 + 32), *(_OWORD *)v8);
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(TTRUndoManager *)self debugIdentifier];
  id v6 = [v3 stringWithFormat:@"<%@ %p: debugIdentifier=%@>", v4, self, v5];

  return v6;
}

- (NSString)debug_undoStackDescription
{
  v2 = [(TTRUndoManager *)self valueForKey:@"_undoStack"];
  id v3 = NSString;
  uint64_t v4 = [v2 count];
  uint64_t v5 = [v2 description];
  id v6 = [v3 stringWithFormat:@"(%lu entries) %@", v4, v5];

  return (NSString *)v6;
}

- (NSString)debug_redoStackDescription
{
  v2 = [(TTRUndoManager *)self valueForKey:@"_redoStack"];
  id v3 = NSString;
  uint64_t v4 = [v2 count];
  uint64_t v5 = [v2 description];
  id v6 = [v3 stringWithFormat:@"(%lu entries) %@", v4, v5];

  return (NSString *)v6;
}

- (BOOL)disableRemoveAllActions
{
  return self->_disableRemoveAllActions;
}

- (void)setDisableRemoveAllActions:(BOOL)a3
{
  self->_disableRemoveAllActions = a3;
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (void)setDebugIdentifier:(id)a3
{
}

- (BOOL)shouldSuppressWillRegisterUndoNotifications
{
  return self->_shouldSuppressWillRegisterUndoNotifications;
}

- (void)setShouldSuppressWillRegisterUndoNotifications:(BOOL)a3
{
  self->_shouldSuppressWillRegisterUndoNotifications = a3;
}

- (void).cxx_destruct
{
}

@end