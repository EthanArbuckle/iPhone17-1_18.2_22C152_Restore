@interface TSTCellRegionRowMajorReverseIterator
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)getNext;
- (TSTCellRegionRowMajorReverseIterator)initWithCellRegion:(id)a3;
@end

@implementation TSTCellRegionRowMajorReverseIterator

- (TSTCellRegionRowMajorReverseIterator)initWithCellRegion:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSTCellRegionRowMajorReverseIterator;
  v4 = [(TSTCellRegionRowMajorReverseIterator *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [a3 fillCellRangeRowMajorSet:&v4->super.mCellRangeSet leftToRight:0];
    v5->super.mBoundingCellRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)[a3 boundingCellRange];
    v5->super.mCellID = *($5CFCD363C99B2F51819B67AD7AD2E060 *)((char *)v5->super.mCellRangeSet.__tree_.__begin_node_ + 26);
  }
  return v5;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)getNext
{
  v6.receiver = self;
  v6.super_class = (Class)TSTCellRegionRowMajorReverseIterator;
  unsigned int v2 = [(TSTCellRegionRowMajorIterator *)&v6 getNext];
  unsigned int v3 = HIWORD(v2);
  if ((~v2 & 0xFF0000) != 0 && (unsigned __int16)~(_WORD)v2 != 0) {
    LOBYTE(v3) = -2 - BYTE2(v2);
  }
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)(v2 & 0xFF00FFFF | (v3 << 16));
}

@end