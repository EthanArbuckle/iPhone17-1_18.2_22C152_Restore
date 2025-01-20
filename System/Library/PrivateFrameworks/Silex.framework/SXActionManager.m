@interface SXActionManager
- (SXActionActivityManager)activityManager;
- (SXActionManager)initWithActionActivityManager:(id)a3 viewManager:(id)a4 postActionHandlerManager:(id)a5;
- (SXActionManagerPreview)currentPreview;
- (SXActionViewManager)viewManager;
- (SXPostActionHandlerManager)postActionHandlerManager;
- (id)contextMenuConfigurationForAction:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5;
- (id)previewViewControllerForAction:(id)a3;
- (void)commitPreviewViewController:(id)a3;
- (void)notifyPostActionHandlers:(id)a3 action:(id)a4 state:(unint64_t)a5;
- (void)performAction:(id)a3 postActionHandlers:(id)a4;
- (void)performAction:(id)a3 postActionHandlers:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 mode:(unint64_t)a7;
- (void)setCurrentPreview:(id)a3;
@end

@implementation SXActionManager

- (SXActionManager)initWithActionActivityManager:(id)a3 viewManager:(id)a4 postActionHandlerManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXActionManager;
  v12 = [(SXActionManager *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_activityManager, a3);
    objc_storeStrong((id *)&v13->_viewManager, a4);
    objc_storeStrong((id *)&v13->_postActionHandlerManager, a5);
  }

  return v13;
}

- (void)performAction:(id)a3 postActionHandlers:(id)a4
{
}

- (void)performAction:(id)a3 postActionHandlers:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 mode:(unint64_t)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  if (v15 && v16)
  {
    v18 = [(SXActionManager *)self activityManager];
    v19 = objc_msgSend(v18, "activityGroupForAction:sourceView:sourceRect:", v15, v17, x, y, width, height);

    if ((a7 | 2) == 2)
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v20 = [v19 activities];
      id v21 = (id)[v20 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v21)
      {
        v33 = v19;
        uint64_t v22 = *(void *)v39;
        while (2)
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v39 != v22) {
              objc_enumerationMutation(v20);
            }
            v24 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            if (!objc_msgSend(v24, "type", v33))
            {
              id v21 = v24;
              goto LABEL_14;
            }
          }
          id v21 = (id)[v20 countByEnumeratingWithState:&v38 objects:v42 count:16];
          if (v21) {
            continue;
          }
          break;
        }
LABEL_14:
        v19 = v33;
      }
    }
    else
    {
      id v21 = 0;
    }
    if (a7 == 2 && !v21)
    {
      v25 = [v19 activities];
      id v21 = [v25 firstObject];
    }
    if (v21)
    {
      [v21 invokeWithAction:v15 invocationMethod:0];
      v26 = self;
      id v27 = v16;
      id v28 = v15;
      uint64_t v29 = 2;
    }
    else
    {
      v30 = [v19 activities];
      uint64_t v31 = [v30 count];

      if (v31)
      {
        v32 = [(SXActionManager *)self viewManager];
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = __79__SXActionManager_performAction_postActionHandlers_sourceView_sourceRect_mode___block_invoke;
        v34[3] = &unk_2646512D8;
        id v35 = v15;
        v36 = self;
        id v37 = v16;
        objc_msgSend(v32, "presentActivityGroup:action:sourceView:sourceRect:completion:", v19, v35, v17, v34, x, y, width, height);

        goto LABEL_25;
      }
      v26 = self;
      id v27 = v16;
      id v28 = v15;
      uint64_t v29 = 0;
    }
    [(SXActionManager *)v26 notifyPostActionHandlers:v27 action:v28 state:v29];
LABEL_25:
  }
}

void __79__SXActionManager_performAction_postActionHandlers_sourceView_sourceRect_mode___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v7 = v5;
  if (a2 == 1)
  {
    uint64_t v6 = 1;
  }
  else if (a2)
  {
    uint64_t v6 = 0;
  }
  else
  {
    [v5 invokeWithAction:*(void *)(a1 + 32) invocationMethod:1];
    uint64_t v6 = 2;
  }
  [*(id *)(a1 + 40) notifyPostActionHandlers:*(void *)(a1 + 48) action:*(void *)(a1 + 32) state:v6];
}

- (id)contextMenuConfigurationForAction:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  v13 = [(SXActionManager *)self activityManager];
  id v37 = v12;
  v14 = objc_msgSend(v13, "activityGroupForAction:sourceView:sourceRect:", v11, v12, x, y, width, height);

  long long v40 = v11;
  long long v39 = [(SXActionManager *)self previewViewControllerForAction:v11];
  id v15 = [MEMORY[0x263EFF980] array];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v38 = v14;
  id v16 = [v14 activities];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v48 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        if (![v21 type])
        {
          if (v39) {
            continue;
          }
          v26 = [v38 activities];
          uint64_t v27 = [v26 count];

          if (v27 == 1) {
            continue;
          }
        }
        uint64_t v22 = (void *)MEMORY[0x263F1C3C0];
        v23 = [v21 label];
        v24 = [v21 image];
        v45[0] = MEMORY[0x263EF8330];
        v45[1] = 3221225472;
        v45[2] = __75__SXActionManager_contextMenuConfigurationForAction_sourceView_sourceRect___block_invoke;
        v45[3] = &unk_264651300;
        v45[4] = v21;
        id v46 = v11;
        v25 = [v22 actionWithTitle:v23 image:v24 identifier:0 handler:v45];
        [v15 addObject:v25];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v18);
  }

  if ([v15 count] || v39)
  {
    uint64_t v31 = (void *)MEMORY[0x263F1C7A8];
    v30 = v38;
    v32 = [v38 title];
    v33 = [v31 menuWithTitle:v32 children:v15];

    v34 = (void *)MEMORY[0x263F1C580];
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __75__SXActionManager_contextMenuConfigurationForAction_sourceView_sourceRect___block_invoke_2;
    v43[3] = &unk_264651328;
    id v44 = v39;
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __75__SXActionManager_contextMenuConfigurationForAction_sourceView_sourceRect___block_invoke_3;
    v41[3] = &unk_264651350;
    id v42 = v33;
    id v35 = v33;
    id v28 = [v34 configurationWithIdentifier:0 previewProvider:v43 actionProvider:v41];

    uint64_t v29 = v37;
  }
  else
  {
    id v28 = 0;
    uint64_t v29 = v37;
    v30 = v38;
  }

  return v28;
}

uint64_t __75__SXActionManager_contextMenuConfigurationForAction_sourceView_sourceRect___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invokeWithAction:*(void *)(a1 + 40) invocationMethod:1];
}

id __75__SXActionManager_contextMenuConfigurationForAction_sourceView_sourceRect___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __75__SXActionManager_contextMenuConfigurationForAction_sourceView_sourceRect___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)previewViewControllerForAction:(id)a3
{
  id v4 = a3;
  id v5 = [(SXActionManager *)self activityManager];
  uint64_t v6 = [v5 previewActivityForAction:v4];

  id v7 = [v6 previewViewControllerForAction:v4];
  if (v7)
  {
    v8 = -[SXActionManagerPreview initWithAction:viewController:previewActivity:]((id *)[SXActionManagerPreview alloc], v4, v7, v6);
    [(SXActionManager *)self setCurrentPreview:v8];
  }
  return v7;
}

- (void)commitPreviewViewController:(id)a3
{
  id v9 = a3;
  id v4 = [(SXActionManager *)self currentPreview];
  id v5 = v4;
  if (v4)
  {
    -[SXActionManagerPreview viewController](v4);
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v9)
    {
      [(SXActionManager *)self setCurrentPreview:0];
      id v7 = -[SXFullscreenCaption caption]((uint64_t)v5);
      v8 = -[SXFullscreenCaption text]((uint64_t)v5);
      [v7 commitViewController:v9 action:v8];
    }
  }
}

- (void)notifyPostActionHandlers:(id)a3 action:(id)a4 state:(unint64_t)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v13++) handledAction:v9 state:a5];
      }
      while (v11 != v13);
      uint64_t v11 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
  v14 = [(SXActionManager *)self postActionHandlerManager];
  [v14 handledAction:v9 state:a5];
}

- (SXActionActivityManager)activityManager
{
  return self->_activityManager;
}

- (SXActionViewManager)viewManager
{
  return self->_viewManager;
}

- (SXActionManagerPreview)currentPreview
{
  return self->_currentPreview;
}

- (void)setCurrentPreview:(id)a3
{
}

- (SXPostActionHandlerManager)postActionHandlerManager
{
  return self->_postActionHandlerManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postActionHandlerManager, 0);
  objc_storeStrong((id *)&self->_currentPreview, 0);
  objc_storeStrong((id *)&self->_viewManager, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
}

@end