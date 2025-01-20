@interface NSArray(UIStringDrawingPrivate)
- (double)_legacy_drawComponentsJoinedByString:()UIStringDrawingPrivate atPoint:forWidth:withFont:lineBreakMode:;
@end

@implementation NSArray(UIStringDrawingPrivate)

- (double)_legacy_drawComponentsJoinedByString:()UIStringDrawingPrivate atPoint:forWidth:withFont:lineBreakMode:
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a6 - 6) <= 0xFFFFFFFFFFFFFFFBLL) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"UIStringDrawing.m", 523, @"Only truncation and clipping line breaking is supported for multi-component strings");
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  v14 = (void *)[a1 componentsJoinedByString:a3];
  objc_msgSend(v14, "_legacy_sizeWithFont:", a5);
  if (v15 <= a7)
  {
    if (a4) {
      objc_msgSend(v14, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:", a5, a6, *a4, a4[1], a7);
    }
    double v41 = v15;
  }
  else
  {
    v51 = a4;
    id v55 = v13;
    uint64_t v52 = a6;
    uint64_t v16 = [a1 count];
    v54 = &v51;
    size_t v17 = 8 * v16;
    MEMORY[0x1F4188790](v16);
    v18 = (void **)((char *)&v51 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
    MEMORY[0x1F4188790](v19);
    v21 = (double *)((char *)&v51 - v20);
    unint64_t v53 = v22;
    if (v22)
    {
      bzero((char *)&v51 - v20, v17);
      bzero(v18, v17);
    }
    long long v60 = 0u;
    long long v59 = 0u;
    long long v58 = 0u;
    long long v57 = 0u;
    uint64_t v23 = [a1 countByEnumeratingWithState:&v57 objects:v61 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = 0;
      uint64_t v26 = *(void *)v58;
      v56 = v18;
      do
      {
        uint64_t v27 = 0;
        v28 = &v18[v25];
        do
        {
          if (*(void *)v58 != v26) {
            objc_enumerationMutation(a1);
          }
          v29 = *(void **)(*((void *)&v57 + 1) + 8 * v27);
          if (v25 + v27) {
            v29 = (void *)[a3 stringByAppendingString:v29];
          }
          v28[v27] = v29;
          objc_msgSend(v29, "_legacy_sizeWithFont:", a5);
          v21[v25 + v27++] = v30;
        }
        while (v24 != v27);
        uint64_t v24 = [a1 countByEnumeratingWithState:&v57 objects:v61 count:16];
        v25 += v27;
        v18 = v56;
      }
      while (v24);
    }
    unint64_t v31 = v53;
    if (v53)
    {
      double v32 = a7 / (double)v53;
      double v33 = 0.0;
      v34 = v21;
      unint64_t v35 = v53;
      double v36 = 0.0;
      id v13 = v55;
      do
      {
        double v37 = *v34++;
        double v38 = v37;
        BOOL v39 = v37 > v32;
        if (v37 <= v32) {
          double v40 = -0.0;
        }
        else {
          double v40 = v38;
        }
        double v36 = v36 + v40;
        if (v39) {
          double v38 = -0.0;
        }
        double v33 = v33 + v38;
        --v35;
      }
      while (v35);
      double v41 = *MEMORY[0x1E4F1DB30];
      double v42 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      double v43 = (a7 - v33) / v36;
      uint64_t v44 = v52;
      v45 = v51;
      do
      {
        if (*v21 > v32) {
          double v46 = v43;
        }
        else {
          double v46 = 1.0;
        }
        v47 = *v18;
        if (v45) {
          objc_msgSend(v47, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:", a5, v44, v41 + *v45, v45[1], *v21 * v46);
        }
        else {
          objc_msgSend(v47, "_legacy_sizeWithFont:forWidth:lineBreakMode:", a5, v44, *v21 * v46);
        }
        double v41 = v41 + ceil(v48);
        if (v42 < v49) {
          double v42 = v49;
        }
        ++v18;
        ++v21;
        --v31;
      }
      while (v31);
    }
    else
    {
      double v41 = *MEMORY[0x1E4F1DB30];
      id v13 = v55;
    }
  }

  return v41;
}

@end