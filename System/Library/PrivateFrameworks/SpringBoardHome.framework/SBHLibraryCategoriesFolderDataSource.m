@interface SBHLibraryCategoriesFolderDataSource
- (BOOL)containsIcon:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDataSource:(id)a3;
- (NSArray)categoryIdentifiers;
- (SBHIconModel)iconModel;
- (SBHLibraryCategoriesFolderDataSource)init;
- (SBHLibraryCategoriesFolderDataSource)initWithCategoriesFolder:(id)a3;
- (SBHLibraryCategoriesRootFolder)categoriesFolder;
- (id)categoryForIdentifier:(id)a3;
- (id)reloadData;
- (id)reloadDataSourceUsingIcons:(id)a3 categoryMap:(id)a4;
- (id)reloadDataWithCategoryMap:(id)a3;
- (int64_t)maximumNumberOfDisplayedCategories;
- (unint64_t)categoryIdentifiersCount;
- (void)_noteDidAddIcon:(id)a3;
- (void)_noteDidReloadIcons:(id)a3;
- (void)_noteDidReplaceIcon:(id)a3;
- (void)_noteIconVisibilityDidChange:(id)a3;
- (void)_noteWillLayoutIconState:(id)a3;
- (void)_noteWillRemoveIcon:(id)a3;
- (void)_regenerateCategoriesFolder;
- (void)addObserver:(id)a3;
- (void)iconAccessoriesDidUpdate:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setMaximumNumberOfDisplayedCategories:(int64_t)a3;
@end

@implementation SBHLibraryCategoriesFolderDataSource

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(SBHLibraryCategoriesFolderDataSource *)self isEqualToDataSource:v4];

  return v5;
}

- (void)iconAccessoriesDidUpdate:(id)a3
{
  id v5 = a3;
  if (-[NSSet containsObject:](self->_mappedIcons, "containsObject:") && ([v5 isWidgetIcon] & 1) == 0) {
    id v4 = [(SBHLibraryCategoriesFolderDataSource *)self reloadData];
  }
}

- (id)reloadData
{
  v3 = [(SBHLibraryCategoriesFolderDataSource *)self iconModel];
  id v4 = [v3 leafIcons];
  id v5 = [(SBHLibraryCategoriesFolderDataSource *)self reloadDataSourceUsingIcons:v4 categoryMap:self->_categoryMap];

  return v5;
}

- (id)reloadDataSourceUsingIcons:(id)a3 categoryMap:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 isEqual:self->_mappedIcons]
    || ![v7 isEqualToCategoryMap:self->_categoryMap])
  {
    mappedIcons = self->_mappedIcons;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __79__SBHLibraryCategoriesFolderDataSource_reloadDataSourceUsingIcons_categoryMap___block_invoke;
    v15[3] = &unk_1E6AB0A70;
    v15[4] = self;
    [(NSSet *)mappedIcons enumerateObjectsUsingBlock:v15];
    v9 = (NSSet *)[v6 copy];
    v10 = self->_mappedIcons;
    self->_mappedIcons = v9;

    objc_storeStrong((id *)&self->_categoryMap, a4);
    [(SBHLibraryCategoriesFolderDataSource *)self _regenerateCategoriesFolder];
    v11 = self->_mappedIcons;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __79__SBHLibraryCategoriesFolderDataSource_reloadDataSourceUsingIcons_categoryMap___block_invoke_2;
    v14[3] = &unk_1E6AB0A70;
    v14[4] = self;
    [(NSSet *)v11 enumerateObjectsUsingBlock:v14];
    objc_storeStrong((id *)&self->_categoryMap, a4);
  }
  v12 = self->_categoriesFolder;

  return v12;
}

- (SBHIconModel)iconModel
{
  return self->_iconModel;
}

- (SBHLibraryCategoriesFolderDataSource)initWithCategoriesFolder:(id)a3
{
  id v5 = a3;
  id v6 = [v5 model];
  v13.receiver = self;
  v13.super_class = (Class)SBHLibraryCategoriesFolderDataSource;
  id v7 = [(SBHLibraryCategoriesFolderDataSource *)&v13 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_iconModel, v6);
    objc_storeStrong((id *)&v8->_categoriesFolder, a3);
    v8->_maximumNumberOfDisplayedCategories = -1;
    uint64_t v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v9;

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v8 selector:sel__noteDidAddIcon_ name:@"SBIconModelDidAddIconNotification" object:v8->_iconModel];
    [v11 addObserver:v8 selector:sel__noteDidReplaceIcon_ name:@"SBIconModelDidReplaceIconNotification" object:v8->_iconModel];
    [v11 addObserver:v8 selector:sel__noteWillRemoveIcon_ name:@"SBIconModelWillRemoveIconNotification" object:v8->_iconModel];
    [v11 addObserver:v8 selector:sel__noteDidReloadIcons_ name:@"SBIconModelDidReloadIconsNotification" object:v8->_iconModel];
    [v11 addObserver:v8 selector:sel__noteIconVisibilityDidChange_ name:@"SBIconModelVisibilityDidChangeNotification" object:v8->_iconModel];
    [v11 addObserver:v8 selector:sel__noteWillLayoutIconState_ name:@"SBIconModelWillLayoutIconStateNotification" object:v8->_iconModel];
  }
  return v8;
}

- (SBHLibraryCategoriesFolderDataSource)init
{
  return 0;
}

- (BOOL)isEqualToDataSource:(id)a3
{
  id v4 = (SBHLibraryCategoriesFolderDataSource *)a3;
  id v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      char v15 = 1;
    }
    else
    {
      id v6 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
      mappedIcons = self->_mappedIcons;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __60__SBHLibraryCategoriesFolderDataSource_isEqualToDataSource___block_invoke;
      v21[3] = &unk_1E6AB0A48;
      v8 = v5;
      v22 = v8;
      id v9 = (id)[v6 appendObject:mappedIcons counterpart:v21];
      iconModel = self->_iconModel;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __60__SBHLibraryCategoriesFolderDataSource_isEqualToDataSource___block_invoke_2;
      v19[3] = &unk_1E6AB0A48;
      v11 = v8;
      v20 = v11;
      id v12 = (id)[v6 appendObject:iconModel counterpart:v19];
      categoriesFolder = self->_categoriesFolder;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __60__SBHLibraryCategoriesFolderDataSource_isEqualToDataSource___block_invoke_3;
      v17[3] = &unk_1E6AB0A48;
      v18 = v11;
      id v14 = (id)[v6 appendObject:categoriesFolder counterpart:v17];
      char v15 = [v6 isEqual];
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

id __60__SBHLibraryCategoriesFolderDataSource_isEqualToDataSource___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

id __60__SBHLibraryCategoriesFolderDataSource_isEqualToDataSource___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 48);
}

id __60__SBHLibraryCategoriesFolderDataSource_isEqualToDataSource___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 40);
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (id)reloadDataWithCategoryMap:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHLibraryCategoriesFolderDataSource *)self iconModel];
  id v6 = [v5 leafIcons];

  id v7 = [(SBHLibraryCategoriesFolderDataSource *)self reloadDataSourceUsingIcons:v6 categoryMap:v4];

  return v7;
}

uint64_t __79__SBHLibraryCategoriesFolderDataSource_reloadDataSourceUsingIcons_categoryMap___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObserver:*(void *)(a1 + 32)];
}

uint64_t __79__SBHLibraryCategoriesFolderDataSource_reloadDataSourceUsingIcons_categoryMap___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 addObserver:*(void *)(a1 + 32)];
}

- (int64_t)maximumNumberOfDisplayedCategories
{
  return self->_maximumNumberOfDisplayedCategories;
}

- (void)setMaximumNumberOfDisplayedCategories:(int64_t)a3
{
  if (self->_maximumNumberOfDisplayedCategories != a3)
  {
    self->_maximumNumberOfDisplayedCategories = a3;
    [(SBHLibraryCategoriesFolderDataSource *)self _regenerateCategoriesFolder];
  }
}

- (BOOL)containsIcon:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(SBHLibraryCategoriesFolderDataSource *)self categoriesFolder];
  id v6 = [v5 allIcons];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) category];
        v11 = [v10 icons];
        char v12 = [v11 containsObject:v4];

        if (v12)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)categoryForIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(SBHLibraryCategoriesFolderDataSource *)self categoriesFolder];
  id v6 = [v5 allIcons];

  uint64_t v7 = (void *)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = [v10 category];
        char v12 = [v11 categoryIdentifier];
        char v13 = [v12 isEqual:v4];

        if (v13)
        {
          uint64_t v7 = [v10 category];
          goto LABEL_11;
        }
      }
      uint64_t v7 = (void *)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (NSArray)categoryIdentifiers
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(SBHLibraryCategoriesFolderDataSource *)self categoriesFolder];
  id v5 = [v4 icons];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) category];
        v11 = [v10 categoryIdentifier];
        [v3 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (unint64_t)categoryIdentifiersCount
{
  v2 = [(SBHLibraryCategoriesFolderDataSource *)self categoriesFolder];
  v3 = [v2 icons];
  unint64_t v4 = [v3 count];

  return v4;
}

- (void)_regenerateCategoriesFolder
{
  uint64_t v183 = *MEMORY[0x1E4F143B8];
  v3 = [(SBHLibraryCategoriesFolderDataSource *)self iconModel];
  unint64_t v4 = objc_opt_new();
  mappedIcons = self->_mappedIcons;
  v169[0] = MEMORY[0x1E4F143A8];
  v169[1] = 3221225472;
  v169[2] = __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke;
  v169[3] = &unk_1E6AB0A98;
  id v103 = v3;
  id v170 = v103;
  id v6 = v4;
  id v171 = v6;
  [(NSSet *)mappedIcons enumerateObjectsUsingBlock:v169];
  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  v117 = v6;
  uint64_t v8 = [v6 allKeys];
  id v113 = [v7 setWithArray:v8];

  v109 = objc_opt_new();
  id v9 = objc_opt_new();
  long long v165 = 0u;
  long long v166 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  v119 = self;
  v10 = [(SBRootFolder *)self->_categoriesFolder icons];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v165 objects:v182 count:16];
  v120 = v9;
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v166;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v166 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v165 + 1) + 8 * i);
        long long v16 = [v15 category];
        long long v17 = [v15 category];
        uint64_t v18 = [v17 categoryIdentifier];

        uint64_t v19 = [v9 objectForKey:v18];

        if (v19)
        {
          uint64_t v20 = SBLogProactiveAppLibrary();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v21 = [v9 objectForKey:v18];
            *(_DWORD *)buf = 138412546;
            v179 = v16;
            __int16 v180 = 2112;
            v181 = v21;
            _os_log_error_impl(&dword_1D7F0A000, v20, OS_LOG_TYPE_ERROR, "Error; duplicate category: %@ / %@",
              buf,
              0x16u);

            id v9 = v120;
          }
        }
        else
        {
          objc_msgSend(v9, "bs_setSafeObject:forKey:", v16, v18);
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v165 objects:v182 count:16];
    }
    while (v12);
  }

  v22 = [(SBFolder *)self->_categoriesFolder firstList];
  v23 = [(SBHLibraryCategoryMap *)self->_categoryMap categoryIdentifiers];
  unint64_t v24 = [v23 count];
  int64_t maximumNumberOfDisplayedCategories = self->_maximumNumberOfDisplayedCategories;
  if (v24 >= maximumNumberOfDisplayedCategories) {
    int64_t v26 = self->_maximumNumberOfDisplayedCategories;
  }
  else {
    int64_t v26 = v24;
  }
  if (maximumNumberOfDisplayedCategories >= 0) {
    unint64_t v27 = v26;
  }
  else {
    unint64_t v27 = v24;
  }
  v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAA0]), "initWithArray:range:copyItems:", v23, 0, v27, 0);

  v29 = objc_opt_new();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_2;
  aBlock[3] = &unk_1E6AB0B08;
  id v106 = v29;
  id v161 = v106;
  v162 = self;
  id v102 = v113;
  id v163 = v102;
  id v164 = &__block_literal_global_43;
  v30 = _Block_copy(aBlock);
  long long v156 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  id v107 = v22;
  obuint64_t j = [v22 icons];
  uint64_t v31 = [obj countByEnumeratingWithState:&v156 objects:v177 count:16];
  v118 = (void (**)(void, void))v30;
  if (v31)
  {
    uint64_t v32 = v31;
    char v110 = 0;
    id v114 = *(id *)v157;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(id *)v157 != v114) {
          objc_enumerationMutation(obj);
        }
        v34 = *(void **)(*((void *)&v156 + 1) + 8 * j);
        v35 = [v34 category];
        v36 = [v35 categoryIdentifier];
        v154[0] = MEMORY[0x1E4F143A8];
        v154[1] = 3221225472;
        v154[2] = __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_4;
        v154[3] = &unk_1E6AB0B30;
        id v37 = v36;
        id v155 = v37;
        v38 = objc_msgSend(v28, "bs_firstObjectPassingTest:", v154);
        v39 = v38;
        if (v38
          && v37
          && ([v38 isEqualToCategoryIdentifier:v37] & 1) == 0
          && [v35 updateCategoryIdentifier:v39])
        {
          id v40 = v39;

          char v110 = 1;
          id v37 = v40;
        }
        uint64_t v41 = [v37 predictionCategoryID];
        v42 = (*((void (**)(void *, id))v30 + 2))(v30, v37);
        if (v41 != 7)
        {
          if (![v28 containsObject:v37]
            || ![v42 count]
            || ([v35 icons],
                v43 = objc_claimAutoreleasedReturnValue(),
                uint64_t v44 = [v43 count],
                v43,
                !v44))
          {
            v45 = [v34 category];
            [v45 updateCategoryWithIcons:MEMORY[0x1E4F1CBF0]];

            [v107 removeIcon:v34];
            [v120 removeObjectForKey:v37];
            v46 = (void *)[v28 mutableCopy];
            [v46 removeObject:v37];
            uint64_t v47 = [v46 copy];

            char v110 = 1;
            v28 = (void *)v47;
          }
          v30 = v118;
        }
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v156 objects:v177 count:16];
    }
    while (v32);
  }
  else
  {
    char v110 = 0;
  }

  v48 = objc_opt_new();
  v49 = objc_opt_new();
  v151[0] = MEMORY[0x1E4F143A8];
  v151[1] = 3221225472;
  v151[2] = __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_5;
  v151[3] = &unk_1E6AB0B58;
  id v105 = v49;
  id v152 = v105;
  id v50 = v48;
  id v153 = v50;
  [v107 enumerateIconsUsingBlock:v151];
  v149[0] = MEMORY[0x1E4F143A8];
  v149[1] = 3221225472;
  v149[2] = __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_35;
  v149[3] = &unk_1E6AB0A70;
  id obja = v107;
  id v150 = obja;
  v101 = v50;
  [v50 enumerateObjectsUsingBlock:v149];
  long long v147 = 0u;
  long long v148 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  id v115 = (id)[v28 copy];
  uint64_t v51 = [v115 countByEnumeratingWithState:&v145 objects:v176 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v146;
    v54 = v120;
    do
    {
      for (uint64_t k = 0; k != v52; ++k)
      {
        if (*(void *)v146 != v53) {
          objc_enumerationMutation(v115);
        }
        v56 = *(void **)(*((void *)&v145 + 1) + 8 * k);
        if ([v56 predictionCategoryID] != 7)
        {
          v57 = [v54 objectForKey:v56];
          v58 = [v57 leafIdentifier];
          v59 = [v105 objectForKey:v58];

          v60 = ((void (**)(void, void *))v118)[2](v118, v56);
          v142[0] = MEMORY[0x1E4F143A8];
          v142[1] = 3221225472;
          v142[2] = __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_2_36;
          v142[3] = &unk_1E6AB0B80;
          id v143 = v117;
          id v144 = &__block_literal_global_43;
          v61 = objc_msgSend(v60, "bs_mapNoNulls:", v142);
          if (![v61 count])
          {
            if (v59) {
              [obja removeIcon:v59];
            }
            if (v57)
            {
              [v57 updateCategoryWithIcons:v61];
              [v120 removeObjectForKey:v56];
              v62 = (void *)[v28 mutableCopy];
              [v62 removeObject:v56];
              uint64_t v63 = [v62 copy];

              v28 = (void *)v63;
            }
          }

          v54 = v120;
        }
      }
      uint64_t v52 = [v115 countByEnumeratingWithState:&v145 objects:v176 count:16];
    }
    while (v52);
  }

  id v64 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  v65 = [obja icons];
  uint64_t v66 = [v65 countByEnumeratingWithState:&v138 objects:v175 count:16];
  if (v66)
  {
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v139;
    do
    {
      for (uint64_t m = 0; m != v67; ++m)
      {
        if (*(void *)v139 != v68) {
          objc_enumerationMutation(v65);
        }
        v70 = *(void **)(*((void *)&v138 + 1) + 8 * m);
        v71 = [v70 leafIdentifier];
        [v64 setObject:v70 forKey:v71];
      }
      uint64_t v67 = [v65 countByEnumeratingWithState:&v138 objects:v175 count:16];
    }
    while (v67);
  }
  v104 = v64;

  [obja removeAllIcons];
  long long v136 = 0u;
  long long v137 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  id v108 = v28;
  uint64_t v72 = [v108 countByEnumeratingWithState:&v134 objects:v174 count:16];
  if (v72)
  {
    uint64_t v73 = v72;
    v74 = v118;
    id v116 = *(id *)v135;
    do
    {
      uint64_t v75 = 0;
      do
      {
        if (*(id *)v135 != v116) {
          objc_enumerationMutation(v108);
        }
        v76 = *(void **)(*((void *)&v134 + 1) + 8 * v75);
        v77 = (void *)MEMORY[0x1D9484600]();
        v78 = [v120 objectForKey:v76];
        v79 = [(SBHLibraryCategory *)v78 leafIdentifier];
        if (v79)
        {
          v80 = [(SBFolder *)v119->_categoriesFolder iconWithIdentifier:v79];
          if (!v80)
          {
            v80 = [v104 objectForKey:v79];
            [v104 removeObjectForKey:v79];
          }
        }
        else
        {
          v80 = 0;
        }
        v81 = ((void (**)(void, void *))v74)[2](v74, v76);
        v131[0] = MEMORY[0x1E4F143A8];
        v131[1] = 3221225472;
        v131[2] = __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_3_38;
        v131[3] = &unk_1E6AB0B80;
        id v132 = v117;
        id v133 = &__block_literal_global_43;
        v82 = objc_msgSend(v81, "bs_mapNoNulls:", v131);
        uint64_t v83 = [v76 predictionCategoryID];
        if ([v82 count]) {
          BOOL v84 = 1;
        }
        else {
          BOOL v84 = v83 == 7;
        }
        if (!v84)
        {
          if (v80) {
            [obja removeIcon:v80];
          }
          v74 = v118;
          if (v78)
          {
            [(SBHLibraryCategory *)v78 updateCategoryWithIcons:v82];
            [v120 removeObjectForKey:v76];
          }
          [v106 removeObjectForKey:v76];
          goto LABEL_84;
        }
        if (v78)
        {
          if (!v80) {
            goto LABEL_87;
          }
        }
        else
        {
          v78 = objc_alloc_init(SBHLibraryCategory);
          [(SBHLibraryCategory *)v78 setCategoryIdentifier:v76];
          v88 = [(SBHLibraryCategoriesFolderDataSource *)v119 iconModel];
          [(SBHLibraryCategory *)v78 setIconDelegate:v88];

          [v120 setObject:v78 forKey:v76];
          char v110 = 1;
          if (!v80)
          {
LABEL_87:
            v80 = [[SBHLibraryPodCategoryIcon alloc] initWithCategory:v78];
            char v110 = 1;
          }
        }
        [obja addIcon:v80];
        if ([(SBHLibraryCategory *)v78 updateCategoryWithIcons:v82]) {
          [v109 addObject:v76];
        }
        v85 = [(SBHLibraryCategory *)v78 compactPodAdditionalItemsFolder];
        SBTreeNodeSetParent(v85, (uint64_t)v119->_categoriesFolder);

        v86 = [(SBHLibraryCategory *)v78 compactPodFolder];
        SBTreeNodeSetParent(v86, (uint64_t)v119->_categoriesFolder);

        v87 = [(SBHLibraryCategory *)v78 expandedPodFolder];
        SBTreeNodeSetParent(v87, (uint64_t)v119->_categoriesFolder);

        v74 = v118;
LABEL_84:

        ++v75;
      }
      while (v73 != v75);
      uint64_t v89 = [v108 countByEnumeratingWithState:&v134 objects:v174 count:16];
      uint64_t v73 = v89;
    }
    while (v89);
  }

  v129[0] = MEMORY[0x1E4F143A8];
  v129[1] = 3221225472;
  v129[2] = __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_4_41;
  v129[3] = &unk_1E6AB0BA8;
  id v90 = v108;
  id v130 = v90;
  [obja sortUsingComparator:v129];
  [MEMORY[0x1E4F39CF8] begin];
  if (v110)
  {
    long long v127 = 0u;
    long long v128 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    v91 = (void *)[(NSHashTable *)v119->_observers copy];
    uint64_t v92 = [v91 countByEnumeratingWithState:&v125 objects:v173 count:16];
    if (v92)
    {
      uint64_t v93 = v92;
      uint64_t v94 = *(void *)v126;
      do
      {
        for (uint64_t n = 0; n != v93; ++n)
        {
          if (*(void *)v126 != v94) {
            objc_enumerationMutation(v91);
          }
          [*(id *)(*((void *)&v125 + 1) + 8 * n) categoriesDataSourceNeedsAnimatedReload:v119];
        }
        uint64_t v93 = [v91 countByEnumeratingWithState:&v125 objects:v173 count:16];
      }
      while (v93);
    }
  }
  if ([v109 count])
  {
    long long v123 = 0u;
    long long v124 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    v96 = (void *)[(NSHashTable *)v119->_observers copy];
    uint64_t v97 = [v96 countByEnumeratingWithState:&v121 objects:v172 count:16];
    if (v97)
    {
      uint64_t v98 = v97;
      uint64_t v99 = *(void *)v122;
      do
      {
        for (iuint64_t i = 0; ii != v98; ++ii)
        {
          if (*(void *)v122 != v99) {
            objc_enumerationMutation(v96);
          }
          [*(id *)(*((void *)&v121 + 1) + 8 * ii) categoriesDataSource:v119 shouldAnimateLayoutForCategories:v109];
        }
        uint64_t v98 = [v96 countByEnumeratingWithState:&v121 objects:v172 count:16];
      }
      while (v98);
    }
  }
  [MEMORY[0x1E4F39CF8] commit];
}

void __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isIconVisible:"))
  {
    v3 = [v4 leafIdentifier];
    objc_msgSend(*(id *)(a1 + 40), "bs_setSafeObject:forKey:", v4, v3);
  }
}

id __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_29(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = [v2 length];
  id v4 = (void *)*MEMORY[0x1E4FB30E0];
  if (v3 > [(id)*MEMORY[0x1E4FB30E0] length] && objc_msgSend(v2, "hasPrefix:", v4))
  {
    uint64_t v5 = objc_msgSend(v2, "substringFromIndex:", objc_msgSend(v4, "length"));

    id v2 = (id)v5;
  }
  return v2;
}

id __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  if (!v4)
  {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 16) sortedApplicationIdentifiersForCategoryIdentifier:v3];
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    id v9 = __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_3;
    v10 = &unk_1E6AB0AE0;
    id v11 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    id v4 = objc_msgSend(v5, "bs_filter:", &v7);
    objc_msgSend(*(id *)(a1 + 32), "bs_setSafeObject:forKey:", v4, v3, v7, v8, v9, v10);
  }
  return v4;
}

uint64_t __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = [v1 containsObject:v2];

  return v3;
}

BOOL __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 predictionCategoryID];
  if (v4 == [*(id *)(a1 + 32) predictionCategoryID])
  {
    uint64_t v5 = [v3 predictionCategoryIndex];
    BOOL v6 = v5 == [*(id *)(a1 + 32) predictionCategoryIndex];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

void __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 leafIdentifier];
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) objectForKey:v4];

    if (v5)
    {
      [*(id *)(a1 + 40) addObject:v3];
      BOOL v6 = SBLogProactiveAppLibrary();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_5_cold_1((uint64_t)v3, v6);
      }
    }
    else
    {
      [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v4];
    }
  }
}

uint64_t __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_35(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeIcon:a2];
}

id __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_2_36(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v3 = [v1 objectForKeyedSubscript:v2];

  return v3;
}

id __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_3_38(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v3 = [v1 objectForKeyedSubscript:v2];

  return v3;
}

uint64_t __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_4_41(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [a2 category];
  uint64_t v8 = [v7 categoryIdentifier];
  unint64_t v9 = [v5 indexOfObject:v8];

  v10 = *(void **)(a1 + 32);
  id v11 = [v6 category];

  id v12 = [v11 categoryIdentifier];
  unint64_t v13 = [v10 indexOfObject:v12];

  uint64_t v14 = 1;
  if (v9 <= v13) {
    uint64_t v14 = -1;
  }
  if (v9 == v13) {
    return 0;
  }
  else {
    return v14;
  }
}

- (void)_noteDidAddIcon:(id)a3
{
  if (self->_categoryMap)
  {
    uint64_t v4 = [a3 userInfo];
    v10 = [v4 objectForKey:@"icon"];

    uint64_t v5 = v10;
    if (v10)
    {
      char v6 = [v10 isWidgetIcon];
      uint64_t v5 = v10;
      if ((v6 & 1) == 0)
      {
        if (![v10 isApplicationIcon]
          || (v7 = [v10 leafIdentifierAndApplicationBundleIDMatches], uint64_t v5 = v10, v7))
        {
          uint64_t v8 = (void *)[(NSSet *)self->_mappedIcons mutableCopy];
          objc_msgSend(v8, "bs_safeAddObject:", v10);
          if (([v8 isEqualToSet:self->_mappedIcons] & 1) == 0) {
            id v9 = [(SBHLibraryCategoriesFolderDataSource *)self reloadDataSourceUsingIcons:v8 categoryMap:self->_categoryMap];
          }

          uint64_t v5 = v10;
        }
      }
    }
  }
}

- (void)_noteDidReplaceIcon:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_categoryMap)
  {
    uint64_t v4 = [a3 userInfo];
    uint64_t v5 = [v4 objectForKey:@"icon"];

    if (v5)
    {
      char v6 = (void *)[(NSSet *)self->_mappedIcons mutableCopy];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v17 = self;
      int v7 = self->_mappedIcons;
      uint64_t v8 = [(NSSet *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            unint64_t v13 = [v5 leafIdentifier];
            uint64_t v14 = [v12 leafIdentifier];
            int v15 = [v13 isEqualToString:v14];

            if (v15) {
              [v6 removeObject:v12];
            }
          }
          uint64_t v9 = [(NSSet *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v9);
      }

      if (([v6 isEqualToSet:v17->_mappedIcons] & 1) == 0) {
        id v16 = [(SBHLibraryCategoriesFolderDataSource *)v17 reloadDataSourceUsingIcons:v6 categoryMap:v17->_categoryMap];
      }
    }
  }
}

- (void)_noteWillRemoveIcon:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_categoryMap)
  {
    uint64_t v4 = [a3 userInfo];
    uint64_t v5 = [v4 objectForKey:@"icon"];

    if (v5)
    {
      char v6 = (void *)[(NSSet *)self->_mappedIcons mutableCopy];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v17 = self;
      int v7 = self->_mappedIcons;
      uint64_t v8 = [(NSSet *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            unint64_t v13 = [v5 leafIdentifier];
            uint64_t v14 = [v12 leafIdentifier];
            int v15 = [v13 isEqualToString:v14];

            if (v15) {
              [v6 removeObject:v12];
            }
          }
          uint64_t v9 = [(NSSet *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v9);
      }

      if (([v6 isEqualToSet:v17->_mappedIcons] & 1) == 0) {
        id v16 = [(SBHLibraryCategoriesFolderDataSource *)v17 reloadDataSourceUsingIcons:v6 categoryMap:v17->_categoryMap];
      }
    }
  }
}

- (void)_noteDidReloadIcons:(id)a3
{
  if (self->_categoryMap) {
    id v3 = -[SBHLibraryCategoriesFolderDataSource reloadDataWithCategoryMap:](self, "reloadDataWithCategoryMap:");
  }
}

- (void)_noteIconVisibilityDidChange:(id)a3
{
  if (self->_categoryMap) {
    id v3 = -[SBHLibraryCategoriesFolderDataSource reloadDataWithCategoryMap:](self, "reloadDataWithCategoryMap:");
  }
}

- (void)_noteWillLayoutIconState:(id)a3
{
  if (self->_categoryMap) {
    id v3 = -[SBHLibraryCategoriesFolderDataSource reloadDataWithCategoryMap:](self, "reloadDataWithCategoryMap:");
  }
}

- (SBHLibraryCategoriesRootFolder)categoriesFolder
{
  return self->_categoriesFolder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_storeStrong((id *)&self->_categoriesFolder, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_categoryMap, 0);
  objc_storeStrong((id *)&self->_mappedIcons, 0);
}

void __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_5_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_ERROR, "Found duplicate icon: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end