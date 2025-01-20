@interface TSTLayoutSpace
- (BOOL)drawBlackAndWhite;
- (BOOL)drawPreventAntialias;
- (BOOL)headerColumnsRepeat;
- (BOOL)headerRowsRepeat;
- (BOOL)isColumns;
- (BOOL)isCorner;
- (BOOL)isFrozen;
- (BOOL)isMain;
- (BOOL)isRepeat;
- (BOOL)isRows;
- (BOOL)layoutDirectionIsLeftToRight;
- (BOOL)p_getLayoutDirectionLeftToRight;
- (CGAffineTransform)transformFromCanvas;
- (CGAffineTransform)transformFromDevice;
- (CGAffineTransform)transformToCanvas;
- (CGAffineTransform)transformToDevice;
- (CGPoint)tableOffset;
- (TSTLayout)layout;
- (TSTLayoutSpace)initWithLayoutSpaceBundle:(id)a3 type:(int)a4;
- (TSTLayoutSpaceBundle)bundle;
- (TSTMasterLayout)masterLayout;
- (double)viewScale;
- (id)description;
- (int)layoutSpaceType;
- (int)validate:(id)a3;
- (int)validateCoordinateCache:(id)a3;
- (int)validateTableOffset:(id)a3;
- (void)dealloc;
- (void)invalidateCoordinates;
- (void)invalidateTableOffset;
- (void)lockForRead;
- (void)lockForWrite;
- (void)setDrawBlackAndWhite:(BOOL)a3;
- (void)setDrawPreventAntialias:(BOOL)a3;
- (void)setHeaderColumnsRepeat:(BOOL)a3;
- (void)setHeaderRowsRepeat:(BOOL)a3;
- (void)setTableOffset:(CGPoint)a3;
- (void)setTransformFromCanvas:(CGAffineTransform *)a3;
- (void)setTransformFromDevice:(CGAffineTransform *)a3;
- (void)setTransformToCanvas:(CGAffineTransform *)a3;
- (void)setTransformToDevice:(CGAffineTransform *)a3;
- (void)setViewScale:(double)a3;
- (void)unlock;
- (void)validateCachedFrames;
@end

@implementation TSTLayoutSpace

- (TSTLayout)layout
{
  v2 = [(TSTLayoutSpace *)self bundle];

  return [(TSTLayoutSpaceBundle *)v2 layout];
}

- (TSTMasterLayout)masterLayout
{
  v2 = [(TSTLayoutSpaceBundle *)[(TSTLayoutSpace *)self bundle] layout];

  return [(TSTLayout *)v2 masterLayout];
}

- (BOOL)p_getLayoutDirectionLeftToRight
{
  return [(TSSStyle *)[(TSTTableModel *)[[(TSTLayoutSpace *)self layout] tableModel] tableStyle] intValueForProperty:798] != 1;
}

- (BOOL)isMain
{
  return self->mLayoutSpaceType == 0;
}

- (BOOL)isFrozen
{
  return (self->mLayoutSpaceType - 1) < 3;
}

- (BOOL)isRepeat
{
  return (self->mLayoutSpaceType - 4) < 3;
}

- (BOOL)isColumns
{
  int mLayoutSpaceType = self->mLayoutSpaceType;
  return mLayoutSpaceType == 2 || mLayoutSpaceType == 5;
}

- (BOOL)isRows
{
  int mLayoutSpaceType = self->mLayoutSpaceType;
  return mLayoutSpaceType == 3 || mLayoutSpaceType == 6;
}

- (BOOL)isCorner
{
  int mLayoutSpaceType = self->mLayoutSpaceType;
  return mLayoutSpaceType == 1 || mLayoutSpaceType == 4;
}

- (TSTLayoutSpace)initWithLayoutSpaceBundle:(id)a3 type:(int)a4
{
  v16.receiver = self;
  v16.super_class = (Class)TSTLayoutSpace;
  v6 = [(TSTLayoutSpace *)&v16 init];
  v7 = v6;
  if (v6)
  {
    v6->mBundle = (TSTLayoutSpaceBundle *)a3;
    v6->int mLayoutSpaceType = a4;
    v6->mInvalidFlags = ($0970EE139DC40728BCB6A4443C122593)257;
    TSTLayoutSpaceSetGridRange((uint64_t)v6, -1, -1);
    *(_WORD *)&v7->mHeaderColumnsRepeat = 0;
    v7->mViewScale = 1.0;
    uint64_t v8 = MEMORY[0x263F000D0];
    long long v9 = *MEMORY[0x263F000D0];
    long long v10 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v7->mTransformToCanvas.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v7->mTransformToCanvas.c = v10;
    long long v11 = *(_OWORD *)(v8 + 32);
    *(_OWORD *)&v7->mTransformToCanvas.tx = v11;
    *(_OWORD *)&v7->mTransformFromCanvas.a = v9;
    *(_OWORD *)&v7->mTransformFromCanvas.c = v10;
    *(_OWORD *)&v7->mTransformFromCanvas.tx = v11;
    *(_OWORD *)&v7->mTransformToDevice.c = v10;
    *(_OWORD *)&v7->mTransformToDevice.a = v9;
    *(_OWORD *)&v7->mTransformToDevice.tx = v11;
    *(_OWORD *)&v7->mTransformFromDevice.a = v9;
    *(_OWORD *)&v7->mTransformFromDevice.c = v10;
    *(_OWORD *)&v7->mTransformFromDevice.tx = v11;
    *(_WORD *)&v7->mDrawBlackAndWhite = 256;
    v12 = (CGPoint *)MEMORY[0x263F001A8];
    *(_OWORD *)&v7->mHeaderRowColumnCoordinates = 0u;
    *(_OWORD *)&v7->mHeaderColumnRowCoordinates = 0u;
    CGPoint v13 = *v12;
    CGSize v14 = (CGSize)v12[1];
    v7->mCachedFrame.origin = *v12;
    v7->mCachedFrame.size = v14;
    v7->mCachedAlignedFrame.origin = v13;
    v7->mCachedAlignedFrame.size = v14;
    v7->mCachedStrokeFrame.origin = v13;
    v7->mCachedStrokeFrame.size = v14;
    v7->mCachedAlignedStrokeFrame.origin = v13;
    v7->mCachedAlignedStrokeFrame.size = v14;
    pthread_rwlock_init(&v7->mLock, 0);
    v7->mLayoutDirectionIsLeftToRight = [(TSTLayoutSpace *)v7 p_getLayoutDirectionLeftToRight];
  }
  return v7;
}

- (void)dealloc
{
  self->mHeaderRowColumnCoordinates = 0;
  self->mBodyColumnCoordinates = 0;

  self->mHeaderColumnRowCoordinates = 0;
  self->mBodyRowCoordinates = 0;
  pthread_rwlock_destroy(&self->mLock);
  v3.receiver = self;
  v3.super_class = (Class)TSTLayoutSpace;
  [(TSTLayoutSpace *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t mLayoutSpaceType = self->mLayoutSpaceType;
  if (mLayoutSpaceType > 6) {
    v7 = @"TSTLayoutSpaceTypeUnknown";
  }
  else {
    v7 = off_2646B3A30[mLayoutSpaceType];
  }
  unsigned int column = self->mGridRange.topLeft.column;
  uint64_t row = self->mGridRange.topLeft.row;
  $3C36844D3994842D9102894F8152D7DE bottomRight = self->mGridRange.bottomRight;
  long long v11 = NSString;
  if ((row & column) == 0xFFFFFFFF)
  {
    CGPoint v13 = @"{invalid, invalid}";
  }
  else
  {
    if (column == -1)
    {
      uint64_t v12 = [NSString stringWithFormat:@"{invalid, %u}", self->mGridRange.topLeft.row, v19];
    }
    else if (row == -1)
    {
      uint64_t v12 = [NSString stringWithFormat:@"{%u, invalid}", self->mGridRange.topLeft.column, v19];
    }
    else
    {
      uint64_t v12 = [NSString stringWithFormat:@"{%u, %u}", self->mGridRange.topLeft.column, row];
    }
    CGPoint v13 = (__CFString *)v12;
  }
  if ((bottomRight.row & bottomRight.column) == -1)
  {
    CGSize v14 = @"{invalid, invalid}";
  }
  else if (bottomRight.column == -1)
  {
    CGSize v14 = (__CFString *)[NSString stringWithFormat:@"{invalid, %u}", HIDWORD(*(unint64_t *)&bottomRight), v19];
  }
  else if (bottomRight.row == -1)
  {
    CGSize v14 = (__CFString *)[NSString stringWithFormat:@"{%u, invalid}", bottomRight, v19];
  }
  else
  {
    CGSize v14 = (__CFString *)[NSString stringWithFormat:@"{%u, %u}", bottomRight, HIDWORD(*(unint64_t *)&bottomRight)];
  }
  uint64_t v15 = [v11 stringWithFormat:@"{%@->%@}", v13, v14];
  long long v16 = *(_OWORD *)&self->mTransformToDevice.c;
  *(_OWORD *)&transform.a = *(_OWORD *)&self->mTransformToDevice.a;
  *(_OWORD *)&transform.c = v16;
  *(_OWORD *)&transform.tx = *(_OWORD *)&self->mTransformToDevice.tx;
  v17 = NSStringFromCGAffineTransform(&transform);
  return (id)[v3 stringWithFormat:@"<%@ %p type=%@ gridRange=%@ transformToDevice=%@ tableOffset=%@ invalidFlags=%d>", v5, self, v7, v15, v17, NSStringFromCGPoint(self->mTableOffset), self->mInvalidFlags.coordinates];
}

- (void)lockForRead
{
  uint64_t v2 = pthread_rwlock_rdlock(&self->mLock);
  if (v2)
  {
    uint64_t v3 = v2;
    v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSTLayoutSpace lockForRead]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTLayoutSpace.mm"), 287, @"Unable to lock layout space for reading: %d", v3);
  }
}

- (void)lockForWrite
{
  uint64_t v2 = pthread_rwlock_wrlock(&self->mLock);
  if (v2)
  {
    uint64_t v3 = v2;
    v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSTLayoutSpace lockForWrite]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTLayoutSpace.mm"), 311, @"Unable to lock layout space for writing: %d", v3);
  }
}

- (void)unlock
{
  uint64_t v2 = pthread_rwlock_unlock(&self->mLock);
  if (v2)
  {
    uint64_t v3 = v2;
    v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSTLayoutSpace unlock]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTLayoutSpace.mm"), 321, @"Unable to unlock layout space: %d", v3);
  }
}

- (void)invalidateCoordinates
{
  [(TSTLayoutSpace *)self lockForWrite];
  self->mInvalidFlags.coordinates = 1;

  [(TSTLayoutSpace *)self unlock];
}

- (void)invalidateTableOffset
{
  [(TSTLayoutSpace *)self lockForWrite];
  self->mInvalidFlags.tableOffset = 1;

  [(TSTLayoutSpace *)self unlock];
}

- (int)validate:(id)a3
{
  if (!*(_WORD *)&self->mInvalidFlags) {
    return 0;
  }
  [(TSTLayoutSpace *)self lockForWrite];
  self->mLayoutDirectionIsLeftToRight = [(TSTLayoutSpace *)self p_getLayoutDirectionLeftToRight];
  [(TSTLayoutSpace *)self validateCachedFrames];
  int v5 = [(TSTLayoutSpace *)self validateCoordinateCache:a3];
  int v7 = [(TSTLayoutSpace *)self validateTableOffset:a3] | v5;
  [(TSTLayoutSpace *)self unlock];
  return v7;
}

- (int)validateTableOffset:(id)a3
{
  if (!self->mInvalidFlags.tableOffset) {
    return 0;
  }
  if (a3)
  {
    [a3 tableOffset];
    double v5 = v4;
    double v7 = v6;
    int v8 = 0;
  }
  else
  {
    double v5 = *MEMORY[0x263F00148];
    double v7 = *(double *)(MEMORY[0x263F00148] + 8);
    $3C36844D3994842D9102894F8152D7DE topLeft = self->mGridRange.topLeft;
    $3C36844D3994842D9102894F8152D7DE bottomRight = self->mGridRange.bottomRight;
    BOOL v12 = topLeft.column == -1 || bottomRight.column == -1 || topLeft.column > bottomRight.column;
    unint64_t v13 = HIDWORD(*(unint64_t *)&topLeft);
    unint64_t v14 = HIDWORD(*(unint64_t *)&bottomRight);
    if (!v12 && v13 != -1 && v14 != -1 && v13 <= v14)
    {
      int Range = TSTLayoutSpaceGetRange((uint64_t)self);
      double v19 = TSTMasterLayoutStrokeHeightOfGridRow([(TSTLayoutSpace *)self masterLayout], (unsigned __int16)Range, 0, 0xFFFFFFFF);
      double v5 = -floor(v5- TSTMasterLayoutStrokeWidthOfGridColumn([(TSTLayoutSpace *)self masterLayout], BYTE2(Range), 0, 0xFFFFFFFF)* 0.5+ -1.0+ 0.00000011920929);
      TSTLayoutGetTableNameHeight((uint64_t)[(TSTLayoutSpace *)self layout]);
      double v7 = v20 - floor(v7 - v19 * 0.5 + -1.0 + 0.00000011920929);
    }
    [(TSTLayoutSpace *)self tableOffset];
    if (v22 == v7 && v21 == v5) {
      int v8 = 0;
    }
    else {
      int v8 = 3;
    }
  }
  -[TSTLayoutSpace setTableOffset:](self, "setTableOffset:", v5, v7);
  self->mInvalidFlags.tableOffset = 0;
  return v8;
}

- (void)setTransformToCanvas:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->a;
  long long v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->mTransformToCanvas.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->mTransformToCanvas.c = v5;
  *(_OWORD *)&self->mTransformToCanvas.a = v4;
  long long v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v8.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v8.c = v6;
  *(_OWORD *)&v8.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformInvert(&v9, &v8);
  long long v7 = *(_OWORD *)&v9.c;
  *(_OWORD *)&self->mTransformFromCanvas.a = *(_OWORD *)&v9.a;
  *(_OWORD *)&self->mTransformFromCanvas.c = v7;
  *(_OWORD *)&self->mTransformFromCanvas.tx = *(_OWORD *)&v9.tx;
}

- (void)setViewScale:(double)a3
{
  if (self->mViewScale != a3)
  {
    self->mViewScale = a3;
    self->mInvalidFlags.tableOffset = 1;
  }
}

- (void)validateCachedFrames
{
  if (self->mInvalidFlags.coordinates || self->mInvalidFlags.tableOffset)
  {
    CGPoint v2 = (CGPoint)*MEMORY[0x263F001A8];
    CGSize v3 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
    self->mCachedFrame.origin = (CGPoint)*MEMORY[0x263F001A8];
    self->mCachedFrame.size = v3;
    self->mCachedAlignedFrame.origin = v2;
    self->mCachedAlignedFrame.size = v3;
    self->mCachedStrokeFrame.origin = v2;
    self->mCachedStrokeFrame.size = v3;
    self->mCachedAlignedStrokeFrame.origin = v2;
    self->mCachedAlignedStrokeFrame.size = v3;
  }
}

- (int)validateCoordinateCache:(id)a3
{
  __int16 v30 = 0;
  if (!self->mInvalidFlags.coordinates) {
    return 0;
  }
  if ((self->mLayoutSpaceType - 1) > 5)
  {
    TopLeftCornerGridint Range = TSTLayoutSpaceGetTopLeftCornerGridRange(self);
    uint64_t v12 = TopLeftCornerGridRange;
    if (TopLeftCornerGridRange == -1
      || (uint64_t v13 = v11, v11 == -1)
      || TopLeftCornerGridRange > v11
      || HIDWORD(TopLeftCornerGridRange) == -1
      || HIDWORD(v11) == -1
      || HIDWORD(TopLeftCornerGridRange) > HIDWORD(v11))
    {
      HeaderColumnsGridint Range = TSTLayoutSpaceGetHeaderColumnsGridRange((uint64_t)self);
      RowCoordinates = 0;
      if (HeaderColumnsGridRange != -1
        && v15 != -1
        && HeaderColumnsGridRange <= v15)
      {
        RowCoordinates = 0;
        if (HIDWORD(HeaderColumnsGridRange) != -1
          && HIDWORD(v15) != -1
          && HIDWORD(HeaderColumnsGridRange) <= HIDWORD(v15))
        {
          RowCoordinates = (TSTCoordinateArray *)TSTLayoutSpaceCreateRowCoordinates(self, HeaderColumnsGridRange, v15, self->mHeaderColumnRowCoordinates, (char *)&v30);
        }
      }
      HeaderRowsGridint Range = TSTLayoutSpaceGetHeaderRowsGridRange((uint64_t)self);
      uint64_t v12 = HeaderRowsGridRange;
      ColumnCoordinates = 0;
      if (HeaderRowsGridRange == -1) {
        goto LABEL_26;
      }
      uint64_t v13 = v17;
      if (v17 == -1) {
        goto LABEL_26;
      }
      if (HeaderRowsGridRange > v17) {
        goto LABEL_26;
      }
      ColumnCoordinates = 0;
      if (HIDWORD(HeaderRowsGridRange) == -1 || HIDWORD(v17) == -1 || HIDWORD(HeaderRowsGridRange) > HIDWORD(v17)) {
        goto LABEL_26;
      }
    }
    else
    {
      RowCoordinates = (TSTCoordinateArray *)TSTLayoutSpaceCreateRowCoordinates(self, TopLeftCornerGridRange, v11, self->mHeaderColumnRowCoordinates, (char *)&v30);
    }
    ColumnCoordinates = (TSTCoordinateArray *)TSTLayoutSpaceCreateColumnCoordinates(self, v12, v13, self->mHeaderRowColumnCoordinates, (char *)&v30 + 1);
LABEL_26:
    ExtendedBodyGridint Range = (unint64_t)TSTLayoutSpaceGetExtendedBodyGridRange(self);
    unint64_t v20 = ExtendedBodyGridRange;
    long long v7 = 0;
    if (ExtendedBodyGridRange == -1
      || (unint64_t v21 = v19, v19 == -1)
      || ExtendedBodyGridRange > v19
      || (long long v7 = 0, HIDWORD(ExtendedBodyGridRange) == -1)
      || HIDWORD(v19) == -1
      || HIDWORD(ExtendedBodyGridRange) > HIDWORD(v19))
    {
      CGAffineTransform v8 = 0;
    }
    else
    {
      CGAffineTransform v8 = (TSTCoordinateArray *)TSTLayoutSpaceCreateColumnCoordinates(self, ExtendedBodyGridRange, v19, self->mBodyColumnCoordinates, (char *)&v30 + 1);
      long long v7 = (TSTCoordinateArray *)TSTLayoutSpaceCreateRowCoordinates(self, v20, v21, self->mBodyRowCoordinates, (char *)&v30);
    }
    goto LABEL_34;
  }
  RowCoordinates = (TSTCoordinateArray *)TSTLayoutSpaceCreateRowCoordinates(self, *(void *)&self->mGridRange.topLeft, *(void *)&self->mGridRange.bottomRight, self->mHeaderColumnRowCoordinates, (char *)&v30);
  ColumnCoordinates = (TSTCoordinateArray *)TSTLayoutSpaceCreateColumnCoordinates(self, *(void *)&self->mGridRange.topLeft, *(void *)&self->mGridRange.bottomRight, self->mHeaderRowColumnCoordinates, (char *)&v30 + 1);
  long long v7 = 0;
  CGAffineTransform v8 = 0;
LABEL_34:

  self->mHeaderRowColumnCoordinates = 0;
  self->mBodyColumnCoordinates = 0;

  self->mHeaderColumnRowCoordinates = 0;
  self->mBodyRowCoordinates = 0;
  if (!self->mLayoutDirectionIsLeftToRight)
  {
    if (v8)
    {
      TSTLayoutSpaceGetExtendedBodyGridRange(self);
      bottomRight.unsigned int column = v22;
      uint64_t v24 = (uint64_t)v8;
    }
    else
    {
      $3C36844D3994842D9102894F8152D7DE bottomRight = self->mGridRange.bottomRight;
      if (ColumnCoordinates)
      {
        uint64_t v24 = (uint64_t)ColumnCoordinates;
      }
      else
      {
        v25 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v26 = [NSString stringWithUTF8String:"-[TSTLayoutSpace validateCoordinateCache:]"];
        objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTLayoutSpace.mm"), 3121, @"There are no column coordinates");
        uint64_t v24 = 0;
      }
    }
    BOOL v27 = [(TSTLayoutSpace *)self isMain];
    if (!a3 || v27) {
      double Coordinate = TSTCoordinateArrayGetCoordinate(v24, bottomRight.column + 1);
    }
    else {
      double Coordinate = TSTLayoutSpaceGetRawTableCoordinateForGridColumn((TSTLayoutSpace *)a3, (*((_DWORD *)a3 + 8) + 1));
    }
    double v29 = Coordinate;
    if (v8) {
      [(TSTCoordinateArray *)v8 hasRightToLeftOrderingWithWidth:Coordinate];
    }
    if (ColumnCoordinates) {
      [(TSTCoordinateArray *)ColumnCoordinates hasRightToLeftOrderingWithWidth:v29];
    }
  }
  self->mHeaderRowColumnCoordinates = ColumnCoordinates;
  self->mBodyColumnCoordinates = v8;
  self->mHeaderColumnRowCoordinates = RowCoordinates;
  self->mBodyRowCoordinates = v7;
  self->mInvalidFlags.coordinates = 0;
  return HIBYTE(v30) | (2 * v30);
}

- (TSTLayoutSpaceBundle)bundle
{
  return self->mBundle;
}

- (int)layoutSpaceType
{
  return self->mLayoutSpaceType;
}

- (BOOL)layoutDirectionIsLeftToRight
{
  return self->mLayoutDirectionIsLeftToRight;
}

- (BOOL)headerColumnsRepeat
{
  return self->mHeaderColumnsRepeat;
}

- (void)setHeaderColumnsRepeat:(BOOL)a3
{
  self->mHeaderColumnsRepeat = a3;
}

- (BOOL)headerRowsRepeat
{
  return self->mHeaderRowsRepeat;
}

- (void)setHeaderRowsRepeat:(BOOL)a3
{
  self->mHeaderRowsRepeat = a3;
}

- (double)viewScale
{
  return self->mViewScale;
}

- (CGAffineTransform)transformToCanvas
{
  long long v3 = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].ty;
  return self;
}

- (CGAffineTransform)transformFromCanvas
{
  long long v3 = *(_OWORD *)&self[2].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].ty;
  return self;
}

- (void)setTransformFromCanvas:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->mTransformFromCanvas.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->mTransformFromCanvas.c = v4;
  *(_OWORD *)&self->mTransformFromCanvas.a = v3;
}

- (CGAffineTransform)transformToDevice
{
  long long v3 = *(_OWORD *)&self[3].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].ty;
  return self;
}

- (void)setTransformToDevice:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->mTransformToDevice.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->mTransformToDevice.c = v4;
  *(_OWORD *)&self->mTransformToDevice.a = v3;
}

- (CGAffineTransform)transformFromDevice
{
  long long v3 = *(_OWORD *)&self[4].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[4].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[4].ty;
  return self;
}

- (void)setTransformFromDevice:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->mTransformFromDevice.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->mTransformFromDevice.c = v4;
  *(_OWORD *)&self->mTransformFromDevice.a = v3;
}

- (BOOL)drawBlackAndWhite
{
  return self->mDrawBlackAndWhite;
}

- (void)setDrawBlackAndWhite:(BOOL)a3
{
  self->mDrawBlackAndWhite = a3;
}

- (BOOL)drawPreventAntialias
{
  return self->mDrawPreventAntialias;
}

- (void)setDrawPreventAntialias:(BOOL)a3
{
  self->mDrawPreventAntialias = a3;
}

- (CGPoint)tableOffset
{
  double x = self->mTableOffset.x;
  double y = self->mTableOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTableOffset:(CGPoint)a3
{
  self->mTableOffset = a3;
}

@end