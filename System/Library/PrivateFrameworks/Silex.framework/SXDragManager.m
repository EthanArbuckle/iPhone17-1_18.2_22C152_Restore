@interface SXDragManager
- (BOOL)dragSession:(id)a3 containsDragItemWithIdentifier:(id)a4;
- (BOOL)enabled;
- (SXDragManager)initWithSharingPolicy:(unint64_t)a3 dataSource:(id)a4;
- (SXDragManagerDataSource)dataSource;
- (UIDragInteraction)dragInteraction;
- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)dragItemForObject:(id)a3 withSession:(id)a4;
- (id)itemsForSession:(id)a3 atLocation:(CGPoint)a4;
- (unint64_t)sharingPolicy;
- (void)dealloc;
- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 willAddItems:(id)a5 forInteraction:(id)a6;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)setDataSource:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)updateAccessibilityDragSourceDescriptorsForDraggableElement:(id)a3;
@end

@implementation SXDragManager

- (SXDragManager)initWithSharingPolicy:(unint64_t)a3 dataSource:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SXDragManager;
  v7 = [(SXDragManager *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_sharingPolicy = a3;
    objc_storeWeak((id *)&v7->_dataSource, v6);
    if (a3 != 1)
    {
      uint64_t v9 = [objc_alloc(MEMORY[0x263F1C5D8]) initWithDelegate:v8];
      dragInteraction = v8->_dragInteraction;
      v8->_dragInteraction = (UIDragInteraction *)v9;

      v11 = [v6 viewForDragManager:v8];
      [v11 addInteraction:v8->_dragInteraction];
    }
  }

  return v8;
}

- (void)dealloc
{
  v3 = [(SXDragManager *)self dragInteraction];
  v4 = [v3 view];
  v5 = [(SXDragManager *)self dragInteraction];
  [v4 removeInteraction:v5];

  v6.receiver = self;
  v6.super_class = (Class)SXDragManager;
  [(SXDragManager *)&v6 dealloc];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([MEMORY[0x263F1C5D8] isEnabledByDefault])
  {
    self->_enabled = v3;
    id v5 = [(SXDragManager *)self dragInteraction];
    [v5 setEnabled:v3];
  }
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6 = a4;
  v7 = [a3 view];
  [v6 locationInView:v7];
  double v9 = v8;
  double v11 = v10;

  v12 = -[SXDragManager itemsForSession:atLocation:](self, "itemsForSession:atLocation:", v6, v9, v11);

  return v12;
}

- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  return -[SXDragManager itemsForSession:atLocation:](self, "itemsForSession:atLocation:", a4, a5.x, a5.y);
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v5 = a4;
  id v6 = [v5 localObject];
  int v7 = [v6 conformsToProtocol:&unk_26D5B3E98];

  if (v7)
  {
    double v8 = [v5 localObject];
    if (v8)
    {
      id v9 = objc_alloc(MEMORY[0x263F1CA78]);
      double v10 = [v8 dragPreviewView];
      double v11 = (void *)[v9 initWithView:v10];
    }
    else
    {
      double v11 = 0;
    }
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (id)itemsForSession:(id)a3 atLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v13[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  double v8 = [(SXDragManager *)self dataSource];
  id v9 = objc_msgSend(v8, "dragManager:dragableAtLocation:", self, x, y);

  double v10 = [(SXDragManager *)self dragItemForObject:v9 withSession:v7];

  if (v10)
  {
    v13[0] = v10;
    double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = objc_msgSend(a4, "items", a3, 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        double v10 = [v9 localObject];
        int v11 = [v10 conformsToProtocol:&unk_26D5B3E98];

        if (v11)
        {
          v12 = [v9 localObject];
          [v12 didStartDragging];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)dragInteraction:(id)a3 session:(id)a4 willAddItems:(id)a5 forInteraction:(id)a6
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = [v11 localObject];
        int v13 = [v12 conformsToProtocol:&unk_26D5B3E98];

        if (v13)
        {
          long long v14 = [v11 localObject];
          [v14 didStartDragging];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = objc_msgSend(a4, "items", a3, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int v11 = [v10 localObject];
        int v12 = [v11 conformsToProtocol:&unk_26D5B3E98];

        if (v12)
        {
          int v13 = [v10 localObject];
          [v13 didEndDragging];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (id)dragItemForObject:(id)a3 withSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 dragIdentifier];
  BOOL v9 = [(SXDragManager *)self dragSession:v7 containsDragItemWithIdentifier:v8];

  double v10 = [v6 dragObject];

  int v11 = 0;
  if (v10 && !v9)
  {
    id v12 = objc_alloc(MEMORY[0x263F088E0]);
    int v13 = [v6 dragObject];
    long long v14 = (void *)[v12 initWithObject:v13];

    int v11 = (void *)[objc_alloc(MEMORY[0x263F1C5E0]) initWithItemProvider:v14];
    [v11 setLocalObject:v6];
  }
  return v11;
}

- (BOOL)dragSession:(id)a3 containsDragItemWithIdentifier:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = objc_msgSend(a3, "items", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v6);
        }
        double v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        int v11 = [v10 localObject];
        int v12 = [v11 conformsToProtocol:&unk_26D5B3E98];

        if (v12)
        {
          int v13 = [v10 localObject];
          long long v14 = v13;
          if (v13)
          {
            long long v15 = [v13 dragIdentifier];
            char v16 = [v15 isEqualToString:v5];

            if (v16)
            {

              LOBYTE(v7) = 1;
              goto LABEL_14;
            }
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v7;
}

- (void)updateAccessibilityDragSourceDescriptorsForDraggableElement:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26D5B3E98])
  {
    id v5 = [v4 stringForAXDragAction];
  }
  else
  {
    id v6 = [MEMORY[0x263F086E0] mainBundle];
    id v5 = [v6 localizedStringForKey:@"Drag Item" value:&stru_26D5311C0 table:0];
  }
  uint64_t v7 = [(SXDragManager *)self dataSource];
  uint64_t v8 = [v7 viewForDragManager:self];

  BOOL v9 = (void *)[objc_alloc(MEMORY[0x263F1C3B8]) initWithName:v5 view:v8];
  v11[0] = v9;
  double v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  [v4 setAccessibilityDragSourceDescriptors:v10];
}

- (SXDragManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (SXDragManagerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (unint64_t)sharingPolicy
{
  return self->_sharingPolicy;
}

- (UIDragInteraction)dragInteraction
{
  return self->_dragInteraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end