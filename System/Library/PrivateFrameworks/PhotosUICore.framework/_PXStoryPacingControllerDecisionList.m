@interface _PXStoryPacingControllerDecisionList
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetRemainingDuration;
- ($4B7BA9DB5D00C75F8ECD01506BF85359)decisions;
- (NSString)resetReason;
- (_PXStoryPacingControllerDecisionList)initWithResetReason:(id)a3 targetRemainingDuration:(id *)a4;
- (int64_t)decisionsCount;
- (void)appendDecision:(id *)a3;
- (void)dealloc;
- (void)enumerateDecisionsWithBlock:(id)a3;
@end

@implementation _PXStoryPacingControllerDecisionList

- (void).cxx_destruct
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetRemainingDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (NSString)resetReason
{
  return self->_resetReason;
}

- (int64_t)decisionsCount
{
  return self->_decisionsCount;
}

- ($4B7BA9DB5D00C75F8ECD01506BF85359)decisions
{
  return self->_decisions;
}

- (void)dealloc
{
  free(self->_decisions);
  v3.receiver = self;
  v3.super_class = (Class)_PXStoryPacingControllerDecisionList;
  [(_PXStoryPacingControllerDecisionList *)&v3 dealloc];
}

- (void)enumerateDecisionsWithBlock:(id)a3
{
}

- (void)appendDecision:(id *)a3
{
  if ([(_PXStoryPacingControllerDecisionList *)self decisionsCount])
  {
    if ([(_PXStoryPacingControllerDecisionList *)self decisionsCount] == self->_capacity) {
      _PXGArrayResize();
    }
  }
  else
  {
    v5 = ($4B7BA9DB5D00C75F8ECD01506BF85359 *)malloc_type_calloc(1uLL, 0xF0uLL, 0x100004052B395BFuLL);
    self->_decisions = v5;
    long long v7 = *(_OWORD *)&a3->var1.var0.var1;
    long long v6 = *(_OWORD *)&a3->var1.var1.var0;
    *(_OWORD *)&v5->var0 = *(_OWORD *)&a3->var0;
    *(_OWORD *)&v5->var1.var0.var1 = v7;
    *(_OWORD *)&v5->var1.var1.var0 = v6;
    long long v8 = *(_OWORD *)&a3->var3.var3;
    long long v10 = *(_OWORD *)&a3->var1.var1.var3;
    long long v9 = *(_OWORD *)&a3->var2.var1;
    *(_OWORD *)&v5->var3.var0 = *(_OWORD *)&a3->var3.var0;
    *(_OWORD *)&v5->var3.var3 = v8;
    *(_OWORD *)&v5->var1.var1.var3 = v10;
    *(_OWORD *)&v5->var2.var1 = v9;
    long long v11 = *(_OWORD *)&a3->var6.var3;
    long long v13 = *(_OWORD *)&a3->var4.var0.var1;
    long long v12 = *(_OWORD *)&a3->var4.var1;
    *(_OWORD *)&v5->var6.var0 = *(_OWORD *)&a3->var6.var0;
    *(_OWORD *)&v5->var6.var3 = v11;
    *(_OWORD *)&v5->var4.var0.var1 = v13;
    *(_OWORD *)&v5->var4.var1 = v12;
    long long v14 = *(_OWORD *)&a3->var11.var1;
    long long v16 = *(_OWORD *)&a3->var8.var0;
    long long v15 = *(_OWORD *)&a3->var8.var3;
    *(_OWORD *)&v5->var10 = *(_OWORD *)&a3->var10;
    *(_OWORD *)&v5->var11.var1 = v14;
    *(_OWORD *)&v5->var8.var0 = v16;
    *(_OWORD *)&v5->var8.var3 = v15;
    self->_capacity = 1;
  }
  v17 = &self->_decisions[self->_decisionsCount];
  long long v18 = *(_OWORD *)&a3->var3.var3;
  long long v20 = *(_OWORD *)&a3->var1.var1.var3;
  long long v19 = *(_OWORD *)&a3->var2.var1;
  *(_OWORD *)&v17->var3.var0 = *(_OWORD *)&a3->var3.var0;
  *(_OWORD *)&v17->var3.var3 = v18;
  *(_OWORD *)&v17->var1.var1.var3 = v20;
  *(_OWORD *)&v17->var2.var1 = v19;
  long long v21 = *(_OWORD *)&a3->var6.var3;
  long long v23 = *(_OWORD *)&a3->var4.var0.var1;
  long long v22 = *(_OWORD *)&a3->var4.var1;
  *(_OWORD *)&v17->var6.var0 = *(_OWORD *)&a3->var6.var0;
  *(_OWORD *)&v17->var6.var3 = v21;
  *(_OWORD *)&v17->var4.var0.var1 = v23;
  *(_OWORD *)&v17->var4.var1 = v22;
  long long v24 = *(_OWORD *)&a3->var11.var1;
  long long v26 = *(_OWORD *)&a3->var8.var0;
  long long v25 = *(_OWORD *)&a3->var8.var3;
  *(_OWORD *)&v17->var10 = *(_OWORD *)&a3->var10;
  *(_OWORD *)&v17->var11.var1 = v24;
  *(_OWORD *)&v17->var8.var0 = v26;
  *(_OWORD *)&v17->var8.var3 = v25;
  long long v27 = *(_OWORD *)&a3->var0;
  long long v28 = *(_OWORD *)&a3->var1.var1.var0;
  *(_OWORD *)&v17->var1.var0.var1 = *(_OWORD *)&a3->var1.var0.var1;
  *(_OWORD *)&v17->var1.var1.var0 = v28;
  *(_OWORD *)&v17->var0 = v27;
  ++self->_decisionsCount;
}

- (_PXStoryPacingControllerDecisionList)initWithResetReason:(id)a3 targetRemainingDuration:(id *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_PXStoryPacingControllerDecisionList;
  long long v7 = [(_PXStoryPacingControllerDecisionList *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    long long v9 = (void *)*((void *)v7 + 4);
    *((void *)v7 + 4) = v8;

    long long v10 = *(_OWORD *)&a4->var0;
    *((void *)v7 + 7) = a4->var3;
    *(_OWORD *)(v7 + 40) = v10;
    *((void *)v7 + 1) = 0;
  }

  return (_PXStoryPacingControllerDecisionList *)v7;
}

@end