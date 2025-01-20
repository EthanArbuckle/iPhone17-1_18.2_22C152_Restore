@interface PXTilingControllerCompositionEngine
+ (id)compositionEngineForScrollController:(id)a3 createIfNeeded:(BOOL)a4;
- (BOOL)_needsUpdate;
- (BOOL)_updateCompositionIfNeeded;
- (CGPoint)convertPoint:(CGPoint)a3 fromTilingController:(id)a4;
- (CGPoint)originForTilingController:(id)a3;
- (CGPoint)preferredOriginForTilingController:(id)a3;
- (CGRect)contentBoundsForTilingController:(id)a3;
- (CGRect)convertRect:(CGRect)a3 fromTilingController:(id)a4;
- (CGRect)scrollBoundsForTilingController:(id)a3;
- (CGSize)_referenceSize;
- (NSArray)invalidationContexts;
- (NSArray)tilingControllersRequestingFocus;
- (NSHashTable)_compositions;
- (NSHashTable)_tilingControllers;
- (NSMutableArray)_invalidationContexts;
- (NSMutableArray)_tilingControllersRequestingFocus;
- (PXScrollController)_scrollController;
- (PXTilingControllerComposition)_composition;
- (PXTilingControllerCompositionEngine)init;
- (PXTilingControllerDefaultComposition)_defaultComposition;
- (UIEdgeInsets)_contentInset;
- (id)_initWithScrollController:(id)a3;
- (id)convertScrollInfo:(id)a3 fromTilingController:(id)a4;
- (id)scrollInfoForTilingController:(id)a3;
- (void)_beginUpdate;
- (void)_endUpdate;
- (void)_invalidateComposition;
- (void)_invalidateScrollControllerMetrics;
- (void)_performChanges:(id)a3;
- (void)_setComposition:(id)a3;
- (void)_setContentInset:(UIEdgeInsets)a3;
- (void)_setReferenceSize:(CGSize)a3;
- (void)_updateScrollControllerMetricsIfNeeded;
- (void)px_scrollControllerDidUpdate:(id)a3;
- (void)registerComposition:(id)a3;
- (void)registerTilingController:(id)a3;
- (void)setContentBounds:(CGRect)a3 scrollBounds:(CGRect)a4 scrollInfo:(id)a5;
- (void)setOrigin:(CGPoint)a3 forTilingController:(id)a4;
- (void)setReferenceSize:(CGSize)a3 contentInset:(UIEdgeInsets)a4 forTilingController:(id)a5;
- (void)setTilingControllerCompositionNeedsUpdate:(id)a3 withContext:(id)a4;
- (void)setTilingControllerNeedsUpdate:(id)a3;
- (void)tilingController:(id)a3 invalidatedWithContext:(int64_t)a4;
- (void)unregisterComposition:(id)a3;
- (void)unregisterTilingController:(id)a3;
@end

@implementation PXTilingControllerCompositionEngine

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__tilingControllersRequestingFocus, 0);
  objc_storeStrong((id *)&self->__invalidationContexts, 0);
  objc_storeStrong((id *)&self->__defaultComposition, 0);
  objc_storeStrong((id *)&self->__composition, 0);
  objc_storeStrong((id *)&self->__compositions, 0);
  objc_storeStrong((id *)&self->__tilingControllers, 0);
  objc_destroyWeak((id *)&self->__scrollController);
}

- (NSMutableArray)_tilingControllersRequestingFocus
{
  return self->__tilingControllersRequestingFocus;
}

- (NSMutableArray)_invalidationContexts
{
  return self->__invalidationContexts;
}

- (UIEdgeInsets)_contentInset
{
  double top = self->__contentInset.top;
  double left = self->__contentInset.left;
  double bottom = self->__contentInset.bottom;
  double right = self->__contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGSize)_referenceSize
{
  double width = self->__referenceSize.width;
  double height = self->__referenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PXTilingControllerDefaultComposition)_defaultComposition
{
  return self->__defaultComposition;
}

- (void)_setComposition:(id)a3
{
}

- (PXTilingControllerComposition)_composition
{
  return self->__composition;
}

- (NSHashTable)_compositions
{
  return self->__compositions;
}

- (NSHashTable)_tilingControllers
{
  return self->__tilingControllers;
}

- (PXScrollController)_scrollController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__scrollController);
  return (PXScrollController *)WeakRetained;
}

- (void)setOrigin:(CGPoint)a3 forTilingController:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = a4;
  objc_msgSend(v6, "setLayoutOrigin:", x, y);
  [v6 updateLayout];
}

- (void)setContentBounds:(CGRect)a3 scrollBounds:(CGRect)a4 scrollInfo:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v9 = a3.size.height;
  double v10 = a3.size.width;
  id v12 = a5;
  id v13 = [(PXTilingControllerCompositionEngine *)self _scrollController];
  objc_msgSend(v13, "setPresentedContentSize:", v10, v9);
  objc_msgSend(v13, "setContentBounds:", x, y, width, height);
  [v13 setScrollInfo:v12];
}

- (void)setReferenceSize:(CGSize)a3 contentInset:(UIEdgeInsets)a4 forTilingController:(id)a5
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  double height = a3.height;
  double width = a3.width;
  id v13 = a5;
  id v15 = v13;
  if (!self->_isUpdatingComposition)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PXTilingControllerCompositionEngine.m" lineNumber:344 description:@"unexpected composition output"];

    id v13 = v15;
  }
  objc_msgSend(v13, "setReferenceSize:contentInset:", width, height, top, left, bottom, right);
  [v15 updateMetrics];
}

- (id)convertScrollInfo:(id)a3 fromTilingController:(id)a4
{
  return (id)[a4 convertScrollInfoFromLayout:a3];
}

- (CGRect)convertRect:(CGRect)a3 fromTilingController:(id)a4
{
  objc_msgSend(a4, "convertRectFromLayout:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromTilingController:(id)a4
{
  objc_msgSend(a4, "convertPointFromLayout:", a3.x, a3.y);
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (id)scrollInfoForTilingController:(id)a3
{
  return (id)[a3 scrollInfo];
}

- (CGPoint)originForTilingController:(id)a3
{
  [a3 layoutOrigin];
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CGPoint)preferredOriginForTilingController:(id)a3
{
  [a3 layoutPreferredOrigin];
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CGRect)scrollBoundsForTilingController:(id)a3
{
  [a3 layoutScrollBounds];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)contentBoundsForTilingController:(id)a3
{
  [a3 layoutContentBounds];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (NSArray)invalidationContexts
{
  v2 = [(PXTilingControllerCompositionEngine *)self _invalidationContexts];
  double v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (NSArray)tilingControllersRequestingFocus
{
  v2 = [(PXTilingControllerCompositionEngine *)self _tilingControllersRequestingFocus];
  double v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)setTilingControllerCompositionNeedsUpdate:(id)a3 withContext:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  double v7 = v6;
  if (!self->_isUpdatingComposition)
  {
    if (v6)
    {
      v8 = [(PXTilingControllerCompositionEngine *)self _invalidationContexts];
      [v8 addObject:v7];
    }
    [(PXTilingControllerCompositionEngine *)self _invalidateComposition];
    double v9 = [(PXTilingControllerCompositionEngine *)self _scrollController];
    [v9 setNeedsUpdate];
  }
}

- (void)tilingController:(id)a3 invalidatedWithContext:(int64_t)a4
{
  id v6 = a3;
  if (!self->_isUpdatingComposition)
  {
    id v8 = v6;
    if (a4 == 1)
    {
      double v7 = [(PXTilingControllerCompositionEngine *)self _tilingControllersRequestingFocus];
      [v7 addObject:v8];
    }
    [(PXTilingControllerCompositionEngine *)self _invalidateComposition];
    id v6 = v8;
  }
}

- (void)setTilingControllerNeedsUpdate:(id)a3
{
  id v3 = [(PXTilingControllerCompositionEngine *)self _scrollController];
  [v3 setNeedsUpdate];
}

- (void)px_scrollControllerDidUpdate:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__PXTilingControllerCompositionEngine_px_scrollControllerDidUpdate___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXTilingControllerCompositionEngine *)self _performChanges:v3];
}

uint64_t __68__PXTilingControllerCompositionEngine_px_scrollControllerDidUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateScrollControllerMetrics];
}

- (BOOL)_updateCompositionIfNeeded
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  BOOL composition = self->_needsUpdateFlags.composition;
  if (!self->_needsUpdateFlags.composition) {
    return composition;
  }
  self->_needsUpdateFlags.BOOL composition = 0;
  double v5 = [(PXTilingControllerCompositionEngine *)self _composition];
  id v6 = [(PXTilingControllerCompositionEngine *)self _tilingControllers];
  double v7 = [v6 setRepresentation];

  id v8 = [(PXTilingControllerCompositionEngine *)self _compositions];
  double v9 = [v8 setRepresentation];

  id v10 = [(PXTilingControllerCompositionEngine *)self _compositions];
  char v11 = [v10 containsObject:v5];

  if ((v11 & 1) == 0)
  {

    goto LABEL_6;
  }
  if (!v5)
  {
LABEL_6:
    double v5 = [v9 anyObject];
    if (!v5)
    {
      double v5 = [(PXTilingControllerCompositionEngine *)self _defaultComposition];
    }
  }
  id v12 = [v5 tilingControllers];
  char v13 = [v12 isEqualToSet:v7];

  if ((v13 & 1) == 0)
  {
    v14 = [(PXTilingControllerCompositionEngine *)self _defaultComposition];

    if (v5 == v14)
    {
      id v15 = [(PXTilingControllerCompositionEngine *)self _defaultComposition];
      [v15 setTilingControllers:v7];
    }
    else
    {
      id v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:self file:@"PXTilingControllerCompositionEngine.m" lineNumber:216 description:@"composition doesn't include all tiling controllers"];
    }
  }
  [v5 setInput:self];
  [v5 setOutput:self];
  BOOL isUpdatingComposition = self->_isUpdatingComposition;
  self->_BOOL isUpdatingComposition = 1;
  v17 = [(PXTilingControllerCompositionEngine *)self _invalidationContexts];
  v18 = (void *)[v17 copy];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v19 = v7;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v37;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v36 + 1) + 8 * v23++) setCompositionInvalidationContexts:v18];
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v21);
  }

  [v5 updateComposition];
  v24 = [(PXTilingControllerCompositionEngine *)self _invalidationContexts];
  [v24 removeAllObjects];

  v25 = [(PXTilingControllerCompositionEngine *)self _tilingControllersRequestingFocus];
  [v25 removeAllObjects];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v26 = v19;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v33;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v33 != v29) {
          objc_enumerationMutation(v26);
        }
        objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * v30++), "setCompositionInvalidationContexts:", 0, (void)v32);
      }
      while (v28 != v30);
      uint64_t v28 = [v26 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v28);
  }

  self->_BOOL isUpdatingComposition = isUpdatingComposition;
  return composition;
}

- (void)_invalidateComposition
{
  self->_needsUpdateFlags.BOOL composition = 1;
  [(PXTilingControllerCompositionEngine *)self _setNeedsUpdate];
}

- (void)_updateScrollControllerMetricsIfNeeded
{
  if (self->_needsUpdateFlags.scrollControllerMetrics)
  {
    self->_needsUpdateFlags.scrollControllerMetrics = 0;
    id v15 = [(PXTilingControllerCompositionEngine *)self _scrollController];
    [v15 referenceSize];
    double v4 = v3;
    double v6 = v5;
    [v15 contentInset];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    -[PXTilingControllerCompositionEngine _setReferenceSize:](self, "_setReferenceSize:", v4, v6);
    -[PXTilingControllerCompositionEngine _setContentInset:](self, "_setContentInset:", v8, v10, v12, v14);
  }
}

- (void)_invalidateScrollControllerMetrics
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  self->_needsUpdateFlags.scrollControllerMetrics = 1;
  [(PXTilingControllerCompositionEngine *)self _setNeedsUpdate];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  double v3 = [(PXTilingControllerCompositionEngine *)self _tilingControllers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) invalidateScrollControllerMetrics];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.scrollControllerMetrics || self->_needsUpdateFlags.composition;
}

- (void)_endUpdate
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(PXTilingControllerCompositionEngine *)self _updateScrollControllerMetricsIfNeeded];
  [(PXTilingControllerCompositionEngine *)self _updateCompositionIfNeeded];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(PXTilingControllerCompositionEngine *)self _tilingControllers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v9 updateMetrics];
        [v9 updateLayout];
        [v9 endUpdate];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  if ([(PXTilingControllerCompositionEngine *)self _needsUpdate])
  {
    long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXTilingControllerCompositionEngine.m" lineNumber:149 description:@"updates still needed after an update cycle"];
  }
}

- (void)_beginUpdate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(PXTilingControllerCompositionEngine *)self _tilingControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) beginUpdate];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_performChanges:(id)a3
{
  BOOL isPerformingChanges = self->_isPerformingChanges;
  self->_BOOL isPerformingChanges = 1;
  if (isPerformingChanges)
  {
    uint64_t v5 = (void (*)(void))*((void *)a3 + 2);
    id v6 = a3;
    v5();

    self->_BOOL isPerformingChanges = 1;
  }
  else
  {
    long long v7 = (void (**)(void))a3;
    [(PXTilingControllerCompositionEngine *)self _beginUpdate];
    v7[2](v7);

    self->_BOOL isPerformingChanges = 0;
    [(PXTilingControllerCompositionEngine *)self _endUpdate];
  }
}

- (void)_setContentInset:(UIEdgeInsets)a3
{
}

- (void)_setReferenceSize:(CGSize)a3
{
  if (a3.width != self->__referenceSize.width || a3.height != self->__referenceSize.height)
  {
    self->__referenceSize = a3;
    [(PXTilingControllerCompositionEngine *)self _invalidateComposition];
  }
}

- (void)unregisterComposition:(id)a3
{
  id v5 = a3;
  id v6 = [v5 observer];

  if (v6 != self)
  {
    long long v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PXTilingControllerCompositionEngine.m" lineNumber:95 description:@"unexpected composition observer"];
  }
  [v5 setObserver:0];
  long long v7 = [(PXTilingControllerCompositionEngine *)self _compositions];
  [v7 removeObject:v5];

  [(PXTilingControllerCompositionEngine *)self _invalidateComposition];
}

- (void)registerComposition:(id)a3
{
  id v5 = a3;
  id v6 = [v5 observer];

  if (v6)
  {
    long long v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PXTilingControllerCompositionEngine.m" lineNumber:88 description:@"unexpected composition observer"];
  }
  [v5 setObserver:self];
  long long v7 = [(PXTilingControllerCompositionEngine *)self _compositions];
  [v7 addObject:v5];

  [(PXTilingControllerCompositionEngine *)self _invalidateComposition];
}

- (void)unregisterTilingController:(id)a3
{
  id v5 = a3;
  id v6 = [v5 observer];

  if (v6 != self)
  {
    long long v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PXTilingControllerCompositionEngine.m" lineNumber:81 description:@"unexpected tiling controller observer"];
  }
  [v5 setObserver:0];
  long long v7 = [(PXTilingControllerCompositionEngine *)self _tilingControllers];
  [v7 removeObject:v5];

  [(PXTilingControllerCompositionEngine *)self _invalidateComposition];
}

- (void)registerTilingController:(id)a3
{
  id v5 = a3;
  id v6 = [v5 observer];

  if (v6)
  {
    long long v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PXTilingControllerCompositionEngine.m" lineNumber:74 description:@"unexpected tiling controller observer"];
  }
  [v5 setObserver:self];
  long long v7 = [(PXTilingControllerCompositionEngine *)self _tilingControllers];
  [v7 addObject:v5];

  [(PXTilingControllerCompositionEngine *)self _invalidateComposition];
}

- (id)_initWithScrollController:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"PXTilingControllerCompositionEngine.m" lineNumber:58 description:@"missing scroll controller"];
  }
  v22.receiver = self;
  v22.super_class = (Class)PXTilingControllerCompositionEngine;
  id v6 = [(PXTilingControllerCompositionEngine *)&v22 init];
  long long v7 = v6;
  if (v6)
  {
    id v8 = objc_storeWeak((id *)&v6->__scrollController, v5);
    [v5 setUpdateDelegate:v7];

    id WeakRetained = objc_loadWeakRetained((id *)&v7->__scrollController);
    [WeakRetained setRespectsContentZOrder:1];

    uint64_t v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    tilingControllers = v7->__tilingControllers;
    v7->__tilingControllers = (NSHashTable *)v10;

    uint64_t v12 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    compositions = v7->__compositions;
    v7->__compositions = (NSHashTable *)v12;

    long long v14 = objc_alloc_init(PXTilingControllerDefaultComposition);
    defaultComposition = v7->__defaultComposition;
    v7->__defaultComposition = v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    invalidationContexts = v7->__invalidationContexts;
    v7->__invalidationContexts = (NSMutableArray *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    tilingControllersRequestingFocus = v7->__tilingControllersRequestingFocus;
    v7->__tilingControllersRequestingFocus = (NSMutableArray *)v18;
  }
  return v7;
}

- (PXTilingControllerCompositionEngine)init
{
  return (PXTilingControllerCompositionEngine *)[(PXTilingControllerCompositionEngine *)self _initWithScrollController:0];
}

+ (id)compositionEngineForScrollController:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  objc_getAssociatedObject(v5, (const void *)compositionEngineForScrollController_createIfNeeded__PXTilingControllerCompositionEngineAssociationKey);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = !v4;
  }
  if (!v7)
  {
    id v6 = [[PXTilingControllerCompositionEngine alloc] _initWithScrollController:v5];
    objc_setAssociatedObject(v5, (const void *)compositionEngineForScrollController_createIfNeeded__PXTilingControllerCompositionEngineAssociationKey, v6, (void *)1);
  }

  return v6;
}

@end