@interface PXEditorialTungstenLayout
- (PXEditorialTungstenLayout)init;
- (id)_inputItemAtIndex:(unsigned int)a3;
- (id)diagnosticDescription;
- (id)newGenerator;
- (int64_t)numberOfColumns;
- (void)setNumberOfColumns:(int64_t)a3;
@end

@implementation PXEditorialTungstenLayout

- (int64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (id)diagnosticDescription
{
  v6.receiver = self;
  v6.super_class = (Class)PXEditorialTungstenLayout;
  v3 = [(PXGGeneratedLayout *)&v6 diagnosticDescription];
  objc_msgSend(v3, "stringByAppendingFormat:", @"; numberOfColumns: %li",
  v4 = [(PXEditorialTungstenLayout *)self numberOfColumns]);

  return v4;
}

- (void)setNumberOfColumns:(int64_t)a3
{
  if (self->_numberOfColumns != a3)
  {
    BOOL v3 = a3 == 5 || a3 == 3;
    int64_t v4 = 3;
    if (v3) {
      int64_t v4 = a3;
    }
    self->_numberOfColumns = v4;
    p_updateFlags = &self->super._updateFlags;
    unint64_t needsUpdate = self->super._updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->super._updateFlags.isPerformingUpdate)
      {
LABEL_13:
        p_updateFlags->unint64_t needsUpdate = needsUpdate | 7;
        return;
      }
LABEL_12:
      if ((self->super._updateFlags.updated & 7) != 0)
      {
        v8 = [MEMORY[0x1E4F28B00] currentHandler];
        v9 = [NSString stringWithUTF8String:"-[PXEditorialTungstenLayout setNumberOfColumns:]"];
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PXEditorialTungstenLayout.m", 57, @"invalidating %lu after it already has been updated", 7);

        abort();
      }
      goto LABEL_13;
    }
    if (self->super._updateFlags.isPerformingUpdate) {
      goto LABEL_12;
    }
    BOOL willPerformUpdate = self->super._updateFlags.willPerformUpdate;
    p_updateFlags->unint64_t needsUpdate = 7;
    if (!willPerformUpdate)
    {
      [(PXGLayout *)self setNeedsUpdate];
    }
  }
}

- (id)_inputItemAtIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = [(PXGItemsLayout *)self delegate];
  objc_super v6 = [v5 generatedLayout:self inputItemAtIndex:v3];

  return v6;
}

- (id)newGenerator
{
  uint64_t v3 = objc_alloc_init(PXEditorialLayoutMetrics);
  [(PXEditorialLayoutMetrics *)v3 setNumberOfColumns:[(PXEditorialTungstenLayout *)self numberOfColumns]];
  [(PXGGeneratedLayout *)self interitemSpacing];
  -[PXEditorialLayoutMetrics setInterTileSpacing:](v3, "setInterTileSpacing:");
  [(PXGGeneratedLayout *)self padding];
  -[PXEditorialLayoutMetrics setPadding:](v3, "setPadding:");
  [(PXGLayout *)self referenceSize];
  -[PXLayoutMetrics setReferenceSize:](v3, "setReferenceSize:");
  [(PXEditorialLayoutMetrics *)v3 setUseSaliency:[(PXGGeneratedLayout *)self useSaliency]];
  objc_initWeak(&location, self);
  int64_t v4 = [[PXEditorialLayoutGenerator alloc] initWithMetrics:v3];
  [(PXEditorialLayoutGenerator *)v4 setItemCount:[(PXGItemsLayout *)self numberOfItems]];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__PXEditorialTungstenLayout_newGenerator__block_invoke;
  v6[3] = &unk_1E5DCAB40;
  objc_copyWeak(&v7, &location);
  [(PXEditorialLayoutGenerator *)v4 setItemLayoutInfoBlock:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

id __41__PXEditorialTungstenLayout_newGenerator__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int64_t v4 = [WeakRetained _inputItemAtIndex:a2];

  return v4;
}

- (PXEditorialTungstenLayout)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXEditorialTungstenLayout;
  result = [(PXGGeneratedLayout *)&v3 init];
  if (result) {
    result->_numberOfColumns = 3;
  }
  return result;
}

@end