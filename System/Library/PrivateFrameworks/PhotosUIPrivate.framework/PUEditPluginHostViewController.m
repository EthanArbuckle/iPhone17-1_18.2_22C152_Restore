@interface PUEditPluginHostViewController
- (BOOL)didHandleCancel;
- (BOOL)didHandleDone;
- (BOOL)extensionDidBeginContentEditing;
- (BOOL)prefersStatusBarHidden;
- (BOOL)prepareForDismissingForced:(BOOL)a3;
- (BOOL)showUndoRedoButtons;
- (NSCopying)request;
- (NSNumber)allowsFullScreen;
- (PUEditPlugin)plugin;
- (PUEditPluginHostViewController)initWithPlugin:(id)a3;
- (PUEditPluginHostViewControllerDataSource)dataSource;
- (PUEditPluginHostViewControllerDelegate)delegate;
- (PUEditingExtensionUndoProxyHostSide)undoProxy;
- (UIBarButtonItem)redoBarButtonItem;
- (UIBarButtonItem)undoBarButtonItem;
- (UIViewController)remoteViewController;
- (id)_extensionVendorProxy;
- (id)_hostContext;
- (id)disablingIdleTimerToken;
- (int64_t)preferredUserInterfaceStyle;
- (void)_addRemoteViewControllerIfNeededAllowingFullscreen:(BOOL)a3;
- (void)_beginContentEditingWithCompletionHandler:(id)a3 timeout:(double)a4;
- (void)_beginDisablingIdleTimer;
- (void)_dismiss;
- (void)_endDisablingIdleTimerIfNecessary;
- (void)_handleCancel;
- (void)_handleCancelButton:(id)a3;
- (void)_handleDoneButton:(id)a3;
- (void)_handleVendorVersion:(unsigned int)a3 completion:(id)a4;
- (void)_queryAllowsFullScreen:(id)a3;
- (void)_queryShouldShowCancelConfirmationWithResponseHandler:(id)a3 timeout:(double)a4;
- (void)_setupUndoProxy;
- (void)_updateBarButtonsWithUndoRedoVisible:(BOOL)a3;
- (void)dealloc;
- (void)handleRedoButton:(id)a3;
- (void)handleUndoButton:(id)a3;
- (void)loadRemoteViewControllerWithCompletionHandler:(id)a3;
- (void)loadView;
- (void)queryHandlingCapabilityForAdjustmentData:(id)a3 withResponseHandler:(id)a4 timeout:(double)a5;
- (void)setAllowsFullScreen:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidHandleCancel:(BOOL)a3;
- (void)setDidHandleDone:(BOOL)a3;
- (void)setDisablingIdleTimerToken:(id)a3;
- (void)setExtensionDidBeginContentEditing:(BOOL)a3;
- (void)setRedoBarButtonItem:(id)a3;
- (void)setRemoteViewController:(id)a3;
- (void)setRequest:(id)a3;
- (void)setShowUndoRedo:(BOOL)a3;
- (void)setShowUndoRedoButtons:(BOOL)a3;
- (void)setUndoBarButtonItem:(id)a3;
- (void)setUndoEnabled:(BOOL)a3 redoEnabled:(BOOL)a4;
- (void)setUndoProxy:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PUEditPluginHostViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_redoBarButtonItem);
  objc_destroyWeak((id *)&self->_undoBarButtonItem);
  objc_storeStrong((id *)&self->_undoProxy, 0);
  objc_storeStrong((id *)&self->_allowsFullScreen, 0);
  objc_storeStrong(&self->_disablingIdleTimerToken, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_plugin, 0);
}

- (void)setShowUndoRedoButtons:(BOOL)a3
{
  self->_showUndoRedoButtons = a3;
}

- (BOOL)showUndoRedoButtons
{
  return self->_showUndoRedoButtons;
}

- (void)setRedoBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)redoBarButtonItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_redoBarButtonItem);
  return (UIBarButtonItem *)WeakRetained;
}

- (void)setUndoBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)undoBarButtonItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_undoBarButtonItem);
  return (UIBarButtonItem *)WeakRetained;
}

- (void)setUndoProxy:(id)a3
{
}

- (PUEditingExtensionUndoProxyHostSide)undoProxy
{
  return self->_undoProxy;
}

- (void)setAllowsFullScreen:(id)a3
{
}

- (NSNumber)allowsFullScreen
{
  return self->_allowsFullScreen;
}

- (void)setDisablingIdleTimerToken:(id)a3
{
}

- (id)disablingIdleTimerToken
{
  return self->_disablingIdleTimerToken;
}

- (void)setDidHandleDone:(BOOL)a3
{
  self->_didHandleDone = a3;
}

- (BOOL)didHandleDone
{
  return self->_didHandleDone;
}

- (void)setDidHandleCancel:(BOOL)a3
{
  self->_didHandleCancel = a3;
}

- (BOOL)didHandleCancel
{
  return self->_didHandleCancel;
}

- (void)setExtensionDidBeginContentEditing:(BOOL)a3
{
  self->_extensionDidBeginContentEditing = a3;
}

- (BOOL)extensionDidBeginContentEditing
{
  return self->_extensionDidBeginContentEditing;
}

- (void)setRequest:(id)a3
{
}

- (NSCopying)request
{
  return (NSCopying *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setRemoteViewController:(id)a3
{
}

- (UIViewController)remoteViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setDelegate:(id)a3
{
}

- (PUEditPluginHostViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUEditPluginHostViewControllerDelegate *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (PUEditPluginHostViewControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (PUEditPluginHostViewControllerDataSource *)WeakRetained;
}

- (PUEditPlugin)plugin
{
  return self->_plugin;
}

- (void)handleRedoButton:(id)a3
{
  id v3 = [(PUEditPluginHostViewController *)self undoProxy];
  [v3 performRedo];
}

- (void)handleUndoButton:(id)a3
{
  id v3 = [(PUEditPluginHostViewController *)self undoProxy];
  [v3 performUndo];
}

- (void)setUndoEnabled:(BOOL)a3 redoEnabled:(BOOL)a4
{
}

void __61__PUEditPluginHostViewController_setUndoEnabled_redoEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) undoBarButtonItem];
  [v3 setEnabled:v2];

  uint64_t v4 = *(unsigned __int8 *)(a1 + 41);
  id v5 = [*(id *)(a1 + 32) redoBarButtonItem];
  [v5 setEnabled:v4];
}

- (void)setShowUndoRedo:(BOOL)a3
{
}

uint64_t __50__PUEditPluginHostViewController_setShowUndoRedo___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setShowUndoRedoButtons:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  return [v2 _updateBarButtonsWithUndoRedoVisible:v3];
}

- (void)_setupUndoProxy
{
  id v6 = (id)objc_opt_new();
  [(PUEditPluginHostViewController *)self setUndoProxy:v6];
  [v6 setTarget:self];
  uint64_t v3 = [(PUEditPluginHostViewController *)self _extensionVendorProxy];
  uint64_t v4 = [v6 listenerEndpoint];
  id v5 = +[PUPhotoEditProtoSettings sharedInstance];
  objc_msgSend(v3, "setupUndoProxyWithXPCListenerEndpoint:attemptUndoManagerAutoSetup:", v4, objc_msgSend(v5, "attemptEditExtensionUndoAutoSetup"));
}

- (void)_endDisablingIdleTimerIfNecessary
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PUEditPluginHostViewController.m" lineNumber:479 description:@"Must be on main thread"];
  }
  uint64_t v4 = [(PUEditPluginHostViewController *)self disablingIdleTimerToken];
  if (v4)
  {
    id v7 = v4;
    id v5 = [MEMORY[0x1E4F8FFA8] sharedState];
    [v5 endDisablingIdleTimer:v7];

    [(PUEditPluginHostViewController *)self setDisablingIdleTimerToken:0];
    uint64_t v4 = v7;
  }
}

- (void)_beginDisablingIdleTimer
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PUEditPluginHostViewController.m" lineNumber:471 description:@"Must be on main thread"];
  }
  uint64_t v4 = [(PUEditPluginHostViewController *)self disablingIdleTimerToken];

  if (!v4)
  {
    id v7 = [MEMORY[0x1E4F8FFA8] sharedState];
    id v5 = [v7 beginDisablingIdleTimerForReason:@"Editor (PUEditPluginHostViewController)"];
    [(PUEditPluginHostViewController *)self setDisablingIdleTimerToken:v5];
  }
}

- (void)_handleDoneButton:(id)a3
{
  if (![(PUEditPluginHostViewController *)self didHandleDone])
  {
    [(PUEditPluginHostViewController *)self setDidHandleDone:1];
    [(PUEditPluginHostViewController *)self _beginDisablingIdleTimer];
    uint64_t v4 = +[PUPhotoEditProtoSettings sharedInstance];
    uint64_t v5 = [v4 lightModeEditor];

    id v6 = [[PUProgressView alloc] initWithStyle:v5];
    id v7 = [(PUEditPluginHostViewController *)self view];
    [(PUProgressView *)v6 showInView:v7 animated:1 afterDelay:0.0];

    v8 = [(PUEditPluginHostViewController *)self _hostContext];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__PUEditPluginHostViewController__handleDoneButton___block_invoke;
    v10[3] = &unk_1E5F24F20;
    v10[4] = self;
    [v8 setContentEditingOutputCommitHandler:v10];
    v9 = [(PUEditPluginHostViewController *)self _extensionVendorProxy];
    [v9 finishContentEditing];
  }
}

void __52__PUEditPluginHostViewController__handleDoneButton___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PUEditPluginHostViewController__handleDoneButton___block_invoke_2;
  aBlock[3] = &unk_1E5F24ED0;
  id v7 = v6;
  aBlock[4] = *(void *)(a1 + 32);
  id v25 = v7;
  v8 = _Block_copy(aBlock);
  v9 = (void (**)(void, void, void))v8;
  if (v5)
  {
    v10 = [v5 adjustmentData];
    if (v10)
    {

LABEL_6:
      v15 = [*(id *)(a1 + 32) plugin];
      v16 = [v15 extension];
      v17 = [v16 _plugIn];
      v18 = [v17 containingUrl];

      [v5 setEditorBundleURL:v18];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__PUEditPluginHostViewController__handleDoneButton___block_invoke_291;
      block[3] = &unk_1E5F2EBC8;
      block[4] = *(void *)(a1 + 32);
      id v21 = v5;
      v22 = v9;
      dispatch_async(MEMORY[0x1E4F14428], block);

      goto LABEL_10;
    }
    v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    v12 = [v5 renderedContentURL];
    v13 = [v12 path];
    char v14 = [v11 fileExistsAtPath:v13];

    if (v14) {
      goto LABEL_6;
    }
    v19 = PLUIGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_DEFAULT, "Extension returned output with no changes to commit.", buf, 2u);
    }

    v9[2](v9, 1, 0);
  }
  else
  {
    (*((void (**)(void *, void, void))v8 + 2))(v8, 0, 0);
  }
LABEL_10:
}

void __52__PUEditPluginHostViewController__handleDoneButton___block_invoke_2(uint64_t a1, char a2, char a3)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__PUEditPluginHostViewController__handleDoneButton___block_invoke_3;
  v6[3] = &unk_1E5F2BD48;
  v6[4] = *(void *)(a1 + 32);
  char v7 = a2;
  char v8 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __52__PUEditPluginHostViewController__handleDoneButton___block_invoke_291(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dataSource];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__PUEditPluginHostViewController__handleDoneButton___block_invoke_2_292;
  v5[3] = &unk_1E5F24EF8;
  id v6 = *(id *)(a1 + 48);
  [v2 editPluginHostViewController:v3 commitContentEditingOutput:v4 withCompletionHandler:v5];
}

uint64_t __52__PUEditPluginHostViewController__handleDoneButton___block_invoke_2_292(uint64_t a1, uint64_t a2)
{
  if (a2) {
    NSLog(&cfstr_ErrorCommittin.isa, a2);
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

void __52__PUEditPluginHostViewController__handleDoneButton___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _endDisablingIdleTimerIfNecessary];
  if (*(unsigned char *)(a1 + 40))
  {
    int v2 = *(unsigned __int8 *)(a1 + 41);
    uint64_t v3 = [*(id *)(a1 + 32) delegate];
    if (v2) {
      uint64_t v4 = 3;
    }
    else {
      uint64_t v4 = 2;
    }
    objc_msgSend(v3, "editPluginHostViewController:didFinishWithCompletionType:", *(void *)(a1 + 32), v4, v3);
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4FB1418];
    id v6 = PULocalizedString(@"PLUGIN_OUTPUT_ERROR_TITLE");
    char v7 = PULocalizedString(@"PLUGIN_OUTPUT_ERROR_MESSAGE");
    char v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

    v9 = (void *)MEMORY[0x1E4FB1410];
    v10 = PULocalizedString(@"OK");
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__PUEditPluginHostViewController__handleDoneButton___block_invoke_4;
    v13[3] = &unk_1E5F2BF98;
    v13[4] = *(void *)(a1 + 32);
    v11 = [v9 actionWithTitle:v10 style:1 handler:v13];
    [v8 addAction:v11];

    [*(id *)(a1 + 32) presentViewController:v8 animated:1 completion:0];
  }
}

void __52__PUEditPluginHostViewController__handleDoneButton___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 editPluginHostViewController:*(void *)(a1 + 32) didFinishWithCompletionType:1];
}

- (void)_handleCancel
{
  [(PUEditPluginHostViewController *)self _endDisablingIdleTimerIfNecessary];
  uint64_t v3 = [(PUEditPluginHostViewController *)self _extensionVendorProxy];
  [v3 cancelContentEditingWithResponseHandler:&__block_literal_global_23660];

  id v4 = [(PUEditPluginHostViewController *)self delegate];
  [v4 editPluginHostViewController:self didFinishWithCompletionType:0];
}

- (void)_handleCancelButton:(id)a3
{
  id v4 = a3;
  if (![(PUEditPluginHostViewController *)self didHandleCancel])
  {
    [(PUEditPluginHostViewController *)self setDidHandleCancel:1];
    if ([(PUEditPluginHostViewController *)self extensionDidBeginContentEditing])
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __54__PUEditPluginHostViewController__handleCancelButton___block_invoke;
      v5[3] = &unk_1E5F2E1C0;
      void v5[4] = self;
      id v6 = v4;
      [(PUEditPluginHostViewController *)self _queryShouldShowCancelConfirmationWithResponseHandler:v5 timeout:2.0];
    }
    else
    {
      [(PUEditPluginHostViewController *)self _handleCancel];
    }
  }
}

void __54__PUEditPluginHostViewController__handleCancelButton___block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PUEditPluginHostViewController__handleCancelButton___block_invoke_2;
  block[3] = &unk_1E5F2DCD0;
  char v5 = a2;
  id v2 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __54__PUEditPluginHostViewController__handleCancelButton___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4FB1418]);
    uint64_t v3 = (void *)MEMORY[0x1E4FB1410];
    id v4 = PULocalizedString(@"CANCEL");
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __54__PUEditPluginHostViewController__handleCancelButton___block_invoke_3;
    v12[3] = &unk_1E5F2BF98;
    v12[4] = *(void *)(a1 + 32);
    char v5 = [v3 actionWithTitle:v4 style:1 handler:v12];
    [v2 addAction:v5];

    id v6 = (void *)MEMORY[0x1E4FB1410];
    char v7 = PULocalizedString(@"PHOTOEDIT_DISCARD_CHANGES");
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __54__PUEditPluginHostViewController__handleCancelButton___block_invoke_4;
    v11[3] = &unk_1E5F2BF98;
    v11[4] = *(void *)(a1 + 32);
    char v8 = [v6 actionWithTitle:v7 style:0 handler:v11];
    [v2 addAction:v8];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [v2 popoverPresentationController];
      [v9 setBarButtonItem:*(void *)(a1 + 40)];
    }
    [*(id *)(a1 + 32) presentViewController:v2 animated:1 completion:0];
  }
  else
  {
    v10 = *(void **)(a1 + 32);
    [v10 _handleCancel];
  }
}

uint64_t __54__PUEditPluginHostViewController__handleCancelButton___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDidHandleCancel:0];
}

uint64_t __54__PUEditPluginHostViewController__handleCancelButton___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCancel];
}

- (BOOL)prepareForDismissingForced:(BOOL)a3
{
  if (a3) {
    [(PUEditPluginHostViewController *)self _dismiss];
  }
  return 0;
}

- (int64_t)preferredUserInterfaceStyle
{
  id v2 = +[PUPhotoEditProtoSettings sharedInstance];
  if ([v2 lightModeEditor]) {
    int64_t v3 = 0;
  }
  else {
    int64_t v3 = 2;
  }

  return v3;
}

- (void)_updateBarButtonsWithUndoRedoVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v24[1] = *MEMORY[0x1E4F143B8];
  char v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__handleCancelButton_];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__handleDoneButton_];
  char v7 = [MEMORY[0x1E4F1CA48] arrayWithObject:v5];
  v24[0] = v6;
  char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  if (v3)
  {
    v9 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.uturn.backward.circle"];
    v10 = id v21 = v6;
    [v9 setImage:v10];

    objc_msgSend(v9, "setContentInsets:", 0.0, 4.0, 0.0, 4.0);
    v22 = v5;
    v11 = [MEMORY[0x1E4F90850] buttonWithWithCursorEffect:1 target:self action:sel_handleUndoButton_];
    [v11 setConfiguration:v9];
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v11];
    v13 = PULocalizedString(@"PLUGIN_UNDO_BUTTON_TITLE");
    [v12 setTitle:v13];

    [v12 setEnabled:0];
    char v14 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    v15 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.uturn.forward.circle"];
    [v14 setImage:v15];

    objc_msgSend(v14, "setContentInsets:", 0.0, 4.0, 0.0, 4.0);
    v16 = [MEMORY[0x1E4F90850] buttonWithWithCursorEffect:1 target:self action:sel_handleRedoButton_];
    [v16 setConfiguration:v14];
    v17 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v16];
    [v17 setEnabled:0];
    v23[0] = v12;
    v23[1] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    [v7 addObjectsFromArray:v18];

    char v5 = v22;
    [(PUEditPluginHostViewController *)self setUndoBarButtonItem:v12];
    [(PUEditPluginHostViewController *)self setRedoBarButtonItem:v17];

    id v6 = v21;
  }
  v19 = [(PUEditPluginHostViewController *)self navigationItem];
  [v19 setLeftBarButtonItems:v7 animated:1];

  v20 = [(PUEditPluginHostViewController *)self navigationItem];
  [v20 setRightBarButtonItems:v8 animated:1];
}

- (void)_dismiss
{
  BOOL v3 = [(PUEditPluginHostViewController *)self remoteViewController];
  id v8 = v3;
  if (v3)
  {
    if ([v3 isViewLoaded])
    {
      id v4 = [v8 view];
      [v4 removeFromSuperview];
    }
    [v8 removeFromParentViewController];
    [(PUEditPluginHostViewController *)self setRemoteViewController:0];
  }
  char v5 = [(PUEditPluginHostViewController *)self request];
  if (v5)
  {
    id v6 = [(PUEditPluginHostViewController *)self plugin];
    char v7 = [v6 extension];
    [v7 cancelExtensionRequestWithIdentifier:v5];

    [(PUEditPluginHostViewController *)self setRequest:0];
  }
}

- (id)_extensionVendorProxy
{
  id v2 = [(PUEditPluginHostViewController *)self _hostContext];
  BOOL v3 = [v2 _auxiliaryConnection];
  id v4 = [v3 remoteObjectProxy];

  return v4;
}

- (id)_hostContext
{
  id v4 = [(PUEditPluginHostViewController *)self plugin];
  char v5 = [v4 extension];
  id v6 = [(PUEditPluginHostViewController *)self request];
  char v7 = [v5 _extensionContextForUUID:v6];

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, self, @"PUEditPluginHostViewController.m", 294, @"unexpected class %@", v7 object file lineNumber description];
    }
  }
  return v7;
}

- (void)_addRemoteViewControllerIfNeededAllowingFullscreen:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(PUEditPluginHostViewController *)self remoteViewController];
  if (v5)
  {
    v36 = v5;
    int v6 = [(PUEditPluginHostViewController *)self isViewLoaded];
    char v5 = v36;
    if (v6)
    {
      char v7 = [v36 parentViewController];

      char v5 = v36;
      if (v7 != self)
      {
        [(PUEditPluginHostViewController *)self addChildViewController:v36];
        id v8 = [v36 view];
        v9 = [(PUEditPluginHostViewController *)self view];
        [v9 addSubview:v8];

        [v36 didMoveToParentViewController:self];
        v35 = _NSDictionaryOfVariableBindings(&cfstr_Remoteview.isa, v8, 0);
        [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
        v10 = [MEMORY[0x1E4F1CA48] array];
        v11 = [v8 centerXAnchor];
        id v12 = [(PUEditPluginHostViewController *)self view];
        v13 = [v12 centerXAnchor];
        char v14 = [v11 constraintEqualToAnchor:v13];

        LODWORD(v15) = 1148846080;
        [v14 setPriority:v15];
        v34 = v14;
        [v10 addObject:v14];
        v16 = [v8 leadingAnchor];
        v17 = [(PUEditPluginHostViewController *)self view];
        v18 = [v17 safeAreaLayoutGuide];
        v19 = [v18 leadingAnchor];
        v20 = [v16 constraintEqualToAnchor:v19];

        LODWORD(v21) = 1132068864;
        [v20 setPriority:v21];
        [v10 addObject:v20];
        v22 = [v8 trailingAnchor];
        v23 = [(PUEditPluginHostViewController *)self view];
        v24 = [v23 safeAreaLayoutGuide];
        id v25 = [v24 trailingAnchor];
        v26 = [v22 constraintEqualToAnchor:v25];

        LODWORD(v27) = 1132068864;
        [v26 setPriority:v27];
        [v10 addObject:v26];
        if (v3)
        {
          v28 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[remoteView]|" options:0 metrics:0 views:v35];
          [v10 addObjectsFromArray:v28];
        }
        else
        {
          v29 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-[remoteView]" options:0 metrics:0 views:v35];
          [v10 addObjectsFromArray:v29];

          v28 = [v8 bottomAnchor];
          v30 = [(PUEditPluginHostViewController *)self view];
          v31 = [v30 safeAreaLayoutGuide];
          v32 = [v31 bottomAnchor];
          v33 = [v28 constraintEqualToAnchor:v32];
          [v10 addObject:v33];
        }
        [MEMORY[0x1E4F28DC8] activateConstraints:v10];

        char v5 = v36;
      }
    }
  }
}

- (void)_beginContentEditingWithCompletionHandler:(id)a3 timeout:(double)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  int v22 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__PUEditPluginHostViewController__beginContentEditingWithCompletionHandler_timeout___block_invoke;
  aBlock[3] = &unk_1E5F24EA8;
  v20 = v21;
  id v7 = v6;
  id v19 = v7;
  id v8 = _Block_copy(aBlock);
  v9 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v23 = *MEMORY[0x1E4F28568];
  v24[0] = @"extension connection lost";
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  v11 = [v9 errorWithDomain:*MEMORY[0x1E4F281F8] code:4099 userInfo:v10];

  id v12 = [(PUEditPluginHostViewController *)self _extensionVendorProxy];
  v13 = v12;
  if (v12)
  {
    [v12 beginContentEditingWithCompletionHandler:v8];
    dispatch_time_t v14 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__PUEditPluginHostViewController__beginContentEditingWithCompletionHandler_timeout___block_invoke_3;
    block[3] = &unk_1E5F2EA60;
    id v17 = v8;
    id v16 = v11;
    dispatch_after(v14, MEMORY[0x1E4F14428], block);
  }
  else
  {
    (*((void (**)(void *, void *))v8 + 2))(v8, v11);
  }

  _Block_object_dispose(v21, 8);
}

void __84__PUEditPluginHostViewController__beginContentEditingWithCompletionHandler_timeout___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = 0;
  atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 40) + 8) + 24), (unsigned int *)&v4, 1u);
  if (!v4)
  {
    char v5 = *(void **)(a1 + 32);
    if (v5)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __84__PUEditPluginHostViewController__beginContentEditingWithCompletionHandler_timeout___block_invoke_2;
      v6[3] = &unk_1E5F2EA60;
      id v8 = v5;
      id v7 = v3;
      dispatch_async(MEMORY[0x1E4F14428], v6);
    }
  }
}

uint64_t __84__PUEditPluginHostViewController__beginContentEditingWithCompletionHandler_timeout___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __84__PUEditPluginHostViewController__beginContentEditingWithCompletionHandler_timeout___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_queryShouldShowCancelConfirmationWithResponseHandler:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  id v7 = [(PUEditPluginHostViewController *)self _extensionVendorProxy];
  if (v7)
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    int v17 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __96__PUEditPluginHostViewController__queryShouldShowCancelConfirmationWithResponseHandler_timeout___block_invoke;
    aBlock[3] = &unk_1E5F24E80;
    double v15 = v16;
    id v14 = v6;
    id v8 = _Block_copy(aBlock);
    [v7 queryShouldShowCancelConfirmationWithResponseHandler:v8];
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96__PUEditPluginHostViewController__queryShouldShowCancelConfirmationWithResponseHandler_timeout___block_invoke_2;
    block[3] = &unk_1E5F2EBA0;
    id v12 = v8;
    id v10 = v8;
    dispatch_after(v9, MEMORY[0x1E4F14428], block);

    _Block_object_dispose(v16, 8);
  }
  else if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

uint64_t __96__PUEditPluginHostViewController__queryShouldShowCancelConfirmationWithResponseHandler_timeout___block_invoke(uint64_t result)
{
  int v1 = 0;
  atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(*(void *)(result + 40) + 8) + 24), (unsigned int *)&v1, 1u);
  if (!v1) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __96__PUEditPluginHostViewController__queryShouldShowCancelConfirmationWithResponseHandler_timeout___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)queryHandlingCapabilityForAdjustmentData:(id)a3 withResponseHandler:(id)a4 timeout:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(PUEditPluginHostViewController *)self _extensionVendorProxy];
  if (v10)
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    int v20 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __103__PUEditPluginHostViewController_queryHandlingCapabilityForAdjustmentData_withResponseHandler_timeout___block_invoke;
    aBlock[3] = &unk_1E5F24E80;
    v18 = v19;
    id v17 = v9;
    v11 = _Block_copy(aBlock);
    [v10 queryHandlingCapabilityForAdjustmentData:v8 withResponseHandler:v11];
    dispatch_time_t v12 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __103__PUEditPluginHostViewController_queryHandlingCapabilityForAdjustmentData_withResponseHandler_timeout___block_invoke_2;
    block[3] = &unk_1E5F2EBA0;
    id v15 = v11;
    id v13 = v11;
    dispatch_after(v12, MEMORY[0x1E4F14428], block);

    _Block_object_dispose(v19, 8);
  }
  else if (v9)
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

uint64_t __103__PUEditPluginHostViewController_queryHandlingCapabilityForAdjustmentData_withResponseHandler_timeout___block_invoke(uint64_t result)
{
  int v1 = 0;
  atomic_compare_exchange_strong((atomic_uint *volatile)(*(void *)(*(void *)(result + 40) + 8) + 24), (unsigned int *)&v1, 1u);
  if (!v1) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __103__PUEditPluginHostViewController_queryHandlingCapabilityForAdjustmentData_withResponseHandler_timeout___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleVendorVersion:(unsigned int)a3 completion:(id)a4
{
  id v10 = a4;
  unsigned int v6 = a3 >> 9;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = [NSNumber numberWithBool:v6 > 0x580];
  [(PUEditPluginHostViewController *)v7 setAllowsFullScreen:v8];

  objc_sync_exit(v7);
  id v9 = v10;
  if (v10)
  {
    (*((void (**)(id, BOOL))v10 + 2))(v10, v6 > 0x580);
    id v9 = v10;
  }
}

- (void)_queryAllowsFullScreen:(id)a3
{
  int v4 = (void (**)(id, uint64_t))a3;
  char v5 = self;
  objc_sync_enter(v5);
  unsigned int v6 = [(PUEditPluginHostViewController *)v5 allowsFullScreen];
  objc_sync_exit(v5);

  if (v6)
  {
    if (v4) {
      v4[2](v4, [v6 BOOLValue]);
    }
  }
  else
  {
    id v7 = [(PUEditPluginHostViewController *)v5 _extensionVendorProxy];
    objc_initWeak(&location, v5);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__PUEditPluginHostViewController__queryAllowsFullScreen___block_invoke;
    v8[3] = &unk_1E5F24E58;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    [v7 querySDKVersionWithResponseHandler:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __57__PUEditPluginHostViewController__queryAllowsFullScreen___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleVendorVersion:a2 completion:*(void *)(a1 + 32)];
}

- (void)loadRemoteViewControllerWithCompletionHandler:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PUEditPluginHostViewController.m", 103, @"Invalid parameter not satisfying: %@", @"completionHandler != nil" object file lineNumber description];
  }
  unsigned int v6 = [(PUEditPluginHostViewController *)self plugin];
  id v7 = [v6 extension];

  objc_initWeak(&location, self);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke;
  v22[3] = &unk_1E5F24D40;
  objc_copyWeak(&v23, &location);
  objc_msgSend(v7, "set_requestPostCompletionBlock:", v22);
  id v8 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__23713;
  v20[4] = __Block_byref_object_dispose__23714;
  id v21 = 0;
  uint64_t v9 = *MEMORY[0x1E4F39A08];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_212;
  void v19[3] = &unk_1E5F24D90;
  v19[4] = v20;
  [v8 registerItemForTypeIdentifier:v9 loadHandler:v19];
  id v10 = objc_alloc_init(MEMORY[0x1E4F28C80]);
  v26[0] = v8;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  [v10 setAttachments:v11];

  id v25 = v10;
  dispatch_time_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_3;
  v15[3] = &unk_1E5F24E30;
  id v13 = v5;
  v15[4] = self;
  id v16 = v13;
  id v17 = v20;
  SEL v18 = a2;
  [v7 instantiateViewControllerWithInputItems:v12 listenerEndpoint:0 connectionHandler:v15];

  _Block_object_dispose(v20, 8);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setRequest:0];

  v5[2]();
}

void __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_212(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v5 = *MEMORY[0x1E4F39A08];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E5F24D68;
  id v8 = v3;
  id v6 = v3;
  [v4 loadItemForTypeIdentifier:v5 options:0 completionHandler:v7];
}

void __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v8)
  {
    NSLog(&cfstr_ErrorInstantia.isa, v8);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) setRequest:a2];
    [*(id *)(a1 + 32) _setupUndoProxy];
    id v10 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_4;
    v15[3] = &unk_1E5F24E08;
    v15[4] = v10;
    id v11 = v7;
    uint64_t v12 = *(void *)(a1 + 56);
    id v16 = v11;
    uint64_t v18 = v12;
    long long v14 = *(_OWORD *)(a1 + 40);
    id v13 = (id)v14;
    long long v17 = v14;
    [v10 _queryAllowsFullScreen:v15];
  }
}

void __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_4(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_5;
  block[3] = &unk_1E5F24DE0;
  int v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v4;
  char v13 = a2;
  uint64_t v6 = *(void *)(a1 + 64);
  id v10 = v5;
  uint64_t v12 = v6;
  long long v8 = *(_OWORD *)(a1 + 48);
  id v7 = (id)v8;
  long long v11 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setRemoteViewController:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _addRemoteViewControllerIfNeededAllowingFullscreen:*(unsigned __int8 *)(a1 + 72)];
  id v2 = [*(id *)(a1 + 32) dataSource];
  if (!v2)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"PUEditPluginHostViewController.m" lineNumber:140 description:@"dataSource must be set"];
  }
  uint64_t v3 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_6;
  v7[3] = &unk_1E5F24DB8;
  void v7[4] = v3;
  long long v6 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v6;
  long long v8 = v6;
  [v2 editPluginHostViewController:v3 loadItemProviderWithHandler:v7];
}

void __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  id v5 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_7;
  v6[3] = &unk_1E5F2A470;
  void v6[4] = v5;
  id v7 = *(id *)(a1 + 40);
  [v5 _beginContentEditingWithCompletionHandler:v6 timeout:10.0];
}

void __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_8;
  block[3] = &unk_1E5F2EBC8;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_8(uint64_t a1)
{
  if (!*(void *)(a1 + 32)) {
    [*(id *)(a1 + 40) setExtensionDidBeginContentEditing:1];
  }
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

uint64_t __80__PUEditPluginHostViewController_loadRemoteViewControllerWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUEditPluginHostViewController;
  [(PUEditPluginHostViewController *)&v6 viewDidDisappear:a3];
  if (([(PUEditPluginHostViewController *)self isBeingDismissed] & 1) != 0
    || ([(PUEditPluginHostViewController *)self navigationController],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isBeingDismissed],
        v4,
        v5))
  {
    [(PUEditPluginHostViewController *)self _dismiss];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUEditPluginHostViewController;
  -[PUEditPluginHostViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  [(UIViewController *)self pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:v3];
  int v5 = [(PUEditPluginHostViewController *)self allowsFullScreen];
  -[PUEditPluginHostViewController _addRemoteViewControllerIfNeededAllowingFullscreen:](self, "_addRemoteViewControllerIfNeededAllowingFullscreen:", [v5 BOOLValue]);
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)loadView
{
  v9.receiver = self;
  v9.super_class = (Class)PUEditPluginHostViewController;
  [(PUEditPluginHostViewController *)&v9 loadView];
  BOOL v3 = [(PUEditPluginHostViewController *)self view];
  uint64_t v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  int v5 = [(PUEditPluginHostViewController *)self plugin];
  objc_super v6 = [v5 title];

  [(PUEditPluginHostViewController *)self setTitle:v6];
  [(PUEditPluginHostViewController *)self _updateBarButtonsWithUndoRedoVisible:[(PUEditPluginHostViewController *)self showUndoRedoButtons]];
  id v7 = [(PUEditPluginHostViewController *)self _hostContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__PUEditPluginHostViewController_loadView__block_invoke;
  v8[3] = &unk_1E5F2CEE8;
  void v8[4] = self;
  [v7 setHideNavigationControllerHandler:v8];
}

uint64_t __42__PUEditPluginHostViewController_loadView__block_invoke()
{
  return px_dispatch_on_main_queue();
}

void __42__PUEditPluginHostViewController_loadView__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) navigationController];
  [v2 setNavigationBarHidden:v1];
}

- (void)dealloc
{
  [(PUEditPluginHostViewController *)self _endDisablingIdleTimerIfNecessary];
  v3.receiver = self;
  v3.super_class = (Class)PUEditPluginHostViewController;
  [(PUEditPluginHostViewController *)&v3 dealloc];
}

- (PUEditPluginHostViewController)initWithPlugin:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUEditPluginHostViewController;
  objc_super v6 = [(PUEditPluginHostViewController *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_plugin, a3);
  }

  return v7;
}

@end