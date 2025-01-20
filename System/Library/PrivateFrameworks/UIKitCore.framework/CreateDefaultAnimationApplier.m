@interface CreateDefaultAnimationApplier
@end

@implementation CreateDefaultAnimationApplier

uint64_t ___CreateDefaultAnimationApplier_block_invoke(uint64_t a1, double a2, double a3)
{
  objc_msgSend(*(id *)(a1 + 32), "convertPoint:toView:", objc_msgSend(*(id *)(a1 + 32), "superview"), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  double v7 = v6;
  double v9 = v8;
  memset(&v22, 0, sizeof(v22));
  v10 = *(void **)(a1 + 32);
  if (v10)
  {
    [v10 transform];
    v11 = *(void **)(a1 + 32);
  }
  else
  {
    v11 = 0;
    memset(&v21, 0, sizeof(v21));
  }
  CGAffineTransformRotate(&v22, &v21, a3 - a2);
  CGAffineTransform v20 = v22;
  [v11 setTransform:&v20];
  v12 = *(void **)(a1 + 32);
  objc_msgSend(v12, "convertPoint:toView:", objc_msgSend(v12, "superview"), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  double v14 = v13;
  double v16 = v15;
  [v12 center];
  return objc_msgSend(v12, "setCenter:", v7 - v14 + v17, v9 - v16 + v18);
}

uint64_t ___CreateDefaultAnimationApplier_block_invoke_2(uint64_t a1, double a2, double a3)
{
  objc_msgSend(*(id *)(a1 + 32), "convertPoint:toView:", objc_msgSend(*(id *)(a1 + 32), "superview"), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  double v6 = v5;
  double v8 = v7;
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(*(id *)(a1 + 32), "setBounds:");
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  double v9 = *(void **)(a1 + 32);
  objc_msgSend(v9, "convertPoint:toView:", objc_msgSend(v9, "superview"), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  double v11 = v10;
  double v13 = v12;
  [v9 center];
  double v15 = v6 - v11 + v14;
  double v17 = v8 - v13 + v16;
  return objc_msgSend(v9, "setCenter:", v15, v17);
}

uint64_t ___CreateDefaultAnimationApplier_block_invoke_3(uint64_t a1, double a2, double a3)
{
  objc_msgSend(*(id *)(a1 + 32), "convertPoint:toView:", objc_msgSend(*(id *)(a1 + 32), "superview"), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  double v6 = v5;
  double v8 = v7;
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(*(id *)(a1 + 32), "setBounds:");
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  double v9 = *(void **)(a1 + 32);
  objc_msgSend(v9, "convertPoint:toView:", objc_msgSend(v9, "superview"), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  double v11 = v10;
  double v13 = v12;
  [v9 center];
  double v15 = v6 - v11 + v14;
  double v17 = v8 - v13 + v16;
  return objc_msgSend(v9, "setCenter:", v15, v17);
}

uint64_t ___CreateDefaultAnimationApplier_block_invoke_4(uint64_t a1, double a2, double a3)
{
  objc_msgSend(*(id *)(a1 + 32), "convertPoint:toView:", objc_msgSend(*(id *)(a1 + 32), "superview"), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  double v6 = v5;
  double v8 = v7;
  [*(id *)(a1 + 32) bounds];
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  objc_msgSend(*(id *)(a1 + 32), "setBounds:");
  double v9 = *(void **)(a1 + 32);
  objc_msgSend(v9, "convertPoint:toView:", objc_msgSend(v9, "superview"), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  double v11 = v10;
  double v13 = v12;
  [v9 center];
  double v15 = v6 - v11 + v14;
  double v17 = v8 - v13 + v16;
  return objc_msgSend(v9, "setCenter:", v15, v17);
}

uint64_t ___CreateDefaultAnimationApplier_block_invoke_5(uint64_t a1, double a2, CGFloat a3)
{
  objc_msgSend(*(id *)(a1 + 32), "convertPoint:toView:", objc_msgSend(*(id *)(a1 + 32), "superview"), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  double v6 = v5;
  double v8 = v7;
  memset(&v22, 0, sizeof(v22));
  double v9 = *(void **)(a1 + 32);
  if (v9)
  {
    [v9 transform];
    double v10 = *(void **)(a1 + 32);
  }
  else
  {
    double v10 = 0;
    memset(&v20, 0, sizeof(v20));
  }
  CGAffineTransformScale(&v21, &v20, 1.0 / *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), 1.0);
  CGAffineTransformScale(&v22, &v21, a3, 1.0);
  CGAffineTransform v19 = v22;
  [v10 setTransform:&v19];
  *(CGFloat *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  double v11 = *(void **)(a1 + 32);
  objc_msgSend(v11, "convertPoint:toView:", objc_msgSend(v11, "superview"), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  double v13 = v12;
  double v15 = v14;
  [v11 center];
  return objc_msgSend(v11, "setCenter:", v6 - v13 + v16, v8 - v15 + v17);
}

uint64_t ___CreateDefaultAnimationApplier_block_invoke_6(uint64_t a1, double a2, CGFloat a3)
{
  objc_msgSend(*(id *)(a1 + 32), "convertPoint:toView:", objc_msgSend(*(id *)(a1 + 32), "superview"), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  double v6 = v5;
  double v8 = v7;
  memset(&v22, 0, sizeof(v22));
  double v9 = *(void **)(a1 + 32);
  if (v9)
  {
    [v9 transform];
    double v10 = *(void **)(a1 + 32);
  }
  else
  {
    double v10 = 0;
    memset(&v20, 0, sizeof(v20));
  }
  CGAffineTransformScale(&v21, &v20, 1.0, 1.0 / *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  CGAffineTransformScale(&v22, &v21, 1.0, a3);
  CGAffineTransform v19 = v22;
  [v10 setTransform:&v19];
  *(CGFloat *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  double v11 = *(void **)(a1 + 32);
  objc_msgSend(v11, "convertPoint:toView:", objc_msgSend(v11, "superview"), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  double v13 = v12;
  double v15 = v14;
  [v11 center];
  return objc_msgSend(v11, "setCenter:", v6 - v13 + v16, v8 - v15 + v17);
}

uint64_t ___CreateDefaultAnimationApplier_block_invoke_7(uint64_t a1, double a2, CGFloat a3)
{
  objc_msgSend(*(id *)(a1 + 32), "convertPoint:toView:", objc_msgSend(*(id *)(a1 + 32), "superview"), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  double v6 = v5;
  double v8 = v7;
  memset(&v22, 0, sizeof(v22));
  double v9 = *(void **)(a1 + 32);
  if (v9)
  {
    [v9 transform];
    double v10 = *(void **)(a1 + 32);
  }
  else
  {
    double v10 = 0;
    memset(&v20, 0, sizeof(v20));
  }
  CGAffineTransformScale(&v21, &v20, 1.0 / *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), 1.0 / *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  CGAffineTransformScale(&v22, &v21, a3, a3);
  CGAffineTransform v19 = v22;
  [v10 setTransform:&v19];
  *(CGFloat *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  double v11 = *(void **)(a1 + 32);
  objc_msgSend(v11, "convertPoint:toView:", objc_msgSend(v11, "superview"), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  double v13 = v12;
  double v15 = v14;
  [v11 center];
  return objc_msgSend(v11, "setCenter:", v6 - v13 + v16, v8 - v15 + v17);
}

uint64_t ___CreateDefaultAnimationApplier_block_invoke_8(uint64_t a1, double a2, double a3)
{
  [*(id *)(a1 + 32) bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "layer"), "superlayer");
  uint64_t v15 = [v14 needsLayoutOnGeometryChange];
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", a3 - a2 + v7, v9, v11, v13);
  return [v14 setNeedsLayoutOnGeometryChange:v15];
}

uint64_t ___CreateDefaultAnimationApplier_block_invoke_9(uint64_t a1, double a2, double a3)
{
  [*(id *)(a1 + 32) bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "layer"), "superlayer");
  uint64_t v15 = [v14 needsLayoutOnGeometryChange];
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", v7, a3 - a2 + v9, v11, v13);
  return [v14 setNeedsLayoutOnGeometryChange:v15];
}

uint64_t ___CreateDefaultAnimationApplier_block_invoke_10(uint64_t a1, double a2, double a3)
{
  [*(id *)(a1 + 32) center];
  double v7 = a3 - a2 + v6;
  double v8 = *(void **)(a1 + 32);
  return [v8 setCenter:v7];
}

uint64_t ___CreateDefaultAnimationApplier_block_invoke_11(uint64_t a1)
{
  [*(id *)(a1 + 32) center];
  v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "setCenter:");
}

uint64_t ___CreateDefaultAnimationApplier_block_invoke_12(uint64_t a1, double a2, double a3)
{
  memset(&v12, 0, sizeof(v12));
  double v6 = *(void **)(a1 + 32);
  if (v6)
  {
    [v6 transform];
    double v7 = *(void **)(a1 + 32);
  }
  else
  {
    double v7 = 0;
  }
  CGAffineTransformMakeTranslation(&t2, a3 - a2, 0.0);
  CGAffineTransform v9 = v12;
  CGAffineTransformConcat(&v11, &v9, &t2);
  CGAffineTransform v12 = v11;
  return [v7 setTransform:&v11];
}

uint64_t ___CreateDefaultAnimationApplier_block_invoke_13(uint64_t a1, double a2, double a3)
{
  memset(&v12, 0, sizeof(v12));
  double v6 = *(void **)(a1 + 32);
  if (v6)
  {
    [v6 transform];
    double v7 = *(void **)(a1 + 32);
  }
  else
  {
    double v7 = 0;
  }
  CGAffineTransformMakeTranslation(&t2, 0.0, a3 - a2);
  CGAffineTransform v9 = v12;
  CGAffineTransformConcat(&v11, &v9, &t2);
  CGAffineTransform v12 = v11;
  return [v7 setTransform:&v11];
}

@end