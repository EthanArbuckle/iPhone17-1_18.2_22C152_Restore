@interface SKUIContextActionsPresentationRegistration
- (BOOL)previewInteractionDidEnd;
- (BOOL)previewInteractionShouldBegin:(id)a3;
- (NSTimer)previewInteractionTimeout;
- (SKUIContextActionsPresentationRegistration)initWithViewController:(id)a3 handler:(id)a4;
- (SKUIContextActionsViewController)orbContextActionsViewController;
- (UILongPressGestureRecognizer)longPressGestureRecognizer;
- (UIPreviewInteraction)previewInteraction;
- (UIViewController)viewController;
- (UIViewPropertyAnimator)commitPhasePropertyAnimator;
- (UIViewPropertyAnimator)previewPhasePropertyAnimator;
- (id)handler;
- (void)_presentFromGestureRecognizer:(id)a3;
- (void)cleanupPreviewInteraction:(id)a3;
- (void)dealloc;
- (void)longPressGestureRecognizerTriggered:(id)a3;
- (void)previewInteraction:(id)a3 didUpdatePreviewTransition:(double)a4 ended:(BOOL)a5;
- (void)previewInteractionDidCancel:(id)a3;
- (void)setCommitPhasePropertyAnimator:(id)a3;
- (void)setHandler:(id)a3;
- (void)setLongPressGestureRecognizer:(id)a3;
- (void)setOrbContextActionsViewController:(id)a3;
- (void)setPreviewInteraction:(id)a3;
- (void)setPreviewInteractionDidEnd:(BOOL)a3;
- (void)setPreviewInteractionTimeout:(id)a3;
- (void)setPreviewPhasePropertyAnimator:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation SKUIContextActionsPresentationRegistration

- (SKUIContextActionsPresentationRegistration)initWithViewController:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIContextActionsPresentationRegistration initWithViewController:handler:]();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIContextActionsPresentationRegistration;
  v9 = [(SKUIContextActionsPresentationRegistration *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewController, a3);
    v11 = _Block_copy(v8);
    id handler = v10->_handler;
    v10->_id handler = v11;

    v10->_previewInteractionDidEnd = 0;
  }

  return v10;
}

- (void)dealloc
{
  [(UIPreviewInteraction *)self->_previewInteraction cancelInteraction];
  longPressGestureRecognizer = self->_longPressGestureRecognizer;
  if (longPressGestureRecognizer)
  {
    v4 = [(UILongPressGestureRecognizer *)longPressGestureRecognizer view];
    [v4 removeGestureRecognizer:self->_longPressGestureRecognizer];
  }
  v5.receiver = self;
  v5.super_class = (Class)SKUIContextActionsPresentationRegistration;
  [(SKUIContextActionsPresentationRegistration *)&v5 dealloc];
}

- (BOOL)previewInteractionShouldBegin:(id)a3
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [v4 view];
  v6 = [v5 traitCollection];
  uint64_t v7 = [v6 forceTouchCapability];

  if (v7 == 1)
  {
    BOOL v8 = 0;
  }
  else
  {
    v9 = [(SKUIContextActionsPresentationRegistration *)self viewController];
    if (v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v73 = v5;
      if (v73)
      {
        v11 = v73;
        do
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v12 = v11;
            if ([v12 isDragging])
            {

              BOOL v8 = 0;
              goto LABEL_30;
            }
            [v10 addObject:v12];
          }
          uint64_t v13 = [v11 superview];

          v11 = (void *)v13;
        }
        while (v13);
      }
      v72 = v9;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      id v14 = v10;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v97 objects:v101 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v98;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v98 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v97 + 1) + 8 * i);
            v20 = [v19 panGestureRecognizer];
            [v20 setEnabled:0];

            v21 = [v19 panGestureRecognizer];
            [v21 setEnabled:1];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v97 objects:v101 count:16];
        }
        while (v16);
      }

      v22 = [(SKUIContextActionsPresentationRegistration *)self handler];
      ((void (**)(void, SKUIContextActionsPresentationRegistration *))v22)[2](v22, self);
      id v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        [v4 locationInCoordinateSpace:v73];
        double v24 = v23;
        double v26 = v25;
        v9 = v72;
        v27 = [[SKUIContextActionsPresentationSource alloc] initWithViewController:v72];
        [v12 setPresentationSource:v27];

        v28 = [v12 presentationSource];
        [v28 setSourceView:v73];

        double v29 = *MEMORY[0x1E4F1DB30];
        double v30 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        v31 = [v12 presentationSource];
        objc_msgSend(v31, "setSourceRect:", v24, v26, v29, v30);

        v32 = [[SKUIContextActionsViewController alloc] initWithConfiguration:v12];
        [(SKUIContextActionsViewController *)v32 setOrbPresentation:1];
        v33 = [(SKUIContextActionsPresentationRegistration *)self longPressGestureRecognizer];
        [(SKUIContextActionsViewController *)v32 setSystemProvidedGestureRecognzier:v33];

        v34 = [v4 valueForKey:@"touchObservingGestureRecognizer"];
        v35 = v34;
        if (v34) {
          [v34 setCancelsTouchesInView:1];
        }
        v36 = (void *)MEMORY[0x1E4FB1EC0];
        v94[0] = MEMORY[0x1E4F143A8];
        v94[1] = 3221225472;
        v94[2] = __76__SKUIContextActionsPresentationRegistration_previewInteractionShouldBegin___block_invoke;
        v94[3] = &unk_1E6421FF8;
        id v12 = v12;
        id v95 = v12;
        v37 = v32;
        v96 = v37;
        [v36 _performWithoutDeferringTransitions:v94];
        [(SKUIContextActionsPresentationRegistration *)self setOrbContextActionsViewController:v37];
        v38 = [(SKUIContextActionsViewController *)v37 transitionPresentationController];
        v39 = v38;
        BOOL v8 = v38 != 0;
        if (v38)
        {
          v70 = v35;
          v71 = v37;
          v40 = [v38 backgroundView];
          v41 = [v73 snapshotViewAfterScreenUpdates:1];
          v69 = v39;
          v42 = [v39 containerView];
          v43 = v42;
          if (v41 && v42)
          {
            [v42 insertSubview:v41 aboveSubview:v40];
            [v73 bounds];
            objc_msgSend(v73, "convertRect:toView:", v43);
            objc_msgSend(v41, "setFrame:");
            [v73 setHidden:1];
          }
          v44 = [MEMORY[0x1E4FB1618] clearColor];
          [v40 setBackgroundColor:v44];

          v45 = +[SKUIContextActionsBlurEffect effectWithStyle:1];
          v68 = v43;
          id v46 = objc_alloc(MEMORY[0x1E4FB1ED8]);
          v90[0] = MEMORY[0x1E4F143A8];
          v90[1] = 3221225472;
          v90[2] = __76__SKUIContextActionsPresentationRegistration_previewInteractionShouldBegin___block_invoke_2;
          v90[3] = &unk_1E64225B0;
          id v66 = v40;
          id v91 = v66;
          id v92 = v45;
          id v47 = v41;
          id v93 = v47;
          id v67 = v45;
          v48 = (void *)[v46 initWithDuration:3 curve:v90 animations:1.0];
          [(SKUIContextActionsPresentationRegistration *)self setPreviewPhasePropertyAnimator:v48];

          v49 = [(SKUIContextActionsViewController *)v71 view];
          [v73 bounds];
          double Width = CGRectGetWidth(v103);
          [v49 bounds];
          CGFloat v51 = fmax(Width / CGRectGetWidth(v104), 0.5);
          [v73 bounds];
          double Height = CGRectGetHeight(v105);
          [v49 bounds];
          CGFloat v53 = CGRectGetHeight(v106);
          memset(&v89, 0, sizeof(v89));
          CGAffineTransformMakeScale(&v89, v51, fmax(Height / v53, 0.5));
          memset(&v88, 0, sizeof(v88));
          [v47 frame];
          double MidX = CGRectGetMidX(v107);
          [v49 frame];
          CGFloat v55 = MidX - CGRectGetMidX(v108);
          [v47 frame];
          double MidY = CGRectGetMidY(v109);
          [v49 frame];
          CGFloat v57 = CGRectGetMidY(v110);
          CGAffineTransformMakeTranslation(&v88, v55, MidY - v57);
          CGAffineTransform t1 = v89;
          CGAffineTransform t2 = v88;
          CGAffineTransformConcat(&v87, &t1, &t2);
          CGAffineTransform v89 = v87;
          CGAffineTransform v84 = v87;
          [v49 setTransform:&v84];
          id v58 = objc_alloc(MEMORY[0x1E4FB1ED8]);
          v80[0] = MEMORY[0x1E4F143A8];
          v80[1] = 3221225472;
          v80[2] = __76__SKUIContextActionsPresentationRegistration_previewInteractionShouldBegin___block_invoke_3;
          v80[3] = &unk_1E64225B0;
          id v81 = v47;
          id v82 = v66;
          id v59 = v49;
          id v83 = v59;
          id v74 = v66;
          id v60 = v47;
          v61 = (void *)[v58 initWithDuration:v80 dampingRatio:0.400000006 animations:1.0];
          [(SKUIContextActionsPresentationRegistration *)self setCommitPhasePropertyAnimator:v61];

          v77[0] = MEMORY[0x1E4F143A8];
          v77[1] = 3221225472;
          CGAffineTransform v79 = v89;
          v77[2] = __76__SKUIContextActionsPresentationRegistration_previewInteractionShouldBegin___block_invoke_4;
          v77[3] = &unk_1E6425758;
          id v78 = v59;
          id v62 = v59;
          [v69 setDismissalAnimations:v77];
          v63 = (void *)MEMORY[0x1E4F1CB00];
          v75[0] = MEMORY[0x1E4F143A8];
          v75[1] = 3221225472;
          v75[2] = __76__SKUIContextActionsPresentationRegistration_previewInteractionShouldBegin___block_invoke_5;
          v75[3] = &unk_1E6425780;
          v75[4] = self;
          id v76 = v4;
          v64 = [v63 scheduledTimerWithTimeInterval:0 repeats:v75 block:1.0];
          [(SKUIContextActionsPresentationRegistration *)self setPreviewInteractionTimeout:v64];

          [(SKUIContextActionsPresentationRegistration *)self setPreviewInteractionDidEnd:0];
          v37 = v71;

          v39 = v69;
          v9 = v72;
          v35 = v70;
        }
        else
        {
          NSLog(&cfstr_Uipreviewinter.isa);
          [(SKUIContextActionsPresentationRegistration *)self cleanupPreviewInteraction:v4];
        }
      }
      else
      {
        BOOL v8 = 0;
        v9 = v72;
      }
LABEL_30:
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

void __76__SKUIContextActionsPresentationRegistration_previewInteractionShouldBegin___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentationSource];
  [v2 presentViewController:*(void *)(a1 + 40) permittedArrowDirections:12 animated:0];

  v3 = [*(id *)(a1 + 40) view];
  [v3 setUserInteractionEnabled:0];

  id v4 = [*(id *)(a1 + 40) view];
  [v4 setAlpha:0.0];

  id v5 = [*(id *)(a1 + 40) view];
  [v5 setHidden:1];
}

uint64_t __76__SKUIContextActionsPresentationRegistration_previewInteractionShouldBegin___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setEffect:*(void *)(a1 + 40)];
  CGAffineTransformMakeScale(&v5, 1.08000004, 1.08000004);
  v2 = *(void **)(a1 + 48);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

uint64_t __76__SKUIContextActionsPresentationRegistration_previewInteractionShouldBegin___block_invoke_3(id *a1)
{
  id v2 = a1[4];
  long long v23 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v25[0] = *MEMORY[0x1E4F1DAB8];
  long long v22 = v25[0];
  v25[1] = v23;
  long long v26 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v21 = v26;
  [v2 setTransform:v25];
  [a1[4] setAlpha:0.0];
  [a1[4] bounds];
  [a1[5] bounds];
  v3 = [a1[6] traitCollection];
  [v3 displayScale];
  uint64_t v19 = v4;
  UIRectCenteredXInRectScale();

  objc_msgSend(a1[5], "bounds", v19);
  CGAffineTransform v5 = [a1[6] traitCollection];
  [v5 displayScale];
  uint64_t v20 = v6;
  UIRectCenteredYInRectScale();
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v27.origin.x = v8;
  v27.origin.y = v10;
  v27.size.width = v12;
  v27.size.height = v14;
  double Width = CGRectGetWidth(v27);
  v28.origin.x = v8;
  v28.origin.y = v10;
  v28.size.width = v12;
  v28.size.height = v14;
  objc_msgSend(a1[4], "setBounds:", 0.0, 0.0, Width, CGRectGetHeight(v28), v20);
  v29.origin.x = v8;
  v29.origin.y = v10;
  v29.size.width = v12;
  v29.size.height = v14;
  double MidX = CGRectGetMidX(v29);
  v30.origin.x = v8;
  v30.origin.y = v10;
  v30.size.width = v12;
  v30.size.height = v14;
  objc_msgSend(a1[4], "setCenter:", MidX, CGRectGetMidY(v30));
  id v17 = a1[6];
  v24[0] = v22;
  v24[1] = v23;
  v24[2] = v21;
  [v17 setTransform:v24];
  return [a1[6] setAlpha:1.0];
}

uint64_t __76__SKUIContextActionsPresentationRegistration_previewInteractionShouldBegin___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [*(id *)(a1 + 32) setTransform:v4];
}

void __76__SKUIContextActionsPresentationRegistration_previewInteractionShouldBegin___block_invoke_5(uint64_t a1)
{
  if (([*(id *)(a1 + 32) previewInteractionDidEnd] & 1) == 0)
  {
    NSLog(&cfstr_Uipreviewinter_0.isa);
    [*(id *)(a1 + 32) previewInteraction:*(void *)(a1 + 40) didUpdatePreviewTransition:1 ended:1.0];
    long long v2 = [*(id *)(a1 + 32) previewInteraction];
    [v2 _prepareUsingFeedback];

    v3 = [*(id *)(a1 + 32) previewInteraction];
    [v3 _actuateFeedbackForStateIfNeeded:2];

    id v4 = [*(id *)(a1 + 32) previewInteraction];
    [v4 cancelInteraction];
  }
}

- (void)previewInteraction:(id)a3 didUpdatePreviewTransition:(double)a4 ended:(BOOL)a5
{
  BOOL v5 = a5;
  id v21 = a3;
  NSLog(&cfstr_Uipreviewinter_1.isa);
  double v8 = a4 * a4;
  double v9 = [(SKUIContextActionsPresentationRegistration *)self previewPhasePropertyAnimator];
  [v9 fractionComplete];
  double v11 = v10;

  if (v8 < 1.0 || v11 != 0.0)
  {
    CGFloat v12 = [(SKUIContextActionsPresentationRegistration *)self previewPhasePropertyAnimator];
    [v12 setFractionComplete:v8];
  }
  if (v5)
  {
    [(SKUIContextActionsPresentationRegistration *)self setPreviewInteractionDidEnd:1];
    double v13 = [(SKUIContextActionsPresentationRegistration *)self orbContextActionsViewController];
    CGFloat v14 = [v13 view];
    [v14 setUserInteractionEnabled:1];

    uint64_t v15 = [(SKUIContextActionsPresentationRegistration *)self orbContextActionsViewController];
    uint64_t v16 = [v15 view];
    [v16 setHidden:0];

    id v17 = [(SKUIContextActionsPresentationRegistration *)self commitPhasePropertyAnimator];
    [v17 startAnimation];

    v18 = [(SKUIContextActionsPresentationRegistration *)self previewPhasePropertyAnimator];
    [v18 pauseAnimation];

    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4FB1C58]) initWithDampingRatio:1.0];
    uint64_t v20 = [(SKUIContextActionsPresentationRegistration *)self previewPhasePropertyAnimator];
    [v20 continueAnimationWithTimingParameters:v19 durationFactor:0.400000006];

    [(SKUIContextActionsPresentationRegistration *)self setOrbContextActionsViewController:0];
    [(SKUIContextActionsPresentationRegistration *)self cleanupPreviewInteraction:v21];
  }
}

- (void)previewInteractionDidCancel:(id)a3
{
  id v4 = a3;
  if ([(SKUIContextActionsPresentationRegistration *)self previewInteractionDidEnd])
  {
    NSLog(&cfstr_Uipreviewinter_2.isa);
  }
  else
  {
    NSLog(&cfstr_Uipreviewinter_3.isa);
    [(SKUIContextActionsPresentationRegistration *)self cleanupPreviewInteraction:v4];
    [(SKUIContextActionsPresentationRegistration *)self setOrbContextActionsViewController:0];
    [(SKUIContextActionsPresentationRegistration *)self setCommitPhasePropertyAnimator:0];
    [(SKUIContextActionsPresentationRegistration *)self setPreviewPhasePropertyAnimator:0];
  }
}

- (void)cleanupPreviewInteraction:(id)a3
{
  id v8 = a3;
  id v4 = [(SKUIContextActionsPresentationRegistration *)self previewInteractionTimeout];
  [v4 invalidate];

  [(SKUIContextActionsPresentationRegistration *)self setPreviewInteractionTimeout:0];
  BOOL v5 = [v8 valueForKey:@"touchObservingGestureRecognizer"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setCancelsTouchesInView:0];
  }
  uint64_t v6 = [(SKUIContextActionsPresentationRegistration *)self orbContextActionsViewController];
  [v6 dismissViewControllerAnimated:0 completion:0];

  double v7 = [v8 view];
  [v7 setHidden:0];
}

- (void)longPressGestureRecognizerTriggered:(id)a3
{
  id v7 = a3;
  if ([v7 state] == 1)
  {
    id v4 = [v7 view];
    BOOL v5 = [v4 traitCollection];
    uint64_t v6 = [v5 forceTouchCapability];

    if (v6 != 2) {
      [(SKUIContextActionsPresentationRegistration *)self _presentFromGestureRecognizer:v7];
    }
  }
}

- (void)setLongPressGestureRecognizer:(id)a3
{
  id v6 = a3;
  [(UILongPressGestureRecognizer *)self->_longPressGestureRecognizer removeTarget:self action:sel_longPressGestureRecognizerTriggered_];
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, a3);
  BOOL v5 = v6;
  if (v6)
  {
    [v6 addTarget:self action:sel_longPressGestureRecognizerTriggered_];
    BOOL v5 = v6;
  }
}

- (void)_presentFromGestureRecognizer:(id)a3
{
  id v13 = a3;
  id v4 = [(SKUIContextActionsPresentationRegistration *)self handler];
  BOOL v5 = ((void (**)(void, SKUIContextActionsPresentationRegistration *))v4)[2](v4, self);

  if (v5)
  {
    id v6 = [SKUIContextActionsPresentationSource alloc];
    id v7 = [(SKUIContextActionsPresentationRegistration *)self viewController];
    id v8 = [(SKUIContextActionsPresentationSource *)v6 initWithViewController:v7];

    double v9 = [v13 view];
    [(SKUIContextActionsPresentationSource *)v8 setSourceView:v9];

    double v10 = [v13 view];
    [v10 defaultPresentationPosition];
    -[SKUIContextActionsPresentationSource setSourceRect:](v8, "setSourceRect:");

    [v5 setPresentationSource:v8];
    double v11 = [[SKUIContextActionsViewController alloc] initWithConfiguration:v5];
    [(SKUIContextActionsViewController *)v11 setSystemProvidedGestureRecognzier:v13];
    CGFloat v12 = [v5 presentationSource];
    [v12 presentViewController:v11 permittedArrowDirections:12 animated:1];
  }
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (UIPreviewInteraction)previewInteraction
{
  return self->_previewInteraction;
}

- (void)setPreviewInteraction:(id)a3
{
}

- (BOOL)previewInteractionDidEnd
{
  return self->_previewInteractionDidEnd;
}

- (void)setPreviewInteractionDidEnd:(BOOL)a3
{
  self->_previewInteractionDidEnd = a3;
}

- (NSTimer)previewInteractionTimeout
{
  return self->_previewInteractionTimeout;
}

- (void)setPreviewInteractionTimeout:(id)a3
{
}

- (SKUIContextActionsViewController)orbContextActionsViewController
{
  return self->_orbContextActionsViewController;
}

- (void)setOrbContextActionsViewController:(id)a3
{
}

- (UIViewPropertyAnimator)previewPhasePropertyAnimator
{
  return self->_previewPhasePropertyAnimator;
}

- (void)setPreviewPhasePropertyAnimator:(id)a3
{
}

- (UIViewPropertyAnimator)commitPhasePropertyAnimator
{
  return self->_commitPhasePropertyAnimator;
}

- (void)setCommitPhasePropertyAnimator:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_commitPhasePropertyAnimator, 0);
  objc_storeStrong((id *)&self->_previewPhasePropertyAnimator, 0);
  objc_storeStrong((id *)&self->_orbContextActionsViewController, 0);
  objc_storeStrong((id *)&self->_previewInteractionTimeout, 0);
  objc_storeStrong((id *)&self->_previewInteraction, 0);
  objc_storeStrong((id *)&self->_viewController, 0);

  objc_storeStrong(&self->_handler, 0);
}

- (void)initWithViewController:handler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIContextActionsPresentationRegistration initWithViewController:handler:]";
}

@end