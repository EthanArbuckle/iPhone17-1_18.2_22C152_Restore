@interface ICSERootViewController
- (BOOL)didCancel;
- (BOOL)isDismissing;
- (BOOL)isShowingSearchResults;
- (BOOL)shouldImportNotesWithURLs:(id)a3;
- (CGRect)keyboardFrame;
- (ICImportSERootViewController)importRootViewController;
- (ICSEContainerViewController)containerViewController;
- (ICSEMainViewController)mainViewController;
- (ICSEPresentationController)ic_presentationController;
- (ICSETableViewController)tableViewController;
- (UINavigationController)navigationController;
- (double)dismissDuration;
- (id)dismissCompletionBlock;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)dealloc;
- (void)dismissWithCompletion:(id)a3;
- (void)setContainerViewController:(id)a3;
- (void)setDidCancel:(BOOL)a3;
- (void)setDismissCompletionBlock:(id)a3;
- (void)setDismissDuration:(double)a3;
- (void)setDismissing:(BOOL)a3;
- (void)setIc_presentationController:(id)a3;
- (void)setImportRootViewController:(id)a3;
- (void)setIsShowingSearchResults:(BOOL)a3;
- (void)setIsShowingSearchResults:(BOOL)a3 animated:(BOOL)a4;
- (void)setMainViewController:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setTableViewController:(id)a3;
- (void)setUpNavigationController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ICSERootViewController

- (void)dismissWithCompletion:(id)a3
{
  id v4 = a3;
  [(ICSERootViewController *)self setDismissing:1];
  [(ICSERootViewController *)self setDismissDuration:0.0];
  v5 = [(ICSERootViewController *)self mainViewController];
  v6 = [v5 topTextView];
  unsigned int v7 = [v6 isFirstResponder];

  if (v7)
  {
    [(ICSERootViewController *)self setDismissCompletionBlock:v4];
    v8 = [(ICSERootViewController *)self mainViewController];
    v9 = [v8 topTextView];
    [v9 resignFirstResponder];

    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000E414;
    block[3] = &unk_1000EE2E0;
    objc_copyWeak(&v12, &location);
    id v11 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    [(ICSERootViewController *)self dismissViewControllerAnimated:1 completion:v4];
  }
}

- (void)viewDidLoad
{
  v38.receiver = self;
  v38.super_class = (Class)ICSERootViewController;
  [(ICSERootViewController *)&v38 viewDidLoad];
  v3 = dispatch_group_create();
  id v24 = objc_alloc_init((Class)NSMutableArray);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v19 = self;
  id v4 = [(ICSERootViewController *)self extensionContext];
  v5 = [v4 inputItems];

  id obj = v5;
  id v22 = [v5 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v35;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v6;
        unsigned int v7 = *(void **)(*((void *)&v34 + 1) + 8 * v6);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        v8 = [v7 attachments];
        id v9 = [v8 countByEnumeratingWithState:&v30 objects:v39 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v31;
          do
          {
            id v12 = 0;
            do
            {
              if (*(void *)v31 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v12);
              v14 = [UTTypeURL identifier];
              unsigned int v15 = [v13 hasItemConformingToTypeIdentifier:v14];

              if (v15)
              {
                dispatch_group_enter(v3);
                v16 = [UTTypeURL identifier];
                v27[0] = _NSConcreteStackBlock;
                v27[1] = 3221225472;
                v27[2] = sub_10000E7F8;
                v27[3] = &unk_1000EE138;
                id v28 = v24;
                v29 = v3;
                [v13 loadItemForTypeIdentifier:v16 options:0 completionHandler:v27];
              }
              id v12 = (char *)v12 + 1;
            }
            while (v10 != v12);
            id v10 = [v8 countByEnumeratingWithState:&v30 objects:v39 count:16];
          }
          while (v10);
        }

        uint64_t v6 = v23 + 1;
      }
      while ((id)(v23 + 1) != v22);
      id v22 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v22);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E8C8;
  block[3] = &unk_1000EE0E8;
  void block[4] = v19;
  id v26 = v24;
  id v17 = v24;
  dispatch_group_notify(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  v18 = +[ICNAController sharedController];
  [v18 startAppSession];
}

- (void)dealloc
{
  v3 = +[ICNAController sharedController];
  [v3 appSessionDidTerminate];

  v4.receiver = self;
  v4.super_class = (Class)ICSERootViewController;
  [(ICSERootViewController *)&v4 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[ICNAController sharedController];
  uint64_t v6 = +[NSURL URLWithString:kICNASharingExtensionReferralURL];
  [v5 startSessionWithReferralURL:v6 referralApplication:0];

  v7.receiver = self;
  v7.super_class = (Class)ICSERootViewController;
  [(ICSERootViewController *)&v7 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[ICNAController sharedController];
  [v5 endSessionSynchronously:0 endReason:1];

  v6.receiver = self;
  v6.super_class = (Class)ICSERootViewController;
  [(ICSERootViewController *)&v6 viewWillDisappear:v3];
}

- (void)setUpNavigationController:(id)a3
{
  id v9 = a3;
  [v9 setNavigationBarHidden:1];
  if ((+[UIDevice ic_isVision] & 1) == 0)
  {
    objc_super v4 = +[UIColor ICTintColor];
    v5 = [v9 navigationBar];
    [v5 setTintColor:v4];

    objc_super v6 = +[UIColor ic_colorWith256Red:255.0 green:255.0 blue:255.0 unitAlpha:1.0];
    objc_super v7 = [v9 navigationBar];
    [v7 setBackgroundColor:v6];
  }
  [v9 setTransitioningDelegate:self];
  v8 = [v9 view];
  [v8 setClipsToBounds:1];
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[ICSEPresentationController alloc] initWithPresentedViewController:v8 presentingViewController:v7];

  [(ICSERootViewController *)self setIc_presentationController:v9];
  [(ICSEPresentationController *)v9 setRootViewController:self];

  return v9;
}

- (void)setIsShowingSearchResults:(BOOL)a3 animated:(BOOL)a4
{
  if (a4)
  {
    LODWORD(v4) = -1097229926;
    LODWORD(v5) = 1045220557;
    LODWORD(v6) = 1.0;
    id v9 = +[CAMediaTimingFunction functionWithControlPoints:0.0 :v4 :v5 :v6];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000F080;
    v10[3] = &unk_1000EDF98;
    v10[4] = self;
    BOOL v11 = a3;
    +[UIView ic_animateWithDuration:v9 timingFunction:v10 animations:0.25];
  }
  else
  {
    -[ICSERootViewController setIsShowingSearchResults:](self, "setIsShowingSearchResults:");
  }
}

- (void)setIsShowingSearchResults:(BOOL)a3
{
  if (self->_isShowingSearchResults != a3)
  {
    BOOL v3 = a3;
    self->_isShowingSearchResults = a3;
    double v5 = [(ICSERootViewController *)self ic_presentationController];
    [v5 setIsShowingSearchResults:v3];

    double v6 = [(ICSERootViewController *)self containerViewController];
    [v6 setIsShowingTableContainer:v3];

    id v7 = [(ICSERootViewController *)self ic_presentationController];
    id v8 = [v7 containerView];
    [v8 setNeedsLayout];

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000F190;
    v9[3] = &unk_1000EE0C0;
    v9[4] = self;
    +[UIView animateWithDuration:v9 animations:0.0];
  }
}

- (BOOL)shouldImportNotesWithURLs:(id)a3
{
  id v3 = a3;
  if ([v3 count] == (id)1)
  {
    double v4 = [v3 firstObject];
    id v16 = 0;
    id v15 = 0;
    unsigned __int8 v5 = [v4 getResourceValue:&v16 forKey:NSURLTypeIdentifierKey error:&v15];
    id v6 = v16;
    id v7 = v15;
    if ((v5 & 1) == 0)
    {
      id v8 = os_log_create("com.apple.notes", "SharingExtension");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000B5A58(v7, (uint64_t)v4, v8);
      }
    }
    if (v6)
    {
      id v9 = +[ICUTType typeWithIdentifier:v6];
      id v10 = +[UTType importedTypeWithIdentifier:@"com.evernote.enex"];
      if ([v9 conformsToType:v10])
      {
        unsigned __int8 v11 = 1;
      }
      else
      {
        id v12 = +[ICUTType typeWithIdentifier:v6];
        v13 = +[ICArchive universalTypeIdentifier];
        unsigned __int8 v11 = [v12 conformsToType:v13];
      }
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (ICSEMainViewController)mainViewController
{
  return self->_mainViewController;
}

- (void)setMainViewController:(id)a3
{
}

- (ICSETableViewController)tableViewController
{
  return self->_tableViewController;
}

- (void)setTableViewController:(id)a3
{
}

- (CGRect)keyboardFrame
{
  double x = self->_keyboardFrame.origin.x;
  double y = self->_keyboardFrame.origin.y;
  double width = self->_keyboardFrame.size.width;
  double height = self->_keyboardFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)didCancel
{
  return self->_didCancel;
}

- (void)setDidCancel:(BOOL)a3
{
  self->_didCancel = a3;
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (ICSEContainerViewController)containerViewController
{
  return self->_containerViewController;
}

- (void)setContainerViewController:(id)a3
{
}

- (ICImportSERootViewController)importRootViewController
{
  return self->_importRootViewController;
}

- (void)setImportRootViewController:(id)a3
{
}

- (ICSEPresentationController)ic_presentationController
{
  return self->_ic_presentationController;
}

- (void)setIc_presentationController:(id)a3
{
}

- (BOOL)isShowingSearchResults
{
  return self->_isShowingSearchResults;
}

- (BOOL)isDismissing
{
  return self->_dismissing;
}

- (void)setDismissing:(BOOL)a3
{
  self->_dismissing = a3;
}

- (id)dismissCompletionBlock
{
  return self->_dismissCompletionBlock;
}

- (void)setDismissCompletionBlock:(id)a3
{
}

- (double)dismissDuration
{
  return self->_dismissDuration;
}

- (void)setDismissDuration:(double)a3
{
  self->_dismissDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissCompletionBlock, 0);
  objc_storeStrong((id *)&self->_ic_presentationController, 0);
  objc_storeStrong((id *)&self->_importRootViewController, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);

  objc_storeStrong((id *)&self->_mainViewController, 0);
}

@end