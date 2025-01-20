@interface UIASCIIArtFramesRenderer
@end

@implementation UIASCIIArtFramesRenderer

void __46___UIASCIIArtFramesRenderer_visualDescription__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) length]) {
    [*(id *)(a1 + 32) appendString:@"\n"];
  }
  [*(id *)(a1 + 32) appendString:v3];
}

void __42___UIASCIIArtFramesRenderer_renderedLines__block_invoke(uint64_t a1, void *a2)
{
  [a2 CGRectValue];
  v7.origin.x = v3;
  v7.origin.y = v4;
  v7.size.width = v5;
  v7.size.height = v6;
  *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8)+ 32), v7);
}

void __42___UIASCIIArtFramesRenderer_renderedLines__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a4];
  CGFloat v6 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", a2, a3);
  [v7 addObject:v6];
}

id __42___UIASCIIArtFramesRenderer_renderedLines__block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2 < 3)
  {
    CGFloat v3 = [&stru_1ED0E84C0 stringByPaddingToLength:a2 withString:@"+" startingAtIndex:0];
  }
  else
  {
    v2 = [&stru_1ED0E84C0 stringByPaddingToLength:a2 - 2 withString:@"-" startingAtIndex:0];
    CGFloat v3 = [NSString stringWithFormat:@"+%@+", v2];
  }
  return v3;
}

void __42___UIASCIIArtFramesRenderer_renderedLines__block_invoke_24(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42___UIASCIIArtFramesRenderer_renderedLines__block_invoke_2_25;
  v5[3] = &unk_1E52E0BC8;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  long long v6 = v4;
  [a2 enumerateRangesUsingBlock:v5];
}

void __42___UIASCIIArtFramesRenderer_renderedLines__block_invoke_2_25(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 == 1)
  {
    uint64_t v6 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "stringByReplacingCharactersInRange:withString:", a2, 1, @"|");
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    uint64_t v12 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v9 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "stringByReplacingCharactersInRange:withString:", a2, a3, v12);
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    v8 = (void *)v12;
  }
}

uint64_t __46___UIASCIIArtFramesRenderer__normalizeFrames___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 CGRectValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(double *)(v6 + 32) < v4) {
    double v4 = *(double *)(v6 + 32);
  }
  *(double *)(v6 + 32) = v4;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  double v8 = *(double *)(v7 + 40);
  if (v8 >= v5) {
    double v8 = v5;
  }
  *(double *)(v7 + 40) = v8;
  return result;
}

void __46___UIASCIIArtFramesRenderer__normalizeFrames___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 CGRectValue];
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  CGFloat v7 = v12.origin.x - *(double *)(a1 + 40);
  CGFloat v8 = v12.origin.y - *(double *)(a1 + 48);
  double v9 = CGRectGetWidth(v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v7, v8, v9, CGRectGetHeight(v13));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v10];
}

@end