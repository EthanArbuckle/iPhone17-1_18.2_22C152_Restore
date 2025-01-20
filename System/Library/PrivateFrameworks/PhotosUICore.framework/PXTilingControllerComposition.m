@interface PXTilingControllerComposition
- (BOOL)isActive;
- (NSSet)tilingControllers;
- (PXScrollController)_scrollController;
- (PXTilingControllerCompositionInput)input;
- (PXTilingControllerCompositionObserver)observer;
- (PXTilingControllerCompositionOutput)output;
- (void)_setScrollController:(id)a3;
- (void)invalidateComposition;
- (void)invalidateCompositionWithContext:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setInput:(id)a3;
- (void)setObserver:(id)a3;
- (void)setOutput:(id)a3;
- (void)updateComposition;
@end

@implementation PXTilingControllerComposition

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_destroyWeak((id *)&self->__scrollController);
  objc_destroyWeak((id *)&self->_output);
  objc_destroyWeak((id *)&self->_input);
  objc_storeStrong((id *)&self->_tilingControllers, 0);
}

- (void)setObserver:(id)a3
{
}

- (PXTilingControllerCompositionObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (PXTilingControllerCompositionObserver *)WeakRetained;
}

- (PXScrollController)_scrollController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__scrollController);
  return (PXScrollController *)WeakRetained;
}

- (void)setOutput:(id)a3
{
}

- (PXTilingControllerCompositionOutput)output
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_output);
  return (PXTilingControllerCompositionOutput *)WeakRetained;
}

- (void)setInput:(id)a3
{
}

- (PXTilingControllerCompositionInput)input
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_input);
  return (PXTilingControllerCompositionInput *)WeakRetained;
}

- (NSSet)tilingControllers
{
  return self->_tilingControllers;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)_setScrollController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__scrollController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = objc_loadWeakRetained((id *)&self->__scrollController);

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)&self->__scrollController);
      v8 = +[PXTilingControllerCompositionEngine compositionEngineForScrollController:v7 createIfNeeded:0];

      [v8 unregisterComposition:self];
    }
    id v9 = objc_storeWeak((id *)&self->__scrollController, obj);
    v10 = +[PXTilingControllerCompositionEngine compositionEngineForScrollController:obj createIfNeeded:1];

    [v10 registerComposition:self];
    v5 = obj;
  }
}

- (void)invalidateCompositionWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(PXTilingControllerComposition *)self observer];
  [v5 setTilingControllerCompositionNeedsUpdate:self withContext:v4];
}

- (void)invalidateComposition
{
}

- (void)updateComposition
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXTilingControllerComposition.m" lineNumber:44 description:@"concrete subclass must implement"];
}

- (void)setActive:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3)
    {
      id v5 = [(PXTilingControllerComposition *)self tilingControllers];
      if (![v5 count])
      {
        v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:a2 object:self file:@"PXTilingControllerComposition.m" lineNumber:29 description:@"composition activated before it has any tiling controller"];
      }
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v6 = v5;
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
            uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "scrollController", (void)v15);
            if (v11)
            {
              v13 = (void *)v11;
              v12 = v6;
              goto LABEL_18;
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }

      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"PXTilingControllerComposition.m" lineNumber:36 description:@"composition activated before any of its tiling controller has a scroll controller"];
      v13 = 0;
LABEL_18:

      [(PXTilingControllerComposition *)self _setScrollController:v13];
    }
    else
    {
      [(PXTilingControllerComposition *)self _setScrollController:0];
    }
  }
}

@end