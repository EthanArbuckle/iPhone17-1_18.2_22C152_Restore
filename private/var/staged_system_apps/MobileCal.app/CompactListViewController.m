@interface CompactListViewController
- (BOOL)eventViewControllerShouldHideInlineEditButton;
- (BOOL)shouldAutoScrollToSelectedDateAfterFirstRefresh;
- (id)cellFactory;
- (int)supportedToggleMode;
- (unint64_t)supportedInterfaceOrientations;
- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CompactListViewController

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CompactListViewController;
  [(ListViewController *)&v7 viewDidAppear:a3];
  v3 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    v4 = v3;
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear", buf, 0xCu);
  }
}

- (id)cellFactory
{
  if ([(ListViewController *)self showScrubber]) {
    v2 = objc_opt_new();
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (BOOL)shouldAutoScrollToSelectedDateAfterFirstRefresh
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int)supportedToggleMode
{
  return 1;
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  if ((id)[(ListViewController *)self destination] != (id)2) {
    goto LABEL_4;
  }
  v12 = [(ListViewController *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) == 0
    || ([(ListViewController *)self delegate],
        v14 = objc_claimAutoreleasedReturnValue(),
        unsigned int v15 = [v14 listViewControllerShouldShowEvent:v10 showMode:a5],
        v14,
        v15))
  {
LABEL_4:
    v16.receiver = self;
    v16.super_class = (Class)CompactListViewController;
    [(ListViewController *)&v16 showEvent:v10 animated:v8 showMode:a5 context:v11];
  }
}

- (BOOL)eventViewControllerShouldHideInlineEditButton
{
  return 1;
}

@end