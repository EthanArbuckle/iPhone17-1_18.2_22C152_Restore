@interface CloudTabsLibraryItemController
- (BOOL)isHidden;
- (BOOL)isSelected;
- (id)viewController;
- (void)didSelectItem;
- (void)updateListContentConfiguration:(id)a3;
@end

@implementation CloudTabsLibraryItemController

- (void)updateListContentConfiguration:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB1818];
  id v4 = a3;
  v5 = [v3 systemImageNamed:@"icloud"];
  [v4 setImage:v5];

  startPageTitleForCollectionType(@"CloudTabsCollection");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setText:v6];
}

- (void)didSelectItem
{
  v2 = [(LibraryItemController *)self configuration];
  v3 = [v2 libraryItemOpenHandler];
  [v3 openLibrary:@"CloudTabsCollection"];

  id v4 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v4 didUseSidebarAction:9];
}

- (BOOL)isSelected
{
  v2 = [(LibraryItemController *)self configuration];
  v3 = [v2 libraryItemOpenHandler];
  id v4 = [v3 activeLibraryType];
  char v5 = [v4 isEqualToString:@"CloudTabsCollection"];

  return v5;
}

- (BOOL)isHidden
{
  v2 = +[Application sharedApplication];
  v3 = [v2 browserWindowController];
  char v4 = [v3 cloudTabsEnabled] ^ 1;

  return v4;
}

- (id)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
}

@end