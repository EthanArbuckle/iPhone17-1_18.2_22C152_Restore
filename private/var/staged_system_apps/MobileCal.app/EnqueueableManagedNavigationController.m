@interface EnqueueableManagedNavigationController
- (BOOL)_shouldDoExternalPresentationOfManagedNavigationController;
- (BOOL)_shouldEnqueueDismissals;
- (BOOL)canBeDirectlyManaged;
- (BOOL)canManagePresentationStyle;
- (BOOL)wantsManagement;
- (Class)showViewControllerOperationClass;
- (EnqueueableManagedNavigationController)init;
- (MainViewController)sourceViewController;
- (NSOperationQueue)showViewControllersWhenReadyQueue;
- (id)EKUI_viewHierarchy;
- (id)_popoverPresentationOperationInQueue;
- (id)enqueuedViewControllers;
- (void)_addDoneButtonIfNeededToViewController:(id)a3;
- (void)_doneButtonTapped;
- (void)cancelOutstandingOperations;
- (void)dealloc;
- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4;
- (void)dismissViewControllerWithoutEnqueuingWithTransition:(int)a3 completion:(id)a4;
- (void)enqueueBlock:(id)a3;
- (void)enqueueStackResetOperation;
- (void)enqueueStackResetOperationDismissingPresentations:(BOOL)a3 cancelOperations:(BOOL)a4 completionBlock:(id)a5;
- (void)setAllowsEnqueuedDismissal:(BOOL)a3;
- (void)setShowViewControllersWhenReadyQueue:(id)a3;
- (void)setSourceViewController:(id)a3;
- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)sourceViewController:(id)a3 notifiesReadinessForPresentation:(BOOL)a4;
@end

@implementation EnqueueableManagedNavigationController

- (EnqueueableManagedNavigationController)init
{
  v11.receiver = self;
  v11.super_class = (Class)EnqueueableManagedNavigationController;
  v2 = [(EnqueueableManagedNavigationController *)&v11 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSOperationQueue);
    [v3 setMaxConcurrentOperationCount:1];
    [v3 setSuspended:1];
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    id v6 = [objc_alloc((Class)NSString) initWithFormat:@"com.apple.mobilecal.%@.showViewControllers", v5];
    [v3 setName:v6];

    [(EnqueueableManagedNavigationController *)v2 setShowViewControllersWhenReadyQueue:v3];
    v7 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      v8 = v7;
      v9 = [v3 name];
      *(_DWORD *)buf = 138412290;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Created showViewControllers queue named [%@]", buf, 0xCu);
    }
    [(EnqueueableManagedNavigationController *)v2 _setClipUnderlapWhileTransitioning:1];
  }
  return v2;
}

- (void)dealloc
{
  id v3 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    *(_DWORD *)buf = 138412290;
    id v8 = (id)objc_opt_class();
    id v5 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Dealloc [%@]", buf, 0xCu);
  }
  [(EnqueueableManagedNavigationController *)self cancelOutstandingOperations];
  v6.receiver = self;
  v6.super_class = (Class)EnqueueableManagedNavigationController;
  [(EnqueueableManagedNavigationController *)&v6 dealloc];
}

- (BOOL)wantsManagement
{
  return 1;
}

- (BOOL)canManagePresentationStyle
{
  return 0;
}

- (BOOL)canBeDirectlyManaged
{
  return 0;
}

- (void)cancelOutstandingOperations
{
  id v2 = [(EnqueueableManagedNavigationController *)self showViewControllersWhenReadyQueue];
  [v2 cancelAllOperations];
}

- (id)enqueuedViewControllers
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  objc_super v11 = sub_1000AA25C;
  v12 = sub_1000AA26C;
  id v13 = +[NSMutableArray array];
  id v3 = [(EnqueueableManagedNavigationController *)self showViewControllersWhenReadyQueue];
  v4 = [v3 operations];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000AA274;
  v7[3] = &unk_1001D4098;
  v7[4] = &v8;
  [v4 enumerateObjectsUsingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)sourceViewController:(id)a3 notifiesReadinessForPresentation:(BOOL)a4
{
  id v4 = [(EnqueueableManagedNavigationController *)self _popoverPresentationOperationInQueue];
  [v4 isReady];
}

- (id)_popoverPresentationOperationInQueue
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_1000AA25C;
  objc_super v11 = sub_1000AA26C;
  id v12 = 0;
  id v2 = [(EnqueueableManagedNavigationController *)self showViewControllersWhenReadyQueue];
  id v3 = [v2 operations];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000AA464;
  v6[3] = &unk_1001D4098;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (Class)showViewControllerOperationClass
{
  return (Class)objc_opt_class();
}

- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  uint64_t v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v72 = a6;
  if (v10)
  {
    id v12 = [v10 prefersForcedModalShowViewController];
    unsigned int v13 = [(EnqueueableManagedNavigationController *)self _shouldDoExternalPresentationOfManagedNavigationController];
    v14 = [(EnqueueableManagedNavigationController *)self sourceViewController];
    id v15 = [v14 presentationStyleOverrideForChildViewControllers];

    if (v15 == (id)-52534682) {
      goto LABEL_52;
    }
    [(EnqueueableManagedNavigationController *)self _addDoneButtonIfNeededToViewController:v10];
    v16 = [(EnqueueableManagedNavigationController *)self showViewControllerOperationClass];
    id v71 = v11;
    char v70 = (char)v12;
    if ((v13 & v12) != 1 || v15 == (id)7)
    {
      if (v12)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v23 = 3;
        }
        else {
          uint64_t v23 = 18;
        }
        [v10 setModalPresentationStyle:v23];
      }
      v24 = [(EnqueueableManagedNavigationController *)self viewControllers];
      if ([v24 count] == (id)1)
      {
        [(EnqueueableManagedNavigationController *)self viewControllers];
        v25 = v69 = v16;
        v26 = [v25 firstObject];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        uint64_t v7 = v7;
        v16 = v69;
      }
      else
      {
        char isKindOfClass = 0;
      }

      v19 = (DeferredPopoverPresentationOperation *)[[v16 alloc] initWithViewControllerToShow:v10 toBeShownInViewController:self shouldBeModal:v12 shouldShowWithAnimation:isKindOfClass & 1];
    }
    else
    {
      [v10 setModalPresentationStyle:v15];
      id v17 = [v16 alloc];
      v18 = [(EnqueueableManagedNavigationController *)self modalPresentationDelegate];
      v19 = (DeferredPopoverPresentationOperation *)[v17 initWithViewControllerToShow:v10 toBeShownInViewController:v18 shouldBeModal:1 shouldShowWithAnimation:v7];

      unsigned int v13 = 0;
    }
    [(DeferredPopoverPresentationOperation *)v19 setCompletionBlock:v72];
    v28 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v29 = v28;
      v30 = v16;
      v31 = objc_opt_class();
      id v32 = v31;
      *(_DWORD *)buf = 138412546;
      id v74 = v31;
      __int16 v75 = 2112;
      v76 = (char *)objc_opt_class();
      v33 = v76;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%@ queueing show view controller operation to show %@", buf, 0x16u);

      v16 = v30;
    }
    if (v13)
    {
      [(EnqueueableManagedNavigationController *)self setModalPresentationStyle:v15];
      if (v15 == (id)7)
      {
        v34 = [(EnqueueableManagedNavigationController *)self _popoverPresentationOperationInQueue];
        if (v34
          || (-[EnqueueableManagedNavigationController showViewControllersWhenReadyQueue](self, "showViewControllersWhenReadyQueue"), v35 = objc_claimAutoreleasedReturnValue(), id v36 = [v35 operationCount], v35, v36))
        {
          v37 = (void *)kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
          {
            v38 = v37;
            v39 = objc_opt_class();
            id v40 = v39;
            v41 = [(EnqueueableManagedNavigationController *)self showViewControllersWhenReadyQueue];
            *(_DWORD *)buf = 138412546;
            id v74 = v39;
            __int16 v75 = 2112;
            v76 = v41;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%@ won't create a popover presentation operation because the queue is not empty: \n %@", buf, 0x16u);
          }
          v42 = 0;
        }
        else
        {
          v42 = [[DeferredPopoverPresentationOperation alloc] initWithViewController:self shouldShowWithAnimation:v7];
          v65 = (void *)kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
          {
            v66 = v65;
            v67 = objc_opt_class();
            *(_DWORD *)buf = 138412290;
            id v74 = v67;
            id v68 = v67;
            _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "%@ queueing initial popover presentation operation on queue.", buf, 0xCu);
          }
        }
        v43 = [(EnqueueableManagedNavigationController *)self sourceViewController];
        unsigned int v44 = [v43 conformsToProtocol:&OBJC_PROTOCOL___EnqueuablePopoverPresentationManagedNavigationControllerDelegate];

        if (v44)
        {
          v45 = [(EnqueueableManagedNavigationController *)self sourceViewController];
          [v45 enqueuableNavigationController:self requestsDeferShowViewControllerUntilReady:0];
        }
        char v46 = v70 ^ 1;
        if (!v34) {
          char v46 = 1;
        }
        if ((v46 & 1) == 0) {
          [(DeferredPopoverPresentationOperation *)v19 addDependency:v34];
        }

        char v47 = v44 ^ 1;
LABEL_36:
        v50 = [(EnqueueableManagedNavigationController *)self showViewControllersWhenReadyQueue];
        v51 = [v50 operations];

        if ((unint64_t)[v51 count] >= 2)
        {
          v52 = [v51 lastObject];
          [(DeferredPopoverPresentationOperation *)v19 addDependency:v52];
        }
        if ([(ShowViewControllerOperation *)v19 shouldBeModal])
        {
          if (v42) {
            char v53 = v47;
          }
          else {
            char v53 = 1;
          }
          if ((v53 & 1) == 0)
          {
            [(DeferredPopoverPresentationOperation *)v19 addDependency:v42];
            v54 = [(EnqueueableManagedNavigationController *)self showViewControllersWhenReadyQueue];
            [v54 addOperation:v42];
          }
        }
        else if (v42)
        {
          [(DeferredPopoverPresentationOperation *)v19 setCompletionBlock:0];
          [(DeferredPopoverPresentationOperation *)v42 setCompletionBlock:v72];
          v55 = [(EnqueueableManagedNavigationController *)self showViewControllersWhenReadyQueue];
          [v55 addOperation:v19];

          if (v47)
          {
LABEL_49:
            v59 = (void *)kCalUILogHandle;
            if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEFAULT))
            {
              v60 = v59;
              v61 = objc_opt_class();
              id v62 = v61;
              v63 = [(EnqueueableManagedNavigationController *)self showViewControllersWhenReadyQueue];
              *(_DWORD *)buf = 138412546;
              id v74 = v61;
              __int16 v75 = 2112;
              v76 = v63;
              _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%@'s operation queue is ready for execution:\n%@", buf, 0x16u);
            }
            v64 = [(EnqueueableManagedNavigationController *)self showViewControllersWhenReadyQueue];
            [v64 setSuspended:0];

            id v11 = v71;
            goto LABEL_52;
          }
          v56 = [(EnqueueableManagedNavigationController *)self showViewControllersWhenReadyQueue];
          v57 = v56;
          v58 = v42;
LABEL_48:
          [v56 addOperation:v58];

          goto LABEL_49;
        }
        v56 = [(EnqueueableManagedNavigationController *)self showViewControllersWhenReadyQueue];
        v57 = v56;
        v58 = v19;
        goto LABEL_48;
      }
      id v48 = [v16 alloc];
      v49 = [(EnqueueableManagedNavigationController *)self modalPresentationDelegate];
      v42 = (DeferredPopoverPresentationOperation *)[v48 initWithViewControllerToShow:self toBeShownInViewController:v49 shouldBeModal:1 shouldShowWithAnimation:v7];
    }
    else
    {
      v42 = 0;
    }
    char v47 = 0;
    goto LABEL_36;
  }
  v20 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
  {
    v21 = v20;
    *(_DWORD *)buf = 138412546;
    id v74 = (id)objc_opt_class();
    __int16 v75 = 2080;
    v76 = "-[EnqueueableManagedNavigationController showViewController:sender:animated:completion:]";
    id v22 = v74;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@ [%s] given nil input to show.", buf, 0x16u);
  }
LABEL_52:
}

- (BOOL)_shouldDoExternalPresentationOfManagedNavigationController
{
  id v3 = [(EnqueueableManagedNavigationController *)self showViewControllersWhenReadyQueue];
  if ([v3 operationCount])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(EnqueueableManagedNavigationController *)self modalPresentationDelegate];
    if (v5)
    {
      objc_super v6 = [(EnqueueableManagedNavigationController *)self view];
      uint64_t v7 = [v6 window];
      if (v7)
      {
        uint64_t v8 = [(EnqueueableManagedNavigationController *)self presentingViewController];
        BOOL v4 = v8 == 0;
      }
      else
      {
        BOOL v4 = 1;
      }
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  return v4;
}

- (void)_addDoneButtonIfNeededToViewController:(id)a3
{
  id v10 = a3;
  if ([(EnqueueableManagedNavigationController *)self _shouldDoExternalPresentationOfManagedNavigationController])
  {
    BOOL v4 = [(EnqueueableManagedNavigationController *)self viewControllers];
    BOOL v5 = [v4 count] == 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  objc_super v6 = [(EnqueueableManagedNavigationController *)self view];
  uint64_t v7 = EKUICurrentWindowInterfaceParadigm();

  if (v5 && v7 == 8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_doneButtonTapped"];
      uint64_t v9 = [v10 navigationItem];
      [v9 setLeftBarButtonItem:v8];
    }
  }
}

- (void)_doneButtonTapped
{
  id v3 = [(EnqueueableManagedNavigationController *)self presentingViewController];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000AAEA8;
  v4[3] = &unk_1001D2740;
  v4[4] = self;
  [v3 dismissViewControllerAnimated:1 completion:v4];
}

- (void)enqueueStackResetOperation
{
}

- (void)enqueueStackResetOperationDismissingPresentations:(BOOL)a3 cancelOperations:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  uint64_t v9 = (void *)kCalUILogHandle;
  BOOL v10 = os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v10)
    {
      id v11 = v9;
      *(_DWORD *)buf = 138412290;
      id v28 = (id)objc_opt_class();
      id v12 = v28;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%@ queueing stack reset operation and cancelling all outstanding operations.", buf, 0xCu);
    }
    [(EnqueueableManagedNavigationController *)self cancelOutstandingOperations];
  }
  else if (v10)
  {
    unsigned int v13 = v9;
    *(_DWORD *)buf = 138412290;
    id v28 = (id)objc_opt_class();
    id v14 = v28;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%@ queueing stack reset operation.", buf, 0xCu);
  }
  id v15 = [(EnqueueableManagedNavigationController *)self presentedViewController];
  if (v15)
  {
    v16 = [(EnqueueableManagedNavigationController *)self presentedViewController];
    id v17 = [v16 presentingViewController];
    BOOL v18 = v17 == self;
  }
  else
  {
    BOOL v18 = 0;
  }

  if ([(EnqueueableManagedNavigationController *)self _shouldEnqueueDismissals] && v6 && v18)
  {
    objc_initWeak((id *)buf, self);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000AB1E4;
    v24[3] = &unk_1001D40C0;
    objc_copyWeak(&v26, (id *)buf);
    v24[4] = self;
    id v25 = v8;
    [(EnqueueableManagedNavigationController *)self dismissViewControllerWithTransition:0 completion:v24];

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000AB374;
    v19[3] = &unk_1001D4110;
    BOOL v22 = v6;
    BOOL v23 = v18;
    objc_copyWeak(&v21, (id *)buf);
    v19[4] = self;
    id v20 = v8;
    [(EnqueueableManagedNavigationController *)self enqueueBlock:v19];

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
}

- (void)enqueueBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      BOOL v6 = v5;
      *(_DWORD *)buf = 138412290;
      id v20 = (id)objc_opt_class();
      id v7 = v20;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@ queueing block operation.", buf, 0xCu);
    }
    unsigned int v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    id v15 = sub_1000AB9FC;
    v16 = &unk_1001D4138;
    uint64_t v18 = objc_opt_class();
    id v17 = v4;
    id v8 = +[NSBlockOperation blockOperationWithBlock:&v13];
    uint64_t v9 = [(EnqueueableManagedNavigationController *)self showViewControllersWhenReadyQueue];
    BOOL v10 = [v9 operations];
    id v11 = [v10 lastObject];

    if (v11) {
      [v8 addDependency:v11];
    }
    id v12 = [(EnqueueableManagedNavigationController *)self showViewControllersWhenReadyQueue];
    [v12 addOperation:v8];
  }
}

- (BOOL)_shouldEnqueueDismissals
{
  if (self->_enqueuingDismissalsDisabled) {
    return 0;
  }
  id v3 = [(EnqueueableManagedNavigationController *)self sourceViewController];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___EnqueueablePresentationDismissalManagedNavigationControllerDelegate];

  if (!v4) {
    return 0;
  }
  BOOL v5 = [(EnqueueableManagedNavigationController *)self sourceViewController];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v6 = [v5 enqueueableManagedNavigationControllerShouldEnqueuePresentationDismissals:self];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if ([(EnqueueableManagedNavigationController *)self _shouldEnqueueDismissals])
  {
    id v7 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      id v8 = v7;
      *(_DWORD *)v16 = 138412290;
      *(void *)&v16[4] = objc_opt_class();
      id v9 = *(id *)&v16[4];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@ queueing show view controller operation to dismiss presented view controller", v16, 0xCu);
    }
    BOOL v10 = [[DismissPresentedViewControllerOperation alloc] initWithPresentingViewController:self transition:v4 completion:v6];
    id v11 = [(EnqueueableManagedNavigationController *)self showViewControllersWhenReadyQueue];
    id v12 = [v11 operations];

    if ((unint64_t)[v12 count] >= 2)
    {
      unsigned int v13 = [v12 lastObject];
      [(DismissPresentedViewControllerOperation *)v10 addDependency:v13];
    }
    uint64_t v14 = [(EnqueueableManagedNavigationController *)self showViewControllersWhenReadyQueue];
    [v14 addOperation:v10];

    id v15 = [(EnqueueableManagedNavigationController *)self showViewControllersWhenReadyQueue];
    [v15 setSuspended:0];
  }
  else
  {
    [(EnqueueableManagedNavigationController *)self dismissViewControllerWithoutEnqueuingWithTransition:v4 completion:v6];
  }
}

- (void)dismissViewControllerWithoutEnqueuingWithTransition:(int)a3 completion:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)EnqueueableManagedNavigationController;
  [(EnqueueableManagedNavigationController *)&v4 dismissViewControllerWithTransition:*(void *)&a3 completion:a4];
}

- (void)setAllowsEnqueuedDismissal:(BOOL)a3
{
  self->_enqueuingDismissalsDisabled = !a3;
}

- (id)EKUI_viewHierarchy
{
  id v3 = [(EnqueueableManagedNavigationController *)self sourceViewController];

  if (v3)
  {
    objc_super v4 = [(EnqueueableManagedNavigationController *)self sourceViewController];
    BOOL v5 = [v4 EKUI_viewHierarchy];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)EnqueueableManagedNavigationController;
    BOOL v5 = [(EnqueueableManagedNavigationController *)&v7 EKUI_viewHierarchy];
  }

  return v5;
}

- (MainViewController)sourceViewController
{
  return self->_sourceViewController;
}

- (void)setSourceViewController:(id)a3
{
  self->_sourceViewController = (MainViewController *)a3;
}

- (NSOperationQueue)showViewControllersWhenReadyQueue
{
  return self->_showViewControllersWhenReadyQueue;
}

- (void)setShowViewControllersWhenReadyQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end