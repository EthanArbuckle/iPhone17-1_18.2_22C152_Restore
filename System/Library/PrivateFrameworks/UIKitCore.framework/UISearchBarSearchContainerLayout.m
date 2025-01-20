@interface UISearchBarSearchContainerLayout
@end

@implementation UISearchBarSearchContainerLayout

double __49___UISearchBarSearchContainerLayout_updateLayout__block_invoke(uint64_t a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double v8 = a2;
  double v10 = *(double *)(*(void *)(a1 + 32) + 184);
  if (v10 < CGRectGetWidth(*(CGRect *)&a2))
  {
    double v11 = *(double *)(*(void *)(a1 + 32) + 184);
    double v12 = round(CGRectGetMidX(*(CGRect *)(a1 + 40)) + v11 * -0.5);
    if (*(unsigned char *)(a1 + 72))
    {
      v17.origin.x = v8;
      v17.origin.y = a3;
      v17.size.width = a4;
      v17.size.height = a5;
      double MinX = CGRectGetMinX(v17);
      v18.origin.x = v12;
      v18.origin.y = a3;
      v18.size.width = v11;
      v18.size.height = a5;
      double v14 = fmax(MinX - CGRectGetMinX(v18), 0.0);
    }
    else
    {
      v19.origin.x = v8;
      v19.origin.y = a3;
      v19.size.width = a4;
      v19.size.height = a5;
      double MaxX = CGRectGetMaxX(v19);
      v20.origin.x = v12;
      v20.origin.y = a3;
      v20.size.width = v11;
      v20.size.height = a5;
      double v14 = MaxX - CGRectGetMaxX(v20);
      if (v14 > 0.0) {
        double v14 = 0.0;
      }
    }
    return v12 + v14;
  }
  return v8;
}

uint64_t __48___UISearchBarSearchContainerLayout_applyLayout__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  [*(id *)(a1 + 32) layoutIfNeeded];
  if (*(unsigned char *)(a1 + 80)) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  [*(id *)(a1 + 40) mainContentAlpha];
  double v4 = v2 * v3;
  v5 = *(void **)(a1 + 32);
  return [v5 setAlpha:v4];
}

@end