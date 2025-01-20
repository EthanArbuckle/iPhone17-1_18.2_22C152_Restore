@interface SBHLibraryCategory
- (BOOL)iconSupportsUninstall:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCategory:(id)a3;
- (BOOL)updateCategoryIdentifier:(id)a3;
- (BOOL)updateCategoryWithIcons:(id)a3;
- (NSArray)icons;
- (NSString)description;
- (NSString)leafIdentifier;
- (SBHLibraryAdditionalItemsIndicatorIcon)additionalItemsIndicatorIcon;
- (SBHLibraryCategory)init;
- (SBHLibraryCategoryFolder)compactPodAdditionalItemsFolder;
- (SBHLibraryCategoryFolder)compactPodFolder;
- (SBHLibraryCategoryFolder)expandedPodFolder;
- (SBHLibraryCategoryIdentifier)categoryIdentifier;
- (SBIconDelegate)iconDelegate;
- (id)_buildDisplayedIconsForFolder:(id)a3 icons:(id)a4;
- (id)icon:(id)a3 displayNameForLocation:(id)a4;
- (id)supportedGridSizeClassesForIcon:(id)a3;
- (int64_t)labelAccessoryTypeForIcon:(id)a3;
- (int64_t)overflowBehavior;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)priorityForIcon:(id)a3;
- (void)_localizedDisplayNameChangedTo:(id)a3;
- (void)_noteCategoryDidUpdate;
- (void)_noteCategoryWillUpdate;
- (void)_noteFolderDidUpdateIcons:(id)a3;
- (void)_noteFolderWillUpdateIcons:(id)a3;
- (void)_refreshAggregateIconLabelAccessoryType;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setCategoryIdentifier:(id)a3;
- (void)setIconDelegate:(id)a3;
- (void)setOverflowBehavior:(int64_t)a3;
@end

@implementation SBHLibraryCategory

- (void)_refreshAggregateIconLabelAccessoryType
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = self->_icons;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "labelAccessoryType", (void)v12);
        if (v9 == 1)
        {

          int64_t v10 = 1;
          goto LABEL_14;
        }
        v6 |= v9 != 4;
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }

    if (v6)
    {
      int64_t v10 = 0;
      goto LABEL_14;
    }
  }
  else
  {
  }
  int64_t v10 = 4 * ([(NSArray *)self->_icons count] != 0);
LABEL_14:
  if (self->_aggregrateIconLabelAccessoryType != v10)
  {
    self->_aggregrateIconLabelAccessoryType = v10;
    v11 = objc_msgSend(MEMORY[0x1E4F28EB8], "sbh_leafIconDataSourceNotificationCenter");
    [v11 postNotificationName:@"SBLeafIconDataSourceDidChangeNotification" object:self];
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SBHLibraryCategory *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(SBHLibraryCategory *)self isEqualToCategory:v4];
  }

  return v5;
}

- (BOOL)isEqualToCategory:(id)a3
{
  uint64_t v4 = (SBHLibraryCategory *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    char v6 = [(SBHLibraryCategory *)v4 categoryIdentifier];
    uint64_t v7 = [(SBHLibraryCategory *)self categoryIdentifier];
    char v8 = [v6 isEqual:v7];

    if (v8)
    {
      char v9 = 0;
    }
    else
    {
      int64_t v10 = [(SBHLibraryCategory *)v5 icons];
      v11 = [(SBHLibraryCategory *)self icons];
      char v9 = BSEqualObjects();
    }
  }

  return v9;
}

- (NSArray)icons
{
  return self->_icons;
}

- (SBHLibraryCategoryIdentifier)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (SBHLibraryCategory)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBHLibraryCategory;
  v2 = [(SBHLibraryCategory *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;
  }
  return v2;
}

- (void)addObserver:(id)a3
{
  if (a3) {
    -[NSHashTable addObject:](self->_observers, "addObject:");
  }
}

- (void)removeObserver:(id)a3
{
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  uint64_t v4 = [(SBHLibraryCategory *)self icons];
  id v5 = (id)[v3 appendObject:v4 withName:@"icons"];

  objc_super v6 = [(SBHLibraryCategory *)self categoryIdentifier];
  id v7 = (id)[v3 appendObject:v6 withName:@"categoryIdentifier"];

  additionalItemsIndicatorIcon = self->_additionalItemsIndicatorIcon;
  if (additionalItemsIndicatorIcon) {
    id v9 = (id)[v3 appendPointer:additionalItemsIndicatorIcon withName:@"additionalItemsIndicatorIcon"];
  }
  int64_t v10 = [v3 build];

  return (NSString *)v10;
}

- (void)_localizedDisplayNameChangedTo:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(SBFolder *)self->_compactPodFolder displayName];
  char v5 = [v4 isEqualToString:v10];

  if ((v5 & 1) == 0) {
    [(SBFolder *)self->_compactPodFolder setDisplayName:v10];
  }
  objc_super v6 = [(SBFolder *)self->_compactPodAdditionalItemsFolder displayName];
  char v7 = [v6 isEqualToString:v10];

  if ((v7 & 1) == 0) {
    [(SBFolder *)self->_compactPodAdditionalItemsFolder setDisplayName:v10];
  }
  char v8 = [(SBFolder *)self->_expandedPodFolder displayName];
  char v9 = [v8 isEqualToString:v10];

  if ((v9 & 1) == 0) {
    [(SBFolder *)self->_expandedPodFolder setDisplayName:v10];
  }
}

- (void)setCategoryIdentifier:(id)a3
{
  id v6 = a3;
  if (!-[SBHLibraryCategoryIdentifier isEqual:](self->_categoryIdentifier, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_categoryIdentifier, a3);
    char v5 = [v6 localizedDisplayName];
    [(SBHLibraryCategory *)self _localizedDisplayNameChangedTo:v5];

    self->_overflowBehavior = [v6 predictionCategoryID] == 3;
  }
}

- (BOOL)updateCategoryIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBHLibraryCategoryIdentifier *)self->_categoryIdentifier isEqual:v4];
  if (!v5)
  {
    [(SBHLibraryCategory *)self _noteCategoryWillUpdate];
    [(SBHLibraryCategory *)self setCategoryIdentifier:v4];
    [(SBHLibraryCategory *)self _noteCategoryDidUpdate];
  }

  return !v5;
}

- (BOOL)updateCategoryWithIcons:(id)a3
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSArray *)self->_icons isEqualToArray:v4])
  {
    char v5 = 0;
  }
  else
  {
    [(SBHLibraryCategory *)self _noteCategoryWillUpdate];
    id v6 = [(SBHLibraryCategory *)self categoryIdentifier];
    uint64_t v7 = [v6 localizedDisplayName];

    v69 = objc_opt_new();
    char v8 = [(SBHLibraryCategory *)self compactPodFolder];
    char v9 = [(SBHLibraryCategory *)self compactPodAdditionalItemsFolder];
    id v10 = [(SBHLibraryCategory *)self expandedPodFolder];
    [v8 setDisplayName:v7];
    [v9 setDisplayName:v7];
    v59 = (void *)v7;
    [v10 setDisplayName:v7];
    v11 = objc_opt_new();
    v58 = v8;
    objc_msgSend(v11, "bs_safeAddObject:", v8);
    v57 = v9;
    objc_msgSend(v11, "bs_safeAddObject:", v9);
    v56 = v10;
    objc_msgSend(v11, "bs_safeAddObject:", v10);
    [(NSArray *)self->_icons makeObjectsPerformSelector:sel_removeObserver_ withObject:self];
    [v4 makeObjectsPerformSelector:sel_addObserver_ withObject:self];
    long long v12 = [(SBHLibraryCategory *)self additionalItemsIndicatorIcon];
    long long v13 = (void *)MEMORY[0x1E4F28F60];
    v94[0] = MEMORY[0x1E4F143A8];
    v94[1] = 3221225472;
    v94[2] = __46__SBHLibraryCategory_updateCategoryWithIcons___block_invoke;
    v94[3] = &unk_1E6AAD4F0;
    id v55 = v12;
    id v95 = v55;
    long long v14 = [v13 predicateWithBlock:v94];
    v60 = v4;
    v63 = [v4 filteredArrayUsingPredicate:v14];

    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    obuint64_t j = v11;
    uint64_t v64 = [obj countByEnumeratingWithState:&v90 objects:v99 count:16];
    char v5 = 0;
    if (v64)
    {
      uint64_t v62 = *(void *)v91;
      v70 = self;
      do
      {
        for (uint64_t i = 0; i != v64; ++i)
        {
          if (*(void *)v91 != v62) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v90 + 1) + 8 * i);
          uint64_t v17 = (void *)MEMORY[0x1D9484600]();
          v18 = [v16 icons];
          v19 = [(SBHLibraryCategory *)self _buildDisplayedIconsForFolder:v16 icons:v63];
          if ([v18 count] || !objc_msgSend(v19, "count"))
          {
            v66 = v18;
            v67 = v17;
            uint64_t v68 = i;
            v65 = v19;
            v20 = (void *)[v19 mutableCopy];
            long long v86 = 0u;
            long long v87 = 0u;
            long long v88 = 0u;
            long long v89 = 0u;
            v71 = v16;
            id v75 = [v16 lists];
            uint64_t v21 = [v75 countByEnumeratingWithState:&v86 objects:v98 count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = *(void *)v87;
              uint64_t v72 = *(void *)v87;
              v73 = v20;
              do
              {
                uint64_t v24 = 0;
                uint64_t v74 = v22;
                do
                {
                  if (*(void *)v87 != v23) {
                    objc_enumerationMutation(v75);
                  }
                  v25 = *(void **)(*((void *)&v86 + 1) + 8 * v24);
                  v26 = [v25 icons];
                  unint64_t v27 = [v20 count];
                  unint64_t v28 = [v25 maxNumberOfIcons];
                  if (v27 >= v28) {
                    unint64_t v29 = v28;
                  }
                  else {
                    unint64_t v29 = v27;
                  }
                  v30 = objc_msgSend(v20, "subarrayWithRange:", 0, v29);
                  v31 = [v30 differenceFromArray:v26];
                  if ([v31 hasChanges])
                  {
                    v76 = v30;
                    v77 = v26;
                    if ((v5 & 1) == 0)
                    {
                      [(SBHLibraryCategory *)v70 _noteFolderWillUpdateIcons:v71];
                      [v69 addObject:v71];
                    }
                    long long v84 = 0u;
                    long long v85 = 0u;
                    long long v82 = 0u;
                    long long v83 = 0u;
                    v32 = [v31 removals];
                    uint64_t v33 = [v32 countByEnumeratingWithState:&v82 objects:v97 count:16];
                    if (v33)
                    {
                      uint64_t v34 = v33;
                      uint64_t v35 = *(void *)v83;
                      do
                      {
                        for (uint64_t j = 0; j != v34; ++j)
                        {
                          if (*(void *)v83 != v35) {
                            objc_enumerationMutation(v32);
                          }
                          v37 = [*(id *)(*((void *)&v82 + 1) + 8 * j) object];
                          [v25 removeIcon:v37];
                        }
                        uint64_t v34 = [v32 countByEnumeratingWithState:&v82 objects:v97 count:16];
                      }
                      while (v34);
                    }

                    long long v80 = 0u;
                    long long v81 = 0u;
                    long long v78 = 0u;
                    long long v79 = 0u;
                    v38 = [v31 insertions];
                    uint64_t v39 = [v38 countByEnumeratingWithState:&v78 objects:v96 count:16];
                    if (v39)
                    {
                      uint64_t v40 = v39;
                      uint64_t v41 = *(void *)v79;
                      do
                      {
                        for (uint64_t k = 0; k != v40; ++k)
                        {
                          if (*(void *)v79 != v41) {
                            objc_enumerationMutation(v38);
                          }
                          v43 = *(void **)(*((void *)&v78 + 1) + 8 * k);
                          v44 = [v43 object];
                          id v45 = (id)objc_msgSend(v25, "insertIcon:atIndex:", v44, objc_msgSend(v43, "index"));
                        }
                        uint64_t v40 = [v38 countByEnumeratingWithState:&v78 objects:v96 count:16];
                      }
                      while (v40);
                    }

                    char v5 = 1;
                    uint64_t v23 = v72;
                    v20 = v73;
                    uint64_t v22 = v74;
                    v30 = v76;
                    v26 = v77;
                  }
                  objc_msgSend(v20, "removeObjectsInRange:", 0, v29);

                  ++v24;
                }
                while (v24 != v22);
                uint64_t v22 = [v75 countByEnumeratingWithState:&v86 objects:v98 count:16];
              }
              while (v22);
            }

            while ([v20 count])
            {
              v46 = [v71 addEmptyList];
              unint64_t v47 = [v20 count];
              unint64_t v48 = [v46 maxNumberOfIcons];
              if (v47 >= v48) {
                unint64_t v47 = v48;
              }
              v49 = objc_msgSend(v20, "subarrayWithRange:", 0, v47);
              id v50 = (id)[v71 addListWithIcons:v49];

              objc_msgSend(v20, "removeObjectsInRange:", 0, v47);
            }
            self = v70;
            uint64_t v17 = v67;
            uint64_t i = v68;
            v19 = v65;
            v18 = v66;
            if (v5) {
              [(SBHLibraryCategory *)v70 _noteFolderDidUpdateIcons:v71];
            }
          }
          else
          {
            [(SBHLibraryCategory *)self _noteFolderWillUpdateIcons:v16];
            id v51 = (id)[v16 addIcons:v19];
            [(SBHLibraryCategory *)self _noteFolderDidUpdateIcons:v16];
            char v5 = 1;
          }
        }
        uint64_t v64 = [obj countByEnumeratingWithState:&v90 objects:v99 count:16];
      }
      while (v64);
    }

    id v4 = v60;
    v52 = (NSArray *)[v60 copy];
    icons = self->_icons;
    self->_icons = v52;

    [(SBHLibraryCategory *)self _refreshAggregateIconLabelAccessoryType];
    [(SBHLibraryCategory *)self _noteCategoryDidUpdate];
  }
  return v5 & 1;
}

BOOL __46__SBHLibraryCategory_updateCategoryWithIcons___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) != a2;
}

- (void)_noteCategoryWillUpdate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_observers;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "categoryWillUpdate:", self, (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_noteCategoryDidUpdate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_observers;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "categoryDidUpdate:", self, (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_noteFolderWillUpdateIcons:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_observers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "category:willUpdateIconsWithinFolder:", self, v4, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_noteFolderDidUpdateIcons:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_observers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "category:didUpdateIconsWithinFolder:", self, v4, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)_buildDisplayedIconsForFolder:(id)a3 icons:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBHLibraryCategory *)self compactPodFolder];

  if (v8 != v6)
  {
    id v9 = [(SBHLibraryCategory *)self compactPodAdditionalItemsFolder];
    if (v9 != v6)
    {

LABEL_10:
      id v15 = [(SBHLibraryCategory *)self expandedPodFolder];

      if (v15 != v6)
      {
        uint64_t v16 = (void *)MEMORY[0x1E4F1CBF0];
        goto LABEL_15;
      }
      uint64_t v14 = [v7 sortedArrayUsingSelector:sel_localizedCompareDisplayNames_];
      goto LABEL_14;
    }
    unint64_t v13 = [v7 count];

    if (v13 < 5) {
      goto LABEL_10;
    }
    uint64_t v12 = [v7 count] - 3;
    long long v10 = v7;
    uint64_t v11 = 3;
    goto LABEL_9;
  }
  if ((unint64_t)[v7 count] < 5)
  {
    uint64_t v14 = [v7 copy];
    goto LABEL_14;
  }
  if ([(SBHLibraryCategory *)self overflowBehavior])
  {
    long long v10 = v7;
    uint64_t v11 = 0;
    uint64_t v12 = 4;
LABEL_9:
    uint64_t v14 = objc_msgSend(v10, "subarrayWithRange:", v11, v12);
LABEL_14:
    uint64_t v16 = (void *)v14;
    goto LABEL_15;
  }
  v18 = objc_msgSend(v7, "subarrayWithRange:", 0, 3);
  v19 = [(SBHLibraryCategory *)self additionalItemsIndicatorIcon];
  uint64_t v16 = [v18 arrayByAddingObject:v19];

LABEL_15:
  return v16;
}

- (SBHLibraryCategoryFolder)compactPodFolder
{
  compactPodFolder = self->_compactPodFolder;
  if (!compactPodFolder)
  {
    id v4 = [SBHLibraryCategoryFolder alloc];
    uint64_t v5 = [(SBHLibraryCategory *)self categoryIdentifier];
    id v6 = [v5 localizedDisplayName];
    id v7 = [(SBHLibraryCategory *)self categoryIdentifier];
    id v8 = [(SBHLibraryCategoryFolder *)v4 initWithDisplayName:v6 maxListCount:1 listGridSize:131074 libraryCategoryIdentifier:v7];
    id v9 = self->_compactPodFolder;
    self->_compactPodFolder = v8;

    compactPodFolder = self->_compactPodFolder;
  }
  long long v10 = compactPodFolder;
  return v10;
}

- (SBHLibraryCategoryFolder)compactPodAdditionalItemsFolder
{
  compactPodAdditionalItemsFolder = self->_compactPodAdditionalItemsFolder;
  if (!compactPodAdditionalItemsFolder)
  {
    id v4 = [SBHLibraryCategoryFolder alloc];
    uint64_t v5 = [(SBHLibraryCategory *)self categoryIdentifier];
    id v6 = [v5 localizedDisplayName];
    id v7 = [(SBHLibraryCategory *)self categoryIdentifier];
    id v8 = [(SBHLibraryCategoryFolder *)v4 initWithDisplayName:v6 maxListCount:-1 listGridSize:131074 libraryCategoryIdentifier:v7];
    id v9 = self->_compactPodAdditionalItemsFolder;
    self->_compactPodAdditionalItemsFolder = v8;

    compactPodAdditionalItemsFolder = self->_compactPodAdditionalItemsFolder;
  }
  long long v10 = compactPodAdditionalItemsFolder;
  return v10;
}

- (SBHLibraryCategoryFolder)expandedPodFolder
{
  expandedPodFolder = self->_expandedPodFolder;
  if (!expandedPodFolder)
  {
    id v4 = [SBHLibraryCategoryFolder alloc];
    uint64_t v5 = [(SBHLibraryCategory *)self categoryIdentifier];
    id v6 = [v5 localizedDisplayName];
    id v7 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    id v9 = [(SBHLibraryCategory *)self categoryIdentifier];
    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      uint64_t v10 = 4294901766;
    }
    else {
      uint64_t v10 = 4294901764;
    }
    uint64_t v11 = [(SBHLibraryCategoryFolder *)v4 initWithDisplayName:v6 maxListCount:1 listGridSize:v10 libraryCategoryIdentifier:v9];
    uint64_t v12 = self->_expandedPodFolder;
    self->_expandedPodFolder = v11;

    expandedPodFolder = self->_expandedPodFolder;
  }
  unint64_t v13 = expandedPodFolder;
  return v13;
}

- (SBHLibraryAdditionalItemsIndicatorIcon)additionalItemsIndicatorIcon
{
  additionalItemsIndicatorIcon = self->_additionalItemsIndicatorIcon;
  if (!additionalItemsIndicatorIcon)
  {
    id v4 = [[SBHLibraryAdditionalItemsIndicatorIcon alloc] initWithCategory:self];
    uint64_t v5 = self->_additionalItemsIndicatorIcon;
    self->_additionalItemsIndicatorIcon = v4;

    id v6 = self->_additionalItemsIndicatorIcon;
    id v7 = [(SBHLibraryCategory *)self iconDelegate];
    [(SBIcon *)v6 setDelegate:v7];

    additionalItemsIndicatorIcon = self->_additionalItemsIndicatorIcon;
  }
  uint64_t v8 = additionalItemsIndicatorIcon;
  return v8;
}

- (int64_t)labelAccessoryTypeForIcon:(id)a3
{
  return self->_aggregrateIconLabelAccessoryType;
}

- (NSString)leafIdentifier
{
  uint64_t v3 = NSString;
  id v4 = [(SBHLibraryCategory *)self categoryIdentifier];
  uint64_t v5 = [v4 predictionCategoryID];
  id v6 = [(SBHLibraryCategory *)self categoryIdentifier];
  id v7 = [v6 localizedDisplayName];
  uint64_t v8 = [v3 stringWithFormat:@"dewey_category-%lu-%@", v5, v7];

  return (NSString *)v8;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSArray *)self->_icons countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (int64_t)overflowBehavior
{
  return self->_overflowBehavior;
}

- (void)setOverflowBehavior:(int64_t)a3
{
  self->_overflowBehavior = a3;
}

- (SBIconDelegate)iconDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconDelegate);
  return (SBIconDelegate *)WeakRetained;
}

- (void)setIconDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icons, 0);
  objc_destroyWeak((id *)&self->_iconDelegate);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_additionalItemsIndicatorIcon, 0);
  objc_storeStrong((id *)&self->_expandedPodFolder, 0);
  objc_storeStrong((id *)&self->_compactPodAdditionalItemsFolder, 0);
  objc_storeStrong((id *)&self->_compactPodFolder, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (unint64_t)priorityForIcon:(id)a3
{
  return 0;
}

- (id)icon:(id)a3 displayNameForLocation:(id)a4
{
  id v4 = [(SBHLibraryCategory *)self categoryIdentifier];
  uint64_t v5 = [v4 localizedDisplayName];

  return v5;
}

- (BOOL)iconSupportsUninstall:(id)a3
{
  return 0;
}

- (id)supportedGridSizeClassesForIcon:(id)a3
{
  uint64_t v3 = [[SBHIconGridSizeClassSet alloc] initWithGridSizeClass:@"SBHIconGridSizeClassSmall"];
  return v3;
}

@end