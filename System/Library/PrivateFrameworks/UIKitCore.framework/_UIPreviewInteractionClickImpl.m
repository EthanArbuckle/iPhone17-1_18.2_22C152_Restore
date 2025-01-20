@interface _UIPreviewInteractionClickImpl
- (BOOL)_canPerformPresentation;
- (BOOL)_performPresentationIfPossible;
- (BOOL)clickInteractionShouldBegin:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGPoint)locationInCoordinateSpace:(id)a3;
- (UIDragInteraction)associatedDragInteraction;
- (UIInteractionEffect)interactionEffect;
- (UIPreviewInteraction)previewInteraction;
- (UIPreviewInteractionDelegate)delegate;
- (UIPreviewInteractionDelegatePrivate)privateDelegate;
- (UIView)view;
- (_UIClickInteraction)commitClickInteraction;
- (_UIClickInteraction)previewClickInteraction;
- (_UIPreviewInteractionClickImpl)initWithView:(id)a3 previewInteraction:(id)a4;
- (_UIPreviewInteractionHighlighter)highlighter;
- (_UIPreviewInteractionPresentationAssistant)presentationAssistant;
- (_UIPreviewInteractionTouchForceProviding)touchForceProvider;
- (_UIRelationshipGestureRecognizer)exclusionRelationshipGestureRecognizer;
- (id)highlightEffectForClickInteraction:(id)a3;
- (uint64_t)_endInteractionDidComplete:(char)a3 wasCancelledByClient:;
- (uint64_t)_handleTransitionToPossibleByEndingWithContext:(uint64_t)result;
- (void)_delegateUpdateCommitTransitionWithProgress:(double)a3 ended:;
- (void)_delegateUpdatePreviewTransitionWithProgress:(double)a3 ended:;
- (void)_endInteractionEffectIfNeeded;
- (void)_prepareInteractionEffect;
- (void)_startPreviewAtLocation:(CGPoint)a3 inCoordinateSpace:(id)a4;
- (void)_toBeRemoved_CallHighlighterCompletion;
- (void)_toBeRemoved_CreateHighlighterIfPossible;
- (void)cancelInteraction;
- (void)clickInteractionDidClickDown:(id)a3;
- (void)clickInteractionDidClickUp:(id)a3;
- (void)clickInteractionDidEnd:(id)a3;
- (void)dealloc;
- (void)didMoveToView:(id)a3;
- (void)setAssociatedDragInteraction:(id)a3;
- (void)setCommitClickInteraction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExclusionRelationshipGestureRecognizer:(id)a3;
- (void)setHighlighter:(id)a3;
- (void)setInteractionEffect:(id)a3;
- (void)setPresentationAssistant:(id)a3;
- (void)setPreviewClickInteraction:(id)a3;
- (void)setPreviewInteraction:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation _UIPreviewInteractionClickImpl

- (_UIPreviewInteractionClickImpl)initWithView:(id)a3 previewInteraction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(_UIPreviewInteractionClickImpl *)self init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_previewInteraction, v7);
    [v6 addInteraction:v9];
  }

  return v9;
}

- (void)dealloc
{
  v3 = [(_UIPreviewInteractionClickImpl *)self view];
  [v3 removeInteraction:self];

  v4.receiver = self;
  v4.super_class = (Class)_UIPreviewInteractionClickImpl;
  [(_UIPreviewInteractionClickImpl *)&v4 dealloc];
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  id v4 = a3;
  v5 = [(_UIPreviewInteractionClickImpl *)self previewInteraction];
  id v6 = [v5 view];

  if (v6)
  {
    id v7 = [(_UIPreviewInteractionClickImpl *)self previewClickInteraction];
    [v7 locationInCoordinateSpace:v4];
    uint64_t v9 = v8;
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v11 = 0x7FEFFFFFFFFFFFFFLL;
    uint64_t v9 = 0x7FEFFFFFFFFFFFFFLL;
  }

  double v12 = *(double *)&v9;
  double v13 = *(double *)&v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (void)cancelInteraction
{
}

- (uint64_t)_endInteractionDidComplete:(char)a3 wasCancelledByClient:
{
  if (result)
  {
    unint64_t v4 = *(void *)(result + 8);
    if (v4 > 4 || ((1 << v4) & 0x13) == 0)
    {
      uint64_t v6 = result;
      uint64_t v7 = a2;
      BYTE1(v7) = a3;
      return handleEvent(stateMachineSpec_1, v4, 4, (uint64_t)&v6, (uint64_t *)(result + 8));
    }
  }
  return result;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    objc_storeWeak((id *)&self->_privateDelegate, 0);
    self->_delegateImplements.shouldBegin = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.didUpdateCommitTransition = objc_opt_respondsToSelector() & 1;
    uint64_t v6 = [(_UIPreviewInteractionClickImpl *)self privateDelegate];
    self->_delegateImplements.highlighterForPreviewTransition = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.viewControllerPresentationForPresentingViewController = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.shouldFinishTransitionToPreview = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.targetedPreviewForPreviewingAtLocation = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.overrideViewForCommitPhase = objc_opt_respondsToSelector() & 1;
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v7) {
      self->_currentState = 1;
    }

    v5 = obj;
  }
}

- (void)willMoveToView:(id)a3
{
  unint64_t v4 = [(_UIPreviewInteractionClickImpl *)self previewClickInteraction];
  v5 = [v4 view];
  uint64_t v6 = [(_UIPreviewInteractionClickImpl *)self previewClickInteraction];
  [v5 removeInteraction:v6];

  id v7 = [(_UIPreviewInteractionClickImpl *)self commitClickInteraction];
  uint64_t v8 = [v7 view];
  uint64_t v9 = [(_UIPreviewInteractionClickImpl *)self commitClickInteraction];
  [v8 removeInteraction:v9];

  uint64_t v10 = [(_UIPreviewInteractionClickImpl *)self exclusionRelationshipGestureRecognizer];
  uint64_t v11 = [v10 view];
  double v12 = [(_UIPreviewInteractionClickImpl *)self exclusionRelationshipGestureRecognizer];
  [v11 removeGestureRecognizer:v12];

  objc_storeWeak((id *)&self->_view, 0);
}

- (void)didMoveToView:(id)a3
{
  p_view = &self->_view;
  id v5 = objc_storeWeak((id *)&self->_view, a3);
  if (a3)
  {
    uint64_t v6 = [(_UIPreviewInteractionClickImpl *)self previewClickInteraction];

    if (!v6)
    {
      id v7 = objc_alloc_init(_UIClickInteraction);
      [(_UIPreviewInteractionClickImpl *)self setPreviewClickInteraction:v7];

      uint64_t v8 = [(_UIPreviewInteractionClickImpl *)self previewClickInteraction];
      [v8 setAllowableMovement:10.0];

      uint64_t v9 = [(_UIPreviewInteractionClickImpl *)self previewClickInteraction];
      [v9 setDelegate:self];
    }
    id WeakRetained = objc_loadWeakRetained((id *)p_view);
    uint64_t v11 = [(_UIPreviewInteractionClickImpl *)self previewClickInteraction];
    [WeakRetained addInteraction:v11];

    double v12 = [(_UIPreviewInteractionClickImpl *)self exclusionRelationshipGestureRecognizer];

    if (!v12)
    {
      double v13 = objc_opt_new();
      [v13 setName:@"com.apple.UIKit.previewInteractionExclusionRelationships"];
      [v13 setDelegate:self];
      [(_UIPreviewInteractionClickImpl *)self setExclusionRelationshipGestureRecognizer:v13];
    }
    id v14 = objc_loadWeakRetained((id *)p_view);
    v15 = [(_UIPreviewInteractionClickImpl *)self exclusionRelationshipGestureRecognizer];
    [v14 addGestureRecognizer:v15];
  }
}

- (void)_startPreviewAtLocation:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  if (!self->_interactionEffect) {
    [(_UIPreviewInteractionClickImpl *)self _prepareInteractionEffect];
  }
  id v5 = self;
  handleEvent(stateMachineSpec_1, self->_currentState, 2, (uint64_t)&v5, (uint64_t *)&self->_currentState);
}

- (BOOL)_canPerformPresentation
{
  if (!self->_delegateImplements.viewControllerPresentationForPresentingViewController) {
    return 0;
  }
  v2 = [(_UIPreviewInteractionClickImpl *)self presentationAssistant];
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)_performPresentationIfPossible
{
  if (![(_UIPreviewInteractionClickImpl *)self _canPerformPresentation]) {
    return 0;
  }
  unint64_t v4 = [(_UIPreviewInteractionClickImpl *)self view];
  id v5 = [v4 _viewControllerForAncestor];

  if (!v5)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"_UIPreviewInteractionClickImpl.m" lineNumber:263 description:@"UIPreviewInteraction cannot determine presenting view controller."];
  }
  uint64_t v6 = [(_UIPreviewInteractionClickImpl *)self privateDelegate];
  id v7 = [(_UIPreviewInteractionClickImpl *)self previewInteraction];
  uint64_t v8 = [v6 _previewInteraction:v7 viewControllerPresentationForPresentingViewController:v5];

  BOOL v9 = v8 != 0;
  if (v8)
  {
    uint64_t v10 = [v8 viewController];

    if (v10 == v5)
    {
      uint64_t v11 = [v8 viewController];
      uint64_t v12 = [v11 parentViewController];

      id v5 = (void *)v12;
      if (!v12)
      {
        v23 = [MEMORY[0x1E4F28B00] currentHandler];
        [v23 handleFailureInMethod:a2 object:self file:@"_UIPreviewInteractionClickImpl.m" lineNumber:272 description:@"UIPreviewInteraction cannot determine presenting view controller."];

        id v5 = 0;
      }
    }
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __64___UIPreviewInteractionClickImpl__performPresentationIfPossible__block_invoke;
    aBlock[3] = &unk_1E52DC308;
    objc_copyWeak(&v26, &location);
    double v13 = _Block_copy(aBlock);
    id v14 = [[_UIPreviewInteractionPresentationAssistant alloc] initWithViewControllerPresentation:v8];
    [(_UIPreviewInteractionClickImpl *)self setPresentationAssistant:v14];

    v15 = [(_UIPreviewInteractionClickImpl *)self highlighter];
    v16 = [(_UIPreviewInteractionClickImpl *)self presentationAssistant];
    [v16 setHighlighter:v15];

    v17 = [(UIInteractionEffect *)self->_interactionEffect targetedPreviewForEffectContinuation];
    v18 = [(_UIPreviewInteractionClickImpl *)self presentationAssistant];
    [v18 presentFromViewController:v5 sourcePreview:v17 dismissalCompletion:v13];

    v19 = [v8 viewController];
    v20 = [v19 transitionCoordinator];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __64___UIPreviewInteractionClickImpl__performPresentationIfPossible__block_invoke_2;
    v24[3] = &unk_1E52DA598;
    v24[4] = self;
    [v20 animateAlongsideTransition:v24 completion:0];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (UIPreviewInteractionDelegatePrivate)privateDelegate
{
  BOOL v3 = [(_UIPreviewInteractionClickImpl *)self delegate];
  p_privateDelegate = &self->_privateDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_privateDelegate);
  if (WeakRetained)
  {
  }
  else if ([v3 conformsToProtocol:&unk_1ED700E20])
  {
    objc_storeWeak((id *)p_privateDelegate, v3);
  }
  id v6 = objc_loadWeakRetained((id *)p_privateDelegate);

  return (UIPreviewInteractionDelegatePrivate *)v6;
}

- (BOOL)clickInteractionShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIPreviewInteractionClickImpl *)self previewClickInteraction];

  if (v5 != v4) {
    return 1;
  }
  BOOL v9 = self;
  unint64_t currentState = self->_currentState;
  p_unint64_t currentState = (uint64_t *)&self->_currentState;
  handleEvent(stateMachineSpec_1, currentState, 0, (uint64_t)&v9, p_currentState);
  return (unint64_t)*p_currentState > 1;
}

- (void)clickInteractionDidEnd:(id)a3
{
  id v4 = a3;
  unint64_t currentState = self->_currentState;
  if (currentState > 4 || ((1 << currentState) & 0x13) == 0)
  {
    id v9 = v4;
    id v7 = [(_UIPreviewInteractionClickImpl *)self previewClickInteraction];

    id v4 = v9;
    if (currentState < 5 || v7 != v9)
    {
      -[_UIPreviewInteractionClickImpl _endInteractionDidComplete:wasCancelledByClient:]((uint64_t)self, 0, 0);
      id v4 = v9;
    }
  }
}

- (id)highlightEffectForClickInteraction:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(_UIPreviewInteractionClickImpl *)self previewClickInteraction];

  if (v5 != v4)
  {
    id v6 = [_UIPercentDrivenInteractionEffect alloc];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69___UIPreviewInteractionClickImpl_highlightEffectForClickInteraction___block_invoke_2;
    v12[3] = &unk_1E52EF070;
    id v7 = &v13;
    objc_copyWeak(&v13, &location);
    uint64_t v8 = [(_UIPercentDrivenInteractionEffect *)v6 initWithProgressBlock:v12];
LABEL_6:
    uint64_t v10 = (void *)v8;
    objc_destroyWeak(v7);
    goto LABEL_7;
  }
  if (self->_delegateImplements.highlighterForPreviewTransition
    || self->_delegateImplements.targetedPreviewForPreviewingAtLocation)
  {
    [(_UIPreviewInteractionClickImpl *)self _prepareInteractionEffect];
    id v9 = [_UIPercentDrivenInteractionEffect alloc];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69___UIPreviewInteractionClickImpl_highlightEffectForClickInteraction___block_invoke;
    v14[3] = &unk_1E52EF070;
    id v7 = &v15;
    objc_copyWeak(&v15, &location);
    uint64_t v8 = [(_UIPercentDrivenInteractionEffect *)v9 initWithProgressBlock:v14];
    goto LABEL_6;
  }
  uint64_t v10 = 0;
LABEL_7:
  objc_destroyWeak(&location);

  return v10;
}

- (void)_delegateUpdatePreviewTransitionWithProgress:(double)a3 ended:
{
  if (a1)
  {
    id v7 = [a1 delegate];
    id v6 = [a1 previewInteraction];
    [v7 previewInteraction:v6 didUpdatePreviewTransition:a2 ended:a3];
  }
}

- (void)_delegateUpdateCommitTransitionWithProgress:(double)a3 ended:
{
  if (a1 && a1[17])
  {
    id v7 = [a1 delegate];
    id v6 = [a1 previewInteraction];
    [v7 previewInteraction:v6 didUpdateCommitTransition:a2 ended:a3];
  }
}

- (void)clickInteractionDidClickDown:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIPreviewInteractionClickImpl *)self previewClickInteraction];

  if (v5 == v4)
  {
    id v6 = self;
    handleEvent(stateMachineSpec_1, self->_currentState, 1, (uint64_t)&v6, (uint64_t *)&self->_currentState);
  }
}

- (void)clickInteractionDidClickUp:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIPreviewInteractionClickImpl *)self previewClickInteraction];

  if (v5 == v4)
  {
    uint64_t v10 = self;
    unint64_t currentState = self->_currentState;
    id v7 = &v10;
    uint64_t v8 = 2;
  }
  else
  {
    id v9 = self;
    unint64_t currentState = self->_currentState;
    id v7 = &v9;
    uint64_t v8 = 3;
  }
  handleEvent(stateMachineSpec_1, currentState, v8, (uint64_t)v7, (uint64_t *)&self->_currentState);
}

- (uint64_t)_handleTransitionToPossibleByEndingWithContext:(uint64_t)result
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    BOOL v3 = (void *)result;
    uint64_t v4 = [(id)result associatedDragInteraction];
    id v5 = (void *)v4;
    if (v4 && v3[1] == 3)
    {
      v46 = (void *)v4;
      id v6 = (void *)UIApp;
      id v7 = [v3 view];
      uint64_t v8 = [v7 _window];
      id v9 = (id)[v6 _touchesEventForWindow:v8];

      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v45 = v9;
      uint64_t v10 = [v9 allTouches];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v49;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v49 != v13) {
              objc_enumerationMutation(v10);
            }
            id v15 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            if ([v15 phase] == 1)
            {
              v16 = [v3 view];
              [v16 bounds];
              CGFloat v18 = v17;
              CGFloat v20 = v19;
              CGFloat v22 = v21;
              CGFloat v24 = v23;
              v25 = [v3 view];
              [v15 locationInView:v25];
              v54.x = v26;
              v54.y = v27;
              v55.origin.x = v18;
              v55.origin.y = v20;
              v55.size.width = v22;
              v55.size.height = v24;
              BOOL v28 = CGRectContainsPoint(v55, v54);

              if (v28)
              {
                v47[0] = MEMORY[0x1E4F143A8];
                v47[1] = 3221225472;
                v47[2] = __81___UIPreviewInteractionClickImpl__handleTransitionToPossibleByEndingWithContext___block_invoke;
                v47[3] = &unk_1E52EF3D8;
                v47[4] = v3;
                v47[5] = v45;
                [v46 _immediatelyBeginDragWithTouch:v15 completion:v47];
                goto LABEL_15;
              }
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v48 objects:v52 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
LABEL_15:

      id v5 = v46;
    }
    [v3 setAssociatedDragInteraction:0];
    unint64_t v29 = v3[1];
    v30 = [v3 exclusionRelationshipGestureRecognizer];
    v31 = v30;
    if (v29 > 3) {
      [v30 reset];
    }
    else {
      [v30 _fail];
    }

    if (!*(unsigned char *)(a2 + 8) && !*(unsigned char *)(a2 + 9))
    {
      v32 = [v3 delegate];
      v33 = [v3 previewInteraction];
      [v32 previewInteractionDidCancel:v33];
    }
    [v3 _endInteractionEffectIfNeeded];
    v34 = [v3 presentationAssistant];

    if (v34)
    {
      v35 = [v3 presentationAssistant];
      [v35 dismissViewController];
    }
    else
    {
      -[_UIPreviewInteractionClickImpl _toBeRemoved_CallHighlighterCompletion](v3);
    }
    v36 = [v3 previewClickInteraction];
    v37 = [v36 view];

    if (v37)
    {
      v38 = [v3 previewClickInteraction];
      [v38 cancelInteraction];
    }
    else
    {
      v38 = [v3 view];
      v39 = [v3 previewClickInteraction];
      [v38 addInteraction:v39];
    }
    v40 = [v3 previewClickInteraction];
    [v40 setAllowableMovement:10.0];

    v41 = [v3 commitClickInteraction];
    [v41 cancelInteraction];

    v42 = [v3 commitClickInteraction];
    v43 = [v42 view];
    v44 = [v3 commitClickInteraction];
    [v43 removeInteraction:v44];

    return 1;
  }
  return result;
}

- (void)_toBeRemoved_CreateHighlighterIfPossible
{
  if (a1 && a1[18])
  {
    v2 = [a1 privateDelegate];
    BOOL v3 = [a1 previewInteraction];
    id v4 = [v2 _previewInteractionHighlighterForPreviewTransition:v3];

    [a1 setHighlighter:v4];
  }
}

- (void)_toBeRemoved_CallHighlighterCompletion
{
  if (a1)
  {
    v2 = [a1 highlighter];

    if (v2)
    {
      BOOL v3 = [a1 highlighter];
      id v4 = [v3 completionBlock];
      uint64_t v6 = [v4 copy];

      [a1 setHighlighter:0];
      id v5 = (void *)v6;
      if (v6)
      {
        (*(void (**)(uint64_t))(v6 + 16))(v6);
        id v5 = (void *)v6;
      }
    }
  }
}

- (void)_prepareInteractionEffect
{
  if (!self->_delegateImplements.targetedPreviewForPreviewingAtLocation)
  {
    -[_UIPreviewInteractionClickImpl _toBeRemoved_CreateHighlighterIfPossible](self);
    uint64_t v11 = [(_UIPreviewInteractionClickImpl *)self highlighter];
    interactionEffect = v11;
    if (v11)
    {
      uint64_t v10 = [v11 view];
      uint64_t v12 = [interactionEffect customContainerView];
      if (v12 || ([v10 superview], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        [v10 center];
        double v14 = v13;
        double v16 = v15;
        double v17 = [v10 superview];
        objc_msgSend(v12, "convertPoint:fromView:", v17, v14, v16);
        double v19 = v18;
        double v21 = v20;

        CGFloat v22 = -[UIPreviewTarget initWithContainer:center:]([UIPreviewTarget alloc], "initWithContainer:center:", v12, v19, v21);
        double v23 = objc_opt_new();
        CGFloat v26 = [[UITargetedPreview alloc] initWithView:v10 parameters:v23 target:v22];

        goto LABEL_7;
      }
    }
    CGFloat v26 = 0;
    goto LABEL_12;
  }
  BOOL v3 = [(_UIPreviewInteractionClickImpl *)self previewInteraction];
  id v4 = [(_UIPreviewInteractionClickImpl *)self view];
  [v3 locationInCoordinateSpace:v4];
  double v6 = v5;
  double v8 = v7;

  interactionEffect = [(_UIPreviewInteractionClickImpl *)self privateDelegate];
  uint64_t v10 = [(_UIPreviewInteractionClickImpl *)self previewInteraction];
  objc_msgSend(interactionEffect, "_previewInteraction:targetedPreviewForPreviewingAtLocation:", v10, v6, v8);
  CGFloat v26 = (UITargetedPreview *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  if (!v26)
  {
    v25 = 0;
    goto LABEL_13;
  }
  CGFloat v24 = +[_UIClickHighlightInteractionEffect effectWithPreview:v26 continuingFromPreview:0];
  interactionEffect = self->_interactionEffect;
  self->_interactionEffect = v24;
LABEL_12:

  v25 = v26;
LABEL_13:
}

- (void)_endInteractionEffectIfNeeded
{
  BOOL v3 = [(_UIPreviewInteractionClickImpl *)self interactionEffect];

  if (v3)
  {
    id v6 = (id)objc_opt_new();
    [v6 setProgress:0.0];
    [v6 setEnded:1];
    id v4 = [(_UIPreviewInteractionClickImpl *)self interactionEffect];
    [v4 interaction:self didChangeWithContext:v6];

    interactionEffect = self->_interactionEffect;
    self->_interactionEffect = 0;
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5 = a3;
  id v6 = [(_UIPreviewInteractionClickImpl *)self exclusionRelationshipGestureRecognizer];

  return v6 == v5;
}

- (UIPreviewInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIPreviewInteractionDelegate *)WeakRetained;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (_UIPreviewInteractionTouchForceProviding)touchForceProvider
{
  return self->_touchForceProvider;
}

- (UIPreviewInteraction)previewInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewInteraction);
  return (UIPreviewInteraction *)WeakRetained;
}

- (void)setPreviewInteraction:(id)a3
{
}

- (UIInteractionEffect)interactionEffect
{
  return self->_interactionEffect;
}

- (void)setInteractionEffect:(id)a3
{
}

- (_UIClickInteraction)previewClickInteraction
{
  return self->_previewClickInteraction;
}

- (void)setPreviewClickInteraction:(id)a3
{
}

- (_UIClickInteraction)commitClickInteraction
{
  return self->_commitClickInteraction;
}

- (void)setCommitClickInteraction:(id)a3
{
}

- (_UIRelationshipGestureRecognizer)exclusionRelationshipGestureRecognizer
{
  return self->_exclusionRelationshipGestureRecognizer;
}

- (void)setExclusionRelationshipGestureRecognizer:(id)a3
{
}

- (_UIPreviewInteractionPresentationAssistant)presentationAssistant
{
  return self->_presentationAssistant;
}

- (void)setPresentationAssistant:(id)a3
{
}

- (_UIPreviewInteractionHighlighter)highlighter
{
  return self->_highlighter;
}

- (void)setHighlighter:(id)a3
{
}

- (UIDragInteraction)associatedDragInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedDragInteraction);
  return (UIDragInteraction *)WeakRetained;
}

- (void)setAssociatedDragInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_associatedDragInteraction);
  objc_storeStrong((id *)&self->_highlighter, 0);
  objc_storeStrong((id *)&self->_presentationAssistant, 0);
  objc_storeStrong((id *)&self->_exclusionRelationshipGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_commitClickInteraction, 0);
  objc_storeStrong((id *)&self->_previewClickInteraction, 0);
  objc_storeStrong((id *)&self->_interactionEffect, 0);
  objc_destroyWeak((id *)&self->_previewInteraction);
  objc_storeStrong((id *)&self->_touchForceProvider, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_privateDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end