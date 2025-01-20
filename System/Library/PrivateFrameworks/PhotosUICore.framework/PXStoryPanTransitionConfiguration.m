@interface PXStoryPanTransitionConfiguration
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- (NSString)identifier;
- (PXStoryPanTransitionConfiguration)init;
- (PXStoryPanTransitionConfiguration)initWithDuration:(id *)a3;
- (void)addClipLayout:(id)a3 sourceRect:(CGRect)a4 targetRect:(CGRect)a5;
- (void)enumerateLayoutsUsingBlock:(id)a3;
@end

@implementation PXStoryPanTransitionConfiguration

- (void).cxx_destruct
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

- (void)enumerateLayoutsUsingBlock:(id)a3
{
  v4 = (void (**)(id, void *, unsigned char *, double, double, double, double, double, double, double, double))a3;
  char v9 = 0;
  if (self->_count >= 1)
  {
    uint64_t v5 = 0;
    int64_t v6 = 0;
    do
    {
      v7 = [(NSMutableArray *)self->_clipLayouts objectAtIndexedSubscript:v6];
      v8 = &self->_sourceRects[v5];
      v4[2](v4, v7, &v9, v8->origin.x, v8->origin.y, v8->size.width, v8->size.height, self->_targetRects[v5].origin.x, self->_targetRects[v5].origin.y, self->_targetRects[v5].size.width, self->_targetRects[v5].size.height);

      if (v9) {
        break;
      }
      ++v6;
      ++v5;
    }
    while (v6 < self->_count);
  }
}

- (void)addClipLayout:(id)a3 sourceRect:(CGRect)a4 targetRect:(CGRect)a5
{
  id v6 = a3;
  clipLayouts = self->_clipLayouts;
  if (!clipLayouts)
  {
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    char v9 = self->_clipLayouts;
    self->_clipLayouts = v8;

    clipLayouts = self->_clipLayouts;
  }
  [(NSMutableArray *)clipLayouts addObject:v6];
  ++self->_count;
  _PXGArrayCapacityResizeToCount();
}

- (NSString)identifier
{
}

- (PXStoryPanTransitionConfiguration)initWithDuration:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXStoryPanTransitionConfiguration;
  result = [(PXStoryPanTransitionConfiguration *)&v6 init];
  if (result)
  {
    long long v5 = *(_OWORD *)&a3->var0;
    result->_duration.epoch = a3->var3;
    *(_OWORD *)&result->_duration.value = v5;
  }
  return result;
}

- (PXStoryPanTransitionConfiguration)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryTransition.m", 562, @"%s is not available as initializer", "-[PXStoryPanTransitionConfiguration init]");

  abort();
}

@end