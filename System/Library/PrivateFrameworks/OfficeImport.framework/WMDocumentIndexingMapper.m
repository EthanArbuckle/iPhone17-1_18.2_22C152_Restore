@interface WMDocumentIndexingMapper
- (void)_indexBlock:(id)a3 intoString:(id)a4;
- (void)_indexTable:(id)a3 intoString:(id)a4;
- (void)_indexText:(id)a3 intoString:(id)a4;
- (void)mapWithState:(id)a3;
@end

@implementation WMDocumentIndexingMapper

- (void)_indexBlock:(id)a3 intoString:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v23 = a4;
  v21 = [a3 runs];
  v24 = [MEMORY[0x263EFF980] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = v21;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    char v7 = 0;
    uint64_t v8 = *(void *)v26;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          int v12 = [v11 fieldMarkerType];
          if ((v12 - 20) < 2)
          {

            goto LABEL_14;
          }
          if (v12 == 19)
          {
            char v7 = 1;
            goto LABEL_26;
          }
        }
        if (v7)
        {
          char v7 = 1;
          goto LABEL_27;
        }
LABEL_14:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = [v10 string];
          if (v11) {
            [v24 addObject:v11];
          }
          goto LABEL_25;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = [v10 drawable];
          v13 = [v11 clientData];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v15 = [v11 clientData];
            v16 = [v15 textBox];
            v17 = v16;
            if (v16)
            {
              v18 = [v16 text];
              [(WMDocumentIndexingMapper *)self _indexText:v18 intoString:v23];
            }
LABEL_24:
          }
LABEL_25:
          char v7 = 0;
LABEL_26:

          goto LABEL_27;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          v15 = [v11 text];
          [(WMDocumentIndexingMapper *)self _indexText:v15 intoString:v23];
          goto LABEL_24;
        }
        char v7 = 0;
LABEL_27:
        ++v9;
      }
      while (v6 != v9);
      uint64_t v19 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
      uint64_t v6 = v19;
    }
    while (v19);
  }

  if ([v24 count])
  {
    v20 = [v24 componentsJoinedByString:&stru_26EBF24D8];
    [v23 appendString:v20];

    [v23 appendString:@"\n"];
  }
}

- (void)_indexTable:(id)a3 intoString:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  for (unint64_t i = 0; [v12 rowCount] > i; ++i)
  {
    uint64_t v8 = [v12 rowAt:i];
    for (unint64_t j = 0; [v8 cellCount] > j; ++j)
    {
      v10 = [v8 cellAt:j];
      id v11 = [v10 text];
      [(WMDocumentIndexingMapper *)self _indexText:v11 intoString:v6];
    }
  }
}

- (void)_indexText:(id)a3 intoString:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  for (unint64_t i = 0; [v9 blockCount] > i; ++i)
  {
    uint64_t v8 = [v9 blockAt:i];
    if ([v8 blockType])
    {
      if ([v8 blockType] == 1) {
        [(WMDocumentIndexingMapper *)self _indexTable:v8 intoString:v6];
      }
    }
    else
    {
      [(WMDocumentIndexingMapper *)self _indexBlock:v8 intoString:v6];
    }
  }
}

- (void)mapWithState:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F089D8] string];
  id v6 = [(CMMapper *)self document];
  for (unint64_t i = 0; [v6 sectionCount] > i; ++i)
  {
    uint64_t v8 = [v6 sectionAt:i];
    id v9 = [v8 firstPageHeader];
    [(WMDocumentIndexingMapper *)self _indexText:v9 intoString:v5];

    v10 = [v8 oddPageHeader];
    [(WMDocumentIndexingMapper *)self _indexText:v10 intoString:v5];

    id v11 = [v8 evenPageHeader];
    [(WMDocumentIndexingMapper *)self _indexText:v11 intoString:v5];

    id v12 = [v8 text];
    [(WMDocumentIndexingMapper *)self _indexText:v12 intoString:v5];

    v13 = [v8 firstPageFooter];
    [(WMDocumentIndexingMapper *)self _indexText:v13 intoString:v5];

    v14 = [v8 oddPageFooter];
    [(WMDocumentIndexingMapper *)self _indexText:v14 intoString:v5];

    v15 = [v8 evenPageFooter];
    [(WMDocumentIndexingMapper *)self _indexText:v15 intoString:v5];
  }
  v16 = [v4 textContent];
  [v16 appendString:v5];

  v17.receiver = self;
  v17.super_class = (Class)WMDocumentIndexingMapper;
  [(CMIndexingMapper *)&v17 mapWithState:v4];
}

@end