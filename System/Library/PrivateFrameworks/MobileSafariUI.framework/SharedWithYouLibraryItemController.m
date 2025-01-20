@interface SharedWithYouLibraryItemController
- (BOOL)isSelected;
- (id)accessibilityIdentifier;
- (id)viewController;
- (void)didSelectItem;
- (void)updateListContentConfiguration:(id)a3;
@end

@implementation SharedWithYouLibraryItemController

- (void)updateListContentConfiguration:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB1818];
  id v4 = a3;
  v5 = [v3 _systemImageNamed:@"shared.with.you"];
  [v4 setImage:v5];

  startPageTitleForCollectionType(@"SharedWithYouCollection");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setText:v6];
}

- (void)didSelectItem
{
  v2 = [(LibraryItemController *)self configuration];
  v3 = [v2 libraryItemOpenHandler];
  [v3 openLibrary:@"SharedWithYouCollection"];

  id v4 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v4 didUseSidebarAction:8];
}

- (BOOL)isSelected
{
  v2 = [(LibraryItemController *)self configuration];
  v3 = [v2 libraryItemOpenHandler];
  id v4 = [v3 activeLibraryType];
  char v5 = [v4 isEqualToString:@"SharedWithYouCollection"];

  return v5;
}

- (id)accessibilityIdentifier
{
  return @"SharedWithYouLibraryItem";
}

- (id)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
}

@end