@interface MSLaunchNotificationsController
- (BOOL)_hasDisplayedFamilySetup;
- (MSLaunchNotificationsController)initWithParentViewController:(id)a3;
- (SUUIClientContext)clientContext;
- (void)_showFamilySetupPrompt;
- (void)checkForNotifications;
- (void)setClientContext:(id)a3;
@end

@implementation MSLaunchNotificationsController

- (MSLaunchNotificationsController)initWithParentViewController:(id)a3
{
  objc_initWeak(&location, a3);
  v7.receiver = self;
  v7.super_class = (Class)MSLaunchNotificationsController;
  v4 = [(MSLaunchNotificationsController *)&v7 init];
  if (v4)
  {
    id v5 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v4->_parentViewController, v5);
  }
  objc_destroyWeak(&location);
  return v4;
}

- (void)checkForNotifications
{
  if (![(MSLaunchNotificationsController *)self _hasDisplayedFamilySetup])
  {
    [(MSLaunchNotificationsController *)self _showFamilySetupPrompt];
  }
}

- (BOOL)_hasDisplayedFamilySetup
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"SUUIFamilySetupDisplayed"];

  return v3;
}

- (void)_showFamilySetupPrompt
{
  unsigned __int8 v3 = +[SSAccountStore defaultStore];
  id v10 = [v3 activeAccount];

  if (v10)
  {
    uint64_t v4 = sub_100007AE8();
    id v5 = [objc_alloc((Class)sub_100007BC8(@"AAUIFamilySetupPrompter", v4)) initWithiTunesAccount:v10];
    familySetupPrompter = self->_familySetupPrompter;
    self->_familySetupPrompter = v5;

    objc_super v7 = self->_familySetupPrompter;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
    [(AAUIFamilySetupPrompter *)v7 promptIfEligibleWithPresentingViewController:WeakRetained isFirstRun:1];

    v9 = +[NSUserDefaults standardUserDefaults];
    [v9 setBool:1 forKey:@"SUUIFamilySetupDisplayed"];
    [v9 synchronize];
  }
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_familySetupPrompter, 0);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end