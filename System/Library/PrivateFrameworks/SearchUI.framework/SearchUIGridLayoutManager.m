@interface SearchUIGridLayoutManager
+ (BOOL)shouldHideViewForRichData:(id)a3;
+ (id)alignmentsForSFHeaderRow:(id)a3;
+ (id)richTextForDataItems:(id)a3;
+ (id)richTextForRichDataItems:(id)a3;
- (BOOL)computeCompactTableForSections:(id)a3;
- (BOOL)isCompactTable;
- (NSMapTable)tableMapping;
- (SearchUIGridLayoutManager)initWithHeaderSection:(id)a3 dataSections:(id)a4;
- (TLKGridLayoutManager)gridManager;
- (id)tableRowForTableRowCardSection:(id)a3;
- (void)setGridManager:(id)a3;
- (void)setIsCompactTable:(BOOL)a3;
- (void)setTableMapping:(id)a3;
@end

@implementation SearchUIGridLayoutManager

- (SearchUIGridLayoutManager)initWithHeaderSection:(id)a3 dataSections:(id)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)SearchUIGridLayoutManager;
  v8 = [(SearchUIGridLayoutManager *)&v38 init];
  if (v8)
  {
    v9 = +[SearchUIUtilities pointerKeyMapTable];
    [(SearchUIGridLayoutManager *)v8 setTableMapping:v9];

    v30 = [(id)objc_opt_class() alignmentsForSFHeaderRow:v6];
    v10 = objc_opt_new();
    id v32 = v6;
    v40[0] = v6;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
    id v31 = v7;
    v12 = [v11 arrayByAddingObjectsFromArray:v7];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = v12;
    uint64_t v13 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v35 != v15) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          objc_opt_class();
          objc_opt_isKindOfClass();
          v18 = objc_opt_new();
          objc_msgSend(v18, "setIsSubHeader:", objc_msgSend(v17, "isSubHeader"));
          v19 = [v17 richData];
          uint64_t v20 = [v19 count];
          v21 = objc_opt_class();
          if (v20)
          {
            v22 = [v17 richData];
            [v21 richTextForRichDataItems:v22];
          }
          else
          {
            v22 = [v17 data];
            [v21 richTextForDataItems:v22];
          v23 = };
          objc_msgSend(v18, "setData:", v23, v30);

          v24 = [(SearchUIGridLayoutManager *)v8 tableMapping];
          [v24 setObject:v18 forKey:v17];

          [v10 addObject:v18];
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v14);
    }

    v25 = objc_opt_class();
    v26 = [v10 firstObject];
    v27 = [v26 data];
    LODWORD(v25) = [v25 shouldHideViewForRichData:v27];

    id v7 = v31;
    [(SearchUIGridLayoutManager *)v8 setIsCompactTable:[(SearchUIGridLayoutManager *)v8 computeCompactTableForSections:v31] & (v25 ^ 1)];
    v28 = [MEMORY[0x1E4FAE0A0] gridManagerWithAlignments:v30 rows:v10];
    [(SearchUIGridLayoutManager *)v8 setGridManager:v28];

    id v6 = v32;
  }

  return v8;
}

+ (BOOL)shouldHideViewForRichData:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "hasContent", (void)v10))
        {
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (BOOL)computeCompactTableForSections:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    uint64_t v20 = self;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v10 = [[SearchUIRowModel alloc] initWithCardSection:v9 queryId:0 itemIdentifier:0];
        if ([v9 separatorStyle] == 1
          || ![v9 separatorStyle]
          && +[SearchUICardSectionView defaultSeparatorStyleForRowModel:v10] == 1)
        {
          BOOL v18 = 1;
LABEL_21:

          goto LABEL_23;
        }
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v11 = [(SearchUIGridLayoutManager *)self tableMapping];
        long long v12 = [v11 objectForKey:v9];
        long long v13 = [v12 data];

        uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v22;
          while (2)
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v22 != v16) {
                objc_enumerationMutation(v13);
              }
              if ([*(id *)(*((void *)&v21 + 1) + 8 * j) hasOnlyImage])
              {

                BOOL v18 = 0;
                goto LABEL_21;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

        self = v20;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
      BOOL v18 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_23:

  return v18;
}

+ (id)alignmentsForSFHeaderRow:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v17 = v3;
  uint64_t v5 = [v3 alignmentSchema];
  uint64_t v6 = [v5 tableColumnAlignment];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v12 = objc_opt_new();
        unsigned int v13 = [v11 columnAlignment];
        if (v13 <= 2) {
          [v12 setColumnAlignment:v13];
        }
        int v14 = [v11 dataAlignment];
        if (v14)
        {
          if (v14 == 2)
          {
            if ([MEMORY[0x1E4FAE100] isLTR]) {
              uint64_t v15 = 2;
            }
            else {
              uint64_t v15 = 0;
            }
          }
          else
          {
            if (v14 != 1) {
              goto LABEL_17;
            }
            uint64_t v15 = 1;
          }
        }
        else
        {
          uint64_t v15 = 4;
        }
        [v12 setDataAlignment:v15];
LABEL_17:
        objc_msgSend(v12, "setIsEqualWidth:", objc_msgSend(v11, "isEqualWidth"));
        [v4 addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  return v4;
}

+ (id)richTextForDataItems:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v10 = objc_opt_new();
        long long v11 = [v9 glyph];

        if (v11)
        {
          long long v12 = objc_opt_new();
          unsigned int v13 = [v9 glyph];
          int v14 = +[SearchUITLKImageConverter imageForSFImage:v13];
          [v12 setTlkImage:v14];

          long long v24 = v12;
          uint64_t v15 = &v24;
        }
        else
        {
          long long v12 = +[SearchUITLKMultilineTextConverter formattedTextForSearchUIText:v9];
          uint64_t v23 = v12;
          uint64_t v15 = &v23;
        }
        uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
        [v10 setFormattedTextItems:v16];

        objc_msgSend(v10, "setMaxLines:", objc_msgSend(v9, "maxLines"));
        [v4 addObject:v10];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (id)richTextForRichDataItems:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = +[SearchUITLKMultilineTextConverter richTextForSearchUIText:](SearchUITLKMultilineTextConverter, "richTextForSearchUIText:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)tableRowForTableRowCardSection:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUIGridLayoutManager *)self tableMapping];
  uint64_t v6 = [v5 objectForKey:v4];

  return v6;
}

- (TLKGridLayoutManager)gridManager
{
  return self->_gridManager;
}

- (void)setGridManager:(id)a3
{
}

- (BOOL)isCompactTable
{
  return self->_isCompactTable;
}

- (void)setIsCompactTable:(BOOL)a3
{
  self->_isCompactTable = a3;
}

- (NSMapTable)tableMapping
{
  return self->_tableMapping;
}

- (void)setTableMapping:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableMapping, 0);
  objc_storeStrong((id *)&self->_gridManager, 0);
}

@end