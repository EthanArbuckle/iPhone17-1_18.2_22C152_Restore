@interface BookmarkFolderLibraryItemController
- (BOOL)bookmarkInfoViewControllerShouldUseTranslucentAppearance:(id)a3;
- (BOOL)bookmarksTableViewIsReadOnly:(id)a3;
- (BOOL)bookmarksTableViewShouldDispatchNavigationIntent:(id)a3 forSelectedBookmark:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSpringLoaded;
- (BOOL)panelViewControllerShouldUseSearchControllerInNavigationItem:(id)a3;
- (BOOL)selectionFollowsFocus;
- (BookmarkFolderLibraryItemController)initWithConfiguration:(id)a3 sectionController:(id)a4 folder:(id)a5;
- (LinkPreviewProvider)linkPreviewProvider;
- (OS_dispatch_queue)bookmarkProviderQueue;
- (TabGroupProvider)tabGroupProvider;
- (UIEdgeInsets)contentInsetForBookmarksTableViewController:(id)a3;
- (UIEdgeInsets)separatorInsetForBookmarksTableViewController:(id)a3;
- (WBBookmarkProvider)bookmarkProvider;
- (WebBookmark)folder;
- (WebBookmarkCollection)collection;
- (_SFNavigationIntentHandling)navigationIntentHandler;
- (id)_toolbarItemsForViewController:(id)a3;
- (id)accessibilityIdentifier;
- (id)syntheticBookmarkProviderForBookmarkInfoViewController:(id)a3;
- (id)topViewController;
- (id)viewController;
- (int64_t)dropIntentForSession:(id)a3;
- (unint64_t)dropOperationForSession:(id)a3;
- (unint64_t)hash;
- (void)_createToolbarItemsIfNecessary;
- (void)_didPressEditButton;
- (void)_didPressEditingDoneButton;
- (void)_didPressNewFolderButton;
- (void)_folderContentsDidChange:(id)a3;
- (void)_reloadFolderContentsForFolderIDIfNeeded:(int)a3;
- (void)_setEditingFromToolbarButton:(BOOL)a3;
- (void)_updateToolbarItemsForViewController:(id)a3 animated:(BOOL)a4;
- (void)bookmarksTableViewControllerWillDisappear:(id)a3;
- (void)dealloc;
- (void)dispatchNavigationIntent:(id)a3;
- (void)handleNavigationIntent:(id)a3 completion:(id)a4;
- (void)panelViewControllerDidBeginEditing:(id)a3;
- (void)panelViewControllerDidEndEditing:(id)a3;
- (void)performDropWithProposal:(id)a3 session:(id)a4;
- (void)setBookmarkProvider:(id)a3;
- (void)setBookmarkProviderQueue:(id)a3;
- (void)setCollection:(id)a3;
- (void)setLinkPreviewProvider:(id)a3;
- (void)setNavigationIntentHandler:(id)a3;
- (void)setTabGroupProvider:(id)a3;
- (void)tabGroupManager:(id)a3 didRemoveTabGroupWithUUID:(id)a4;
- (void)tabGroupManager:(id)a3 didUpdateScopedBookmarkList:(id)a4;
- (void)tabGroupManager:(id)a3 didUpdateTabGroupWithUUID:(id)a4;
- (void)tabGroupManagerDidUpdateTabGroups:(id)a3;
- (void)toggleEditBookmarks;
- (void)updateListContentConfiguration:(id)a3;
- (void)updateToolbarIfNeeded;
@end

@implementation BookmarkFolderLibraryItemController

- (BookmarkFolderLibraryItemController)initWithConfiguration:(id)a3 sectionController:(id)a4 folder:(id)a5
{
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BookmarkFolderLibraryItemController;
  v10 = [(LibraryItemController *)&v14 initWithConfiguration:a3 sectionController:a4];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_folder, a5);
    v11->_allowsEditing = 1;
    v12 = v11;
  }

  return v11;
}

- (unint64_t)hash
{
  return [(WebBookmark *)self->_folder hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    folder = self->_folder;
    v6 = [v4 folder];
    char v7 = [(WebBookmark *)folder isEqualToBookmark:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  id v4 = +[Application sharedApplication];
  v5 = [v4 tabGroupManager];
  [v5 removeTabGroupObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)BookmarkFolderLibraryItemController;
  [(BookmarkFolderLibraryItemController *)&v6 dealloc];
}

- (void)updateListContentConfiguration:(id)a3
{
  id v12 = a3;
  id v4 = [(WebBookmark *)self->_folder localizedTitle];
  [v12 setText:v4];

  int v5 = [(WebBookmark *)self->_folder specialID];
  if (v5 == *MEMORY[0x1E4FB6050])
  {
    objc_super v6 = (void *)MEMORY[0x1E4FB1818];
    char v7 = @"bookmark";
  }
  else
  {
    int v8 = [(WebBookmark *)self->_folder identifier];
    id v9 = [(WebBookmarkCollection *)self->_collection favoritesFolder];
    int v10 = [v9 identifier];

    objc_super v6 = (void *)MEMORY[0x1E4FB1818];
    if (v8 == v10) {
      char v7 = @"star";
    }
    else {
      char v7 = @"folder";
    }
  }
  v11 = [v6 systemImageNamed:v7];
  [v12 setImage:v11];
}

- (id)viewController
{
  viewController = self->_viewController;
  if (!viewController)
  {
    id v4 = [[BookmarksTableViewController alloc] initWithFolder:self->_folder inCollection:self->_collection];
    int v5 = self->_viewController;
    self->_viewController = v4;

    [(BookmarksTableViewController *)self->_viewController setDelegate:self];
    objc_super v6 = [(BookmarkFolderLibraryItemController *)self linkPreviewProvider];
    [(BookmarksTableViewController *)self->_viewController setLinkPreviewProvider:v6];

    [(BookmarksTableViewController *)self->_viewController setNavigationIntentHandler:self];
    char v7 = [(BookmarksTableViewController *)self->_viewController navigationItem];
    [v7 setLargeTitleDisplayMode:2];

    int v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:self selector:sel__folderContentsDidChange_ name:*MEMORY[0x1E4FB6158] object:0];

    id v9 = +[Application sharedApplication];
    int v10 = [v9 tabGroupManager];
    [v10 addTabGroupObserver:self];

    viewController = self->_viewController;
  }
  return viewController;
}

- (BOOL)selectionFollowsFocus
{
  return 0;
}

- (void)updateToolbarIfNeeded
{
  v3 = [(BookmarkFolderLibraryItemController *)self topViewController];
  id v4 = [(BookmarkFolderLibraryItemController *)self topViewController];
  int v5 = [(BookmarkFolderLibraryItemController *)self _toolbarItemsForViewController:v4];
  [v3 setToolbarItems:v5 animated:0];

  [(BookmarkFolderLibraryItemController *)self _createToolbarItemsIfNecessary];
}

- (id)topViewController
{
  v3 = [(BookmarksTableViewController *)self->_viewController navigationController];
  id v4 = [v3 topViewController];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  viewController = v4;
  if ((isKindOfClass & 1) == 0) {
    viewController = self->_viewController;
  }
  char v7 = viewController;

  return v7;
}

- (void)_folderContentsDidChange:(id)a3
{
  id v4 = [a3 userInfo];
  id v6 = [v4 valueForKey:*MEMORY[0x1E4FB6130]];

  int v5 = v6;
  if (v6)
  {
    -[BookmarkFolderLibraryItemController _reloadFolderContentsForFolderIDIfNeeded:](self, "_reloadFolderContentsForFolderIDIfNeeded:", [v6 intValue]);
    int v5 = v6;
  }
}

- (void)_reloadFolderContentsForFolderIDIfNeeded:(int)a3
{
  id v4 = [(BookmarkFolderLibraryItemController *)self topViewController];
  if ([v4 folderID] == a3) {
    [v4 reloadBookmarks];
  }
}

- (void)_didPressEditingDoneButton
{
}

- (void)_didPressEditButton
{
}

- (void)toggleEditBookmarks
{
}

- (void)_didPressNewFolderButton
{
  id v10 = [(BookmarkFolderLibraryItemController *)self topViewController];
  v3 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
  id v4 = objc_alloc(MEMORY[0x1E4FB60E0]);
  uint64_t v5 = [v10 folderID];
  id v6 = [v3 configuration];
  char v7 = objc_msgSend(v4, "initFolderWithParentID:collectionType:", v5, objc_msgSend(v6, "collectionType"));

  int v8 = (void *)[objc_alloc(MEMORY[0x1E4F3AF20]) initWithBookmark:v7 inCollection:v3 addingBookmark:0];
  [v8 setDelegate:self];
  id v9 = [v10 navigationController];
  [v9 pushViewController:v8 animated:1];
}

- (void)_createToolbarItemsIfNecessary
{
  if (!self->_createFolderButtonItem)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v4 = _WBSLocalizedString();
    uint64_t v5 = (UIBarButtonItem *)[v3 initWithTitle:v4 style:0 target:self action:sel__didPressNewFolderButton];
    createFolderButtonItem = self->_createFolderButtonItem;
    self->_createFolderButtonItem = v5;

    [(UIBarButtonItem *)self->_createFolderButtonItem setAccessibilityIdentifier:@"BookmarksNewFolderButton"];
    char v7 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:2 target:self action:sel__didPressEditButton];
    editButtonItem = self->_editButtonItem;
    self->_editButtonItem = v7;

    [(UIBarButtonItem *)self->_editButtonItem setAccessibilityIdentifier:@"BookmarksEditButton"];
    id v9 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__didPressEditingDoneButton];
    editingDoneButtonItem = self->_editingDoneButtonItem;
    self->_editingDoneButtonItem = v9;

    [(UIBarButtonItem *)self->_editingDoneButtonItem setAccessibilityIdentifier:@"BookmarksDoneButton"];
    v11 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    flexibleSpaceItem = self->_flexibleSpaceItem;
    self->_flexibleSpaceItem = v11;
  }
}

- (id)_toolbarItemsForViewController:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(BookmarkFolderLibraryItemController *)self _createToolbarItemsIfNecessary];
  uint64_t v5 = +[FeatureManager sharedFeatureManager];
  int v6 = [v5 isBookmarksAvailable];

  if (v6)
  {
    if (self->_isEditing && [v4 canCreateNewFolder])
    {
      flexibleSpaceItem = self->_flexibleSpaceItem;
      createFolderButtonItem = self->_createFolderButtonItem;
      v20 = flexibleSpaceItem;
      editingDoneButtonItem = self->_editingDoneButtonItem;
      int v8 = (void *)MEMORY[0x1E4F1C978];
      p_createFolderButtonItem = &createFolderButtonItem;
      uint64_t v10 = 3;
    }
    else
    {
      if ([v4 isEditing])
      {
        id v12 = self->_editingDoneButtonItem;
        v17 = self->_flexibleSpaceItem;
        v18 = v12;
        int v8 = (void *)MEMORY[0x1E4F1C978];
        p_createFolderButtonItem = &v17;
      }
      else
      {
        editButtonItem = self->_editButtonItem;
        v15 = self->_flexibleSpaceItem;
        v16 = editButtonItem;
        int v8 = (void *)MEMORY[0x1E4F1C978];
        p_createFolderButtonItem = &v15;
      }
      uint64_t v10 = 2;
    }
    v11 = objc_msgSend(v8, "arrayWithObjects:count:", p_createFolderButtonItem, v10, v15, v16, v17, v18, createFolderButtonItem, v20, editingDoneButtonItem, v22);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

- (void)_updateToolbarItemsForViewController:(id)a3 animated:(BOOL)a4
{
  if (self->_allowsEditing)
  {
    BOOL v4 = a4;
    id v6 = a3;
    id v7 = [(BookmarkFolderLibraryItemController *)self _toolbarItemsForViewController:v6];
    [v6 setToolbarItems:v7 animated:v4];
  }
}

- (void)_setEditingFromToolbarButton:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [MEMORY[0x1E4F781E8] sharedCoordinator];
  id v12 = v5;
  if (v3)
  {
    if (([v5 lockBookmarks] & 1) == 0)
    {
      id v6 = (void *)MEMORY[0x1E4F781E8];
      id v7 = [(BookmarkFolderLibraryItemController *)self topViewController];
      [v6 showLockedDatabaseAlertForAction:0 fromViewController:v7];

      int v8 = [MEMORY[0x1E4F97E48] sharedLogger];
      [v8 didPreventBookmarkActionWithBookmarkType:0 actionType:2];
      goto LABEL_6;
    }
  }
  else
  {
    [v5 unlockBookmarksSoon];
    id v9 = [(BookmarkFolderLibraryItemController *)self topViewController];
    uint64_t v10 = [v9 navigationController];
    v11 = [v10 navigationBar];
    [v11 setNeedsLayout];
  }
  int v8 = [(BookmarkFolderLibraryItemController *)self topViewController];
  self->_isEditing = v3;
  [v8 setEditing:v3 animated:1];
LABEL_6:
}

- (BOOL)bookmarkInfoViewControllerShouldUseTranslucentAppearance:(id)a3
{
  return 0;
}

- (BOOL)panelViewControllerShouldUseSearchControllerInNavigationItem:(id)a3
{
  return 1;
}

- (void)panelViewControllerDidBeginEditing:(id)a3
{
  id v4 = [(BookmarkFolderLibraryItemController *)self topViewController];
  [(BookmarkFolderLibraryItemController *)self _updateToolbarItemsForViewController:v4 animated:1];
}

- (void)panelViewControllerDidEndEditing:(id)a3
{
  id v4 = [(BookmarkFolderLibraryItemController *)self topViewController];
  [(BookmarkFolderLibraryItemController *)self _updateToolbarItemsForViewController:v4 animated:1];
}

- (UIEdgeInsets)separatorInsetForBookmarksTableViewController:(id)a3
{
  double v3 = *MEMORY[0x1E4FB2848];
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)contentInsetForBookmarksTableViewController:(id)a3
{
  double v3 = *MEMORY[0x1E4FB2848];
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)bookmarksTableViewShouldDispatchNavigationIntent:(id)a3 forSelectedBookmark:(id)a4
{
  return 1;
}

- (BOOL)bookmarksTableViewIsReadOnly:(id)a3
{
  return 0;
}

- (void)bookmarksTableViewControllerWillDisappear:(id)a3
{
  if (self->_isEditing)
  {
    id v4 = a3;
    [(BookmarkFolderLibraryItemController *)self _setEditingFromToolbarButton:0];
    [v4 setEditing:0];
  }
}

- (id)syntheticBookmarkProviderForBookmarkInfoViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
  return WeakRetained;
}

- (TabGroupProvider)tabGroupProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
  return (TabGroupProvider *)WeakRetained;
}

- (void)handleNavigationIntent:(id)a3 completion:(id)a4
{
  p_navigationIntentHandler = &self->_navigationIntentHandler;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_navigationIntentHandler);
  [WeakRetained handleNavigationIntent:v7 completion:v6];
}

- (void)dispatchNavigationIntent:(id)a3
{
  id v4 = a3;
  [v4 setShouldDismissSidebarOnLoad:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
  [WeakRetained dispatchNavigationIntent:v4];
}

- (BOOL)isSpringLoaded
{
  return 1;
}

- (unint64_t)dropOperationForSession:(id)a3
{
  return objc_msgSend(MEMORY[0x1E4FB60E0], "_sf_operationForDropSession:", a3);
}

- (int64_t)dropIntentForSession:(id)a3
{
  return 2;
}

- (void)performDropWithProposal:(id)a3 session:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [a3 operation];
  if (v7 == 2)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __71__BookmarkFolderLibraryItemController_performDropWithProposal_session___block_invoke;
    v17[3] = &unk_1E6D78008;
    v17[4] = self;
    objc_msgSend(MEMORY[0x1E4FB60E0], "_sf_webBookmarksFromDropSession:completionHandler:", v6, v17);
    goto LABEL_6;
  }
  if (v7 != 3)
  {
LABEL_6:
    v16 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v16 didUseSidebarAction:19];

    goto LABEL_7;
  }
  int v8 = [v6 items];
  id v9 = [v8 objectAtIndexedSubscript:0];
  uint64_t v10 = objc_msgSend(v9, "_sf_localBookmark");

  if (v10)
  {
    collection = self->_collection;
    v18[0] = v10;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    uint64_t v13 = [(WebBookmark *)self->_folder identifier];
    objc_super v14 = [(LibraryItemController *)self sectionController];
    v15 = [v14 presentingViewController];
    -[WebBookmarkCollection dropBookmarks:inFolderWithID:presentingViewController:isAddingBookmark:](collection, v12, v13, v15, 0);

    goto LABEL_6;
  }
LABEL_7:
}

void __71__BookmarkFolderLibraryItemController_performDropWithProposal_session___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 104);
  double v5 = *(void **)(v3 + 96);
  id v6 = a2;
  uint64_t v7 = [v5 identifier];
  id v9 = [*(id *)(a1 + 32) sectionController];
  int v8 = [v9 presentingViewController];
  -[WebBookmarkCollection dropBookmarks:inFolderWithID:presentingViewController:isAddingBookmark:](v4, v6, v7, v8, 1);
}

- (void)tabGroupManagerDidUpdateTabGroups:(id)a3
{
  id v3 = [(BookmarkFolderLibraryItemController *)self topViewController];
  [v3 reloadAllSyntheticFolders];
}

- (void)tabGroupManager:(id)a3 didRemoveTabGroupWithUUID:(id)a4
{
  id v4 = [(BookmarkFolderLibraryItemController *)self topViewController];
  [v4 reloadAllSyntheticFolders];
}

- (void)tabGroupManager:(id)a3 didUpdateTabGroupWithUUID:(id)a4
{
  id v4 = [(BookmarkFolderLibraryItemController *)self topViewController];
  [v4 reloadAllSyntheticFolders];
}

- (void)tabGroupManager:(id)a3 didUpdateScopedBookmarkList:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "folderID", a3);
  [(BookmarkFolderLibraryItemController *)self _reloadFolderContentsForFolderIDIfNeeded:v5];
}

- (id)accessibilityIdentifier
{
  return @"BookmarksLibraryItem";
}

- (WebBookmark)folder
{
  return self->_folder;
}

- (WebBookmarkCollection)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
}

- (WBBookmarkProvider)bookmarkProvider
{
  return self->_bookmarkProvider;
}

- (void)setBookmarkProvider:(id)a3
{
}

- (OS_dispatch_queue)bookmarkProviderQueue
{
  return self->_bookmarkProviderQueue;
}

- (void)setBookmarkProviderQueue:(id)a3
{
}

- (_SFNavigationIntentHandling)navigationIntentHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
  return (_SFNavigationIntentHandling *)WeakRetained;
}

- (void)setNavigationIntentHandler:(id)a3
{
}

- (LinkPreviewProvider)linkPreviewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_linkPreviewProvider);
  return (LinkPreviewProvider *)WeakRetained;
}

- (void)setLinkPreviewProvider:(id)a3
{
}

- (void)setTabGroupProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabGroupProvider);
  objc_destroyWeak((id *)&self->_linkPreviewProvider);
  objc_destroyWeak((id *)&self->_navigationIntentHandler);
  objc_storeStrong((id *)&self->_bookmarkProviderQueue, 0);
  objc_storeStrong((id *)&self->_bookmarkProvider, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_flexibleSpaceItem, 0);
  objc_storeStrong((id *)&self->_editingDoneButtonItem, 0);
  objc_storeStrong((id *)&self->_editButtonItem, 0);
  objc_storeStrong((id *)&self->_createFolderButtonItem, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end