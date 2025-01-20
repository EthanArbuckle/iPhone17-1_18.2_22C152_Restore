@interface SCRCPhotoEvaluatorBlur
+ (id)detect:(id)a3 inRect:(CGRect)a4;
@end

@implementation SCRCPhotoEvaluatorBlur

+ (id)detect:(id)a3 inRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v9 = a3;
  if (detect_inRect__onceToken != -1) {
    dispatch_once(&detect_inRect__onceToken, &__block_literal_global_6);
  }
  v88.origin.double x = x;
  v88.origin.CGFloat y = y;
  v88.size.double width = width;
  v88.size.CGFloat height = height;
  if (CGRectIsEmpty(v88)) {
    goto LABEL_6;
  }
  v89.origin.double x = x;
  v89.origin.CGFloat y = y;
  v89.size.double width = width;
  v89.size.CGFloat height = height;
  if (CGRectIsNull(v89)
    || (v90.origin.x = x, v90.origin.y = y, v90.size.width = width, v90.size.CGFloat height = height, CGRectIsInfinite(v90)))
  {
LABEL_6:
    v10 = [a1 detect:v9];
    goto LABEL_7;
  }
  uint64_t v12 = [v9 width];
  uint64_t v13 = [v9 data];
  uint64_t v14 = [v9 bytesPerPixel];
  uint64_t v15 = [v9 width];
  [v9 height];
  v77[2] = v77;
  uint64_t v16 = v15 - (uint64_t)width;
  if (v16 >= (uint64_t)x) {
    uint64_t v16 = (uint64_t)x;
  }
  if ((uint64_t)x >= 0) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v18 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v25 = (void *)((char *)v77 - v23);
  uint64_t v85 = v15;
  id v78 = v9;
  if (v26 < 1)
  {
    uint64_t v42 = 0;
LABEL_26:
    v77[0] = v42;
    v77[1] = v77;
    double v44 = (double)(v18 / 15 * (v24 / 15)) * 0.25;
    if (v44 < 150.0) {
      double v44 = 150.0;
    }
    uint64_t v45 = (uint64_t)v44;
    uint64_t v46 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
    uint64_t v47 = MEMORY[0x270FA5388](v46);
    v52 = (char *)v77 - v51;
    uint64_t v53 = 0;
    uint64_t v54 = 0;
    uint64_t v55 = 0;
    if ((unint64_t)(v56 + 14) < 0x1D) {
      uint64_t v57 = 1;
    }
    else {
      uint64_t v57 = v49;
    }
    uint64_t v79 = v57;
    uint64_t v80 = v47;
    double v58 = (double)(v57 - 1);
    double v59 = (double)v47;
    double v60 = *(double *)(v48 + 1448);
    uint64_t v81 = v50;
    do
    {
      uint64_t v61 = 0;
      uint64_t v62 = v53 * v79;
      uint64_t v82 = v53;
      do
      {
        if (v45 < 1)
        {
          uint64_t v68 = 0;
        }
        else
        {
          uint64_t v83 = v61;
          uint64_t v84 = v54;
          uint64_t v63 = 0;
          uint64_t v64 = v61 * v80;
          do
          {
            uint64_t v65 = (uint64_t)((double)rand() / v60 * v58 + 1.0);
            uint64_t v66 = (v62 + v65 + (v64 + (uint64_t)((double)rand() / v60 * v59)) * v85) * v14;
            unint64_t v67 = ((21846
                  * (*(unsigned __int8 *)(v13 + v66 + 1)
                   + *(unsigned __int8 *)(v13 + v66)
                   + *(unsigned __int8 *)(v13 + v66 + 2))) >> 16)
                - (unint64_t)((21846
                                    * (*(unsigned __int8 *)(v13 + v66 - v14 + 1)
                                     + *(unsigned __int8 *)(v13 + v66 - v14)
                                     + *(unsigned __int8 *)(v13 + v66 - v14 + 2))) >> 16);
            *(void *)&v52[8 * v63] = v67;
            v55 += v67;
            ++v63;
          }
          while (v45 != v63);
          uint64_t v68 = 0;
          uint64_t v69 = v45;
          v70 = (uint64_t *)v52;
          do
          {
            uint64_t v71 = *v70++;
            uint64_t v68 = (uint64_t)((double)(v71 - v55 / v45) * (double)(v71 - v55 / v45) + (double)v68);
            --v69;
          }
          while (v69);
          uint64_t v50 = v81;
          uint64_t v53 = v82;
          uint64_t v61 = v83;
          uint64_t v54 = v84;
        }
        uint64_t v72 = v68 / v45;
        *(void *)(v50 + 8 * (v53 - v61 + 16 * v61)) = v72;
        v54 += v72;
        ++v61;
      }
      while (v61 != 15);
      ++v53;
    }
    while (v53 != 15);
    id v9 = v78;
    if (v77[0] > 59) {
      goto LABEL_49;
    }
    uint64_t v73 = 0;
    uint64_t v74 = 0;
    do
    {
      if (*(uint64_t *)(v50 + v73) < 100) {
        ++v74;
      }
      v73 += 8;
    }
    while (v73 != 1800);
    double v43 = (double)v74 / 225.0;
    if (v43 <= 0.7 || v43 < 0.0)
    {
LABEL_49:
      uint64_t v75 = 0;
      int v76 = 0;
      do
      {
        if (*(void *)(v50 + v75) < v54 / 225) {
          ++v76;
        }
        v75 += 8;
      }
      while (v75 != 1800);
      double v43 = (double)v76 / 225.0;
    }
    goto LABEL_54;
  }
  uint64_t v83 = v18;
  uint64_t v27 = 0;
  uint64_t v28 = (uint64_t)fmax((double)v12 / 500.0, 1.0);
  double v29 = (double)(v22 - v28);
  uint64_t v84 = v28;
  double v30 = (double)v28;
  double v31 = (double)v21;
  uint64_t v82 = v19;
  if (v19 <= 1) {
    uint64_t v32 = 1;
  }
  else {
    uint64_t v32 = v19;
  }
  uint64_t v33 = v32;
  v34 = (void *)((char *)v77 - v23);
  do
  {
    uint64_t v35 = v20;
    uint64_t v36 = (uint64_t)(v30 + (double)rand() / 2147483650.0 * v29);
    int v37 = rand();
    uint64_t v20 = v35;
    uint64_t v24 = v85;
    uint64_t v38 = v17 + v36 + (v35 + (uint64_t)((double)v37 / 2147483650.0 * v31)) * v85;
    unint64_t v39 = ((21846
          * (*(unsigned __int8 *)(v13 + v38 * v14 + 1)
           + *(unsigned __int8 *)(v13 + v38 * v14)
           + *(unsigned __int8 *)(v13 + v38 * v14 + 2))) >> 16)
        - (unint64_t)((21846
                            * (*(unsigned __int8 *)(v13 + (v38 - v84) * v14 + 1)
                             + *(unsigned __int8 *)(v13 + (v38 - v84) * v14)
                             + *(unsigned __int8 *)(v13 + (v38 - v84) * v14 + 2))) >> 16);
    *v34++ = v39;
    v27 += v39;
    --v33;
  }
  while (v33);
  uint64_t v40 = 0;
  do
  {
    uint64_t v41 = *v25++;
    uint64_t v40 = (uint64_t)((double)(v41 - v27 / v82) * (double)(v41 - v27 / v82) + (double)v40);
    --v32;
  }
  while (v32);
  uint64_t v42 = v40 / v82;
  double v43 = 0.0;
  id v9 = v78;
  uint64_t v18 = v83;
  if (v40 / v82 <= 150) {
    goto LABEL_26;
  }
LABEL_54:
  v10 = [[SCRCPhotoEvaluatorResultBlur alloc] initWithBlurLevel:v43];
LABEL_7:

  return v10;
}

void __40__SCRCPhotoEvaluatorBlur_detect_inRect___block_invoke()
{
  unsigned int Current = CFAbsoluteTimeGetCurrent();
  srand(Current);
}

@end