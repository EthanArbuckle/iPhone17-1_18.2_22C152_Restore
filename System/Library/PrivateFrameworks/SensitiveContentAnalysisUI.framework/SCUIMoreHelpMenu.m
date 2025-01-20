@interface SCUIMoreHelpMenu
+ (id)menu;
+ (id)menuWithAnalysis:(id)a3 options:(int64_t)a4;
+ (id)menuWithOptions:(int64_t)a3;
+ (id)menuWithOptions:(int64_t)a3 interventionType:(int64_t)a4 locale:(id)a5;
- (NSDictionary)contextDictionary;
- (SCUIMoreHelpMenuDelegate)menuDelegate;
- (SCUIReportAuthority)authority;
- (UIViewController)viewControllerThatPresented;
- (int64_t)interventionType;
- (int64_t)options;
- (void)addActionsFromModel:(id)a3;
- (void)didMessageSomeoneDefaultImplementation;
- (void)reportToAuthoritiesPressed;
- (void)setAuthority:(id)a3;
- (void)setInterventionType:(int64_t)a3;
- (void)setMenuDelegate:(id)a3;
- (void)setOptions:(int64_t)a3;
- (void)setViewControllerThatPresented:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SCUIMoreHelpMenu

- (NSDictionary)contextDictionary
{
  return 0;
}

+ (id)menu
{
  return +[SCUIMoreHelpMenu menuWithOptions:0];
}

+ (id)menuWithOptions:(int64_t)a3
{
  uint64_t v4 = SCUICurrentInterventionType();
  v5 = [MEMORY[0x263EFF960] currentLocale];
  v6 = +[SCUIMoreHelpMenu menuWithOptions:a3 interventionType:v4 locale:v5];

  return v6;
}

+ (id)menuWithAnalysis:(id)a3 options:(int64_t)a4
{
  return 0;
}

+ (id)menuWithOptions:(int64_t)a3 interventionType:(int64_t)a4 locale:(id)a5
{
  v7 = +[SCUIMoreHelpMenuModel modelWithOptions:a3 contextDictionary:0 interventionType:a4 locale:a5];
  v8 = [v7 title];
  unsigned int v9 = SCUIIsRunningInMacCatalyst();
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___SCUIMoreHelpMenu;
  v10 = objc_msgSendSuper2(&v13, sel_alertControllerWithTitle_message_preferredStyle_, v8, 0, v9);

  [v10 addActionsFromModel:v7];
  [v10 setInterventionType:a4];
  v11 = [v7 authority];
  [v10 setAuthority:v11];

  objc_msgSend(v10, "setOptions:", objc_msgSend(v7, "options"));

  return v10;
}

- (void)addActionsFromModel:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v16 = a3;
  v17 = self;
  objc_initWeak(&location, self);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  long long v24 = 0u;
  uint64_t v4 = [v16 actions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v25;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v24 + 1) + 8 * v7);
        v22[0] = 0;
        v22[1] = v22;
        v22[2] = 0x2020000000;
        uint64_t v23 = 0;
        uint64_t v23 = [v8 actionID];
        unsigned int v9 = (void *)MEMORY[0x263F82400];
        v10 = [v8 title];
        if ([v8 destructive]) {
          uint64_t v11 = 2;
        }
        else {
          uint64_t v11 = 0;
        }
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __40__SCUIMoreHelpMenu_addActionsFromModel___block_invoke;
        v20[3] = &unk_2654AB5E8;
        v20[4] = v22;
        objc_copyWeak(&v21, &location);
        v12 = [v9 actionWithTitle:v10 style:v11 handler:v20];
        [(SCUIMoreHelpMenu *)v17 addAction:v12];

        objc_destroyWeak(&v21);
        _Block_object_dispose(v22, 8);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v5);
  }

  objc_super v13 = (void *)MEMORY[0x263F82400];
  v14 = +[SCUIResources localizedStringForKey:@"CANCEL"];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __40__SCUIMoreHelpMenu_addActionsFromModel___block_invoke_2;
  v18[3] = &unk_2654AB610;
  objc_copyWeak(&v19, &location);
  v15 = [v13 actionWithTitle:v14 style:1 handler:v18];
  [(SCUIMoreHelpMenu *)v17 addAction:v15];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __40__SCUIMoreHelpMenu_addActionsFromModel___block_invoke(uint64_t a1, void *a2)
{
  id v39 = a2;
  switch(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    case 1:
      v3 = (id *)(a1 + 40);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      uint64_t v5 = [WeakRetained menuDelegate];
      char v6 = objc_opt_respondsToSelector();

      id v7 = objc_loadWeakRetained(v3);
      id v8 = v7;
      if (v6)
      {
        unsigned int v9 = [v7 menuDelegate];
        id v10 = objc_loadWeakRetained(v3);
        [v9 didMessageSomeone:v10];
        break;
      }
      [v7 didMessageSomeoneDefaultImplementation];
      goto LABEL_20;
    case 2:
      uint64_t v11 = (id *)(a1 + 40);
      id v12 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_super v13 = [v12 menuDelegate];
      char v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) == 0) {
        goto LABEL_21;
      }
      id v8 = objc_loadWeakRetained(v11);
      unsigned int v9 = [v8 menuDelegate];
      id v10 = objc_loadWeakRetained(v11);
      [v9 didAskForMoreHelp:v10];
      break;
    case 3:
      v15 = (id *)(a1 + 40);
      id v16 = objc_loadWeakRetained((id *)(a1 + 40));
      v17 = [v16 menuDelegate];
      char v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) == 0) {
        goto LABEL_21;
      }
      id v8 = objc_loadWeakRetained(v15);
      unsigned int v9 = [v8 menuDelegate];
      id v10 = objc_loadWeakRetained(v15);
      [v9 didLeaveConversation:v10];
      break;
    case 4:
      id v19 = (id *)(a1 + 40);
      id v20 = objc_loadWeakRetained((id *)(a1 + 40));
      id v21 = [v20 menuDelegate];
      char v22 = objc_opt_respondsToSelector();

      if ((v22 & 1) == 0) {
        goto LABEL_21;
      }
      id v8 = objc_loadWeakRetained(v19);
      unsigned int v9 = [v8 menuDelegate];
      id v10 = objc_loadWeakRetained(v19);
      [v9 didBlockContact:v10];
      break;
    case 5:
      uint64_t v23 = (id *)(a1 + 40);
      id v24 = objc_loadWeakRetained((id *)(a1 + 40));
      long long v25 = [v24 menuDelegate];
      char v26 = objc_opt_respondsToSelector();

      if ((v26 & 1) == 0) {
        goto LABEL_21;
      }
      id v8 = objc_loadWeakRetained(v23);
      unsigned int v9 = [v8 menuDelegate];
      id v10 = objc_loadWeakRetained(v23);
      [v9 didBlockContacts:v10];
      break;
    case 6:
      long long v27 = (id *)(a1 + 40);
      id v28 = objc_loadWeakRetained((id *)(a1 + 40));
      v29 = [v28 menuDelegate];
      char v30 = objc_opt_respondsToSelector();

      if ((v30 & 1) == 0) {
        goto LABEL_21;
      }
      id v8 = objc_loadWeakRetained(v27);
      unsigned int v9 = [v8 menuDelegate];
      id v10 = objc_loadWeakRetained(v27);
      [v9 didDeleteItem:v10];
      break;
    case 7:
      v31 = (id *)(a1 + 40);
      id v32 = objc_loadWeakRetained((id *)(a1 + 40));
      v33 = [v32 menuDelegate];
      char v34 = objc_opt_respondsToSelector();

      if ((v34 & 1) == 0) {
        goto LABEL_21;
      }
      id v8 = objc_loadWeakRetained(v31);
      unsigned int v9 = [v8 menuDelegate];
      id v10 = objc_loadWeakRetained(v31);
      [v9 didHidePhoto:v10];
      break;
    case 8:
      id v8 = objc_loadWeakRetained((id *)(a1 + 40));
      [v8 reportToAuthoritiesPressed];
      goto LABEL_20;
    case 9:
      v35 = (id *)(a1 + 40);
      id v36 = objc_loadWeakRetained((id *)(a1 + 40));
      v37 = [v36 menuDelegate];
      char v38 = objc_opt_respondsToSelector();

      if ((v38 & 1) == 0) {
        goto LABEL_21;
      }
      id v8 = objc_loadWeakRetained(v35);
      unsigned int v9 = [v8 menuDelegate];
      id v10 = objc_loadWeakRetained(v35);
      [v9 didShowContent:v10];
      break;
    default:
      goto LABEL_21;
  }

LABEL_20:
LABEL_21:
}

void __40__SCUIMoreHelpMenu_addActionsFromModel___block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained menuDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v7 = objc_loadWeakRetained(v1);
    uint64_t v5 = [v7 menuDelegate];
    id v6 = objc_loadWeakRetained(v1);
    [v5 didCancel:v6];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCUIMoreHelpMenu;
  [(SCUIMoreHelpMenu *)&v5 viewDidAppear:a3];
  char v4 = [(SCUIMoreHelpMenu *)self presentingViewController];
  [(SCUIMoreHelpMenu *)self setViewControllerThatPresented:v4];
}

- (void)didMessageSomeoneDefaultImplementation
{
  int64_t v2 = [(SCUIMoreHelpMenu *)self interventionType];

  +[SCUIContactParentsHelper openChatWithParentsForInterventionType:v2];
}

- (void)reportToAuthoritiesPressed
{
  id v7 = [(SCUIMoreHelpMenu *)self viewControllerThatPresented];
  v3 = [(SCUIMoreHelpMenu *)self authority];
  int64_t v4 = [(SCUIMoreHelpMenu *)self interventionType];
  objc_super v5 = [(SCUIMoreHelpMenu *)self menuDelegate];
  id v6 = [(SCUIMoreHelpMenu *)self contextDictionary];
  +[SCUIReportToAuthorities presentFlowFromController:v7 authority:v3 interventionType:v4 delegate:v5 contextDictionary:v6];
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (SCUIMoreHelpMenuDelegate)menuDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menuDelegate);

  return (SCUIMoreHelpMenuDelegate *)WeakRetained;
}

- (void)setMenuDelegate:(id)a3
{
}

- (int64_t)interventionType
{
  return self->_interventionType;
}

- (void)setInterventionType:(int64_t)a3
{
  self->_interventionType = a3;
}

- (SCUIReportAuthority)authority
{
  return self->_authority;
}

- (void)setAuthority:(id)a3
{
}

- (UIViewController)viewControllerThatPresented
{
  return self->_viewControllerThatPresented;
}

- (void)setViewControllerThatPresented:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerThatPresented, 0);
  objc_storeStrong((id *)&self->_authority, 0);

  objc_destroyWeak((id *)&self->_menuDelegate);
}

@end