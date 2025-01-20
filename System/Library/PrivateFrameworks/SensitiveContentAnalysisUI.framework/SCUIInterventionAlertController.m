@interface SCUIInterventionAlertController
+ (id)viewControllerWithAnalysis:(id)a3 workflow:(int64_t)a4 contextDictionary:(id)a5 options:(int64_t)a6;
+ (id)viewControllerWithWorkflow:(int64_t)a3 contextDictionary:(id)a4;
+ (id)viewControllerWithWorkflow:(int64_t)a3 contextDictionary:(id)a4 options:(int64_t)a5;
- (NSDictionary)contextDictionary;
- (SCUIInterventionAlertController)initWithWorkflow:(int64_t)a3 contextDictionary:(id)a4 options:(int64_t)a5;
- (SCUIInterventionAlertController)initWithWorkflow:(int64_t)a3 contextDictionary:(id)a4 options:(int64_t)a5 type:(int64_t)a6;
- (SCUIInterventionScreenModel)screenModel;
- (SCUIInterventionViewControllerDelegate)interventionDelegate;
- (int64_t)contentScreen;
- (int64_t)options;
- (int64_t)type;
- (int64_t)workflow;
- (void)presentAlertScreen;
- (void)screenOne_acceptButtonPressed;
- (void)screenOne_moreHelpButtonDefaultImplementation;
- (void)screenOne_moreHelpButtonPressed;
- (void)screenOne_notNowButtonPressed;
- (void)screenOne_reportToAuthoritiesButtonPressed;
- (void)screenTwo_acceptButtonPressed;
- (void)screenTwo_messageButtonDefaultImplementation;
- (void)screenTwo_messageButtonPressed;
- (void)screenTwo_notNowButtonPressed;
- (void)setInterventionDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SCUIInterventionAlertController

- (SCUIInterventionAlertController)initWithWorkflow:(int64_t)a3 contextDictionary:(id)a4 options:(int64_t)a5
{
  id v8 = a4;
  v9 = [(SCUIInterventionAlertController *)self initWithWorkflow:a3 contextDictionary:v8 options:a5 type:SCUICurrentInterventionType()];

  return v9;
}

+ (id)viewControllerWithAnalysis:(id)a3 workflow:(int64_t)a4 contextDictionary:(id)a5 options:(int64_t)a6
{
  return 0;
}

- (SCUIInterventionAlertController)initWithWorkflow:(int64_t)a3 contextDictionary:(id)a4 options:(int64_t)a5 type:(int64_t)a6
{
  id v10 = a4;
  v11 = objc_opt_new();
  v18.receiver = self;
  v18.super_class = (Class)SCUIInterventionAlertController;
  v12 = [(SCUIInterventionAlertController *)&v18 initWithRootViewController:v11];

  if (v12)
  {
    v12->_workflow = a3;
    uint64_t v13 = [v10 copy];
    contextDictionary = v12->_contextDictionary;
    v12->_contextDictionary = (NSDictionary *)v13;

    v12->_options = a5 | 1;
    v12->_type = a6;
    v12->_contentScreen = 0;
    uint64_t v15 = +[SCUIInterventionScreenModel modelForScreen:0 workflow:v12->_workflow type:v12->_type options:v12->_options];
    screenModel = v12->_screenModel;
    v12->_screenModel = (SCUIInterventionScreenModel *)v15;
  }
  return v12;
}

+ (id)viewControllerWithWorkflow:(int64_t)a3 contextDictionary:(id)a4
{
  return (id)[a1 viewControllerWithWorkflow:a3 contextDictionary:a4 options:0];
}

+ (id)viewControllerWithWorkflow:(int64_t)a3 contextDictionary:(id)a4 options:(int64_t)a5
{
  id v7 = a4;
  id v8 = (void *)[objc_alloc((Class)objc_opt_class()) initWithWorkflow:a3 contextDictionary:v7 options:a5];

  return v8;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCUIInterventionAlertController;
  [(SCUIInterventionAlertController *)&v4 viewDidAppear:a3];
  [(SCUIInterventionAlertController *)self presentAlertScreen];
}

- (void)presentAlertScreen
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  val = self;
  objc_super v4 = [(SCUIInterventionScreenModel *)self->_screenModel bullets];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([v3 length]) {
          [v3 appendString:@"\n\n"];
        }
        v9 = [v8 text];
        [v3 appendString:v9];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v5);
  }

  id v10 = (void *)MEMORY[0x263F82418];
  v11 = [(SCUIInterventionScreenModel *)val->_screenModel title];
  v21 = [v10 alertControllerWithTitle:v11 message:v3 preferredStyle:1];

  objc_initWeak(&location, val);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v12 = [(SCUIInterventionScreenModel *)val->_screenModel actions];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = *(void **)(*((void *)&v24 + 1) + 8 * j);
        v17 = (void *)MEMORY[0x263F82400];
        objc_super v18 = [v16 title];
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __53__SCUIInterventionAlertController_presentAlertScreen__block_invoke;
        v22[3] = &unk_2654AB668;
        v22[4] = v16;
        objc_copyWeak(&v23, &location);
        v19 = [v17 actionWithTitle:v18 style:0 handler:v22];

        [v21 addAction:v19];
        objc_destroyWeak(&v23);
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v13);
  }

  [(SCUIInterventionAlertController *)val presentViewController:v21 animated:1 completion:0];
  objc_destroyWeak(&location);
}

void __53__SCUIInterventionAlertController_presentAlertScreen__block_invoke(uint64_t a1)
{
  switch([*(id *)(a1 + 32) actionID])
  {
    case 1:
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(WeakRetained, "screenOne_notNowButtonPressed");
      goto LABEL_9;
    case 2:
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(WeakRetained, "screenOne_moreHelpButtonPressed");
      goto LABEL_9;
    case 3:
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(WeakRetained, "screenOne_acceptButtonPressed");
      goto LABEL_9;
    case 4:
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(WeakRetained, "screenTwo_notNowButtonPressed");
      goto LABEL_9;
    case 5:
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(WeakRetained, "screenTwo_messageButtonPressed");
      goto LABEL_9;
    case 6:
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(WeakRetained, "screenTwo_acceptButtonPressed");
      goto LABEL_9;
    case 7:
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(WeakRetained, "screenOne_reportToAuthoritiesButtonPressed");
LABEL_9:

      break;
    default:
      return;
  }
}

- (void)screenOne_notNowButtonPressed
{
  v3 = +[SCUIAnalytics sharedInstance];
  [v3 collectUIInteractionEvent:3 :3 :1 :1 :0];

  objc_super v4 = [(SCUIInterventionAlertController *)self interventionDelegate];
  [v4 didRejectForInterventionViewController:self];

  [(SCUIInterventionAlertController *)self dismissViewControllerAnimated:0 completion:0];
}

- (void)screenOne_moreHelpButtonPressed
{
  v3 = +[SCUIAnalytics sharedInstance];
  [v3 collectUIInteractionEvent:3 :3 :1 :7 :0];

  objc_super v4 = [(SCUIInterventionAlertController *)self interventionDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(SCUIInterventionAlertController *)self interventionDelegate];
    [v6 didRequestMoreHelpForInterventionViewController:self];
  }
  else
  {
    [(SCUIInterventionAlertController *)self screenOne_moreHelpButtonDefaultImplementation];
  }

  [(SCUIInterventionAlertController *)self dismissViewControllerAnimated:0 completion:0];
}

- (void)screenOne_reportToAuthoritiesButtonPressed
{
  v3 = [(SCUIInterventionAlertController *)self interventionDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [(SCUIInterventionAlertController *)self interventionDelegate];
    [v5 didRequestMoreHelpForInterventionViewController:self];
  }
  else
  {
    [(SCUIInterventionAlertController *)self screenOne_moreHelpButtonDefaultImplementation];
  }

  [(SCUIInterventionAlertController *)self dismissViewControllerAnimated:0 completion:0];
}

- (void)screenOne_acceptButtonPressed
{
  v3 = +[SCUIAnalytics sharedInstance];
  [v3 collectUIInteractionEvent:3 :3 :1 :2 :0];

  self->_contentScreen = 1;
  char v4 = +[SCUIInterventionScreenModel modelForScreen:1 workflow:self->_workflow type:self->_type options:self->_options];
  screenModel = self->_screenModel;
  self->_screenModel = v4;

  [(SCUIInterventionAlertController *)self presentAlertScreen];
}

- (void)screenOne_moreHelpButtonDefaultImplementation
{
  id v4 = [MEMORY[0x263F82438] sharedApplication];
  v3 = +[SCUIMoreHelpWebResources waysToGetHelpURLForInterventionType:self->_type];
  [v4 openURL:v3 options:MEMORY[0x263EFFA78] completionHandler:0];
}

- (void)screenTwo_messageButtonPressed
{
  v3 = +[SCUIAnalytics sharedInstance];
  [v3 collectUIInteractionEvent:3 :3 :2 :5 :0];

  id v4 = [(SCUIInterventionAlertController *)self interventionDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(SCUIInterventionAlertController *)self interventionDelegate];
    [v6 didContactSomeoneForInterventionViewController:self];
  }
  else
  {
    [(SCUIInterventionAlertController *)self screenTwo_messageButtonDefaultImplementation];
  }

  [(SCUIInterventionAlertController *)self dismissViewControllerAnimated:0 completion:0];
}

- (void)screenTwo_acceptButtonPressed
{
  v3 = +[SCUIAnalytics sharedInstance];
  [v3 collectUIInteractionEvent:3 :3 :2 :3 :0];

  id v4 = [(SCUIInterventionAlertController *)self interventionDelegate];
  [v4 didConfirmForInterventionViewController:self];

  [(SCUIInterventionAlertController *)self dismissViewControllerAnimated:0 completion:0];
}

- (void)screenTwo_notNowButtonPressed
{
  v3 = +[SCUIAnalytics sharedInstance];
  [v3 collectUIInteractionEvent:3 :3 :2 :4 :0];

  id v4 = [(SCUIInterventionAlertController *)self interventionDelegate];
  [v4 didRejectForInterventionViewController:self];

  [(SCUIInterventionAlertController *)self dismissViewControllerAnimated:0 completion:0];
}

- (void)screenTwo_messageButtonDefaultImplementation
{
  int64_t v2 = [(SCUIInterventionAlertController *)self type];

  +[SCUIContactParentsHelper openChatWithParentsForInterventionType:v2];
}

- (int64_t)workflow
{
  return self->_workflow;
}

- (SCUIInterventionViewControllerDelegate)interventionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interventionDelegate);

  return (SCUIInterventionViewControllerDelegate *)WeakRetained;
}

- (void)setInterventionDelegate:(id)a3
{
}

- (NSDictionary)contextDictionary
{
  return self->_contextDictionary;
}

- (int64_t)options
{
  return self->_options;
}

- (int64_t)contentScreen
{
  return self->_contentScreen;
}

- (SCUIInterventionScreenModel)screenModel
{
  return self->_screenModel;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenModel, 0);
  objc_storeStrong((id *)&self->_contextDictionary, 0);

  objc_destroyWeak((id *)&self->_interventionDelegate);
}

@end