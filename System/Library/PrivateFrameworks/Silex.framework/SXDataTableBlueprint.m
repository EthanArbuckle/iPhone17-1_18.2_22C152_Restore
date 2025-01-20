@interface SXDataTableBlueprint
- (BOOL)isRectValid:(CGRect)a3;
- (CGRect)cellContentRectForIndexPath:(id)a3;
- (CGRect)cellRectForIndexPath:(id)a3;
- (CGRect)rectForColumnAtIndex:(unint64_t)a3;
- (CGRect)rectForColumnDividerAtIndexPath:(id)a3;
- (CGRect)rectForRowAtIndex:(unint64_t)a3;
- (CGRect)rectForRowDividerAtIndexPath:(id)a3;
- (CGSize)tableSize;
- (SXDataTableBlueprint)initWithNumberOfRows:(unint64_t)a3 numberOfColumns:(unint64_t)a4 withTableInsets:(UIEdgeInsets)a5;
- (SXDataTableDictionary)blueprint;
- (SXDataTableDictionary)columnDividers;
- (SXDataTableDictionary)contentBlueprint;
- (SXDataTableDictionary)rowDividers;
- (UIEdgeInsets)tableInsets;
- (id)description;
- (unint64_t)dataOrientation;
- (unint64_t)numberOfColumns;
- (unint64_t)numberOfRows;
- (void)addCellContentRect:(CGRect)a3 forIndexPath:(id)a4;
- (void)addCellRect:(CGRect)a3 forIndexPath:(id)a4;
- (void)addColumnDividerRect:(CGRect)a3 forIndexPath:(id)a4;
- (void)addRowDividerRect:(CGRect)a3 forIndexPath:(id)a4;
- (void)setDataOrientation:(unint64_t)a3;
- (void)setTableSize:(CGSize)a3;
@end

@implementation SXDataTableBlueprint

- (SXDataTableBlueprint)initWithNumberOfRows:(unint64_t)a3 numberOfColumns:(unint64_t)a4 withTableInsets:(UIEdgeInsets)a5
{
  CGFloat right = a5.right;
  CGFloat bottom = a5.bottom;
  CGFloat left = a5.left;
  CGFloat top = a5.top;
  v22.receiver = self;
  v22.super_class = (Class)SXDataTableBlueprint;
  v11 = [(SXDataTableBlueprint *)&v22 init];
  v12 = v11;
  if (v11)
  {
    v11->_numberOfRows = a3;
    v11->_numberOfColumns = a4;
    v11->_tableInsets.CGFloat top = top;
    v11->_tableInsets.CGFloat left = left;
    v11->_tableInsets.CGFloat bottom = bottom;
    v11->_tableInsets.CGFloat right = right;
    uint64_t v13 = +[SXDataTableDictionary dataTableDictionaryWithRows:a3 andColumns:a4];
    blueprint = v12->_blueprint;
    v12->_blueprint = (SXDataTableDictionary *)v13;

    uint64_t v15 = +[SXDataTableDictionary dataTableDictionaryWithRows:a3 andColumns:a4];
    contentBlueprint = v12->_contentBlueprint;
    v12->_contentBlueprint = (SXDataTableDictionary *)v15;

    uint64_t v17 = +[SXDataTableDictionary dataTableDictionaryWithRows:a3 andColumns:a4];
    rowDividers = v12->_rowDividers;
    v12->_rowDividers = (SXDataTableDictionary *)v17;

    uint64_t v19 = +[SXDataTableDictionary dataTableDictionaryWithRows:a3 andColumns:a4];
    columnDividers = v12->_columnDividers;
    v12->_columnDividers = (SXDataTableDictionary *)v19;
  }
  return v12;
}

- (void)addCellRect:(CGRect)a3 forIndexPath:(id)a4
{
  unint64_t var1 = a4.var1;
  unint64_t var0 = a4.var0;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = [(SXDataTableBlueprint *)self blueprint];
  v10 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", x, y, width, height);
  objc_msgSend(v11, "setObject:forIndexPath:", v10, var0, var1);
}

- (void)addCellContentRect:(CGRect)a3 forIndexPath:(id)a4
{
  unint64_t var1 = a4.var1;
  unint64_t var0 = a4.var0;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = [(SXDataTableBlueprint *)self contentBlueprint];
  v10 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", x, y, width, height);
  objc_msgSend(v11, "setObject:forIndexPath:", v10, var0, var1);
}

- (void)addColumnDividerRect:(CGRect)a3 forIndexPath:(id)a4
{
  unint64_t var1 = a4.var1;
  unint64_t var0 = a4.var0;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = [(SXDataTableBlueprint *)self columnDividers];
  v10 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", x, y, width, height);
  objc_msgSend(v11, "setObject:forIndexPath:", v10, var0, var1);
}

- (void)addRowDividerRect:(CGRect)a3 forIndexPath:(id)a4
{
  unint64_t var1 = a4.var1;
  unint64_t var0 = a4.var0;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = [(SXDataTableBlueprint *)self rowDividers];
  v10 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", x, y, width, height);
  objc_msgSend(v11, "setObject:forIndexPath:", v10, var0, var1);
}

- (CGRect)cellRectForIndexPath:(id)a3
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  v5 = [(SXDataTableBlueprint *)self blueprint];
  v6 = objc_msgSend(v5, "objectForIndexPath:", var0, var1);
  [v6 CGRectValue];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (CGRect)cellContentRectForIndexPath:(id)a3
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  v5 = [(SXDataTableBlueprint *)self contentBlueprint];
  v6 = objc_msgSend(v5, "objectForIndexPath:", var0, var1);
  [v6 CGRectValue];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (CGRect)rectForColumnDividerAtIndexPath:(id)a3
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  v5 = [(SXDataTableBlueprint *)self columnDividers];
  v6 = objc_msgSend(v5, "objectForIndexPath:", var0, var1);
  [v6 CGRectValue];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (CGRect)rectForRowDividerAtIndexPath:(id)a3
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  v5 = [(SXDataTableBlueprint *)self rowDividers];
  v6 = objc_msgSend(v5, "objectForIndexPath:", var0, var1);
  [v6 CGRectValue];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (CGRect)rectForRowAtIndex:(unint64_t)a3
{
  -[SXDataTableBlueprint cellRectForIndexPath:](self, "cellRectForIndexPath:", a3, 0);
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  -[SXDataTableBlueprint cellRectForIndexPath:](self, "cellRectForIndexPath:", a3, [(SXDataTableBlueprint *)self numberOfColumns] - 1);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  v33.origin.double x = v6;
  v33.origin.double y = v8;
  v33.size.double width = v10;
  v33.size.double height = v12;
  double MinX = CGRectGetMinX(v33);
  v34.origin.double x = v14;
  v34.origin.double y = v16;
  v34.size.double width = v18;
  v34.size.double height = v20;
  double MaxX = CGRectGetMaxX(v34);
  v35.origin.double x = v6;
  v35.origin.double y = v8;
  v35.size.double width = v10;
  v35.size.double height = v12;
  double MinY = CGRectGetMinY(v35);
  v36.origin.double x = v6;
  v36.origin.double y = v8;
  v36.size.double width = v10;
  v36.size.double height = v12;
  double Height = CGRectGetHeight(v36);
  -[SXDataTableBlueprint rectForRowDividerAtIndexPath:](self, "rectForRowDividerAtIndexPath:", a3, 0);
  double v24 = Height + CGRectGetHeight(v37);
  if (!a3)
  {
    [(SXDataTableBlueprint *)self tableInsets];
    double MinY = MinY - v25;
    [(SXDataTableBlueprint *)self tableInsets];
    double v24 = v24 + v26;
  }
  if ([(SXDataTableBlueprint *)self numberOfRows] - 1 == a3)
  {
    [(SXDataTableBlueprint *)self tableInsets];
    double v24 = v24 + v27;
  }
  double v28 = MinX;
  double v29 = MaxX - MinX;
  double v30 = MinY;
  double v31 = v24;
  result.size.double height = v31;
  result.size.double width = v29;
  result.origin.double y = v30;
  result.origin.double x = v28;
  return result;
}

- (CGRect)rectForColumnAtIndex:(unint64_t)a3
{
  -[SXDataTableBlueprint cellRectForIndexPath:](self, "cellRectForIndexPath:", [(SXDataTableBlueprint *)self numberOfRows] - 1, a3);
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  -[SXDataTableBlueprint cellRectForIndexPath:](self, "cellRectForIndexPath:", 0, 0);
  double MinY = CGRectGetMinY(v25);
  v26.origin.double x = v6;
  v26.origin.double y = v8;
  v26.size.double width = v10;
  v26.size.double height = v12;
  double MaxY = CGRectGetMaxY(v26);
  v27.origin.double x = v6;
  v27.origin.double y = v8;
  v27.size.double width = v10;
  v27.size.double height = v12;
  double MinX = CGRectGetMinX(v27);
  v28.origin.double x = v6;
  v28.origin.double y = v8;
  v28.size.double width = v10;
  v28.size.double height = v12;
  double Width = CGRectGetWidth(v28);
  -[SXDataTableBlueprint rectForColumnDividerAtIndexPath:](self, "rectForColumnDividerAtIndexPath:", 0, a3);
  double v17 = Width + CGRectGetWidth(v29);
  if (!a3)
  {
    [(SXDataTableBlueprint *)self tableInsets];
    double MinX = MinX - v18;
    [(SXDataTableBlueprint *)self tableInsets];
    double v17 = v17 + v19;
  }
  if ([(SXDataTableBlueprint *)self numberOfColumns] - 1 == a3)
  {
    [(SXDataTableBlueprint *)self tableInsets];
    double v17 = v17 + v20;
  }
  double v21 = MaxY - MinY;
  double v22 = MinX;
  double v23 = MinY;
  double v24 = v17;
  result.size.double height = v21;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (BOOL)isRectValid:(CGRect)a3
{
  BOOL v3 = a3.origin.x != 1.79769313e308;
  if (a3.origin.y == 1.79769313e308) {
    BOOL v3 = 0;
  }
  if (a3.size.width == 1.79769313e308) {
    BOOL v3 = 0;
  }
  return a3.size.height != 1.79769313e308 && v3;
}

- (id)description
{
  BOOL v3 = (void *)MEMORY[0x263F089D8];
  v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  CGFloat v6 = [v3 stringWithFormat:@"<%@: %p>\n\n", v5, self];

  [v6 appendFormat:@" - Cells -\n"];
  if ([(SXDataTableBlueprint *)self numberOfRows])
  {
    unint64_t v7 = 0;
    do
    {
      if ([(SXDataTableBlueprint *)self numberOfRows])
      {
        unint64_t v8 = 0;
        do
        {
          double v9 = [(SXDataTableBlueprint *)self blueprint];
          CGFloat v10 = objc_msgSend(v9, "objectForIndexPath:", v7, v8);
          [v10 CGRectValue];
          CGFloat v12 = v11;
          CGFloat v14 = v13;
          CGFloat v16 = v15;
          CGFloat v18 = v17;

          double v19 = [(SXDataTableBlueprint *)self contentBlueprint];
          double v20 = objc_msgSend(v19, "objectForIndexPath:", v7, v8);
          [v20 CGRectValue];
          CGFloat v22 = v21;
          CGFloat v24 = v23;
          CGFloat v26 = v25;
          CGFloat v28 = v27;

          CGRect v29 = [NSString stringWithFormat:@"{row: %lu, column: %lu}", v7, v8];
          v38.origin.double x = v12;
          v38.origin.double y = v14;
          v38.size.double width = v16;
          v38.size.double height = v18;
          double v30 = NSStringFromCGRect(v38);
          v39.origin.double x = v22;
          v39.origin.double y = v24;
          v39.size.double width = v26;
          v39.size.double height = v28;
          double v31 = NSStringFromCGRect(v39);
          [v6 appendFormat:@"%@; cell: %@; content: %@ \n", v29, v30, v31];

          ++v8;
        }
        while (v8 < [(SXDataTableBlueprint *)self numberOfRows]);
      }
      ++v7;
    }
    while (v7 < [(SXDataTableBlueprint *)self numberOfRows]);
  }
  [v6 appendFormat:@"\n - Rows -\n"];
  if ([(SXDataTableBlueprint *)self numberOfRows])
  {
    unint64_t v32 = 0;
    do
    {
      [(SXDataTableBlueprint *)self rectForRowAtIndex:v32];
      CGRect v33 = NSStringFromCGRect(v40);
      [v6 appendFormat:@"{row: %lu}; %@\n", v32, v33];

      ++v32;
    }
    while (v32 < [(SXDataTableBlueprint *)self numberOfRows]);
  }
  [v6 appendFormat:@"\n - Columns -\n"];
  if ([(SXDataTableBlueprint *)self numberOfColumns])
  {
    unint64_t v34 = 0;
    do
    {
      [(SXDataTableBlueprint *)self rectForColumnAtIndex:v34];
      CGRect v35 = NSStringFromCGRect(v41);
      [v6 appendFormat:@"{column: %lu}; %@\n", v34, v35];

      ++v34;
    }
    while (v34 < [(SXDataTableBlueprint *)self numberOfColumns]);
  }
  [v6 appendFormat:@"\n --- END --- "];
  return v6;
}

- (unint64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (UIEdgeInsets)tableInsets
{
  double top = self->_tableInsets.top;
  double left = self->_tableInsets.left;
  double bottom = self->_tableInsets.bottom;
  double right = self->_tableInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGSize)tableSize
{
  double width = self->_tableSize.width;
  double height = self->_tableSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setTableSize:(CGSize)a3
{
  self->_tableSize = a3;
}

- (SXDataTableDictionary)blueprint
{
  return self->_blueprint;
}

- (SXDataTableDictionary)contentBlueprint
{
  return self->_contentBlueprint;
}

- (SXDataTableDictionary)rowDividers
{
  return self->_rowDividers;
}

- (SXDataTableDictionary)columnDividers
{
  return self->_columnDividers;
}

- (unint64_t)dataOrientation
{
  return self->_dataOrientation;
}

- (void)setDataOrientation:(unint64_t)a3
{
  self->_dataOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnDividers, 0);
  objc_storeStrong((id *)&self->_rowDividers, 0);
  objc_storeStrong((id *)&self->_contentBlueprint, 0);
  objc_storeStrong((id *)&self->_blueprint, 0);
}

@end