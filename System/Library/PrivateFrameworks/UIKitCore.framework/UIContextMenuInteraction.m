@interface UIContextMenuInteraction
+ (NSCopying)visualStyleRegistryIdentity;
+ (void)_setDefaultDriverClasses:(id)a3 forIdiom:(int64_t)a4;
- ($9BEB610D0CE1B1EDC3D89DA2464F985F)_testing_metdataForMenuElements:(id)a3;
- (BOOL)_clickPresentationInteraction:(id)a3 shouldBeDelayedByGestureRecognizer:(id)a4;
- (BOOL)_clickPresentationInteraction:(id)a3 shouldMaintainKeyboardAssertionForFirstResponder:(id)a4 presentation:(id)a5;
- (BOOL)_clickPresentationInteractionShouldAllowDragAfterDismiss:(id)a3;
- (BOOL)_clickPresentationInteractionShouldAllowRapidRestart:(id)a3;
- (BOOL)_clickPresentationInteractionShouldAssociateWithDrag:(id)a3;
- (BOOL)_hasVisibleMenu;
- (BOOL)_reachedForceThreshold;
- (BOOL)_requiresTouchAuthentication;
- (BOOL)_shouldKeepInputViewVisibleForStyle:(id)a3;
- (BOOL)_useSenderAsResponderSender;
- (BOOL)allowSimultaneousRecognition;
- (BOOL)contextMenuPresentationShouldAllowSwipeToDismissForBeginningPanInteraction:(id)a3;
- (CGPoint)locationInView:(UIView *)view;
- (NSMutableDictionary)configurationsByIdentifier;
- (NSMutableDictionary)presentationsByIdentifier;
- (NSSet)_internalIdentifiersForDismissingMenu;
- (UIContextMenuConfiguration)pendingConfiguration;
- (UIContextMenuInteraction)initWithDelegate:(id)delegate;
- (UIContextMenuInteractionAppearance)menuAppearance;
- (UIGestureRecognizer)_gestureRecognizerForBeginningDragRelationships;
- (UIGestureRecognizer)gestureRecognizerForFailureRelationships;
- (UIMenuLeaf)_selectedMenuLeaf;
- (UIView)view;
- (_UIClickPresentationInteraction)presentationInteraction;
- (_UIContextMenuAnimator)pendingCommitAnimator;
- (_UIContextMenuPresentation)outgoingPresentation;
- (id)_clickPresentationInteraction:(id)a3 interactionEffectForTargetedPreview:(id)a4;
- (id)_clickPresentationInteraction:(id)a3 liveDragPreviewForPresentation:(id)a4 dragItem:(id)a5;
- (id)_clickPresentationInteraction:(id)a3 previewForCancellingDragItem:(id)a4;
- (id)_defaultPreparationContextWithFirstResponderTarget:(id)a3;
- (id)_delegate_configurationForMenuAtLocation:(CGPoint)a3;
- (id)_delegate_contextMenuInteractionWillDisplayForConfiguration:(id)a3;
- (id)_delegate_contextMenuInteractionWillEndForConfiguration:(id)a3 presentation:(id)a4;
- (id)_delegate_getAccessoryViewsForConfiguration:(id)a3;
- (id)_delegate_previewForDismissingForConfiguration:(id)a3 clientReturnedPreview:(BOOL *)a4;
- (id)_delegate_previewForHighlightingForConfiguration:(id)a3;
- (id)_fulfilledConfigurationForConfiguration:(id)a3 atLocation:(CGPoint)a4;
- (id)_menuPreparedForDisplayWithMenu:(id)a3 firstResponder:(id)a4;
- (id)_proxySender;
- (id)_secondaryPreviewsForClickPresentationInteraction:(id)a3;
- (id)_suggestedMenuForConfiguration:(id)a3 atLocation:(CGPoint)a4 inCoordinateSpace:(id)a5;
- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4;
- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4;
- (id)contextMenuPresentation:(id)a3 dismissalPreviewForItem:(id)a4 clientReturnedPreview:(BOOL *)a5;
- (id)contextMenuPresentation:(id)a3 willDisplayMenu:(id)a4;
- (id)delegate;
- (id)gestureRecognizerForExclusionRelationships;
- (unint64_t)_actualLayoutForPreferredLayout:(unint64_t)a3 withConfiguration:(id)a4;
- (unint64_t)_fallbackDriverStyle;
- (unint64_t)_inputPrecision;
- (unint64_t)activationStyleForClickPresentationInteraction:(id)a3;
- (void)_clickPresentationInteraction:(id)a3 dragSessionDidEndForItems:(id)a4;
- (void)_clickPresentationInteraction:(id)a3 item:(id)a4 willAnimateDragCancelWithAnimator:(id)a5;
- (void)_clickPresentationInteraction:(id)a3 shouldBeginWithTouch:(id)a4 completion:(id)a5;
- (void)_clickPresentationInteraction:(id)a3 shouldPresentWithCompletion:(id)a4;
- (void)_clickPresentationInteractionEnded:(id)a3 forPresentation:(id)a4 reason:(unint64_t)a5;
- (void)_contextMenuPresentationPreviewWasTapped:(id)a3;
- (void)_delegate_performPreviewActionCommitAnimation:(id)a3;
- (void)_delegate_tappedPreviewForConfiguration:(id)a3 withAnimator:(id)a4;
- (void)_interactionShouldBeginAtPoint:(CAPoint3D)a3 completion:(id)a4;
- (void)_performCleanupForConfigurationWithIdentifier:(id)a3;
- (void)_prepareSceneActivationConfiguration:(id)a3;
- (void)_presentMenuAtLocation3D:(CAPoint3D)a3;
- (void)_presentMenuAtLocation:(CGPoint)a3;
- (void)_requestSceneActivationWithConfiguration:(id)a3 animated:(BOOL)a4 sender:(id)a5 errorHandler:(id)a6;
- (void)_retargetDismissingMenuWithInternalIdentifier:(id)a3 toPreview:(id)a4 force:(BOOL)a5;
- (void)_setFallbackDriverStyle:(unint64_t)a3;
- (void)_setProxySender:(id)a3;
- (void)_viewTraitCollectionDidChange:(id)a3;
- (void)contextMenuPresentation:(id)a3 didBeginDragWithTouch:(id)a4;
- (void)contextMenuPresentation:(id)a3 didRequestDismissalWithReason:(unint64_t)a4 alongsideActions:(id)a5 completion:(id)a6;
- (void)contextMenuPresentation:(id)a3 didSelectMenuLeaf:(id)a4;
- (void)contextMenuPresentationDidEndPanInteraction:(id)a3;
- (void)dealloc;
- (void)deferredMenuElementWasFulfilled:(id)a3;
- (void)didMoveToView:(id)a3;
- (void)dismissMenu;
- (void)setAllowSimultaneousRecognition:(BOOL)a3;
- (void)setConfigurationsByIdentifier:(id)a3;
- (void)setDrivers:(id)a3;
- (void)setOutgoingPresentation:(id)a3;
- (void)setPendingCommitAnimator:(id)a3;
- (void)setPendingConfiguration:(id)a3;
- (void)setPresentationsByIdentifier:(id)a3;
- (void)set_requiresTouchAuthentication:(BOOL)a3;
- (void)set_selectedMenuLeaf:(id)a3;
- (void)set_useSenderAsResponderSender:(BOOL)a3;
- (void)updateVisibleMenuWithBlock:(void *)block;
- (void)willMoveToView:(id)a3;
@end

@implementation UIContextMenuInteraction

uint64_t __43__UIContextMenuInteraction_willMoveToView___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) cancelInteraction];
}

uint64_t __35__UIContextMenuInteraction_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) cancelInteraction];
}

- (BOOL)_clickPresentationInteraction:(id)a3 shouldBeDelayedByGestureRecognizer:(id)a4
{
  if (!self->_delegateImplements.shouldByDelayedByGestureRecognizer) {
    return 0;
  }
  v4 = self;
  id v5 = a4;
  v6 = [(UIContextMenuInteraction *)v4 delegate];
  LOBYTE(v4) = [v6 _contextMenuInteraction:v4 shouldBeDelayedByGestureRecognizer:v5];

  return (char)v4;
}

- (BOOL)_hasVisibleMenu
{
  v2 = [(UIContextMenuInteraction *)self presentationsByIdentifier];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)_viewTraitCollectionDidChange:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = [(UIContextMenuInteraction *)self presentationsByIdentifier];
  v4 = [v3 allValues];

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
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) viewTraitCollectionDidChange];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSMutableDictionary)presentationsByIdentifier
{
  return self->_presentationsByIdentifier;
}

- (void)setDrivers:(id)a3
{
  id v4 = a3;
  id v5 = [(UIContextMenuInteraction *)self presentationInteraction];
  [v5 setOverrideDrivers:v4];
}

- (void)didMoveToView:(id)a3
{
  p_view = &self->_view;
  id v5 = objc_storeWeak((id *)&self->_view, a3);
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)p_view);
    uint64_t v7 = [(UIContextMenuInteraction *)self presentationInteraction];
    [WeakRetained addInteraction:v7];
  }
}

- (_UIClickPresentationInteraction)presentationInteraction
{
  presentationInteraction = self->_presentationInteraction;
  if (!presentationInteraction)
  {
    id v4 = [[_UIClickPresentationInteraction alloc] initWithDelegate:self];
    id v5 = self->_presentationInteraction;
    self->_presentationInteraction = v4;

    [(_UIClickPresentationInteraction *)self->_presentationInteraction setDebugIdentifier:@"com.apple.UIKit.ContextMenuPresentation"];
    [(_UIClickPresentationInteraction *)self->_presentationInteraction setPresentationTypeDebugString:@"UIContextMenuInteraction"];
    presentationInteraction = self->_presentationInteraction;
  }
  return presentationInteraction;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)willMoveToView:(id)a3
{
  if (self->_presentationInteraction)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __43__UIContextMenuInteraction_willMoveToView___block_invoke;
    v5[3] = &unk_1E52D9F70;
    v5[4] = self;
    +[UIView performWithoutAnimation:v5];
    id v4 = [(_UIClickPresentationInteraction *)self->_presentationInteraction view];
    [v4 removeInteraction:self->_presentationInteraction];
  }
  objc_storeWeak((id *)&self->_view, 0);
}

- (void)_setProxySender:(id)a3
{
}

- (UIContextMenuInteraction)initWithDelegate:(id)delegate
{
  id v4 = delegate;
  v30.receiver = self;
  v30.super_class = (Class)UIContextMenuInteraction;
  id v5 = [(UIContextMenuInteraction *)&v30 init];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_delegateImplements.highlightPreviewForItemWithIdentifier = objc_opt_respondsToSelector() & 1;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.dismissalPreviewForItemWithIdentifier = objc_opt_respondsToSelector() & 1;

    id v9 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.willPerformPreviewAction = objc_opt_respondsToSelector() & 1;

    id v10 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.willDisplay = objc_opt_respondsToSelector() & 1;

    id v11 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.willEndForConfiguration = objc_opt_respondsToSelector() & 1;

    id v12 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.styleForMenu = objc_opt_respondsToSelector() & 1;

    id v13 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.accessoriesForMenu = objc_opt_respondsToSelector() & 1;

    id v14 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.shouldByDelayedByGestureRecognizer = objc_opt_respondsToSelector() & 1;

    id v15 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.asyncConfigurationForMenuAtLocation = objc_opt_respondsToSelector() & 1;

    id v16 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.overrideSuggestedActions = objc_opt_respondsToSelector() & 1;

    id v17 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.shouldPresent = objc_opt_respondsToSelector() & 1;

    id v18 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.shouldAllowDragAfterDismiss = objc_opt_respondsToSelector() & 1;

    id v19 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.shouldAllowSwipeToDismiss = objc_opt_respondsToSelector() & 1;

    id v20 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.shouldDeferCommitAnimation = objc_opt_respondsToSelector() & 1;

    id v21 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.interactionEffectForTargetedPreview = objc_opt_respondsToSelector() & 1;

    id v22 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.shouldAttemptToPresentConfiguration = objc_opt_respondsToSelector() & 1;

    id v23 = objc_loadWeakRetained((id *)&v6->_delegate);
    v6->_delegateImplements.didPerformMenuLeaf = objc_opt_respondsToSelector() & 1;

    if (!v6->_delegateImplements.highlightPreviewForItemWithIdentifier)
    {
      id v24 = objc_loadWeakRetained((id *)&v6->_delegate);
      v6->_delegateImplements.previewForHighlighting = objc_opt_respondsToSelector() & 1;

      id v25 = objc_loadWeakRetained((id *)&v6->_delegate);
      v6->_delegateImplements.previewForDismissing = objc_opt_respondsToSelector() & 1;
    }
    if (_UIIsPrivateMainBundle())
    {
      id v26 = objc_loadWeakRetained((id *)&v6->_delegate);
      v6->_delegateImplements.willCommit = objc_opt_respondsToSelector() & 1;
    }
    v27 = [MEMORY[0x1E4F1CA60] dictionary];
    [(UIContextMenuInteraction *)v6 setPresentationsByIdentifier:v27];

    v28 = [MEMORY[0x1E4F1CA60] dictionary];
    [(UIContextMenuInteraction *)v6 setConfigurationsByIdentifier:v28];

    _UIContextMenuRegisterDefaultPlatformMetricsIfNecessary();
  }

  return v6;
}

- (void)setPresentationsByIdentifier:(id)a3
{
}

- (void)setConfigurationsByIdentifier:(id)a3
{
}

- (BOOL)_clickPresentationInteractionShouldAllowRapidRestart:(id)a3
{
  return 1;
}

+ (NSCopying)visualStyleRegistryIdentity
{
  return (NSCopying *)@"UIContextMenuInteraction";
}

- (void)updateVisibleMenuWithBlock:(void *)block
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v4 = block;
  if ([(_UIClickPresentationInteraction *)self->_presentationInteraction _isActive])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__UIContextMenuInteraction_updateVisibleMenuWithBlock___block_invoke;
    aBlock[3] = &unk_1E53112B8;
    id v41 = v4;
    v34 = (void (**)(void *, void))_Block_copy(aBlock);
    id v5 = [(UIContextMenuInteraction *)self presentationsByIdentifier];
    uint64_t v6 = [v5 allValues];
    id v7 = [v6 firstObject];

    if (!v7)
    {
      id v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("UILog", &updateVisibleMenuWithBlock____s_category) + 8);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_ERROR, "Called -[UIContextMenuInteraction updateVisibleMenuWithBlock:] while no context menu is visible. This won't do anything.", buf, 2u);
      }
      goto LABEL_26;
    }
    uint64_t v8 = [v7 visibleMenus];
    if (v8)
    {
      id v9 = (void *)v8;
      if (dyld_program_sdk_at_least())
      {
        if (![v9 count])
        {
          id v10 = +[UIMenu menuWithChildren:MEMORY[0x1E4F1CBF0]];
          v43[0] = v10;
          uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];

          id v9 = (void *)v11;
        }
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v12 = v9;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v42 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          v31 = v4;
          id obj = v12;
          uint64_t v33 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v37 != v33) {
                objc_enumerationMutation(obj);
              }
              uint64_t v16 = *(void *)(*((void *)&v36 + 1) + 8 * i);
              uint64_t v17 = v34[2](v34, v16);
              if (v17)
              {
                id v18 = (void *)v17;
                id v19 = [v7 menuConfiguration];
                [v19 firstResponderTarget];
                v21 = id v20 = v7;
                id v22 = [(UIContextMenuInteraction *)self _menuPreparedForDisplayWithMenu:v18 firstResponder:v21];

                id v7 = v20;
                [v20 displayMenu:v22 inPlaceOfMenu:v16];
              }
            }
            uint64_t v14 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
          }
          while (v14);
          id v4 = v31;
          id v12 = obj;
        }
        id v9 = v12;
        goto LABEL_24;
      }
      objc_super v30 = [v9 lastObject];
      ((void (**)(void *, void *))v34)[2](v34, v30);
      id v12 = (id)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
LABEL_24:

        goto LABEL_25;
      }
    }
    else
    {
      id v24 = [v7 uiController];
      id v25 = [v24 menuConfiguration];
      id v9 = [v25 menu];

      uint64_t v26 = ((void (**)(void *, void *))v34)[2](v34, v9);
      if (!v26)
      {
LABEL_25:

LABEL_26:
        goto LABEL_27;
      }
      v27 = (void *)v26;
      v28 = [v7 menuConfiguration];
      v29 = [v28 firstResponderTarget];
      id v12 = [(UIContextMenuInteraction *)self _menuPreparedForDisplayWithMenu:v27 firstResponder:v29];
    }
    [v7 displayMenu:v12 inPlaceOfMenu:0];
    goto LABEL_24;
  }
LABEL_27:
}

- (void)dismissMenu
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UIContextMenuInteraction *)self presentationInteraction];
  int v4 = [v3 _isActive];

  if (v4)
  {
    id v5 = [(UIContextMenuInteraction *)self presentationsByIdentifier];
    uint64_t v6 = [v5 allKeys];
    id v7 = (void *)[v6 copy];

    if ([v7 count])
    {
      if (!self->_delegateImplements.shouldAllowDragAfterDismiss) {
        goto LABEL_6;
      }
      uint64_t v8 = [(UIContextMenuInteraction *)self delegate];
      int v9 = [v8 _contextMenuInteractionShouldAllowDragAfterDismiss:self];

      if (!v9
        || ([(UIContextMenuInteraction *)self presentationInteraction],
            id v10 = objc_claimAutoreleasedReturnValue(),
            char v11 = [v10 beginDragIfPossibleWithTouch:0],
            v10,
            (v11 & 1) == 0))
      {
LABEL_6:
        id v12 = [(UIContextMenuInteraction *)self presentationInteraction];
        [v12 _cancelWithReason:8 alongsideActions:0 completion:0];

        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v13 = v7;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v19;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v19 != v16) {
                objc_enumerationMutation(v13);
              }
              -[UIContextMenuInteraction _performCleanupForConfigurationWithIdentifier:](self, "_performCleanupForConfigurationWithIdentifier:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
          }
          while (v15);
        }
      }
    }
  }
}

- (void)_retargetDismissingMenuWithInternalIdentifier:(id)a3 toPreview:(id)a4 force:(BOOL)a5
{
  id v14 = a3;
  id v8 = a4;
  int v9 = [(UIContextMenuInteraction *)self outgoingPresentation];
  id v10 = v9;
  if (v9)
  {
    if (a5
      || ([v9 menuConfiguration],
          char v11 = objc_claimAutoreleasedReturnValue(),
          [v11 internalIdentifiers],
          id v12 = objc_claimAutoreleasedReturnValue(),
          int v13 = [v12 containsObject:v14],
          v12,
          v11,
          v13))
    {
      [v10 retargetDismissingMenuToPreview:v8];
      [(UIContextMenuInteraction *)self setOutgoingPresentation:0];
    }
  }
}

- (_UIContextMenuPresentation)outgoingPresentation
{
  return self->_outgoingPresentation;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__selectedMenuLeaf);
  objc_destroyWeak(&self->__proxySender);
  objc_storeStrong((id *)&self->_pendingCommitAnimator, 0);
  objc_storeStrong((id *)&self->_outgoingPresentation, 0);
  objc_storeStrong((id *)&self->_presentationsByIdentifier, 0);
  objc_storeStrong((id *)&self->_configurationsByIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentationInteraction, 0);
  objc_destroyWeak((id *)&self->_view);
}

- (void)dealloc
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__UIContextMenuInteraction_dealloc__block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  +[UIView performWithoutAnimation:v4];
  v3.receiver = self;
  v3.super_class = (Class)UIContextMenuInteraction;
  [(UIContextMenuInteraction *)&v3 dealloc];
}

- (unint64_t)activationStyleForClickPresentationInteraction:(id)a3
{
  int v4 = [(UIContextMenuInteraction *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = [(UIContextMenuInteraction *)self delegate];
  uint64_t v7 = [v6 _activationMethodForContextMenuInteraction:self];

  return v7 == 1;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (UIContextMenuInteractionAppearance)menuAppearance
{
  v2 = [(UIContextMenuInteraction *)self presentationInteraction];
  uint64_t v3 = [v2 activatedDriverStyle];

  if (v3 == 1) {
    return 2;
  }
  else {
    return 1;
  }
}

- (CGPoint)locationInView:(UIView *)view
{
  int v4 = view;
  char v5 = [(UIContextMenuInteraction *)self presentationInteraction];
  [v5 locationInView:v4];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

id __55__UIContextMenuInteraction_updateVisibleMenuWithBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)[a2 _mutableCopy];
  int v4 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  char v5 = v4;
  if (v4 == v3)
  {
    double v6 = 0;
  }
  else
  {
    double v6 = [v4 _immutableCopy];
  }

  return v6;
}

+ (void)_setDefaultDriverClasses:(id)a3 forIdiom:(int64_t)a4
{
}

- (id)_proxySender
{
  id WeakRetained = objc_loadWeakRetained(&self->__proxySender);
  int v4 = WeakRetained;
  if (!WeakRetained) {
    id WeakRetained = self;
  }
  id v5 = WeakRetained;

  return v5;
}

- (unint64_t)_inputPrecision
{
  v2 = [(UIContextMenuInteraction *)self presentationInteraction];
  unint64_t v3 = [v2 inputPrecision];

  return v3;
}

- (NSSet)_internalIdentifiersForDismissingMenu
{
  v2 = [(UIContextMenuInteraction *)self outgoingPresentation];
  unint64_t v3 = [v2 menuConfiguration];
  int v4 = [v3 internalIdentifiers];

  return (NSSet *)v4;
}

- (unint64_t)_fallbackDriverStyle
{
  v2 = [(UIContextMenuInteraction *)self presentationInteraction];
  unint64_t v3 = [v2 fallbackDriverStyle];

  return v3;
}

- (void)_setFallbackDriverStyle:(unint64_t)a3
{
  id v4 = [(UIContextMenuInteraction *)self presentationInteraction];
  [v4 setFallbackDriverStyle:a3];
}

- (void)deferredMenuElementWasFulfilled:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__UIContextMenuInteraction_deferredMenuElementWasFulfilled___block_invoke;
  v6[3] = &unk_1E52DD358;
  id v7 = v4;
  id v5 = v4;
  [(UIContextMenuInteraction *)self updateVisibleMenuWithBlock:v6];
}

id __60__UIContextMenuInteraction_deferredMenuElementWasFulfilled___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (isDeferredElementVisibleInMenu_0(*(void **)(a1 + 32), v3)) {
    id v4 = (id)[v3 copy];
  }
  else {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (void)_presentMenuAtLocation3D:(CAPoint3D)a3
{
  double z = a3.z;
  double y = a3.y;
  double x = a3.x;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v8 = [(UIContextMenuInteraction *)self configurationsByIdentifier];
  if ([v8 count])
  {
  }
  else
  {
    id v7 = [(UIContextMenuInteraction *)self pendingConfiguration];

    if (!v7)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __53__UIContextMenuInteraction__presentMenuAtLocation3D___block_invoke;
      v9[3] = &unk_1E52EBCD8;
      v9[4] = self;
      -[UIContextMenuInteraction _interactionShouldBeginAtPoint:completion:](self, "_interactionShouldBeginAtPoint:completion:", v9, x, y, z);
    }
  }
}

void __53__UIContextMenuInteraction__presentMenuAtLocation3D___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id v3 = [*(id *)(a1 + 32) presentationInteraction];
    [v3 present];
  }
}

- (void)_presentMenuAtLocation:(CGPoint)a3
{
}

- (void)setAllowSimultaneousRecognition:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UIContextMenuInteraction *)self presentationInteraction];
  [v4 setAllowSimultaneousRecognition:v3];
}

- (BOOL)allowSimultaneousRecognition
{
  uint64_t v2 = [(UIContextMenuInteraction *)self presentationInteraction];
  char v3 = [v2 allowSimultaneousRecognition];

  return v3;
}

- (UIGestureRecognizer)gestureRecognizerForFailureRelationships
{
  uint64_t v2 = [(UIContextMenuInteraction *)self presentationInteraction];
  char v3 = [v2 gestureRecognizerForExclusionRelationship];

  return (UIGestureRecognizer *)v3;
}

- (id)gestureRecognizerForExclusionRelationships
{
  uint64_t v2 = [(UIContextMenuInteraction *)self presentationInteraction];
  char v3 = [v2 gestureRecognizerForFailureRelationship];

  return v3;
}

- (UIGestureRecognizer)_gestureRecognizerForBeginningDragRelationships
{
  uint64_t v2 = [(UIContextMenuInteraction *)self presentationInteraction];
  char v3 = [v2 gestureRecognizerForBeginningDragRelationships];

  return (UIGestureRecognizer *)v3;
}

- (BOOL)_reachedForceThreshold
{
  uint64_t v2 = [(UIContextMenuInteraction *)self presentationInteraction];
  char v3 = [v2 _reachedForceThreshold];

  return v3;
}

- (void)_clickPresentationInteraction:(id)a3 shouldBeginWithTouch:(id)a4 completion:(id)a5
{
  id v16 = a4;
  id v7 = (void (**)(id, uint64_t))a5;
  if ([(UIContextMenuInteraction *)self _requiresTouchAuthentication]
    && ([v16 _touchAuthenticationRecord],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8)
    && ([v16 _touchAuthenticationRecord],
        double v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 shouldAllowEvents],
        v9,
        (v10 & 1) == 0))
  {
    v7[2](v7, 2);
  }
  else
  {
    double v11 = [(UIContextMenuInteraction *)self view];
    [(UIContextMenuInteraction *)self locationInView:v11];
    double v13 = v12;
    double v15 = v14;

    -[UIContextMenuInteraction _interactionShouldBeginAtPoint:completion:](self, "_interactionShouldBeginAtPoint:completion:", v7, v13, v15, 0.0);
  }
}

- (BOOL)_clickPresentationInteractionShouldAssociateWithDrag:(id)a3
{
  UIContextMenuInteractionAppearance v4 = [(UIContextMenuInteraction *)self menuAppearance];
  if (v4 != UIContextMenuInteractionAppearanceRich)
  {
    id v5 = [(UIContextMenuInteraction *)self pendingConfiguration];
    char v6 = [v5 _isMultiItemMenu];

    LOBYTE(v4) = v6;
  }
  return v4;
}

- (BOOL)_clickPresentationInteractionShouldAllowDragAfterDismiss:(id)a3
{
  if (!self->_delegateImplements.shouldAllowDragAfterDismiss) {
    return 0;
  }
  char v3 = self;
  UIContextMenuInteractionAppearance v4 = [(UIContextMenuInteraction *)self delegate];
  LOBYTE(v3) = [v4 _contextMenuInteractionShouldAllowDragAfterDismiss:v3];

  return (char)v3;
}

- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4
{
  id v5 = [(UIContextMenuInteraction *)self pendingConfiguration];
  char v6 = [(UIContextMenuInteraction *)self _delegate_previewForHighlightingForConfiguration:v5];
  if (!v6)
  {
    id v7 = [UITargetedPreview alloc];
    id v8 = [(UIContextMenuInteraction *)self view];
    char v6 = [(UITargetedPreview *)v7 initWithView:v8];
  }
  double v9 = [(UIContextMenuInteraction *)self view];
  char v10 = [v9 traitCollection];
  uint64_t v11 = [v10 userInterfaceIdiom];
  double v12 = v6;
  double v13 = _UIContextMenuGetPlatformMetrics(v11);
  double v14 = [v13 shouldApplyShadowHandler];

  if (v14) {
    uint64_t v15 = ((uint64_t (**)(void, UITargetedPreview *))v14)[2](v14, v12);
  }
  else {
    uint64_t v15 = 1;
  }

  id v16 = [(UITargetedPreview *)v12 parameters];
  [v16 setAppliesShadow:v15];

  uint64_t v17 = [v5 identifier];
  [(UITargetedPreview *)v12 set_internalIdentifier:v17];

  objc_msgSend(v5, "set_primarySourcePreview:", v12);
  [(UITargetedPreview *)v12 _frame];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  CGFloat v25 = v24;
  uint64_t v26 = [(UITargetedPreview *)v12 target];
  v27 = [v26 container];
  double v28 = -[UIView _constrainRectWithinSceneBounds:additionalInsets:](v27, v19, v21, v23, v25, 0.0);
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;

  v47.origin.double x = v19;
  v47.origin.double y = v21;
  v47.size.width = v23;
  v47.size.height = v25;
  v48.origin.double x = v28;
  v48.origin.double y = v30;
  v48.size.width = v32;
  v48.size.height = v34;
  if (!CGRectIntersectsRect(v47, v48))
  {
    double v35 = v28 + v32 * 0.5;
    double v36 = v30 + v34 * 0.5;
    long long v37 = [UIPreviewTarget alloc];
    long long v38 = [(UITargetedPreview *)v12 target];
    long long v39 = [v38 container];
    v40 = [(UITargetedPreview *)v12 target];
    id v41 = v40;
    if (v40) {
      [v40 transform];
    }
    else {
      memset(v45, 0, sizeof(v45));
    }
    v42 = -[UIPreviewTarget initWithContainer:center:transform:](v37, "initWithContainer:center:transform:", v39, v45, v35, v36);

    uint64_t v43 = [(UITargetedPreview *)v12 retargetedPreviewWithTarget:v42];

    double v12 = (UITargetedPreview *)v43;
  }

  return v12;
}

- (id)_secondaryPreviewsForClickPresentationInteraction:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  UIContextMenuInteractionAppearance v4 = [(UIContextMenuInteraction *)self pendingConfiguration];
  id v5 = v4;
  if (!v4
    || !self->_delegateImplements.highlightPreviewForItemWithIdentifier
    && !self->_delegateImplements._dci_secondaryHighlightPreview)
  {
    goto LABEL_17;
  }
  char v6 = [v4 _effectiveSecondaryItemIdentifiers];
  if (![v6 count])
  {

LABEL_17:
    id v7 = 0;
    goto LABEL_18;
  }
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        if (self->_delegateImplements.highlightPreviewForItemWithIdentifier)
        {
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          double v14 = [(UIContextMenuInteraction *)self delegate];
          uint64_t v15 = [v14 contextMenuInteraction:self configuration:v5 highlightPreviewForItemWithIdentifier:v13];

          if (v15)
          {
            objc_msgSend(v15, "set_internalIdentifier:", v13);
            [v7 addObject:v15];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

LABEL_18:
  return v7;
}

- (id)_clickPresentationInteraction:(id)a3 interactionEffectForTargetedPreview:(id)a4
{
  if (self->_delegateImplements.interactionEffectForTargetedPreview)
  {
    id v5 = a4;
    char v6 = [(UIContextMenuInteraction *)self pendingConfiguration];
    id v7 = [(UIContextMenuInteraction *)self delegate];
    id v8 = [v7 _contextMenuInteraction:self configuration:v6 interactionEffectForTargetedPreview:v5];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4
{
  id v5 = a4;
  char v6 = [(UIContextMenuInteraction *)self pendingConfiguration];
  if (self->_delegateImplements.shouldAttemptToPresentConfiguration)
  {
    id v7 = [(UIContextMenuInteraction *)self delegate];
    int v8 = [v7 _contextMenuInteraction:self shouldAttemptToPresentConfiguration:v6];

    if (!v8)
    {
      CGFloat v25 = 0;
      goto LABEL_49;
    }
  }
  uint64_t v9 = [(UIContextMenuInteraction *)self view];
  [(UIContextMenuInteraction *)self locationInView:v9];
  double v11 = v10;
  double v13 = v12;

  double v14 = -[UIContextMenuInteraction _fulfilledConfigurationForConfiguration:atLocation:](self, "_fulfilledConfigurationForConfiguration:atLocation:", v6, v11, v13);
  if ([v14 isPresentable])
  {
    [(UIContextMenuInteraction *)self setPendingConfiguration:0];
    uint64_t v15 = [(UIContextMenuInteraction *)self view];
    id v16 = [v15 _window];
    long long v17 = [v16 windowScene];

    _UIFocusBehaviorSetOverrideFocusSystemEnabled(1, v17, self);
    long long v18 = [(UIContextMenuInteraction *)self view];
    _UIGameControllerNotifyRelevantSystemUIWillShow(v17, v18);

    long long v19 = [(UIContextMenuInteraction *)self _delegate_contextMenuInteractionWillDisplayForConfiguration:v6];
    if (!self->_delegateImplements.styleForMenu
      || ([(UIContextMenuInteraction *)self delegate],
          long long v20 = objc_claimAutoreleasedReturnValue(),
          [v20 _contextMenuInteraction:self styleForMenuWithConfiguration:v6],
          double v21 = objc_claimAutoreleasedReturnValue(),
          v20,
          !v21))
    {
      double v21 = +[_UIContextMenuStyle defaultStyle];
    }
    if ([(UIContextMenuInteraction *)self menuAppearance] == UIContextMenuInteractionAppearanceCompact)
    {
      [v21 setPreferredLayout:3];
      if (v21)
      {
        [v21 _preferredAnchor];
        if (v58 == __PAIR128__(0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL))
        {
          uint64_t v22 = [v6 _primarySourcePreview];
          double v23 = [v22 target];
          double v24 = [v23 container];

          [(UIContextMenuInteraction *)self locationInView:v24];
          objc_msgSend(v21, "set_preferredMenuAttachmentPoint:");
          uint64_t v55 = 0;
          uint64_t v56 = 0;
          uint64_t v57 = 0;
          long long v54 = xmmword_186B9E790;
          objc_msgSend(v21, "set_preferredAnchor:", &v54);
        }
LABEL_14:
        [v21 _preferredAnchor];
        if (v51 != __PAIR128__(0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL)
          || ![v6 preferredMenuAlignment])
        {
LABEL_27:
          uint64_t v32 = [v6 preferredMenuElementOrder];
          if (v32 == 2)
          {
            uint64_t v33 = 0;
          }
          else
          {
            if (v32 != 1) {
              goto LABEL_32;
            }
            uint64_t v33 = 1;
          }
          objc_msgSend(v21, "set_orderMenuBasedOnPriority:", v33);
LABEL_32:
          BOOL v34 = [(UIContextMenuInteraction *)self _shouldKeepInputViewVisibleForStyle:v21];
          if (v34) {
            objc_msgSend(v21, "set_shouldAvoidInputViews:", 1);
          }
          BOOL v35 = !v34;
          double v36 = [v21 containerView];

          if (v36) {
            goto LABEL_45;
          }
          long long v37 = [(UIContextMenuInteraction *)self view];
          long long v38 = [v37 _window];

          if (+[_UIRemoteKeyboards enabled])
          {
            if (([v38 _isRemoteKeyboardWindow] & 1) != 0
              || [v38 _isRemoteInputHostWindow])
            {
              long long v39 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
              v40 = [v39 keyboardWindow];

              if (v40)
              {
                if (([v40 isHidden] & 1) == 0)
                {
                  v49 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
                  id v41 = [v49 visualModeManager];
                  char v48 = [v41 shouldShowWithinAppWindow];

                  if ((v48 & 1) == 0)
                  {
                    id v42 = v40;

                    long long v38 = v42;
                  }
                }
              }
            }
            else if (![v38 _isTextEffectsWindow])
            {
              goto LABEL_44;
            }
            objc_msgSend(v21, "set_shouldAvoidInputViews:", +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"));
            BOOL v35 = 0;
          }
LABEL_44:
          [v21 setContainerView:v38];

LABEL_45:
          uint64_t v43 = [v14 previewViewController];

          if (v43)
          {
            v44 = [v14 previewViewController];
            objc_msgSend(v21, "setHasInteractivePreview:", objc_msgSend(v44, "_allowsUserInteractionWhenPreviewedInContextMenu") | objc_msgSend(v21, "hasInteractivePreview"));
          }
          CGFloat v25 = [[_UIContextMenuPresentation alloc] initWithPresentingViewController:v5 configuration:v14 style:v21];
          [(_UIContextMenuPresentation *)v25 setDelegate:self];
          [(_UIContextMenuPresentation *)v25 setSuppressInputViewDuringPresentation:v35];
          [(_UIContextMenuPresentation *)v25 setAlongsideAnimatorForPresentation:v19];
          v45 = [(UIContextMenuInteraction *)self presentationsByIdentifier];
          v46 = [v14 identifier];
          [v45 setObject:v25 forKeyedSubscript:v46];

          goto LABEL_48;
        }
        uint64_t v26 = [(UIContextMenuInteraction *)self view];
        uint64_t v27 = [v26 effectiveUserInterfaceLayoutDirection];

        uint64_t v28 = [v6 preferredMenuAlignment];
        if (v28 == 3)
        {
          BOOL v29 = v27 == 0;
          uint64_t v30 = 2;
          uint64_t v31 = 8;
        }
        else
        {
          if (v28 != 1)
          {
            uint64_t v30 = 0;
LABEL_26:
            memset(&v50[2], 0, 24);
            v50[0] = 0x7FFFFFFFFFFFFFFFLL;
            v50[1] = v30;
            objc_msgSend(v21, "set_preferredAnchor:", v50);
            goto LABEL_27;
          }
          BOOL v29 = v27 == 0;
          uint64_t v30 = 8;
          uint64_t v31 = 2;
        }
        if (v29) {
          uint64_t v30 = v31;
        }
        goto LABEL_26;
      }
      uint64_t v60 = 0;
      long long v58 = 0u;
      long long v59 = 0u;
    }
    else
    {
      objc_msgSend(v21, "setPreferredLayout:", -[UIContextMenuInteraction _actualLayoutForPreferredLayout:withConfiguration:](self, "_actualLayoutForPreferredLayout:withConfiguration:", objc_msgSend(v21, "preferredLayout"), v14));
      if (v21) {
        goto LABEL_14;
      }
    }
    uint64_t v53 = 0;
    long long v51 = 0u;
    long long v52 = 0u;
    goto LABEL_27;
  }
  CGFloat v25 = 0;
LABEL_48:

LABEL_49:
  return v25;
}

- (BOOL)_shouldKeepInputViewVisibleForStyle:(id)a3
{
  id v4 = a3;
  if ([v4 keepsInputViewsVisible]) {
    goto LABEL_2;
  }
  if ([v4 preferredLayout] != 3)
  {
    LOBYTE(v5) = 0;
    goto LABEL_10;
  }
  char v6 = +[UIDevice currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
LABEL_2:
    LOBYTE(v5) = 1;
  }
  else
  {
    int v8 = [(UIContextMenuInteraction *)self view];
    uint64_t v9 = [v8 _window];
    double v10 = [v9 traitCollection];

    if ([v10 verticalSizeClass] == 1)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      double v11 = [v10 preferredContentSizeCategory];
      int v5 = _UIContentSizeCategoryIsAccessibilityContentSizeCategory(v11, v12) ^ 1;
    }
  }
LABEL_10:

  return v5;
}

- (unint64_t)_actualLayoutForPreferredLayout:(unint64_t)a3 withConfiguration:(id)a4
{
  unint64_t v4 = a3;
  if (a3 == 100)
  {
    int v5 = [a4 previewViewController];
    unint64_t v4 = v5 == 0;
  }
  return v4;
}

- (id)_fulfilledConfigurationForConfiguration:(id)a3 atLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  int v8 = objc_opt_new();
  uint64_t v9 = [v7 identifier];
  [v8 setIdentifier:v9];

  double v10 = [v7 _internalIdentifier];
  double v11 = [v7 _internalSecondaryItemIdentifiers];
  [v8 setPrimaryInternalIdentifier:v10 secondaryIdentifiers:v11];

  double v12 = [v7 firstResponderTarget];
  if (v12)
  {
    [v8 setFirstResponderTarget:v12];
  }
  else
  {
    double v13 = [(UIContextMenuInteraction *)self view];
    [v8 setFirstResponderTarget:v13];
  }
  double v14 = [v7 _primarySourcePreview];
  [v8 setSourcePreview:v14];

  uint64_t v15 = [v7 actionProvider];
  if (v15)
  {
    int v16 = dyld_program_sdk_at_least();
    long long v17 = [(UIContextMenuInteraction *)self view];
    long long v18 = -[UIContextMenuInteraction _suggestedMenuForConfiguration:atLocation:inCoordinateSpace:](self, "_suggestedMenuForConfiguration:atLocation:inCoordinateSpace:", v7, v17, x, y);

    if (v16)
    {
      long long v19 = [v18 children];
      long long v20 = ((void (**)(void, void *))v15)[2](v15, v19);

      double v21 = [v8 firstResponderTarget];
      uint64_t v22 = [(UIContextMenuInteraction *)self _menuPreparedForDisplayWithMenu:v20 firstResponder:v21];
    }
    else
    {
      double v23 = [v8 firstResponderTarget];
      id v41 = +[_UIActionBridge actionMenuForMenu:v18 firstTarget:v23 includeHidden:1];
      double v24 = [v41 children];
      v40 = ((void (**)(void, void *))v15)[2](v15, v24);

      CGFloat v25 = +[_UIActionBridge actionMenuForMenu:v40 firstTarget:v23 includeHidden:0];
      uint64_t v26 = [(UIContextMenuInteraction *)self _defaultPreparationContextWithFirstResponderTarget:v23];
      BYTE4(location) = 0;
      LODWORD(location) = 0;
      [v25 _resolveElementSizeWithContext:v26];
      [v25 children];
      long long v39 = v18;
      uint64_t v28 = v27 = v15;
      BOOL v29 = _menuElementsPreparedForDisplay(v28, [v25 _resolvedElementSize], v26, (uint64_t)&location);
      uint64_t v22 = [v25 menuByReplacingChildren:v29];

      uint64_t v15 = v27;
      LOBYTE(location) = 1;
      [v22 setMetadata:location | ((unint64_t)BYTE4(location) << 32)];
    }
    [v8 setMenu:v22];
  }
  uint64_t v30 = [v7 previewProvider];
  uint64_t v31 = [v7 _effectiveSecondaryItemIdentifiers];
  objc_msgSend(v8, "setRepresentedItemCount:", objc_msgSend(v31, "count") + 1);

  uint64_t v32 = [(UIContextMenuInteraction *)self presentationInteraction];
  uint64_t v33 = [v32 secondaryEffectPreviews];
  [v8 setSecondarySourcePreviews:v33];

  if ([v7 _clientDidSetBadgeCount]) {
    uint64_t v34 = [v7 badgeCount];
  }
  else {
    uint64_t v34 = [v8 representedItemCount];
  }
  [v8 setBadgeCount:v34];
  if ([(UIContextMenuInteraction *)self menuAppearance] == UIContextMenuInteractionAppearanceRich)
  {
    if (([v8 isMultiItemMenu] & 1) == 0)
    {
      if (v30)
      {
        BOOL v35 = v30[2](v30);
        [v8 setPreviewViewController:v35];
      }
      if (self->_delegateImplements.willCommit || self->_delegateImplements.willPerformPreviewAction)
      {
        objc_initWeak(&location, self);
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __79__UIContextMenuInteraction__fulfilledConfigurationForConfiguration_atLocation___block_invoke;
        v42[3] = &unk_1E52DDB60;
        objc_copyWeak(&v43, &location);
        double v36 = +[UIAction actionWithHandler:v42];
        [v8 setPreviewAction:v36];

        objc_destroyWeak(&v43);
        objc_destroyWeak(&location);
      }
    }
    long long v37 = [(UIContextMenuInteraction *)self _delegate_getAccessoryViewsForConfiguration:v7];
    [v8 setAccessoryViews:v37];
  }
  return v8;
}

void __79__UIContextMenuInteraction__fulfilledConfigurationForConfiguration_atLocation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  unint64_t v4 = [v3 sender];

  [WeakRetained _contextMenuPresentationPreviewWasTapped:v4];
}

- (id)_defaultPreparationContextWithFirstResponderTarget:(id)a3
{
  unint64_t v4 = +[_UIMenuPreparationContext contextWithPreparer:self firstResponderTarget:a3];
  [v4 setDeferredElementDelegate:self];
  [v4 setSupportsCustomViewMenuElements:1];
  [v4 setShouldTrackVisibleSelection:&__block_literal_global_677];
  return v4;
}

BOOL __79__UIContextMenuInteraction__defaultPreparationContextWithFirstResponderTarget___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v4 = _UIContextMenuCellSizeForElementSize(a3);
  unint64_t v5 = 3;
  if (v4 != 1) {
    unint64_t v5 = 0;
  }
  if (!v4) {
    unint64_t v5 = 4;
  }
  return v5 <= a2;
}

- (id)_menuPreparedForDisplayWithMenu:(id)a3 firstResponder:(id)a4
{
  id v6 = a3;
  id v7 = [(UIContextMenuInteraction *)self _defaultPreparationContextWithFirstResponderTarget:a4];
  [v7 setSupportsHeaderView:1];
  int v8 = [(UIContextMenuInteraction *)self _proxySender];
  [v7 setSender:v8];

  objc_msgSend(v7, "setUseSenderAsResponderSender:", -[UIContextMenuInteraction _useSenderAsResponderSender](self, "_useSenderAsResponderSender"));
  id v9 = v6;
  id v10 = v7;
  if ([v9 metadata])
  {
    id v15 = v9;
  }
  else
  {
    objc_msgSend(v10, "setTracksSelection:", (objc_msgSend(v9, "options") & 0x80) == 0);
    unsigned __int8 v19 = 0;
    unsigned int v18 = 0;
    double v11 = +[_UIActionBridge validatedCommandMenuForMenu:v9 context:v10];
    uint64_t v12 = [v11 _resolvedElementSize];
    double v13 = [v11 children];
    double v14 = _menuElementsPreparedForDisplay(v13, v12, v10, (uint64_t)&v18);
    id v15 = [v11 menuByReplacingChildren:v14];

    LOBYTE(v18) = 1;
    if ([v10 supportsHeaderView])
    {
      int v16 = [v9 headerView];
      HIBYTE(v18) |= v16 != 0;
    }
    [v15 setMetadata:v18 | ((unint64_t)v19 << 32)];
  }

  return v15;
}

- (void)_clickPresentationInteractionEnded:(id)a3 forPresentation:(id)a4 reason:(unint64_t)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v9)
  {
    double v11 = [v9 menuConfiguration];
    uint64_t v12 = [(UIContextMenuInteraction *)self configurationsByIdentifier];
    double v13 = [v11 identifier];
    double v14 = [v12 objectForKeyedSubscript:v13];

    goto LABEL_5;
  }
  id v15 = [(UIContextMenuInteraction *)self pendingConfiguration];

  if (v15)
  {
    double v14 = [(UIContextMenuInteraction *)self pendingConfiguration];
    [(UIContextMenuInteraction *)self setPendingConfiguration:0];
LABEL_5:
    int v16 = [(UIContextMenuInteraction *)self view];
    long long v17 = [v16 _window];
    unsigned int v18 = [v17 windowScene];
    _UIFocusBehaviorSetOverrideFocusSystemEnabled(0, v18, self);

    unsigned __int8 v19 = [(UIContextMenuInteraction *)self _delegate_contextMenuInteractionWillEndForConfiguration:v14 presentation:v10];
    if (a5 != 10)
    {
      if (v10)
      {
        [v10 setAlongsideAnimatorForDismissal:v19];
        if (a5 == 9)
        {
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __86__UIContextMenuInteraction__clickPresentationInteractionEnded_forPresentation_reason___block_invoke;
          v24[3] = &unk_1E52D9F98;
          v24[4] = self;
          id v25 = v14;
          [v19 addAnimations:v24];
        }
        goto LABEL_15;
      }
LABEL_14:
      double v23 = [v14 identifier];
      [(UIContextMenuInteraction *)self _performCleanupForConfigurationWithIdentifier:v23];

      [v19 performAllAnimations];
      [v19 performAllCompletions];
LABEL_15:

      goto LABEL_16;
    }
    if (os_variant_has_internal_diagnostics())
    {
      double v21 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        goto LABEL_13;
      }
      uint64_t v22 = [v14 identifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = v22;
      _os_log_fault_impl(&dword_1853B0000, v21, OS_LOG_TYPE_FAULT, "Failed to present a context menu for configuration with identifier %@. This is likely due to a different presentation occuring during the lifecycle of the interaction.", buf, 0xCu);
    }
    else
    {
      long long v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_clickPresentationInteractionEnded_forPresentation_reason____s_category)+ 8);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      double v21 = v20;
      uint64_t v22 = [v14 identifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = v22;
      _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "Failed to present a context menu for configuration with identifier %@. This is likely due to a different presentation occuring during the lifecycle of the interaction.", buf, 0xCu);
    }

LABEL_13:
    goto LABEL_14;
  }
LABEL_16:
}

void __86__UIContextMenuInteraction__clickPresentationInteractionEnded_forPresentation_reason___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) identifier];
  [v1 _performCleanupForConfigurationWithIdentifier:v2];
}

- (void)_clickPresentationInteraction:(id)a3 dragSessionDidEndForItems:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__247;
  double v23 = __Block_byref_object_dispose__247;
  id v24 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v7);
      }
      uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "_uicmi_getAssociatedMenuIdentifier");
      uint64_t v12 = (void *)v20[5];
      v20[5] = v11;

      if (v20[5]) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v25 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (v20[5])
  {
    dispatch_time_t v13 = dispatch_time(0, 2000000000);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __84__UIContextMenuInteraction__clickPresentationInteraction_dragSessionDidEndForItems___block_invoke;
    v14[3] = &unk_1E52E4728;
    v14[4] = self;
    v14[5] = &v19;
    dispatch_after(v13, MEMORY[0x1E4F14428], v14);
  }
  _Block_object_dispose(&v19, 8);
}

uint64_t __84__UIContextMenuInteraction__clickPresentationInteraction_dragSessionDidEndForItems___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performCleanupForConfigurationWithIdentifier:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void)_clickPresentationInteraction:(id)a3 shouldPresentWithCompletion:(id)a4
{
  if (self->_delegateImplements.shouldPresent)
  {
    id v5 = a4;
    id v7 = [(UIContextMenuInteraction *)self delegate];
    [v7 _contextMenuInteraction:self shouldPresentWithCompletion:v5];
  }
  else
  {
    id v6 = (void (*)(void))*((void *)a4 + 2);
    id v7 = a4;
    v6();
  }
}

- (BOOL)_clickPresentationInteraction:(id)a3 shouldMaintainKeyboardAssertionForFirstResponder:(id)a4 presentation:(id)a5
{
  id v6 = a4;
  id v7 = [a5 uiController];
  char v8 = [v7 shouldMaintainKeyboardAssertionForFirstResponder:v6];

  return v8;
}

- (BOOL)contextMenuPresentationShouldAllowSwipeToDismissForBeginningPanInteraction:(id)a3
{
  uint64_t v4 = [(UIContextMenuInteraction *)self presentationInteraction];
  [v4 beginPanInteraction];

  if (!self->_delegateImplements.shouldAllowSwipeToDismiss) {
    return 1;
  }
  id v5 = [(UIContextMenuInteraction *)self delegate];
  char v6 = [v5 _contextMenuInteractionShouldAllowSwipeToDismiss:self];

  return v6;
}

- (void)contextMenuPresentationDidEndPanInteraction:(id)a3
{
  id v3 = [(UIContextMenuInteraction *)self presentationInteraction];
  [v3 endPanInteraction];
}

- (void)contextMenuPresentation:(id)a3 didRequestDismissalWithReason:(unint64_t)a4 alongsideActions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  dispatch_time_t v13 = [(UIContextMenuInteraction *)self presentationInteraction];
  char v14 = [v13 _isActive];

  if (v14)
  {
    long long v15 = [(UIContextMenuInteraction *)self presentationsByIdentifier];
    long long v16 = [v10 menuConfiguration];
    long long v17 = [v16 identifier];
    long long v18 = [v15 objectForKeyedSubscript:v17];

    uint64_t v19 = 0;
    int v20 = 1;
    switch(a4)
    {
      case 0uLL:
        uint64_t v19 = 3;
        break;
      case 1uLL:
        uint64_t v19 = 5;
        break;
      case 2uLL:
        uint64_t v19 = 6;
        break;
      case 3uLL:
        uint64_t v19 = 7;
        break;
      case 6uLL:

        long long v18 = 0;
        int v20 = 0;
        uint64_t v19 = 2;
        break;
      default:
        break;
    }
    [(UIContextMenuInteraction *)self setOutgoingPresentation:v18];
    uint64_t v22 = [(UIContextMenuInteraction *)self presentationInteraction];
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    uint64_t v27 = __110__UIContextMenuInteraction_contextMenuPresentation_didRequestDismissalWithReason_alongsideActions_completion___block_invoke;
    uint64_t v28 = &unk_1E52DB330;
    BOOL v29 = self;
    id v30 = v12;
    [v22 _cancelWithReason:v19 alongsideActions:v11 completion:&v25];

    if (v20)
    {
      double v23 = objc_msgSend(v18, "menuConfiguration", v25, v26, v27, v28);
      id v24 = [v23 identifier];
      [(UIContextMenuInteraction *)self _performCleanupForConfigurationWithIdentifier:v24];
    }
  }
  else
  {
    uint64_t v21 = *(NSObject **)(__UILogGetCategoryCachedImpl("UILog", &contextMenuPresentation_didRequestDismissalWithReason_alongsideActions_completion____s_category)+ 8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "Ignoring attempt to dismiss a context menu. This might be due to a re-entrant dismiss call.", buf, 2u);
    }
  }
}

uint64_t __110__UIContextMenuInteraction_contextMenuPresentation_didRequestDismissalWithReason_alongsideActions_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(void **)(a1 + 32);
  return [v3 setOutgoingPresentation:0];
}

- (void)contextMenuPresentation:(id)a3 didBeginDragWithTouch:(id)a4
{
  id v5 = a4;
  id v6 = [(UIContextMenuInteraction *)self presentationInteraction];
  [v6 beginDragIfPossibleWithTouch:v5];
}

- (id)_clickPresentationInteraction:(id)a3 liveDragPreviewForPresentation:(id)a4 dragItem:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v7)
  {
    uint64_t v9 = [a3 associatedDragInteraction];
    id v10 = [v8 _dragDropSession];
    uint64_t v11 = [v9 _sessionPrefersFullSizePreviews:v10];

    id v12 = [v7 livePreviewForDragItem:v8 preferringFullSize:v11];
    if (v12)
    {
      dispatch_time_t v13 = [v7 menuConfiguration];
      char v14 = [v13 identifier];

      objc_msgSend(v8, "_uicmi_setAssociatedMenuIdentifier:", v14);
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)_clickPresentationInteraction:(id)a3 previewForCancellingDragItem:(id)a4
{
  id v5 = a4;
  id v6 = objc_msgSend(v5, "_uicmi_getAssociatedMenuIdentifier");
  if (v6
    && ([(UIContextMenuInteraction *)self presentationsByIdentifier],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 objectForKeyedSubscript:v6],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    uint64_t v9 = [v8 previewForCancellingDragItem:v5];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_clickPresentationInteraction:(id)a3 item:(id)a4 willAnimateDragCancelWithAnimator:(id)a5
{
  id v10 = a5;
  id v7 = objc_msgSend(a4, "_uicmi_getAssociatedMenuIdentifier");
  if (v7)
  {
    id v8 = [(UIContextMenuInteraction *)self presentationsByIdentifier];
    uint64_t v9 = [v8 objectForKeyedSubscript:v7];

    [v9 dragWillCancelWithAnimator:v10];
  }
}

- (void)_performCleanupForConfigurationWithIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    if (!os_variant_has_internal_diagnostics()) {
      goto LABEL_4;
    }
    if (os_variant_has_internal_diagnostics())
    {
      id v10 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        goto LABEL_9;
      }
      uint64_t v11 = [(UIContextMenuInteraction *)self presentationsByIdentifier];
      int v12 = 138412290;
      dispatch_time_t v13 = v11;
      _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "Somehow made it to cleanup step with a nil identifier. Current presentations: %@.", (uint8_t *)&v12, 0xCu);
    }
    else
    {
      uint64_t v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_performCleanupForConfigurationWithIdentifier____s_category)+ 8);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_4;
      }
      id v10 = v9;
      uint64_t v11 = [(UIContextMenuInteraction *)self presentationsByIdentifier];
      int v12 = 138412290;
      dispatch_time_t v13 = v11;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Somehow made it to cleanup step with a nil identifier. Current presentations: %@.", (uint8_t *)&v12, 0xCu);
    }

LABEL_9:
    goto LABEL_4;
  }
  id v5 = [(UIContextMenuInteraction *)self presentationsByIdentifier];
  id v6 = [v5 objectForKeyedSubscript:v4];

  id v7 = [(UIContextMenuInteraction *)self presentationsByIdentifier];
  [v7 removeObjectForKey:v4];

  id v8 = [(UIContextMenuInteraction *)self configurationsByIdentifier];
  [v8 removeObjectForKey:v4];

LABEL_4:
}

- (void)_contextMenuPresentationPreviewWasTapped:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_delegateImplements.willCommit || self->_delegateImplements.willPerformPreviewAction)
  {
    id v6 = [v4 menuConfiguration];
    id v7 = [v6 previewViewController];

    id v8 = +[_UIContextMenuAnimator animatorWithViewController:v7];
    [(UIContextMenuInteraction *)self setPendingCommitAnimator:v8];
    uint64_t v9 = [(UIContextMenuInteraction *)self configurationsByIdentifier];
    id v10 = [v5 menuConfiguration];
    uint64_t v11 = [v10 identifier];
    int v12 = [v9 objectForKeyedSubscript:v11];

    [(UIContextMenuInteraction *)self _delegate_tappedPreviewForConfiguration:v12 withAnimator:v8];
    if ([v8 preferredCommitStyle] == 1 && objc_msgSend(v8, "hasAnyActions"))
    {
      dispatch_time_t v13 = [v5 uiController];
      uint64_t v14 = [v13 platterContainerView];
      long long v15 = [v14 window];

      long long v16 = [_UIContextMenuCommitAnimation alloc];
      long long v17 = [v5 uiController];
      long long v18 = [v17 contentPlatterView];
      uint64_t v19 = [(_UIContextMenuCommitAnimation *)v16 initWithSource:v18 container:v15];

      v28[0] = 0;
      v28[1] = v28;
      v28[2] = 0x2020000000;
      char v29 = 0;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __69__UIContextMenuInteraction__contextMenuPresentationPreviewWasTapped___block_invoke;
      v24[3] = &unk_1E52E1B98;
      uint64_t v27 = v28;
      int v20 = v19;
      uint64_t v25 = v20;
      uint64_t v26 = self;
      [(UIContextMenuInteraction *)self _delegate_performPreviewActionCommitAnimation:v24];

      _Block_object_dispose(v28, 8);
    }
    else
    {
      if ([v8 hasAnyActions]) {
        uint64_t v21 = 4;
      }
      else {
        uint64_t v21 = 3;
      }
      uint64_t v22 = [(UIContextMenuInteraction *)self presentationInteraction];
      [v22 _cancelWithReason:v21 alongsideActions:0 completion:0];
    }
    double v23 = [v12 identifier];
    [(UIContextMenuInteraction *)self _performCleanupForConfigurationWithIdentifier:v23];
  }
}

void __69__UIContextMenuInteraction__contextMenuPresentationPreviewWasTapped___block_invoke(void *a1)
{
  uint64_t v1 = *(void *)(a1[6] + 8);
  if (*(unsigned char *)(v1 + 24))
  {
    if (os_variant_has_internal_diagnostics())
    {
      id v4 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v4, OS_LOG_TYPE_FAULT, "The context menu commit animation cannot be performed more than once.", buf, 2u);
      }
    }
    else
    {
      uint64_t v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &kClickPresentationInteractionTypeDebugString_block_invoke___s_category)+ 8);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "The context menu commit animation cannot be performed more than once.", buf, 2u);
      }
    }
  }
  else
  {
    *(unsigned char *)(v1 + 24) = 1;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __69__UIContextMenuInteraction__contextMenuPresentationPreviewWasTapped___block_invoke_119;
    v5[3] = &unk_1E52D9F70;
    id v3 = (void *)a1[4];
    v5[4] = a1[5];
    [v3 animateWithAlongsideActions:v5 completion:0];
  }
}

void __69__UIContextMenuInteraction__contextMenuPresentationPreviewWasTapped___block_invoke_119(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) presentationInteraction];
  [v1 _cancelWithReason:4 alongsideActions:0 completion:0];
}

- (void)contextMenuPresentation:(id)a3 didSelectMenuLeaf:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_storeWeak((id *)&self->__selectedMenuLeaf, v7);
  id v8 = [(UIContextMenuInteraction *)self _proxySender];
  char v14 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    id v10 = [v6 menuConfiguration];
    uint64_t v11 = [v10 firstResponderTarget];
    int v12 = [v9 _resolvedTargetFromFirstTarget:v11 sender:v8 shouldUseFallbackActionOut:&v14];

    if (!v12) {
      goto LABEL_10;
    }
    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v9 _performFallbackActionWithSender:v8 target:v12];
        goto LABEL_8;
      }
    }
  }
  else
  {
    int v12 = 0;
  }
  [v7 performWithSender:v8 target:v12];
LABEL_8:
  if (self->_delegateImplements.didPerformMenuLeaf)
  {
    dispatch_time_t v13 = [(UIContextMenuInteraction *)self delegate];
    [v13 _contextMenuInteraction:self didPerformMenuLeaf:v7 target:v12];
  }
LABEL_10:
  objc_storeWeak((id *)&self->__selectedMenuLeaf, 0);
}

- (id)contextMenuPresentation:(id)a3 willDisplayMenu:(id)a4
{
  id v6 = a4;
  id v7 = [a3 menuConfiguration];
  id v8 = [v7 firstResponderTarget];
  id v9 = [(UIContextMenuInteraction *)self _menuPreparedForDisplayWithMenu:v6 firstResponder:v8];

  return v9;
}

- (id)contextMenuPresentation:(id)a3 dismissalPreviewForItem:(id)a4 clientReturnedPreview:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(UIContextMenuInteraction *)self configurationsByIdentifier];
  uint64_t v11 = [v10 objectForKeyedSubscript:v9];

  if (v11)
  {
    int v12 = [(UIContextMenuInteraction *)self _delegate_previewForDismissingForConfiguration:v11 clientReturnedPreview:a5];
  }
  else if (self->_delegateImplements.dismissalPreviewForItemWithIdentifier {
         || self->_delegateImplements._dci_secondaryDismissalPreview)
  }
  {
    dispatch_time_t v13 = [v8 menuConfiguration];
    char v14 = [(UIContextMenuInteraction *)self configurationsByIdentifier];
    long long v15 = [v13 identifier];
    long long v16 = [v14 objectForKeyedSubscript:v15];

    if (v16 && self->_delegateImplements.dismissalPreviewForItemWithIdentifier)
    {
      long long v17 = [(UIContextMenuInteraction *)self delegate];
      int v12 = [v17 contextMenuInteraction:self configuration:v16 dismissalPreviewForItemWithIdentifier:v9];
    }
    else
    {
      int v12 = 0;
    }
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

- (void)_interactionShouldBeginAtPoint:(CAPoint3D)a3 completion:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = [(UIContextMenuInteraction *)self presentationInteraction];
  [v8 activatedDriverStyle];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__UIContextMenuInteraction__interactionShouldBeginAtPoint_completion___block_invoke;
  aBlock[3] = &unk_1E530A6C0;
  void aBlock[4] = self;
  id v9 = v7;
  id v20 = v9;
  id v10 = _Block_copy(aBlock);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__UIContextMenuInteraction__interactionShouldBeginAtPoint_completion___block_invoke_2;
  v17[3] = &unk_1E530A6E8;
  id v11 = v10;
  id v18 = v11;
  int v12 = _Block_copy(v17);
  if (self->_delegateImplements.asyncConfigurationForMenuAtLocation)
  {
    dispatch_time_t v13 = [(UIContextMenuInteraction *)self delegate];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __70__UIContextMenuInteraction__interactionShouldBeginAtPoint_completion___block_invoke_4;
    v15[3] = &unk_1E530A6E8;
    id v16 = v12;
    objc_msgSend(v13, "_contextMenuInteraction:configurationForMenuAtLocation:completion:", self, v15, x, y);

    char v14 = v16;
  }
  else
  {
    char v14 = -[UIContextMenuInteraction _delegate_configurationForMenuAtLocation:](self, "_delegate_configurationForMenuAtLocation:", x, y);
    (*((void (**)(void *, void *))v12 + 2))(v12, v14);
  }
}

void __70__UIContextMenuInteraction__interactionShouldBeginAtPoint_completion___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    id v3 = [*(id *)(a1 + 32) configurationsByIdentifier];
    id v4 = [v8 identifier];
    id v5 = [v3 objectForKeyedSubscript:v4];

    [*(id *)(a1 + 32) setPendingConfiguration:v8];
    if (!v5)
    {
      id v6 = [*(id *)(a1 + 32) configurationsByIdentifier];
      id v7 = [v8 identifier];
      [v6 setObject:v8 forKeyedSubscript:v7];

      [*(id *)(a1 + 32) _willBeginWithConfiguration:v8];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __70__UIContextMenuInteraction__interactionShouldBeginAtPoint_completion___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __70__UIContextMenuInteraction__interactionShouldBeginAtPoint_completion___block_invoke_3;
    v4[3] = &unk_1E530A6E8;
    id v5 = *(id *)(a1 + 32);
    [a2 _prepareWithCompletion:v4];
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

uint64_t __70__UIContextMenuInteraction__interactionShouldBeginAtPoint_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __70__UIContextMenuInteraction__interactionShouldBeginAtPoint_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_delegate_configurationForMenuAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(UIContextMenuInteraction *)self delegate];
  id v7 = objc_msgSend(v6, "contextMenuInteraction:configurationForMenuAtLocation:", self, x, y);

  return v7;
}

- (id)_delegate_previewForHighlightingForConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_delegateImplements.highlightPreviewForItemWithIdentifier)
  {
    id v6 = [v4 _effectiveInternalIdentifier];
    id v7 = [(UIContextMenuInteraction *)self delegate];
    id v8 = [v7 contextMenuInteraction:self configuration:v5 highlightPreviewForItemWithIdentifier:v6];

LABEL_5:
    goto LABEL_6;
  }
  if (self->_delegateImplements.previewForHighlighting)
  {
    id v6 = [(UIContextMenuInteraction *)self delegate];
    id v8 = [v6 contextMenuInteraction:self previewForHighlightingMenuWithConfiguration:v5];
    goto LABEL_5;
  }
  id v8 = 0;
LABEL_6:

  return v8;
}

- (id)_delegate_previewForDismissingForConfiguration:(id)a3 clientReturnedPreview:(BOOL *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (self->_delegateImplements.dismissalPreviewForItemWithIdentifier)
  {
    id v8 = [v6 _effectiveInternalIdentifier];
    id v9 = [(UIContextMenuInteraction *)self delegate];
    id v10 = [v9 contextMenuInteraction:self configuration:v7 dismissalPreviewForItemWithIdentifier:v8];

    *a4 = 1;
  }
  else if (self->_delegateImplements.previewForDismissing)
  {
    id v18 = [(UIContextMenuInteraction *)self delegate];
    id v10 = [v18 contextMenuInteraction:self previewForDismissingMenuWithConfiguration:v7];

    if (dyld_program_sdk_at_least()) {
      *a4 = 1;
    }
  }
  else
  {
    id v10 = 0;
  }
  id v11 = [(UIContextMenuInteraction *)self view];
  int v12 = [v11 traitCollection];
  uint64_t v13 = [v12 userInterfaceIdiom];
  id v14 = v10;
  long long v15 = _UIContextMenuGetPlatformMetrics(v13);
  id v16 = [v15 shouldApplyShadowHandler];

  if (v16) {
    uint64_t v17 = ((uint64_t (**)(void, id))v16)[2](v16, v14);
  }
  else {
    uint64_t v17 = 1;
  }

  uint64_t v19 = [v14 parameters];
  [v19 setAppliesShadow:v17];

  return v14;
}

- (void)_delegate_tappedPreviewForConfiguration:(id)a3 withAnimator:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (self->_delegateImplements.willPerformPreviewAction)
  {
    id v7 = [(UIContextMenuInteraction *)self delegate];
    [v7 contextMenuInteraction:self willPerformPreviewActionForMenuWithConfiguration:v8 animator:v6];
  }
  else
  {
    if (!self->_delegateImplements.willCommit) {
      goto LABEL_6;
    }
    id v7 = [(UIContextMenuInteraction *)self delegate];
    [v7 contextMenuInteraction:self willCommitWithAnimator:v6];
  }

LABEL_6:
}

- (id)_delegate_contextMenuInteractionWillDisplayForConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  if (self->_delegateImplements.willDisplay)
  {
    id v6 = [(UIContextMenuInteraction *)self delegate];
    [v6 contextMenuInteraction:self willDisplayMenuForConfiguration:v4 animator:v5];
  }
  return v5;
}

- (id)_delegate_contextMenuInteractionWillEndForConfiguration:(id)a3 presentation:(id)a4
{
  id v5 = a3;
  id v6 = [(UIContextMenuInteraction *)self pendingCommitAnimator];
  id v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)objc_opt_new();
  }
  id v9 = v8;

  [(UIContextMenuInteraction *)self setPendingCommitAnimator:0];
  if (self->_delegateImplements.willEndForConfiguration)
  {
    id v10 = [(UIContextMenuInteraction *)self delegate];
    [v10 contextMenuInteraction:self willEndForConfiguration:v5 animator:v9];
  }
  return v9;
}

- (id)_delegate_getAccessoryViewsForConfiguration:(id)a3
{
  if (self->_delegateImplements.accessoriesForMenu)
  {
    id v4 = a3;
    id v5 = [(UIContextMenuInteraction *)self delegate];
    id v6 = [v5 _contextMenuInteraction:self accessoriesForMenuWithConfiguration:v4];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)_delegate_performPreviewActionCommitAnimation:(id)a3
{
  id v6 = (void (**)(void))a3;
  if (!self->_delegateImplements.shouldDeferCommitAnimation
    || ([(UIContextMenuInteraction *)self delegate],
        id v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 _contextMenuInteraction:self shouldDeferPreviewActionCommitAnimation:v6],
        v4,
        (v5 & 1) == 0))
  {
    v6[2]();
  }
}

- (id)_suggestedMenuForConfiguration:(id)a3 atLocation:(CGPoint)a4 inCoordinateSpace:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  id v10 = a5;
  if (!self->_delegateImplements.overrideSuggestedActions) {
    goto LABEL_3;
  }
  id v11 = [(UIContextMenuInteraction *)self delegate];
  int v12 = [v11 _contextMenuInteraction:self overrideSuggestedActionsForConfiguration:v9];
  uint64_t v13 = +[UIMenu menuWithTitle:&stru_1ED0E84C0 image:0 identifier:@"com.apple.menu.root" options:0 children:v12];

  if (!v13)
  {
LABEL_3:
    id v14 = +[UIMenuSystem contextSystem];
    long long v15 = [(UIContextMenuInteraction *)self view];
    id v16 = objc_msgSend(v14, "_newBuilderFromResponderChain:atLocation:inCoordinateSpace:", v15, v10, x, y);
    uint64_t v13 = [v16 menuForIdentifier:@"com.apple.menu.root"];
  }
  return v13;
}

- (void)_prepareSceneActivationConfiguration:(id)a3
{
  id v16 = a3;
  id v4 = [(UIContextMenuInteraction *)self presentationsByIdentifier];
  char v5 = [v4 allValues];
  id v6 = [v5 firstObject];

  uint64_t v7 = [v6 windowSceneActivationPreview];
  if (v7)
  {
    id v8 = (void *)v7;
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v10 = [v16 preview];
    if (v10)
    {
      id v8 = (void *)v10;
    }
    else
    {
      id v11 = [(UIContextMenuInteraction *)self _proxySender];

      if (v11 == self
        && ([v6 menuConfiguration],
            int v12 = objc_claimAutoreleasedReturnValue(),
            [v12 sourcePreview],
            uint64_t v13 = objc_claimAutoreleasedReturnValue(),
            int v14 = [v13 _isVisible],
            v13,
            v12,
            v14))
      {
        long long v15 = [v6 menuConfiguration];
        id v8 = [v15 sourcePreview];
      }
      else
      {
        id v8 = 0;
      }
    }
    uint64_t v9 = 0;
  }
  [v16 setPreview:v8];
  [v16 _setAnimationSource:v9];
}

- (void)_requestSceneActivationWithConfiguration:(id)a3 animated:(BOOL)a4 sender:(id)a5 errorHandler:(id)a6
{
  BOOL v8 = a4;
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(UIContextMenuInteraction *)self presentationsByIdentifier];
  int v14 = [v13 allValues];
  long long v15 = [v14 firstObject];

  if (v8)
  {
    id v16 = [v10 preview];

    if (v16 && v15)
    {
      uint64_t v17 = [[_UIWindowSceneActivationAnimator alloc] initWithConfiguration:v10];
      id v18 = [v15 uiController];
      uint64_t v19 = +[_UIContextMenuDismissToWindowSceneActivationAnimation animationWithUIController:v18];

      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __98__UIContextMenuInteraction__requestSceneActivationWithConfiguration_animated_sender_errorHandler___block_invoke;
      v34[3] = &unk_1E53105D8;
      id v20 = v19;
      id v35 = v20;
      [(_UIWindowSceneActivationAnimator *)v17 addAnimations:v34];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __98__UIContextMenuInteraction__requestSceneActivationWithConfiguration_animated_sender_errorHandler___block_invoke_2;
      v32[3] = &unk_1E52D9F98;
      v32[4] = self;
      id v21 = v15;
      id v33 = v21;
      [(_UIWindowSceneActivationAnimator *)v17 addCompletion:v32];
      objc_initWeak(location, self);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __98__UIContextMenuInteraction__requestSceneActivationWithConfiguration_animated_sender_errorHandler___block_invoke_4;
      v25[3] = &unk_1E5311300;
      uint64_t v22 = v17;
      uint64_t v26 = v22;
      id v27 = v10;
      id v28 = v11;
      id v30 = v12;
      objc_copyWeak(&v31, location);
      id v29 = v21;
      [(_UIWindowSceneActivationAnimator *)v22 prewarmWithCompletion:v25];

      objc_destroyWeak(&v31);
      objc_destroyWeak(location);
    }
    else
    {
      if (os_variant_has_internal_diagnostics())
      {
        id v24 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v10;
          _os_log_fault_impl(&dword_1853B0000, v24, OS_LOG_TYPE_FAULT, "The configuration either has no preview or there is no current context menu presentation; configuration = %@",
            (uint8_t *)location,
            0xCu);
        }
      }
      else
      {
        double v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_requestSceneActivationWithConfiguration_animated_sender_errorHandler____s_category)+ 8);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v10;
          _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_ERROR, "The configuration either has no preview or there is no current context menu presentation; configuration = %@",
            (uint8_t *)location,
            0xCu);
        }
      }
      [(id)UIApp _requestSceneActivationWithConfiguration:v10 animated:0 sender:v11 errorHandler:v12];
    }
  }
  else
  {
    if (v15) {
      [(UIContextMenuInteraction *)self contextMenuPresentation:v15 didRequestDismissalWithReason:1 alongsideActions:0 completion:0];
    }
    [(id)UIApp _requestSceneActivationWithConfiguration:v10 animated:0 sender:v11 errorHandler:v12];
  }
}

uint64_t __98__UIContextMenuInteraction__requestSceneActivationWithConfiguration_animated_sender_errorHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) animateAlongsideScenePlatter:a2];
}

void __98__UIContextMenuInteraction__requestSceneActivationWithConfiguration_animated_sender_errorHandler___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __98__UIContextMenuInteraction__requestSceneActivationWithConfiguration_animated_sender_errorHandler___block_invoke_3;
  v2[3] = &unk_1E52D9F98;
  id v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  +[UIView performWithoutAnimation:v2];
}

uint64_t __98__UIContextMenuInteraction__requestSceneActivationWithConfiguration_animated_sender_errorHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) contextMenuPresentation:*(void *)(a1 + 40) didRequestDismissalWithReason:1 alongsideActions:0 completion:0];
}

void __98__UIContextMenuInteraction__requestSceneActivationWithConfiguration_animated_sender_errorHandler___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v8 = a3;
  char v5 = *(void **)(a1 + 32);
  if (a2)
  {
    id v6 = [*(id *)(a1 + 40) preview];
    [v5 animateWithSourcePreview:v6 velocity:0.0];
  }
  else
  {
    [*(id *)(a1 + 32) cancel];
  }
  [(id)UIApp _requestSceneActivationWithConfiguration:*(void *)(a1 + 40) animated:0 sender:*(void *)(a1 + 48) errorHandler:*(void *)(a1 + 64)];
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    [WeakRetained contextMenuPresentation:*(void *)(a1 + 56) didRequestDismissalWithReason:1 alongsideActions:0 completion:0];
  }
}

- ($9BEB610D0CE1B1EDC3D89DA2464F985F)_testing_metdataForMenuElements:(id)a3
{
  id v4 = a3;
  unsigned int v8 = 0;
  unsigned __int8 v9 = 0;
  char v5 = +[_UIMenuPreparationContext contextWithPreparer:self firstResponderTarget:0];
  [v5 setDeferredElementDelegate:self];
  [v5 setSupportsCustomViewMenuElements:1];
  id v6 = _menuElementsPreparedForDisplay(v4, 2, v5, (uint64_t)&v8);

  return ($9BEB610D0CE1B1EDC3D89DA2464F985F)(v8 | ((unint64_t)v9 << 32));
}

- (UIContextMenuConfiguration)pendingConfiguration
{
  return self->_pendingConfiguration;
}

- (void)setPendingConfiguration:(id)a3
{
}

- (NSMutableDictionary)configurationsByIdentifier
{
  return self->_configurationsByIdentifier;
}

- (void)setOutgoingPresentation:(id)a3
{
}

- (_UIContextMenuAnimator)pendingCommitAnimator
{
  return self->_pendingCommitAnimator;
}

- (void)setPendingCommitAnimator:(id)a3
{
}

- (BOOL)_requiresTouchAuthentication
{
  return self->__requiresTouchAuthentication;
}

- (void)set_requiresTouchAuthentication:(BOOL)a3
{
  self->__requiresTouchAuthentication = a3;
}

- (BOOL)_useSenderAsResponderSender
{
  return self->__useSenderAsResponderSender;
}

- (void)set_useSenderAsResponderSender:(BOOL)a3
{
  self->__useSenderAsResponderSender = a3;
}

- (UIMenuLeaf)_selectedMenuLeaf
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__selectedMenuLeaf);
  return (UIMenuLeaf *)WeakRetained;
}

- (void)set_selectedMenuLeaf:(id)a3
{
}

@end