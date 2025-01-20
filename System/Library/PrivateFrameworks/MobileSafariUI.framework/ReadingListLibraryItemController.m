@interface ReadingListLibraryItemController
- (BOOL)isSpringLoaded;
- (BOOL)panelViewControllerShouldUseSearchControllerInNavigationItem:(id)a3;
- (BOOL)selectionFollowsFocus;
- (id)_bookmarksNavigationControllerDelegate;
- (id)accessibilityIdentifier;
- (id)readingListViewControllerCurrentReadingListItem:(id)a3;
- (id)viewController;
- (int64_t)dropIntentForSession:(id)a3;
- (unint64_t)dropOperationForSession:(id)a3;
- (void)performDropWithProposal:(id)a3 session:(id)a4;
- (void)readingListViewController:(id)a3 setBookmark:(id)a4 asRead:(BOOL)a5;
- (void)readingListViewController:(id)a3 updateUnreadFilterShowingAllBookmarks:(BOOL)a4;
- (void)updateListContentConfiguration:(id)a3;
@end

@implementation ReadingListLibraryItemController

- (void)updateListContentConfiguration:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB1818];
  id v4 = a3;
  v5 = [v3 systemImageNamed:@"eyeglasses"];
  [v4 setImage:v5];

  _WBSLocalizedString();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setText:v6];
}

- (id)viewController
{
  viewController = self->_viewController;
  if (!viewController)
  {
    id v4 = objc_alloc_init(ReadingListViewController);
    v5 = self->_viewController;
    self->_viewController = v4;

    [(ReadingListViewController *)self->_viewController setDelegate:self];
    id v6 = [(LibraryItemController *)self configuration];
    v7 = [v6 linkPreviewProvider];
    [(ReadingListViewController *)self->_viewController setLinkPreviewProvider:v7];

    v8 = [(LibraryItemController *)self configuration];
    v9 = [v8 navigationIntentHandler];
    [(ReadingListViewController *)self->_viewController setNavigationIntentHandler:v9];

    v10 = [(LibraryItemController *)self configuration];
    v11 = [v10 tabGroupProvider];
    [(ReadingListViewController *)self->_viewController setTabGroupProvider:v11];

    v12 = [(ReadingListViewController *)self->_viewController navigationItem];
    [v12 setLargeTitleDisplayMode:2];

    viewController = self->_viewController;
  }
  return viewController;
}

- (BOOL)selectionFollowsFocus
{
  return 0;
}

- (id)_bookmarksNavigationControllerDelegate
{
  v2 = [(LibraryItemController *)self configuration];
  v3 = [v2 bookmarksNavigationControllerDelegate];

  return v3;
}

- (BOOL)panelViewControllerShouldUseSearchControllerInNavigationItem:(id)a3
{
  return 1;
}

- (id)readingListViewControllerCurrentReadingListItem:(id)a3
{
  v3 = [(ReadingListLibraryItemController *)self _bookmarksNavigationControllerDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 bookmarksNavigationControllerCurrentContinuousReadingItem:0];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)readingListViewController:(id)a3 setBookmark:(id)a4 asRead:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v7 = [(ReadingListLibraryItemController *)self _bookmarksNavigationControllerDelegate];
  if (objc_opt_respondsToSelector()) {
    [v7 bookmarksNavigationController:0 setBookmark:v8 asRead:v5];
  }
}

- (void)readingListViewController:(id)a3 updateUnreadFilterShowingAllBookmarks:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(ReadingListLibraryItemController *)self _bookmarksNavigationControllerDelegate];
  if (objc_opt_respondsToSelector()) {
    [v5 bookmarksNavigationController:0 updateReadingListUnreadFilterShowingAllBookmarks:v4];
  }
}

- (BOOL)isSpringLoaded
{
  return 1;
}

- (unint64_t)dropOperationForSession:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB60E8];
  id v4 = a3;
  id v5 = [v3 mainBookmarkCollection];
  unint64_t v6 = -[WebBookmarkCollection dropOperationForReadingListDropSession:]((uint64_t)v5, v4);

  return v6;
}

- (int64_t)dropIntentForSession:(id)a3
{
  return 2;
}

- (void)performDropWithProposal:(id)a3 session:(id)a4
{
  id v4 = (void *)MEMORY[0x1E4FB60E8];
  id v5 = a4;
  unint64_t v6 = [v4 mainBookmarkCollection];
  v7 = [v5 items];

  -[WebBookmarkCollection dropDragItemsInReadingList:updatingController:]((uint64_t)v6, v7, 0);
  id v8 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v8 didUseSidebarAction:20];
}

- (id)accessibilityIdentifier
{
  return @"ReadingListLibraryItem";
}

- (void).cxx_destruct
{
}

@end