@interface CHPCategoryAndSeriesReordering
- (BOOL)isObjectSupported:(id)a3;
- (BOOL)isObjectSupportedForSeriesReorderingPreprocessor:(id)a3 isCategoryOrderReversed:(BOOL)a4;
- (int64_t)reorderDataValues:(id)a3 dataPointCount:(unint64_t)a4;
- (void)applyCategoryReorderingPreprocessor:(id)a3;
- (void)applyProcessorToObject:(id)a3 sheet:(id)a4;
- (void)applySeriesReorderingPreprocessor:(id)a3;
- (void)reorderCategoryAndSeries:(id)a3 sheet:(id)a4 clearAxisReversedFlag:(BOOL)a5;
- (void)reorderData:(id)a3 dataPointCount:(unint64_t)a4 byRow:(BOOL)a5;
- (void)reorderDataFormula:(id)a3 dataPointCount:(unint64_t)a4 byRow:(BOOL)a5;
- (void)reorderSeriesCategory:(id)a3 dataPointCount:(unint64_t)a4 byRow:(BOOL)a5;
- (void)reorderValueProperties:(id)a3 dataPointCount:(unint64_t)a4;
@end

@implementation CHPCategoryAndSeriesReordering

- (BOOL)isObjectSupported:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = v3;
    v5 = [v4 seriesCollection];
    v6 = v5;
    if (v5 && [v5 count])
    {
      objc_opt_class();
      char v7 = objc_opt_isKindOfClass() ^ 1;
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

- (void)applyProcessorToObject:(id)a3 sheet:(id)a4
{
}

- (void)reorderCategoryAndSeries:(id)a3 sheet:(id)a4 clearAxisReversedFlag:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a3;
  char v7 = [v10 chart];
  v8 = [v7 plotArea];
  uint64_t v9 = [v8 isCategoryAxesReversed:v5];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!v9) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (v9 == [v10 isColumn]) {
LABEL_5:
  }
    [(CHPCategoryAndSeriesReordering *)self applyCategoryReorderingPreprocessor:v10];
LABEL_6:
  if ([(CHPCategoryAndSeriesReordering *)self isObjectSupportedForSeriesReorderingPreprocessor:v10 isCategoryOrderReversed:v9])
  {
    [(CHPCategoryAndSeriesReordering *)self applySeriesReorderingPreprocessor:v10];
  }
}

- (BOOL)isObjectSupportedForSeriesReorderingPreprocessor:(id)a3 isCategoryOrderReversed:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [v5 seriesCollection];
  unint64_t v7 = [v6 count];

  if (v7 < 2) {
    goto LABEL_2;
  }
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_23;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && ![v5 isColumn]
        || ([(id)objc_opt_class() is3DType] & 1) != 0)
      {
        goto LABEL_2;
      }
LABEL_19:
      LOBYTE(v8) = 1;
      goto LABEL_24;
    }
    if ([v5 isColumn])
    {
LABEL_23:
      int v8 = [v5 isGroupingStacked] ^ 1;
      goto LABEL_24;
    }
LABEL_2:
    LOBYTE(v8) = 0;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = objc_opt_class();
      if (v10 != objc_opt_class()) {
        goto LABEL_23;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_19;
    }
    goto LABEL_2;
  }
  id v9 = v5;
  if ([v9 isColumn]) {
    LOBYTE(v8) = 0;
  }
  else {
    int v8 = [v9 isGroupingStacked] ^ 1;
  }

LABEL_24:
  return v8;
}

- (void)applyCategoryReorderingPreprocessor:(id)a3
{
  id v17 = a3;
  BOOL v4 = [v17 seriesCollection];
  unint64_t v5 = [v4 count];
  if (v5)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      int v8 = [v4 objectAtIndex:v6];
      id v9 = [v8 valueData];
      unint64_t v10 = [v9 countOfCellsBeingReferenced];

      if (v10 > v7) {
        unint64_t v7 = v10;
      }

      ++v6;
    }
    while (v5 != v6);
  }
  else
  {
    unint64_t v7 = 0;
  }
  v11 = [v17 chart];
  int v12 = [v11 direction];

  if (v5)
  {
    uint64_t v13 = 0;
    unsigned int v14 = 1;
    do
    {
      v15 = [v4 objectAtIndex:v13];
      [(CHPCategoryAndSeriesReordering *)self reorderSeriesCategory:v15 dataPointCount:v7 byRow:v12 != 2];

      uint64_t v13 = v14;
    }
    while (v5 > v14++);
  }
}

- (void)reorderSeriesCategory:(id)a3 dataPointCount:(unint64_t)a4 byRow:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a3;
  if (a4 >= 2)
  {
    int v8 = [v10 valueData];
    [(CHPCategoryAndSeriesReordering *)self reorderData:v8 dataPointCount:a4 byRow:v5];

    id v9 = [v10 categoryData];
    [(CHPCategoryAndSeriesReordering *)self reorderData:v9 dataPointCount:a4 byRow:v5];

    [(CHPCategoryAndSeriesReordering *)self reorderValueProperties:v10 dataPointCount:a4];
  }
}

- (void)reorderData:(id)a3 dataPointCount:(unint64_t)a4 byRow:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  if (([v11 isEmpty] & 1) == 0)
  {
    uint64_t v8 = [v11 dataValueIndexCount];
    id v9 = [v11 dataValues];
    int64_t v10 = [(CHPCategoryAndSeriesReordering *)self reorderDataValues:v9 dataPointCount:a4];

    if (v8 <= v10) {
      [v11 setDataValueIndexCount:v10 + 1];
    }
    [(CHPCategoryAndSeriesReordering *)self reorderDataFormula:v11 dataPointCount:a4 byRow:v5];
  }
}

- (int64_t)reorderDataValues:(id)a3 dataPointCount:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 count];
    if (v7)
    {
      uint64_t v8 = 0;
      int64_t v9 = -1;
      do
      {
        int64_t v10 = (int64_t *)[v6 dataPointAtIndex:v8];
        if (v10)
        {
          int64_t v11 = ~*v10 + a4;
          if (v11 > v9) {
            int64_t v9 = ~*v10 + a4;
          }
          *int64_t v10 = v11;
        }
        ++v8;
      }
      while (v7 != v8);
    }
    else
    {
      int64_t v9 = -1;
    }
    [v6 finishReading];
  }
  else
  {
    int64_t v9 = -1;
  }

  return v9;
}

- (void)reorderDataFormula:(id)a3 dataPointCount:(unint64_t)a4 byRow:(BOOL)a5
{
  BOOL v5 = a5;
  id v13 = a3;
  uint64_t v8 = [v13 formula];
  int64_t v9 = [v8 references];
  int64_t v10 = [v9 reverseReferencesByRow:v5];

  if (v10)
  {
    while ([v10 count] > a4)
      [v10 removeObjectAtIndex:0];
    int64_t v11 = +[CHDFormula formulaWithReferences:v10];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super.mWorkbook);
    [v11 setWorkbook:WeakRetained];

    [v11 prepareTokens];
    [v11 setCleaned:1];
    [v13 setFormula:v11 chart:0];
  }
}

- (void)reorderValueProperties:(id)a3 dataPointCount:(unint64_t)a4
{
  id v10 = a3;
  BOOL v5 = [v10 dataValuePropertiesCollection];
  uint64_t v6 = +[EDCollection collection];
  uint64_t v7 = [v5 count];
  if (v7)
  {
    uint64_t v8 = v7 - 1;
    do
    {
      int64_t v9 = [v5 objectAtIndex:v8];
      objc_msgSend(v9, "setDataValueIndex:", ~objc_msgSend(v9, "dataValueIndex") + a4);
      [v6 addObject:v9];
      [v5 removeObjectAtIndex:v8];

      --v8;
    }
    while (v8 != -1);
  }
  [v10 setDataValuePropertiesCollection:v6];
}

- (void)applySeriesReorderingPreprocessor:(id)a3
{
  id v19 = a3;
  id v3 = [v19 seriesCollection];
  BOOL v4 = [v19 chart];
  BOOL v5 = +[CHDSeriesCollection seriesCollectionWithChart:v4];

  uint64_t v6 = [v3 count];
  uint64_t v7 = v6 - 1;
  if (v6)
  {
    uint64_t v8 = v6 - 1;
    do
    {
      int64_t v9 = [v3 objectAtIndex:v8];
      objc_msgSend(v9, "setOrder:", v7 - objc_msgSend(v9, "order"));
      [v5 addObject:v9];
      [v3 removeObjectAtIndex:v8];

      --v8;
    }
    while (v8 != -1);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v10 = [v5 objectAtIndex:0];
      int64_t v11 = [v10 categoryData];
      if (v11)
      {
        int v12 = [v10 categoryData];
        id v13 = [v12 formula];

        if (!v13)
        {
          unsigned int v14 = [v5 objectAtIndex:v7];
          v15 = [v14 categoryData];
          if (v15)
          {
            v16 = [v14 categoryData];
            id v17 = [v16 formula];

            if (v17)
            {
              v18 = [v14 categoryData];
              [v10 setCategoryData:v18];

              [v14 setCategoryData:0];
            }
          }
        }
      }
    }
  }
  [v19 setSeriesCollection:v5];
}

@end