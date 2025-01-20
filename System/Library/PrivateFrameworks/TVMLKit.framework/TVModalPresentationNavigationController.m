@interface TVModalPresentationNavigationController
- (NSHashTable)presentedViewControllers;
- (TVModalPresentationConfiguration)configuration;
- (TVModalPresentationNavigationController)initWithConfiguration:(id)a3;
- (UIAlertController)containingAlertController;
- (id)popViewControllerAnimated:(BOOL)a3;
- (id)popViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)_dismissForLastViewController:(BOOL)a3;
- (void)_updateConfiguration;
- (void)didShowViewController:(id)a3 animated:(BOOL)a4;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)pushViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setConfiguration:(id)a3;
- (void)setContainingAlertController:(id)a3;
- (void)updatePreferredFocusedViewStateForFocus:(BOOL)a3;
@end

@implementation TVModalPresentationNavigationController

- (NSHashTable)presentedViewControllers
{
  presentedViewControllers = self->_presentedViewControllers;
  if (!presentedViewControllers)
  {
    v4 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    v5 = self->_presentedViewControllers;
    self->_presentedViewControllers = v4;

    presentedViewControllers = self->_presentedViewControllers;
  }
  return presentedViewControllers;
}

- (TVModalPresentationNavigationController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v6 = (void *)[objc_alloc(MEMORY[0x263F1CB68]) initWithNibName:0 bundle:0];
  v7 = [v6 view];
  v8 = [MEMORY[0x263F1C550] clearColor];
  [v7 setBackgroundColor:v8];

  v18.receiver = self;
  v18.super_class = (Class)TVModalPresentationNavigationController;
  v9 = [(TVModalPresentationNavigationController *)&v18 initWithRootViewController:v6];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rootViewController, v6);
    uint64_t v11 = [MEMORY[0x263F08968] mapTableWithKeyOptions:5 valueOptions:0x10000];
    pushCompletionBlocks = v10->_pushCompletionBlocks;
    v10->_pushCompletionBlocks = (NSMapTable *)v11;

    uint64_t v13 = [MEMORY[0x263F08968] mapTableWithKeyOptions:5 valueOptions:0x10000];
    popCompletionBlocks = v10->_popCompletionBlocks;
    v10->_popCompletionBlocks = (NSMapTable *)v13;

    objc_storeStrong((id *)&v10->_configuration, a3);
    [(TVModalPresentationNavigationController *)v10 _updateConfiguration];
    v15 = [(TVModalPresentationNavigationController *)v10 navigationBar];
    [v15 setPrefersLargeTitles:1];

    v16 = [(TVModalPresentationNavigationController *)v10 navigationBar];
    [v16 _setHidesShadow:1];
  }
  return v10;
}

- (void)setConfiguration:(id)a3
{
  id v5 = (TVModalPresentationConfiguration *)a3;
  p_configuration = &self->_configuration;
  if (self->_configuration != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_configuration, a3);
    p_configuration = (TVModalPresentationConfiguration **)[(TVModalPresentationNavigationController *)self _updateConfiguration];
    id v5 = v7;
  }
  MEMORY[0x270F9A758](p_configuration, v5);
}

- (void)_updateConfiguration
{
  v3 = [(TVModalPresentationNavigationController *)self configuration];
  if ([v3 type] == 1000) {
    goto LABEL_4;
  }
  v4 = [(TVModalPresentationNavigationController *)self configuration];
  if ([v4 type] == 1001)
  {

LABEL_4:
    uint64_t v5 = 0;
LABEL_5:

    goto LABEL_6;
  }
  v6 = [(TVModalPresentationNavigationController *)self configuration];
  uint64_t v7 = [v6 type];

  if (v7 != 1002)
  {
    v3 = [(TVModalPresentationNavigationController *)self configuration];
    uint64_t v5 = [v3 type];
    goto LABEL_5;
  }
  uint64_t v5 = 0;
LABEL_6:
  [(TVModalPresentationNavigationController *)self setModalPresentationStyle:v5];
  id v8 = [(TVModalPresentationNavigationController *)self configuration];
  -[TVModalPresentationNavigationController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", [v8 isNavigationBarHidden], 0);
}

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  v6 = (void *)[(NSArray *)self->_previousViewControllers copy];
  uint64_t v7 = [(TVModalPresentationNavigationController *)self viewControllers];
  if (([v6 containsObject:v5] & 1) == 0
    && ([v7 lastObject], id v8 = (id)objc_claimAutoreleasedReturnValue(), v8, v8 == v5))
  {
    uint64_t v11 = [(NSMapTable *)self->_pushCompletionBlocks objectForKey:v5];
    [(NSMapTable *)self->_pushCompletionBlocks removeObjectForKey:v5];
  }
  else
  {
    popCompletionBlocks = self->_popCompletionBlocks;
    v10 = [v6 lastObject];
    uint64_t v11 = [(NSMapTable *)popCompletionBlocks objectForKey:v10];

    v12 = self->_popCompletionBlocks;
    uint64_t v13 = [v6 lastObject];
    [(NSMapTable *)v12 removeObjectForKey:v13];
  }
  previousViewControllers = self->_previousViewControllers;
  self->_previousViewControllers = 0;

  if (v11)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__TVModalPresentationNavigationController_didShowViewController_animated___block_invoke;
    block[3] = &unk_264BA68A0;
    id v16 = v11;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __74__TVModalPresentationNavigationController_didShowViewController_animated___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v10 = a3;
  if (a5)
  {
    pushCompletionBlocks = self->_pushCompletionBlocks;
    v9 = (void *)MEMORY[0x230FC9DC0](a5);
    [(NSMapTable *)pushCompletionBlocks setObject:v9 forKey:v10];
  }
  [(TVModalPresentationNavigationController *)self pushViewController:v10 animated:v6];
}

- (id)popViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  if (a4)
  {
    popCompletionBlocks = self->_popCompletionBlocks;
    uint64_t v7 = (void *)MEMORY[0x230FC9DC0](a4, a2);
    id v8 = [(TVModalPresentationNavigationController *)self viewControllers];
    v9 = [v8 lastObject];
    [(NSMapTable *)popCompletionBlocks setObject:v7 forKey:v9];
  }
  return [(TVModalPresentationNavigationController *)self popViewControllerAnimated:v4];
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(TVModalPresentationNavigationController *)self viewControllers];
  uint64_t v8 = [v7 count];

  if (v8 == 1)
  {
    v9 = [v6 navigationItem];
    [v9 setHidesBackButton:1];
  }
  id v10 = [(TVModalPresentationNavigationController *)self viewControllers];
  uint64_t v11 = (NSArray *)[v10 copy];
  previousViewControllers = self->_previousViewControllers;
  self->_previousViewControllers = v11;

  v13.receiver = self;
  v13.super_class = (Class)TVModalPresentationNavigationController;
  [(TVModalPresentationNavigationController *)&v13 pushViewController:v6 animated:v4];
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(TVModalPresentationNavigationController *)self viewControllers];
  id v6 = (NSArray *)[v5 copy];
  previousViewControllers = self->_previousViewControllers;
  self->_previousViewControllers = v6;

  uint64_t v8 = [(TVModalPresentationNavigationController *)self viewControllers];
  uint64_t v9 = [v8 count];

  if (v9 == 2)
  {
    [(TVModalPresentationNavigationController *)self _dismissForLastViewController:v3];
    id v10 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)TVModalPresentationNavigationController;
    id v10 = [(TVModalPresentationNavigationController *)&v12 popViewControllerAnimated:v3];
  }
  return v10;
}

- (void)_dismissForLastViewController:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NSArray *)self->_previousViewControllers lastObject];
  id v6 = [(NSMapTable *)self->_popCompletionBlocks objectForKey:v5];
  uint64_t v7 = [(TVModalPresentationNavigationController *)self presentingViewController];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __73__TVModalPresentationNavigationController__dismissForLastViewController___block_invoke;
  v10[3] = &unk_264BA68A0;
  id v11 = v6;
  id v8 = v6;
  [v7 dismissViewControllerAnimated:v3 completion:v10];

  uint64_t v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 postNotificationName:@"TVModalPresentationNavigationControllerDismissedNotification" object:self];
}

uint64_t __73__TVModalPresentationNavigationController__dismissForLastViewController___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)updatePreferredFocusedViewStateForFocus:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(TVModalPresentationNavigationController *)self childViewControllers];
  id v5 = [v4 lastObject];

  if ([v5 conformsToProtocol:&unk_26E5D0B90]) {
    [v5 updatePreferredFocusedViewStateForFocus:v3];
  }
}

- (UIAlertController)containingAlertController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingAlertController);
  return (UIAlertController *)WeakRetained;
}

- (void)setContainingAlertController:(id)a3
{
}

- (TVModalPresentationConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_containingAlertController);
  objc_storeStrong((id *)&self->_popCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_pushCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_previousViewControllers, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_presentedViewControllers, 0);
}

@end