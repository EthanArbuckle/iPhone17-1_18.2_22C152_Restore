@interface TSTTableColumnAccessibilityElement
- (CGRect)_frameInCanvasWithTableRep:(id)a3;
- (int)direction;
- (unsigned)columnIndex;
- (void)setColumnIndex:(unsigned __int8)a3;
@end

@implementation TSTTableColumnAccessibilityElement

- (unsigned)columnIndex
{
  return [(TSTTableColumnOrRowAccessibilityElement *)self cellID] >> 16;
}

- (void)setColumnIndex:(unsigned __int8)a3
{
}

- (int)direction
{
  return 1;
}

- (CGRect)_frameInCanvasWithTableRep:(id)a3
{
  unint64_t v4 = (unint64_t)[(TSTTableColumnAccessibilityElement *)self columnIndex] << 16;
  uint64_t v5 = v4 | ((void)[a3 tsaxRowsCount] << 48) | 0x100000000;

  [a3 tsaxDeviceBoundsForCellRange:v5];
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

@end