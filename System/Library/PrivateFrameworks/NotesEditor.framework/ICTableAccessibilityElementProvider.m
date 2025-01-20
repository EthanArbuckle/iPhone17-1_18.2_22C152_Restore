@interface ICTableAccessibilityElementProvider
- (ICTable)tableModel;
- (ICTableAccessibilityController)tableAXController;
- (ICTableAccessibilityElementProvider)initWithTableAccessibilityController:(id)a3;
- (NSMutableDictionary)cellCache;
- (id)cellElementForColumnID:(id)a3 rowID:(id)a4;
- (id)cellElementsForColumnID:(id)a3;
- (id)cellElementsForRowID:(id)a3;
- (void)removeElementsForColumnID:(id)a3;
- (void)removeElementsForRowID:(id)a3;
- (void)setCellCache:(id)a3;
- (void)setTableAXController:(id)a3;
@end

@implementation ICTableAccessibilityElementProvider

- (ICTableAccessibilityElementProvider)initWithTableAccessibilityController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICTableAccessibilityElementProvider;
  v5 = [(ICTableAccessibilityElementProvider *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_tableAXController, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    cellCache = v6->_cellCache;
    v6->_cellCache = v7;
  }
  return v6;
}

- (id)cellElementForColumnID:(id)a3 rowID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ICTableAccessibilityElementProvider *)self cellCache];
  v9 = [v8 objectForKeyedSubscript:v6];
  objc_super v10 = [v9 objectForKeyedSubscript:v7];

  if (!v10)
  {
    v11 = [ICTableCellAccessibilityElement alloc];
    v12 = [(ICTableAccessibilityElementProvider *)self tableAXController];
    objc_super v10 = [(ICTableCellAccessibilityElement *)v11 initWithTableAccessibilityController:v12 columnID:v6 rowID:v7];

    v13 = [(ICTableAccessibilityElementProvider *)self cellCache];
    v14 = [v13 objectForKeyedSubscript:v6];

    if (!v14)
    {
      v15 = [MEMORY[0x263EFF9A0] dictionary];
      v16 = [(ICTableAccessibilityElementProvider *)self cellCache];
      [v16 setObject:v15 forKeyedSubscript:v6];
    }
    v17 = [(ICTableAccessibilityElementProvider *)self cellCache];
    v18 = [v17 objectForKeyedSubscript:v6];
    [v18 setObject:v10 forKeyedSubscript:v7];
  }

  return v10;
}

- (id)cellElementsForColumnID:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  id v6 = [(ICTableAccessibilityElementProvider *)self tableAXController];
  uint64_t v7 = [v6 rowCount];

  if (v7)
  {
    unint64_t v8 = 0;
    do
    {
      v9 = [(ICTableAccessibilityElementProvider *)self tableAXController];
      objc_super v10 = [v9 rowIDForRowIndex:v8];

      v11 = [(ICTableAccessibilityElementProvider *)self cellElementForColumnID:v4 rowID:v10];
      [v5 addObject:v11];

      ++v8;
      v12 = [(ICTableAccessibilityElementProvider *)self tableAXController];
      unint64_t v13 = [v12 rowCount];
    }
    while (v8 < v13);
  }
  v14 = (void *)[v5 copy];

  return v14;
}

- (id)cellElementsForRowID:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  id v6 = [(ICTableAccessibilityElementProvider *)self tableAXController];
  uint64_t v7 = [v6 columnCount];

  if (v7)
  {
    unint64_t v8 = 0;
    do
    {
      v9 = [(ICTableAccessibilityElementProvider *)self tableAXController];
      objc_super v10 = [v9 columnIDForColumnIndex:v8];

      v11 = [(ICTableAccessibilityElementProvider *)self cellElementForColumnID:v10 rowID:v4];
      [v5 addObject:v11];

      ++v8;
      v12 = [(ICTableAccessibilityElementProvider *)self tableAXController];
      unint64_t v13 = [v12 columnCount];
    }
    while (v8 < v13);
  }
  v14 = (void *)[v5 copy];

  return v14;
}

- (void)removeElementsForColumnID:(id)a3
{
  id v4 = a3;
  id v5 = [(ICTableAccessibilityElementProvider *)self cellCache];
  [v5 removeObjectForKey:v4];
}

- (void)removeElementsForRowID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(ICTableAccessibilityElementProvider *)self cellCache];
  id v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        v12 = [(ICTableAccessibilityElementProvider *)self cellCache];
        unint64_t v13 = [v12 objectForKeyedSubscript:v11];

        [v13 removeObjectForKey:v4];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (ICTableAccessibilityController)tableAXController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableAXController);

  return (ICTableAccessibilityController *)WeakRetained;
}

- (void)setTableAXController:(id)a3
{
}

- (ICTable)tableModel
{
  return self->_tableModel;
}

- (NSMutableDictionary)cellCache
{
  return self->_cellCache;
}

- (void)setCellCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellCache, 0);
  objc_storeStrong((id *)&self->_tableModel, 0);

  objc_destroyWeak((id *)&self->_tableAXController);
}

@end