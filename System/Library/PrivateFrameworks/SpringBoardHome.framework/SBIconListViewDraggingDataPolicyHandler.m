@interface SBIconListViewDraggingDataPolicyHandler
- (BOOL)allowsSpringLoadForSession:(id)a3 onIconView:(id)a4;
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (SBIconListViewDraggingDataPolicyHandler)init;
- (SBIconListViewDraggingDestinationDelegate)draggingDestinationDelegate;
- (id)_bestSupportedUTIForDragItem:(id)a3 supportedTypes:(id)a4;
- (id)_currentDraggingIconViewInView:(id)a3 forLocation:(CGPoint)a4;
- (unint64_t)dragHitRegionForDropSession:(id)a3 iconListView:(id)a4 point:(CGPoint)a5 icon:(id)a6;
- (void)_removeAnySourceURLForOperation:(id)a3;
- (void)handleSpringLoadOnIconView:(id)a3;
- (void)setDraggingDestinationDelegate:(id)a3;
@end

@implementation SBIconListViewDraggingDataPolicyHandler

- (SBIconListViewDraggingDataPolicyHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBIconListViewDraggingDataPolicyHandler;
  v2 = [(SBIconListViewDraggingDataPolicyHandler *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    sourceURLsByOperationMapTable = v2->_sourceURLsByOperationMapTable;
    v2->_sourceURLsByOperationMapTable = (NSMapTable *)v3;
  }
  return v2;
}

- (unint64_t)dragHitRegionForDropSession:(id)a3 iconListView:(id)a4 point:(CGPoint)a5 icon:(id)a6
{
  return objc_msgSend(a4, "dragHitRegionForPoint:icon:", a6, a5.x, a5.y);
}

- (BOOL)allowsSpringLoadForSession:(id)a3 onIconView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SBIconListViewDraggingDataPolicyHandler *)self draggingDestinationDelegate];
  v9 = [v8 iconListView];
  if ([v9 contentVisibility])
  {
    char v10 = 0;
  }
  else
  {
    v11 = [v8 dragDelegate];
    char v10 = [v11 iconListView:v9 shouldAllowSpringLoadedInteractionForIconDropSession:v6 onIconView:v7];
  }
  return v10;
}

- (void)handleSpringLoadOnIconView:(id)a3
{
  id v3 = a3;
  id v6 = objc_alloc_init(SBHIconLaunchContext);
  [(SBHIconLaunchContext *)v6 setIconView:v3];
  v4 = [v3 icon];
  v5 = [v3 location];

  [v4 launchFromLocation:v5 context:v6];
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  return 0;
}

- (void)_removeAnySourceURLForOperation:(id)a3
{
  id v6 = a3;
  v4 = -[NSMapTable objectForKey:](self->_sourceURLsByOperationMapTable, "objectForKey:");
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v5 removeItemAtURL:v4 error:0];

    [(NSMapTable *)self->_sourceURLsByOperationMapTable removeObjectForKey:v6];
  }
}

- (id)_currentDraggingIconViewInView:(id)a3 forLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v6 = a3;
  objc_opt_class();
  id v7 = SBFSafeCast();

  if (v7)
  {
    v8 = objc_msgSend(v7, "iconAtPoint:index:", 0, x, y);
    if (v8)
    {
      v9 = [v7 iconViewForIcon:v8];
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_bestSupportedUTIForDragItem:(id)a3 supportedTypes:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [a3 itemProvider];
  id v7 = [v6 registeredTypeIdentifiersWithFileOptions:0];
  id v8 = v5;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v9 = v7;
  uint64_t v29 = [v9 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v29)
  {
    uint64_t v10 = *(void *)v41;
    v30 = v9;
    id v31 = v8;
    uint64_t v28 = *(void *)v41;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(v9);
        }
        v12 = *(void **)(*((void *)&v40 + 1) + 8 * v11);
        v13 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:", v12, v28);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v14 = v8;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v45 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v37;
          while (2)
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v37 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = [MEMORY[0x1E4F442D8] typeWithIdentifier:*(void *)(*((void *)&v36 + 1) + 8 * i)];
              if ([v13 conformsToType:v19]
                && ([v6 hasRepresentationConformingToTypeIdentifier:v12 fileOptions:0] & 1) != 0)
              {
                id v26 = v12;

                id v9 = v30;
                id v8 = v31;
                id v20 = v30;
                goto LABEL_28;
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v36 objects:v45 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }

        ++v11;
        id v9 = v30;
        id v8 = v31;
        uint64_t v10 = v28;
      }
      while (v11 != v29);
      uint64_t v29 = [v30 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v29);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v20 = v8;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v33;
    while (2)
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        if ([v6 hasRepresentationConformingToTypeIdentifier:v25 fileOptions:0])
        {
          id v26 = v25;
          goto LABEL_28;
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v44 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }
  id v26 = 0;
LABEL_28:

  return v26;
}

- (SBIconListViewDraggingDestinationDelegate)draggingDestinationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_draggingDestinationDelegate);
  return (SBIconListViewDraggingDestinationDelegate *)WeakRetained;
}

- (void)setDraggingDestinationDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_draggingDestinationDelegate);
  objc_storeStrong((id *)&self->_sourceURLsByOperationMapTable, 0);
}

@end