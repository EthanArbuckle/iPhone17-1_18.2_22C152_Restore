@interface WBSExtensionCyclerCommandHandler
- (void)clearBookmarksWithOptions:(unint64_t)a3 completionHandler:(id)a4;
- (void)createBookmarkListWithTitle:(id)a3 inListWithIdentifier:(id)a4 atIndex:(unint64_t)a5 reply:(id)a6;
- (void)createBookmarkWithTitle:(id)a3 url:(id)a4 inListWithIdentifier:(id)a5 atIndex:(unint64_t)a6 reply:(id)a7;
- (void)deleteBookmarkWithIdentifier:(id)a3 reply:(id)a4;
- (void)fetchTopLevelBookmarkList:(id)a3;
- (void)moveBookmarkWithIdentifier:(id)a3 intoListWithIdentifier:(id)a4 atIndex:(unint64_t)a5 reply:(id)a6;
- (void)setTitle:(id)a3 forBookmarkWithIdentifier:(id)a4 reply:(id)a5;
- (void)setURL:(id)a3 forBookmarkWithIdentifier:(id)a4 reply:(id)a5;
- (void)syncBookmarksWithCompletionHandler:(id)a3;
@end

@implementation WBSExtensionCyclerCommandHandler

- (void)clearBookmarksWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
}

- (void)createBookmarkListWithTitle:(id)a3 inListWithIdentifier:(id)a4 atIndex:(unint64_t)a5 reply:(id)a6
{
}

- (void)createBookmarkWithTitle:(id)a3 url:(id)a4 inListWithIdentifier:(id)a5 atIndex:(unint64_t)a6 reply:(id)a7
{
}

- (void)deleteBookmarkWithIdentifier:(id)a3 reply:(id)a4
{
}

- (void)fetchTopLevelBookmarkList:(id)a3
{
  id v4 = a3;
  v5 = [[WBSCyclerItemListRepresentation alloc] initWithTitle:0 uniqueIdentifier:&stru_1EFBE3CF8];
  (*((void (**)(id, WBSCyclerItemListRepresentation *))a3 + 2))(v4, v5);
}

- (void)moveBookmarkWithIdentifier:(id)a3 intoListWithIdentifier:(id)a4 atIndex:(unint64_t)a5 reply:(id)a6
{
}

- (void)setTitle:(id)a3 forBookmarkWithIdentifier:(id)a4 reply:(id)a5
{
}

- (void)setURL:(id)a3 forBookmarkWithIdentifier:(id)a4 reply:(id)a5
{
}

- (void)syncBookmarksWithCompletionHandler:(id)a3
{
}

@end