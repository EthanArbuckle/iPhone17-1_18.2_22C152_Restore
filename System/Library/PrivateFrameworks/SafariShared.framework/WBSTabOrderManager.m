@interface WBSTabOrderManager
- (BOOL)_newTabPositionPreferenceAppliesToSwawnedTabs;
- (BOOL)_tab:(id)a3 isRelatedOrEqualToTab:(id)a4;
- (BOOL)newBlankTabPositionAppliesToAllBlankTabs;
- (BOOL)newTabPositionAppliesToSpawnedTabs;
- (BOOL)suppressRelatingNewBlankTabs;
- (BOOL)tab:(id)a3 isInSameSetAsTab:(id)a4;
- (WBSTabOrderManager)init;
- (WBSTabOrderPreferenceProviding)preferenceProvider;
- (WBSTabOrderProvider)tabOrderProvider;
- (double)minimumDelayForRelatingNewBlankTab;
- (id)_insertionHintWithIndexOfTabToInsertAfter:(unint64_t)a3 relation:(unint64_t)a4;
- (id)_insertionHintWithTabToInsertAfter:(id)a3 relation:(unint64_t)a4;
- (id)_nextNonClosedTabAdjacentToIndex:(unint64_t)a3 inAscendingOrder:(BOOL)a4;
- (id)_tabInsertionHintForNewBlankTabWithRecommendedPosition:(unint64_t)a3;
- (id)_tabInsertionHintForNewTabAfterTab:(id)a3 relation:(unint64_t)a4;
- (id)_tabInsertionHintForPosition:(unint64_t)a3 isBlankTab:(BOOL)a4;
- (id)simplifiedIdentifierForDisplayInTabTitle:(id)a3;
- (id)tabInsertionHintForDuplicateOfTab:(id)a3;
- (id)tabInsertionHintForNewBlankTab;
- (id)tabInsertionHintForNewBlankTabInCurrentContext;
- (id)tabInsertionHintForNewTabOfType:(int64_t)a3;
- (id)tabInsertionHintForPosition:(unint64_t)a3;
- (id)tabInsertionHintForSpawnedTab;
- (id)tabToInsertNewBlankTabAfter;
- (id)tabToInsertNewTabAfterForPosition:(unint64_t)a3;
- (id)tabToInsertSpawnedTabAfter;
- (id)tabToSelectBeforeClosingTabs:(id)a3;
- (unint64_t)_indexOfLastRelatedTab;
- (unint64_t)_indexOfTabToInsertNewTabAfter;
- (unint64_t)_relationConsideringUserPreferenceForRelation:(unint64_t)a3 isBlankTab:(BOOL)a4;
- (unint64_t)_userPreferredNewBlankTabPositionInCurrentContext:(BOOL)a3;
- (unint64_t)_userPreferredNewSpawnedTabPosition;
- (unint64_t)newTabPosition;
- (void)setPreferenceProvider:(id)a3;
- (void)setTabOrderProvider:(id)a3;
@end

@implementation WBSTabOrderManager

- (void)setTabOrderProvider:(id)a3
{
}

- (WBSTabOrderManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)WBSTabOrderManager;
  v2 = [(WBSTabOrderManager *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    simplifiedIdentifierMap = v2->_simplifiedIdentifierMap;
    v2->_simplifiedIdentifierMap = (NSMutableDictionary *)v3;

    objc_storeWeak((id *)&v2->_preferenceProvider, v2);
    v5 = v2;
  }

  return v2;
}

- (id)tabToInsertNewTabAfterForPosition:(unint64_t)a3
{
  uint64_t v3 = [(WBSTabOrderManager *)self tabInsertionHintForPosition:a3];
  v4 = [v3 tabToInsertAfter];

  return v4;
}

- (id)tabInsertionHintForPosition:(unint64_t)a3
{
  return [(WBSTabOrderManager *)self _tabInsertionHintForPosition:a3 isBlankTab:0];
}

- (id)_tabInsertionHintForPosition:(unint64_t)a3 isBlankTab:(BOOL)a4
{
  BOOL v4 = a4;
  objc_super v7 = [(WBSTabOrderManager *)self tabOrderProvider];
  v8 = [v7 selectedTabForTabOrderProvider];
  if (v8)
  {
    if ([v7 numberOfTabs])
    {
      switch(a3)
      {
        case 0uLL:
          v9 = [(WBSTabOrderManager *)self _tabInsertionHintForNewTabAfterTab:v8 relation:0];
          goto LABEL_16;
        case 1uLL:
          unint64_t v10 = [(WBSTabOrderManager *)self _indexOfTabToInsertNewTabAfter];
          uint64_t v11 = !v4 || v10 != [v7 numberOfTabs] - 1;
          goto LABEL_14;
        case 2uLL:
          unint64_t v10 = [(WBSTabOrderManager *)self _indexOfLastRelatedTab];
          if (v4) {
            uint64_t v11 = 2 * (v10 != [v7 numberOfTabs] - 1);
          }
          else {
            uint64_t v11 = 2;
          }
LABEL_14:
          unint64_t v14 = [(WBSTabOrderManager *)self _relationConsideringUserPreferenceForRelation:v11 isBlankTab:v4];
          v13 = self;
          uint64_t v12 = v10;
          break;
        case 3uLL:
          uint64_t v12 = [v7 numberOfTabs] - 1;
          v13 = self;
          unint64_t v14 = 0;
          break;
        default:
          goto LABEL_5;
      }
      v9 = [(WBSTabOrderManager *)v13 _insertionHintWithIndexOfTabToInsertAfter:v12 relation:v14];
    }
    else
    {
      v9 = [[WBSTabOrderInsertionHint alloc] initWithTabToInsertAfter:0 insertionIndex:0 relation:0];
    }
  }
  else
  {
LABEL_5:
    v9 = [(WBSTabOrderManager *)self _insertionHintWithTabToInsertAfter:0 relation:0];
  }
LABEL_16:
  v15 = v9;

  return v15;
}

- (id)_tabInsertionHintForNewTabAfterTab:(id)a3 relation:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 isPinnedTab])
  {
    objc_super v7 = [(WBSTabOrderManager *)self tabOrderProvider];
    unint64_t v8 = [v7 indexForTab:v6];
    unint64_t v9 = [v7 numberOfTabs];
    if (v8 >= v9)
    {
      unint64_t v11 = v8;
    }
    else
    {
      unint64_t v10 = v9;
      unint64_t v11 = v8;
      do
      {
        uint64_t v12 = [v7 tabAtIndex:v8];
        int v13 = [v12 isPinnedTab];

        if (v13) {
          unint64_t v11 = v8;
        }
        ++v8;
      }
      while (v10 != v8);
    }
    unint64_t v14 = [(WBSTabOrderManager *)self _insertionHintWithIndexOfTabToInsertAfter:v11 relation:a4];
  }
  else
  {
    unint64_t v14 = [(WBSTabOrderManager *)self _insertionHintWithTabToInsertAfter:v6 relation:a4];
  }

  return v14;
}

- (id)tabInsertionHintForDuplicateOfTab:(id)a3
{
  return [(WBSTabOrderManager *)self _tabInsertionHintForNewTabAfterTab:a3 relation:1];
}

- (unint64_t)_indexOfTabToInsertNewTabAfter
{
  v2 = [(WBSTabOrderManager *)self tabOrderProvider];
  uint64_t v3 = [v2 selectedTabForTabOrderProvider];
  unint64_t v4 = [v2 numberOfTabs];
  v5 = [v3 identifier];
  unint64_t v6 = [v2 indexOfSelectedTab];
  if (v6 >= v4) {
    goto LABEL_18;
  }
  unint64_t v7 = v6;
  char v8 = 0;
  v16 = v3;
  uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    unint64_t v10 = objc_msgSend(v2, "tabAtIndex:", v7, v16);
    if ([v10 isPinnedTab]) {
      goto LABEL_13;
    }
    unint64_t v11 = [v10 identifier];
    if ([v11 isEqualToString:v5])
    {
    }
    else
    {
      uint64_t v12 = [v10 ancestorTabIdentifiers];
      char v13 = [v12 containsObject:v5];

      if ((v13 & 1) == 0)
      {
        uint64_t v14 = v17;
        if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v14 = v7;
        }
        uint64_t v17 = v14;
        goto LABEL_13;
      }
    }
    char v8 = 1;
    if (v9 != 0x7FFFFFFFFFFFFFFFLL && v7 - 1 != v9)
    {

      uint64_t v3 = v16;
      goto LABEL_17;
    }
    unint64_t v9 = v7;
LABEL_13:

    ++v7;
  }
  while (v4 != v7);
  uint64_t v3 = v16;
  if (v8) {
    goto LABEL_20;
  }
LABEL_17:
  if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
LABEL_18:
  }
    unint64_t v9 = v4 - 1;
  else {
    unint64_t v9 = v17 - 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)_indexOfLastRelatedTab
{
  v2 = self;
  uint64_t v3 = [(WBSTabOrderManager *)self tabOrderProvider];
  unint64_t v4 = [v3 selectedTabForTabOrderProvider];
  unint64_t v5 = [v3 numberOfTabs];
  unint64_t v6 = [v3 indexOfSelectedTab];
  if (v6 >= v5)
  {
    BOOL v8 = 0;
    goto LABEL_18;
  }
  unint64_t v7 = v6;
  BOOL v8 = 1;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    unint64_t v10 = [v3 tabAtIndex:v7];
    if (([v10 isPinnedTab] & 1) == 0) {
      break;
    }
LABEL_10:

    BOOL v8 = ++v7 < v5;
    if (v5 == v7)
    {
      BOOL v8 = 0;
      goto LABEL_17;
    }
  }
  if ([(WBSTabOrderManager *)v2 _tab:v10 isRelatedOrEqualToTab:v4])
  {
    if (v7 - 1 == v9 || v9 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v9 = v7;
    }
    goto LABEL_10;
  }
  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
    v2 = (WBSTabOrderManager *)(v5 - 1);
  }
  else {
    v2 = (WBSTabOrderManager *)v9;
  }

LABEL_17:
  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
LABEL_18:
  }
    uint64_t v9 = v5 - 1;
  if (v8) {
    unint64_t v12 = (unint64_t)v2;
  }
  else {
    unint64_t v12 = v9;
  }

  return v12;
}

- (id)tabToInsertNewBlankTabAfter
{
  v2 = [(WBSTabOrderManager *)self tabInsertionHintForNewBlankTab];
  uint64_t v3 = [v2 tabToInsertAfter];

  return v3;
}

- (id)tabInsertionHintForNewBlankTab
{
  unint64_t v3 = [(WBSTabOrderManager *)self _userPreferredNewBlankTabPositionInCurrentContext:0];
  return [(WBSTabOrderManager *)self _tabInsertionHintForNewBlankTabWithRecommendedPosition:v3];
}

- (id)_tabInsertionHintForNewBlankTabWithRecommendedPosition:(unint64_t)a3
{
  unint64_t v5 = [(WBSTabOrderManager *)self tabOrderProvider];
  unint64_t v6 = [v5 selectedTabForTabOrderProvider];
  if ([v6 isPinnedTab])
  {
    unint64_t v7 = [(WBSTabOrderManager *)self _tabInsertionHintForPosition:3 isBlankTab:1];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_preferenceProvider);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v10 = v9;
    [v6 lastActivationTime];
    double v12 = v11;
    [WeakRetained minimumDelayForRelatingNewBlankTab];
    if (v10 - v12 >= v13 || v12 == 0.0) {
      unint64_t v15 = a3;
    }
    else {
      unint64_t v15 = 3;
    }
    unint64_t v7 = [(WBSTabOrderManager *)self _tabInsertionHintForPosition:v15 isBlankTab:1];
  }
  return v7;
}

- (id)tabInsertionHintForNewBlankTabInCurrentContext
{
  unint64_t v3 = [(WBSTabOrderManager *)self _userPreferredNewBlankTabPositionInCurrentContext:1];
  return [(WBSTabOrderManager *)self _tabInsertionHintForNewBlankTabWithRecommendedPosition:v3];
}

- (id)tabToInsertSpawnedTabAfter
{
  v2 = [(WBSTabOrderManager *)self tabInsertionHintForSpawnedTab];
  unint64_t v3 = [v2 tabToInsertAfter];

  return v3;
}

- (id)tabInsertionHintForSpawnedTab
{
  unint64_t v3 = [(WBSTabOrderManager *)self _userPreferredNewSpawnedTabPosition];
  return [(WBSTabOrderManager *)self _tabInsertionHintForPosition:v3 isBlankTab:0];
}

- (id)tabInsertionHintForNewTabOfType:(int64_t)a3
{
  if (a3 == 2)
  {
    unint64_t v3 = [(WBSTabOrderManager *)self tabInsertionHintForSpawnedTab];
  }
  else if (a3 == 1)
  {
    unint64_t v3 = [(WBSTabOrderManager *)self tabInsertionHintForNewBlankTabInCurrentContext];
  }
  else
  {
    if (a3) {
      goto LABEL_8;
    }
    unint64_t v3 = [(WBSTabOrderManager *)self tabInsertionHintForNewBlankTab];
  }
  a2 = v3;
LABEL_8:
  return (id)(id)a2;
}

- (unint64_t)_userPreferredNewBlankTabPositionInCurrentContext:(BOOL)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preferenceProvider);
  int v5 = [WeakRetained newBlankTabPositionAppliesToAllBlankTabs];
  if (a3 || v5) {
    unint64_t v6 = [WeakRetained newTabPosition];
  }
  else {
    unint64_t v6 = 3;
  }

  return v6;
}

- (unint64_t)_userPreferredNewSpawnedTabPosition
{
  if (![(WBSTabOrderManager *)self _newTabPositionPreferenceAppliesToSwawnedTabs])return 1; {
  return [(WBSTabOrderManager *)self _userPreferredNewBlankTabPositionInCurrentContext:1];
  }
}

- (BOOL)_newTabPositionPreferenceAppliesToSwawnedTabs
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preferenceProvider);
  char v3 = [WeakRetained newTabPositionAppliesToSpawnedTabs];

  return v3;
}

- (id)tabToSelectBeforeClosingTabs:(id)a3
{
  id v4 = a3;
  int v5 = [(WBSTabOrderManager *)self tabOrderProvider];
  if ((unint64_t)[v5 numberOfTabs] < 2)
  {
    id v6 = 0;
    goto LABEL_18;
  }
  unint64_t v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
  closingTabs = self->_closingTabs;
  self->_closingTabs = v7;

  id v9 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __51__WBSTabOrderManager_tabToSelectBeforeClosingTabs___block_invoke;
  v30[3] = &unk_1E5C8C880;
  v30[4] = self;
  [v9 setHandler:v30];
  double v10 = [v5 selectedTabForTabOrderProvider];
  if (v10)
  {
    if ([(NSSet *)self->_closingTabs containsObject:v10])
    {
      if ([v10 shouldSelectOriginatingTabWhenClosed])
      {
        double v11 = [v5 originatingTabForTab:v10];
        id v6 = v11;
        if (v11)
        {
          double v12 = [v11 windowIdentifier];
          double v13 = [v10 windowIdentifier];
          char v14 = [v12 isEqualToString:v13];

          if (v14) {
            goto LABEL_17;
          }
        }
      }
      uint64_t v15 = [v5 indexOfSelectedTab];
      uint64_t v16 = [v5 numberOfTabs];
      if (v15)
      {
        if (v15 != v16 - 1)
        {
          v22 = [(WBSTabOrderManager *)self _nextNonClosedTabAdjacentToIndex:v15 inAscendingOrder:1];
          uint64_t v23 = [(WBSTabOrderManager *)self _nextNonClosedTabAdjacentToIndex:v15 inAscendingOrder:0];
          v24 = (void *)v23;
          if (v22 && v23)
          {
            BOOL v25 = [(WBSTabOrderManager *)self tab:v10 isInSameSetAsTab:v23];
            BOOL v26 = [(WBSTabOrderManager *)self tab:v10 isInSameSetAsTab:v22];
            int v27 = !v25 || v26;
            if (v27) {
              v28 = v22;
            }
            else {
              v28 = v24;
            }
            if (v27 == 1 && !v26)
            {
              BOOL v29 = [(WBSTabOrderManager *)self _tab:v10 isRelatedOrEqualToTab:v24];
              if (((v29 | [(WBSTabOrderManager *)self _tab:v10 isRelatedOrEqualToTab:v22]) & v29) != 0)v28 = v24; {
              else
              }
                v28 = v22;
            }
          }
          else if (v22)
          {
            v28 = v22;
          }
          else
          {
            v28 = (void *)v23;
          }
          id v6 = v28;

          goto LABEL_17;
        }
        uint64_t v17 = self;
        uint64_t v18 = v15;
        uint64_t v19 = 0;
      }
      else
      {
        uint64_t v17 = self;
        uint64_t v18 = 0;
        uint64_t v19 = 1;
      }
      id v20 = [(WBSTabOrderManager *)v17 _nextNonClosedTabAdjacentToIndex:v18 inAscendingOrder:v19];
    }
    else
    {
      id v20 = v10;
    }
    id v6 = v20;
  }
  else
  {
    id v6 = 0;
  }
LABEL_17:

LABEL_18:
  return v6;
}

void __51__WBSTabOrderManager_tabToSelectBeforeClosingTabs___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

- (BOOL)tab:(id)a3 isInSameSetAsTab:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 ancestorTabIdentifiers];
  id v9 = [v7 ancestorTabIdentifiers];
  if ([v8 count] || objc_msgSend(v9, "count"))
  {
    double v10 = (void *)[v8 count];
    if (v10 == (void *)[v9 count])
    {
      double v10 = [v8 lastObject];
      id v4 = [v9 lastObject];
      char v11 = [v10 isEqualToString:v4];
LABEL_15:

      goto LABEL_16;
    }
    uint64_t v12 = [v8 count];
    if (v12)
    {
      double v10 = [v8 lastObject];
      id v4 = [v7 identifier];
      if ([v10 isEqualToString:v4])
      {
        char v11 = 1;
        goto LABEL_15;
      }
      if (![v9 count])
      {
        char v11 = 0;
        goto LABEL_15;
      }
LABEL_12:
      double v13 = [v9 lastObject];
      char v14 = [v6 identifier];
      char v11 = [v13 isEqualToString:v14];

      if (!v12) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
    if ([v9 count]) {
      goto LABEL_12;
    }
    char v11 = 0;
  }
  else
  {
    char v11 = 1;
  }
LABEL_16:

  return v11;
}

- (BOOL)_tab:(id)a3 isRelatedOrEqualToTab:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 ancestorTabIdentifiers];
  id v9 = [v7 ancestorTabIdentifiers];
  double v10 = [v6 identifier];
  char v11 = [v7 identifier];
  if (([v10 isEqualToString:v11] & 1) == 0)
  {
    if (![v8 count] && !objc_msgSend(v9, "count"))
    {
      char v12 = 0;
      goto LABEL_19;
    }
    uint64_t v13 = [v8 count];
    if (v13)
    {
      id v4 = [v7 identifier];
      if ([v8 containsObject:v4])
      {
        char v12 = 1;
LABEL_18:

        goto LABEL_19;
      }
      if ([v9 count]) {
        goto LABEL_11;
      }
    }
    else if ([v9 count])
    {
LABEL_11:
      char v14 = [v6 identifier];
      char v15 = [v9 containsObject:v14];

      if (v13) {
      if (v15)
      }
        goto LABEL_2;
    }
    [v8 count];
    [v9 count];
    id v4 = [v8 firstObject];
    uint64_t v16 = [v9 firstObject];
    char v12 = [v4 isEqualToString:v16];

    goto LABEL_18;
  }
LABEL_2:
  char v12 = 1;
LABEL_19:

  return v12;
}

- (id)simplifiedIdentifierForDisplayInTabTitle:(id)a3
{
  id v4 = a3;
  int v5 = [(NSMutableDictionary *)self->_simplifiedIdentifierMap objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%li", self->_nextSimplifiedIdentifier);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [(NSMutableDictionary *)self->_simplifiedIdentifierMap setObject:v7 forKeyedSubscript:v4];
    ++self->_nextSimplifiedIdentifier;
  }

  return v7;
}

- (unint64_t)newTabPosition
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = objc_msgSend(v2, "safari_numberForKey:", @"WBSNewTabPositionPreferenceKey");

  if (v3)
  {
    unint64_t v4 = [v3 unsignedIntegerValue];
    if (v4 >= 4) {
      unint64_t v5 = 1;
    }
    else {
      unint64_t v5 = v4;
    }
  }
  else
  {
    unint64_t v5 = 2;
  }

  return v5;
}

- (BOOL)newTabPositionAppliesToSpawnedTabs
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"WBSNewTabPositionAppliesToSpawnedTabsPreferenceKey"];

  return v3;
}

- (BOOL)newBlankTabPositionAppliesToAllBlankTabs
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"WBSNewBlankTabPositionAppliesToAllBlankTabsPreferenceKey"];

  return v3;
}

- (BOOL)suppressRelatingNewBlankTabs
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"WBSTabOrderManagerSuppressRelatingNewBlankTabsPreferenceKey"];

  return v3;
}

- (double)minimumDelayForRelatingNewBlankTab
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 doubleForKey:@"WBSNewBlankTabPositionDelayPreferenceKey"];
  double v4 = v3;

  return v4;
}

- (id)_insertionHintWithIndexOfTabToInsertAfter:(unint64_t)a3 relation:(unint64_t)a4
{
  id v7 = [WBSTabOrderInsertionHint alloc];
  BOOL v8 = [(WBSTabOrderManager *)self tabOrderProvider];
  id v9 = [v8 tabAtIndex:a3];
  double v10 = [(WBSTabOrderInsertionHint *)v7 initWithTabToInsertAfter:v9 insertionIndex:a3 + 1 relation:a4];

  return v10;
}

- (id)_insertionHintWithTabToInsertAfter:(id)a3 relation:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [WBSTabOrderInsertionHint alloc];
  BOOL v8 = v7;
  if (v6)
  {
    id v9 = [(WBSTabOrderManager *)self tabOrderProvider];
    double v10 = -[WBSTabOrderInsertionHint initWithTabToInsertAfter:insertionIndex:relation:](v8, "initWithTabToInsertAfter:insertionIndex:relation:", v6, [v9 indexForTab:v6] + 1, a4);
  }
  else
  {
    double v10 = [(WBSTabOrderInsertionHint *)v7 initWithTabToInsertAfter:0 relation:a4];
  }

  return v10;
}

- (unint64_t)_relationConsideringUserPreferenceForRelation:(unint64_t)a3 isBlankTab:(BOOL)a4
{
  unint64_t v4 = a3;
  if (a4 && a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_preferenceProvider);
    if ([WeakRetained suppressRelatingNewBlankTabs]) {
      unint64_t v4 = 0;
    }
  }
  return v4;
}

- (id)_nextNonClosedTabAdjacentToIndex:(unint64_t)a3 inAscendingOrder:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(WBSTabOrderManager *)self tabOrderProvider];
  BOOL v8 = v7;
  if (v4) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = -1;
  }
  int64_t v10 = [v7 numberOfTabs];
  char v11 = 0;
  if ((uint64_t)(v9 + a3) < v10 && ((v9 + a3) & 0x8000000000000000) == 0)
  {
    int64_t v12 = v10;
    uint64_t v13 = 2 * v9;
    do
    {
      char v11 = [v8 tabAtIndex:v9 + a3];
      if (v11 && ![(NSSet *)self->_closingTabs containsObject:v11]) {
        break;
      }

      char v11 = 0;
      unint64_t v14 = v13 + a3;
      if ((uint64_t)(v13 + a3) >= v12) {
        break;
      }
      a3 += v9;
    }
    while ((v14 & 0x8000000000000000) == 0);
  }

  return v11;
}

- (WBSTabOrderProvider)tabOrderProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabOrderProvider);
  return (WBSTabOrderProvider *)WeakRetained;
}

- (WBSTabOrderPreferenceProviding)preferenceProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preferenceProvider);
  return (WBSTabOrderPreferenceProviding *)WeakRetained;
}

- (void)setPreferenceProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_preferenceProvider);
  objc_destroyWeak((id *)&self->_tabOrderProvider);
  objc_storeStrong((id *)&self->_simplifiedIdentifierMap, 0);
  objc_storeStrong((id *)&self->_closingTabs, 0);
}

@end