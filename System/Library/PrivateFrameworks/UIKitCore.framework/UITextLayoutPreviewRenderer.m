@interface UITextLayoutPreviewRenderer
@end

@implementation UITextLayoutPreviewRenderer

uint64_t __51___UITextLayoutPreviewRenderer__updateDataIfNeeded__block_invoke(void *a1, double x, double y, double width, double height)
{
  v10 = (void *)a1[4];
  v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:");
  [v10 addObject:v11];

  v12 = (void *)a1[5];
  v13 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", x, y, width, height);
  [v12 appendPath:v13];

  if (!CGRectIsEmpty(*(CGRect *)(*(void *)(a1[6] + 8) + 32)))
  {
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    CGRect v17 = CGRectUnion(v16, *(CGRect *)(*(void *)(a1[6] + 8) + 32));
    x = v17.origin.x;
    y = v17.origin.y;
    width = v17.size.width;
    height = v17.size.height;
  }
  v14 = *(double **)(a1[6] + 8);
  v14[4] = x;
  v14[5] = y;
  v14[6] = width;
  v14[7] = height;
  return 1;
}

void __51___UITextLayoutPreviewRenderer__updateDataIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (CGContext *)[a2 CGContext];
  CGContextSaveGState(v3);
  long long v4 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)&v5.a = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v5.c = v4;
  *(_OWORD *)&v5.tx = *(_OWORD *)(a1 + 88);
  CGContextConcatCTM(v3, &v5);
  [*(id *)(a1 + 32) addClip];
  _UITextLayoutDrawRangeInContext(*(void **)(a1 + 40), *(void **)(a1 + 48), (uint64_t)v3);
  CGContextRestoreGState(v3);
}

uint64_t __55___UITextLayoutPreviewRenderer_addRenderingAttributes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) addRenderingAttribute:a2 value:a3 forTextRange:*(void *)(*(void *)(a1 + 32) + 136)];
}

@end