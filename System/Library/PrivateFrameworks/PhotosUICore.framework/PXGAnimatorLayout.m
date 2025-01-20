@interface PXGAnimatorLayout
- (BOOL)isSpriteIndex:(unsigned int)a3 decoratingSpriteWithIndex:(unsigned int *)a4;
- (CGRect)visibleRect;
- (CGSize)contentSize;
- (CGSize)referenceSize;
- (PXGAnimator)animator;
- (PXGAnimatorLayout)init;
- (PXGAnimatorLayout)initWithAnimator:(id)a3;
- (PXGLayout)inputLayout;
- (__n128)setCameraConfiguration:(uint64_t)a3;
- (double)cameraConfiguration;
- (id)fences;
- (id)leafSublayoutForSpriteIndex:(unsigned int)a3;
- (unsigned)convertSpriteIndex:(unsigned int)a3 fromLayout:(id)a4;
- (unsigned)numberOfSprites;
- (void)enumerateDescendantsLayoutsUsingBlock:(id)a3;
- (void)enumerateLayoutsForSpritesInRange:(_PXGSpriteIndexRange)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)removeAllFences;
- (void)setInputLayout:(id)a3;
@end

@implementation PXGAnimatorLayout

- (PXGAnimatorLayout)initWithAnimator:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXGAnimatorLayout;
  v5 = [(PXGAnimatorLayout *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_animator, v4);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputLayout, 0);
  objc_destroyWeak((id *)&self->_animator);
}

- (__n128)setCameraConfiguration:(uint64_t)a3
{
  *(_OWORD *)(a1 + 32) = *(_OWORD *)a3;
  long long v3 = *(_OWORD *)(a3 + 16);
  long long v4 = *(_OWORD *)(a3 + 32);
  long long v5 = *(_OWORD *)(a3 + 64);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(a1 + 96) = v5;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  long long v6 = *(_OWORD *)(a3 + 80);
  long long v7 = *(_OWORD *)(a3 + 96);
  long long v8 = *(_OWORD *)(a3 + 128);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a3 + 112);
  *(_OWORD *)(a1 + 160) = v8;
  *(_OWORD *)(a1 + 112) = v6;
  *(_OWORD *)(a1 + 128) = v7;
  __n128 result = *(__n128 *)(a3 + 144);
  long long v10 = *(_OWORD *)(a3 + 160);
  long long v11 = *(_OWORD *)(a3 + 192);
  *(_OWORD *)(a1 + 208) = *(_OWORD *)(a3 + 176);
  *(_OWORD *)(a1 + 224) = v11;
  *(__n128 *)(a1 + 176) = result;
  *(_OWORD *)(a1 + 192) = v10;
  return result;
}

- (void)setInputLayout:(id)a3
{
}

- (PXGLayout)inputLayout
{
  return self->_inputLayout;
}

- (PXGAnimator)animator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animator);
  return (PXGAnimator *)WeakRetained;
}

- (unsigned)convertSpriteIndex:(unsigned int)a3 fromLayout:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  long long v7 = [(PXGAnimatorLayout *)self inputLayout];
  LODWORD(v4) = [v7 convertSpriteIndex:v4 fromLayout:v6];

  return v4;
}

- (id)leafSublayoutForSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = [(PXGAnimatorLayout *)self inputLayout];
  if ([v4 numberOfSprites] <= v3)
  {
    long long v5 = 0;
  }
  else
  {
    long long v5 = [v4 leafSublayoutForSpriteIndex:v3];
  }

  return v5;
}

- (double)cameraConfiguration
{
  v2 = *(void **)(a1 + 16);
  if (v2)
  {
    [v2 cameraConfiguration];
  }
  else
  {
    double result = 0.0;
    a2[11] = 0u;
    a2[12] = 0u;
    a2[9] = 0u;
    a2[10] = 0u;
    a2[7] = 0u;
    a2[8] = 0u;
    a2[5] = 0u;
    a2[6] = 0u;
    a2[3] = 0u;
    a2[4] = 0u;
    a2[1] = 0u;
    a2[2] = 0u;
    *a2 = 0u;
  }
  return result;
}

- (BOOL)isSpriteIndex:(unsigned int)a3 decoratingSpriteWithIndex:(unsigned int *)a4
{
  uint64_t v5 = *(void *)&a3;
  id v6 = [(PXGAnimatorLayout *)self inputLayout];
  LOBYTE(a4) = [v6 isSpriteIndex:v5 decoratingSpriteWithIndex:a4];

  return (char)a4;
}

- (void)removeAllFences
{
  id v2 = [(PXGAnimatorLayout *)self inputLayout];
  [v2 removeAllFences];
}

- (id)fences
{
  id v2 = [(PXGAnimatorLayout *)self inputLayout];
  uint64_t v3 = [v2 fences];
  uint64_t v4 = (void *)[v3 copy];

  return v4;
}

- (void)enumerateLayoutsForSpritesInRange:(_PXGSpriteIndexRange)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
}

- (void)enumerateDescendantsLayoutsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(PXGAnimatorLayout *)self inputLayout];
  [v5 enumerateDescendantsLayoutsUsingBlock:v4];
}

- (unsigned)numberOfSprites
{
  id v2 = [(PXGAnimatorLayout *)self inputLayout];
  unsigned int v3 = [v2 numberOfSprites];

  return v3;
}

- (CGSize)contentSize
{
  id v2 = [(PXGAnimatorLayout *)self inputLayout];
  [v2 contentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)referenceSize
{
  id v2 = [(PXGAnimatorLayout *)self inputLayout];
  [v2 referenceSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGRect)visibleRect
{
  id v2 = [(PXGAnimatorLayout *)self inputLayout];
  [v2 visibleRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (PXGAnimatorLayout)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGAnimator.m", 1089, @"%s is not available as initializer", "-[PXGAnimatorLayout init]");

  abort();
}

@end