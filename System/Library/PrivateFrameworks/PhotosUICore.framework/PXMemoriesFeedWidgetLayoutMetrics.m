@interface PXMemoriesFeedWidgetLayoutMetrics
- (CGSize)interitemSpacing;
- (PXMemoriesFeedWidgetLayoutMetrics)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)layoutAxis;
- (unint64_t)numberOfColumns;
- (unint64_t)numberOfRows;
- (void)setInteritemSpacing:(CGSize)a3;
- (void)setLayoutAxis:(int64_t)a3;
- (void)setNumberOfColumns:(unint64_t)a3;
- (void)setNumberOfRows:(unint64_t)a3;
@end

@implementation PXMemoriesFeedWidgetLayoutMetrics

- (void)setLayoutAxis:(int64_t)a3
{
  self->_layoutAxis = a3;
}

- (int64_t)layoutAxis
{
  return self->_layoutAxis;
}

- (void)setInteritemSpacing:(CGSize)a3
{
  self->_interitemSpacing = a3;
}

- (CGSize)interitemSpacing
{
  double width = self->_interitemSpacing.width;
  double height = self->_interitemSpacing.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (void)setNumberOfColumns:(unint64_t)a3
{
  self->_numberOfColumns = a3;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (void)setNumberOfRows:(unint64_t)a3
{
  if (!a3)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXMemoriesFeedWidgetLayoutMetrics.m", 33, @"Invalid parameter not satisfying: %@", @"numberOfRows > 0" object file lineNumber description];
  }
  if (self->_numberOfRows != a3) {
    self->_numberOfRows = a3;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXMemoriesFeedWidgetLayoutMetrics;
  id result = [(PXMemoriesFeedLayoutMetrics *)&v5 copyWithZone:a3];
  *((void *)result + 8) = self->_numberOfColumns;
  *((void *)result + 9) = self->_numberOfRows;
  *(CGSize *)((char *)result + 88) = self->_interitemSpacing;
  *((void *)result + 10) = self->_layoutAxis;
  return result;
}

- (PXMemoriesFeedWidgetLayoutMetrics)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXMemoriesFeedWidgetLayoutMetrics;
  id result = [(PXMemoriesFeedWidgetLayoutMetrics *)&v3 init];
  if (result)
  {
    result->_numberOfRows = 1;
    result->_layoutAxis = 1;
  }
  return result;
}

@end