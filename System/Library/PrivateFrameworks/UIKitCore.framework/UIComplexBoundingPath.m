@interface UIComplexBoundingPath
@end

@implementation UIComplexBoundingPath

void __116___UIComplexBoundingPath__largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect_portraitAspectRatio___block_invoke(uint64_t a1, void *a2)
{
  v5 = a2;
  for (uint64_t i = *(void *)(*(void *)(a1 + 32) + 8); *(double *)(i + 48) > 0.0; uint64_t i = *(void *)(*(void *)(a1 + 32)
                                                                                              + 8))
  {
    if (*(double *)(i + 56) <= 0.0) {
      break;
    }
    if (v5[2]()) {
      break;
    }
    *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CGRectInset(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8)+ 32), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56));
    CGRect v7 = CGRectIntegral(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32));
    v4 = *(void **)(*(void *)(a1 + 40) + 8);
    v4[4] = (uint64_t)v7.origin.x;
    v4[5] = (uint64_t)v7.origin.y;
    v4[6] = (uint64_t)v7.size.width;
    v4[7] = (uint64_t)v7.size.height;
  }
}

uint64_t __116___UIComplexBoundingPath__largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect_portraitAspectRatio___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v2 = *(void *)(v1 + 32);
  unint64_t v3 = *(void *)(v1 + 40);
  long long v4 = *(_OWORD *)(a1 + 56);
  v6[0] = *(_OWORD *)(a1 + 40);
  v6[1] = v4;
  v6[2] = *(_OWORD *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 88);
  return _UIBoundingPathBitmapDataRowHitTest((unint64_t *)v6, v2, v3) & 1;
}

uint64_t __116___UIComplexBoundingPath__largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect_portraitAspectRatio___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 8);
  unint64_t v2 = v1[5];
  unint64_t v3 = v1[6] + v1[4];
  long long v4 = *(_OWORD *)(a1 + 56);
  v6[0] = *(_OWORD *)(a1 + 40);
  v6[1] = v4;
  v6[2] = *(_OWORD *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 88);
  return _UIBoundingPathBitmapDataRowHitTest((unint64_t *)v6, v3, v2) & 1;
}

uint64_t __116___UIComplexBoundingPath__largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect_portraitAspectRatio___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 8);
  unint64_t v2 = v1[4];
  unint64_t v3 = v1[7] + v1[5];
  long long v4 = *(_OWORD *)(a1 + 56);
  v6[0] = *(_OWORD *)(a1 + 40);
  v6[1] = v4;
  v6[2] = *(_OWORD *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 88);
  return _UIBoundingPathBitmapDataRowHitTest((unint64_t *)v6, v2, v3) & 1;
}

uint64_t __116___UIComplexBoundingPath__largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect_portraitAspectRatio___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 8);
  unint64_t v2 = v1[6] + v1[4];
  unint64_t v3 = v1[7] + v1[5];
  long long v4 = *(_OWORD *)(a1 + 56);
  v6[0] = *(_OWORD *)(a1 + 40);
  v6[1] = v4;
  v6[2] = *(_OWORD *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 88);
  return _UIBoundingPathBitmapDataRowHitTest((unint64_t *)v6, v2, v3) & 1;
}

BOOL __116___UIComplexBoundingPath__largestInscribedPortraitPixelRectInBoundingPathWithPortraitPixelRect_portraitAspectRatio___block_invoke_6(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 8);
  long long v20 = *(_OWORD *)(a1 + 40);
  long long v21 = *(_OWORD *)(a1 + 56);
  long long v22 = *(_OWORD *)(a1 + 72);
  uint64_t v23 = *(void *)(a1 + 88);
  unint64_t v2 = v1[4];
  unint64_t v3 = v1[5];
  unint64_t v4 = v1[6] + v2;
  unint64_t v5 = v1[7] + v3;
  int64_t v6 = v2 + 1;
  int64_t v7 = v4 - 1;
  int64_t v8 = v2 + 1;
  while (v8 < v7)
  {
    long long v24 = v20;
    long long v25 = v21;
    long long v26 = v22;
    uint64_t v27 = v23;
    char v9 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v24, v8, v3);
    v8 += v10;
    if ((v9 & 1) == 0) {
      return 0;
    }
  }
  while (v6 < v7)
  {
    long long v24 = v20;
    long long v25 = v21;
    long long v26 = v22;
    uint64_t v27 = v23;
    char v13 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v24, v6, v5);
    v6 += v14;
    if ((v13 & 1) == 0) {
      return 0;
    }
  }
  int64_t v15 = v3 + 1;
  int64_t v16 = v5 - 1;
  int64_t v17 = v15;
  while (v17 < v16)
  {
    long long v24 = v20;
    long long v25 = v21;
    long long v26 = v22;
    uint64_t v27 = v23;
    char v18 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v24, v2, v17++);
    if ((v18 & 1) == 0) {
      return 0;
    }
  }
  do
  {
    BOOL v11 = v15 >= v16;
    if (v15 >= v16) {
      break;
    }
    long long v24 = v20;
    long long v25 = v21;
    long long v26 = v22;
    uint64_t v27 = v23;
    char v19 = _UIBoundingPathBitmapDataRowHitTest((unint64_t *)&v24, v4, v15++);
  }
  while ((v19 & 1) != 0);
  return v11;
}

void __46___UIComplexBoundingPath__imageRepresentation__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  CGContextTranslateCTM((CGContextRef)[v10 CGContext], *(double *)(a1 + 48) * 0.5, *(double *)(a1 + 56) * 0.5);
  CGContextScaleCTM((CGContextRef)[v10 CGContext], 1.0, -1.0);
  unint64_t v3 = (CGContext *)[v10 CGContext];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 24);
  switch(v4)
  {
    case 1:
      double v5 = 0.0;
      break;
    case 3:
      double v5 = 1.57079633;
      break;
    case 4:
      double v5 = -1.57079633;
      break;
    default:
      double v5 = 3.14159265;
      if (v4 != 2) {
        double v5 = 0.0;
      }
      break;
  }
  CGContextRotateCTM(v3, v5);
  int64_t v6 = (CGContext *)[v10 CGContext];
  double v7 = *(double *)(a1 + 64);
  double v8 = *(double *)(a1 + 72);
  char v9 = (CGImage *)[*(id *)(a1 + 40) CGImage];
  v12.origin.x = v7 * -0.5;
  v12.origin.y = v8 * -0.5;
  v12.size.width = v7;
  v12.size.height = v8;
  CGContextDrawImage(v6, v12, v9);
}

@end