@interface MailboxPickerCollectionHelperModel
+ (int64_t)indexOfFirstAccountSection:(id)a3;
+ (int64_t)indexOfLastAccountSection:(id)a3;
- (BOOL)hasMultipleAccounts;
- (FavoritesManager)manager;
- (MailboxPickerCollectionHelperModel)initWithFavoritesManager:(id)a3;
- (MailboxPickerCollectionHelperSection)favoritesSection;
- (NSArray)sections;
- (id)favoriteItemAtIndexPath:(id)a3;
- (id)favoriteItemForItemID:(id)a3 inSection:(id)a4;
- (id)indexPathForItem:(id)a3;
- (id)sectionForIndexPath:(id)a3;
- (void)invalidateSections;
- (void)setManager:(id)a3;
- (void)setSections:(id)a3;
@end

@implementation MailboxPickerCollectionHelperModel

- (MailboxPickerCollectionHelperSection)favoritesSection
{
  v2 = [(MailboxPickerCollectionHelperModel *)self sections];
  v3 = [v2 ef_firstObjectPassingTest:&stru_1006080A0];

  return (MailboxPickerCollectionHelperSection *)v3;
}

- (MailboxPickerCollectionHelperModel)initWithFavoritesManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MailboxPickerCollectionHelperModel;
  v6 = [(MailboxPickerCollectionHelperModel *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_manager, a3);
  }

  return v7;
}

- (id)indexPathForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(MailboxPickerCollectionHelperModel *)self sections];
  for (unint64_t i = 0; ; ++i)
  {
    if (i >= (unint64_t)[v5 count])
    {
      v16 = 0;
      goto LABEL_15;
    }
    v7 = [v5 objectAtIndexedSubscript:i];
    v8 = [v7 items];
    if ([v8 count])
    {
      objc_super v9 = [v7 items];
      id v10 = [v9 indexOfObject:v4];

      if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v16 = +[NSIndexPath indexPathForRow:v10 inSection:i];
        goto LABEL_14;
      }
    }
    else
    {
    }
    v11 = [v7 accountFavoriteItem];
    v12 = v11;
    if (v11) {
      break;
    }
LABEL_12:
  }
  v13 = [v11 subItems];
  if (![v13 count])
  {

    goto LABEL_12;
  }
  v14 = [v12 subItems];
  v15 = (char *)[v14 indexOfObject:v4];

  if (v15 == (char *)0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_12;
  }
  v16 = +[NSIndexPath indexPathForRow:v15 + 1 inSection:i];

LABEL_14:
LABEL_15:

  return v16;
}

- (NSArray)sections
{
  sections = self->_sections;
  if (!sections)
  {
    v30 = self;
    id v4 = [(MailboxPickerCollectionHelperModel *)self manager];
    id v5 = [v4 visibleMailboxCollections];

    v35 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = v5;
    id v33 = [obj countByEnumeratingWithState:&v40 objects:v54 count:16];
    if (v33)
    {
      uint64_t v32 = *(void *)v41;
      do
      {
        for (unint64_t i = 0; i != v33; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v41 != v32) {
            objc_enumerationMutation(obj);
          }
          v6 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          if ([v6 isAccountsCollection])
          {
            v7 = [v6 visibleItemsOfType:1];
            long long v38 = 0u;
            long long v39 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            v8 = v7;
            id v9 = [(MailboxPickerCollectionHelperSection *)v8 countByEnumeratingWithState:&v36 objects:v53 count:16];
            if (v9)
            {
              uint64_t v10 = 0;
              uint64_t v11 = *(void *)v37;
              do
              {
                for (j = 0; j != v9; j = (char *)j + 1)
                {
                  if (*(void *)v37 != v11) {
                    objc_enumerationMutation(v8);
                  }
                  uint64_t v13 = *(void *)(*((void *)&v36 + 1) + 8 * (void)j);
                  v14 = [MailboxPickerCollectionHelperSection alloc];
                  uint64_t v52 = v13;
                  v15 = +[NSArray arrayWithObjects:&v52 count:1];
                  v16 = [(MailboxPickerCollectionHelperSection *)v14 initWithAccountsCollection:v6 index:(char *)j + v10 items:v15];
                  [v35 addObject:v16];
                }
                id v9 = [(MailboxPickerCollectionHelperSection *)v8 countByEnumeratingWithState:&v36 objects:v53 count:16];
                v10 += (uint64_t)j;
              }
              while (v9);
            }
          }
          else
          {
            v8 = [[MailboxPickerCollectionHelperSection alloc] initWithCollection:v6];
            [v35 addObject:v8];
          }
        }
        id v33 = [obj countByEnumeratingWithState:&v40 objects:v54 count:16];
      }
      while (v33);
    }

    v17 = v35;
    v18 = v17;
    if ([(NSArray *)v17 count])
    {
      v19 = +[NSMutableArray arrayWithCapacity:[(NSArray *)v17 count]];
      v51[0] = 0;
      v51[1] = v51;
      v51[2] = 0x2020000000;
      v51[3] = 0;
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_10004B524;
      v48[3] = &unk_1006049F0;
      id v20 = v19;
      id v49 = v20;
      v50 = v51;
      v21 = objc_retainBlock(v48);
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      v22 = v17;
      id v23 = [(NSArray *)v22 countByEnumeratingWithState:&v44 objects:v55 count:16];
      if (v23)
      {
        char v24 = 0;
        uint64_t v25 = *(void *)v45;
        do
        {
          for (k = 0; k != v23; k = (char *)k + 1)
          {
            if (*(void *)v45 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v44 + 1) + 8 * (void)k);
            if (!(v24 & 1 | (([v27 isAccounts] & 1) == 0)))
            {
              ((void (*)(void *))v21[2])(v21);
              char v24 = 1;
            }
            [v20 addObject:v27];
            if ([v27 isAccounts]) {
              ((void (*)(void *))v21[2])(v21);
            }
          }
          id v23 = [(NSArray *)v22 countByEnumeratingWithState:&v44 objects:v55 count:16];
        }
        while (v23);
      }

      v18 = (NSArray *)v20;
      _Block_object_dispose(v51, 8);
    }
    v28 = v30->_sections;
    v30->_sections = v18;

    sections = v30->_sections;
  }

  return sections;
}

- (id)favoriteItemForItemID:(id)a3 inSection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 itemsByItemID];
  v8 = [v7 objectForKeyedSubscript:v5];

  if (!v8)
  {
    [v6 _reloadItemsByItemID];
    id v9 = [v6 itemsByItemID];
    v8 = [v9 objectForKeyedSubscript:v5];
  }

  return v8;
}

- (void)setSections:(id)a3
{
}

- (FavoritesManager)manager
{
  return self->_manager;
}

- (void)invalidateSections
{
}

- (BOOL)hasMultipleAccounts
{
  v2 = [(MailboxPickerCollectionHelperModel *)self manager];
  v3 = [v2 accountsCollection];
  id v4 = [v3 visibleItemsOfType:1];
  BOOL v5 = (unint64_t)[v4 count] > 1;

  return v5;
}

+ (int64_t)indexOfFirstAccountSection:(id)a3
{
  return (int64_t)[a3 indexOfObjectPassingTest:&stru_100608040];
}

+ (int64_t)indexOfLastAccountSection:(id)a3
{
  return (int64_t)_[a3 indexOfObjectWithOptions:2 passingTest:&stru_100608060];
}

- (id)sectionForIndexPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MailboxPickerCollectionHelperModel *)self sections];
  id v6 = [v5 objectAtIndexedSubscript:[v4 section]];

  return v6;
}

- (id)favoriteItemAtIndexPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MailboxPickerCollectionHelperModel *)self sectionForIndexPath:v4];
  if ([v5 isAccounts])
  {
    id v6 = [v5 items];
    if ([v6 count])
    {
      id v7 = [v4 row];

      if (!v7)
      {
        v8 = [v5 items];
        uint64_t v9 = [v8 objectAtIndexedSubscript:[v4 row]];
LABEL_13:
        v12 = (void *)v9;
        goto LABEL_17;
      }
    }
    else
    {
    }
    v8 = [v5 accountFavoriteItem];
    if (v8 && [v4 row])
    {
      uint64_t v10 = [v8 subItems];
      uint64_t v11 = (char *)[v4 row];
      if (v11 - 1 >= [v10 count])
      {
        v12 = 0;
      }
      else
      {
        v12 = [v10 objectAtIndexedSubscript:];
      }

      goto LABEL_17;
    }
  }
  v8 = [v5 items];
  id v13 = [v4 row];
  if (v13 < [v8 count])
  {
    uint64_t v9 = [v8 objectAtIndexedSubscript:[v4 row]];
    goto LABEL_13;
  }
  v12 = 0;
LABEL_17:

  return v12;
}

- (void)setManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);

  objc_storeStrong((id *)&self->_sections, 0);
}

@end