@interface PXBlockActionManager
- (BOOL)canPerformActionType:(id)a3;
- (BOOL)supportsActionType:(id)a3;
- (NSMutableDictionary)registeredActions;
- (PXBlockActionManager)init;
- (id)_defaultStandardActionForConfiguration:(id)a3 handler:(id)a4;
- (id)actionPerformerForActionType:(id)a3;
- (id)standardActionForActionType:(id)a3;
- (void)_executeActionType:(id)a3 action:(id)a4;
- (void)registerActionForType:(id)a3 handler:(id)a4;
- (void)registerActionForType:(id)a3 title:(id)a4 image:(id)a5 handler:(id)a6;
- (void)registerActionWithConfiguration:(id)a3 forType:(id)a4;
@end

@implementation PXBlockActionManager

- (void).cxx_destruct
{
}

- (NSMutableDictionary)registeredActions
{
  return self->_registeredActions;
}

- (id)_defaultStandardActionForConfiguration:(id)a3 handler:(id)a4
{
  id v5 = a3;
  v6 = (void *)MEMORY[0x1E4FB13F0];
  id v7 = a4;
  v8 = [v5 actionName];
  v9 = [v5 image];
  v10 = [v6 actionWithTitle:v8 image:v9 identifier:0 handler:v7];

  if ([v5 isDestructive]) {
    objc_msgSend(v10, "setAttributes:", objc_msgSend(v10, "attributes") | 2);
  }
  if ([v5 isSelected]) {
    [v10 setState:1];
  }

  return v10;
}

- (id)standardActionForActionType:(id)a3
{
  id v4 = a3;
  if ([(PXBlockActionManager *)self canPerformActionType:v4])
  {
    id v5 = [(PXBlockActionManager *)self registeredActions];
    v6 = [v5 objectForKeyedSubscript:v4];

    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__PXBlockActionManager_standardActionForActionType___block_invoke;
    aBlock[3] = &unk_1E5DC7448;
    objc_copyWeak(&v14, &location);
    id v13 = v4;
    id v7 = _Block_copy(aBlock);
    uint64_t v8 = [v6 menuElementConstructor];
    v9 = (void *)v8;
    if (v8) {
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v7);
    }
    else {
    v10 = [(PXBlockActionManager *)self _defaultStandardActionForConfiguration:v6 handler:v7];
    }

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __52__PXBlockActionManager_standardActionForActionType___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _executeActionType:*(void *)(a1 + 32) action:v4];
}

- (id)actionPerformerForActionType:(id)a3
{
  id v4 = a3;
  if ([(PXBlockActionManager *)self canPerformActionType:v4])
  {
    id v5 = [(PXBlockActionManager *)self registeredActions];
    v6 = [v5 objectForKeyedSubscript:v4];

    id v7 = [[PXBlockActionPerformer alloc] initWithActionType:v4 configuration:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)supportsActionType:(id)a3
{
  id v4 = a3;
  id v5 = [(PXBlockActionManager *)self registeredActions];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6 != 0;
}

- (BOOL)canPerformActionType:(id)a3
{
  id v4 = a3;
  if ([(PXActionManager *)self isActionTypeAllowed:v4])
  {
    id v5 = [(PXBlockActionManager *)self registeredActions];
    v6 = [v5 objectForKeyedSubscript:v4];

    if (v6)
    {
      uint64_t v7 = [v6 canPerformBlock];
      uint64_t v8 = (void *)v7;
      if (v7) {
        char v9 = (*(uint64_t (**)(uint64_t, PXBlockActionManager *))(v7 + 16))(v7, self);
      }
      else {
        char v9 = 1;
      }
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)_executeActionType:(id)a3 action:(id)a4
{
  id v6 = a4;
  id v7 = [(PXBlockActionManager *)self actionPerformerForActionType:a3];
  [v7 setSender:v6];

  [v7 performActionWithCompletionHandler:0];
}

- (void)registerActionForType:(id)a3 title:(id)a4 image:(id)a5 handler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v15 = [[PXBlockActionConfiguration alloc] initWithBlock:v10];

  [(PXBlockActionConfiguration *)v15 setActionName:v12];
  [(PXBlockActionConfiguration *)v15 setImage:v11];

  id v14 = [(PXBlockActionManager *)self registeredActions];
  [v14 setObject:v15 forKeyedSubscript:v13];
}

- (void)registerActionForType:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v9 = [[PXBlockActionConfiguration alloc] initWithBlock:v6];

  uint64_t v8 = [(PXBlockActionManager *)self registeredActions];
  [v8 setObject:v9 forKeyedSubscript:v7];
}

- (void)registerActionWithConfiguration:(id)a3 forType:(id)a4
{
  id v6 = a4;
  id v8 = (id)[a3 copy];
  id v7 = [(PXBlockActionManager *)self registeredActions];
  [v7 setObject:v8 forKeyedSubscript:v6];
}

- (PXBlockActionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXBlockActionManager;
  v2 = [(PXBlockActionManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    registeredActions = v2->_registeredActions;
    v2->_registeredActions = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end