@interface WLImportViewController
- (WLImportViewController)initWithWelcomeController:(id)a3;
@end

@implementation WLImportViewController

- (WLImportViewController)initWithWelcomeController:(id)a3
{
  id v5 = a3;
  v6 = WLLocalizedString();
  v7 = (void *)MEMORY[0x263F827E8];
  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v7 imageNamed:@"MoveToiOS" inBundle:v8];
  v16.receiver = self;
  v16.super_class = (Class)WLImportViewController;
  v10 = [(OBSetupAssistantProgressController *)&v16 initWithTitle:v6 detailText:0 icon:v9];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_welcomeController, a3);
    v11 = [(OBBaseWelcomeController *)v10 navigationItem];
    [v11 setTitle:&stru_26DDE7AC0];

    v12 = [(OBBaseWelcomeController *)v10 navigationItem];
    [v12 setHidesBackButton:1 animated:0];

    v13 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"PROGRESS_IMPORTING_TEXT"];
    v14 = WLLocalizedString();
    [(WLImportViewController *)v10 setProgressDescription:v14];
  }
  return v10;
}

- (void).cxx_destruct
{
}

@end