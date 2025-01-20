@interface DownloadsActivity
- (ActionPanel)parentViewController;
- (BOOL)canPerformOnNewTabPage;
- (BOOL)canPerformWithTabDocument:(id)a3;
- (DownloadsActivity)init;
- (id)_activityBadgeColor;
- (id)_activityBadgeText;
- (id)_activityBadgeTextColor;
- (id)_navigationController;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (int64_t)actionType;
- (void)_downloadsDidChange;
- (void)performActivityWithTabDocument:(id)a3;
- (void)setParentViewController:(id)a3;
@end

@implementation DownloadsActivity

- (DownloadsActivity)init
{
  v6.receiver = self;
  v6.super_class = (Class)DownloadsActivity;
  v2 = [(UIActivity *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__downloadsDidChange name:*MEMORY[0x1E4F3B170] object:0];
    [v3 addObserver:v2 selector:sel__downloadsDidChange name:*MEMORY[0x1E4F3B148] object:0];
    [v3 addObserver:v2 selector:sel__downloadsDidChange name:*MEMORY[0x1E4F3B150] object:0];
    v4 = v2;
  }
  return v2;
}

- (id)activityTitle
{
  return (id)_WBSLocalizedString();
}

- (id)_systemImageName
{
  return @"square.and.arrow.down";
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F3B0D0];
}

- (id)_activityBadgeText
{
  v2 = [MEMORY[0x1E4F3AF68] sharedManager];
  v3 = (void *)[v2 runningDownloadsCount];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F28EE0];
    v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v3];
    v3 = [v4 localizedStringFromNumber:v5 numberStyle:1];
  }
  return v3;
}

- (id)_activityBadgeTextColor
{
  return (id)[MEMORY[0x1E4FB1618] labelColor];
}

- (id)_activityBadgeColor
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1618], "sf_colorNamed:", @"shareSheetBadgeBackgroundColor");
}

- (int64_t)actionType
{
  return 10;
}

- (BOOL)canPerformOnNewTabPage
{
  return 1;
}

- (BOOL)canPerformWithTabDocument:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x1E4F3AF68], "sharedManager", a3);
  v4 = [v3 downloads];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (id)_navigationController
{
  navigationController = self->_navigationController;
  if (navigationController)
  {
    v3 = navigationController;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
    objc_super v6 = [WeakRetained downloadsViewController];

    v7 = (UINavigationController *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v6];
    v8 = self->_navigationController;
    self->_navigationController = v7;

    v3 = self->_navigationController;
  }
  return v3;
}

- (void)performActivityWithTabDocument:(id)a3
{
  id v4 = a3;
  [(_SFActivity *)self activityDidFinish:1];
  id v7 = [v4 browserController];

  BOOL v5 = [v7 viewControllerToPresentFrom];
  objc_super v6 = [(DownloadsActivity *)self _navigationController];
  [v5 presentViewController:v6 animated:1 completion:0];
}

- (void)_downloadsDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  if ((objc_opt_respondsToSelector() & 1) != 0 && ([WeakRetained isBeingDismissed] & 1) == 0) {
    [WeakRetained _reloadActivity:self];
  }
  v3 = [MEMORY[0x1E4F3AF68] sharedManager];
  id v4 = [v3 downloads];
  uint64_t v5 = [v4 count];

  if (!v5) {
    [(UINavigationController *)self->_navigationController dismissViewControllerAnimated:1 completion:0];
  }
}

- (ActionPanel)parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  return (ActionPanel *)WeakRetained;
}

- (void)setParentViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

@end