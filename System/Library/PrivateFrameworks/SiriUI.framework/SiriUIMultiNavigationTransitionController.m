@interface SiriUIMultiNavigationTransitionController
- (NSArray)additionalCoordinationControllers;
- (NSMutableArray)_mutableAdditionalCoordinationControllers;
- (SiriUIMultiNavigationTransitionController)initWithPrimaryTransitionController:(id)a3;
- (SiriUINavigationTransitioning)primaryTransitionController;
- (UINavigationController)_navigationController;
- (UIViewControllerAnimatedTransitioning)animationController;
- (id)interactionControllerForAnimationController:(id)a3;
- (int64_t)operation;
- (void)_setNavigationController:(id)a3;
- (void)addAdditionalCoordinationController:(id)a3;
- (void)configureWithNavigationController:(id)a3;
- (void)coordinateAdditionalTransitionsWithTransitionCoordinator:(id)a3;
- (void)setMutableAdditionalCoordinationControllers:(id)a3;
- (void)setOperation:(int64_t)a3;
@end

@implementation SiriUIMultiNavigationTransitionController

- (SiriUIMultiNavigationTransitionController)initWithPrimaryTransitionController:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SiriUIMultiNavigationTransitionController;
  v6 = [(SiriUIMultiNavigationTransitionController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_primaryTransitionController, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mutableAdditionalCoordinationControllers = v7->_mutableAdditionalCoordinationControllers;
    v7->_mutableAdditionalCoordinationControllers = v8;
  }
  return v7;
}

- (NSArray)additionalCoordinationControllers
{
  v2 = [(SiriUIMultiNavigationTransitionController *)self _mutableAdditionalCoordinationControllers];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)addAdditionalCoordinationController:(id)a3
{
  id v6 = a3;
  -[NSMutableArray addObject:](self->_mutableAdditionalCoordinationControllers, "addObject:");
  v4 = [(SiriUIMultiNavigationTransitionController *)self _navigationController];
  if (v4) {
    [v6 configureWithNavigationController:v4];
  }
  int64_t v5 = [(SiriUIMultiNavigationTransitionController *)self operation];
  if (objc_opt_respondsToSelector()) {
    [v6 setOperation:v5];
  }
}

- (void)setOperation:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->_operation != a3)
  {
    self->_operation = a3;
    int64_t v5 = [(SiriUIMultiNavigationTransitionController *)self primaryTransitionController];
    if (objc_opt_respondsToSelector()) {
      [v5 setOperation:a3];
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = [(SiriUIMultiNavigationTransitionController *)self additionalCoordinationControllers];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_super v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            [v11 setOperation:a3];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)configureWithNavigationController:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = [(SiriUIMultiNavigationTransitionController *)self primaryTransitionController];
  if (objc_opt_respondsToSelector()) {
    [v5 configureWithNavigationController:v4];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(SiriUIMultiNavigationTransitionController *)self additionalCoordinationControllers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 configureWithNavigationController:v4];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(SiriUIMultiNavigationTransitionController *)self _setNavigationController:v4];
}

- (UIViewControllerAnimatedTransitioning)animationController
{
  v2 = [(SiriUIMultiNavigationTransitionController *)self primaryTransitionController];
  if (objc_opt_respondsToSelector())
  {
    v3 = [v2 animationController];
  }
  else
  {
    v3 = 0;
  }

  return (UIViewControllerAnimatedTransitioning *)v3;
}

- (id)interactionControllerForAnimationController:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SiriUIMultiNavigationTransitionController *)self primaryTransitionController];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v5 interactionControllerForAnimationController:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)coordinateAdditionalTransitionsWithTransitionCoordinator:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = [(SiriUIMultiNavigationTransitionController *)self primaryTransitionController];
  if (objc_opt_respondsToSelector()) {
    [v5 coordinateAdditionalTransitionsWithTransitionCoordinator:v4];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(SiriUIMultiNavigationTransitionController *)self additionalCoordinationControllers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 coordinateAdditionalTransitionsWithTransitionCoordinator:v4];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (int64_t)operation
{
  return self->_operation;
}

- (SiriUINavigationTransitioning)primaryTransitionController
{
  return self->_primaryTransitionController;
}

- (NSMutableArray)_mutableAdditionalCoordinationControllers
{
  return self->_mutableAdditionalCoordinationControllers;
}

- (void)setMutableAdditionalCoordinationControllers:(id)a3
{
}

- (UINavigationController)_navigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
  return (UINavigationController *)WeakRetained;
}

- (void)_setNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationController);
  objc_storeStrong((id *)&self->_mutableAdditionalCoordinationControllers, 0);
  objc_storeStrong((id *)&self->_primaryTransitionController, 0);
}

@end