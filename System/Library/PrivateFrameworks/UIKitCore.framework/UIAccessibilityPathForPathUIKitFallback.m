@interface UIAccessibilityPathForPathUIKitFallback
@end

@implementation UIAccessibilityPathForPathUIKitFallback

void ___UIAccessibilityPathForPathUIKitFallback_block_invoke(uint64_t a1, int a2, double *a3, uint64_t a4)
{
  if (a4)
  {
    uint64_t v7 = a4;
    v8 = a3 + 1;
    do
    {
      *(v8 - 1) = (*(double (**)(double, double))(*(void *)(a1 + 32) + 16))(*(v8 - 1), *v8);
      *(void *)v8 = v9;
      v8 += 2;
      --v7;
    }
    while (v7);
  }
  switch(a2)
  {
    case 0:
      v10 = *(CGPath **)(a1 + 40);
      CGFloat v11 = *a3;
      CGFloat v12 = a3[1];
      CGPathMoveToPoint(v10, 0, v11, v12);
      break;
    case 1:
      v13 = *(CGPath **)(a1 + 40);
      CGFloat v14 = *a3;
      CGFloat v15 = a3[1];
      CGPathAddLineToPoint(v13, 0, v14, v15);
      break;
    case 2:
      v16 = *(CGPath **)(a1 + 40);
      CGFloat v17 = *a3;
      CGFloat v18 = a3[1];
      CGFloat v19 = a3[2];
      CGFloat v20 = a3[3];
      CGPathAddQuadCurveToPoint(v16, 0, v17, v18, v19, v20);
      break;
    case 3:
      v21 = *(CGPath **)(a1 + 40);
      CGFloat v22 = *a3;
      CGFloat v23 = a3[1];
      CGFloat v24 = a3[2];
      CGFloat v25 = a3[3];
      CGFloat v26 = a3[4];
      CGFloat v27 = a3[5];
      CGPathAddCurveToPoint(v21, 0, v22, v23, v24, v25, v26, v27);
      break;
    case 4:
      v28 = *(CGPath **)(a1 + 40);
      CGPathCloseSubpath(v28);
      break;
    default:
      return;
  }
}

@end