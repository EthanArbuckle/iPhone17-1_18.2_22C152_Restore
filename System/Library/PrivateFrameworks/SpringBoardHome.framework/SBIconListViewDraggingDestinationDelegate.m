@interface SBIconListViewDraggingDestinationDelegate
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (BOOL)stopTrackingDragForDropSessionIfPossible:(id)a3;
- (BOOL)updateCurrentPolicyHandlerForDropSession:(id)a3;
- (BOOL)updateSpringLoadedPolicyHandlerForDropSession:(id)a3;
- (NSString)description;
- (SBIconListView)iconListView;
- (SBIconListViewDraggingDestinationDelegate)initWithIconListView:(id)a3;
- (SBIconListViewDraggingPolicyHandling)currentPolicyHandler;
- (SBIconListViewDraggingPolicyHandling)springLoadingPolicyHandler;
- (UIDropInteraction)dropInteraction;
- (id)_dropInteraction:(id)a3 customSpringAnimationBehaviorForDroppingItem:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)dragContextForDropSession:(id)a3 createIfNecessary:(BOOL)a4;
- (id)dragContextForIdentifier:(id)a3 createIfNecessary:(BOOL)a4;
- (id)dragDelegate;
- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (id)startTrackingDragForDropSession:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)targetItemForSpringLoadingInteractionInView:(id)a3 atLocation:(CGPoint)a4 forDropSession:(id)a5;
- (id)targetViewForSpringLoadingEffectForView:(id)a3;
- (id)uniqueIdentifierForDropSession:(id)a3;
- (unint64_t)currentDragType;
- (unint64_t)currentSpringLoadedDragType;
- (unint64_t)dragTypeForDropSession:(id)a3;
- (void)_handleSpringloadAndComplete:(id)a3;
- (void)_resetSpringLoadingPolicyHandler;
- (void)addDragObserver:(id)a3 forDropSession:(id)a4;
- (void)dropInteraction:(id)a3 concludeDrop:(id)a4;
- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4;
- (void)setCurrentDragType:(unint64_t)a3;
- (void)setCurrentPolicyHandler:(id)a3;
- (void)setCurrentSpringLoadedDragType:(unint64_t)a3;
- (void)setSpringLoadingPolicyHandler:(id)a3;
- (void)stopTrackingDragForIdentifier:(id)a3;
@end

@implementation SBIconListViewDraggingDestinationDelegate

- (SBIconListViewDraggingDestinationDelegate)initWithIconListView:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBIconListViewDraggingDestinationDelegate;
  v5 = [(SBIconListViewDraggingDestinationDelegate *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4FB1738]) initWithDelegate:v5];
    dropInteraction = v5->_dropInteraction;
    v5->_dropInteraction = (UIDropInteraction *)v6;

    [(UIDropInteraction *)v5->_dropInteraction setAllowsSimultaneousDropSessions:1];
    [(UIDropInteraction *)v5->_dropInteraction _setWantsDefaultVisualBehavior:0];
    [v4 addInteraction:v5->_dropInteraction];
    objc_storeWeak((id *)&v5->_iconListView, v4);
    id v8 = objc_alloc_init(MEMORY[0x1E4FA5FE8]);
    id v9 = objc_alloc_init(MEMORY[0x1E4FA5FF0]);
    [v8 setDelegate:v5];
    [v9 setDelegate:v5];
    [v9 setUseFastBlinkAnimation:1];
    objc_initWeak(&location, v5);
    id v10 = objc_alloc(MEMORY[0x1E4FB1C50]);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __66__SBIconListViewDraggingDestinationDelegate_initWithIconListView___block_invoke;
    v16 = &unk_1E6AAED30;
    objc_copyWeak(&v17, &location);
    v11 = (void *)[v10 initWithInteractionBehavior:v8 interactionEffect:v9 activationHandler:&v13];
    objc_msgSend(v4, "addInteraction:", v11, v13, v14, v15, v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __66__SBIconListViewDraggingDestinationDelegate_initWithIconListView___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _handleSpringloadAndComplete:v4];
}

- (id)dragDelegate
{
  v2 = [(SBIconListViewDraggingDestinationDelegate *)self iconListView];
  v3 = [v2 effectiveDragDelegate];

  return v3;
}

- (id)uniqueIdentifierForDropSession:(id)a3
{
  id v3 = a3;
  id v4 = [v3 localDragSession];
  v5 = [v4 localContext];
  uint64_t v6 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = v5;
    if (!v4) {
      goto LABEL_7;
    }
  }
  else
  {
    id v8 = 0;
    if (!v4) {
      goto LABEL_7;
    }
  }
  if (!v8)
  {
    objc_getAssociatedObject(v3, &uniqueIdentifierForDropSession__SBIconListViewDraggingDestinationDelegateDropSessionUniqueIdentifier);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_7:
  if (!v8)
  {
    objc_getAssociatedObject(v3, &uniqueIdentifierForDropSession__SBIconListViewDraggingDestinationDelegateDropSessionUniqueIdentifier);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F29128]);
      objc_setAssociatedObject(v3, &uniqueIdentifierForDropSession__SBIconListViewDraggingDestinationDelegateDropSessionUniqueIdentifier, v8, (void *)0x301);
      if (v4)
      {
        objc_setAssociatedObject(v4, &uniqueIdentifierForDropSession__SBIconListViewDraggingDestinationDelegateDropSessionUniqueIdentifier, v8, (void *)0x301);
        [v4 setLocalContext:v8];
      }
    }
  }

  return v8;
}

- (id)startTrackingDragForDropSession:(id)a3
{
  return [(SBIconListViewDraggingDestinationDelegate *)self dragContextForDropSession:a3 createIfNecessary:1];
}

- (BOOL)stopTrackingDragForDropSessionIfPossible:(id)a3
{
  id v4 = [(SBIconListViewDraggingDestinationDelegate *)self uniqueIdentifierForDropSession:a3];
  if (v4)
  {
    v5 = [(SBIconListViewDraggingDestinationDelegate *)self dragContextForIdentifier:v4 createIfNecessary:1];
    uint64_t v6 = v5;
    if (v5 && v5[18] && (!v5[16] || v5[17]))
    {
      [(SBIconListViewDraggingDestinationDelegate *)self stopTrackingDragForIdentifier:v4];
      BOOL v7 = 1;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)stopTrackingDragForIdentifier:(id)a3
{
  id v7 = a3;
  uint64_t v4 = -[SBIconListViewDraggingDestinationDelegate dragContextForIdentifier:createIfNecessary:](self, "dragContextForIdentifier:createIfNecessary:");
  v5 = (void *)v4;
  if (v4)
  {
    uint64_t v6 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = 0;
  }
  [(NSMutableDictionary *)self->_dragContexts removeObjectForKey:v7];
  if (![(NSMutableDictionary *)self->_dragContexts count])
  {
    [(SBIconListViewDraggingDestinationDelegate *)self setCurrentPolicyHandler:0];
    [(SBIconListViewDraggingDestinationDelegate *)self setCurrentDragType:0];
  }
}

- (id)dragContextForDropSession:(id)a3 createIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [(SBIconListViewDraggingDestinationDelegate *)self uniqueIdentifierForDropSession:a3];
  if (v6)
  {
    id v7 = [(SBIconListViewDraggingDestinationDelegate *)self dragContextForIdentifier:v6 createIfNecessary:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)dragContextForIdentifier:(id)a3 createIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->_dragContexts objectForKey:v6];
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    if (!self->_dragContexts)
    {
      id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      dragContexts = self->_dragContexts;
      self->_dragContexts = v9;
    }
    id v7 = objc_alloc_init(SBIconListViewDragContext);
    [(NSMutableDictionary *)self->_dragContexts setObject:v7 forKey:v6];
  }

  return v7;
}

- (void)addDragObserver:(id)a3 forDropSession:(id)a4
{
  id v6 = a3;
  id v7 = [(SBIconListViewDraggingDestinationDelegate *)self dragContextForDropSession:a4 createIfNecessary:1];
  -[SBIconListViewDragContext addDragObserver:]((uint64_t)v7, v6);
}

- (unint64_t)dragTypeForDropSession:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SBIconListViewDraggingDestinationDelegate *)self iconListView];
  id v6 = [v5 iconDragTypeIdentifier];

  if (v6)
  {
    v11[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    int v8 = [v4 hasItemsConformingToTypeIdentifiers:v7];

    if (v8) {
      unint64_t v9 = 1;
    }
    else {
      unint64_t v9 = 2;
    }
  }
  else
  {
    unint64_t v9 = 2;
  }

  return v9;
}

- (BOOL)updateCurrentPolicyHandlerForDropSession:(id)a3
{
  unint64_t v4 = [(SBIconListViewDraggingDestinationDelegate *)self dragTypeForDropSession:a3];
  unint64_t v5 = [(SBIconListViewDraggingDestinationDelegate *)self currentDragType];
  BOOL result = v4 == v5;
  if (v4 && !v5)
  {
    if (v4 == 1)
    {
      id v7 = off_1E6AABC98;
    }
    else
    {
      if (v4 != 2)
      {
        id v8 = 0;
        goto LABEL_9;
      }
      id v7 = off_1E6AABCA0;
    }
    id v8 = objc_alloc_init(*v7);
    [v8 setDraggingDestinationDelegate:self];
LABEL_9:
    [(SBIconListViewDraggingDestinationDelegate *)self setCurrentPolicyHandler:v8];
    [(SBIconListViewDraggingDestinationDelegate *)self setCurrentDragType:v4];

    return 1;
  }
  return result;
}

- (BOOL)updateSpringLoadedPolicyHandlerForDropSession:(id)a3
{
  unint64_t v4 = [(SBIconListViewDraggingDestinationDelegate *)self dragTypeForDropSession:a3];
  unint64_t v5 = [(SBIconListViewDraggingDestinationDelegate *)self currentSpringLoadedDragType];
  BOOL result = v4 == v5;
  if (v4 && !v5)
  {
    if (v4 == 1)
    {
      id v7 = off_1E6AABC98;
    }
    else
    {
      if (v4 != 2)
      {
        id v8 = 0;
        goto LABEL_9;
      }
      id v7 = off_1E6AABCA0;
    }
    id v8 = objc_alloc_init(*v7);
    [v8 setDraggingDestinationDelegate:self];
LABEL_9:
    [(SBIconListViewDraggingDestinationDelegate *)self setSpringLoadingPolicyHandler:v8];
    [(SBIconListViewDraggingDestinationDelegate *)self setCurrentSpringLoadedDragType:v4];

    return 1;
  }
  return result;
}

- (NSString)description
{
  return (NSString *)[(SBIconListViewDraggingDestinationDelegate *)self descriptionWithMultilinePrefix:0];
}

- (id)targetItemForSpringLoadingInteractionInView:(id)a3 atLocation:(CGPoint)a4 forDropSession:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a5;
  id v10 = a3;
  BOOL v11 = [(SBIconListViewDraggingDestinationDelegate *)self updateSpringLoadedPolicyHandlerForDropSession:v9];
  v12 = [(SBIconListViewDraggingDestinationDelegate *)self springLoadingPolicyHandler];
  objc_opt_class();
  uint64_t v13 = SBFSafeCast();

  if (![v13 isDragSpringloadingEnabled]) {
    goto LABEL_12;
  }
  uint64_t v14 = objc_msgSend(v13, "iconAtPoint:index:", 0, x, y);
  uint64_t v15 = objc_msgSend(v12, "dragHitRegionForDropSession:iconListView:point:icon:", v9, v13, v14, x, y) & 2;
  if (v14) {
    BOOL v16 = v15 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16)
  {
LABEL_11:

LABEL_12:
    id v17 = 0;
    goto LABEL_13;
  }
  id v17 = [v13 iconViewForIcon:v14];

  if (!v17)
  {
LABEL_13:
    [(SBIconListViewDraggingDestinationDelegate *)self _resetSpringLoadingPolicyHandler];
    goto LABEL_14;
  }
  if (![v12 allowsSpringLoadForSession:v9 onIconView:v17])
  {
    uint64_t v14 = v17;
    goto LABEL_11;
  }
  if (!v11) {
    goto LABEL_13;
  }
LABEL_14:

  return v17;
}

- (id)targetViewForSpringLoadingEffectForView:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  unint64_t v4 = SBFSafeCast();

  unint64_t v5 = [v4 _iconImageView];
  if (!v5)
  {
    id v6 = [v4 customIconImageViewController];
    if (objc_opt_respondsToSelector())
    {
      unint64_t v5 = [v6 springLoadingEffectTargetView];
    }
    else
    {
      unint64_t v5 = 0;
    }
  }
  return v5;
}

- (void)_handleSpringloadAndComplete:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  unint64_t v5 = [v4 targetItem];

  SBFSafeCast();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [(SBIconListViewDraggingDestinationDelegate *)self springLoadingPolicyHandler];
  [v6 handleSpringLoadOnIconView:v7];
}

- (void)_resetSpringLoadingPolicyHandler
{
  [(SBIconListViewDraggingDestinationDelegate *)self setSpringLoadingPolicyHandler:0];
  [(SBIconListViewDraggingDestinationDelegate *)self setCurrentSpringLoadedDragType:0];
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBIconListViewDraggingDestinationDelegate *)self iconListView];
  uint64_t v9 = [v8 contentVisibility];

  if (v9)
  {
    BOOL v10 = 0;
  }
  else
  {
    BOOL v11 = [(SBIconListViewDraggingDestinationDelegate *)self updateCurrentPolicyHandlerForDropSession:v7];
    v12 = [(SBIconListViewDraggingDestinationDelegate *)self currentPolicyHandler];
    if (v11
      && ((objc_opt_respondsToSelector() & 1) == 0
       || ([v12 dropInteraction:v6 canHandleSession:v7] & 1) != 0))
    {
      BOOL v10 = 1;
    }
    else
    {
      [(SBIconListViewDraggingDestinationDelegate *)self setCurrentPolicyHandler:0];
      [(SBIconListViewDraggingDestinationDelegate *)self setCurrentDragType:0];
      BOOL v10 = 0;
    }
  }
  return v10;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(SBIconListViewDraggingDestinationDelegate *)self startTrackingDragForDropSession:v6];
  id v8 = [(SBIconListViewDraggingDestinationDelegate *)self currentPolicyHandler];
  if (objc_opt_respondsToSelector()) {
    [v8 dropInteraction:v9 sessionDidEnter:v6];
  }
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBIconListViewDraggingDestinationDelegate *)self currentPolicyHandler];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [v8 dropInteraction:v6 sessionDidUpdate:v7];
  }
  else
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4FB1740]) initWithDropOperation:0];
  }
  BOOL v10 = (void *)v9;

  return v10;
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(SBIconListViewDraggingDestinationDelegate *)self currentPolicyHandler];
  if (objc_opt_respondsToSelector()) {
    [v7 dropInteraction:v8 sessionDidExit:v6];
  }
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(SBIconListViewDraggingDestinationDelegate *)self currentPolicyHandler];
  if (objc_opt_respondsToSelector()) {
    [v7 dropInteraction:v9 performDrop:v6];
  }
  id v8 = [(SBIconListViewDraggingDestinationDelegate *)self dragContextForDropSession:v6 createIfNecessary:1];
  if (v8) {
    v8[16] = 1;
  }
}

- (void)dropInteraction:(id)a3 concludeDrop:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBIconListViewDraggingDestinationDelegate *)self currentPolicyHandler];
  if (objc_opt_respondsToSelector()) {
    [v8 dropInteraction:v6 concludeDrop:v7];
  }
  id v9 = [(SBIconListViewDraggingDestinationDelegate *)self dragContextForDropSession:v7 createIfNecessary:1];
  BOOL v10 = [(SBIconListViewDraggingDestinationDelegate *)self iconListView];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __74__SBIconListViewDraggingDestinationDelegate_dropInteraction_concludeDrop___block_invoke;
  BOOL v16 = &unk_1E6AB3A08;
  id v17 = v10;
  id v18 = v7;
  id v11 = v7;
  id v12 = v10;
  -[SBIconListViewDragContext enumerateDragObserversUsingBlock:]((uint64_t)v9, &v13);
  if (v9) {
    v9[17] = 1;
  }
  -[SBIconListViewDraggingDestinationDelegate stopTrackingDragForDropSessionIfPossible:](self, "stopTrackingDragForDropSessionIfPossible:", v11, v13, v14, v15, v16);
}

uint64_t __74__SBIconListViewDraggingDestinationDelegate_dropInteraction_concludeDrop___block_invoke(uint64_t a1, void *a2)
{
  return [a2 iconListView:*(void *)(a1 + 32) concludeIconDrop:*(void *)(a1 + 40)];
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBIconListViewDraggingDestinationDelegate *)self currentPolicyHandler];
  if (objc_opt_respondsToSelector()) {
    [v8 dropInteraction:v6 sessionDidEnd:v7];
  }
  id v9 = [(SBIconListViewDraggingDestinationDelegate *)self dragContextForDropSession:v7 createIfNecessary:1];
  BOOL v10 = [(SBIconListViewDraggingDestinationDelegate *)self iconListView];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __75__SBIconListViewDraggingDestinationDelegate_dropInteraction_sessionDidEnd___block_invoke;
  BOOL v16 = &unk_1E6AB3A08;
  id v17 = v10;
  id v18 = v7;
  id v11 = v7;
  id v12 = v10;
  -[SBIconListViewDragContext enumerateDragObserversUsingBlock:]((uint64_t)v9, &v13);
  if (v9) {
    v9[18] = 1;
  }
  -[SBIconListViewDraggingDestinationDelegate stopTrackingDragForDropSessionIfPossible:](self, "stopTrackingDragForDropSessionIfPossible:", v11, v13, v14, v15, v16);
}

uint64_t __75__SBIconListViewDraggingDestinationDelegate_dropInteraction_sessionDidEnd___block_invoke(uint64_t a1, void *a2)
{
  return [a2 iconListView:*(void *)(a1 + 32) iconDropSessionDidEnd:*(void *)(a1 + 40)];
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SBIconListViewDraggingDestinationDelegate *)self currentPolicyHandler];
  id v12 = v10;
  uint64_t v13 = v12;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v13 = [v11 dropInteraction:v8 previewForDroppingItem:v9 withDefault:v12];
  }
  objc_msgSend(v13, "set_springboardPlatterStyle:", 1);

  return v13;
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(SBIconListViewDraggingDestinationDelegate *)self currentPolicyHandler];
  if (objc_opt_respondsToSelector()) {
    [v10 dropInteraction:v11 item:v8 willAnimateDropWithAnimator:v9];
  }
}

- (id)_dropInteraction:(id)a3 customSpringAnimationBehaviorForDroppingItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBIconListViewDraggingDestinationDelegate *)self currentPolicyHandler];
  if (objc_opt_respondsToSelector())
  {
    id v9 = [v8 _dropInteraction:v6 customSpringAnimationBehaviorForDroppingItem:v7];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)succinctDescription
{
  v2 = [(SBIconListViewDraggingDestinationDelegate *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBIconListViewDraggingDestinationDelegate *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBIconListViewDraggingDestinationDelegate *)self succinctDescriptionBuilder];
  unint64_t v5 = [(SBIconListViewDraggingDestinationDelegate *)self dropInteraction];
  id v6 = (id)[v4 appendObject:v5 withName:@"dropInteraction"];

  id v7 = (id)objc_msgSend(v4, "appendInteger:withName:", -[SBIconListViewDraggingDestinationDelegate currentDragType](self, "currentDragType"), @"currentDragType");
  id v8 = [(SBIconListViewDraggingDestinationDelegate *)self currentPolicyHandler];
  id v9 = (id)[v4 appendObject:v8 withName:@"currentPolicyHandler"];

  id v10 = [(SBIconListViewDraggingDestinationDelegate *)self springLoadingPolicyHandler];
  id v11 = (id)[v4 appendObject:v10 withName:@"springLoadingPolicyHandler"];

  return v4;
}

- (SBIconListView)iconListView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconListView);
  return (SBIconListView *)WeakRetained;
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (unint64_t)currentDragType
{
  return self->_currentDragType;
}

- (void)setCurrentDragType:(unint64_t)a3
{
  self->_currentDragType = a3;
}

- (SBIconListViewDraggingPolicyHandling)currentPolicyHandler
{
  return self->_currentPolicyHandler;
}

- (void)setCurrentPolicyHandler:(id)a3
{
}

- (unint64_t)currentSpringLoadedDragType
{
  return self->_currentSpringLoadedDragType;
}

- (void)setCurrentSpringLoadedDragType:(unint64_t)a3
{
  self->_currentSpringLoadedDragType = a3;
}

- (SBIconListViewDraggingPolicyHandling)springLoadingPolicyHandler
{
  return self->_springLoadingPolicyHandler;
}

- (void)setSpringLoadingPolicyHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springLoadingPolicyHandler, 0);
  objc_storeStrong((id *)&self->_currentPolicyHandler, 0);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_destroyWeak((id *)&self->_iconListView);
  objc_storeStrong((id *)&self->_dragContexts, 0);
}

@end