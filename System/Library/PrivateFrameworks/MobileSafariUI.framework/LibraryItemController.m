@interface LibraryItemController
- (BOOL)hasSubitems;
- (BOOL)isExpanded;
- (BOOL)isHidden;
- (BOOL)isSelected;
- (BOOL)isSpringLoaded;
- (BOOL)selectionFollowsFocus;
- (BOOL)shouldPersistSelection;
- (LibraryConfiguration)configuration;
- (LibraryItemController)initWithConfiguration:(id)a3 sectionController:(id)a4;
- (LibrarySectionController)sectionController;
- (NSArray)accessories;
- (NSArray)dragItems;
- (NSArray)subitems;
- (NSString)accessibilityIdentifier;
- (UISwipeActionsConfiguration)swipeActionsConfiguration;
- (UIViewController)viewController;
- (int64_t)dropIntentForSession:(id)a3;
- (unint64_t)dropOperationForSession:(id)a3;
- (void)contentDidChange;
- (void)setSwipeActionsConfiguration:(id)a3;
@end

@implementation LibraryItemController

- (LibraryItemController)initWithConfiguration:(id)a3 sectionController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LibraryItemController;
  v9 = [(LibraryItemController *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeWeak((id *)&v10->_sectionController, v8);
    v11 = v10;
  }

  return v10;
}

- (void)contentDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sectionController);
  [WeakRetained contentDidChange];
}

- (UIViewController)viewController
{
  return 0;
}

- (BOOL)shouldPersistSelection
{
  return 0;
}

- (BOOL)selectionFollowsFocus
{
  return 1;
}

- (NSArray)accessories
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (BOOL)hasSubitems
{
  return 0;
}

- (NSArray)subitems
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (BOOL)isExpanded
{
  return 0;
}

- (NSArray)dragItems
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (BOOL)isSpringLoaded
{
  return 0;
}

- (unint64_t)dropOperationForSession:(id)a3
{
  return 0;
}

- (int64_t)dropIntentForSession:(id)a3
{
  return 0;
}

- (LibrarySectionController)sectionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sectionController);
  return (LibrarySectionController *)WeakRetained;
}

- (LibraryConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (UISwipeActionsConfiguration)swipeActionsConfiguration
{
  return self->_swipeActionsConfiguration;
}

- (void)setSwipeActionsConfiguration:(id)a3
{
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_swipeActionsConfiguration, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_sectionController);
}

@end