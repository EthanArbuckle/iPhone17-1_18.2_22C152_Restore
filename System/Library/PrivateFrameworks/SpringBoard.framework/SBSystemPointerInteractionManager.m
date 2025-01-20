@interface SBSystemPointerInteractionManager
- (BOOL)isViewRegistered:(id)a3;
- (SBSystemPointerInteractionManager)initWithMultiDisplayUserInteractionCoordinator:(id)a3;
- (SBWindowScene)activePointerWindowScene;
- (UIView)activePointerRegionView;
- (id)pointerInteraction:(id)a3 window:(id)a4 regionForRequest:(id)a5 defaultRegion:(id)a6;
- (id)pointerInteraction:(id)a3 window:(id)a4 styleForRegion:(id)a5;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)pointerDidMoveToFromWindowScene:(id)a3 toWindowScene:(id)a4;
- (void)pointerInteraction:(id)a3 window:(id)a4 willEnterRegion:(id)a5 animator:(id)a6;
- (void)pointerInteraction:(id)a3 window:(id)a4 willExitRegion:(id)a5 animator:(id)a6;
- (void)registerView:(id)a3 delegate:(id)a4;
- (void)removeObserver:(id)a3;
- (void)unregisterView:(id)a3;
@end

@implementation SBSystemPointerInteractionManager

- (BOOL)isViewRegistered:(id)a3
{
  v3 = [(NSMapTable *)self->_registeredViewsToDelegates objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)unregisterView:(id)a3
{
}

- (void)registerView:(id)a3 delegate:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  v8 = [(NSMapTable *)self->_registeredViewsToDelegates objectForKey:v10];

  if (v8)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBSystemPointerInteractionManager.m", 36, @"The view (%@) had already been registered previously.", v10 object file lineNumber description];
  }
  [(NSMapTable *)self->_registeredViewsToDelegates setObject:v7 forKey:v10];
}

- (SBSystemPointerInteractionManager)initWithMultiDisplayUserInteractionCoordinator:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBSystemPointerInteractionManager.m", 25, @"Invalid parameter not satisfying: %@", @"userInteractionCoordinator" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)SBSystemPointerInteractionManager;
  id v7 = [(SBSystemPointerInteractionManager *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    registeredViewsToDelegates = v7->_registeredViewsToDelegates;
    v7->_registeredViewsToDelegates = (NSMapTable *)v8;

    objc_storeStrong((id *)&v7->_multiDisplayUserInteractionCoordinator, a3);
    [v6 addPointerInteractionObserver:v7];
  }

  return v7;
}

- (SBWindowScene)activePointerWindowScene
{
  return [(SBMultiDisplayUserInteractionCoordinator *)self->_multiDisplayUserInteractionCoordinator activePointerWindowScene];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (void)dealloc
{
  [(SBMultiDisplayUserInteractionCoordinator *)self->_multiDisplayUserInteractionCoordinator removePointerInteractionObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBSystemPointerInteractionManager;
  [(SBSystemPointerInteractionManager *)&v3 dealloc];
}

- (void)pointerDidMoveToFromWindowScene:(id)a3 toWindowScene:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) pointerDidMoveToFromWindowScene:v6 toWindowScene:v7];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (id)pointerInteraction:(id)a3 window:(id)a4 regionForRequest:(id)a5 defaultRegion:(id)a6
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    uint64_t v10 = [v8 screen];
    uint64_t v11 = [v10 fixedCoordinateSpace];

    [v9 location];
    objc_msgSend(v8, "convertPoint:toCoordinateSpace:", v11);
    double v53 = v13;
    double v54 = v12;
    long long v14 = self->_registeredViewsToDelegates;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v15 = v14;
    long long v16 = (void *)[(NSMapTable *)v15 countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (v16)
    {
      id v50 = v8;
      uint64_t v17 = *(void *)v56;
      double v18 = *(double *)(MEMORY[0x1E4F437F8] + 16);
      double v51 = *(double *)(MEMORY[0x1E4F437F8] + 8);
      double v52 = *MEMORY[0x1E4F437F8];
      double v19 = *(double *)(MEMORY[0x1E4F437F8] + 24);
      v20 = &selRef_padding;
      while (2)
      {
        v21 = 0;
        v22 = v20;
        do
        {
          if (*(void *)v56 != v17) {
            objc_enumerationMutation(v15);
          }
          v23 = *(void **)(*((void *)&v55 + 1) + 8 * (void)v21);
          v24 = [(NSMapTable *)v15 objectForKey:v23];
          objc_msgSend(v23, "convertPoint:fromCoordinateSpace:", v11, v54, v53);
          double v26 = v25;
          double v28 = v27;
          double v29 = v19;
          double v30 = v18;
          double v32 = v51;
          double v31 = v52;
          if (objc_opt_respondsToSelector())
          {
            [v24 pointerInteractionHitTestInsetsForView:v23];
            double v31 = v33;
            double v32 = v34;
            double v30 = v35;
            double v29 = v36;
          }
          [v23 bounds];
          v63.origin.x = v32 + v37;
          v63.origin.y = v31 + v38;
          double v39 = v29 + v32;
          v63.size.width = v40 - v39;
          double v41 = v30 + v31;
          v63.size.height = v42 - v41;
          v62.x = v26;
          v62.y = v28;
          if (CGRectContainsPoint(v63, v62)
            && objc_msgSend(v24, "shouldBeginPointerInteractionRequest:atLocation:forView:", v9, v23, v26, v28))
          {
            if (objc_opt_respondsToSelector())
            {
              long long v16 = objc_msgSend(v24, "regionAtLocation:forView:", v23, v26, v28);
            }
            else
            {
              v43 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v23);
              v44 = (void *)MEMORY[0x1E4F42CB0];
              [v23 bounds];
              long long v16 = objc_msgSend(v44, "regionWithRect:identifier:", v43, v32 + v45, v31 + v46, v47 - v39, v48 - v41);
            }
            id v8 = v50;
            [v16 setReferenceView:v23];

            goto LABEL_21;
          }

          v21 = (char *)v21 + 1;
        }
        while (v16 != v21);
        long long v16 = (void *)[(NSMapTable *)v15 countByEnumeratingWithState:&v55 objects:v59 count:16];
        v20 = v22;
        if (v16) {
          continue;
        }
        break;
      }
      id v8 = v50;
    }
LABEL_21:
  }
  else
  {
    uint64_t v11 = SBLogSystemGesture();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[SBSystemPointerInteractionManager pointerInteraction:window:regionForRequest:defaultRegion:](v11);
    }
    long long v16 = 0;
  }

  return v16;
}

- (id)pointerInteraction:(id)a3 window:(id)a4 styleForRegion:(id)a5
{
  id v6 = a5;
  id v7 = [v6 referenceView];
  id v8 = [(NSMapTable *)self->_registeredViewsToDelegates objectForKey:v7];
  if (objc_opt_respondsToSelector())
  {
    id v9 = [v8 styleForRegion:v6 forView:v7];
  }
  else
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F42ED8]) initWithView:v7];
    uint64_t v11 = [MEMORY[0x1E4F42C88] effectWithPreview:v10];
    id v9 = [MEMORY[0x1E4F42CC0] styleWithEffect:v11 shape:0];
  }
  return v9;
}

- (void)pointerInteraction:(id)a3 window:(id)a4 willEnterRegion:(id)a5 animator:(id)a6
{
  objc_msgSend(a5, "referenceView", a3, a4);
  id v7 = (UIView *)objc_claimAutoreleasedReturnValue();
  activePointerRegionView = self->_activePointerRegionView;
  self->_activePointerRegionView = v7;
}

- (void)pointerInteraction:(id)a3 window:(id)a4 willExitRegion:(id)a5 animator:(id)a6
{
  activePointerRegionView = self->_activePointerRegionView;
  self->_activePointerRegionView = 0;
  id v8 = a5;

  id v10 = [v8 referenceView];

  id v9 = [(NSMapTable *)self->_registeredViewsToDelegates objectForKey:v10];
  if (objc_opt_respondsToSelector()) {
    [v9 pointerWillExitRegion];
  }
}

- (UIView)activePointerRegionView
{
  return self->_activePointerRegionView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePointerRegionView, 0);
  objc_storeStrong((id *)&self->_multiDisplayUserInteractionCoordinator, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_registeredViewsToDelegates, 0);
}

- (void)pointerInteraction:(os_log_t)log window:regionForRequest:defaultRegion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D85BA000, log, OS_LOG_TYPE_FAULT, "Asking the system pointer interaction manager for a UIPointerRegion without specifying a window", v1, 2u);
}

@end