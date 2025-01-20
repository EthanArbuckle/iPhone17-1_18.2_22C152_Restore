@interface _UIDragSetDownAnimation
+ (BOOL)canAnimateItems:(id)a3 forSource:(BOOL)a4 policyDriven:(BOOL)a5;
+ (id)defaultDropAnimationForPlatterView:(id)a3;
+ (id)defaultMultiItemAnimationForPlatterView:(id)a3;
+ (id)defaultSetDownPropertyAnimator;
+ (id)defaultSingleItemAnimationForPlatterView:(id)a3;
- (UIView)containerView;
- (UIWindow)coordinateContainerWindow;
- (_UIDragSetDownAnimation)initWithVisibleDroppedItems:(id)a3 items:(id)a4 forSource:(BOOL)a5 policyDriven:(BOOL)a6 completion:(id)a7;
- (void)_allItemAnimationsCompleted;
- (void)begin;
- (void)dirtyTargetedDragPreviewForDragItem:(id)a3;
- (void)itemAnimationCompleted:(id)a3;
- (void)itemAnimationReachedTarget:(id)a3;
- (void)previewContainerAnimationDidCompleteForDragItem:(id)a3;
- (void)setCoordinateContainerWindow:(id)a3;
- (void)updateInFlightAnimationTick:(id)a3;
- (void)updateTargetedDragPreview:(id)a3 forDragItem:(id)a4;
- (void)updateVisibleDroppedItems:(id)a3;
@end

@implementation _UIDragSetDownAnimation

+ (BOOL)canAnimateItems:(id)a3 forSource:(BOOL)a4 policyDriven:(BOOL)a5
{
  v5 = windowSceneForItems(a3, a4, a5);
  BOOL v6 = v5 != 0;

  return v6;
}

- (_UIDragSetDownAnimation)initWithVisibleDroppedItems:(id)a3 items:(id)a4 forSource:(BOOL)a5 policyDriven:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v90.receiver = self;
  v90.super_class = (Class)_UIDragSetDownAnimation;
  v15 = [(_UIDragSetDownAnimation *)&v90 init];
  if (!v15) {
    goto LABEL_55;
  }
  v16 = _Block_copy(v14);
  id completion = v15->_completion;
  v15->_id completion = v16;

  v18 = windowForItems(v13, v9);
  BOOL v76 = v9;
  v19 = windowSceneForItems(v13, v9, v8);
  id v72 = v13;
  id v67 = v14;
  if (os_variant_has_internal_diagnostics())
  {
    if (v19) {
      goto LABEL_4;
    }
    v59 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v59, OS_LOG_TYPE_FAULT, "Should have found a scene for the set down animation", buf, 2u);
    }
  }
  else
  {
    if (v19) {
      goto LABEL_4;
    }
    v61 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &initWithVisibleDroppedItems_items_forSource_policyDriven_completion____s_category)+ 8);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v61, OS_LOG_TYPE_ERROR, "Should have found a scene for the set down animation", buf, 2u);
    }
  }
  v62 = +[UIScreen mainScreen];
  v19 = +[_UISceneLifecycleMultiplexer mostActiveWindowSceneOnScreen:v62];

  uint64_t v63 = [v19 keyWindow];

  v18 = (void *)v63;
LABEL_4:
  if ([v18 _isHostedInAnotherProcess]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v20 = [UIView alloc];
    [v18 bounds];
    v21 = -[UIView initWithFrame:](v20, "initWithFrame:");
    [(UIView *)v21 setAutoresizingMask:18];
    [(UIView *)v21 setUserInteractionEnabled:0];
    v22 = [(UIView *)v21 layer];
    [v22 setAllowsHitTesting:0];

    [(UIWindow *)v21 setHidden:1];
    [v18 addSubview:v21];
  }
  else
  {
    v21 = [(UIWindow *)[_UIDragSetDownAnimationWindow alloc] initWithWindowScene:v19];
    [(UIWindow *)v21 setBecomeKeyOnOrderFront:0];
    v23 = [(UIView *)v21 layer];
    [v23 setAllowsHitTesting:0];

    [(UIView *)v21 setUserInteractionEnabled:0];
    [(UIView *)v21 setBackgroundColor:0];
    [(UIWindow *)v21 setWindowLevel:1120.0];
    v24 = objc_opt_new();
    [v24 setSizesWindowToScene:1];
    [(UIWindow *)v21 setRootViewController:v24];
    [(UIWindow *)v21 setHidden:1];
  }
  p_containerView = (id *)&v15->_containerView;
  objc_storeStrong((id *)&v15->_containerView, v21);
  unint64_t v71 = [v13 count];
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v25 = _UIInternalPreferencesRevisionVar;
  v65 = v19;
  v66 = v18;
  v73 = v21;
  if (_UIInternalPreferencesRevisionVar < 1
    || (int v60 = _UIInternalPreference_DNDSetDownItemLimit,
        _UIInternalPreferencesRevisionVar == _UIInternalPreference_DNDSetDownItemLimit))
  {
    unint64_t v70 = 5;
  }
  else
  {
    unint64_t v70 = 5;
    while (v25 >= v60)
    {
      _UIInternalPreferenceSync(v25, &_UIInternalPreference_DNDSetDownItemLimit, @"DNDSetDownItemLimit", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger);
      int v60 = _UIInternalPreference_DNDSetDownItemLimit;
      if (v25 == _UIInternalPreference_DNDSetDownItemLimit) {
        goto LABEL_12;
      }
    }
    unint64_t v70 = qword_1E8FD5110;
  }
LABEL_12:
  v75 = (NSArray *)objc_opt_new();
  v69 = (void *)[v13 mutableCopy];
  v74 = [MEMORY[0x1E4F28E60] indexSet];
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v68 = v12;
  v26 = [v12 reverseObjectEnumerator];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v85 objects:v93 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    v29 = 0;
    uint64_t v30 = *(void *)v86;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v86 != v30) {
          objc_enumerationMutation(v26);
        }
        v32 = *(void **)(*((void *)&v85 + 1) + 8 * i);
        v33 = [v32 imageComponent];

        if (v33)
        {
          v34 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v32, "itemIndex"));
          v35 = [[_UIDragSetDownItemAnimation alloc] initWithDragItem:v34 droppedItem:v32 dropContainerView:v73 defaultAnimation:v71 > v70 sourceAnimation:v76 delegate:v15];
          [(NSArray *)v75 addObject:v35];
          objc_msgSend(v74, "addIndex:", objc_msgSend(v32, "itemIndex"));
          if (v76) {
            [v34 _sourceVisualTarget];
          }
          else {
          v36 = [v34 _destinationVisualTarget];
          }
          v37 = [v36 _setDownAnimation:v15 customSpringAnimationBehaviorForSetDownOfDragItem:v34];
          [(_UIDragSetDownItemAnimation *)v35 setCustomSpringAnimationBehavior:v37];
          if (!v29)
          {
            v29 = [(_UIDragSetDownItemAnimation *)v35 targetContainerWindow];
            if (!v29)
            {
              v29 = [v36 _windowForSetDownOfDragItem:v34];
            }
          }

          id v13 = v72;
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v85 objects:v93 count:16];
    }
    while (v28);
  }
  else
  {
    v29 = 0;
  }

  v38 = v69;
  [v69 removeObjectsAtIndexes:v74];
  if (!v29)
  {
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v39 = v69;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v81 objects:v92 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v82;
      while (2)
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v82 != v42) {
            objc_enumerationMutation(v39);
          }
          uint64_t v44 = *(void *)(*((void *)&v81 + 1) + 8 * j);
          if (v76) {
            [*(id *)(*((void *)&v81 + 1) + 8 * j) _sourceVisualTarget];
          }
          else {
          v45 = [*(id *)(*((void *)&v81 + 1) + 8 * j) _destinationVisualTarget];
          }
          v29 = [v45 _windowForSetDownOfDragItem:v44];

          if (v29)
          {

            goto LABEL_43;
          }
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v81 objects:v92 count:16];
        if (v41) {
          continue;
        }
        break;
      }
    }

    [*p_containerView setHidden:0];
    v29 = [*p_containerView _window];
LABEL_43:
    v38 = v69;
  }
  objc_storeStrong((id *)&v15->_coordinateContainerWindow, v29);
  [(NSArray *)v75 makeObjectsPerformSelector:sel_prepareToBeginAnimation];
  v46 = [v13 objectAtIndexedSubscript:0];
  v47 = v46;
  if (v76) {
    [v46 _sourceVisualTarget];
  }
  else {
  v48 = [v46 _destinationVisualTarget];
  }

  uint64_t v49 = [(id)objc_opt_class() defaultSetDownPropertyAnimator];
  remainingItemsPropertyAnimator = v15->_remainingItemsPropertyAnimator;
  v15->_remainingItemsPropertyAnimator = (UIViewPropertyAnimator *)v49;

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v51 = v38;
  uint64_t v52 = [v51 countByEnumeratingWithState:&v77 objects:v91 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v78;
    do
    {
      for (uint64_t k = 0; k != v53; ++k)
      {
        if (*(void *)v78 != v54) {
          objc_enumerationMutation(v51);
        }
        [v48 _setDownAnimation:v15 willAnimateSetDownOfDragItem:*(void *)(*((void *)&v77 + 1) + 8 * k) withAnimator:v15->_remainingItemsPropertyAnimator preview:0];
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v77 objects:v91 count:16];
    }
    while (v53);
  }

  itemAnimations = v15->_itemAnimations;
  v15->_itemAnimations = v75;
  v57 = v75;

  id v14 = v67;
  id v12 = v68;
LABEL_55:

  return v15;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)updateVisibleDroppedItems:(id)a3
{
  id v4 = a3;
  itemAnimations = self->_itemAnimations;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53___UIDragSetDownAnimation_updateVisibleDroppedItems___block_invoke;
  v7[3] = &unk_1E52EC560;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  [(NSArray *)itemAnimations enumerateObjectsWithOptions:2 usingBlock:v7];
}

- (void)updateTargetedDragPreview:(id)a3 forDragItem:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = self->_itemAnimations;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_msgSend(v13, "item", (void)v15);
        id v14 = (id)objc_claimAutoreleasedReturnValue();

        if (v14 == v7)
        {
          [v13 updateTargetedDropPreview:v6];
          goto LABEL_11;
        }
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)dirtyTargetedDragPreviewForDragItem:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_itemAnimations;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v10, "item", (void)v12);
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          [v10 dirtyTargetedDropPreview];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)begin
{
  if (!self->_hasBegun)
  {
    self->_hasBegun = 1;
    if ([(NSArray *)self->_itemAnimations count])
    {
      [(UIView *)self->_containerView setHidden:0];
      v3 = [(UIView *)self->_containerView _window];
      id v4 = [v3 screen];

      if (os_variant_has_internal_diagnostics())
      {
        if (!v4)
        {
          uint64_t v10 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          {
            LOWORD(location[0]) = 0;
            _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "Drop animation has no associated screen", (uint8_t *)location, 2u);
          }
        }
      }
      else if (!v4)
      {
        id v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &begin___s_category) + 8);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          LOWORD(location[0]) = 0;
          _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Drop animation has no associated screen", (uint8_t *)location, 2u);
        }
      }
      v5 = [v4 displayLinkWithTarget:self selector:sel_updateInFlightAnimationTick_];
      displayLinuint64_t k = self->_displayLink;
      self->_displayLinuint64_t k = v5;

      uint64_t v7 = self->_displayLink;
      uint64_t v8 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [(CADisplayLink *)v7 addToRunLoop:v8 forMode:*MEMORY[0x1E4F1C4B0]];

      [(NSArray *)self->_itemAnimations makeObjectsPerformSelector:sel_beginAnimation];
    }
    else
    {
      objc_initWeak(location, self);
      remainingItemsPropertyAnimator = self->_remainingItemsPropertyAnimator;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __32___UIDragSetDownAnimation_begin__block_invoke;
      v12[3] = &unk_1E52DC6C0;
      objc_copyWeak(&v13, location);
      [(UIViewPropertyAnimator *)remainingItemsPropertyAnimator addCompletion:v12];
      objc_destroyWeak(&v13);
      objc_destroyWeak(location);
    }
    [(UIViewPropertyAnimator *)self->_remainingItemsPropertyAnimator addAnimations:&__block_literal_global_175];
    [(UIViewPropertyAnimator *)self->_remainingItemsPropertyAnimator startAnimation];
  }
}

- (void)updateInFlightAnimationTick:(id)a3
{
  if ([(NSArray *)self->_itemAnimations count])
  {
    itemAnimations = self->_itemAnimations;
    [(NSArray *)itemAnimations makeObjectsPerformSelector:sel_updateAnimationTargeting];
  }
  else
  {
    [(_UIDragSetDownAnimation *)self _allItemAnimationsCompleted];
  }
}

- (void)previewContainerAnimationDidCompleteForDragItem:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_itemAnimations;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v10, "item", (void)v12);
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          [v10 previewContainerAnimationDidComplete];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)itemAnimationReachedTarget:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  displayLinuint64_t k = self->_itemAnimations;
  uint64_t v5 = [(NSArray *)displayLink countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v10 != v7) {
        objc_enumerationMutation(displayLink);
      }
      if (!objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8), "reachedTarget", (void)v9)) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [(NSArray *)displayLink countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    [(CADisplayLink *)self->_displayLink invalidate];
    displayLinuint64_t k = (NSArray *)self->_displayLink;
    self->_displayLinuint64_t k = 0;
  }
}

- (void)itemAnimationCompleted:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_itemAnimations;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8), "done", (void)v9))
        {

          return;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  [(_UIDragSetDownAnimation *)self _allItemAnimationsCompleted];
}

- (void)_allItemAnimationsCompleted
{
  uint64_t v7 = self;
  id completion = (void (**)(void))v7->_completion;
  if (completion) {
    completion[2]();
  }
  v7->_hasBegun = 0;
  [(UIView *)v7->_containerView removeFromSuperview];
  [(UIView *)v7->_containerView setHidden:1];
  itemAnimations = v7->_itemAnimations;
  v7->_itemAnimations = 0;

  containerView = v7->_containerView;
  v7->_containerView = 0;

  [(CADisplayLink *)v7->_displayLink invalidate];
  displayLinuint64_t k = v7->_displayLink;
  v7->_displayLinuint64_t k = 0;

  id v6 = v7->_completion;
  v7->_id completion = 0;
}

+ (id)defaultSetDownPropertyAnimator
{
  v2 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 2.0, 300.0, 400.0, 0.0, 0.0);
  v3 = [[UIViewPropertyAnimator alloc] initWithDuration:v2 timingParameters:0.91];

  return v3;
}

+ (id)defaultSingleItemAnimationForPlatterView:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68___UIDragSetDownAnimation_defaultSingleItemAnimationForPlatterView___block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = _Block_copy(aBlock);

  return v5;
}

+ (id)defaultMultiItemAnimationForPlatterView:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67___UIDragSetDownAnimation_defaultMultiItemAnimationForPlatterView___block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = _Block_copy(aBlock);

  return v5;
}

+ (id)defaultDropAnimationForPlatterView:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62___UIDragSetDownAnimation_defaultDropAnimationForPlatterView___block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = _Block_copy(aBlock);

  return v5;
}

- (UIWindow)coordinateContainerWindow
{
  return self->_coordinateContainerWindow;
}

- (void)setCoordinateContainerWindow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinateContainerWindow, 0);
  objc_storeStrong((id *)&self->_remainingItemsPropertyAnimator, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_itemAnimations, 0);
}

@end