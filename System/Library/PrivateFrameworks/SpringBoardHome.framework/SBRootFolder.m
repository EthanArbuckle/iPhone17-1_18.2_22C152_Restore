@interface SBRootFolder
+ (BOOL)isRootFolderClass;
- (BOOL)_compactsFirstList;
- (BOOL)canAddIconCount:(unint64_t)a3 startingAtList:(id)a4;
- (BOOL)canBounceIcon:(id)a3;
- (BOOL)canEditDisplayName;
- (BOOL)canRemoveIcons;
- (BOOL)containsNonDefaultSizedIconExcludingTodayList;
- (BOOL)containsVisibleNonDefaultSizedIconExcludingTodayList;
- (BOOL)containsVisibleWidgetIconExcludingTodayList;
- (BOOL)containsWidgetIconExcludingTodayList;
- (BOOL)isCheckingIgnoredListConsistency;
- (BOOL)isExtraListIndex:(unint64_t)a3;
- (BOOL)isIconAtIndexPathInDock:(id)a3;
- (BOOL)isIconAtIndexPathInDock:(id)a3 includingDockFolders:(BOOL)a4;
- (BOOL)isIconAtIndexPathInFavoriteTodayList:(id)a3;
- (BOOL)isIconAtIndexPathInIgnoredList:(id)a3;
- (BOOL)isIconAtIndexPathInTodayList:(id)a3;
- (BOOL)isIconInIgnoredList:(id)a3;
- (BOOL)isRootFolder;
- (BOOL)supportsBadging;
- (SBHIconModel)model;
- (SBIconListModel)dock;
- (SBIconListModel)favoriteTodayList;
- (SBIconListModel)ignoredList;
- (SBIconListModel)todayList;
- (SBRootFolder)initWithFolder:(id)a3 options:(unint64_t)a4;
- (SBRootFolderDelegate)delegate;
- (id)_dockIfExists;
- (id)_favoriteTodayListIfExists;
- (id)_handleBumpedIcons:(id)a3 afterInsertingIconIntoListAtIndex:(unint64_t)a4 listGridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6 didBump:(BOOL *)a7;
- (id)_ignoredListIfExists;
- (id)_todayListIfExists;
- (id)allowedGridSizeClassesForDock;
- (id)allowedGridSizeClassesForTodayList;
- (id)badge;
- (id)icons;
- (id)listAtIndex:(unint64_t)a3;
- (id)nodeDescriptionWithPrefix:(id)a3;
- (id)nodeIdentifier;
- (unint64_t)_specialIndexOfList:(id)a3;
- (unint64_t)columnCountForTodayList;
- (unint64_t)hiddenIndexOfList:(id)a3;
- (unint64_t)indexOfList:(id)a3;
- (unint64_t)maxIconCountForDock;
- (unint64_t)visibleIndexOfList:(id)a3;
- (void)_didExplicitlyRemoveHiddenLists:(id)a3;
- (void)_notifyIndexChange:(int)a3 identifiers:(id)a4 withValidationBlock:(id)a5;
- (void)_setDock:(id)a3;
- (void)_setFavoriteTodayList:(id)a3;
- (void)_setIgnoredList:(id)a3;
- (void)_setTodayList:(id)a3;
- (void)_tearDownIgnoredListConsistencyCheckRunLoopObserverIfNeeded;
- (void)checkIgnoredListConsistency;
- (void)dealloc;
- (void)delegateDidChange:(id)a3;
- (void)enumerateExtraListsUsingBlock:(id)a3;
- (void)enumerateTodayListIconsUsingBlock:(id)a3;
- (void)enumerateTodayListsUsingBlock:(id)a3;
- (void)iconList:(id)a3 didAddIcon:(id)a4;
- (void)iconList:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5;
- (void)node:(id)a3 didAddContainedNodeIdentifiers:(id)a4;
- (void)node:(id)a3 didRemoveContainedNodeIdentifiers:(id)a4;
- (void)nodeDidMoveContainedNodes:(id)a3;
- (void)removeList:(id)a3;
- (void)scheduleIgnoredListConsistencyCheck;
- (void)setCheckingIgnoredListConsistency:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setModel:(id)a3;
@end

@implementation SBRootFolder

- (unint64_t)visibleIndexOfList:(id)a3
{
  id v4 = a3;
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (([v4 isHidden] & 1) == 0)
  {
    unint64_t v5 = [(SBRootFolder *)self _specialIndexOfList:v4];
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7.receiver = self;
      v7.super_class = (Class)SBRootFolder;
      unint64_t v5 = [(SBFolder *)&v7 visibleIndexOfList:v4];
    }
  }

  return v5;
}

- (unint64_t)_specialIndexOfList:(id)a3
{
  id v4 = a3;
  id v5 = [(SBRootFolder *)self dock];

  if (v5 == v4)
  {
    unint64_t v9 = 10000;
  }
  else
  {
    id v6 = [(SBRootFolder *)self todayList];

    if (v6 == v4)
    {
      unint64_t v9 = 20000;
    }
    else
    {
      id v7 = [(SBRootFolder *)self favoriteTodayList];

      if (v7 == v4)
      {
        unint64_t v9 = 40000;
      }
      else
      {
        id v8 = [(SBRootFolder *)self ignoredList];

        if (v8 == v4) {
          unint64_t v9 = 30000;
        }
        else {
          unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
    }
  }

  return v9;
}

- (SBIconListModel)dock
{
  dock = self->_dock;
  if (!dock)
  {
    id v4 = [(SBFolder *)self iconGridSizeClassSizes];
    id v5 = [[SBIconListModel alloc] initWithFolder:self gridSize:(unsigned __int16)[(SBRootFolder *)self maxIconCountForDock] | 0x10000 gridSizeClassSizes:v4];
    [(SBRootFolder *)self _setDock:v5];

    dock = self->_dock;
  }
  return dock;
}

- (SBIconListModel)todayList
{
  todayList = self->_todayList;
  if (!todayList)
  {
    id v4 = [(SBFolder *)self iconGridSizeClassSizes];
    id v5 = [[SBIconListModel alloc] initWithFolder:self gridSize:(unsigned __int16)[(SBRootFolder *)self columnCountForTodayList] | 0xFFFF0000 gridSizeClassSizes:v4];
    [(SBIconListModel *)v5 setFixedIconLocationBehavior:0];
    [(SBRootFolder *)self _setTodayList:v5];

    todayList = self->_todayList;
  }
  return todayList;
}

- (SBIconListModel)ignoredList
{
  ignoredList = self->_ignoredList;
  if (!ignoredList)
  {
    id v4 = [(SBFolder *)self iconGridSizeClassSizes];
    id v5 = [[SBIconListModel alloc] initWithFolder:self gridSize:0xFFFFFFFFLL gridSizeClassSizes:v4];
    [(SBIconListModel *)v5 setFixedIconLocationBehavior:0];
    [(SBRootFolder *)self _setIgnoredList:v5];

    ignoredList = self->_ignoredList;
  }
  return ignoredList;
}

- (SBIconListModel)favoriteTodayList
{
  favoriteTodayList = self->_favoriteTodayList;
  if (!favoriteTodayList)
  {
    id v4 = [(SBFolder *)self iconGridSizeClassSizes];
    id v5 = [[SBIconListModel alloc] initWithFolder:self gridSize:(unsigned __int16)[(SBRootFolder *)self columnCountForTodayList] | 0xFFFF0000 gridSizeClassSizes:v4];
    [(SBIconListModel *)v5 setFixedIconLocationBehavior:0];
    [(SBRootFolder *)self _setFavoriteTodayList:v5];

    favoriteTodayList = self->_favoriteTodayList;
  }
  return favoriteTodayList;
}

- (BOOL)isRootFolder
{
  return 1;
}

- (BOOL)_compactsFirstList
{
  return 0;
}

- (unint64_t)indexOfList:(id)a3
{
  id v4 = a3;
  id v5 = [(SBRootFolder *)self _specialIndexOfList:v4];
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBRootFolder;
    id v5 = [(SBFolder *)&v7 indexOfList:v4];
  }

  return (unint64_t)v5;
}

- (id)nodeIdentifier
{
  return 0;
}

- (void)enumerateExtraListsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, uint64_t, unsigned char *))a3;
  char v9 = 0;
  id v5 = [(SBRootFolder *)self _dockIfExists];
  if (!v5 || (v4[2](v4, v5, 10000, &v9), !v9))
  {
    id v6 = [(SBRootFolder *)self _todayListIfExists];
    if (!v6 || (v4[2](v4, v6, 20000, &v9), !v9))
    {
      objc_super v7 = [(SBRootFolder *)self _favoriteTodayListIfExists];
      if (!v7 || (v4[2](v4, v7, 40000, &v9), !v9))
      {
        id v8 = [(SBRootFolder *)self _ignoredListIfExists];
        if (v8) {
          v4[2](v4, v8, 30000, &v9);
        }
      }
    }
  }
}

- (id)_todayListIfExists
{
  return self->_todayList;
}

- (id)_ignoredListIfExists
{
  return self->_ignoredList;
}

- (id)_favoriteTodayListIfExists
{
  return self->_favoriteTodayList;
}

- (id)_dockIfExists
{
  return self->_dock;
}

- (id)listAtIndex:(unint64_t)a3
{
  if ((uint64_t)a3 > 29999)
  {
    if (a3 != 30000)
    {
      if (a3 == 40000)
      {
        v3 = [(SBRootFolder *)self favoriteTodayList];
        goto LABEL_11;
      }
      goto LABEL_8;
    }
    v3 = [(SBRootFolder *)self ignoredList];
  }
  else
  {
    if (a3 != 10000)
    {
      if (a3 == 20000)
      {
        v3 = [(SBRootFolder *)self todayList];
        goto LABEL_11;
      }
LABEL_8:
      v5.receiver = self;
      v5.super_class = (Class)SBRootFolder;
      v3 = -[SBFolder listAtIndex:](&v5, sel_listAtIndex_);
      goto LABEL_11;
    }
    v3 = [(SBRootFolder *)self dock];
  }
LABEL_11:
  return v3;
}

- (BOOL)isExtraListIndex:(unint64_t)a3
{
  BOOL result = 1;
  if ((uint64_t)a3 > 29999)
  {
    if (a3 == 30000) {
      return result;
    }
    uint64_t v7 = 40000;
  }
  else
  {
    if (a3 == 10000) {
      return result;
    }
    uint64_t v7 = 20000;
  }
  if (a3 != v7)
  {
    uint64_t v9 = v3;
    uint64_t v10 = v4;
    v8.receiver = self;
    v8.super_class = (Class)SBRootFolder;
    return -[SBFolder isExtraListIndex:](&v8, sel_isExtraListIndex_);
  }
  return result;
}

- (id)badge
{
  return 0;
}

- (SBRootFolder)initWithFolder:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBRootFolder;
  uint64_t v7 = [(SBFolder *)&v17 initWithFolder:v6 options:a4];
  if (v7)
  {
    objc_super v8 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v10 = v6;
      v11 = v10;
      if ((a4 & 0xA) == 0)
      {
        if (v10[29])
        {
          v12 = [[SBIconListModel alloc] initWithIconListModel:v10[29] copyLeafIcons:a4 & 1];
          [(SBIconListModel *)v12 _changeFolderDuringCopy:v7];
          [(SBRootFolder *)v7 _setDock:v12];
        }
        if (v11[30])
        {
          v13 = [[SBIconListModel alloc] initWithIconListModel:v11[30] copyLeafIcons:a4 & 1];
          [(SBIconListModel *)v13 _changeFolderDuringCopy:v7];
          [(SBRootFolder *)v7 _setTodayList:v13];
        }
        if (v11[31])
        {
          v14 = [[SBIconListModel alloc] initWithIconListModel:v11[31] copyLeafIcons:a4 & 1];
          [(SBIconListModel *)v14 _changeFolderDuringCopy:v7];
          [(SBRootFolder *)v7 _setFavoriteTodayList:v14];
        }
        if ((a4 & 0xE) == 0 && v11[32])
        {
          v15 = [[SBIconListModel alloc] initWithIconListModel:v11[32] copyLeafIcons:a4 & 1];
          [(SBIconListModel *)v15 _changeFolderDuringCopy:v7];
          [(SBRootFolder *)v7 _setIgnoredList:v15];
        }
      }
    }
  }

  return v7;
}

- (void)dealloc
{
  [(SBRootFolder *)self _tearDownIgnoredListConsistencyCheckRunLoopObserverIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)SBRootFolder;
  [(SBRootFolder *)&v3 dealloc];
}

- (BOOL)canRemoveIcons
{
  return 0;
}

- (BOOL)canEditDisplayName
{
  return 0;
}

- (BOOL)supportsBadging
{
  return 1;
}

- (unint64_t)maxIconCountForDock
{
  objc_super v3 = [(SBRootFolder *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 maxIconCountForDockForRootFolder:self];
  }
  else
  {
    dock = self->_dock;
    if (!dock)
    {
      unint64_t v6 = 4;
      goto LABEL_7;
    }
    uint64_t v4 = [(SBIconListModel *)dock maxNumberOfIcons];
  }
  unint64_t v6 = v4;
LABEL_7:

  return v6;
}

- (id)allowedGridSizeClassesForDock
{
  objc_super v3 = [(SBRootFolder *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 allowedGridSizeClassesForDockForRootFolder:self];
  }
  else
  {
    dock = self->_dock;
    if (dock) {
      [(SBIconListModel *)dock allowedGridSizeClasses];
    }
    else {
    uint64_t v4 = +[SBHIconGridSizeClassSet gridSizeClassSetForDefaultGridSizeClass];
    }
  }
  unint64_t v6 = (void *)v4;

  return v6;
}

- (unint64_t)columnCountForTodayList
{
  objc_super v3 = [(SBRootFolder *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    unint64_t v4 = [v3 columnCountForTodayListForRootFolder:self];
  }
  else
  {
    todayList = self->_todayList;
    if (todayList) {
      unint64_t v4 = (unsigned __int16)[(SBIconListModel *)todayList gridSize];
    }
    else {
      unint64_t v4 = 4;
    }
  }

  return v4;
}

- (id)allowedGridSizeClassesForTodayList
{
  objc_super v3 = [(SBRootFolder *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [v3 allowedGridSizeClassesForTodayListForRootFolder:self];
LABEL_5:
    unint64_t v6 = (SBHIconGridSizeClassSet *)v4;
    goto LABEL_7;
  }
  todayList = self->_todayList;
  if (todayList)
  {
    uint64_t v4 = [(SBIconListModel *)todayList allowedGridSizeClasses];
    goto LABEL_5;
  }
  uint64_t v7 = [SBHIconGridSizeClassSet alloc];
  objc_super v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"SBHIconGridSizeClassSmall", @"SBHIconGridSizeClassMedium", @"SBHIconGridSizeClassLarge", 0);
  unint64_t v6 = [(SBHIconGridSizeClassSet *)v7 initWithGridSizeClasses:v8];

LABEL_7:
  return v6;
}

- (void)_setDock:(id)a3
{
  objc_super v5 = (SBIconListModel *)a3;
  p_dock = &self->_dock;
  dock = self->_dock;
  uint64_t v9 = v5;
  if (dock != v5)
  {
    if (dock)
    {
      [(SBFolder *)self _willRemoveList:dock atIndex:10000 informObservers:0];
      [(SBFolder *)self _didRemoveList:*p_dock atIndex:10000 informObservers:0];
      [(SBIconListModel *)*p_dock removeNodeObserver:self];
    }
    objc_storeStrong((id *)&self->_dock, a3);
    if (*p_dock)
    {
      objc_super v8 = [(SBRootFolder *)self allowedGridSizeClassesForDock];
      [(SBIconListModel *)*p_dock setAllowedGridSizeClasses:v8];
      [(SBIconListModel *)*p_dock setFixedIconLocationBehavior:0];
      [(SBFolder *)self _didAddList:*p_dock informObservers:0];
      [(SBIconListModel *)*p_dock addNodeObserver:self];
    }
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_storeWeak((id *)&self->_delegate, obj);
    [(SBRootFolder *)self delegateDidChange:v5];
  }
}

- (void)delegateDidChange:(id)a3
{
  id v5 = [(SBRootFolder *)self allowedGridSizeClassesForDock];
  uint64_t v4 = [(SBRootFolder *)self allowedGridSizeClassesForTodayList];
  [(SBIconListModel *)self->_dock setAllowedGridSizeClasses:v5];
  [(SBIconListModel *)self->_todayList setAllowedGridSizeClasses:v4];
  [(SBIconListModel *)self->_favoriteTodayList setAllowedGridSizeClasses:v4];
}

- (BOOL)isIconAtIndexPathInDock:(id)a3
{
  return [(SBRootFolder *)self isIconAtIndexPathInDock:a3 includingDockFolders:0];
}

- (BOOL)isIconAtIndexPathInDock:(id)a3 includingDockFolders:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 sbListIndex];
  BOOL v7 = v6 == 10000 && a4;
  if (!a4 && v6 == 10000) {
    BOOL v7 = objc_msgSend(v5, "sb_iconPathCount") == 1;
  }

  return v7;
}

- (void)_setTodayList:(id)a3
{
  id v5 = (SBIconListModel *)a3;
  p_todayList = &self->_todayList;
  todayList = self->_todayList;
  uint64_t v9 = v5;
  if (todayList != v5)
  {
    if (todayList)
    {
      [(SBFolder *)self _willRemoveList:todayList atIndex:20000 informObservers:0];
      [(SBFolder *)self _didRemoveList:*p_todayList atIndex:20000 informObservers:0];
      [(SBIconListModel *)*p_todayList removeNodeObserver:self];
    }
    objc_storeStrong((id *)&self->_todayList, a3);
    [(SBIconListModel *)*p_todayList setDelegate:self];
    if (*p_todayList)
    {
      objc_super v8 = [(SBRootFolder *)self allowedGridSizeClassesForTodayList];
      [(SBIconListModel *)*p_todayList setAllowedGridSizeClasses:v8];
      [(SBIconListModel *)*p_todayList setIconLayoutBehavior:1];
      [(SBIconListModel *)*p_todayList setFixedIconLocationBehavior:0];
      [(SBFolder *)self _didAddList:*p_todayList informObservers:0];
      [(SBIconListModel *)*p_todayList addNodeObserver:self];
    }
  }
}

- (BOOL)isIconAtIndexPathInTodayList:(id)a3
{
  return [a3 sbListIndex] == 20000;
}

- (void)_setFavoriteTodayList:(id)a3
{
  id v5 = (SBIconListModel *)a3;
  p_favoriteTodayList = &self->_favoriteTodayList;
  favoriteTodayList = self->_favoriteTodayList;
  uint64_t v9 = v5;
  if (favoriteTodayList != v5)
  {
    if (favoriteTodayList)
    {
      [(SBFolder *)self _willRemoveList:favoriteTodayList atIndex:40000 informObservers:0];
      [(SBFolder *)self _didRemoveList:*p_favoriteTodayList atIndex:40000 informObservers:0];
      [(SBIconListModel *)*p_favoriteTodayList removeNodeObserver:self];
    }
    objc_storeStrong((id *)&self->_favoriteTodayList, a3);
    [(SBIconListModel *)*p_favoriteTodayList setDelegate:self];
    if (*p_favoriteTodayList)
    {
      objc_super v8 = [(SBRootFolder *)self allowedGridSizeClassesForTodayList];
      [(SBIconListModel *)*p_favoriteTodayList setAllowedGridSizeClasses:v8];
      [(SBIconListModel *)*p_favoriteTodayList setIconLayoutBehavior:1];
      [(SBIconListModel *)*p_favoriteTodayList setFixedIconLocationBehavior:0];
      [(SBFolder *)self _didAddList:*p_favoriteTodayList informObservers:0];
      [(SBIconListModel *)*p_favoriteTodayList addNodeObserver:self];
    }
  }
}

- (BOOL)isIconAtIndexPathInFavoriteTodayList:(id)a3
{
  return [a3 sbListIndex] == 40000;
}

- (void)enumerateTodayListsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, uint64_t, unsigned char *))a3;
  id v5 = [(SBRootFolder *)self todayList];
  if (!v5 || (char v8 = 0, v4[2](v4, v5, 20000, &v8), !v8))
  {
    uint64_t v6 = [(SBRootFolder *)self favoriteTodayList];
    if (v6)
    {
      char v7 = 0;
      v4[2](v4, v6, 40000, &v7);
    }
  }
}

- (void)enumerateTodayListIconsUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__SBRootFolder_enumerateTodayListIconsUsingBlock___block_invoke;
  v6[3] = &unk_1E6AB5890;
  id v7 = v4;
  id v5 = v4;
  [(SBRootFolder *)self enumerateTodayListsUsingBlock:v6];
}

void __50__SBRootFolder_enumerateTodayListIconsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__SBRootFolder_enumerateTodayListIconsUsingBlock___block_invoke_2;
  v6[3] = &unk_1E6AB5868;
  uint64_t v8 = a3;
  id v7 = *(id *)(a1 + 32);
  uint64_t v9 = a4;
  [a2 enumerateIconsUsingBlock:v6];
}

void __50__SBRootFolder_enumerateTodayListIconsUsingBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = (void *)MEMORY[0x1E4F28D58];
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = a2;
  uint64_t v10 = [v7 indexPathWithIconIndex:a3 listIndex:v8];
  char v11 = 0;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  if (v11)
  {
    *a4 = 1;
    **(unsigned char **)(a1 + 48) = 1;
  }
}

- (void)_setIgnoredList:(id)a3
{
  id v5 = (SBIconListModel *)a3;
  p_ignoredList = &self->_ignoredList;
  ignoredList = self->_ignoredList;
  v12 = v5;
  if (ignoredList != v5)
  {
    if (ignoredList)
    {
      [(SBFolder *)self _willRemoveList:ignoredList atIndex:30000 informObservers:0];
      [(SBFolder *)self _didRemoveList:*p_ignoredList atIndex:30000 informObservers:0];
      [(SBIconListModel *)*p_ignoredList removeNodeObserver:self];
    }
    objc_storeStrong((id *)&self->_ignoredList, a3);
    uint64_t v8 = *p_ignoredList;
    if (*p_ignoredList)
    {
      id v9 = +[SBHIconGridSizeClassSet gridSizeClassSetForDefaultGridSizeClass];
      [(SBIconListModel *)v8 setAllowedGridSizeClasses:v9];

      uint64_t v10 = *p_ignoredList;
      char v11 = [MEMORY[0x1E4F1C9C8] distantPast];
      [(SBIconListModel *)v10 setHidden:1 byUser:1 hiddenDate:v11];

      [(SBIconListModel *)*p_ignoredList setFixedIconLocationBehavior:0];
      [(SBFolder *)self _didAddList:*p_ignoredList informObservers:0];
      [(SBIconListModel *)*p_ignoredList addNodeObserver:self];
    }
  }
}

- (BOOL)isIconAtIndexPathInIgnoredList:(id)a3
{
  return [a3 sbListIndex] == 30000;
}

- (BOOL)isIconInIgnoredList:(id)a3
{
  objc_super v3 = self;
  id v4 = [(SBFolder *)self indexPathForIcon:a3];
  LOBYTE(v3) = [(SBRootFolder *)v3 isIconAtIndexPathInIgnoredList:v4];

  return (char)v3;
}

- (void)scheduleIgnoredListConsistencyCheck
{
  if (!self->_checkIgnoredListRunLoopObserver)
  {
    objc_initWeak(&location, self);
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __51__SBRootFolder_scheduleIgnoredListConsistencyCheck__block_invoke;
    v5[3] = &unk_1E6AAD210;
    objc_copyWeak(&v6, &location);
    self->_checkIgnoredListRunLoopObserver = CFRunLoopObserverCreateWithHandler(v3, 0xA0uLL, 0, 1999800, v5);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, self->_checkIgnoredListRunLoopObserver, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __51__SBRootFolder_scheduleIgnoredListConsistencyCheck__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained checkIgnoredListConsistency];
}

- (void)_tearDownIgnoredListConsistencyCheckRunLoopObserverIfNeeded
{
  checkIgnoredListRunLoopObserver = self->_checkIgnoredListRunLoopObserver;
  if (checkIgnoredListRunLoopObserver)
  {
    CFRunLoopObserverInvalidate(checkIgnoredListRunLoopObserver);
    CFRelease(self->_checkIgnoredListRunLoopObserver);
    self->_checkIgnoredListRunLoopObserver = 0;
  }
}

- (void)checkIgnoredListConsistency
{
  [(SBRootFolder *)self _tearDownIgnoredListConsistencyCheckRunLoopObserverIfNeeded];
  [(SBRootFolder *)self setCheckingIgnoredListConsistency:1];
  CFAllocatorRef v3 = [(SBRootFolder *)self ignoredList];
  uint64_t v4 = [v3 numberOfIcons];
  if (v4)
  {
    unint64_t v5 = v4;
    for (unint64_t i = 0; i < v5; ++i)
    {
      id v7 = [v3 iconAtIndex:i];
      if ([v7 isApplicationIcon])
      {
        id v8 = v7;
        id v9 = [v8 applicationBundleID];
        if ([v8 leafIdentifierAndApplicationBundleIDMatches])
        {
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __43__SBRootFolder_checkIgnoredListConsistency__block_invoke;
          v17[3] = &unk_1E6AAD320;
          v18 = v9;
          id v10 = v9;
          char v11 = [(SBFolder *)self indexPathForIconWithOptions:1 passingTest:v17];
          if (v11)
          {
            v12 = [(SBFolder *)self iconAtIndexPath:v11];
            if (![(SBRootFolder *)self isIconInIgnoredList:v12])
            {
              [v3 removeIconAtIndex:i--];
              --v5;
              if (![(SBFolder *)self replaceIcon:v12 withIcon:v8 options:0]) {
                [v3 addIcon:v8];
              }
            }
          }
          v13 = &v18;
        }
        else
        {
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __43__SBRootFolder_checkIgnoredListConsistency__block_invoke_2;
          v15[3] = &unk_1E6AAD320;
          v16 = v9;
          id v14 = v9;
          char v11 = [(SBFolder *)self indexPathForIconWithOptions:1 passingTest:v15];
          if (v11)
          {
            [v3 removeIconAtIndex:i--];
            --v5;
          }
          v13 = &v16;
        }
      }
    }
  }
  [(SBRootFolder *)self setCheckingIgnoredListConsistency:0];
}

uint64_t __43__SBRootFolder_checkIgnoredListConsistency__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isApplicationIcon]
    && ([v3 leafIdentifierAndApplicationBundleIDMatches] & 1) == 0)
  {
    unint64_t v5 = [v3 applicationBundleID];
    uint64_t v4 = [v5 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __43__SBRootFolder_checkIgnoredListConsistency__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isApplicationIcon]
    && [v3 leafIdentifierAndApplicationBundleIDMatches])
  {
    uint64_t v4 = [v3 applicationBundleID];
    uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)canBounceIcon:(id)a3
{
  id v4 = a3;
  if ([v4 isLeafIcon])
  {
    uint64_t v5 = [(SBRootFolder *)self model];
    id v6 = [v4 leafIdentifier];
    id v7 = [v5 desiredIndexPathForIconWithIdentifier:v6];

    if (v7)
    {
      id v8 = [(SBFolder *)self indexPathForIcon:v4];
      id v9 = v8;
      if (v8 && [v8 isEqual:v7])
      {
        id v10 = [(SBRootFolder *)self delegate];
        char v11 = v10;
        if (v10) {
          char v12 = [v10 rootFolder:self canBounceIcon:v4];
        }
        else {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 1;
      }
    }
    else
    {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 1;
  }

  return v12;
}

- (id)icons
{
  v9.receiver = self;
  v9.super_class = (Class)SBRootFolder;
  id v3 = [(SBFolder *)&v9 icons];
  id v4 = [(SBRootFolder *)self dock];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 icons];
    uint64_t v7 = [v3 arrayByAddingObjectsFromArray:v6];

    id v3 = (void *)v7;
  }

  return v3;
}

- (BOOL)containsWidgetIconExcludingTodayList
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__SBRootFolder_containsWidgetIconExcludingTodayList__block_invoke;
  v4[3] = &unk_1E6AB4220;
  v4[4] = self;
  v4[5] = &v5;
  [(SBFolder *)self enumerateAllIconsWithOptions:1 usingBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __52__SBRootFolder_containsWidgetIconExcludingTodayList__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  if ([a2 isWidgetIcon]
    && ([*(id *)(a1 + 32) isIconAtIndexPathInTodayList:v7] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)containsVisibleWidgetIconExcludingTodayList
{
  unint64_t v3 = [(SBFolder *)self visibleWidgetIconCount];
  id v4 = [(SBRootFolder *)self todayList];
  uint64_t v5 = [v4 numberOfIcons];

  id v6 = [(SBRootFolder *)self favoriteTodayList];
  uint64_t v7 = [v6 numberOfIcons];

  return v3 > v7 + v5;
}

- (BOOL)containsNonDefaultSizedIconExcludingTodayList
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__SBRootFolder_containsNonDefaultSizedIconExcludingTodayList__block_invoke;
  v4[3] = &unk_1E6AB4220;
  v4[4] = self;
  v4[5] = &v5;
  [(SBFolder *)self enumerateAllIconsWithOptions:1 usingBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __61__SBRootFolder_containsNonDefaultSizedIconExcludingTodayList__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v7 = a3;
  char v8 = [v11 gridSizeClass];
  if (v8 == @"SBHIconGridSizeClassDefault") {
    goto LABEL_4;
  }
  objc_super v9 = [v11 gridSizeClass];
  if ([v9 isEqualToString:@"SBHIconGridSizeClassDefault"])
  {

LABEL_4:
    goto LABEL_5;
  }
  char v10 = [*(id *)(a1 + 32) isIconAtIndexPathInTodayList:v7];

  if ((v10 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
LABEL_5:
}

- (BOOL)containsVisibleNonDefaultSizedIconExcludingTodayList
{
  unint64_t v3 = [(SBFolder *)self visibleWidgetIconCount];
  id v4 = [(SBRootFolder *)self todayList];
  uint64_t v5 = [v4 numberOfIcons];

  id v6 = [(SBRootFolder *)self favoriteTodayList];
  uint64_t v7 = [v6 numberOfIcons];

  return v3 > v7 + v5;
}

- (void)_didExplicitlyRemoveHiddenLists:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBRootFolder;
  [(SBFolder *)&v18 _didExplicitlyRemoveHiddenLists:v4];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10++), "addIconsPassingTest:toSet:", &__block_literal_global_81, v5, (void)v14);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v8);
  }

  id v11 = [(SBRootFolder *)self ignoredList];
  char v12 = [v5 allObjects];
  id v13 = (id)[v11 addIcons:v12];
}

uint64_t __48__SBRootFolder__didExplicitlyRemoveHiddenLists___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isLeafIcon]) {
    uint64_t v3 = [v2 isWidgetIcon] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_handleBumpedIcons:(id)a3 afterInsertingIconIntoListAtIndex:(unint64_t)a4 listGridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6 didBump:(BOOL *)a7
{
  v15.receiver = self;
  v15.super_class = (Class)SBRootFolder;
  uint64_t v8 = [(SBFolder *)&v15 _handleBumpedIcons:a3 afterInsertingIconIntoListAtIndex:a4 listGridCellInfoOptions:a5 mutationOptions:a6 didBump:a7];
  unint64_t v9 = [(SBFolder *)self visibleListCount];
  unint64_t v10 = [(SBFolder *)self maxListCount];
  if (v8) {
    BOOL v11 = v9 >= v10;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    char v12 = [(SBRootFolder *)self ignoredList];
    id v13 = (id)[v12 addIcons:v8];
  }
  return v8;
}

- (id)nodeDescriptionWithPrefix:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28E78];
  id v5 = (__CFString *)a3;
  id v6 = [v4 string];
  uint64_t v7 = (void *)MEMORY[0x1D9484600]();
  uint64_t v8 = &stru_1F2FA0300;
  if (v5) {
    uint64_t v8 = v5;
  }
  unint64_t v9 = v8;

  unint64_t v10 = SBIconIndexDebugStringForNodeIdentifier(self);
  [v6 appendString:v10];

  BOOL v11 = [(__CFString *)v9 stringByAppendingString:@"   R "];
  [v6 appendString:@"\n"];
  [v6 appendString:v11];
  [v6 appendString:@"Dock:"];
  [v6 appendString:@"\n"];
  char v12 = [(SBRootFolder *)self dock];
  id v13 = [v12 nodeDescriptionWithPrefix:v11];
  [v6 appendString:v13];

  [v6 appendString:@"\n"];
  [v6 appendString:v11];
  [v6 appendString:@"Pages:"];
  [v6 appendString:@"\n"];
  v16.receiver = self;
  v16.super_class = (Class)SBRootFolder;
  long long v14 = [(SBFolder *)&v16 nodeDescriptionWithPrefix:v11];
  [v6 appendString:v14];

  return v6;
}

- (void)_notifyIndexChange:(int)a3 identifiers:(id)a4 withValidationBlock:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  unint64_t v9 = (unsigned int (**)(id, void))a5;
  unint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        if (v9[2](v9, v16)) {
          [v10 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v13);
  }

  if ([v10 count])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v17 = [(NSHashTable *)self->super._nodeObservers allObjects];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v23 + 1) + 8 * j);
          if (a3) {
            [v22 node:self didRemoveContainedNodeIdentifiers:v10];
          }
          else {
            [v22 node:self didAddContainedNodeIdentifiers:v10];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v19);
    }
  }
}

- (void)node:(id)a3 didAddContainedNodeIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__SBRootFolder_node_didAddContainedNodeIdentifiers___block_invoke;
  v10[3] = &unk_1E6AAF640;
  id v11 = v6;
  uint64_t v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SBRootFolder *)self enumerateExtraListsUsingBlock:v10];
}

uint64_t __52__SBRootFolder_node_didAddContainedNodeIdentifiers___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 32) == a2)
  {
    uint64_t v2 = result;
    BOOL result = [*(id *)(*(void *)(result + 40) + 8) count];
    if (result)
    {
      uint64_t v3 = *(void **)(v2 + 40);
      uint64_t v4 = *(void *)(v2 + 48);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __52__SBRootFolder_node_didAddContainedNodeIdentifiers___block_invoke_2;
      v5[3] = &unk_1E6AB58B8;
      void v5[4] = v3;
      return [v3 _notifyIndexChange:0 identifiers:v4 withValidationBlock:v5];
    }
  }
  return result;
}

uint64_t __52__SBRootFolder_node_didAddContainedNodeIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) containsNodeIdentifier:a2] ^ 1;
}

- (void)node:(id)a3 didRemoveContainedNodeIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__SBRootFolder_node_didRemoveContainedNodeIdentifiers___block_invoke;
  v10[3] = &unk_1E6AAF640;
  id v11 = v6;
  uint64_t v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SBRootFolder *)self enumerateExtraListsUsingBlock:v10];
}

uint64_t __55__SBRootFolder_node_didRemoveContainedNodeIdentifiers___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 32) == a2)
  {
    uint64_t v2 = result;
    BOOL result = [*(id *)(*(void *)(result + 40) + 8) count];
    if (result)
    {
      uint64_t v3 = *(void **)(v2 + 40);
      uint64_t v4 = *(void *)(v2 + 48);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __55__SBRootFolder_node_didRemoveContainedNodeIdentifiers___block_invoke_2;
      v5[3] = &unk_1E6AB58B8;
      void v5[4] = v3;
      return [v3 _notifyIndexChange:1 identifiers:v4 withValidationBlock:v5];
    }
  }
  return result;
}

uint64_t __55__SBRootFolder_node_didRemoveContainedNodeIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) containsNodeIdentifier:a2] ^ 1;
}

- (void)nodeDidMoveContainedNodes:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__SBRootFolder_nodeDidMoveContainedNodes___block_invoke;
  v6[3] = &unk_1E6AAF2F8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(SBRootFolder *)self enumerateExtraListsUsingBlock:v6];
}

void __42__SBRootFolder_nodeDidMoveContainedNodes___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32) == a2)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "allObjects", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * v7++) nodeDidMoveContainedNodes:*(void *)(a1 + 40)];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)iconList:(id)a3 didAddIcon:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SBRootFolder;
  uint64_t v6 = (SBIconListModel *)a3;
  [(SBFolder *)&v8 iconList:v6 didAddIcon:a4];
  ignoredList = self->_ignoredList;

  if (ignoredList == v6
    && ![(SBRootFolder *)self isCheckingIgnoredListConsistency])
  {
    [(SBRootFolder *)self scheduleIgnoredListConsistencyCheck];
  }
}

- (void)iconList:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)SBRootFolder;
  objc_super v8 = (SBIconListModel *)a3;
  [(SBFolder *)&v10 iconList:v8 didReplaceIcon:a4 withIcon:a5];
  ignoredList = self->_ignoredList;

  if (ignoredList == v8
    && ![(SBRootFolder *)self isCheckingIgnoredListConsistency])
  {
    [(SBRootFolder *)self scheduleIgnoredListConsistencyCheck];
  }
}

+ (BOOL)isRootFolderClass
{
  return 1;
}

- (BOOL)canAddIconCount:(unint64_t)a3 startingAtList:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(SBRootFolder *)self dock];
  objc_super v8 = (void *)v7;
  if (v6 && (id)v7 == v6)
  {
    unsigned __int8 v9 = [v6 allowsAddingIconCount:a3];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBRootFolder;
    unsigned __int8 v9 = [(SBFolder *)&v12 canAddIconCount:a3 startingAtList:v6];
  }
  BOOL v10 = v9;

  return v10;
}

- (unint64_t)hiddenIndexOfList:(id)a3
{
  id v4 = a3;
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if ([v4 isHidden])
  {
    unint64_t v5 = [(SBRootFolder *)self _specialIndexOfList:v4];
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7.receiver = self;
      v7.super_class = (Class)SBRootFolder;
      unint64_t v5 = [(SBFolder *)&v7 hiddenIndexOfList:v4];
    }
  }

  return v5;
}

- (void)removeList:(id)a3
{
  id v4 = a3;
  if ([(SBRootFolder *)self _specialIndexOfList:v4] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5.receiver = self;
    v5.super_class = (Class)SBRootFolder;
    [(SBFolder *)&v5 removeList:v4];
  }
}

- (SBRootFolderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBRootFolderDelegate *)WeakRetained;
}

- (SBHIconModel)model
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_model);
  return (SBHIconModel *)WeakRetained;
}

- (void)setModel:(id)a3
{
}

- (BOOL)isCheckingIgnoredListConsistency
{
  return self->_checkingIgnoredListConsistency;
}

- (void)setCheckingIgnoredListConsistency:(BOOL)a3
{
  self->_checkingIgnoredListConsistency = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_model);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ignoredList, 0);
  objc_storeStrong((id *)&self->_favoriteTodayList, 0);
  objc_storeStrong((id *)&self->_todayList, 0);
  objc_storeStrong((id *)&self->_dock, 0);
}

@end