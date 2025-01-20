@interface ICSEFolderListItem
- (BOOL)isAccount;
- (BOOL)isCollapsed;
- (BOOL)isCollapsible;
- (BOOL)isDefaultFolder;
- (ICNoteContainer)noteContainer;
- (ICSEFolderListItem)initWithViewState:(id)a3;
- (ICSEFolderListItem)parent;
- (ICSEFolderListViewState)viewState;
- (NSMutableArray)children;
- (NSString)title;
- (id)description;
- (id)flattenedChildItems;
- (unint64_t)countOfVisibleDescendants;
- (unint64_t)folderListItemAccountType;
- (unint64_t)level;
- (void)addChildItem:(id)a3;
- (void)insertChildItem:(id)a3 atIndex:(unint64_t)a4;
- (void)recursivelyAddChildFolder:(id)a3;
- (void)setChildren:(id)a3;
- (void)setCollapsed:(BOOL)a3;
- (void)setFolderListItemAccountType:(unint64_t)a3;
- (void)setIsAccount:(BOOL)a3;
- (void)setIsDefaultFolder:(BOOL)a3;
- (void)setNoteContainer:(id)a3;
- (void)setParent:(id)a3;
- (void)setViewState:(id)a3;
@end

@implementation ICSEFolderListItem

- (ICSEFolderListItem)initWithViewState:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICSEFolderListItem;
  v5 = [(ICSEFolderListItem *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_viewState, v4);
    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    children = v6->_children;
    v6->_children = v7;
  }
  return v6;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  if ([(ICSEFolderListItem *)self level])
  {
    unint64_t v4 = 0;
    do
    {
      [v3 appendString:@"    "];
      ++v4;
    }
    while (v4 < [(ICSEFolderListItem *)self level]);
  }
  id v5 = objc_alloc_init((Class)NSMutableString);
  if ([(ICSEFolderListItem *)self isCollapsed]) {
    CFStringRef v6 = @"-";
  }
  else {
    CFStringRef v6 = @"+";
  }
  [v5 appendString:v6];
  [v5 appendString:v3];
  v7 = [(ICSEFolderListItem *)self noteContainer];
  v8 = [v7 titleForTableViewCell];
  [v5 appendString:v8];

  [v5 appendString:@"\n"];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v9 = [(ICSEFolderListItem *)self children];
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [*(id *)(*((void *)&v16 + 1) + 8 * i) debugDescription];
        [v5 appendString:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v5;
}

- (unint64_t)level
{
  id v3 = [(ICSEFolderListItem *)self parent];

  if (!v3) {
    return 0;
  }
  unint64_t v4 = [(ICSEFolderListItem *)self parent];
  id v5 = (char *)[v4 level] + 1;

  return (unint64_t)v5;
}

- (BOOL)isCollapsible
{
  if ([(ICSEFolderListItem *)self isAccount])
  {
    id v3 = [(ICSEFolderListItem *)self parent];

    if (!v3) {
      return 1;
    }
  }
  unint64_t v4 = [(ICSEFolderListItem *)self children];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (BOOL)isCollapsed
{
  v2 = self;
  if (![(ICSEFolderListItem *)self isCollapsible]) {
    goto LABEL_6;
  }
  if ([(ICSEFolderListItem *)v2 isAccount])
  {
    id v3 = [(ICSEFolderListItem *)v2 parent];

    if (!v3)
    {
      objc_opt_class();
      uint64_t v12 = [(ICSEFolderListItem *)v2 noteContainer];
      v13 = ICDynamicCast();

      if (!v13) {
        +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((((ICAccount*)ICDynamicCast([ICAccount class], self.noteContainer))) != nil)", "-[ICSEFolderListItem isCollapsed]", 1, 0, @"Expected non-nil value for '%s'", "ICCastAsClass(ICAccount, self.noteContainer)");
      }
      CFStringRef v6 = [(ICSEFolderListItem *)v2 viewState];
      v7 = [v6 collapsedAccountIdentifiers];
      v8 = [(ICSEFolderListItem *)v2 noteContainer];
      v9 = [v8 identifier];
      LOBYTE(v2) = [v7 containsObject:v9];
      goto LABEL_13;
    }
  }
  unint64_t v4 = [(ICSEFolderListItem *)v2 viewState];
  unsigned int v5 = [v4 overrideCollapsed];

  if (!v5)
  {
    CFStringRef v6 = [(ICSEFolderListItem *)v2 viewState];
    v7 = [v6 expandedFolderIdentifiers];
    v8 = [(ICSEFolderListItem *)v2 noteContainer];
    v9 = [v8 identifier];
    LODWORD(v2) = [v7 containsObject:v9] ^ 1;
    goto LABEL_13;
  }
  if (![(ICSEFolderListItem *)v2 isAccount])
  {
    CFStringRef v6 = [(ICSEFolderListItem *)v2 viewState];
    v7 = [v6 overrideCollapsedFolder];
    if (!v7)
    {
      LOBYTE(v2) = 0;
      goto LABEL_14;
    }
    v8 = [(ICSEFolderListItem *)v2 viewState];
    v9 = [v8 overrideCollapsedFolder];
    id v10 = [(ICSEFolderListItem *)v2 noteContainer];
    id v11 = [v10 identifier];
    LOBYTE(v2) = [v9 isEqualToString:v11];

LABEL_13:
LABEL_14:

    return (char)v2;
  }
LABEL_6:
  LOBYTE(v2) = 0;
  return (char)v2;
}

- (void)setCollapsed:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(ICSEFolderListItem *)self isCollapsible]) {
    return;
  }
  if ([(ICSEFolderListItem *)self isAccount])
  {
    unsigned int v5 = [(ICSEFolderListItem *)self parent];

    if (!v5)
    {
      objc_opt_class();
      id v11 = [(ICSEFolderListItem *)self noteContainer];
      uint64_t v12 = ICDynamicCast();

      if (!v12) {
        +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((((ICAccount*)ICDynamicCast([ICAccount class], self.noteContainer))) != nil)", "-[ICSEFolderListItem setCollapsed:]", 1, 0, @"Expected non-nil value for '%s'", "ICCastAsClass(ICAccount, self.noteContainer)");
      }
      id v18 = [(ICSEFolderListItem *)self viewState];
      v13 = [v18 collapsedAccountIdentifiers];
      v14 = [(ICSEFolderListItem *)self noteContainer];
      v15 = [v14 identifier];
      if (!v3) {
        goto LABEL_26;
      }
LABEL_28:
      [v13 addObject:v15];
      goto LABEL_29;
    }
  }
  CFStringRef v6 = [(ICSEFolderListItem *)self viewState];
  unsigned int v7 = [v6 overrideCollapsed];

  if (v7)
  {
    v8 = [(ICSEFolderListItem *)self viewState];
    v9 = [v8 overrideCollapsedFolder];
    id v10 = v9;
    if (v3)
    {
      if (!v9)
      {

LABEL_18:
        if ([(ICSEFolderListItem *)self isAccount]) {
          +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "!self.isAccount", "-[ICSEFolderListItem setCollapsed:]", 1, 0, @"Can't collapse a legacy or account node in edit mode");
        }
        if (v3)
        {
          v8 = [(ICSEFolderListItem *)self noteContainer];
          long long v16 = [v8 identifier];
        }
        else
        {
          long long v16 = 0;
        }
        long long v17 = [(ICSEFolderListItem *)self viewState];
        [v17 setOverrideCollapsedFolder:v16];

        if (v3)
        {

          goto LABEL_25;
        }
        goto LABEL_27;
      }
    }
    else
    {

      if (v10) {
        goto LABEL_18;
      }
    }
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "(collapsed && !self.viewState.overrideCollapsedFolder) || (!collapsed && self.viewState.overrideCollapsedFolder)", "-[ICSEFolderListItem setCollapsed:]", 1, 0, @"Can't collapse or expand more than one folder in edit mode");
    goto LABEL_18;
  }
  if (!v3)
  {
LABEL_27:
    id v18 = [(ICSEFolderListItem *)self viewState];
    v13 = [v18 expandedFolderIdentifiers];
    v14 = [(ICSEFolderListItem *)self noteContainer];
    v15 = [v14 identifier];
    goto LABEL_28;
  }
LABEL_25:
  id v18 = [(ICSEFolderListItem *)self viewState];
  v13 = [v18 expandedFolderIdentifiers];
  v14 = [(ICSEFolderListItem *)self noteContainer];
  v15 = [v14 identifier];
LABEL_26:
  [v13 removeObject:v15];
LABEL_29:
}

- (id)flattenedChildItems
{
  BOOL v3 = +[NSMutableArray array];
  if (![(ICSEFolderListItem *)self isCollapsed])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    unint64_t v4 = [(ICSEFolderListItem *)self children];
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          [v3 addObject:v9];
          id v10 = [v9 flattenedChildItems];
          [v3 addObjectsFromArray:v10];
        }
        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }

  return v3;
}

- (unint64_t)countOfVisibleDescendants
{
  v2 = [(ICSEFolderListItem *)self flattenedChildItems];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (NSString)title
{
  v2 = [(ICSEFolderListItem *)self noteContainer];
  id v3 = [v2 titleForTableViewCell];

  return (NSString *)v3;
}

- (void)recursivelyAddChildFolder:(id)a3
{
  id v4 = a3;
  id v5 = [ICSEFolderListItem alloc];
  id v6 = [(ICSEFolderListItem *)self viewState];
  uint64_t v7 = [(ICSEFolderListItem *)v5 initWithViewState:v6];

  [(ICSEFolderListItem *)v7 setNoteContainer:v4];
  -[ICSEFolderListItem setIsDefaultFolder:](v7, "setIsDefaultFolder:", [v4 isDefaultFolderForAccount]);
  [(ICSEFolderListItem *)v7 setParent:self];
  v8 = [(ICSEFolderListItem *)self children];
  [v8 addObject:v7];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v9 = [v4 visibleNoteContainerChildren];
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      long long v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [(ICSEFolderListItem *)v7 recursivelyAddChildFolder:*(void *)(*((void *)&v14 + 1) + 8 * (void)v13)];
        long long v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)addChildItem:(id)a3
{
  id v5 = a3;
  id v4 = [(ICSEFolderListItem *)self children];
  [v4 addObject:v5];

  [v5 setParent:self];
}

- (void)insertChildItem:(id)a3 atIndex:(unint64_t)a4
{
  id v7 = a3;
  id v6 = [(ICSEFolderListItem *)self children];
  [v6 insertObject:v7 atIndex:a4];

  [v7 setParent:self];
}

- (BOOL)isAccount
{
  return self->_isAccount;
}

- (void)setIsAccount:(BOOL)a3
{
  self->_isAccount = a3;
}

- (BOOL)isDefaultFolder
{
  return self->_isDefaultFolder;
}

- (void)setIsDefaultFolder:(BOOL)a3
{
  self->_isDefaultFolder = a3;
}

- (ICNoteContainer)noteContainer
{
  return self->_noteContainer;
}

- (void)setNoteContainer:(id)a3
{
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (ICSEFolderListItem)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  return (ICSEFolderListItem *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (ICSEFolderListViewState)viewState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewState);

  return (ICSEFolderListViewState *)WeakRetained;
}

- (void)setViewState:(id)a3
{
}

- (unint64_t)folderListItemAccountType
{
  return self->_folderListItemAccountType;
}

- (void)setFolderListItemAccountType:(unint64_t)a3
{
  self->_folderListItemAccountType = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewState);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_children, 0);

  objc_storeStrong((id *)&self->_noteContainer, 0);
}

@end