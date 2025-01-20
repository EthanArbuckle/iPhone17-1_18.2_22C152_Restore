@interface CACOnboardingCommandsDetailViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)hideTrayButtons;
- (BOOL)shouldInlineButtonTray;
- (BOOL)skipAnalytics;
- (CACOnboardingCommandsDetailViewController)initWithTitle:(id)a3 detailText:(id)a4 commandGroups:(id)a5;
- (CACOnboardingCommandsDetailViewController)nextCommandGroupVC;
- (NSArray)commandGroups;
- (OBTrayButton)mainButton;
- (OBTrayButton)secondaryButton;
- (void)dismiss;
- (void)setCommandGroups:(id)a3;
- (void)setHideTrayButtons:(BOOL)a3;
- (void)setNextCommandGroupVC:(id)a3;
- (void)setSkipAnalytics:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CACOnboardingCommandsDetailViewController

- (CACOnboardingCommandsDetailViewController)initWithTitle:(id)a3 detailText:(id)a4 commandGroups:(id)a5
{
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CACOnboardingCommandsDetailViewController;
  v10 = [(CACOnboardingCommandsDetailViewController *)&v15 initWithTitle:a3 detailText:a4 symbolName:0];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_commandGroups, a5);
    v12 = [MEMORY[0x263F5B898] boldButton];
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    mainButton = v11->_mainButton;
    v11->_mainButton = (OBTrayButton *)v12;
  }
  return v11;
}

- (void)viewDidLoad
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v35.receiver = self;
  v35.super_class = (Class)CACOnboardingCommandsDetailViewController;
  [(OBBaseWelcomeController *)&v35 viewDidLoad];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = [(CACOnboardingCommandsDetailViewController *)self commandGroups];
  uint64_t v3 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v32 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v8 = [(CACOnboardingCommandsDetailViewController *)self commandGroups];
        uint64_t v9 = [v8 count];

        if (v9 != 1)
        {
          v10 = [v7 groupTitle];
          [(OBTextWelcomeController *)self addSectionWithHeader:v10 content:&stru_26EB332F0];
        }
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        v11 = [v7 commands];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v36 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v28;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v28 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v27 + 1) + 8 * j);
              v17 = [v16 titleText];
              v18 = [v16 helperText];
              [(OBTextWelcomeController *)self addBulletedListItemWithTitle:v17 description:v18];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v36 count:16];
          }
          while (v13);
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v4);
  }

  v19 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_dismiss];
  v20 = [(OBBaseWelcomeController *)self navigationItem];
  [v20 setRightBarButtonItem:v19];

  v21 = [(CACOnboardingCommandsDetailViewController *)self mainButton];
  v22 = +[CACLocaleUtilities localizedUIStringForKey:@"CommonStrings.Done"];
  [v21 setTitle:v22 forState:0];

  v23 = [(CACOnboardingCommandsDetailViewController *)self mainButton];
  [v23 addTarget:self action:sel_dismiss forControlEvents:64];

  if (![(CACOnboardingCommandsDetailViewController *)self hideTrayButtons])
  {
    v24 = [(CACOnboardingCommandsDetailViewController *)self buttonTray];
    v25 = [(CACOnboardingCommandsDetailViewController *)self mainButton];
    [v24 addButton:v25];
  }
}

- (void)setHideTrayButtons:(BOOL)a3
{
  BOOL v3 = a3;
  obuint64_t j = self;
  objc_sync_enter(obj);
  uint64_t v4 = [(CACOnboardingCommandsDetailViewController *)obj buttonTray];
  [v4 setHidden:v3];

  obj->_hideTrayButtons = v3;
  objc_sync_exit(obj);
}

- (void)dismiss
{
}

- (BOOL)shouldInlineButtonTray
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)hideTrayButtons
{
  return self->_hideTrayButtons;
}

- (BOOL)skipAnalytics
{
  return self->_skipAnalytics;
}

- (void)setSkipAnalytics:(BOOL)a3
{
  self->_skipAnalytics = a3;
}

- (OBTrayButton)mainButton
{
  return self->_mainButton;
}

- (OBTrayButton)secondaryButton
{
  return self->_secondaryButton;
}

- (CACOnboardingCommandsDetailViewController)nextCommandGroupVC
{
  return self->_nextCommandGroupVC;
}

- (void)setNextCommandGroupVC:(id)a3
{
}

- (NSArray)commandGroups
{
  return self->_commandGroups;
}

- (void)setCommandGroups:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandGroups, 0);
  objc_storeStrong((id *)&self->_nextCommandGroupVC, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_mainButton, 0);
}

@end