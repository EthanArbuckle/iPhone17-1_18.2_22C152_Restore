@interface SXComponentInteractionContextProvider
- (SXActionManager)actionManager;
- (SXComponentInteraction)currentInteraction;
- (SXComponentInteractionContextProvider)initWithComponentInteractionHandlerManager:(id)a3 actionManager:(id)a4;
- (SXComponentInteractionHandlerManager)componentInteractionHandlerManager;
- (id)contextMenuAtLocation:(CGPoint)a3 viewport:(id)a4;
- (id)targetedPreviewAtLocation:(CGPoint)a3 viewport:(id)a4;
- (id)toolTipAtLocation:(CGPoint)a3 viewport:(id)a4;
- (void)commitPreviewViewController:(id)a3;
- (void)setCurrentInteraction:(id)a3;
@end

@implementation SXComponentInteractionContextProvider

- (SXComponentInteractionContextProvider)initWithComponentInteractionHandlerManager:(id)a3 actionManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXComponentInteractionContextProvider;
  v9 = [(SXComponentInteractionContextProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_componentInteractionHandlerManager, a3);
    objc_storeStrong((id *)&v10->_actionManager, a4);
  }

  return v10;
}

- (id)contextMenuAtLocation:(CGPoint)a3 viewport:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = -[SXComponentInteractionHandlerManager componentViewForLocation:](self->_componentInteractionHandlerManager, "componentViewForLocation:", a4, a3.x, a3.y);
  if (v5)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = -[SXComponentInteractionHandlerManager interactionsForComponentView:](self->_componentInteractionHandlerManager, "interactionsForComponentView:", v5, 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          objc_super v12 = [v11 handler];
          if (objc_opt_respondsToSelector())
          {
            [(SXComponentInteractionContextProvider *)self setCurrentInteraction:v11];
            [v5 bounds];
            v13 = objc_msgSend(v12, "contextMenuForComponentView:sourceRect:", v5);

            goto LABEL_13;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    [(SXComponentInteractionContextProvider *)self setCurrentInteraction:0];
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (void)commitPreviewViewController:(id)a3
{
  v4 = [(SXComponentInteractionContextProvider *)self currentInteraction];
  v5 = [v4 handler];
  v6 = [(SXComponentInteractionContextProvider *)self currentInteraction];
  uint64_t v7 = [v6 componentView];
  uint64_t v8 = [(SXComponentInteractionContextProvider *)self currentInteraction];
  uint64_t v9 = [v8 componentView];
  [v9 bounds];
  objc_msgSend(v5, "handleInteractionType:sourceView:sourceRect:", 2, v7);

  [(SXComponentInteractionContextProvider *)self setCurrentInteraction:0];
}

- (id)targetedPreviewAtLocation:(CGPoint)a3 viewport:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = -[SXComponentInteractionHandlerManager componentViewForLocation:](self->_componentInteractionHandlerManager, "componentViewForLocation:", x, y);
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 absoluteFrame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    long long v18 = [v7 view];
    v19 = [v18 superview];
    objc_msgSend(v7, "convertRect:toView:", v19, v11, v13, v15, v17);
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;

    v28 = [v7 view];
    v29 = [v28 superview];
    v30 = objc_msgSend(v29, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 1, v21, v23, v25, v27, *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));

    if (v30)
    {
      objc_msgSend(v30, "setFrame:", v21, v23, v25, v27);
      v31 = [v7 view];
      v32 = [v31 superview];
      [v32 addSubview:v30];

      id v33 = objc_alloc_init(MEMORY[0x263F1C8C0]);
      v34 = [MEMORY[0x263F1C550] clearColor];
      [v33 setBackgroundColor:v34];

      v35 = (void *)[objc_alloc(MEMORY[0x263F1CA80]) initWithView:v30 parameters:v33];
    }
    else
    {
      v35 = 0;
    }
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (id)toolTipAtLocation:(CGPoint)a3 viewport:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v5 = -[SXComponentInteractionHandlerManager componentViewForLocation:](self->_componentInteractionHandlerManager, "componentViewForLocation:", a4, a3.x, a3.y);
  if (v5)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v6 = -[SXComponentInteractionHandlerManager interactionsForComponentView:](self->_componentInteractionHandlerManager, "interactionsForComponentView:", v5, 0);
    id v7 = (void *)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          double v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) handler];
          if (objc_opt_respondsToSelector())
          {
            double v11 = (void *)MEMORY[0x263F1CAD0];
            double v12 = [v10 toolTipForComponentView:v5];
            [v5 absoluteFrame];
            id v7 = objc_msgSend(v11, "configurationWithToolTip:inRect:", v12);

            goto LABEL_12;
          }
        }
        id v7 = (void *)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (SXComponentInteractionHandlerManager)componentInteractionHandlerManager
{
  return self->_componentInteractionHandlerManager;
}

- (SXActionManager)actionManager
{
  return self->_actionManager;
}

- (SXComponentInteraction)currentInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentInteraction);
  return (SXComponentInteraction *)WeakRetained;
}

- (void)setCurrentInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentInteraction);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_componentInteractionHandlerManager, 0);
}

@end