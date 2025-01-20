@interface SXDataTableComponentStyleFactory
- (SXDataRecordStore)recordStore;
- (SXDataTableComponentStyleFactory)initWithRecordStore:(id)a3 tableStyle:(id)a4 dataOrientation:(unint64_t)a5 rowStyleMerger:(id)a6 columnStyleMerger:(id)a7 cellStyleMerger:(id)a8;
- (SXDataTableSelectorValidator)selectorValidator;
- (SXDataTableStyle)tableStyle;
- (SXJSONObjectMerger)cellStyleMerger;
- (SXJSONObjectMerger)columnStyleMerger;
- (SXJSONObjectMerger)rowStyleMerger;
- (id)cellStyleForIndexPath:(id)a3;
- (id)cellStyleForIndexPath:(id)a3 usingBaseStyle:(id)a4;
- (id)columnStyleForColumnIndex:(unint64_t)a3;
- (id)columnStyleForColumnIndex:(unint64_t)a3 usingBaseStyle:(id)a4;
- (id)descriptorForIdentifier:(id)a3;
- (id)filterDuplicateSequentialStyles:(id)a3;
- (id)headerCellStyleForIndexPath:(id)a3;
- (id)headerColumnStyleForColumnIndex:(unint64_t)a3;
- (id)headerRowStyleForRowIndex:(unint64_t)a3;
- (id)rowStyleForRowIndex:(unint64_t)a3;
- (id)rowStyleForRowIndex:(unint64_t)a3 usingBaseStyle:(id)a4;
- (id)sortStylesMatchesBySelectorWeight:(id)a3;
- (id)styleByMergingStyleMatches:(id)a3 forBaseStyle:(id)a4 merger:(id)a5;
- (int64_t)compareSelector:(id)a3 withOtherSelector:(id)a4;
- (unint64_t)dataOrientation;
- (unint64_t)isEvenNumber:(int64_t)a3;
- (unint64_t)isOddNumber:(int64_t)a3;
@end

@implementation SXDataTableComponentStyleFactory

- (SXDataTableComponentStyleFactory)initWithRecordStore:(id)a3 tableStyle:(id)a4 dataOrientation:(unint64_t)a5 rowStyleMerger:(id)a6 columnStyleMerger:(id)a7 cellStyleMerger:(id)a8
{
  id v15 = a3;
  id v24 = a4;
  id v23 = a6;
  id v16 = a7;
  id v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)SXDataTableComponentStyleFactory;
  v18 = [(SXDataTableComponentStyleFactory *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_tableStyle, a4);
    objc_storeStrong((id *)&v19->_recordStore, a3);
    v19->_dataOrientation = a5;
    v20 = -[SXDataTableSelectorValidator initWithRecordStore:dataOrientation:]([SXDataTableSelectorValidator alloc], "initWithRecordStore:dataOrientation:", v15, a5, v23, v24);
    selectorValidator = v19->_selectorValidator;
    v19->_selectorValidator = v20;

    objc_storeStrong((id *)&v19->_rowStyleMerger, a6);
    objc_storeStrong((id *)&v19->_columnStyleMerger, a7);
    objc_storeStrong((id *)&v19->_cellStyleMerger, a8);
  }

  return v19;
}

- (id)headerRowStyleForRowIndex:(unint64_t)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  v5 = [(SXDataTableComponentStyleFactory *)self tableStyle];
  v6 = [v5 headerRows];

  v7 = [(SXDataTableComponentStyleFactory *)self rowStyleForRowIndex:a3];
  v8 = v7;
  if (v6)
  {
    v9 = [(SXDataTableComponentStyleFactory *)self rowStyleMerger];
    v14[0] = v8;
    v14[1] = v6;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
    id v11 = [v9 mergeObjects:v10];
  }
  else
  {
    id v11 = v7;
  }
  v12 = [(SXDataTableComponentStyleFactory *)self rowStyleForRowIndex:a3 usingBaseStyle:v11];

  return v12;
}

- (id)headerColumnStyleForColumnIndex:(unint64_t)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  v5 = [(SXDataTableComponentStyleFactory *)self tableStyle];
  v6 = [v5 headerColumns];

  v7 = [(SXDataTableComponentStyleFactory *)self columnStyleForColumnIndex:a3];
  v8 = v7;
  if (v6)
  {
    v9 = [(SXDataTableComponentStyleFactory *)self columnStyleMerger];
    v14[0] = v8;
    v14[1] = v6;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
    id v11 = [v9 mergeObjects:v10];
  }
  else
  {
    id v11 = v7;
  }
  v12 = [(SXDataTableComponentStyleFactory *)self columnStyleForColumnIndex:a3 usingBaseStyle:v11];

  return v12;
}

- (id)headerCellStyleForIndexPath:(id)a3
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  v15[2] = *MEMORY[0x263EF8340];
  v6 = [(SXDataTableComponentStyleFactory *)self tableStyle];
  v7 = [v6 headerCells];

  v8 = -[SXDataTableComponentStyleFactory cellStyleForIndexPath:](self, "cellStyleForIndexPath:", var0, var1);
  v9 = v8;
  if (v7)
  {
    v10 = [(SXDataTableComponentStyleFactory *)self cellStyleMerger];
    v15[0] = v9;
    v15[1] = v7;
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
    id v12 = [v10 mergeObjects:v11];
  }
  else
  {
    id v12 = v8;
  }
  v13 = -[SXDataTableComponentStyleFactory cellStyleForIndexPath:usingBaseStyle:](self, "cellStyleForIndexPath:usingBaseStyle:", var0, var1, v12);

  return v13;
}

- (id)rowStyleForRowIndex:(unint64_t)a3
{
  v5 = [(SXDataTableComponentStyleFactory *)self tableStyle];
  v6 = [v5 rows];
  v7 = [(SXDataTableComponentStyleFactory *)self rowStyleForRowIndex:a3 usingBaseStyle:v6];

  return v7;
}

- (id)columnStyleForColumnIndex:(unint64_t)a3
{
  v5 = [(SXDataTableComponentStyleFactory *)self tableStyle];
  v6 = [v5 columns];
  v7 = [(SXDataTableComponentStyleFactory *)self columnStyleForColumnIndex:a3 usingBaseStyle:v6];

  return v7;
}

- (id)cellStyleForIndexPath:(id)a3
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  v6 = [(SXDataTableComponentStyleFactory *)self tableStyle];
  v7 = [v6 cells];
  v8 = -[SXDataTableComponentStyleFactory cellStyleForIndexPath:usingBaseStyle:](self, "cellStyleForIndexPath:usingBaseStyle:", var0, var1, v7);

  return v8;
}

- (id)rowStyleForRowIndex:(unint64_t)a3 usingBaseStyle:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v26 = [MEMORY[0x263EFF980] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v21 = v6;
  id obj = [v6 conditional];
  uint64_t v24 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v32;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v7;
        v8 = *(void **)(*((void *)&v31 + 1) + 8 * v7);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        v9 = [v8 selectors];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v28 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * i);
              id v15 = [(SXDataTableComponentStyleFactory *)self selectorValidator];
              int v16 = [v15 validateRowSelector:v14 forRowIndex:a3];

              if (v16)
              {
                id v17 = +[SXDataTableStyleMatch matchWithStyle:v8 andSelector:v14];
                [v26 addObject:v17];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v11);
        }

        uint64_t v7 = v25 + 1;
      }
      while (v25 + 1 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v24);
  }

  v18 = [(SXDataTableComponentStyleFactory *)self rowStyleMerger];
  v19 = [(SXDataTableComponentStyleFactory *)self styleByMergingStyleMatches:v26 forBaseStyle:v21 merger:v18];

  return v19;
}

- (id)columnStyleForColumnIndex:(unint64_t)a3 usingBaseStyle:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v26 = [MEMORY[0x263EFF980] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v21 = v6;
  id obj = [v6 conditional];
  uint64_t v24 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v32;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v7;
        v8 = *(void **)(*((void *)&v31 + 1) + 8 * v7);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        v9 = [v8 selectors];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v28 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * i);
              id v15 = [(SXDataTableComponentStyleFactory *)self selectorValidator];
              int v16 = [v15 validateColumnSelector:v14 forColumnIndex:a3];

              if (v16)
              {
                id v17 = +[SXDataTableStyleMatch matchWithStyle:v8 andSelector:v14];
                [v26 addObject:v17];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v11);
        }

        uint64_t v7 = v25 + 1;
      }
      while (v25 + 1 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v24);
  }

  v18 = [(SXDataTableComponentStyleFactory *)self columnStyleMerger];
  v19 = [(SXDataTableComponentStyleFactory *)self styleByMergingStyleMatches:v26 forBaseStyle:v21 merger:v18];

  return v19;
}

- (id)cellStyleForIndexPath:(id)a3 usingBaseStyle:(id)a4
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a4;
  long long v27 = [MEMORY[0x263EFF980] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v22 = v7;
  id obj = [v7 conditional];
  uint64_t v25 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v34;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v8;
        v9 = *(void **)(*((void *)&v33 + 1) + 8 * v8);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v28 = v9;
        uint64_t v10 = [v9 selectors];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v30 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v29 + 1) + 8 * i);
              int v16 = [(SXDataTableComponentStyleFactory *)self selectorValidator];
              int v17 = objc_msgSend(v16, "validateCellSelector:forIndexPath:", v15, var0, var1);

              if (v17)
              {
                v18 = +[SXDataTableStyleMatch matchWithStyle:v28 andSelector:v15];
                [v27 addObject:v18];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v12);
        }

        uint64_t v8 = v26 + 1;
      }
      while (v26 + 1 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v25);
  }

  v19 = [(SXDataTableComponentStyleFactory *)self cellStyleMerger];
  v20 = [(SXDataTableComponentStyleFactory *)self styleByMergingStyleMatches:v27 forBaseStyle:v22 merger:v19];

  return v20;
}

- (unint64_t)isOddNumber:(int64_t)a3
{
  if (a3) {
    return 2;
  }
  else {
    return 1;
  }
}

- (unint64_t)isEvenNumber:(int64_t)a3
{
  if ((a3 == 0) | a3 & 1) {
    return 1;
  }
  else {
    return 2;
  }
}

- (id)styleByMergingStyleMatches:(id)a3 forBaseStyle:(id)a4 merger:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(SXDataTableComponentStyleFactory *)self filterDuplicateSequentialStyles:a3];
  uint64_t v11 = [(SXDataTableComponentStyleFactory *)self sortStylesMatchesBySelectorWeight:v10];
  uint64_t v12 = [MEMORY[0x263EFF980] array];
  uint64_t v13 = v12;
  if (v8) {
    [v12 addObject:v8];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "style", (void)v22);
        [v13 addObject:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }

  v20 = [v9 mergeObjects:v13];

  return v20;
}

- (id)filterDuplicateSequentialStyles:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  if ([v4 count])
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [v4 objectAtIndex:v6];
      unint64_t v8 = v6 + 1;
      while (v8 < [v4 count])
      {
        id v9 = [v4 objectAtIndex:v8];
        uint64_t v10 = [v7 style];
        uint64_t v11 = [v9 style];

        if (v10 != v11) {
          goto LABEL_11;
        }
        uint64_t v12 = [v7 selector];
        uint64_t v13 = [v9 selector];
        int64_t v14 = [(SXDataTableComponentStyleFactory *)self compareSelector:v12 withOtherSelector:v13];

        if ((unint64_t)(v14 + 1) <= 1)
        {
          [v5 addObject:v7];
LABEL_11:

          break;
        }
        if (v14 == 1)
        {
          [v5 addObject:v9];
          unint64_t v6 = ++v8;
        }
      }
      ++v6;
    }
    while (v6 < [v4 count]);
  }
  uint64_t v15 = [MEMORY[0x263EFF980] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v16 = v4;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        if ((objc_msgSend(v5, "containsObject:", v21, (void)v24) & 1) == 0) {
          [v15 addObject:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v18);
  }

  long long v22 = (void *)[v15 copy];
  return v22;
}

- (id)sortStylesMatchesBySelectorWeight:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __70__SXDataTableComponentStyleFactory_sortStylesMatchesBySelectorWeight___block_invoke;
  v5[3] = &unk_264652790;
  v5[4] = self;
  v3 = [a3 sortedArrayUsingComparator:v5];
  return v3;
}

uint64_t __70__SXDataTableComponentStyleFactory_sortStylesMatchesBySelectorWeight___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  unint64_t v6 = [a2 selector];
  id v7 = [v5 selector];

  uint64_t v8 = [v4 compareSelector:v6 withOtherSelector:v7];
  return v8;
}

- (int64_t)compareSelector:(id)a3 withOtherSelector:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unint64_t v7 = [v6 selectorWeight];
  unint64_t v8 = [v5 selectorWeight];
  unint64_t v9 = [v6 numberOfConditions];

  unint64_t v10 = [v5 numberOfConditions];
  int64_t v11 = 1;
  uint64_t v12 = -1;
  if (v9 >= v10) {
    uint64_t v12 = v9 > v10;
  }
  if (v7 <= v8) {
    int64_t v11 = v12;
  }
  if (v7 >= v8) {
    return v11;
  }
  else {
    return -1;
  }
}

- (id)descriptorForIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(SXDataTableComponentStyleFactory *)self recordStore];
  id v6 = [v5 descriptors];

  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        unint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int64_t v11 = [v10 identifier];
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (SXDataRecordStore)recordStore
{
  return self->_recordStore;
}

- (SXDataTableStyle)tableStyle
{
  return self->_tableStyle;
}

- (unint64_t)dataOrientation
{
  return self->_dataOrientation;
}

- (SXDataTableSelectorValidator)selectorValidator
{
  return self->_selectorValidator;
}

- (SXJSONObjectMerger)rowStyleMerger
{
  return self->_rowStyleMerger;
}

- (SXJSONObjectMerger)columnStyleMerger
{
  return self->_columnStyleMerger;
}

- (SXJSONObjectMerger)cellStyleMerger
{
  return self->_cellStyleMerger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellStyleMerger, 0);
  objc_storeStrong((id *)&self->_columnStyleMerger, 0);
  objc_storeStrong((id *)&self->_rowStyleMerger, 0);
  objc_storeStrong((id *)&self->_selectorValidator, 0);
  objc_storeStrong((id *)&self->_tableStyle, 0);
  objc_storeStrong((id *)&self->_recordStore, 0);
}

@end