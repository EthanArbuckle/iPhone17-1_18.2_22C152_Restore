@interface UIDropInteraction
+ (NSCopying)visualStyleRegistryIdentity;
- (BOOL)_canHandleDragEvent:(id)a3;
- (BOOL)_gestureRecognizer:(id)a3 shouldReceiveDragEvent:(id)a4;
- (BOOL)_setDownAnimation:(id)a3 shouldDelaySetDownOfDragItem:(id)a4 completion:(id)a5;
- (BOOL)_wantsDefaultVisualBehavior;
- (BOOL)allowsSimultaneousDropSessions;
- (BOOL)isActive;
- (UIDropInteraction)initWithDelegate:(id)delegate;
- (UIDropInteractionContextImpl)context;
- (UIDropInteractionEffect)interactionEffect;
- (UIPasteConfiguration)_pasteConfiguration;
- (UIView)view;
- (_UIDropInteractionOwning)owner;
- (id)_dynamicGestureRecognizersForEvent:(id)a3;
- (id)_initWithPasteConfiguration:(id)a3;
- (id)_setDownAnimation:(id)a3 customSpringAnimationBehaviorForSetDownOfDragItem:(id)a4;
- (id)_setDownAnimation:(id)a3 prepareForSetDownOfDragItem:(id)a4 visibleDroppedItem:(id)a5;
- (id)_setDownAnimation:(id)a3 updatedSetDownOfDragItem:(id)a4 preview:(id)a5;
- (id)_windowForSetDownOfDragItem:(id)a3;
- (id)delegate;
- (unint64_t)_setLastDragOperation:(unint64_t)a3 forbidden:(BOOL)a4 precise:(BOOL)a5 prefersFullSizePreview:(BOOL)a6 preferredBadgeStyle:(int64_t)a7 onSession:(id)a8;
- (unint64_t)_validateDragOperation:(unint64_t)a3 forSelector:(SEL)a4 delegate:(id)a5 dropSession:(id)a6 onSession:(id)a7 forbidden:(BOOL *)a8;
- (void)_dragDestinationGestureStateChanged:(id)a3;
- (void)_dropSessionEntered:(id)a3 withSessionDestination:(id)a4;
- (void)_gestureRecognizerFailed:(id)a3;
- (void)_prepareItemsInSessionForDrop:(id)a3;
- (void)_sendSessionDidEnd:(id)a3;
- (void)_setDownAnimation:(id)a3 willAnimateSetDownOfDragItem:(id)a4 withAnimator:(id)a5 preview:(id)a6;
- (void)_setWantsDefaultVisualBehavior:(BOOL)a3;
- (void)didMoveToOwner:(id)a3;
- (void)setAllowsSimultaneousDropSessions:(BOOL)allowsSimultaneousDropSessions;
- (void)setContext:(id)a3;
- (void)setInteractionEffect:(id)a3;
- (void)setOwner:(id)a3;
- (void)willMoveToOwner:(id)a3;
@end

@implementation UIDropInteraction

- (void)willMoveToOwner:(id)a3
{
  [(UIDropInteractionContextImpl *)self->_context setState:0];
  id v4 = [(UIDropInteraction *)self interactionEffect];
  [v4 interaction:self didChangeWithContext:self->_context];
}

- (UIDropInteractionEffect)interactionEffect
{
  return self->_interactionEffect;
}

- (void)didMoveToOwner:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  objc_storeWeak((id *)&self->_owner, v4);
  if (!v4 && WeakRetained)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = objc_msgSend(WeakRetained, "gestureRecognizers", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v12 = [v11 delegate];

            if (v12 == self)
            {
              [WeakRetained removeGestureRecognizer:v11];
              v13 = [v11 sessionDestination];
              v14 = [v13 activeDragEvent];
              [v14 _removeQueriedOwnerForDynamicGesturesIfNeeded:WeakRetained];
            }
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
}

- (UIView)view
{
  p_owner = &self->_owner;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  int IsKindOfUIView = _IsKindOfUIView((uint64_t)WeakRetained);

  if (IsKindOfUIView) {
    id v5 = objc_loadWeakRetained((id *)p_owner);
  }
  else {
    id v5 = 0;
  }
  return (UIView *)v5;
}

- (UIDropInteraction)initWithDelegate:(id)delegate
{
  id v4 = delegate;
  v19.receiver = self;
  v19.super_class = (Class)UIDropInteraction;
  id v5 = [(UIDropInteraction *)&v19 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    _UIValidateAccountBasedDelegateRespondsToSelector(v4, (uint64_t)sel__dropInteraction_dataOwnerForSession_);
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      __int16 v7 = 2;
    }
    else {
      __int16 v7 = 0;
    }
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFFFD | v7;
    if (objc_opt_respondsToSelector()) {
      __int16 v8 = 4;
    }
    else {
      __int16 v8 = 0;
    }
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFFFB | v8;
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = 8;
    }
    else {
      __int16 v9 = 0;
    }
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFFF7 | v9;
    if (objc_opt_respondsToSelector()) {
      __int16 v10 = 16;
    }
    else {
      __int16 v10 = 0;
    }
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFFEF | v10;
    if (objc_opt_respondsToSelector()) {
      __int16 v11 = 32;
    }
    else {
      __int16 v11 = 0;
    }
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFFDF | v11;
    if (objc_opt_respondsToSelector()) {
      __int16 v12 = 64;
    }
    else {
      __int16 v12 = 0;
    }
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFFBF | v12;
    if (objc_opt_respondsToSelector()) {
      __int16 v13 = 128;
    }
    else {
      __int16 v13 = 0;
    }
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFF7F | v13;
    if (objc_opt_respondsToSelector()) {
      __int16 v14 = 256;
    }
    else {
      __int16 v14 = 0;
    }
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFEFF | v14;
    if (objc_opt_respondsToSelector()) {
      __int16 v15 = 512;
    }
    else {
      __int16 v15 = 0;
    }
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFDFF | v15;
    if (objc_opt_respondsToSelector()) {
      __int16 v16 = 1024;
    }
    else {
      __int16 v16 = 0;
    }
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xFBFF | v16;
    if (objc_opt_respondsToSelector()) {
      __int16 v17 = 2048;
    }
    else {
      __int16 v17 = 0;
    }
    *(_WORD *)&v6->_delegateImplements = *(_WORD *)&v6->_delegateImplements & 0xF7FF | v17;
  }

  return v6;
}

- (void)setAllowsSimultaneousDropSessions:(BOOL)allowsSimultaneousDropSessions
{
  self->_allowsSimultaneousDropSessions = allowsSimultaneousDropSessions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionEffect, 0);
  objc_storeStrong((id *)&self->_pasteConfiguration, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_owner);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_enteredDropSessionByDraggingSession, 0);
  objc_storeStrong((id *)&self->_activeDragGestureRecognizers, 0);
}

- (void)_setWantsDefaultVisualBehavior:(BOOL)a3
{
  if (self->_wantsDefaultVisualBehavior != a3)
  {
    self->_wantsDefaultVisualBehavior = a3;
    if (a3)
    {
      id v4 = (id)objc_opt_new();
      [(UIDropInteraction *)self setInteractionEffect:v4];
    }
    else
    {
      [(UIDropInteraction *)self setInteractionEffect:0];
    }
  }
}

- (id)_initWithPasteConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIDropInteraction;
  v6 = [(UIDropInteraction *)&v9 init];
  __int16 v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pasteConfiguration, a3);
  }

  return v7;
}

- (id)_dynamicGestureRecognizersForEvent:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(UIDragGestureRecognizer *)[UIDropInteractionGestureRecognizer alloc] initWithTarget:self action:sel__dragDestinationGestureStateChanged_];
  [(UIGestureRecognizer *)v4 setDelegate:self];
  v7[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  return v5;
}

- (BOOL)isActive
{
  return [(NSMutableSet *)self->_activeDragGestureRecognizers count] != 0;
}

- (UIDropInteractionContextImpl)context
{
  context = self->_context;
  if (!context)
  {
    id v4 = (UIDropInteractionContextImpl *)objc_opt_new();
    id v5 = self->_context;
    self->_context = v4;

    context = self->_context;
  }
  return context;
}

- (BOOL)_gestureRecognizer:(id)a3 shouldReceiveDragEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((([(NSMutableSet *)self->_activeDragGestureRecognizers containsObject:v6] & 1) != 0
     || ![(NSMutableSet *)self->_activeDragGestureRecognizers count]
     || [(UIDropInteraction *)self _allowsSimultaneousDragWithEvent:v7])
    && [(UIDropInteraction *)self _canHandleDragEvent:v7])
  {
    activeDragGestureRecognizers = self->_activeDragGestureRecognizers;
    if (!activeDragGestureRecognizers)
    {
      objc_super v9 = (NSMutableSet *)objc_opt_new();
      __int16 v10 = self->_activeDragGestureRecognizers;
      self->_activeDragGestureRecognizers = v9;

      activeDragGestureRecognizers = self->_activeDragGestureRecognizers;
    }
    [(NSMutableSet *)activeDragGestureRecognizers addObject:v6];
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_gestureRecognizerFailed:(id)a3
{
}

- (void)_dragDestinationGestureStateChanged:(id)a3
{
  id v4 = a3;
  v34 = [(UIDropInteraction *)self delegate];
  id v5 = [v4 sessionDestination];
  id v6 = [v4 dropSession];
  v33 = [(UIDropInteraction *)self owner];
  v44[0] = 0;
  switch([v4 state])
  {
    case 1:
      id v7 = [(UIDropInteraction *)self context];
      [v7 setState:1];

      __int16 v8 = [(UIDropInteraction *)self interactionEffect];
      objc_super v9 = [(UIDropInteraction *)self context];
      [v8 interaction:self didChangeWithContext:v9];

      [(UIDropInteraction *)self _dropSessionEntered:v6 withSessionDestination:v5];
      if ((*(_WORD *)&self->_delegateImplements & 2) != 0) {
        [v34 dropInteraction:self sessionDidEnter:v6];
      }
      goto LABEL_4;
    case 2:
LABEL_4:
      if ((*(_WORD *)&self->_delegateImplements & 4) == 0)
      {
        __int16 v10 = [(UIDropInteraction *)self _pasteConfiguration];

        if (!v10) {
          goto LABEL_21;
        }
        uint64_t v11 = 0;
        uint64_t v12 = 0;
        uint64_t v13 = [v5 sourceOperationMask] & 1;
        uint64_t v14 = 1;
        goto LABEL_20;
      }
      v27 = [v34 dropInteraction:self sessionDidUpdate:v6];
      if (v27)
      {
        v28 = v27;
        __int16 delegateImplements = (__int16)self->_delegateImplements;
        uint64_t v30 = [v27 operation];
        if (v30 == 3)
        {
          uint64_t v13 = 16;
        }
        else if (v30 == 2)
        {
          uint64_t v13 = 1;
        }
        else
        {
          uint64_t v13 = 0;
          if (v30 == 1) {
            v44[0] = 1;
          }
        }
        uint64_t v11 = [v28 isPrecise];
        uint64_t v14 = [v28 prefersFullSizePreview];
        uint64_t v12 = [v28 _preferredBadgeStyle];

        if ((delegateImplements & 0x10) != 0)
        {
LABEL_20:
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          unint64_t v32 = [(UIDropInteraction *)self _validateDragOperation:v13 forSelector:sel_dropInteraction_sessionDidUpdate_ delegate:WeakRetained dropSession:v6 onSession:v5 forbidden:v44];

          [(UIDropInteraction *)self _setLastDragOperation:v32 forbidden:v44[0] precise:v11 prefersFullSizePreview:v14 preferredBadgeStyle:v12 onSession:v5];
        }
      }
LABEL_21:

      return;
    case 3:
      __int16 v15 = [(UIDropInteraction *)self context];
      [v15 setState:3];

      __int16 v16 = [(UIDropInteraction *)self interactionEffect];
      __int16 v17 = [(UIDropInteraction *)self context];
      [v16 interaction:self didChangeWithContext:v17];

      if (self->_potentialDragOperation)
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __57__UIDropInteraction__dragDestinationGestureStateChanged___block_invoke;
        aBlock[3] = &unk_1E52DF078;
        id v18 = v34;
        id v39 = v18;
        v40 = self;
        id v19 = v6;
        id v41 = v19;
        id v20 = v5;
        id v42 = v20;
        id v21 = v33;
        id v43 = v21;
        v22 = _Block_copy(aBlock);
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __57__UIDropInteraction__dragDestinationGestureStateChanged___block_invoke_2;
        v35[3] = &unk_1E52DCB30;
        v35[4] = self;
        id v36 = v18;
        id v37 = v19;
        v23 = _Block_copy(v35);
        [v20 requestDropOnOwner:v21 withOperation:self->_potentialDragOperation perform:v22 completion:v23];
      }
      goto LABEL_11;
    case 4:
      v24 = [(UIDropInteraction *)self context];
      [v24 setState:0];

      v25 = [(UIDropInteraction *)self interactionEffect];
      v26 = [(UIDropInteraction *)self context];
      [v25 interaction:self didChangeWithContext:v26];

      if ((*(_WORD *)&self->_delegateImplements & 8) != 0) {
        [v34 dropInteraction:self sessionDidExit:v6];
      }
LABEL_11:
      [(NSMutableSet *)self->_activeDragGestureRecognizers removeObject:v4];
      goto LABEL_21;
    default:
      goto LABEL_21;
  }
}

void __57__UIDropInteraction__dragDestinationGestureStateChanged___block_invoke(id *a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    v2 = (objc_class *)objc_opt_class();
    v3 = NSStringFromClass(v2);
    int v4 = [v3 isEqualToString:@"WKContentView"];

    if (v4) {
      +[_UIKitDragAndDropStatistics incrementUIKitScalarValueBy:1 forKey:@"dropOnWebContent"];
    }
  }
  [a1[5] _prepareItemsInSessionForDrop:a1[6]];
  id v5 = a1[5];
  if ((v5[16] & 0x10) != 0)
  {
    id v7 = a1[7];
    id v8 = a1[6];
    objc_super v9 = [v7 dropItemProviders];
    uint64_t v10 = [v9 count];
    uint64_t v11 = [v8 items];
    uint64_t v12 = [v11 count];
    if (v10)
    {
      unint64_t v13 = v12;
      for (unint64_t i = 0; i != v10; ++i)
      {
        if (i < v13)
        {
          __int16 v15 = [v9 objectAtIndexedSubscript:i];
          __int16 v16 = [v11 objectAtIndexedSubscript:i];
          [v16 _setDropItemProvider:v15];
        }
      }
    }

    [a1[4] dropInteraction:a1[5] performDrop:a1[6]];
    id v17 = a1[6];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v18 = [v17 items];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v25 != v21) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * j) _setDropItemProvider:0];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v20);
    }
  }
  else
  {
    id v6 = [v5 _pasteConfiguration];

    if (v6)
    {
      id v23 = [a1[7] dropItemProviders];
      _UIDragEventPasteItemProvidersForOwner(v23, a1[8]);
    }
  }
}

uint64_t __57__UIDropInteraction__dragDestinationGestureStateChanged___block_invoke_2(uint64_t result)
{
  if ((*(_WORD *)(*(void *)(result + 32) + 32) & 0x20) != 0) {
    return objc_msgSend(*(id *)(result + 40), "dropInteraction:concludeDrop:");
  }
  return result;
}

- (void)_prepareItemsInSessionForDrop:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v4 = objc_msgSend(a3, "items", 0);
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
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) _setDestinationVisualTarget:self];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)_windowForSetDownOfDragItem:(id)a3
{
  v3 = [(UIDropInteraction *)self view];
  int v4 = [v3 _window];

  return v4;
}

- (id)_setDownAnimation:(id)a3 updatedSetDownOfDragItem:(id)a4 preview:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  long long v9 = [(UIDropInteraction *)self delegate];
  long long v10 = [v9 dropInteraction:self previewForDroppingItem:v8 withDefault:v7];

  if (v10)
  {
    long long v11 = [v10 target];
    long long v12 = [v11 container];

    uint64_t v13 = [v12 _window];
    if (!v13 || (v14 = (void *)v13, int v15 = [v12 isHiddenOrHasHiddenAncestor], v14, v15))
    {

      long long v10 = 0;
    }
  }
  return v10;
}

- (id)_setDownAnimation:(id)a3 prepareForSetDownOfDragItem:(id)a4 visibleDroppedItem:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v48 = [v8 containerView];
  id v11 = v9;
  if (os_variant_has_internal_diagnostics())
  {
    if (!v10)
    {
      id v41 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_fault_impl(&dword_1853B0000, v41, OS_LOG_TYPE_FAULT, "droppedItem for draggingItem (%@) is nil", (uint8_t *)&buf, 0xCu);
      }

      goto LABEL_33;
    }
  }
  else if (!v10)
  {
    id v42 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_setDownAnimation_prepareForSetDownOfDragItem_visibleDroppedItem____s_category)+ 8);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1853B0000, v42, OS_LOG_TYPE_ERROR, "droppedItem for draggingItem (%@) is nil", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_33;
  }
  if (!v11)
  {
LABEL_33:
    uint64_t v13 = 0;
    goto LABEL_34;
  }
  long long v12 = [(UIDropInteraction *)self delegate];
  if ((*(_WORD *)&self->_delegateImplements & 0x80) != 0)
  {
    v46 = [v10 createSnapshotView];
    v47 = [v10 preview];
    uint64_t v14 = [v47 parameters];
    int v15 = v14;
    if (v14) {
      __int16 v16 = v14;
    }
    else {
      __int16 v16 = objc_alloc_init(UIDragPreviewParameters);
    }
    v45 = v16;

    id v17 = [(UIDropInteraction *)self view];
    id v18 = [v17 window];
    if (v18 && (int v19 = [v17 isHiddenOrHasHiddenAncestor], v18, !v19))
    {
      id v23 = [v17 superview];
      [v10 center];
      double v25 = v24;
      double v27 = v26;
      v28 = [v8 containerView];
      objc_msgSend(v23, "convertPoint:fromCoordinateSpace:", v28, v25, v27);
      double v30 = v29;
      double v32 = v31;

      v33 = [UIDragPreviewTarget alloc];
      v34 = [v17 superview];
      uint64_t v21 = -[UIPreviewTarget initWithContainer:center:](v33, "initWithContainer:center:", v34, v30, v32);

      char v22 = 1;
    }
    else
    {
      uint64_t v20 = [UIDragPreviewTarget alloc];
      [v10 center];
      uint64_t v21 = -[UIPreviewTarget initWithContainer:center:](v20, "initWithContainer:center:", v48);
      char v22 = 0;
    }
    v44 = (void *)v21;
    v35 = [[UITargetedDragPreview alloc] initWithView:v46 parameters:v45 target:v21];
    [(UITargetedPreview *)v35 _setDefaultPreview:1];
    uint64_t v13 = [v12 dropInteraction:self previewForDroppingItem:v11 withDefault:v35];
    if (v13 == v35) {
      char v36 = v22;
    }
    else {
      char v36 = 1;
    }
    if ((v36 & 1) == 0)
    {

      uint64_t v13 = 0;
    }
    if ((*(_WORD *)&self->_delegateImplements & 0x400) != 0)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v54 = 0x2020000000;
      char v55 = 0;
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __86__UIDropInteraction__setDownAnimation_prepareForSetDownOfDragItem_visibleDroppedItem___block_invoke;
      v49[3] = &unk_1E52EBF48;
      p_long long buf = &buf;
      id v50 = v8;
      id v51 = v11;
      [v12 _dropInteraction:self delayedPreviewProviderForDroppingItem:v51 previewProvider:v49];

      _Block_object_dispose(&buf, 8);
    }
    if (v13)
    {
      id v37 = [(UITargetedPreview *)v13 target];
      v38 = [v37 container];

      id v39 = [v38 _window];
      if (!v39 || (int v40 = [v38 isHiddenOrHasHiddenAncestor], v39, v40))
      {

        uint64_t v13 = 0;
      }
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

LABEL_34:
  return v13;
}

uint64_t __86__UIDropInteraction__setDownAnimation_prepareForSetDownOfDragItem_visibleDroppedItem___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 48) + 8);
  if (!*(unsigned char *)(v2 + 24))
  {
    *(unsigned char *)(v2 + 24) = 1;
    return [*(id *)(result + 32) updateTargetedDragPreview:a2 forDragItem:*(void *)(result + 40)];
  }
  return result;
}

- (void)_setDownAnimation:(id)a3 willAnimateSetDownOfDragItem:(id)a4 withAnimator:(id)a5 preview:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    uint64_t v14 = [(UIDropInteraction *)self delegate];
    if ((*(_WORD *)&self->_delegateImplements & 0x100) != 0)
    {
      int v15 = [[_UIDragAnimatingWrapper alloc] initWithPropertyAnimator:v12];
      [v14 dropInteraction:self item:v11 willAnimateDropWithAnimator:v15];
    }
    else
    {
      int v15 = 0;
    }
    __int16 v16 = [v13 _previewContainer];

    if (v16)
    {
      if (!v15) {
        int v15 = [[_UIDragAnimatingWrapper alloc] initWithPropertyAnimator:v12];
      }
      id v17 = [v13 _previewContainer];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __89__UIDropInteraction__setDownAnimation_willAnimateSetDownOfDragItem_withAnimator_preview___block_invoke;
      v18[3] = &unk_1E52D9F98;
      id v19 = v10;
      id v20 = v11;
      [v17 _animateDropAlongsideAnimator:v15 completion:v18];
    }
  }
}

uint64_t __89__UIDropInteraction__setDownAnimation_willAnimateSetDownOfDragItem_withAnimator_preview___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) previewContainerAnimationDidCompleteForDragItem:*(void *)(a1 + 40)];
}

- (BOOL)_setDownAnimation:(id)a3 shouldDelaySetDownOfDragItem:(id)a4 completion:(id)a5
{
  return 0;
}

- (id)_setDownAnimation:(id)a3 customSpringAnimationBehaviorForSetDownOfDragItem:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(UIDropInteraction *)self delegate];
  id v7 = v6;
  if ((*(_WORD *)&self->_delegateImplements & 0x800) != 0)
  {
    id v8 = [v6 _dropInteraction:self customSpringAnimationBehaviorForDroppingItem:v5];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)_canHandleDragEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(UIDropInteraction *)self delegate];
  if (*(_WORD *)&self->_delegateImplements)
  {
    id v8 = [v4 _dropSession];
    char CanPasteItemProvidersForOwner = [v5 dropInteraction:self canHandleSession:v8];
  }
  else
  {
    uint64_t v6 = [(UIDropInteraction *)self _pasteConfiguration];

    if (!v6)
    {
      char CanPasteItemProvidersForOwner = 1;
      goto LABEL_7;
    }
    id v7 = [v4 _sessionDestination];
    id v8 = [v7 preDropItemProviders];

    id v9 = [(UIDropInteraction *)self owner];
    char CanPasteItemProvidersForOwner = _UIDragEventCanPasteItemProvidersForOwner(v8, v9);
  }
LABEL_7:

  return CanPasteItemProvidersForOwner;
}

- (unint64_t)_validateDragOperation:(unint64_t)a3 forSelector:(SEL)a4 delegate:(id)a5 dropSession:(id)a6 onSession:(id)a7 forbidden:(BOOL *)a8
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = v16;
  if (a3)
  {
    uint64_t v18 = [v16 sourceOperationMask];
    if ((a3 & ~v18) != 0)
    {
      uint64_t v19 = v18;
      id v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &_MergedGlobals_1024) + 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = v20;
        char v22 = NSStringFromSelector(a4);
        int v29 = 138412802;
        double v30 = v22;
        __int16 v31 = 2048;
        unint64_t v32 = a3;
        __int16 v33 = 2048;
        uint64_t v34 = v19;
        id v23 = "Selector %@ returned a _UIDragOperation %lu that is outside of the sourceOperationMask %lu. Using _UIDragO"
              "perationNone instead.";
        double v24 = v21;
        uint32_t v25 = 32;
LABEL_11:
        _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v29, v25);

        goto LABEL_12;
      }
      goto LABEL_12;
    }
    if ((a3 & (a3 - 1)) != 0)
    {
      double v27 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &qword_1EB260358) + 8);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = v27;
        char v22 = NSStringFromSelector(a4);
        int v29 = 138412546;
        double v30 = v22;
        __int16 v31 = 2048;
        unint64_t v32 = a3;
        id v23 = "Selector  %@ returned a _UIDragOperation %lu that contains more than one operation. Using _UIDragOperationNone instead.";
        double v24 = v21;
        uint32_t v25 = 22;
        goto LABEL_11;
      }
LABEL_12:
      a3 = 0;
      goto LABEL_13;
    }
    if (_UIShouldEnforceOpenInRulesInAccountBasedApp()
      && (*(_WORD *)&self->_delegateImplements & 0x200) != 0)
    {
      uint64_t v26 = [v14 _dropInteraction:self dataOwnerForSession:v15];
    }
    else
    {
      uint64_t v26 = 0;
    }
    a3 = [v17 actualDragOperationForProposedDragOperation:a3 destinationDataOwner:v26 forbidden:a8];
  }
LABEL_13:

  return a3;
}

- (unint64_t)_setLastDragOperation:(unint64_t)a3 forbidden:(BOOL)a4 precise:(BOOL)a5 prefersFullSizePreview:(BOOL)a6 preferredBadgeStyle:(int64_t)a7 onSession:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  BOOL v11 = a4;
  id v14 = a8;
  unint64_t v15 = [v14 sourceOperationMask] & a3;
  self->_potentialDragOperation = v15;
  id v16 = objc_opt_new();
  [v16 setOperation:self->_potentialDragOperation];
  [v16 setForbidden:v11];
  [v16 setPrecise:v10];
  [v16 setPrefersFullSizePreview:v9];
  [v16 setPreferredBadgeStyle:a7];
  [v14 takePotentialDrop:v16];

  return v15;
}

- (void)_dropSessionEntered:(id)a3 withSessionDestination:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  enteredDropSessionByDraggingSession = self->_enteredDropSessionByDraggingSession;
  if (!enteredDropSessionByDraggingSession)
  {
    id v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    BOOL v9 = self->_enteredDropSessionByDraggingSession;
    self->_enteredDropSessionByDraggingSession = v8;

    enteredDropSessionByDraggingSession = self->_enteredDropSessionByDraggingSession;
  }
  [(NSMapTable *)enteredDropSessionByDraggingSession setObject:v10 forKey:v6];
  [v6 enteredDestination:self];
}

- (void)_sendSessionDidEnd:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(UIDropInteraction *)self delegate];
  id v6 = [(NSMapTable *)self->_enteredDropSessionByDraggingSession objectForKey:v4];
  [(NSMapTable *)self->_enteredDropSessionByDraggingSession removeObjectForKey:v4];
  if (os_variant_has_internal_diagnostics())
  {
    if (!v6)
    {
      id v7 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        int v9 = 138412546;
        id v10 = self;
        __int16 v11 = 2112;
        id v12 = v4;
        _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "dropInteraction (%@) unable to find entered drop session for dragging session (%@)", (uint8_t *)&v9, 0x16u);
      }
    }
  }
  else if (!v6)
  {
    id v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_sendSessionDidEnd____s_category) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412546;
      id v10 = self;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "dropInteraction (%@) unable to find entered drop session for dragging session (%@)", (uint8_t *)&v9, 0x16u);
    }
  }
  if ((*(_WORD *)&self->_delegateImplements & 0x40) != 0) {
    [v5 dropInteraction:self sessionDidEnd:v6];
  }
}

+ (NSCopying)visualStyleRegistryIdentity
{
  return (NSCopying *)@"UIDropInteraction";
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (BOOL)allowsSimultaneousDropSessions
{
  return self->_allowsSimultaneousDropSessions;
}

- (_UIDropInteractionOwning)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  return (_UIDropInteractionOwning *)WeakRetained;
}

- (void)setOwner:(id)a3
{
}

- (void)setContext:(id)a3
{
}

- (UIPasteConfiguration)_pasteConfiguration
{
  return self->_pasteConfiguration;
}

- (void)setInteractionEffect:(id)a3
{
}

- (BOOL)_wantsDefaultVisualBehavior
{
  return self->_wantsDefaultVisualBehavior;
}

@end