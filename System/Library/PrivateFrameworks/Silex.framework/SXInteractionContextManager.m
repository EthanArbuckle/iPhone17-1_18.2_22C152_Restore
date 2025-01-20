@interface SXInteractionContextManager
- (BOOL)shouldStartPreviewing;
- (NSMutableArray)providers;
- (SXInteractionContextManager)initWithViewport:(id)a3;
- (SXInteractionContextManagerDelegate)delegate;
- (SXInteractionContextProviding)activeProvider;
- (SXViewport)viewport;
- (UITargetedPreview)activePreview;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)toolTipInteraction:(id)a3 configurationAtPoint:(CGPoint)a4;
- (void)addProvider:(id)a3;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4;
- (void)didEndPreviewing;
- (void)registerOnView:(id)a3;
- (void)setActivePreview:(id)a3;
- (void)setActiveProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)willStartPreviewing;
@end

@implementation SXInteractionContextManager

- (SXInteractionContextManager)initWithViewport:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SXInteractionContextManager;
  v6 = [(SXInteractionContextManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewport, a3);
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    providers = v7->_providers;
    v7->_providers = (NSMutableArray *)v8;
  }
  return v7;
}

- (void)registerOnView:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F1C588];
  id v5 = a3;
  id v7 = (id)[[v4 alloc] initWithDelegate:self];
  [v5 addInteraction:v7];
  id v6 = objc_alloc_init(MEMORY[0x263F1CAD8]);
  [v6 setDelegate:self];
  [v5 addInteraction:v6];
}

- (void)addProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(SXInteractionContextManager *)self providers];
  [v5 addObject:v4];
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ([(SXInteractionContextManager *)self shouldStartPreviewing])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = [(SXInteractionContextManager *)self providers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          v13 = [(SXInteractionContextManager *)self viewport];
          v14 = objc_msgSend(v12, "contextMenuAtLocation:viewport:", v13, x, y);

          if (v14)
          {
            [(SXInteractionContextManager *)self setActiveProvider:v12];
            goto LABEL_13;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    v14 = 0;
LABEL_13:
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __103__SXInteractionContextManager_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration___block_invoke;
  v7[3] = &unk_264651158;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [v6 addCompletion:v7];
}

void __103__SXInteractionContextManager_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) activeProvider];
  v2 = [*(id *)(a1 + 40) previewViewController];
  [v3 commitPreviewViewController:v2];
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = [v5 view];
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  objc_super v11 = [(SXInteractionContextManager *)self activeProvider];
  v12 = [(SXInteractionContextManager *)self viewport];
  v13 = objc_msgSend(v11, "targetedPreviewAtLocation:viewport:", v12, v8, v10);
  [(SXInteractionContextManager *)self setActivePreview:v13];

  return [(SXInteractionContextManager *)self activePreview];
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __87__SXInteractionContextManager_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
  v9[3] = &unk_2646511F8;
  v9[4] = self;
  uint64_t v7 = MEMORY[0x223CA5030](v9);
  double v8 = (void *)v7;
  if (v6) {
    [v6 addCompletion:v7];
  }
  else {
    (*(void (**)(uint64_t))(v7 + 16))(v7);
  }
  [(SXInteractionContextManager *)self didEndPreviewing];
}

uint64_t __87__SXInteractionContextManager_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) activePreview];
  id v3 = [v2 view];
  [v3 removeFromSuperview];

  [*(id *)(a1 + 32) setActivePreview:0];
  id v4 = *(void **)(a1 + 32);
  return [v4 setActiveProvider:0];
}

- (id)toolTipInteraction:(id)a3 configurationAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [(SXInteractionContextManager *)self providers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
      if (objc_opt_respondsToSelector())
      {
        v13 = [(SXInteractionContextManager *)self viewport];
        v14 = objc_msgSend(v12, "toolTipAtLocation:viewport:", v13, x, y);

        if (v14) {
          break;
        }
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v14 = 0;
  }

  return v14;
}

- (BOOL)shouldStartPreviewing
{
  id v3 = [(SXInteractionContextManager *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  id v5 = [(SXInteractionContextManager *)self delegate];
  char v6 = [v5 shouldStartPreviewForInteractionContextManager:self];

  return v6;
}

- (void)willStartPreviewing
{
  id v3 = [(SXInteractionContextManager *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SXInteractionContextManager *)self delegate];
    [v5 willStartPreviewingForInteractionContextManager:self];
  }
}

- (void)didEndPreviewing
{
  id v3 = [(SXInteractionContextManager *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SXInteractionContextManager *)self delegate];
    [v5 willEndPreviewingForInteractionContextManager:self];
  }
}

- (SXInteractionContextManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (SXInteractionContextManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (NSMutableArray)providers
{
  return self->_providers;
}

- (SXInteractionContextProviding)activeProvider
{
  return self->_activeProvider;
}

- (void)setActiveProvider:(id)a3
{
}

- (UITargetedPreview)activePreview
{
  return self->_activePreview;
}

- (void)setActivePreview:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePreview, 0);
  objc_storeStrong((id *)&self->_activeProvider, 0);
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end