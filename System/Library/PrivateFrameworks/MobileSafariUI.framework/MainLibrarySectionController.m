@interface MainLibrarySectionController
- (MainLibrarySectionController)initWithConfiguration:(id)a3;
- (id)itemControllers;
- (id)title;
- (void)registerItemsWithRegistration:(id)a3;
- (void)updateToolbarIfNeeded;
@end

@implementation MainLibrarySectionController

- (MainLibrarySectionController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MainLibrarySectionController;
  v5 = [(LibrarySectionController *)&v23 initWithConfiguration:v4];
  if (v5)
  {
    v6 = [[HistoryLibraryItemController alloc] initWithConfiguration:v4 sectionController:v5];
    historyController = v5->_historyController;
    v5->_historyController = v6;

    v8 = [[ReadingListLibraryItemController alloc] initWithConfiguration:v4 sectionController:v5];
    readingListController = v5->_readingListController;
    v5->_readingListController = v8;

    v10 = [MEMORY[0x1E4FB60E8] safariBookmarkCollection];
    v11 = (void *)[objc_alloc(MEMORY[0x1E4FB60F0]) initReadonlySafariBookmarkCollection];
    id v12 = [NSString stringWithFormat:@"com.apple.mobilesafari.%@.%p", objc_opt_class(), v5];
    dispatch_queue_t v13 = dispatch_queue_create((const char *)[v12 UTF8String], 0);

    v14 = [BookmarkFolderLibraryItemController alloc];
    v15 = [v10 rootBookmark];
    uint64_t v16 = [(BookmarkFolderLibraryItemController *)v14 initWithConfiguration:v4 sectionController:v5 folder:v15];
    bookmarksItemController = v5->_bookmarksItemController;
    v5->_bookmarksItemController = (BookmarkFolderLibraryItemController *)v16;

    [(BookmarkFolderLibraryItemController *)v5->_bookmarksItemController setCollection:v10];
    [(BookmarkFolderLibraryItemController *)v5->_bookmarksItemController setBookmarkProvider:v11];
    [(BookmarkFolderLibraryItemController *)v5->_bookmarksItemController setBookmarkProviderQueue:v13];
    v18 = [v4 linkPreviewProvider];
    [(BookmarkFolderLibraryItemController *)v5->_bookmarksItemController setLinkPreviewProvider:v18];

    v19 = [v4 navigationIntentHandler];
    [(BookmarkFolderLibraryItemController *)v5->_bookmarksItemController setNavigationIntentHandler:v19];

    v20 = [v4 tabGroupProvider];
    [(BookmarkFolderLibraryItemController *)v5->_bookmarksItemController setTabGroupProvider:v20];

    v21 = v5;
  }

  return v5;
}

- (id)itemControllers
{
  v5[3] = *MEMORY[0x1E4F143B8];
  readingListController = self->_readingListController;
  v5[0] = self->_bookmarksItemController;
  v5[1] = readingListController;
  v5[2] = self->_historyController;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  return v3;
}

- (id)title
{
  return &stru_1F3C268E8;
}

- (void)registerItemsWithRegistration:(id)a3
{
  historyController = self->_historyController;
  id v5 = a3;
  [v5 registerItem:historyController forCollectionType:@"HistoryCollection"];
  [v5 registerItem:self->_readingListController forCollectionType:@"ReadingListCollection"];
  [v5 registerItem:self->_bookmarksItemController forCollectionType:@"BookmarksCollection"];
}

- (void)updateToolbarIfNeeded
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarksItemController, 0);
  objc_storeStrong((id *)&self->_readingListController, 0);
  objc_storeStrong((id *)&self->_historyController, 0);
}

@end