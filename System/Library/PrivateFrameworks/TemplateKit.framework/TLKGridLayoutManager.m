@interface TLKGridLayoutManager
+ (double)leadingSectionSpacingForView:(id)a3 view2:(id)a4 index:(unint64_t)a5 alignmentSchema:(id)a6 allEqual:(BOOL)a7;
+ (id)arrayOfItemsForSection:(id)a3;
+ (id)computeTruncationForAlignments:(id)a3 indexForFirstTrailingColumn:(unint64_t)a4 totalEqualColumns:(unint64_t)a5;
+ (id)font;
+ (id)gridManagerWithAlignments:(id)a3 rows:(id)a4;
+ (id)verticalAlignmentsForItems:(id)a3;
- (BOOL)allEqualColumns;
- (BOOL)hasManyTrailingColumns;
- (BOOL)tableContainsRowHeaders;
- (CGSize)cachedFittingSize;
- (CGSize)cachedGridSize;
- (CGSize)contentLayoutSizeFittingSize:(CGSize)a3 forArrangedSubview:(id)a4;
- (CGSize)sizeForFittingSize:(CGSize)a3 forRow:(id)a4;
- (NSArray)alignments;
- (NSArray)itemsForRows;
- (NSArray)spacings;
- (NSArray)verticalRowAlignments;
- (NSDictionary)itemsForIndex;
- (NSMapTable)itemToRowMapping;
- (NSString)description;
- (NUIGridArrangement)gridArrangement;
- (TLKGridLayoutManager)initWithWithAlignments:(id)a3 rows:(id)a4;
- (double)gridArrangement:(id)a3 widthOfColumnAtIndex:(int64_t)a4 spacingAfter:(double *)a5;
- (double)trailingSectionSpacingBasedOnTotalViewsInSection:(int64_t)a3;
- (double)widthOfEqualFillColumns;
- (id)addItemsToDictionary:(id)a3 forSection:(id)a4 row:(unint64_t)a5 truncationPriorities:(id)a6;
- (id)gridArrangement:(id)a3 itemAtIndex:(int64_t)a4 columns:(_NSRange *)a5 rows:(_NSRange *)a6 horizontalAlignment:(int64_t *)a7 verticalAlignment:(int64_t *)a8;
- (id)spacingsForAlignments:(id)a3 firstValidDataRow:(id)a4;
- (int64_t)effectiveUserInterfaceLayoutDirection;
- (int64_t)indexForFirstTrailingColumn;
- (int64_t)numberOfColumns;
- (int64_t)numberOfItemsInGridArrangement:(id)a3;
- (int64_t)totalEqualColumns;
- (void)placeViewsForSize:(CGSize)a3 forRow:(id)a4 completion:(id)a5;
- (void)setAlignments:(id)a3;
- (void)setCachedFittingSize:(CGSize)a3;
- (void)setCachedGridSize:(CGSize)a3;
- (void)setGridArrangement:(id)a3;
- (void)setIndexForFirstTrailingColumn:(int64_t)a3;
- (void)setItemToRowMapping:(id)a3;
- (void)setItemsForIndex:(id)a3;
- (void)setItemsForRows:(id)a3;
- (void)setSpacings:(id)a3;
- (void)setTableContainsRowHeaders:(BOOL)a3;
- (void)setTotalEqualColumns:(int64_t)a3;
- (void)setVerticalRowAlignments:(id)a3;
- (void)setWidthOfEqualFillColumns:(double)a3;
@end

@implementation TLKGridLayoutManager

+ (id)gridManagerWithAlignments:(id)a3 rows:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unint64_t v7 = [v6 count];
  v8 = off_1E5FD2D88;
  if (v7 >= 0xA) {
    v8 = off_1E5FD2DD0;
  }
  v9 = (void *)[objc_alloc(*v8) initWithWithAlignments:v6 rows:v5];

  return v9;
}

- (TLKGridLayoutManager)initWithWithAlignments:(id)a3 rows:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v68.receiver = self;
  v68.super_class = (Class)TLKGridLayoutManager;
  v8 = [(TLKGridLayoutManager *)&v68 init];
  if (!v8) {
    goto LABEL_41;
  }
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E10]), "initWithKeyOptions:valueOptions:capacity:", 5, 0, objc_msgSend(v7, "count"));
  [(TLKGridLayoutManager *)v8 setItemToRowMapping:v9];

  if ([v6 count])
  {
    id v10 = v6;
  }
  else
  {
    NSLog(&cfstr_ImproperApiUsa.isa);
    id v10 = (id)objc_opt_new();

    v11 = [v7 firstObject];
    v12 = [v11 data];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      unint64_t v14 = 0;
      do
      {
        v15 = objc_opt_new();
        [v15 setColumnAlignment:0];
        [v15 setDataAlignment:0];
        [v10 addObject:v15];

        ++v14;
        v16 = [v7 firstObject];
        v17 = [v16 data];
        unint64_t v18 = [v17 count];
      }
      while (v14 < v18);
    }
  }
  -[TLKGridLayoutManager setIndexForFirstTrailingColumn:](v8, "setIndexForFirstTrailingColumn:", [v10 indexOfObjectPassingTest:&__block_literal_global_2]);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v6 = v10;
  uint64_t v19 = [v6 countByEnumeratingWithState:&v64 objects:v70 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = 0;
    uint64_t v22 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v65 != v22) {
          objc_enumerationMutation(v6);
        }
        v21 += [*(id *)(*((void *)&v64 + 1) + 8 * i) isEqualWidth];
      }
      uint64_t v20 = [v6 countByEnumeratingWithState:&v64 objects:v70 count:16];
    }
    while (v20);
  }
  else
  {
    uint64_t v21 = 0;
  }

  [(TLKGridLayoutManager *)v8 setTotalEqualColumns:v21];
  v24 = objc_msgSend((id)objc_opt_class(), "computeTruncationForAlignments:indexForFirstTrailingColumn:totalEqualColumns:", v6, -[TLKGridLayoutManager indexForFirstTrailingColumn](v8, "indexForFirstTrailingColumn"), v21);
  v25 = objc_opt_new();
  v26 = objc_opt_new();
  v59 = v26;
  if ([v7 count])
  {
    unint64_t v27 = 0;
    do
    {
      v28 = [v7 objectAtIndexedSubscript:v27];
      [(TLKGridLayoutManager *)v8 addItemsToDictionary:v25 forSection:v28 row:v27 truncationPriorities:v24];
      v30 = v29 = v25;
      [v26 addObject:v30];

      v31 = [(TLKGridLayoutManager *)v8 itemToRowMapping];
      v32 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v27];
      v33 = [v7 objectAtIndexedSubscript:v27];
      [v31 setObject:v32 forKey:v33];

      v26 = v59;
      v25 = v29;

      ++v27;
    }
    while (v27 < [v7 count]);
  }
  v34 = (void *)[objc_alloc(MEMORY[0x1E4F4BF18]) initWithContainer:v8 dataSource:v8];
  [(TLKGridLayoutManager *)v8 setGridArrangement:v34];
  [(TLKGridLayoutManager *)v8 setItemsForIndex:v25];
  [(TLKGridLayoutManager *)v8 setItemsForRows:v26];
  v57 = v34;
  objc_msgSend(v34, "setHorizontalDistribution:", v21 == objc_msgSend(v6, "count"));
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v35 = v7;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v60 objects:v69 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v61;
    while (2)
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v61 != v38) {
          objc_enumerationMutation(v35);
        }
        if ([*(id *)(*((void *)&v60 + 1) + 8 * j) isSubHeader])
        {
          [(TLKGridLayoutManager *)v8 setTableContainsRowHeaders:1];
          goto LABEL_30;
        }
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v60 objects:v69 count:16];
      if (v37) {
        continue;
      }
      break;
    }
  }
LABEL_30:

  if (![v35 count])
  {
    v50 = 0;
    goto LABEL_40;
  }
  v56 = v25;
  uint64_t v40 = 0;
  while (1)
  {
    v41 = objc_msgSend(v35, "objectAtIndexedSubscript:", v40, v56);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }

LABEL_35:
    if (++v40 >= (unint64_t)[v35 count])
    {
      v50 = 0;
      goto LABEL_39;
    }
  }
  v42 = [v35 objectAtIndexedSubscript:v40];
  [v42 data];
  v44 = v43 = v35;
  uint64_t v58 = [v44 count];
  id v45 = v7;
  v46 = v8;
  v47 = v24;
  uint64_t v48 = [v6 count];

  id v35 = v43;
  BOOL v49 = v58 == v48;
  v24 = v47;
  v8 = v46;
  id v7 = v45;
  if (!v49) {
    goto LABEL_35;
  }
  v50 = [v43 objectAtIndexedSubscript:v40];
LABEL_39:
  v25 = v56;
LABEL_40:
  v51 = [(TLKGridLayoutManager *)v8 spacingsForAlignments:v6 firstValidDataRow:v50];
  [(TLKGridLayoutManager *)v8 setSpacings:v51];

  [(TLKGridLayoutManager *)v8 setAlignments:v6];
  v52 = objc_opt_class();
  v53 = [(TLKGridLayoutManager *)v8 itemsForRows];
  v54 = [v52 verticalAlignmentsForItems:v53];
  [(TLKGridLayoutManager *)v8 setVerticalRowAlignments:v54];

LABEL_41:
  return v8;
}

BOOL __52__TLKGridLayoutManager_initWithWithAlignments_rows___block_invoke(uint64_t a1, void *a2)
{
  return [a2 columnAlignment] == 2;
}

+ (id)verticalAlignmentsForItems:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v19;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v10);
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v15 = &unk_1F0965BC0;
                goto LABEL_16;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
        v15 = &unk_1F0965BD8;
LABEL_16:

        [v4 addObject:v15];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }

  return v4;
}

- (CGSize)sizeForFittingSize:(CGSize)a3 forRow:(id)a4
{
  double width = a3.width;
  id v6 = a4;
  uint64_t v7 = [(TLKGridLayoutManager *)self itemToRowMapping];
  v8 = [v7 objectForKey:v6];

  uint64_t v9 = [v8 integerValue];
  [(TLKGridLayoutManager *)self cachedFittingSize];
  if (width != v11 || v10 != 3.40282347e38)
  {
    -[TLKGridLayoutManager setCachedFittingSize:](self, "setCachedFittingSize:", width, 3.40282347e38);
    uint64_t v12 = [(TLKGridLayoutManager *)self gridArrangement];
    objc_msgSend(v12, "layoutSizeFittingSize:", width, 3.40282347e38);
    -[TLKGridLayoutManager setCachedGridSize:](self, "setCachedGridSize:");

    if ([(TLKGridLayoutManager *)self totalEqualColumns] >= 1)
    {
      uint64_t v13 = [(TLKGridLayoutManager *)self gridArrangement];
      uint64_t v14 = [v13 horizontalDistribution];

      if (v14 != 1)
      {
        [(TLKGridLayoutManager *)self setWidthOfEqualFillColumns:0.0];
        v15 = [(TLKGridLayoutManager *)self gridArrangement];
        objc_msgSend(v15, "layoutSizeFittingSize:", width, 3.40282347e38);
        double v17 = v16;

        long long v18 = [(TLKGridLayoutManager *)self gridArrangement];
        int64_t v19 = [(TLKGridLayoutManager *)self indexForFirstTrailingColumn];
        int64_t v20 = [(TLKGridLayoutManager *)self totalEqualColumns];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __50__TLKGridLayoutManager_sizeForFittingSize_forRow___block_invoke;
        v30[3] = &unk_1E5FD3288;
        v30[4] = self;
        objc_msgSend(v18, "positionItemsInColumns:rows:inBounds:block:", v19, v20, 1, 0, v30, 0.0, 0.0, width, v17);

        long long v21 = [(TLKGridLayoutManager *)self gridArrangement];
        [v21 reloadData];
      }
    }
  }
  long long v22 = [(TLKGridLayoutManager *)self gridArrangement];
  [(TLKGridLayoutManager *)self cachedGridSize];
  double v24 = v23;
  [(TLKGridLayoutManager *)self cachedGridSize];
  objc_msgSend(v22, "frameForColumns:rows:inBounds:", 1, 0, v9, 1, 0.0, 0.0, v24, v25);
  double v27 = v26;

  double v28 = width;
  double v29 = v27;
  result.height = v29;
  result.double width = v28;
  return result;
}

uint64_t __50__TLKGridLayoutManager_sizeForFittingSize_forRow___block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  [*(id *)(a1 + 32) widthOfEqualFillColumns];
  if (v6 < a4) {
    double v6 = a4;
  }
  uint64_t v7 = *(void **)(a1 + 32);
  return [v7 setWidthOfEqualFillColumns:v6];
}

- (void)placeViewsForSize:(CGSize)a3 forRow:(id)a4 completion:(id)a5
{
  double width = a3.width;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void))a5;
  double v10 = [(TLKGridLayoutManager *)self itemToRowMapping];
  double v11 = [v10 objectForKey:v8];
  uint64_t v12 = [v11 integerValue];

  uint64_t v13 = [(TLKGridLayoutManager *)self gridArrangement];
  [(TLKGridLayoutManager *)self cachedGridSize];
  double v15 = v14;
  [(TLKGridLayoutManager *)self cachedGridSize];
  objc_msgSend(v13, "frameForColumns:rows:inBounds:", 1, 0, v12, 1, 0.0, 0.0, v15, v16);
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;

  uint64_t v28 = 0;
  double v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  id v33 = (id)objc_opt_new();
  double v25 = [(TLKGridLayoutManager *)self gridArrangement];
  [(TLKGridLayoutManager *)self cachedGridSize];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __60__TLKGridLayoutManager_placeViewsForSize_forRow_completion___block_invoke;
  v27[3] = &unk_1E5FD32B0;
  v27[5] = v18;
  v27[6] = v20;
  v27[7] = v22;
  v27[8] = v24;
  v27[4] = &v28;
  objc_msgSend(v25, "positionItemsInColumns:rows:inBounds:block:", 1, 0, v12, 1, v27, 0.0, 0.0, width, v26);

  v9[2](v9, v29[5]);
  _Block_object_dispose(&v28, 8);
}

void __60__TLKGridLayoutManager_placeViewsForSize_forRow_completion___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  double v9 = a4 - *(double *)(a1 + 48);
  float v10 = a5;
  double v11 = ceilf(v10);
  id v13 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v13;
  }
  else {
    id v12 = 0;
  }
  +[TLKLayoutUtilities deviceScaledRoundedRect:forView:](TLKLayoutUtilities, "deviceScaledRoundedRect:forView:", v12, a3, v9, v11, a6);
  objc_msgSend(v13, "setFrame:");
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v13];
}

- (id)addItemsToDictionary:(id)a3 forSection:(id)a4 row:(unint64_t)a5 truncationPriorities:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v45 = v11;
  id v13 = [(id)objc_opt_class() arrayOfItemsForSection:v11];
  if ([v13 count])
  {
    uint64_t v14 = 0;
    unint64_t v15 = 0;
    do
    {
      double v16 = [v13 objectAtIndexedSubscript:v15];
      [v16 setRow:a5];

      uint64_t v17 = [v13 objectAtIndexedSubscript:v15];
      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
      [v10 setObject:v17 forKeyedSubscript:v18];

      uint64_t v19 = [v12 objectAtIndexedSubscript:v14];
      [v19 floatValue];
      double v21 = v20;

      uint64_t v22 = [v13 objectAtIndexedSubscript:v15];
      [v22 columnRange];
      unint64_t v24 = v23;

      unint64_t v25 = v15;
      if (v15 < v24)
      {
        do
        {
          double v26 = [v12 objectAtIndexedSubscript:v25];
          [v26 floatValue];
          float v28 = v27;

          if (v21 >= v28) {
            double v21 = v28;
          }
          ++v25;
          double v29 = [v13 objectAtIndexedSubscript:v15];
          [v29 columnRange];
          unint64_t v31 = v30;
        }
        while (v25 < v31);
      }
      int64_t v32 = [(TLKGridLayoutManager *)self totalEqualColumns];
      if (v32 == [v12 count]) {
        double v33 = 750.0;
      }
      else {
        double v33 = v21;
      }
      v34 = [v13 objectAtIndexedSubscript:v15];
      [v34 setHorizontalCompressionResistance:v33];

      unint64_t v35 = [(TLKGridLayoutManager *)self indexForFirstTrailingColumn] - 1;
      uint64_t v36 = [v13 objectAtIndexedSubscript:v15];
      unint64_t v37 = [v36 columnRange];
      if (v35 - v37 < v38 && v35 >= v37) {
        double v40 = 250.0;
      }
      else {
        double v40 = 999.0;
      }
      v41 = [v13 objectAtIndexedSubscript:v15];
      [v41 setHorizontalHuggingPriority:v40];

      v42 = [v13 objectAtIndexedSubscript:v15];
      [v42 columnRange];
      v14 += v43;

      ++v15;
    }
    while (v15 < [v13 count]);
  }

  return v13;
}

+ (id)arrayOfItemsForSection:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v38 = (id)objc_opt_new();
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  unint64_t v35 = v3;
  obuint64_t j = [v3 data];
  uint64_t v4 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (!v4)
  {
    double v6 = 0;
    goto LABEL_25;
  }
  uint64_t v5 = 0;
  double v6 = 0;
  uint64_t v39 = *(void *)v48;
  double v7 = *MEMORY[0x1E4F1DB30];
  double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v48 != v39) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(void **)(*((void *)&v47 + 1) + 8 * i);
      if ([v10 hasOnlyImage])
      {
        id v11 = [v10 formattedTextItems];
        id v12 = [v11 firstObject];

        id v13 = objc_alloc_init(TLKGridImageItem);
        uint64_t v14 = [v12 tlkImage];
        [v14 size];
        double v16 = v15;
        double v18 = v17;

        if (v16 == v7 && v18 == v8)
        {
          uint64_t v41 = 0;
          v42 = &v41;
          uint64_t v43 = 0x3032000000;
          v44 = __Block_byref_object_copy__0;
          id v45 = __Block_byref_object_dispose__0;
          id v46 = 0;
          float v20 = [v12 tlkImage];
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __47__TLKGridLayoutManager_arrayOfItemsForSection___block_invoke;
          v40[3] = &unk_1E5FD32D8;
          v40[4] = &v41;
          [v20 loadImageWithScale:0 isDarkStyle:v40 completionHandler:0.0];

          double v21 = (void *)v42[5];
          uint64_t v22 = (void *)MEMORY[0x1E4FB1830];
          unint64_t v23 = [a1 font];
          [v23 pointSize];
          unint64_t v24 = objc_msgSend(v22, "configurationWithPointSize:weight:", 4);
          unint64_t v25 = [v21 imageWithSymbolConfiguration:v24];
          [v25 size];
          double v16 = v26;
          double v18 = v27;

          _Block_object_dispose(&v41, 8);
        }
        -[TLKArrangementItem setSize:](v13, "setSize:", v16, v18);
        float v28 = v13;

        [v38 addObject:v28];
        -[TLKLabelItem setColumnRange:](v28, "setColumnRange:", v5 + i, 1);

        goto LABEL_19;
      }
      int v29 = [v10 hasContent];
      if (v5 + i) {
        int v30 = v29;
      }
      else {
        int v30 = 1;
      }
      if (v30 == 1)
      {
        float v28 = objc_alloc_init(TLKLabelItem);
        [(TLKLabelItem *)v28 setRichText:v10];
        -[TLKLabelItem setColumnRange:](v28, "setColumnRange:", v5 + i, 1);
        [v38 addObject:v28];

LABEL_19:
        double v6 = v28;
        continue;
      }
      [(TLKLabelItem *)v6 columnRange];
      uint64_t v32 = v31;
      [(TLKLabelItem *)v6 columnRange];
      -[TLKLabelItem setColumnRange:](v6, "setColumnRange:", v5 + i - v32, v33 + 1);
    }
    uint64_t v4 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
    v5 += i;
  }
  while (v4);
LABEL_25:

  return v38;
}

void __47__TLKGridLayoutManager_arrayOfItemsForSection___block_invoke(uint64_t a1, void *a2)
{
}

- (id)gridArrangement:(id)a3 itemAtIndex:(int64_t)a4 columns:(_NSRange *)a5 rows:(_NSRange *)a6 horizontalAlignment:(int64_t *)a7 verticalAlignment:(int64_t *)a8
{
  uint64_t v14 = [(TLKGridLayoutManager *)self itemsForIndex];
  double v15 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
  double v16 = [v14 objectForKeyedSubscript:v15];

  a5->location = [v16 columnRange];
  a5->length = v17;
  a6->location = [v16 row];
  a6->length = 1;
  *a7 = 0;
  double v18 = [(TLKGridLayoutManager *)self verticalRowAlignments];
  uint64_t v19 = objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v16, "row"));
  *a8 = [v19 unsignedIntegerValue];

  return v16;
}

- (int64_t)effectiveUserInterfaceLayoutDirection
{
  v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  int64_t v3 = [v2 userInterfaceLayoutDirection];

  return v3;
}

- (int64_t)numberOfItemsInGridArrangement:(id)a3
{
  int64_t v3 = [(TLKGridLayoutManager *)self itemsForIndex];
  int64_t v4 = [v3 count];

  return v4;
}

- (CGSize)contentLayoutSizeFittingSize:(CGSize)a3 forArrangedSubview:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = a4;
  long long v18 = *MEMORY[0x1E4F1DB30];
  double v7 = [v6 sizeCache];
  int v8 = objc_msgSend(v7, "getSize:forTargetSize:isSizeDependentOnPerpendicularAxis:", &v18, objc_msgSend(v6, "isLayoutSizeDependentOnPerpendicularAxis"), width, height);

  if (v8)
  {
    double v9 = *((double *)&v18 + 1);
    double v10 = *(double *)&v18;
  }
  else
  {
    objc_msgSend(v6, "sizeForTargetSize:", width, height);
    double v10 = v11;
    double v9 = v12;
    +[TLKLabelItem minimumWidthForLabelItem];
    if (v10 < v13)
    {
      +[TLKLabelItem minimumWidthForLabelItem];
      double v10 = v14;
    }
    double v15 = [v6 sizeCache];
    objc_msgSend(v15, "insertSize:forTargetSize:", v10, v9, width, height);
  }
  double v16 = v10;
  double v17 = v9;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (double)gridArrangement:(id)a3 widthOfColumnAtIndex:(int64_t)a4 spacingAfter:(double *)a5
{
  int v8 = [(TLKGridLayoutManager *)self spacings];
  double v9 = [v8 objectAtIndexedSubscript:a4];
  [v9 floatValue];
  *a5 = v10;

  if ([(TLKGridLayoutManager *)self hasManyTrailingColumns]
    && [(TLKGridLayoutManager *)self indexForFirstTrailingColumn] <= a4)
  {
    +[TLKLabelItem minimumWidthForLabelItem];
  }
  else
  {
    if ([(TLKGridLayoutManager *)self totalEqualColumns] < 1) {
      return *MEMORY[0x1E4F4BEC8];
    }
    if ([(TLKGridLayoutManager *)self indexForFirstTrailingColumn] > a4) {
      return *MEMORY[0x1E4F4BEC8];
    }
    int64_t v11 = [(TLKGridLayoutManager *)self indexForFirstTrailingColumn];
    if ([(TLKGridLayoutManager *)self totalEqualColumns] + v11 <= a4) {
      return *MEMORY[0x1E4F4BEC8];
    }
    [(TLKGridLayoutManager *)self widthOfEqualFillColumns];
    if (v12 == 0.0)
    {
      return *MEMORY[0x1E4F4BEC8];
    }
    else
    {
      [(TLKGridLayoutManager *)self widthOfEqualFillColumns];
    }
  }
  return result;
}

- (id)spacingsForAlignments:(id)a3 firstValidDataRow:(id)a4
{
  id v6 = a3;
  id v26 = a4;
  double v7 = objc_opt_new();
  if ([v6 count] != 1)
  {
    unint64_t v8 = 0;
    unint64_t v9 = 0x1E4F28000uLL;
    id v25 = v6;
    do
    {
      unint64_t v10 = v8 + 1;
      if (v8 >= [(TLKGridLayoutManager *)self indexForFirstTrailingColumn])
      {
        -[TLKGridLayoutManager trailingSectionSpacingBasedOnTotalViewsInSection:](self, "trailingSectionSpacingBasedOnTotalViewsInSection:", [v6 count]- -[TLKGridLayoutManager indexForFirstTrailingColumn](self, "indexForFirstTrailingColumn"));
        double v21 = v22;
      }
      else
      {
        int64_t v11 = v7;
        unint64_t v12 = v9;
        uint64_t v13 = objc_opt_class();
        double v14 = [v26 data];
        double v15 = [v14 objectAtIndexedSubscript:v8];
        double v16 = [v26 data];
        double v17 = [v16 objectAtIndexedSubscript:v8 + 1];
        BOOL v18 = [(TLKGridLayoutManager *)self allEqualColumns];
        uint64_t v19 = (void *)v13;
        unint64_t v9 = v12;
        double v7 = v11;
        id v6 = v25;
        [v19 leadingSectionSpacingForView:v15 view2:v17 index:v8 alignmentSchema:v25 allEqual:v18];
        double v21 = v20;
      }
      unint64_t v23 = [*(id *)(v9 + 3792) numberWithInteger:(unint64_t)v21];
      [v7 addObject:v23];

      ++v8;
    }
    while (v10 < [v6 count] - 1);
  }
  [v7 addObject:&unk_1F0965BF0];

  return v7;
}

- (BOOL)allEqualColumns
{
  if ([(TLKGridLayoutManager *)self totalEqualColumns] < 1) {
    return 0;
  }
  int64_t v3 = [(TLKGridLayoutManager *)self totalEqualColumns];
  return v3 == [(TLKGridLayoutManager *)self numberOfColumns];
}

- (int64_t)numberOfColumns
{
  v2 = [(TLKGridLayoutManager *)self itemsForRows];
  int64_t v3 = [v2 firstObject];
  int64_t v4 = [v3 count];

  return v4;
}

- (double)trailingSectionSpacingBasedOnTotalViewsInSection:(int64_t)a3
{
  double result = 1.0;
  double v4 = 10.0;
  double v5 = 17.0;
  if ((unint64_t)a3 > 2) {
    double v5 = 14.0;
  }
  if ((unint64_t)a3 <= 5) {
    double v4 = v5;
  }
  if ((unint64_t)a3 <= 9) {
    return v4;
  }
  return result;
}

+ (double)leadingSectionSpacingForView:(id)a3 view2:(id)a4 index:(unint64_t)a5 alignmentSchema:(id)a6 allEqual:(BOOL)a7
{
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  double v14 = [v13 formattedTextItems];
  double v15 = [v14 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  double v17 = [v12 formattedTextItems];
  BOOL v18 = [v17 firstObject];
  objc_opt_class();
  char v19 = objc_opt_isKindOfClass();

  double v20 = [v13 formattedTextItems];

  double v21 = [v20 firstObject];
  objc_opt_class();
  char v22 = objc_opt_isKindOfClass();

  unint64_t v23 = [v12 formattedTextItems];

  unint64_t v24 = [v23 firstObject];
  objc_opt_class();
  char v25 = objc_opt_isKindOfClass();

  if (v22)
  {
    id v26 = [v11 objectAtIndexedSubscript:a5];
    BOOL v27 = [v26 textAlignment] != 1;

    if ((v25 & 1) == 0) {
      goto LABEL_3;
    }
  }
  else
  {
    BOOL v27 = 1;
    if ((v25 & 1) == 0)
    {
LABEL_3:
      BOOL v28 = 1;
      if ((v22 & 1) == 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v32 = [v11 objectAtIndexedSubscript:a5];
      BOOL v29 = [v32 textAlignment] != 0;

      if ((v25 & 1) == 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v33 = [v11 objectAtIndexedSubscript:a5 + 1];
      BOOL v30 = [v33 textAlignment] != 0;

      goto LABEL_10;
    }
  }
  uint64_t v31 = [v11 objectAtIndexedSubscript:a5 + 1];
  BOOL v28 = [v31 textAlignment] != 1;

  if (v22) {
    goto LABEL_8;
  }
LABEL_4:
  BOOL v29 = 1;
  if (v25) {
    goto LABEL_9;
  }
LABEL_5:
  BOOL v30 = 1;
LABEL_10:
  double v34 = 1.0;
  if (!a7)
  {
    double v34 = 12.0;
    if (v28 || (isKindOfClass & 1) == 0)
    {
      double v34 = 14.0;
      if (v27 || v30)
      {
        if (v29 || (v19 & 1) == 0) {
          double v34 = 8.0;
        }
        else {
          double v34 = 20.0;
        }
      }
    }
  }

  return v34;
}

+ (id)computeTruncationForAlignments:(id)a3 indexForFirstTrailingColumn:(unint64_t)a4 totalEqualColumns:(unint64_t)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [v7 count];
  v28[0] = v28;
  uint64_t v10 = MEMORY[0x1F4188790](v8, v9);
  id v12 = (char *)v28 - v11;
  if (v10)
  {
    unint64_t v13 = a4 - 1;
    double v14 = (void *)((char *)v28 - v11);
    uint64_t v15 = v8;
    do
    {
      uint64_t v16 = 0x406F400000000000;
      if (v13) {
        uint64_t v16 = qword_1B08D39C0[(unint64_t)objc_msgSend(v7, "count", 250.0) < 0xA];
      }
      *v14++ = v16;
      --v13;
      --v15;
    }
    while (v15);
  }
  if ([v7 count] - 2 != a4)
  {
    BOOL v17 = 0;
    if (v8) {
      goto LABEL_8;
    }
LABEL_29:
    unint64_t v24 = objc_opt_new();
    goto LABEL_30;
  }
  BOOL v17 = (unint64_t)[v7 count] < 4;
  if (!v8) {
    goto LABEL_29;
  }
LABEL_8:
  unint64_t v18 = 0;
  uint64_t v19 = v8 - 1;
  if (v17) {
    double v20 = 751.0;
  }
  else {
    double v20 = 1000.0;
  }
  do
  {
    if (!a4 && v18 == 1) {
      *((void *)v12 + 1) = 0x408F400000000000;
    }
    if (v17)
    {
      uint64_t v21 = [v7 count] - 2;
      uint64_t v22 = 0x408F400000000000;
      if (v18 == v21 || (v23 = objc_msgSend(v7, "count", 1000.0) - 1, uint64_t v22 = 0x406F400000000000, v18 == v23)) {
        *(void *)&v12[8 * v18] = v22;
      }
    }
    if (a5 && v18 >= a4 && v18 - a4 < a5) {
      *(void *)&v12[8 * v18] = 0x408F400000000000;
    }
    if (v19 == v18) {
      *(double *)&v12[8 * v19] = v20;
    }
    ++v18;
  }
  while (v8 != v18);
  unint64_t v24 = objc_opt_new();
  do
  {
    double v25 = *(double *)v12;
    v12 += 8;
    id v26 = [MEMORY[0x1E4F28ED0] numberWithInteger:(uint64_t)v25];
    [v24 addObject:v26];

    --v8;
  }
  while (v8);
LABEL_30:

  return v24;
}

- (BOOL)hasManyTrailingColumns
{
  int64_t v3 = [(TLKGridLayoutManager *)self itemsForRows];
  double v4 = [v3 firstObject];
  uint64_t v5 = [v4 count];
  unint64_t v6 = v5 - [(TLKGridLayoutManager *)self indexForFirstTrailingColumn];

  return [(TLKGridLayoutManager *)self indexForFirstTrailingColumn] == 1 && v6 > 9;
}

+ (id)font
{
  return +[TLKLabelItem font];
}

- (NSString)description
{
  int64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TLKGridLayoutManager;
  double v4 = [(TLKGridLayoutManager *)&v8 description];
  uint64_t v5 = [(TLKGridLayoutManager *)self itemsForRows];
  unint64_t v6 = [v3 stringWithFormat:@"manager- %@,rows %@", v4, v5];

  return (NSString *)v6;
}

- (NSDictionary)itemsForIndex
{
  return self->_itemsForIndex;
}

- (void)setItemsForIndex:(id)a3
{
}

- (NSArray)itemsForRows
{
  return self->_itemsForRows;
}

- (void)setItemsForRows:(id)a3
{
}

- (NSMapTable)itemToRowMapping
{
  return self->_itemToRowMapping;
}

- (void)setItemToRowMapping:(id)a3
{
}

- (NUIGridArrangement)gridArrangement
{
  return self->_gridArrangement;
}

- (void)setGridArrangement:(id)a3
{
}

- (CGSize)cachedFittingSize
{
  double width = self->_cachedFittingSize.width;
  double height = self->_cachedFittingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCachedFittingSize:(CGSize)a3
{
  self->_cachedFittingSize = a3;
}

- (CGSize)cachedGridSize
{
  double width = self->_cachedGridSize.width;
  double height = self->_cachedGridSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCachedGridSize:(CGSize)a3
{
  self->_cachedGridSize = a3;
}

- (int64_t)indexForFirstTrailingColumn
{
  return self->_indexForFirstTrailingColumn;
}

- (void)setIndexForFirstTrailingColumn:(int64_t)a3
{
  self->_indexForFirstTrailingColumn = a3;
}

- (int64_t)totalEqualColumns
{
  return self->_totalEqualColumns;
}

- (void)setTotalEqualColumns:(int64_t)a3
{
  self->_totalEqualColumns = a3;
}

- (NSArray)spacings
{
  return self->_spacings;
}

- (void)setSpacings:(id)a3
{
}

- (double)widthOfEqualFillColumns
{
  return self->_widthOfEqualFillColumns;
}

- (void)setWidthOfEqualFillColumns:(double)a3
{
  self->_widthOfEqualFillColumns = a3;
}

- (NSArray)alignments
{
  return self->_alignments;
}

- (void)setAlignments:(id)a3
{
}

- (NSArray)verticalRowAlignments
{
  return self->_verticalRowAlignments;
}

- (void)setVerticalRowAlignments:(id)a3
{
}

- (BOOL)tableContainsRowHeaders
{
  return self->_tableContainsRowHeaders;
}

- (void)setTableContainsRowHeaders:(BOOL)a3
{
  self->_tableContainsRowHeaders = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalRowAlignments, 0);
  objc_storeStrong((id *)&self->_alignments, 0);
  objc_storeStrong((id *)&self->_spacings, 0);
  objc_storeStrong((id *)&self->_gridArrangement, 0);
  objc_storeStrong((id *)&self->_itemToRowMapping, 0);
  objc_storeStrong((id *)&self->_itemsForRows, 0);
  objc_storeStrong((id *)&self->_itemsForIndex, 0);
}

@end