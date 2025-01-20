@interface NSTextHighlightShapeProvider
- (BOOL)enumerateHighlightPathsForRange:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (BOOL)enumerateHighlightShapesForRunClusterWithRanges:(id)a3 usingBlock:(id)a4;
- (BOOL)isPoint:(CGPoint)a3 withinHorizontalDistance:(double)a4 onRect:(CGRect)a5 leftDistance:(double *)a6 rightDistance:(double *)a7;
- (NSTextHighlightShapeProvider)initWithTextLayoutManager:(id)a3;
- (id)textLayoutManager;
- (id)textSegmentRectsForRange:(id)a3;
- (unint64_t)modifyOptions:(unint64_t)a3 forLineBoundariesInRange:(id)a4;
- (void)enumerateHighlightPathsForRanges:(id)a3 usingBlock:(id)a4;
@end

@implementation NSTextHighlightShapeProvider

- (NSTextHighlightShapeProvider)initWithTextLayoutManager:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NSTextHighlightShapeProvider;
  v5 = [(NSTextHighlightShapeProvider *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_textLayoutManager, v4);
  }

  return v6;
}

- (id)textLayoutManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutManager);

  return WeakRetained;
}

- (BOOL)isPoint:(CGPoint)a3 withinHorizontalDistance:(double)a4 onRect:(CGRect)a5 leftDistance:(double *)a6 rightDistance:(double *)a7
{
  *a6 = a5.origin.x - a3.x;
  *a7 = a5.origin.x + a5.size.width - a3.x;
  BOOL v7 = a5.origin.x <= a3.x;
  if (a3.x > a5.origin.x + a5.size.width + a4) {
    BOOL v7 = 0;
  }
  BOOL v8 = a5.origin.x <= a3.x + a4;
  if (a3.x > a5.origin.x + a5.size.width) {
    BOOL v8 = 0;
  }
  return v8 || v7;
}

- (id)textSegmentRectsForRange:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  v6 = [v4 array];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutManager);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__NSTextHighlightShapeProvider_textSegmentRectsForRange___block_invoke;
  v10[3] = &unk_1E55C6ED0;
  id v8 = v6;
  id v11 = v8;
  [WeakRetained enumerateTextSegmentsInRange:v5 type:0 options:0 usingBlock:v10];

  return v8;
}

uint64_t __57__NSTextHighlightShapeProvider_textSegmentRectsForRange___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:");
  [v1 addObject:v2];

  return 1;
}

- (unint64_t)modifyOptions:(unint64_t)a3 forLineBoundariesInRange:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutManager);
  id v8 = [WeakRetained _rangeForAllLinesContainingTextInRange:v6];

  if (v8)
  {
    v9 = [v6 location];
    v10 = [v8 location];
    uint64_t v11 = [v9 compare:v10];

    if ((unint64_t)(v11 + 1) >= 2) {
      unint64_t v12 = a3;
    }
    else {
      unint64_t v12 = a3 | 4;
    }
    v13 = [v6 endLocation];
    v14 = [v8 endLocation];
    unint64_t v15 = [v13 compare:v14];

    if (v15 >= 2) {
      a3 = v12;
    }
    else {
      a3 = v12 | 8;
    }
  }

  return a3;
}

- (BOOL)enumerateHighlightShapesForRunClusterWithRanges:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[_NSTextHighlightCluster initWithShapeProvider:]([_NSTextHighlightCluster alloc], self);
  -[_NSTextHighlightCluster addRunsWithTextRangeArray:]((uint64_t)v8, v7);

  -[_NSTextHighlightCluster drawRunsUsingBlock:]((uint64_t)v8, v6);
  return 1;
}

- (void)enumerateHighlightPathsForRanges:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__NSTextHighlightShapeProvider_enumerateHighlightPathsForRanges_usingBlock___block_invoke;
  v8[3] = &unk_1E55C6EF8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 enumerateObjectsUsingBlock:v8];
}

uint64_t __76__NSTextHighlightShapeProvider_enumerateHighlightPathsForRanges_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) enumerateHighlightPathsForRange:a2 options:0 usingBlock:*(void *)(a1 + 40)];
  *a4 = result;
  return result;
}

- (BOOL)enumerateHighlightPathsForRange:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a3;
  id v9 = -[_NSTextHighlightCluster initWithShapeProvider:]([_NSTextHighlightCluster alloc], self);
  v18[0] = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  -[_NSTextHighlightCluster addRunsWithTextRangeArray:]((uint64_t)v9, v10);

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__NSTextHighlightShapeProvider_enumerateHighlightPathsForRange_options_usingBlock___block_invoke;
  v15[3] = &unk_1E55C6F20;
  id v16 = v9;
  id v17 = v7;
  uint64_t v11 = v9;
  id v12 = v7;
  v13 = (void *)MEMORY[0x192FAE7E0](v15);
  -[_NSTextHighlightCluster drawRunsUsingBlock:]((uint64_t)v11, v13);

  return 1;
}

void __83__NSTextHighlightShapeProvider_enumerateHighlightPathsForRange_options_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  if (v7) {
    id v7 = (void *)v7[4];
  }
  id v9 = v7;
  uint64_t v10 = [v9 objectAtIndex:a4];
  id v12 = (id)v10;
  if (v10) {
    uint64_t v11 = *(void *)(v10 + 48);
  }
  else {
    uint64_t v11 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, void))(v8 + 16))(v8, a2, a3, v11, 0, 0);
}

- (void).cxx_destruct
{
}

@end