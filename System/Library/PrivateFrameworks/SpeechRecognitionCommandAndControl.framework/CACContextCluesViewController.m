@interface CACContextCluesViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isOverlay;
- (CACContextCluesDelegate)delegate;
- (CACContextCluesViewController)initWithCommands:(id)a3;
- (CACContextCluesWelcomeController)contextCluesController;
- (NSArray)commands;
- (UINavigationController)presentingNavigationController;
- (int64_t)zOrder;
- (void)doneButtonPressed;
- (void)setCommands:(id)a3;
- (void)setContextCluesController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPresentingNavigationController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation CACContextCluesViewController

- (CACContextCluesViewController)initWithCommands:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CACContextCluesViewController;
  v5 = [(CACContextCluesViewController *)&v10 init];
  if (v5)
  {
    v6 = [CACContextCluesWelcomeController alloc];
    v7 = +[CACLocaleUtilities localizedUIStringForKey:@"ContextClues.Title"];
    v8 = [(OBTextWelcomeController *)v6 initWithTitle:v7];
    [(CACContextCluesViewController *)v5 setContextCluesController:v8];

    [(CACContextCluesViewController *)v5 setCommands:v4];
  }

  return v5;
}

- (void)viewDidAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CACContextCluesViewController;
  [(CACContextCluesViewController *)&v15 viewDidAppear:a3];
  id v4 = [MEMORY[0x263F82E88] _applicationKeyWindow];
  v5 = [v4 _rootSheetPresentationController];
  [v5 _setShouldScaleDownBehindDescendantSheets:0];

  id v6 = objc_alloc(MEMORY[0x263F829B8]);
  v7 = [(CACContextCluesViewController *)self contextCluesController];
  v8 = (void *)[v6 initWithRootViewController:v7];

  id v9 = objc_alloc(MEMORY[0x263F824A8]);
  objc_super v10 = +[CACLocaleUtilities localizedUIStringForKey:@"CommonStrings.Done"];
  v11 = (void *)[v9 initWithTitle:v10 style:2 target:self action:sel_doneButtonPressed];
  v12 = [(CACContextCluesViewController *)self contextCluesController];
  v13 = [v12 navigationItem];
  [v13 setRightBarButtonItem:v11];

  [(CACContextCluesViewController *)self setPresentingNavigationController:v8];
  v14 = [v8 presentationController];
  [v14 setDelegate:self];

  [(CACContextCluesViewController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(CACContextCluesViewController *)self presentingNavigationController];
  [v5 dismissViewControllerAnimated:1 completion:0];

  id v6 = [MEMORY[0x263F82E88] _applicationKeyWindow];
  v7 = [v6 _rootSheetPresentationController];
  [v7 _setShouldScaleDownBehindDescendantSheets:1];

  v8.receiver = self;
  v8.super_class = (Class)CACContextCluesViewController;
  [(CACContextCluesViewController *)&v8 viewDidDisappear:v3];
}

- (void)setCommands:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = (NSArray *)a3;
  if (self->_commands != v5)
  {
    objc_storeStrong((id *)&self->_commands, a3);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v5;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          v12 = [(CACContextCluesViewController *)self contextCluesController];
          v13 = [v11 titleText];
          v14 = [v11 helperText];
          [v12 addBulletedListItemWithTitle:v13 description:v14];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
}

- (void)doneButtonPressed
{
  id v2 = [(CACContextCluesViewController *)self delegate];
  [v2 contextCludesDidPressDoneButton];
}

- (int64_t)zOrder
{
  return 7;
}

- (BOOL)isOverlay
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CACContextCluesDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CACContextCluesDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)commands
{
  return self->_commands;
}

- (CACContextCluesWelcomeController)contextCluesController
{
  return self->_contextCluesController;
}

- (void)setContextCluesController:(id)a3
{
}

- (UINavigationController)presentingNavigationController
{
  return self->_presentingNavigationController;
}

- (void)setPresentingNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingNavigationController, 0);
  objc_storeStrong((id *)&self->_contextCluesController, 0);
  objc_storeStrong((id *)&self->_commands, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end