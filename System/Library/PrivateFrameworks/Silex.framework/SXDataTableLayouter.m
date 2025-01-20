@interface SXDataTableLayouter
- (NSMutableDictionary)intendedColumnWidths;
- (NSMutableDictionary)minimumColumnWidths;
- (SXDataTableBlueprint)blueprint;
- (SXDataTableDataSource)dataSource;
- (SXDataTableLayouter)initWithDataSource:(id)a3;
- (UIEdgeInsets)tableInsets;
- (double)currentWidth;
- (double)intendedPercentualWidthForColumnAtIndex:(unint64_t)a3;
- (double)minimumWidthForColumnAtIndex:(unint64_t)a3;
- (double)totalColumnDividerWidth;
- (double)totalTableBorderHeight;
- (double)totalTableBorderWidth;
- (id)blueprintForWidth:(double)a3;
- (id)blueprintUsingRowHeights:(id)a3 columnWidths:(id)a4 andTableWidth:(double)a5;
- (id)columnWidthsForWidth:(double)a3 resultingTableWidth:(double *)a4;
- (id)layoutDataTableForWidth:(double)a3;
- (id)rowHeightsForColumnWidths:(id)a3;
- (void)reset;
- (void)setBlueprint:(id)a3;
- (void)setIntendedColumnWidths:(id)a3;
- (void)setMinimumColumnWidths:(id)a3;
@end

@implementation SXDataTableLayouter

- (SXDataTableLayouter)initWithDataSource:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SXDataTableLayouter;
  v6 = [(SXDataTableLayouter *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    minimumColumnWidths = v7->_minimumColumnWidths;
    v7->_minimumColumnWidths = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    intendedColumnWidths = v7->_intendedColumnWidths;
    v7->_intendedColumnWidths = (NSMutableDictionary *)v10;
  }
  return v7;
}

- (id)blueprintForWidth:(double)a3
{
  if (self->_currentWidth != a3)
  {
    self->_currentWidth = a3;
    v4 = [(SXDataTableLayouter *)self layoutDataTableForWidth:"layoutDataTableForWidth:"];
    [(SXDataTableLayouter *)self setBlueprint:v4];
  }
  return [(SXDataTableLayouter *)self blueprint];
}

- (void)reset
{
  v3 = [(SXDataTableLayouter *)self minimumColumnWidths];
  [v3 removeAllObjects];

  v4 = [(SXDataTableLayouter *)self intendedColumnWidths];
  [v4 removeAllObjects];

  [(SXDataTableLayouter *)self setBlueprint:0];
  self->_currentWidth = 1.79769313e308;
}

- (id)layoutDataTableForWidth:(double)a3
{
  id v5 = [(SXDataTableLayouter *)self dataSource];
  if ([v5 numberOfColumns])
  {
    v6 = [(SXDataTableLayouter *)self dataSource];
    uint64_t v7 = [v6 numberOfRows];

    if (v7)
    {
      [(SXDataTableLayouter *)self totalColumnDividerWidth];
      double v9 = v8;
      [(SXDataTableLayouter *)self totalTableBorderWidth];
      double v11 = v10;
      double v17 = 0.0;
      v12 = [(SXDataTableLayouter *)self columnWidthsForWidth:&v17 resultingTableWidth:a3 - v9 - v10];
      objc_super v13 = [(SXDataTableLayouter *)self rowHeightsForColumnWidths:v12];
      v14 = [(SXDataTableLayouter *)self blueprintUsingRowHeights:v13 columnWidths:v12 andTableWidth:v11 + v9 + v17];
      v15 = [(SXDataTableLayouter *)self dataSource];
      objc_msgSend(v14, "setDataOrientation:", objc_msgSend(v15, "dataOrientation"));

      goto LABEL_6;
    }
  }
  else
  {
  }
  v14 = 0;
LABEL_6:
  return v14;
}

- (id)blueprintUsingRowHeights:(id)a3 columnWidths:(id)a4 andTableWidth:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  [(SXDataTableLayouter *)self tableInsets];
  v74 = v7;
  double v78 = v9;
  double v72 = v10;
  double v70 = v11;
  objc_super v13 = -[SXDataTableBlueprint initWithNumberOfRows:numberOfColumns:withTableInsets:]([SXDataTableBlueprint alloc], "initWithNumberOfRows:numberOfColumns:withTableInsets:", [v7 count], objc_msgSend(v8, "count"), v9, v10, v11, v12);
  v14 = [(SXDataTableLayouter *)self dataSource];
  unint64_t v15 = [v14 numberOfRows];

  v16 = [(SXDataTableLayouter *)self dataSource];
  unint64_t v17 = [v16 numberOfColumns];

  if (v15)
  {
    unint64_t v18 = 0;
    double v73 = (double)v15;
    double v75 = (double)v15 + -1.0;
    double v76 = 0.0;
    do
    {
      v19 = [v74 objectAtIndex:v18];
      [v19 floatValue];
      double v77 = v20;

      v21 = [(SXDataTableLayouter *)self dataSource];
      v22 = [v21 rowDividerAtIndex:v18];

      if (v17)
      {
        unint64_t v23 = 0;
        double v24 = 0.0;
        double v25 = v72;
        do
        {
          v26 = [v8 objectAtIndex:v23];
          [v26 floatValue];
          double v28 = v27;

          -[SXDataTableBlueprint addCellRect:forIndexPath:](v13, "addCellRect:forIndexPath:", v18, v23, v25, v78, v28, v77);
          v29 = [(SXDataTableLayouter *)self dataSource];
          objc_msgSend(v29, "paddingForCellAtIndexPath:", v18, v23);
          double v31 = v30;
          double v33 = v32;
          double v79 = v34;
          double v36 = v35;

          v37 = [(SXDataTableLayouter *)self dataSource];
          v38 = objc_msgSend(v37, "cellBorderForCellAtIndexPath:", v18, v23);

          v39 = [v38 left];
          [v39 width];
          double v41 = v36 + v40;

          v42 = [v38 top];
          [v42 width];
          double v44 = v31 + v43;

          v45 = [v38 right];
          [v45 width];
          double v47 = v28 - v41 - v46 - v33;

          v48 = [v38 bottom];
          [v48 width];
          double v50 = v77 - v44 - v49 - v79;

          -[SXDataTableBlueprint addCellContentRect:forIndexPath:](v13, "addCellContentRect:forIndexPath:", v18, v23, v41, v44, v47, v50);
          v51 = [(SXDataTableLayouter *)self dataSource];
          v52 = [v51 columnDividerAtIndex:v23];

          [v52 width];
          if (v53 != 0.0)
          {
            v54 = [v52 color];
            if (v54)
            {

              double v53 = (double)v17 + -1.0;
              if (v53 != v24)
              {
                v81.origin.x = v25;
                v81.origin.y = v78;
                v81.size.width = v28;
                v81.size.height = v77;
                double MaxX = CGRectGetMaxX(v81);
                v82.origin.x = v25;
                v82.origin.y = v78;
                v82.size.width = v28;
                v82.size.height = v77;
                double MinY = CGRectGetMinY(v82);
                [v52 width];
                double v58 = v57;
                v83.origin.x = v25;
                v83.origin.y = v78;
                v83.size.width = v28;
                v83.size.height = v77;
                -[SXDataTableBlueprint addColumnDividerRect:forIndexPath:](v13, "addColumnDividerRect:forIndexPath:", v18, v23, MaxX, MinY, v58, CGRectGetHeight(v83));
              }
            }
          }
          objc_msgSend(v22, "width", v53);
          if (v59 != 0.0)
          {
            v60 = [v22 color];
            if (v60)
            {

              double v59 = v75;
              if (v75 != v76)
              {
                v84.origin.x = v25;
                v84.origin.y = v78;
                v84.size.width = v28;
                v84.size.height = v77;
                double MinX = CGRectGetMinX(v84);
                v85.origin.x = v25;
                v85.origin.y = v78;
                v85.size.width = v28;
                v85.size.height = v77;
                double MaxY = CGRectGetMaxY(v85);
                v86.origin.x = v25;
                v86.origin.y = v78;
                v86.size.width = v28;
                v86.size.height = v77;
                double Width = CGRectGetWidth(v86);
                [v52 width];
                double v65 = Width + v64;
                [v22 width];
                -[SXDataTableBlueprint addRowDividerRect:forIndexPath:](v13, "addRowDividerRect:forIndexPath:", v18, v23, MinX, MaxY, v65, v66);
              }
            }
          }
          objc_msgSend(v52, "width", v59);
          double v25 = v25 + v67 + v28;

          double v24 = (double)++v23;
        }
        while ((double)v23 < (double)v17);
      }
      [v22 width];
      double v78 = v78 + v68 + v77;

      double v76 = (double)++v18;
    }
    while ((double)v18 < v73);
  }
  [(SXDataTableBlueprint *)v13 rectForColumnAtIndex:0];
  -[SXDataTableBlueprint setTableSize:](v13, "setTableSize:", a5, v70 + CGRectGetMaxY(v87));

  return v13;
}

- (id)columnWidthsForWidth:(double)a3 resultingTableWidth:(double *)a4
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  v6 = [(SXDataTableLayouter *)self dataSource];
  uint64_t v7 = [v6 numberOfColumns];

  if (v7)
  {
    uint64_t v8 = 0;
    double v9 = 0.0;
    double v10 = 0.0;
    do
    {
      [(SXDataTableLayouter *)self minimumWidthForColumnAtIndex:v8];
      double v9 = v9 + v11;
      [(SXDataTableLayouter *)self intendedPercentualWidthForColumnAtIndex:v8];
      double v10 = v10 + v12;
      ++v8;
    }
    while (v7 != v8);
    BOOL v13 = v10 == 0.0;
    if (v10 == 0.0) {
      double v14 = 100.0;
    }
    else {
      double v14 = v10;
    }
    double v15 = 0.0;
    if (v9 <= a3)
    {
      uint64_t v18 = 0;
      unint64_t v17 = v7;
      do
      {
        [(SXDataTableLayouter *)self minimumWidthForColumnAtIndex:v18];
        double v20 = v19;
        if (v10 == 0.0)
        {
          v21 = [(SXDataTableLayouter *)self dataSource];
          double v22 = 100.0 / (double)(unint64_t)[v21 numberOfColumns];
        }
        else
        {
          [(SXDataTableLayouter *)self intendedPercentualWidthForColumnAtIndex:v18];
          double v22 = v23;
        }
        double v24 = v22 / v14 * a3;
        if (v20 > v24)
        {
          double v25 = v20 - v24;
          if (v25 < 0.0) {
            double v25 = 0.0;
          }
          double v15 = v15 + v25;
          --v17;
        }
        ++v18;
      }
      while (v7 != v18);
      BOOL v16 = 0;
      double v9 = a3;
    }
    else
    {
      BOOL v16 = 1;
      unint64_t v17 = v7;
    }
  }
  else
  {
    double v15 = 0.0;
    BOOL v16 = a3 < 0.0;
    double v14 = 100.0;
    BOOL v13 = 1;
    unint64_t v17 = 0;
    if (a3 >= 0.0) {
      double v9 = a3;
    }
    else {
      double v9 = 0.0;
    }
  }
  v26 = [MEMORY[0x263EFF980] array];
  do
  {
    if (v7)
    {
      uint64_t v27 = 0;
      unint64_t v28 = v17;
      while (!v16)
      {
        if ([v26 count] == v7)
        {
          double v30 = [v26 objectAtIndex:v27];
          [v30 floatValue];
          double v32 = v31;
        }
        else
        {
          double v32 = 1.79769313e308;
        }
        if (v13)
        {
          double v33 = [(SXDataTableLayouter *)self dataSource];
          double v34 = 100.0 / (double)(unint64_t)[v33 numberOfColumns];
        }
        else
        {
          [(SXDataTableLayouter *)self intendedPercentualWidthForColumnAtIndex:v27];
          double v34 = v35;
        }
        double v36 = v9 * (v34 / v14);
        [(SXDataTableLayouter *)self minimumWidthForColumnAtIndex:v27];
        if (v36 < v29 && v32 != v29) {
          goto LABEL_47;
        }
        if (v15 <= 0.0 || v32 == v29)
        {
          if (v32 == v29) {
            double v36 = 1.79769313e308;
          }
        }
        else
        {
          if (v32 == 1.79769313e308) {
            double v38 = v36;
          }
          else {
            double v38 = v32;
          }
          double v39 = v38 - v15 / (double)v17;
          BOOL v40 = v29 <= v39;
          uint64_t v41 = v29 > v39;
          double v42 = v38 - v29;
          if (v40) {
            double v42 = v15 / (double)v17;
          }
          v28 -= v41;
          double v36 = v38 - v42;
          double v15 = v15 - v42;
          --v17;
        }
LABEL_48:
        if ([v26 count] == v7 && v36 != 1.79769313e308)
        {
          double v43 = [NSNumber numberWithDouble:v36];
          [v26 replaceObjectAtIndex:v27 withObject:v43];
LABEL_53:

          goto LABEL_54;
        }
        if (v36 != 1.79769313e308)
        {
          double v43 = [NSNumber numberWithDouble:v36];
          [v26 addObject:v43];
          goto LABEL_53;
        }
LABEL_54:
        if (v7 == ++v27) {
          goto LABEL_59;
        }
      }
      [(SXDataTableLayouter *)self minimumWidthForColumnAtIndex:v27];
LABEL_47:
      double v36 = v29;
      goto LABEL_48;
    }
    unint64_t v28 = v17;
LABEL_59:
    unint64_t v17 = v28;
  }
  while (v15 > 0.0);
  *a4 = v9;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v44 = v26;
  uint64_t v45 = [v44 countByEnumeratingWithState:&v60 objects:v64 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v61;
    double v48 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v61 != v47) {
          objc_enumerationMutation(v44);
        }
        [*(id *)(*((void *)&v60 + 1) + 8 * i) doubleValue];
        double v48 = v48 + v50 - floor(v50);
      }
      uint64_t v46 = [v44 countByEnumeratingWithState:&v60 objects:v64 count:16];
    }
    while (v46);
  }
  else
  {
    double v48 = 0.0;
  }

  uint64_t v51 = [v44 count] - 1;
  if (v51 >= 0)
  {
    do
    {
      v52 = [v44 objectAtIndex:v51];
      [v52 doubleValue];
      double v54 = v53;

      double v55 = floor(v54);
      double v56 = v55 + 1.0;
      if (v48 > 0.0)
      {
        double v48 = v48 + -1.0;
        double v55 = v55 + 1.0;
      }
      double v57 = objc_msgSend(NSNumber, "numberWithDouble:", v55, v56);
      [v44 replaceObjectAtIndex:v51 withObject:v57];

      --v51;
    }
    while (v51 != -1);
  }
  return v44;
}

- (id)rowHeightsForColumnWidths:(id)a3
{
  id v4 = a3;
  id v5 = [(SXDataTableLayouter *)self dataSource];
  uint64_t v6 = [v5 numberOfRows];

  uint64_t v7 = [(SXDataTableLayouter *)self dataSource];
  uint64_t v8 = [v7 numberOfColumns];

  double v9 = [MEMORY[0x263EFF980] array];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (v8)
      {
        uint64_t v11 = 0;
        double v12 = 0.0;
        do
        {
          BOOL v13 = [(SXDataTableLayouter *)self dataSource];
          objc_msgSend(v13, "heightForCellAtIndexPath:", i, v11);
          double v15 = v14;

          BOOL v16 = [v4 objectAtIndex:v11];
          [v16 floatValue];
          double v18 = v17;

          double v19 = [(SXDataTableLayouter *)self dataSource];
          objc_msgSend(v19, "paddingForCellAtIndexPath:", i, v11);
          double v21 = v20;
          double v23 = v22;
          double v25 = v24;
          double v27 = v26;

          unint64_t v28 = [(SXDataTableLayouter *)self dataSource];
          double v29 = objc_msgSend(v28, "cellBorderForCellAtIndexPath:", i, v11);

          double v30 = [v29 left];
          [v30 width];
          double v32 = v27 + v23 + v31;
          double v33 = [v29 right];
          [v33 width];
          double v35 = v18 - (v32 + v34);

          double v36 = [(SXDataTableLayouter *)self dataSource];
          objc_msgSend(v36, "heightForCellndexPath:forWidth:", i, v11, v35);
          double v38 = v37;

          double v39 = [v29 top];
          [v39 width];
          double v41 = v25 + v21 + v38 + v40;
          double v42 = [v29 bottom];
          [v42 width];
          double v44 = v41 + v43;

          if (v44 >= v15) {
            double v45 = v44;
          }
          else {
            double v45 = v15;
          }
          if (v45 >= v12) {
            double v12 = v45;
          }

          ++v11;
        }
        while (v8 != v11);
      }
      else
      {
        double v12 = 0.0;
      }
      uint64_t v46 = [NSNumber numberWithDouble:ceil(v12)];
      [v9 addObject:v46];
    }
  }

  return v9;
}

- (double)totalTableBorderWidth
{
  v2 = [(SXDataTableLayouter *)self dataSource];
  v3 = [v2 tableBorder];

  id v4 = [v3 left];
  [v4 width];
  double v6 = v5;
  uint64_t v7 = [v3 right];
  [v7 width];
  double v9 = v6 + v8;

  return v9;
}

- (double)totalTableBorderHeight
{
  v2 = [(SXDataTableLayouter *)self dataSource];
  v3 = [v2 tableBorder];

  id v4 = [v3 top];
  [v4 width];
  double v6 = v5;
  uint64_t v7 = [v3 bottom];
  [v7 width];
  double v9 = v6 + v8;

  return v9;
}

- (double)totalColumnDividerWidth
{
  v3 = [(SXDataTableLayouter *)self dataSource];
  uint64_t v4 = [v3 numberOfColumns];

  uint64_t v5 = v4 - 1;
  if (v4 == 1) {
    return 0.0;
  }
  uint64_t v6 = 0;
  double v7 = 0.0;
  do
  {
    double v8 = [(SXDataTableLayouter *)self dataSource];
    double v9 = [v8 columnDividerAtIndex:v6];

    [v9 width];
    double v7 = v7 + v10;

    ++v6;
  }
  while (v5 != v6);
  return v7;
}

- (double)intendedPercentualWidthForColumnAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(SXDataTableLayouter *)self intendedColumnWidths];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
  double v7 = [v5 objectForKey:v6];

  if (v7)
  {
    [v7 floatValue];
    double v9 = v8;
  }
  else
  {
    double v10 = [(SXDataTableLayouter *)self dataSource];
    uint64_t v11 = [v10 numberOfRows];

    if (v11)
    {
      uint64_t v14 = 0;
      double v9 = 1.79769313e308;
      do
      {
        double v15 = [(SXDataTableLayouter *)self dataSource];
        objc_msgSend(v15, "widthForCellAtIndexPath:", v14, a3);
        double v17 = v16;

        double v12 = 1.79769313e308;
        if (v17 != 1.79769313e308)
        {
          double v12 = 1.79769313e308;
          if (v9 >= v17) {
            double v13 = v9;
          }
          else {
            double v13 = v17;
          }
          if (v9 == 1.79769313e308) {
            double v9 = v17;
          }
          else {
            double v9 = v13;
          }
        }
        ++v14;
      }
      while (v11 != v14);
    }
    else
    {
      double v9 = 1.79769313e308;
    }
    double v18 = [(SXDataTableLayouter *)self intendedColumnWidths];
    double v19 = [NSNumber numberWithDouble:v9];
    double v20 = [NSNumber numberWithUnsignedInteger:a3];
    [v18 setObject:v19 forKey:v20];
  }
  return ceil(v9);
}

- (double)minimumWidthForColumnAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(SXDataTableLayouter *)self minimumColumnWidths];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
  double v7 = [v5 objectForKey:v6];

  if (v7)
  {
    [v7 floatValue];
    double v9 = v8;
  }
  else
  {
    double v10 = [(SXDataTableLayouter *)self dataSource];
    uint64_t v11 = [v10 numberOfRows];

    if (v11)
    {
      uint64_t v12 = 0;
      double v9 = 0.0;
      do
      {
        double v13 = [(SXDataTableLayouter *)self dataSource];
        objc_msgSend(v13, "minimumWidthForCellAtIndexPath:", v12, a3);
        double v15 = v14;

        double v16 = [(SXDataTableLayouter *)self dataSource];
        double v17 = objc_msgSend(v16, "cellBorderForCellAtIndexPath:", v12, a3);

        double v18 = [(SXDataTableLayouter *)self dataSource];
        objc_msgSend(v18, "paddingForCellAtIndexPath:", v12, a3);
        double v20 = v19;
        double v22 = v21;

        double v23 = [v17 left];
        [v23 width];
        double v25 = v15 + v24;
        double v26 = [v17 right];
        [v26 width];
        double v28 = v20 + v22 + v25 + v27;

        if (v28 >= v9) {
          double v9 = v28;
        }

        ++v12;
      }
      while (v11 != v12);
    }
    else
    {
      double v9 = 0.0;
    }
    double v29 = [(SXDataTableLayouter *)self minimumColumnWidths];
    double v30 = [NSNumber numberWithDouble:v9];
    double v31 = [NSNumber numberWithUnsignedInteger:a3];
    [v29 setObject:v30 forKey:v31];
  }
  return ceil(v9);
}

- (UIEdgeInsets)tableInsets
{
  v2 = [(SXDataTableLayouter *)self dataSource];
  v3 = [v2 tableBorder];

  uint64_t v4 = [v3 top];
  [v4 width];
  double v6 = v5;
  double v7 = [v3 left];
  [v7 width];
  double v9 = v8;
  double v10 = [v3 bottom];
  [v10 width];
  double v12 = v11;
  double v13 = [v3 right];
  [v13 width];
  double v15 = v14;

  double v16 = v6;
  double v17 = v9;
  double v18 = v12;
  double v19 = v15;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (SXDataTableDataSource)dataSource
{
  return self->_dataSource;
}

- (double)currentWidth
{
  return self->_currentWidth;
}

- (SXDataTableBlueprint)blueprint
{
  return self->_blueprint;
}

- (void)setBlueprint:(id)a3
{
}

- (NSMutableDictionary)minimumColumnWidths
{
  return self->_minimumColumnWidths;
}

- (void)setMinimumColumnWidths:(id)a3
{
}

- (NSMutableDictionary)intendedColumnWidths
{
  return self->_intendedColumnWidths;
}

- (void)setIntendedColumnWidths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intendedColumnWidths, 0);
  objc_storeStrong((id *)&self->_minimumColumnWidths, 0);
  objc_storeStrong((id *)&self->_blueprint, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end