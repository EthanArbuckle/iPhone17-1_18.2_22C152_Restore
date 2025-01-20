@interface WFTriggerComposeViewController
+ (BOOL)canShowInputAction;
- (BOOL)isModalInPresentation;
- (BOOL)showsDetailsButton;
- (Class)triggerInputType;
- (WFTriggerComposeViewController)initWithWorkflow:(id)a3 mode:(unint64_t)a4 database:(id)a5;
- (WFTriggerComposeViewControllerDelegate)delegate;
- (id)doneBarButtonItem;
- (unint64_t)mode;
- (unint64_t)navigationUpdateBehavior;
- (void)dealloc;
- (void)didTapNext:(id)a3;
- (void)dismissForTutorial:(BOOL)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation WFTriggerComposeViewController

- (void).cxx_destruct
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setDelegate:(id)a3
{
}

- (WFTriggerComposeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (WFTriggerComposeViewControllerDelegate *)WeakRetained;
}

- (void)didTapNext:(id)a3
{
  v4 = [(WFComposeViewController *)self editorViewController];
  [v4 stop];

  [(WFComposeViewController *)self finishEditing];
}

- (id)doneBarButtonItem
{
  id v3 = objc_alloc(MEMORY[0x263F824A8]);
  v4 = WFLocalizedString(@"Done");
  v5 = (void *)[v3 initWithTitle:v4 style:2 target:self action:sel_didTapNext_];

  return v5;
}

- (void)dismissForTutorial:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  v6 = (void (**)(void))a4;
  v7 = getWFTriggersLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = _Block_copy(v6);
    *(_DWORD *)buf = 136315650;
    v14 = "-[WFTriggerComposeViewController dismissForTutorial:completionHandler:]";
    __int16 v15 = 1024;
    BOOL v16 = v4;
    __int16 v17 = 2114;
    v18 = v8;
    _os_log_impl(&dword_22D994000, v7, OS_LOG_TYPE_DEBUG, "%s WFTriggerComposeViewController dismissForTutorial:%d completionHandler:%{public}@", buf, 0x1Cu);
  }
  if (([(WFTriggerComposeViewController *)self isBeingDismissed] & 1) == 0)
  {
    if (v4)
    {
      v9 = getWFTriggersLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v14 = "-[WFTriggerComposeViewController dismissForTutorial:completionHandler:]";
        _os_log_impl(&dword_22D994000, v9, OS_LOG_TYPE_FAULT, "%s WARNING This VC shouldn't be used for tutorials", buf, 0xCu);
      }

      v12.receiver = self;
      v12.super_class = (Class)WFTriggerComposeViewController;
      [(WFComposeViewController *)&v12 dismissForTutorial:1 completionHandler:v6];
    }
    else
    {
      v10 = [(WFTriggerComposeViewController *)self delegate];
      v11 = [(WFComposeViewController *)self workflow];
      [v10 triggerComposeViewController:self didFinishWithWorkflow:v11];

      if (v6) {
        v6[2](v6);
      }
    }
  }
}

- (unint64_t)navigationUpdateBehavior
{
  return 4;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)WFTriggerComposeViewController;
  [(WFTriggerComposeViewController *)&v2 viewDidLoad];
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (BOOL)showsDetailsButton
{
  return 0;
}

- (Class)triggerInputType
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [(WFComposeViewController *)self database];
  BOOL v4 = [(WFComposeViewController *)self workflow];
  v5 = [v4 workflowID];
  v6 = [v3 configuredTriggersForWorkflowID:v5];
  v7 = [v6 descriptors];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v7;
  id v9 = (id)[v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_super v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) trigger];
        v13 = (void *)[v12 shortcutInputContentItemClass];

        if (v13)
        {
          id v9 = v13;
          goto LABEL_11;
        }
      }
      id v9 = (id)[v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (Class)v9;
}

- (void)dealloc
{
  id v3 = [(WFTriggerComposeViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(WFTriggerComposeViewController *)self delegate];
    [v5 triggerComposeViewControllerDidCancel:self];
  }
  v6.receiver = self;
  v6.super_class = (Class)WFTriggerComposeViewController;
  [(WFComposeViewController *)&v6 dealloc];
}

- (WFTriggerComposeViewController)initWithWorkflow:(id)a3 mode:(unint64_t)a4 database:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)WFTriggerComposeViewController;
  objc_super v6 = [(WFComposeViewController *)&v10 initWithWorkflow:a3 database:a5 home:0 shouldShowShareButton:0];
  v7 = v6;
  if (v6)
  {
    v6->_mode = a4;
    id v8 = v6;
  }

  return v7;
}

+ (BOOL)canShowInputAction
{
  return 0;
}

@end