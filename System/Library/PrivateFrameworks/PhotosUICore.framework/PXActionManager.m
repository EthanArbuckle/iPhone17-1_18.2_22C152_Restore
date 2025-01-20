@interface PXActionManager
+ (id)_unlockDeviceHandlerWithActionType;
+ (void)setEnsureUnlockedDeviceHandlerWithActionType:(id)a3;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canPerformActionType:(id)a3;
- (BOOL)isActionTypeAllowed:(id)a3;
- (BOOL)isDestructiveActionType:(id)a3;
- (BOOL)supportsActionType:(id)a3;
- (BOOL)supportsContextMenu;
- (NSSet)allowedActionTypes;
- (PXActionPerformerDelegate)performerDelegate;
- (id)actionItemForActionType:(id)a3 handler:(id)a4;
- (id)actionItemsForActionTypes:(id)a3 handler:(id)a4;
- (id)actionKeyCommands;
- (id)actionPerformerForActionType:(id)a3;
- (id)actionPerformerForActionType:(id)a3 parameters:(id)a4;
- (id)actionTypeForGenericType:(id)a3;
- (id)activityForActionType:(id)a3;
- (id)barButtonItemForActionType:(id)a3;
- (id)contextMenu;
- (id)contextMenuElementsWithHandler:(id)a3;
- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4;
- (id)menuElementForActionType:(id)a3 image:(id)a4 willStartActionHandler:(id)a5 didEndActionHandler:(id)a6;
- (id)menuElementsForActionType:(id)a3;
- (id)previewActionForActionType:(id)a3 image:(id)a4;
- (id)standardActionForActionType:(id)a3;
- (id)systemImageNameForActionType:(id)a3;
- (int64_t)menuActionStateForActionType:(id)a3;
- (void)setAllowedActionTypes:(id)a3;
- (void)setPerformerDelegate:(id)a3;
@end

@implementation PXActionManager

- (PXActionPerformerDelegate)performerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_performerDelegate);
  return (PXActionPerformerDelegate *)WeakRetained;
}

- (void)setAllowedActionTypes:(id)a3
{
}

- (BOOL)isActionTypeAllowed:(id)a3
{
  id v4 = a3;
  v5 = [(PXActionManager *)self allowedActionTypes];
  if (v5)
  {
    v6 = [(PXActionManager *)self allowedActionTypes];
    char v7 = [v6 containsObject:v4];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (NSSet)allowedActionTypes
{
  return self->_allowedActionTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedActionTypes, 0);
  objc_destroyWeak((id *)&self->_performerDelegate);
}

- (void)setPerformerDelegate:(id)a3
{
}

+ (id)_unlockDeviceHandlerWithActionType
{
  id v2 = a1;
  objc_sync_enter(v2);
  v3 = _Block_copy((const void *)_sharedUnlockDeviceHandlerWithActionType);
  objc_sync_exit(v2);

  id v4 = _Block_copy(v3);
  return v4;
}

+ (void)setEnsureUnlockedDeviceHandlerWithActionType:(id)a3
{
  id v9 = a3;
  if (!v9)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"PXActionManager.m", 74, @"Invalid parameter not satisfying: %@", @"ensureUnlockedDeviceHandlerWithActionType != nil" object file lineNumber description];
  }
  id v5 = a1;
  objc_sync_enter(v5);
  uint64_t v6 = [(id)_sharedUnlockDeviceHandlerWithActionType copy];
  char v7 = (void *)_sharedUnlockDeviceHandlerWithActionType;
  _sharedUnlockDeviceHandlerWithActionType = v6;

  objc_sync_exit(v5);
}

- (id)contextMenuElementsWithHandler:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  char v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXActionManager.m", 152, @"Method %s is a responsibility of subclass %@", "-[PXActionManager contextMenuElementsWithHandler:]", v8 object file lineNumber description];

  abort();
}

- (id)actionItemsForActionTypes:(id)a3 handler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __53__PXActionManager_actionItemsForActionTypes_handler___block_invoke;
        v18[3] = &unk_1E5DD3280;
        id v14 = v7;
        v18[4] = v13;
        id v19 = v14;
        v15 = [(PXActionManager *)self actionItemForActionType:v13 handler:v18];
        if (v15) {
          [v17 addObject:v15];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  return v17;
}

uint64_t __53__PXActionManager_actionItemsForActionTypes_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)actionItemForActionType:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PXActionManager *)self canPerformActionType:v6])
  {
    id v8 = [(PXActionManager *)self localizedTitleForActionType:v6 useCase:1];
    if (v8)
    {
      uint64_t v9 = [(PXActionManager *)self systemImageNameForActionType:v6];
      uint64_t v10 = [[PXActionItem alloc] initWithTitle:v8 systemImageName:v9 role:[(PXActionManager *)self isDestructiveActionType:v6] state:[(PXActionManager *)self menuActionStateForActionType:v6] handler:v7];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)systemImageNameForActionType:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXActionManager.m", 121, @"Method %s is a responsibility of subclass %@", "-[PXActionManager systemImageNameForActionType:]", v8 object file lineNumber description];

  abort();
}

- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F28B00] currentHandler];
  id v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  [v7 handleFailureInMethod:a2, self, @"PXActionManager.m", 117, @"Method %s is a responsibility of subclass %@", "-[PXActionManager localizedTitleForActionType:useCase:]", v9 object file lineNumber description];

  abort();
}

- (id)actionPerformerForActionType:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXActionManager.m", 113, @"Method %s is a responsibility of subclass %@", "-[PXActionManager actionPerformerForActionType:]", v8 object file lineNumber description];

  abort();
}

- (id)actionPerformerForActionType:(id)a3 parameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v10 = (objc_class *)objc_opt_class();
  uint64_t v11 = NSStringFromClass(v10);
  [v9 handleFailureInMethod:a2, self, @"PXActionManager.m", 109, @"Method %s is a responsibility of subclass %@", "-[PXActionManager actionPerformerForActionType:parameters:]", v11 object file lineNumber description];

  abort();
}

- (id)actionTypeForGenericType:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXActionManager.m", 105, @"Method %s is a responsibility of subclass %@", "-[PXActionManager actionTypeForGenericType:]", v8 object file lineNumber description];

  abort();
}

- (int64_t)menuActionStateForActionType:(id)a3
{
  return 0;
}

- (BOOL)isDestructiveActionType:(id)a3
{
  return 0;
}

- (BOOL)supportsActionType:(id)a3
{
  return 0;
}

- (BOOL)canPerformActionType:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXActionManager.m", 89, @"Method %s is a responsibility of subclass %@", "-[PXActionManager canPerformActionType:]", v8 object file lineNumber description];

  abort();
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return 0;
}

- (id)actionKeyCommands
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)menuElementsForActionType:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)supportsContextMenu
{
  return 0;
}

- (id)contextMenu
{
  return 0;
}

- (id)activityForActionType:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXActionManager.m", 663, @"Method %s is a responsibility of subclass %@", "-[PXActionManager(UIKit) activityForActionType:]", v8 object file lineNumber description];

  abort();
}

- (id)standardActionForActionType:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXActionManager.m", 659, @"Method %s is a responsibility of subclass %@", "-[PXActionManager(UIKit) standardActionForActionType:]", v8 object file lineNumber description];

  abort();
}

- (id)menuElementForActionType:(id)a3 image:(id)a4 willStartActionHandler:(id)a5 didEndActionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  v16 = (objc_class *)objc_opt_class();
  id v17 = NSStringFromClass(v16);
  [v15 handleFailureInMethod:a2, self, @"PXActionManager.m", 655, @"Method %s is a responsibility of subclass %@", "-[PXActionManager(UIKit) menuElementForActionType:image:willStartActionHandler:didEndActionHandler:]", v17 object file lineNumber description];

  abort();
}

- (id)previewActionForActionType:(id)a3 image:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  [v9 handleFailureInMethod:a2, self, @"PXActionManager.m", 651, @"Method %s is a responsibility of subclass %@", "-[PXActionManager(UIKit) previewActionForActionType:image:]", v11 object file lineNumber description];

  abort();
}

- (id)barButtonItemForActionType:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXActionManager.m", 647, @"Method %s is a responsibility of subclass %@", "-[PXActionManager(UIKit) barButtonItemForActionType:]", v8 object file lineNumber description];

  abort();
}

@end