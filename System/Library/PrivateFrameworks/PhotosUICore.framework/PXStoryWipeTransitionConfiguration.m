@interface PXStoryWipeTransitionConfiguration
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- (CGSize)viewportSize;
- (NSString)identifier;
- (PXStoryWipeTransitionConfiguration)init;
- (PXStoryWipeTransitionConfiguration)initWithDuration:(id *)a3;
- (double)dividerWidth;
- (void)addClipLayout:(id)a3 configurationBlock:(id)a4;
- (void)dealloc;
- (void)enumerateLayoutsUsingBlock:(id)a3;
- (void)setDividerWidth:(double)a3;
- (void)setViewportSize:(CGSize)a3;
@end

@implementation PXStoryWipeTransitionConfiguration

- (void).cxx_destruct
{
}

- (void)setDividerWidth:(double)a3
{
  self->_dividerWidth = a3;
}

- (double)dividerWidth
{
  return self->_dividerWidth;
}

- (void)setViewportSize:(CGSize)a3
{
  self->_viewportSize = a3;
}

- (CGSize)viewportSize
{
  double width = self->_viewportSize.width;
  double height = self->_viewportSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 88);
  return self;
}

- (void)enumerateLayoutsUsingBlock:(id)a3
{
  v4 = a3;
  char v38 = 0;
  if (self->_count >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    int64_t v7 = 0;
    do
    {
      v8 = [(NSMutableArray *)self->_clipLayouts objectAtIndexedSubscript:v7];
      v9 = &self->_sourceStates[v5];
      v10 = &self->_targetStates[v5];
      v11 = &self->_primaryDividerInfos[v6];
      v12 = &self->_secondaryDividerInfos[v6];
      v13 = (void (*)(void *, void *, _OWORD *, _OWORD *, _OWORD *, _OWORD *, char *))v4[2];
      CGSize size = v9->var0.size;
      v37[0] = v9->var0.origin;
      v37[1] = size;
      long long v15 = *(_OWORD *)&v9->var1.var0.var0;
      long long v16 = *(_OWORD *)&v9->var1.var0.var2;
      long long v17 = *(_OWORD *)&v9->var1.var2.var0;
      v37[4] = *(_OWORD *)&v9->var1.var1.var1;
      v37[5] = v17;
      v37[2] = v15;
      v37[3] = v16;
      long long v18 = *(_OWORD *)&v9->var1.var2.var2;
      long long v19 = *(_OWORD *)&v9->var1.var3.var1;
      CGSize var3 = v9->var3;
      v37[8] = v9->var2;
      v37[9] = var3;
      v37[6] = v18;
      v37[7] = v19;
      CGSize v21 = v10->var0.size;
      v36[0] = v10->var0.origin;
      v36[1] = v21;
      long long v22 = *(_OWORD *)&v10->var1.var0.var0;
      long long v23 = *(_OWORD *)&v10->var1.var0.var2;
      long long v24 = *(_OWORD *)&v10->var1.var2.var0;
      v36[4] = *(_OWORD *)&v10->var1.var1.var1;
      v36[5] = v24;
      v36[2] = v22;
      v36[3] = v23;
      long long v25 = *(_OWORD *)&v10->var1.var2.var2;
      long long v26 = *(_OWORD *)&v10->var1.var3.var1;
      CGSize v27 = v10->var3;
      v36[8] = v10->var2;
      v36[9] = v27;
      v36[6] = v25;
      v36[7] = v26;
      v35[0] = v11->var0;
      CGSize var1 = v11->var1;
      CGSize var2 = v11->var2;
      CGPoint var5 = v11->var5;
      v35[3] = *(_OWORD *)&v11->var3;
      v35[4] = var5;
      v35[1] = var1;
      v35[2] = var2;
      v34[0] = v12->var0;
      CGSize v31 = v12->var1;
      CGSize v32 = v12->var2;
      CGPoint v33 = v12->var5;
      v34[3] = *(_OWORD *)&v12->var3;
      v34[4] = v33;
      v34[1] = v31;
      v34[2] = v32;
      v13(v4, v8, v37, v36, v35, v34, &v38);

      if (v38) {
        break;
      }
      ++v7;
      ++v6;
      ++v5;
    }
    while (v7 < self->_count);
  }
}

- (void)addClipLayout:(id)a3 configurationBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  clipLayouts = self->_clipLayouts;
  if (!clipLayouts)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v10 = self->_clipLayouts;
    self->_clipLayouts = v9;

    clipLayouts = self->_clipLayouts;
  }
  [(NSMutableArray *)clipLayouts addObject:v6];
  int64_t capacity = self->_capacity;
  ++self->_count;
  *(void *)&long long v12 = capacity;
  _PXGArrayCapacityResizeToCount();
}

- (NSString)identifier
{
}

- (void)dealloc
{
  free(self->_sourceStates);
  free(self->_targetStates);
  free(self->_primaryDividerInfos);
  free(self->_secondaryDividerInfos);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryWipeTransitionConfiguration;
  [(PXStoryWipeTransitionConfiguration *)&v3 dealloc];
}

- (PXStoryWipeTransitionConfiguration)initWithDuration:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXStoryWipeTransitionConfiguration;
  CGSize result = [(PXStoryWipeTransitionConfiguration *)&v6 init];
  if (result)
  {
    long long v5 = *(_OWORD *)&a3->var0;
    result->_duration.epoch = a3->var3;
    *(_OWORD *)&result->_duration.value = v5;
  }
  return result;
}

- (PXStoryWipeTransitionConfiguration)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryTransition.m", 384, @"%s is not available as initializer", "-[PXStoryWipeTransitionConfiguration init]");

  abort();
}

@end