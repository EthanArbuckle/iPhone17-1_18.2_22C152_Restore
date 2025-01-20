@interface SBHLibraryIndicatorIconDropInteractionDelegate
- (BOOL)_canPerformDropForAnyItemInSession:(id)a3;
- (BOOL)_canPerformDropForDragItem:(id)a3;
- (BOOL)_canPerformDropForDraggedIcon:(id)a3;
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (SBHLibraryIndicatorIconDropInteractionContextProviding)contextProvider;
- (SBHLibraryIndicatorIconDropInteractionDelegate)initWithLibraryIndicatorIconView:(id)a3;
- (SBIconView)libraryIndicatorIconView;
- (UIDropInteraction)dropInteraction;
- (id)_draggedItemIdentifiersInSession:(id)a3;
- (id)_iconIdentifierForDragItem:(id)a3;
- (id)_iconModel;
- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (id)targetItemForSpringLoadingInteractionInView:(id)a3 atLocation:(CGPoint)a4 forDropSession:(id)a5;
- (id)targetViewForSpringLoadingEffectForView:(id)a3;
- (void)_handleSpringLoadedInteractionDidActivateWithContext:(id)a3;
- (void)_notifyDidPerformDropForSession:(id)a3;
- (void)_updateIndicatorIconViewForSession:(id)a3 isActive:(BOOL)a4;
- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4;
- (void)setContextProvider:(id)a3;
@end

@implementation SBHLibraryIndicatorIconDropInteractionDelegate

- (SBHLibraryIndicatorIconDropInteractionDelegate)initWithLibraryIndicatorIconView:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SBHLibraryIndicatorIconDropInteractionDelegate;
  v5 = [(SBHLibraryIndicatorIconDropInteractionDelegate *)&v20 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_libraryIndicatorIconView, v4);
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4FB1738]) initWithDelegate:v6];
    dropInteraction = v6->_dropInteraction;
    v6->_dropInteraction = (UIDropInteraction *)v7;

    [(UIDropInteraction *)v6->_dropInteraction _setWantsDefaultVisualBehavior:0];
    [v4 addInteraction:v6->_dropInteraction];
    id v9 = objc_alloc_init(MEMORY[0x1E4FA5FE8]);
    id v10 = objc_alloc_init(MEMORY[0x1E4FA5FF0]);
    [v9 setDelegate:v6];
    [v10 setDelegate:v6];
    [v10 setUseFastBlinkAnimation:1];
    objc_initWeak(&location, v6);
    id v11 = objc_alloc(MEMORY[0x1E4FB1C50]);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __83__SBHLibraryIndicatorIconDropInteractionDelegate_initWithLibraryIndicatorIconView___block_invoke;
    v17 = &unk_1E6AAED30;
    objc_copyWeak(&v18, &location);
    v12 = (void *)[v11 initWithInteractionBehavior:v9 interactionEffect:v10 activationHandler:&v14];
    objc_msgSend(v4, "addInteraction:", v12, v14, v15, v16, v17);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v6;
}

void __83__SBHLibraryIndicatorIconDropInteractionDelegate_initWithLibraryIndicatorIconView___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _handleSpringLoadedInteractionDidActivateWithContext:v4];
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = *MEMORY[0x1E4FA6E60];
  v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a4;
  uint64_t v7 = [v5 arrayWithObjects:&v12 count:1];
  int v8 = objc_msgSend(v6, "hasItemsConformingToTypeIdentifiers:", v7, v12, v13);

  if (!v8) {
    return 0;
  }
  id v9 = [(SBHLibraryIndicatorIconDropInteractionDelegate *)self libraryIndicatorIconView];
  char v10 = [v9 isEditing];

  return v10;
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  if ([(SBHLibraryIndicatorIconDropInteractionDelegate *)self _canPerformDropForAnyItemInSession:a4])
  {
    uint64_t v4 = 3;
  }
  else
  {
    uint64_t v4 = 0;
  }
  v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1740]) initWithDropOperation:v4];
  return v5;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(SBHLibraryIndicatorIconDropInteractionDelegate *)self _iconModel];
  uint64_t v7 = [v6 rootFolder];
  int v8 = [(SBHLibraryIndicatorIconDropInteractionDelegate *)self _draggedItemIdentifiersInSession:v5];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [v6 leafIconForIdentifier:*(void *)(*((void *)&v15 + 1) + 8 * v12)];
        if ([(SBHLibraryIndicatorIconDropInteractionDelegate *)self _canPerformDropForDraggedIcon:v13])
        {
          uint64_t v14 = [v7 ignoredList];
          [v14 addIcon:v13];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
  [(SBHLibraryIndicatorIconDropInteractionDelegate *)self _notifyDidPerformDropForSession:v5];
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v7 = a5;
  if ([(SBHLibraryIndicatorIconDropInteractionDelegate *)self _canPerformDropForDragItem:a4])
  {
    int v8 = [(SBHLibraryIndicatorIconDropInteractionDelegate *)self libraryIndicatorIconView];
    [v8 bounds];
    UIRectGetCenter();
    double v10 = v9;
    double v12 = v11;
    memset(&v18, 0, sizeof(v18));
    CGAffineTransformMakeScale(&v18, 0.01, 0.01);
    id v13 = objc_alloc(MEMORY[0x1E4FB1728]);
    CGAffineTransform v17 = v18;
    uint64_t v14 = objc_msgSend(v13, "initWithContainer:center:transform:", v8, &v17, v10, v12);
    long long v15 = [v7 retargetedPreviewWithTarget:v14];
    objc_msgSend(v15, "set_springboardPlatterStyle:", 1);
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  id v6 = a5;
  id v7 = objc_msgSend(a4, "sbh_appDragLocalContext");
  int v8 = [v7 portaledPreview];
  if (objc_opt_respondsToSelector()) {
    double v9 = v8;
  }
  else {
    double v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __99__SBHLibraryIndicatorIconDropInteractionDelegate_dropInteraction_item_willAnimateDropWithAnimator___block_invoke;
    v14[3] = &unk_1E6AAC810;
    id v11 = v10;
    id v15 = v11;
    [v6 addAnimations:v14];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __99__SBHLibraryIndicatorIconDropInteractionDelegate_dropInteraction_item_willAnimateDropWithAnimator___block_invoke_2;
    v12[3] = &unk_1E6AACB50;
    id v13 = v11;
    [v6 addCompletion:v12];
  }
}

uint64_t __99__SBHLibraryIndicatorIconDropInteractionDelegate_dropInteraction_item_willAnimateDropWithAnimator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIconAllowsLabelArea:0];
  [*(id *)(a1 + 32) setIconAllowsAccessory:0];
  [*(id *)(a1 + 32) setIconCanShowCloseBox:0];
  v2 = *(void **)(a1 + 32);
  return [v2 setDragState:3];
}

uint64_t __99__SBHLibraryIndicatorIconDropInteractionDelegate_dropInteraction_item_willAnimateDropWithAnimator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dropDestinationAnimationCompleted];
}

- (id)targetItemForSpringLoadingInteractionInView:(id)a3 atLocation:(CGPoint)a4 forDropSession:(id)a5
{
  if (-[SBHLibraryIndicatorIconDropInteractionDelegate _canPerformDropForAnyItemInSession:](self, "_canPerformDropForAnyItemInSession:", a5, a4.x, a4.y))
  {
    id v6 = [(SBHLibraryIndicatorIconDropInteractionDelegate *)self libraryIndicatorIconView];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)targetViewForSpringLoadingEffectForView:(id)a3
{
  v3 = [(SBHLibraryIndicatorIconDropInteractionDelegate *)self libraryIndicatorIconView];
  uint64_t v4 = [v3 customIconImageViewController];
  id v5 = [v4 springLoadingEffectTargetView];

  return v5;
}

- (id)_iconIdentifierForDragItem:(id)a3
{
  v3 = objc_msgSend(a3, "sbh_appDragLocalContext");
  uint64_t v4 = [v3 uniqueIdentifier];

  return v4;
}

- (id)_draggedItemIdentifiersInSession:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  CGAffineTransform v18 = v4;
  id v6 = [v4 items];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        double v12 = objc_msgSend(v11, "sbh_appDragLocalContext");
        id v13 = [(SBHLibraryIndicatorIconDropInteractionDelegate *)self _iconIdentifierForDragItem:v11];
        if (v13) {
          [v5 addObject:v13];
        }
        uint64_t v14 = [v12 containedIconIdentifiers];
        id v15 = v14;
        if (v14)
        {
          long long v16 = [v14 allObjects];
          [v5 addObjectsFromArray:v16];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_canPerformDropForAnyItemInSession:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBHLibraryIndicatorIconDropInteractionDelegate *)self _iconModel];
  [(SBHLibraryIndicatorIconDropInteractionDelegate *)self _draggedItemIdentifiersInSession:v4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(v5, "leafIconForIdentifier:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        BOOL v12 = [(SBHLibraryIndicatorIconDropInteractionDelegate *)self _canPerformDropForDraggedIcon:v11];

        if (v12)
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)_canPerformDropForDragItem:(id)a3
{
  v3 = self;
  id v4 = [(SBHLibraryIndicatorIconDropInteractionDelegate *)self _iconIdentifierForDragItem:a3];
  id v5 = [(SBHLibraryIndicatorIconDropInteractionDelegate *)v3 _iconModel];
  id v6 = [v5 leafIconForIdentifier:v4];

  LOBYTE(v3) = [(SBHLibraryIndicatorIconDropInteractionDelegate *)v3 _canPerformDropForDraggedIcon:v6];
  return (char)v3;
}

- (BOOL)_canPerformDropForDraggedIcon:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = [(SBHLibraryIndicatorIconDropInteractionDelegate *)self _iconModel];
  id v6 = [v5 rootFolder];
  uint64_t v7 = [v6 ignoredList];

  LOBYTE(v6) = [v7 isAllowedToContainIcon:v4];
  return (char)v6;
}

- (id)_iconModel
{
  v3 = [(SBHLibraryIndicatorIconDropInteractionDelegate *)self contextProvider];
  id v4 = [(SBHLibraryIndicatorIconDropInteractionDelegate *)self libraryIndicatorIconView];
  id v5 = [v3 iconModelForDroppingIntoLibraryIndicatorIconView:v4];

  return v5;
}

- (void)_notifyDidPerformDropForSession:(id)a3
{
  id v4 = a3;
  id v6 = [(SBHLibraryIndicatorIconDropInteractionDelegate *)self contextProvider];
  id v5 = [(SBHLibraryIndicatorIconDropInteractionDelegate *)self libraryIndicatorIconView];
  [v6 libraryIndicatorIconView:v5 didAcceptDropForSession:v4];
}

- (void)_handleSpringLoadedInteractionDidActivateWithContext:(id)a3
{
  id v5 = [(SBHLibraryIndicatorIconDropInteractionDelegate *)self contextProvider];
  id v4 = [(SBHLibraryIndicatorIconDropInteractionDelegate *)self libraryIndicatorIconView];
  [v5 handleSpringLoadDidActivateForLibraryIndicatorIconView:v4];
}

- (void)_updateIndicatorIconViewForSession:(id)a3 isActive:(BOOL)a4
{
  int v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(SBHLibraryIndicatorIconDropInteractionDelegate *)self libraryIndicatorIconView];
  if (v4) {
    int v4 = [(SBHLibraryIndicatorIconDropInteractionDelegate *)self _canPerformDropForAnyItemInSession:v6];
  }
  uint64_t v8 = [v7 customIconImageViewController];
  if (v4 != [v8 isOverlapping])
  {
    uint64_t v9 = (void *)MEMORY[0x1E4FB1EB0];
    +[SBHIconManager defaultIconLayoutAnimationDuration];
    double v11 = v10;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __94__SBHLibraryIndicatorIconDropInteractionDelegate__updateIndicatorIconViewForSession_isActive___block_invoke;
    v12[3] = &unk_1E6AAD728;
    id v13 = v8;
    char v14 = v4;
    [v9 animateWithDuration:v12 animations:v11];
  }
}

uint64_t __94__SBHLibraryIndicatorIconDropInteractionDelegate__updateIndicatorIconViewForSession_isActive___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOverlapping:*(unsigned __int8 *)(a1 + 40)];
}

- (SBIconView)libraryIndicatorIconView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryIndicatorIconView);
  return (SBIconView *)WeakRetained;
}

- (SBHLibraryIndicatorIconDropInteractionContextProviding)contextProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contextProvider);
  return (SBHLibraryIndicatorIconDropInteractionContextProviding *)WeakRetained;
}

- (void)setContextProvider:(id)a3
{
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_destroyWeak((id *)&self->_contextProvider);
  objc_destroyWeak((id *)&self->_libraryIndicatorIconView);
}

@end