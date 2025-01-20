@interface WFWorkflowItemProvider
- (BOOL)hasWorkflowURL;
- (BOOL)shouldShowSuccessCheckmark;
- (NSURL)workflowURL;
- (WFShortcutExporter)shortcutExporter;
- (WFUserInterfaceHost)userInterface;
- (WFWorkflow)workflow;
- (WFWorkflowItemProvider)initWithWorkflow:(id)a3 userInterface:(id)a4 placeholderItem:(id)a5;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)item;
- (id)shareShortcutEventForActivityType:(id)a3;
- (void)generateItemURL;
- (void)setShortcutExporter:(id)a3;
- (void)setShouldShowSuccessCheckmark:(BOOL)a3;
- (void)setWorkflowURL:(id)a3;
@end

@implementation WFWorkflowItemProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInterface, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_storeStrong((id *)&self->_shortcutExporter, 0);
  objc_storeStrong((id *)&self->_workflowURL, 0);
}

- (void)setShouldShowSuccessCheckmark:(BOOL)a3
{
  self->_shouldShowSuccessCheckmark = a3;
}

- (BOOL)shouldShowSuccessCheckmark
{
  return self->_shouldShowSuccessCheckmark;
}

- (WFUserInterfaceHost)userInterface
{
  return self->_userInterface;
}

- (WFWorkflow)workflow
{
  return self->_workflow;
}

- (void)setShortcutExporter:(id)a3
{
}

- (WFShortcutExporter)shortcutExporter
{
  return self->_shortcutExporter;
}

- (void)setWorkflowURL:(id)a3
{
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x263F854B8]);
  v5 = [(WFWorkflowItemProvider *)self workflow];
  v6 = [v5 icon];
  v7 = (void *)[v4 initWithIcon:v6];

  [v7 setRounded:0];
  v8 = objc_msgSend(v7, "imageWithSize:", 40.0, 40.0);
  v9 = [v8 UIImage];

  v10 = objc_opt_new();
  v11 = [(WFWorkflowItemProvider *)self workflow];
  v12 = [v11 name];
  [v10 setTitle:v12];

  v13 = (void *)[objc_alloc(MEMORY[0x263F088E0]) initWithObject:v9];
  [v10 setIconProvider:v13];

  return v10;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  v5 = NSString;
  v6 = WFLocalizedString(@"Shortcut: %@");
  v7 = [(WFWorkflowItemProvider *)self workflow];
  v8 = [v7 name];
  v9 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v8);

  return v9;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  if (a5.width >= a5.height) {
    double height = a5.height;
  }
  else {
    double height = a5.width;
  }
  v6 = (void *)MEMORY[0x263F854B8];
  v7 = [(WFWorkflowItemProvider *)self workflow];
  v8 = [v7 icon];
  v9 = objc_msgSend(v6, "imageWithIcon:size:", v8, height, height);
  v10 = [v9 UIImage];

  return v10;
}

- (id)item
{
  v3 = [(UIActivityItemProvider *)self activityType];
  -[WFWorkflowItemProvider setShouldShowSuccessCheckmark:](self, "setShouldShowSuccessCheckmark:", [v3 isEqualToString:@"is.workflow.my.linkcopier"]);
  id v4 = [(WFWorkflowItemProvider *)self workflowURL];
  if (v4)
  {
    v5 = [(WFWorkflowItemProvider *)self shareShortcutEventForActivityType:v3];
    [v5 track];
    id v6 = v4;
  }
  return v4;
}

- (id)shareShortcutEventForActivityType:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F86E60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = [(WFWorkflowItemProvider *)self workflow];
  v8 = [v7 actions];
  objc_msgSend(v6, "setActionCount:", objc_msgSend(v8, "count"));

  v9 = [(WFWorkflowItemProvider *)self workflow];
  v10 = [v9 associatedAppBundleIdentifier];
  [v6 setAddToSiriBundleIdentifier:v10];

  v11 = [(WFWorkflowItemProvider *)self workflow];
  v12 = [v11 galleryIdentifier];
  [v6 setGalleryIdentifier:v12];

  [v6 setSharingDestinationBundleIdentifier:v5];
  return v6;
}

- (void)generateItemURL
{
  v3 = MEMORY[0x263EF83A0];
  dispatch_assert_queue_not_V2(MEMORY[0x263EF83A0]);
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__18375;
  v18[4] = __Block_byref_object_dispose__18376;
  id v19 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__WFWorkflowItemProvider_generateItemURL__block_invoke;
  block[3] = &unk_2649CBF48;
  v17 = v18;
  block[4] = self;
  id v5 = v4;
  v16 = v5;
  dispatch_async(v3, block);

  id v6 = [(WFWorkflowItemProvider *)self shortcutExporter];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __41__WFWorkflowItemProvider_generateItemURL__block_invoke_4;
  v13[3] = &unk_2649CBF70;
  v13[4] = self;
  v7 = v5;
  v14 = v7;
  [v6 exportWorkflowWithCompletion:v13];

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if ([(WFWorkflowItemProvider *)self shouldShowSuccessCheckmark] && self->_workflowURL)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __41__WFWorkflowItemProvider_generateItemURL__block_invoke_7;
    v12[3] = &unk_2649CC0B8;
    v12[4] = v18;
    v8 = (void *)MEMORY[0x263EF83A0];
    dispatch_async(MEMORY[0x263EF83A0], v12);

    dispatch_time_t v9 = dispatch_time(0, 1000000000);
    dispatch_semaphore_wait(v7, v9);
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __41__WFWorkflowItemProvider_generateItemURL__block_invoke_8;
  v11[3] = &unk_2649CBF98;
  v11[4] = self;
  v11[5] = v18;
  v10 = (void *)MEMORY[0x263EF83A0];
  dispatch_async(MEMORY[0x263EF83A0], v11);

  _Block_object_dispose(v18, 8);
}

void __41__WFWorkflowItemProvider_generateItemURL__block_invoke(uint64_t a1)
{
  v2 = [[WFActivityProgressController alloc] initWithTitle:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_semaphore_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(a1 + 32) userInterface];
  id v6 = v5;
  if (v5)
  {
    if ([v5 conformsToProtocol:&unk_26E252F50]) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  dispatch_time_t v9 = [v8 viewController];

  if (v9)
  {
    v10 = [v8 viewController];
    v11 = [v10 presentedViewController];

    if (v11)
    {
      do
      {
        v12 = [v10 presentedViewController];

        v13 = [v12 presentedViewController];

        v10 = v12;
      }
      while (v13);
    }
    else
    {
      v12 = v10;
    }
    v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __41__WFWorkflowItemProvider_generateItemURL__block_invoke_2;
    v16[3] = &unk_2649CC018;
    v15 = *(void **)(a1 + 40);
    v16[4] = *(void *)(a1 + 32);
    id v17 = v15;
    [v14 presentFrom:v12 cancellationHandler:v16];
  }
}

void __41__WFWorkflowItemProvider_generateItemURL__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v5 = (void *)MEMORY[0x263F336E8];
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    v12 = __41__WFWorkflowItemProvider_generateItemURL__block_invoke_5;
    v13 = &unk_2649CC018;
    id v6 = *(void **)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = v6;
    v7 = [v5 alertWithError:a3 confirmationHandler:&v10];
    id v8 = objc_msgSend(*(id *)(a1 + 32), "userInterface", v10, v11, v12, v13, v14);
    [v8 presentAlert:v7];
  }
  else
  {
    [*(id *)(a1 + 32) setWorkflowURL:a2];
    dispatch_time_t v9 = *(NSObject **)(a1 + 40);
    dispatch_semaphore_signal(v9);
  }
}

uint64_t __41__WFWorkflowItemProvider_generateItemURL__block_invoke_7(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setState:1];
}

uint64_t __41__WFWorkflowItemProvider_generateItemURL__block_invoke_8(uint64_t a1)
{
  v1 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __41__WFWorkflowItemProvider_generateItemURL__block_invoke_9;
  v3[3] = &unk_2649CBF20;
  v3[4] = *(void *)(a1 + 32);
  return [v1 dismissWithCompletion:v3];
}

uint64_t __41__WFWorkflowItemProvider_generateItemURL__block_invoke_9(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) hasWorkflowURL];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 cancel];
  }
  return result;
}

intptr_t __41__WFWorkflowItemProvider_generateItemURL__block_invoke_5(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__WFWorkflowItemProvider_generateItemURL__block_invoke_6;
  block[3] = &unk_2649CBF20;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __41__WFWorkflowItemProvider_generateItemURL__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

intptr_t __41__WFWorkflowItemProvider_generateItemURL__block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__WFWorkflowItemProvider_generateItemURL__block_invoke_3;
  block[3] = &unk_2649CBF20;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __41__WFWorkflowItemProvider_generateItemURL__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (BOOL)hasWorkflowURL
{
  return self->_workflowURL != 0;
}

- (NSURL)workflowURL
{
  workflowURL = self->_workflowURL;
  if (!workflowURL)
  {
    [(WFWorkflowItemProvider *)self generateItemURL];
    workflowURL = self->_workflowURL;
  }
  return workflowURL;
}

- (WFWorkflowItemProvider)initWithWorkflow:(id)a3 userInterface:(id)a4 placeholderItem:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFWorkflowItemProvider;
  uint64_t v11 = [(UIActivityItemProvider *)&v15 initWithPlaceholderItem:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_workflow, a3);
    objc_storeStrong((id *)&v12->_userInterface, a4);
    v13 = v12;
  }

  return v12;
}

@end