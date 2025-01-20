@interface _PXStoryPacingControllerDecisionHistory
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentError;
- ($4B7BA9DB5D00C75F8ECD01506BF85359)firstPacingDecisionAfterTime:(SEL)a3;
- (_PXStoryPacingControllerDecisionHistory)init;
- (double)onBarPercentage;
- (id)descriptionWithShortStyle:(BOOL)a3;
- (int64_t)decisionCount;
- (int64_t)onBarCount;
- (void)recordDecision:(id *)a3;
- (void)resetWithTargetDuration:(id *)a3 reason:(id)a4;
@end

@implementation _PXStoryPacingControllerDecisionHistory

- (void).cxx_destruct
{
}

- (double)onBarPercentage
{
  return self->_onBarPercentage;
}

- (int64_t)decisionCount
{
  return self->_decisionCount;
}

- (int64_t)onBarCount
{
  return self->_onBarCount;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentError
{
  v32.epoch = 0;
  *(_OWORD *)&v32.value = PXStoryTimeZero;
  v4 = [(NSMutableArray *)self->_decisionHistory lastObject];
  if ([v4 decisionsCount] >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = [v4 decisions];
      long long v8 = *(_OWORD *)(v7 + v5 + 208);
      long long v29 = *(_OWORD *)(v7 + v5 + 192);
      long long v30 = v8;
      long long v31 = *(_OWORD *)(v7 + v5 + 224);
      long long v9 = *(_OWORD *)(v7 + v5 + 144);
      long long v25 = *(_OWORD *)(v7 + v5 + 128);
      long long v26 = v9;
      long long v10 = *(_OWORD *)(v7 + v5 + 176);
      long long v27 = *(_OWORD *)(v7 + v5 + 160);
      long long v28 = v10;
      long long v11 = *(_OWORD *)(v7 + v5 + 80);
      *(_OWORD *)&v21[16] = *(_OWORD *)(v7 + v5 + 64);
      long long v22 = v11;
      long long v12 = *(_OWORD *)(v7 + v5 + 112);
      long long v23 = *(_OWORD *)(v7 + v5 + 96);
      long long v24 = v12;
      long long v13 = *(_OWORD *)(v7 + v5 + 16);
      long long v18 = *(_OWORD *)(v7 + v5);
      long long v19 = v13;
      long long v14 = *(_OWORD *)(v7 + v5 + 48);
      long long v20 = *(_OWORD *)(v7 + v5 + 32);
      *(_OWORD *)v21 = v14;
      *(_OWORD *)&lhs.value = v22;
      lhs.epoch = v23;
      CMTime rhs = *(CMTime *)&v21[8];
      CMTimeSubtract(&v16, &lhs, &rhs);
      CMTime lhs = v32;
      CMTime rhs = v16;
      CMTimeAdd(&v17, &lhs, &rhs);
      CMTime v32 = v17;
      ++v6;
      v5 += 240;
    }
    while ([v4 decisionsCount] > v6);
  }
  *(CMTime *)retstr = v32;

  return result;
}

- (id)descriptionWithShortStyle:(BOOL)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  decisionHistory = self->_decisionHistory;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  long long v12 = __69___PXStoryPacingControllerDecisionHistory_descriptionWithShortStyle___block_invoke;
  long long v13 = &unk_1E5DCEF68;
  BOOL v15 = a3;
  id v14 = v5;
  id v7 = v5;
  [(NSMutableArray *)decisionHistory enumerateObjectsWithOptions:2 usingBlock:&v10];
  long long v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);

  return v8;
}

- (void)recordDecision:(id *)a3
{
  id v5 = [(NSMutableArray *)self->_decisionHistory lastObject];
  long long v6 = *(_OWORD *)&a3->var10;
  v15[12] = *(_OWORD *)&a3->var8.var3;
  v15[13] = v6;
  v15[14] = *(_OWORD *)&a3->var11.var1;
  long long v7 = *(_OWORD *)&a3->var6.var0;
  v15[8] = *(_OWORD *)&a3->var4.var1;
  v15[9] = v7;
  long long v8 = *(_OWORD *)&a3->var8.var0;
  v15[10] = *(_OWORD *)&a3->var6.var3;
  v15[11] = v8;
  long long v9 = *(_OWORD *)&a3->var3.var0;
  v15[4] = *(_OWORD *)&a3->var2.var1;
  v15[5] = v9;
  long long v10 = *(_OWORD *)&a3->var4.var0.var1;
  v15[6] = *(_OWORD *)&a3->var3.var3;
  v15[7] = v10;
  long long v11 = *(_OWORD *)&a3->var1.var0.var1;
  v15[0] = *(_OWORD *)&a3->var0;
  v15[1] = v11;
  long long v12 = *(_OWORD *)&a3->var1.var1.var3;
  v15[2] = *(_OWORD *)&a3->var1.var1.var0;
  v15[3] = v12;
  [v5 appendDecision:v15];

  int64_t decisionCount = self->_decisionCount;
  self->_int64_t decisionCount = decisionCount + 1;
  if (a3->var4.var1 >= 2) {
    ++self->_onBarCount;
  }
  if (decisionCount < 0) {
    double v14 = 0.0;
  }
  else {
    double v14 = (double)self->_onBarCount / (double)(decisionCount + 1) * 100.0;
  }
  self->_onBarPercentage = v14;
}

- (void)resetWithTargetDuration:(id *)a3 reason:(id)a4
{
  id v6 = a4;
  long long v7 = [_PXStoryPacingControllerDecisionList alloc];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a3;
  long long v8 = [(_PXStoryPacingControllerDecisionList *)v7 initWithResetReason:v6 targetRemainingDuration:&v11];

  long long v9 = [(NSMutableArray *)self->_decisionHistory lastObject];
  uint64_t v10 = [v9 decisionsCount];

  if (!v10) {
    [(NSMutableArray *)self->_decisionHistory removeLastObject];
  }
  [(NSMutableArray *)self->_decisionHistory addObject:v8];
}

- ($4B7BA9DB5D00C75F8ECD01506BF85359)firstPacingDecisionAfterTime:(SEL)a3
{
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x11010000000;
  v21 = &unk_1AB5D584F;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v6 = [(NSMutableArray *)self->_decisionHistory lastObject];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72___PXStoryPacingControllerDecisionHistory_firstPacingDecisionAfterTime___block_invoke;
  v16[3] = &unk_1E5DCEF40;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = *a4;
  v16[4] = &v18;
  [v6 enumerateDecisionsWithBlock:v16];

  long long v7 = v19;
  long long v8 = *((_OWORD *)v19 + 15);
  *(_OWORD *)&retstr->var8.var3 = *((_OWORD *)v19 + 14);
  *(_OWORD *)&retstr->var10 = v8;
  *(_OWORD *)&retstr->var11.var1 = *((_OWORD *)v7 + 16);
  long long v9 = *((_OWORD *)v7 + 11);
  *(_OWORD *)&retstr->var4.var1 = *((_OWORD *)v7 + 10);
  *(_OWORD *)&retstr->var6.var0 = v9;
  long long v10 = *((_OWORD *)v7 + 13);
  *(_OWORD *)&retstr->var6.var3 = *((_OWORD *)v7 + 12);
  *(_OWORD *)&retstr->var8.var0 = v10;
  long long v11 = *((_OWORD *)v7 + 7);
  *(_OWORD *)&retstr->var2.var1 = *((_OWORD *)v7 + 6);
  *(_OWORD *)&retstr->var3.var0 = v11;
  long long v12 = *((_OWORD *)v7 + 9);
  *(_OWORD *)&retstr->var3.var3 = *((_OWORD *)v7 + 8);
  *(_OWORD *)&retstr->var4.var0.var1 = v12;
  long long v13 = *((_OWORD *)v7 + 3);
  *(_OWORD *)&retstr->var0 = *((_OWORD *)v7 + 2);
  *(_OWORD *)&retstr->var1.var0.var1 = v13;
  long long v14 = *((_OWORD *)v7 + 5);
  *(_OWORD *)&retstr->var1.var1.var0 = *((_OWORD *)v7 + 4);
  *(_OWORD *)&retstr->var1.var1.var3 = v14;
  _Block_object_dispose(&v18, 8);
  return result;
}

- (_PXStoryPacingControllerDecisionHistory)init
{
  v11.receiver = self;
  v11.super_class = (Class)_PXStoryPacingControllerDecisionHistory;
  v2 = [(_PXStoryPacingControllerDecisionHistory *)&v11 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    decisionHistory = v2->_decisionHistory;
    v2->_decisionHistory = v3;

    id v5 = v2->_decisionHistory;
    id v6 = [_PXStoryPacingControllerDecisionList alloc];
    long long v9 = *MEMORY[0x1E4F1F9F8];
    uint64_t v10 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    long long v7 = [(_PXStoryPacingControllerDecisionList *)v6 initWithResetReason:@"Initial" targetRemainingDuration:&v9];
    [(NSMutableArray *)v5 addObject:v7];
  }
  return v2;
}

@end