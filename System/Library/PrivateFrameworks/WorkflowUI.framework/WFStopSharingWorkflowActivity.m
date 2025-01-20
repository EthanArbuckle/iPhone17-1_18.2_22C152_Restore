@interface WFStopSharingWorkflowActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (WFCloudKitTask)unshareTask;
- (WFSharedShortcut)shortcut;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (id)activityViewController;
- (void)prepareWithActivityItems:(id)a3;
- (void)setShortcut:(id)a3;
- (void)setUnshareTask:(id)a3;
@end

@implementation WFStopSharingWorkflowActivity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unshareTask, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);
}

- (void)setUnshareTask:(id)a3
{
}

- (WFCloudKitTask)unshareTask
{
  return self->_unshareTask;
}

- (void)setShortcut:(id)a3
{
}

- (WFSharedShortcut)shortcut
{
  return self->_shortcut;
}

- (id)activityViewController
{
  v3 = WFLocalizedString(@"Stop Sharing");
  v4 = (void *)MEMORY[0x263F82418];
  v5 = WFLocalizedString(@"Are you sure you want to stop sharing this shortcut? The iCloud link will be deleted and will no longer work within a few minutes.");
  v6 = [v4 alertControllerWithTitle:v3 message:v5 preferredStyle:1];

  v7 = (void *)MEMORY[0x263F82400];
  v8 = WFLocalizedString(@"Cancel");
  v9 = [v7 actionWithTitle:v8 style:1 handler:0];
  [v6 addAction:v9];

  v10 = (void *)MEMORY[0x263F82400];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke;
  v18 = &unk_2649CB888;
  id v11 = v6;
  id v19 = v11;
  v20 = self;
  v12 = [v10 _actionWithTitle:v3 descriptiveText:0 image:0 style:2 handler:&v15 shouldDismissHandler:&__block_literal_global_201];
  objc_msgSend(v11, "addAction:", v12, v15, v16, v17, v18);
  id v13 = v11;

  return v13;
}

void __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setTitle:0];
  [*(id *)(a1 + 32) setMessage:0];
  [*(id *)(a1 + 32) _setActions:MEMORY[0x263EFFA68]];
  v2 = objc_alloc_init(WFActivityProgressViewController);
  [*(id *)(a1 + 32) setContentViewController:v2];
  v3 = [MEMORY[0x263F86BA8] sharedManager];
  v4 = [*(id *)(a1 + 40) shortcut];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke_2;
  v13[3] = &unk_2649CB838;
  v14 = v2;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v15 = v5;
  uint64_t v16 = v6;
  v7 = v2;
  v8 = [v3 unshareSharedShortcut:v4 completionHandler:v13];
  [*(id *)(a1 + 40) setUnshareTask:v8];

  v9 = (void *)MEMORY[0x263F82400];
  v10 = WFLocalizedString(@"Cancel");
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke_8;
  v12[3] = &unk_2649CB860;
  v12[4] = *(void *)(a1 + 40);
  id v11 = [v9 actionWithTitle:v10 style:1 handler:v12];

  [*(id *)(a1 + 32) addAction:v11];
}

uint64_t __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke_9()
{
  return 0;
}

void __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke_3;
  v7[3] = &unk_2649CB810;
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v10 = v4;
  uint64_t v11 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke_8(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) unshareTask];
  [v2 cancel];

  id v3 = *(void **)(a1 + 32);
  return [v3 activityDidFinish:0];
}

void __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    [*(id *)(a1 + 40) setState:1];
    uint64_t v5 = [*(id *)(a1 + 48) actions];
    [v5 enumerateObjectsUsingBlock:&__block_literal_global_14958];

    dispatch_time_t v6 = dispatch_time(0, 900000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke_5;
    block[3] = &unk_2649CBF20;
    block[4] = *(void *)(a1 + 56);
    dispatch_after(v6, MEMORY[0x263EF83A0], block);
    return;
  }
  if (objc_msgSend(v2, "wf_isUserCancelledError")) {
    return;
  }
  id v3 = [*(id *)(a1 + 32) domain];
  if (([v3 isEqualToString:*MEMORY[0x263EFD498]] & 1) == 0)
  {

    goto LABEL_8;
  }
  uint64_t v4 = [*(id *)(a1 + 32) code];

  if (v4 != 20)
  {
LABEL_8:
    v7 = (void *)MEMORY[0x263F336E8];
    uint64_t v8 = *(void *)(a1 + 32);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke_6;
    v14[3] = &unk_2649CC018;
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    id v15 = v9;
    uint64_t v16 = v10;
    uint64_t v11 = [v7 alertWithError:v8 confirmationHandler:v14];
    v12 = [*(id *)(a1 + 48) presentingViewController];
    id v13 = WFUserInterfaceFromViewController();

    [v13 presentAlert:v11];
  }
}

uint64_t __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) activityDidFinish:1];
}

uint64_t __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke_6(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke_7;
  v3[3] = &unk_2649CBF20;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 dismissViewControllerAnimated:1 completion:v3];
}

uint64_t __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) activityDidFinish:0];
}

uint64_t __55__WFStopSharingWorkflowActivity_activityViewController__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setEnabled:0];
}

- (void)prepareWithActivityItems:(id)a3
{
  id v4 = a3;
  id v6 = [v4 objectsMatchingClass:objc_opt_class()];

  uint64_t v5 = [v6 firstObject];
  [(WFStopSharingWorkflowActivity *)self setShortcut:v5];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectsMatchingClass:objc_opt_class()];

  LOBYTE(v3) = [v4 count] != 0;
  return (char)v3;
}

- (id)_systemImageName
{
  return @"icloud.slash";
}

- (id)activityTitle
{
  return WFLocalizedString(@"Stop Sharing");
}

- (id)activityType
{
  return @"com.apple.shortcuts.Activity.StopSharing";
}

@end