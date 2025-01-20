@interface UIImageContentLayout
@end

@implementation UIImageContentLayout

CGFloat __56___UIImageContentLayout_initWithSource_target_withSize___block_invoke@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = MEMORY[0x1E4F1DAB8];
  long long v82 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v84 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)a4 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)(a4 + 16) = v82;
  long long rect = *(_OWORD *)(v7 + 32);
  *(_OWORD *)(a4 + 32) = rect;
  double tx = *(double *)(a1 + 56);
  *(void *)&long long v9 = *(void *)(a1 + 64);
  if (a2)
  {
    if ((a2 & 2) != 0) {
      double v11 = *(double *)(a1 + 64);
    }
    else {
      double v11 = *(double *)(a1 + 56);
    }
    if ((a2 & 2) != 0) {
      double v12 = *(double *)(a1 + 56);
    }
    else {
      double v12 = *(double *)(a1 + 64);
    }
    CGAffineTransformMakeTranslation(&t2, tx * -0.5, *(double *)&v9 * -0.5);
    *(_OWORD *)&t1.a = v84;
    *(_OWORD *)&t1.c = v82;
    *(_OWORD *)&t1.double tx = rect;
    CGAffineTransformConcat((CGAffineTransform *)a4, &t1, &t2);
    memset(&v96, 0, sizeof(v96));
    switch(a2)
    {
      case 1:
        v96.double tx = 0.0;
        v96.tCGFloat y = 0.0;
        CGFloat v13 = -1.0;
        v96.a = -1.0;
        v96.b = 0.0;
        goto LABEL_16;
      case 2:
        v96.double tx = 0.0;
        v96.tCGFloat y = 0.0;
        _Q0 = xmmword_186B93AF0;
        goto LABEL_19;
      case 3:
        v96.double tx = 0.0;
        v96.tCGFloat y = 0.0;
        _Q0 = xmmword_186B93B00;
        goto LABEL_19;
      case 4:
        v96.double tx = 0.0;
        v96.tCGFloat y = 0.0;
        v96.a = -1.0;
        v96.b = 0.0;
        CGFloat v13 = 1.0;
        goto LABEL_16;
      case 5:
        v96.double tx = 0.0;
        v96.tCGFloat y = 0.0;
        v96.a = 1.0;
        v96.b = 0.0;
        CGFloat v13 = -1.0;
LABEL_16:
        v96.c = 0.0;
        v96.d = v13;
        break;
      case 6:
        v96.double tx = 0.0;
        v96.tCGFloat y = 0.0;
        __asm { FMOV            V0.2D, #1.0 }
        goto LABEL_19;
      case 7:
        v96.double tx = 0.0;
        v96.tCGFloat y = 0.0;
        __asm { FMOV            V0.2D, #-1.0 }
LABEL_19:
        *(_OWORD *)&v96.b = _Q0;
        break;
      default:
        *(_OWORD *)&v96.a = v84;
        *(_OWORD *)&v96.c = v82;
        *(_OWORD *)&v96.double tx = rect;
        break;
    }
    long long v19 = *(_OWORD *)(a4 + 16);
    *(_OWORD *)&v95.a = *(_OWORD *)a4;
    *(_OWORD *)&v95.c = v19;
    *(_OWORD *)&v95.double tx = *(_OWORD *)(a4 + 32);
    CGAffineTransformConcat(&t1, &v95, &v96);
    long long v20 = *(_OWORD *)&t1.c;
    *(_OWORD *)a4 = *(_OWORD *)&t1.a;
    *(_OWORD *)(a4 + 16) = v20;
    *(_OWORD *)(a4 + 32) = *(_OWORD *)&t1.tx;
    CGAffineTransformMakeTranslation(&v94, v11 * 0.5, v12 * 0.5);
    long long v21 = *(_OWORD *)(a4 + 16);
    *(_OWORD *)&v95.a = *(_OWORD *)a4;
    *(_OWORD *)&v95.c = v21;
    *(_OWORD *)&v95.double tx = *(_OWORD *)(a4 + 32);
    CGAffineTransformConcat(&t1, &v95, &v94);
    long long v9 = *(_OWORD *)&t1.c;
    *(_OWORD *)a4 = *(_OWORD *)&t1.a;
    *(_OWORD *)(a4 + 16) = v9;
    double tx = t1.tx;
    *(_OWORD *)(a4 + 32) = *(_OWORD *)&t1.tx;
  }
  else
  {
    double v12 = *(double *)(a1 + 64);
    double v11 = *(double *)(a1 + 56);
  }
  objc_msgSend(*(id *)(a1 + 32), "_contentInsets", tx, *(double *)&v9, (void)rect);
  BOOL v25 = v24 == 0.0;
  if (v26 != 0.0) {
    BOOL v25 = 0;
  }
  if (v22 != 0.0) {
    BOOL v25 = 0;
  }
  BOOL v27 = v23 == 0.0 && v25;
  if (!v27)
  {
    [*(id *)(a1 + 32) _contentInsets];
    double v32 = v29;
    if (!a3)
    {
      CGFloat v33 = v29;
      CGFloat v29 = v28;
LABEL_43:
      CGAffineTransformMakeTranslation(&v93, v33, v29);
      long long v35 = *(_OWORD *)(a4 + 16);
      *(_OWORD *)&v95.a = *(_OWORD *)a4;
      *(_OWORD *)&v95.c = v35;
      *(_OWORD *)&v95.double tx = *(_OWORD *)(a4 + 32);
      CGAffineTransformConcat(&t1, &v95, &v93);
      long long v36 = *(_OWORD *)&t1.c;
      *(_OWORD *)a4 = *(_OWORD *)&t1.a;
      *(_OWORD *)(a4 + 16) = v36;
      *(_OWORD *)(a4 + 32) = *(_OWORD *)&t1.tx;
      goto LABEL_44;
    }
    if (a3 <= 7)
    {
      if (((1 << a3) & 0x22) != 0)
      {
        CGFloat v29 = v30;
        CGFloat v33 = v31;
        double v34 = v28;
        double v28 = v32;
        goto LABEL_39;
      }
      if (((1 << a3) & 0x44) != 0)
      {
        CGFloat v29 = v31;
        CGFloat v33 = v28;
        double v34 = v32;
        double v28 = v30;
        goto LABEL_39;
      }
      if (((1 << a3) & 0x88) != 0)
      {
        CGFloat v33 = v30;
        double v34 = v31;
        goto LABEL_39;
      }
    }
    CGFloat v29 = v28;
    CGFloat v33 = v32;
    double v34 = v30;
    double v28 = v31;
LABEL_39:
    if (a3 - 6 < 2)
    {
      CGFloat v29 = v34;
    }
    else if (a3 - 4 <= 1)
    {
      CGFloat v33 = v28;
    }
    goto LABEL_43;
  }
LABEL_44:
  LayerContentModeTransform(*(void *)(a1 + 72), (uint64_t)&v92, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));
  long long v37 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)&v95.a = *(_OWORD *)a4;
  *(_OWORD *)&v95.c = v37;
  *(_OWORD *)&v95.double tx = *(_OWORD *)(a4 + 32);
  CGAffineTransformConcat(&t1, &v95, &v92);
  long long v38 = *(_OWORD *)&t1.c;
  *(_OWORD *)a4 = *(_OWORD *)&t1.a;
  *(_OWORD *)(a4 + 16) = v38;
  *(_OWORD *)(a4 + 32) = *(_OWORD *)&t1.tx;
  uint64_t v39 = *MEMORY[0x1E4F1DAD8];
  uint64_t v40 = *(void *)(MEMORY[0x1E4F1DAD8] + 8);
  long long v41 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)&t1.a = *(_OWORD *)a4;
  *(_OWORD *)&t1.c = v41;
  *(_OWORD *)&t1.double tx = *(_OWORD *)(a4 + 32);
  uint64_t v83 = v39;
  *(void *)&long long v41 = v40;
  double v85 = v11;
  double v42 = v11;
  double v43 = v12;
  CGRect v99 = CGRectApplyAffineTransform(*(CGRect *)&v39, &t1);
  CGFloat x = v99.origin.x;
  CGFloat y = v99.origin.y;
  double width = v99.size.width;
  double height = v99.size.height;
  UIRoundToScale(v99.size.width, *(double *)(*(void *)(a1 + 40) + 64));
  double v49 = v48;
  UIRoundToScale(height, *(double *)(*(void *)(a1 + 40) + 64));
  double v51 = v50;
  if (*(void *)(a1 + 72) <= 3uLL && *(unsigned char *)(a1 + 128))
  {
    uint64_t v52 = *(void *)(*(void *)(a1 + 48) + 8);
    *(double *)(v52 + 32) = v49;
    *(double *)(v52 + 40) = v50;
  }
  if (!v27)
  {
    v100.origin.CGFloat x = x;
    v100.origin.CGFloat y = y;
    v100.size.double width = width;
    v100.size.double height = height;
    double recta = v12;
    CGFloat v53 = -CGRectGetMidX(v100);
    v101.origin.CGFloat x = x;
    v101.origin.CGFloat y = y;
    v101.size.double width = width;
    v101.size.double height = height;
    CGFloat MidY = CGRectGetMidY(v101);
    CGAffineTransformMakeTranslation(&v91, v53, -MidY);
    long long v55 = *(_OWORD *)(a4 + 16);
    *(_OWORD *)&v95.a = *(_OWORD *)a4;
    *(_OWORD *)&v95.c = v55;
    *(_OWORD *)&v95.double tx = *(_OWORD *)(a4 + 32);
    CGAffineTransformConcat(&t1, &v95, &v91);
    long long v56 = *(_OWORD *)&t1.c;
    *(_OWORD *)a4 = *(_OWORD *)&t1.a;
    *(_OWORD *)(a4 + 16) = v56;
    *(_OWORD *)(a4 + 32) = *(_OWORD *)&t1.tx;
    CGAffineTransformMakeScale(&v90, v49 / width, v51 / height);
    long long v57 = *(_OWORD *)(a4 + 16);
    *(_OWORD *)&v95.a = *(_OWORD *)a4;
    *(_OWORD *)&v95.c = v57;
    *(_OWORD *)&v95.double tx = *(_OWORD *)(a4 + 32);
    CGAffineTransformConcat(&t1, &v95, &v90);
    long long v58 = *(_OWORD *)&t1.c;
    *(_OWORD *)a4 = *(_OWORD *)&t1.a;
    *(_OWORD *)(a4 + 16) = v58;
    *(_OWORD *)(a4 + 32) = *(_OWORD *)&t1.tx;
    CGFloat v59 = x;
    *(CGFloat *)&long long v58 = y;
    double v60 = width;
    double v61 = height;
    CGFloat MidX = CGRectGetMidX(*(CGRect *)((char *)&v58 - 8));
    v102.origin.CGFloat x = x;
    v102.origin.CGFloat y = y;
    v102.size.double width = width;
    v102.size.double height = height;
    CGFloat v63 = CGRectGetMidY(v102);
    CGAffineTransformMakeTranslation(&v89, MidX, v63);
    long long v64 = *(_OWORD *)(a4 + 16);
    *(_OWORD *)&v95.a = *(_OWORD *)a4;
    *(_OWORD *)&v95.c = v64;
    *(_OWORD *)&v95.double tx = *(_OWORD *)(a4 + 32);
    CGAffineTransformConcat(&t1, &v95, &v89);
    long long v65 = *(_OWORD *)&t1.c;
    *(_OWORD *)a4 = *(_OWORD *)&t1.a;
    *(_OWORD *)(a4 + 16) = v65;
    *(_OWORD *)(a4 + 32) = *(_OWORD *)&t1.tx;
    long long v66 = *(_OWORD *)(a4 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a4;
    *(_OWORD *)&t1.c = v66;
    *(_OWORD *)&t1.double tx = *(_OWORD *)(a4 + 32);
    uint64_t v67 = v83;
    *(void *)&long long v66 = v40;
    double v68 = v85;
    double v69 = recta;
    CGRect v103 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v66 - 8), &t1);
    double v70 = v103.origin.x;
    double v71 = v103.origin.y;
    UIRoundToScale(v103.origin.x, *(double *)(*(void *)(a1 + 40) + 64));
    double v73 = v72;
    UIRoundToScale(v71, *(double *)(*(void *)(a1 + 40) + 64));
    CGAffineTransformMakeTranslation(&v88, v73 - v70, v74 - v71);
    long long v75 = *(_OWORD *)(a4 + 16);
    *(_OWORD *)&v95.a = *(_OWORD *)a4;
    *(_OWORD *)&v95.c = v75;
    *(_OWORD *)&v95.double tx = *(_OWORD *)(a4 + 32);
    CGAffineTransformConcat(&t1, &v95, &v88);
    long long v76 = *(_OWORD *)&t1.c;
    *(_OWORD *)a4 = *(_OWORD *)&t1.a;
    *(_OWORD *)(a4 + 16) = v76;
    *(_OWORD *)(a4 + 32) = *(_OWORD *)&t1.tx;
  }
  memset(&t1, 0, sizeof(t1));
  LayerContentModeTransform(*(void *)(a1 + 72), (uint64_t)&t1, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 56), *(double *)(a1 + 64));
  CGAffineTransform v95 = t1;
  CGAffineTransformInvert(&v87, &v95);
  long long v77 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)&v86.a = *(_OWORD *)a4;
  *(_OWORD *)&v86.c = v77;
  *(_OWORD *)&v86.double tx = *(_OWORD *)(a4 + 32);
  CGAffineTransformConcat(&v95, &v87, &v86);
  long long v78 = *(_OWORD *)&v95.c;
  *(_OWORD *)a4 = *(_OWORD *)&v95.a;
  *(_OWORD *)(a4 + 16) = v78;
  CGFloat result = v95.tx;
  *(_OWORD *)(a4 + 32) = *(_OWORD *)&v95.tx;
  return result;
}

double __61___UIImageContentLayout__prepareContentOfSize_source_target___block_invoke_2@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  objc_msgSend(*(id *)(a1 + 32), "renditionWithSize:scale:applyingEffect:", *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  id v4 = objc_claimAutoreleasedReturnValue();
  v5 = (CGImage *)-[_UIImageContentRendition CGImage]((uint64_t)v4);
  CGImageRef v6 = CGImageRetain(v5);
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = v6;
  double result = *(double *)(a1 + 72);
  *(double *)(a2 + 16) = result;
  return result;
}

double __61___UIImageContentLayout__prepareContentOfSize_source_target___block_invoke@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  CFTypeRef v4 = CFRetain((CFTypeRef)[*(id *)(a1 + 32) IOSurface]);
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = v4;
  double result = *(double *)(a1 + 40);
  *(double *)(a2 + 16) = result;
  return result;
}

@end