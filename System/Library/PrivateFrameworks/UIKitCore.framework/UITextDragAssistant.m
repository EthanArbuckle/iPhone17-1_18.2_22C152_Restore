@interface UITextDragAssistant
- (BOOL)_dragInteraction:(id)a3 competingGestureRecognizerShouldDelayLift:(id)a4;
- (BOOL)_dragInteraction:(id)a3 shouldDelayCompetingGestureRecognizer:(id)a4;
- (BOOL)_dragInteractionShouldBecomeDraggingSourceDelegate:(id)a3;
- (BOOL)_hasDraggedTextRange:(id)a3;
- (BOOL)_updateCurrentDropProposalInSession:(id)a3 usingRequest:(id)a4;
- (BOOL)_viewHasOtherDragInteraction;
- (BOOL)accessibilityCanDrag;
- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4;
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (BOOL)isDragActive;
- (BOOL)isDropActive;
- (UIDragInteraction)dragInteraction;
- (UIDropInteraction)dropInteraction;
- (UITextDragAssistant)initWithDraggableOnlyView:(id)a3;
- (UITextDragAssistant)initWithView:(id)a3;
- (UITextDragAssistant)initWithView:(id)a3 geometry:(id)a4;
- (UITextDragSupporting)view;
- (UITextDraggableGeometry)geometry;
- (id)_accessibilityDraggableRanges;
- (id)_closestPositionToPoint:(CGPoint)a3;
- (id)_containerViewForDropPreviews;
- (id)_containerViewForLiftPreviews;
- (id)_dropRequestWithRange:(id)a3 inSession:(id)a4;
- (id)_dropRequestWithRange:(id)a3 suggestedProposal:(id)a4 inSession:(id)a5;
- (id)_itemsForDraggedRange:(id)a3;
- (id)_positionInSession:(id)a3;
- (id)_previewForIrrelevantItemFromPreview:(id)a3;
- (id)_previewForTopmostItem:(id)a3;
- (id)_rangeInSession:(id)a3;
- (id)_shrinkingPreview:(id)a3 toPosition:(id)a4;
- (id)_suggestedProposalForRequest:(id)a3;
- (id)_textPasteSelectableRangeForResult:(id)a3 fromRange:(id)a4;
- (id)_textRangeForDraggingFromPoint:(CGPoint)a3;
- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)dragInteraction:(id)a3 sessionForAddingItems:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (int64_t)_dataOwnerForSession:(id)a3 atPoint:(CGPoint)a4;
- (int64_t)_dragInteraction:(id)a3 dataOwnerForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (int64_t)_textPasteRangeBehavior;
- (void)_addDraggedTextRangeForItems:(id)a3 defaultRange:(id)a4;
- (void)_applyOptionsToGeometry;
- (void)_cleanupDrop;
- (void)_clearDraggedTextRanges;
- (void)_dropInteraction:(id)a3 delayedPreviewProviderForDroppingItem:(id)a4 previewProvider:(id)a5;
- (void)_forDraggedTextRangesDo:(id)a3;
- (void)_ghostDraggedTextRanges:(BOOL)a3;
- (void)_initializeDragSession:(id)a3 withInteraction:(id)a4;
- (void)_liftOrDrag:(int64_t)a3 didEndWithOperation:(unint64_t)a4;
- (void)_performDropToRange:(id)a3 inSession:(id)a4;
- (void)_performSameViewOperation:(id)a3;
- (void)_prepareSameViewOperation:(unint64_t)a3 forItems:(id)a4 fromRanges:(id)a5 toRange:(id)a6;
- (void)_restoreResponderIfNeededForOperation:(unint64_t)a3;
- (void)_stopObservingTextStorage;
- (void)_textStorageDidProcessEditing;
- (void)_updateDropCaretToRange:(id)a3 session:(id)a4;
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
- (void)installDragInteractionIfNeeded;
- (void)installDropInteractionIfNeeded;
- (void)invalidateDropCaret;
- (void)notifyTextInteraction;
- (void)textPasteSessionDidEndPasting:(id)a3;
- (void)textPasteSessionDidRevealPasteResult:(id)a3;
- (void)textPasteSessionWillBeginPasting:(id)a3;
- (void)textPasteSessionWillHidePasteResult:(id)a3;
@end

@implementation UITextDragAssistant

uint64_t __51__UITextDragAssistant__viewHasOtherDragInteraction__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 208));
  if (WeakRetained == v3)
  {
    char isKindOfClass = 0;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (BOOL)isDragActive
{
  return self->_currentDragSession != 0;
}

- (BOOL)isDropActive
{
  return self->_currentDropSession != 0;
}

- (void)installDragInteractionIfNeeded
{
  p_dragInteraction = &self->_dragInteraction;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragInteraction);
  if (!WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_view);
    int v6 = [v5 conformsToProtocol:&unk_1ED430238];

    if (!v6) {
      return;
    }
    obj = [[UIDragInteraction alloc] initWithDelegate:self];
    [(UIDragInteraction *)obj _setAllowsPointerDragBeforeLiftDelay:0];
    objc_storeWeak((id *)p_dragInteraction, obj);
    id v7 = objc_loadWeakRetained((id *)&self->_view);
    [v7 addInteraction:obj];

    [(UIDragInteraction *)obj setEnabled:[(UITextDragAssistant *)self _viewHasOtherDragInteraction] ^ 1];
    id WeakRetained = obj;
  }
}

- (BOOL)_viewHasOtherDragInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v4 = [WeakRetained interactions];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__UITextDragAssistant__viewHasOtherDragInteraction__block_invoke;
  v7[3] = &unk_1E5309F18;
  v7[4] = self;
  uint64_t v5 = [v4 indexOfObjectPassingTest:v7];

  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)installDropInteractionIfNeeded
{
  p_dropInteraction = &self->_dropInteraction;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dropInteraction);
  if (!WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_view);
    int v6 = [v5 conformsToProtocol:&unk_1ED430438];

    if (!v6) {
      return;
    }
    v8 = [[UIDropInteraction alloc] initWithDelegate:self];
    objc_storeWeak((id *)p_dropInteraction, v8);
    id v7 = objc_loadWeakRetained((id *)&self->_view);
    [v7 addInteraction:v8];

    id WeakRetained = v8;
  }
}

- (UITextDragAssistant)initWithView:(id)a3 geometry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)UITextDragAssistant;
  v9 = [(UITextDragAssistant *)&v26 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_view, v7);
    uint64_t v11 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    targetedPreviewProviders = v10->_targetedPreviewProviders;
    v10->_targetedPreviewProviders = (NSMapTable *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    previewProviders = v10->_previewProviders;
    v10->_previewProviders = (NSMapTable *)v13;

    if (v8) {
      objc_storeStrong((id *)&v10->_geometry, a4);
    }
    if (!v10->_geometry)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v10->_view);
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        id v17 = objc_loadWeakRetained((id *)&v10->_view);
        uint64_t v18 = [v17 _textGeometry];
        geometry = v10->_geometry;
        v10->_geometry = (UITextDraggableGeometry *)v18;
      }
      if (!v10->_geometry)
      {
        v25 = [MEMORY[0x1E4F28B00] currentHandler];
        [v25 handleFailureInMethod:a2 object:v10 file:@"UITextDragAssistant.m" lineNumber:153 description:@"UITextDragAssistant can't be initialized without a geometry"];
      }
    }
    [(UITextDragAssistant *)v10 _applyOptionsToGeometry];
    id v20 = objc_loadWeakRetained((id *)&v10->_view);
    v10->_flags = ($D3CAFCF02A3AF4FB83658BC181FD711E)(*(_DWORD *)&v10->_flags & 0xFFFFFFFE | [v20 conformsToProtocol:&unk_1ED42EA68]);

    id v21 = objc_loadWeakRetained((id *)&v10->_view);
    if (objc_opt_respondsToSelector()) {
      int v22 = 0x8000;
    }
    else {
      int v22 = 0;
    }
    v10->_flags = ($D3CAFCF02A3AF4FB83658BC181FD711E)(*(_DWORD *)&v10->_flags & 0xFFFF7FFF | v22);

    if ([(UITextDraggableGeometry *)v10->_geometry conformsToProtocol:&unk_1ED65FC10])int v23 = 2; {
    else
    }
      int v23 = 0;
    v10->_flags = ($D3CAFCF02A3AF4FB83658BC181FD711E)(*(_DWORD *)&v10->_flags & 0xFFFFFFFD | v23);
  }

  return v10;
}

- (UITextDragAssistant)initWithView:(id)a3
{
  return [(UITextDragAssistant *)self initWithView:a3 geometry:0];
}

- (void)_applyOptionsToGeometry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  uint64_t v4 = [WeakRetained textDragOptions] & 1;

  geometry = self->_geometry;
  [(UITextDraggableGeometry *)geometry setGeometryOptions:v4];
}

- (BOOL)_dragInteractionShouldBecomeDraggingSourceDelegate:(id)a3
{
  return ![(UITextDragAssistant *)self _viewHasOtherDragInteraction];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dropInteraction);
  objc_destroyWeak((id *)&self->_dragInteraction);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong(&self->_delayedPreviewProvider, 0);
  objc_destroyWeak((id *)&self->_dropPasteSession);
  objc_storeStrong((id *)&self->_dropPasteController, 0);
  objc_storeStrong((id *)&self->_sameViewDropOperationResult, 0);
  objc_storeStrong((id *)&self->_sameViewDropOperation, 0);
  objc_storeStrong((id *)&self->_preDropSelectionRange, 0);
  objc_storeStrong((id *)&self->_currentDropProposal, 0);
  objc_storeStrong((id *)&self->_topmostDropPreview, 0);
  objc_storeStrong((id *)&self->_topmostDropItem, 0);
  objc_storeStrong((id *)&self->_currentDropRange, 0);
  objc_storeStrong((id *)&self->_dropCaret, 0);
  objc_storeStrong((id *)&self->_currentDropSession, 0);
  objc_destroyWeak((id *)&self->_observingStorage);
  objc_storeStrong((id *)&self->_previewProviders, 0);
  objc_storeStrong((id *)&self->_targetedPreviewProviders, 0);
  objc_storeStrong((id *)&self->_movedItemsInView, 0);
  objc_storeStrong((id *)&self->_initialDragSelectedRange, 0);
  objc_storeStrong((id *)&self->_draggedTextRanges, 0);
  objc_storeStrong((id *)&self->_currentDragInteraction, 0);
  objc_storeStrong((id *)&self->_currentDragSession, 0);
  objc_storeStrong((id *)&self->_geometry, 0);
}

- (UITextDragAssistant)initWithDraggableOnlyView:(id)a3
{
  return [(UITextDragAssistant *)self initWithView:a3 geometry:0];
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  currentDragSession = self->_currentDragSession;
  if (has_internal_diagnostics)
  {
    if (!currentDragSession) {
      goto LABEL_3;
    }
    v45 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v52 = 0;
      _os_log_fault_impl(&dword_1853B0000, v45, OS_LOG_TYPE_FAULT, "text dragging doesn't support beginning a new session", v52, 2u);
    }
  }
  else
  {
    if (!currentDragSession) {
      goto LABEL_3;
    }
    v46 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &dragInteraction_itemsForBeginningSession____s_category_0)+ 8);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v46, OS_LOG_TYPE_ERROR, "text dragging doesn't support beginning a new session", buf, 2u);
    }
  }
  if (self->_currentDragSession) {
    goto LABEL_12;
  }
LABEL_3:
  +[_UIKitDragAndDropStatistics incrementUIKitScalarValueBy:1 forKey:@"dragStartedFromTextContent"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_view);
    int v13 = [v12 isSelectable];

    if (!v13) {
      goto LABEL_12;
    }
  }
  id v14 = objc_loadWeakRetained((id *)&self->_view);
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    id v16 = objc_loadWeakRetained((id *)&self->_view);
    char v17 = [v16 _isInteractiveTextSelectionDisabled];

    if (v17) {
      goto LABEL_12;
    }
  }
  id v18 = objc_loadWeakRetained((id *)&self->_view);
  if (objc_opt_respondsToSelector())
  {
    char v19 = [v18 _shouldObscureInput];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {

      goto LABEL_14;
    }
    char v19 = [v18 isSecureTextEntry];
  }
  char v20 = v19;

  if (v20)
  {
LABEL_12:
    id v21 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_28;
  }
LABEL_14:
  id v22 = objc_loadWeakRetained((id *)&self->_view);
  int v23 = [v22 textDragDelegate];

  id v24 = objc_loadWeakRetained((id *)&self->_view);
  [v7 locationInView:v24];
  v25 = -[UITextDragAssistant _textRangeForDraggingFromPoint:](self, "_textRangeForDraggingFromPoint:");

  if (v23 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v26 = objc_loadWeakRetained((id *)&self->_view);
    [v7 locationInView:v26];
    double v28 = v27;
    double v30 = v29;

    v31 = -[UITextDragAssistant _closestPositionToPoint:](self, "_closestPositionToPoint:", v28, v30);
    id v32 = objc_loadWeakRetained((id *)&self->_view);
    v33 = [v23 textDraggableView:v32 textRangeForDragFromPosition:v31 defaultRange:v25 session:v7];

    if (v33)
    {
      id v34 = objc_loadWeakRetained((id *)&self->_view);
      id v48 = objc_loadWeakRetained((id *)&self->_view);
      v47 = [v48 beginningOfDocument];
      id v50 = v6;
      id v35 = objc_loadWeakRetained((id *)&self->_view);
      v36 = [v35 endOfDocument];
      [v34 textRangeFromPosition:v47 toPosition:v36];
      v37 = v49 = v31;
      v25 = [v34 _intersectionOfRange:v33 andRange:v37];

      v31 = v49;
      id v6 = v50;
    }
    else
    {
      v25 = 0;
    }
  }
  if (v25)
  {
    id v21 = [(UITextDragAssistant *)self _itemsForDraggedRange:v25];
    if (v23 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v38 = [[UITextDragRequest alloc] initWithRange:v25 inSession:v7];
      [(UITextDragRequest *)v38 setSuggestedItems:v21];
      id v39 = objc_loadWeakRetained((id *)&self->_view);
      v40 = [v39 selectedTextRange];
      -[UITextDragRequest setSelected:](v38, "setSelected:", [v40 isEqual:v25]);

      id v41 = objc_loadWeakRetained((id *)&self->_view);
      v42 = [v23 textDraggableView:v41 itemsForDrag:v38];

      v43 = [(UITextDragRequest *)v38 suggestedItems];
      _UIDragStatisticsLogTextDelegateItems(v43, v42);

      id v21 = v42;
    }
    if (objc_msgSend(v21, "count", v47))
    {
      [(UITextDragAssistant *)self _initializeDragSession:v7 withInteraction:v6];
      [(UITextDragAssistant *)self _addDraggedTextRangeForItems:v21 defaultRange:v25];
    }
  }
  else
  {
    id v21 = (void *)MEMORY[0x1E4F1CBF0];
  }

LABEL_28:
  return v21;
}

- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v8 = (UIDragSession *)a4;
  if (self->_currentDragSession != v8) {
    goto LABEL_2;
  }
  id v10 = objc_loadWeakRetained((id *)&self->_view);
  if (objc_opt_respondsToSelector())
  {
    char v11 = [v10 _shouldObscureInput];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {

      goto LABEL_10;
    }
    char v11 = [v10 isSecureTextEntry];
  }
  char v12 = v11;

  if (v12)
  {
LABEL_2:
    v9 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_20;
  }
LABEL_10:
  int v13 = -[UITextDragAssistant _textRangeForDraggingFromPoint:](self, "_textRangeForDraggingFromPoint:", x, y);
  if (v13 && ![(UITextDragAssistant *)self _hasDraggedTextRange:v13])
  {
    v9 = [(UITextDragAssistant *)self _itemsForDraggedRange:v13];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    char v15 = [WeakRetained textDragDelegate];

    if (v15 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v16 = [[UITextDragRequest alloc] initWithRange:v13 inSession:v8];
      [(UITextDragRequest *)v16 setSuggestedItems:v9];
      id v17 = objc_loadWeakRetained((id *)&self->_view);
      id v18 = [v17 selectedTextRange];
      -[UITextDragRequest setSelected:](v16, "setSelected:", [v18 isEqual:v13]);

      id v19 = objc_loadWeakRetained((id *)&self->_view);
      char v20 = [v15 textDraggableView:v19 itemsForDrag:v16];

      id v21 = [(UITextDragRequest *)v16 suggestedItems];
      _UIDragStatisticsLogTextDelegateItems(v21, v20);

      v9 = v20;
    }
    if ([v9 count]) {
      [(UITextDragAssistant *)self _addDraggedTextRangeForItems:v9 defaultRange:v13];
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

LABEL_20:
  return v9;
}

- (id)dragInteraction:(id)a3 sessionForAddingItems:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (self->_currentDragSession && objc_msgSend(v8, "containsObject:")) {
    id v10 = self->_currentDragSession;
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [(NSMapTable *)self->_targetedPreviewProviders objectForKey:v7];
  if (v9)
  {
    id v10 = [(UITextDragAssistant *)self _containerViewForLiftPreviews];
    char v11 = ((void (**)(void, void *, uint64_t))v9)[2](v9, v10, 1);
  }
  else
  {
    p_view = &self->_view;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    id v10 = [WeakRetained textDragDelegate];

    if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v14 = objc_loadWeakRetained((id *)p_view);
      char v11 = [v10 textDraggableView:v14 dragPreviewForLiftingItem:v7 session:v8];
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__UITextDragAssistant_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke;
  v17[3] = &unk_1E52D9F70;
  id v11 = v8;
  id v18 = v11;
  +[UIView performWithoutAnimation:v17];
  [(UITextDragAssistant *)self _ghostDraggedTextRanges:1];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__UITextDragAssistant_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2;
  v16[3] = &unk_1E52DC698;
  v16[4] = self;
  [v9 addCompletion:v16];
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  id v14 = [WeakRetained textDragDelegate];

  if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v15 = objc_loadWeakRetained((id *)p_view);
    [v14 textDraggableView:v15 willAnimateLiftWithAnimator:v9 session:v10];
  }
}

void __75__UITextDragAssistant_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  v1 = +[_UIEditMenuSceneComponent sceneComponentForView:v2];
  [v1 dismissCurrentMenu];
}

void __75__UITextDragAssistant_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    id v2 = *(void **)(a1 + 32);
    [v2 _liftOrDrag:1 didEndWithOperation:0];
  }
  else if (!a2)
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 8) |= 8u;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 200));
    [WeakRetained draggingStarted];
  }
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v6 = a4;
  if (*((unsigned char *)&self->_flags + 2))
  {
    char v12 = 0;
  }
  else
  {
    p_view = &self->_view;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_view);
      id v11 = [v10 willGenerateCancelPreview];
    }
    else
    {
      id v11 = 0;
    }
    int v13 = [(NSMapTable *)self->_targetedPreviewProviders objectForKey:v6];
    id v14 = [(UITextDragAssistant *)self _containerViewForDropPreviews];
    id v15 = v14;
    if (v13)
    {
      char v12 = [v14 window];

      if (v12)
      {
        char v12 = ((void (**)(void, void *, void))v13)[2](v13, v15, 0);
      }
    }
    else
    {
      char v12 = 0;
    }
    id v16 = objc_loadWeakRetained((id *)p_view);
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      id v18 = objc_loadWeakRetained((id *)p_view);
      [v18 didGenerateCancelPreview:v11];
    }
    if (v12)
    {
      id v19 = [v12 target];
      uint64_t v20 = [v19 container];
      [(id)v20 bounds];
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;

      [v12 size];
      CGFloat v30 = v29 / -3.0;
      [v12 size];
      CGFloat v32 = v31 / -3.0;
      v44.origin.CGFloat x = v22;
      v44.origin.CGFloat y = v24;
      v44.size.CGFloat width = v26;
      v44.size.CGFloat height = v28;
      CGRect v45 = CGRectInset(v44, v30, v32);
      CGFloat x = v45.origin.x;
      CGFloat y = v45.origin.y;
      CGFloat width = v45.size.width;
      CGFloat height = v45.size.height;
      v37 = [v12 view];
      [v37 frame];
      v47.origin.CGFloat x = v38;
      v47.origin.CGFloat y = v39;
      v47.size.CGFloat width = v40;
      v47.size.CGFloat height = v41;
      v46.origin.CGFloat x = x;
      v46.origin.CGFloat y = y;
      v46.size.CGFloat width = width;
      v46.size.CGFloat height = height;
      LOBYTE(v20) = CGRectIntersectsRect(v46, v47);

      if ((v20 & 1) == 0)
      {

        char v12 = 0;
      }
    }
  }
  return v12;
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  id v6 = a5;
  $D3CAFCF02A3AF4FB83658BC181FD711E flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) == 0)
  {
    self->_$D3CAFCF02A3AF4FB83658BC181FD711E flags = ($D3CAFCF02A3AF4FB83658BC181FD711E)(*(_DWORD *)&flags | 0x10);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __74__UITextDragAssistant_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke;
      v11[3] = &unk_1E52D9F70;
      v11[4] = self;
      [v6 addAnimations:v11];
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__UITextDragAssistant_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke_2;
    v10[3] = &unk_1E52DC698;
    v10[4] = self;
    [v6 addCompletion:v10];
  }
}

void __74__UITextDragAssistant_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 200));
  [WeakRetained performCancelAnimations];
}

uint64_t __74__UITextDragAssistant_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _restoreResponderIfNeededForOperation:0];
  id v2 = *(void **)(a1 + 32);
  return [v2 _clearDraggedTextRanges];
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  currentDragSession = self->_currentDragSession;
  if (has_internal_diagnostics)
  {
    if (!currentDragSession)
    {
      CGFloat v26 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v26, OS_LOG_TYPE_FAULT, "sessionWillBegin without current drag session", buf, 2u);
      }
    }
  }
  else if (!currentDragSession)
  {
    double v27 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &dragInteraction_sessionWillBegin____s_category) + 8);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_ERROR, "sessionWillBegin without current drag session", buf, 2u);
    }
  }
  *(_DWORD *)&self->_flags &= ~0x10u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = objc_msgSend(v5, "items", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v14 = [(NSMapTable *)self->_previewProviders objectForKey:v13];
        if (v14)
        {
          [v13 setPreviewProvider:v14];
          [(NSMapTable *)self->_previewProviders removeObjectForKey:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v10);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  [WeakRetained resignFirstResponder];

  id v16 = objc_loadWeakRetained((id *)&self->_view);
  int v17 = [v16 conformsToProtocol:&unk_1ED662E68];

  if (v17)
  {
    id v18 = objc_loadWeakRetained((id *)&self->_view);
    [v18 cancelInteractionWithLink];
  }
  id v19 = objc_loadWeakRetained((id *)&self->_view);
  uint64_t v20 = [v19 textDragDelegate];

  if (v20 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v21 = objc_loadWeakRetained((id *)&self->_view);
    [v20 textDraggableView:v21 dragSessionWillBegin:v5];
  }
  $D3CAFCF02A3AF4FB83658BC181FD711E flags = self->_flags;
  self->_$D3CAFCF02A3AF4FB83658BC181FD711E flags = ($D3CAFCF02A3AF4FB83658BC181FD711E)(*(_DWORD *)&flags & 0xFFFEFFFF);
  if ((*(_WORD *)&flags & 0x8000) != 0)
  {
    id v23 = objc_loadWeakRetained((id *)&self->_view);
    CGFloat v24 = [v23 textStorage];

    if (v24)
    {
      objc_storeWeak((id *)&self->_observingStorage, v24);
      double v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v25 addObserver:self selector:sel__textStorageDidProcessEditing name:*(void *)off_1E52D2350 object:v24];
    }
  }
  [(UITextDragAssistant *)self _ghostDraggedTextRanges:1];
}

- (void)dragInteraction:(id)a3 sessionDidMove:(id)a4
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  currentDragSession = self->_currentDragSession;
  if (has_internal_diagnostics)
  {
    if (!currentDragSession)
    {
      id v7 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "sessionDidMove without current drag session", buf, 2u);
      }
    }
  }
  else if (!currentDragSession)
  {
    id v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &dragInteraction_sessionDidMove____s_category) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "sessionDidMove without current drag session", v9, 2u);
    }
  }
  *(_DWORD *)&self->_flags &= ~4u;
}

- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  currentDragSession = self->_currentDragSession;
  if (has_internal_diagnostics)
  {
    if (!currentDragSession)
    {
      uint64_t v9 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "session:willEndWithOperation: without current drag session", buf, 2u);
      }
    }
  }
  else if (!currentDragSession)
  {
    uint64_t v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &dragInteraction_session_willEndWithOperation____s_category)+ 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "session:willEndWithOperation: without current drag session", buf, 2u);
    }
  }
  [(UITextDragAssistant *)self _stopObservingTextStorage];
  if (a5 != 3 || self->_sameViewDropOperationResult)
  {
    if (!a5) {
      return;
    }
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__UITextDragAssistant_dragInteraction_session_willEndWithOperation___block_invoke;
    v11[3] = &unk_1E52DF0F0;
    v11[4] = self;
    [(UITextDragAssistant *)self _forDraggedTextRangesDo:v11];
  }
  [(UITextDragAssistant *)self _restoreResponderIfNeededForOperation:a5];
}

void __68__UITextDragAssistant_dragInteraction_session_willEndWithOperation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(*(void *)(a1 + 32) + 200);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setSelectedTextRange:v4];

  id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 200));
  [v6 deleteBackward];
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  id v7 = a4;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  currentDragSession = self->_currentDragSession;
  if (has_internal_diagnostics)
  {
    if (!currentDragSession)
    {
      int v13 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v13, OS_LOG_TYPE_FAULT, "session:didEndWithOperation: without current drag session", buf, 2u);
      }
    }
  }
  else if (!currentDragSession)
  {
    id v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &dragInteraction_session_didEndWithOperation____s_category)+ 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "session:didEndWithOperation: without current drag session", v15, 2u);
    }
  }
  [(UITextDragAssistant *)self _stopObservingTextStorage];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  uint64_t v11 = [WeakRetained textDragDelegate];

  if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_view);
    [v11 textDraggableView:v12 dragSessionDidEnd:v7 withOperation:a5];
  }
  [(UITextDragAssistant *)self _liftOrDrag:0 didEndWithOperation:a5];
}

- (void)_liftOrDrag:(int64_t)a3 didEndWithOperation:(unint64_t)a4
{
  [(UITextDragAssistant *)self _clearDraggedTextRanges];
  if (a4 >= 2 && !self->_sameViewDropOperationResult)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    [WeakRetained setSelectedTextRange:0];
  }
  [(UITextDragAssistant *)self _restoreResponderIfNeededForOperation:a4];
  currentDragSession = self->_currentDragSession;
  self->_currentDragSession = 0;

  currentDragInteraction = self->_currentDragInteraction;
  self->_currentDragInteraction = 0;

  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    id v11 = (id)objc_opt_new();
    [v11 setDragTearoffOccured:a3 == 0];
    if (a3 == 1) {
      objc_msgSend(v11, "setLocation:", self->_initialDragLocation.x, self->_initialDragLocation.y);
    }
    id v10 = objc_loadWeakRetained((id *)&self->_view);
    [v10 draggingFinished:v11];

    *(_DWORD *)&self->_flags &= ~8u;
  }
}

- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4
{
  return 1;
}

- (BOOL)_dragInteraction:(id)a3 shouldDelayCompetingGestureRecognizer:(id)a4
{
  id v5 = a4;
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  id v8 = [WeakRetained textDragDelegate];

  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v9 = objc_loadWeakRetained((id *)p_view);
    LOBYTE(p_view) = [v8 _textDraggableView:v9 beginningDragShouldDelayCompetingGestureRecognizer:v5];
  }
  else
  {
    if (![v5 _isGestureType:6])
    {
      LOBYTE(p_view) = 1;
      goto LABEL_8;
    }
    id v9 = objc_loadWeakRetained((id *)p_view);
    LODWORD(p_view) = [v9 isEditing] ^ 1;
  }

LABEL_8:
  return (char)p_view;
}

- (BOOL)_dragInteraction:(id)a3 competingGestureRecognizerShouldDelayLift:(id)a4
{
  id v4 = a4;
  id v5 = [v4 view];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [v4 view];
    char v8 = [v7 gestureRecognizerShouldDelayLift:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  p_view = &self->_view;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_view);
  [v6 locationInView:WeakRetained];
  int64_t v8 = -[UITextDragAssistant _dataOwnerForSession:atPoint:](self, "_dataOwnerForSession:atPoint:", v6);

  return v8;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  return -[UITextDragAssistant _dataOwnerForSession:atPoint:](self, "_dataOwnerForSession:atPoint:", a4, a5.x, a5.y);
}

- (int64_t)_dataOwnerForSession:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  id v10 = [WeakRetained textDragDelegate];

  if (objc_opt_respondsToSelector())
  {
    id v11 = -[UITextDragAssistant _textRangeForDraggingFromPoint:](self, "_textRangeForDraggingFromPoint:", x, y);
    if (v11)
    {
      id v12 = [[UITextDragRequest alloc] initWithRange:v11 inSession:v7];
      id v13 = objc_loadWeakRetained((id *)p_view);
      int64_t v14 = [v10 _textDraggableView:v13 dataOwnerForDrag:v12];
    }
    else
    {
      int64_t v14 = 0;
    }
    goto LABEL_7;
  }
  id v15 = objc_loadWeakRetained((id *)&self->_view);
  int64_t v14 = [v15 _dragDataOwner];

  if (!v14)
  {
    id v11 = objc_loadWeakRetained((id *)p_view);
    int64_t v14 = [v11 _dataOwnerForCopy];
LABEL_7:
  }
  return v14;
}

- (BOOL)accessibilityCanDrag
{
  id v2 = [(UITextDragAssistant *)self _accessibilityDraggableRanges];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)notifyTextInteraction
{
}

- (id)_accessibilityDraggableRanges
{
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  char v5 = objc_opt_respondsToSelector();

  id v6 = objc_loadWeakRetained((id *)p_view);
  id v7 = v6;
  if (v5) {
    [v6 _accessibilityVisibleTextRangeForDrag];
  }
  else {
  int64_t v8 = [v6 _fullRange];
  }

  id v9 = objc_opt_new();
  id v10 = objc_loadWeakRetained((id *)p_view);
  int v11 = [v10 isFirstResponder];

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)p_view);
    id v13 = [v12 selectedTextRange];

    if (v13)
    {
      if (([v13 isEmpty] & 1) == 0)
      {
        id v14 = objc_loadWeakRetained((id *)p_view);
        int v15 = [v14 _range:v8 containsRange:v13];

        if (v15) {
          [v9 addObject:v13];
        }
      }
    }
  }
  id v16 = [(UITextDragAssistant *)self geometry];
  int v17 = [v16 textRangesForAttachmentsInTextRange:v8];
  [v9 addObjectsFromArray:v17];

  id v18 = (void *)[v9 copy];
  return v18;
}

- (void)_textStorageDidProcessEditing
{
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (void)_stopObservingTextStorage
{
  p_observingStorage = &self->_observingStorage;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observingStorage);
  if (WeakRetained)
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self name:*(void *)off_1E52D2350 object:WeakRetained];

    objc_storeWeak((id *)p_observingStorage, 0);
  }
}

- (id)_textRangeForDraggingFromPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  int v8 = [WeakRetained isFirstResponder];

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_view);
    id v10 = [v9 selectedTextRange];

    if (v10)
    {
      if (([v10 isEmpty] & 1) == 0)
      {
        id v11 = objc_loadWeakRetained((id *)p_view);
        char v12 = UITextRangeContainsPointInViewWithSlop(v11, v10, x, y, 4.0);

        if (v12) {
          goto LABEL_11;
        }
      }
    }
  }
  id v13 = -[UITextDragAssistant _closestPositionToPoint:](self, "_closestPositionToPoint:", x, y);
  id v14 = objc_loadWeakRetained((id *)p_view);
  int v15 = [v14 _rangeOfLineEnclosingPosition:v13];

  if (v15 && ([v15 isEmpty] & 1) == 0)
  {
    id v16 = [(UITextDragAssistant *)self geometry];
    id v10 = objc_msgSend(v16, "textRangeForAttachmentInTextRange:atPoint:", v15, x, y);
  }
  else
  {
    id v10 = 0;
  }

LABEL_11:
  return v10;
}

- (void)_initializeDragSession:(id)a3 withInteraction:(id)a4
{
  id v19 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_currentDragSession, a3);
  objc_storeStrong((id *)&self->_currentDragInteraction, a4);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  int v9 = [WeakRetained isFirstResponder];

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_view);
    id v11 = [v10 selectedTextRange];
    initialDragSelectedRange = self->_initialDragSelectedRange;
    self->_initialDragSelectedRange = v11;
  }
  else
  {
    id v10 = self->_initialDragSelectedRange;
    self->_initialDragSelectedRange = 0;
  }

  id v13 = objc_loadWeakRetained((id *)&self->_view);
  [v19 locationInView:v13];
  self->_initialDragLocation.double x = v14;
  self->_initialDragLocation.double y = v15;

  [(UITextDragAssistant *)self _clearDraggedTextRanges];
  id v16 = objc_loadWeakRetained((id *)&self->_view);
  if ([v16 isFirstResponder]) {
    int v17 = 4;
  }
  else {
    int v17 = 0;
  }
  self->_$D3CAFCF02A3AF4FB83658BC181FD711E flags = ($D3CAFCF02A3AF4FB83658BC181FD711E)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v17);

  sameViewDropOperationResult = self->_sameViewDropOperationResult;
  self->_sameViewDropOperationResult = 0;
}

- (void)_restoreResponderIfNeededForOperation:(unint64_t)a3
{
  if (a3 <= 1 && (id v4 = self->_initialDragSelectedRange) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    [WeakRetained setSelectedTextRange:v4];

    initialDragSelectedRange = self->_initialDragSelectedRange;
    self->_initialDragSelectedRange = 0;
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    return;
  }
  p_view = &self->_view;
  id v8 = objc_loadWeakRetained((id *)p_view);
  int v9 = [v8 window];
  id v10 = [v9 _firstResponder];

  if (!v10)
  {
    id v11 = objc_loadWeakRetained((id *)p_view);
    [v11 becomeFirstResponder];
  }
}

- (id)_itemsForDraggedRange:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(UITextDragAssistant *)self geometry];
  id v6 = [v5 draggableObjectsForTextRange:v4];

  if ([v6 count])
  {
    id v26 = v4;
    long long v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    double v25 = v6;
    id obj = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          char v12 = objc_msgSend(v11, "itemProvider", v25);
          id v13 = [[UIDragItem alloc] initWithItemProvider:v12];
          CGFloat v14 = [v11 range];
          [(UIDragItem *)v13 _setDraggedTextRange:v14];

          CGFloat v15 = [v11 targetedPreviewProvider];

          if (v15)
          {
            targetedPreviewProviders = self->_targetedPreviewProviders;
            int v17 = [v11 targetedPreviewProvider];
            id v18 = _Block_copy(v17);
            [(NSMapTable *)targetedPreviewProviders setObject:v18 forKey:v13];
          }
          id v19 = [v11 previewProvider];

          if (v19)
          {
            previewProviders = self->_previewProviders;
            id v21 = [v11 previewProvider];
            CGFloat v22 = _Block_copy(v21);
            [(NSMapTable *)previewProviders setObject:v22 forKey:v13];
          }
          [v28 addObject:v13];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v8);
    }

    id v23 = (void *)[v28 copy];
    id v6 = v25;
    id v4 = v26;
  }
  else
  {
    id v23 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v23;
}

- (id)_containerViewForLiftPreviews
{
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  id v4 = [WeakRetained _window];
  char v5 = [v4 windowScene];
  id v6 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:v5];
  uint64_t v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_loadWeakRetained((id *)p_view);
  }
  uint64_t v9 = v8;

  return v9;
}

- (id)_containerViewForDropPreviews
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return WeakRetained;
}

- (BOOL)_hasDraggedTextRange:(id)a3
{
  return [(NSArray *)self->_draggedTextRanges containsObject:a3];
}

- (void)_addDraggedTextRangeForItems:(id)a3 defaultRange:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        CGFloat v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        CGFloat v15 = objc_msgSend(v14, "_draggedTextRange", (void)v21);

        if (!v15) {
          [v14 _setDraggedTextRange:v7];
        }
        id v16 = [v14 _draggedTextRange];

        if (v16)
        {
          int v17 = [v14 _draggedTextRange];
          [v8 addObject:v17];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  draggedTextRanges = self->_draggedTextRanges;
  if (draggedTextRanges)
  {
    id v19 = [(NSArray *)draggedTextRanges arrayByAddingObjectsFromArray:v8];
  }
  else
  {
    id v19 = (NSArray *)[v8 copy];
  }
  uint64_t v20 = self->_draggedTextRanges;
  self->_draggedTextRanges = v19;
}

- (void)_forDraggedTextRangesDo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  char v5 = self->_draggedTextRanges;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_clearDraggedTextRanges
{
  [(UITextDragAssistant *)self _ghostDraggedTextRanges:0];
  draggedTextRanges = self->_draggedTextRanges;
  self->_draggedTextRanges = 0;
}

- (void)_ghostDraggedTextRanges:(BOOL)a3
{
  if (*(unsigned char *)&self->_flags)
  {
    BOOL v3 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    [WeakRetained removeAllGhostedRanges];
    if (v3)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __47__UITextDragAssistant__ghostDraggedTextRanges___block_invoke;
      v6[3] = &unk_1E52DF0F0;
      id v7 = WeakRetained;
      [(UITextDragAssistant *)self _forDraggedTextRangesDo:v6];
    }
  }
}

uint64_t __47__UITextDragAssistant__ghostDraggedTextRanges___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addGhostedRange:a2];
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v6 = a3;
  id v7 = (UIDropSession *)a4;
  uint64_t v8 = v7;
  currentDropSession = self->_currentDropSession;
  if (!currentDropSession)
  {
    long long v11 = [(UIDropSession *)v7 items];
    long long v12 = [v11 valueForKeyPath:@"itemProvider"];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    int v14 = [WeakRetained canPasteItemProviders:v12];

    if (v14)
    {
      id v15 = objc_loadWeakRetained((id *)&self->_view);
      int v16 = [v15 canBecomeDropResponder];

      if (v16)
      {
        *(_DWORD *)&self->_flags &= ~0x100u;
        id v17 = objc_loadWeakRetained((id *)&self->_view);
        char v18 = [v17 isEditable];

        if (v18) {
          goto LABEL_7;
        }
        id v29 = objc_loadWeakRetained((id *)&self->_view);
        char v30 = objc_opt_respondsToSelector();

        if (v30)
        {
          id v31 = objc_loadWeakRetained((id *)&self->_view);
          long long v32 = [v31 textDropDelegate];

          if (v32 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            uint64_t v20 = [(UITextDragAssistant *)self _dropRequestWithRange:0 inSession:v8];
            id v33 = objc_loadWeakRetained((id *)&self->_view);
            uint64_t v34 = [v32 textDroppableView:v33 willBecomeEditableForDrop:v20];

            if (v34)
            {
              if (v34 == 1) {
                int v35 = 288;
              }
              else {
                int v35 = 256;
              }
              self->_unsigned int flags = ($D3CAFCF02A3AF4FB83658BC181FD711E)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v35);
              id v36 = objc_loadWeakRetained((id *)&self->_view);
              unsigned __int8 v37 = objc_opt_respondsToSelector();

              id v38 = objc_loadWeakRetained((id *)&self->_view);
              unsigned __int8 v39 = objc_opt_respondsToSelector();

              if (v39 & v37) {
                int v40 = 64;
              }
              else {
                int v40 = 0;
              }
              self->_unsigned int flags = ($D3CAFCF02A3AF4FB83658BC181FD711E)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v40);
              if (v39 & v37)
              {
                id v41 = objc_loadWeakRetained((id *)&self->_view);
                if ([v41 isSelectable]) {
                  int v42 = 128;
                }
                else {
                  int v42 = 0;
                }
                self->_unsigned int flags = ($D3CAFCF02A3AF4FB83658BC181FD711E)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v42);
              }
LABEL_7:
              id v19 = objc_loadWeakRetained((id *)&self->_view);
              uint64_t v20 = [v19 textDropDelegate];

              if (v20)
              {
                if (objc_opt_respondsToSelector()) {
                  int v21 = 512;
                }
                else {
                  int v21 = 0;
                }
                self->_unsigned int flags = ($D3CAFCF02A3AF4FB83658BC181FD711E)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v21);
                if (objc_opt_respondsToSelector()) {
                  int v22 = 1024;
                }
                else {
                  int v22 = 0;
                }
                self->_unsigned int flags = ($D3CAFCF02A3AF4FB83658BC181FD711E)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v22);
                if (objc_opt_respondsToSelector()) {
                  int v23 = 2048;
                }
                else {
                  int v23 = 0;
                }
                self->_unsigned int flags = ($D3CAFCF02A3AF4FB83658BC181FD711E)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v23);
                if (objc_opt_respondsToSelector()) {
                  int v24 = 4096;
                }
                else {
                  int v24 = 0;
                }
                self->_unsigned int flags = ($D3CAFCF02A3AF4FB83658BC181FD711E)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v24);
                if (objc_opt_respondsToSelector()) {
                  int v25 = 0x2000;
                }
                else {
                  int v25 = 0;
                }
                self->_unsigned int flags = ($D3CAFCF02A3AF4FB83658BC181FD711E)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v25);
                if (objc_opt_respondsToSelector()) {
                  int v26 = 0x4000;
                }
                else {
                  int v26 = 0;
                }
                unsigned int flags = self->_flags;
              }
              else
              {
                int v26 = 0;
                unsigned int flags = *(_DWORD *)&self->_flags & 0xFFFFC1FF;
              }
              self->_unsigned int flags = ($D3CAFCF02A3AF4FB83658BC181FD711E)(flags & 0xFFFFBFFF | v26);
              [(UITextDragAssistant *)self _updateCurrentDropProposalInSession:v8 usingRequest:0];
              if ([(UIDropProposal *)self->_currentDropProposal operation] == UIDropOperationMove
                || [(UIDropProposal *)self->_currentDropProposal operation] == UIDropOperationCopy)
              {
                BOOL v10 = 1;
LABEL_57:

                goto LABEL_48;
              }
LABEL_56:
              BOOL v10 = 0;
              goto LABEL_57;
            }
          }
          else
          {
            uint64_t v20 = 0;
          }

          goto LABEL_56;
        }
      }
    }
    BOOL v10 = 0;
LABEL_48:

    goto LABEL_49;
  }
  if (currentDropSession == v7)
  {
    if (os_variant_has_internal_diagnostics())
    {
      CGRect v44 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v44, OS_LOG_TYPE_FAULT, "canHandleSession with the current session!", buf, 2u);
      }
    }
    else
    {
      long long v28 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &dropInteraction_canHandleSession____s_category) + 8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v45[0] = 0;
        _os_log_impl(&dword_1853B0000, v28, OS_LOG_TYPE_ERROR, "canHandleSession with the current session!", (uint8_t *)v45, 2u);
      }
    }
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }
LABEL_49:

  return v10;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v6 = a4;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  currentDropSession = self->_currentDropSession;
  if (has_internal_diagnostics)
  {
    if (currentDropSession)
    {
      id v17 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v17, OS_LOG_TYPE_FAULT, "sessionDidEnter with a current drop session", buf, 2u);
      }
    }
  }
  else if (currentDropSession)
  {
    char v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &dropInteraction_sessionDidEnter____s_category) + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "sessionDidEnter with a current drop session", v19, 2u);
    }
  }
  *(_DWORD *)&self->_flags &= ~0x20000u;
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  long long v11 = [WeakRetained selectedTextRange];
  preDropSelectionRange = self->_preDropSelectionRange;
  self->_preDropSelectionRange = v11;

  objc_storeStrong((id *)&self->_currentDropSession, a4);
  id v13 = objc_loadWeakRetained((id *)&self->_view);
  [v13 becomeDropResponder];

  id v14 = objc_loadWeakRetained((id *)&self->_view);
  id v15 = [v14 textDropDelegate];

  if (v15 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v16 = objc_loadWeakRetained((id *)p_view);
    [v15 textDroppableView:v16 dropSessionDidEnter:v6];
  }
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v5 = a4;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  currentDropSession = self->_currentDropSession;
  if (has_internal_diagnostics)
  {
    if (!currentDropSession)
    {
      int v35 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v35, OS_LOG_TYPE_FAULT, "sessionDidUpdate without current drop session", buf, 2u);
      }
    }
  }
  else if (!currentDropSession)
  {
    id v36 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &dropInteraction_sessionDidUpdate____s_category) + 8);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unsigned __int8 v37 = 0;
      _os_log_impl(&dword_1853B0000, v36, OS_LOG_TYPE_ERROR, "sessionDidUpdate without current drop session", v37, 2u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  uint64_t v9 = [WeakRetained textDropDelegate];

  $D3CAFCF02A3AF4FB83658BC181FD711E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    long long v11 = [(UITextDragAssistant *)self _dropRequestWithRange:0 inSession:v5];
    id v12 = objc_loadWeakRetained((id *)&self->_view);
    id v13 = [v9 textDroppableView:v12 rangeForDrop:v11];

    if (v13)
    {
      id v14 = [v11 dropRange];
      if (v13 == v14)
      {
        char v18 = [v11 dropRange];
        char v19 = [v13 isEqual:v18];

        if (v19) {
          goto LABEL_15;
        }
      }
      else
      {
      }
      id v20 = objc_loadWeakRetained((id *)&self->_view);
      int v21 = [v20 _fullRange];
      uint64_t v22 = [v20 _intersectionOfRange:v13 andRange:v21];

      uint64_t v23 = [(UITextDragAssistant *)self _dropRequestWithRange:v22 inSession:v5];
      id v13 = (void *)v22;
LABEL_14:

      long long v11 = (void *)v23;
    }
  }
  else
  {
    if ((*(_WORD *)&flags & 0x1000) == 0)
    {
      long long v11 = 0;
      goto LABEL_16;
    }
    long long v11 = [(UITextDragAssistant *)self _dropRequestWithRange:0 inSession:v5];
    id v15 = objc_loadWeakRetained((id *)&self->_view);
    id v13 = [v9 textDroppableView:v15 positionForDrop:v11];

    if (v13)
    {
      id v16 = [v11 dropRange];
      id v17 = [v16 start];
      if (v13 == v17)
      {
        double v27 = [v11 dropRange];
        long long v28 = [v27 start];
        char v29 = [v13 isEqual:v28];

        if (v29) {
          goto LABEL_15;
        }
      }
      else
      {
      }
      id v30 = objc_loadWeakRetained((id *)&self->_view);
      id v31 = [v30 textRangeFromPosition:v13 toPosition:v13];

      if (!v31) {
        goto LABEL_15;
      }
      id v32 = objc_loadWeakRetained((id *)&self->_view);
      id v33 = [v32 _fullRange];
      uint64_t v34 = [v32 _intersectionOfRange:v31 andRange:v33];

      if (!v34) {
        goto LABEL_15;
      }
      uint64_t v23 = [(UITextDragAssistant *)self _dropRequestWithRange:v34 inSession:v5];

      long long v11 = (void *)v34;
      goto LABEL_14;
    }
  }
LABEL_15:

LABEL_16:
  if ([(UITextDragAssistant *)self _updateCurrentDropProposalInSession:v5 usingRequest:v11])
  {
    [(UITextDragAssistant *)self _updateDropCaretToRange:self->_currentDropRange session:v5];
  }
  if ((*((unsigned char *)&self->_flags + 1) & 4) != 0)
  {
    id v24 = objc_loadWeakRetained((id *)&self->_view);
    [v9 textDroppableView:v24 dropSessionDidUpdate:v5];
  }
  int v25 = self->_currentDropProposal;

  return v25;
}

- (id)_positionInSession:(id)a3
{
  p_view = &self->_view;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_view);
  [v5 locationInView:WeakRetained];
  double v8 = v7;
  double v10 = v9;

  return -[UITextDragAssistant _closestPositionToPoint:](self, "_closestPositionToPoint:", v8, v10);
}

- (id)_rangeInSession:(id)a3
{
  id v4 = [(UITextDragAssistant *)self _positionInSession:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  id v6 = [WeakRetained textRangeFromPosition:v4 toPosition:v4];

  return v6;
}

- (BOOL)_updateCurrentDropProposalInSession:(id)a3 usingRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v7 dropRange];
  double v9 = v8;
  if (v8)
  {
    double v10 = v8;
  }
  else
  {
    double v10 = [(UITextDragAssistant *)self _rangeInSession:v6];
  }
  long long v11 = v10;

  p_currentDropRange = &self->_currentDropRange;
  if (self->_currentDropRange)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    id v14 = [(UITextRange *)self->_currentDropRange start];
    id v15 = [(UITextRange *)v11 start];
    if ([WeakRetained comparePosition:v14 toPosition:v15])
    {
    }
    else
    {
      id v16 = objc_loadWeakRetained((id *)&self->_view);
      [(UITextRange *)*p_currentDropRange end];
      id v17 = v39 = v6;
      char v18 = [(UITextRange *)v11 end];
      uint64_t v38 = [v16 comparePosition:v17 toPosition:v18];

      id v6 = v39;
      if (!v38)
      {
        BOOL v36 = 0;
        goto LABEL_29;
      }
    }
  }
  if (!v7)
  {
    id v7 = [(UITextDragAssistant *)self _dropRequestWithRange:v11 inSession:v6];
  }
  if ((*((unsigned char *)&self->_flags + 1) & 2) != 0)
  {
    id v21 = objc_loadWeakRetained((id *)&self->_view);
    id v20 = [v21 textDropDelegate];

    id v22 = objc_loadWeakRetained((id *)&self->_view);
    uint64_t v23 = [v20 textDroppableView:v22 proposalForDrop:v7];

    if (v23)
    {
      id v24 = (UITextDropProposal *)[v23 copy];

      int v25 = self->_currentDragSession;
      id v40 = v6;
      id v26 = v6;
      uint64_t v27 = [v26 localDragSession];
      if (v27)
      {
        long long v28 = (void *)v27;
        char v29 = [v26 localDragSession];

        id v6 = v40;
        if (v29 == v25 && (*((unsigned char *)&self->_flags + 2) & 1) != 0)
        {
          [(UIDropProposal *)v24 setOperation:2];
          [(UITextDropProposal *)v24 setUseFastSameViewOperations:0];
        }
      }
      else
      {
      }
      currentDropProposal = self->_currentDropProposal;
      self->_currentDropProposal = v24;
      id v31 = v24;
    }
    else
    {
      id v30 = [v7 suggestedProposal];
      id v31 = self->_currentDropProposal;
      self->_currentDropProposal = v30;
    }
  }
  else
  {
    char v19 = [v7 suggestedProposal];
    id v20 = self->_currentDropProposal;
    self->_currentDropProposal = v19;
  }

  if ([(UITextDropProposal *)self->_currentDropProposal dropAction] == UITextDropActionReplaceSelection)
  {
    preDropSelectionRange = self->_preDropSelectionRange;
    if (preDropSelectionRange)
    {
      if (![(UITextRange *)preDropSelectionRange isEmpty])
      {
        int v35 = self->_preDropSelectionRange;
        goto LABEL_27;
      }
    }
  }
  if ([(UITextDropProposal *)self->_currentDropProposal dropAction] == UITextDropActionReplaceAll)
  {
    uint64_t v34 = (UITextRange *)objc_loadWeakRetained((id *)&self->_view);
    int v35 = [(UITextRange *)v34 _fullRange];

    long long v11 = v34;
LABEL_27:

    long long v11 = v35;
  }
  objc_storeStrong((id *)p_currentDropRange, v11);
  BOOL v36 = 1;
LABEL_29:

  return v36;
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  id v5 = a4;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  currentDropSession = self->_currentDropSession;
  if (has_internal_diagnostics)
  {
    if (!currentDropSession)
    {
      id v12 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "sessionDidExit without current drop session", buf, 2u);
      }
    }
  }
  else if (!currentDropSession)
  {
    id v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &dropInteraction_sessionDidExit____s_category) + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "sessionDidExit without current drop session", v14, 2u);
    }
  }
  [(UITextDragAssistant *)self _cleanupDrop];
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  double v10 = [WeakRetained textDropDelegate];

  if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v11 = objc_loadWeakRetained((id *)p_view);
    [v10 textDroppableView:v11 dropSessionDidExit:v5];
  }
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v5 = a4;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  currentDropSession = self->_currentDropSession;
  if (has_internal_diagnostics)
  {
    if (!currentDropSession)
    {
      char v29 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v29, OS_LOG_TYPE_FAULT, "performDrop without current drop session", buf, 2u);
      }
    }
  }
  else if (!currentDropSession)
  {
    id v30 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_1260) + 8);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v30, OS_LOG_TYPE_ERROR, "performDrop without current drop session", buf, 2u);
    }
  }
  double v8 = (void *)[(NSArray *)self->_draggedTextRanges copy];
  [(UITextDragAssistant *)self _updateDropCaretToRange:0 session:v5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  char v10 = [WeakRetained isEditable];

  if ((v10 & 1) == 0)
  {
    if (*((unsigned char *)&self->_flags + 1))
    {
      id v11 = objc_loadWeakRetained((id *)&self->_view);
      [v11 setEditable:1];
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__UITextDragAssistant_dropInteraction_performDrop___block_invoke;
      block[3] = &unk_1E52D9F70;
      block[4] = self;
      if (qword_1EB2646C8 != -1) {
        dispatch_once(&qword_1EB2646C8, block);
      }
    }
  }
  *(_DWORD *)&self->_flags |= 0x20000u;
  +[_UIKitDragAndDropStatistics incrementUIKitScalarValueBy:1 forKey:@"dropOnTextContent"];
  id v12 = objc_loadWeakRetained((id *)&self->_view);
  id v13 = [v12 textDropDelegate];

  if (v13) {
    char v14 = objc_opt_respondsToSelector();
  }
  else {
    char v14 = 0;
  }
  if ((v14 & 1 & ([(UITextDropProposal *)self->_currentDropProposal dropPerformer] != UITextDropPerformerView)) != 0) {
    int v15 = 0;
  }
  else {
    int v15 = 0x40000;
  }
  self->_$D3CAFCF02A3AF4FB83658BC181FD711E flags = ($D3CAFCF02A3AF4FB83658BC181FD711E)(v15 | *(_DWORD *)&self->_flags & 0xFFFBFFFF);
  if ((v14 & 1) == 0
    || (-[UITextDragAssistant _dropRequestWithRange:suggestedProposal:inSession:](self, "_dropRequestWithRange:suggestedProposal:inSession:", self->_currentDropRange, self->_currentDropProposal, v5), id v16 = objc_claimAutoreleasedReturnValue(), v17 = objc_loadWeakRetained((id *)&self->_view), [v13 textDroppableView:v17 willPerformDrop:v16], v17, v16, (*((unsigned char *)&self->_flags + 2) & 4) != 0))
  {
    sameViewDropOperation = self->_sameViewDropOperation;
    self->_sameViewDropOperation = 0;

    topmostDropItem = self->_topmostDropItem;
    self->_topmostDropItem = 0;

    topmostDropPreview = self->_topmostDropPreview;
    self->_topmostDropPreview = 0;

    id delayedPreviewProvider = self->_delayedPreviewProvider;
    self->_id delayedPreviewProvider = 0;

    if ([(UITextDropProposal *)self->_currentDropProposal useFastSameViewOperations]
      && (*(unsigned char *)&self->_flags & 2) != 0)
    {
      id v22 = self->_currentDragSession;
      id v23 = v5;
      uint64_t v24 = [v23 localDragSession];
      if (v24)
      {
        int v25 = (void *)v24;
        id v26 = [v23 localDragSession];

        if (v26 == v22)
        {
          UIDropOperation v27 = [(UIDropProposal *)self->_currentDropProposal operation];
          long long v28 = [v23 items];
          [(UITextDragAssistant *)self _prepareSameViewOperation:v27 forItems:v28 fromRanges:v8 toRange:self->_currentDropRange];

          goto LABEL_25;
        }
      }
      else
      {
      }
    }
    if ([(UITextDropProposal *)self->_currentDropProposal dropProgressMode]) {
      [v5 setProgressIndicatorStyle:0];
    }
    [(UITextDragAssistant *)self _performDropToRange:self->_currentDropRange inSession:v5];
  }
LABEL_25:
}

void __51__UITextDragAssistant_dropInteraction_performDrop___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_12)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    BOOL v3 = (id *)(*(void *)(a1 + 32) + 200);
    id v4 = v2;
    id WeakRetained = objc_loadWeakRetained(v3);
    int v6 = 138412290;
    id v7 = WeakRetained;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "wanting to performDrop on %@, but view is not editable", (uint8_t *)&v6, 0xCu);
  }
}

- (void)dropInteraction:(id)a3 concludeDrop:(id)a4
{
  topmostDropItem = self->_topmostDropItem;
  self->_topmostDropItem = 0;

  topmostDropPreview = self->_topmostDropPreview;
  self->_topmostDropPreview = 0;

  sameViewDropOperation = self->_sameViewDropOperation;
  self->_sameViewDropOperation = 0;

  id delayedPreviewProvider = self->_delayedPreviewProvider;
  self->_id delayedPreviewProvider = 0;

  *(_DWORD *)&self->_flags &= ~0x80000u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dropPasteSession);
  [WeakRetained animationCompleted];

  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_view);
    [v10 setEditable:0];

    if ((*(unsigned char *)&self->_flags & 0x40) != 0)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_view);
      [v11 setSelectable:(*(_DWORD *)&self->_flags >> 7) & 1];
    }
  }
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  id v10 = a4;
  [(UITextDragAssistant *)self _cleanupDrop];
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  [WeakRetained resignDropResponderWithDropPerformed:(*(_DWORD *)&self->_flags >> 17) & 1];

  id v7 = objc_loadWeakRetained((id *)&self->_view);
  uint64_t v8 = [v7 textDropDelegate];

  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v9 = objc_loadWeakRetained((id *)p_view);
    [v8 textDroppableView:v9 dropSessionDidEnd:v10];
  }
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_topmostDropPreview)
  {
    id v11 = -[UITextDragAssistant _previewForIrrelevantItemFromPreview:](self, "_previewForIrrelevantItemFromPreview:");
    goto LABEL_17;
  }
  if ((*((unsigned char *)&self->_flags + 2) & 4) != 0)
  {
    if (self->_sameViewDropOperation)
    {
      -[UITextDragAssistant _performSameViewOperation:](self, "_performSameViewOperation:");
      sameViewDropOperation = self->_sameViewDropOperation;
      self->_sameViewDropOperation = 0;

      sameViewDropOperationResult = self->_sameViewDropOperationResult;
      if (sameViewDropOperationResult)
      {
        char v14 = [(UITextDraggableGeometrySameViewDropOperationResult *)sameViewDropOperationResult targetedPreviewProvider];
        int v15 = [(UITextDragAssistant *)self _containerViewForDropPreviews];
        id v11 = ((void (**)(void, void *, void))v14)[2](v14, v15, 0);

        if (v11) {
          goto LABEL_11;
        }
      }
    }
    else
    {
      id v11 = [(UITextDragAssistant *)self _previewForTopmostItem:v9];
      if (v11) {
        goto LABEL_11;
      }
    }
    id v16 = [(UITextRange *)self->_currentDropRange start];
    id v11 = [(UITextDragAssistant *)self _shrinkingPreview:v10 toPosition:v16];

    goto LABEL_11;
  }
  id v11 = 0;
LABEL_11:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  char v18 = [WeakRetained textDropDelegate];

  if (objc_opt_respondsToSelector())
  {
    id v19 = objc_loadWeakRetained((id *)&self->_view);
    uint64_t v20 = [v18 textDroppableView:v19 previewForDroppingAllItemsWithDefault:v11];
    id v21 = (void *)v20;
    if (v20) {
      id v22 = (void *)v20;
    }
    else {
      id v22 = v11;
    }
    id v26 = v9;
    id v23 = v8;
    id v24 = v22;

    id v11 = v24;
    id v8 = v23;
    id v9 = v26;
  }
  objc_storeStrong((id *)&self->_topmostDropPreview, v11);
  objc_storeStrong((id *)&self->_topmostDropItem, a4);

LABEL_17:
  return v11;
}

- (void)_dropInteraction:(id)a3 delayedPreviewProviderForDroppingItem:(id)a4 previewProvider:(id)a5
{
  if (self->_topmostDropItem == a4)
  {
    int v6 = _Block_copy(a5);
    id delayedPreviewProvider = self->_delayedPreviewProvider;
    self->_id delayedPreviewProvider = v6;
  }
}

- (void)dropInteraction:(id)a3 item:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  id v8 = a3;
  id v9 = (UIDragItem *)a4;
  id v10 = a5;
  topmostDropItem = self->_topmostDropItem;
  if (topmostDropItem) {
    BOOL v12 = topmostDropItem == v9;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if ((*(_DWORD *)&self->_flags & 0xC0000) == 0x40000 && self->_sameViewDropOperation)
    {
      -[UITextDragAssistant _performSameViewOperation:](self, "_performSameViewOperation:");
      sameViewDropOperation = self->_sameViewDropOperation;
      self->_sameViewDropOperation = 0;
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __72__UITextDragAssistant_dropInteraction_item_willAnimateDropWithAnimator___block_invoke;
    v14[3] = &unk_1E52DC698;
    v14[4] = self;
    [v10 addCompletion:v14];
  }
}

void __72__UITextDragAssistant_dropInteraction_item_willAnimateDropWithAnimator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 184));
  [WeakRetained animationCompleted];

  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 168);
  if (v3)
  {
    id v4 = [v3 resultRange];
    id v8 = [v4 end];

    if (v8)
    {
      id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 200));
      int v6 = [v5 textRangeFromPosition:v8 toPosition:v8];
      id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 200));
      [v7 setSelectedTextRange:v6];
    }
  }
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  id v5 = a4;
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  id v8 = [WeakRetained textDropDelegate];

  if (v8)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      int64_t v11 = 0;
      goto LABEL_8;
    }
    id v9 = [(UITextDragAssistant *)self _dropRequestWithRange:0 inSession:v5];
    id v10 = objc_loadWeakRetained((id *)&self->_view);
    int64_t v11 = [v8 _textDroppableView:v10 dataOwnerForDrop:v9];

    goto LABEL_6;
  }
  id v12 = objc_loadWeakRetained((id *)&self->_view);
  int64_t v11 = [v12 _dropDataOwner];

  if (!v11)
  {
    id v9 = objc_loadWeakRetained((id *)p_view);
    int64_t v11 = [v9 _dataOwnerForPaste];
LABEL_6:
  }
LABEL_8:

  return v11;
}

- (id)_dropRequestWithRange:(id)a3 inSession:(id)a4
{
  return [(UITextDragAssistant *)self _dropRequestWithRange:a3 suggestedProposal:0 inSession:a4];
}

- (id)_dropRequestWithRange:(id)a3 suggestedProposal:(id)a4 inSession:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t v11 = [(UITextDragAssistant *)self _positionInSession:v10];
  if (!v8)
  {
    id v8 = [(UITextDragAssistant *)self _rangeInSession:v10];
  }
  id v12 = [[UITextDropRequest alloc] initWithPosition:v11 range:v8 inSession:v10];
  id v13 = self->_currentDragSession;
  id v14 = v10;
  int v15 = [v14 localDragSession];
  if (v15)
  {
    id v16 = [v14 localDragSession];
    BOOL v17 = v16 == v13;
  }
  else
  {
    BOOL v17 = 0;
  }

  [(UITextDropRequest *)v12 setSameView:v17];
  if (v9)
  {
    [(UITextDropRequest *)v12 setSuggestedProposal:v9];
  }
  else
  {
    char v18 = [(UITextDragAssistant *)self _suggestedProposalForRequest:v12];
    [(UITextDropRequest *)v12 setSuggestedProposal:v18];
  }
  return v12;
}

- (void)invalidateDropCaret
{
  if (self->_currentDropSession) {
    -[UITextDragAssistant _updateDropCaretToRange:session:](self, "_updateDropCaretToRange:session:", self->_currentDropRange);
  }
}

- (void)_updateDropCaretToRange:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  id v9 = [WeakRetained interactionAssistant];
  [v9 setSelectionDisplayVisible:0];

  id v10 = objc_loadWeakRetained((id *)&self->_view);
  int64_t v11 = [v10 interactionAssistant];
  [v11 deactivateSelection];

  $D3CAFCF02A3AF4FB83658BC181FD711E flags = self->_flags;
  if ((*(_WORD *)&flags & 0x2000) != 0)
  {
    id v18 = objc_loadWeakRetained((id *)&self->_view);
    id v19 = [v18 textDropDelegate];

    id v20 = objc_loadWeakRetained((id *)&self->_view);
    uint64_t v13 = [v19 textDroppableView:v20 dropSession:v7 willMoveCaretToRange:v6];

    if ((*(_DWORD *)&self->_flags & 0x4000) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v13 = 1;
    if ((*(_WORD *)&flags & 0x4000) != 0)
    {
LABEL_3:
      id v14 = objc_loadWeakRetained((id *)&self->_view);
      int v15 = [v14 textDropDelegate];

      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __55__UITextDragAssistant__updateDropCaretToRange_session___block_invoke;
      v27[3] = &unk_1E52DD450;
      id v28 = v15;
      char v29 = self;
      id v30 = v7;
      id v31 = v6;
      id v16 = v15;
      BOOL v17 = _Block_copy(v27);

      goto LABEL_6;
    }
  }
  BOOL v17 = 0;
LABEL_6:
  dropCaret = self->_dropCaret;
  if (v6)
  {
    if (dropCaret)
    {
      [(_UITextDragCaretView *)dropCaret updateToRange:v6 animations:0 completion:v17 animated:v13];
    }
    else
    {
      id v23 = [_UITextDragCaretView alloc];
      id v24 = objc_loadWeakRetained((id *)&self->_view);
      int v25 = [(_UITextDragCaretView *)v23 initWithTextInputView:v24];
      id v26 = self->_dropCaret;
      self->_dropCaret = v25;

      [(_UITextDragCaretView *)self->_dropCaret setRangesExcludeSelection:0];
      [(_UITextDragCaretView *)self->_dropCaret insertAtRange:v6 animations:0 completion:v17 animated:v13];
    }
  }
  else
  {
    [(_UITextDragCaretView *)dropCaret removeWithAnimations:0 completion:v17 animated:v13];
    id v22 = self->_dropCaret;
    self->_dropCaret = 0;
  }
}

void __55__UITextDragAssistant__updateDropCaretToRange_session___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 200));
  [v2 textDroppableView:WeakRetained dropSession:a1[6] didMoveCaretToRange:a1[7]];
}

- (id)_suggestedProposalForRequest:(id)a3
{
  id v4 = a3;
  $D3CAFCF02A3AF4FB83658BC181FD711E flags = self->_flags;
  currentDropRange = self->_currentDropRange;
  currentDragSession = self->_currentDragSession;
  id v8 = [v4 dropSession];
  id v9 = currentDragSession;
  uint64_t v10 = [v8 localDragSession];
  if (v10)
  {
    int64_t v11 = (void *)v10;
    id v12 = [v8 localDragSession];

    uint64_t v13 = 2;
    if (v12 == v9 && (*(_DWORD *)&flags & 0x10000) == 0)
    {
      if (currentDropRange)
      {
        uint64_t v24 = 0;
        int v25 = &v24;
        uint64_t v26 = 0x2020000000;
        char v27 = 0;
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __52__UITextDragAssistant__suggestedProposalForRequest___block_invoke;
        v21[3] = &unk_1E5309F40;
        id v23 = &v24;
        v21[4] = self;
        id v22 = v4;
        [(UITextDragAssistant *)self _forDraggedTextRangesDo:v21];
        if (*((unsigned char *)v25 + 24)) {
          uint64_t v13 = 0;
        }
        else {
          uint64_t v13 = 3;
        }

        _Block_object_dispose(&v24, 8);
      }
      else
      {
        uint64_t v13 = 3;
      }
    }
  }
  else
  {

    uint64_t v13 = 2;
  }
  id v14 = [[UITextDropProposal alloc] initWithDropOperation:v13];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  id v16 = [WeakRetained _fontForCaretSelection];
  [v16 lineHeight];
  CGFloat v18 = v17 + v17;
  id v19 = objc_loadWeakRetained((id *)&self->_view);
  [v19 bounds];
  [(UIDropProposal *)v14 setPrecise:v18 < CGRectGetHeight(v29)];

  [(UITextDropProposal *)v14 setUseFastSameViewOperations:((*(_DWORD *)&flags & 0x10000) == 0) & (*(_DWORD *)&self->_flags >> 1)];
  return v14;
}

void __52__UITextDragAssistant__suggestedProposalForRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    *(unsigned char *)(v2 + 24) = 1;
  }
  else
  {
    id v4 = (id *)(*(void *)(a1 + 32) + 200);
    id v5 = a2;
    id WeakRetained = objc_loadWeakRetained(v4);
    id v6 = [*(id *)(a1 + 40) dropRange];
    char v7 = [WeakRetained _range:v5 intersectsRange:v6];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7;
  }
}

- (void)_cleanupDrop
{
  [(UITextDragAssistant *)self _updateDropCaretToRange:0 session:self->_currentDropSession];
  if ((*((unsigned char *)&self->_flags + 2) & 2) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    uint64_t v4 = [WeakRetained selectedTextRange];
    if (v4)
    {
      id v5 = (void *)v4;
      id v6 = objc_loadWeakRetained((id *)&self->_view);
      char v7 = [v6 selectedTextRange];
      char v8 = [v7 isEqual:self->_preDropSelectionRange];

      if (v8) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    preDropSelectionRange = self->_preDropSelectionRange;
    id v10 = objc_loadWeakRetained((id *)&self->_view);
    [v10 setSelectedTextRange:preDropSelectionRange];
  }
LABEL_7:
  int64_t v11 = self->_preDropSelectionRange;
  self->_preDropSelectionRange = 0;

  currentDropProposal = self->_currentDropProposal;
  self->_currentDropProposal = 0;

  currentDropSession = self->_currentDropSession;
  self->_currentDropSession = 0;

  currentDropRange = self->_currentDropRange;
  self->_currentDropRange = 0;
}

- (void)_prepareSameViewOperation:(unint64_t)a3 forItems:(id)a4 fromRanges:(id)a5 toRange:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    id v12 = self->_geometry;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __77__UITextDragAssistant__prepareSameViewOperation_forItems_fromRanges_toRange___block_invoke;
    v23[3] = &unk_1E5309DD8;
    v23[4] = self;
    int64_t v11 = [v9 sortedArrayUsingComparator:v23];

    uint64_t v13 = [(UITextDraggableGeometry *)v12 attributedStringsForTextRanges:v11];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    int v15 = [WeakRetained pasteDelegate];

    if (v15 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v16 = objc_loadWeakRetained((id *)&self->_view);
      uint64_t v17 = [v15 textPasteConfigurationSupporting:v16 combineItemAttributedStrings:v13 forRange:v10];
    }
    else
    {
      id v16 = objc_loadWeakRetained((id *)&self->_view);
      uint64_t v17 = +[UITextPasteController combineAttributedStrings:addingSeparation:](UITextPasteController, "combineAttributedStrings:addingSeparation:", v13, [v16 smartInsertDeleteType] != 1);
    }
    CGFloat v18 = (void *)v17;

    if (v18)
    {
      id v19 = objc_opt_new();
      [v19 setOperation:a3];
      [v19 setText:v18];
      [v19 setSourceRanges:v11];
      [v19 setTargetRange:v10];
    }
    else
    {
      id v19 = 0;
    }
    sameViewDropOperation = self->_sameViewDropOperation;
    self->_sameViewDropOperation = (UITextDraggableGeometrySameViewDropOperation *)v19;
    id v21 = v19;

    sameViewDropOperationResult = self->_sameViewDropOperationResult;
    self->_sameViewDropOperationResult = 0;
  }
  else
  {
    int64_t v11 = v9;
  }
}

uint64_t __77__UITextDragAssistant__prepareSameViewOperation_forItems_fromRanges_toRange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(*(void *)(a1 + 32) + 200);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  char v8 = [v6 start];

  id v9 = [v5 start];

  uint64_t v10 = [WeakRetained comparePosition:v8 toPosition:v9];
  return v10;
}

- (void)_performSameViewOperation:(id)a3
{
  if (a3 && (*(_DWORD *)&self->_flags & 2) != 0)
  {
    p_view = &self->_view;
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    [WeakRetained droppingStarted];

    uint64_t v7 = [v5 operation];
    if (v7 == 3
      && (id v8 = objc_loadWeakRetained((id *)&self->_view),
          char v9 = objc_opt_respondsToSelector(),
          v8,
          (v9 & 1) != 0))
    {
      id v10 = objc_loadWeakRetained((id *)&self->_view);
      [v10 contentOffsetForSameViewDrops];
      double v12 = v11;
      double v14 = v13;
    }
    else
    {
      double v14 = NAN;
      double v12 = NAN;
    }
    id v21 = self->_geometry;
    int v15 = [(UITextDraggableGeometry *)v21 performSameViewDropOperation:self->_sameViewDropOperation];
    sameViewDropOperationResult = self->_sameViewDropOperationResult;
    self->_sameViewDropOperationResult = v15;

    *(_DWORD *)&self->_flags |= 0x80000u;
    id v17 = objc_loadWeakRetained((id *)&self->_view);
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      id v19 = objc_loadWeakRetained((id *)p_view);
      objc_msgSend(v19, "setContentOffsetForSameViewDrops:", v12, v14);
    }
    id v20 = objc_loadWeakRetained((id *)p_view);
    [v20 droppingFinished];
  }
}

- (void)_performDropToRange:(id)a3 inSession:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  dropPasteController = self->_dropPasteController;
  if (!dropPasteController)
  {
    id v8 = [UITextPasteController alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    id v10 = [(UITextPasteController *)v8 initWithSupportingView:WeakRetained];
    double v11 = self->_dropPasteController;
    self->_dropPasteController = v10;

    dropPasteController = self->_dropPasteController;
  }
  double v12 = [v6 items];
  double v13 = [(UITextPasteController *)dropPasteController beginDroppingItems:v12 toSelectedRange:v14 progressSupport:self animated:1 delegate:self];
  objc_storeWeak((id *)&self->_dropPasteSession, v13);
}

- (int64_t)_textPasteRangeBehavior
{
  return 2;
}

- (id)_textPasteSelectableRangeForResult:(id)a3 fromRange:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 string];
  uint64_t v8 = [v7 length];
  if (v8 < 1)
  {
    id v22 = 0;
  }
  else
  {
    uint64_t v9 = v8;
    id v10 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    uint64_t v11 = 0;
    while (objc_msgSend(v10, "characterIsMember:", objc_msgSend(v7, "characterAtIndex:", v11)))
    {
      if (v9 == ++v11)
      {
        uint64_t v11 = v9;
        goto LABEL_6;
      }
    }
    do
    {
LABEL_6:
      uint64_t v12 = v9;
      BOOL v13 = v9-- < 1;
    }
    while (!v13 && (objc_msgSend(v10, "characterIsMember:", objc_msgSend(v7, "characterAtIndex:", v9)) & 1) != 0);
    p_view = &self->_view;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    id v16 = [v6 start];
    id v17 = [WeakRetained positionFromPosition:v16 offset:v11];

    id v18 = objc_loadWeakRetained((id *)p_view);
    id v19 = [v6 start];
    id v20 = [v18 positionFromPosition:v19 offset:v12];

    id v21 = objc_loadWeakRetained((id *)p_view);
    id v22 = [v21 textRangeFromPosition:v17 toPosition:v20];
  }
  if (v22) {
    id v23 = v22;
  }
  else {
    id v23 = v6;
  }
  id v24 = v23;

  return v24;
}

- (void)textPasteSessionWillHidePasteResult:(id)a3
{
  id delayedPreviewProvider = self->_delayedPreviewProvider;
  if (delayedPreviewProvider && self->_topmostDropItem)
  {
    id v5 = (void (**)(void *, void *))_Block_copy(delayedPreviewProvider);
    id v6 = [(UITextDragAssistant *)self _previewForTopmostItem:self->_topmostDropItem];
    v5[2](v5, v6);

    id delayedPreviewProvider = self->_delayedPreviewProvider;
  }
  self->_id delayedPreviewProvider = 0;
}

- (void)textPasteSessionDidRevealPasteResult:(id)a3
{
  id delayedPreviewProvider = self->_delayedPreviewProvider;
  self->_id delayedPreviewProvider = 0;
}

- (void)textPasteSessionWillBeginPasting:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  [WeakRetained droppingStarted];
}

- (void)textPasteSessionDidEndPasting:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  [WeakRetained droppingFinished];
}

- (id)_closestPositionToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  p_view = &self->_view;
  id v6 = objc_loadWeakRetained((id *)&self->_view);
  id WeakRetained = objc_loadWeakRetained((id *)p_view);
  uint64_t v8 = [WeakRetained textInputView];
  objc_msgSend(v6, "convertPoint:toView:", v8, x, y);
  uint64_t v9 = objc_msgSend(v6, "closestPositionToPoint:");

  return v9;
}

- (UITextDraggableGeometry)geometry
{
  [(UITextDragAssistant *)self _applyOptionsToGeometry];
  geometrdouble y = self->_geometry;
  return geometry;
}

- (id)_previewForIrrelevantItemFromPreview:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 target];
  id v5 = [UISnapshotView alloc];
  id v6 = [v3 view];
  [v6 frame];
  uint64_t v7 = -[UISnapshotView initWithFrame:](v5, "initWithFrame:");

  uint64_t v8 = [v3 view];
  [(UISnapshotView *)v7 captureSnapshotOfView:v8 withSnapshotType:1];

  uint64_t v9 = objc_opt_new();
  id v10 = [v3 parameters];
  uint64_t v11 = [v10 backgroundColor];
  [v9 setBackgroundColor:v11];

  uint64_t v12 = [v3 parameters];

  BOOL v13 = [v12 visiblePath];
  [v9 setVisiblePath:v13];

  id v14 = [[UITargetedDragPreview alloc] initWithView:v7 parameters:v9 target:v4];
  return v14;
}

- (id)_previewForTopmostItem:(id)a3
{
  p_dropPasteSession = &self->_dropPasteSession;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dropPasteSession);
  id v6 = [WeakRetained pasteResult];

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_dropPasteSession);
    uint64_t v8 = [v7 positionedPasteResult];

    uint64_t v9 = [v8 position];
    id v10 = objc_loadWeakRetained((id *)&self->_view);
    uint64_t v11 = [v10 endOfDocument];
    uint64_t v12 = [v10 comparePosition:v9 toPosition:v11];

    if (v12 == 1)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_view);
      uint64_t v14 = [v13 endOfDocument];

      uint64_t v9 = (void *)v14;
    }
    if (v9)
    {
      id v15 = objc_loadWeakRetained((id *)&self->_view);
      id v16 = [v15 beginningOfDocument];
      uint64_t v17 = [v15 offsetFromPosition:v16 toPosition:v9];
    }
    else
    {
      uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    }
    id v19 = [v8 string];
    id v20 = v19;
    if (v17 == 0x7FFFFFFFFFFFFFFFLL || ![v19 length])
    {
      id v18 = 0;
    }
    else
    {
      id v21 = objc_loadWeakRetained((id *)&self->_view);
      char v22 = objc_opt_respondsToSelector();

      if (v22)
      {
        uint64_t v23 = [v20 mutableCopy];
        id v24 = objc_loadWeakRetained((id *)&self->_view);
        [v24 sanitizeAttributedText:v23];

        id v20 = (void *)v23;
      }
      id v25 = objc_loadWeakRetained((id *)&self->_view);
      char v26 = objc_opt_respondsToSelector();

      if (v26)
      {
        id v27 = objc_loadWeakRetained((id *)&self->_view);
        id v28 = [v27 selectedTextRange];

        id v29 = objc_loadWeakRetained((id *)&self->_view);
        id v30 = [v29 textRangeFromPosition:v9 toPosition:v9];
        id v31 = objc_loadWeakRetained((id *)&self->_view);
        [v31 setSelectedTextRange:v30];

        id v32 = objc_loadWeakRetained((id *)&self->_view);
        uint64_t v33 = [v32 _attributedStringForInsertionOfAttributedString:v20];

        id v34 = objc_loadWeakRetained((id *)&self->_view);
        [v34 setSelectedTextRange:v28];

        id v20 = (void *)v33;
      }
      uint64_t v35 = [v20 length];
      id v36 = objc_loadWeakRetained((id *)&self->_view);
      unsigned __int8 v37 = objc_msgSend(v36, "_textRangeFromNSRange:", v17, v35);

      uint64_t v38 = [(UITextDragAssistant *)self geometry];
      id v39 = [(UITextDragAssistant *)self _containerViewForDropPreviews];
      id v18 = [v38 previewForDroppingTextInRange:v37 toPosition:v9 inContainerView:v39];
    }
  }
  else
  {
    id v18 = 0;
  }
  return v18;
}

- (id)_shrinkingPreview:(id)a3 toPosition:(id)a4
{
  id v6 = a3;
  p_view = &self->_view;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  [WeakRetained caretRectForPosition:v8];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  v38.origin.double x = v11;
  v38.origin.double y = v13;
  v38.size.CGFloat width = v15;
  v38.size.CGFloat height = v17;
  if (CGRectIsNull(v38)) {
    goto LABEL_7;
  }
  id v18 = [(UITextDragAssistant *)self _containerViewForDropPreviews];
  id v19 = objc_loadWeakRetained((id *)p_view);
  objc_msgSend(v19, "convertRect:toView:", v18, v11, v13, v15, v17);
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  [v6 size];
  long long v30 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v36.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v36.c = v30;
  *(_OWORD *)&v36.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  if (v28 > 0.0 && v29 > 0.0) {
    CGAffineTransformMakeScale(&v36, v25 / v28, v27 / v29);
  }
  id v31 = [UIDragPreviewTarget alloc];
  CGAffineTransform v35 = v36;
  id v32 = -[UIPreviewTarget initWithContainer:center:transform:](v31, "initWithContainer:center:transform:", v18, &v35, v21 + v25 * 0.5, v23 + v27 * 0.5);

  if (!v32)
  {
LABEL_7:
    id v33 = v6;
  }
  else
  {
    id v33 = [v6 retargetedPreviewWithTarget:v32];
  }
  return v33;
}

- (UITextDragSupporting)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UITextDragSupporting *)WeakRetained;
}

- (UIDragInteraction)dragInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragInteraction);
  return (UIDragInteraction *)WeakRetained;
}

- (UIDropInteraction)dropInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dropInteraction);
  return (UIDropInteraction *)WeakRetained;
}

@end