@interface SXDocumentSectionManager
- (NSMutableDictionary)blueprints;
- (NSMutableSet)visibleViewControllers;
- (SXDocumentSectionHosting)hosting;
- (SXDocumentSectionManager)initWithSectionHosting:(id)a3 viewport:(id)a4 appStateMonitor:(id)a5;
- (SXViewport)viewport;
- (TFMultiDelegate)multiScrollDelegate;
- (double)heightForBlueprint:(id)a3 canvasSize:(CGSize)a4 traitCollection:(id)a5;
- (id)view;
- (id)viewController;
- (void)applySectionBlueprint:(id)a3 identifier:(id)a4 offset:(CGPoint)a5 size:(CGSize)a6;
- (void)endImpressions;
- (void)performAppearanceTransitionForVisibleViewControllers;
- (void)performDisappearanceTransitionForVisibleViewControllers;
- (void)updateViewControllerVisibility;
- (void)viewport:(id)a3 appearStateChangedFromState:(unint64_t)a4;
@end

@implementation SXDocumentSectionManager

- (SXDocumentSectionManager)initWithSectionHosting:(id)a3 viewport:(id)a4 appStateMonitor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)SXDocumentSectionManager;
  v11 = [(SXDocumentSectionManager *)&v29 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_hosting, v8);
    objc_storeStrong((id *)&v12->_viewport, a4);
    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    blueprints = v12->_blueprints;
    v12->_blueprints = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x263EFF9C0] set];
    visibleViewControllers = v12->_visibleViewControllers;
    v12->_visibleViewControllers = (NSMutableSet *)v15;

    [v9 addViewportChangeListener:v12 forOptions:28];
    objc_initWeak(&location, v12);
    if (objc_opt_respondsToSelector())
    {
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __76__SXDocumentSectionManager_initWithSectionHosting_viewport_appStateMonitor___block_invoke;
      v26[3] = &unk_264651108;
      objc_copyWeak(&v27, &location);
      [v10 performOnApplicationWindowDidBecomeForeground:v26];
      objc_destroyWeak(&v27);
    }
    if (objc_opt_respondsToSelector())
    {
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __76__SXDocumentSectionManager_initWithSectionHosting_viewport_appStateMonitor___block_invoke_2;
      v24[3] = &unk_264651108;
      objc_copyWeak(&v25, &location);
      [v10 performOnApplicationWillEnterForeground:v24];
      objc_destroyWeak(&v25);
    }
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __76__SXDocumentSectionManager_initWithSectionHosting_viewport_appStateMonitor___block_invoke_3;
    v22[3] = &unk_264651108;
    objc_copyWeak(&v23, &location);
    [v10 performOnApplicationDidBecomeActive:v22];
    if (objc_opt_respondsToSelector())
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __76__SXDocumentSectionManager_initWithSectionHosting_viewport_appStateMonitor___block_invoke_4;
      v20[3] = &unk_264651108;
      objc_copyWeak(&v21, &location);
      [v10 performOnApplicationWindowDidBecomeBackground:v20];
      objc_destroyWeak(&v21);
    }
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __76__SXDocumentSectionManager_initWithSectionHosting_viewport_appStateMonitor___block_invoke_5;
    v18[3] = &unk_264651108;
    objc_copyWeak(&v19, &location);
    [v10 performOnApplicationDidEnterBackground:v18];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __76__SXDocumentSectionManager_initWithSectionHosting_viewport_appStateMonitor___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateViewControllerVisibility];
}

void __76__SXDocumentSectionManager_initWithSectionHosting_viewport_appStateMonitor___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateViewControllerVisibility];
}

void __76__SXDocumentSectionManager_initWithSectionHosting_viewport_appStateMonitor___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateViewControllerVisibility];
}

void __76__SXDocumentSectionManager_initWithSectionHosting_viewport_appStateMonitor___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained endImpressions];
}

void __76__SXDocumentSectionManager_initWithSectionHosting_viewport_appStateMonitor___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained endImpressions];
}

- (void)applySectionBlueprint:(id)a3 identifier:(id)a4 offset:(CGPoint)a5 size:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  double y = a5.y;
  double x = a5.x;
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  v14 = [(SXDocumentSectionManager *)self blueprints];
  uint64_t v15 = [v14 objectForKey:v13];

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v52 = v15;
  v16 = [v15 items];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v57 objects:v62 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v58;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v58 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v57 + 1) + 8 * v20);
        v22 = [v12 items];
        char v23 = [v22 containsObject:v21];

        if ((v23 & 1) == 0)
        {
          v24 = [v21 sectionItemViewController];
          [v24 willMoveToParentViewController:0];
          id v25 = [v24 view];
          [v25 removeFromSuperview];

          [v24 removeFromParentViewController];
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v57 objects:v62 count:16];
    }
    while (v18);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v26 = [v12 items];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v54;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v54 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v53 + 1) + 8 * v30);
        v32 = [(SXDocumentSectionManager *)self viewController];
        v33 = [v32 traitCollection];
        objc_msgSend(v31, "sectionItemHeightForSize:traitCollection:", v33, width, height);
        double v35 = v34;

        v36 = [v31 sectionItemViewController];
        v37 = [v36 parentViewController];
        v38 = [(SXDocumentSectionManager *)self viewController];

        if (v37 != v38)
        {
          v39 = [v36 view];
          v40 = [v39 superview];

          if (v40)
          {
            [v36 willMoveToParentViewController:0];
            v41 = [v36 view];
            [v41 removeFromSuperview];

            [v36 removeFromParentViewController];
          }
          v42 = [(SXDocumentSectionManager *)self viewController];
          [v42 addChildViewController:v36];

          v43 = [(SXDocumentSectionManager *)self view];
          v44 = [v36 view];
          [v43 addSubview:v44];

          v45 = [(SXDocumentSectionManager *)self viewController];
          [v36 didMoveToParentViewController:v45];
        }
        v46 = [(SXDocumentSectionManager *)self view];
        v47 = [v36 view];
        [v46 bringSubviewToFront:v47];

        v48 = [v36 view];
        objc_msgSend(v48, "setFrameUsingCenterAndBounds:", x, y, width, v35);

        v49 = [v36 view];
        [v49 setNeedsLayout];

        v50 = [v36 view];
        [v50 setHidden:0];

        double y = y + v35;
        ++v30;
      }
      while (v28 != v30);
      uint64_t v28 = [v26 countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v28);
  }

  if (v12)
  {
    v51 = [(SXDocumentSectionManager *)self blueprints];
    [v51 setObject:v12 forKey:v13];
  }
  [(SXDocumentSectionManager *)self updateViewControllerVisibility];
}

- (void)viewport:(id)a3 appearStateChangedFromState:(unint64_t)a4
{
  id v7 = a3;
  [(SXDocumentSectionManager *)self updateViewControllerVisibility];
  if (a4 - 1 <= 1)
  {
    uint64_t v6 = [v7 appearState];
    if (v6 == 3 || !v6) {
      [(SXDocumentSectionManager *)self endImpressions];
    }
  }
  if (a4 == 1)
  {
    if ([v7 appearState] == 2) {
      [(SXDocumentSectionManager *)self performAppearanceTransitionForVisibleViewControllers];
    }
  }
  else if (a4 == 3 && ![v7 appearState])
  {
    [(SXDocumentSectionManager *)self performDisappearanceTransitionForVisibleViewControllers];
  }
}

- (void)updateViewControllerVisibility
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  v3 = [(SXDocumentSectionManager *)self viewport];
  unint64_t v4 = [v3 appearState] - 1;

  if (v4 <= 1)
  {
    v5 = [(SXDocumentSectionManager *)self hosting];
    uint64_t v6 = [v5 sectionHostingView];

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = [(SXDocumentSectionManager *)self blueprints];
    uint64_t v37 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (!v37) {
      goto LABEL_24;
    }
    uint64_t v36 = *(void *)v45;
    while (1)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v45 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v39 = v7;
        uint64_t v8 = *(void *)(*((void *)&v44 + 1) + 8 * v7);
        id v9 = [(SXDocumentSectionManager *)self blueprints];
        id v10 = [v9 objectForKey:v8];

        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        v38 = v10;
        v11 = [v10 items];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v40 objects:v48 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v41;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v41 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = [*(id *)(*((void *)&v40 + 1) + 8 * v15) sectionItemViewController];
              [v6 bounds];
              CGFloat v18 = v17;
              CGFloat v20 = v19;
              CGFloat v22 = v21;
              CGFloat v24 = v23;
              id v25 = [v16 view];
              [v25 frame];
              v52.origin.double x = v26;
              v52.origin.double y = v27;
              v52.size.double width = v28;
              v52.size.double height = v29;
              v51.origin.double x = v18;
              v51.origin.double y = v20;
              v51.size.double width = v22;
              v51.size.double height = v24;
              BOOL v30 = CGRectIntersectsRect(v51, v52);

              v31 = [(SXDocumentSectionManager *)self visibleViewControllers];
              int v32 = [v31 containsObject:v16];

              if (v30)
              {
                if (v32) {
                  goto LABEL_18;
                }
                [v16 beginAppearanceTransition:1 animated:0];
                [v16 endAppearanceTransition];
                v33 = [(SXDocumentSectionManager *)self visibleViewControllers];
                [v33 addObject:v16];
              }
              else
              {
                if (!v32) {
                  goto LABEL_18;
                }
                [v16 beginAppearanceTransition:0 animated:0];
                [v16 endAppearanceTransition];
                v33 = [(SXDocumentSectionManager *)self visibleViewControllers];
                [v33 removeObject:v16];
              }

LABEL_18:
              if ([v16 conformsToProtocol:&unk_26D641BF0])
              {
                id v34 = v16;
                [v6 bounds];
                objc_msgSend(v34, "updateDocumentSectionImpressionForView:visibleRect:", v6);
              }
              ++v15;
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v40 objects:v48 count:16];
          }
          while (v13);
        }

        uint64_t v7 = v39 + 1;
      }
      while (v39 + 1 != v37);
      uint64_t v37 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (!v37)
      {
LABEL_24:

        return;
      }
    }
  }
}

- (void)performDisappearanceTransitionForVisibleViewControllers
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(SXDocumentSectionManager *)self visibleViewControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        [v7 beginAppearanceTransition:0 animated:0];
        [v7 endAppearanceTransition];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)performAppearanceTransitionForVisibleViewControllers
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(SXDocumentSectionManager *)self visibleViewControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        [v7 beginAppearanceTransition:1 animated:0];
        [v7 endAppearanceTransition];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)endImpressions
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(SXDocumentSectionManager *)self blueprints];
  uint64_t v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v18)
  {
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v4 = [(SXDocumentSectionManager *)self blueprints];
        uint64_t v5 = [v4 objectForKey:v3];

        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v6 = [v5 items];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v8; ++j)
            {
              if (*(void *)v20 != v9) {
                objc_enumerationMutation(v6);
              }
              long long v11 = *(void **)(*((void *)&v19 + 1) + 8 * j);
              uint64_t v12 = [v11 sectionItemViewController];
              int v13 = [v12 conformsToProtocol:&unk_26D641BF0];

              if (v13)
              {
                uint64_t v14 = [v11 sectionItemViewController];
                [v14 endDocumentSectionImpression];
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v8);
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v18);
  }
}

- (double)heightForBlueprint:(id)a3 canvasSize:(CGSize)a4 traitCollection:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = objc_msgSend(a3, "items", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    double v13 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "sectionItemHeightForSize:traitCollection:", v8, width, height);
        double v13 = v13 + v15;
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
  else
  {
    double v13 = 0.0;
  }

  return v13;
}

- (id)viewController
{
  v2 = [(SXDocumentSectionManager *)self hosting];
  uint64_t v3 = [v2 sectionHostingViewController];

  return v3;
}

- (id)view
{
  v2 = [(SXDocumentSectionManager *)self hosting];
  uint64_t v3 = [v2 sectionHostingView];

  return v3;
}

- (SXDocumentSectionHosting)hosting
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hosting);
  return (SXDocumentSectionHosting *)WeakRetained;
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (NSMutableDictionary)blueprints
{
  return self->_blueprints;
}

- (NSMutableSet)visibleViewControllers
{
  return self->_visibleViewControllers;
}

- (TFMultiDelegate)multiScrollDelegate
{
  return self->_multiScrollDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiScrollDelegate, 0);
  objc_storeStrong((id *)&self->_visibleViewControllers, 0);
  objc_storeStrong((id *)&self->_blueprints, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
  objc_destroyWeak((id *)&self->_hosting);
}

@end