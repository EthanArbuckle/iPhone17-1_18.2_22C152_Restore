@interface SearchUITableRowCardView
+ (BOOL)hasOnlyImages:(id)a3;
+ (BOOL)isAHeader:(id)a3;
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
+ (UIEdgeInsets)defaultLayoutMargins;
+ (double)largestImageSizeForSection:(id)a3;
- (UIEdgeInsets)verticalBaselineInsetsForHeader:(BOOL)a3 isCompactTable:(BOOL)a4;
- (UIEdgeInsets)verticalBaselineInsetsForRowsWithCompactTable:(BOOL)a3;
- (id)leadingTextView;
- (id)setupContentView;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUITableRowCardView

- (id)setupContentView
{
  v2 = objc_opt_new();
  return v2;
}

- (id)leadingTextView
{
  v2 = [(SearchUICardSectionView *)self contentView];
  v3 = [v2 leadingTextView];

  return v3;
}

- (void)updateWithRowModel:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)SearchUITableRowCardView;
  [(SearchUICardSectionView *)&v45 updateWithRowModel:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 cardSection];
    v6 = [v4 gridLayoutManager];
    v7 = [(SearchUICardSectionView *)self contentView];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __47__SearchUITableRowCardView_updateWithRowModel___block_invoke;
    v41[3] = &unk_1E6E72938;
    id v8 = v7;
    id v42 = v8;
    id v9 = v6;
    id v43 = v9;
    id v10 = v5;
    id v44 = v10;
    [v8 performBatchUpdates:v41];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || [v10 isSubHeader]) {
      -[SearchUITableRowCardView verticalBaselineInsetsForHeader:isCompactTable:](self, "verticalBaselineInsetsForHeader:isCompactTable:", [v10 isSubHeader], objc_msgSend(v9, "isCompactTable"));
    }
    else {
      -[SearchUITableRowCardView verticalBaselineInsetsForRowsWithCompactTable:](self, "verticalBaselineInsetsForRowsWithCompactTable:", [v9 isCompactTable]);
    }
    double v13 = v11;
    double v14 = v12;
    v15 = [MEMORY[0x1E4FAE0A0] font];
    [MEMORY[0x1E4FAE100] scaledValueForValue:v15 withFont:self view:v13];
    double v16 = 0.0;
    [v10 hasTopPadding];
    [v15 ascender];
    [(SearchUITableRowCardView *)self tlks_scale];
    UICeilToScale();
    double v18 = v17;
    [MEMORY[0x1E4FAE100] scaledValueForValue:v15 withFont:self view:v14];
    [v10 hasBottomPadding];
    [v15 descender];
    [(SearchUITableRowCardView *)self tlks_scale];
    UICeilToScale();
    double v20 = v19;
    v21 = objc_opt_class();
    v22 = [v9 tableRowForTableRowCardSection:v10];
    [v21 largestImageSizeForSection:v22];
    double v24 = v23;

    [v15 ascender];
    double v26 = v25;
    [v15 descender];
    double v28 = v27;
    uint64_t v29 = objc_opt_class();
    v30 = [v9 tableRowForTableRowCardSection:v10];
    LOBYTE(v29) = [(id)v29 hasOnlyImages:v30];

    [(id)objc_opt_class() defaultLayoutMargins];
    double v32 = v31;
    double v34 = v33;
    double v35 = 0.0;
    if ((v29 & 1) == 0)
    {
      double v36 = fmax((v24 - (v26 - v28)) * 0.5, 0.0);
      if (v20 - v36 >= 0.0) {
        double v37 = v20 - v36;
      }
      else {
        double v37 = 7.0;
      }
      double v38 = v18 - v36;
      if (v38 < 0.0) {
        double v38 = 7.0;
      }
      [MEMORY[0x1E4FAE100] deviceScaledRoundedValue:self forView:v38];
      double v16 = v39;
      [MEMORY[0x1E4FAE100] deviceScaledRoundedValue:self forView:v37];
      double v35 = v40;
    }
    objc_msgSend(v8, "setLayoutMargins:", v16, v32, v35, v34);
  }
}

void __47__SearchUITableRowCardView_updateWithRowModel___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 40) gridManager];
  [*(id *)(a1 + 32) setManager:v2];

  id v3 = [*(id *)(a1 + 40) tableRowForTableRowCardSection:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setTableRow:v3];
}

+ (double)largestImageSizeForSection:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = objc_msgSend(a3, "data", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v9 hasOnlyImage])
        {
          id v10 = [v9 formattedTextItems];
          double v11 = [v10 firstObject];

          double v12 = [v11 tlkImage];
          [v12 size];
          double v14 = v13;

          if (v14 >= v7) {
            double v7 = v14;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

+ (BOOL)hasOnlyImages:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = objc_msgSend(a3, "data", 0);
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
        if (![*(id *)(*((void *)&v10 + 1) + 8 * i) hasOnlyImage])
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

- (UIEdgeInsets)verticalBaselineInsetsForRowsWithCompactTable:(BOOL)a3
{
  double v3 = 27.0;
  if (a3) {
    double v3 = 15.0;
  }
  double v4 = 11.0;
  if (!a3) {
    double v4 = 17.0;
  }
  double v5 = 0.0;
  double v6 = 0.0;
  result.right = v6;
  result.bottom = v4;
  result.left = v5;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)verticalBaselineInsetsForHeader:(BOOL)a3 isCompactTable:(BOOL)a4
{
  double v4 = 0.0;
  double v5 = 12.0;
  double v6 = 20.0;
  double v7 = 21.0;
  if (a4) {
    double v7 = 18.0;
  }
  if (a3)
  {
    double v6 = v7;
    double v5 = 10.0;
  }
  double v8 = 0.0;
  result.right = v8;
  result.bottom = v5;
  result.left = v4;
  result.top = v6;
  return result;
}

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

+ (UIEdgeInsets)defaultLayoutMargins
{
  +[SearchUIUtilities standardTableCellContentInset];
  double v3 = v2;
  +[SearchUIUtilities standardTableCellContentInset];
  double v5 = v4;
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = v3;
  result.right = v5;
  result.bottom = v7;
  result.left = v8;
  result.top = v6;
  return result;
}

+ (BOOL)isAHeader:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end