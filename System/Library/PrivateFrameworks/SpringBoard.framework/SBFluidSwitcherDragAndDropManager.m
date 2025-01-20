@interface SBFluidSwitcherDragAndDropManager
- (BOOL)_anyActiveAndVisibleSceneEntityMatches:(id)a3;
- (BOOL)_continuousExposeStripsOccluded;
- (BOOL)_workspaceWouldAllowTransitionToApplication:(id)a3;
- (BOOL)dragInteraction:(id)a3 sessionIsRestrictedToDraggingApplication:(id)a4;
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (BOOL)hasAddedSwitcherWindowAsDragTarget;
- (BOOL)isApplicationActiveAndVisible:(id)a3;
- (BOOL)isDragAndDropTransactionRunning;
- (BOOL)shouldBeginWindowDragGesture;
- (BOOL)windowDragHandledByDruid;
- (NSMapTable)activeDropSessions;
- (NSMutableSet)requiredContextIdentifiersForMedusaDraggingDestination;
- (NSString)windowDragSceneIdentifier;
- (SBDragAndDropWorkspaceTransaction)activeTransaction;
- (SBFluidSwitcherDragAndDropManager)initWithSwitcherController:(id)a3 delegate:(id)a4;
- (SBFluidSwitcherDragAndDropManagerDelegate)delegate;
- (SBFluidSwitcherViewController)switcherContentController;
- (SBSceneManager)sceneManager;
- (SBSwitcherController)switcherController;
- (SBWindowDragInteraction)windowDragInteraction;
- (UIDragSession)windowDragSession;
- (UIDropInteraction)dropInteraction;
- (id)_dragInteraction:(id)a3 customSpringAnimationBehaviorForCancellingItem:(id)a4;
- (id)_dropInteraction:(id)a3 customSpringAnimationBehaviorForDroppingItem:(id)a4;
- (id)_requiredContextIdentifiersForMedusaDraggingDestination;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (id)mostRecentSceneIdentityExcludingLiveScenesForApplication:(id)a3;
- (id)newSceneIdentityForApplication:(id)a3;
- (id)preferredSceneIdentityForApplication:(id)a3 targetContentIdentifier:(id)a4 preferNewScene:(BOOL)a5;
- (id)windowDragSessionPrepareCompletionBlock;
- (void)_addMedusaDraggingDestinationWindow:(id)a3;
- (void)_beginTrackingDropSessionIfNeeded:(id)a3;
- (void)_dragInteraction:(id)a3 prepareForSession:(id)a4 completion:(id)a5;
- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3;
- (void)_removeMedusaDraggingDestinationWindow:(id)a3;
- (void)_windowDragSessionDidEnd;
- (void)dealloc;
- (void)dragAndDropTransaction:(id)a3 didBeginGesture:(id)a4;
- (void)dragAndDropTransaction:(id)a3 didEndGesture:(id)a4;
- (void)dragAndDropTransaction:(id)a3 didPlatterizeWindowDragWithSceneIdentifier:(id)a4;
- (void)dragAndDropTransaction:(id)a3 didUpdateGesture:(id)a4;
- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 sessionDidMove:(id)a4;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5;
- (void)dropInteraction:(id)a3 concludeDrop:(id)a4;
- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4;
- (void)handleWindowDragGestureRecognizer:(id)a3;
- (void)setActiveDropSessions:(id)a3;
- (void)setActiveTransaction:(id)a3;
- (void)setDropInteraction:(id)a3;
- (void)setHasAddedSwitcherWindowAsDragTarget:(BOOL)a3;
- (void)setRequiredContextIdentifiersForMedusaDraggingDestination:(id)a3;
- (void)setWindowDragHandledByDruid:(BOOL)a3;
- (void)setWindowDragInteraction:(id)a3;
- (void)setWindowDragSceneIdentifier:(id)a3;
- (void)setWindowDragSession:(id)a3;
- (void)setWindowDragSessionPrepareCompletionBlock:(id)a3;
- (void)transactionDidComplete:(id)a3;
@end

@implementation SBFluidSwitcherDragAndDropManager

- (SBFluidSwitcherDragAndDropManager)initWithSwitcherController:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SBFluidSwitcherDragAndDropManager;
  v8 = [(SBFluidSwitcherDragAndDropManager *)&v24 init];
  if (v8)
  {
    v9 = [v6 contentViewController];
    uint64_t v10 = objc_opt_class();
    id v11 = v9;
    if (v10)
    {
      if (objc_opt_isKindOfClass()) {
        v12 = v11;
      }
      else {
        v12 = 0;
      }
    }
    else
    {
      v12 = 0;
    }
    id v13 = v12;

    objc_storeWeak((id *)&v8->_switcherController, v6);
    objc_storeWeak((id *)&v8->_switcherContentController, v13);
    v14 = [v6 windowScene];
    v15 = [v14 sceneManager];
    objc_storeWeak((id *)&v8->_sceneManager, v15);

    objc_storeWeak((id *)&v8->_delegate, v7);
    uint64_t v16 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    activeDropSessions = v8->_activeDropSessions;
    v8->_activeDropSessions = (NSMapTable *)v16;

    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F429D0]) initWithDelegate:v8];
    dropInteraction = v8->_dropInteraction;
    v8->_dropInteraction = (UIDropInteraction *)v18;

    [(UIDropInteraction *)v8->_dropInteraction _setWantsDefaultVisualBehavior:0];
    v20 = [v13 view];

    [v20 addInteraction:v8->_dropInteraction];
    v21 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    requiredContextIdentifiersForMedusaDraggingDestination = v8->_requiredContextIdentifiersForMedusaDraggingDestination;
    v8->_requiredContextIdentifiersForMedusaDraggingDestination = v21;
  }
  return v8;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  v4 = [WeakRetained view];

  [v4 removeInteraction:self->_dropInteraction];
  v5 = [v4 window];
  [(SBFluidSwitcherDragAndDropManager *)self _removeMedusaDraggingDestinationWindow:v5];

  v6.receiver = self;
  v6.super_class = (Class)SBFluidSwitcherDragAndDropManager;
  [(SBFluidSwitcherDragAndDropManager *)&v6 dealloc];
}

- (BOOL)shouldBeginWindowDragGesture
{
  v2 = [(SBFluidSwitcherDragAndDropManager *)self activeTransaction];
  char v3 = [v2 isDragging] ^ 1;

  return v3;
}

- (void)handleWindowDragGestureRecognizer:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!self->_hasAddedSwitcherWindowAsDragTarget)
  {
    self->_hasAddedSwitcherWindowAsDragTarget = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
    id v7 = [WeakRetained view];
    v8 = [v7 window];
    [(SBFluidSwitcherDragAndDropManager *)self _addMedusaDraggingDestinationWindow:v8];
  }
  uint64_t v9 = [v5 state];
  if ((unint64_t)(v9 - 5) > 0xFFFFFFFFFFFFFFFDLL)
  {
    if ((v9 != 4 || ![(UIDragInteraction *)self->_windowDragInteraction _isActive])
      && !self->_windowDragHandledByDruid)
    {
      [(SBFluidSwitcherDragAndDropManager *)self _windowDragSessionDidEnd];
    }
    v17 = [(UIDragInteraction *)self->_windowDragInteraction view];
    [v17 removeInteraction:self->_windowDragInteraction];

    windowDragInteraction = self->_windowDragInteraction;
    self->_windowDragInteraction = 0;
  }
  else
  {
    uint64_t v10 = [(SBFluidSwitcherDragAndDropManager *)self delegate];
    id v11 = v10;
    if (!self->_windowDragInteraction)
    {
      v12 = [v10 dragAndDropManager:self sourceViewProviderForDraggingWindowWithGestureRecognizer:v5];
      id v13 = [[SBWindowDragInteraction alloc] initWithDelegate:self gestureRecognizer:v5];
      v14 = self->_windowDragInteraction;
      self->_windowDragInteraction = v13;

      [(UIDragInteraction *)self->_windowDragInteraction setEnabled:0];
      [(SBWindowDragInteraction *)self->_windowDragInteraction setSourceViewProvider:v12];
      v15 = [v12 sourceView];
      [v15 addInteraction:self->_windowDragInteraction];
    }
    if (self->_windowDragSession)
    {
      uint64_t v16 = -[NSMapTable objectForKey:](self->_activeDropSessions, "objectForKey:");
      [(SBFluidSwitcherDragAndDropManager *)self _beginTrackingDropSessionIfNeeded:v16];
    }
    else
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v19 = objc_msgSend(v5, "_activeEvents", 0);
      uint64_t v20 = [v19 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v36;
LABEL_15:
        uint64_t v23 = 0;
        while (1)
        {
          if (*(void *)v36 != v22) {
            objc_enumerationMutation(v19);
          }
          objc_super v24 = *(void **)(*((void *)&v35 + 1) + 8 * v23);
          if (![v24 type]) {
            break;
          }
          if (v21 == ++v23)
          {
            uint64_t v21 = [v19 countByEnumeratingWithState:&v35 objects:v39 count:16];
            if (v21) {
              goto LABEL_15;
            }
            goto LABEL_21;
          }
        }
        v26 = [v5 _activeTouchesForEvent:v24];
        v25 = [v26 anyObject];

        if (!v25) {
          goto LABEL_28;
        }
        v27 = [v11 dragAndDropManager:self displayItemForDraggingWindowWithGestureRecognizer:v5];
        if (!v27)
        {
          v27 = [v11 dragAndDropManager:self displayItemForDraggingWindowWithGestureRecognizer:v5];
          if (!v27)
          {
            v34 = [MEMORY[0x1E4F28B00] currentHandler];
            [v34 handleFailureInMethod:a2 object:self file:@"SBFluidSwitcherDragAndDropManager.m" lineNumber:149 description:@"We expect a display item for this window drag"];

            v27 = 0;
          }
        }
        v28 = [v27 uniqueIdentifier];
        windowDragSceneIdentifier = self->_windowDragSceneIdentifier;
        self->_windowDragSceneIdentifier = v28;

        v30 = self->_windowDragInteraction;
        v31 = [v27 uniqueIdentifier];
        [(SBWindowDragInteraction *)v30 setSceneIdentifier:v31];

        v32 = self->_windowDragInteraction;
        v33 = [v27 bundleIdentifier];
        [(SBWindowDragInteraction *)v32 setBundleIdentifier:v33];

        [(UIDragInteraction *)self->_windowDragInteraction _immediatelyBeginDragWithTouch:v25 completion:0];
      }
      else
      {
LABEL_21:
        v25 = v19;
      }
    }
LABEL_28:
  }
}

- (BOOL)isDragAndDropTransactionRunning
{
  activeTransaction = self->_activeTransaction;
  if (activeTransaction) {
    LOBYTE(activeTransaction) = [(SBDragAndDropWorkspaceTransaction *)activeTransaction isComplete] ^ 1;
  }
  return (char)activeTransaction;
}

- (void)dragAndDropTransaction:(id)a3 didBeginGesture:(id)a4
{
  id v5 = a4;
  id v6 = [(SBFluidSwitcherDragAndDropManager *)self delegate];
  [v6 dragAndDropManager:self didBeginGesture:v5];
}

- (void)dragAndDropTransaction:(id)a3 didUpdateGesture:(id)a4
{
  id v5 = a4;
  id v6 = [(SBFluidSwitcherDragAndDropManager *)self delegate];
  [v6 dragAndDropManager:self didUpdateGesture:v5];
}

- (void)dragAndDropTransaction:(id)a3 didEndGesture:(id)a4
{
  id v5 = a4;
  id v6 = [(SBFluidSwitcherDragAndDropManager *)self delegate];
  [v6 dragAndDropManager:self didEndGesture:v5];
}

- (void)dragAndDropTransaction:(id)a3 didPlatterizeWindowDragWithSceneIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(SBFluidSwitcherDragAndDropManager *)self delegate];
  [v6 dragAndDropManager:self didPlatterizeWindowDragWithSceneIdentifier:v5];
}

- (BOOL)isApplicationActiveAndVisible:(id)a3
{
  v4 = [a3 bundleIdentifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__SBFluidSwitcherDragAndDropManager_isApplicationActiveAndVisible___block_invoke;
  v7[3] = &unk_1E6AF5C80;
  id v8 = v4;
  id v5 = v4;
  LOBYTE(self) = [(SBFluidSwitcherDragAndDropManager *)self _anyActiveAndVisibleSceneEntityMatches:v7];

  return (char)self;
}

uint64_t __67__SBFluidSwitcherDragAndDropManager_isApplicationActiveAndVisible___block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 application];
  v4 = [v3 bundleIdentifier];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (id)newSceneIdentityForApplication:(id)a3
{
  p_sceneManager = &self->_sceneManager;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_sceneManager);
  id v6 = (void *)[WeakRetained newSceneIdentityForApplication:v4];

  return v6;
}

- (id)mostRecentSceneIdentityExcludingLiveScenesForApplication:(id)a3
{
  p_sceneManager = &self->_sceneManager;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_sceneManager);
  id v7 = objc_loadWeakRetained((id *)&self->_switcherController);
  id v8 = [v7 activeAndVisibleSceneIdentifiersForApplication:v5];
  uint64_t v9 = [WeakRetained sceneIdentityForApplication:v5 excludingIdentifiers:v8];

  return v9;
}

- (id)preferredSceneIdentityForApplication:(id)a3 targetContentIdentifier:(id)a4 preferNewScene:(BOOL)a5
{
  BOOL v5 = a5;
  p_sceneManager = &self->_sceneManager;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_sceneManager);
  id v12 = objc_loadWeakRetained((id *)&self->_switcherController);
  id v13 = [v12 activeAndVisibleSceneIdentifiersForApplication:v10];
  v14 = [WeakRetained sceneIdentityForApplication:v10 targetContentIdentifier:v9 allowCanMatches:0 preferNewScene:v5 visibleIdentifiers:v13];

  return v14;
}

- (void)_dragInteraction:(id)a3 prepareForSession:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = SBLogMedusaDropDestination();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v29 = v10;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "SBAppDrop prepareForSession: %{public}@", buf, 0xCu);
  }

  if (self->_windowDragSession)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"SBFluidSwitcherDragAndDropManager.m" lineNumber:231 description:@"We already have a _windowDragSession."];
  }
  if (self->_windowDragSessionPrepareCompletionBlock)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"SBFluidSwitcherDragAndDropManager.m" lineNumber:232 description:@"We already have a _windowDragSessionPrepareCompletionBlock."];
  }
  uint64_t v13 = objc_opt_class();
  v14 = SBSafeCast(v13, v9);
  if (!v14)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"switcherDragInteraction != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBFluidSwitcherDragAndDropManager _dragInteraction:prepareForSession:completion:](a2, (uint64_t)self, (uint64_t)v27);
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8771AE4);
  }
  v15 = v14;
  uint64_t v16 = [v14 sceneIdentifier];
  id v17 = objc_alloc(MEMORY[0x1E4FA6998]);
  uint64_t v18 = [v15 bundleIdentifier];
  v19 = (void *)[v17 initWithUniqueIdentifier:v18 withLaunchActions:0 startLocation:8];

  [v19 setDraggedSceneIdentifier:v16];
  [v10 setLocalContext:v19];
  windowDragSession = self->_windowDragSession;
  self->_windowDragSession = (UIDragSession *)v10;
  id v21 = v10;

  uint64_t v22 = (void *)MEMORY[0x1D948C7A0](v11);
  id windowDragSessionPrepareCompletionBlock = self->_windowDragSessionPrepareCompletionBlock;
  self->_id windowDragSessionPrepareCompletionBlock = v22;

  objc_super v24 = +[SBApplicationDropSession dropSessionWithWindowUIDragSession:v21];
  [(NSMapTable *)self->_activeDropSessions setObject:v24 forKey:v21];

  [(SBFluidSwitcherDragAndDropManager *)self _beginTrackingDropSessionIfNeeded:v24];
}

- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = SBLogMedusaDropDestination();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "SBAppDrop _dragInteractionDidCancelLiftWithoutDragging: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  if (!self->_windowDragHandledByDruid) {
    [(SBFluidSwitcherDragAndDropManager *)self _windowDragSessionDidEnd];
  }
  id v6 = [(SBFluidSwitcherDragAndDropManager *)self activeTransaction];
  [v6 _dragInteractionDidCancelLiftWithoutDragging:v4];
}

- (id)_dragInteraction:(id)a3 customSpringAnimationBehaviorForCancellingItem:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = SBLogMedusaDropDestination();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(SBFluidSwitcherDragAndDropManager *)self activeDropSessions];
    int v13 = 138543362;
    v14 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "SBAppDrop customSpringAnimationBehaviorForCancellingItem: for activeDropSessions:%{public}@", (uint8_t *)&v13, 0xCu);
  }
  id v10 = [(SBFluidSwitcherDragAndDropManager *)self activeTransaction];
  id v11 = [v10 _dragInteraction:v7 customSpringAnimationBehaviorForCancellingItem:v6];

  return v11;
}

- (BOOL)dragInteraction:(id)a3 sessionIsRestrictedToDraggingApplication:(id)a4
{
  return 1;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = SBLogMedusaDropDestination();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "SBAppDrop itemsForBeginningSession: %{public}@", buf, 0xCu);
  }

  id v8 = [(SBFluidSwitcherDragAndDropManager *)self activeTransaction];
  if (([v8 matchesUIDragDropSession:v6] & 1) == 0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBFluidSwitcherDragAndDropManager.m", 287, @"%s called without an active transaction to handle the drag.", "-[SBFluidSwitcherDragAndDropManager dragInteraction:itemsForBeginningSession:]");
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  [v9 registerDataRepresentationForTypeIdentifier:@"com.apple.springboard.private.windowdrag" visibility:3 loadHandler:&__block_literal_global_21];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F429A0]) initWithItemProvider:v9];
  id v11 = [v6 localContext];
  [v10 setLocalObject:v11];

  uint64_t v15 = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];

  return v12;
}

uint64_t __78__SBFluidSwitcherDragAndDropManager_dragInteraction_itemsForBeginningSession___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F1C9B8];
  char v3 = a2;
  id v4 = [v2 data];
  v3[2](v3, v4, 0);

  return 0;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = SBLogMedusaDropDestination();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v11;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "SBAppDrop previewForLiftingItem: %{public}@", buf, 0xCu);
  }

  int v13 = [(SBFluidSwitcherDragAndDropManager *)self activeTransaction];
  if (([v13 matchesUIDragDropSession:v11] & 1) == 0)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBFluidSwitcherDragAndDropManager.m", 306, @"%s called without an active transaction to handle the drag.", "-[SBFluidSwitcherDragAndDropManager dragInteraction:previewForLiftingItem:session:]");
  }
  v14 = [v13 dragInteraction:v9 previewForLiftingItem:v10 session:v11];

  return v14;
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = SBLogMedusaDropDestination();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v11;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "SBAppDrop willAnimateLiftWithAnimator: %{public}@", buf, 0xCu);
  }

  int v13 = [(SBFluidSwitcherDragAndDropManager *)self activeTransaction];
  if (([v13 matchesUIDragDropSession:v11] & 1) == 0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBFluidSwitcherDragAndDropManager.m", 314, @"%s called without an active transaction to handle the drag.", "-[SBFluidSwitcherDragAndDropManager dragInteraction:willAnimateLiftWithAnimator:session:]");
  }
  [v13 dragInteraction:v9 willAnimateLiftWithAnimator:v10 session:v11];
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = SBLogMedusaDropDestination();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v8;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "SBAppDrop sessionWillBegin: %{public}@", buf, 0xCu);
  }

  self->_windowDragHandledByDruid = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained dragAndDropManager:self didBeginDraggingWindowWithSceneIdentifier:self->_windowDragSceneIdentifier];

  id v11 = [(SBFluidSwitcherDragAndDropManager *)self activeTransaction];
  if (([v11 matchesUIDragDropSession:v8] & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBFluidSwitcherDragAndDropManager.m", 325, @"%s called without an active transaction to handle the drag.", "-[SBFluidSwitcherDragAndDropManager dragInteraction:sessionWillBegin:]");
  }
  [v11 dragInteraction:v7 sessionWillBegin:v8];
}

- (void)dragInteraction:(id)a3 sessionDidMove:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(SBFluidSwitcherDragAndDropManager *)self activeTransaction];
  if ([v7 matchesUIDragDropSession:v6]) {
    [v7 dragInteraction:v8 sessionDidMove:v6];
  }
}

- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = SBLogMedusaDropDestination();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543618;
    id v14 = v9;
    __int16 v15 = 2048;
    unint64_t v16 = a5;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "SBAppDrop session: %{public}@ willEndWithOperation: %ld", (uint8_t *)&v13, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained dragAndDropManager:self willEndDraggingWindowWithSceneIdentifier:self->_windowDragSceneIdentifier];

  id v12 = [(SBFluidSwitcherDragAndDropManager *)self activeTransaction];
  if ([v12 matchesUIDragDropSession:v9]) {
    [v12 dragInteraction:v8 session:v9 willEndWithOperation:a5];
  }
  [(SBFluidSwitcherDragAndDropManager *)self _windowDragSessionDidEnd];
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = SBLogMedusaDropDestination();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    id v13 = v9;
    __int16 v14 = 2048;
    unint64_t v15 = a5;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "SBAppDrop session: %{public}@ didEndWithOperation: %ld", (uint8_t *)&v12, 0x16u);
  }

  id v11 = [(SBFluidSwitcherDragAndDropManager *)self activeTransaction];
  if ([v11 matchesUIDragDropSession:v9]) {
    [v11 dragInteraction:v8 session:v9 didEndWithOperation:a5];
  }
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = SBLogMedusaDropDestination();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [(SBFluidSwitcherDragAndDropManager *)self activeDropSessions];
    int v16 = 138543362;
    uint64_t v17 = v12;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "SBAppDrop previewForCancellingItem: for activeDropSessions:%{public}@", (uint8_t *)&v16, 0xCu);
  }
  id v13 = [(SBFluidSwitcherDragAndDropManager *)self activeTransaction];
  __int16 v14 = [v13 dragInteraction:v10 previewForCancellingItem:v9 withDefault:v8];

  return v14;
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = SBLogMedusaDropDestination();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [(SBFluidSwitcherDragAndDropManager *)self activeDropSessions];
    int v14 = 138543362;
    unint64_t v15 = v12;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "SBAppDrop willAnimateCancelWithAnimator: for activeDropSessions:%{public}@", (uint8_t *)&v14, 0xCu);
  }
  id v13 = [(SBFluidSwitcherDragAndDropManager *)self activeTransaction];
  [v13 dragInteraction:v10 item:v9 willAnimateCancelWithAnimator:v8];
}

- (void)_windowDragSessionDidEnd
{
  [(NSMapTable *)self->_activeDropSessions removeObjectForKey:self->_windowDragSession];
  windowDragSession = self->_windowDragSession;
  self->_windowDragSession = 0;

  id windowDragSessionPrepareCompletionBlock = self->_windowDragSessionPrepareCompletionBlock;
  self->_id windowDragSessionPrepareCompletionBlock = 0;

  windowDragSceneIdentifier = self->_windowDragSceneIdentifier;
  self->_windowDragSceneIdentifier = 0;

  self->_windowDragHandledByDruid = 0;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  BOOL v6 = +[SBApplicationDropSession canHandleUIDragDropSession:v5]|| [(SBFluidSwitcherDragAndDropManager *)self _continuousExposeStripsOccluded];
  id v7 = SBLogMedusaDropDestination();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v5;
    __int16 v11 = 1024;
    BOOL v12 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "SBAppDrop canHandleSession: %{public}@ -> %{BOOL}u", (uint8_t *)&v9, 0x12u);
  }

  return v6;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMapTable *)self->_activeDropSessions objectForKey:v7];
  int v9 = [MEMORY[0x1E4F1CA98] null];

  if (v8 == v9)
  {
    uint64_t v16 = SBLogMedusaDropDestination();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SBFluidSwitcherDragAndDropManager dropInteraction:sessionDidEnter:]((uint64_t)v7, v16);
    }
  }
  else
  {
    if (!v8)
    {
      activeDropSessions = self->_activeDropSessions;
      __int16 v11 = [v7 localDragSession];
      id v8 = [(NSMapTable *)activeDropSessions objectForKey:v11];

      BOOL v12 = SBLogMedusaDropDestination();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v13)
        {
          *(_DWORD *)buf = 138543362;
          id v27 = v7;
          _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "SBAppDrop sessionDidEnter: %{public}@ [local drag session]", buf, 0xCu);
        }

        int v14 = self->_activeDropSessions;
        unint64_t v15 = [v7 localDragSession];
        [(NSMapTable *)v14 removeObjectForKey:v15];

        [(NSMapTable *)self->_activeDropSessions setObject:v8 forKey:v7];
      }
      else
      {
        if (v13)
        {
          *(_DWORD *)buf = 138543362;
          id v27 = v7;
          _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "SBAppDrop sessionDidEnter: %{public}@ [loading drop session]", buf, 0xCu);
        }

        uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v18 = self->_activeDropSessions;
        uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
        [(NSMapTable *)v18 setObject:v19 forKey:v7];

        BOOL v20 = [(SBFluidSwitcherDragAndDropManager *)self _continuousExposeStripsOccluded];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __69__SBFluidSwitcherDragAndDropManager_dropInteraction_sessionDidEnter___block_invoke;
        v22[3] = &unk_1E6AF7C38;
        id v23 = v7;
        id v24 = v17;
        v25 = self;
        id v21 = v17;
        +[SBApplicationDropSession getDropSessionWithUIDropSession:v23 sceneProvider:self defaultToSourceApplication:v20 completion:v22];

        id v8 = 0;
      }
    }
    [(SBFluidSwitcherDragAndDropManager *)self _beginTrackingDropSessionIfNeeded:v8];
    uint64_t v16 = [(SBFluidSwitcherDragAndDropManager *)self activeTransaction];
    if ([v16 matchesUIDragDropSession:v7]) {
      [v16 dropInteraction:v6 sessionDidEnter:v7];
    }
  }
}

void __69__SBFluidSwitcherDragAndDropManager_dropInteraction_sessionDidEnter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v7 = SBLogMedusaDropDestination();
  id v8 = v7;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __69__SBFluidSwitcherDragAndDropManager_dropInteraction_sessionDidEnter___block_invoke_cold_1(a1, (uint64_t)v6, v8);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      [*(id *)(a1 + 40) timeIntervalSinceNow];
      int v11 = 138543618;
      uint64_t v12 = v9;
      __int16 v13 = 2048;
      double v14 = -v10;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "SBAppDrop sessionDidEnter: %{public}@ [loaded drop session] %.2fs", (uint8_t *)&v11, 0x16u);
    }

    [*(id *)(*(void *)(a1 + 48) + 64) setObject:v5 forKey:*(void *)(a1 + 32)];
  }
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSMapTable *)self->_activeDropSessions objectForKey:v7];
  uint64_t v9 = [MEMORY[0x1E4F1CA98] null];

  if (v8) {
    BOOL v10 = v8 == v9;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    int v11 = (void *)[objc_alloc(MEMORY[0x1E4F429D8]) initWithDropOperation:0];
  }
  else
  {
    [(SBFluidSwitcherDragAndDropManager *)self _beginTrackingDropSessionIfNeeded:v8];
    uint64_t v12 = [(SBFluidSwitcherDragAndDropManager *)self activeTransaction];
    if ([v12 matchesUIDragDropSession:v7])
    {
      uint64_t v13 = [v12 dropInteraction:v6 sessionDidUpdate:v7];
    }
    else
    {
      uint64_t v13 = [objc_alloc(MEMORY[0x1E4F429D8]) initWithDropOperation:0];
    }
    int v11 = (void *)v13;
  }
  return v11;
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = SBLogMedusaDropDestination();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "SBAppDrop sessionDidExit: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v9 = [(SBFluidSwitcherDragAndDropManager *)self activeTransaction];
  if ([v9 matchesUIDragDropSession:v7]) {
    [v9 dropInteraction:v6 sessionDidExit:v7];
  }
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBFluidSwitcherDragAndDropManager *)self activeTransaction];
  uint64_t v9 = SBLogMedusaDropDestination();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543874;
    id v11 = v6;
    __int16 v12 = 1024;
    int v13 = [v8 matchesUIDragDropSession:v6];
    __int16 v14 = 1024;
    BOOL v15 = v8 != 0;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "SBAppDrop performDrop: %{public}@, transaction exists for session: %{BOOL}u, transaction exists: %{BOOL}u", (uint8_t *)&v10, 0x18u);
  }

  [v8 dropInteraction:v7 performDrop:v6];
}

- (void)dropInteraction:(id)a3 concludeDrop:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = SBLogMedusaDropDestination();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "SBAppDrop concludeDrop: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v9 = [(SBFluidSwitcherDragAndDropManager *)self activeTransaction];
  if ([v9 matchesUIDragDropSession:v7]) {
    [v9 dropInteraction:v6 concludeDrop:v7];
  }
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = SBLogMedusaDropDestination();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = self->_activeTransaction != 0;
    int v11 = 138543618;
    id v12 = v7;
    __int16 v13 = 1024;
    BOOL v14 = v9;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "SBAppDrop sessionDidEnd: %{public}@, transaction exists: %{BOOL}u", (uint8_t *)&v11, 0x12u);
  }

  int v10 = [(SBFluidSwitcherDragAndDropManager *)self activeTransaction];
  [(NSMapTable *)self->_activeDropSessions removeObjectForKey:v7];
  if ([v10 matchesUIDragDropSession:v7]) {
    [v10 dropInteraction:v6 sessionDidEnd:v7];
  }
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = [(SBFluidSwitcherDragAndDropManager *)self activeTransaction];
  id v12 = SBLogMedusaDropDestination();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v13 = [(SBFluidSwitcherDragAndDropManager *)self activeDropSessions];
    int v16 = 138543618;
    uint64_t v17 = v13;
    __int16 v18 = 1024;
    BOOL v19 = v11 != 0;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "SBAppDrop previewForDroppingItem: for activeDropSessions:%{public}@, transaction exists: %{BOOL}u", (uint8_t *)&v16, 0x12u);
  }
  BOOL v14 = [v11 dropInteraction:v10 previewForDroppingItem:v9 withDefault:v8];

  return v14;
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = [(SBFluidSwitcherDragAndDropManager *)self activeTransaction];
  id v12 = SBLogMedusaDropDestination();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v13 = [(SBFluidSwitcherDragAndDropManager *)self activeDropSessions];
    int v14 = 138543618;
    uint64_t v15 = v13;
    __int16 v16 = 1024;
    BOOL v17 = v11 != 0;
    _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "SBAppDrop willAnimateDropWithAnimator: for activeDropSessions:%{public}@, transaction exists: %{BOOL}u", (uint8_t *)&v14, 0x12u);
  }
  [v11 dropInteraction:v10 item:v9 willAnimateDropWithAnimator:v8];
}

- (id)_dropInteraction:(id)a3 customSpringAnimationBehaviorForDroppingItem:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBFluidSwitcherDragAndDropManager *)self activeTransaction];
  id v9 = SBLogMedusaDropDestination();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(SBFluidSwitcherDragAndDropManager *)self activeDropSessions];
    int v13 = 138543618;
    int v14 = v10;
    __int16 v15 = 1024;
    BOOL v16 = v8 != 0;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "SBAppDrop customSpringAnimationBehaviorForDroppingItem: for activeDropSessions:%{public}@, transaction exists: %{BOOL}u", (uint8_t *)&v13, 0x12u);
  }
  int v11 = [v8 _dropInteraction:v7 customSpringAnimationBehaviorForDroppingItem:v6];

  return v11;
}

- (BOOL)_anyActiveAndVisibleSceneEntityMatches:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneManager);
  id v7 = [WeakRetained currentLayoutState];
  id v8 = SBSafeCast(v5, v7);

  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__SBFluidSwitcherDragAndDropManager__anyActiveAndVisibleSceneEntityMatches___block_invoke;
  v12[3] = &unk_1E6AF7C60;
  __int16 v15 = &v16;
  id v9 = v8;
  id v13 = v9;
  id v10 = v4;
  id v14 = v10;
  SBLayoutRoleEnumerateValidRoles(v12);
  LOBYTE(v8) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v8;
}

void __76__SBFluidSwitcherDragAndDropManager__anyActiveAndVisibleSceneEntityMatches___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v5 = [*(id *)(a1 + 32) elementWithRole:a2];
    char v3 = [v5 workspaceEntity];
    id v4 = [v3 applicationSceneEntity];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_beginTrackingDropSessionIfNeeded:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(SBFluidSwitcherDragAndDropManager *)self activeTransaction];

    if (!v5
      || ([(SBFluidSwitcherDragAndDropManager *)self activeTransaction],
          id v6 = objc_claimAutoreleasedReturnValue(),
          char v7 = [v6 matchesApplicationDropSession:v4],
          v6,
          (v7 & 1) == 0))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
      if (+[SBDragAndDropWorkspaceTransaction shouldTrackLocationOfDropSession:v4 forSwitcherController:WeakRetained])
      {
        id v9 = +[SBWorkspace mainWorkspace];
        id v10 = [v9 transientOverlayPresentationManager];

        int v11 = [MEMORY[0x1E4F624E0] sharedInstance];
        [v11 cancelEventsWithName:@"SBDragAndDrop"];

        id v12 = +[SBWorkspace mainWorkspace];
        id v13 = [WeakRetained windowScene];
        id v14 = [v13 _fbsDisplayConfiguration];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2;
        v16[3] = &unk_1E6AF7CF8;
        v16[4] = self;
        id v17 = v4;
        id v18 = v10;
        id v19 = WeakRetained;
        __int16 v15 = v10;
        [v12 requestTransitionWithOptions:0 displayConfiguration:v14 builder:&__block_literal_global_55_0 validator:v16];
      }
      else
      {
        __int16 v15 = SBLogMedusaDropDestination();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v21 = v4;
          _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_INFO, "SBAppDrop _beginTrackingDropSessionIfNedeed: not starting tracking %{public}@ [not within drop boundary]", buf, 0xCu);
        }
      }
    }
  }
}

void __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setSource:27];
  [v2 setEventLabel:@"SBDragAndDrop"];
}

uint64_t __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = NSAllMapTableValues(*((NSMapTable **)a1[4] + 8));
  int v5 = [v4 containsObject:a1[5]];

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)a1[4] + 4);
    char v7 = [WeakRetained currentLayoutState];

    id v8 = [a1[5] application];
    char v9 = [a1[4] _workspaceWouldAllowTransitionToApplication:v8];
    uint64_t v10 = [v7 unlockedEnvironmentMode];
    int v11 = [a1[5] localContext];
    uint64_t v12 = [v11 startLocation];

    id v13 = [a1[5] localContext];
    uint64_t v14 = [v13 startLocation];

    if (v8)
    {
      if (v10 == 2
        && ([a1[5] localContext],
            __int16 v15 = objc_claimAutoreleasedReturnValue(),
            uint64_t v16 = [v15 startLocation],
            v15,
            v16 != 11))
      {
        id v19 = SBLogMedusaDropDestination();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_8();
        }
      }
      else
      {
        id v17 = [v7 elements];
        uint64_t v18 = [v17 count];

        if (v18 || v10 == 2)
        {
          if ((unint64_t)(v10 - 4) > 0xFFFFFFFFFFFFFFFDLL)
          {
            if (SBPeekConfigurationIsValid([v7 peekConfiguration]))
            {
              id v19 = SBLogMedusaDropDestination();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
                __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_4();
              }
            }
            else if ([a1[6] hasActivePresentation] {
                   && [a1[6] activePresentationPreventsDragAndDrop])
            }
            {
              id v19 = SBLogMedusaDropDestination();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
                __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_5();
              }
            }
            else
            {
              if (v9)
              {
                if (v12 != 8 && v14 != 11 && ([a1[7] isChamoisWindowingUIEnabled] & 1) == 0)
                {
                  id v21 = a1[4];
                  v30[0] = MEMORY[0x1E4F143A8];
                  v30[1] = 3221225472;
                  v30[2] = __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_56;
                  v30[3] = &unk_1E6AF7CA8;
                  v30[4] = v21;
                  id v31 = a1[5];
                  if ([v21 _anyActiveAndVisibleSceneEntityMatches:v30])
                  {
                    uint64_t v22 = SBLogMedusaDropDestination();
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
                      __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_6();
                    }

                    goto LABEL_35;
                  }
                }
                v26[0] = MEMORY[0x1E4F143A8];
                v26[1] = 3221225472;
                v26[2] = __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_57;
                v26[3] = &unk_1E6AF7CD0;
                id v27 = a1[7];
                id v24 = a1[5];
                id v25 = a1[4];
                id v28 = v24;
                id v29 = v25;
                [v3 setTransactionProvider:v26];

                uint64_t v20 = 1;
                goto LABEL_36;
              }
              id v19 = SBLogMedusaDropDestination();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
                __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_7();
              }
            }
          }
          else
          {
            id v19 = SBLogMedusaDropDestination();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_3(v7, v19);
            }
          }
        }
        else
        {
          id v19 = SBLogMedusaDropDestination();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_2();
          }
        }
      }
    }
    else
    {
      id v19 = SBLogMedusaDropDestination();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_1();
      }
    }

LABEL_35:
    uint64_t v20 = 0;
LABEL_36:

    goto LABEL_37;
  }
  uint64_t v20 = 0;
LABEL_37:

  return v20;
}

uint64_t __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_56(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 application];
  int v5 = [v3 sceneHandle];

  id v6 = [v5 sceneIdentifier];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  id v8 = [WeakRetained sceneIdentityForApplication:v4 uniqueIdentifier:v6];

  char v9 = [*(id *)(a1 + 40) sceneIdentity];
  uint64_t v10 = [v8 isEqual:v9];

  return v10;
}

SBDragAndDropWorkspaceTransaction *__71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_57(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[SBDragAndDropWorkspaceTransaction alloc] initWithTransitionRequest:v3 switcherController:*(void *)(a1 + 32) dropSession:*(void *)(a1 + 40) delegate:*(void *)(a1 + 48)];

  int v5 = [*(id *)(a1 + 40) uiDragDropSession];
  id v6 = SBFSafeProtocolCast();

  if (v6) {
    [(SBDragAndDropWorkspaceTransaction *)v4 dropInteraction:*(void *)(*(void *)(a1 + 48) + 48) sessionDidEnter:v6];
  }
  [(SBDragAndDropWorkspaceTransaction *)v4 addObserver:*(void *)(a1 + 48)];
  [*(id *)(a1 + 48) setActiveTransaction:v4];
  char v7 = [*(id *)(a1 + 40) uiDragDropSession];
  uint64_t v8 = *(void *)(a1 + 48);
  if (v7 == *(void **)(v8 + 80))
  {
    uint64_t v9 = *(void *)(v8 + 88);

    if (!v9) {
      goto LABEL_7;
    }
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 48) + 88) + 16))();
    uint64_t v10 = *(void *)(a1 + 48);
    char v7 = *(void **)(v10 + 88);
    *(void *)(v10 + 88) = 0;
  }

LABEL_7:
  return v4;
}

- (BOOL)_workspaceWouldAllowTransitionToApplication:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(SBWorkspaceApplicationSceneTransitionContext);
  int v5 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationForMainDisplay:v3];

  [(SBWorkspaceApplicationSceneTransitionContext *)v4 setEntity:v5 forLayoutRole:1];
  id v6 = +[SBWorkspace mainWorkspace];
  char v7 = [v6 createRequestWithOptions:0];
  [v7 setSource:27];
  [v7 setEventLabel:@"DragAndDrop"];
  [v7 setApplicationContext:v4];
  char v8 = [v6 canExecuteTransitionRequest:v7];

  return v8;
}

- (id)_requiredContextIdentifiersForMedusaDraggingDestination
{
  return (id)[(NSMutableSet *)self->_requiredContextIdentifiersForMedusaDraggingDestination allObjects];
}

- (void)_addMedusaDraggingDestinationWindow:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    uint64_t v4 = [v8 _contextId];
    if (v4)
    {
      requiredContextIdentifiersForMedusaDraggingDestination = self->_requiredContextIdentifiersForMedusaDraggingDestination;
      id v6 = [NSNumber numberWithUnsignedInt:v4];
      [(NSMutableSet *)requiredContextIdentifiersForMedusaDraggingDestination addObject:v6];
    }
  }
  char v7 = [(SBFluidSwitcherDragAndDropManager *)self _requiredContextIdentifiersForMedusaDraggingDestination];
  SBSSetRequiredContextIdsForMedusaDragAndDropForSpotlightOnly();
}

- (void)_removeMedusaDraggingDestinationWindow:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    uint64_t v4 = [v8 _contextId];
    if (v4)
    {
      requiredContextIdentifiersForMedusaDraggingDestination = self->_requiredContextIdentifiersForMedusaDraggingDestination;
      id v6 = [NSNumber numberWithUnsignedInt:v4];
      [(NSMutableSet *)requiredContextIdentifiersForMedusaDraggingDestination removeObject:v6];
    }
  }
  char v7 = [(SBFluidSwitcherDragAndDropManager *)self _requiredContextIdentifiersForMedusaDraggingDestination];
  SBSSetRequiredContextIdsForMedusaDragAndDropForSpotlightOnly();
}

- (BOOL)_continuousExposeStripsOccluded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  if ([WeakRetained isChamoisWindowingUIEnabled])
  {
    id v4 = objc_loadWeakRetained((id *)&self->_switcherContentController);
    int v5 = [v4 _areContinuousExposeStripsUnoccluded] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)transactionDidComplete:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = SBLogMedusaDropDestination();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  char v7 = SBLogMedusaDropDestination();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      [(SBFluidSwitcherDragAndDropManager *)v4 transactionDidComplete:v8];
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(SBFluidSwitcherDragAndDropManager *)self activeTransaction];
    v11[0] = 67109120;
    v11[1] = v9 == v4;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "SBAppDrop transactionDidComplete: Matches active transaction: %{BOOL}u", (uint8_t *)v11, 8u);
  }
  id v10 = [(SBFluidSwitcherDragAndDropManager *)self activeTransaction];

  if (v10 == v4) {
    [(SBFluidSwitcherDragAndDropManager *)self setActiveTransaction:0];
  }
}

- (SBSwitcherController)switcherController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherController);
  return (SBSwitcherController *)WeakRetained;
}

- (SBFluidSwitcherViewController)switcherContentController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switcherContentController);
  return (SBFluidSwitcherViewController *)WeakRetained;
}

- (SBSceneManager)sceneManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneManager);
  return (SBSceneManager *)WeakRetained;
}

- (SBFluidSwitcherDragAndDropManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFluidSwitcherDragAndDropManagerDelegate *)WeakRetained;
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (void)setDropInteraction:(id)a3
{
}

- (SBDragAndDropWorkspaceTransaction)activeTransaction
{
  return self->_activeTransaction;
}

- (void)setActiveTransaction:(id)a3
{
}

- (NSMapTable)activeDropSessions
{
  return self->_activeDropSessions;
}

- (void)setActiveDropSessions:(id)a3
{
}

- (SBWindowDragInteraction)windowDragInteraction
{
  return self->_windowDragInteraction;
}

- (void)setWindowDragInteraction:(id)a3
{
}

- (UIDragSession)windowDragSession
{
  return self->_windowDragSession;
}

- (void)setWindowDragSession:(id)a3
{
}

- (id)windowDragSessionPrepareCompletionBlock
{
  return self->_windowDragSessionPrepareCompletionBlock;
}

- (void)setWindowDragSessionPrepareCompletionBlock:(id)a3
{
}

- (NSString)windowDragSceneIdentifier
{
  return self->_windowDragSceneIdentifier;
}

- (void)setWindowDragSceneIdentifier:(id)a3
{
}

- (BOOL)windowDragHandledByDruid
{
  return self->_windowDragHandledByDruid;
}

- (void)setWindowDragHandledByDruid:(BOOL)a3
{
  self->_windowDragHandledByDruid = a3;
}

- (BOOL)hasAddedSwitcherWindowAsDragTarget
{
  return self->_hasAddedSwitcherWindowAsDragTarget;
}

- (void)setHasAddedSwitcherWindowAsDragTarget:(BOOL)a3
{
  self->_hasAddedSwitcherWindowAsDragTarget = a3;
}

- (NSMutableSet)requiredContextIdentifiersForMedusaDraggingDestination
{
  return self->_requiredContextIdentifiersForMedusaDraggingDestination;
}

- (void)setRequiredContextIdentifiersForMedusaDraggingDestination:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredContextIdentifiersForMedusaDraggingDestination, 0);
  objc_storeStrong((id *)&self->_windowDragSceneIdentifier, 0);
  objc_storeStrong(&self->_windowDragSessionPrepareCompletionBlock, 0);
  objc_storeStrong((id *)&self->_windowDragSession, 0);
  objc_storeStrong((id *)&self->_windowDragInteraction, 0);
  objc_storeStrong((id *)&self->_activeDropSessions, 0);
  objc_storeStrong((id *)&self->_activeTransaction, 0);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_sceneManager);
  objc_destroyWeak((id *)&self->_switcherContentController);
  objc_destroyWeak((id *)&self->_switcherController);
}

- (void)_dragInteraction:(const char *)a1 prepareForSession:(uint64_t)a2 completion:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v5 = NSStringFromSelector(a1);
  BOOL v6 = (objc_class *)objc_opt_class();
  char v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  id v9 = v5;
  __int16 v10 = 2114;
  int v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  __int16 v15 = @"SBFluidSwitcherDragAndDropManager.m";
  __int16 v16 = 1024;
  int v17 = 235;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (void)dropInteraction:(uint64_t)a1 sessionDidEnter:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "SBAppDrop sessionDidEnter: %{public}@ ignoring already attempted session", (uint8_t *)&v2, 0xCu);
}

void __69__SBFluidSwitcherDragAndDropManager_dropInteraction_sessionDidEnter___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "SBAppDrop getDropSessionWithUIDropSession: %{public}@ error: %{public}@", (uint8_t *)&v4, 0x16u);
}

void __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1D85BA000, v0, v1, "SBAppDrop not creating transaction [could not bind drop item to application]", v2, v3, v4, v5, v6);
}

void __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1D85BA000, v0, v1, "SBAppDrop not creating transaction [layout state has 0 elements]", v2, v3, v4, v5, v6);
}

void __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = SBStringForUnlockedEnvironmentMode([a1 unlockedEnvironmentMode]);
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "SBAppDrop not creating transaction [unlocked environment is %{public}@]", (uint8_t *)&v4, 0xCu);
}

void __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_4()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1D85BA000, v0, v1, "SBAppDrop not creating transaction because a peek state is active.", v2, v3, v4, v5, v6);
}

void __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_5()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1D85BA000, v0, v1, "SBAppDrop not creating transaction [transient overlay presentation manager has active presentation that prevents Drag and Drop]", v2, v3, v4, v5, v6);
}

void __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_6()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1D85BA000, v0, v1, "SBAppDrop not creating transaction [scene already visible]", v2, v3, v4, v5, v6);
}

void __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_7()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1D85BA000, v0, v1, "SBAppDrop not creating transaction [workspace would not allow the child transaction to run]", v2, v3, v4, v5, v6);
}

void __71__SBFluidSwitcherDragAndDropManager__beginTrackingDropSessionIfNeeded___block_invoke_2_cold_8()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1D85BA000, v0, v1, "SBAppDrop not creating transaction because we're in the app switcher and the drag did not start from a switcher card.", v2, v3, v4, v5, v6);
}

- (void)transactionDidComplete:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 activeTransaction];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 1024;
  BOOL v9 = v5 == a1;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "SBAppDrop transactionDidComplete: %{public}@ Matches active transaction: %{BOOL}u", (uint8_t *)&v6, 0x12u);
}

@end