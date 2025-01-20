@interface MailboxPickerCollectionHelperSection
- (BOOL)isAccounts;
- (BOOL)isFavorites;
- (BOOL)isOutbox;
- (BOOL)isPlaceholder;
- (FavoritesCollection)collection;
- (MailboxPickerCollectionHelperSection)initWithAccountsCollection:(id)a3 index:(int64_t)a4 items:(id)a5;
- (MailboxPickerCollectionHelperSection)initWithCollection:(id)a3;
- (NSArray)items;
- (NSDictionary)itemsByItemID;
- (NSString)sectionIdentifier;
- (id)accountFavoriteItem;
- (id)initPlaceholderWithSectionIdentifierIndex:(int64_t)a3;
- (int64_t)accountIndex;
- (int64_t)type;
- (void)_reloadItemsByItemID;
- (void)prepareItemsForView;
- (void)setAccountIndex:(int64_t)a3;
- (void)setItems:(id)a3;
- (void)setItemsByItemID:(id)a3;
- (void)setSectionIdentifier:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation MailboxPickerCollectionHelperSection

- (MailboxPickerCollectionHelperSection)initWithCollection:(id)a3
{
  id v6 = a3;
  if ([v6 isAccountsCollection])
  {
    v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2, self, @"MailboxPickerCollectionHelperModel.m", 46, @"Invalid parameter not satisfying: %@", @"![collection isAccountsCollection]" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)MailboxPickerCollectionHelperSection;
  v7 = [(MailboxPickerCollectionHelperSection *)&v16 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_collection, a3);
    [(MailboxPickerCollectionHelperSection *)v8 setAccountIndex:0x7FFFFFFFFFFFFFFFLL];
    v9 = [v6 uniqueId];
    [(MailboxPickerCollectionHelperSection *)v8 setSectionIdentifier:v9];

    if ([v6 isMailboxesCollection])
    {
      uint64_t v10 = 0;
    }
    else
    {
      if (![v6 isOutboxCollection])
      {
        v11 = +[NSAssertionHandler currentHandler];
        [v11 handleFailureInMethod:a2 object:v8 file:@"MailboxPickerCollectionHelperModel.m" lineNumber:59 description:@"Unexpected collection type"];

        goto LABEL_10;
      }
      uint64_t v10 = 1;
    }
    [(MailboxPickerCollectionHelperSection *)v8 setType:v10];
LABEL_10:
    v12 = [v6 items];
    v13 = sub_10000EF0C((uint64_t)v8, v12);
    [(MailboxPickerCollectionHelperSection *)v8 setItemsByItemID:v13];
  }
  return v8;
}

- (MailboxPickerCollectionHelperSection)initWithAccountsCollection:(id)a3 index:(int64_t)a4 items:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  if (([v10 isAccountsCollection] & 1) == 0)
  {
    v21 = +[NSAssertionHandler currentHandler];
    [v21 handleFailureInMethod:a2, self, @"MailboxPickerCollectionHelperModel.m", 28, @"Invalid parameter not satisfying: %@", @"[collection isAccountsCollection]" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)MailboxPickerCollectionHelperSection;
  v12 = [(MailboxPickerCollectionHelperSection *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_collection, a3);
    [(MailboxPickerCollectionHelperSection *)v13 setAccountIndex:a4];
    [(MailboxPickerCollectionHelperSection *)v13 setItems:v11];
    [(MailboxPickerCollectionHelperSection *)v13 setType:2];
    v14 = [v10 uniqueId];
    v15 = [v11 firstObject];
    objc_super v16 = [v15 itemID];
    v17 = +[NSString stringWithFormat:@"%@-%@", v14, v16];
    [(MailboxPickerCollectionHelperSection *)v13 setSectionIdentifier:v17];

    v18 = [v10 items];
    v19 = sub_10000EF0C((uint64_t)v13, v18);
    [(MailboxPickerCollectionHelperSection *)v13 setItemsByItemID:v19];
  }
  return v13;
}

- (void)prepareItemsForView
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(MailboxPickerCollectionHelperSection *)self collection];
  v3 = [v2 items];

  id v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) prepareItemForView];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (NSArray)items
{
  items = self->_items;
  if (items)
  {
    v3 = items;
  }
  else
  {
    id v4 = [(MailboxPickerCollectionHelperSection *)self collection];
    v3 = [v4 visibleItems];
  }

  return v3;
}

- (BOOL)isFavorites
{
  return [(MailboxPickerCollectionHelperSection *)self type] == 0;
}

- (FavoritesCollection)collection
{
  return self->_collection;
}

- (id)accountFavoriteItem
{
  v3 = [(MailboxPickerCollectionHelperSection *)self items];
  if ([(MailboxPickerCollectionHelperSection *)self isAccounts]
    && [v3 count]
    && ([v3 objectAtIndexedSubscript:0],
        id v4 = objc_claimAutoreleasedReturnValue(),
        id v5 = [v4 type],
        v4,
        v5 == (id)1))
  {
    id v6 = [v3 objectAtIndexedSubscript:0];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)isAccounts
{
  return (id)[(MailboxPickerCollectionHelperSection *)self type] == (id)2;
}

- (NSDictionary)itemsByItemID
{
  return self->_itemsByItemID;
}

- (id)initPlaceholderWithSectionIdentifierIndex:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MailboxPickerCollectionHelperSection;
  id v4 = [(MailboxPickerCollectionHelperSection *)&v8 init];
  id v5 = v4;
  if (v4)
  {
    [(MailboxPickerCollectionHelperSection *)v4 setItems:&__NSArray0__struct];
    [(MailboxPickerCollectionHelperSection *)v5 setItemsByItemID:&__NSDictionary0__struct];
    [(MailboxPickerCollectionHelperSection *)v5 setType:3];
    id v6 = +[NSString stringWithFormat:@"Placeholder:%ld", a3];
    [(MailboxPickerCollectionHelperSection *)v5 setSectionIdentifier:v6];
  }
  return v5;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setSectionIdentifier:(id)a3
{
}

- (void)setItemsByItemID:(id)a3
{
}

- (void)setItems:(id)a3
{
}

- (void)setAccountIndex:(int64_t)a3
{
  self->_accountIndex = a3;
}

- (BOOL)isOutbox
{
  return (id)[(MailboxPickerCollectionHelperSection *)self type] == (id)1;
}

- (BOOL)isPlaceholder
{
  return (id)[(MailboxPickerCollectionHelperSection *)self type] == (id)3;
}

- (void)_reloadItemsByItemID
{
  id v4 = [(MailboxPickerCollectionHelperSection *)self items];
  v3 = sub_10000EF0C((uint64_t)self, v4);
  [(MailboxPickerCollectionHelperSection *)self setItemsByItemID:v3];
}

- (int64_t)accountIndex
{
  return self->_accountIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsByItemID, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);

  objc_storeStrong((id *)&self->_collection, 0);
}

@end