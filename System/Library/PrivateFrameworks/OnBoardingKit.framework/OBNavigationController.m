@interface OBNavigationController
- (unint64_t)supportedInterfaceOrientations;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)setSupportedInterfaceOrientations:(unint64_t)a3;
- (void)setViewControllers:(id)a3;
- (void)viewDidLoad;
@end

@implementation OBNavigationController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)OBNavigationController;
  [(OBNavigationController *)&v4 viewDidLoad];
  v3 = [(OBNavigationController *)self navigationBar];
  [v3 _setHidesShadow:1];
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 navigationItem];
  objc_msgSend(v7, "ob_applyAutomaticScrollToEdgeBehavior");

  v8.receiver = self;
  v8.super_class = (Class)OBNavigationController;
  [(OBNavigationController *)&v8 pushViewController:v6 animated:v4];
}

- (void)setViewControllers:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) navigationItem];
        objc_msgSend(v9, "ob_applyAutomaticScrollToEdgeBehavior");

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  v10.receiver = self;
  v10.super_class = (Class)OBNavigationController;
  [(OBNavigationController *)&v10 setViewControllers:v4];
}

- (unint64_t)supportedInterfaceOrientations
{
  unint64_t result = self->_supportedInterfaceOrientations;
  if (!result)
  {
    id v4 = [(OBNavigationController *)self presentingViewController];

    if (v4)
    {
      uint64_t v5 = [(OBNavigationController *)self presentingViewController];
      unint64_t v6 = [v5 supportedInterfaceOrientations];

      return v6;
    }
    else
    {
      v7.receiver = self;
      v7.super_class = (Class)OBNavigationController;
      return [(OBNavigationController *)&v7 supportedInterfaceOrientations];
    }
  }
  return result;
}

- (void)setSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_supportedInterfaceOrientations = a3;
}

@end