@interface HistoryLibraryItemController
- (BOOL)_showsProfile;
- (BOOL)panelViewControllerShouldTranslucentAppearance:(id)a3;
- (BOOL)panelViewControllerShouldUseSearchControllerInNavigationItem:(id)a3;
- (BOOL)selectionFollowsFocus;
- (id)accessibilityIdentifier;
- (id)viewController;
- (void)updateListContentConfiguration:(id)a3;
@end

@implementation HistoryLibraryItemController

- (void)updateListContentConfiguration:(id)a3
{
  id v12 = a3;
  v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"clock"];
  [v12 setImage:v4];

  if ([(HistoryLibraryItemController *)self _showsProfile])
  {
    v5 = [(LibraryItemController *)self configuration];
    v6 = [v5 tabGroupProvider];
    v7 = [v6 activeProfile];

    v8 = NSString;
    v9 = _WBSLocalizedString();
    v10 = [v7 title];
    v11 = objc_msgSend(v8, "stringWithFormat:", v9, v10);
    [v12 setText:v11];
  }
  else
  {
    v7 = _WBSLocalizedString();
    [v12 setText:v7];
  }
}

- (id)viewController
{
  v3 = [(LibraryItemController *)self configuration];
  v4 = [v3 linkPreviewProvider];

  v5 = [(LibraryItemController *)self configuration];
  v6 = [v5 navigationIntentHandler];

  v7 = [(LibraryItemController *)self configuration];
  v8 = [v7 tabGroupProvider];

  v9 = [v8 activeProfile];
  v10 = +[Application sharedApplication];
  v11 = [v10 historyController];
  id v12 = [v9 identifier];
  v13 = [v11 historyForProfileIdentifier:v12 loadIfNeeded:1];

  historyViewController = self->_historyViewController;
  if (!historyViewController
    || ([(SFHistoryViewController *)historyViewController history],
        v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        v15 != v13))
  {
    v16 = [[SFHistoryViewController alloc] initWithHistory:v13];
    v17 = self->_historyViewController;
    self->_historyViewController = v16;

    [(SFHistoryViewController *)self->_historyViewController setLinkPreviewProvider:v4];
    [(SFHistoryViewController *)self->_historyViewController setNavigationIntentHandler:v6];
    [(SFHistoryViewController *)self->_historyViewController setTabGroupProvider:v8];
    [(SFHistoryViewController *)self->_historyViewController setDelegate:self];
    v18 = [(SFHistoryViewController *)self->_historyViewController navigationItem];
    [v18 setLargeTitleDisplayMode:2];
  }
  if ([(HistoryLibraryItemController *)self _showsProfile])
  {
    v19 = NSString;
    v20 = _WBSLocalizedString();
    v21 = [v9 title];
    v22 = objc_msgSend(v19, "stringWithFormat:", v20, v21);
    [(SFHistoryViewController *)self->_historyViewController setTitle:v22];
  }
  v23 = self->_historyViewController;

  return v23;
}

- (BOOL)panelViewControllerShouldUseSearchControllerInNavigationItem:(id)a3
{
  return 1;
}

- (BOOL)panelViewControllerShouldTranslucentAppearance:(id)a3
{
  return 0;
}

- (BOOL)selectionFollowsFocus
{
  return 0;
}

- (id)accessibilityIdentifier
{
  return @"HistoryLibraryItem";
}

- (BOOL)_showsProfile
{
  v2 = [(LibraryItemController *)self configuration];
  v3 = [v2 tabGroupProvider];
  char v4 = [v3 hasMultipleProfiles];

  return v4;
}

- (void).cxx_destruct
{
}

@end