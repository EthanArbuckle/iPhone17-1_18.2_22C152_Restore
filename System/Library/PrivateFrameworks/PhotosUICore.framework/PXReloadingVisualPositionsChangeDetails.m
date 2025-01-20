@interface PXReloadingVisualPositionsChangeDetails
- ($5E4061BE7C3C8BB942C4587960135C41)bodyVisualPositionAfterApplyingChangesToBodyIndex:(SEL)a3;
- ($5E4061BE7C3C8BB942C4587960135C41)bodyVisualPositionAfterRevertingChangesFromBodyIndex:(SEL)a3;
- (PXReloadingVisualPositionsChangeDetails)initWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7 headerIndexesAfterChanges:(id)a8;
- (PXReloadingVisualPositionsChangeDetails)initWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7 headerIndexesAfterChanges:(id)a8 reloadAllIncludingAnchor:(BOOL)a9;
@end

@implementation PXReloadingVisualPositionsChangeDetails

- ($5E4061BE7C3C8BB942C4587960135C41)bodyVisualPositionAfterRevertingChangesFromBodyIndex:(SEL)a3
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  *(void *)&retstr->var2 = 0;
  int64_t v7 = [(PXVisualPositionsChangeDetails *)self anchorBodyIndexAfterChanges];
  result = [(PXVisualPositionsChangeDetails *)self anchorBodyIndexBeforeChanges];
  int64_t v10 = self->_reloadAnchor || a4 != v7;
  retstr->var0 = (int64_t)result + a4 - v7;
  retstr->var1 = v10;
  retstr->var2 = v10 ^ 1;
  return result;
}

- ($5E4061BE7C3C8BB942C4587960135C41)bodyVisualPositionAfterApplyingChangesToBodyIndex:(SEL)a3
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  *(void *)&retstr->var2 = 0;
  int64_t v7 = [(PXVisualPositionsChangeDetails *)self anchorBodyIndexBeforeChanges];
  result = [(PXVisualPositionsChangeDetails *)self anchorBodyIndexAfterChanges];
  int64_t v10 = self->_reloadAnchor || a4 != v7;
  retstr->var0 = (int64_t)result + a4 - v7;
  retstr->var1 = v10;
  retstr->var2 = v10 ^ 1;
  return result;
}

- (PXReloadingVisualPositionsChangeDetails)initWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7 headerIndexesAfterChanges:(id)a8 reloadAllIncludingAnchor:(BOOL)a9
{
  v10.receiver = self;
  v10.super_class = (Class)PXReloadingVisualPositionsChangeDetails;
  result = [(PXVisualPositionsChangeDetails *)&v10 initWithCountBeforeChanges:a3 anchorIndexBeforeChanges:a4 headerIndexesBeforeChanges:a5 countAfterChanges:a6 anchorIndexAfterChanges:a7 headerIndexesAfterChanges:a8];
  if (result) {
    result->_reloadAnchor = a9;
  }
  return result;
}

- (PXReloadingVisualPositionsChangeDetails)initWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7 headerIndexesAfterChanges:(id)a8
{
  LOBYTE(v9) = 0;
  return [(PXReloadingVisualPositionsChangeDetails *)self initWithCountBeforeChanges:a3 anchorIndexBeforeChanges:a4 headerIndexesBeforeChanges:a5 countAfterChanges:a6 anchorIndexAfterChanges:a7 headerIndexesAfterChanges:a8 reloadAllIncludingAnchor:v9];
}

@end