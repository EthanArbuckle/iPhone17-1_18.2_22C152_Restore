@interface SXComponentInteractionManager
- (BOOL)accessibilityShouldHandleInteractionForComponentView:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasInteractionForLocation:(CGPoint)a3;
- (BOOL)wantsPointyHand;
- (CGPoint)longPressStartLocation;
- (SXComponentInteractionHandlerManager)interactionHandlerManager;
- (SXComponentInteractionManager)initWithInteractionHandlerManager:(id)a3 viewport:(id)a4;
- (SXComponentInteractionPreview)currentPreview;
- (SXComponentView)currentComponentView;
- (SXDelayed)longPressDelay;
- (SXViewport)viewport;
- (UILongPressGestureRecognizer)longPressGestureRecognizer;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (id)previewViewControllerForLocation:(CGPoint)a3;
- (void)animateHighlight:(BOOL)a3 forComponentView:(id)a4;
- (void)cancelInteractionForComponentView:(id)a3;
- (void)commitViewController:(id)a3;
- (void)handleInteraction:(id)a3 withType:(unint64_t)a4;
- (void)handleLongPressGesture:(id)a3;
- (void)handleTapGesture:(id)a3;
- (void)setCurrentComponentView:(id)a3;
- (void)setCurrentPreview:(id)a3;
- (void)setLongPressDelay:(id)a3;
- (void)setLongPressStartLocation:(CGPoint)a3;
- (void)setWantsPointyHand:(BOOL)a3;
- (void)toggleHighlightForComponentView:(id)a3;
- (void)updateHighlight:(BOOL)a3 forComponentView:(id)a4;
@end

@implementation SXComponentInteractionManager

- (SXComponentInteractionManager)initWithInteractionHandlerManager:(id)a3 viewport:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SXComponentInteractionManager;
  v9 = [(SXComponentInteractionManager *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_interactionHandlerManager, a3);
    objc_storeStrong((id *)&v10->_viewport, a4);
    uint64_t v11 = [objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v10 action:sel_handleTapGesture_];
    tapGestureRecognizer = v10->_tapGestureRecognizer;
    v10->_tapGestureRecognizer = (UITapGestureRecognizer *)v11;

    [(UITapGestureRecognizer *)v10->_tapGestureRecognizer setCancelsTouchesInView:0];
    v13 = [v8 view];
    [v13 addGestureRecognizer:v10->_tapGestureRecognizer];

    uint64_t v14 = [objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:v10 action:sel_handleLongPressGesture_];
    longPressGestureRecognizer = v10->_longPressGestureRecognizer;
    v10->_longPressGestureRecognizer = (UILongPressGestureRecognizer *)v14;

    [(UILongPressGestureRecognizer *)v10->_longPressGestureRecognizer setCancelsTouchesInView:0];
    [(UILongPressGestureRecognizer *)v10->_longPressGestureRecognizer setMinimumPressDuration:0.07];
    [(UILongPressGestureRecognizer *)v10->_longPressGestureRecognizer setDelegate:v10];
    v16 = [v8 view];
    [v16 addGestureRecognizer:v10->_longPressGestureRecognizer];

    [(UITapGestureRecognizer *)v10->_tapGestureRecognizer requireGestureRecognizerToFail:v10->_longPressGestureRecognizer];
  }

  return v10;
}

- (BOOL)hasInteractionForLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = [(SXComponentInteractionManager *)self interactionHandlerManager];
  v6 = objc_msgSend(v5, "componentViewForLocation:", x, y);
  BOOL v7 = v6 != 0;

  return v7;
}

- (id)previewViewControllerForLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v27 = *MEMORY[0x263EF8340];
  v6 = [(SXComponentInteractionManager *)self interactionHandlerManager];
  BOOL v7 = objc_msgSend(v6, "componentViewForLocation:", x, y);

  [(SXComponentInteractionManager *)self cancelInteractionForComponentView:v7];
  [(SXComponentInteractionManager *)self animateHighlight:0 forComponentView:v7];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = [(SXComponentInteractionManager *)self interactionHandlerManager];
  v9 = [v8 interactionsForComponentView:v7];

  id v10 = (id)[v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v13 handlesType:8])
        {
          id v10 = v13;
          goto LABEL_11;
        }
      }
      id v10 = (id)[v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  uint64_t v14 = [v10 handler];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v14 previewViewController], (v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v16 = v15;
    v17 = -[SXComponentInteractionPreview initWithInteraction:viewController:]((id *)[SXComponentInteractionPreview alloc], v10, v15);
    [(SXComponentInteractionManager *)self setCurrentPreview:v17];

    objc_super v18 = [SXComponentInteractionPreviewContext alloc];
    v19 = [v10 componentView];
    [v19 absoluteFrame];
    v20 = -[SXComponentInteractionPreviewContext initWithViewController:sourceRect:](v18, "initWithViewController:sourceRect:", v16);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)commitViewController:(id)a3
{
  id v11 = a3;
  if (v11)
  {
    uint64_t v4 = [(SXComponentInteractionManager *)self currentPreview];
    if (v4)
    {
      v5 = (void *)v4;
      v6 = [(SXComponentInteractionManager *)self currentPreview];
      -[SXComponentInteractionPreview viewController](v6);
      id v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 == v11)
      {
        id v8 = [(SXComponentInteractionManager *)self currentPreview];
        v9 = -[SXFullscreenCaption text]((uint64_t)v8);
        id v10 = [v9 handler];

        if (objc_opt_respondsToSelector()) {
          [v10 commitViewController:v11];
        }
        [(SXComponentInteractionManager *)self setCurrentPreview:0];
      }
    }
  }
}

- (void)handleTapGesture:(id)a3
{
  id v24 = a3;
  BOOL v4 = [v24 state] == 3;
  v5 = v24;
  if (v4)
  {
    v6 = [v24 view];
    id v7 = [v6 superview];
    [v24 locationInView:v7];
    double v9 = v8;
    double v11 = v10;

    v12 = [v24 view];
    v13 = [v12 superview];
    uint64_t v14 = [v24 view];
    objc_msgSend(v13, "convertPoint:toView:", v14, v9, v11);
    double v16 = v15;
    double v18 = v17;

    v19 = [(SXComponentInteractionManager *)self interactionHandlerManager];
    v20 = objc_msgSend(v19, "componentViewForLocation:", v16, v18);

    v21 = [(SXComponentInteractionManager *)self interactionHandlerManager];
    long long v22 = [v21 interactionsForComponentView:v20 type:2];

    long long v23 = [v22 firstObject];
    if (v23)
    {
      [(SXComponentInteractionManager *)self handleInteraction:v23 withType:2];
      [(SXComponentInteractionManager *)self toggleHighlightForComponentView:v20];
    }

    v5 = v24;
  }
}

- (BOOL)accessibilityShouldHandleInteractionForComponentView:(id)a3
{
  id v4 = a3;
  v5 = [(SXComponentInteractionManager *)self interactionHandlerManager];
  v6 = [v5 interactionsForComponentView:v4 type:2];
  id v7 = [v6 firstObject];

  if (v7)
  {
    [(SXComponentInteractionManager *)self handleInteraction:v7 withType:2];
    [(SXComponentInteractionManager *)self animateHighlight:0 forComponentView:v4];
  }

  return v7 != 0;
}

- (void)handleLongPressGesture:(id)a3
{
  id v4 = a3;
  v5 = [(SXComponentInteractionManager *)self tapGestureRecognizer];
  [v5 cancel];

  v6 = [v4 view];
  id v7 = [v6 superview];
  [v4 locationInView:v7];
  double v9 = v8;
  double v11 = v10;

  v12 = [v4 view];
  v13 = [v12 superview];
  uint64_t v14 = [v4 view];
  objc_msgSend(v13, "convertPoint:toView:", v14, v9, v11);
  double v16 = v15;
  double v18 = v17;

  v19 = [(SXComponentInteractionManager *)self interactionHandlerManager];
  v20 = objc_msgSend(v19, "componentViewForLocation:", v16, v18);

  v21 = [(SXComponentInteractionManager *)self interactionHandlerManager];
  long long v22 = [v21 interactionsForComponentView:v20 type:4];
  uint64_t v23 = [v22 firstObject];

  id v24 = [(SXComponentInteractionManager *)self interactionHandlerManager];
  long long v25 = [v24 interactionsForComponentView:v20 type:2];
  uint64_t v26 = [v25 firstObject];

  if (!v20 || !(v23 | v26))
  {
    [v4 cancel];
    goto LABEL_31;
  }
  if ([v4 state] == 1)
  {
    [(SXComponentInteractionManager *)self setCurrentComponentView:v20];
    [(SXComponentInteractionManager *)self animateHighlight:1 forComponentView:v20];
    -[SXComponentInteractionManager setLongPressStartLocation:](self, "setLongPressStartLocation:", v9, v11);
  }
  else if ([v4 state] == 2 || objc_msgSend(v4, "state") == 3)
  {
    uint64_t v27 = [(SXComponentInteractionManager *)self currentComponentView];

    if (v27 != v20)
    {
      [(SXComponentInteractionManager *)self cancelInteractionForComponentView:v20];
      [(SXComponentInteractionManager *)self animateHighlight:0 forComponentView:v20];
      goto LABEL_31;
    }
  }
  if ([v4 state] == 1)
  {
    if (v23)
    {
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __56__SXComponentInteractionManager_handleLongPressGesture___block_invoke;
      v34[3] = &unk_264651180;
      v34[4] = self;
      id v35 = (id)v23;
      id v36 = v20;
      v28 = +[SXDelayed execute:v34 delay:1.0];
      [(SXComponentInteractionManager *)self setLongPressDelay:v28];
    }
    goto LABEL_27;
  }
  if ([v4 state] == 2)
  {
    [(SXComponentInteractionManager *)self longPressStartLocation];
    double v30 = v29 - v9;
    if (v30 < 0.0) {
      double v30 = -v30;
    }
    if (v30 <= 10.0)
    {
      [(SXComponentInteractionManager *)self longPressStartLocation];
      double v32 = v31 - v11;
      double v33 = -(v31 - v11);
      if (v32 < 0.0) {
        double v32 = v33;
      }
      if (v32 <= 10.0) {
        goto LABEL_27;
      }
    }
    goto LABEL_25;
  }
  if ([v4 state] == 3)
  {
    [(SXComponentInteractionManager *)self handleInteraction:v26 withType:2];
LABEL_26:
    [(SXComponentInteractionManager *)self animateHighlight:0 forComponentView:v20];
    goto LABEL_27;
  }
  if ([v4 state] == 4 || objc_msgSend(v4, "state") == 5)
  {
LABEL_25:
    [(SXComponentInteractionManager *)self cancelInteractionForComponentView:v20];
    goto LABEL_26;
  }
LABEL_27:
  if ([v4 state] == 3 || objc_msgSend(v4, "state") == 4 || objc_msgSend(v4, "state") == 5) {
    -[SXComponentInteractionManager setLongPressStartLocation:](self, "setLongPressStartLocation:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  }
LABEL_31:
}

uint64_t __56__SXComponentInteractionManager_handleLongPressGesture___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) handleInteraction:*(void *)(a1 + 40) withType:4];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 animateHighlight:0 forComponentView:v3];
}

- (void)handleInteraction:(id)a3 withType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [v6 handler];
  double v8 = [v6 componentView];
  double v9 = [v6 componentView];
  [v9 contentFrame];
  objc_msgSend(v7, "handleInteractionType:sourceView:sourceRect:", a4, v8);

  id v10 = [v6 componentView];

  [(SXComponentInteractionManager *)self cancelInteractionForComponentView:v10];
}

- (void)cancelInteractionForComponentView:(id)a3
{
  id v4 = a3;
  id v5 = [(SXComponentInteractionManager *)self currentComponentView];

  if (v5 == v4)
  {
    id v6 = [(SXComponentInteractionManager *)self longPressDelay];
    [v6 cancel];

    id v7 = [(SXComponentInteractionManager *)self tapGestureRecognizer];
    [v7 cancel];

    double v8 = [(SXComponentInteractionManager *)self longPressGestureRecognizer];
    [v8 cancel];
  }
  [(SXComponentInteractionManager *)self setCurrentComponentView:0];
}

- (void)animateHighlight:(BOOL)a3 forComponentView:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x263F1CB60];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__SXComponentInteractionManager_animateHighlight_forComponentView___block_invoke;
  v9[3] = &unk_2646535B8;
  BOOL v11 = a3;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 animateWithDuration:2 delay:v9 options:0 animations:0.1 completion:0.0];
}

uint64_t __67__SXComponentInteractionManager_animateHighlight_forComponentView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateHighlight:*(unsigned __int8 *)(a1 + 48) forComponentView:*(void *)(a1 + 40)];
}

- (void)toggleHighlightForComponentView:(id)a3
{
  id v4 = a3;
  [(SXComponentInteractionManager *)self animateHighlight:1 forComponentView:v4];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__SXComponentInteractionManager_toggleHighlightForComponentView___block_invoke;
  v7[3] = &unk_264651158;
  v7[4] = self;
  id v8 = v4;
  id v5 = v4;
  id v6 = +[SXDelayed execute:v7 delay:0.2];
}

uint64_t __65__SXComponentInteractionManager_toggleHighlightForComponentView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) animateHighlight:0 forComponentView:*(void *)(a1 + 40)];
}

- (void)updateHighlight:(BOOL)a3 forComponentView:(id)a4
{
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a4;
  id v7 = [a3 view];
  [v6 locationInView:v7];
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v12 = [(SXComponentInteractionManager *)self viewport];
  [v12 dynamicBounds];
  v14.double x = v9;
  v14.double y = v11;
  LOBYTE(self) = CGRectContainsPoint(v15, v14);

  return (char)self;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = [(SXComponentInteractionManager *)self viewport];
  id v5 = [v4 view];
  id v6 = [v5 panGestureRecognizer];
  if ([v6 state] == 1)
  {
    BOOL v7 = 0;
  }
  else
  {
    double v8 = [(SXComponentInteractionManager *)self viewport];
    CGFloat v9 = [v8 view];
    double v10 = [v9 panGestureRecognizer];
    BOOL v7 = [v10 state] != 2;
  }
  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (SXComponentInteractionHandlerManager)interactionHandlerManager
{
  return self->_interactionHandlerManager;
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (BOOL)wantsPointyHand
{
  return self->_wantsPointyHand;
}

- (void)setWantsPointyHand:(BOOL)a3
{
  self->_wantsPointyHand = a3;
}

- (SXDelayed)longPressDelay
{
  return self->_longPressDelay;
}

- (void)setLongPressDelay:(id)a3
{
}

- (CGPoint)longPressStartLocation
{
  double x = self->_longPressStartLocation.x;
  double y = self->_longPressStartLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLongPressStartLocation:(CGPoint)a3
{
  self->_longPressStartLocation = a3;
}

- (SXComponentInteractionPreview)currentPreview
{
  return self->_currentPreview;
}

- (void)setCurrentPreview:(id)a3
{
}

- (SXComponentView)currentComponentView
{
  return self->_currentComponentView;
}

- (void)setCurrentComponentView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentComponentView, 0);
  objc_storeStrong((id *)&self->_currentPreview, 0);
  objc_storeStrong((id *)&self->_longPressDelay, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
  objc_storeStrong((id *)&self->_interactionHandlerManager, 0);
}

@end