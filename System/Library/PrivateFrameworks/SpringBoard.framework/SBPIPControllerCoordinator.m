@interface SBPIPControllerCoordinator
- (BOOL)canHostAnApp;
- (BOOL)hasIdleTimerBehaviors;
- (BOOL)isAnyPictureInPictureWindowVisible;
- (BOOL)isHostingAnApp;
- (BOOL)isPresentingPictureInPictureRequiringMedusaKeyboard;
- (BOOL)shouldStartPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:(int)a3 scenePersistenceIdentifier:(id)a4 pipContentType:(int64_t)a5;
- (SBPIPControllerCoordinator)init;
- (SBWindowSceneManager)windowSceneManager;
- (id)controllerForType:(int64_t)a3;
- (id)coordinatorRequestedIdleTimerBehavior:(id)a3;
- (id)hostedAppSceneHandle;
- (id)hostedAppSceneHandles;
- (int64_t)tetheringModeForScenePersistenceIdentifier:(id)a3 pipContentType:(int64_t)a4;
- (void)_enumerateControllersByDescendingPriority:(id)a3;
- (void)handleDestructionRequestForSceneHandles:(id)a3;
- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3;
- (void)registerController:(id)a3 forType:(int64_t)a4;
- (void)setPictureInPictureWindowsHidden:(BOOL)a3 withReason:(id)a4;
- (void)setWindowSceneManager:(id)a3;
@end

@implementation SBPIPControllerCoordinator

- (BOOL)isPresentingPictureInPictureRequiringMedusaKeyboard
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __81__SBPIPControllerCoordinator_isPresentingPictureInPictureRequiringMedusaKeyboard__block_invoke;
  v4[3] = &unk_1E6B06B98;
  v4[4] = &v5;
  [(SBPIPControllerCoordinator *)self _enumerateControllersByDescendingPriority:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isHostingAnApp
{
  char v2 = [(SBPIPControllerCoordinator *)self hostedAppSceneHandles];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)hasIdleTimerBehaviors
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__SBPIPControllerCoordinator_hasIdleTimerBehaviors__block_invoke;
  v4[3] = &unk_1E6B06B98;
  v4[4] = &v5;
  [(SBPIPControllerCoordinator *)self _enumerateControllersByDescendingPriority:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)hostedAppSceneHandles
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__SBPIPControllerCoordinator_hostedAppSceneHandles__block_invoke;
  v6[3] = &unk_1E6AF4F48;
  id v4 = v3;
  id v7 = v4;
  [(SBPIPControllerCoordinator *)self _enumerateControllersByDescendingPriority:v6];

  return v4;
}

- (void)_enumerateControllersByDescendingPriority:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, unsigned char *))a3;
  if (_enumerateControllersByDescendingPriority__onceToken != -1) {
    dispatch_once(&_enumerateControllersByDescendingPriority__onceToken, &__block_literal_global_241);
  }
  char v15 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = (id)_enumerateControllersByDescendingPriority____typesByPriority;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = -[NSMutableDictionary objectForKey:](self->_controllersByType, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        if (v10)
        {
          v4[2](v4, v10, &v15);
          if (v15)
          {

            goto LABEL_14;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

void __51__SBPIPControllerCoordinator_hostedAppSceneHandles__block_invoke(uint64_t a1, void *a2)
{
  char v2 = *(void **)(a1 + 32);
  id v3 = [a2 hostedAppSceneHandles];
  [v2 addObjectsFromArray:v3];
}

uint64_t __51__SBPIPControllerCoordinator_hasIdleTimerBehaviors__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 hasIdleTimerBehaviors];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t __81__SBPIPControllerCoordinator_isPresentingPictureInPictureRequiringMedusaKeyboard__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 isPresentingPictureInPictureRequiringMedusaKeyboard];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t __64__SBPIPControllerCoordinator_isAnyPictureInPictureWindowVisible__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 isPictureInPictureWindowVisibleOnWindowScene:0];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)shouldStartPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:(int)a3 scenePersistenceIdentifier:(id)a4 pipContentType:(int64_t)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  v9 = [(SBPIPControllerCoordinator *)self controllerForType:a5];
  LOBYTE(v6) = [v9 shouldStartPictureInPictureForApplicationWithProcessIdentifierEnteringBackground:v6 scenePersistenceIdentifier:v8];

  return v6;
}

- (id)controllerForType:(int64_t)a3
{
  if (SBPIPContentTypeIsValid(a3))
  {
    uint64_t v6 = [NSNumber numberWithInteger:a3];
    uint64_t v7 = [(NSMutableDictionary *)self->_controllersByType objectForKey:v6];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = SBStringFromSBPIPContentType(a3);
    [v6 handleFailureInMethod:a2, self, @"SBPIPControllerCoordinator.m", 83, @"invalid contentType received: %@", v8 object file lineNumber description];

    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)isAnyPictureInPictureWindowVisible
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__SBPIPControllerCoordinator_isAnyPictureInPictureWindowVisible__block_invoke;
  v4[3] = &unk_1E6B06B98;
  v4[4] = &v5;
  [(SBPIPControllerCoordinator *)self _enumerateControllersByDescendingPriority:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (SBPIPControllerCoordinator)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBPIPControllerCoordinator;
  char v2 = [(SBPIPControllerCoordinator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
    controllersByType = v2->_controllersByType;
    v2->_controllersByType = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)setWindowSceneManager:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (SBWindowSceneManager *)a3;
  if (self->_windowSceneManager != v5)
  {
    objc_storeStrong((id *)&self->_windowSceneManager, a3);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    objc_super v6 = [(NSMutableDictionary *)self->_controllersByType objectEnumerator];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * i) setWindowSceneManager:v5];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)registerController:(id)a3 forType:(int64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!SBPIPContentTypeIsValid(a4))
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = SBStringFromSBPIPContentType(a4);
    [v8 handleFailureInMethod:a2, self, @"SBPIPControllerCoordinator.m", 61, @"Attempt to register pipController %@ for invalid contentType: %@", v7, v9 object file lineNumber description];
  }
  v10 = [NSNumber numberWithInteger:a4];
  long long v11 = [(NSMutableDictionary *)self->_controllersByType objectForKey:v10];
  if (v11)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = SBStringFromSBPIPContentType(a4);
    [v18 handleFailureInMethod:a2, self, @"SBPIPControllerCoordinator.m", 66, @"Attempt to register pipController %@ for type %@ when one is already registered: %@", v7, v19, v11 object file lineNumber description];
  }
  uint64_t v12 = [v7 contentType];
  if (v12 != a4)
  {
    unint64_t v20 = v12;
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = SBStringFromSBPIPContentType(a4);
    v23 = SBStringFromSBPIPContentType(v20);
    [v21 handleFailureInMethod:a2, self, @"SBPIPControllerCoordinator.m", 69, @"Attempt to register pipController %@ for contentType %@ when the pipController itself reports contentType %@", v7, v22, v23 object file lineNumber description];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v13 = self->_pictureInPictureWindowsHiddenReasons;
  uint64_t v14 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v25;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        [v7 setPictureInPictureWindowsHidden:1 forReason:*(void *)(*((void *)&v24 + 1) + 8 * v17++)];
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v15);
  }

  [v7 setWindowSceneManager:self->_windowSceneManager];
  [(NSMutableDictionary *)self->_controllersByType setObject:v7 forKey:v10];
}

void __72__SBPIPControllerCoordinator__enumerateControllersByDescendingPriority___block_invoke()
{
  v0 = (void *)_enumerateControllersByDescendingPriority____typesByPriority;
  _enumerateControllersByDescendingPriority____typesByPriority = (uint64_t)&unk_1F3348168;
}

- (void)setPictureInPictureWindowsHidden:(BOOL)a3 withReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  int v7 = [(NSMutableSet *)self->_pictureInPictureWindowsHiddenReasons containsObject:v6];
  if (v4)
  {
    if ((v7 & 1) == 0) {
      [(NSMutableSet *)self->_pictureInPictureWindowsHiddenReasons addObject:v6];
    }
  }
  else if (v7)
  {
    [(NSMutableSet *)self->_pictureInPictureWindowsHiddenReasons removeObject:v6];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__SBPIPControllerCoordinator_setPictureInPictureWindowsHidden_withReason___block_invoke;
  v9[3] = &unk_1E6AF5058;
  BOOL v11 = v4;
  id v10 = v6;
  id v8 = v6;
  [(SBPIPControllerCoordinator *)self _enumerateControllersByDescendingPriority:v9];
}

uint64_t __74__SBPIPControllerCoordinator_setPictureInPictureWindowsHidden_withReason___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPictureInPictureWindowsHidden:*(unsigned __int8 *)(a1 + 40) forReason:*(void *)(a1 + 32)];
}

- (int64_t)tetheringModeForScenePersistenceIdentifier:(id)a3 pipContentType:(int64_t)a4
{
  id v6 = a3;
  int v7 = [(SBPIPControllerCoordinator *)self controllerForType:a4];
  int64_t v8 = [v7 tetheringModeForScenePersistenceIdentifier:v6];

  return v8;
}

- (void)handleDestructionRequestForSceneHandles:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__SBPIPControllerCoordinator_handleDestructionRequestForSceneHandles___block_invoke;
  v6[3] = &unk_1E6AF4F48;
  id v7 = v4;
  id v5 = v4;
  [(SBPIPControllerCoordinator *)self _enumerateControllersByDescendingPriority:v6];
}

uint64_t __70__SBPIPControllerCoordinator_handleDestructionRequestForSceneHandles___block_invoke(uint64_t a1, void *a2)
{
  return [a2 handleDestructionRequestForSceneHandles:*(void *)(a1 + 32)];
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__80;
  uint64_t v15 = __Block_byref_object_dispose__80;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__SBPIPControllerCoordinator_coordinatorRequestedIdleTimerBehavior___block_invoke;
  v8[3] = &unk_1E6B06BC0;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  [(SBPIPControllerCoordinator *)self _enumerateControllersByDescendingPriority:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __68__SBPIPControllerCoordinator_coordinatorRequestedIdleTimerBehavior___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = [a2 coordinatorRequestedIdleTimerBehavior:*(void *)(a1 + 32)];
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v5);
    id v5 = v6;
    *a3 = 1;
  }
}

- (BOOL)canHostAnApp
{
  return 1;
}

- (id)hostedAppSceneHandle
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"SBPIPControllerCoordinator.m", 211, @"%@ should never be called", v5 object file lineNumber description];

  return 0;
}

- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = NSStringFromSelector(a2);
  [v6 handleFailureInMethod:a2, self, @"SBPIPControllerCoordinator.m", 224, @"%@ should never be called", v5 object file lineNumber description];
}

- (SBWindowSceneManager)windowSceneManager
{
  return self->_windowSceneManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pictureInPictureWindowsHiddenReasons, 0);
  objc_storeStrong((id *)&self->_windowSceneManager, 0);
  objc_storeStrong((id *)&self->_controllersByType, 0);
}

@end