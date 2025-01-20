@interface PXFanningVisualPositionsChangeDetails
- ($5E4061BE7C3C8BB942C4587960135C41)bodyVisualPositionAfterApplyingChangesToBodyIndex:(SEL)a3;
- ($5E4061BE7C3C8BB942C4587960135C41)bodyVisualPositionAfterRevertingChangesFromBodyIndex:(SEL)a3;
- (PXFanningVisualPositionsChangeDetails)initWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7 headerIndexesAfterChanges:(id)a8;
- (PXFanningVisualPositionsChangeDetails)initWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7 headerIndexesAfterChanges:(id)a8 anchorFan:(int64_t)a9 anchorReload:(int64_t)a10;
@end

@implementation PXFanningVisualPositionsChangeDetails

- ($5E4061BE7C3C8BB942C4587960135C41)bodyVisualPositionAfterRevertingChangesFromBodyIndex:(SEL)a3
{
  retstr->var1 = 0;
  *(void *)&retstr->var2 = 0;
  retstr->var0 = 0;
  retstr->var2 = 1;
  int64_t v7 = [(PXVisualPositionsChangeDetails *)self anchorBodyIndexBeforeChanges];
  result = [(PXVisualPositionsChangeDetails *)self anchorBodyIndexAfterChanges];
  if (result == ($5E4061BE7C3C8BB942C4587960135C41 *)a4)
  {
    retstr->var0 = v7;
    return result;
  }
  int64_t anchorFan = self->_anchorFan;
  if (anchorFan < 0)
  {
    int64_t v10 = v7 + a4;
    if ((uint64_t)result <= a4)
    {
      int64_t v11 = v10 - ((void)result + anchorFan);
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  if ((uint64_t)result - anchorFan > a4)
  {
    int64_t v10 = v7 + a4;
LABEL_7:
    int64_t v11 = v10 - (void)result + anchorFan;
LABEL_11:
    retstr->var0 = v11;
    char v12 = 1;
    goto LABEL_12;
  }
  if ((uint64_t)result + anchorFan < a4)
  {
    int64_t v11 = v7 + a4 - ((void)result + anchorFan);
    goto LABEL_11;
  }
  char v12 = 0;
  retstr->var0 = v7;
  retstr->var1 = 1;
  retstr->var2 = 0;
  int64_t v11 = v7;
LABEL_12:
  int64_t anchorReload = self->_anchorReload;
  if (anchorReload >= 1)
  {
    uint64_t v14 = anchorFan & (anchorFan >> 63);
    int64_t v15 = v14 + v7 - v11;
    int64_t v16 = v14 - v7 + v11;
    if (v15 <= anchorReload && v16 <= anchorReload) {
      BOOL v18 = 0;
    }
    else {
      BOOL v18 = v12;
    }
    retstr->var2 = v18;
  }
  return result;
}

- ($5E4061BE7C3C8BB942C4587960135C41)bodyVisualPositionAfterApplyingChangesToBodyIndex:(SEL)a3
{
  retstr->var1 = 0;
  *(void *)&retstr->var2 = 0;
  retstr->var0 = 0;
  retstr->var2 = 1;
  int64_t v7 = [(PXVisualPositionsChangeDetails *)self anchorBodyIndexBeforeChanges];
  result = [(PXVisualPositionsChangeDetails *)self anchorBodyIndexAfterChanges];
  if (a4 == v7)
  {
    retstr->var0 = (int64_t)result;
    return result;
  }
  int64_t anchorFan = self->_anchorFan;
  if ((anchorFan & 0x8000000000000000) == 0)
  {
    int64_t v10 = (char *)result + a4;
    if (a4 < v7)
    {
      int64_t v11 = v7 + anchorFan;
LABEL_8:
      char v12 = ($5E4061BE7C3C8BB942C4587960135C41 *)&v10[-v11];
LABEL_13:
      retstr->var0 = (int64_t)v12;
      char v14 = 1;
      goto LABEL_14;
    }
    v13 = &v10[-v7];
LABEL_12:
    char v12 = ($5E4061BE7C3C8BB942C4587960135C41 *)&v13[anchorFan];
    goto LABEL_13;
  }
  int64_t v11 = anchorFan + v7;
  if (anchorFan + v7 > a4)
  {
    int64_t v10 = (char *)result + a4;
    goto LABEL_8;
  }
  if (v7 - anchorFan < a4)
  {
    v13 = (char *)result + a4 - v7;
    goto LABEL_12;
  }
  char v14 = 0;
  retstr->var0 = (int64_t)result;
  retstr->var1 = 1;
  retstr->var2 = 0;
  char v12 = result;
LABEL_14:
  int64_t anchorReload = self->_anchorReload;
  if (anchorReload >= 1)
  {
    uint64_t v16 = anchorFan & ~(anchorFan >> 63);
    v17 = (char *)((char *)result - (char *)v12 - v16);
    int64_t v18 = (char *)v12 - (char *)result - v16;
    if ((uint64_t)v17 <= anchorReload && v18 <= anchorReload) {
      BOOL v20 = 0;
    }
    else {
      BOOL v20 = v14;
    }
    retstr->var2 = v20;
  }
  return result;
}

- (PXFanningVisualPositionsChangeDetails)initWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7 headerIndexesAfterChanges:(id)a8 anchorFan:(int64_t)a9 anchorReload:(int64_t)a10
{
  v11.receiver = self;
  v11.super_class = (Class)PXFanningVisualPositionsChangeDetails;
  result = [(PXVisualPositionsChangeDetails *)&v11 initWithCountBeforeChanges:a3 anchorIndexBeforeChanges:a4 headerIndexesBeforeChanges:a5 countAfterChanges:a6 anchorIndexAfterChanges:a7 headerIndexesAfterChanges:a8];
  if (result)
  {
    result->_int64_t anchorFan = a9;
    result->_int64_t anchorReload = a10;
  }
  return result;
}

- (PXFanningVisualPositionsChangeDetails)initWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7 headerIndexesAfterChanges:(id)a8
{
  return [(PXFanningVisualPositionsChangeDetails *)self initWithCountBeforeChanges:a3 anchorIndexBeforeChanges:a4 headerIndexesBeforeChanges:a5 countAfterChanges:a6 anchorIndexAfterChanges:a7 headerIndexesAfterChanges:a8 anchorFan:0 anchorReload:0];
}

@end