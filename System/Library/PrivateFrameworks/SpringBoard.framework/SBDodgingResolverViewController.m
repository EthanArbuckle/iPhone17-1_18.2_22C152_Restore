@interface SBDodgingResolverViewController
- (BOOL)isDispatchingEvent;
- (BOOL)needsLayout;
- (BOOL)needsModelUpdate;
- (CGRect)contentViewBounds;
- (NSMutableArray)eventQueue;
- (NSMutableDictionary)itemsForIdentifiers;
- (NSMutableSet)itemsNeedingNonAnimatedUpdate;
- (NSMutableSet)itemsNeedingUpdate;
- (SBDodgingModel)model;
- (SBDodgingResolverViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SBRootDodgingLayerModifier)rootModifier;
- (UILabel)debugOverlay;
- (double)spaceBetweenIdentifiers;
- (id)addItemWithIdentifier:(id)a3 view:(id)a4 initialCenter:(CGPoint)a5 initialSize:(CGSize)a6 delegate:(id)a7;
- (id)invalidateItem:(id)a3;
- (id)preferenceForIdentifier:(id)a3;
- (int64_t)contentOrientation;
- (int64_t)interfaceOrientation;
- (unint64_t)lastUpdateTimeNS;
- (void)_dispatchNextEventIfNeededAndHandleResponse;
- (void)_dispatchOrAppendEvent:(id)a3;
- (void)_handleEventResponse:(id)a3;
- (void)_performEventResponse:(id)a3;
- (void)_performInvalidationResponse:(id)a3;
- (void)_performScheduleEventResponse:(id)a3;
- (void)_setAllItemsNeedUpdate;
- (void)_setItemNeedsUpdate:(id)a3;
- (void)_setNeedsLayout;
- (void)_setNeedsModelUpdate;
- (void)_updateItemIfNeeded:(id)a3;
- (void)_updateItemsIfNeeded;
- (void)_updateLayoutIfNeeded;
- (void)_updateLayoutWithItemIdentifier:(id)a3 completion:(id)a4;
- (void)_updateModelIfNeeded;
- (void)loadView;
- (void)performTransitionFromOrientation:(int64_t)a3 toOrientation:(int64_t)a4 animated:(BOOL)a5 mutationBlock:(id)a6;
- (void)setContentOrientation:(int64_t)a3;
- (void)setDebugOverlay:(id)a3;
- (void)setDispatchingEvent:(BOOL)a3;
- (void)setEventQueue:(id)a3;
- (void)setItemNeedsUpdate:(id)a3 animated:(BOOL)a4;
- (void)setItemsForIdentifiers:(id)a3;
- (void)setItemsNeedingNonAnimatedUpdate:(id)a3;
- (void)setItemsNeedingUpdate:(id)a3;
- (void)setLastUpdateTimeNS:(unint64_t)a3;
- (void)setModel:(id)a3;
- (void)setNeedsLayout:(BOOL)a3;
- (void)setNeedsModelUpdate:(BOOL)a3;
- (void)setRootModifier:(id)a3;
- (void)viewDidLoad;
@end

@implementation SBDodgingResolverViewController

- (SBDodgingResolverViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)SBDodgingResolverViewController;
  v4 = [(SBDodgingResolverViewController *)&v19 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    eventQueue = v4->_eventQueue;
    v4->_eventQueue = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    itemsNeedingUpdate = v4->_itemsNeedingUpdate;
    v4->_itemsNeedingUpdate = (NSMutableSet *)v7;

    uint64_t v9 = objc_opt_new();
    itemsNeedingNonAnimatedUpdate = v4->_itemsNeedingNonAnimatedUpdate;
    v4->_itemsNeedingNonAnimatedUpdate = (NSMutableSet *)v9;

    v11 = objc_alloc_init(SBRootDodgingLayerModifier);
    rootModifier = v4->_rootModifier;
    v4->_rootModifier = v11;

    [(SBRootDodgingLayerModifier *)v4->_rootModifier setDelegate:v4];
    v13 = [SBDodgingModel alloc];
    uint64_t v14 = -[SBDodgingModel initWithReferenceBounds:](v13, "initWithReferenceBounds:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    model = v4->_model;
    v4->_model = (SBDodgingModel *)v14;

    uint64_t v16 = objc_opt_new();
    itemsForIdentifiers = v4->_itemsForIdentifiers;
    v4->_itemsForIdentifiers = (NSMutableDictionary *)v16;
  }
  return v4;
}

- (id)addItemWithIdentifier:(id)a3 view:(id)a4 initialCenter:(CGPoint)a5 initialSize:(CGSize)a6 delegate:(id)a7
{
  double height = a6.height;
  double width = a6.width;
  double y = a5.y;
  double x = a5.x;
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  v18 = [(NSMutableDictionary *)self->_itemsForIdentifiers objectForKey:v15];

  if (v18)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    v25 = [(SBDodgingResolverViewController *)self description];
    [v24 handleFailureInMethod:a2, self, @"SBDodgingResolverViewController.m", 78, @"%@ already exists in %@", v15, v25 object file lineNumber description];
  }
  objc_super v19 = [[SBDodgingItem alloc] initWithUniqueIdentifier:v15 view:v16 delegate:v17 dodgingResolverViewController:self];
  [(NSMutableDictionary *)self->_itemsForIdentifiers setObject:v19 forKey:v15];
  if (v16)
  {
    v20 = [(SBDodgingResolverViewController *)self view];
    [v20 addSubview:v16];
  }
  v21 = [v17 dodgingResolver:self preferenceForDodgingItem:v19];
  [(SBDodgingItem *)v19 setPreference:v21];

  v22 = -[SBInsertionDodgingModifierEvent initWithIdentifier:center:size:]([SBInsertionDodgingModifierEvent alloc], "initWithIdentifier:center:size:", v15, x, y, width, height);
  [(SBDodgingResolverViewController *)self _dispatchOrAppendEvent:v22];

  return v19;
}

- (id)invalidateItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [SBRemovalDodgingModifierEvent alloc];
  v6 = [v4 uniqueIdentifier];
  uint64_t v7 = [(SBRemovalDodgingModifierEvent *)v5 initWithIdentifier:v6];

  [(SBDodgingResolverViewController *)self _dispatchOrAppendEvent:v7];
  v8 = [v4 view];
  uint64_t v9 = v8;
  if (v8) {
    [v8 removeFromSuperview];
  }
  itemsForIdentifiers = self->_itemsForIdentifiers;
  v11 = [v4 uniqueIdentifier];
  [(NSMutableDictionary *)itemsForIdentifiers removeObjectForKey:v11];

  return v9;
}

- (void)setItemNeedsUpdate:(id)a3 animated:(BOOL)a4
{
  id v7 = a3;
  __uint64_t v6 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  [(NSMutableSet *)self->_itemsNeedingUpdate addObject:v7];
  if (!a4) {
    [(NSMutableSet *)self->_itemsNeedingNonAnimatedUpdate addObject:v7];
  }
  [(SBDodgingResolverViewController *)self _updateItemIfNeeded:v7];
  self->_lastUpdateTimeNS = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v6;
}

- (void)performTransitionFromOrientation:(int64_t)a3 toOrientation:(int64_t)a4 animated:(BOOL)a5 mutationBlock:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  v11 = [MEMORY[0x1E4F29128] UUID];
  v12 = [[SBRotationDodgingModifierEvent alloc] initWithIdentifier:v11 fromOrientation:a3 toOrientation:a4 phase:0];
  [(SBDodgingResolverViewController *)self _dispatchOrAppendEvent:v12];
  v13 = 0;
  if (v6)
  {
    v13 = +[SBAnimationUtilities animationSettingsForRotationFromInterfaceOrientation:a3 toInterfaceOrientation:a4];
  }
  uint64_t v14 = (void *)MEMORY[0x1E4F4F898];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __105__SBDodgingResolverViewController_performTransitionFromOrientation_toOrientation_animated_mutationBlock___block_invoke;
  v22[3] = &unk_1E6B0A580;
  id v24 = v10;
  int64_t v25 = a4;
  v22[4] = self;
  id v23 = v11;
  int64_t v26 = a3;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __105__SBDodgingResolverViewController_performTransitionFromOrientation_toOrientation_animated_mutationBlock___block_invoke_2;
  v17[3] = &unk_1E6B0A5A8;
  int64_t v20 = a3;
  int64_t v21 = a4;
  id v18 = v23;
  objc_super v19 = self;
  id v15 = v23;
  id v16 = v10;
  [v14 animateWithSettings:v13 actions:v22 completion:v17];
}

void __105__SBDodgingResolverViewController_performTransitionFromOrientation_toOrientation_animated_mutationBlock___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 1008) = *(void *)(a1 + 56);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) _setAllItemsNeedUpdate];
  [*(id *)(a1 + 32) _updateItemsIfNeeded];
  v2 = [[SBRotationDodgingModifierEvent alloc] initWithIdentifier:*(void *)(a1 + 40) fromOrientation:*(void *)(a1 + 64) toOrientation:*(void *)(a1 + 56) phase:1];
  [*(id *)(a1 + 32) _dispatchOrAppendEvent:v2];
}

void __105__SBDodgingResolverViewController_performTransitionFromOrientation_toOrientation_animated_mutationBlock___block_invoke_2(uint64_t a1)
{
  v2 = [[SBRotationDodgingModifierEvent alloc] initWithIdentifier:*(void *)(a1 + 32) fromOrientation:*(void *)(a1 + 48) toOrientation:*(void *)(a1 + 56) phase:2];
  [*(id *)(a1 + 40) _dispatchOrAppendEvent:v2];
}

- (SBDodgingModel)model
{
  return self->_model;
}

- (CGRect)contentViewBounds
{
  v2 = [(SBDodgingResolverViewController *)self view];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (int64_t)interfaceOrientation
{
  return self->_contentOrientation;
}

- (id)preferenceForIdentifier:(id)a3
{
  double v3 = [(NSMutableDictionary *)self->_itemsForIdentifiers objectForKey:a3];
  double v4 = [v3 preference];

  return v4;
}

- (double)spaceBetweenIdentifiers
{
  return 20.0;
}

- (void)_dispatchOrAppendEvent:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBDodgingResolverViewController.m", 167, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];

    id v5 = 0;
  }
  [(NSMutableArray *)self->_eventQueue _sb_enqueue:v5];
  [(SBDodgingResolverViewController *)self _dispatchNextEventIfNeededAndHandleResponse];
}

- (void)_dispatchNextEventIfNeededAndHandleResponse
{
  if (!self->_dispatchingEvent)
  {
    double v3 = [(NSMutableArray *)self->_eventQueue _sb_dequeue];
    if (v3)
    {
      self->_dispatchingEvent = 1;
      id v5 = v3;
      double v4 = [(SBChainableModifier *)self->_rootModifier handleEvent:v3];
      if (v4) {
        [(SBDodgingResolverViewController *)self _handleEventResponse:v4];
      }
      [(SBDodgingResolverViewController *)self _updateItemsIfNeeded];
      [(SBDodgingResolverViewController *)self _updateModelIfNeeded];
      [(SBDodgingResolverViewController *)self _updateLayoutIfNeeded];
      self->_dispatchingEvent = 0;
      [(SBDodgingResolverViewController *)self _dispatchNextEventIfNeededAndHandleResponse];

      double v3 = v5;
    }
  }
}

- (void)_setNeedsModelUpdate
{
  self->_needsModelUpdate = 1;
}

- (void)_updateModelIfNeeded
{
  if (self->_needsModelUpdate)
  {
    double v3 = [(SBRootDodgingLayerModifier *)self->_rootModifier modelForInvalidatedModel:self->_model];
    model = self->_model;
    self->_model = v3;

    self->_needsModelUpdate = 0;
  }
}

- (void)_setNeedsLayout
{
  self->_needsLayout = 1;
}

- (void)_updateLayoutIfNeeded
{
  if (self->_needsLayout)
  {
    [(SBDodgingResolverViewController *)self _updateLayoutWithItemIdentifier:0 completion:0];
    self->_needsLayout = 0;
  }
}

- (void)_updateLayoutWithItemIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v8 = [(SBRootDodgingLayerModifier *)self->_rootModifier zOrderedIdentifiers];
  double v9 = [v8 reverseObjectEnumerator];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = [(NSMutableDictionary *)self->_itemsForIdentifiers objectForKey:*(void *)(*((void *)&v21 + 1) + 8 * v13)];
        id v15 = [v14 view];

        if (v15)
        {
          id v16 = [(SBDodgingResolverViewController *)self view];
          [v16 bringSubviewToFront:v15];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  id v17 = (void *)MEMORY[0x1E4FA5E48];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __78__SBDodgingResolverViewController__updateLayoutWithItemIdentifier_completion___block_invoke;
  v19[3] = &unk_1E6AFA230;
  v19[4] = self;
  id v20 = v6;
  id v18 = v6;
  [v17 perform:v19 finalCompletion:v7];
}

void __78__SBDodgingResolverViewController__updateLayoutWithItemIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v28 = a2;
  v27 = [*(id *)(*(void *)(a1 + 32) + 984) framesForIdentifiers];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = [*(id *)(*(void *)(a1 + 32) + 992) identifiers];
  uint64_t v30 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v44;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v44 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v43 + 1) + 8 * v3);
        id v5 = *(void **)(a1 + 40);
        if (!v5 || [v5 isEqual:*(void *)(*((void *)&v43 + 1) + 8 * v3)])
        {
          id v6 = [*(id *)(*(void *)(a1 + 32) + 1000) objectForKey:v4];
          id v7 = [v6 view];
          double v8 = [v27 objectForKey:v4];
          [v8 CGRectValue];
          uint64_t v10 = v9;
          uint64_t v12 = v11;
          uint64_t v14 = v13;
          uint64_t v16 = v15;
          id v17 = [*(id *)(*(void *)(a1 + 32) + 984) layoutSettingsForIdentifier:v4];
          uint64_t v18 = [*(id *)(*(void *)(a1 + 32) + 984) animationBehaviorModeForIdentifier:v4];
          objc_super v19 = v28[2](v28, @"frame");
          id v20 = (void *)MEMORY[0x1E4F42FF0];
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __78__SBDodgingResolverViewController__updateLayoutWithItemIdentifier_completion___block_invoke_2;
          v35[3] = &unk_1E6B0A5D0;
          id v36 = v7;
          uint64_t v39 = v10;
          uint64_t v40 = v12;
          uint64_t v41 = v14;
          uint64_t v42 = v16;
          id v21 = v6;
          uint64_t v22 = *(void *)(a1 + 32);
          id v37 = v21;
          uint64_t v38 = v22;
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __78__SBDodgingResolverViewController__updateLayoutWithItemIdentifier_completion___block_invoke_3;
          v31[3] = &unk_1E6AF5580;
          id v32 = v21;
          uint64_t v33 = v22;
          id v34 = v19;
          id v23 = v19;
          id v24 = v21;
          id v25 = v7;
          objc_msgSend(v20, "sb_animateWithSettings:mode:animations:completion:", v17, v18, v35, v31);
        }
        ++v3;
      }
      while (v30 != v3);
      uint64_t v30 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v30);
  }
}

void __78__SBDodgingResolverViewController__updateLayoutWithItemIdentifier_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v2 = *(void **)(a1 + 40);
  [*(id *)(a1 + 48) contentViewBounds];
  objc_msgSend(v2, "setContainerSize:", v3, v4);
  id v5 = *(void **)(a1 + 40);
  id v6 = [*(id *)(a1 + 48) view];
  [v5 setContainerCoordinateSpace:v6];

  id v7 = *(void **)(a1 + 40);
  double v8 = [*(id *)(*(void *)(a1 + 48) + 1000) allKeys];
  [v7 setOtherDodgingIdentifiers:v8];

  objc_msgSend(*(id *)(a1 + 40), "setSize:", *(double *)(a1 + 72), *(double *)(a1 + 80));
  uint64_t v9 = *(void **)(a1 + 40);
  UIRectGetCenter();
  objc_msgSend(v9, "setCenter:");
  id v10 = [*(id *)(a1 + 40) delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 dodgingResolver:*(void *)(a1 + 48) dodgingItemDidChange:*(void *)(a1 + 40)];
  }
}

uint64_t __78__SBDodgingResolverViewController__updateLayoutWithItemIdentifier_completion___block_invoke_3(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
  {
    double v4 = [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector()) {
      [v4 dodgingResolver:*(void *)(a1 + 40) dodgingItemDidSettle:*(void *)(a1 + 32)];
    }
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)_setAllItemsNeedUpdate
{
  itemsNeedingUpdate = self->_itemsNeedingUpdate;
  double v4 = [(SBDodgingModel *)self->_model identifiers];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__SBDodgingResolverViewController__setAllItemsNeedUpdate__block_invoke;
  v6[3] = &unk_1E6B07790;
  v6[4] = self;
  id v5 = objc_msgSend(v4, "bs_map:", v6);
  [(NSMutableSet *)itemsNeedingUpdate addObjectsFromArray:v5];
}

uint64_t __57__SBDodgingResolverViewController__setAllItemsNeedUpdate__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 1000) objectForKey:a2];
}

- (void)_updateItemsIfNeeded
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v3 = (void *)[(NSMutableSet *)self->_itemsNeedingUpdate copy];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[SBDodgingResolverViewController _updateItemIfNeeded:](self, "_updateItemIfNeeded:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_setItemNeedsUpdate:(id)a3
{
}

- (void)_updateItemIfNeeded:(id)a3
{
  id v15 = a3;
  if (-[NSMutableSet containsObject:](self->_itemsNeedingUpdate, "containsObject:"))
  {
    [(NSMutableSet *)self->_itemsNeedingUpdate removeObject:v15];
    id v4 = [v15 delegate];
    uint64_t v5 = [v4 dodgingResolver:self preferenceForDodgingItem:v15];

    int v6 = [v5 isUpdatingInteractively];
    if ([(NSMutableSet *)self->_itemsNeedingNonAnimatedUpdate containsObject:v15])
    {
      [(NSMutableSet *)self->_itemsNeedingNonAnimatedUpdate removeObject:v15];
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v7 = 2;
    }
    if (v6) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v7;
    }
    long long v9 = [SBPreferenceChangeDodgingModifierEvent alloc];
    long long v10 = [v15 uniqueIdentifier];
    long long v11 = [(SBPreferenceChangeDodgingModifierEvent *)v9 initWithIdentifier:v10 phase:0 style:v8];

    [(SBDodgingResolverViewController *)self _dispatchOrAppendEvent:v11];
    [v15 setPreference:v5];
    long long v12 = [SBPreferenceChangeDodgingModifierEvent alloc];
    uint64_t v13 = [v15 uniqueIdentifier];
    uint64_t v14 = [(SBPreferenceChangeDodgingModifierEvent *)v12 initWithIdentifier:v13 phase:1 style:v8];

    [(SBDodgingResolverViewController *)self _dispatchOrAppendEvent:v14];
  }
}

- (void)_handleEventResponse:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBDodgingResolverViewController.m", 351, @"Invalid parameter not satisfying: %@", @"response" object file lineNumber description];
  }
  if ([v5 isValid])
  {
    [v5 delay];
    if (BSFloatIsZero())
    {
      [(SBDodgingResolverViewController *)self _performEventResponse:v5];
    }
    else
    {
      [v5 delay];
      dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__SBDodgingResolverViewController__handleEventResponse___block_invoke;
      block[3] = &unk_1E6AF5290;
      id v12 = v5;
      uint64_t v13 = self;
      dispatch_after(v9, MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    int v6 = SBLogAppSwitcher();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [v5 description];
      *(_DWORD *)buf = 138412290;
      id v15 = v7;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "[DodgingVC] Skipping the following action because it's no longer valid: %@", buf, 0xCu);
    }
  }
}

void __56__SBDodgingResolverViewController__handleEventResponse___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isValid])
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v2 = *(void **)(a1 + 40);
    [v2 _performEventResponse:v3];
  }
  else
  {
    id v4 = SBLogAppSwitcher();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [*(id *)(a1 + 32) description];
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "[DodgingVC] Skipping the following action because it's no longer valid: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_performEventResponse:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SBDodgingResolverViewController.m", 373, @"Invalid parameter not satisfying: %@", @"response" object file lineNumber description];
  }
  uint64_t v6 = [v5 type];
  if (v6 == 2)
  {
    [(SBDodgingResolverViewController *)self _performScheduleEventResponse:v5];
  }
  else if (v6 == 1)
  {
    [(SBDodgingResolverViewController *)self _performInvalidationResponse:v5];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__SBDodgingResolverViewController__performEventResponse___block_invoke;
  v8[3] = &unk_1E6B0A5F8;
  v8[4] = self;
  [v5 enumerateChildResponsesUsingBlock:v8];
}

uint64_t __57__SBDodgingResolverViewController__performEventResponse___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleEventResponse:a2];
}

- (void)_performInvalidationResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 options];
  uint64_t v6 = [v4 identifier];
  uint64_t v7 = [v4 completionIdentifier];
  int v8 = [v4 disableCoalescing];

  if (v7) {
    int v9 = 1;
  }
  else {
    int v9 = v8;
  }
  if (v6) {
    int v10 = 1;
  }
  else {
    int v10 = v9;
  }
  if (SBInvalidationDodgingOptionsContainsOption(v5, 4))
  {
    if (v6)
    {
      long long v11 = [(NSMutableDictionary *)self->_itemsForIdentifiers objectForKey:v6];
      [(SBDodgingResolverViewController *)self _setItemNeedsUpdate:v11];

      if (!v10) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    [(SBDodgingResolverViewController *)self _setAllItemsNeedUpdate];
    if (v10) {
LABEL_10:
    }
      [(SBDodgingResolverViewController *)self _updateItemsIfNeeded];
  }
LABEL_11:
  if (SBInvalidationDodgingOptionsContainsOption(v5, 1))
  {
    [(SBDodgingResolverViewController *)self _setNeedsModelUpdate];
    if (v10)
    {
      [(SBDodgingResolverViewController *)self _updateModelIfNeeded];
      if (!SBInvalidationDodgingOptionsContainsOption(v5, 2)) {
        goto LABEL_20;
      }
      goto LABEL_17;
    }
    if (!SBInvalidationDodgingOptionsContainsOption(v5, 2)) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (SBInvalidationDodgingOptionsContainsOption(v5, 2))
  {
    if (v10)
    {
LABEL_17:
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __64__SBDodgingResolverViewController__performInvalidationResponse___block_invoke;
      v12[3] = &unk_1E6AFA190;
      id v13 = v7;
      uint64_t v14 = self;
      [(SBDodgingResolverViewController *)self _updateLayoutWithItemIdentifier:v6 completion:v12];

      goto LABEL_20;
    }
LABEL_19:
    [(SBDodgingResolverViewController *)self _setNeedsLayout];
  }
LABEL_20:
}

void __64__SBDodgingResolverViewController__performInvalidationResponse___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 32))
  {
    id v4 = [[SBAnimationCompletionDodgingModifierEvent alloc] initWithIdentifier:*(void *)(a1 + 32) finished:a2 retargeted:a3];
    [*(id *)(a1 + 40) _dispatchOrAppendEvent:v4];
  }
}

- (void)_performScheduleEventResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [SBCustomEventDodgingModifierEvent alloc];
  uint64_t v6 = [v4 name];

  uint64_t v7 = [(SBCustomEventDodgingModifierEvent *)v5 initWithName:v6];
  [(SBDodgingResolverViewController *)self _dispatchOrAppendEvent:v7];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FA6028]);
  id v4 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(SBDodgingResolverViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)SBDodgingResolverViewController;
  [(SBDodgingResolverViewController *)&v2 viewDidLoad];
}

- (SBRootDodgingLayerModifier)rootModifier
{
  return self->_rootModifier;
}

- (void)setRootModifier:(id)a3
{
}

- (void)setModel:(id)a3
{
}

- (NSMutableDictionary)itemsForIdentifiers
{
  return self->_itemsForIdentifiers;
}

- (void)setItemsForIdentifiers:(id)a3
{
}

- (int64_t)contentOrientation
{
  return self->_contentOrientation;
}

- (void)setContentOrientation:(int64_t)a3
{
  self->_contentOrientation = a3;
}

- (NSMutableArray)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
}

- (BOOL)isDispatchingEvent
{
  return self->_dispatchingEvent;
}

- (void)setDispatchingEvent:(BOOL)a3
{
  self->_dispatchingEvent = a3;
}

- (NSMutableSet)itemsNeedingUpdate
{
  return self->_itemsNeedingUpdate;
}

- (void)setItemsNeedingUpdate:(id)a3
{
}

- (NSMutableSet)itemsNeedingNonAnimatedUpdate
{
  return self->_itemsNeedingNonAnimatedUpdate;
}

- (void)setItemsNeedingNonAnimatedUpdate:(id)a3
{
}

- (BOOL)needsModelUpdate
{
  return self->_needsModelUpdate;
}

- (void)setNeedsModelUpdate:(BOOL)a3
{
  self->_needsModelUpdate = a3;
}

- (BOOL)needsLayout
{
  return self->_needsLayout;
}

- (void)setNeedsLayout:(BOOL)a3
{
  self->_needsLayout = a3;
}

- (UILabel)debugOverlay
{
  return self->_debugOverlay;
}

- (void)setDebugOverlay:(id)a3
{
}

- (unint64_t)lastUpdateTimeNS
{
  return self->_lastUpdateTimeNS;
}

- (void)setLastUpdateTimeNS:(unint64_t)a3
{
  self->_lastUpdateTimeNS = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugOverlay, 0);
  objc_storeStrong((id *)&self->_itemsNeedingNonAnimatedUpdate, 0);
  objc_storeStrong((id *)&self->_itemsNeedingUpdate, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_itemsForIdentifiers, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_rootModifier, 0);
}

@end