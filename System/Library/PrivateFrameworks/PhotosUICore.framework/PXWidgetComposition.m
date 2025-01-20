@interface PXWidgetComposition
- (BOOL)_didLayoutWidgets;
- (BOOL)_shouldFocusOnTilingController:(id)a3;
- (BOOL)_shouldUseEdgeToEdgeLayoutForWidget:(id)a3;
- (BOOL)element:(id)a3 requestViewControllerDismissalAnimated:(BOOL)a4;
- (BOOL)element:(id)a3 transitionToViewController:(id)a4 withTransitionType:(int64_t)a5;
- (BOOL)shouldLoadAllWidgets;
- (BOOL)shouldLoadVisibleWidgets;
- (BOOL)shouldUnloadAllWidgets;
- (CGPoint)_lastContentAdjustmentOffset;
- (CGRect)frameForWidget:(id)a3;
- (NSArray)_elements;
- (NSArray)widgets;
- (PXScrollViewController)scrollViewController;
- (PXTilingController)_focusedTilingController;
- (PXWidgetComposition)init;
- (PXWidgetComposition)initWithScrollViewController:(id)a3;
- (PXWidgetCompositionDelegate)delegate;
- (PXWidgetCompositionSpec)spec;
- (id)elementUndoManager:(id)a3;
- (id)elementViewController:(id)a3;
- (id)footerTilingControllerForWidget:(id)a3;
- (id)headerTilingControllerForWidget:(id)a3;
- (id)presentationEnvironmentForElement:(id)a3;
- (id)tilingControllers;
- (id)widgetAtLocation:(CGPoint)a3;
- (int64_t)_loadingPriorityForElement:(id)a3;
- (int64_t)minimumWidgetLoadingPriority;
- (void)_invalidateElementsToLoad;
- (void)_setDidLayoutWidgets:(BOOL)a3;
- (void)_setElements:(id)a3;
- (void)_setFocusedTilingController:(id)a3;
- (void)_setLastContentAdjustmentOffset:(CGPoint)a3;
- (void)_setNeedsUpdateWidgetLoading;
- (void)_updateElements;
- (void)_updateElementsSpec;
- (void)_updateElementsToLoadIfNeeded;
- (void)_updateFocusedTilingController;
- (void)elementHasLoadedContentDataDidChange:(id)a3;
- (void)elementNeedsLayout:(id)a3 preferredAnimationOptions:(id)a4 originatingTilingController:(id)a5;
- (void)invalidateFocusedTilingController;
- (void)invalidatePreferredContentHeightForAllWidgets;
- (void)performWidgetLoadingChange:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMinimumWidgetLoadingPriority:(int64_t)a3;
- (void)setShouldLoadAllWidgets:(BOOL)a3;
- (void)setShouldLoadVisibleWidgets:(BOOL)a3;
- (void)setShouldUnloadAllWidgets:(BOOL)a3;
- (void)setSpec:(id)a3;
- (void)setWidgets:(id)a3;
- (void)updateComposition;
@end

@implementation PXWidgetComposition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__focusedTilingController, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_widgets, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_scrollViewController);
  objc_storeStrong((id *)&self->__elements, 0);
}

- (void)_setLastContentAdjustmentOffset:(CGPoint)a3
{
  self->__lastContentAdjustmentOffset = a3;
}

- (CGPoint)_lastContentAdjustmentOffset
{
  double x = self->__lastContentAdjustmentOffset.x;
  double y = self->__lastContentAdjustmentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)_didLayoutWidgets
{
  return self->__didLayoutWidgets;
}

- (void)_setFocusedTilingController:(id)a3
{
}

- (PXTilingController)_focusedTilingController
{
  return self->__focusedTilingController;
}

- (BOOL)shouldUnloadAllWidgets
{
  return self->_shouldUnloadAllWidgets;
}

- (BOOL)shouldLoadAllWidgets
{
  return self->_shouldLoadAllWidgets;
}

- (BOOL)shouldLoadVisibleWidgets
{
  return self->_shouldLoadVisibleWidgets;
}

- (int64_t)minimumWidgetLoadingPriority
{
  return self->_minimumWidgetLoadingPriority;
}

- (PXWidgetCompositionSpec)spec
{
  return self->_spec;
}

- (NSArray)widgets
{
  return self->_widgets;
}

- (PXWidgetCompositionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXWidgetCompositionDelegate *)WeakRetained;
}

- (PXScrollViewController)scrollViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewController);
  return (PXScrollViewController *)WeakRetained;
}

- (NSArray)_elements
{
  return self->__elements;
}

- (id)elementUndoManager:(id)a3
{
  id v4 = a3;
  v5 = [(PXWidgetComposition *)self delegate];
  v6 = [v4 widget];

  v7 = [v5 widgetComposition:self undoManagerForWidget:v6];

  return v7;
}

- (id)presentationEnvironmentForElement:(id)a3
{
  if (self->_delegateFlags.respondsToPresentationEnvironment)
  {
    id v4 = [(PXWidgetComposition *)self delegate];
    v5 = [v4 presentationEnvironmentForWidgetComposition:self];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)element:(id)a3 requestViewControllerDismissalAnimated:(BOOL)a4
{
  if (!self->_delegateFlags.respondsToRequestViewControllerDismissalAnimated) {
    return 0;
  }
  uint64_t v4 = a4;
  v6 = [(PXWidgetComposition *)self delegate];
  LOBYTE(v4) = [v6 widgetComposition:self requestViewControllerDismissalAnimated:v4];

  return v4;
}

- (BOOL)element:(id)a3 transitionToViewController:(id)a4 withTransitionType:(int64_t)a5
{
  if (!self->_delegateFlags.respondsToWidgetTransitionToViewControllerWithTransitionType) {
    return 0;
  }
  id v8 = a4;
  id v9 = a3;
  v10 = [(PXWidgetComposition *)self delegate];
  v11 = [v9 widget];

  LOBYTE(a5) = [v10 widgetComposition:self widget:v11 transitionToViewController:v8 withTransitionType:a5];
  return a5;
}

- (id)elementViewController:(id)a3
{
  id v4 = a3;
  v5 = [(PXWidgetComposition *)self delegate];
  v6 = [v4 widget];

  v7 = [v5 widgetComposition:self viewControllerHostingWidget:v6];

  return v7;
}

- (void)elementHasLoadedContentDataDidChange:(id)a3
{
  id v6 = a3;
  id v4 = [(PXWidgetComposition *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v5 = [v6 widget];
    [v4 widgetComposition:self widgetHasLoadedContentDataDidChange:v5];
  }
}

- (void)elementNeedsLayout:(id)a3 preferredAnimationOptions:(id)a4 originatingTilingController:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = objc_alloc_init(PXTilingControllerCompositionInvalidationContext);
  [(PXTilingControllerCompositionInvalidationContext *)v9 setAnimationOptions:v8];

  [(PXTilingControllerCompositionInvalidationContext *)v9 setOriginatingTilingController:v7];
  [(PXTilingControllerComposition *)self invalidateCompositionWithContext:v9];
}

- (void)invalidatePreferredContentHeightForAllWidgets
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(PXWidgetComposition *)self _elements];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        id v8 = [v7 widget];
        [v7 widgetPreferredContentHeightForWidthDidChange:v8];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (id)footerTilingControllerForWidget:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(PXWidgetComposition *)self _elements];
  id v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v10 = [v9 widget];
        int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = [v9 footerTilingController];
          goto LABEL_11;
        }
      }
      id v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)headerTilingControllerForWidget:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(PXWidgetComposition *)self _elements];
  id v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v10 = [v9 widget];
        int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = [v9 headerTilingController];
          goto LABEL_11;
        }
      }
      id v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (CGRect)frameForWidget:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v9 = [(PXWidgetComposition *)self _elements];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v47;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v47 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        id v15 = [v14 widget];

        if (v15 == v4)
        {
          long long v16 = [v14 contentTilingController];
          double v17 = __38__PXWidgetComposition_frameForWidget___block_invoke(v16);
          CGFloat v44 = v18;
          CGFloat v45 = v17;
          CGFloat v42 = v20;
          CGFloat v43 = v19;

          v21 = [v14 headerTilingController];
          double v22 = __38__PXWidgetComposition_frameForWidget___block_invoke(v21);
          CGFloat v40 = v23;
          CGFloat v41 = v22;
          CGFloat v38 = v25;
          CGFloat v39 = v24;

          v26 = [v14 footerTilingController];
          double v27 = __38__PXWidgetComposition_frameForWidget___block_invoke(v26);
          CGFloat v29 = v28;
          CGFloat v31 = v30;
          CGFloat v33 = v32;

          v52.origin.CGFloat x = x;
          v52.origin.CGFloat y = y;
          v52.size.CGFloat width = width;
          v52.size.CGFloat height = height;
          v57.origin.CGFloat y = v44;
          v57.origin.CGFloat x = v45;
          v57.size.CGFloat height = v42;
          v57.size.CGFloat width = v43;
          CGRect v53 = CGRectUnion(v52, v57);
          v58.origin.CGFloat y = v40;
          v58.origin.CGFloat x = v41;
          v58.size.CGFloat height = v38;
          v58.size.CGFloat width = v39;
          CGRect v54 = CGRectUnion(v53, v58);
          v59.origin.CGFloat x = v27;
          v59.origin.CGFloat y = v29;
          v59.size.CGFloat width = v31;
          v59.size.CGFloat height = v33;
          CGRect v55 = CGRectUnion(v54, v59);
          CGFloat x = v55.origin.x;
          CGFloat y = v55.origin.y;
          CGFloat width = v55.size.width;
          CGFloat height = v55.size.height;
          goto LABEL_11;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v46 objects:v50 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  double v34 = x;
  double v35 = y;
  double v36 = width;
  double v37 = height;
  result.size.CGFloat height = v37;
  result.size.CGFloat width = v36;
  result.origin.CGFloat y = v35;
  result.origin.CGFloat x = v34;
  return result;
}

double __38__PXWidgetComposition_frameForWidget___block_invoke(void *a1)
{
  if (!a1) {
    return *MEMORY[0x1E4F1DB20];
  }
  id v1 = a1;
  v2 = [v1 currentLayout];
  [v2 contentBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = +[PXTilingCoordinateSpaceConverter defaultConverter];
  uint64_t v12 = [v2 coordinateSpaceIdentifier];
  uint64_t v13 = [v1 contentCoordinateSpaceIdentifier];

  objc_msgSend(v11, "convertRect:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", v12, v13, v4, v6, v8, v10);
  double v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  v23.origin.CGFloat x = v15;
  v23.origin.CGFloat y = v17;
  v23.size.CGFloat width = v19;
  v23.size.CGFloat height = v21;
  if (CGRectIsEmpty(v23)) {
    double v15 = *MEMORY[0x1E4F1DB20];
  }

  return v15;
}

- (id)widgetAtLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  double v6 = +[PXTilingCoordinateSpaceConverter defaultConverter];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v7 = [(PXWidgetComposition *)self _elements];
  double v8 = (void *)[v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = [v11 contentTilingController];
        uint64_t v13 = [v12 targetLayout];
        [v13 contentBounds];
        objc_msgSend(v6, "convertRect:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", objc_msgSend(v13, "coordinateSpaceIdentifier"), objc_msgSend(v12, "contentCoordinateSpaceIdentifier"), v14, v15, v16, v17);
        v26.CGFloat x = x;
        v26.CGFloat y = y;
        if (CGRectContainsPoint(v27, v26))
        {
          double v8 = [v11 widget];

          goto LABEL_11;
        }
      }
      double v8 = (void *)[v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)_updateElementsToLoadIfNeeded
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (self->_needsUpdateFlags.elementsToLoad)
  {
    self->_needsUpdateFlags.elementsToLoad = 0;
    BOOL v3 = [(PXWidgetComposition *)self shouldLoadAllWidgets];
    BOOL v4 = [(PXWidgetComposition *)self shouldLoadVisibleWidgets];
    LODWORD(v5) = [(PXWidgetComposition *)self shouldUnloadAllWidgets];
    double v6 = [(PXWidgetComposition *)self scrollViewController];
    [v6 visibleRect];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;

    BOOL v15 = [(PXWidgetComposition *)self _didLayoutWidgets];
    CGFloat v39 = +[PXTilingCoordinateSpaceConverter defaultConverter];
    int64_t v43 = [(PXWidgetComposition *)self minimumWidgetLoadingPriority];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obj = [(PXWidgetComposition *)self _elements];
    uint64_t v16 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
    if (v16)
    {
      uint64_t v18 = v16;
      uint64_t v19 = *(void *)v51;
      int v41 = v4 && v15;
      unsigned int v45 = v5 ^ 1;
      *(void *)&long long v17 = 134218240;
      long long v38 = v17;
      int64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
      char v42 = v5;
      BOOL v40 = v3;
      do
      {
        uint64_t v21 = 0;
        uint64_t v22 = v43;
        do
        {
          if (*(void *)v51 != v19) {
            objc_enumerationMutation(obj);
          }
          CGRect v23 = *(void **)(*((void *)&v50 + 1) + 8 * v21);
          if (v5) {
            goto LABEL_31;
          }
          if (v3) {
            goto LABEL_30;
          }
          if (v41)
          {
            uint64_t v5 = [*(id *)(*((void *)&v50 + 1) + 8 * v21) contentTilingController];
            uint64_t v24 = [(id)v5 targetLayout];
            [v24 contentBounds];
            objc_msgSend(v39, "convertRect:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", objc_msgSend(v24, "coordinateSpaceIdentifier"), objc_msgSend((id)v5, "contentCoordinateSpaceIdentifier"), v25, v26, v27, v28);
            v62.origin.CGFloat x = v8;
            v62.origin.CGFloat y = v10;
            v62.size.CGFloat width = v12;
            v62.size.CGFloat height = v14;
            BOOL v29 = CGRectIntersectsRect(v61, v62);

            uint64_t v22 = v43;
            LOBYTE(v5) = v42;
            if (v29)
            {
LABEL_30:
              if (v20 == 0x7FFFFFFFFFFFFFFFLL)
              {
                int64_t v20 = v22;
                if (v22 >= 1)
                {
                  long long v48 = 0u;
                  long long v49 = 0u;
                  long long v46 = 0u;
                  long long v47 = 0u;
                  double v30 = [(PXWidgetComposition *)self _elements];
                  uint64_t v31 = [v30 countByEnumeratingWithState:&v46 objects:v58 count:16];
                  if (v31)
                  {
                    uint64_t v32 = v31;
                    int64_t v33 = 0;
                    uint64_t v34 = *(void *)v47;
                    do
                    {
                      for (uint64_t i = 0; i != v32; ++i)
                      {
                        if (*(void *)v47 != v34) {
                          objc_enumerationMutation(v30);
                        }
                        int64_t v36 = -[PXWidgetComposition _loadingPriorityForElement:](self, "_loadingPriorityForElement:", *(void *)(*((void *)&v46 + 1) + 8 * i), v38);
                        if (v33 <= v36) {
                          int64_t v33 = v36;
                        }
                      }
                      uint64_t v32 = [v30 countByEnumeratingWithState:&v46 objects:v58 count:16];
                    }
                    while (v32);
                  }
                  else
                  {
                    int64_t v33 = 0;
                  }

                  double v37 = PLRelatedGetLog();
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = v38;
                    CGRect v55 = self;
                    __int16 v56 = 1024;
                    int v57 = v33;
                    _os_log_impl(&dword_1A9AE7000, v37, OS_LOG_TYPE_DEBUG, "[PXWidgetComposition: %p] maximumAvailablePriority=%i", buf, 0x12u);
                  }

                  uint64_t v22 = v43;
                  if (v43 >= v33) {
                    int64_t v20 = v33;
                  }
                  else {
                    int64_t v20 = v43;
                  }
                  BOOL v3 = v40;
                  LOBYTE(v5) = v42;
                }
              }
              if (-[PXWidgetComposition _loadingPriorityForElement:](self, "_loadingPriorityForElement:", v23, v38) >= v20) {
LABEL_31:
              }
                objc_msgSend(v23, "setShouldLoadWidgetContent:", v45, v38);
            }
          }
          ++v21;
        }
        while (v21 != v18);
        uint64_t v18 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
      }
      while (v18);
    }
  }
}

- (void)_invalidateElementsToLoad
{
  self->_needsUpdateFlags.elementsToLoad = 1;
  [(PXWidgetComposition *)self _setNeedsUpdateWidgetLoading];
}

- (void)_setNeedsUpdateWidgetLoading
{
  if (!self->_isPerformingWidgetLoadingChange)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PXWidgetComposition.m" lineNumber:553 description:@"not inside performWidgetLoadingChange:"];
  }
}

- (void)performWidgetLoadingChange:(id)a3
{
  id v4 = (void (**)(void))a3;
  BOOL isPerformingWidgetLoadingChange = self->_isPerformingWidgetLoadingChange;
  self->_BOOL isPerformingWidgetLoadingChange = 1;
  double v6 = v4;
  if (v4)
  {
    v4[2](v4);
    id v4 = v6;
  }
  self->_BOOL isPerformingWidgetLoadingChange = isPerformingWidgetLoadingChange;
  if (!isPerformingWidgetLoadingChange)
  {
    [(PXWidgetComposition *)self _updateWidgetLoadingIfNeeded];
    id v4 = v6;
  }
}

- (void)_setDidLayoutWidgets:(BOOL)a3
{
  if (self->__didLayoutWidgets != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __44__PXWidgetComposition__setDidLayoutWidgets___block_invoke;
    v3[3] = &unk_1E5DCFE98;
    v3[4] = self;
    BOOL v4 = a3;
    [(PXWidgetComposition *)self performWidgetLoadingChange:v3];
  }
}

uint64_t __44__PXWidgetComposition__setDidLayoutWidgets___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 68) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) _invalidateElementsToLoad];
}

- (void)setShouldUnloadAllWidgets:(BOOL)a3
{
  if (self->_shouldUnloadAllWidgets != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __49__PXWidgetComposition_setShouldUnloadAllWidgets___block_invoke;
    v3[3] = &unk_1E5DCFE98;
    v3[4] = self;
    BOOL v4 = a3;
    [(PXWidgetComposition *)self performWidgetLoadingChange:v3];
  }
}

uint64_t __49__PXWidgetComposition_setShouldUnloadAllWidgets___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 67) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) _invalidateElementsToLoad];
}

- (void)setShouldLoadAllWidgets:(BOOL)a3
{
  if (self->_shouldLoadAllWidgets != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __47__PXWidgetComposition_setShouldLoadAllWidgets___block_invoke;
    v3[3] = &unk_1E5DCFE98;
    v3[4] = self;
    BOOL v4 = a3;
    [(PXWidgetComposition *)self performWidgetLoadingChange:v3];
  }
}

uint64_t __47__PXWidgetComposition_setShouldLoadAllWidgets___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 66) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) _invalidateElementsToLoad];
}

- (void)setShouldLoadVisibleWidgets:(BOOL)a3
{
  if (self->_shouldLoadVisibleWidgets != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __51__PXWidgetComposition_setShouldLoadVisibleWidgets___block_invoke;
    v3[3] = &unk_1E5DCFE98;
    v3[4] = self;
    BOOL v4 = a3;
    [(PXWidgetComposition *)self performWidgetLoadingChange:v3];
  }
}

uint64_t __51__PXWidgetComposition_setShouldLoadVisibleWidgets___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 65) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) _invalidateElementsToLoad];
}

- (void)setMinimumWidgetLoadingPriority:(int64_t)a3
{
  if (self->_minimumWidgetLoadingPriority != a3)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __55__PXWidgetComposition_setMinimumWidgetLoadingPriority___block_invoke;
    v3[3] = &unk_1E5DD08D8;
    v3[4] = self;
    void v3[5] = a3;
    [(PXWidgetComposition *)self performWidgetLoadingChange:v3];
  }
}

uint64_t __55__PXWidgetComposition_setMinimumWidgetLoadingPriority___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 112) = *(void *)(a1 + 40);
  return [*(id *)(a1 + 32) _invalidateElementsToLoad];
}

- (int64_t)_loadingPriorityForElement:(id)a3
{
  if (!self->_delegateFlags.respondsToLoadingPriorityForWidget) {
    return 0;
  }
  id v4 = a3;
  uint64_t v5 = [(PXWidgetComposition *)self delegate];
  double v6 = [v4 widget];

  int64_t v7 = [v5 widgetComposition:self loadingPriorityForWidget:v6];
  return v7;
}

- (BOOL)_shouldUseEdgeToEdgeLayoutForWidget:(id)a3
{
  if (!self->_delegateFlags.respondsToShouldUseEdgeToEdgeLayoutForWidget) {
    return 0;
  }
  BOOL v3 = self;
  id v4 = a3;
  uint64_t v5 = [(PXWidgetComposition *)v3 delegate];
  LOBYTE(v3) = [v5 widgetComposition:v3 shouldUseEdgeToEdgeLayoutForWidget:v4];

  return (char)v3;
}

- (void)updateComposition
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  double v35 = [(PXWidgetComposition *)self spec];
  if (!v35)
  {
    uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2 object:self file:@"PXWidgetComposition.m" lineNumber:236 description:@"missing spec"];
  }
  v2 = [(PXTilingControllerComposition *)self input];
  BOOL v3 = [(PXTilingControllerComposition *)self output];
  uint64_t v33 = [(PXWidgetComposition *)self _elements];
  long long v38 = [v35 widgetSpec];
  uint64_t v4 = [v35 maximumNumberOfColumns];
  [v2 referenceSize];
  double v6 = v5;
  [v2 contentInset];
  uint64_t v8 = v7;
  double v9 = [v35 widgetSpec];
  [v9 interWidgetSpacing];
  double v11 = v10;
  double v13 = v12;

  uint64_t v90 = 0;
  v91 = (CGRect *)&v90;
  uint64_t v92 = 0x4010000000;
  v93 = &unk_1AB5D584F;
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v94 = *MEMORY[0x1E4F1DB28];
  uint64_t v96 = *((void *)&v14 + 1);
  *((void *)&v94 + 1) = v8;
  double v95 = v6;
  BOOL v15 = objc_alloc_init(_PXWidgetCompositionElementScanner);
  [(_PXWidgetCompositionElementScanner *)v15 setElements:v33];
  [(_PXWidgetCompositionElementScanner *)v15 setReferenceWidth:v6];
  [(_PXWidgetCompositionElementScanner *)v15 setInterColumnSpacing:v11];
  [(_PXWidgetCompositionElementScanner *)v15 setMaximumNumberOfColumns:v4];
  objc_initWeak(&location, self);
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = __40__PXWidgetComposition_updateComposition__block_invoke;
  v87[3] = &unk_1E5DBC518;
  objc_copyWeak(&v88, &location);
  -[_PXWidgetCompositionElementScanner setWantsEdgeToEdgeLayoutBlock:](v15, "setWantsEdgeToEdgeLayoutBlock:", v87, &v88);
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x2020000000;
  char v86 = 1;
  uint64_t v79 = 0;
  v80 = (double *)&v79;
  uint64_t v81 = 0x2020000000;
  uint64_t v82 = 0x7FF8000000000000;
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x2020000000;
  char v78 = 0;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x2020000000;
  char v74 = 0;
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x2020000000;
  v72[3] = 1;
  double v37 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  uint64_t v34 = [(PXWidgetComposition *)self _focusedTilingController];
  [v34 invalidateLayoutPreferredVisibleOrigin];
  while (![(_PXWidgetCompositionElementScanner *)v15 isAtEnd])
  {
    uint64_t v66 = 0;
    v67 = (CGFloat *)&v66;
    uint64_t v68 = 0x3010000000;
    v69 = &unk_1AB5D584F;
    CGFloat MinX = 0.0;
    uint64_t v71 = 0;
    CGFloat MinX = CGRectGetMinX(v91[1]);
    v67[5] = CGRectGetMaxY(v91[1]);
    if (CGRectGetHeight(v91[1]) > 0.0) {
      v67[5] = v13 + v67[5];
    }
    id v65 = 0;
    BOOL v16 = [(_PXWidgetCompositionElementScanner *)v15 scanRow:&v65];
    id v17 = v65;
    if (v16)
    {
      uint64_t v61 = 0;
      CGRect v62 = &v61;
      uint64_t v63 = 0x2020000000;
      char v64 = 1;
      uint64_t v57 = 0;
      CGRect v58 = (double *)&v57;
      uint64_t v59 = 0x2020000000;
      unint64_t v60 = 0xFFEFFFFFFFFFFFFFLL;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __40__PXWidgetComposition_updateComposition__block_invoke_2;
      v40[3] = &unk_1E5DBC540;
      id v41 = v3;
      id v42 = v38;
      id v43 = v2;
      id v18 = v37;
      long long v46 = &v66;
      long long v47 = &v83;
      id v44 = v18;
      unsigned int v45 = self;
      long long v48 = &v75;
      long long v49 = &v79;
      long long v50 = v73;
      long long v51 = v72;
      long long v52 = &v57;
      long long v53 = &v90;
      CGRect v54 = &v61;
      double v55 = v11;
      double v56 = v13;
      [v17 enumerateElementsUsingBlock:v40];
      if (!*((unsigned char *)v62 + 24))
      {
        *((unsigned char *)v84 + 24) = 0;
        double MaxY = v58[3];
        if (MaxY == -1.79769313e308)
        {
          double MaxY = CGRectGetMaxY(v91[1]);
          v58[3] = MaxY;
        }
        v80[3] = MaxY;
      }

      _Block_object_dispose(&v57, 8);
      _Block_object_dispose(&v61, 8);
    }
    else
    {
      int64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2 object:self file:@"PXWidgetComposition.m" lineNumber:403 description:@"couldn't scan all widgets"];
    }
    _Block_object_dispose(&v66, 8);
  }
  if (*((unsigned char *)v76 + 24))
  {
    [v38 distanceBetweenFooterBaselineAndBottom];
  }
  else
  {
    [v38 distanceBetweenFooterlessWidgetContentBottomAndBottom];
    double v23 = v22;
    [v38 contentGuideInsets];
    double v21 = v23 - v24;
  }
  v91[1].size.CGFloat height = v21 + v91[1].size.height;
  double v25 = [v2 tilingControllersRequestingFocus];
  if ([v25 count])
  {
    double v26 = [v25 lastObject];
    [(PXWidgetComposition *)self _setFocusedTilingController:v26];
  }
  uint64_t v27 = [(PXWidgetComposition *)self _focusedTilingController];

  if (v27)
  {
    double v28 = [v37 objectForKey:v27];
    if (v28) {
      BOOL v29 = (void *)v27;
    }
    else {
      BOOL v29 = 0;
    }
    id v30 = v29;

    if (v28)
    {
      uint64_t v31 = [v37 objectForKey:v27];
      [v31 CGPointValue];

      [v2 originForTilingController:v27];
      PXPointSubtract();
    }
  }
  PXPointIsNull();
}

uint64_t __40__PXWidgetComposition_updateComposition__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  double v5 = [v3 widget];

  uint64_t v6 = [WeakRetained _shouldUseEdgeToEdgeLayoutForWidget:v5];
  return v6;
}

void __40__PXWidgetComposition_updateComposition__block_invoke_2(id *a1, void *a2, double a3, double a4)
{
  id v19 = a2;
  uint64_t v7 = [v19 headerTilingController];
  double v8 = *(double *)off_1E5DAAF10;
  double v9 = *((double *)off_1E5DAAF10 + 1);
  double v10 = *((double *)off_1E5DAAF10 + 2);
  double v11 = *((double *)off_1E5DAAF10 + 3);
  objc_msgSend(a1[4], "setReferenceSize:contentInset:forTilingController:", v7, a3, 0.0, *(double *)off_1E5DAAF10, v9, v10, v11);
  uint64_t v12 = [v19 contentTilingController];
  id v13 = a1[4];
  [a1[5] contentGuideInsets];
  objc_msgSend(v13, "setReferenceSize:contentInset:forTilingController:", v12, a3, a4, v14, v15, v16, v17);
  [v19 footerTilingController];
  objc_msgSend(a1[4], "setReferenceSize:contentInset:forTilingController:", objc_claimAutoreleasedReturnValue(), a3, 0.0, v8, v9, v10, v11);
  id v18 = [v19 widget];
  if (objc_opt_respondsToSelector()) {
    [v18 contentLayoutStyle];
  }
  [a1[6] preferredOriginForTilingController:v12];
  PXPointIsNull();
}

- (BOOL)_shouldFocusOnTilingController:(id)a3
{
  id v3 = [a3 currentLayout];
  if (v3)
  {
    [v3 visibleRect];
    PXRectGetCenter();
  }

  return 0;
}

- (void)_updateFocusedTilingController
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXWidgetComposition *)self _focusedTilingController];
  if (![(PXWidgetComposition *)self _shouldFocusOnTilingController:v3])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v4 = [(PXWidgetComposition *)self _elements];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v26 != v7) {
            objc_enumerationMutation(v4);
          }
          double v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          double v10 = [v9 widget];
          char v11 = objc_opt_respondsToSelector();

          if (v11)
          {
            uint64_t v12 = [v9 widget];
            char v13 = [v12 wantsFocus];

            if (v13)
            {
              uint64_t v20 = [v9 contentTilingController];

              [(PXWidgetComposition *)self _setFocusedTilingController:v20];
              id v3 = (void *)v20;
              goto LABEL_23;
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    double v14 = [(PXWidgetComposition *)self _elements];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      while (2)
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = [*(id *)(*((void *)&v21 + 1) + 8 * j) contentTilingController];
          if ([(PXWidgetComposition *)self _shouldFocusOnTilingController:v19])
          {

            goto LABEL_22;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
    id v19 = v3;
LABEL_22:

    [(PXWidgetComposition *)self _setFocusedTilingController:v19];
    id v3 = v19;
  }
LABEL_23:
}

- (void)invalidateFocusedTilingController
{
}

- (id)tilingControllers
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [(PXWidgetComposition *)self _elements];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        double v10 = [v9 contentTilingController];
        [v3 addObject:v10];

        char v11 = [v9 headerTilingController];
        [v3 addObject:v11];

        uint64_t v12 = [v9 footerTilingController];
        [v3 addObject:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_updateElementsSpec
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXWidgetComposition *)self spec];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [(PXWidgetComposition *)self _elements];
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
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setSpec:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_setElements:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (NSArray *)a3;
  uint64_t v5 = v4;
  if (self->__elements != v4 && (-[NSArray isEqual:](v4, "isEqual:") & 1) == 0)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v6 = self->__elements;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          [v11 unregisterObserver:self];
          [v11 setDelegate:0];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v8);
    }

    long long v12 = (NSArray *)[(NSArray *)v5 copy];
    elements = self->__elements;
    self->__elements = v12;

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v14 = self->__elements;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v20 + 1) + 8 * j);
          objc_msgSend(v19, "registerObserver:", self, (void)v20);
          [v19 setDelegate:self];
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v16);
    }

    [(PXWidgetComposition *)self _updateElementsSpec];
    [(PXWidgetComposition *)self invalidateFocusedTilingController];
    [(PXTilingControllerComposition *)self invalidateComposition];
  }
}

- (void)_updateElements
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXWidgetComposition *)self scrollViewController];
  uint64_t v4 = [(PXWidgetComposition *)self widgets];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = +[PXWidgetCompositionElement elementWithWidget:*(void *)(*((void *)&v21 + 1) + 8 * v10) scrollViewController:v3];
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  [(PXWidgetComposition *)self _setElements:v5];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "prepare", (void)v17);
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (void)setSpec:(id)a3
{
  uint64_t v5 = (PXWidgetCompositionSpec *)a3;
  if (self->_spec != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    [(PXTilingControllerComposition *)self invalidateComposition];
    [(PXWidgetComposition *)self _invalidateElementsSpec];
    uint64_t v5 = v6;
  }
}

- (void)setWidgets:(id)a3
{
  uint64_t v4 = (NSArray *)a3;
  uint64_t v5 = v4;
  if (self->_widgets != v4)
  {
    uint64_t v9 = v4;
    char v6 = -[NSArray isEqual:](v4, "isEqual:");
    uint64_t v5 = v9;
    if ((v6 & 1) == 0)
    {
      uint64_t v7 = (NSArray *)[(NSArray *)v9 copy];
      widgets = self->_widgets;
      self->_widgets = v7;

      [(PXWidgetComposition *)self _invalidateElements];
      uint64_t v5 = v9;
    }
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToHasContentAbove = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToShouldUseEdgeToEdgeLayoutForWidget = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToLoadingPriorityForWidget = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToWidgetTransitionToViewControllerWithTransitionType = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToRequestViewControllerDismissalAnimated = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidUpdateCompositionWithDefaultAnimationOptions = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToPresentationEnvironment = objc_opt_respondsToSelector() & 1;
    [(PXTilingControllerComposition *)self invalidateComposition];
  }
}

- (PXWidgetComposition)initWithScrollViewController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXWidgetComposition;
  uint64_t v5 = [(PXWidgetComposition *)&v9 init];
  char v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_scrollViewController, v4);
    [v4 registerObserver:v6];
  }
  return v6;
}

- (PXWidgetComposition)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXWidgetComposition.m" lineNumber:73 description:@"invalid initializer"];

  return 0;
}

@end