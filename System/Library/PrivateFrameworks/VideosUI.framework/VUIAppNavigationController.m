@interface VUIAppNavigationController
- (void)_presentConfirmationViewController:(id)a3 preferredContentSize:(CGSize)a4 completion:(id)a5;
- (void)presentConfirmationDialogWithType:(id)a3;
- (void)presentConfirmationDialogWithType:(id)a3 name:(id)a4;
- (void)presentConfirmationDialogWithType:(id)a3 name:(id)a4 completion:(id)a5;
@end

@implementation VUIAppNavigationController

- (void)_presentConfirmationViewController:(id)a3 preferredContentSize:(CGSize)a4 completion:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a5;
  id v10 = a3;
  v11 = objc_alloc_init(VUIConfirmationDocumentWrapperViewController);
  v12 = [(VUIConfirmationDocumentWrapperViewController *)v11 vuiView];
  v13 = [(VUIAppNavigationController *)self view];
  [v13 bounds];
  objc_msgSend(v12, "setFrame:");

  if (*MEMORY[0x1E4F1DB30] != width || *(double *)(MEMORY[0x1E4F1DB30] + 8) != height) {
    -[VUIConfirmationDocumentWrapperViewController setPreferredContentSize:](v11, "setPreferredContentSize:", width, height);
  }
  [(VUIConfirmationDocumentWrapperViewController *)v11 vui_addChildViewController:v10];
  objc_msgSend(v10, "vui_didMoveToParentViewController:", v11);
  v15 = [(VUIConfirmationDocumentWrapperViewController *)v11 vuiView];
  v16 = [v10 vuiView];

  objc_msgSend(v15, "vui_addSubview:oldView:", v16, 0);
  [(VUIConfirmationDocumentWrapperViewController *)v11 setVuiModalPresentationStyle:6];
  v17 = +[VUIConfirmationTransitioningDelegate sharedInstance];
  [(VUIConfirmationDocumentWrapperViewController *)v11 setTransitioningDelegate:v17];

  v18 = +[VUIConfirmationTransitioningDelegate sharedInstance];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __97__VUIAppNavigationController__presentConfirmationViewController_preferredContentSize_completion___block_invoke;
  v20[3] = &unk_1E6DF3DD0;
  id v21 = v9;
  id v19 = v9;
  [v18 setDismissedHandlerBlock:v20];

  [(UIViewController *)self vui_presentViewController:v11 animated:1 completion:0];
}

uint64_t __97__VUIAppNavigationController__presentConfirmationViewController_preferredContentSize_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)presentConfirmationDialogWithType:(id)a3 name:(id)a4 completion:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[VUITVAppLauncher sharedInstance];
  v11 = [v10 appController];

  v12 = [v11 appContext];
  v13 = objc_opt_new();
  [v13 setConfirmationDialogType:v19];
  if (v8) {
    [v13 setName:v8];
  }
  v14 = [[VUIDocumentDataSource alloc] initWithDocumentRef:@"ConfirmationDialog"];
  [(VUIDocumentDataSource *)v14 setDocumentType:@"default"];
  [(VUIDocumentDataSource *)v14 setControllerRef:@"ConfirmationDialog"];
  [(VUIDocumentDataSource *)v14 setContextData:v13];
  v15 = +[VUIInterfaceFactory sharedInstance];
  v16 = [v15 viewControllerWithDocumentDataSource:v14 appContext:v12];

  v17 = [(id)dialogAccessibilityIdentifierPrefix stringByAppendingString:v19];
  v18 = [v16 vuiView];
  [v18 setVuiAccessibilityIdentifier:v17];

  -[VUIAppNavigationController _presentConfirmationViewController:preferredContentSize:completion:](self, "_presentConfirmationViewController:preferredContentSize:completion:", v16, v9, 200.0, 200.0);
}

- (void)presentConfirmationDialogWithType:(id)a3 name:(id)a4
{
}

- (void)presentConfirmationDialogWithType:(id)a3
{
}

@end