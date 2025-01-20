@interface SCUIInterventionScreenViewController
- (SCUIInterventionScreenViewController)initWithContainer:(id)a3 contentScreen:(int64_t)a4 options:(int64_t)a5;
- (SCUIInterventionViewController)container;
- (SCUIReportAuthority)authority;
- (id)nextScreenWithContainer:(id)a3;
- (int64_t)contentScreen;
- (int64_t)interventionType;
- (int64_t)options;
- (void)addBulletsFromModel:(id)a3;
- (void)addButtonsFromModel:(id)a3;
- (void)screenOne_acceptButtonPressed;
- (void)screenOne_moreHelpButtonDefaultImplementation;
- (void)screenOne_moreHelpButtonPressed;
- (void)screenOne_notNowButtonPressed;
- (void)screenOne_reportToAuthoritiesButtonPressed;
- (void)screenTwo_acceptButtonPressed;
- (void)screenTwo_messageButtonDefaultImplementation;
- (void)screenTwo_messageButtonPressed;
- (void)screenTwo_notNowButtonPressed;
- (void)setAuthority:(id)a3;
- (void)setContainer:(id)a3;
@end

@implementation SCUIInterventionScreenViewController

- (SCUIInterventionScreenViewController)initWithContainer:(id)a3 contentScreen:(int64_t)a4 options:(int64_t)a5
{
  id v8 = a3;
  v9 = +[SCUIInterventionScreenModel modelForScreen:workflow:type:options:](SCUIInterventionScreenModel, "modelForScreen:workflow:type:options:", a4, [v8 workflow], objc_msgSend(v8, "type"), a5);
  v10 = [v9 title];
  v11 = (void *)MEMORY[0x263F827E8];
  v12 = [v9 imageName];
  v13 = [v11 scImageNamed:v12];
  v14 = [(SCUIInterventionScreenViewController *)self initWithTitle:v10 detailText:0 icon:v13];

  if (v14)
  {
    objc_storeWeak((id *)&v14->_container, v8);
    v14->_contentScreen = a4;
    v14->_options = [v9 options];
    v14->_interventionType = [v8 type];
    uint64_t v15 = [v9 authority];
    authority = v14->_authority;
    v14->_authority = (SCUIReportAuthority *)v15;

    [(SCUIInterventionScreenViewController *)v14 addBulletsFromModel:v9];
    [(SCUIInterventionScreenViewController *)v14 addButtonsFromModel:v9];
    v17 = [MEMORY[0x263F825C8] systemBlueColor];
    v18 = [(SCUIInterventionScreenViewController *)v14 view];
    [v18 setTintColor:v17];
  }
  return v14;
}

- (void)addBulletsFromModel:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = objc_msgSend(a3, "bullets", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v9 text];
        v11 = (void *)MEMORY[0x263F827E8];
        v12 = [v9 imageName];
        v13 = [v11 scImageNamed:v12];
        [(SCUIInterventionScreenViewController *)self addBulletedListItemWithTitle:&stru_270980950 description:v10 image:v13];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (void)addButtonsFromModel:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = [a3 actions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      long long v15 = sel_screenOne_moreHelpButtonPressed;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
        if (objc_msgSend(v9, "primary", v15)) {
          [MEMORY[0x263F5B898] boldButton];
        }
        else {
        v10 = [MEMORY[0x263F5B8D0] linkButton];
        }
        v11 = [v9 title];
        [v10 setTitle:v11 forState:0];

        uint64_t v12 = [v9 actionID];
        v13 = sel_screenOne_notNowButtonPressed;
        switch(v12)
        {
          case 1:
            goto LABEL_16;
          case 2:
            v13 = v15;
            goto LABEL_16;
          case 3:
            v13 = sel_screenOne_acceptButtonPressed;
            goto LABEL_16;
          case 4:
            v13 = sel_screenTwo_notNowButtonPressed;
            goto LABEL_16;
          case 5:
            v13 = sel_screenTwo_messageButtonPressed;
            goto LABEL_16;
          case 6:
            v13 = sel_screenTwo_acceptButtonPressed;
            goto LABEL_16;
          case 7:
            v13 = sel_screenOne_reportToAuthoritiesButtonPressed;
LABEL_16:
            [v10 addTarget:self action:v13 forControlEvents:64];
            long long v14 = [(SCUIInterventionScreenViewController *)self buttonTray];
            [v14 addButton:v10];

            break;
          default:
            break;
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (void)screenOne_notNowButtonPressed
{
  v3 = +[SCUIAnalytics sharedInstance];
  [v3 collectUIInteractionEvent:3 :3 :1 :1 :0];

  id v6 = [(SCUIInterventionScreenViewController *)self container];
  v4 = [v6 interventionDelegate];
  uint64_t v5 = [(SCUIInterventionScreenViewController *)self container];
  [v4 didRejectForInterventionViewController:v5];
}

- (void)screenOne_moreHelpButtonPressed
{
  v3 = +[SCUIAnalytics sharedInstance];
  [v3 collectUIInteractionEvent:3 :3 :1 :7 :0];

  v4 = [(SCUIInterventionScreenViewController *)self container];
  uint64_t v5 = [v4 interventionDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v9 = [(SCUIInterventionScreenViewController *)self container];
    uint64_t v7 = [v9 interventionDelegate];
    uint64_t v8 = [(SCUIInterventionScreenViewController *)self container];
    [v7 didRequestMoreHelpForInterventionViewController:v8];
  }
  else
  {
    [(SCUIInterventionScreenViewController *)self screenOne_moreHelpButtonDefaultImplementation];
  }
}

- (void)screenOne_reportToAuthoritiesButtonPressed
{
  id v8 = [(SCUIInterventionScreenViewController *)self authority];
  int64_t v3 = [(SCUIInterventionScreenViewController *)self interventionType];
  v4 = [(SCUIInterventionScreenViewController *)self container];
  uint64_t v5 = [v4 interventionDelegate];
  char v6 = [(SCUIInterventionScreenViewController *)self container];
  uint64_t v7 = [v6 contextDictionary];
  +[SCUIReportToAuthorities presentFlowFromController:self authority:v8 interventionType:v3 delegate:v5 contextDictionary:v7];
}

- (void)screenOne_acceptButtonPressed
{
  int64_t v3 = +[SCUIAnalytics sharedInstance];
  [v3 collectUIInteractionEvent:3 :3 :1 :2 :0];

  v4 = [(SCUIInterventionScreenViewController *)self container];
  id v6 = [(SCUIInterventionScreenViewController *)self nextScreenWithContainer:v4];

  uint64_t v5 = [(SCUIInterventionScreenViewController *)self navigationController];
  [v5 pushViewController:v6 animated:1];
}

- (void)screenOne_moreHelpButtonDefaultImplementation
{
  int64_t v3 = objc_alloc_init(SCUIMoreHelpWebViewController);
  [(SCUIInterventionScreenViewController *)self presentViewController:v3 animated:1 completion:0];
}

- (void)screenTwo_messageButtonPressed
{
  int64_t v3 = +[SCUIAnalytics sharedInstance];
  [v3 collectUIInteractionEvent:3 :3 :2 :5 :0];

  v4 = [(SCUIInterventionScreenViewController *)self container];
  uint64_t v5 = [v4 interventionDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v9 = [(SCUIInterventionScreenViewController *)self container];
    uint64_t v7 = [v9 interventionDelegate];
    id v8 = [(SCUIInterventionScreenViewController *)self container];
    [v7 didContactSomeoneForInterventionViewController:v8];
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __70__SCUIInterventionScreenViewController_screenTwo_messageButtonPressed__block_invoke;
    v10[3] = &unk_2654AB548;
    v10[4] = self;
    [(SCUIInterventionScreenViewController *)self dismissViewControllerAnimated:1 completion:v10];
  }
}

uint64_t __70__SCUIInterventionScreenViewController_screenTwo_messageButtonPressed__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "screenTwo_messageButtonDefaultImplementation");
}

- (void)screenTwo_acceptButtonPressed
{
  int64_t v3 = +[SCUIAnalytics sharedInstance];
  [v3 collectUIInteractionEvent:3 :3 :2 :3 :0];

  v4 = [(SCUIInterventionScreenViewController *)self view];
  [v4 setUserInteractionEnabled:0];

  uint64_t v5 = [(OBBaseWelcomeController *)self navigationItem];
  [v5 setHidesBackButton:1];

  char v6 = [(SCUIInterventionScreenViewController *)self container];
  uint64_t v7 = [v6 type];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__SCUIInterventionScreenViewController_screenTwo_acceptButtonPressed__block_invoke;
  v8[3] = &unk_2654AB6B8;
  v8[4] = self;
  +[SCUIScreenTimePasscodeController askUserForScreenTimePasscodeFrom:self interventionType:v7 completionHandler:v8];
}

void __69__SCUIInterventionScreenViewController_screenTwo_acceptButtonPressed__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__SCUIInterventionScreenViewController_screenTwo_acceptButtonPressed__block_invoke_2;
  v6[3] = &unk_2654AB690;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __69__SCUIInterventionScreenViewController_screenTwo_acceptButtonPressed__block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    v2 = [MEMORY[0x263F17660] clientUI];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v3;
      _os_log_impl(&dword_25C01A000, v2, OS_LOG_TYPE_DEFAULT, "Failed to check ScreenTime passcode error: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    v2 = [*(id *)(a1 + 40) container];
    uint64_t v4 = [v2 interventionDelegate];
    id v5 = [*(id *)(a1 + 40) container];
    [v4 didConfirmForInterventionViewController:v5];
  }
  char v6 = [*(id *)(a1 + 40) view];
  [v6 setUserInteractionEnabled:1];

  id v7 = [*(id *)(a1 + 40) navigationItem];
  [v7 setHidesBackButton:0];
}

- (void)screenTwo_notNowButtonPressed
{
  uint64_t v3 = +[SCUIAnalytics sharedInstance];
  [v3 collectUIInteractionEvent:3 :3 :2 :4 :0];

  id v6 = [(SCUIInterventionScreenViewController *)self container];
  uint64_t v4 = [v6 interventionDelegate];
  id v5 = [(SCUIInterventionScreenViewController *)self container];
  [v4 didRejectForInterventionViewController:v5];
}

- (void)screenTwo_messageButtonDefaultImplementation
{
  id v2 = [(SCUIInterventionScreenViewController *)self container];
  +[SCUIContactParentsHelper openChatWithParentsForInterventionType:](SCUIContactParentsHelper, "openChatWithParentsForInterventionType:", [v2 type]);
}

- (id)nextScreenWithContainer:(id)a3
{
  id v4 = a3;
  id v5 = [[SCUIInterventionScreenViewController alloc] initWithContainer:v4 contentScreen:1 options:[(SCUIInterventionScreenViewController *)self options]];

  return v5;
}

- (SCUIInterventionViewController)container
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);

  return (SCUIInterventionViewController *)WeakRetained;
}

- (void)setContainer:(id)a3
{
}

- (int64_t)contentScreen
{
  return self->_contentScreen;
}

- (int64_t)options
{
  return self->_options;
}

- (SCUIReportAuthority)authority
{
  return self->_authority;
}

- (void)setAuthority:(id)a3
{
}

- (int64_t)interventionType
{
  return self->_interventionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authority, 0);

  objc_destroyWeak((id *)&self->_container);
}

@end