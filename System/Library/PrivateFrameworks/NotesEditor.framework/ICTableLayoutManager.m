@interface ICTableLayoutManager
- (ICAvailableTableWidthProviding)delegate;
- (ICSearchResultRegexMatchFinder)highlightPatternRegexFinder;
- (ICTable)table;
- (ICTableColumnWidthManager)columnWidthManager;
- (ICTableLayoutManager)initWithTable:(id)a3 delegate:(id)a4;
- (NSMutableDictionary)columnLayoutManagers;
- (NSMutableDictionary)rowPositions;
- (double)availableWidth;
- (double)emptyCellHeight;
- (double)emptyCellLineHeight;
- (double)emptyCellLineSpacing;
- (id)columnLayoutManagerForColumn:(id)a3;
- (void)removeColumnLayoutManagerForColumn:(id)a3;
- (void)setEmptyCellLineHeight:(double)a3;
- (void)setEmptyCellLineSpacing:(double)a3;
- (void)setHighlightPatternRegexFinder:(id)a3;
- (void)setYPosition:(double)a3 forRow:(id)a4 shouldInvalidate:(BOOL)a5;
- (void)updateForMovedRow:(id)a3;
@end

@implementation ICTableLayoutManager

- (ICTableLayoutManager)initWithTable:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)ICTableLayoutManager;
  v8 = [(ICTableLayoutManager *)&v21 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_table, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    id v10 = objc_alloc(MEMORY[0x263F5B4B8]);
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_table);
    uint64_t v12 = [v10 initWithTable:WeakRetained delegate:v9];
    columnWidthManager = v9->_columnWidthManager;
    v9->_columnWidthManager = (ICTableColumnWidthManager *)v12;

    id v14 = objc_loadWeakRetained((id *)&v9->_table);
    uint64_t v15 = [v14 columnCount];

    uint64_t v16 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:v15];
    columnLayoutManagers = v9->_columnLayoutManagers;
    v9->_columnLayoutManagers = (NSMutableDictionary *)v16;

    uint64_t v18 = [MEMORY[0x263EFF9A0] dictionary];
    rowPositions = v9->_rowPositions;
    v9->_rowPositions = (NSMutableDictionary *)v18;
  }
  return v9;
}

- (double)emptyCellHeight
{
  v3 = [(ICTableLayoutManager *)self columnLayoutManagers];
  v4 = [v3 allValues];
  v5 = [v4 firstObject];

  if (v5)
  {
    objc_opt_class();
    id v6 = [v5 columnTextStorage];
    id v7 = [v6 styler];
    ICDynamicCast();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x263F5B4E8]);
  }
  [(ICTableLayoutManager *)self emptyCellLineHeight];
  if (v9 == 0.0)
  {
    id v10 = [v8 bodyAttributes];
    v11 = [v10 objectForKey:*MEMORY[0x263F814F0]];
    [v11 lineHeight];
    -[ICTableLayoutManager setEmptyCellLineHeight:](self, "setEmptyCellLineHeight:");
    uint64_t v12 = [v10 objectForKey:*MEMORY[0x263F81540]];
    [v12 lineSpacing];
    -[ICTableLayoutManager setEmptyCellLineSpacing:](self, "setEmptyCellLineSpacing:");
  }
  v13 = [v8 zoomController];
  [v13 zoomFactor];
  if (v14 == 0.0) {
    double v15 = 1.0;
  }
  else {
    double v15 = v14;
  }

  uint64_t v16 = (void *)MEMORY[0x263F81708];
  objc_msgSend(MEMORY[0x263F81708], "ic_pointSizeForBodyTextWithContentSizeCategory:", 0);
  v17 = objc_msgSend(v16, "systemFontOfSize:");
  uint64_t v18 = objc_msgSend(v17, "ic_fontWithSingleLineA");

  [v18 lineHeight];
  double v20 = v19;
  [(ICTableLayoutManager *)self emptyCellLineSpacing];
  double v22 = round(v21 + v20 * v15 + *MEMORY[0x263F5B188] + *MEMORY[0x263F5B170]);

  return v22;
}

- (id)columnLayoutManagerForColumn:(id)a3
{
  id v4 = a3;
  v5 = [(ICTableLayoutManager *)self columnLayoutManagers];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    id v6 = [[ICTableColumnLayoutManager alloc] initWithTableLayoutManager:self columnID:v4];
    id v7 = [(ICTableLayoutManager *)self columnLayoutManagers];
    [v7 setObject:v6 forKeyedSubscript:v4];

    id v8 = [(ICTableLayoutManager *)self highlightPatternRegexFinder];
    [(ICLayoutManager *)v6 setHighlightPatternRegexFinder:v8];
  }

  return v6;
}

- (void)removeColumnLayoutManagerForColumn:(id)a3
{
  id v4 = a3;
  id v5 = [(ICTableLayoutManager *)self columnLayoutManagers];
  [v5 removeObjectForKey:v4];
}

- (void)updateForMovedRow:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = [(ICTableLayoutManager *)self columnLayoutManagers];
  id v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * v10);
        uint64_t v12 = [(ICTableLayoutManager *)self columnLayoutManagers];
        v13 = [v12 objectForKey:v11];

        double v14 = [v13 columnTextStorage];
        NSUInteger v15 = [v14 characterRangeForRowID:v4];
        NSUInteger v17 = v16;
        [v14 updateStorageForMovedRow:v4];
        v28.location = [v14 characterRangeForRowID:v4];
        v28.length = v18;
        v27.location = v15;
        v27.length = v17;
        NSRange v19 = NSUnionRange(v27, v28);
        objc_msgSend(v13, "invalidateLayoutForCharacterRange:actualCharacterRange:", v19.location, v19.length, 0);
        double v20 = [(ICTableLayoutManager *)self highlightPatternRegexFinder];
        [v13 setHighlightPatternRegexFinder:v20];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }
}

- (void)setYPosition:(double)a3 forRow:(id)a4 shouldInvalidate:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a4;
  uint64_t v9 = [(ICTableLayoutManager *)self rowPositions];
  uint64_t v10 = [v9 objectForKey:v8];

  if (!v10 || ([v10 doubleValue], v11 != a3))
  {
    uint64_t v12 = [(ICTableLayoutManager *)self rowPositions];
    v13 = [NSNumber numberWithDouble:a3];
    [v12 setObject:v13 forKey:v8];

    if (v5)
    {
      NSRange v28 = v10;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      double v14 = [(ICTableLayoutManager *)self columnLayoutManagers];
      NSUInteger v15 = [v14 allValues];

      uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v30 != v18) {
              objc_enumerationMutation(v15);
            }
            double v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            long long v21 = [v20 columnTextStorage];
            unint64_t v22 = [v21 characterRangeForRowID:v8];
            if (v22 != 0x7FFFFFFFFFFFFFFFLL)
            {
              unint64_t v23 = v22;
              if (v22 <= [v21 length])
              {
                unint64_t v24 = [v21 length];
                unint64_t v25 = v23 - 1;
                if (!v23) {
                  unint64_t v25 = 0;
                }
                BOOL v26 = v23 != 0;
                if (v23 < v24)
                {
                  uint64_t v27 = 1;
                }
                else
                {
                  unint64_t v23 = v25;
                  uint64_t v27 = v26;
                }
                objc_msgSend(v20, "invalidateLayoutForCharacterRange:actualCharacterRange:", v23, v27, 0);
                objc_msgSend(v20, "locationForGlyphAtIndex:", objc_msgSend(v20, "glyphRangeForCharacterRange:actualCharacterRange:", v23, v27, 0));
              }
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v17);
      }

      uint64_t v10 = v28;
    }
  }
}

- (double)availableWidth
{
  v2 = [(ICTableLayoutManager *)self delegate];
  [v2 availableWidth];
  double v4 = v3;

  return v4;
}

- (void)setHighlightPatternRegexFinder:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  p_highlightPatternRegexFinder = &self->_highlightPatternRegexFinder;
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, a3);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [(ICTableLayoutManager *)self columnLayoutManagers];
  id v8 = [v7 allValues];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) setHighlightPatternRegexFinder:*p_highlightPatternRegexFinder];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (ICTable)table
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_table);

  return (ICTable *)WeakRetained;
}

- (ICAvailableTableWidthProviding)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICAvailableTableWidthProviding *)WeakRetained;
}

- (ICTableColumnWidthManager)columnWidthManager
{
  return (ICTableColumnWidthManager *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)rowPositions
{
  return self->_rowPositions;
}

- (ICSearchResultRegexMatchFinder)highlightPatternRegexFinder
{
  return self->_highlightPatternRegexFinder;
}

- (NSMutableDictionary)columnLayoutManagers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (double)emptyCellLineHeight
{
  return self->_emptyCellLineHeight;
}

- (void)setEmptyCellLineHeight:(double)a3
{
  self->_emptyCellLineHeight = a3;
}

- (double)emptyCellLineSpacing
{
  return self->_emptyCellLineSpacing;
}

- (void)setEmptyCellLineSpacing:(double)a3
{
  self->_emptyCellLineSpacing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnLayoutManagers, 0);
  objc_storeStrong((id *)&self->_highlightPatternRegexFinder, 0);
  objc_storeStrong((id *)&self->_rowPositions, 0);
  objc_storeStrong((id *)&self->_columnWidthManager, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_table);
}

@end