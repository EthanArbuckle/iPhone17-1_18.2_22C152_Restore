@interface FavoritesShortcutsProvider
- (FavoritesManager)favoritesManager;
- (MFMailboxProvider)mailboxProvider;
- (NSArray)filteredItems;
- (void)setFavoritesManager:(id)a3;
- (void)setMailboxProvider:(id)a3;
@end

@implementation FavoritesShortcutsProvider

- (NSArray)filteredItems
{
  v3 = [(FavoritesShortcutsProvider *)self favoritesManager];
  v4 = [v3 mailboxesCollection];
  v5 = [v4 visibleItems];

  if (![(NSArray *)self->_items isEqualToArray:v5])
  {
    objc_storeStrong((id *)&self->_items, v5);
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v11[3] = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000C3100;
    v10[3] = &unk_100607060;
    v10[4] = v11;
    [v5 ef_compactMap:v10];
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    filteredItems = self->_filteredItems;
    self->_filteredItems = v6;

    _Block_object_dispose(v11, 8);
  }
  v8 = self->_filteredItems;

  return v8;
}

- (FavoritesManager)favoritesManager
{
  return (FavoritesManager *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFavoritesManager:(id)a3
{
}

- (MFMailboxProvider)mailboxProvider
{
  return (MFMailboxProvider *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMailboxProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxProvider, 0);
  objc_storeStrong((id *)&self->_favoritesManager, 0);
  objc_storeStrong((id *)&self->_filteredItems, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end