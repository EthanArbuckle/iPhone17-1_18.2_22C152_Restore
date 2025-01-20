@interface UINavigationController
- (BOOL)prefersForcedModalShowViewController;
- (void)_addDoneButtonIfNeededToViewController:(id)a3;
- (void)_doneButtonTapped;
- (void)_presentSelfOnModalPresentationDelegateAnimated:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)popViewControllersAfterAndIncluding:(id)a3 animated:(BOOL)a4;
- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6;
@end

@implementation UINavigationController

- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (v11)
  {
    v14 = [(UINavigationController *)self modalPresentationDelegate];
    if (v14)
    {
      v15 = [(UINavigationController *)self view];
      v16 = [v15 window];
      if (v16)
      {
        v17 = [(UINavigationController *)self presentingViewController];
        BOOL v18 = v17 == 0;
      }
      else
      {
        BOOL v18 = 1;
      }
    }
    else
    {
      BOOL v18 = 0;
    }

    [(UINavigationController *)self _addDoneButtonIfNeededToViewController:v11];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10005B648;
    v29[3] = &unk_1001D30D0;
    v29[4] = self;
    id v22 = v11;
    id v30 = v22;
    BOOL v31 = !v18 && v7;
    v23 = objc_retainBlock(v29);
    [v22 preferredContentSize];
    -[UINavigationController setPreferredContentSize:](self, "setPreferredContentSize:");
    if (!v18)
    {
      ((void (*)(void *, id))v23[2])(v23, v13);
    }
    else
    {
      v24 = [(UINavigationController *)self modalPresentationDelegate];

      if (!v24)
      {
        v25 = +[NSAssertionHandler currentHandler];
        [v25 handleFailureInMethod:a2 object:self file:@"ManagedNavigationController.m" lineNumber:189 description:@"Can't present self without a modal presentation delegate."];
      }
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10005BC6C;
      v26[3] = &unk_1001D30F8;
      v27 = v23;
      id v28 = v13;
      [(UINavigationController *)self _presentSelfOnModalPresentationDelegateAnimated:v7 withCompletionHandler:v26];
    }
  }
  else
  {
    v19 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v20 = v19;
      *(_DWORD *)buf = 138412546;
      id v33 = (id)objc_opt_class();
      __int16 v34 = 2080;
      v35 = "-[UINavigationController(MobileCalUniversalShowViewControllerSignatureUsage) showViewController:sender:anima"
            "ted:completion:]";
      id v21 = v33;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@ [%s] given nil input to show.", buf, 0x16u);
    }
  }
}

- (void)_presentSelfOnModalPresentationDelegateAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(void))a4;
  BOOL v7 = [(UINavigationController *)self presentingViewController];

  if (v7)
  {
    if (v6) {
      v6[2](v6);
    }
  }
  else
  {
    v8 = [(UINavigationController *)self modalPresentationDelegate];
    uint64_t v9 = objc_opt_class();
    v10 = +[NSString stringWithFormat:@"<%@> presents <%@> with modal style %ld", v9, objc_opt_class(), [(UINavigationController *)self modalPresentationStyle]];

    id v11 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      id v12 = v11;
      *(_DWORD *)buf = 138412802;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2080;
      BOOL v18 = "-[UINavigationController(MobileCalUniversalShowViewControllerSignatureUsage) _presentSelfOnModalPresentation"
            "DelegateAnimated:withCompletionHandler:]";
      __int16 v19 = 2112;
      v20 = v10;
      id v13 = v16;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%@ [%s] %@", buf, 0x20u);
    }
    v14 = [(UINavigationController *)self modalPresentationDelegate];
    [v14 presentViewController:self animated:v4 completion:v6];
  }
}

- (void)_addDoneButtonIfNeededToViewController:(id)a3
{
  id v14 = a3;
  if ([v14 prefersForcedModalShowViewController]) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = [v14 prefersToBePresentedFromUINavigationController];
  }
  v5 = [(UINavigationController *)self view];
  uint64_t v6 = EKUICurrentWindowInterfaceParadigm();

  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  id v8 = v14;
  if (isKindOfClass)
  {
    if (v6 == 8) {
      unsigned int v9 = v4;
    }
    else {
      unsigned int v9 = 0;
    }
    if (v9 == 1)
    {
      id v10 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_doneButtonTapped"];
      id v11 = [v14 navigationItem];
      [v11 setLeftBarButtonItem:v10];
    }
    else
    {
      id v12 = [v14 navigationItem];
      id v13 = [v12 leftBarButtonItem];

      id v8 = v14;
      if (!v13) {
        goto LABEL_13;
      }
      id v10 = [v14 navigationItem];
      [v10 setLeftBarButtonItem:0];
    }

    id v8 = v14;
  }
LABEL_13:

  _objc_release_x1(isKindOfClass, v8);
}

- (void)_doneButtonTapped
{
}

- (BOOL)prefersForcedModalShowViewController
{
  return 1;
}

- (void)popViewControllersAfterAndIncluding:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(UINavigationController *)self viewControllers];
  id v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v17 != v12) {
        objc_enumerationMutation(v9);
      }
      if (*(id *)(*((void *)&v16 + 1) + 8 * v13) == v6) {
        break;
      }
      [v8 addObject:(void)v16];
      if (v11 == (id)++v13)
      {
        id v11 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  id v14 = [v9 count];
  if (v14 == [v8 count])
  {
    v15 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "View controller (%@) not found when trying to find a view controller to pop. View controllers = %@", buf, 0x16u);
    }
  }
  else
  {
    [(UINavigationController *)self setViewControllers:v8 animated:v4];
  }
}

@end