@interface PXOutlineDataSectionManager
- (BOOL)shouldInvalidateDataSectionForChildDataSectionManager:(id)a3 changeDescriptor:(unint64_t)a4;
- (PXOutlineDataSectionManagerDelegate)delegate;
- (id)_changeDetailsForNewDataSection:(id)a3;
- (id)changeDetailsForChangedChildDataSectionManager:(id)a3 childChangeDetails:(id)a4;
- (id)changeDetailsForChildDataSectionManagersChangeDetails:(id)a3;
- (id)childDataSectionManagerForOutlineObject:(id)a3;
- (id)createDataSection;
- (void)rearrangeSectionContent;
- (void)setDelegate:(id)a3;
@end

@implementation PXOutlineDataSectionManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSectionManagersByDataSectionObjects, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PXOutlineDataSectionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXOutlineDataSectionManagerDelegate *)WeakRetained;
}

- (id)changeDetailsForChangedChildDataSectionManager:(id)a3 childChangeDetails:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([a4 hasIncrementalChanges])
  {
    uint64_t v7 = [v6 outlineObject];
    v8 = (void *)v7;
    if (v7)
    {
      v12[0] = v7;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    }
    else
    {
      v9 = 0;
    }
    v10 = [(PXOutlineDataSectionManager *)self _changeDetailsForNewDataSection:v9];
  }
  else
  {
    v10 = [off_1E5DA5568 changeDetailsWithNoIncrementalChanges];
  }

  return v10;
}

- (id)changeDetailsForChildDataSectionManagersChangeDetails:(id)a3
{
  return [(PXOutlineDataSectionManager *)self _changeDetailsForNewDataSection:0];
}

- (BOOL)shouldInvalidateDataSectionForChildDataSectionManager:(id)a3 changeDescriptor:(unint64_t)a4
{
  char v4 = a4;
  id v5 = a3;
  id v6 = v5;
  if ((v4 & 6) != 0)
  {
    BOOL v7 = 1;
  }
  else if (v4)
  {
    v8 = [v5 previousDataSection];
    v9 = v8;
    if (v8) {
      int v10 = [v8 containsAnyObjects] ^ 1;
    }
    else {
      int v10 = 1;
    }
    BOOL v7 = v10 != [v6 isDataSectionEmpty];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)createDataSection
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  char v4 = objc_opt_new();
  id v5 = (NSDictionary *)objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = [(PXDataSectionManager *)self childDataSectionManagers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v12 = [v11 outlineObject];
        if (v12)
        {
          [v3 addObject:v12];
          if (([v11 allowsEmptyDataSection] & 1) != 0
            || ([v11 isDataSectionEmpty] & 1) == 0)
          {
            [(NSDictionary *)v5 setObject:v11 forKeyedSubscript:v12];
          }
          else
          {
            [v4 addObject:v12];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v8);
  }

  v13 = [(PXOutlineDataSectionManager *)self delegate];
  v14 = v13;
  if (v13)
  {
    v15 = [v13 outlineDataSectionManager:self arrangedSectionContent:v3];
    if (v15 != v3)
    {
      uint64_t v16 = [v3 count];
      if (v16 == [v15 count]
        && ([MEMORY[0x1E4F1CAD0] setWithArray:v3],
            v17 = objc_claimAutoreleasedReturnValue(),
            [MEMORY[0x1E4F1CAD0] setWithArray:v15],
            v18 = objc_claimAutoreleasedReturnValue(),
            int v19 = [v17 isEqualToSet:v18],
            v18,
            v17,
            v19))
      {
        [v3 setArray:v15];
      }
      else
      {
        v20 = PLUIGetLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v14;
          _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_ERROR, "%@ did not return a valid arranged section content (different count or content)", buf, 0xCu);
        }
      }
    }
  }
  [v3 removeObjectsInArray:v4];
  dataSectionManagersByDataSectionObjects = self->_dataSectionManagersByDataSectionObjects;
  self->_dataSectionManagersByDataSectionObjects = v5;
  v22 = v5;

  v23 = [PXArrayDataSection alloc];
  v24 = [(PXArrayDataSection *)v23 initWithOutlineObject:0 sectionContent:v3];

  return v24;
}

- (void)rearrangeSectionContent
{
  id v3 = [(PXOutlineDataSectionManager *)self _changeDetailsForNewDataSection:0];
  [(PXDataSectionManager *)self updateDataSectionWithChangeDetails:v3];
}

- (id)childDataSectionManagerForOutlineObject:(id)a3
{
  return [(NSDictionary *)self->_dataSectionManagersByDataSectionObjects objectForKeyedSubscript:a3];
}

- (id)_changeDetailsForNewDataSection:(id)a3
{
  id v4 = a3;
  id v5 = [(PXOutlineDataSectionManager *)self createDataSection];
  id v6 = [(PXDataSectionManager *)self dataSection];
  uint64_t v7 = [v6 sectionContent];
  uint64_t v8 = [v5 sectionContent];
  if (v4) {
    id v9 = v4;
  }
  else {
    id v9 = (id)MEMORY[0x1E4F1CBF0];
  }
  int v10 = [off_1E5DA5568 changeDetailsFromArray:v7 toArray:v8 changedObjects:v9];

  return v10;
}

@end