@interface TLKGridRowView
+ (void)updateLabel:(id)a3 withRichText:(id)a4 alignment:(int64_t)a5;
- (BOOL)isLayoutSizeDependentOnPerpendicularAxis;
- (BOOL)needsSizingPass;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSMutableArray)currentListOfViews;
- (NSMutableArray)imageViews;
- (NSMutableArray)labels;
- (TLKGridLayoutManager)manager;
- (TLKGridRowView)init;
- (TLKTableRow)tableRow;
- (id)leadingTextView;
- (unint64_t)indexOfFirstCenteredColumnForForcedCentering;
- (unint64_t)indexOfFirstTrailingColumn;
- (void)generateLabelsAndImagesIfNecessary;
- (void)layoutSubviews;
- (void)observedPropertiesChanged;
- (void)resetStateOfAllViews;
- (void)setCurrentListOfViews:(id)a3;
- (void)setImageViews:(id)a3;
- (void)setIndexOfFirstCenteredColumnForForcedCentering:(unint64_t)a3;
- (void)setIndexOfFirstTrailingColumn:(unint64_t)a3;
- (void)setLabels:(id)a3;
- (void)setManager:(id)a3;
- (void)setNeedsSizingPass:(BOOL)a3;
- (void)setTableRow:(id)a3;
@end

@implementation TLKGridRowView

- (TLKGridRowView)init
{
  v10.receiver = self;
  v10.super_class = (Class)TLKGridRowView;
  v2 = [(TLKView *)&v10 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(TLKGridRowView *)v2 setLabels:v3];

    v4 = objc_opt_new();
    [(TLKGridRowView *)v2 setImageViews:v4];

    v5 = objc_opt_new();
    [(TLKGridRowView *)v2 setCurrentListOfViews:v5];

    +[TLKUtilities standardTableCellContentInset];
    double v7 = v6;
    +[TLKUtilities standardTableCellContentInset];
    -[TLKGridRowView setLayoutMargins:](v2, "setLayoutMargins:", 12.0, v7, 12.0, v8);
  }
  return v2;
}

- (id)leadingTextView
{
  v2 = [(TLKGridRowView *)self currentListOfViews];
  if ((unint64_t)[v2 count] < 2)
  {
    v4 = 0;
  }
  else
  {
    v3 = [v2 objectAtIndexedSubscript:0];
    objc_opt_class();
    v4 = 0;
    if (objc_opt_isKindOfClass())
    {
      v5 = [v2 objectAtIndexedSubscript:1];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v4 = [v2 objectAtIndexedSubscript:1];
      }
      else
      {
        v4 = 0;
      }
    }
  }

  return v4;
}

- (void)setManager:(id)a3
{
  objc_super v10 = (TLKGridLayoutManager *)a3;
  if (self->_manager != v10)
  {
    objc_storeStrong((id *)&self->_manager, a3);
    uint64_t v5 = [(TLKView *)self observer];
    if (v5)
    {
      double v6 = (void *)v5;
      double v7 = [(TLKView *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        v9 = [(TLKView *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)setTableRow:(id)a3
{
  objc_super v10 = (TLKTableRow *)a3;
  if (self->_tableRow != v10)
  {
    objc_storeStrong((id *)&self->_tableRow, a3);
    uint64_t v5 = [(TLKView *)self observer];
    if (v5)
    {
      double v6 = (void *)v5;
      double v7 = [(TLKView *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        v9 = [(TLKView *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (CGSize)intrinsicContentSize
{
  -[TLKGridRowView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  return 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  [(TLKGridRowView *)self layoutMargins];
  double v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;
  v24.origin.x = 0.0;
  v24.origin.y = 0.0;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  CGRect v25 = CGRectInset(v24, v9, 0.0);
  double v12 = v25.size.width;
  double v13 = v25.size.height;
  double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  uint64_t v15 = [(TLKGridRowView *)self tableRow];
  if (v15)
  {
    v16 = (void *)v15;
    v17 = [(TLKGridRowView *)self manager];

    if (v17)
    {
      v18 = [(TLKGridRowView *)self manager];
      v19 = [(TLKGridRowView *)self tableRow];
      objc_msgSend(v18, "sizeForFittingSize:forRow:", v19, v12, v13);
      double v14 = v20;
    }
  }
  [(TLKGridRowView *)self setNeedsSizingPass:0];
  double v21 = v12;
  double v22 = v11 + v7 + v14;
  result.CGFloat height = v22;
  result.CGFloat width = v21;
  return result;
}

- (void)layoutSubviews
{
  v73.receiver = self;
  v73.super_class = (Class)TLKGridRowView;
  [(TLKView *)&v73 layoutSubviews];
  [(TLKGridRowView *)self layoutMargins];
  uint64_t v4 = v3;
  CGFloat v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  [(TLKGridRowView *)self bounds];
  CGFloat v12 = v11;
  [(TLKGridRowView *)self bounds];
  v74.origin.x = 0.0;
  v74.origin.y = 0.0;
  v74.size.double width = v12;
  CGRect v75 = CGRectInset(v74, v6, 0.0);
  double width = v75.size.width;
  double height = v75.size.height;
  uint64_t v15 = [(TLKGridRowView *)self tableRow];
  if (!v15) {
    goto LABEL_6;
  }
  v16 = (void *)v15;
  uint64_t v17 = [(TLKGridRowView *)self manager];
  if (v17)
  {
    v18 = (void *)v17;
    BOOL v19 = [(TLKGridRowView *)self needsSizingPass];

    if (!v19) {
      goto LABEL_6;
    }
    v16 = [(TLKGridRowView *)self manager];
    double v20 = [(TLKGridRowView *)self tableRow];
    objc_msgSend(v16, "sizeForFittingSize:forRow:", v20, width, height);
  }
LABEL_6:
  if (width != *MEMORY[0x1E4F1DB30] || height != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double v22 = [(TLKGridRowView *)self manager];
    v23 = [(TLKGridRowView *)self tableRow];
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __32__TLKGridRowView_layoutSubviews__block_invoke;
    v72[3] = &unk_1E5FD31D0;
    v72[5] = v4;
    *(CGFloat *)&v72[6] = v6;
    v72[7] = v8;
    v72[8] = v10;
    v72[4] = self;
    objc_msgSend(v22, "placeViewsForSize:forRow:completion:", v23, v72, width, height);

    BOOL v24 = +[TLKLayoutUtilities isLTR];
    if ([(TLKGridRowView *)self indexOfFirstCenteredColumnForForcedCentering])
    {
      unint64_t v25 = [(TLKGridRowView *)self indexOfFirstCenteredColumnForForcedCentering];
      v26 = [(TLKGridRowView *)self currentListOfViews];
      unint64_t v27 = [v26 count];

      if (v25 < v27)
      {
        unint64_t v28 = [(TLKGridRowView *)self indexOfFirstCenteredColumnForForcedCentering];
        [(TLKGridRowView *)self bounds];
        double v30 = v29;
        double v32 = v31;
        v33 = [(TLKGridRowView *)self currentListOfViews];
        v34 = [v33 objectAtIndexedSubscript:v28];
        [v34 frame];
        double v36 = v35;
        double v38 = v37;

        +[TLKLayoutUtilities deviceScaledRoundedValue:self forView:(v30 - v36) * 0.5];
        double v40 = v39;
        +[TLKLayoutUtilities deviceScaledRoundedValue:self forView:(v32 - v38) * 0.5];
        double v42 = v41;
        v43 = [(TLKGridRowView *)self currentListOfViews];
        v44 = [v43 objectAtIndexedSubscript:v28];
        objc_msgSend(v44, "setFrame:", v40, v42, v36, v38);

        unint64_t v45 = v28 + 1;
        if (v45 < [(TLKGridRowView *)self indexOfFirstTrailingColumn])
        {
          if (v24)
          {
            v76.origin.x = v40;
            v76.origin.y = v42;
            v76.size.double width = v36;
            v76.size.double height = v38;
            double MaxX = CGRectGetMaxX(v76);
            v47 = [(TLKGridRowView *)self currentListOfViews];
            v48 = objc_msgSend(v47, "objectAtIndexedSubscript:", -[TLKGridRowView indexOfFirstTrailingColumn](self, "indexOfFirstTrailingColumn"));
            [v48 frame];
            double MinX = v49;
          }
          else
          {
            v51 = [(TLKGridRowView *)self currentListOfViews];
            v52 = objc_msgSend(v51, "objectAtIndexedSubscript:", -[TLKGridRowView indexOfFirstTrailingColumn](self, "indexOfFirstTrailingColumn"));
            [v52 frame];
            double MaxX = CGRectGetMaxX(v77);

            v78.origin.x = v40;
            v78.origin.y = v42;
            v78.size.double width = v36;
            v78.size.double height = v38;
            double MinX = CGRectGetMinX(v78);
            v47 = [(TLKGridRowView *)self currentListOfViews];
            v48 = objc_msgSend(v47, "objectAtIndexedSubscript:", -[TLKGridRowView indexOfFirstTrailingColumn](self, "indexOfFirstTrailingColumn"));
            [v48 frame];
            double v40 = v53;
            double v42 = v54;
            double v36 = v55;
            double v38 = v56;
          }
          v79.origin.x = v40;
          v79.origin.y = v42;
          v79.size.double width = v36;
          v79.size.double height = v38;
          double v57 = MinX - CGRectGetMaxX(v79);

          v58 = [(TLKGridRowView *)self currentListOfViews];
          v59 = [v58 objectAtIndexedSubscript:v45];
          [v59 frame];
          double v61 = v60;
          double v63 = v62;

          v64 = [(TLKGridRowView *)self currentListOfViews];
          v65 = [v64 objectAtIndexedSubscript:v45];
          objc_msgSend(v65, "setFrame:", MaxX + 10.0, v61, v57 + -20.0, v63);

          v66 = [(TLKGridRowView *)self currentListOfViews];
          v67 = [v66 objectAtIndexedSubscript:v45];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v69 = [(TLKGridRowView *)self currentListOfViews];
            v70 = [v69 objectAtIndexedSubscript:v45];

            v71 = +[TLKFontUtilities preferredFontForTextStyle:*MEMORY[0x1E4FB28F0] maximumContentSizeCategory:*MEMORY[0x1E4FB27B0]];
            [v70 setFont:v71];

            [v70 setTextAlignment:4];
          }
        }
      }
    }
  }
}

void __32__TLKGridRowView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  id v17 = a2;
  if ([v17 count])
  {
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = [v17 objectAtIndexedSubscript:v3];
      [v4 frame];
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;

      double v13 = v6 + *(double *)(a1 + 48);
      if (fabs(v13) != INFINITY)
      {
        double v14 = v8 + *(double *)(a1 + 40);
        if (fabs(v14) != INFINITY && fabs(v10) != INFINITY && fabs(v12) != INFINITY)
        {
          uint64_t v15 = [*(id *)(a1 + 32) currentListOfViews];
          v16 = [v15 objectAtIndexedSubscript:v3];
          objc_msgSend(v16, "setFrame:", v13, v14, v10, v12);
        }
      }
      ++v3;
    }
    while (v3 < [v17 count]);
  }
}

- (void)observedPropertiesChanged
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(TLKGridRowView *)self manager];
  if (!v4) {
    return;
  }
  double v5 = (void *)v4;
  double v6 = [(TLKGridRowView *)self tableRow];

  if (!v6) {
    return;
  }
  [(TLKGridRowView *)self resetStateOfAllViews];
  [(TLKGridRowView *)self generateLabelsAndImagesIfNecessary];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = [(TLKGridRowView *)self labels];
  uint64_t v7 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (!v7) {
    goto LABEL_16;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v59;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v59 != v9) {
        objc_enumerationMutation(obj);
      }
      double v11 = *(void **)(*((void *)&v58 + 1) + 8 * v10);
      double v12 = [(TLKGridRowView *)self tableRow];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass)
      {
        double v2 = [(TLKGridRowView *)self manager];
        if (([v2 tableContainsRowHeaders] & 1) == 0)
        {
          [v11 setProminence:1];
LABEL_13:

          goto LABEL_14;
        }
      }
      double v14 = [(TLKGridRowView *)self tableRow];
      objc_msgSend(v11, "setProminence:", objc_msgSend(v14, "isSubHeader"));

      if (isKindOfClass) {
        goto LABEL_13;
      }
LABEL_14:

      ++v10;
    }
    while (v8 != v10);
    uint64_t v8 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
  }
  while (v8);
LABEL_16:

  uint64_t v15 = [(TLKGridRowView *)self tableRow];
  v16 = [v15 data];

  if ([v16 count])
  {
    unint64_t v17 = 0;
    v18 = 0;
    uint64_t v19 = 0;
    v51 = v16;
    do
    {
      double v20 = objc_msgSend(v16, "objectAtIndexedSubscript:", v17, v51);
      if ([v20 hasOnlyImage])
      {
        double v21 = [v20 formattedTextItems];
        double v22 = [v21 firstObject];

        v23 = [v22 tlkImage];
        BOOL v24 = [(TLKGridRowView *)self imageViews];
        unint64_t v25 = [v24 objectAtIndexedSubscript:v18];
        [v25 setTlkImage:v23];

        v26 = [(TLKGridRowView *)self currentListOfViews];
        unint64_t v27 = [(TLKGridRowView *)self imageViews];
        unint64_t v28 = [v27 objectAtIndexedSubscript:v18];
        [v26 addObject:v28];

        ++v18;
      }
      else if (([v20 hasContent] & 1) != 0 || !v17)
      {
        double v29 = objc_opt_class();
        double v30 = [(TLKGridRowView *)self labels];
        double v31 = [v30 objectAtIndexedSubscript:v19];
        [(TLKGridRowView *)self manager];
        obja = v18;
        v33 = uint64_t v32 = v19;
        v34 = [v33 alignments];
        double v35 = [v34 objectAtIndexedSubscript:v17];
        objc_msgSend(v29, "updateLabel:withRichText:alignment:", v31, v20, objc_msgSend(v35, "dataAlignment"));

        uint64_t v36 = v32;
        v18 = obja;

        v16 = v51;
        double v37 = [(TLKGridRowView *)self currentListOfViews];
        double v38 = [(TLKGridRowView *)self labels];
        double v39 = [v38 objectAtIndexedSubscript:v36];
        [v37 addObject:v39];

        uint64_t v19 = v36 + 1;
      }

      ++v17;
    }
    while (v17 < [v16 count]);
  }
  double v40 = [(TLKGridRowView *)self manager];
  double v41 = [v40 alignments];
  unint64_t v42 = [v41 indexOfObjectPassingTest:&__block_literal_global_1];

  v43 = [(TLKGridRowView *)self manager];
  v44 = [v43 alignments];
  unint64_t v45 = [v44 indexOfObjectPassingTest:&__block_literal_global_11];

  if (v45 < v42 && v45)
  {
    [(TLKGridRowView *)self setIndexOfFirstCenteredColumnForForcedCentering:v45];
    [(TLKGridRowView *)self setIndexOfFirstTrailingColumn:v42];
  }
  else
  {
    [(TLKGridRowView *)self setIndexOfFirstCenteredColumnForForcedCentering:0x7FFFFFFFFFFFFFFFLL];
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v46 = [(TLKGridRowView *)self currentListOfViews];
  uint64_t v47 = [v46 countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v55;
    do
    {
      uint64_t v50 = 0;
      do
      {
        if (*(void *)v55 != v49) {
          objc_enumerationMutation(v46);
        }
        [*(id *)(*((void *)&v54 + 1) + 8 * v50++) setHidden:0];
      }
      while (v48 != v50);
      uint64_t v48 = [v46 countByEnumeratingWithState:&v54 objects:v62 count:16];
    }
    while (v48);
  }

  [(TLKGridRowView *)self invalidateIntrinsicContentSize];
  [(TLKGridRowView *)self setNeedsSizingPass:1];
}

BOOL __43__TLKGridRowView_observedPropertiesChanged__block_invoke(uint64_t a1, void *a2)
{
  return [a2 columnAlignment] == 2;
}

BOOL __43__TLKGridRowView_observedPropertiesChanged__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 columnAlignment] == 1;
}

- (void)resetStateOfAllViews
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unint64_t v3 = [(TLKGridRowView *)self currentListOfViews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        double v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v12 setHidden:1];
        objc_msgSend(v12, "setFrame:", v7, v8, v9, v10);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  double v13 = [(TLKGridRowView *)self currentListOfViews];
  [v13 removeAllObjects];
}

- (void)generateLabelsAndImagesIfNecessary
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  unint64_t v3 = [(TLKGridRowView *)self tableRow];
  uint64_t v4 = [v3 data];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v4);
        }
        double v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v11 hasOnlyImage])
        {
          ++v7;
        }
        else
        {
          unsigned int v12 = [v11 hasContent];
          if (v8) {
            uint64_t v13 = v12;
          }
          else {
            uint64_t v13 = 1;
          }
          v8 += v13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
    unint64_t v8 = 0;
  }

  long long v14 = [(TLKGridRowView *)self labels];
  unint64_t v15 = [v14 count];

  if (v15 < v8)
  {
    do
    {
      long long v16 = objc_opt_new();
      long long v17 = [(TLKGridRowView *)self labels];
      [v17 addObject:v16];

      [(TLKGridRowView *)self addSubview:v16];
      v18 = [(TLKGridRowView *)self labels];
      unint64_t v19 = [v18 count];
    }
    while (v19 < v8);
  }
  double v20 = [(TLKGridRowView *)self imageViews];
  unint64_t v21 = [v20 count];

  if (v21 < v7)
  {
    do
    {
      double v22 = objc_opt_new();
      v23 = +[TLKGridLayoutManager font];
      [v22 setSymbolFont:v23];

      BOOL v24 = [(TLKGridRowView *)self imageViews];
      [v24 addObject:v22];

      [(TLKGridRowView *)self addSubview:v22];
      unint64_t v25 = [(TLKGridRowView *)self imageViews];
      unint64_t v26 = [v25 count];
    }
    while (v26 < v7);
  }
}

+ (void)updateLabel:(id)a3 withRichText:(id)a4 alignment:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__TLKGridRowView_updateLabel_withRichText_alignment___block_invoke;
  v11[3] = &unk_1E5FD3138;
  id v13 = v8;
  int64_t v14 = a5;
  id v12 = v7;
  id v9 = v8;
  id v10 = v7;
  [v10 performBatchUpdates:v11];
}

uint64_t __53__TLKGridRowView_updateLabel_withRichText_alignment___block_invoke(uint64_t a1)
{
  double v2 = +[TLKGridLayoutManager font];
  [*(id *)(a1 + 32) setFont:v2];

  [*(id *)(a1 + 32) setTextAlignment:*(void *)(a1 + 48)];
  unint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return [v3 setRichText:v4];
}

- (TLKGridLayoutManager)manager
{
  return self->_manager;
}

- (TLKTableRow)tableRow
{
  return self->_tableRow;
}

- (NSMutableArray)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
}

- (NSMutableArray)imageViews
{
  return self->_imageViews;
}

- (void)setImageViews:(id)a3
{
}

- (NSMutableArray)currentListOfViews
{
  return self->_currentListOfViews;
}

- (void)setCurrentListOfViews:(id)a3
{
}

- (unint64_t)indexOfFirstCenteredColumnForForcedCentering
{
  return self->_indexOfFirstCenteredColumnForForcedCentering;
}

- (void)setIndexOfFirstCenteredColumnForForcedCentering:(unint64_t)a3
{
  self->_indexOfFirstCenteredColumnForForcedCentering = a3;
}

- (unint64_t)indexOfFirstTrailingColumn
{
  return self->_indexOfFirstTrailingColumn;
}

- (void)setIndexOfFirstTrailingColumn:(unint64_t)a3
{
  self->_indexOfFirstTrailingColumn = a3;
}

- (BOOL)needsSizingPass
{
  return self->_needsSizingPass;
}

- (void)setNeedsSizingPass:(BOOL)a3
{
  self->_needsSizingPass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentListOfViews, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_tableRow, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

@end