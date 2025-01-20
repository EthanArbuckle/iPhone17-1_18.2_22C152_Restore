@interface ICSEFolderListViewState
- (BOOL)overrideCollapsed;
- (ICSEFolderListViewState)init;
- (NSCountedSet)folderNamesCountedSet;
- (NSMutableArray)accounts;
- (NSMutableSet)collapsedAccountIdentifiers;
- (NSMutableSet)expandedFolderIdentifiers;
- (NSNumber)customFoldersExistValue;
- (NSString)overrideCollapsedFolder;
- (id)accountItemAtIndex:(unint64_t)a3;
- (id)description;
- (id)itemAtIndexPath:(id)a3;
- (unint64_t)countOfAccounts;
- (unint64_t)countOfItemsInAccountAtIndex:(unint64_t)a3;
- (unint64_t)getModernAccountFolderListType:(id)a3;
- (void)addAccount:(id)a3;
- (void)addFolderListItem:(id)a3;
- (void)removeAccounts;
- (void)setAccounts:(id)a3;
- (void)setCollapsedAccountIdentifiers:(id)a3;
- (void)setCustomFoldersExistValue:(id)a3;
- (void)setExpandedFolderIdentifiers:(id)a3;
- (void)setFolderNamesCountedSet:(id)a3;
- (void)setOverrideCollapsed:(BOOL)a3;
- (void)setOverrideCollapsedFolder:(id)a3;
@end

@implementation ICSEFolderListViewState

- (ICSEFolderListViewState)init
{
  v10.receiver = self;
  v10.super_class = (Class)ICSEFolderListViewState;
  v2 = [(ICSEFolderListViewState *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    accounts = v2->_accounts;
    v2->_accounts = v3;

    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    expandedFolderIdentifiers = v2->_expandedFolderIdentifiers;
    v2->_expandedFolderIdentifiers = v5;

    v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    collapsedAccountIdentifiers = v2->_collapsedAccountIdentifiers;
    v2->_collapsedAccountIdentifiers = v7;
  }
  return v2;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(ICSEFolderListViewState *)self accounts];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        objc_super v10 = +[NSString stringWithFormat:@"\nAccount %lu\n%@\n", (char *)i + v7, *(void *)(*((void *)&v12 + 1) + 8 * i)];
        [v3 appendString:v10];
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      v7 += (uint64_t)i;
    }
    while (v6);
  }

  return v3;
}

- (void)addAccount:(id)a3
{
  id v4 = a3;
  id v5 = [[ICSEFolderListItem alloc] initWithViewState:self];
  [(ICSEFolderListItem *)v5 setIsAccount:1];
  [(ICSEFolderListItem *)v5 setNoteContainer:v4];
  [(ICSEFolderListItem *)v5 setParent:0];
  [(ICSEFolderListItem *)v5 setFolderListItemAccountType:[(ICSEFolderListViewState *)self getModernAccountFolderListType:v4]];
  id v6 = self;
  [(ICSEFolderListViewState *)self addFolderListItem:v5];
  [v4 visibleNoteContainerChildren];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (char *)[obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(obj);
        }
        objc_opt_class();
        v11 = ICDynamicCast();
        if (v11)
        {
          long long v12 = [[ICSEFolderListItem alloc] initWithViewState:v6];
          [(ICSEFolderListItem *)v12 setIsAccount:1];
          [(ICSEFolderListItem *)v12 setNoteContainer:v4];
          [(ICSEFolderListItem *)v12 setParent:v5];
          [(ICSEFolderListItem *)v5 addChildItem:v12];
        }
        objc_opt_class();
        long long v13 = ICDynamicCast();
        if ([v13 isVisible] && (objc_msgSend(v13, "isTrashFolder") & 1) == 0) {
          [(ICSEFolderListItem *)v5 recursivelyAddChildFolder:v13];
        }
      }
      uint64_t v8 = (char *)[obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (unint64_t)getModernAccountFolderListType:(id)a3
{
  id v3 = a3;
  if ([v3 accountType] == 1)
  {
    unint64_t v4 = [v3 isManaged];
  }
  else if ([v3 accountType] == 3)
  {
    unint64_t v4 = 2;
  }
  else
  {
    id v5 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1004D4E9C((uint64_t)v3, v5);
    }

    unint64_t v4 = 3;
  }

  return v4;
}

- (void)addFolderListItem:(id)a3
{
  id v4 = a3;
  id v5 = [(ICSEFolderListViewState *)self accounts];
  [v5 addObject:v4];

  id v6 = [(ICSEFolderListViewState *)self accounts];
  [v6 sortUsingComparator:&stru_1006266C0];
}

- (unint64_t)countOfAccounts
{
  v2 = [(ICSEFolderListViewState *)self accounts];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (void)removeAccounts
{
  id v2 = [(ICSEFolderListViewState *)self accounts];
  [v2 removeAllObjects];
}

- (unint64_t)countOfItemsInAccountAtIndex:(unint64_t)a3
{
  id v5 = [(ICSEFolderListViewState *)self accounts];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3) {
    return 0;
  }
  uint64_t v7 = [(ICSEFolderListViewState *)self accounts];
  uint64_t v8 = [v7 objectAtIndex:a3];

  uint64_t v9 = [v8 flattenedChildItems];
  id v10 = [v9 count];

  return (unint64_t)v10;
}

- (id)accountItemAtIndex:(unint64_t)a3
{
  id v5 = [(ICSEFolderListViewState *)self accounts];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3)
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "0", "-[ICSEFolderListViewState accountItemAtIndex:]", 1, 0, @"Index %lu out of range for accounts", a3);
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = [(ICSEFolderListViewState *)self accounts];
    uint64_t v8 = [v7 objectAtIndex:a3];
  }

  return v8;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 section];
  id v6 = [(ICSEFolderListViewState *)self accounts];
  if (v5 >= [v6 count])
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = [(ICSEFolderListViewState *)self accounts];
    uint64_t v8 = [v7 objectAtIndex:[v4 section]];
  }
  uint64_t v9 = [v8 flattenedChildItems];
  if (v9 && (id v10 = [v4 row], v10 < objc_msgSend(v9, "count")))
  {
    v11 = [v9 objectAtIndex:[v4 row]];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setOverrideCollapsed:(BOOL)a3
{
  self->_overrideCollapsed = a3;
  [(ICSEFolderListViewState *)self setOverrideCollapsedFolder:0];
}

- (NSMutableSet)expandedFolderIdentifiers
{
  return self->_expandedFolderIdentifiers;
}

- (void)setExpandedFolderIdentifiers:(id)a3
{
}

- (NSMutableSet)collapsedAccountIdentifiers
{
  return self->_collapsedAccountIdentifiers;
}

- (void)setCollapsedAccountIdentifiers:(id)a3
{
}

- (BOOL)overrideCollapsed
{
  return self->_overrideCollapsed;
}

- (NSString)overrideCollapsedFolder
{
  return self->_overrideCollapsedFolder;
}

- (void)setOverrideCollapsedFolder:(id)a3
{
}

- (NSMutableArray)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
}

- (NSCountedSet)folderNamesCountedSet
{
  return self->_folderNamesCountedSet;
}

- (void)setFolderNamesCountedSet:(id)a3
{
}

- (NSNumber)customFoldersExistValue
{
  return self->_customFoldersExistValue;
}

- (void)setCustomFoldersExistValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customFoldersExistValue, 0);
  objc_storeStrong((id *)&self->_folderNamesCountedSet, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_overrideCollapsedFolder, 0);
  objc_storeStrong((id *)&self->_collapsedAccountIdentifiers, 0);

  objc_storeStrong((id *)&self->_expandedFolderIdentifiers, 0);
}

@end