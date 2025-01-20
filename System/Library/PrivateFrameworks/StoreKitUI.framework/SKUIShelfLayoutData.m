@interface SKUIShelfLayoutData
- (CGSize)sizeForItemAtIndex:(int64_t)a3;
- (CGSize)totalContentSize;
- (SKUIShelfLayoutData)initWithNumberOfRows:(int64_t)a3 columnSpacing:(double)a4;
- (UIEdgeInsets)contentInset;
- (double)columnSpacing;
- (double)columnWidthForIndex:(int64_t)a3;
- (double)rowHeightForIndex:(int64_t)a3;
- (int64_t)numberOfColumns;
- (int64_t)numberOfRows;
- (void)dealloc;
- (void)enumerateColumnsUsingBlock:(id)a3;
- (void)enumerateRowsUsingBlock:(id)a3;
- (void)reloadWithItemCount:(int64_t)a3 sizeBlock:(id)a4;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation SKUIShelfLayoutData

- (SKUIShelfLayoutData)initWithNumberOfRows:(int64_t)a3 columnSpacing:(double)a4
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIShelfLayoutData initWithNumberOfRows:columnSpacing:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIShelfLayoutData;
  v7 = [(SKUIShelfLayoutData *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_columnSpacing = a4;
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    columnWidths = v8->_columnWidths;
    v8->_columnWidths = v9;

    v8->_numberOfRows = a3;
    v8->_rowHeights = (double *)malloc_type_malloc(8 * a3, 0x100004000313F17uLL);
  }
  return v8;
}

- (void)dealloc
{
  rowHeights = self->_rowHeights;
  if (rowHeights) {
    free(rowHeights);
  }
  v4.receiver = self;
  v4.super_class = (Class)SKUIShelfLayoutData;
  [(SKUIShelfLayoutData *)&v4 dealloc];
}

- (double)columnWidthForIndex:(int64_t)a3
{
  v3 = [(NSMutableArray *)self->_columnWidths objectAtIndex:a3];
  [v3 floatValue];
  double v5 = v4;

  return v5;
}

- (void)enumerateColumnsUsingBlock:(id)a3
{
  id v4 = a3;
  columnWidths = self->_columnWidths;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__SKUIShelfLayoutData_enumerateColumnsUsingBlock___block_invoke;
  v7[3] = &unk_1E6427CD8;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)columnWidths enumerateObjectsUsingBlock:v7];
}

uint64_t __50__SKUIShelfLayoutData_enumerateColumnsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  [a2 floatValue];
  v7.n128_f64[0] = v7.n128_f32[0];
  id v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, __n128))(v6 + 16);

  return v8(v6, a3, a4, v7);
}

- (void)enumerateRowsUsingBlock:(id)a3
{
  if (self->_numberOfRows >= 1)
  {
    int64_t v5 = 0;
    do
    {
      char v6 = 0;
      (*((void (**)(id, int64_t, char *, double))a3 + 2))(a3, v5, &v6, self->_rowHeights[v5]);
      if (v6) {
        break;
      }
      ++v5;
    }
    while (v5 < self->_numberOfRows);
  }
}

- (int64_t)numberOfColumns
{
  return [(NSMutableArray *)self->_columnWidths count];
}

- (void)reloadWithItemCount:(int64_t)a3 sizeBlock:(id)a4
{
  v21 = (double (**)(id, void))a4;
  [(NSMutableArray *)self->_columnWidths removeAllObjects];
  bzero(self->_rowHeights, 8 * self->_numberOfRows);
  if (a3 >= 1)
  {
    int64_t v6 = 0;
    __n128 v7 = v21;
    do
    {
      id v8 = (void *)MEMORY[0x1C8749310](v7);
      if (self->_numberOfRows < 1)
      {
        double v12 = 0.0;
      }
      else
      {
        int64_t v9 = 0;
        if (v6 <= a3) {
          int64_t v10 = a3;
        }
        else {
          int64_t v10 = v6;
        }
        int64_t v11 = v10 - v6;
        double v12 = 0.0;
        do
        {
          if (v11 == v9) {
            break;
          }
          double v13 = v21[2](v21, v6 + v9);
          if (v12 < v13) {
            double v12 = v13;
          }
          int64_t numberOfRows = self->_numberOfRows;
          rowHeights = self->_rowHeights;
          double v17 = rowHeights[v9];
          if (v17 < v14) {
            double v17 = v14;
          }
          rowHeights[v9++] = v17;
        }
        while (v9 < numberOfRows);
      }
      id v18 = objc_alloc(NSNumber);
      *(float *)&double v19 = v12;
      v20 = (void *)[v18 initWithFloat:v19];
      [(NSMutableArray *)self->_columnWidths addObject:v20];

      v6 += self->_numberOfRows;
    }
    while (v6 < a3);
  }
}

- (double)rowHeightForIndex:(int64_t)a3
{
  return self->_rowHeights[a3];
}

- (CGSize)sizeForItemAtIndex:(int64_t)a3
{
  int64_t numberOfRows = self->_numberOfRows;
  int64_t v5 = a3 % numberOfRows;
  int64_t v6 = [(NSMutableArray *)self->_columnWidths objectAtIndex:a3 / numberOfRows];
  [v6 floatValue];
  double v8 = v7;
  double v9 = self->_rowHeights[v5];

  double v10 = v8;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)totalContentSize
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  int64_t numberOfRows = self->_numberOfRows;
  if (numberOfRows >= 1)
  {
    rowHeights = self->_rowHeights;
    do
    {
      double v6 = *rowHeights++;
      double v3 = v3 + v6;
      --numberOfRows;
    }
    while (numberOfRows);
  }
  double v7 = *MEMORY[0x1E4F1DB30];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v8 = self->_columnWidths;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "floatValue", (void)v17);
        double v7 = v7 + v13;
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSMutableArray *)self->_columnWidths count];
  if (v14 >= 2) {
    double v7 = v7 + (double)(v14 - 1) * self->_columnSpacing;
  }
  double v15 = v3 + self->_contentInset.bottom + self->_contentInset.top;
  double v16 = v7 + self->_contentInset.left + self->_contentInset.right;
  result.height = v15;
  result.width = v16;
  return result;
}

- (double)columnSpacing
{
  return self->_columnSpacing;
}

- (int64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithNumberOfRows:columnSpacing:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIShelfLayoutData initWithNumberOfRows:columnSpacing:]";
}

@end