@interface _TVAppNavigationController
- (BOOL)_hasBeenCleared;
- (BOOL)_shouldIgnoreModalDismissal:(id)a3;
- (BOOL)_shouldOverrideModalBehaviorForPlaybackDocument:(id)a3 andExistingPlaybackDocument:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (IKAppTabBar)appTabBar;
- (NSObject)modalPresenterObserverToken;
- (TVApplicationController)appController;
- (UITapGestureRecognizer)menuRecognizer;
- (UIViewController)currentViewController;
- (UIViewController)presentedModalViewController;
- (_TVAppNavigationController)initWithApplicationController:(id)a3;
- (_TVAppNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TVAppNavigationController)initWithRootViewController:(id)a3;
- (_TVAppNavigationControllerDelegate)appNavigationControllerDelegate;
- (id)activeDocument;
- (id)documents;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (id)popToRootDocument:(BOOL)a3;
- (id)popToRootViewControllerAnimated:(BOOL)a3;
- (unint64_t)maxNavControllerStackDepth;
- (void)_doWillLoadAppDocumentWithController:(id)a3;
- (void)_handleMenuAction:(id)a3;
- (void)_presentModalDocumentController:(id)a3 options:(id)a4;
- (void)clear;
- (void)dealloc;
- (void)dismissAllModals:(id)a3;
- (void)dismissModal;
- (void)dismissModal:(BOOL)a3;
- (void)dismissed;
- (void)insertDocument:(id)a3 beforeDocument:(id)a4 options:(id)a5;
- (void)loadView;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)popDocument;
- (void)popToDocument:(id)a3;
- (void)popToRootDocument;
- (void)presentModal:(id)a3 options:(id)a4;
- (void)pushDocument:(id)a3 options:(id)a4;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)removeDocument:(id)a3;
- (void)replaceDocument:(id)a3 withDocument:(id)a4 options:(id)a5;
- (void)setAppNavigationControllerDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDocuments:(id)a3 options:(id)a4;
- (void)setMaxNavControllerStackDepth:(unint64_t)a3;
- (void)setMenuRecognizer:(id)a3;
- (void)setModalPresenterObserverToken:(id)a3;
- (void)setPresentedModalViewController:(id)a3;
- (void)setTitle:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation _TVAppNavigationController

- (_TVAppNavigationController)initWithRootViewController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_TVAppNavigationController;
  v3 = [(_TVAppNavigationController *)&v7 initWithRootViewController:a3];
  v4 = v3;
  if (v3)
  {
    v6.receiver = v3;
    v6.super_class = (Class)_TVAppNavigationController;
    [(_TVAppNavigationController *)&v6 setDelegate:v3];
    v4->_maxNavControllerStackDepth = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v4;
}

- (_TVAppNavigationController)initWithApplicationController:(id)a3
{
  id v4 = a3;
  v5 = [(_TVAppNavigationController *)self initWithNibName:0 bundle:0];
  objc_super v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_appController, v4);
    v6->_maxNavControllerStackDepth = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (_TVAppNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_TVAppNavigationController;
  id v4 = [(_TVAppNavigationController *)&v8 initWithNibName:0 bundle:0];
  v5 = v4;
  if (v4)
  {
    v7.receiver = v4;
    v7.super_class = (Class)_TVAppNavigationController;
    [(_TVAppNavigationController *)&v7 setDelegate:v4];
    v5->_maxNavControllerStackDepth = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

- (void)setMaxNavControllerStackDepth:(unint64_t)a3
{
  if (a3 < 3)
  {
    v3 = TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG)) {
      -[_TVAppNavigationController setMaxNavControllerStackDepth:](v3);
    }
  }
  else
  {
    self->_maxNavControllerStackDepth = a3;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVAppNavigationController;
  [(_TVAppNavigationController *)&v6 viewWillAppear:a3];
  id v4 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 2) {
    [(_TVAppNavigationController *)self setNavigationBarHidden:1];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_TVAppNavigationController;
  [(_TVAppNavigationController *)&v5 viewWillDisappear:a3];
  if ((*(unsigned char *)&self->_ancDelegateFlags & 0x10) != 0)
  {
    id v4 = [(_TVAppNavigationController *)self appNavigationControllerDelegate];
    [v4 appNavigationControllerWillDisappear:self];
  }
}

- (void)setDelegate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVAppNavigationController;
  [(_TVAppNavigationController *)&v4 setDelegate:a3];
  v3 = TVMLKitLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_ERROR)) {
    -[_TVAppNavigationController setDelegate:](v3);
  }
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_TVAppNavigationController *)self title];
  if (v5)
  {
  }
  else
  {
    id v6 = [(_TVAppNavigationController *)self title];

    if (v6 != v4)
    {
      v7.receiver = self;
      v7.super_class = (Class)_TVAppNavigationController;
      [(_TVAppNavigationController *)&v7 setTitle:v4];
    }
  }
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  v10 = [v8 customAnimatorForNavigationControllerOperation:a4 toViewController:v9];
  if (!v10)
  {
    v10 = [v9 customAnimatorForNavigationControllerOperation:a4 fromViewController:v8];
  }

  return v10;
}

- (void)setAppNavigationControllerDelegate:(id)a3
{
  p_appNavigationControllerDelegate = &self->_appNavigationControllerDelegate;
  id v15 = a3;
  id v5 = objc_storeWeak((id *)p_appNavigationControllerDelegate, v15);
  char v6 = objc_opt_respondsToSelector();

  *(unsigned char *)&self->_ancDelegateFlags = *(unsigned char *)&self->_ancDelegateFlags & 0xFE | v6 & 1;
  id WeakRetained = objc_loadWeakRetained((id *)p_appNavigationControllerDelegate);
  if (objc_opt_respondsToSelector()) {
    char v8 = 2;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)&self->_ancDelegateFlags = *(unsigned char *)&self->_ancDelegateFlags & 0xFD | v8;

  id v9 = objc_loadWeakRetained((id *)p_appNavigationControllerDelegate);
  if (objc_opt_respondsToSelector()) {
    char v10 = 4;
  }
  else {
    char v10 = 0;
  }
  *(unsigned char *)&self->_ancDelegateFlags = *(unsigned char *)&self->_ancDelegateFlags & 0xFB | v10;

  id v11 = objc_loadWeakRetained((id *)p_appNavigationControllerDelegate);
  if (objc_opt_respondsToSelector()) {
    char v12 = 8;
  }
  else {
    char v12 = 0;
  }
  *(unsigned char *)&self->_ancDelegateFlags = *(unsigned char *)&self->_ancDelegateFlags & 0xF7 | v12;

  id v13 = objc_loadWeakRetained((id *)p_appNavigationControllerDelegate);
  if (objc_opt_respondsToSelector()) {
    char v14 = 16;
  }
  else {
    char v14 = 0;
  }
  *(unsigned char *)&self->_ancDelegateFlags = *(unsigned char *)&self->_ancDelegateFlags & 0xEF | v14;
}

- (void)_handleMenuAction:(id)a3
{
  id v4 = [(_TVAppNavigationController *)self presentingViewController];

  if (!v4)
  {
    [(_TVAppNavigationController *)self popDocument];
  }
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)_TVAppNavigationController;
  [(_TVAppNavigationController *)&v7 loadView];
  v3 = [(_TVAppNavigationController *)self view];
  id v4 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel__handleMenuAction_];
  menuRecognizer = self->_menuRecognizer;
  self->_menuRecognizer = v4;

  [(UITapGestureRecognizer *)self->_menuRecognizer setAllowedPressTypes:&unk_26E59EC20];
  [(UITapGestureRecognizer *)self->_menuRecognizer setDelegate:self];
  [v3 addGestureRecognizer:self->_menuRecognizer];
  char v6 = [(_TVAppNavigationController *)self navigationBar];
  [v6 _setHidesShadow:1];
}

- (void)dealloc
{
  v3 = [(_TVAppNavigationController *)self modalPresenterObserverToken];

  if (v3)
  {
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    id v5 = [(_TVAppNavigationController *)self modalPresenterObserverToken];
    [v4 removeObserver:v5];
  }
  v6.receiver = self;
  v6.super_class = (Class)_TVAppNavigationController;
  [(_TVAppNavigationController *)&v6 dealloc];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (self->_menuRecognizer != a3) {
    return 1;
  }
  id v5 = [(_TVAppNavigationController *)self documents];
  if ((unint64_t)[v5 count] > 1)
  {
    BOOL v3 = 1;
  }
  else
  {
    objc_super v6 = [(_TVAppNavigationController *)self viewControllers];
    BOOL v3 = (unint64_t)[v6 count] > 1;
  }
  return v3;
}

- (UIViewController)currentViewController
{
  BOOL v3 = [(_TVAppNavigationController *)self presentedModalViewController];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    objc_super v6 = [(_TVAppNavigationController *)self viewControllers];
    id v5 = [v6 lastObject];
  }
  return (UIViewController *)v5;
}

- (IKAppTabBar)appTabBar
{
  return 0;
}

- (void)clear
{
  v5[1] = *MEMORY[0x263EF8340];
  BOOL v3 = objc_opt_new();
  v5[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  [(_TVAppNavigationController *)self setViewControllers:v4 animated:1];
}

- (void)setDocuments:(id)a3 options:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_super v7 = [a4 objectForKey:@"animated"];
  char v8 = v7;
  if (v7) {
    uint64_t v9 = [v7 BOOLValue];
  }
  else {
    uint64_t v9 = 1;
  }
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v17 = [_TVAppDocumentRequestController alloc];
        v18 = -[_TVAppDocumentRequestController initWithAppDocument:](v17, "initWithAppDocument:", v16, (void)v19);
        [(_TVAppNavigationController *)self _doWillLoadAppDocumentWithController:v18];
        [v10 addObject:v18];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  [(_TVAppNavigationController *)self setViewControllers:v10 animated:v9];
}

- (id)documents
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = [(_TVAppNavigationController *)self viewControllers];
  BOOL v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
        {
          id v10 = objc_msgSend(v9, "appDocument", (void)v15);

          if (v10)
          {
            id v11 = [v9 appDocument];
            [v3 addObject:v11];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v6);
  }

  uint64_t v12 = TVMLKitLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v20 = v3;
    _os_log_impl(&dword_230B4C000, v12, OS_LOG_TYPE_DEFAULT, "Nav controller returning app documents: %@", buf, 0xCu);
  }
  uint64_t v13 = objc_msgSend(v3, "copy", (void)v15);

  return v13;
}

- (void)insertDocument:(id)a3 beforeDocument:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(_TVAppNavigationController *)self viewControllers];
  uint64_t v12 = (void *)[v11 copy];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __68___TVAppNavigationController_insertDocument_beforeDocument_options___block_invoke;
  v16[3] = &unk_264BA6CD8;
  id v17 = v9;
  long long v18 = self;
  id v19 = v8;
  id v20 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v9;
  [v12 enumerateObjectsUsingBlock:v16];
}

- (void)pushDocument:(id)a3 options:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = TVMLKitLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412546;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_230B4C000, v8, OS_LOG_TYPE_DEFAULT, "Nav controller pushing app document: %@, options: %@", (uint8_t *)&v18, 0x16u);
  }
  id v9 = [[_TVAppDocumentRequestController alloc] initWithAppDocument:v6];
  [(_TVAppDocumentController *)v9 setPresentedModal:0];
  id v10 = [v7 objectForKey:*MEMORY[0x263F4B308]];
  uint64_t v11 = [v10 BOOLValue];

  [(_TVAppDocumentController *)v9 setAdoptsContext:v11];
  [(_TVAppNavigationController *)self _doWillLoadAppDocumentWithController:v9];
  uint64_t v12 = +[TVStorePlaybackLaunchShroud sharedShroud];
  unsigned int v13 = [v12 isHidden];

  id v14 = [(_TVAppNavigationController *)self viewControllers];
  if ([v14 count])
  {
    id v15 = [v7 objectForKey:@"hidesBottomBarWhenPushed"];
    uint64_t v16 = [v15 BOOLValue];
  }
  else
  {
    uint64_t v16 = 0;
  }

  [(_TVAppDocumentRequestController *)v9 setHidesBottomBarWhenPushed:v16];
  id v17 = [(_TVAppNavigationController *)self viewControllers];
  -[_TVAppNavigationController pushViewController:animated:](self, "pushViewController:animated:", v9, ([v17 count] | v13) != 0);
}

- (void)presentModal:(id)a3 options:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(_TVAppNavigationController *)self presentedModalViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v7 appDocument];
  }
  else
  {
    id v8 = 0;
  }
  if (![(_TVAppNavigationController *)self _shouldOverrideModalBehaviorForPlaybackDocument:v12 andExistingPlaybackDocument:v8])
  {
    id v9 = [[_TVAppDocumentRequestController alloc] initWithAppDocument:v12];
    id v10 = [v6 objectForKey:*MEMORY[0x263F4B308]];
    uint64_t v11 = [v10 BOOLValue];

    [(_TVAppDocumentController *)v9 setAdoptsContext:v11];
    [(_TVAppNavigationController *)self _presentModalDocumentController:v9 options:v6];
  }
}

- (void)_presentModalDocumentController:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v36 = a4;
  objc_initWeak(location, self);
  [v6 setPresentedModal:1];
  id v7 = [(_TVAppNavigationController *)self modalPresenterObserverToken];

  if (!v7)
  {
    id v8 = [MEMORY[0x263F08A00] defaultCenter];
    id v9 = [MEMORY[0x263F08A48] mainQueue];
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __70___TVAppNavigationController__presentModalDocumentController_options___block_invoke;
    v46[3] = &unk_264BA7548;
    objc_copyWeak(&v47, location);
    id v10 = [v8 addObserverForName:@"TVModalPresenterDismissedNotification" object:0 queue:v9 usingBlock:v46];

    [(_TVAppNavigationController *)self setModalPresenterObserverToken:v10];
    objc_destroyWeak(&v47);
  }
  uint64_t v11 = [(_TVAppNavigationController *)self presentedModalViewController];
  id v12 = [[TVModalPresenterConfiguration alloc] initWithDictionary:v36];
  [(_TVAppNavigationController *)self _doWillLoadAppDocumentWithController:v6];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __70___TVAppNavigationController__presentModalDocumentController_options___block_invoke_2;
  v41[3] = &unk_264BA9228;
  v41[4] = self;
  objc_copyWeak(&v45, location);
  v32 = v12;
  v42 = v32;
  id v33 = v11;
  id v43 = v33;
  id v34 = v6;
  id v44 = v34;
  v35 = (void (**)(void))MEMORY[0x230FC9DC0](v41);
  unsigned int v13 = [(_TVAppNavigationController *)self presentedViewController];
  if (v13)
  {
    id v12 = [(_TVAppNavigationController *)self presentedViewController];
    id v14 = +[_TVModalPresenter presenter];
    id v15 = [v14 modalRootViewController];
    char v16 = [(TVModalPresenterConfiguration *)v12 isEqual:v15];

    if ((v16 & 1) == 0)
    {
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __70___TVAppNavigationController__presentModalDocumentController_options___block_invoke_2_60;
      v39[3] = &unk_264BA68A0;
      v40 = v35;
      [(_TVAppNavigationController *)self dismissViewControllerAnimated:1 completion:v39];
      id v19 = (id *)&v40;
LABEL_19:

      goto LABEL_20;
    }
  }
  v31 = +[_TVModalPresenter presenter];
  id v17 = [v31 modalRootViewController];
  int v18 = [v17 presentingViewController];
  if (v18)
  {
    v30 = [(_TVAppNavigationController *)self presentedViewController];
    v29 = +[_TVModalPresenter presenter];
    id v12 = [v29 modalRootViewController];
    if (![v30 isEqual:v12])
    {

LABEL_18:
      v27 = +[_TVModalPresenter presenter];
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __70___TVAppNavigationController__presentModalDocumentController_options___block_invoke_3_61;
      v37[3] = &unk_264BA68A0;
      v38 = v35;
      [v27 hideAllAnimated:0 withCompletion:v37];
      id v19 = (id *)&v38;

      goto LABEL_19;
    }
  }
  __int16 v20 = +[_TVModalPresenter presenter];
  id v21 = [v20 modalRootViewController];
  uint64_t v22 = [v21 viewControllers];
  if ((unint64_t)[v22 count] < 2)
  {
    BOOL v26 = 0;
  }
  else
  {
    v23 = +[_TVModalPresenter presenter];
    uint64_t v24 = [v23 modalRootViewController];
    id v25 = [v24 visibleViewController];
    BOOL v26 = v25 != v33 && [(TVModalPresenterConfiguration *)v32 navigationBarHidden];
  }
  if (v18)
  {
  }
  if (v26) {
    goto LABEL_18;
  }
  v28 = [v34 parentViewController];

  if (!v28) {
    v35[2]();
  }
LABEL_20:

  objc_destroyWeak(&v45);
  objc_destroyWeak(location);
}

- (void)dismissed
{
  BOOL v3 = [(_TVAppNavigationController *)self presentedModalViewController];
  BOOL v4 = [(_TVAppNavigationController *)self _shouldIgnoreModalDismissal:v3];

  if (!v4)
  {
    [(_TVAppNavigationController *)self setPresentedModalViewController:0];
  }
}

- (void)dismissModal
{
}

- (void)dismissModal:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(_TVAppNavigationController *)self presentedModalViewController];
  BOOL v6 = [(_TVAppNavigationController *)self _shouldIgnoreModalDismissal:v5];

  if (!v6)
  {
    id v7 = [(_TVAppNavigationController *)self presentedModalViewController];

    if (v7)
    {
      id v8 = +[_TVModalPresenter presenter];
      id v9 = [(_TVAppNavigationController *)self presentedModalViewController];
      [v8 hideController:v9 animated:v3 withCompletion:0];

      [(_TVAppNavigationController *)self setPresentedModalViewController:0];
    }
  }
}

- (void)dismissAllModals:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  uint64_t v5 = [(_TVAppNavigationController *)self presentedViewController];
  if (!v5) {
    goto LABEL_3;
  }
  BOOL v6 = (void *)v5;
  id v7 = [(_TVAppNavigationController *)self presentedViewController];
  id v8 = +[_TVModalPresenter presenter];
  id v9 = [v8 modalRootViewController];
  char v10 = [v7 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    char v16 = [(_TVAppNavigationController *)self presentedViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      int v18 = [(_TVAppNavigationController *)self presentedViewController];
      id v19 = (id)[v18 popToRootViewControllerAnimated:0];
    }
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __47___TVAppNavigationController_dismissAllModals___block_invoke;
    v27[3] = &unk_264BA68A0;
    v28 = v4;
    [(_TVAppNavigationController *)self dismissViewControllerAnimated:0 completion:v27];
    id v15 = v28;
  }
  else
  {
LABEL_3:
    uint64_t v11 = +[_TVModalPresenter presenter];
    id v12 = [v11 modalRootViewController];
    unsigned int v13 = [v12 presentingViewController];

    if (v13)
    {
      id v14 = +[_TVModalPresenter presenter];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __47___TVAppNavigationController_dismissAllModals___block_invoke_2;
      v25[3] = &unk_264BA68A0;
      BOOL v26 = v4;
      [v14 hideAllAnimated:0 withCompletion:v25];

      id v15 = v26;
    }
    else
    {
      __int16 v20 = [(_TVAppNavigationController *)self presentedModalViewController];

      if (!v20)
      {
        v4[2](v4);
        goto LABEL_11;
      }
      id v21 = +[_TVModalPresenter presenter];
      uint64_t v22 = [(_TVAppNavigationController *)self presentedModalViewController];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __47___TVAppNavigationController_dismissAllModals___block_invoke_3;
      v23[3] = &unk_264BA68A0;
      uint64_t v24 = v4;
      [v21 hideController:v22 animated:0 withCompletion:v23];

      [(_TVAppNavigationController *)self setPresentedModalViewController:0];
      id v15 = v24;
    }
  }

LABEL_11:
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(_TVAppNavigationController *)self _hasBeenCleared])
  {
    v15[0] = v6;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    [(_TVAppNavigationController *)self setViewControllers:v7 animated:v4];
  }
  else
  {
    id v7 = [(_TVAppNavigationController *)self viewControllers];
    unint64_t v8 = [v7 count];
    if (v7)
    {
      unint64_t v9 = v8;
      if (v8 >= 4 && v8 >= self->_maxNavControllerStackDepth)
      {
        id v10 = objc_alloc(MEMORY[0x263EFF980]);
        uint64_t v11 = [v7 firstObject];
        id v12 = objc_msgSend(v10, "initWithObjects:", v11, 0);

        unsigned int v13 = objc_msgSend(v7, "subarrayWithRange:", 2, v9 - 2);
        [v12 addObjectsFromArray:v13];

        [(_TVAppNavigationController *)self setViewControllers:v12];
      }
    }
    v14.receiver = self;
    v14.super_class = (Class)_TVAppNavigationController;
    [(_TVAppNavigationController *)&v14 pushViewController:v6 animated:v4];
  }
}

- (void)popDocument
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  memset(v19, 0, sizeof(v19));
  BOOL v3 = [(_TVAppNavigationController *)self viewControllers];
  BOOL v4 = (void *)[v3 copy];
  uint64_t v5 = [v4 reverseObjectEnumerator];

  if ([v5 countByEnumeratingWithState:v19 objects:v22 count:16])
  {
    id v6 = (void *)**((void **)&v19[0] + 1);
    if (objc_opt_respondsToSelector())
    {
      id v7 = (void *)TVMLKitLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v8 = v7;
        unint64_t v9 = [v6 appDocument];
        *(_DWORD *)buf = 138412290;
        id v21 = v9;
        _os_log_impl(&dword_230B4C000, v8, OS_LOG_TYPE_DEFAULT, "Nav controller popping top app document: %@", buf, 0xCu);
      }
    }
    id v10 = [(_TVAppNavigationController *)self viewControllers];
    if ([v10 count] == 1
      && ([(_TVAppNavigationController *)self presentingViewController],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v11))
    {
      id v12 = [(_TVAppNavigationController *)self presentingViewController];
      [v12 dismissViewControllerAnimated:1 completion:0];
    }
    else
    {
      unsigned int v13 = [v10 lastObject];

      if (v13 == v6)
      {
        id v17 = (id)[(_TVAppNavigationController *)self popViewControllerAnimated:1];
      }
      else
      {
        objc_super v14 = [v10 firstObject];

        if (v14 == v6)
        {
          id v18 = [(_TVAppNavigationController *)self popToRootViewControllerAnimated:1];
        }
        else
        {
          id v15 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v10, "indexOfObjectIdenticalTo:", v6) - 1);
          id v16 = (id)[(_TVAppNavigationController *)self popToViewController:v15 animated:1];
        }
      }
    }
  }
}

- (void)popToDocument:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = TVMLKitLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v4;
    _os_log_impl(&dword_230B4C000, v5, OS_LOG_TYPE_DEFAULT, "Nav controller popping to app document: %@", buf, 0xCu);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(_TVAppNavigationController *)self viewControllers];
  id v7 = (void *)[v6 copy];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v13 = [v12 appDocument];
          int v14 = [v13 isEqual:v4];

          if (v14)
          {
            id v15 = (id)[(_TVAppNavigationController *)self popToViewController:v12 animated:1];
            goto LABEL_14;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

- (id)popToRootDocument:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v5 = TVMLKitLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230B4C000, v5, OS_LOG_TYPE_DEFAULT, "Nav controller popping to root app document.", buf, 2u);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(_TVAppNavigationController *)self viewControllers];
  id v7 = (void *)[v6 copy];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v13 = [v12 appDocument];

          if (v13)
          {
            int v14 = [(_TVAppNavigationController *)self popToViewController:v12 animated:v3];
            goto LABEL_14;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  int v14 = 0;
LABEL_14:

  return v14;
}

- (void)popToRootDocument
{
  id v2 = [(_TVAppNavigationController *)self popToRootDocument:1];
}

- (void)removeDocument:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(_TVAppNavigationController *)self viewControllers];
  id v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = [v11 appDocument];
          int v13 = [v12 isEqual:v4];

          if (v13)
          {
            int v14 = [(_TVAppNavigationController *)self viewControllers];
            id v15 = (void *)[v14 mutableCopy];

            [v15 removeObject:v11];
            [(_TVAppNavigationController *)self setViewControllers:v15 animated:1];

            goto LABEL_12;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (void)replaceDocument:(id)a3 withDocument:(id)a4 options:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = TVMLKitLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl(&dword_230B4C000, v11, OS_LOG_TYPE_DEFAULT, "Nav controller replacing document %@ with document %@.", buf, 0x16u);
  }
  char v12 = objc_msgSend(v8, "tv_isPresentedModal");
  int v13 = [(_TVAppNavigationController *)self viewControllers];
  int v14 = (void *)[v13 copy];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __67___TVAppNavigationController_replaceDocument_withDocument_options___block_invoke;
  v18[3] = &unk_264BA9250;
  id v19 = v8;
  id v20 = v9;
  char v23 = v12;
  id v21 = v10;
  uint64_t v22 = self;
  id v15 = v10;
  id v16 = v9;
  id v17 = v8;
  [v14 enumerateObjectsUsingBlock:v18];
}

- (id)activeDocument
{
  id v2 = [(_TVAppNavigationController *)self currentViewController];
  if ([v2 conformsToProtocol:&unk_26E5EA8C0])
  {
    uint64_t v3 = [v2 currentViewController];

    id v2 = (void *)v3;
  }
  if ([v2 conformsToProtocol:&unk_26E5D0C80]) {
    id v4 = v2;
  }
  else {
    id v4 = 0;
  }
  uint64_t v5 = [v4 activeDocument];

  return v5;
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(_TVAppNavigationController *)self viewControllers];
  id v6 = [v5 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [(_TVAppNavigationController *)self popToRootDocument:v3];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_TVAppNavigationController;
    uint64_t v7 = [(_TVAppNavigationController *)&v10 popToRootViewControllerAnimated:v3];
  }
  id v8 = (void *)v7;

  return v8;
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  uint64_t v5 = (void *)MEMORY[0x263F08A00];
  id v6 = a3;
  id v7 = [v5 defaultCenter];
  [v7 postNotificationName:@"TVAppNavigationDidDisplayViewControllerNotification" object:v6];
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  uint64_t v5 = (void *)MEMORY[0x263F08A00];
  id v6 = a3;
  id v7 = [v5 defaultCenter];
  [v7 postNotificationName:@"TVAppNavigationWillDisplayViewControllerNotification" object:v6];
}

- (BOOL)_hasBeenCleared
{
  id v2 = [(_TVAppNavigationController *)self topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_doWillLoadAppDocumentWithController:(id)a3
{
  if ((*(unsigned char *)&self->_ancDelegateFlags & 8) != 0)
  {
    id v4 = a3;
    id v5 = [(_TVAppNavigationController *)self appNavigationControllerDelegate];
    [v5 appNavigationController:self willLoadAppDocumentWithController:v4];
  }
}

- (BOOL)_shouldIgnoreModalDismissal:(id)a3
{
  if ((*(unsigned char *)&self->_ancDelegateFlags & 2) == 0) {
    return 0;
  }
  id v4 = self;
  id v5 = a3;
  id v6 = [(_TVAppNavigationController *)v4 appNavigationControllerDelegate];
  LOBYTE(v4) = [v6 appNavigationController:v4 shouldIgnoreDismissalForViewController:v5];

  return (char)v4;
}

- (BOOL)_shouldOverrideModalBehaviorForPlaybackDocument:(id)a3 andExistingPlaybackDocument:(id)a4
{
  if ((*(unsigned char *)&self->_ancDelegateFlags & 1) == 0) {
    return 0;
  }
  id v6 = self;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(_TVAppNavigationController *)v6 appNavigationControllerDelegate];
  LOBYTE(v6) = [v9 appNavigationController:v6 shouldOverrideModalBehaviorForDocument:v8 andExistingDocument:v7];

  return (char)v6;
}

- (TVApplicationController)appController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appController);
  return (TVApplicationController *)WeakRetained;
}

- (_TVAppNavigationControllerDelegate)appNavigationControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appNavigationControllerDelegate);
  return (_TVAppNavigationControllerDelegate *)WeakRetained;
}

- (unint64_t)maxNavControllerStackDepth
{
  return self->_maxNavControllerStackDepth;
}

- (UITapGestureRecognizer)menuRecognizer
{
  return self->_menuRecognizer;
}

- (void)setMenuRecognizer:(id)a3
{
}

- (UIViewController)presentedModalViewController
{
  return self->_presentedModalViewController;
}

- (void)setPresentedModalViewController:(id)a3
{
}

- (NSObject)modalPresenterObserverToken
{
  return self->_modalPresenterObserverToken;
}

- (void)setModalPresenterObserverToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modalPresenterObserverToken, 0);
  objc_storeStrong((id *)&self->_presentedModalViewController, 0);
  objc_storeStrong((id *)&self->_menuRecognizer, 0);
  objc_destroyWeak((id *)&self->_appNavigationControllerDelegate);
  objc_destroyWeak((id *)&self->_appController);
}

- (void)setMaxNavControllerStackDepth:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_230B4C000, log, OS_LOG_TYPE_DEBUG, "New max navigation controller stack depth is ignored as the value is less than the minimum stack depth.", v1, 2u);
}

- (void)setDelegate:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_230B4C000, log, OS_LOG_TYPE_ERROR, "Warning: Changing TVNavigationController's UINavigationControllerDelegate is not recommended because it is itself the delegate in order to implement its UIViewController (TVMLKitNavigationAdditions)", v1, 2u);
}

@end