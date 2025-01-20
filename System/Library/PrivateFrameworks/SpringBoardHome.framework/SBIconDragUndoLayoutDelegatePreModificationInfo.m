@interface SBIconDragUndoLayoutDelegatePreModificationInfo
- (NSArray)visibleListViews;
- (NSMapTable)originalIconsPerListView;
- (NSMapTable)originalScreenLocationsPerIcon;
- (SBIconDragUndoLayoutDelegatePreModificationInfo)initWithRootFolderController:(id)a3;
- (SBRootFolderController)rootFolderController;
@end

@implementation SBIconDragUndoLayoutDelegatePreModificationInfo

- (SBIconDragUndoLayoutDelegatePreModificationInfo)initWithRootFolderController:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v47.receiver = self;
  v47.super_class = (Class)SBIconDragUndoLayoutDelegatePreModificationInfo;
  v6 = [(SBIconDragUndoLayoutDelegatePreModificationInfo *)&v47 init];
  v7 = v6;
  if (v6)
  {
    id v30 = a3;
    v31 = v6;
    id v32 = v5;
    v8 = [v5 visibleIconListViews];
    v35 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = v8;
    uint64_t v36 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v36)
    {
      uint64_t v34 = *(void *)v44;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v44 != v34) {
            objc_enumerationMutation(obj);
          }
          uint64_t v37 = v10;
          v11 = *(void **)(*((void *)&v43 + 1) + 8 * v10);
          v12 = [v11 icons];
          [(NSMapTable *)v35 setObject:v12 forKey:v11];
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v13 = v12;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v48 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v40;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v40 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void *)(*((void *)&v39 + 1) + 8 * i);
                v19 = [v11 displayedIconViewForIcon:v18];
                v20 = v19;
                if (v19)
                {
                  [v19 center];
                  objc_msgSend(v11, "convertPoint:toView:", 0);
                  v38[0] = v21;
                  v38[1] = v22;
                  v23 = [MEMORY[0x1E4F29238] valueWithBytes:v38 objCType:"{CGPoint=dd}"];
                  [(NSMapTable *)v9 setObject:v23 forKey:v18];
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v39 objects:v48 count:16];
            }
            while (v15);
          }

          uint64_t v10 = v37 + 1;
        }
        while (v37 + 1 != v36);
        uint64_t v36 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v36);
    }

    v7 = v31;
    objc_storeStrong((id *)&v31->_rootFolderController, v30);
    uint64_t v24 = [obj copy];
    visibleListViews = v31->_visibleListViews;
    v31->_visibleListViews = (NSArray *)v24;

    originalIconsPerListView = v31->_originalIconsPerListView;
    v31->_originalIconsPerListView = v35;
    v27 = v35;

    originalScreenLocationsPerIcon = v31->_originalScreenLocationsPerIcon;
    v31->_originalScreenLocationsPerIcon = v9;

    id v5 = v32;
  }

  return v7;
}

- (SBRootFolderController)rootFolderController
{
  return self->_rootFolderController;
}

- (NSArray)visibleListViews
{
  return self->_visibleListViews;
}

- (NSMapTable)originalIconsPerListView
{
  return self->_originalIconsPerListView;
}

- (NSMapTable)originalScreenLocationsPerIcon
{
  return self->_originalScreenLocationsPerIcon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalScreenLocationsPerIcon, 0);
  objc_storeStrong((id *)&self->_originalIconsPerListView, 0);
  objc_storeStrong((id *)&self->_visibleListViews, 0);
  objc_storeStrong((id *)&self->_rootFolderController, 0);
}

@end