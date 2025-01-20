@interface PXStoryTransitionProducerSegment
- ($822F6CB856AD2B5FF5331D18434BEEDC)segmentInfo;
- (NSArray)clipLayouts;
- (PXStoryTransitionProducerSegment)initWithSegmentInfo:(id *)a3;
- (void)addClipWithIdentifier:(int64_t)a3 layout:(id)a4 info:(id *)a5;
- (void)dealloc;
- (void)enumerateClipsUsingBlock:(id)a3;
@end

@implementation PXStoryTransitionProducerSegment

- (void).cxx_destruct
{
}

- ($822F6CB856AD2B5FF5331D18434BEEDC)segmentInfo
{
  long long v3 = *(_OWORD *)&self->var3.var3.var0.var3;
  long long v4 = *(_OWORD *)&self[1].var1.var0;
  *(_OWORD *)&retstr->var3.var2.var3 = *(_OWORD *)&self->var3.var4;
  *(_OWORD *)&retstr->var3.var3.var0.var1 = v4;
  retstr->var3.var3.var1 = self[1].var1.var2;
  long long v5 = *(_OWORD *)&self->var3.var1.var0;
  long long v6 = *(_OWORD *)&self->var3.var2.var1;
  *(_OWORD *)&retstr->var3.var0.var0 = *(_OWORD *)&self->var3.var1.var3;
  *(_OWORD *)&retstr->var3.var0.var3 = v6;
  *(_OWORD *)&retstr->var3.var1.var1 = *(_OWORD *)&self->var3.var3.var0.var0;
  *(_OWORD *)&retstr->var3.var2.var0 = v3;
  long long v7 = *(_OWORD *)&self->var2.var2.var0;
  long long v8 = *(_OWORD *)&self->var2.var5.var0;
  *(_OWORD *)&retstr->var1.var3 = *(_OWORD *)&self->var2.var2.var3;
  *(_OWORD *)&retstr->var2.var0 = v8;
  *(_OWORD *)&retstr->var2.var2.var1 = *(_OWORD *)&self->var3.var0.var1;
  *(_OWORD *)&retstr->var2.var3 = v5;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var1.var4;
  *(_OWORD *)&retstr->var1.var1 = v7;
  return self;
}

- (void)enumerateClipsUsingBlock:(id)a3
{
  v13 = a3;
  v16[0] = 0;
  int64_t count = self->_count;
  if (count >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    for (int64_t i = 0; i < count; ++i)
    {
      long long v8 = (int64_t *)((char *)&self->_infos->var0 + v5);
      uint64_t v9 = v8[1];
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      if (v9 == 1) {
        uint64_t v10 = v6;
      }
      uint64_t v14 = v10;
      v11 = [(NSMutableArray *)self->_clipLayouts objectAtIndexedSubscript:i];
      v12 = (void (*)(void *, int64_t, int64_t, uint64_t, unsigned char *, void *, unsigned char *))v13[2];
      memcpy(__dst, v8, 0x300uLL);
      v12(v13, count, i, v14, __dst, v11, v16);

      if (v16[0]) {
        break;
      }
      if (v9 == 1) {
        ++v6;
      }
      int64_t count = self->_count;
      v5 += 768;
    }
  }
}

- (void)addClipWithIdentifier:(int64_t)a3 layout:(id)a4 info:(id *)a5
{
}

- (NSArray)clipLayouts
{
  v2 = (void *)[(NSMutableArray *)self->_clipLayouts copy];
  return (NSArray *)v2;
}

- (void)dealloc
{
  free(self->_infos);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryTransitionProducerSegment;
  [(PXStoryTransitionProducerSegment *)&v3 dealloc];
}

- (PXStoryTransitionProducerSegment)initWithSegmentInfo:(id *)a3
{
  v18.receiver = self;
  v18.super_class = (Class)PXStoryTransitionProducerSegment;
  long long v4 = [(PXStoryTransitionProducerSegment *)&v18 init];
  uint64_t v5 = (PXStoryTransitionProducerSegment *)v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 40) = *(_OWORD *)&a3->var0;
    long long v6 = *(_OWORD *)&a3->var1.var1;
    long long v7 = *(_OWORD *)&a3->var1.var3;
    long long v8 = *(_OWORD *)&a3->var2.var0;
    *(_OWORD *)(v4 + 104) = *(_OWORD *)&a3->var2.var2.var1;
    *(_OWORD *)(v4 + 88) = v8;
    *(_OWORD *)(v4 + 72) = v7;
    *(_OWORD *)(v4 + 56) = v6;
    long long v9 = *(_OWORD *)&a3->var2.var3;
    long long v10 = *(_OWORD *)&a3->var3.var0.var0;
    long long v11 = *(_OWORD *)&a3->var3.var0.var3;
    *(_OWORD *)(v4 + 168) = *(_OWORD *)&a3->var3.var1.var1;
    *(_OWORD *)(v4 + 152) = v11;
    *(_OWORD *)(v4 + 136) = v10;
    *(_OWORD *)(v4 + 120) = v9;
    long long v12 = *(_OWORD *)&a3->var3.var2.var0;
    long long v13 = *(_OWORD *)&a3->var3.var2.var3;
    long long v14 = *(_OWORD *)&a3->var3.var3.var0.var1;
    *((void *)v4 + 29) = a3->var3.var3.var1;
    *(_OWORD *)(v4 + 216) = v14;
    *(_OWORD *)(v4 + 200) = v13;
    *(_OWORD *)(v4 + 184) = v12;
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    clipLayouts = v5->_clipLayouts;
    v5->_clipLayouts = v15;
  }
  return v5;
}

@end