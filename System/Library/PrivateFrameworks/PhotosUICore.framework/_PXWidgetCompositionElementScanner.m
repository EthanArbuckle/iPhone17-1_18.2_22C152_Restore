@interface _PXWidgetCompositionElementScanner
- (BOOL)_wantsEdgeToEdgeLayoutForElement:(id)a3;
- (BOOL)isAtEnd;
- (BOOL)scanRow:(id *)a3;
- (NSArray)elements;
- (double)interColumnSpacing;
- (double)referenceWidth;
- (id)wantsEdgeToEdgeLayoutBlock;
- (int64_t)maximumNumberOfColumns;
- (int64_t)numberOfColumns;
- (void)enumerateElementsUsingBlock:(id)a3;
- (void)setElements:(id)a3;
- (void)setInterColumnSpacing:(double)a3;
- (void)setMaximumNumberOfColumns:(int64_t)a3;
- (void)setReferenceWidth:(double)a3;
- (void)setWantsEdgeToEdgeLayoutBlock:(id)a3;
@end

@implementation _PXWidgetCompositionElementScanner

- (void).cxx_destruct
{
  objc_storeStrong(&self->_wantsEdgeToEdgeLayoutBlock, 0);
  objc_storeStrong((id *)&self->_elements, 0);
}

- (void)setMaximumNumberOfColumns:(int64_t)a3
{
  self->_maximumNumberOfColumns = a3;
}

- (int64_t)maximumNumberOfColumns
{
  return self->_maximumNumberOfColumns;
}

- (void)setInterColumnSpacing:(double)a3
{
  self->_interColumnSpacing = a3;
}

- (double)interColumnSpacing
{
  return self->_interColumnSpacing;
}

- (void)setReferenceWidth:(double)a3
{
  self->_referenceWidth = a3;
}

- (double)referenceWidth
{
  return self->_referenceWidth;
}

- (void)setWantsEdgeToEdgeLayoutBlock:(id)a3
{
}

- (id)wantsEdgeToEdgeLayoutBlock
{
  return self->_wantsEdgeToEdgeLayoutBlock;
}

- (void)setElements:(id)a3
{
}

- (NSArray)elements
{
  return self->_elements;
}

- (void)enumerateElementsUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = [(_PXWidgetCompositionElementScanner *)self elements];
  v6 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", self->_scannedRowRange.location, self->_scannedRowRange.length);
  v7 = [v5 objectsAtIndexes:v6];

  [(_PXWidgetCompositionElementScanner *)self referenceWidth];
  double v9 = v8;
  [(_PXWidgetCompositionElementScanner *)self interColumnSpacing];
  double v11 = (v9 + v10) / (double)(unint64_t)[v7 count];
  [(_PXWidgetCompositionElementScanner *)self interColumnSpacing];
  double v13 = v11 - v12;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66___PXWidgetCompositionElementScanner_enumerateElementsUsingBlock___block_invoke;
  v19[3] = &unk_1E5DBC568;
  *(double *)&v19[5] = v13;
  v19[4] = v20;
  [v7 enumerateObjectsUsingBlock:v19];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66___PXWidgetCompositionElementScanner_enumerateElementsUsingBlock___block_invoke_2;
  v15[3] = &unk_1E5DBC590;
  double v18 = v13;
  v17 = v20;
  id v14 = v4;
  id v16 = v14;
  [v7 enumerateObjectsUsingBlock:v15];

  _Block_object_dispose(v20, 8);
}

- (int64_t)numberOfColumns
{
  return self->_scannedRowRange.length;
}

- (BOOL)_wantsEdgeToEdgeLayoutForElement:(id)a3
{
  id v4 = a3;
  v5 = [(_PXWidgetCompositionElementScanner *)self wantsEdgeToEdgeLayoutBlock];

  if (v5)
  {
    v6 = [(_PXWidgetCompositionElementScanner *)self wantsEdgeToEdgeLayoutBlock];
    char v7 = ((uint64_t (**)(void, id))v6)[2](v6, v4);
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)scanRow:(id *)a3
{
  self->_scannedRowRange.location = self->_scanLocation;
  self->_scannedRowRange.NSUInteger length = 0;
  if (![(_PXWidgetCompositionElementScanner *)self isAtEnd])
  {
    v5 = [(_PXWidgetCompositionElementScanner *)self elements];
    self->_scannedRowRange.NSUInteger length = 1;
    v6 = [v5 objectAtIndexedSubscript:self->_scannedRowRange.location];
    if (![(_PXWidgetCompositionElementScanner *)self _wantsEdgeToEdgeLayoutForElement:v6])
    {
      unint64_t v7 = [v5 count];
      unint64_t v8 = [(_PXWidgetCompositionElementScanner *)self maximumNumberOfColumns];
      NSUInteger length = self->_scannedRowRange.length;
      if (length + self->_scannedRowRange.location < v7)
      {
        NSUInteger v10 = v8;
        if (length < v8)
        {
          while (1)
          {
            double v11 = objc_msgSend(v5, "objectAtIndexedSubscript:");
            if ([(_PXWidgetCompositionElementScanner *)self _wantsEdgeToEdgeLayoutForElement:v11])
            {
              break;
            }
            ++self->_scannedRowRange.length;

            NSUInteger v12 = self->_scannedRowRange.length;
            if (v12 + self->_scannedRowRange.location >= v7 || v12 >= v10) {
              goto LABEL_13;
            }
          }
        }
      }
    }
LABEL_13:
  }
  NSUInteger v14 = self->_scannedRowRange.length;
  if (v14)
  {
    self->_scanLocation = self->_scannedRowRange.location + v14;
    if (a3) {
      *a3 = self;
    }
  }
  return v14 != 0;
}

- (BOOL)isAtEnd
{
  unint64_t scanLocation = self->_scanLocation;
  v3 = [(_PXWidgetCompositionElementScanner *)self elements];
  LOBYTE(scanLocation) = scanLocation >= [v3 count];

  return scanLocation;
}

@end