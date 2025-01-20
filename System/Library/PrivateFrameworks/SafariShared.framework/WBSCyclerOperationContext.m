@interface WBSCyclerOperationContext
- (BOOL)_isItemPrefixed:(id)a3;
- (BOOL)_isItemValid:(id)a3;
- (NSString)titlePrefix;
- (WBSCyclerItemListRepresentation)topLevelItem;
- (WBSCyclerProfileRepresentation)tabGroupsParent;
- (WBSCyclerTestTarget)testTarget;
- (id)_availableSymbolImageNames;
- (id)_buildDictionaryOfDescendantIdentifiersToParentIdentifiersFromList:(id)a3;
- (id)_copyItem:(id)a3 filteringWithIdentifierWhitelist:(id)a4;
- (id)filterOutItemsWithoutTitlePrefixInList:(id)a3;
- (id)randomDescendantOfList:(id)a3 enforcingTitlePrefixValidity:(BOOL)a4 passingTest:(id)a5;
- (id)randomItemTitle;
- (id)randomSymbolImageName;
- (id)randomValidStrictDescendantOfList:(id)a3;
- (id)randomValidStrictDescendantOfTopLevelItem;
- (id)randomValidStrictListDescendantOfList:(id)a3;
- (id)randomValidStrictListDescendantOfTopLevelItem;
- (void)setTabGroupsParent:(id)a3;
- (void)setTestTarget:(id)a3;
- (void)setTitlePrefix:(id)a3;
- (void)setTopLevelItem:(id)a3;
@end

@implementation WBSCyclerOperationContext

- (id)_availableSymbolImageNames
{
  return (id)[MEMORY[0x1E4F97E78] availableSymbolImageNames];
}

- (void)setTitlePrefix:(id)a3
{
  id v6 = a3;
  if ([v6 length])
  {
    v4 = (NSString *)[v6 copy];
    titlePrefix = self->_titlePrefix;
    self->_titlePrefix = v4;
  }
  else
  {
    titlePrefix = self->_titlePrefix;
    self->_titlePrefix = 0;
  }
}

- (id)filterOutItemsWithoutTitlePrefixInList:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __68__WBSCyclerOperationContext_filterOutItemsWithoutTitlePrefixInList___block_invoke;
  v24[3] = &unk_1E5C9A758;
  v24[4] = self;
  v5 = [v4 allDescendantsPassingTest:v24];
  id v6 = [(WBSCyclerOperationContext *)self _buildDictionaryOfDescendantIdentifiersToParentIdentifiersFromList:v4];
  v7 = (void *)MEMORY[0x1E4F1CA80];
  v8 = [v4 uniqueIdentifier];
  v9 = [v7 setWithObject:v8];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "uniqueIdentifier", (void)v20);
        if (v15)
        {
          v16 = (void *)v15;
          do
          {
            [v9 addObject:v16];
            uint64_t v17 = [v6 objectForKeyedSubscript:v16];

            v16 = (void *)v17;
          }
          while (v17);
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v12);
  }

  id v18 = [(WBSCyclerOperationContext *)self _copyItem:v4 filteringWithIdentifierWhitelist:v9];
  return v18;
}

uint64_t __68__WBSCyclerOperationContext_filterOutItemsWithoutTitlePrefixInList___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _isItemPrefixed:a2];
}

- (id)randomItemTitle
{
  v3 = +[WBSCyclerRandomnessUtilities randomStringWithMaximumLength:*MEMORY[0x1E4F98170]];
  titlePrefix = self->_titlePrefix;
  if (titlePrefix)
  {
    uint64_t v5 = [(NSString *)titlePrefix stringByAppendingString:v3];

    v3 = (void *)v5;
  }
  return v3;
}

- (id)randomSymbolImageName
{
  v3 = [(WBSCyclerOperationContext *)self _availableSymbolImageNames];
  id v4 = [(WBSCyclerOperationContext *)self _availableSymbolImageNames];
  uint64_t v5 = objc_msgSend(v3, "objectAtIndexedSubscript:", +[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:](WBSCyclerRandomnessUtilities, "randomIntegerWithUpperBound:", objc_msgSend(v4, "count") - 1));

  return v5;
}

- (id)randomDescendantOfList:(id)a3 enforcingTitlePrefixValidity:(BOOL)a4 passingTest:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __93__WBSCyclerOperationContext_randomDescendantOfList_enforcingTitlePrefixValidity_passingTest___block_invoke;
  v12[3] = &unk_1E5C9A820;
  BOOL v14 = a4;
  v12[4] = self;
  id v13 = v8;
  id v9 = v8;
  id v10 = [a3 randomDescendantPassingTest:v12];

  return v10;
}

BOOL __93__WBSCyclerOperationContext_randomDescendantOfList_enforcingTitlePrefixValidity_passingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v5 = 0;
  if (!*(unsigned char *)(a1 + 48) || [*(id *)(a1 + 32) _isItemValid:v3])
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (!v4 || (*(unsigned int (**)(uint64_t, id))(v4 + 16))(v4, v3)) {
      BOOL v5 = 1;
    }
  }

  return v5;
}

- (id)randomValidStrictDescendantOfList:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__WBSCyclerOperationContext_randomValidStrictDescendantOfList___block_invoke;
  v8[3] = &unk_1E5C9A758;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(WBSCyclerOperationContext *)self randomDescendantOfList:v5 enforcingTitlePrefixValidity:1 passingTest:v8];

  return v6;
}

BOOL __63__WBSCyclerOperationContext_randomValidStrictDescendantOfList___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) != a2;
}

- (id)randomValidStrictDescendantOfTopLevelItem
{
  if (self->_topLevelItem)
  {
    v2 = -[WBSCyclerOperationContext randomValidStrictDescendantOfList:](self, "randomValidStrictDescendantOfList:");
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)randomValidStrictListDescendantOfList:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__WBSCyclerOperationContext_randomValidStrictListDescendantOfList___block_invoke;
  v8[3] = &unk_1E5C9A758;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(WBSCyclerOperationContext *)self randomDescendantOfList:v5 enforcingTitlePrefixValidity:1 passingTest:v8];

  return v6;
}

uint64_t __67__WBSCyclerOperationContext_randomValidStrictListDescendantOfList___block_invoke(uint64_t a1, void *a2)
{
  if (*(void **)(a1 + 32) == a2)
  {
    char isKindOfClass = 0;
  }
  else
  {
    id v2 = a2;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (id)randomValidStrictListDescendantOfTopLevelItem
{
  if (self->_topLevelItem)
  {
    id v2 = -[WBSCyclerOperationContext randomValidStrictListDescendantOfList:](self, "randomValidStrictListDescendantOfList:");
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (BOOL)_isItemPrefixed:(id)a3
{
  if (!self->_titlePrefix) {
    return 1;
  }
  id v3 = self;
  id v4 = [a3 title];
  LOBYTE(v3) = [v4 hasPrefix:v3->_titlePrefix];

  return (char)v3;
}

- (BOOL)_isItemValid:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (WBSCyclerItemListRepresentation *)a3;
  if (self->_topLevelItem == v4) {
    goto LABEL_13;
  }
  if (![(WBSCyclerOperationContext *)self _isItemPrefixed:v4])
  {
    BOOL v10 = 0;
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_13:
    BOOL v10 = 1;
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v4;
    uint64_t v6 = [(WBSCyclerItemListRepresentation *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          if (!-[WBSCyclerOperationContext _isItemValid:](self, "_isItemValid:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12))
          {
            BOOL v10 = 0;
            goto LABEL_16;
          }
        }
        uint64_t v7 = [(WBSCyclerItemListRepresentation *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    BOOL v10 = 1;
LABEL_16:
  }
LABEL_17:

  return v10;
}

- (id)_buildDictionaryOfDescendantIdentifiersToParentIdentifiersFromList:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v12 = objc_msgSend(v6, "uniqueIdentifier", (void)v16);
        long long v13 = [v11 uniqueIdentifier];
        [v5 setObject:v12 forKeyedSubscript:v13];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v14 = [(WBSCyclerOperationContext *)self _buildDictionaryOfDescendantIdentifiersToParentIdentifiersFromList:v11];
          [v5 addEntriesFromDictionary:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_copyItem:(id)a3 filteringWithIdentifierWhitelist:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 uniqueIdentifier];
  int v9 = [v7 containsObject:v8];

  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v10 = [WBSCyclerItemListRepresentation alloc];
      uint64_t v11 = [v6 title];
      long long v12 = [v6 uniqueIdentifier];
      long long v13 = [(WBSCyclerItemListRepresentation *)v10 initWithTitle:v11 uniqueIdentifier:v12];

      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v14 = v6;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v22;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v22 != v17) {
              objc_enumerationMutation(v14);
            }
            id v19 = -[WBSCyclerOperationContext _copyItem:filteringWithIdentifierWhitelist:](self, "_copyItem:filteringWithIdentifierWhitelist:", *(void *)(*((void *)&v21 + 1) + 8 * v18), v7, (void)v21);
            if (v19) {
              [(WBSCyclerItemListRepresentation *)v13 addChild:v19];
            }

            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v16);
      }
    }
    else
    {
      long long v13 = (WBSCyclerItemListRepresentation *)v6;
    }
  }
  else
  {
    long long v13 = 0;
  }

  return v13;
}

- (WBSCyclerTestTarget)testTarget
{
  return self->_testTarget;
}

- (void)setTestTarget:(id)a3
{
}

- (WBSCyclerItemListRepresentation)topLevelItem
{
  return self->_topLevelItem;
}

- (void)setTopLevelItem:(id)a3
{
}

- (WBSCyclerProfileRepresentation)tabGroupsParent
{
  return self->_tabGroupsParent;
}

- (void)setTabGroupsParent:(id)a3
{
}

- (NSString)titlePrefix
{
  return self->_titlePrefix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titlePrefix, 0);
  objc_storeStrong((id *)&self->_tabGroupsParent, 0);
  objc_storeStrong((id *)&self->_topLevelItem, 0);
  objc_storeStrong((id *)&self->_testTarget, 0);
}

@end