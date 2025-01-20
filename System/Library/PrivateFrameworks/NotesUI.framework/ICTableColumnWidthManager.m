@interface ICTableColumnWidthManager
- (ICAvailableTableWidthProviding)delegate;
- (ICTable)table;
- (ICTableColumnWidthManager)initWithTable:(id)a3 delegate:(id)a4;
- (ICTextController)styler;
- (NSMutableDictionary)cachedActualColumnWidths;
- (NSMutableDictionary)cachedIdealColumnWidths;
- (NSMutableDictionary)cachedMinimumColumnWidths;
- (double)calculateIdealWidthOfColumn:(id)a3;
- (double)comfortableColumnWidth;
- (double)comfortableNumberOfColumnsOnscreen;
- (double)widthOfColumn:(id)a3;
- (id)invalidateWidthForColumns:(id)a3;
- (id)recalculateActualWidths;
@end

@implementation ICTableColumnWidthManager

- (ICTableColumnWidthManager)initWithTable:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ICTableColumnWidthManager;
  v8 = [(ICTableColumnWidthManager *)&v19 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_table, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "columnCount"));
    cachedIdealColumnWidths = v9->_cachedIdealColumnWidths;
    v9->_cachedIdealColumnWidths = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "columnCount"));
    cachedActualColumnWidths = v9->_cachedActualColumnWidths;
    v9->_cachedActualColumnWidths = (NSMutableDictionary *)v12;

    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "columnCount"));
    cachedMinimumColumnWidths = v9->_cachedMinimumColumnWidths;
    v9->_cachedMinimumColumnWidths = (NSMutableDictionary *)v14;

    v16 = objc_alloc_init(ICTextController);
    styler = v9->_styler;
    v9->_styler = v16;

    if (initWithTable_delegate__onceToken != -1) {
      dispatch_once(&initWithTable_delegate__onceToken, &__block_literal_global_5);
    }
  }

  return v9;
}

void __52__ICTableColumnWidthManager_initWithTable_delegate___block_invoke()
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = *MEMORY[0x1E4F835C8];
  v4[0] = *MEMORY[0x1E4F835B8];
  v4[1] = v1;
  v5[0] = &unk_1F09A45F8;
  v5[1] = &unk_1F09A4608;
  uint64_t v2 = *MEMORY[0x1E4F835D0];
  v4[2] = *MEMORY[0x1E4F835C0];
  v4[3] = v2;
  v5[2] = &unk_1F09A4618;
  v5[3] = &unk_1F09A40A0;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  [v0 registerDefaults:v3];
}

- (double)widthOfColumn:(id)a3
{
  id v4 = a3;
  v5 = [(ICTableColumnWidthManager *)self cachedActualColumnWidths];
  id v6 = [v5 objectForKey:v4];

  id v7 = [(ICTableColumnWidthManager *)self table];
  v8 = v7;
  if (v6)
  {
    [v6 doubleValue];
LABEL_5:
    double v10 = v9;
    goto LABEL_6;
  }
  double v10 = 0.0;
  if ([v7 containsColumn:v4])
  {
    [(ICTableColumnWidthManager *)self calculateIdealWidthOfColumn:v4];
    goto LABEL_5;
  }
LABEL_6:

  return v10;
}

- (double)calculateIdealWidthOfColumn:(id)a3
{
  id v4 = a3;
  v5 = [(ICTableColumnWidthManager *)self table];
  if ([v5 containsColumn:v4])
  {
    uint64_t v6 = [v5 columnIndexForIdentifier:v4];
    id v7 = [(ICTableColumnWidthManager *)self styler];
    v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v8 doubleForKey:*MEMORY[0x1E4F835B8]];
    uint64_t v10 = v9;

    v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v11 doubleForKey:*MEMORY[0x1E4F835C8]];
    double v13 = v12;

    uint64_t v51 = 0;
    v52 = (double *)&v51;
    uint64_t v53 = 0x2020000000;
    double v54 = v13;
    uint64_t v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    unint64_t v15 = [v14 integerForKey:*MEMORY[0x1E4F835D0]];

    v16 = (void *)MEMORY[0x1E4F28D60];
    unint64_t v17 = [v5 rowCount];
    if (v17 >= v15) {
      unint64_t v18 = v15;
    }
    else {
      unint64_t v18 = v17;
    }
    objc_super v19 = objc_msgSend(v16, "indexSetWithIndexesInRange:", 0, v18);
    uint64_t v47 = 0;
    v48 = (double *)&v47;
    uint64_t v49 = 0x2020000000;
    uint64_t v50 = 0;
    v20 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v6];
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    v41 = __57__ICTableColumnWidthManager_calculateIdealWidthOfColumn___block_invoke;
    v42 = &unk_1E5FD97D0;
    id v21 = v7;
    uint64_t v46 = v10;
    id v43 = v21;
    v44 = &v51;
    v45 = &v47;
    [v5 enumerateCellObjectsInCellSelectionContainingColumnIndices:v20 rowIndices:v19 copyItems:0 usingBlock:&v39];

    double v22 = v48[3];
    if (v22 < v13) {
      double v22 = v13;
    }
    v48[3] = v22;
    v23 = [(ICTableColumnWidthManager *)self delegate];
    [v23 availableWidth];
    double v25 = v24 - 11.0;

    double v26 = 450.0;
    if (v25 < 450.0) {
      double v26 = v25;
    }
    if (v48[3] >= v26) {
      double v27 = v26;
    }
    else {
      double v27 = v48[3];
    }
    v48[3] = v27;
    v28 = [(ICTableColumnWidthManager *)self cachedIdealColumnWidths];
    double v29 = round(v27);
    v30 = [NSNumber numberWithDouble:v29];
    [v28 setObject:v30 forKey:v4];

    v31 = [(ICTableColumnWidthManager *)self cachedActualColumnWidths];
    v32 = [NSNumber numberWithDouble:v29];
    [v31 setObject:v32 forKey:v4];

    v33 = [(ICTableColumnWidthManager *)self cachedMinimumColumnWidths];
    v34 = [NSNumber numberWithDouble:v52[3]];
    [v33 setObject:v34 forKey:v4];

    _Block_object_dispose(&v47, 8);
    _Block_object_dispose(&v51, 8);
  }
  else
  {
    v35 = [(ICTableColumnWidthManager *)self cachedIdealColumnWidths];
    [v35 removeObjectForKey:v4];

    v36 = [(ICTableColumnWidthManager *)self cachedActualColumnWidths];
    [v36 removeObjectForKey:v4];

    v37 = [(ICTableColumnWidthManager *)self cachedMinimumColumnWidths];
    [v37 removeObjectForKey:v4];

    double v29 = 0.0;
  }

  return v29;
}

uint64_t __57__ICTableColumnWidthManager_calculateIdealWidthOfColumn___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 attributedString];
  v5 = [v4 string];
  unint64_t v6 = objc_msgSend(v5, "ic_lengthOfLongestLine");

  if (v6)
  {
    id v7 = [v3 attributesAtIndex:0 effectiveRange:0];
    v8 = [*(id *)(a1 + 32) styleForModelAttributes:v7];
    [@"N" sizeWithAttributes:v8];
    double v10 = v9;
    double v11 = v9 * pow((double)v6, *(long double *)(a1 + 56)) + 5.0 * 2.0;
    unint64_t v12 = 12;
    if (v6 < 0xC) {
      unint64_t v12 = v6;
    }
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 5.0 + 5.0 + (double)v12 * v10;
    if (v11 < *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      double v11 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    if (v11 < *(double *)(v13 + 24)) {
      double v11 = *(double *)(v13 + 24);
    }
    *(double *)(v13 + 24) = v11;
  }
  return 0;
}

- (double)comfortableNumberOfColumnsOnscreen
{
  uint64_t v2 = [(ICTableColumnWidthManager *)self delegate];
  [v2 availableWidth];
  double v4 = v3;

  return ceil(v4 / 210.0);
}

- (double)comfortableColumnWidth
{
  double v3 = [(ICTableColumnWidthManager *)self delegate];
  [v3 availableWidth];
  double v5 = v4;

  [(ICTableColumnWidthManager *)self comfortableNumberOfColumnsOnscreen];
  return v5 / v6;
}

- (id)invalidateWidthForColumns:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        unint64_t v12 = [(ICTableColumnWidthManager *)self cachedActualColumnWidths];
        uint64_t v13 = [v12 objectForKeyedSubscript:v11];

        if (v13) {
          uint64_t v14 = v13;
        }
        else {
          uint64_t v14 = &unk_1F09A40B8;
        }
        [v5 setObject:v14 forKey:v11];
        [(ICTableColumnWidthManager *)self calculateIdealWidthOfColumn:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v8);
  }

  double v25 = [(ICTableColumnWidthManager *)self recalculateActualWidths];
  objc_msgSend(MEMORY[0x1E4F1CA80], "setWithSet:");
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v6;
  uint64_t v15 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8 * j);
        v20 = [v5 objectForKeyedSubscript:v19];
        id v21 = [(ICTableColumnWidthManager *)self cachedActualColumnWidths];
        double v22 = [v21 objectForKeyedSubscript:v19];
        char v23 = [v20 isEqual:v22];

        if (v23)
        {
          if ([v25 containsObject:v19]) {
            [v27 removeObject:v19];
          }
        }
        else
        {
          [v27 addObject:v19];
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v16);
  }

  return v27;
}

- (id)recalculateActualWidths
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  uint64_t v47 = [(ICTableColumnWidthManager *)self table];
  double v3 = [(ICTableColumnWidthManager *)self cachedIdealColumnWidths];
  id v4 = (void *)[v3 mutableCopy];

  double v5 = [(ICTableColumnWidthManager *)self delegate];
  [v5 availableWidth];
  double v7 = v6;

  [(ICTableColumnWidthManager *)self comfortableColumnWidth];
  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x2020000000;
  uint64_t v75 = 0;
  uint64_t v68 = 0;
  v69 = (double *)&v68;
  uint64_t v70 = 0x2020000000;
  uint64_t v71 = 0;
  uint64_t v64 = 0;
  v65 = (double *)&v64;
  uint64_t v66 = 0x2020000000;
  uint64_t v67 = 0;
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __52__ICTableColumnWidthManager_recalculateActualWidths__block_invoke;
  v57[3] = &unk_1E5FD97F8;
  v59 = &v72;
  v60 = &v64;
  v57[4] = self;
  uint64_t v62 = v8;
  id v9 = v4;
  id v58 = v9;
  v61 = &v68;
  double v63 = v7;
  [v47 enumerateColumnsWithBlock:v57];
  id v48 = [MEMORY[0x1E4F1CA80] set];
  double v10 = [(ICTableColumnWidthManager *)self cachedActualColumnWidths];
  unint64_t v11 = [v47 columnCount];
  if (v73[3] == v11)
  {
    unint64_t v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v12 doubleForKey:*MEMORY[0x1E4F835C0]];
    double v14 = v13;

    double v15 = v69[3];
    if (v15 > v7)
    {
      if (v65[3] >= v7) {
        double v15 = v65[3];
      }
      else {
        double v15 = v7;
      }
    }
    [(ICTableColumnWidthManager *)self comfortableNumberOfColumnsOnscreen];
    double v17 = 0.0;
    if (v15 > v7) {
      double v17 = v14;
    }
    BOOL v18 = v15 > v7 + v14 || v15 <= v7;
    double v19 = v15 - v17;
    if (!v18) {
      double v19 = v7;
    }
    if (v19 < v7 || v16 < (double)v11) {
      double v21 = v19;
    }
    else {
      double v21 = v7;
    }
    double v22 = [MEMORY[0x1E4F1CA48] array];
    char v23 = [(ICTableColumnWidthManager *)self table];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __52__ICTableColumnWidthManager_recalculateActualWidths__block_invoke_2;
    v55[3] = &unk_1E5FD9820;
    id v24 = v22;
    id v56 = v24;
    [v23 enumerateColumnsWithBlock:v55];

    double v25 = [(ICTableColumnWidthManager *)self cachedIdealColumnWidths];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __52__ICTableColumnWidthManager_recalculateActualWidths__block_invoke_3;
    v53[3] = &unk_1E5FD8FC0;
    id v46 = v25;
    id v54 = v46;
    [v24 sortUsingComparator:v53];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v26 = v24;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v49 objects:v76 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v50 != v28) {
            objc_enumerationMutation(v26);
          }
          uint64_t v30 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          long long v31 = [v9 objectForKeyedSubscript:v30];
          [v31 doubleValue];
          double v33 = v32;

          double v34 = v69[3];
          long long v35 = [(ICTableColumnWidthManager *)self cachedMinimumColumnWidths];
          v36 = [v35 objectForKeyedSubscript:v30];
          [v36 doubleValue];
          double v38 = v37;

          if (v33 * (v21 / v34) >= v38) {
            double v38 = v33 * (v21 / v34);
          }
          uint64_t v39 = [v10 objectForKeyedSubscript:v30];
          [v39 doubleValue];
          double v40 = floor(v38);
          BOOL v42 = v41 != v40;

          if (v42)
          {
            id v43 = [(ICTableColumnWidthManager *)self cachedActualColumnWidths];
            v44 = [NSNumber numberWithDouble:v40];
            [v43 setObject:v44 forKey:v30];

            [v48 addObject:v30];
          }
          double v21 = v21 - v40;
          v69[3] = v69[3] - v33;
        }
        uint64_t v27 = [v26 countByEnumeratingWithState:&v49 objects:v76 count:16];
      }
      while (v27);
    }
  }
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);

  return v48;
}

void __52__ICTableColumnWidthManager_recalculateActualWidths__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  double v6 = [*(id *)(a1 + 32) cachedIdealColumnWidths];
  double v7 = [v6 objectForKeyedSubscript:v12];
  [v7 doubleValue];
  double v9 = v8;

  if (v9 == 0.0)
  {
    [*(id *)(a1 + 32) calculateIdealWidthOfColumn:v12];
    double v9 = v10;
  }
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v9
                                                              + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 24);
  if (v9 < *(double *)(a1 + 72)) {
    double v9 = *(double *)(a1 + 72);
  }
  unint64_t v11 = [NSNumber numberWithDouble:v9];
  [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v12];

  *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v9
                                                              + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                          + 24);
  if (*(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) > *(double *)(a1 + 80)) {
    *a4 = 1;
  }
}

uint64_t __52__ICTableColumnWidthManager_recalculateActualWidths__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __52__ICTableColumnWidthManager_recalculateActualWidths__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  double v5 = *(void **)(a1 + 32);
  id v6 = a3;
  double v7 = [v5 objectForKeyedSubscript:a2];
  double v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
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

- (ICTextController)styler
{
  return self->_styler;
}

- (NSMutableDictionary)cachedIdealColumnWidths
{
  return self->_cachedIdealColumnWidths;
}

- (NSMutableDictionary)cachedActualColumnWidths
{
  return self->_cachedActualColumnWidths;
}

- (NSMutableDictionary)cachedMinimumColumnWidths
{
  return self->_cachedMinimumColumnWidths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedMinimumColumnWidths, 0);
  objc_storeStrong((id *)&self->_cachedActualColumnWidths, 0);
  objc_storeStrong((id *)&self->_cachedIdealColumnWidths, 0);
  objc_storeStrong((id *)&self->_styler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_table);
}

@end