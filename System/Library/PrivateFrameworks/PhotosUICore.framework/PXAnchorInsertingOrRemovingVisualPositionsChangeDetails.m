@interface PXAnchorInsertingOrRemovingVisualPositionsChangeDetails
- ($5E4061BE7C3C8BB942C4587960135C41)bodyVisualPositionAfterApplyingChangesToBodyIndex:(SEL)a3;
- ($5E4061BE7C3C8BB942C4587960135C41)bodyVisualPositionAfterRevertingChangesFromBodyIndex:(SEL)a3;
- (PXAnchorInsertingOrRemovingVisualPositionsChangeDetails)initWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7 headerIndexesAfterChanges:(id)a8;
- (PXAnchorInsertingOrRemovingVisualPositionsChangeDetails)initWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7 headerIndexesAfterChanges:(id)a8 anchorInserted:(BOOL)a9 relativePosition:(int64_t)a10;
@end

@implementation PXAnchorInsertingOrRemovingVisualPositionsChangeDetails

- ($5E4061BE7C3C8BB942C4587960135C41)bodyVisualPositionAfterRevertingChangesFromBodyIndex:(SEL)a3
{
  retstr->var1 = 0;
  *(void *)&retstr->var2 = 0;
  retstr->var0 = 0;
  retstr->var2 = 1;
  int64_t v7 = [(PXVisualPositionsChangeDetails *)self anchorBodyIndexAfterChanges];
  result = [(PXVisualPositionsChangeDetails *)self anchorBodyIndexBeforeChanges];
  v9 = (char *)result + a4 - v7;
  int64_t anchorRelativePosition = self->_anchorRelativePosition;
  retstr->var0 = (int64_t)v9;
  BOOL anchorInserted = self->_anchorInserted;
  if (anchorRelativePosition == 1)
  {
    if (self->_anchorInserted) {
      ++v9;
    }
    else {
      --v9;
    }
    retstr->var0 = (int64_t)v9;
  }
  if (anchorInserted)
  {
    if (a4 == v7)
    {
      if (anchorRelativePosition == 1) {
        retstr->var0 = (int64_t)(v9 - 1);
      }
      retstr->var1 = 1;
      retstr->var2 = 0;
      return result;
    }
    if (a4 < v7) {
      return result;
    }
    int64_t v12 = (int64_t)(v9 - 1);
LABEL_19:
    retstr->var0 = v12;
    return result;
  }
  if (anchorRelativePosition == 1)
  {
    ++v7;
  }
  else if (anchorRelativePosition)
  {
    int64_t v7 = 0;
  }
  if (v7 <= a4)
  {
    int64_t v12 = (int64_t)(v9 + 1);
    goto LABEL_19;
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
  v9 = (char *)result + a4 - v7;
  int64_t anchorRelativePosition = self->_anchorRelativePosition;
  retstr->var0 = (int64_t)v9;
  BOOL anchorInserted = self->_anchorInserted;
  if (anchorRelativePosition == 1)
  {
    if (self->_anchorInserted) {
      --v9;
    }
    else {
      ++v9;
    }
    retstr->var0 = (int64_t)v9;
  }
  if (anchorInserted)
  {
    if (anchorRelativePosition == 1)
    {
      ++v7;
    }
    else if (anchorRelativePosition)
    {
      int64_t v7 = 0;
    }
    if (v7 <= a4)
    {
      int64_t v12 = (int64_t)(v9 + 1);
LABEL_19:
      retstr->var0 = v12;
    }
  }
  else
  {
    if (a4 != v7)
    {
      if (a4 < v7) {
        return result;
      }
      int64_t v12 = (int64_t)(v9 - 1);
      goto LABEL_19;
    }
    if (anchorRelativePosition == 1) {
      retstr->var0 = (int64_t)(v9 - 1);
    }
    retstr->var1 = 1;
    retstr->var2 = 0;
  }
  return result;
}

- (PXAnchorInsertingOrRemovingVisualPositionsChangeDetails)initWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7 headerIndexesAfterChanges:(id)a8 anchorInserted:(BOOL)a9 relativePosition:(int64_t)a10
{
  v11.receiver = self;
  v11.super_class = (Class)PXAnchorInsertingOrRemovingVisualPositionsChangeDetails;
  result = [(PXVisualPositionsChangeDetails *)&v11 initWithCountBeforeChanges:a3 anchorIndexBeforeChanges:a4 headerIndexesBeforeChanges:a5 countAfterChanges:a6 anchorIndexAfterChanges:a7 headerIndexesAfterChanges:a8];
  if (result)
  {
    result->_BOOL anchorInserted = a9;
    result->_int64_t anchorRelativePosition = a10;
  }
  return result;
}

- (PXAnchorInsertingOrRemovingVisualPositionsChangeDetails)initWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7 headerIndexesAfterChanges:(id)a8
{
  LOBYTE(v9) = 0;
  return [(PXAnchorInsertingOrRemovingVisualPositionsChangeDetails *)self initWithCountBeforeChanges:a3 anchorIndexBeforeChanges:a4 headerIndexesBeforeChanges:a5 countAfterChanges:a6 anchorIndexAfterChanges:a7 headerIndexesAfterChanges:a8 anchorInserted:v9 relativePosition:0];
}

@end