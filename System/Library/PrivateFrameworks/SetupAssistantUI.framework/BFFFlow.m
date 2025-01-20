@interface BFFFlow
+ (id)allowedFlowItems;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6;
- (BFFFlowDelegate)delegate;
- (BFFFlowItem)firstController;
- (BFFFlowItemDelegate)flowItemDelegate;
- (BFFFlowStarter)starter;
- (BFFNavigationController)navigationController;
- (BFFNavigationFlowDelegate)navigationFlowDelegate;
- (BOOL)controllerNeedsToRunForClass:(Class)a3;
- (BOOL)isFlowItemOnTop:(id)a3;
- (BOOL)responsibleForViewController:(id)a3;
- (NSArray)classList;
- (NSMutableArray)controllers;
- (id)_viewControllerForBuddyController:(id)a3;
- (id)controllerFollowingControllerClass:(Class)a3 requestedNext:(Class)a4;
- (id)createConditionalFlowItemForClass:(Class)a3;
- (id)createFlowItem:(Class)a3;
- (id)firstItem;
- (id)injector;
- (id)popToBuddyControllerWithClass:(Class)a3 animated:(BOOL)a4;
- (id)popToBuddyControllerWithClass:(Class)a3 withOffset:(unint64_t)a4 animated:(BOOL)a5;
- (id)precedingItems;
- (id)precedingItemsClasses;
- (id)viewControllers;
- (void)configureFlowItem:(id)a3;
- (void)dealloc;
- (void)flowItemCancelled:(id)a3;
- (void)flowItemDone:(id)a3;
- (void)flowItemDone:(id)a3 nextItem:(id)a4;
- (void)flowItemDone:(id)a3 nextItemClass:(Class)a4;
- (void)markFlowItemDone:(id)a3;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)presentWiFiPaneForFlow:(id)a3;
- (void)pushFlowItem:(id)a3 animated:(BOOL)a4;
- (void)pushFlowItem:(id)a3 inFlow:(id)a4 animated:(BOOL)a5;
- (void)pushFlowItem:(id)a3 inFlow:(id)a4 withExtendedInitialization:(BOOL)a5 animated:(BOOL)a6;
- (void)pushFlowItem:(id)a3 inFlow:(id)a4 withExtendedInitialization:(BOOL)a5 animated:(BOOL)a6 willPushFlowItem:(id)a7;
- (void)removeViewControllersOnNextPush:(id)a3;
- (void)setClassList:(id)a3;
- (void)setControllers:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFirstController:(id)a3;
- (void)setFlowItemDelegate:(id)a3;
- (void)startFlowAnimated:(BOOL)a3;
- (void)startFlowWithAllFlowItems;
@end

@implementation BFFFlow

- (BFFFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)BFFFlow;
  v14 = [(BFFFlow *)&v22 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_navigationController, v10);
    objc_storeWeak((id *)&v15->_navigationFlowDelegate, v11);
    objc_storeWeak((id *)&v15->_starter, v12);
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    controllers = v15->_controllers;
    v15->_controllers = v16;

    uint64_t v18 = [v13 copy];
    id injector = v15->_injector;
    v15->_id injector = (id)v18;

    id WeakRetained = objc_loadWeakRetained((id *)&v15->_navigationController);
    [WeakRetained addDelegateObserver:v15];
  }
  return v15;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
  [WeakRetained removeDelegateObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BFFFlow;
  [(BFFFlow *)&v4 dealloc];
}

- (void)startFlowAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  v5 = [(BFFFlow *)self precedingItems];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [(BFFFlow *)self pushFlowItem:*(void *)(*((void *)&v11 + 1) + 8 * v9++) inFlow:self withExtendedInitialization:0 animated:0];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  id v10 = [(BFFFlow *)self firstItem];
  [(BFFFlow *)self pushFlowItem:v10 inFlow:self animated:v3];
}

- (void)startFlowWithAllFlowItems
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  controllers = self->_controllers;
  objc_super v4 = [(BFFFlow *)self precedingItems];
  [(NSMutableArray *)controllers addObjectsFromArray:v4];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(BFFFlow *)self classList];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        long long v11 = [(BFFFlow *)self precedingItemsClasses];
        char v12 = [v11 containsObject:v10];

        if ((v12 & 1) == 0)
        {
          long long v13 = [(BFFFlow *)self createConditionalFlowItemForClass:v10];
          if (v13)
          {
            long long v14 = [(BFFFlow *)self firstController];

            if (!v14) {
              [(BFFFlow *)self setFirstController:v13];
            }
            [(NSMutableArray *)self->_controllers addObject:v13];
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (id)precedingItems
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  BOOL v3 = [(BFFFlow *)self precedingItemsClasses];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v19;
    *(void *)&long long v7 = 138412546;
    long long v17 = v7;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * v10);
        char v12 = [(BFFFlow *)self starter];
        char v13 = [v12 controllerNeedsToRunForClass:v11];

        if ((v13 & 1) == 0)
        {
          long long v14 = _BYLoggingFacility();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v17;
            uint64_t v23 = v11;
            __int16 v24 = 2112;
            v25 = self;
            _os_log_fault_impl(&dword_21FF9E000, v14, OS_LOG_TYPE_FAULT, "Preceding flow item \"%@\" for flow %@ does not need to run. This is invalid.", buf, 0x16u);
          }
        }
        long long v15 = [(BFFFlow *)self createFlowItem:v11];
        [v4 addObject:v15];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v8);
  }

  return v4;
}

- (id)precedingItemsClasses
{
  return 0;
}

- (id)firstItem
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  BOOL v3 = [(BFFFlow *)self firstController];
  uint64_t v4 = [v3 navigationController];
  if (!v4)
  {

    goto LABEL_5;
  }
  id v5 = (void *)v4;
  uint64_t v6 = [(BFFFlow *)self firstController];
  long long v7 = [v6 navigationController];
  uint64_t v8 = [v7 viewControllers];
  uint64_t v9 = [(BFFFlow *)self firstController];
  char v10 = [v8 containsObject:v9];

  if ((v10 & 1) == 0) {
LABEL_5:
  }
    [(BFFFlow *)self setFirstController:0];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v11 = [(BFFFlow *)self classList];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        long long v17 = [(BFFFlow *)self precedingItemsClasses];
        char v18 = [v17 containsObject:v16];

        if ((v18 & 1) == 0)
        {
          uint64_t v19 = [(BFFFlow *)self createConditionalFlowItemForClass:v16];
          if (v19)
          {
            long long v20 = (void *)v19;
            [(BFFFlow *)self setFirstController:v19];

            goto LABEL_17;
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  long long v21 = [(BFFFlow *)self firstController];
  return v21;
}

- (id)controllerFollowingControllerClass:(Class)a3 requestedNext:(Class)a4
{
  if (!a4
    || ([(BFFFlow *)self starter],
        long long v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 controllerNeedsToRunForClass:a4],
        v7,
        !v8)
    || ([(BFFFlow *)self createConditionalFlowItemForClass:a4],
        (uint64_t v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    char v10 = [(BFFFlow *)self classList];
    unint64_t v11 = [v10 indexOfObject:a3];

    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      while (1)
      {
        ++v11;
        uint64_t v13 = [(BFFFlow *)self classList];
        unint64_t v14 = [v13 count];

        if (v11 >= v14) {
          break;
        }
        long long v15 = [(BFFFlow *)self classList];
        uint64_t v16 = [v15 objectAtIndexedSubscript:v11];

        uint64_t v9 = [(BFFFlow *)self createConditionalFlowItemForClass:v16];
        if (v9) {
          goto LABEL_6;
        }
      }
    }
    uint64_t v9 = 0;
  }
LABEL_6:
  return v9;
}

- (id)createConditionalFlowItemForClass:(Class)a3
{
  id v5 = [(BFFFlow *)self starter];
  int v6 = [v5 controllerNeedsToRunForClass:a3];

  if (v6)
  {
    long long v7 = [(BFFFlow *)self createFlowItem:a3];
    int v8 = [(BFFFlow *)self starter];
    char v9 = [v8 controllerNeedsToRunForFlowItem:v7];

    if (v9) {
      goto LABEL_7;
    }
    if (objc_opt_respondsToSelector()) {
      [v7 controllerWillNotRun];
    }
  }
  long long v7 = 0;
LABEL_7:
  return v7;
}

- (id)createFlowItem:(Class)a3
{
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    id v5 = [a3 alloc];
    int v6 = [(BFFFlow *)self navigationController];
    long long v7 = [(BFFFlow *)self navigationFlowDelegate];
    int v8 = [(BFFFlow *)self starter];
    char v9 = [(BFFFlow *)self injector];
    id v10 = (id)[v5 initWithNavigationController:v6 flowDelegate:v7 flowStarter:v8 dependencyInjector:v9];
  }
  else
  {
    id v10 = objc_alloc_init(a3);
  }
  [(BFFFlow *)self configureFlowItem:v10];
  return v10;
}

- (void)configureFlowItem:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [(BFFFlow *)self injector];
  id v5 = (id)((uint64_t (**)(void, id))v4)[2](v4, v11);

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_5;
  }
  int v6 = [(BFFFlow *)self precedingItemsClasses];
  int v7 = [v6 containsObject:objc_opt_class()];

  int v8 = [(BFFFlow *)self classList];
  char v9 = [v8 containsObject:objc_opt_class()];

  if (!v7 || (v9 & 1) != 0)
  {
LABEL_5:
    [v11 setDelegate:self];
  }
  else
  {
    id v10 = [(BFFFlow *)self flowItemDelegate];
    [v11 setDelegate:v10];
  }
}

- (id)viewControllers
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BFFFlow *)self controllers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = [(BFFFlow *)self _viewControllerForBuddyController:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (id)allowedFlowItems
{
  return (id)[MEMORY[0x263EFF8C0] array];
}

- (id)_viewControllerForBuddyController:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 viewController];
LABEL_5:
    uint64_t v5 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    goto LABEL_5;
  }
  uint64_t v5 = 0;
LABEL_7:

  return v5;
}

- (void)presentWiFiPaneForFlow:(id)a3
{
  id v4 = [(BFFFlow *)self delegate];
  [v4 presentWiFiPaneForFlow:self];
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = objc_msgSend((id)objc_opt_class(), "allowedFlowItems", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= [*(id *)(*((void *)&v9 + 1) + 8 * i) applicableDispositions];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)responsibleForViewController:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v5 = [(BFFFlow *)self controllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && ([v10 responsibleForViewController:v4] & 1) != 0)
        {
          char v11 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  unint64_t v5 = [(BFFFlow *)self viewControllers];
  char v11 = [v5 containsObject:v4];
LABEL_12:

  return v11;
}

- (void)flowItemDone:(id)a3 nextItem:(id)a4
{
  uint64_t v8 = (BFFFlow *)a3;
  id v6 = a4;
  if (self != v8) {
    [(BFFFlow *)self markFlowItemDone:v8];
  }
  if (v6)
  {
    [(BFFFlow *)self configureFlowItem:v6];
    [(BFFFlow *)self pushFlowItem:v6 inFlow:self animated:1];
  }
  else
  {
    uint64_t v7 = [(BFFFlow *)self delegate];
    [v7 flow:self finishedWithLastItem:v8 nextItem:0];
  }
}

- (void)flowItemDone:(id)a3 nextItemClass:(Class)a4
{
  id v6 = a3;
  id v7 = [(BFFFlow *)self controllerFollowingControllerClass:objc_opt_class() requestedNext:a4];
  [(BFFFlow *)self flowItemDone:v6 nextItem:v7];
}

- (void)flowItemDone:(id)a3
{
}

- (void)flowItemCancelled:(id)a3
{
  id v4 = a3;
  id v5 = [(BFFFlow *)self flowItemDelegate];
  [v5 flowItemCancelled:v4];
}

- (BOOL)controllerNeedsToRunForClass:(Class)a3
{
  id v4 = [(BFFFlow *)self navigationFlowDelegate];
  LOBYTE(a3) = [v4 controllerNeedsToRunForClass:a3];

  return (char)a3;
}

- (void)markFlowItemDone:(id)a3
{
  id v4 = a3;
  id v5 = [(BFFFlow *)self navigationFlowDelegate];
  [v5 markFlowItemDone:v4];
}

- (BOOL)isFlowItemOnTop:(id)a3
{
  id v4 = a3;
  id v5 = [(BFFFlow *)self navigationFlowDelegate];
  char v6 = [v5 isFlowItemOnTop:v4];

  return v6;
}

- (id)popToBuddyControllerWithClass:(Class)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  char v6 = [(BFFFlow *)self navigationFlowDelegate];
  id v7 = [v6 popToBuddyControllerWithClass:a3 animated:v4];

  return v7;
}

- (id)popToBuddyControllerWithClass:(Class)a3 withOffset:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = [(BFFFlow *)self navigationFlowDelegate];
  long long v9 = [v8 popToBuddyControllerWithClass:a3 withOffset:a4 animated:v5];

  return v9;
}

- (void)pushFlowItem:(id)a3 animated:(BOOL)a4
{
}

- (void)pushFlowItem:(id)a3 inFlow:(id)a4 animated:(BOOL)a5
{
}

- (void)pushFlowItem:(id)a3 inFlow:(id)a4 withExtendedInitialization:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  long long v12 = [(BFFFlow *)self navigationFlowDelegate];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __67__BFFFlow_pushFlowItem_inFlow_withExtendedInitialization_animated___block_invoke;
  v14[3] = &unk_26454AF98;
  id v15 = v10;
  long long v16 = self;
  id v13 = v10;
  [v12 pushFlowItem:v13 inFlow:v11 withExtendedInitialization:v7 animated:v6 willPushFlowItem:v14];
}

uint64_t __67__BFFFlow_pushFlowItem_inFlow_withExtendedInitialization_animated___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    if (*(void *)(result + 32)) {
      return objc_msgSend(*(id *)(*(void *)(result + 40) + 56), "addObject:");
    }
  }
  return result;
}

- (void)pushFlowItem:(id)a3 inFlow:(id)a4 withExtendedInitialization:(BOOL)a5 animated:(BOOL)a6 willPushFlowItem:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a7;
  id v14 = a4;
  id v15 = [(BFFFlow *)self navigationFlowDelegate];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __84__BFFFlow_pushFlowItem_inFlow_withExtendedInitialization_animated_willPushFlowItem___block_invoke;
  v18[3] = &unk_26454B030;
  id v19 = v12;
  long long v20 = self;
  id v21 = v13;
  id v16 = v13;
  id v17 = v12;
  [v15 pushFlowItem:v17 inFlow:v14 withExtendedInitialization:v9 animated:v8 willPushFlowItem:v18];
}

uint64_t __84__BFFFlow_pushFlowItem_inFlow_withExtendedInitialization_animated_willPushFlowItem___block_invoke(void *a1, int a2)
{
  if (a2 && a1[4]) {
    objc_msgSend(*(id *)(a1[5] + 56), "addObject:");
  }
  uint64_t result = a1[6];
  if (result)
  {
    BOOL v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)removeViewControllersOnNextPush:(id)a3
{
  id v4 = a3;
  id v5 = [(BFFFlow *)self navigationFlowDelegate];
  [v5 removeViewControllersOnNextPush:v4];
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v15 = a4;
  BOOL v6 = [(BFFFlow *)self controllers];
  uint64_t v7 = [v6 count];
  uint64_t v8 = v7 - 1;

  if (((v7 - 1) & 0x8000000000000000) == 0)
  {
    uint64_t v9 = 0;
    while (1)
    {
      id v10 = [(BFFFlow *)self controllers];
      id v11 = [v10 objectAtIndexedSubscript:v9];

      id v12 = [(BFFFlow *)self _viewControllerForBuddyController:v11];

      if (v12 == v15) {
        break;
      }
      if (v7 == ++v9) {
        goto LABEL_11;
      }
    }
    if (v9 != 0x7FFFFFFFFFFFFFFFLL && v8 > v9)
    {
      do
      {
        id v13 = [(BFFFlow *)self controllers];
        id v14 = [v13 lastObject];

        if (objc_opt_respondsToSelector()) {
          [v14 controllerWasPopped];
        }
        [(NSMutableArray *)self->_controllers removeLastObject];

        --v8;
      }
      while (v8 > v9);
    }
  }
LABEL_11:
}

- (BFFNavigationController)navigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
  return (BFFNavigationController *)WeakRetained;
}

- (BFFNavigationFlowDelegate)navigationFlowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationFlowDelegate);
  return (BFFNavigationFlowDelegate *)WeakRetained;
}

- (BFFFlowItemDelegate)flowItemDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setFlowItemDelegate:(id)a3
{
}

- (BFFFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BFFFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BFFFlowStarter)starter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_starter);
  return (BFFFlowStarter *)WeakRetained;
}

- (NSArray)classList
{
  return self->_classList;
}

- (void)setClassList:(id)a3
{
}

- (NSMutableArray)controllers
{
  return self->_controllers;
}

- (void)setControllers:(id)a3
{
}

- (id)injector
{
  return self->_injector;
}

- (BFFFlowItem)firstController
{
  return self->_firstController;
}

- (void)setFirstController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstController, 0);
  objc_storeStrong(&self->_injector, 0);
  objc_storeStrong((id *)&self->_controllers, 0);
  objc_storeStrong((id *)&self->_classList, 0);
  objc_destroyWeak((id *)&self->_starter);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_flowItemDelegate);
  objc_destroyWeak((id *)&self->_navigationFlowDelegate);
  objc_destroyWeak((id *)&self->_navigationController);
}

@end