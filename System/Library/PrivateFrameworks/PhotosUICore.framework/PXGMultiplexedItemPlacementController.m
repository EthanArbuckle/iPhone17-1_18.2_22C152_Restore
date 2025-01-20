@interface PXGMultiplexedItemPlacementController
+ (id)itemPlacementControllerForItemPlacementControllers:(id)a3;
- (BOOL)isIndirectItemPlacementController;
- (NSArray)itemPlacementControllers;
- (PXGItemPlacementController)mainItemPlacementController;
- (PXGMultiplexedItemPlacementController)init;
- (PXGMultiplexedItemPlacementController)initWithItemPlacementControllers:(id)a3;
- (id)placementInContext:(id)a3 forItemReference:(id)a4;
- (void)setPlacementOverride:(id)a3 forItemReference:(id)a4;
@end

@implementation PXGMultiplexedItemPlacementController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainItemPlacementController, 0);
  objc_storeStrong((id *)&self->_itemPlacementControllers, 0);
}

- (PXGItemPlacementController)mainItemPlacementController
{
  return self->_mainItemPlacementController;
}

- (NSArray)itemPlacementControllers
{
  return self->_itemPlacementControllers;
}

- (BOOL)isIndirectItemPlacementController
{
  return self->_isIndirectItemPlacementController;
}

- (void)setPlacementOverride:(id)a3 forItemReference:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = [(PXGMultiplexedItemPlacementController *)self itemPlacementControllers];
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
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) setPlacementOverride:v6 forItemReference:v7];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (id)placementInContext:(id)a3 forItemReference:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PXGMultiplexedItemPlacementController *)self mainItemPlacementController];
  uint64_t v9 = [v8 placementInContext:v7 forItemReference:v6];

  return v9;
}

- (PXGMultiplexedItemPlacementController)initWithItemPlacementControllers:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PXGMultiplexedItemPlacementController;
  v5 = [(PXGMultiplexedItemPlacementController *)&v21 init];
  if (v5)
  {
    id v16 = v4;
    uint64_t v6 = [v4 copy];
    itemPlacementControllers = v5->_itemPlacementControllers;
    v5->_itemPlacementControllers = (NSArray *)v6;

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v8 = v5->_itemPlacementControllers;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      p_mainItemPlacementController = (id *)&v5->_mainItemPlacementController;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) == 0
            || ([v14 isIndirectItemPlacementController] & 1) == 0)
          {
            if (*p_mainItemPlacementController) {
              PXAssertGetLog();
            }
            objc_storeStrong(p_mainItemPlacementController, v14);
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v10);
    }

    id v4 = v16;
    v5->_isIndirectItemPlacementController = v5->_mainItemPlacementController != 0;
  }

  return v5;
}

- (PXGMultiplexedItemPlacementController)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGItemPlacementController.m", 80, @"%s is not available as initializer", "-[PXGMultiplexedItemPlacementController init]");

  abort();
}

+ (id)itemPlacementControllerForItemPlacementControllers:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] < 2)
  {
    id v4 = [v3 firstObject];
  }
  else
  {
    id v4 = [[PXGMultiplexedItemPlacementController alloc] initWithItemPlacementControllers:v3];
  }
  v5 = v4;

  return v5;
}

@end