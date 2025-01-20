@interface PUWelcomeViewControllersManager
+ (PUWelcomeViewControllersManager)defaultManager;
- (Class)_presentedWelcomeViewControllerClass;
- (NSArray)_welcomeViewControllerClasses;
- (NSMutableSet)_remainingWelcomeViewControllerClassesToPresent;
- (PUWelcomeViewControllersManager)init;
- (UIViewController)_presentingViewController;
- (id)_initWithWelcomeViewControllerClasses:(id)a3;
- (id)completionHandler;
- (void)_handleWelcomeViewControllerCompletion;
- (void)_reset;
- (void)_setPresentedWelcomeViewControllerClass:(Class)a3;
- (void)_setPresentingViewController:(id)a3;
- (void)_update;
- (void)presentWelcomeViewControllersIfNecessaryFromViewController:(id)a3 completion:(id)a4;
- (void)resetAllLastPresentationInfos;
- (void)setCompletionHandler:(id)a3;
@end

@implementation PUWelcomeViewControllersManager

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->__presentingViewController, 0);
  objc_storeStrong((id *)&self->__remainingWelcomeViewControllerClassesToPresent, 0);
  objc_storeStrong((id *)&self->__welcomeViewControllerClasses, 0);
}

- (void)_setPresentedWelcomeViewControllerClass:(Class)a3
{
  self->__presentedWelcomeViewControllerClass = a3;
}

- (Class)_presentedWelcomeViewControllerClass
{
  return self->__presentedWelcomeViewControllerClass;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)_setPresentingViewController:(id)a3
{
}

- (UIViewController)_presentingViewController
{
  return self->__presentingViewController;
}

- (NSMutableSet)_remainingWelcomeViewControllerClassesToPresent
{
  return self->__remainingWelcomeViewControllerClassesToPresent;
}

- (NSArray)_welcomeViewControllerClasses
{
  return self->__welcomeViewControllerClasses;
}

- (void)_handleWelcomeViewControllerCompletion
{
  v3 = [(PUWelcomeViewControllersManager *)self _presentedWelcomeViewControllerClass];
  v4 = [(PUWelcomeViewControllersManager *)self _remainingWelcomeViewControllerClassesToPresent];
  [v4 removeObject:v3];

  [(PUWelcomeViewControllersManager *)self _setPresentedWelcomeViewControllerClass:0];
  [(PUWelcomeViewControllersManager *)self _update];
}

- (void)_update
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(PUWelcomeViewControllersManager *)self _presentingViewController];
  if (v3
    && ![(PUWelcomeViewControllersManager *)self _presentedWelcomeViewControllerClass])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v4 = [(PUWelcomeViewControllersManager *)self _welcomeViewControllerClasses];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v18;
LABEL_6:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
        v9 = [(PUWelcomeViewControllersManager *)self _remainingWelcomeViewControllerClassesToPresent];
        char v10 = [v9 containsObject:v8];

        if (v10) {
          break;
        }
        if (v5 == ++v7)
        {
          uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v5) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }

      if (!v8) {
        goto LABEL_15;
      }
      objc_initWeak(&location, self);
      [(PUWelcomeViewControllersManager *)self _setPresentedWelcomeViewControllerClass:v8];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __42__PUWelcomeViewControllersManager__update__block_invoke_2;
      v14[3] = &unk_1E5F2E558;
      objc_copyWeak(&v15, &location);
      [v8 presentIfNecessaryFromViewController:v3 presentationHandler:&__block_literal_global_7 completionHandler:v14];
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    else
    {
LABEL_12:

LABEL_15:
      v11 = [(PUWelcomeViewControllersManager *)self completionHandler];
      BOOL v12 = v11 == 0;

      if (!v12)
      {
        v13 = [(PUWelcomeViewControllersManager *)self completionHandler];
        v13[2]();

        [(PUWelcomeViewControllersManager *)self setCompletionHandler:0];
      }
    }
  }
}

void __42__PUWelcomeViewControllersManager__update__block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PUWelcomeViewControllersManager__update__block_invoke_3;
  block[3] = &unk_1E5F2E530;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __42__PUWelcomeViewControllersManager__update__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1C9C8] now];
  PXPreferencesSetWelcomeViewLastPresentationDate();
}

void __42__PUWelcomeViewControllersManager__update__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleWelcomeViewControllerCompletion];
}

- (void)_reset
{
  id v4 = [(PUWelcomeViewControllersManager *)self _remainingWelcomeViewControllerClassesToPresent];
  v3 = [(PUWelcomeViewControllersManager *)self _welcomeViewControllerClasses];
  [v4 addObjectsFromArray:v3];
}

- (void)resetAllLastPresentationInfos
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(PUWelcomeViewControllersManager *)self _welcomeViewControllerClasses];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v6++) resetLastPresentationInfo];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  uint64_t v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v7 synchronize];
}

- (void)presentWelcomeViewControllersIfNecessaryFromViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  [(PUWelcomeViewControllersManager *)self setCompletionHandler:a4];
  [(PUWelcomeViewControllersManager *)self _setPresentingViewController:v6];

  [(PUWelcomeViewControllersManager *)self _reset];
  [(PUWelcomeViewControllersManager *)self _update];
}

- (id)_initWithWelcomeViewControllerClasses:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUWelcomeViewControllersManager;
  uint64_t v5 = [(PUWelcomeViewControllersManager *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    welcomeViewControllerClasses = v5->__welcomeViewControllerClasses;
    v5->__welcomeViewControllerClasses = (NSArray *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    remainingWelcomeViewControllerClassesToPresent = v5->__remainingWelcomeViewControllerClassesToPresent;
    v5->__remainingWelcomeViewControllerClassesToPresent = (NSMutableSet *)v8;
  }
  return v5;
}

- (PUWelcomeViewControllersManager)init
{
  return (PUWelcomeViewControllersManager *)[(PUWelcomeViewControllersManager *)self _initWithWelcomeViewControllerClasses:0];
}

+ (PUWelcomeViewControllersManager)defaultManager
{
  if (defaultManager_onceToken_101404 != -1) {
    dispatch_once(&defaultManager_onceToken_101404, &__block_literal_global_101405);
  }
  id v2 = (void *)defaultManager_defaultManager_101406;
  return (PUWelcomeViewControllersManager *)v2;
}

void __49__PUWelcomeViewControllersManager_defaultManager__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  id v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  id v1 = [[PUWelcomeViewControllersManager alloc] _initWithWelcomeViewControllerClasses:v0];
  id v2 = (void *)defaultManager_defaultManager_101406;
  defaultManager_defaultManager_101406 = (uint64_t)v1;
}

@end