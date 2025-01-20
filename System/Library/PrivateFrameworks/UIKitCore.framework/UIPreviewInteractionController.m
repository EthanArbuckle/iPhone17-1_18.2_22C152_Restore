@interface UIPreviewInteractionController
- (BOOL)_previewingIsPossibleForView:(id)a3;
- (BOOL)_usesPreviewInteraction;
- (BOOL)_usesPreviewPresentationController;
- (BOOL)_viewControllerIsChildOfExpandedSplitViewController:(id)a3;
- (BOOL)configureRevealTransformSourceViewSnapshotSuppressionFromLocation:(CGPoint)a3 inView:(id)a4;
- (BOOL)didSendDelegateWillDismissViewController;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)previewInteractionShouldBegin:(id)a3;
- (BOOL)startInteractivePreviewAtLocation:(CGPoint)a3 inView:(id)a4;
- (BOOL)startInteractivePreviewWithGestureRecognizer:(id)a3;
- (BOOL)statusBarWasHidden;
- (CGPoint)location;
- (NSArray)gestureRecognizers;
- (UIForcePresentationController)currentPresentationController;
- (UIForceTransitioningDelegate)currentTransitionDelegate;
- (UIInteractionProgress)interactionProgressForCommit;
- (UIInteractionProgress)interactionProgressForPresentation;
- (UIPanGestureRecognizer)modalPanGestureRecognizer;
- (UIPreviewInteraction)previewInteraction;
- (UIPreviewInteractionController)init;
- (UIPreviewInteractionController)initWithView:(id)a3;
- (UIPreviewInteractionControllerDelegate)delegate;
- (UIView)sourceView;
- (UIViewController)currentPreviewViewController;
- (UIViewController)presentingViewController;
- (UIViewControllerPreviewing_Internal)previewingContext;
- (UIWindow)windowForPreviewPresentation;
- (_UIDeepPressAnalyzer)deepPressAnalyzer;
- (_UIPreviewGestureRecognizer)previewGestureRecognizer;
- (_UIRevealGestureRecognizer)revealGestureRecognizer;
- (_UIStatesFeedbackGenerator)feedbackGenerator;
- (_UITouchesObservingGestureRecognizer)touchObservingGestureRecognizer;
- (id)_transitionDelegateForPreviewViewController:(id)a3 atPosition:(CGPoint)a4 inView:(id)a5;
- (id)currentCommitTransition;
- (void)_activateFeedback;
- (void)_activateFeedbackIfNeeded;
- (void)_configureCommitInteractionProgressForView:(id)a3;
- (void)_deactivateFeedbackIfNeeded;
- (void)_finalizeInteractivePreview;
- (void)_gestureRecognizerFailed:(id)a3;
- (void)_handleRevealGesture:(id)a3;
- (void)_handleTouchObservingGesture:(id)a3;
- (void)_previewPresentationControllerDidScheduleDismiss;
- (void)_resetCustomPresentationHooks;
- (void)_setStatusBarHidden:(BOOL)a3;
- (void)_turnOffFeedbackGenerator;
- (void)_turnOnFeedbackGenerator;
- (void)cancelInteractivePreview;
- (void)commitInteractivePreview;
- (void)configureRevealTransformWithInteractionProgress:(id)a3 forLocation:(CGPoint)a4 inView:(id)a5 containerView:(id)a6;
- (void)dealloc;
- (void)forcePresentationController:(id)a3 didSelectMenuItem:(id)a4;
- (void)forcePresentationControllerDidDismiss:(id)a3;
- (void)forcePresentationControllerWillDismiss:(id)a3;
- (void)forcePresentationTransitionWillBegin:(id)a3;
- (void)initGestureRecognizers;
- (void)interactionProgress:(id)a3 didEnd:(BOOL)a4;
- (void)interactionProgressDidUpdate:(id)a3;
- (void)previewInteraction:(id)a3 didUpdateCommitTransition:(double)a4 ended:(BOOL)a5;
- (void)previewInteraction:(id)a3 didUpdatePreviewTransition:(double)a4 ended:(BOOL)a5;
- (void)setCurrentCommitTransition:(id)a3;
- (void)setCurrentPresentationController:(id)a3;
- (void)setCurrentPreviewViewController:(id)a3;
- (void)setCurrentTransitionDelegate:(id)a3;
- (void)setDeepPressAnalyzer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidSendDelegateWillDismissViewController:(BOOL)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setInteractionProgressForCommit:(id)a3;
- (void)setInteractionProgressForPresentation:(id)a3;
- (void)setLocation:(CGPoint)a3;
- (void)setModalPanGestureRecognizer:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setPreviewGestureRecognizer:(id)a3;
- (void)setPreviewInteraction:(id)a3;
- (void)setPreviewingContext:(id)a3;
- (void)setRevealGestureRecognizer:(id)a3;
- (void)setSourceView:(id)a3;
- (void)setStatusBarWasHidden:(BOOL)a3;
- (void)setTouchObservingGestureRecognizer:(id)a3;
- (void)setWindowForPreviewPresentation:(id)a3;
@end

@implementation UIPreviewInteractionController

- (UIPreviewInteractionController)init
{
  return [(UIPreviewInteractionController *)self initWithView:0];
}

- (UIPreviewInteractionController)initWithView:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIPreviewInteractionController;
  v5 = [(UIPreviewInteractionController *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_sourceView, v4);
    if (v4)
    {
      v7 = [[UIPreviewInteraction alloc] initWithView:v4];
      previewInteraction = v6->_previewInteraction;
      v6->_previewInteraction = v7;

      [(UIPreviewInteraction *)v6->_previewInteraction setDelegate:v6];
    }
    [(UIPreviewInteractionController *)v6 initGestureRecognizers];
    v9 = v6;
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(UIPreviewInteractionController *)self _deactivateFeedbackIfNeeded];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(UIPreviewInteractionController *)self gestureRecognizers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v9 = [v8 view];

        if (v9)
        {
          v10 = [v8 view];
          [v10 removeGestureRecognizer:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  v11.receiver = self;
  v11.super_class = (Class)UIPreviewInteractionController;
  [(UIPreviewInteractionController *)&v11 dealloc];
}

- (NSArray)gestureRecognizers
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v3 = [(UIPreviewInteractionController *)self touchObservingGestureRecognizer];
  uint64_t v4 = [(UIPreviewInteractionController *)self revealGestureRecognizer];
  v8[1] = v4;
  uint64_t v5 = [(UIPreviewInteractionController *)self previewGestureRecognizer];
  v8[2] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];

  return (NSArray *)v6;
}

- (BOOL)_viewControllerIsChildOfExpandedSplitViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 parentViewController];
    if (v6)
    {
      objc_opt_class();
      BOOL v7 = (objc_opt_isKindOfClass() & 1) != 0 && ![v6 _isCollapsed]
        || [(UIPreviewInteractionController *)self _viewControllerIsChildOfExpandedSplitViewController:v6];
    }
    else
    {
      v8 = [v5 presentationController];
      v9 = v8;
      if (v8 && ([v8 shouldPresentInFullscreen] & 1) == 0)
      {
        v10 = [v9 presentingViewController];
        BOOL v7 = [(UIPreviewInteractionController *)self _viewControllerIsChildOfExpandedSplitViewController:v10];
      }
      else
      {
        BOOL v7 = 0;
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_previewingIsPossibleForView:(id)a3
{
  id v4 = [a3 _viewControllerForAncestor];
  LOBYTE(self) = ![(UIPreviewInteractionController *)self _viewControllerIsChildOfExpandedSplitViewController:v4];

  return (char)self;
}

- (BOOL)startInteractivePreviewAtLocation:(CGPoint)a3 inView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [(UIPreviewInteractionController *)self currentPreviewViewController];

  if (v9
    || (-[UIPreviewInteractionController setLocation:](self, "setLocation:", x, y),
        ![(UIPreviewInteractionController *)self _previewingIsPossibleForView:v8]))
  {
    BOOL v13 = 0;
    goto LABEL_27;
  }
  [(UIPreviewInteractionController *)self _activateFeedback];
  v10 = [(UIPreviewInteractionController *)self delegate];
  id v61 = 0;
  objc_super v11 = objc_msgSend(v10, "previewInteractionController:viewControllerForPreviewingAtPosition:inView:presentingViewController:", self, v8, &v61, x, y);
  id v12 = v61;
  BOOL v13 = v11 != 0;
  if (v11)
  {
    long long v14 = [v11 presentingViewController];
    v57 = v12;
    if (v14 || ([v11 isBeingPresented] & 1) != 0)
    {
    }
    else if (([v11 isBeingDismissed] & 1) == 0)
    {
      goto LABEL_7;
    }
    v50 = [MEMORY[0x1E4F28B00] currentHandler];
    [v50 handleFailureInMethod:a2 object:self file:@"UIPreviewInteractionController.m" lineNumber:216 description:@"The view controller returned from -previewViewControllerForPosition:inSourceView: must not already be presented"];

LABEL_7:
    [v11 _setOverrideUseCustomPresentation:1];
    long long v15 = -[UIPreviewInteractionController _transitionDelegateForPreviewViewController:atPosition:inView:](self, "_transitionDelegateForPreviewViewController:atPosition:inView:", v11, v8, x, y);
    [(UIPreviewInteractionController *)self setCurrentTransitionDelegate:v15];
    [v11 _setOverrideTransitioningDelegate:v15];

    v16 = [v11 presentationController];
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v18 = [(UIPreviewInteractionController *)self feedbackGenerator];

    if (has_internal_diagnostics)
    {
      if (v18)
      {
LABEL_9:
        v19 = [(UIPreviewInteractionController *)self feedbackGenerator];
        [v16 setFeedbackGenerator:v19];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v16 setPreviewInteractionController:self];
          v20 = [(UIPreviewInteractionController *)self previewingContext];
          [v16 setPreviewingContext:v20];
        }
        [v8 bounds];
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;
        if (objc_opt_respondsToSelector())
        {
          [v10 sourceRect];
          double v22 = v29;
          double v24 = v30;
          double v26 = v31;
          double v28 = v32;
        }
        objc_msgSend(v16, "setSourceRect:", v22, v24, v26, v28);
        [v16 setSourceView:v8];
        v33 = [(UIPreviewInteractionController *)self revealGestureRecognizer];
        [v16 setPanningGestureRecognizer:v33];

        if ([(UIPreviewInteractionController *)self _usesPreviewInteraction])
        {
          v34 = objc_alloc_init(_UIPICSimpleInteractionProgress);
          [(UIPreviewInteractionController *)self setInteractionProgressForPresentation:v34];
        }
        [(UIPreviewInteractionController *)self setCurrentPreviewViewController:v11];
        [(UIPreviewInteractionController *)self setCurrentPresentationController:v16];
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "previewInteractionController:willPresentViewController:forPosition:inSourceView:", self, v11, v8, x, y);
        }
        -[UIPreviewInteractionController _configureCommitInteractionProgressForView:](self, "_configureCommitInteractionProgressForView:", v8, v10);
        v35 = [(UIPreviewInteractionController *)self currentPresentationController];
        [v35 setForcePresentationControllerDelegate:self];

        BOOL v36 = -[UIPreviewInteractionController configureRevealTransformSourceViewSnapshotSuppressionFromLocation:inView:](self, "configureRevealTransformSourceViewSnapshotSuppressionFromLocation:inView:", v8, x, y);
        BOOL v37 = [(UIPreviewInteractionController *)self _usesPreviewPresentationController];
        v38 = [(UIPreviewInteractionController *)self windowForPreviewPresentation];
        v39 = [v38 windowScene];
        [v39 _setReachabilitySupported:0 forReason:@"UIPreviewInteractionController startInteractivePreviewAtLocation"];

        if (!v37)
        {
          v40 = [v57 view];
          v41 = [v40 window];
          [(UIPreviewInteractionController *)self setWindowForPreviewPresentation:v41];

          v42 = [(UIPreviewInteractionController *)self windowForPreviewPresentation];
          [v42 beginDisablingInterfaceAutorotation];

          v43 = [(UIPreviewInteractionController *)self windowForPreviewPresentation];
          v44 = __UIStatusBarManagerForWindow(v43);
          uint64_t v45 = [v44 isStatusBarHidden];

          [(UIPreviewInteractionController *)self setStatusBarWasHidden:v45];
        }
        if (!v36)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v16 _prepareInitialSourceViewSnapshot];
          }
        }
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __75__UIPreviewInteractionController_startInteractivePreviewAtLocation_inView___block_invoke;
        v58[3] = &unk_1E52DC3D0;
        v58[4] = self;
        BOOL v60 = v37;
        id v12 = v57;
        id v59 = v57;
        [v59 presentViewController:v11 animated:1 completion:v58];
        v46 = [(UIPreviewInteractionController *)self delegate];
        char v47 = objc_opt_respondsToSelector();

        if (v47)
        {
          v48 = [(UIPreviewInteractionController *)self delegate];
          [v48 previewInteractionController:self willPresentViewController:v11];
        }
        v10 = v56;
        goto LABEL_25;
      }
      v51 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
      {
LABEL_36:

        goto LABEL_9;
      }
      v52 = (objc_class *)objc_opt_class();
      v53 = NSStringFromClass(v52);
      *(_DWORD *)buf = 138412290;
      v63 = v53;
      _os_log_fault_impl(&dword_1853B0000, v51, OS_LOG_TYPE_FAULT, "The feedbackGenerator in %@ should not be nil!", buf, 0xCu);
    }
    else
    {
      if (v18) {
        goto LABEL_9;
      }
      v54 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &startInteractivePreviewAtLocation_inView____s_category)+ 8);
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      v51 = v54;
      v55 = (objc_class *)objc_opt_class();
      v53 = NSStringFromClass(v55);
      *(_DWORD *)buf = 138412290;
      v63 = v53;
      _os_log_impl(&dword_1853B0000, v51, OS_LOG_TYPE_ERROR, "The feedbackGenerator in %@ should not be nil!", buf, 0xCu);
    }

    goto LABEL_36;
  }
LABEL_25:

LABEL_27:
  return v13;
}

void __75__UIPreviewInteractionController_startInteractivePreviewAtLocation_inView___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) currentPreviewViewController];
  v3 = [v2 presentingViewController];

  if (v3 && !*(unsigned char *)(a1 + 48))
  {
    if (([*(id *)(a1 + 32) statusBarWasHidden] & 1) == 0) {
      [*(id *)(a1 + 32) _setStatusBarHidden:1];
    }
    id v5 = [*(id *)(a1 + 40) view];
    id v4 = [v5 keyboardSceneDelegate];
    [v4 forceOrderOutAutomaticAnimated:1];
  }
}

- (BOOL)configureRevealTransformSourceViewSnapshotSuppressionFromLocation:(CGPoint)a3 inView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v8 = [(UIPreviewInteractionController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int v9 = objc_msgSend(v8, "previewInteractionController:shouldUseStandardRevealTransformForPreviewingAtLocation:inView:", self, v7, x, y);
    v10 = [(UIPreviewInteractionController *)self currentPresentationController];
    char v11 = v9 ^ 1;
    objc_msgSend(v10, "set_sourceViewSnapshotAndScaleTransformSuppressed:", v9 ^ 1u);
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)configureRevealTransformWithInteractionProgress:(id)a3 forLocation:(CGPoint)a4 inView:(id)a5 containerView:(id)a6
{
  double y = a4.y;
  double x = a4.x;
  id v14 = a3;
  id v11 = a5;
  id v12 = a6;
  BOOL v13 = [(UIPreviewInteractionController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v13, "previewInteractionController:interactionProgress:forRevealAtLocation:inSourceView:containerView:", self, v14, v11, v12, x, y);
  }
}

- (BOOL)startInteractivePreviewWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  id v5 = [v4 view];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  LOBYTE(self) = -[UIPreviewInteractionController startInteractivePreviewAtLocation:inView:](self, "startInteractivePreviewAtLocation:inView:", v5, v7, v9);
  return (char)self;
}

- (void)cancelInteractivePreview
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(UIPreviewInteractionController *)self currentPreviewViewController];
  id v4 = [v3 transitionCoordinator];
  if ([v4 isInteractive])
  {
    id v5 = [(UIPreviewInteractionController *)self currentPresentationController];
    double v6 = [v5 _currentInteractionController];

    LODWORD(v5) = os_variant_has_internal_diagnostics();
    char v7 = [v6 conformsToProtocol:&unk_1ED464950];
    if (v5)
    {
      if (v7)
      {
LABEL_4:
        if (objc_msgSend(v6, "conformsToProtocol:", &unk_1ED464950, *(_OWORD *)v17))
        {
          if (objc_opt_respondsToSelector())
          {
            [v6 cancelInteractiveTransition:&__block_literal_global_424];
          }
          else if (objc_opt_respondsToSelector())
          {
            [v6 cancelInteractiveTransition];
          }
          else if (os_variant_has_internal_diagnostics())
          {
            v16 = __UIFaultDebugAssertLog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)uint64_t v17 = 138412290;
              *(void *)&v17[4] = v6;
              _os_log_fault_impl(&dword_1853B0000, v16, OS_LOG_TYPE_FAULT, "Interaction controller %@ does not implement -cancelInteractiveTransition or -cancelInteractiveTransition:", v17, 0xCu);
            }
          }
          else
          {
            id v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB2622A0) + 8);
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)uint64_t v17 = 138412290;
              *(void *)&v17[4] = v6;
              _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Interaction controller %@ does not implement -cancelInteractiveTransition or -cancelInteractiveTransition:", v17, 0xCu);
            }
          }
        }

        goto LABEL_19;
      }
      id v12 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)uint64_t v17 = 138412290;
        *(void *)&v17[4] = objc_opt_class();
        id v13 = *(id *)&v17[4];
        _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "Trying to cancel a preview interaction controller of class %@ that does not conform to UIForceInteractionController protocol", v17, 0xCu);
      }
    }
    else
    {
      if (v7) {
        goto LABEL_4;
      }
      id v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_1185) + 8);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_4;
      }
      id v12 = v14;
      *(_DWORD *)uint64_t v17 = 138412290;
      *(void *)&v17[4] = objc_opt_class();
      id v15 = *(id *)&v17[4];
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Trying to cancel a preview interaction controller of class %@ that does not conform to UIForceInteractionController protocol", v17, 0xCu);
    }
    goto LABEL_4;
  }
  double v8 = [v3 presentingViewController];
  if (v8)
  {
    double v9 = v8;
    if (v4)
    {
      char v10 = [v4 isCancelled];

      if (v10) {
        goto LABEL_19;
      }
    }
    else
    {
    }
    [v3 dismissViewControllerAnimated:1 completion:0];
    [(UIPreviewInteractionController *)self _previewPresentationControllerDidScheduleDismiss];
  }
LABEL_19:
}

- (void)commitInteractivePreview
{
  v3 = [(UIPreviewInteractionController *)self currentPreviewViewController];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 transitionCoordinator];
    if (!v5)
    {
      double v6 = [(UIPreviewInteractionController *)self currentPresentationController];
      int v7 = [v6 _canCommitPresentation];

      if (v7)
      {
        self->_isCommitting = 1;
        double v8 = [(UIPreviewInteractionController *)self currentPresentationController];
        char v9 = objc_opt_respondsToSelector();

        if (v9)
        {
          char v10 = [(UIPreviewInteractionController *)self currentPresentationController];
          [v10 _willCommitPresentation];
        }
        if (![(UIPreviewInteractionController *)self _usesPreviewInteraction])
        {
          id v11 = [(UIPreviewInteractionController *)self feedbackGenerator];
          [v11 transitionToState:@"commit" ended:1];
        }
        id v12 = [(UIPreviewInteractionController *)self delegate];
        id v13 = [v4 presentingViewController];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __58__UIPreviewInteractionController_commitInteractivePreview__block_invoke;
        v16[3] = &unk_1E52D9F70;
        v16[4] = self;
        id v14 = +[_UIPreviewTransitionController performCommitTransitionWithDelegate:v12 forViewController:v13 previewViewController:v4 previewInteractionController:self completion:v16];
        [(UIPreviewInteractionController *)self setCurrentCommitTransition:v14];

        id v15 = +[_UIStatistics previewInteractionPopCount];
        [v15 incrementValueBy:1];

        _UIPowerLogPopOccured();
      }
    }
  }
}

uint64_t __58__UIPreviewInteractionController_commitInteractivePreview__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  return [*(id *)(a1 + 32) setCurrentCommitTransition:0];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UIPreviewInteractionController *)self touchObservingGestureRecognizer];

  if (v8 != v6)
  {
    char v9 = [(UIPreviewInteractionController *)self delegate];
    id v10 = [(UIPreviewInteractionController *)self revealGestureRecognizer];

    if (v10 != v6) {
      goto LABEL_3;
    }
    if (_UIPreviewInteractionIsTextGestureRecognizer(v7)) {
      goto LABEL_12;
    }
    id v13 = [(UIPreviewInteractionController *)self previewGestureRecognizer];

    if (v13 == v7) {
      goto LABEL_12;
    }
    char v12 = 1;
    if ([v7 _isGestureType:1]) {
      goto LABEL_13;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_3:
      id v11 = [(UIPreviewInteractionController *)self previewGestureRecognizer];

      if (v11 != v6)
      {
LABEL_4:
        char v12 = 0;
LABEL_13:

        goto LABEL_14;
      }
      if (_UIPreviewInteractionIsTextGestureRecognizer(v7))
      {
LABEL_12:
        char v12 = 1;
        goto LABEL_13;
      }
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_4;
      }
    }
    char v12 = [v9 previewInteractionController:self shouldStartPreviewingSimultaneouslyWithGestureRecognizer:v7];
    goto LABEL_13;
  }
  char v12 = 1;
LABEL_14:

  return v12;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(UIPreviewInteractionController *)self revealGestureRecognizer];

  if (v5 == v4) {
    [(UIPreviewInteractionController *)self _deactivateFeedbackIfNeeded];
  }
  id v6 = [(UIPreviewInteractionController *)self previewGestureRecognizer];

  if (v6 == v4)
  {
    id v7 = [(id)UIApp _gestureEnvironment];
    id v8 = [(UIPreviewInteractionController *)self revealGestureRecognizer];
    v10[0] = v8;
    char v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    -[UIGestureEnvironment _cancelGestureRecognizers:]((uint64_t)v7, v9);
  }
}

- (void)interactionProgressDidUpdate:(id)a3
{
  id v13 = a3;
  id v4 = [(UIPreviewInteractionController *)self interactionProgressForCommit];

  id v5 = v13;
  if (v4 == v13)
  {
    [v13 percentComplete];
    double v7 = v6;
    id v8 = [(UIPreviewInteractionController *)self currentPresentationController];
    int v9 = [v8 _canCommitPresentation];

    if (v7 >= 1.0 && v9)
    {
      [(UIPreviewInteractionController *)self setInteractionProgressForCommit:0];
      [(UIPreviewInteractionController *)self commitInteractivePreview];
    }
    else
    {
      [v13 percentComplete];
      if (v10 > 1.0) {
        double v10 = 1.0;
      }
      double v11 = fmax(v10, 0.0);
      char v12 = [(UIPreviewInteractionController *)self feedbackGenerator];
      [v12 transitionToState:@"commit" updated:v11];
    }
    id v5 = v13;
  }
}

- (void)interactionProgress:(id)a3 didEnd:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(UIPreviewInteractionController *)self interactionProgressForCommit];

  if (v7 == v6 && v4)
  {
    [(UIPreviewInteractionController *)self commitInteractivePreview];
  }
}

- (void)forcePresentationTransitionWillBegin:(id)a3
{
  id v4 = a3;
  id v12 = [(UIPreviewInteractionController *)self interactionProgressForPresentation];
  [(UIPreviewInteractionController *)self location];
  double v6 = v5;
  double v8 = v7;
  int v9 = [(UIPreviewInteractionController *)self currentPresentationController];
  double v10 = [v9 sourceView];
  double v11 = [v4 _revealContainerView];

  -[UIPreviewInteractionController configureRevealTransformWithInteractionProgress:forLocation:inView:containerView:](self, "configureRevealTransformWithInteractionProgress:forLocation:inView:containerView:", v12, v10, v11, v6, v8);
}

- (void)forcePresentationControllerWillDismiss:(id)a3
{
  [(UIPreviewInteractionController *)self _resetCustomPresentationHooks];
  id v4 = [(UIPreviewInteractionController *)self currentPresentationController];
  [v4 setPanningGestureRecognizer:0];

  double v5 = [(UIPreviewInteractionController *)self revealGestureRecognizer];
  [v5 setEnabled:0];

  if (![(UIPreviewInteractionController *)self _usesPreviewPresentationController]
    && ![(UIPreviewInteractionController *)self statusBarWasHidden])
  {
    [(UIPreviewInteractionController *)self _setStatusBarHidden:0];
  }
}

- (void)forcePresentationControllerDidDismiss:(id)a3
{
  id v4 = +[_UIStatistics previewInteractionPeekDuration];
  double v5 = [(UIPreviewInteractionController *)self currentPresentationController];
  [v4 recordTimingForObject:v5];

  _UIPowerLogPeekEnded();
  id v7 = [(UIPreviewInteractionController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v6 = [(UIPreviewInteractionController *)self currentPreviewViewController];
    [v7 previewInteractionController:self didDismissViewController:v6 committing:self->_isCommitting];
  }
  [(UIPreviewInteractionController *)self _finalizeInteractivePreview];
}

- (void)forcePresentationController:(id)a3 didSelectMenuItem:(id)a4
{
  id v6 = a4;
  double v5 = [(UIPreviewInteractionController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 previewInteractionController:self didSelectMenuItem:v6];
  }
}

- (void)initGestureRecognizers
{
  v3 = objc_alloc_init(_UIRevealGestureRecognizer);
  [(UIGestureRecognizer *)v3 setName:@"Reveal mk1"];
  [(UILongPressGestureRecognizer *)v3 setMinimumPressDuration:0.1];
  [(UILongPressGestureRecognizer *)v3 setAllowableMovement:15.0];
  [(UIGestureRecognizer *)v3 setRequiredPreviewForceState:1];
  [(UIGestureRecognizer *)v3 setAllowedTouchTypes:&unk_1ED3F0CD0];
  [(_UIRevealGestureRecognizer *)v3 setDelegate:self];
  [(UIGestureRecognizer *)v3 addTarget:self action:sel__handleRevealGesture_];
  [(UIPreviewInteractionController *)self setRevealGestureRecognizer:v3];

  id v4 = objc_alloc_init(_UIPreviewInteractionTouchObservingGestureRecognizer);
  [(UIGestureRecognizer *)v4 setName:@"TouchObserver mk1"];
  [(UIGestureRecognizer *)v4 setAllowedTouchTypes:&unk_1ED3F0CD0];
  [(UIGestureRecognizer *)v4 setCancelsTouchesInView:0];
  [(UIGestureRecognizer *)v4 setDelegate:self];
  [(UIGestureRecognizer *)v4 addTarget:self action:sel__handleTouchObservingGesture_];
  [(UIPreviewInteractionController *)self setTouchObservingGestureRecognizer:v4];

  double v5 = objc_alloc_init(_UIPreviewGestureRecognizer);
  [(UIGestureRecognizer *)v5 setAllowedTouchTypes:&unk_1ED3F0CD0];
  [(UIGestureRecognizer *)v5 setRequiredPreviewForceState:2];
  [(UILongPressGestureRecognizer *)v5 setMinimumPressDuration:0.1];
  [(UILongPressGestureRecognizer *)v5 setAllowableMovement:15.0];
  [(UIGestureRecognizer *)v5 setDelegate:self];
  [(UIPreviewInteractionController *)self setPreviewGestureRecognizer:v5];

  if (![(UIPreviewInteractionController *)self _usesPreviewInteraction])
  {
    id v6 = [UIPreviewForceInteractionProgress alloc];
    id v7 = [(UIPreviewInteractionController *)self beginPreviewGestureRecognizer];
    double v8 = [(UIPreviewForceInteractionProgress *)v6 initWithGestureRecognizer:v7];

    [(UIPreviewForceInteractionProgress *)v8 setCompletesAtTargetState:1];
    [(UIPreviewInteractionController *)self setInteractionProgressForPresentation:v8];
  }
}

- (void)_handleRevealGesture:(id)a3
{
  id v8 = a3;
  if ([v8 isEnabled])
  {
    if ([v8 state] == 1)
    {
      if (![(UIPreviewInteractionController *)self _usesPreviewInteraction])
      {
        if ([(UIPreviewInteractionController *)self startInteractivePreviewWithGestureRecognizer:v8])
        {
          [(UIPreviewInteractionController *)self _turnOnFeedbackGenerator];
        }
        else
        {
          [v8 setEnabled:0];
          [v8 setEnabled:1];
          id v6 = [(UIPreviewInteractionController *)self previewGestureRecognizer];
          [v6 setEnabled:0];

          id v7 = [(UIPreviewInteractionController *)self previewGestureRecognizer];
          [v7 setEnabled:1];
        }
      }
    }
    else if (([v8 state] == 3 || objc_msgSend(v8, "state") == 4 || objc_msgSend(v8, "state") == 5) {
           && ![(UIPreviewInteractionController *)self _usesPreviewInteraction])
    }
    {
      id v4 = [(UIPreviewInteractionController *)self currentPresentationController];
      int v5 = [v4 _canDismissPresentation];

      if (v5) {
        [(UIPreviewInteractionController *)self cancelInteractivePreview];
      }
    }
  }
}

- (void)_handleTouchObservingGesture:(id)a3
{
  id v4 = a3;
  if (![(UIPreviewInteractionController *)self _usesPreviewInteraction])
  {
    if ([v4 state] == 1 || objc_msgSend(v4, "state") == 2) {
      [(UIPreviewInteractionController *)self _activateFeedbackIfNeeded];
    }
    if ([v4 state] == 3 || objc_msgSend(v4, "state") == 4 || objc_msgSend(v4, "state") == 5) {
      [(UIPreviewInteractionController *)self _deactivateFeedbackIfNeeded];
    }
  }
}

- (void)_configureCommitInteractionProgressForView:(id)a3
{
  id v4 = a3;
  int v5 = [(UIPreviewInteractionController *)self interactionProgressForCommit];
  [v5 removeProgressObserver:self];

  id v6 = [UIPreviewForceInteractionProgress alloc];
  id v7 = [v4 window];

  id v8 = [(UIPreviewForceInteractionProgress *)v6 initWithView:v7 targetState:3];
  [(UIPreviewForceInteractionProgress *)v8 setCompletesAtTargetState:0];
  [(UIInteractionProgress *)v8 addProgressObserver:self];
  [(UIPreviewInteractionController *)self setInteractionProgressForCommit:v8];
}

- (void)_setStatusBarHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(id)UIApp statusBar];
  if ([v4 isHidden] != v3) {
    [v4 setHidden:v3 animated:1];
  }
}

- (id)_transitionDelegateForPreviewViewController:(id)a3 atPosition:(CGPoint)a4 inView:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  double v11 = [(UIPreviewInteractionController *)self delegate];
  id v12 = [v9 transitioningDelegate];
  int v13 = [v12 conformsToProtocol:&unk_1ED464F30];

  if (v13)
  {
    uint64_t v14 = [v9 transitioningDelegate];
    goto LABEL_5;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v14 = objc_msgSend(v11, "previewInteractionController:transitioningDelegateForPreviewingAtPosition:inView:", self, v10, x, y);
LABEL_5:
    id v15 = (_UIPreviewTransitionDelegate *)v14;
    if (v14) {
      goto LABEL_7;
    }
  }
  id v15 = objc_alloc_init(_UIPreviewTransitionDelegate);
LABEL_7:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = v15;
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    uint64_t v18 = [(UIPreviewInteractionController *)self feedbackGenerator];

    if (has_internal_diagnostics)
    {
      if (v18)
      {
LABEL_10:
        v19 = [(UIPreviewInteractionController *)self feedbackGenerator];
        [(_UIPreviewTransitionDelegate *)v16 setFeedbackGenerator:v19];

        goto LABEL_11;
      }
      double v24 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
LABEL_24:

        goto LABEL_10;
      }
      double v25 = (objc_class *)objc_opt_class();
      double v26 = NSStringFromClass(v25);
      int v29 = 138412290;
      double v30 = v26;
      _os_log_fault_impl(&dword_1853B0000, v24, OS_LOG_TYPE_FAULT, "The feedbackGenerator in %@ should not be nil!", (uint8_t *)&v29, 0xCu);
    }
    else
    {
      if (v18) {
        goto LABEL_10;
      }
      double v27 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_transitionDelegateForPreviewViewController_atPosition_inView____s_category)+ 8);
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      double v24 = v27;
      double v28 = (objc_class *)objc_opt_class();
      double v26 = NSStringFromClass(v28);
      int v29 = 138412290;
      double v30 = v26;
      _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "The feedbackGenerator in %@ should not be nil!", (uint8_t *)&v29, 0xCu);
    }

    goto LABEL_24;
  }
LABEL_11:
  v20 = [(UIPreviewInteractionController *)self interactionProgressForPresentation];
  if (([v20 didEnd] & 1) != 0 || (objc_msgSend(v20, "percentComplete"), v21 >= 1.0))
  {
    [(_UIPreviewTransitionDelegate *)v15 setInteractionProgressForPresentation:0];
  }
  else
  {
    double v22 = [(UIPreviewInteractionController *)self interactionProgressForPresentation];
    [(_UIPreviewTransitionDelegate *)v15 setInteractionProgressForPresentation:v22];
  }
  return v15;
}

- (void)_previewPresentationControllerDidScheduleDismiss
{
  if (![(UIPreviewInteractionController *)self didSendDelegateWillDismissViewController])
  {
    id v4 = [(UIPreviewInteractionController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      BOOL v3 = [(UIPreviewInteractionController *)self currentPreviewViewController];
      [v4 previewInteractionController:self willDismissViewController:v3];
    }
    [(UIPreviewInteractionController *)self setDidSendDelegateWillDismissViewController:1];
  }
}

- (void)_resetCustomPresentationHooks
{
  BOOL v3 = [(UIPreviewInteractionController *)self currentPreviewViewController];
  [v3 _setOverrideUseCustomPresentation:0];

  id v4 = [(UIPreviewInteractionController *)self currentPreviewViewController];
  [v4 _setOverrideTransitioningDelegate:0];
}

- (void)_finalizeInteractivePreview
{
  [(UIPreviewInteractionController *)self setDidSendDelegateWillDismissViewController:0];
  BOOL v3 = [(UIPreviewInteractionController *)self windowForPreviewPresentation];
  [v3 endDisablingInterfaceAutorotation];

  [(UIPreviewInteractionController *)self setWindowForPreviewPresentation:0];
  id v4 = [(UIPreviewInteractionController *)self revealGestureRecognizer];
  [v4 setEnabled:1];

  int v5 = [(UIPreviewInteractionController *)self windowForPreviewPresentation];
  id v6 = [v5 windowScene];
  [v6 _setReachabilitySupported:1 forReason:@"UIPreviewInteractionController _finalizeInteractivePreview"];

  [(UIPreviewInteractionController *)self _resetCustomPresentationHooks];
  [(UIPreviewInteractionController *)self setCurrentPreviewViewController:0];
  [(UIPreviewInteractionController *)self setCurrentPresentationController:0];
  [(UIPreviewInteractionController *)self setCurrentTransitionDelegate:0];
  [(UIPreviewInteractionController *)self setInteractionProgressForCommit:0];
  if ([(UIPreviewInteractionController *)self _usesPreviewInteraction]) {
    [(UIPreviewInteractionController *)self setInteractionProgressForPresentation:0];
  }
  id v7 = [(UIPreviewInteractionController *)self previewInteraction];
  [v7 cancelInteraction];

  id v8 = [(UIPreviewInteractionController *)self modalPanGestureRecognizer];

  if (v8)
  {
    id v9 = [(UIPreviewInteractionController *)self modalPanGestureRecognizer];
    id v10 = [v9 view];
    double v11 = [(UIPreviewInteractionController *)self modalPanGestureRecognizer];
    [v10 removeGestureRecognizer:v11];

    [(UIPreviewInteractionController *)self setModalPanGestureRecognizer:0];
  }
  [(UIPreviewInteractionController *)self _deactivateFeedbackIfNeeded];
}

- (void)_activateFeedbackIfNeeded
{
  if (![(UIPreviewInteractionController *)self _usesPreviewInteraction])
  {
    BOOL v3 = [(UIPreviewInteractionController *)self feedbackGenerator];
    char v4 = [v3 isActive];

    if ((v4 & 1) == 0)
    {
      int v5 = [(UIPreviewInteractionController *)self touchObservingGestureRecognizer];
      deepPressAnalyzer = self->_deepPressAnalyzer;
      id v10 = v5;
      if (!deepPressAnalyzer)
      {
        id v7 = objc_alloc_init(_UIDeepPressAnalyzer);
        id v8 = self->_deepPressAnalyzer;
        self->_deepPressAnalyzer = v7;

        int v5 = v10;
        deepPressAnalyzer = self->_deepPressAnalyzer;
      }
      id v9 = [v5 touches];
      [(_UIDeepPressAnalyzer *)deepPressAnalyzer analyzeTouches:v9];

      if ([(_UIDeepPressAnalyzer *)self->_deepPressAnalyzer isDeepPressLikely]) {
        [(UIPreviewInteractionController *)self _activateFeedback];
      }
    }
  }
}

- (void)_activateFeedback
{
  BOOL v3 = [(UIPreviewInteractionController *)self feedbackGenerator];
  if (!v3)
  {
    char v4 = +[_UIStatesFeedbackGeneratorPreviewConfiguration defaultConfiguration];
    int v5 = [v4 tweakedConfigurationForClass:objc_opt_class() usage:@"presentation"];

    id v6 = [(UIPreviewInteractionController *)self touchObservingGestureRecognizer];
    id v7 = [_UIStatesFeedbackGenerator alloc];
    id v8 = [v6 view];
    id v9 = [(_UIStatesFeedbackGenerator *)v7 initWithConfiguration:v5 view:v8];

    [(UIPreviewInteractionController *)self setFeedbackGenerator:v9];
    BOOL v3 = v9;
  }
  id v10 = v3;
  if (([v3 isActive] & 1) == 0) {
    [v10 activateWithCompletionBlock:0];
  }
}

- (void)_deactivateFeedbackIfNeeded
{
  BOOL v3 = [(UIPreviewInteractionController *)self currentPresentationController];

  if (!v3 && ![(UIPreviewInteractionController *)self _usesPreviewInteraction])
  {
    [(UIPreviewInteractionController *)self _turnOffFeedbackGenerator];
    id v4 = [(UIPreviewInteractionController *)self feedbackGenerator];
    if ([v4 isActive]) {
      [v4 deactivate];
    }
  }
}

- (void)_turnOnFeedbackGenerator
{
  if (!self->_generatorTurnedOn)
  {
    BOOL v3 = [(UIPreviewInteractionController *)self feedbackGenerator];
    [v3 _activateWithStyle:2 completionBlock:0];

    self->_generatorTurnedOn = 1;
  }
}

- (void)_turnOffFeedbackGenerator
{
  if (self->_generatorTurnedOn)
  {
    BOOL v3 = [(UIPreviewInteractionController *)self feedbackGenerator];
    [v3 _deactivateWithStyle:2];

    self->_generatorTurnedOn = 0;
  }
}

- (BOOL)_usesPreviewInteraction
{
  return self->_previewInteraction != 0;
}

- (BOOL)_usesPreviewPresentationController
{
  v2 = [(UIPreviewInteractionController *)self currentPresentationController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)previewInteraction:(id)a3 didUpdatePreviewTransition:(double)a4 ended:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = [(UIPreviewInteractionController *)self interactionProgressForPresentation];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 setPercentComplete:a4];
    if (v5) {
      [v7 endInteraction:1];
    }
  }
}

- (BOOL)previewInteractionShouldBegin:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 view];
  [v4 locationInCoordinateSpace:v5];
  double v7 = v6;
  double v9 = v8;

  LOBYTE(self) = -[UIPreviewInteractionController startInteractivePreviewAtLocation:inView:](self, "startInteractivePreviewAtLocation:inView:", v5, v7, v9);
  return (char)self;
}

- (void)previewInteraction:(id)a3 didUpdateCommitTransition:(double)a4 ended:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = [(UIPreviewInteractionController *)self interactionProgressForCommit];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 setPercentComplete:a4];
    if (v5) {
      [v7 endInteraction:1];
    }
  }
}

- (UIPreviewInteractionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIPreviewInteractionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CGPoint)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLocation:(CGPoint)a3
{
  self->_location = a3;
}

- (UIView)sourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
  return (UIView *)WeakRetained;
}

- (void)setSourceView:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (UIPreviewInteraction)previewInteraction
{
  return self->_previewInteraction;
}

- (void)setPreviewInteraction:(id)a3
{
}

- (UIInteractionProgress)interactionProgressForCommit
{
  return self->_interactionProgressForCommit;
}

- (void)setInteractionProgressForCommit:(id)a3
{
}

- (_UIRevealGestureRecognizer)revealGestureRecognizer
{
  return self->_revealGestureRecognizer;
}

- (void)setRevealGestureRecognizer:(id)a3
{
}

- (_UIPreviewGestureRecognizer)previewGestureRecognizer
{
  return self->_previewGestureRecognizer;
}

- (void)setPreviewGestureRecognizer:(id)a3
{
}

- (UIPanGestureRecognizer)modalPanGestureRecognizer
{
  return self->_modalPanGestureRecognizer;
}

- (void)setModalPanGestureRecognizer:(id)a3
{
}

- (_UITouchesObservingGestureRecognizer)touchObservingGestureRecognizer
{
  return self->_touchObservingGestureRecognizer;
}

- (void)setTouchObservingGestureRecognizer:(id)a3
{
}

- (_UIDeepPressAnalyzer)deepPressAnalyzer
{
  return self->_deepPressAnalyzer;
}

- (void)setDeepPressAnalyzer:(id)a3
{
}

- (UIViewController)currentPreviewViewController
{
  return self->_currentPreviewViewController;
}

- (void)setCurrentPreviewViewController:(id)a3
{
}

- (UIForcePresentationController)currentPresentationController
{
  return self->_currentPresentationController;
}

- (void)setCurrentPresentationController:(id)a3
{
}

- (UIForceTransitioningDelegate)currentTransitionDelegate
{
  return self->_currentTransitionDelegate;
}

- (void)setCurrentTransitionDelegate:(id)a3
{
}

- (UIWindow)windowForPreviewPresentation
{
  return self->_windowForPreviewPresentation;
}

- (void)setWindowForPreviewPresentation:(id)a3
{
}

- (BOOL)statusBarWasHidden
{
  return self->_statusBarWasHidden;
}

- (void)setStatusBarWasHidden:(BOOL)a3
{
  self->_statusBarWasHidden = a3;
}

- (id)currentCommitTransition
{
  return self->_currentCommitTransition;
}

- (void)setCurrentCommitTransition:(id)a3
{
}

- (BOOL)didSendDelegateWillDismissViewController
{
  return self->_didSendDelegateWillDismissViewController;
}

- (void)setDidSendDelegateWillDismissViewController:(BOOL)a3
{
  self->_didSendDelegateWillDismissViewController = a3;
}

- (UIViewControllerPreviewing_Internal)previewingContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewingContext);
  return (UIViewControllerPreviewing_Internal *)WeakRetained;
}

- (void)setPreviewingContext:(id)a3
{
}

- (_UIStatesFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (UIInteractionProgress)interactionProgressForPresentation
{
  return self->_interactionProgressForPresentation;
}

- (void)setInteractionProgressForPresentation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionProgressForPresentation, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_destroyWeak((id *)&self->_previewingContext);
  objc_storeStrong(&self->_currentCommitTransition, 0);
  objc_storeStrong((id *)&self->_windowForPreviewPresentation, 0);
  objc_storeStrong((id *)&self->_currentTransitionDelegate, 0);
  objc_storeStrong((id *)&self->_currentPresentationController, 0);
  objc_storeStrong((id *)&self->_currentPreviewViewController, 0);
  objc_storeStrong((id *)&self->_deepPressAnalyzer, 0);
  objc_storeStrong((id *)&self->_touchObservingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_modalPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_previewGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_revealGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_interactionProgressForCommit, 0);
  objc_storeStrong((id *)&self->_previewInteraction, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_sourceView);
  objc_destroyWeak((id *)&self->_delegate);
}

void __59___UIPreviewInteractionController_commitInteractivePreview__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 previewInteractionController:*(void *)(a1 + 32) didDismissViewController:*(void *)(a1 + 40) committing:1];
  }
  [v2 previewInteractionController:*(void *)(a1 + 32) commitViewController:*(void *)(a1 + 40)];
}

uint64_t __59___UIPreviewInteractionController_commitInteractivePreview__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setPerformingCommitTransition:0];
  [*(id *)(a1 + 32) setCurrentCommitTransition:0];
  id v2 = *(void **)(a1 + 32);
  return [v2 _finalizeAfterPreviewViewControllerPresentation];
}

void __99___UIPreviewInteractionController__preparePreviewViewControllerPresentationFromPreviewInteraction___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPerformingPreviewTransition:0];
  int v2 = [*(id *)(a1 + 40) _hasAppeared];
  BOOL v3 = *(void **)(a1 + 32);
  if (v2)
  {
    int v4 = [v3 commitTransitionScheduled];
    BOOL v5 = *(void **)(a1 + 32);
    if (v4)
    {
      [v5 commitInteractivePreview];
    }
    else
    {
      id v6 = [v5 previewActionsController];
      [v6 flashScrollAffordance];
    }
  }
  else
  {
    [v3 _finalizeAfterPreviewViewControllerPresentation];
  }
}

uint64_t __87___UIPreviewInteractionController__dismissPreviewViewControllerIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) previewInteractionController:*(void *)(a1 + 40) didDismissViewController:*(void *)(a1 + 48) committing:0];
  }
  [*(id *)(a1 + 40) _finalizeAfterPreviewViewControllerPresentation];
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  BOOL v3 = *(void **)(a1 + 40);
  return [v3 setDismissingPreview:0];
}

void __61___UIPreviewInteractionController__preparedInteractionEffect__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  int v4 = [WeakRetained currentPresentationController];
  [v4 _updateFromInteractionEffect:v3];
}

void __84___UIPreviewInteractionController__preferredNavigationControllerForCommitTransition__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  BOOL v5 = v4;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v7 = v4;
    char isKindOfClass = objc_opt_isKindOfClass();
    BOOL v5 = v7;
    if (isKindOfClass)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      BOOL v5 = v7;
    }
  }
}

void __64___UIPreviewInteractionController__handlePreviewActionsGesture___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _dismissPreviewViewControllerIfNeeded];
  id v2 = [*(id *)(a1 + 32) previewInteraction];
  [v2 cancelInteraction];
}

void __90___UIPreviewInteractionController_previewActionsController_didCompleteWithSelectedAction___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) handler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) handler];
    (*((void (**)(id, void, void))v3 + 2))(v3, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
}

@end