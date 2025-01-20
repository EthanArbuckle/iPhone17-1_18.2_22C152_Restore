@interface SBFluidSwitcherSpaceTitleItemController
- (BOOL)isChamoisWindowingEnabled;
- (BOOL)isUsingDarkLabels;
- (SBFluidSwitcherSpaceTitleItemController)initWithAppLayout:(id)a3 applicationSceneHandleProvider:(id)a4 displayIdentity:(id)a5 showCanvasTitles:(BOOL)a6 isChamoisWindowingEnabled:(BOOL)a7;
- (id)_computeHeaderItems;
- (id)_iconForDisplayItem:(id)a3;
- (id)_iconImageAppearance;
- (id)_iconImageForDisplayItem:(id)a3;
- (id)updateHandler;
- (int64_t)userInterfaceStyle;
- (unint64_t)multiWindowIndicatorRoleMask;
- (void)_loadIconForDisplayItem:(id)a3;
- (void)_performUpdateHandler;
- (void)_updateDisplayItemIcons;
- (void)dealloc;
- (void)iconImageDidUpdate:(id)a3;
- (void)invalidate;
- (void)setMultiWindowIndicatorRoleMask:(unint64_t)a3;
- (void)setUpdateHandler:(id)a3;
- (void)setUseDarkLabels:(BOOL)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
@end

@implementation SBFluidSwitcherSpaceTitleItemController

- (void)setMultiWindowIndicatorRoleMask:(unint64_t)a3
{
  if (self->_multiWindowIndicatorRoleMask != a3)
  {
    self->_multiWindowIndicatorRoleMask = a3;
    [(SBFluidSwitcherSpaceTitleItemController *)self _performUpdateHandler];
  }
}

- (id)_iconImageForDisplayItem:(id)a3
{
  id v4 = a3;
  v5 = +[SBIconController sharedInstance];
  v6 = [v5 appSwitcherHeaderIconImageCache];

  v7 = [(SBFluidSwitcherSpaceTitleItemController *)self _iconImageAppearance];
  v8 = [(NSMutableDictionary *)self->_displayItemToIcon objectForKey:v4];

  if (v8) {
    [v6 imageForIcon:v8 imageAppearance:v7 options:0];
  }
  else {
  v9 = [v6 genericImageWithImageAppearance:v7 options:0];
  }

  return v9;
}

- (id)_iconImageAppearance
{
  v3 = +[SBIconController sharedInstance];
  id v4 = [v3 currentIconImageStyleConfiguration];

  v5 = objc_msgSend(v4, "iconImageAppearanceWithUserInterfaceStyle:", -[SBFluidSwitcherSpaceTitleItemController userInterfaceStyle](self, "userInterfaceStyle"));

  return v5;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)_loadIconForDisplayItem:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_displayItemToIcon objectForKey:v4];
  if (v5)
  {
    v6 = +[SBIconController sharedInstance];
    v7 = [v6 appSwitcherHeaderIconImageCache];

    v8 = [(SBFluidSwitcherSpaceTitleItemController *)self _iconImageAppearance];
    v9 = [v7 imageForIcon:v5 imageAppearance:v8 options:4];
    if (!v9)
    {
      if ([v5 isApplicationIcon])
      {
        id v10 = v5;
        v9 = [v7 genericImage];
        uint64_t v12 = MEMORY[0x1E4F143A8];
        uint64_t v13 = 3221225472;
        v14 = __67__SBFluidSwitcherSpaceTitleItemController__loadIconForDisplayItem___block_invoke;
        v15 = &unk_1E6B0D950;
        id v16 = v7;
        id v17 = v10;
        id v18 = v8;
        v19 = self;
        id v20 = v4;
        id v21 = v17;
        id v11 = (id)[v16 cacheImageForIcon:v17 imageAppearance:v18 options:0 completionHandler:&v12];

        if (!v9) {
          goto LABEL_8;
        }
      }
      else
      {
        v9 = [v7 imageForIcon:v5 imageAppearance:v8 options:0];
        if (!v9)
        {
LABEL_8:

          goto LABEL_9;
        }
      }
    }
    [(SBFluidSwitcherSpaceTitleItemController *)self _performUpdateHandler];

    goto LABEL_8;
  }
LABEL_9:
}

- (BOOL)isChamoisWindowingEnabled
{
  return self->_isChamoisWindowingEnabled;
}

- (void)_performUpdateHandler
{
  if (!self->_invalidated)
  {
    updateHandler = (void (**)(id, SBFluidSwitcherSpaceTitleItemController *, id))self->_updateHandler;
    if (updateHandler)
    {
      id v4 = [(SBFluidSwitcherSpaceTitleItemController *)self _computeHeaderItems];
      updateHandler[2](updateHandler, self, v4);
    }
  }
}

- (void)setUseDarkLabels:(BOOL)a3
{
  if (self->_useDarkLabels != a3)
  {
    self->_useDarkLabels = a3;
    [(SBFluidSwitcherSpaceTitleItemController *)self _performUpdateHandler];
  }
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  if (self->_userInterfaceStyle != a3)
  {
    self->_userInterfaceStyle = a3;
    [(SBFluidSwitcherSpaceTitleItemController *)self _performUpdateHandler];
  }
}

- (void)setUpdateHandler:(id)a3
{
  if (self->_updateHandler != a3)
  {
    id v4 = (void *)[a3 copy];
    id updateHandler = self->_updateHandler;
    self->_id updateHandler = v4;

    [(SBFluidSwitcherSpaceTitleItemController *)self _performUpdateHandler];
  }
}

- (SBFluidSwitcherSpaceTitleItemController)initWithAppLayout:(id)a3 applicationSceneHandleProvider:(id)a4 displayIdentity:(id)a5 showCanvasTitles:(BOOL)a6 isChamoisWindowingEnabled:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  unint64_t v15 = (unint64_t)a4;
  unint64_t v16 = (unint64_t)a5;
  v53 = (void *)v16;
  if (v15 | v16 && (!v15 || !v16))
  {
    v51 = [MEMORY[0x1E4F28B00] currentHandler];
    [v51 handleFailureInMethod:a2, self, @"SBFluidSwitcherSpaceTitleItemController.m", 46, @"Invalid parameter not satisfying: %@", @"(applicationSceneHandleProvider == nil && displayIdentity == nil) || (applicationSceneHandleProvider != nil && displayIdentity != nil)" object file lineNumber description];
  }
  v62.receiver = self;
  v62.super_class = (Class)SBFluidSwitcherSpaceTitleItemController;
  id v17 = [(SBFluidSwitcherSpaceTitleItemController *)&v62 init];
  v57 = v17;
  if (v17)
  {
    id v18 = v17;
    p_appLayout = (id *)&v17->_appLayout;
    objc_storeStrong((id *)&v17->_appLayout, a3);
    p_displayIdentity = &v18->_displayIdentity;
    objc_storeStrong((id *)&v18->_displayIdentity, a5);
    v18->_isChamoisWindowingEnabled = v7;
    if (v7)
    {
      uint64_t v20 = [(SBAppLayout *)v18->_appLayout allItems];
      displayItems = v18->_displayItems;
      v18->_displayItems = (NSArray *)v20;
    }
    else
    {
      displayItems = (NSArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
      v22 = [*p_appLayout itemForLayoutRole:1];
      if (v22) {
        [(NSArray *)displayItems addObject:v22];
      }
      v23 = [*p_appLayout itemForLayoutRole:2];
      if (v23) {
        [(NSArray *)displayItems addObject:v23];
      }
      uint64_t v24 = [(NSArray *)displayItems copy];
      v25 = v57->_displayItems;
      v57->_displayItems = (NSArray *)v24;
    }
    if (v8)
    {
      id v52 = v14;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      v26 = v57->_displayItems;
      uint64_t v27 = [(NSArray *)v26 countByEnumeratingWithState:&v58 objects:v63 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v59;
        v54 = v26;
        unint64_t v55 = v15;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v59 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            if (![v31 type])
            {
              v32 = [v31 bundleIdentifier];
              if (v32)
              {
                v33 = +[SBApplicationController sharedInstance];
                v34 = [v33 applicationWithBundleIdentifier:v32];

                v35 = [v34 info];
                int v36 = [v35 supportsMultiwindow];

                if (v36)
                {
                  v37 = [v31 uniqueIdentifier];
                  v38 = [(id)v15 sceneIdentityForApplication:v34 uniqueIdentifier:v37];

                  if (v38)
                  {
                    v39 = +[SBApplicationSceneHandleRequest defaultRequestForApplication:v34 sceneIdentity:v38 displayIdentity:*p_displayIdentity];
                    uint64_t v40 = objc_opt_class();
                    v41 = [(id)v15 fetchOrCreateApplicationSceneHandleForRequest:v39];
                    v42 = SBSafeCast(v40, v41);

                    if (v42)
                    {
                      v43 = v57;
                      displayItemToSceneHandle = v57->_displayItemToSceneHandle;
                      if (!displayItemToSceneHandle)
                      {
                        id v45 = objc_alloc(MEMORY[0x1E4F1CA60]);
                        uint64_t v46 = [(NSArray *)v57->_displayItems count];
                        v47 = v45;
                        v43 = v57;
                        uint64_t v48 = [v47 initWithCapacity:v46];
                        v49 = v57->_displayItemToSceneHandle;
                        v57->_displayItemToSceneHandle = (NSMutableDictionary *)v48;

                        displayItemToSceneHandle = v57->_displayItemToSceneHandle;
                      }
                      [(NSMutableDictionary *)displayItemToSceneHandle setObject:v42 forKey:v31];
                      [v42 addObserver:v43];
                    }

                    v26 = v54;
                    unint64_t v15 = v55;
                  }
                }
              }
            }
          }
          uint64_t v28 = [(NSArray *)v26 countByEnumeratingWithState:&v58 objects:v63 count:16];
        }
        while (v28);
      }

      id v14 = v52;
    }
    [(SBFluidSwitcherSpaceTitleItemController *)v57 _updateDisplayItemIcons];
  }

  return v57;
}

- (void)_updateDisplayItemIcons
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = self->_displayItems;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v9 = -[NSMutableDictionary objectForKey:](self->_displayItemToIcon, "objectForKey:", v8, (void)v16);
        id v10 = [(SBFluidSwitcherSpaceTitleItemController *)self _iconForDisplayItem:v8];
        id v11 = v10;
        if (v10 != v9 && ([v10 isEqual:v9] & 1) == 0)
        {
          [v9 removeObserver:self];
          displayItemToIcon = self->_displayItemToIcon;
          if (v11)
          {
            if (!displayItemToIcon)
            {
              uint64_t v13 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSArray count](self->_displayItems, "count"));
              id v14 = self->_displayItemToIcon;
              self->_displayItemToIcon = v13;

              displayItemToIcon = self->_displayItemToIcon;
            }
            [(NSMutableDictionary *)displayItemToIcon setObject:v11 forKey:v8];
            [v11 addObserver:self];
            [(SBFluidSwitcherSpaceTitleItemController *)self _loadIconForDisplayItem:v8];
          }
          else
          {
            [(NSMutableDictionary *)displayItemToIcon removeObjectForKey:v8];
            if (![(NSMutableDictionary *)self->_displayItemToIcon count])
            {
              unint64_t v15 = self->_displayItemToIcon;
              self->_displayItemToIcon = 0;
            }
          }
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
}

- (id)_iconForDisplayItem:(id)a3
{
  id v3 = a3;
  if ([v3 type] == 5) {
    [v3 webClipIdentifier];
  }
  else {
  uint64_t v4 = [v3 bundleIdentifier];
  }

  if (v4)
  {
    if ([v4 isEqualToString:@"com.apple.InCallService"])
    {
      uint64_t v5 = objc_alloc_init(SBInCallPresentationScreenSharingIcon);
    }
    else
    {
      uint64_t v6 = +[SBIconController sharedInstance];
      BOOL v7 = [v6 model];

      uint64_t v5 = [v7 expectedIconForDisplayIdentifier:v4 createIfNecessary:1];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_computeHeaderItems
{
  v2 = self;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obj = self->_displayItems;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v27;
    BOOL v7 = off_1E6AEE000;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v10 = (void *)[objc_alloc(v7[154]) initWithDisplayItem:v9];
        if ([v9 type] == 6)
        {
          id v11 = [MEMORY[0x1E4F28B50] mainBundle];
          uint64_t v12 = [v11 localizedStringForKey:@"SHELF_PLUS_CONTROL_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];
          [v10 setTitleText:v12];
        }
        else
        {
          v25 = [(NSMutableDictionary *)v2->_displayItemToIcon objectForKey:v9];
          uint64_t v13 = [v25 displayNameForLocation:@"SBIconLocationAppSwitcher"];
          [v10 setTitleText:v13];

          id v14 = [(NSMutableDictionary *)v2->_displayItemToSceneHandle objectForKey:v9];
          [v14 sceneTitle];
          unint64_t v15 = v2;
          long long v16 = v5;
          uint64_t v17 = v4;
          uint64_t v18 = v6;
          uint64_t v20 = v19 = v7;
          [v10 setSubtitleText:v20];

          BOOL v7 = v19;
          uint64_t v6 = v18;
          uint64_t v4 = v17;
          uint64_t v5 = v16;
          v2 = v15;
          id v11 = v25;

          uint64_t v12 = [(SBFluidSwitcherSpaceTitleItemController *)v2 _iconImageForDisplayItem:v9];
          [v10 setImage:v12];
        }

        if (v2->_useDarkLabels) {
          [MEMORY[0x1E4F428B8] blackColor];
        }
        else {
        uint64_t v21 = [MEMORY[0x1E4F428B8] whiteColor];
        }
        [v10 setTitleTextColor:v21];

        if (v2->_useDarkLabels) {
          uint64_t v22 = 1;
        }
        else {
          uint64_t v22 = 2;
        }
        [v10 setSubtitleInterfaceStyle:v22];
        objc_msgSend(v10, "setShowsMultiWindowIndicator:", SBLayoutRoleMaskContainsRole(v2->_multiWindowIndicatorRoleMask, -[SBAppLayout layoutRoleForItem:](v2->_appLayout, "layoutRoleForItem:", v9)));
        if (!v5) {
          uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](v2->_displayItems, "count"));
        }
        [v5 addObject:v10];
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)self->_displayItemToSceneHandle objectEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) removeObserver:self];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SBFluidSwitcherSpaceTitleItemController;
  [(SBFluidSwitcherSpaceTitleItemController *)&v8 dealloc];
}

- (void)invalidate
{
  self->_invalidated = 1;
}

- (void)iconImageDidUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__120;
  uint64_t v17 = __Block_byref_object_dispose__120;
  id v18 = 0;
  displayItemToIcon = self->_displayItemToIcon;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  long long v9 = __62__SBFluidSwitcherSpaceTitleItemController_iconImageDidUpdate___block_invoke;
  long long v10 = &unk_1E6B0D928;
  id v6 = v4;
  id v11 = v6;
  long long v12 = &v13;
  [(NSMutableDictionary *)displayItemToIcon enumerateKeysAndObjectsUsingBlock:&v7];
  if (v14[5]) {
    -[SBFluidSwitcherSpaceTitleItemController _loadIconForDisplayItem:](self, "_loadIconForDisplayItem:", v7, v8, v9, v10);
  }

  _Block_object_dispose(&v13, 8);
}

void __62__SBFluidSwitcherSpaceTitleItemController_iconImageDidUpdate___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if (*(void *)(a1 + 32) == a3)
  {
    id v9 = v8;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v8 = v9;
    *a4 = 1;
  }
}

void __67__SBFluidSwitcherSpaceTitleItemController__loadIconForDisplayItem___block_invoke(id *a1)
{
  id v2 = a1[4];
  id v3 = a1[5];
  id v4 = a1[6];
  id v5 = a1[8];
  id v6 = a1[9];
  BSDispatchMain();
}

void __67__SBFluidSwitcherSpaceTitleItemController__loadIconForDisplayItem___block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) imageForIcon:*(void *)(a1 + 40) imageAppearance:*(void *)(a1 + 48) options:4];
  id v2 = [*(id *)(*(void *)(a1 + 56) + 32) objectForKey:*(void *)(a1 + 64)];
  int v3 = [v2 isEqual:*(void *)(a1 + 72)];

  if (v3) {
    BOOL v4 = v5 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    [*(id *)(a1 + 56) _performUpdateHandler];
  }
}

- (BOOL)isUsingDarkLabels
{
  return self->_useDarkLabels;
}

- (unint64_t)multiWindowIndicatorRoleMask
{
  return self->_multiWindowIndicatorRoleMask;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_displayItemToSceneHandle, 0);
  objc_storeStrong((id *)&self->_displayItemToIcon, 0);
  objc_storeStrong((id *)&self->_displayItems, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end