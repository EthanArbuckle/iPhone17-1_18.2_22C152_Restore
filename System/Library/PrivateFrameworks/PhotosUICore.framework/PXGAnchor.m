@interface PXGAnchor
- (BOOL)canBeReused;
- (BOOL)isAutoInvalidated;
- (BOOL)isScrollingAnimationAnchor;
- (BOOL)needsUpdate;
- (BOOL)shouldFaultInContentAtAnchoredContentEdges;
- (CGPoint)normalizedAnchorPoint;
- (CGPoint)visibleLocation;
- (CGRect)adjustVisibleRect:(CGRect)a3;
- (CGRect)visibleRect;
- (CGSize)contentSize;
- (NSArray)constraints;
- (NSArray)spriteRects;
- (NSArray)spriteReferences;
- (NSDate)date;
- (NSString)description;
- (NSString)diagnosticDescription;
- (PXGAnchor)init;
- (PXGAnchor)initWithLayout:(id)a3;
- (PXGAnchorDelegate)delegate;
- (PXGLayout)layout;
- (UIEdgeInsets)padding;
- (id)autoInvalidate;
- (id)context;
- (id)copyWithLayout:(id)a3;
- (id)customOffset;
- (int64_t)priority;
- (int64_t)type;
- (unint64_t)anchoredContentEdges;
- (unint64_t)edges;
- (unint64_t)referencingOptions;
- (unint64_t)scrollPosition;
- (unsigned)anchoredSpriteIndexInLayout:(id)a3;
- (void)_enumerateSpriteConstraintsUsingBlock:(id)a3;
- (void)adjustReferencedSpriteIndexesWithChangeDetails:(id)a3 appliedToLayout:(id)a4;
- (void)enumerateAllSpriteReferencesUsingBlock:(id)a3;
- (void)enumerateSpritesWithEnumerationOptions:(unint64_t)a3 referencingOptions:(unint64_t)a4 usingBlock:(id)a5;
- (void)invalidate;
- (void)setConstraints:(id)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setContext:(id)a3;
- (void)setCustomOffset:(id)a3;
- (void)setDate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEdges:(unint64_t)a3;
- (void)setNeedsUpdate:(BOOL)a3;
- (void)setNormalizedAnchorPoint:(CGPoint)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setPriority:(int64_t)a3;
- (void)setReferencingOptions:(unint64_t)a3;
- (void)setScrollPosition:(unint64_t)a3;
- (void)setSpriteRects:(id)a3;
- (void)setSpriteReferences:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setVisibleLocation:(CGPoint)a3;
- (void)setVisibleRect:(CGRect)a3;
@end

@implementation PXGAnchor

- (void)enumerateAllSpriteReferencesUsingBlock:(id)a3
{
  id v5 = a3;
  v6 = [(PXGAnchor *)self spriteReferences];
  v7 = [(PXGAnchor *)self constraints];
  if ([v6 count] && objc_msgSend(v7, "count"))
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXGAnchor.m", 511, @"an anchor (%@) cannot have both spriteReferences (%@) and constraints (%@)", self, v6, v7 object file lineNumber description];
  }
  v8 = [(PXGAnchor *)self spriteRects];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PXGAnchor_enumerateAllSpriteReferencesUsingBlock___block_invoke;
  aBlock[3] = &unk_1E5DBA1E8;
  id v9 = v8;
  id v27 = v9;
  v10 = _Block_copy(aBlock);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __52__PXGAnchor_enumerateAllSpriteReferencesUsingBlock___block_invoke_2;
  v20[3] = &unk_1E5DBA210;
  id v11 = v5;
  v20[4] = self;
  id v21 = v11;
  id v12 = v10;
  id v22 = v12;
  v23 = v24;
  [v6 enumerateObjectsUsingBlock:v20];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__PXGAnchor_enumerateAllSpriteReferencesUsingBlock___block_invoke_3;
  v16[3] = &unk_1E5DBA238;
  id v13 = v11;
  id v17 = v13;
  id v14 = v12;
  id v18 = v14;
  v19 = v24;
  [v7 enumerateObjectsUsingBlock:v16];

  _Block_object_dispose(v24, 8);
}

- (NSArray)spriteReferences
{
  return self->_spriteReferences;
}

- (NSArray)spriteRects
{
  return self->_spriteRects;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)adjustReferencedSpriteIndexesWithChangeDetails:(id)a3 appliedToLayout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  char v25 = __Block_byref_object_copy__106382;
  v26 = __Block_byref_object_dispose__106383;
  id v27 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __76__PXGAnchor_adjustReferencedSpriteIndexesWithChangeDetails_appliedToLayout___block_invoke;
  id v13 = &unk_1E5DBA1C0;
  v16 = &v22;
  id v8 = v6;
  id v14 = v8;
  id v9 = v7;
  id v15 = v9;
  id v17 = &v18;
  [(PXGAnchor *)self enumerateAllSpriteReferencesUsingBlock:&v10];
  if (objc_msgSend((id)v23[5], "count", v10, v11, v12, v13) && !*((unsigned char *)v19 + 24)) {
    [(PXGAnchor *)self invalidate];
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (void)setDate:(id)a3
{
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (BOOL)isAutoInvalidated
{
  return self->_autoInvalidated;
}

- (CGRect)adjustVisibleRect:(CGRect)a3
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3010000000;
  v5[3] = &unk_1AB5D584F;
  long long v6 = *MEMORY[0x1E4F1DAD8];
  v4 = [(PXGAnchor *)self layout];
  if (([(PXGAnchor *)self scrollPosition] & 0x100) == 0) {
    [v4 safeAreaInsets];
  }
  [(PXGAnchor *)self padding];
  PXEdgeInsetsAdd();
}

- (unint64_t)edges
{
  return self->_edges;
}

uint64_t __31__PXGAnchor_adjustVisibleRect___block_invoke_5(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  switch(a2)
  {
    case 1:
      uint64_t v3 = 4;
LABEL_7:
      uint64_t v4 = a2;
      goto LABEL_8;
    case 2:
      uint64_t v3 = 8;
      goto LABEL_7;
    case 0:
      long long v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:*(void *)(v2 + 56) object:*(void *)(v2 + 32) file:@"PXGAnchor.m" lineNumber:339 description:@"Code which should be unreachable has been reached"];

      abort();
  }
  uint64_t v3 = 0;
  uint64_t v4 = 0;
LABEL_8:
  uint64_t v5 = *(void *)(result + 64);
  if (((v4 | v3) & ~v5) == 0)
  {
    [*(id *)(result + 40) contentSize];
    PXSizeValueForAxis();
  }
  if ((v5 & v4) != 0) {
    PXRectGetMinForAxis();
  }
  if ((v5 & v3) != 0)
  {
    [*(id *)(result + 40) contentSize];
    PXSizeValueForAxis();
  }
  return result;
}

- (void)invalidate
{
  id v3 = [(PXGAnchor *)self layout];
  [v3 removeAnchor:self];
}

- (PXGLayout)layout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
  return (PXGLayout *)WeakRetained;
}

- (unint64_t)scrollPosition
{
  return self->_scrollPosition;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (id)autoInvalidate
{
  *((unsigned char *)self + 10) = 1;
  return self;
}

- (CGRect)visibleRect
{
  double x = self->_visibleRect.origin.x;
  double y = self->_visibleRect.origin.y;
  double width = self->_visibleRect.size.width;
  double height = self->_visibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isScrollingAnimationAnchor
{
  return (unint64_t)[(PXGAnchor *)self type] > 4;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setEdges:(unint64_t)a3
{
  self->_edges = a3;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (id)copyWithLayout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [objc_alloc((Class)objc_opt_class()) initWithLayout:v4];
  *(void *)(v5 + 40) = self->_type;
  *(void *)(v5 + 48) = self->_priority;
  CGPoint origin = self->_visibleRect.origin;
  *(CGSize *)(v5 + 184) = self->_visibleRect.size;
  *(CGPoint *)(v5 + 168) = origin;
  *(CGSize *)(v5 + 120) = self->_contentSize;
  v4;
  PXMap();
}

- (PXGAnchor)initWithLayout:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXGAnchor;
  uint64_t v5 = [(PXGAnchor *)&v8 init];
  long long v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_layout, v4);
    v6->_prioritdouble y = 1;
    v6->_visibleLocation = *(CGPoint *)off_1E5DAB000;
  }

  return v6;
}

- (void)setVisibleRect:(CGRect)a3
{
  self->_visibleRect = a3;
}

- (void)setPriority:(int64_t)a3
{
  self->_prioritdouble y = a3;
}

- (void)setSpriteRects:(id)a3
{
}

- (void)setConstraints:(id)a3
{
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_customOffset, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_spriteRects, 0);
  objc_storeStrong((id *)&self->_spriteReferences, 0);
  objc_destroyWeak((id *)&self->_layout);
  objc_storeStrong(&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (unint64_t)anchoredContentEdges
{
  if ((unint64_t)([(PXGAnchor *)self type] - 3) > 2) {
    return 0;
  }
  return [(PXGAnchor *)self edges];
}

- (BOOL)canBeReused
{
  id v3 = [(PXGAnchor *)self date];
  [v3 timeIntervalSinceNow];
  double v5 = v4;

  if (v5 > 0.0 || v5 <= -120.0) {
    return 0;
  }
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __24__PXGAnchor_canBeReused__block_invoke;
  v9[3] = &unk_1E5DBA080;
  v9[4] = &v14;
  v9[5] = &v10;
  [(PXGAnchor *)self enumerateAllSpriteReferencesUsingBlock:v9];
  if (*((unsigned char *)v11 + 24)) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = *((unsigned char *)v15 + 24) == 0;
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setNormalizedAnchorPoint:(CGPoint)a3
{
  self->_normalizedAnchorPoint = a3;
}

- (CGPoint)normalizedAnchorPoint
{
  double x = self->_normalizedAnchorPoint.x;
  double y = self->_normalizedAnchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setVisibleLocation:(CGPoint)a3
{
  self->_visibleLocation = a3;
}

- (CGPoint)visibleLocation
{
  double x = self->_visibleLocation.x;
  double y = self->_visibleLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCustomOffset:(id)a3
{
}

- (id)customOffset
{
  return self->_customOffset;
}

- (void)setScrollPosition:(unint64_t)a3
{
  self->_scrollPosition = a3;
}

- (void)setReferencingOptions:(unint64_t)a3
{
  self->_referencingOptions = a3;
}

- (unint64_t)referencingOptions
{
  return self->_referencingOptions;
}

- (void)setSpriteReferences:(id)a3
{
}

- (void)setContext:(id)a3
{
}

- (id)context
{
  return self->_context;
}

- (PXGAnchorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXGAnchorDelegate *)WeakRetained;
}

- (NSString)diagnosticDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  double v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  int64_t v6 = [(PXGAnchor *)self priority];
  BOOL v7 = @"unknown";
  objc_super v8 = @"Default";
  if (v6 != 1) {
    objc_super v8 = @"unknown";
  }
  if (!v6) {
    objc_super v8 = @"Low";
  }
  id v9 = v8;
  unint64_t v10 = [(PXGAnchor *)self type];
  if (v10 <= 5) {
    BOOL v7 = off_1E5DBA458[v10];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
  uint64_t v12 = (objc_class *)objc_opt_class();
  char v13 = NSStringFromClass(v12);
  id v14 = objc_loadWeakRetained((id *)&self->_layout);
  [(PXGAnchor *)self visibleRect];
  id v15 = NSStringFromCGRect(v34);
  [(PXGAnchor *)self contentSize];
  uint64_t v16 = NSStringFromCGSize(v33);
  char v17 = (void *)[v3 initWithFormat:@"<%@: %p, priority=%@ type=%@ layout=<%@: %p>\n\tvisibleRect=%@ contentSize=%@\n", v5, self, v9, v7, v13, v14, v15, v16];

  uint64_t v18 = [(PXGAnchor *)self spriteReferences];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __34__PXGAnchor_diagnosticDescription__block_invoke;
  v31[3] = &unk_1E5DBA300;
  id v19 = v17;
  id v32 = v19;
  [v18 enumerateObjectsUsingBlock:v31];

  uint64_t v20 = [(PXGAnchor *)self constraints];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __34__PXGAnchor_diagnosticDescription__block_invoke_2;
  v29[3] = &unk_1E5DBA328;
  id v21 = v19;
  id v30 = v21;
  [v20 enumerateObjectsUsingBlock:v29];

  uint64_t v22 = [(PXGAnchor *)self spriteRects];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __34__PXGAnchor_diagnosticDescription__block_invoke_3;
  v27[3] = &unk_1E5DBA350;
  id v23 = v21;
  id v28 = v23;
  [v22 enumerateObjectsUsingBlock:v27];

  [v23 appendString:@">"];
  uint64_t v24 = v28;
  id v25 = v23;

  return (NSString *)v25;
}

uint64_t __34__PXGAnchor_diagnosticDescription__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"\t%li: %@\n", a3, a2];
}

uint64_t __34__PXGAnchor_diagnosticDescription__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"\t%li: %@\n", a3, a2];
}

uint64_t __34__PXGAnchor_diagnosticDescription__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"\t%li: %@\n", a3, a2];
}

- (void)_enumerateSpriteConstraintsUsingBlock:(id)a3
{
  id v4 = a3;
  double v5 = [(PXGAnchor *)self layout];
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__106382;
  v23[4] = __Block_byref_object_dispose__106383;
  id v24 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  int v21 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x4010000000;
  v17[3] = &unk_1AB5D584F;
  long long v18 = 0u;
  long long v19 = 0u;
  int64_t v6 = [(PXGAnchor *)self constraints];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__PXGAnchor__enumerateSpriteConstraintsUsingBlock___block_invoke;
  v9[3] = &unk_1E5DBA2D8;
  char v13 = v23;
  id v14 = v22;
  id v15 = v20;
  uint64_t v16 = v17;
  id v7 = v5;
  id v10 = v7;
  uint64_t v11 = self;
  id v8 = v4;
  id v12 = v8;
  [v6 enumerateObjectsUsingBlock:v9];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);
}

void __51__PXGAnchor__enumerateSpriteConstraintsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v29 = a2;
  double v5 = [v29 spriteReference];
  if (v5)
  {
    uint64_t v6 = [v29 referencingOptions];
    uint64_t v7 = v6;
    if (v5 == *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
      && v6 == *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      id v8 = *(double **)(*(void *)(a1 + 80) + 8);
      double v9 = v8[4];
      double v10 = v8[5];
      double v11 = v8[6];
      double v12 = v8[7];
    }
    else
    {
      uint64_t v13 = [*(id *)(a1 + 32) spriteIndexForSpriteReference:v5 options:v6];
      if (v13 == -1)
      {
        double v9 = *MEMORY[0x1E4F1DB20];
        double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
        double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
        double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      }
      else
      {
        [*(id *)(a1 + 32) anchoringRectForSpriteAtIndex:v13];
        double v9 = v14;
        double v10 = v15;
        double v11 = v16;
        double v12 = v17;
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v5);
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v7;
      *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v13;
      long long v18 = *(double **)(*(void *)(a1 + 80) + 8);
      v18[4] = v9;
      v18[5] = v10;
      v18[6] = v11;
      v18[7] = v12;
    }
    v31.origin.double x = v9;
    v31.origin.double y = v10;
    v31.size.double width = v11;
    v31.size.double height = v12;
    if (!CGRectIsNull(v31))
    {
      long long v19 = [*(id *)(a1 + 40) spriteRects];
      uint64_t v20 = [v19 objectAtIndexedSubscript:a3];
      [v20 CGRectValue];
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;

      (*(void (**)(double, double, double, double, double, double, double, double))(*(void *)(a1 + 48)
                                                                                             + 16))(v22, v24, v26, v28, v9, v10, v11, v12);
    }
  }
}

- (void)enumerateSpritesWithEnumerationOptions:(unint64_t)a3 referencingOptions:(unint64_t)a4 usingBlock:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [(PXGAnchor *)self layout];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__PXGAnchor_enumerateSpritesWithEnumerationOptions_referencingOptions_usingBlock___block_invoke;
  v10[3] = &unk_1E5DBA2B0;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(PXGAnchor *)self enumerateAllSpriteReferencesUsingBlock:v10];
}

uint64_t __82__PXGAnchor_enumerateSpritesWithEnumerationOptions_referencingOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  uint64_t result = [*(id *)(a1 + 32) spriteIndexForSpriteReference:a2 options:a3];
  if (result != -1)
  {
    double v17 = *(uint64_t (**)(__n128, __n128, __n128, __n128))(*(void *)(a1 + 40) + 16);
    v13.n128_f64[0] = a4;
    v14.n128_f64[0] = a5;
    v15.n128_f64[0] = a6;
    v16.n128_f64[0] = a7;
    return v17(v13, v14, v15, v16);
  }
  return result;
}

uint64_t __28__PXGAnchor_copyWithLayout___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) spriteReferenceForSpriteReference:a2];
}

id __28__PXGAnchor_copyWithLayout___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 spriteReference];
  if (v4)
  {
    double v5 = (void *)[v3 copy];

    id v6 = [*(id *)(a1 + 32) spriteReferenceForSpriteReference:v4];
    [v5 setSpriteReference:v6];

    id v3 = v5;
  }

  return v3;
}

double __52__PXGAnchor_enumerateAllSpriteReferencesUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2) {
    return *MEMORY[0x1E4F1DB20];
  }
  id v3 = [v2 objectAtIndexedSubscript:a2];
  [v3 CGRectValue];
  double v5 = v4;

  return v5;
}

void __52__PXGAnchor_enumerateAllSpriteReferencesUsingBlock___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = (void *)a1[4];
  uint64_t v6 = a1[5];
  id v8 = a2;
  uint64_t v9 = [v7 referencingOptions];
  (*(void (**)(void))(a1[6] + 16))();
  (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v6 + 16))(v6, v8, v9, *(void *)(a1[7] + 8) + 24);

  *a4 = *(unsigned char *)(*(void *)(a1[7] + 8) + 24);
}

void __52__PXGAnchor_enumerateAllSpriteReferencesUsingBlock___block_invoke_3(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  uint64_t v6 = [v9 spriteReference];
  if (v6)
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = [v9 referencingOptions];
    (*(void (**)(void))(a1[5] + 16))();
    (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v7 + 16))(v7, v6, v8, *(void *)(a1[6] + 8) + 24);
    *a4 = *(unsigned char *)(*(void *)(a1[6] + 8) + 24);
  }
}

void __76__PXGAnchor_adjustReferencedSpriteIndexesWithChangeDetails_appliedToLayout___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  double v4 = *(void **)(*(void *)(a1[6] + 8) + 40);
  id v8 = v3;
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v6 = *(void *)(a1[6] + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v3 = v8;
    double v4 = *(void **)(*(void *)(a1[6] + 8) + 40);
  }
  if (([v4 containsObject:v3] & 1) == 0)
  {
    [v8 adjustReferencedSpriteIndexesWithChangeDetails:a1[4] appliedToLayout:a1[5]];
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) |= [v8 isValid];
    [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v8];
  }
}

- (unsigned)anchoredSpriteIndexInLayout:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  __n128 v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = -1;
  int64_t v5 = [(PXGAnchor *)self type];
  if (v5 == 1)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __41__PXGAnchor_anchoredSpriteIndexInLayout___block_invoke;
    v11[3] = &unk_1E5DBA170;
    v11[4] = &v12;
    [(PXGAnchor *)self _enumerateSpriteConstraintsUsingBlock:v11];
  }
  else if (v5 == 2)
  {
    unint64_t v6 = [(PXGAnchor *)self referencingOptions];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__PXGAnchor_anchoredSpriteIndexInLayout___block_invoke_2;
    v10[3] = &unk_1E5DBA198;
    void v10[4] = &v12;
    [(PXGAnchor *)self enumerateSpritesWithEnumerationOptions:0 referencingOptions:v6 usingBlock:v10];
  }
  uint64_t v7 = *((unsigned int *)v13 + 6);
  id v8 = [(PXGAnchor *)self layout];
  LODWORD(v7) = [v4 convertSpriteIndex:v7 fromLayout:v8];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __41__PXGAnchor_anchoredSpriteIndexInLayout___block_invoke(uint64_t result, uint64_t a2, int a3, unsigned char *a4)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
  *a4 = 1;
  return result;
}

uint64_t __41__PXGAnchor_anchoredSpriteIndexInLayout___block_invoke_2(uint64_t result, int a2, unsigned char *a3)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  *a3 = 1;
  return result;
}

- (BOOL)shouldFaultInContentAtAnchoredContentEdges
{
  return (unint64_t)([(PXGAnchor *)self type] - 3) < 3;
}

void __31__PXGAnchor_adjustVisibleRect___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  id v15 = a2;
  if ([v15 inequality])
  {
    [v15 inequality];
    [v15 spriteEdge];
    PXRectEdgeValue();
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __31__PXGAnchor_adjustVisibleRect___block_invoke_2;
    aBlock[3] = &unk_1E5DBA0A8;
    id v16 = v15;
    void aBlock[4] = v16;
    double v17 = (void (**)(void *, double, double, double, double))_Block_copy(aBlock);
    if ([v16 visiblePortionOnly])
    {
      [v16 padding];
      PXEdgeInsetsInsetRect();
    }
    v17[2](v17, a7, a8, a9, a10);
    v17[2](v17, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    PXPointSubtract();
  }
}

void __31__PXGAnchor_adjustVisibleRect___block_invoke_3(uint64_t a1, uint64_t a2)
{
}

void __31__PXGAnchor_adjustVisibleRect___block_invoke_4()
{
}

double __31__PXGAnchor_adjustVisibleRect___block_invoke_2(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  switch([*(id *)(a1 + 32) spriteAttribute])
  {
    case 0:
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      __n128 v13 = objc_msgSend(NSString, "stringWithUTF8String:", "CGPoint _PXGAnchoredPointInRectForSpriteAttribute(CGRect, PXGSpriteAttribute)");
      [v12 handleFailureInFunction:v13 file:@"PXGAnchor.m" lineNumber:88 description:@"Code which should be unreachable has been reached"];

      abort();
    case 1:
      v14.origin.double x = a2;
      v14.origin.double y = a3;
      v14.size.double width = a4;
      v14.size.double height = a5;
      double MidX = CGRectGetMidX(v14);
      goto LABEL_8;
    case 2:
      v15.origin.double x = a2;
      v15.origin.double y = a3;
      v15.size.double width = a4;
      v15.size.double height = a5;
      double v10 = CGRectGetMidX(v15);
      v16.origin.double x = a2;
      v16.origin.double y = a3;
      v16.size.double width = a4;
      v16.size.double height = a5;
      CGRectGetMinY(v16);
      return v10;
    case 3:
      v17.origin.double x = a2;
      v17.origin.double y = a3;
      v17.size.double width = a4;
      v17.size.double height = a5;
      double v10 = CGRectGetMidX(v17);
      v18.origin.double x = a2;
      v18.origin.double y = a3;
      v18.size.double width = a4;
      v18.size.double height = a5;
      CGRectGetMaxY(v18);
      return v10;
    case 4:
      v19.origin.double x = a2;
      v19.origin.double y = a3;
      v19.size.double width = a4;
      v19.size.double height = a5;
      double MidX = CGRectGetMinX(v19);
      goto LABEL_8;
    case 5:
      v20.origin.double x = a2;
      v20.origin.double y = a3;
      v20.size.double width = a4;
      v20.size.double height = a5;
      double MidX = CGRectGetMaxX(v20);
LABEL_8:
      double v10 = MidX;
      v21.origin.double x = a2;
      v21.origin.double y = a3;
      v21.size.double width = a4;
      v21.size.double height = a5;
      CGRectGetMidY(v21);
      break;
    default:
      double v10 = 0.0;
      break;
  }
  return v10;
}

uint64_t __24__PXGAnchor_canBeReused__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  uint64_t result = [a2 hasObjectReference];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (NSString)description
{
  double v22 = NSString;
  id v3 = (objc_class *)objc_opt_class();
  double v23 = NSStringFromClass(v3);
  id v4 = @"unknown";
  int64_t v5 = @"Default";
  unint64_t type = self->_type;
  prioritdouble y = self->_priority;
  if (priority != 1) {
    int64_t v5 = @"unknown";
  }
  if (!priority) {
    int64_t v5 = @"Low";
  }
  if (type <= 5) {
    id v4 = off_1E5DBA458[type];
  }
  id v8 = v5;
  [(PXGAnchor *)self visibleRect];
  id v9 = NSStringFromCGRect(v25);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
  double v10 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v10);
  id v12 = objc_loadWeakRetained((id *)&self->_layout);
  __n128 v13 = [(PXGAnchor *)self constraints];
  CGRect v14 = [v13 componentsJoinedByString:@",\n"];
  CGRect v15 = [(PXGAnchor *)self spriteReferences];
  uint64_t v16 = [v15 componentsJoinedByString:@",\n"];
  CGRect v17 = (void *)v16;
  CGRect v18 = &stru_1F00B0030;
  if (v16) {
    CGRect v18 = (__CFString *)v16;
  }
  objc_msgSend(v22, "stringWithFormat:", @"<%@: %p; prioritdouble y = %@; type = %@; visibleRect = %@; layout = <%@: %p>; constraints = [%@]; spriteReferences = [%@];>",
    v23,
    self,
    v8,
    v4,
    v9,
    v11,
    v12,
    v14,
  CGRect v19 = v18);

  return (NSString *)v19;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsTo.visibleRectOriginForProposedVisibleRectForLayout = objc_opt_respondsToSelector() & 1;
  }
}

- (PXGAnchor)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGAnchor.m", 121, @"%s is not available as initializer", "-[PXGAnchor init]");

  abort();
}

@end