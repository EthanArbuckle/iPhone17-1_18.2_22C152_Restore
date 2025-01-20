@interface _VUITVAppNavigationController
- (BOOL)externalDelegateImplementsAnimationController;
- (BOOL)externalDelegateImplementsDidShow;
- (NSHashTable)observers;
- (UINavigationControllerDelegate)externalDelegate;
- (UIViewController)currentViewController;
- (_VUITVAppNavigationController)initWithRootViewController:(id)a3;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (id)popToRootViewControllerAnimated:(BOOL)a3;
- (id)popToViewController:(id)a3 animated:(BOOL)a4;
- (id)popViewControllerAnimated:(BOOL)a3;
- (id)vui_rootViewController;
- (unint64_t)maxNavControllerStackDepth;
- (unint64_t)oldControllerCountBeforeTransition;
- (void)_handleMaxStackDepth;
- (void)_notifyObserversOfViewControllerChange:(unint64_t)a3 animated:(BOOL)a4;
- (void)dismissAllModals:(id)a3;
- (void)loadView;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setExternalDelegate:(id)a3;
- (void)setExternalDelegateImplementsAnimationController:(BOOL)a3;
- (void)setExternalDelegateImplementsDidShow:(BOOL)a3;
- (void)setMaxNavControllerStackDepth:(unint64_t)a3;
- (void)setObservers:(id)a3;
- (void)setOldControllerCountBeforeTransition:(unint64_t)a3;
- (void)setTitle:(id)a3;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)vui_addControllerObserver:(id)a3;
- (void)vui_removeControllerObserver:(id)a3;
- (void)vui_setViewControllers:(id)a3 animated:(BOOL)a4;
@end

@implementation _VUITVAppNavigationController

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)_VUITVAppNavigationController;
  [(_VUITVAppNavigationController *)&v4 loadView];
  v3 = [(_VUITVAppNavigationController *)self navigationBar];
  [v3 _setHidesShadow:1];
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(_VUITVAppNavigationController *)self viewControllers];
  self->_oldControllerCountBeforeTransition = [v7 count];

  v8.receiver = self;
  v8.super_class = (Class)_VUITVAppNavigationController;
  [(_VUITVAppNavigationController *)&v8 setViewControllers:v6 animated:v4];
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(_VUITVAppNavigationController *)self _handleMaxStackDepth];
  v7 = [(_VUITVAppNavigationController *)self viewControllers];
  self->_oldControllerCountBeforeTransition = [v7 count];

  v8.receiver = self;
  v8.super_class = (Class)_VUITVAppNavigationController;
  [(_VUITVAppNavigationController *)&v8 pushViewController:v6 animated:v4];
}

- (void)_handleMaxStackDepth
{
  id v9 = [(_VUITVAppNavigationController *)self viewControllers];
  unint64_t v3 = [v9 count];
  BOOL v4 = v9;
  if (v9 && v3 >= 4 && v3 >= self->_maxNavControllerStackDepth)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v6 = [v9 firstObject];
    v7 = objc_msgSend(v5, "initWithObjects:", v6, 0);

    objc_super v8 = objc_msgSend(v9, "subarrayWithRange:", 2, v3 - 2);
    [v7 addObjectsFromArray:v8];

    [(_VUITVAppNavigationController *)self setViewControllers:v7];
    BOOL v4 = v9;
  }
}

- (void)setMaxNavControllerStackDepth:(unint64_t)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a3 < 3)
  {
    BOOL v4 = VUIDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 134217984;
      unint64_t v6 = a3;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_INFO, "_VUITVAppNavigationController:: New max navigation controller stack depth is ignored as the value %lu is less than the minimum stack depth.", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    self->_maxNavControllerStackDepth = a3;
  }
}

- (_VUITVAppNavigationController)initWithRootViewController:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_VUITVAppNavigationController;
  unint64_t v3 = [(_VUITVAppNavigationController *)&v9 initWithRootViewController:a3];
  BOOL v4 = v3;
  if (v3)
  {
    v8.receiver = v3;
    v8.super_class = (Class)_VUITVAppNavigationController;
    [(_VUITVAppNavigationController *)&v8 setDelegate:v3];
    v4->_oldControllerCountBeforeTransition = 1;
    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v4->_observers;
    v4->_observers = (NSHashTable *)v5;

    v4->_maxNavControllerStackDepth = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v4;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_VUITVAppNavigationController *)self title];
  if (v5)
  {
  }
  else
  {
    id v6 = [(_VUITVAppNavigationController *)self title];

    if (v6 != v4)
    {
      v7.receiver = self;
      v7.super_class = (Class)_VUITVAppNavigationController;
      [(_VUITVAppNavigationController *)&v7 setTitle:v4];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_VUITVAppNavigationController;
  [(_VUITVAppNavigationController *)&v6 viewWillAppear:a3];
  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 2) {
    [(_VUITVAppNavigationController *)self setNavigationBarHidden:1];
  }
}

- (void)setDelegate:(id)a3
{
  id v4 = (_VUITVAppNavigationController *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    objc_storeWeak((id *)&v4->_externalDelegate, 0);
  }
  else
  {
    objc_storeWeak((id *)&self->_externalDelegate, v4);
    if (v5)
    {
      self->_externalDelegateImplementsDidShow = objc_opt_respondsToSelector() & 1;
      self->_externalDelegateImplementsAnimationController = objc_opt_respondsToSelector() & 1;
    }
    objc_super v6 = VUIDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[_VUITVAppNavigationController setDelegate:](v6);
    }
  }
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(_VUITVAppNavigationController *)self viewControllers];
  self->_oldControllerCountBeforeTransition = [v5 count];

  v8.receiver = self;
  v8.super_class = (Class)_VUITVAppNavigationController;
  objc_super v6 = [(_VUITVAppNavigationController *)&v8 popViewControllerAnimated:v3];
  return v6;
}

- (id)popToViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = [(_VUITVAppNavigationController *)self viewControllers];
  self->_oldControllerCountBeforeTransition = [v7 count];

  v10.receiver = self;
  v10.super_class = (Class)_VUITVAppNavigationController;
  objc_super v8 = [(_VUITVAppNavigationController *)&v10 popToViewController:v6 animated:v4];

  return v8;
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(_VUITVAppNavigationController *)self viewControllers];
  self->_oldControllerCountBeforeTransition = [v5 count];

  v8.receiver = self;
  v8.super_class = (Class)_VUITVAppNavigationController;
  id v6 = [(_VUITVAppNavigationController *)&v8 popToRootViewControllerAnimated:v3];
  return v6;
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v13 = a3;
  id v8 = a4;
  objc_super v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:@"VUITVAppNavigationDidDisplayViewControllerNotification" object:v13];

  [(_VUITVAppNavigationController *)self _notifyObserversOfViewControllerChange:self->_oldControllerCountBeforeTransition animated:v5];
  objc_super v10 = [(_VUITVAppNavigationController *)self viewControllers];
  self->_oldControllerCountBeforeTransition = [v10 count];

  v11 = [(_VUITVAppNavigationController *)self externalDelegate];
  v12 = v11;
  if (v11 && self->_externalDelegateImplementsDidShow) {
    [v11 navigationController:v13 didShowViewController:v8 animated:v5];
  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  objc_super v7 = (void *)MEMORY[0x1E4F28EB8];
  id v8 = a3;
  objc_super v9 = [v7 defaultCenter];
  [v9 postNotificationName:@"VUITVAppNavigationWillDisplayViewControllerNotification" object:v8];

  [(_VUITVAppNavigationController *)self _notifyObserversOfViewControllerChange:self->_oldControllerCountBeforeTransition animated:v5];
  id v10 = [(_VUITVAppNavigationController *)self viewControllers];
  self->_oldControllerCountBeforeTransition = [v10 count];
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(_VUITVAppNavigationController *)self externalDelegate];
  v14 = v13;
  if (v13 && self->_externalDelegateImplementsAnimationController)
  {
    uint64_t v15 = [v13 navigationController:v10 animationControllerForOperation:a4 fromViewController:v11 toViewController:v12];
LABEL_4:
    v16 = (void *)v15;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = [v11 selectedViewController];
    v16 = [v17 customAnimatorForNavigationControllerOperation:a4 toViewController:v12];
  }
  else
  {
    v16 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = [v12 selectedViewController];
    uint64_t v19 = [v18 customAnimatorForNavigationControllerOperation:a4 fromViewController:v11];

    v16 = (void *)v19;
  }
  if (!v16)
  {
    v16 = [v11 customAnimatorForNavigationControllerOperation:a4 toViewController:v12];
    if (!v16)
    {
      uint64_t v15 = [v12 customAnimatorForNavigationControllerOperation:a4 fromViewController:v11];
      goto LABEL_4;
    }
  }
LABEL_12:

  return v16;
}

- (UIViewController)currentViewController
{
  BOOL v3 = [(_VUITVAppNavigationController *)self presentedViewController];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(_VUITVAppNavigationController *)self viewControllers];
    id v5 = [v6 lastObject];
  }
  return (UIViewController *)v5;
}

- (void)dismissAllModals:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  id v5 = [(_VUITVAppNavigationController *)self vuiPresentedViewController];

  if (v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50___VUITVAppNavigationController_dismissAllModals___block_invoke;
    v6[3] = &unk_1E6DF3DD0;
    objc_super v7 = v4;
    [(_VUITVAppNavigationController *)self dismissViewControllerAnimated:0 completion:v6];
  }
  else
  {
    v4[2](v4);
  }
}

- (void)vui_setViewControllers:(id)a3 animated:(BOOL)a4
{
  if (a3) {
    [(_VUITVAppNavigationController *)self setViewControllers:a3 animated:a4];
  }
}

- (id)vui_rootViewController
{
  v2 = [(_VUITVAppNavigationController *)self viewControllers];
  BOOL v3 = [v2 firstObject];

  return v3;
}

- (void)vui_addControllerObserver:(id)a3
{
  if (a3) {
    -[NSHashTable addObject:](self->_observers, "addObject:");
  }
}

- (void)vui_removeControllerObserver:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
  }
}

- (void)_notifyObserversOfViewControllerChange:(unint64_t)a3 animated:(BOOL)a4
{
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81___VUITVAppNavigationController__notifyObserversOfViewControllerChange_animated___block_invoke;
  v10[3] = &unk_1E6DF8BE0;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  BOOL v12 = a4;
  id v6 = (void (**)(void *, uint64_t, uint64_t, uint64_t))_Block_copy(v10);
  v6[2](v6, v7, v8, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (unint64_t)maxNavControllerStackDepth
{
  return self->_maxNavControllerStackDepth;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (unint64_t)oldControllerCountBeforeTransition
{
  return self->_oldControllerCountBeforeTransition;
}

- (void)setOldControllerCountBeforeTransition:(unint64_t)a3
{
  self->_oldControllerCountBeforeTransition = a3;
}

- (UINavigationControllerDelegate)externalDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_externalDelegate);
  return (UINavigationControllerDelegate *)WeakRetained;
}

- (void)setExternalDelegate:(id)a3
{
}

- (BOOL)externalDelegateImplementsDidShow
{
  return self->_externalDelegateImplementsDidShow;
}

- (void)setExternalDelegateImplementsDidShow:(BOOL)a3
{
  self->_externalDelegateImplementsDidShow = a3;
}

- (BOOL)externalDelegateImplementsAnimationController
{
  return self->_externalDelegateImplementsAnimationController;
}

- (void)setExternalDelegateImplementsAnimationController:(BOOL)a3
{
  self->_externalDelegateImplementsAnimationController = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_externalDelegate);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)setDelegate:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "Warning: Changing TVNavigationController's UINavigationControllerDelegate is not recommended because it is itself the delegate in order to implement its UIViewController (NavigationAdditions)", v1, 2u);
}

@end