@interface SWNavigationManager
- (BOOL)shouldPreviewRequest:(id)a3;
- (NSMutableArray)handlers;
- (NSMutableDictionary)extensionHandlers;
- (NSMutableDictionary)schemeHandlers;
- (NSMutableSet)observers;
- (SWNavigationManager)init;
- (SWNavigationPreview)currentPreview;
- (id)previewViewControllerForRequest:(id)a3;
- (unint64_t)actionForRequest:(id)a3;
- (void)addObserver:(id)a3;
- (void)commitViewController:(id)a3;
- (void)registerHandler:(id)a3;
- (void)registerHandler:(id)a3 extension:(id)a4;
- (void)registerHandler:(id)a3 scheme:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setCurrentPreview:(id)a3;
@end

@implementation SWNavigationManager

- (SWNavigationManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)SWNavigationManager;
  v2 = [(SWNavigationManager *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    schemeHandlers = v2->_schemeHandlers;
    v2->_schemeHandlers = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    extensionHandlers = v2->_extensionHandlers;
    v2->_extensionHandlers = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9C0] set];
    observers = v2->_observers;
    v2->_observers = (NSMutableSet *)v9;
  }
  return v2;
}

- (unint64_t)actionForRequest:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 URL];
  v6 = [v5 pathExtension];

  uint64_t v7 = [v4 URL];
  v8 = [v7 scheme];

  if (v6)
  {
    uint64_t v9 = [(SWNavigationManager *)self extensionHandlers];
    v10 = [v9 objectForKey:v6];

    unint64_t v11 = [v10 handleRequest:v4];
    if (v11) {
      goto LABEL_7;
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  if (v8)
  {
    objc_super v12 = [(SWNavigationManager *)self schemeHandlers];
    v13 = [v12 objectForKey:v8];

    unint64_t v11 = [v13 handleRequest:v4];
  }
LABEL_7:
  if (v11)
  {
LABEL_18:
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v14 = [(SWNavigationManager *)self observers];
    uint64_t v20 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v28;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(v14);
          }
          v24 = *(void **)(*((void *)&v27 + 1) + 8 * v23);
          v25 = [v4 URL];
          [v24 handledNavigationWithURL:v25];

          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v21);
    }
  }
  else
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v14 = [(SWNavigationManager *)self handlers];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v32;
      while (2)
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = [*(id *)(*((void *)&v31 + 1) + 8 * v18) handleRequest:v4];
          if (v19)
          {
            unint64_t v11 = v19;

            goto LABEL_18;
          }
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
    unint64_t v11 = 0;
  }

  return v11;
}

- (BOOL)shouldPreviewRequest:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 URL];
  v6 = [v5 pathExtension];

  uint64_t v7 = [v4 URL];
  v8 = [v7 scheme];

  uint64_t v9 = &selRef_originatingSession;
  if (v6)
  {
    v10 = [(SWNavigationManager *)self extensionHandlers];
    unint64_t v11 = [v10 objectForKey:v6];

    if (objc_opt_respondsToSelector())
    {
      objc_super v12 = [v11 previewViewControllerForRequest:v4];
      if (v12) {
        v13 = [[SWNavigationPreview alloc] initWithViewController:v12 navigationHandler:v11 URLRequest:v4];
      }
      else {
        v13 = 0;
      }
    }
    else
    {
      v13 = 0;
    }

    if (v13) {
      goto LABEL_18;
    }
  }
  else
  {
    v13 = 0;
  }
  if (v8)
  {
    v14 = [(SWNavigationManager *)self schemeHandlers];
    uint64_t v15 = [v14 objectForKey:v8];

    if (objc_opt_respondsToSelector())
    {
      uint64_t v16 = [v15 previewViewControllerForRequest:v4];
      if (v16) {
        v13 = [[SWNavigationPreview alloc] initWithViewController:v16 navigationHandler:v15 URLRequest:v4];
      }
      else {
        v13 = 0;
      }
    }
    else
    {
      v13 = 0;
    }
  }
LABEL_18:
  if (!v13)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v17 = [(SWNavigationManager *)self handlers];
    v13 = (SWNavigationPreview *)[v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v13)
    {
      long long v27 = v6;
      long long v28 = v8;
      uint64_t v18 = *(void *)v30;
      while (2)
      {
        uint64_t v19 = 0;
        uint64_t v20 = v9;
        do
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v19);
          if (objc_opt_respondsToSelector())
          {
            uint64_t v22 = [v21 previewViewControllerForRequest:v4];
            if (v22)
            {
              uint64_t v23 = (void *)v22;
              v13 = [[SWNavigationPreview alloc] initWithViewController:v22 navigationHandler:v21 URLRequest:v4];

              goto LABEL_30;
            }
          }
          uint64_t v19 = (SWNavigationPreview *)((char *)v19 + 1);
        }
        while (v13 != v19);
        v13 = (SWNavigationPreview *)[v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
        uint64_t v9 = v20;
        if (v13) {
          continue;
        }
        break;
      }
LABEL_30:
      v6 = v27;
      v8 = v28;
    }
  }
  -[SWNavigationManager setCurrentPreview:](self, "setCurrentPreview:", v13, v27, v28);
  v24 = [(SWNavigationManager *)self currentPreview];
  BOOL v25 = v24 != 0;

  return v25;
}

- (id)previewViewControllerForRequest:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(SWNavigationManager *)self currentPreview],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 request],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v4 isEqual:v6],
        v6,
        v5,
        v7))
  {
    v8 = [(SWNavigationManager *)self currentPreview];
    uint64_t v9 = [v8 viewController];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)commitViewController:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SWNavigationManager *)self currentPreview];
  v6 = v5;
  if (v4)
  {
    id v7 = [v5 viewController];

    if (v7 == v4)
    {
      [(SWNavigationManager *)self setCurrentPreview:0];
      v8 = [v6 navigationHandler];
      uint64_t v9 = [v6 request];
      [v8 commitViewController:v4 URLRequest:v9];

      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      v10 = [(SWNavigationManager *)self observers];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v19;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void **)(*((void *)&v18 + 1) + 8 * v14);
            uint64_t v16 = [v6 request];
            uint64_t v17 = [v16 URL];
            [v15 handledNavigationWithURL:v17];

            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v12);
      }
    }
  }
}

- (void)registerHandler:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SWNavigationManager *)self handlers];
    [v5 addObject:v4];
  }
}

- (void)registerHandler:(id)a3 scheme:(id)a4
{
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(SWNavigationManager *)self schemeHandlers];
    [v8 setObject:v7 forKey:v6];
  }
}

- (void)registerHandler:(id)a3 extension:(id)a4
{
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(SWNavigationManager *)self extensionHandlers];
    [v8 setObject:v7 forKey:v6];
  }
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SWNavigationManager *)self observers];
    [v5 addObject:v4];
  }
}

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SWNavigationManager *)self observers];
    [v5 removeObject:v4];
  }
}

- (NSMutableArray)handlers
{
  return self->_handlers;
}

- (NSMutableDictionary)schemeHandlers
{
  return self->_schemeHandlers;
}

- (NSMutableDictionary)extensionHandlers
{
  return self->_extensionHandlers;
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (SWNavigationPreview)currentPreview
{
  return self->_currentPreview;
}

- (void)setCurrentPreview:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPreview, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_extensionHandlers, 0);
  objc_storeStrong((id *)&self->_schemeHandlers, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
}

@end