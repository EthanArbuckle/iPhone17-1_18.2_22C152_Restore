@interface PXMemoriesFeedWidgetLayoutGenerator
- (CGSize)size;
- (PXMemoriesFeedWidgetLayoutGenerator)initWithMetrics:(id)a3;
- (id)geometryKinds;
- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5;
@end

@implementation PXMemoriesFeedWidgetLayoutGenerator

- (void)getGeometries:(_PXLayoutGeometry *)a3 inRange:(_NSRange)a4 withKind:(int64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a5)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PXMemoriesFeedWidgetLayoutGenerator.m", 74, @"Invalid parameter not satisfying: %@", @"PXMemoriesFeedLayoutItemKindContent == kind" object file lineNumber description];
  }
  if (location < location + length
    && location < [(PXMemoriesFeedWidgetLayoutGenerator *)self numberOfGeometriesWithKind:a5])
  {
    double top = self->_context.contentInsets.top;
    double left = self->_context.contentInsets.left;
    double width = self->_context.itemSize.width;
    double height = self->_context.itemSize.height;
    double v14 = self->_context.interitemSpacing.width;
    double v13 = self->_context.interitemSpacing.height;
    int64_t layoutAxis = self->_context.layoutAxis;
    switch(layoutAxis)
    {
      case 1:
        unint64_t numberOfColumns = self->_context.numberOfColumns;
        unint64_t v17 = location / numberOfColumns;
        unint64_t v16 = location % numberOfColumns;
        break;
      case 2:
        unint64_t numberOfRows = self->_context.numberOfRows;
        unint64_t v16 = location / numberOfRows;
        unint64_t v17 = location % numberOfRows;
        break;
      case 0:
        v24 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", left, top, width, height, v13, v14);
        v25 = objc_msgSend(NSString, "stringWithUTF8String:", "CGRect _ItemRectForItemAtIndex(NSUInteger, _LayoutContext)");
        [v24 handleFailureInFunction:v25 file:@"PXMemoriesFeedWidgetLayoutGenerator.m" lineNumber:154 description:@"Can't determine rect for unknown axis"];

        abort();
      default:
        unint64_t v16 = 0;
        unint64_t v17 = 0;
        break;
    }
    double v20 = left + (double)v16 * (width + v14);
    double v21 = top + (double)v17 * (height + v13);
    CGRectIntegral(*(CGRect *)(&width - 2));
    PXRectGetCenter();
  }
}

- (id)geometryKinds
{
  if (geometryKinds_onceToken != -1) {
    dispatch_once(&geometryKinds_onceToken, &__block_literal_global_214702);
  }
  v2 = (void *)geometryKinds_kinds;
  return v2;
}

void __52__PXMemoriesFeedWidgetLayoutGenerator_geometryKinds__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E60] indexSetWithIndex:0];
  v1 = (void *)geometryKinds_kinds;
  geometryKinds_kinds = v0;
}

- (CGSize)size
{
  double width = self->_context.size.width;
  double height = self->_context.size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PXMemoriesFeedWidgetLayoutGenerator)initWithMetrics:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"PXMemoriesFeedWidgetLayoutGenerator.m", 47, @"Invalid parameter not satisfying: %@", @"[metrics isKindOfClass:[PXMemoriesFeedWidgetLayoutMetrics class]]" object file lineNumber description];
  }
  v40.receiver = self;
  v40.super_class = (Class)PXMemoriesFeedWidgetLayoutGenerator;
  v6 = [(PXMemoriesFeedLayoutGenerator *)&v40 initWithMetrics:v5];
  v7 = v6;
  if (v6)
  {
    p_double top = &v6->_context.contentInsets.top;
    id v9 = v5;
    [v9 contentInsets];
    double v11 = v10;
    double v13 = v12;
    [v9 interitemSpacing];
    double v15 = v14;
    double v17 = v16;
    unint64_t v18 = [v9 numberOfColumns];
    unint64_t v19 = [v9 numberOfRows];
    uint64_t v20 = [v9 layoutAxis];
    [v9 referenceSize];
    double v22 = v21;
    double v24 = v23;

    double v25 = *MEMORY[0x1E4F1DB30];
    double v26 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (v24 == v26 && v22 == v25 || v18 == 0)
    {
      unint64_t v18 = 0;
      unint64_t v19 = 0;
      double v32 = *(double *)off_1E5DAAF10;
      double v35 = *((double *)off_1E5DAAF10 + 1);
      uint64_t v20 = 1;
      double v33 = *((double *)off_1E5DAAF10 + 2);
      double v36 = *((double *)off_1E5DAAF10 + 3);
      double v15 = *MEMORY[0x1E4F1DB30];
      double v17 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      double v22 = *MEMORY[0x1E4F1DB30];
      double v37 = v17;
    }
    else
    {
      double v29 = v15 * (double)(v18 - 1);
      double v25 = floor((v22 - (v11 + v13) - v29) / (double)v18);
      double v30 = (double)(v19 - 1);
      double v31 = v24 - v25 * (double)v19 - v17 * v30;
      double v32 = floor(v31 * 0.5);
      double v33 = v31 - v32;
      double v34 = v22 - (v29 + (double)v18 * v25);
      double v35 = floor(v34 * 0.5);
      double v36 = v34 - v35;
      double v37 = v33 + v32 + (double)v19 * v25 + v30 * v17;
      double v26 = v25;
    }
    *p_double top = v32;
    v7->_context.contentInsets.double left = v35;
    v7->_context.contentInsets.bottom = v33;
    v7->_context.contentInsets.right = v36;
    v7->_context.itemSize.double width = v25;
    v7->_context.itemSize.double height = v26;
    v7->_context.interitemSpacing.double width = v15;
    v7->_context.interitemSpacing.double height = v17;
    v7->_context.size.double width = v22;
    v7->_context.size.double height = v37;
    v7->_context.unint64_t numberOfColumns = v18;
    v7->_context.unint64_t numberOfRows = v19;
    v7->_context.int64_t layoutAxis = v20;
  }

  return v7;
}

@end