@interface PXStoryTransitionModel
- ($0AC6E346AE4835514AAA8AC86D8F4844)segmentTransitionInfo;
- ($5A4ED22E2CF2C812F70E33C35343ABA3)orderInCompositionInfo;
- ($5A4ED22E2CF2C812F70E33C35343ABA3)orderOutCompositionInfo;
- ($D9ACF32088E97DD3D62E5CBFAE4B0A27)transitionInfo;
- (PXStoryTransitionModel)initWithSegmentTransitionInfo:(id)a3 orderOutCompositionInfo:(id *)a4 orderInCompositionInfo:(id *)a5 transitionInfo:(id *)a6;
- (void)addClipWithIdentifier:(int64_t)a3 info:(id *)a4 event:(int64_t)a5;
- (void)dealloc;
- (void)enumerateClipIdentifiersUsingBlock:(id)a3;
@end

@implementation PXStoryTransitionModel

- ($5A4ED22E2CF2C812F70E33C35343ABA3)orderInCompositionInfo
{
  long long v3 = *(_OWORD *)&self[3].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[3].var1;
  *(_OWORD *)&retstr->var2 = v3;
  retstr->var4 = self[4].var0;
  return self;
}

- ($5A4ED22E2CF2C812F70E33C35343ABA3)orderOutCompositionInfo
{
  long long v3 = *(_OWORD *)&self[2].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var1;
  *(_OWORD *)&retstr->var2 = v3;
  retstr->var4 = self[3].var0;
  return self;
}

- ($D9ACF32088E97DD3D62E5CBFAE4B0A27)transitionInfo
{
  long long v3 = *(_OWORD *)&self[1].var2.var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var0;
  *(_OWORD *)&retstr->var2.var1 = v3;
  *(void *)&retstr->var3 = *(void *)&self[1].var3;
  return self;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)segmentTransitionInfo
{
  int64_t toSegmentIdentifier = self->_segmentTransitionInfo.toSegmentIdentifier;
  int64_t fromSegmentIdentifier = self->_segmentTransitionInfo.fromSegmentIdentifier;
  result.var1 = toSegmentIdentifier;
  result.var0 = fromSegmentIdentifier;
  return result;
}

- (void)dealloc
{
  free(self->_clipInfos);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryTransitionModel;
  [(PXStoryTransitionModel *)&v3 dealloc];
}

- (void)enumerateClipIdentifiersUsingBlock:(id)a3
{
  char v13 = 0;
  if (self->_count >= 1)
  {
    int64_t v5 = 0;
    uint64_t v6 = 776;
    do
    {
      v7 = (int64_t *)((char *)&self->_clipInfos->var0 + v6);
      uint64_t v8 = *(v7 - 97);
      memcpy(__dst, v7 - 96, sizeof(__dst));
      uint64_t v9 = *v7;
      v10 = (void (*)(id, uint64_t, unsigned char *, uint64_t, char *))*((void *)a3 + 2);
      memcpy(v11, __dst, sizeof(v11));
      v10(a3, v8, v11, v9, &v13);
      if (v13) {
        break;
      }
      ++v5;
      v6 += 784;
    }
    while (v5 < self->_count);
  }
}

- (void)addClipWithIdentifier:(int64_t)a3 info:(id *)a4 event:(int64_t)a5
{
  int64_t capacity = self->_capacity;
  ++self->_count;
  int64_t v6 = capacity;
  _PXGArrayCapacityResizeToCount();
}

- (PXStoryTransitionModel)initWithSegmentTransitionInfo:(id)a3 orderOutCompositionInfo:(id *)a4 orderInCompositionInfo:(id *)a5 transitionInfo:(id *)a6
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  v18.receiver = self;
  v18.super_class = (Class)PXStoryTransitionModel;
  $0AC6E346AE4835514AAA8AC86D8F4844 result = [(PXStoryTransitionModel *)&v18 init];
  if (result)
  {
    result->_segmentTransitionInfo.int64_t fromSegmentIdentifier = var0;
    result->_segmentTransitionInfo.int64_t toSegmentIdentifier = var1;
    long long v12 = *(_OWORD *)&a6->var0;
    long long v13 = *(_OWORD *)&a6->var2.var1;
    *(void *)&result->_transitionInfo.fallbackFromTransitionKind = *(void *)&a6->var3;
    *(_OWORD *)&result->_transitionInfo.orderOutTransition = v12;
    *(_OWORD *)&result->_transitionInfo.duration.timescale = v13;
    long long v14 = *(_OWORD *)&a4->var0;
    long long v15 = *(_OWORD *)&a4->var2;
    *(void *)&result->_orderOutCompositionInfo.mainDividerSplitRatio = a4->var4;
    *(_OWORD *)&result->_orderOutCompositionInfo.clipFramesExtendToBounds = v15;
    *(_OWORD *)&result->_transitionInfo.var1.scaleRelativeFactor = v14;
    long long v16 = *(_OWORD *)&a5->var0;
    long long v17 = *(_OWORD *)&a5->var2;
    *(void *)&result->_orderInCompositionInfo.mainDividerSplitRatio = a5->var4;
    *(_OWORD *)&result->_orderOutCompositionInfo.numberOfAssets = v16;
    *(_OWORD *)&result->_orderInCompositionInfo.clipFramesExtendToBounds = v17;
  }
  return result;
}

@end