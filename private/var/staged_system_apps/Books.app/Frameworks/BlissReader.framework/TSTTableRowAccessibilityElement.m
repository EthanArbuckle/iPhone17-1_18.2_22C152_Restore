@interface TSTTableRowAccessibilityElement
- (CGRect)_frameInCanvasWithTableRep:(id)a3;
- (int)direction;
- (unsigned)rowIndex;
- (void)setRowIndex:(unsigned __int16)a3;
@end

@implementation TSTTableRowAccessibilityElement

- (unsigned)rowIndex
{
  return (unsigned __int16)[(TSTTableColumnOrRowAccessibilityElement *)self cellID];
}

- (void)setRowIndex:(unsigned __int16)a3
{
}

- (int)direction
{
  return 0;
}

- (CGRect)_frameInCanvasWithTableRep:(id)a3
{
  unsigned int v4 = [(TSTTableRowAccessibilityElement *)self rowIndex];
  LODWORD(v5) = (unsigned __int16)[a3 tsaxColumnsCount];
  if (v5 >= 0xFF) {
    uint64_t v5 = 255;
  }
  else {
    uint64_t v5 = v5;
  }

  [a3 tsaxDeviceBoundsForCellRange:v4 | (unint64_t)(v5 << 32) | 0x1000000000000];
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

@end