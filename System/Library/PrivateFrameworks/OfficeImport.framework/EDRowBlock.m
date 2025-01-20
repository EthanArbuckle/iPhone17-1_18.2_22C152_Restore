@interface EDRowBlock
+ (id)rowBlock;
- (EDCellHeader)addCellWithColumnNumber:(unsigned int)a3 type:(int)a4 isFormulaCell:(BOOL)a5 rowInfo:(EDRowInfo *)a6 rowBlocks:(id)a7;
- (EDCellHeader)cellAtIndex:(unsigned int)a3 rowInfo:(EDRowInfo *)a4;
- (EDCellHeader)cellWithColumnNumber:(unsigned int)a3 rowInfo:(EDRowInfo *)a4;
- (EDRowBlock)init;
- (EDRowInfo)addRowInfoWithRowNumber:(unsigned int)a3 cellCountHint:(unsigned int)a4;
- (EDRowInfo)rowInfoAtIndex:(unsigned int)a3;
- (EDRowInfo)rowInfoWithRowNumber:(unsigned int)a3;
- (EDRowInfo)rowInfoWithRowNumber:(unsigned int)a3 createIfNil:(BOOL)a4;
- (id)description;
- (unint64_t)index;
- (unint64_t)startOfCellsOrThrow;
- (unsigned)expectedIndexOfCellWithColumnNumber:(unsigned int)a3 rowInfo:(EDRowInfo *)a4;
- (unsigned)firstRowNumber;
- (unsigned)indexOfCellWithColumnNumber:(unsigned int)a3 rowInfo:(EDRowInfo *)a4;
- (unsigned)indexOfRowInfoWithRowNumber:(unsigned int)a3;
- (unsigned)lastRowNumber;
- (unsigned)maxRowNumber;
- (unsigned)minRowNumber;
- (unsigned)rowCount;
- (void)archiveByAppendingToMutableData:(__CFData *)a3;
- (void)checkCellOffsetOrThrow:(unint64_t)a3;
- (void)dealloc;
- (void)doneWithContent;
- (void)incrementIndex;
- (void)removeCellAtIndex:(unsigned int)a3 rowInfo:(EDRowInfo *)a4;
- (void)setIndex:(unint64_t)a3;
- (void)unarchiveFromData:(__CFData *)a3 offset:(unint64_t *)a4;
@end

@implementation EDRowBlock

+ (id)rowBlock
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (EDRowBlock)init
{
  v7.receiver = self;
  v7.super_class = (Class)EDRowBlock;
  id v2 = [(EDRowBlock *)&v7 init];
  if (v2)
  {
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    v2->mPackedData = Mutable;
    if (Mutable)
    {
      CFDataIncreaseLength(Mutable, 48);
      MutableBytePtr = CFDataGetMutableBytePtr(v2->mPackedData);
      if (MutableBytePtr) {
        *((_DWORD *)MutableBytePtr + 4) = 24;
      }
    }
    v2->mCellOffsets = CFDataCreateMutable(v3, 0);
  }
  return v2;
}

- (void)setIndex:(unint64_t)a3
{
  mPackedData = self->mPackedData;
  if (mPackedData && self->mCellOffsets)
  {
    MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
    objc_super v7 = CFDataGetMutableBytePtr(self->mCellOffsets);
    if (MutableBytePtr) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8) {
      *((void *)MutableBytePtr + 1) = a3;
    }
  }
}

- (EDRowInfo)rowInfoWithRowNumber:(unsigned int)a3
{
  return [(EDRowBlock *)self rowInfoWithRowNumber:*(void *)&a3 createIfNil:0];
}

- (EDRowInfo)rowInfoWithRowNumber:(unsigned int)a3 createIfNil:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = -[EDRowBlock indexOfRowInfoWithRowNumber:](self, "indexOfRowInfoWithRowNumber:");
  if (v7 == -1)
  {
    if (v4)
    {
      return [(EDRowBlock *)self addRowInfoWithRowNumber:v5 cellCountHint:0];
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return [(EDRowBlock *)self rowInfoAtIndex:v7];
  }
}

- (unsigned)indexOfRowInfoWithRowNumber:(unsigned int)a3
{
  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    if (!self->mCellOffsets
      || ((MutableBytePtr = CFDataGetMutableBytePtr(mPackedData),
           uint64_t v7 = CFDataGetMutableBytePtr(self->mCellOffsets),
           MutableBytePtr)
        ? (BOOL v8 = v7 == 0)
        : (BOOL v8 = 1),
          v8))
    {
      LODWORD(mPackedData) = 0;
    }
    else
    {
      unsigned int v11 = *(_DWORD *)MutableBytePtr;
      v10 = MutableBytePtr + 24;
      uint64_t v9 = v11;
      while (1)
      {
        if (!v9)
        {
LABEL_12:
          LODWORD(mPackedData) = -1;
          return mPackedData;
        }
        unsigned int v12 = *(_DWORD *)&v10[24 * (v9 - 1) + 4];
        if (v12 == a3) {
          break;
        }
        --v9;
        if (v12 < a3) {
          goto LABEL_12;
        }
      }
      LODWORD(mPackedData) = v9 - 1;
    }
  }
  return mPackedData;
}

- (EDRowInfo)addRowInfoWithRowNumber:(unsigned int)a3 cellCountHint:(unsigned int)a4
{
  if ([(EDRowBlock *)self firstRowNumber] != -1
    && [(EDRowBlock *)self firstRowNumber] + 32 <= a3)
  {
    uint64_t v7 = [NSString stringWithUTF8String:"-[EDRowBlock addRowInfoWithRowNumber:cellCountHint:]"];
    BOOL v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/Excel/DOM/EDRowBlock.mm"];
    +[OITSUAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:277 isFatal:0 description:"Trying to add too many rows to the end of a row block!"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  if ([(EDRowBlock *)self firstRowNumber] != -1
    && a3 + 32 <= [(EDRowBlock *)self lastRowNumber])
  {
    uint64_t v9 = [NSString stringWithUTF8String:"-[EDRowBlock addRowInfoWithRowNumber:cellCountHint:]"];
    v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/Excel/DOM/EDRowBlock.mm"];
    +[OITSUAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:278 isFatal:0 description:"Trying to add too many rows to the start of a row block!"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  if (a4)
  {
    mPackedData = self->mPackedData;
    if (mPackedData)
    {
      if (self->mCellOffsets)
      {
        CFDataIncreaseLength(mPackedData, 8 * a4 + 24);
        CFDataIncreaseLength(self->mCellOffsets, 4 * a4);
      }
    }
  }
  unsigned int v12 = self->mPackedData;
  if (!v12 || !self->mCellOffsets) {
    return 0;
  }
  MutableBytePtr = CFDataGetMutableBytePtr(v12);
  v14 = CFDataGetMutableBytePtr(self->mCellOffsets);
  uint64_t v15 = 0;
  if (!MutableBytePtr) {
    return (EDRowInfo *)v15;
  }
  v16 = v14;
  if (!v14) {
    return (EDRowInfo *)v15;
  }
  unint64_t v17 = (unint64_t)&MutableBytePtr[CFDataGetLength(self->mPackedData)];
  v19 = MutableBytePtr + 24;
  uint64_t v18 = *(unsigned int *)MutableBytePtr;
  unsigned int v20 = v18 + 1;
  uint64_t v21 = 24 * v18;
  do
  {
    if (!v21)
    {
      unsigned int v20 = 0;
      goto LABEL_29;
    }
    unsigned int v22 = *(_DWORD *)&MutableBytePtr[v21 + 4];
    BOOL v23 = v22 == a3;
    if (v22 >= a3) {
      int v24 = 0;
    }
    else {
      int v24 = 6;
    }
    if (v23) {
      int v24 = 1;
    }
    if (v23) {
      uint64_t v15 = (uint64_t)&MutableBytePtr[v21];
    }
    --v20;
    v21 -= 24;
  }
  while (!v24);
  if (v24 != 6) {
    return (EDRowInfo *)v15;
  }
LABEL_29:
  unint64_t v25 = *((unsigned int *)MutableBytePtr + 4) + 24;
  if (v25 > CFDataGetLength(self->mPackedData))
  {
    CFDataIncreaseLength(self->mPackedData, 24);
    v26 = CFDataGetMutableBytePtr(self->mPackedData);
    if (v26)
    {
      MutableBytePtr = v26;
      unint64_t v17 = (unint64_t)&v26[CFDataGetLength(self->mPackedData)];
      v19 = MutableBytePtr + 24;
      goto LABEL_32;
    }
    return 0;
  }
LABEL_32:
  unsigned int v27 = v20;
  unsigned int v28 = 24 * v20 + 24;
  unsigned int v29 = *((_DWORD *)MutableBytePtr + 4);
  if (v29 > v28)
  {
    memmove(&v19[24 * v20 + 24], &v19[24 * v20], v29 - v28);
    unsigned int v29 = *((_DWORD *)MutableBytePtr + 4);
  }
  *((_DWORD *)MutableBytePtr + 4) = v29 + 24;
  BOOL v30 = __CFADD__(*(_DWORD *)MutableBytePtr, 1);
  uint64_t v31 = (*(_DWORD *)MutableBytePtr + 1);
  *(_DWORD *)MutableBytePtr = v31;
  if (!v30)
  {
    v32 = MutableBytePtr + 36;
    uint64_t v33 = v31;
    do
    {
      *v32 += 24;
      v32 += 6;
      --v33;
    }
    while (v33);
  }
  uint64_t v34 = 24 * v20;
  do
  {
    uint64_t v35 = v34 - 24;
    if (!v34)
    {
      int32x2_t v41 = (int32x2_t)(24 * v31 + 24);
      goto LABEL_46;
    }
    int v36 = *(_DWORD *)&v19[v34 - 16];
    v34 -= 24;
  }
  while (!v36);
  v37 = &v19[v35];
  uint64_t v38 = *(unsigned int *)&v16[4 * (v36 - 1) + *(unsigned int *)&v19[v35 + 16]];
  v39 = (const EDCellHeader *)&MutableBytePtr[*(unsigned int *)&v19[v35 + 12] + v38];
  if ((unint64_t)&v39[1] > v17) {
    +[TCMessageException raise:TCUnknownProblemMessage];
  }
  v40.i32[0] = sizeofEDCell(v39) + v38;
  v40.i32[1] = 4 * v36;
  int32x2_t v41 = vadd_s32(v40, *(int32x2_t *)(v37 + 12));
LABEL_46:
  int32x2_t v43 = v41;
  uint64_t v15 = (uint64_t)&v19[24 * v27];
  initEDRowInfo(v15, a3);
  *(int32x2_t *)(v15 + 12) = v43;
  return (EDRowInfo *)v15;
}

- (EDCellHeader)addCellWithColumnNumber:(unsigned int)a3 type:(int)a4 isFormulaCell:(BOOL)a5 rowInfo:(EDRowInfo *)a6 rowBlocks:(id)a7
{
  BOOL v8 = a5;
  uint64_t v10 = *(void *)&a3;
  id v12 = a7;
  if (!*a6) {
    goto LABEL_24;
  }
  if (maximumAllowedColumnNumber() < v10) {
    goto LABEL_24;
  }
  mPackedData = self->mPackedData;
  if (!mPackedData || !self->mCellOffsets) {
    goto LABEL_24;
  }
  MutableBytePtr = (unsigned int *)CFDataGetMutableBytePtr(mPackedData);
  uint64_t v15 = CFDataGetMutableBytePtr(self->mCellOffsets);
  v16 = 0;
  if (!MutableBytePtr) {
    goto LABEL_25;
  }
  unint64_t v17 = v15;
  if (!v15) {
    goto LABEL_25;
  }
  CFIndex Length = CFDataGetLength(self->mPackedData);
  CFIndex var4 = (*a6)->var4;
  if (CFDataGetLength(self->mCellOffsets) < var4)
  {
LABEL_23:
    +[TCMessageException raise:TCUnknownProblemMessage];
    goto LABEL_24;
  }
  unsigned int var2 = (*a6)->var2;
  if (var2)
  {
    while (1)
    {
      unsigned int v21 = columnNumberForEDCell((const EDCellHeader *)((char *)MutableBytePtr
                                                       + (*a6)->var3
                                                       + *(unsigned int *)&v17[4 * var2 - 4 + (*a6)->var4]));
      if (v21 == v10) {
        break;
      }
      if (v21 < v10)
      {
        unsigned int v51 = var2;
        goto LABEL_15;
      }
      if (!--var2) {
        goto LABEL_13;
      }
    }
    unsigned int v51 = var2 - 1;
    -[EDRowBlock removeCellAtIndex:rowInfo:](self, "removeCellAtIndex:rowInfo:");
  }
  else
  {
LABEL_13:
    unsigned int v51 = 0;
  }
LABEL_15:
  CFIndex v47 = Length;
  unsigned int v52 = sizeofEDCellType(a4, v8);
  unsigned int v22 = MutableBytePtr[4];
  unint64_t v49 = ((char *)*a6 - (char *)MutableBytePtr - 24) / 0x18uLL;
  unsigned int v23 = v52;
  if (v22 + v52 <= CFDataGetLength(self->mPackedData))
  {
    v48 = (unsigned int *)((char *)MutableBytePtr + v47);
  }
  else
  {
    CFDataIncreaseLength(self->mPackedData, 32);
    MutableBytePtr = (unsigned int *)CFDataGetMutableBytePtr(self->mPackedData);
    if (!MutableBytePtr) {
      goto LABEL_24;
    }
    v48 = (unsigned int *)((char *)MutableBytePtr + CFDataGetLength(self->mPackedData));
    *a6 = (EDRowInfo *)&MutableBytePtr[6 * v49 + 6];
    unsigned int v23 = v52;
  }
  unint64_t v24 = CFDataGetLength(self->mCellOffsets);
  if ((unint64_t)MutableBytePtr[5] + 4 > v24)
  {
    CFDataIncreaseLength(self->mCellOffsets, 16);
    unint64_t v17 = CFDataGetMutableBytePtr(self->mCellOffsets);
    if (v17)
    {
      unint64_t v24 = CFDataGetLength(self->mCellOffsets);
      goto LABEL_22;
    }
LABEL_24:
    v16 = 0;
    goto LABEL_25;
  }
LABEL_22:
  unint64_t v25 = (*a6)->var4;
  if (v24 < v25) {
    goto LABEL_23;
  }
  uint64_t var3 = (*a6)->var3;
  unsigned int v53 = (*a6)->var3;
  if (v51)
  {
    uint64_t v45 = *(unsigned int *)&v17[4 * v51 - 4 + v25];
    unsigned int v28 = (const EDCellHeader *)((char *)MutableBytePtr + var3 + v45);
    if (&v28[1] > (const EDCellHeader *)v48)
    {
      v44 = (EDCellHeader *)((char *)MutableBytePtr + var3 + v45);
      +[TCMessageException raise:TCUnknownProblemMessage];
      unsigned int v28 = v44;
    }
    int v29 = sizeofEDCell(v28);
    int v30 = v45 + v53;
    int v46 = v29;
    unsigned int v53 = v30 + v29;
  }
  else
  {
    int v46 = 0;
  }
  if ([(EDRowBlock *)self startOfCellsOrThrow] > v53 || v53 > MutableBytePtr[4]) {
    +[TCMessageException raise:TCUnknownProblemMessage];
  }
  updateRowInfoOffsetsInPackedDataForNewCell(MutableBytePtr, v48, v49, v23, 4);
  unsigned int v31 = MutableBytePtr[4];
  if (v53 < v31) {
    memmove((char *)MutableBytePtr + v53 + v23, (char *)MutableBytePtr + v53, v31 - v53);
  }
  v32 = *a6;
  unint64_t v33 = (*a6)->var4;
  unsigned int v34 = (*a6)->var4;
  if (v24 <= v33)
  {
    +[TCMessageException raise:TCUnknownProblemMessage];
    v32 = *a6;
    unsigned int v34 = (*a6)->var4;
  }
  unsigned int v35 = v24 - v34;
  unint64_t v36 = v51 + 1;
  unsigned int v50 = v35;
  if (v36 >= v35)
  {
    +[TCMessageException raise:TCUnknownProblemMessage];
    v32 = *a6;
    unsigned int v34 = (*a6)->var4;
  }
  unsigned int v37 = v33 + 4 * v51;
  uint64_t v38 = &v17[v34];
  unsigned int v39 = MutableBytePtr[5];
  if (v39 > v37)
  {
    memmove(&v38[4 * v36], &v38[4 * v51], v39 - v37);
    v32 = *a6;
    unsigned int v39 = MutableBytePtr[5];
  }
  uint64_t var1 = v32->var1;
  ++v32->var2;
  MutableBytePtr[4] += v23;
  MutableBytePtr[5] = v39 + 4;
  [v12 updateMaxPopulatedRow:var1 column:v10];
  if (v51) {
    int v41 = *(_DWORD *)&v38[4 * v51 - 4] + v46;
  }
  else {
    int v41 = 0;
  }
  *(_DWORD *)&v38[4 * v51] = v41;
  v42 = *a6;
  unsigned int v43 = (*a6)->var2;
  if (v43 >= v50)
  {
    +[TCMessageException raise:TCUnknownProblemMessage];
    v42 = *a6;
    unsigned int v43 = (*a6)->var2;
  }
  if (v36 < v43)
  {
    do
      *(_DWORD *)&v38[4 * v36++] += v23;
    while (v36 < v42->var2);
  }
  v16 = (EDCellHeader *)((char *)MutableBytePtr + v42->var3 + *(unsigned int *)&v38[4 * v51]);
  initEDCell((int *)v16, v10, a4, v8);
LABEL_25:

  return v16;
}

- (unint64_t)startOfCellsOrThrow
{
  mPackedData = self->mPackedData;
  if (!mPackedData)
  {
    +[TCMessageException raise:TCUnknownProblemMessage];
    mPackedData = self->mPackedData;
  }
  if ((unint64_t)CFDataGetLength(mPackedData) <= 0x17) {
    +[TCMessageException raise:TCUnknownProblemMessage];
  }
  return 24 * *(unsigned int *)CFDataGetMutableBytePtr(self->mPackedData) + 24;
}

- (unsigned)firstRowNumber
{
  id v2 = [(EDRowBlock *)self rowInfoAtIndex:0];
  if (v2) {
    return v2->var1;
  }
  else {
    return -1;
  }
}

- (EDRowInfo)rowInfoAtIndex:(unsigned int)a3
{
  result = (EDRowInfo *)self->mPackedData;
  if (result)
  {
    if (!self->mCellOffsets) {
      return 0;
    }
    MutableBytePtr = CFDataGetMutableBytePtr((CFMutableDataRef)result);
    uint64_t v7 = CFDataGetMutableBytePtr(self->mCellOffsets);
    BOOL v8 = !MutableBytePtr || v7 == 0;
    if (v8 || *(_DWORD *)MutableBytePtr <= a3) {
      return 0;
    }
    else {
      return (EDRowInfo *)&MutableBytePtr[24 * a3 + 24];
    }
  }
  return result;
}

- (unint64_t)index
{
  mPackedData = self->mPackedData;
  if (mPackedData
    && self->mCellOffsets
    && ((MutableBytePtr = CFDataGetMutableBytePtr(mPackedData),
         uint64_t v5 = CFDataGetMutableBytePtr(self->mCellOffsets),
         MutableBytePtr)
      ? (BOOL v6 = v5 == 0)
      : (BOOL v6 = 1),
        !v6))
  {
    return *((void *)MutableBytePtr + 1);
  }
  else
  {
    return -1;
  }
}

- (unsigned)lastRowNumber
{
  mPackedData = self->mPackedData;
  if (mPackedData
    && self->mCellOffsets
    && ((MutableBytePtr = CFDataGetMutableBytePtr(mPackedData),
         uint64_t v5 = CFDataGetMutableBytePtr(self->mCellOffsets),
         MutableBytePtr)
      ? (BOOL v6 = v5 == 0)
      : (BOOL v6 = 1),
        !v6 && *(_DWORD *)MutableBytePtr))
  {
    return *(_DWORD *)&MutableBytePtr[24 * (*(_DWORD *)MutableBytePtr - 1) + 28];
  }
  else
  {
    return -1;
  }
}

- (EDCellHeader)cellAtIndex:(unsigned int)a3 rowInfo:(EDRowInfo *)a4
{
  if (!a4) {
    return 0;
  }
  if (a4->var2 <= a3) {
    return 0;
  }
  result = (EDCellHeader *)self->mPackedData;
  if (!result) {
    return result;
  }
  if (!self->mCellOffsets) {
    return 0;
  }
  MutableBytePtr = CFDataGetMutableBytePtr((CFMutableDataRef)result);
  uint64_t v9 = CFDataGetMutableBytePtr(self->mCellOffsets);
  result = 0;
  if (MutableBytePtr)
  {
    if (v9) {
      return (EDCellHeader *)&MutableBytePtr[a4->var3 + *(unsigned int *)&v9[4 * a3 + a4->var4]];
    }
  }
  return result;
}

- (EDCellHeader)cellWithColumnNumber:(unsigned int)a3 rowInfo:(EDRowInfo *)a4
{
  uint64_t v6 = -[EDRowBlock indexOfCellWithColumnNumber:rowInfo:](self, "indexOfCellWithColumnNumber:rowInfo:", *(void *)&a3);
  if (v6 == -1) {
    return 0;
  }
  return [(EDRowBlock *)self cellAtIndex:v6 rowInfo:a4];
}

- (unsigned)indexOfCellWithColumnNumber:(unsigned int)a3 rowInfo:(EDRowInfo *)a4
{
  uint64_t v7 = -[EDRowBlock expectedIndexOfCellWithColumnNumber:rowInfo:](self, "expectedIndexOfCellWithColumnNumber:rowInfo:");
  BOOL v8 = [(EDRowBlock *)self cellAtIndex:v7 rowInfo:a4];
  if (!v8 || columnNumberForEDCell(v8) != a3) {
    LODWORD(v7) = -1;
  }
  return v7;
}

- (unsigned)expectedIndexOfCellWithColumnNumber:(unsigned int)a3 rowInfo:(EDRowInfo *)a4
{
  if (!a4) {
    return -1;
  }
  mPackedData = self->mPackedData;
  if (!mPackedData || !self->mCellOffsets) {
    return -1;
  }
  MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
  uint64_t v9 = CFDataGetMutableBytePtr(self->mCellOffsets);
  unsigned int v10 = -1;
  if (MutableBytePtr)
  {
    unsigned int v11 = v9;
    if (v9)
    {
      signed int v12 = a4->var2 - 1;
      if (v12 < 0)
      {
        return 0;
      }
      else
      {
        for (i = 0; i <= v12; v15 > a3 ? (signed int v12 = v10 - 1) : (i = v10 + 1))
        {
          int v14 = v12 + i;
          if (v12 + i < 0 != __OFADD__(v12, i)) {
            ++v14;
          }
          unsigned int v10 = v14 >> 1;
          unsigned int v15 = columnNumberForEDCell((const EDCellHeader *)&MutableBytePtr[a4->var3
                                                                          + *(unsigned int *)&v11[4 * (v14 >> 1)
                                                                                                + a4->var4]]);
          if (v15 == a3) {
            break;
          }
        }
      }
    }
  }
  return v10;
}

- (void)dealloc
{
  [(EDRowBlock *)self doneWithContent];
  v3.receiver = self;
  v3.super_class = (Class)EDRowBlock;
  [(EDRowBlock *)&v3 dealloc];
}

- (void)doneWithContent
{
  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    CFRelease(mPackedData);
    self->mPackedData = 0;
  }
  mCellOffsets = self->mCellOffsets;
  if (mCellOffsets)
  {
    CFRelease(mCellOffsets);
    self->mCellOffsets = 0;
  }
}

- (unsigned)rowCount
{
  mPackedData = self->mPackedData;
  if (mPackedData)
  {
    if (!self->mCellOffsets
      || ((MutableBytePtr = CFDataGetMutableBytePtr(mPackedData),
           uint64_t v5 = CFDataGetMutableBytePtr(self->mCellOffsets),
           MutableBytePtr)
        ? (BOOL v6 = v5 == 0)
        : (BOOL v6 = 1),
          v6))
    {
      LODWORD(mPackedData) = 0;
    }
    else
    {
      LODWORD(mPackedData) = *(_DWORD *)MutableBytePtr;
    }
  }
  return mPackedData;
}

- (void)removeCellAtIndex:(unsigned int)a3 rowInfo:(EDRowInfo *)a4
{
  mPackedData = self->mPackedData;
  if (mPackedData && self->mCellOffsets)
  {
    MutableBytePtr = (unsigned int *)CFDataGetMutableBytePtr(mPackedData);
    uint64_t v9 = CFDataGetMutableBytePtr(self->mCellOffsets);
    if (MutableBytePtr && v9 != 0)
    {
      unsigned int v11 = v9;
      signed int v12 = (unsigned int *)((char *)MutableBytePtr + CFDataGetLength(self->mPackedData));
      uint64_t v13 = *(unsigned int *)&v11[4 * a3 + (*a4)->var4];
      int v14 = (const EDCellHeader *)((char *)MutableBytePtr + (*a4)->var3 + v13);
      if (&v14[1] > (const EDCellHeader *)v12) {
        +[TCMessageException raise:TCUnknownProblemMessage];
      }
      unint64_t v15 = a3;
      unsigned int v16 = sizeofEDCell(v14);
      updateRowInfoOffsetsInPackedDataForNewCell(MutableBytePtr, v12, ((char *)*a4 - (char *)MutableBytePtr - 24) / 0x18uLL, -v16, -4);
      uint64_t v17 = ((*a4)->var3 + v13);
      [(EDRowBlock *)self checkCellOffsetOrThrow:v17];
      unsigned int v18 = MutableBytePtr[4];
      if (v18 > v17 + v16) {
        memmove((char *)MutableBytePtr + v17, (char *)MutableBytePtr + v17 + v16, v18 - (v17 + v16));
      }
      v19 = *a4;
      unsigned int var2 = (*a4)->var2 - 1;
      v19->unsigned int var2 = var2;
      uint64_t var4 = v19->var4;
      uint64_t v22 = var4 + 4 * a3;
      unsigned int v23 = &v11[var4];
      unint64_t v24 = MutableBytePtr[5];
      if (v22 + 4 < v24)
      {
        memmove(&v23[4 * a3], &v23[4 * a3 + 4], (v24 - v22) - 4);
        v19 = *a4;
        unsigned int var2 = (*a4)->var2;
      }
      if (var2 > a3)
      {
        do
          *(_DWORD *)&v23[4 * v15++] -= v16;
        while (v15 < v19->var2);
      }
      int32x2_t v25 = *(int32x2_t *)(MutableBytePtr + 4);
      LODWORD(v26) = vsub_s32(v25, (int32x2_t)(v16 | 0x300000000)).u32[0];
      HIDWORD(v26) = vadd_s32(v25, (int32x2_t)0x300000003).i32[1];
      *((void *)MutableBytePtr + 2) = v26;
    }
  }
}

- (void)checkCellOffsetOrThrow:(unint64_t)a3
{
  mPackedData = self->mPackedData;
  if (mPackedData && self->mCellOffsets)
  {
    MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
    uint64_t v7 = CFDataGetMutableBytePtr(self->mCellOffsets);
    if (MutableBytePtr && v7 != 0)
    {
      if ((unint64_t)CFDataGetLength(self->mPackedData) <= 0x17) {
        +[TCMessageException raise:TCUnknownProblemMessage];
      }
      if ([(EDRowBlock *)self startOfCellsOrThrow] > a3
        || (unint64_t v9 = *((unsigned int *)MutableBytePtr + 4), v9 <= a3))
      {
        +[TCMessageException raise:TCUnknownProblemMessage];
        unint64_t v9 = *((unsigned int *)MutableBytePtr + 4);
      }
      if (v9 - 8 <= a3)
      {
        uint64_t v10 = TCUnknownProblemMessage;
        +[TCMessageException raise:v10];
      }
    }
  }
}

- (unsigned)minRowNumber
{
  return [(EDRowBlock *)self firstRowNumber] & 0xFFFFFFE0;
}

- (unsigned)maxRowNumber
{
  return [(EDRowBlock *)self minRowNumber] + 31;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDRowBlock;
  id v2 = [(EDRowBlock *)&v4 description];
  return v2;
}

- (void)unarchiveFromData:(__CFData *)a3 offset:(unint64_t *)a4
{
  if (a3)
  {
    BytePtr = CFDataGetBytePtr(a3);
    if (BytePtr)
    {
      BOOL v8 = BytePtr;
      CFDataSetLength(self->mPackedData, 0);
      CFDataSetLength(self->mCellOffsets, 0);
      unint64_t v9 = &v8[*a4];
      unint64_t v10 = *a4 + *((unsigned int *)v9 + 4) + *((unsigned int *)v9 + 5);
      if (v10 <= CFDataGetLength(a3))
      {
        CFDataAppendBytes(self->mPackedData, v9, *((unsigned int *)v9 + 4));
        uint64_t v13 = *((unsigned int *)v9 + 4);
        CFIndex v12 = *((unsigned int *)v9 + 5);
        *a4 += v13;
        CFDataAppendBytes(self->mCellOffsets, &v9[v13], v12);
        unsigned int v11 = *((_DWORD *)v9 + 5);
      }
      else
      {
        unsigned int v11 = *((_DWORD *)v9 + 5) + *((_DWORD *)v9 + 4);
      }
      *a4 += v11;
    }
  }
}

- (void)archiveByAppendingToMutableData:(__CFData *)a3
{
  mPackedData = self->mPackedData;
  if (mPackedData && self->mCellOffsets)
  {
    MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
    uint64_t v7 = CFDataGetMutableBytePtr(self->mCellOffsets);
    if (MutableBytePtr) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      unint64_t v9 = v7;
      CFDataAppendBytes(a3, MutableBytePtr, *((unsigned int *)MutableBytePtr + 4));
      CFIndex v10 = *((unsigned int *)MutableBytePtr + 5);
      CFDataAppendBytes(a3, v9, v10);
    }
  }
}

- (void)incrementIndex
{
  mPackedData = self->mPackedData;
  if (mPackedData && self->mCellOffsets)
  {
    MutableBytePtr = CFDataGetMutableBytePtr(mPackedData);
    uint64_t v5 = CFDataGetMutableBytePtr(self->mCellOffsets);
    if (MutableBytePtr) {
      BOOL v6 = v5 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6) {
      ++*((void *)MutableBytePtr + 1);
    }
  }
}

@end