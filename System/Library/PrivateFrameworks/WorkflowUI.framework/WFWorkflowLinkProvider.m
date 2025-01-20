@interface WFWorkflowLinkProvider
- (NSString)exclusiveActivityType;
- (WFWorkflowLinkProvider)initWithWorkflow:(id)a3 userInterface:(id)a4;
- (id)item;
- (id)shareShortcutEventForActivityType:(id)a3;
- (void)generateItemURL;
- (void)setExclusiveActivityType:(id)a3;
@end

@implementation WFWorkflowLinkProvider

- (void).cxx_destruct
{
}

- (void)setExclusiveActivityType:(id)a3
{
}

- (NSString)exclusiveActivityType
{
  return self->_exclusiveActivityType;
}

- (id)item
{
  v3 = [(UIActivityItemProvider *)self activityType];
  v4 = WFLocalizedString(@"Check out the shortcut I built!");
  uint64_t v5 = *MEMORY[0x263F6BD28];
  if ([v3 isEqualToString:*MEMORY[0x263F6BD28]])
  {
    uint64_t v6 = WFLocalizedString(@"Check out the shortcut I built! #SiriShortcuts");

    v4 = (void *)v6;
  }
  else if (([v3 isEqualToString:@"is.workflow.activity.homescreen"] & 1) != 0 {
         || ([v3 isEqualToString:@"is.workflow.activity.launchcenter"] & 1) != 0
  }
         || ([v3 isEqualToString:@"is.workflow.activity.submit"] & 1) != 0
         || ([v3 isEqualToString:@"is.workflow.my.filesharer"] & 1) != 0
         || ([v3 isEqualToString:@"is.workflow.my.fileduplicator"] & 1) != 0)
  {
    goto LABEL_14;
  }
  v7 = +[WFReportShortcutActivity activityType];
  char v8 = [v3 isEqualToString:v7];

  if (v8)
  {
LABEL_14:
    v13 = 0;
    goto LABEL_23;
  }
  v9 = [(WFWorkflowLinkProvider *)self exclusiveActivityType];
  v10 = v9;
  if (!v9 || [v9 isEqualToString:v3])
  {
    v18.receiver = self;
    v18.super_class = (Class)WFWorkflowLinkProvider;
    v11 = [(WFWorkflowItemProvider *)&v18 item];
    if (!v11)
    {
      v13 = 0;
LABEL_21:

      goto LABEL_22;
    }
    if (!v10)
    {
      if (([v3 isEqualToString:*MEMORY[0x263F6BD00]] & 1) != 0
        || [v3 isEqualToString:v5])
      {
        id v12 = [NSString stringWithFormat:@"%@ %@", v4, v11];
        goto LABEL_20;
      }
      if ([v3 isEqualToString:*MEMORY[0x263F6BCF0]])
      {
        v15 = NSString;
        v16 = [(WFWorkflowItemProvider *)self workflow];
        v17 = [v16 name];
        v13 = [v15 stringWithFormat:@"<html><body>%@ <a href=\"%@\">%@</a></body></html>", v4, v11, v17];

        goto LABEL_21;
      }
    }
    id v12 = v11;
LABEL_20:
    v13 = v12;
    goto LABEL_21;
  }
  v13 = 0;
LABEL_22:

LABEL_23:
  return v13;
}

- (void)generateItemURL
{
  dispatch_assert_queue_not_V2(MEMORY[0x263EF83A0]);
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v4 = [(UIActivityItemProvider *)self activityType];
  uint64_t v5 = WFLocalizedString(@"Create iCloud Link");
  uint64_t v6 = WFLocalizedString(@"Anyone with access to this shared link will be able to view the contents of this shortcut.");
  if ([v4 isEqualToString:@"is.workflow.my.linkcopier"]) {
    v7 = @"Copy Link";
  }
  else {
    v7 = @"Share";
  }
  char v8 = WFLocalizedString(v7);
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  v9 = [MEMORY[0x263F336E8] alertWithPreferredStyle:0];
  [v9 setTitle:v5];
  [v9 setMessage:v6];
  v10 = (void *)MEMORY[0x263F336F0];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __41__WFWorkflowLinkProvider_generateItemURL__block_invoke;
  v23[3] = &unk_2649CBF20;
  v11 = v3;
  v24 = v11;
  id v12 = [v10 cancelButtonWithHandler:v23];
  [v9 addButton:v12];

  v13 = (void *)MEMORY[0x263F336F0];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __41__WFWorkflowLinkProvider_generateItemURL__block_invoke_2;
  v20[3] = &unk_2649CBF98;
  v22 = &v25;
  v14 = v11;
  v21 = v14;
  v15 = [v13 buttonWithTitle:v8 style:0 preferred:1 handler:v20];
  [v9 addButton:v15];

  v16 = [(WFWorkflowItemProvider *)self userInterface];
  [v16 presentAlert:v9];

  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  if (*((unsigned char *)v26 + 24))
  {
    v18.receiver = self;
    v18.super_class = (Class)WFWorkflowLinkProvider;
    [(WFWorkflowItemProvider *)&v18 generateItemURL];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__WFWorkflowLinkProvider_generateItemURL__block_invoke_3;
    block[3] = &unk_2649CBF20;
    block[4] = self;
    v17 = (void *)MEMORY[0x263EF83A0];
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  _Block_object_dispose(&v25, 8);
}

intptr_t __41__WFWorkflowLinkProvider_generateItemURL__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __41__WFWorkflowLinkProvider_generateItemURL__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __41__WFWorkflowLinkProvider_generateItemURL__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (id)shareShortcutEventForActivityType:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFWorkflowLinkProvider;
  dispatch_semaphore_t v3 = [(WFWorkflowItemProvider *)&v5 shareShortcutEventForActivityType:a3];
  [v3 setSharingMode:*MEMORY[0x263F87430]];
  return v3;
}

- (WFWorkflowLinkProvider)initWithWorkflow:(id)a3 userInterface:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = WFGallerySharingURLForIdentifier();
  v15.receiver = self;
  v15.super_class = (Class)WFWorkflowLinkProvider;
  v9 = [(WFWorkflowItemProvider *)&v15 initWithWorkflow:v6 userInterface:v7 placeholderItem:v8];

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x263F86E88]);
    v11 = objc_opt_new();
    id v12 = (void *)[v10 initWithWorkflow:v6 sharingOptions:v11];
    [(WFWorkflowItemProvider *)v9 setShortcutExporter:v12];

    v13 = v9;
  }

  return v9;
}

@end