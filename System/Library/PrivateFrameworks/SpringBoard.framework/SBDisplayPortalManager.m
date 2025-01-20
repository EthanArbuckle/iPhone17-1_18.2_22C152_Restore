@interface SBDisplayPortalManager
- (SBDisplayPortalManager)initWithWindowSceneManager:(id)a3;
- (SBWindowSceneManager)windowSceneManager;
- (id)_createPortalForSourceView:(id)a3 sourceWindowScene:(id)a4 targetWindowScene:(id)a5 traitsRole:(id)a6;
- (void)createPortalsForSourceView:(id)a3 usingTraitsRole:(id)a4 onWindowScenesPassingTest:(id)a5;
- (void)destroyPortalsForSourceView:(id)a3;
@end

@implementation SBDisplayPortalManager

- (SBDisplayPortalManager)initWithWindowSceneManager:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBDisplayPortalManager;
  v6 = [(SBDisplayPortalManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_windowSceneManager, a3);
    uint64_t v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    sourceViewToPortalWindowsMap = v7->_sourceViewToPortalWindowsMap;
    v7->_sourceViewToPortalWindowsMap = (NSMapTable *)v8;
  }
  return v7;
}

- (void)createPortalsForSourceView:(id)a3 usingTraitsRole:(id)a4 onWindowScenesPassingTest:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(NSMapTable *)self->_sourceViewToPortalWindowsMap objectForKey:v9];

  if (!v12)
  {
    v13 = [v9 _sbWindowScene];
    if (!v13)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2 object:self file:@"SBDisplayPortalManager.m" lineNumber:46 description:@"Cannot create portals for a view that is not being displayed"];
    }
    v14 = [(SBWindowSceneManager *)self->_windowSceneManager connectedWindowScenes];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __95__SBDisplayPortalManager_createPortalsForSourceView_usingTraitsRole_onWindowScenesPassingTest___block_invoke;
    v19[3] = &unk_1E6B024D8;
    id v20 = v13;
    id v24 = v11;
    v21 = self;
    id v15 = v9;
    id v22 = v15;
    id v23 = v10;
    id v16 = v13;
    v17 = objc_msgSend(v14, "bs_compactMap:", v19);

    [(NSMapTable *)self->_sourceViewToPortalWindowsMap setObject:v17 forKey:v15];
  }
}

id __95__SBDisplayPortalManager_createPortalsForSourceView_usingTraitsRole_onWindowScenesPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(id *)(a1 + 32) == v3 || !(*(unsigned int (**)(void))(*(void *)(a1 + 64) + 16))())
  {
    v4 = 0;
  }
  else
  {
    v4 = [*(id *)(a1 + 40) _createPortalForSourceView:*(void *)(a1 + 48) sourceWindowScene:*(void *)(a1 + 32) targetWindowScene:v3 traitsRole:*(void *)(a1 + 56)];
  }

  return v4;
}

- (id)_createPortalForSourceView:(id)a3 sourceWindowScene:(id)a4 targetWindowScene:(id)a5 traitsRole:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  [v12 bounds];
  objc_msgSend(v11, "convertRect:toNeighboringDisplayWindowScene:", v10);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  v21 = (void *)[objc_alloc(MEMORY[0x1E4F43298]) initWithSourceView:v12];
  id v22 = [v21 portalLayer];
  [v22 setCrossDisplay:1];

  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);
  [v21 setUserInteractionEnabled:0];
  id v23 = objc_alloc_init(MEMORY[0x1E4F42FF8]);
  id v24 = [v23 view];
  [v24 addSubview:v21];

  v25 = (void *)[objc_alloc(MEMORY[0x1E4F43058]) initWithWindowScene:v10];
  [v25 _setRoleHint:v9];

  [v25 setOpaque:0];
  [v25 setRootViewController:v23];
  [v25 setHidden:0];
  v26 = [v12 window];

  [v26 windowLevel];
  objc_msgSend(v25, "setWindowLevel:");

  return v25;
}

- (void)destroyPortalsForSourceView:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NSMapTable *)self->_sourceViewToPortalWindowsMap objectForKey:v4];
  [(NSMapTable *)self->_sourceViewToPortalWindowsMap removeObjectForKey:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "setHidden:", 1, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (SBWindowSceneManager)windowSceneManager
{
  return self->_windowSceneManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowSceneManager, 0);
  objc_storeStrong((id *)&self->_sourceViewToPortalWindowsMap, 0);
}

@end