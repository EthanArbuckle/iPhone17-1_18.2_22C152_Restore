@interface _UIPreviewInteractionHighlighter
- (BOOL)cancelsInteractionWhenScrolling;
- (BOOL)shouldApplyBackgroundEffects;
- (BOOL)shouldApplyContentEffects;
- (BOOL)shouldApplyEffectsOnProxyView;
- (BOOL)shouldEndWithCancelAnimation;
- (BOOL)shouldTransferViewOwnership;
- (UIView)customBackgroundEffectView;
- (UIView)customContainerView;
- (UIView)view;
- (_UIInteractiveHighlightEffect)interactiveHighlightEffect;
- (_UIPreviewInteractionHighlighter)initWithView:(id)a3;
- (id)backgroundEffectApplyBlock;
- (id)completionBlock;
- (id)privateCompletionBlock;
- (unint64_t)clickEffectPhase;
- (void)_animateAlongsideViewControllerPresentationDismiss;
- (void)_animateForDelayedViewControllerPresentation;
- (void)_applyHighlightEffectsToViewControllerDuringCancellation:(id)a3;
- (void)_delayedViewControllerPresentationDidCancel;
- (void)_finalizeAfterInteraction;
- (void)_finalizeAfterInteractionIfNeeded;
- (void)_prepareAccessoryViewsForScrollView:(id)a3 environment:(id)a4;
- (void)_prepareContentEffectsForInteraction:(id)a3;
- (void)_prepareForInteraction:(id)a3;
- (void)_prepareForViewControllerPresentation:(id)a3;
- (void)_setHighlighted:(BOOL)a3 forViewIfNeeded:(id)a4;
- (void)_updateFromInteraction:(id)a3 fractionComplete:(double)a4 ended:(BOOL)a5;
- (void)interaction:(id)a3 didChangeWithContext:(id)a4;
- (void)setBackgroundEffectApplyBlock:(id)a3;
- (void)setCancelsInteractionWhenScrolling:(BOOL)a3;
- (void)setClickEffectPhase:(unint64_t)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setCustomBackgroundEffectView:(id)a3;
- (void)setCustomContainerView:(id)a3;
- (void)setPrivateCompletionBlock:(id)a3;
- (void)setShouldApplyBackgroundEffects:(BOOL)a3;
- (void)setShouldApplyContentEffects:(BOOL)a3;
- (void)setShouldApplyEffectsOnProxyView:(BOOL)a3;
- (void)setShouldEndWithCancelAnimation:(BOOL)a3;
- (void)setShouldTransferViewOwnership:(BOOL)a3;
@end

@implementation _UIPreviewInteractionHighlighter

- (_UIPreviewInteractionHighlighter)initWithView:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"UIPreviewInteractionHighlighter.m", 65, @"Invalid parameter not satisfying: %@", @"view" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)_UIPreviewInteractionHighlighter;
  v6 = [(_UIPreviewInteractionHighlighter *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_view, v5);
    *(_WORD *)&v7->_shouldApplyEffectsOnProxyView = 257;
    v7->_shouldApplyBackgroundEffects = 1;
    v7->_cancelsInteractionWhenScrolling = 1;
    v7->_preferredAnimationStyle = 0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v7->_preferredMinimumScale = _Q0;
    v13 = v7;
  }

  return v7;
}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 ended];
  uint64_t v8 = v7;
  if (!self->_active && (v7 & 1) == 0) {
    [(_UIPreviewInteractionHighlighter *)self _prepareForInteraction:v9];
  }
  [v6 progress];
  -[_UIPreviewInteractionHighlighter _updateFromInteraction:fractionComplete:ended:](self, "_updateFromInteraction:fractionComplete:ended:", v9, v8);
  self->_active = v8 ^ 1;
}

- (_UIInteractiveHighlightEffect)interactiveHighlightEffect
{
  return self->_interactiveHighlightEffect;
}

- (void)_prepareForInteraction:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_storeWeak((id *)&self->_interaction, obj);
  if ([(_UIPreviewInteractionHighlighter *)self shouldApplyEffectsOnProxyView])
  {
    id v5 = objc_loadWeakRetained((id *)&self->_customContainerView);

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_customContainerView);
      uint64_t v7 = +[_UIInteractiveHighlightEnvironment interactiveHighlightEnvironmentForContainerView:v6];
    }
    else
    {
      uint64_t v7 = +[_UIInteractiveHighlightEnvironment requestInteractiveHighlightEnvironmentForView:WeakRetained];
    }
    uint64_t v8 = [(_UIPreviewInteractionHighlighter *)self customBackgroundEffectView];
    [v7 setCustomBackgroundEffectView:v8];

    id v9 = [(_UIPreviewInteractionHighlighter *)self backgroundEffectApplyBlock];
    [v7 setBackgroundEffectApplyBlock:v9];

    v10 = [v7 interactiveHighlightEffectForView:WeakRetained options:self->_shouldTransferViewOwnership];
    interactiveHighlightEffect = self->_interactiveHighlightEffect;
    self->_interactiveHighlightEffect = v10;

    v12 = [(_UIInteractiveHighlightEffect *)self->_interactiveHighlightEffect portalView];
    v13 = v12;
    if (v12)
    {
      [v12 setHidesSourceView:1];
      [v13 setHidden:0];
    }
    v14 = [WeakRetained _containingScrollView];
    if (v14) {
      [(_UIPreviewInteractionHighlighter *)self _prepareAccessoryViewsForScrollView:v14 environment:v7];
    }
    v15 = [WeakRetained _viewControllerForAncestor];
    uint64_t v16 = [v15 navigationController];
    double v17 = 0.0;
    if (v16)
    {
      v18 = (void *)v16;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      double v20 = 0.0;
      double v21 = 0.0;
      double v22 = 0.0;
      if (isKindOfClass)
      {
        v23 = [v15 view];
        [v23 safeAreaInsets];
        double v25 = v24;
        double v21 = v26;
        double v20 = v27;
        double v17 = v28;

        v29 = [v15 view];
        [v29 _currentScreenScale];
        double v31 = v30;

        double v32 = 1.0;
        if (v31 > 0.0) {
          double v32 = 1.0 / v31;
        }
        double v22 = v25 + v32;
      }
    }
    else
    {
      double v20 = 0.0;
      double v21 = 0.0;
      double v22 = 0.0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 _indexBarExtentFromEdge];
      if (v17 < v33) {
        double v17 = v33;
      }
    }
    -[_UIInteractiveHighlightEffect setPreferredContentInsets:](self->_interactiveHighlightEffect, "setPreferredContentInsets:", v22, v21, v20, v17);
  }
  if ([(_UIPreviewInteractionHighlighter *)self shouldApplyContentEffects]) {
    [(_UIPreviewInteractionHighlighter *)self _prepareContentEffectsForInteraction:obj];
  }
}

- (void)_updateFromInteraction:(id)a3 fractionComplete:(double)a4 ended:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = self->_interactiveHighlightEffect;
  if ([(_UIPreviewInteractionHighlighter *)self shouldApplyContentEffects])
  {
    self->_animatesContentEffects = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_compatibilityHighlightView);

    if (WeakRetained)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_compatibilityHighlightView);
      [(_UIPreviewInteractionHighlighter *)self _setHighlighted:!v5 forViewIfNeeded:v11];
    }
    if (v5)
    {
      BOOL v12 = [(_UIPreviewInteractionHighlighter *)self shouldEndWithCancelAnimation];
      if ([(_UIPreviewInteractionHighlighter *)self clickEffectPhase])
      {
        double v13 = 22.0;
LABEL_19:
        double v14 = 500.0;
        goto LABEL_24;
      }
      if (self->_preferredAnimationStyle == 1)
      {
        if (v12)
        {
          double v13 = 25.0;
          double v14 = 1500.0;
          goto LABEL_24;
        }
        double v14 = 500.0;
LABEL_21:
        if (v5) {
          double v13 = a4 * 10.0 + 35.0 + 10.0;
        }
        else {
          double v13 = a4 * 10.0 + 35.0;
        }
        goto LABEL_24;
      }
      if (v12)
      {
        double v13 = 15.0;
        double v14 = 1000.0;
        goto LABEL_24;
      }
    }
    else
    {
      if ([(_UIPreviewInteractionHighlighter *)self clickEffectPhase])
      {
        double v14 = dbl_186B9B630[a4 > 0.95];
        double v13 = 26.0;
LABEL_24:
        v15 = [MEMORY[0x1E4F29128] UUID];
        uint64_t v16 = (NSUUID *)[v15 copy];
        contentAnimationIdentifier = self->_contentAnimationIdentifier;
        self->_contentAnimationIdentifier = v16;

        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __82___UIPreviewInteractionHighlighter__updateFromInteraction_fractionComplete_ended___block_invoke;
        v38[3] = &unk_1E52E7F00;
        v38[4] = self;
        id v39 = v8;
        double v41 = a4;
        BOOL v42 = v5;
        v40 = v9;
        uint64_t v30 = MEMORY[0x1E4F143A8];
        uint64_t v31 = 3221225472;
        double v32 = __82___UIPreviewInteractionHighlighter__updateFromInteraction_fractionComplete_ended___block_invoke_2;
        double v33 = &unk_1E5300780;
        v34 = self;
        id v35 = v15;
        BOOL v37 = v5;
        id v36 = v39;
        id v18 = v15;
        +[UIView _animateUsingSpringWithTension:0 friction:v38 interactive:&v30 animations:v14 completion:v13];

        goto LABEL_25;
      }
      if (self->_preferredAnimationStyle == 1)
      {
        double v14 = 1000.0;
        goto LABEL_21;
      }
    }
    if (v5) {
      double v13 = a4 * 4.0 + 18.0 + 4.0;
    }
    else {
      double v13 = a4 * 4.0 + 18.0;
    }
    goto LABEL_19;
  }
LABEL_25:
  if ([(_UIPreviewInteractionHighlighter *)self shouldApplyEffectsOnProxyView]
    && [(_UIPreviewInteractionHighlighter *)self shouldApplyBackgroundEffects])
  {
    if (v5)
    {
      self->_animatesBackgroundEffects = 1;
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      double v27 = __82___UIPreviewInteractionHighlighter__updateFromInteraction_fractionComplete_ended___block_invoke_3;
      double v28 = &unk_1E52DA9D0;
      v29 = self;
      double v19 = 0.0;
      double v20 = &v25;
      double v21 = v9;
      uint64_t v22 = 0;
    }
    else
    {
      unint64_t v23 = [(_UIPreviewInteractionHighlighter *)self clickEffectPhase];
      BOOL v24 = [(_UIPreviewInteractionHighlighter *)self shouldApplyBackgroundEffects];
      double v19 = 0.0;
      if (v24 && v23 != 1)
      {
        if ([(_UIPreviewInteractionHighlighter *)self clickEffectPhase] == 2)
        {
          double v19 = 1.2;
        }
        else
        {
          double v19 = (a4 + -0.3) * 1.2 / 0.7 + 0.0;
          if (v19 > 1.2) {
            double v19 = (log10(v19 / 1.2) + 1.0) * 1.2;
          }
        }
        if (v19 < 0.0) {
          double v19 = 0.0;
        }
      }
      double v20 = (uint64_t *)&__block_literal_global_431;
      double v21 = v9;
      uint64_t v22 = 1;
    }
    -[_UIInteractiveHighlightEffect applyBackgroundEffectWithMagnitude:interactive:completion:](v21, "applyBackgroundEffectWithMagnitude:interactive:completion:", v22, v20, v19, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34);
  }
}

- (void)_finalizeAfterInteractionIfNeeded
{
  if (!self->_animatesContentEffects && !self->_animatesBackgroundEffects) {
    [(_UIPreviewInteractionHighlighter *)self _finalizeAfterInteraction];
  }
}

- (void)_finalizeAfterInteraction
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = (void (**)(void))_Block_copy(self->_privateCompletionBlock);
  id privateCompletionBlock = self->_privateCompletionBlock;
  self->_id privateCompletionBlock = 0;

  if (v3) {
    v3[2](v3);
  }
  BOOL v5 = (void (**)(void))_Block_copy(self->_completionBlock);
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = 0;

  if (v5) {
    v5[2](v5);
  }
  [(_UIInteractiveHighlightEffect *)self->_interactiveHighlightEffect finalizeEffect];
  interactiveHighlightEffect = self->_interactiveHighlightEffect;
  self->_interactiveHighlightEffect = 0;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_accessoryHighlightEffects;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12++), "finalizeEffect", (void)v15);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  accessoryHighlightEffects = self->_accessoryHighlightEffects;
  self->_accessoryHighlightEffects = 0;

  [(_UIInteractiveHighlightEffect *)self->_presentationControllerHighlightEffect finalizeEffect];
  presentationControllerHighlightEffect = self->_presentationControllerHighlightEffect;
  self->_presentationControllerHighlightEffect = 0;
}

- (void)_prepareForViewControllerPresentation:(id)a3
{
  interactiveHighlightEffect = self->_interactiveHighlightEffect;
  id v5 = a3;
  id v19 = [(_UIInteractiveHighlightEffect *)interactiveHighlightEffect portalView];
  LODWORD(interactiveHighlightEffect) = [v5 shouldUpdateFromViewBeforePresentation];

  if (interactiveHighlightEffect)
  {
    id v6 = [v19 sourceView];
    uint64_t v7 = [(_UIInteractiveHighlightEffect *)self->_interactiveHighlightEffect effectView];
    [v6 bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    long long v16 = [v7 superview];
    objc_msgSend(v6, "convertRect:toCoordinateSpace:", v16, v9, v11, v13, v15);
    objc_msgSend(v7, "setFrame:");
  }
  [v19 setMatchesPosition:0];
  long long v17 = [(_UIInteractiveHighlightEffect *)self->_interactiveHighlightEffect environment];
  [v17 setHidden:0 animated:1 completion:0];
  long long v18 = [v17 contentView];
  [v18 setUserInteractionEnabled:1];
}

- (void)_animateAlongsideViewControllerPresentationDismiss
{
  id v6 = [(_UIInteractiveHighlightEffect *)self->_interactiveHighlightEffect environment];
  v3 = [v6 contentView];
  [v3 setUserInteractionEnabled:0];

  v4 = [(_UIInteractiveHighlightEffect *)self->_interactiveHighlightEffect portalView];
  [v4 setMatchesPosition:1];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_interaction);
  [(_UIPreviewInteractionHighlighter *)self _updateFromInteraction:WeakRetained fractionComplete:1 ended:0.0];
}

- (void)_animateForDelayedViewControllerPresentation
{
  id v2 = [(_UIInteractiveHighlightEffect *)self->_interactiveHighlightEffect environment];
  [v2 setHidden:1 animated:1 completion:0];
}

- (void)_delayedViewControllerPresentationDidCancel
{
  id v3 = [(_UIInteractiveHighlightEffect *)self->_interactiveHighlightEffect environment];
  [v3 reset];
  [(_UIPreviewInteractionHighlighter *)self _finalizeAfterInteraction];
}

- (void)_applyHighlightEffectsToViewControllerDuringCancellation:(id)a3
{
  v4 = [a3 transitionCoordinator];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __93___UIPreviewInteractionHighlighter__applyHighlightEffectsToViewControllerDuringCancellation___block_invoke;
  v5[3] = &unk_1E52DA598;
  v5[4] = self;
  [v4 animateAlongsideTransition:v5 completion:0];
}

- (void)_prepareContentEffectsForInteraction:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  int v6 = [WeakRetained conformsToProtocol:&unk_1ED4D25A0];
  id v7 = WeakRetained;
  if (v6)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      uint64_t v25 = __73___UIPreviewInteractionHighlighter__prepareContentEffectsForInteraction___block_invoke;
      uint64_t v26 = &unk_1E52D9F98;
      id v27 = v7;
      id v28 = v4;
      +[UIView performWithoutAnimation:&v23];
    }
    if (objc_opt_respondsToSelector()) {
      self->_preferredAnimationStyle = [v7 _preferredHighlightAnimationStyleForInteraction:v4];
    }
    objc_storeWeak((id *)&self->_interactiveHighlightView, v7);
    goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_10:

    goto LABEL_11;
  }
  char v8 = objc_opt_respondsToSelector();

  if (v8) {
    objc_storeWeak((id *)&self->_compatibilityHighlightView, v7);
  }
LABEL_11:
  objc_msgSend(v7, "frame", v23, v24, v25, v26);
  CGFloat x = v29.origin.x;
  CGFloat y = v29.origin.y;
  CGFloat width = v29.size.width;
  CGFloat height = v29.size.height;
  double v13 = CGRectGetWidth(v29);
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  double v14 = CGRectGetHeight(v30);
  if (v13 >= v14) {
    double v14 = v13;
  }
  double v15 = (v14 + -153.0) * -0.016 / 153.0 + 1.04;
  if (v15 < 1.024) {
    double v15 = 1.024;
  }
  self->_preferredMinimumScale = v15;
  [v7 frame];
  CGFloat v16 = v31.origin.x;
  CGFloat v17 = v31.origin.y;
  CGFloat v18 = v31.size.width;
  CGFloat v19 = v31.size.height;
  double v20 = CGRectGetWidth(v31);
  v32.origin.CGFloat x = v16;
  v32.origin.CGFloat y = v17;
  v32.size.CGFloat width = v18;
  v32.size.CGFloat height = v19;
  double v21 = CGRectGetHeight(v32);
  if (v20 >= v21) {
    double v21 = v20;
  }
  double v22 = (v21 + -153.0) * -0.13 / 229.5 + 1.16;
  if (v22 < 1.03) {
    double v22 = 1.03;
  }
  self->_preferredMaximumScale = v22;
}

- (void)_prepareAccessoryViewsForScrollView:(id)a3 environment:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  char v8 = [v14 _verticalScrollIndicator];
  if (v8)
  {
    double v9 = [v6 interactiveHighlightEffectForView:v8 options:0];
    [v7 addObject:v9];
  }
  double v10 = [v14 _horizontalScrollIndicator];
  if (v10)
  {
    double v11 = [v6 interactiveHighlightEffectForView:v10 options:0];
    [v7 addObject:v11];
  }
  double v12 = (NSArray *)[v7 copy];
  accessoryHighlightEffects = self->_accessoryHighlightEffects;
  self->_accessoryHighlightEffects = v12;
}

- (void)_setHighlighted:(BOOL)a3 forViewIfNeeded:(id)a4
{
  int v4 = a3;
  id v5 = a4;
  if ([v5 isHighlighted] != v4)
  {
    if (v4) {
      double v6 = 0.2;
    }
    else {
      double v6 = 0.3;
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68___UIPreviewInteractionHighlighter__setHighlighted_forViewIfNeeded___block_invoke;
    v7[3] = &unk_1E52D9FC0;
    id v8 = v5;
    char v9 = v4;
    +[UIView animateWithDuration:6 delay:v7 options:0 animations:v6 completion:0.0];
  }
}

- (BOOL)shouldApplyEffectsOnProxyView
{
  return self->_shouldApplyEffectsOnProxyView;
}

- (void)setShouldApplyEffectsOnProxyView:(BOOL)a3
{
  self->_shouldApplyEffectsOnProxyView = a3;
}

- (BOOL)shouldApplyContentEffects
{
  return self->_shouldApplyContentEffects;
}

- (void)setShouldApplyContentEffects:(BOOL)a3
{
  self->_shouldApplyContentEffects = a3;
}

- (BOOL)shouldApplyBackgroundEffects
{
  return self->_shouldApplyBackgroundEffects;
}

- (void)setShouldApplyBackgroundEffects:(BOOL)a3
{
  self->_shouldApplyBackgroundEffects = a3;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (BOOL)shouldEndWithCancelAnimation
{
  return self->_shouldEndWithCancelAnimation;
}

- (void)setShouldEndWithCancelAnimation:(BOOL)a3
{
  self->_shouldEndWithCancelAnimation = a3;
}

- (unint64_t)clickEffectPhase
{
  return self->_clickEffectPhase;
}

- (void)setClickEffectPhase:(unint64_t)a3
{
  self->_clickEffectPhase = a3;
}

- (id)privateCompletionBlock
{
  return self->_privateCompletionBlock;
}

- (void)setPrivateCompletionBlock:(id)a3
{
}

- (UIView)customContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customContainerView);
  return (UIView *)WeakRetained;
}

- (void)setCustomContainerView:(id)a3
{
}

- (UIView)customBackgroundEffectView
{
  return self->_customBackgroundEffectView;
}

- (void)setCustomBackgroundEffectView:(id)a3
{
}

- (BOOL)shouldTransferViewOwnership
{
  return self->_shouldTransferViewOwnership;
}

- (void)setShouldTransferViewOwnership:(BOOL)a3
{
  self->_shouldTransferViewOwnership = a3;
}

- (BOOL)cancelsInteractionWhenScrolling
{
  return self->_cancelsInteractionWhenScrolling;
}

- (void)setCancelsInteractionWhenScrolling:(BOOL)a3
{
  self->_cancelsInteractionWhenScrolling = a3;
}

- (id)backgroundEffectApplyBlock
{
  return self->_backgroundEffectApplyBlock;
}

- (void)setBackgroundEffectApplyBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_backgroundEffectApplyBlock, 0);
  objc_storeStrong((id *)&self->_customBackgroundEffectView, 0);
  objc_destroyWeak((id *)&self->_customContainerView);
  objc_storeStrong(&self->_privateCompletionBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_contentAnimationIdentifier, 0);
  objc_destroyWeak((id *)&self->_interaction);
  objc_storeStrong((id *)&self->_presentationControllerHighlightEffect, 0);
  objc_storeStrong((id *)&self->_accessoryHighlightEffects, 0);
  objc_storeStrong((id *)&self->_interactiveHighlightEffect, 0);
  objc_destroyWeak((id *)&self->_compatibilityHighlightView);
  objc_destroyWeak((id *)&self->_interactiveHighlightView);
  objc_destroyWeak((id *)&self->_view);
}

@end