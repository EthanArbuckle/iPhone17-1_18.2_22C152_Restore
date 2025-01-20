@interface TSTLayoutHint
+ (BOOL)supportsSecureCoding;
+ (Class)archivedHintClass;
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)cacheHintID;
- ($CA3468F20078D5D2DB35E78E73CA60DA)cellRange;
- (BOOL)horizontal;
- (BOOL)isFirstHint;
- (BOOL)isValid;
- (BOOL)overlapsWithSelection:(id)a3;
- (CGSize)effectiveSize;
- (CGSize)maximumSize;
- (NSNumber)partitioningPass;
- (NSString)description;
- (TSTLayout)layout;
- (TSTLayoutHint)init;
- (TSTLayoutHint)initWithCoder:(id)a3;
- (TSTLayoutHint)initWithRange:(id)a3 hintId:(id)a4 partitionPosition:(unsigned int)a5 maximumSize:(CGSize)a6 effectiveSize:(CGSize)a7 layout:(id)a8 validity:(BOOL)a9 horizontal:(BOOL)a10;
- (id)copyForArchiving;
- (id)firstChildHint;
- (id)lastChildHint;
- (unsigned)partitionPosition;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)release;
- (void)setCacheHintID:(id)a3;
- (void)setCellRange:(id)a3;
- (void)setEffectiveSize:(CGSize)a3;
- (void)setHorizontal:(BOOL)a3;
- (void)setIsValid:(BOOL)a3;
- (void)setLayout:(id)a3;
- (void)setMaximumSize:(CGSize)a3;
- (void)setPartitionPosition:(unsigned int)a3;
- (void)setPartitioningPass:(id)a3;
@end

@implementation TSTLayoutHint

- (TSTLayoutHint)initWithRange:(id)a3 hintId:(id)a4 partitionPosition:(unsigned int)a5 maximumSize:(CGSize)a6 effectiveSize:(CGSize)a7 layout:(id)a8 validity:(BOOL)a9 horizontal:(BOOL)a10
{
  CGFloat height = a7.height;
  CGFloat width = a7.width;
  CGFloat v17 = a6.height;
  CGFloat v18 = a6.width;
  v21.receiver = self;
  v21.super_class = (Class)TSTLayoutHint;
  result = [(TSTLayoutHint *)&v21 init];
  if (result)
  {
    result->mCellRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)a3;
    result->mCacheHintID = ($5CFCD363C99B2F51819B67AD7AD2E060)a4;
    result->mPartitionPosition = a5;
    result->mMaximumSize.CGFloat width = v18;
    result->mMaximumSize.CGFloat height = v17;
    result->mEffectiveSize.CGFloat width = width;
    result->mEffectiveSize.CGFloat height = height;
    result->mLayout = (TSTLayout *)a8;
    result->mIsValid = a9;
    result->mHorizontal = a10;
    result->mPartitioningPass = 0;
  }
  return result;
}

- (TSTLayoutHint)init
{
  return -[TSTLayoutHint initWithRange:hintId:partitionPosition:maximumSize:effectiveSize:layout:validity:horizontal:](self, "initWithRange:hintId:partitionPosition:maximumSize:effectiveSize:layout:validity:horizontal:", 0xFFFFFFLL, 0, 0, 0, 0, 0, INFINITY, INFINITY, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
}

- (void)dealloc
{
  mLayout = self->mLayout;
  if (mLayout) {
    [(TSTLayout *)mLayout setLayoutHint:0];
  }
  self->mLayout = 0;

  self->mPartitioningPass = 0;
  v4.receiver = self;
  v4.super_class = (Class)TSTLayoutHint;
  [(TSTLayoutHint *)&v4 dealloc];
}

- (void)release
{
  v2.receiver = self;
  v2.super_class = (Class)TSTLayoutHint;
  [(TSTLayoutHint *)&v2 release];
}

- (id)copyForArchiving
{
  v3 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRange:hintId:partitionPosition:maximumSize:effectiveSize:layout:validity:horizontal:", *(void *)&self->mCellRange, *(_DWORD *)&self->mCacheHintID, self->mPartitionPosition, 0, self->mIsValid, self->mHorizontal, self->mMaximumSize.width, self->mMaximumSize.height, self->mEffectiveSize.width, self->mEffectiveSize.height);
  if (v3)
  {
    v3[3] = self->mPartitioningPass;
  }
  else
  {
    objc_super v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSTLayoutHint copyForArchiving]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTLayoutHint.mm"), 111, @"invalid nil value for '%s'", "copy");
  }
  return v3;
}

- (BOOL)overlapsWithSelection:(id)a3
{
  objc_opt_class();
  objc_super v4 = (void *)TSUDynamicCast();
  if (!v4) {
    return (char)v4;
  }
  unint64_t v5 = objc_msgSend((id)objc_msgSend(v4, "cellRegion"), "boundingCellRange");
  unint64_t v6 = 0;
  if ((_WORD)v5 == 0xFFFF) {
    goto LABEL_25;
  }
  unint64_t v7 = 0;
  if ((v5 & 0xFF0000) == 0xFF0000) {
    goto LABEL_26;
  }
  if (HIWORD(v5)) {
    BOOL v8 = (v5 & 0xFFFF00000000) == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    unint64_t v6 = 0;
    unint64_t v7 = 0;
    goto LABEL_26;
  }
  unint64_t v6 = 0;
  $6C2899CC353BE70625C5C4ACBB5C74E2 mCellRange = self->mCellRange;
  if (self->mCellRange.origin.row == 0xFFFF) {
    goto LABEL_25;
  }
  unint64_t v7 = 0;
  if ((*(void *)&mCellRange & 0xFF0000) == 0xFF0000) {
    goto LABEL_26;
  }
  unint64_t v6 = 0;
  if (!HIWORD(*(unint64_t *)&mCellRange))
  {
LABEL_25:
    unint64_t v7 = 0;
    goto LABEL_26;
  }
  unint64_t v7 = 0;
  if ((*(void *)&mCellRange & 0xFFFF00000000) != 0)
  {
    unint64_t v6 = 0;
    unsigned int column = BYTE2(v5);
    if (BYTE2(v5) <= mCellRange.origin.column) {
      unsigned int column = mCellRange.origin.column;
    }
    unsigned int v11 = (unsigned __int16)v5;
    if ((unsigned __int16)v5 <= mCellRange.origin.row) {
      unsigned int v11 = (unsigned __int16)*(void *)&self->mCellRange;
    }
    unsigned int v12 = (LOBYTE(mCellRange.size.numberOfColumns) + mCellRange.origin.column - 1);
    if ((BYTE4(v5) + BYTE2(v5) - 1) < v12) {
      unsigned int v12 = (BYTE4(v5) + BYTE2(v5) - 1);
    }
    unsigned int v13 = (unsigned __int16)(v5 + HIWORD(v5) - 1);
    unsigned __int16 v14 = mCellRange.origin.row + mCellRange.size.numberOfRows - 1;
    if (v13 >= v14) {
      unsigned int v13 = v14;
    }
    if (v11 <= v13)
    {
      unint64_t v7 = 0;
      if (column <= v12)
      {
        unint64_t v7 = ((unint64_t)(v13 - v11) << 48) + 0x1000000000000;
        unint64_t v6 = (unint64_t)(unsigned __int16)(v12 - column + 1) << 32;
      }
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_26:
  LOBYTE(v4) = ((v6 | v7) & 0xFFFF00000000) != 0 && HIWORD(v7) != 0;
  return (char)v4;
}

- (id)firstChildHint
{
  return 0;
}

- (id)lastChildHint
{
  return 0;
}

+ (Class)archivedHintClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isFirstHint
{
  return (self->mCellRange.origin.row | self->mCellRange.origin.column) == 0;
}

- (void)invalidate
{
  if ([(TSTLayoutHint *)self layout]) {
    [[(TSTLayoutHint *)self layout] invalidate];
  }

  [(TSTLayoutHint *)self setIsValid:0];
}

- (NSString)description
{
  v3 = (NSString *)[MEMORY[0x263F089D8] string];
  uint64_t v4 = (uint64_t)[(TSTLayoutHint *)self cacheHintID];
  -[NSString appendFormat:](v3, "appendFormat:", @"ID: %@ ", [NSString stringWithFormat:@"(%hu, %hu)", BYTE2(v4), (unsigned __int16)v4]);
  $CA3468F20078D5D2DB35E78E73CA60DA v5 = [(TSTLayoutHint *)self cellRange];
  unint64_t v6 = NSString;
  uint64_t v7 = [NSString stringWithFormat:@"(%hu, %hu)", v5.var0.var1, v5.var0.var0];
  -[NSString appendFormat:](v3, "appendFormat:", @"Range: %@ ", [v6 stringWithFormat:@"(%@, %@)", v7, objc_msgSend(NSString, "stringWithFormat:", @"%hux%hu", v5.var1.var0, HIWORD(*(unint64_t *)&v5))]);
  if ([(TSTLayoutHint *)self horizontal]) {
    BOOL v8 = @"H";
  }
  else {
    BOOL v8 = @"V";
  }
  [(NSString *)v3 appendString:v8];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TSTLayoutHint)initWithCoder:(id)a3
{
  $CA3468F20078D5D2DB35E78E73CA60DA v5 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"maximumSize"];
  if (v5)
  {
    [v5 CGSizeValue];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    double v7 = *MEMORY[0x263F001B0];
    double v9 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  v10 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"effectiveSize"];
  if (v10)
  {
    [v10 CGSizeValue];
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v12 = *MEMORY[0x263F001B0];
    double v14 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  v15 = -[TSTLayoutHint initWithRange:hintId:partitionPosition:maximumSize:effectiveSize:layout:validity:horizontal:](self, "initWithRange:hintId:partitionPosition:maximumSize:effectiveSize:layout:validity:horizontal:", ([a3 decodeIntegerForKey:@"cellRangeSizeRows"] << 48) | ((unint64_t)objc_msgSend(a3, "decodeIntegerForKey:", @"cellRangeSizeColumns") << 32) | ((unint64_t)objc_msgSend(a3, "decodeIntegerForKey:", @"cellRangeOriginColumn") << 16) | (unsigned __int16)objc_msgSend(a3, "decodeIntegerForKey:", @"cellRangeOriginRow"), (unsigned __int16)objc_msgSend(a3, "decodeIntegerForKey:", @"cacheHintIDRow") | ((unint64_t)objc_msgSend(a3, "decodeIntegerForKey:", @"cacheHintIDColumn") << 16), objc_msgSend(a3, "decodeIntForKey:", @"partitionPosition"), 0, objc_msgSend(a3, "decodeBoolForKey:", @"isValid"), objc_msgSend(a3, "decodeBoolForKey:", @"horizontal"), v7, v9, v12, v14);
  if (v15) {
    v15->mPartitioningPass = (NSNumber *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"partitioningPass"), "copy");
  }
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInteger:self->mCellRange.origin.row forKey:@"cellRangeOriginRow"];
  [a3 encodeInteger:self->mCellRange.origin.column forKey:@"cellRangeOriginColumn"];
  [a3 encodeInteger:self->mCellRange.size.numberOfColumns forKey:@"cellRangeSizeColumns"];
  [a3 encodeInteger:self->mCellRange.size.numberOfRows forKey:@"cellRangeSizeRows"];
  [a3 encodeInteger:self->mCacheHintID.column forKey:@"cacheHintIDColumn"];
  [a3 encodeInteger:self->mCacheHintID.row forKey:@"cacheHintIDRow"];
  [a3 encodeBool:self->mIsValid forKey:@"isValid"];
  [a3 encodeInt:self->mPartitionPosition forKey:@"partitionPosition"];
  [a3 encodeBool:self->mHorizontal forKey:@"horizontal"];
  [a3 encodeObject:self->mPartitioningPass forKey:@"partitioningPass"];
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", self->mMaximumSize.width, self->mMaximumSize.height), @"maximumSize");
  uint64_t v5 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", self->mEffectiveSize.width, self->mEffectiveSize.height);

  [a3 encodeObject:v5 forKey:@"effectiveSize"];
}

- (BOOL)isValid
{
  return self->mIsValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->mIsValid = a3;
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)cellRange
{
  return ($CA3468F20078D5D2DB35E78E73CA60DA)self->mCellRange;
}

- (void)setCellRange:(id)a3
{
  self->$6C2899CC353BE70625C5C4ACBB5C74E2 mCellRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)a3;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)cacheHintID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->mCacheHintID;
}

- (void)setCacheHintID:(id)a3
{
  self->mCacheHintID = ($5CFCD363C99B2F51819B67AD7AD2E060)a3;
}

- (unsigned)partitionPosition
{
  return self->mPartitionPosition;
}

- (void)setPartitionPosition:(unsigned int)a3
{
  self->mPartitionPosition = a3;
}

- (CGSize)maximumSize
{
  double width = self->mMaximumSize.width;
  double height = self->mMaximumSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMaximumSize:(CGSize)a3
{
  self->mMaximumSize = a3;
}

- (CGSize)effectiveSize
{
  double width = self->mEffectiveSize.width;
  double height = self->mEffectiveSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setEffectiveSize:(CGSize)a3
{
  self->mEffectiveSize = a3;
}

- (TSTLayout)layout
{
  return self->mLayout;
}

- (void)setLayout:(id)a3
{
  self->mLayout = (TSTLayout *)a3;
}

- (BOOL)horizontal
{
  return self->mHorizontal;
}

- (void)setHorizontal:(BOOL)a3
{
  self->mHorizontal = a3;
}

- (NSNumber)partitioningPass
{
  return self->mPartitioningPass;
}

- (void)setPartitioningPass:(id)a3
{
}

@end