@interface HorizontallySizedImageForEdgeStyle
@end

@implementation HorizontallySizedImageForEdgeStyle

void ___HorizontallySizedImageForEdgeStyle_block_invoke(uint64_t a1, double a2, double a3, uint64_t a4, uint64_t a5, int a6, int a7, int a8, int a9, int a10)
{
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = a2;
  uint64_t v12 = *(void *)(a1 + 40);
  v11 = *(CGContext **)(a1 + 48);
  *(double *)(*(void *)(v12 + 8) + 48) = a3;
  v13 = *(double **)(*(void *)(a1 + 32) + 8);
  v14 = *(CGFloat **)(*(void *)(a1 + 40) + 8);
  CGContextDrawSubimage(v11, *(CGImageRef *)(a1 + 56), a2 != a3, a6, a7, a8, a9, a10, v13[4], v13[5], v13[6], v13[7], v14[4], v14[5], v14[6], v14[7], *(void *)(a1 + 64));
  double MaxX = CGRectGetMaxX(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32));
  double v16 = *(double *)(a1 + 64);
  if (v16 == 0.0) {
    double v16 = PKScreenScale();
  }
  if (v16 == 0.0) {
    double v17 = round(MaxX);
  }
  else {
    double v17 = round(MaxX * v16) / v16;
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = v17;
  double v18 = CGRectGetMaxX(*(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32));
  double v19 = *(double *)(a1 + 64);
  if (v19 == 0.0) {
    double v19 = PKScreenScale();
  }
  if (v19 == 0.0) {
    double v20 = round(v18);
  }
  else {
    double v20 = round(v18 * v19) / v19;
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = v20;
}

@end