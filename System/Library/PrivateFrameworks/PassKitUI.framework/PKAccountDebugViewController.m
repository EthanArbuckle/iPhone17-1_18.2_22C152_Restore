@interface PKAccountDebugViewController
- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground;
- (PKAccountDebugViewController)initWithConfiguration:(id)a3;
- (void)_handleShareButton:(id)a3;
- (void)loadView;
- (void)viewWillLayoutSubviews;
@end

@implementation PKAccountDebugViewController

- (PKAccountDebugViewController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAccountDebugViewController;
  v6 = [(PKAccountDebugViewController *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    v8 = [[_PKAccountDebugViewController alloc] initWithConfiguration:v5];
    viewController = v7->_viewController;
    v7->_viewController = v8;

    [(PKAccountDebugViewController *)v7 addChildViewController:v7->_viewController];
    v10 = [(PKAccountDebugViewController *)v7 navigationItem];
    [v10 setTitle:@"Account Diagnostics"];
    [v10 setLargeTitleDisplayMode:2];
    [v10 setBackButtonDisplayMode:2];
    v11 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:9 target:v7 action:sel__handleShareButton_];
    [v10 setRightBarButtonItem:v11];
  }
  return v7;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)PKAccountDebugViewController;
  [(PKAccountDebugViewController *)&v5 loadView];
  [(_PKAccountDebugViewController *)self->_viewController didMoveToParentViewController:self];
  v3 = [(_PKAccountDebugViewController *)self->_viewController view];
  v4 = [(PKAccountDebugViewController *)self view];
  [v4 addSubview:v3];
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)PKAccountDebugViewController;
  [(PKAccountDebugViewController *)&v13 viewWillLayoutSubviews];
  v3 = [(PKAccountDebugViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(_PKAccountDebugViewController *)self->_viewController view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (void)_handleShareButton:(id)a3
{
  double v4 = [(PKAccountDebugViewController *)self navigationItem];
  double v5 = [v4 rightBarButtonItem];
  [v5 setEnabled:0];

  id v6 = objc_alloc_init(MEMORY[0x1E4F84518]);
  double v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  double v8 = [(PKAccountViewInterfaceConfiguration *)self->_config account];
  double v9 = [v8 accountIdentifier];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v11 = [NSString stringWithFormat:@"account_transaction_report_%@.json", v9];
  v12 = [v7 temporaryDirectory];
  objc_super v13 = [v12 URLByAppendingPathComponent:v11];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __51__PKAccountDebugViewController__handleShareButton___block_invoke;
  v27[3] = &unk_1E59CF430;
  v27[4] = self;
  id v14 = v7;
  id v28 = v14;
  id v15 = v13;
  id v29 = v15;
  id v16 = v10;
  id v30 = v16;
  [v6 addOperation:v27];
  v17 = [MEMORY[0x1E4F1CA98] null];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __51__PKAccountDebugViewController__handleShareButton___block_invoke_2;
  v22[3] = &unk_1E59DC280;
  id v23 = v16;
  id v24 = v14;
  id v25 = v15;
  v26 = self;
  id v18 = v15;
  id v19 = v14;
  id v20 = v16;
  id v21 = (id)[v6 evaluateWithInput:v17 completion:v22];
}

void __51__PKAccountDebugViewController__handleShareButton___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v12 = a3;
  id v6 = a4;
  double v7 = (void *)MEMORY[0x1E4F28D90];
  double v8 = [*(id *)(*(void *)(a1 + 32) + 976) dictionaryRepresentation];
  double v9 = [v7 dataWithJSONObject:v8 options:0 error:0];

  id v10 = *(void **)(a1 + 40);
  double v11 = [*(id *)(a1 + 48) path];
  LODWORD(v10) = [v10 createFileAtPath:v11 contents:v9 attributes:0];

  if (v10) {
    [*(id *)(a1 + 56) addObject:*(void *)(a1 + 48)];
  }
  v6[2](v6, v12, 0);
}

void __51__PKAccountDebugViewController__handleShareButton___block_invoke_2(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__PKAccountDebugViewController__handleShareButton___block_invoke_3;
  v4[3] = &unk_1E59CB8B0;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v2 = *(id *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  id v7 = v2;
  uint64_t v8 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

void __51__PKAccountDebugViewController__handleShareButton___block_invoke_3(uint64_t a1)
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F9F2E8]) initWithActivityItems:*(void *)(a1 + 32) applicationActivities:0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__PKAccountDebugViewController__handleShareButton___block_invoke_4;
  v8[3] = &unk_1E59CD068;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  [v2 setCompletionWithItemsHandler:v8];
  uint64_t v3 = [v2 popoverPresentationController];
  double v4 = [*(id *)(a1 + 56) navigationItem];
  id v5 = [v4 rightBarButtonItem];
  [v3 setBarButtonItem:v5];

  id v6 = *(void **)(a1 + 56);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__PKAccountDebugViewController__handleShareButton___block_invoke_5;
  v7[3] = &unk_1E59CA7D0;
  v7[4] = v6;
  [v6 presentViewController:v2 animated:1 completion:v7];
}

uint64_t __51__PKAccountDebugViewController__handleShareButton___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeItemAtURL:*(void *)(a1 + 40) error:0];
}

void __51__PKAccountDebugViewController__handleShareButton___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationItem];
  v1 = [v2 rightBarButtonItem];
  [v1 setEnabled:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_viewController, 0);
}

@end