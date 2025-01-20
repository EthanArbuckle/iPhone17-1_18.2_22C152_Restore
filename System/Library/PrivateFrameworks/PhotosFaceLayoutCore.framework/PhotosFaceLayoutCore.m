double cropTimeAboveFacesNoMask(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;

  v21 = combineFaceRects(a1);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  if (!rectPlusCushionInsideImage(v21, v22, v24, v26, a8)) {
    return *MEMORY[0x263F001A0];
  }
  v28 = maxRectInImageWithAnchorAtPosition(a10 / a11 / (a2 / a3), a8, 0.5, a5 + a7, v21 + v25 * 0.5, v23);
  if (!rectIsWithinRect(v21, v23, v25, v27, v28, v29, v30, v31)) {
    return *MEMORY[0x263F001A0];
  }
  return v28;
}

double combineFaceRects(void *a1)
{
  id v1 = a1;
  if ([v1 count])
  {
    v2 = [v1 objectAtIndexedSubscript:0];
    [v2 rectValue];
    double x = v3;
    CGFloat y = v5;
    CGFloat width = v7;
    CGFloat height = v9;

    if ((unint64_t)[v1 count] >= 2)
    {
      unint64_t v11 = 1;
      do
      {
        v12 = [v1 objectAtIndexedSubscript:v11];
        [v12 rectValue];
        v20.origin.double x = v13;
        v20.origin.CGFloat y = v14;
        v20.size.CGFloat width = v15;
        v20.size.CGFloat height = v16;
        v18.origin.double x = x;
        v18.origin.CGFloat y = y;
        v18.size.CGFloat width = width;
        v18.size.CGFloat height = height;
        CGRect v19 = CGRectUnion(v18, v20);
        double x = v19.origin.x;
        CGFloat y = v19.origin.y;
        CGFloat width = v19.size.width;
        CGFloat height = v19.size.height;

        ++v11;
      }
      while ([v1 count] > v11);
    }
  }
  else
  {
    double x = *MEMORY[0x263F001A0];
  }

  return x;
}

BOOL rectPlusCushionInsideImage(double a1, double a2, double a3, double a4, double a5)
{
  double v5 = expandRect(a1, a2, a3, a4, a5, a5, a5, a5);

  return rectIsWithinRect(v5, v6, v7, v8, 0.0, 0.0, 1.0, 1.0);
}

double maxRectInImageWithAnchorAtPosition(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6 = (a5 - a2) / a3;
  double v7 = 1.0 - a2;
  if (v6 >= (1.0 - a2 - a5) / (1.0 - a3)) {
    double v6 = (1.0 - a2 - a5) / (1.0 - a3);
  }
  double v8 = v6 / a1;
  double v9 = (a6 - a2) / a4;
  double v10 = (v7 - a6) / (1.0 - a4);
  if (v9 < v10) {
    double v10 = v9;
  }
  if (v10 < v8) {
    double v6 = v6 * (v10 / v8);
  }
  return a5 - a3 * v6;
}

double cropTimeBelowFacesNoMask(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v21 = a1;
  double v22 = combineFaceRects(v21);
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  if (!rectPlusCushionInsideImage(v22, v23, v25, v27, a8)) {
    goto LABEL_14;
  }
  double v43 = a5 * 0.3;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  double v29 = a10 / a11 / (a2 / a3);
  id v30 = v21;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v45;
    double v34 = 1.0;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v45 != v33) {
          objc_enumerationMutation(v30);
        }
        [*(id *)(*((void *)&v44 + 1) + 8 * i) rectValue];
        if (v36 + v37 * 0.3 < v34) {
          double v34 = v36 + v37 * 0.3;
        }
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v32);
  }
  else
  {
    double v34 = 1.0;
  }

  double v38 = maxRectInImageWithAnchorAtPosition(v29, a8, 0.5, v43, v22 + v26 * 0.5, v34);
  if (!rectIsWithinRect(v22, v24, v26, v28, v38, v39, v40, v41)) {
LABEL_14:
  }
    double v38 = *MEMORY[0x263F001A0];

  return v38;
}

double cropTimeAboveFacesWithMask(void *a1, void *a2, uint64_t a3, double a4, double a5, CGFloat a6, CGFloat a7, double a8, CGFloat a9, double a10, double a11, double a12, double a13)
{
  id v23 = a2;
  double v24 = combineFaceRects(a1);
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  if (rectPlusCushionInsideImage(v24, v25, v27, v29, a10))
  {
    double v64 = a8;
    double v31 = a7 + a9;
    double v32 = v24;
    double v33 = v24 + v28 * 0.5;
    double v34 = (v33 + 0.0) / (a10 + 0.5);
    double v35 = (1.0 - v33) / (a10 + 0.5);
    if (v34 >= v35) {
      double v36 = v35;
    }
    else {
      double v36 = v34;
    }
    double v37 = v26;
    if (1.0 / (a10 * 2.0 + 1.0) >= v26 / (v31 + a10)) {
      double v38 = v26 / (v31 + a10);
    }
    else {
      double v38 = 1.0 / (a10 * 2.0 + 1.0);
    }
    double v39 = v36 / (a12 / a13 / (a4 / a5));
    double v40 = a4;
    double v41 = a10;
    CGFloat v63 = a6;
    if (v39 <= v38) {
      double v38 = v39;
    }
    else {
      double v36 = v36 * (v38 / v39);
    }
    double v43 = v37 - v38 * v31;
    double v44 = v32 + (v28 - v36) * 0.5;
    CGSize v45 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
    v71.origin = (CGPoint)*MEMORY[0x263F001A0];
    v71.size = v45;
    double v68 = v32;
    double v69 = v37;
    double v67 = v30;
    if (rectIsWithinRect(v32, v37, v28, v30, v44, v43, v36, v38))
    {
      double v56 = -8.0 / v40 + 1.0;
      double v49 = ((0.200845666 / (v64 * a9) + -1.0) * 0.2 + 1.0) * 0.185;
      double v50 = dbl_25934AE70[a3 == 2];
      double v61 = v49 / 0.18;
      double v60 = v49 / 0.18 * v50;
      double v59 = v49 * 0.04 / 0.82;
      double v57 = v41 + 1.0;
      double v58 = v59 * v50;
      do
      {
        if (v43 <= 1.0 - v38 * v57) {
          double v51 = v43;
        }
        else {
          double v51 = 1.0 - v38 * v57;
        }
        double v52 = iterativeVerticalFacesMaskSolver(v23, 0, v70, v41, v44, v51, v36, v38, v46, v47, v48, v68, v69, v28, v67, v63, a7, v64, a9,
                -8.0 / a5,
                v59,
                v61,
                v58,
                v60);
        double v54 = v53;
        double x = v71.origin.x;
        if (!CGRectIsEmpty(v71)) {
          break;
        }
        double v36 = v56 * v52;
        double v38 = v56 * v54;
        double v43 = v69 - v56 * v54 * (a7 + a9);
        double v44 = v68 + (v28 - v56 * v52) * 0.5;
      }
      while (rectIsWithinRect(v68, v69, v28, v67, v44, v43, v36, v38));
    }
    else
    {
      double x = v71.origin.x;
    }
  }
  else
  {
    double x = *MEMORY[0x263F001A0];
  }

  return x;
}

CGFloat iterativeVerticalFacesMaskSolver(void *a1, uint64_t a2, double *a3, double a4, double a5, double a6, CGFloat a7, CGFloat a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, CGFloat a16, CGFloat a17, CGFloat a18, CGFloat a19, double a20,double a21,double a22,double a23,double a24)
{
  id v33 = a1;
  if (rectPlusCushionInsideImage(a5, a6, a7, a8, a4))
  {
    while (rectIsWithinRect(a12, a13, a14, a15, a5, a6, a7, a8))
    {
      double Coverage = findCoverage(a2, v33, a5, a6, a7, a8, a16, a17, a18, a19);
      if (v35 < a22 && Coverage < a21)
      {
        if (v35 >= a24 && Coverage >= a23)
        {
          a3[12] = a5;
          a3[13] = a6;
          a3[14] = a7;
          a3[15] = a8;
        }
        break;
      }
      a6 = a6 + a20;
      if (!rectPlusCushionInsideImage(a5, a6, a7, a8, a4)) {
        break;
      }
    }
  }

  return a7;
}

double cropTimeBelowFacesWithMask(void *a1, void *a2, double a3, double a4, CGFloat a5, CGFloat a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  id v22 = a2;
  double v23 = combineFaceRects(a1);
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  if (rectPlusCushionInsideImage(v23, v24, v26, v28, a9))
  {
    double v59 = a7;
    double v60 = a8;
    CGFloat v58 = a5;
    double v30 = a4;
    double v31 = v23;
    double v32 = v27;
    double v33 = v23 + v27 * 0.5;
    double v34 = (v33 + 0.0) / (a9 + 0.5);
    double v35 = (1.0 - v33) / (a9 + 0.5);
    if (v34 >= v35) {
      double v36 = v35;
    }
    else {
      double v36 = v34;
    }
    if (1.0 / (a9 * 2.0 + 1.0) >= (v25 + v29) / (a6 - a9)) {
      double v37 = (v25 + v29) / (a6 - a9);
    }
    else {
      double v37 = 1.0 / (a9 * 2.0 + 1.0);
    }
    double v38 = v36 / (a11 / a12 / (a3 / a4));
    double v39 = v29;
    if (v38 <= v37) {
      double v37 = v36 / (a11 / a12 / (a3 / a4));
    }
    else {
      double v36 = v36 * (v37 / v38);
    }
    double v41 = v32;
    double v42 = v31 + (v32 - v36) * 0.5;
    CGSize v43 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
    v67.origin = (CGPoint)*MEMORY[0x263F001A0];
    v67.size = v43;
    double v63 = v39;
    double v65 = v31;
    if (rectIsWithinRect(v31, v25, v32, v39, v42, v25, v36, v37))
    {
      double v54 = 1.0 - 8.0 / a3;
      double v47 = ((0.200845666 / (v59 * v60) + -1.0) * 0.2 + 1.0) * 0.185;
      double v56 = v47 / 0.18;
      double v57 = v47 * 0.04 / 0.82;
      double v55 = v47 / 0.18 * 0.142857143;
      do
      {
        double v48 = 1.0 - v37 * (a9 + 1.0);
        double v49 = v48 - v37;
        if (v25 + v37 >= v48) {
          double v49 = v25;
        }
        double v50 = iterativeVerticalFacesMaskSolver(v22, 1, v66, a9, v42, v49, v36, v37, v44, v45, v46, v65, v25, v41, v63, v58, a6, v59, v60,
                8.0 / v30,
                v57,
                v56,
                v57 * 0.142857143,
                v55);
        double v52 = v51;
        double x = v67.origin.x;
        if (!CGRectIsEmpty(v67)) {
          break;
        }
        double v36 = v54 * v50;
        double v37 = v54 * v52;
        double v42 = v65 + (v41 - v36) * 0.5;
      }
      while (rectIsWithinRect(v65, v25, v41, v63, v42, v25, v36, v37));
    }
    else
    {
      double x = v67.origin.x;
    }
  }
  else
  {
    double x = *MEMORY[0x263F001A0];
  }

  return x;
}

double cropTimeLeftOfFacesWithMask(void *a1, void *a2, uint64_t a3, double a4, double a5, double a6, CGFloat a7, double a8, CGFloat a9, double a10, double a11, CGFloat a12, CGFloat a13, CGFloat a14, CGFloat a15, CGFloat a16, CGFloat a17, CGFloat a18, CGFloat a19, double a20,double a21,double a22)
{
  id v31 = a2;
  double v32 = combineFaceRects(a1);
  double v34 = v33;
  double v36 = v35;
  double v72 = v37;
  if (rectPlusCushionInsideImage(v32, v33, v35, v37, a20))
  {
    double v38 = a6 + a8;
    double v64 = a5;
    double v67 = a4;
    double v39 = a21 / a22 / (a4 / a5);
    double v40 = 1.0 / (a20 * 2.0 + 1.0);
    double v41 = v36 * 1.0001 / (1.0 - (a6 + a8));
    if (v41 >= v40) {
      double v41 = 1.0 / (a20 * 2.0 + 1.0);
    }
    double v42 = v41 / v39;
    double v43 = v39 * v72;
    if (v42 >= v72) {
      double v44 = v42;
    }
    else {
      double v44 = v72;
    }
    double v69 = a6;
    if (v42 >= v72) {
      double v45 = v41;
    }
    else {
      double v45 = v43;
    }
    CGSize v46 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
    v74.origin = (CGPoint)*MEMORY[0x263F001A0];
    v74.size = v46;
    v75.origin = v74.origin;
    v75.size = v46;
    double v70 = v38;
    double v47 = v32 - v45 * v38;
    v76.origin = v74.origin;
    v76.size = v46;
    if (rectIsWithinRect(v32, v34, v36, v72, v47, v34, v45, v44) && v45 <= v40 && v44 <= v40)
    {
      double v68 = -4.0 / v67;
      double v51 = -8.0 / v64;
      double v65 = 8.0 / v64 + 1.0;
      double v66 = v51;
      double v52 = ((0.200845666 / (a8 * a9) + -1.0) * 0.2 + 1.0) * 0.185;
      double v63 = v52 / 0.18;
      double v61 = a20 + 1.0;
      double v62 = v52 * 0.04 / 0.82;
      do
      {
        if (v47 <= 1.0 - v45 * v61) {
          double v53 = v47;
        }
        else {
          double v53 = 1.0 - v45 * v61;
        }
        if (v34 <= 1.0 - v44 * v61) {
          double v54 = v34;
        }
        else {
          double v54 = 1.0 - v44 * v61;
        }
        double v55 = iterativeBidirectionalFacesMaskSolver(v31, 2, a3, 2, &v74.origin.x, a20, v53, v54, v45, v44, v48, v49, v50, v32, v34, v36, v72, v69, a7,
                a8,
                a9,
                a12,
                a13,
                a14,
                a15,
                a16,
                a17,
                a18,
                a19,
                v68,
                v66,
                v62,
                v63);
        double v45 = v65 * v55;
        double v44 = v65 * v56;
        double v47 = v32 - v65 * v55 * v70;
      }
      while (rectIsWithinRect(v32, v34, v36, v72, v47, v34, v65 * v55, v65 * v56) && v45 <= v40 && v44 <= v40);
    }
    double x = v74.origin.x;
    if (CGRectIsEmpty(v74))
    {
      double x = v75.origin.x;
      if (CGRectIsEmpty(v75))
      {
        double x = v76.origin.x;
        CGRectIsEmpty(v76);
      }
    }
  }
  else
  {
    double x = *MEMORY[0x263F001A0];
  }

  return x;
}

double positionCandidateRectForSizeLeft(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double result = a4 - a2 * a8;
  if (a1 == 2) {
    return result + -(a6 - a2 * (1.0 - a8)) * -0.5;
  }
  return result;
}

double iterativeBidirectionalFacesMaskSolver(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, double *a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, double a17, double a18, CGFloat a19, double a20,CGFloat a21,CGFloat a22,CGFloat a23,CGFloat a24,CGFloat a25,CGFloat a26,CGFloat a27,CGFloat a28,CGFloat a29,double a30,double a31,double a32,double a33)
{
  id v42 = a1;
  if (rectPlusCushionInsideImage(a7, a8, a9, a10, a6))
  {
    double v79 = -a16;
    double v78 = -a9;
    double v76 = 1.79769313e308;
    double v72 = 1.79769313e308;
    double v73 = 1.79769313e308;
    double v70 = 1.79769313e308;
    double v77 = 1.79769313e308;
    double v71 = 1.79769313e308;
    double v68 = a6;
    while (1)
    {
      if (!rectIsWithinRect(a14, a15, a16, a17, a7, a8, a9, a10)) {
        goto LABEL_51;
      }
      if (rectPlusCushionInsideImage(a7, a8, a9, a10, a6)) {
        break;
      }
LABEL_50:
      a8 = a8 + a31;
      if (!rectPlusCushionInsideImage(a7, a8, a9, a10, a6)) {
        goto LABEL_51;
      }
    }
    double v43 = (a8 - a15 + -a17 * 0.5) / a10;
    double v74 = vabdd_f64(-0.5, v43);
    double v75 = vabdd_f64(-0.333333333, v43);
    double v44 = a7;
    double v69 = a7;
    while (1)
    {
      if (!rectIsWithinRect(a14, a15, a16, a17, v44, a8, a9, a10)) {
        goto LABEL_50;
      }
      v80.origin.double x = v44;
      v80.origin.CGFloat y = a8;
      v80.size.CGFloat width = a9;
      v80.size.CGFloat height = a10;
      if (CGRectIsNull(v80))
      {
        double v45 = 1.79769313e308;
      }
      else
      {
        if (a2 == 2)
        {
          double v46 = (v44 - a14 + v79 * 0.5) / v78;
          double v47 = (a18 + a20 + 1.0) * 0.5;
          goto LABEL_13;
        }
        double v45 = 0.0;
        if (a2 == 1)
        {
          double v46 = (v44 - a14 + v79 * 0.5) / v78;
          double v47 = a18 * 0.5;
LABEL_13:
          double v45 = vabdd_f64(v46, v47);
        }
      }
      v81.origin.double x = v44;
      v81.origin.CGFloat y = a8;
      v81.size.CGFloat width = a9;
      v81.size.CGFloat height = a10;
      if (CGRectIsNull(v81)) {
        goto LABEL_15;
      }
      if (a3 == 2)
      {
        double v48 = v74;
      }
      else
      {
        double v48 = 0.0;
        if (a3 == 1) {
          double v48 = v75;
        }
      }
      if (v45 >= 0.02) {
        goto LABEL_15;
      }
      if (v48 >= 0.15) {
        goto LABEL_15;
      }
      double Coverage = findCoverage(a4, v42, v44, a8, a9, a10, a18, a19, a20, a21);
      if (v50 < a33 * 0.142857143 || v50 >= a33 || Coverage >= a32 || Coverage < a32 * 0.142857143) {
        goto LABEL_15;
      }
      v82.origin.double x = v44;
      v82.origin.CGFloat y = a8;
      v82.size.CGFloat width = a9;
      v82.size.CGFloat height = a10;
      v84.origin.double x = a22;
      v84.origin.CGFloat y = a23;
      v84.size.CGFloat width = a24;
      v84.size.CGFloat height = a25;
      double v51 = v45 * 0.98;
      if (CGRectContainsRect(v82, v84))
      {
        if (v48 * 0.99 < v77 && v51 <= v76)
        {
          double v53 = a5 + 5;
          double v52 = a5 + 4;
          double v54 = a5;
          double v56 = a5 + 2;
          double v55 = a5 + 1;
          double v57 = a5 + 3;
          double v58 = v71;
          double v59 = v72;
          double v60 = v70;
          double v61 = v73;
          double v62 = v45;
          double v63 = v48;
          goto LABEL_41;
        }
        if (v45 * 0.99 >= v76) {
          goto LABEL_49;
        }
        double v53 = a5 + 5;
        double v52 = a5 + 4;
        double v54 = a5;
        double v56 = a5 + 2;
        double v55 = a5 + 1;
        BOOL v66 = v48 * 0.98 > v77;
        double v57 = a5 + 3;
        double v58 = v71;
        double v59 = v72;
        double v60 = v70;
        double v61 = v73;
        double v62 = v45;
        double v63 = v48;
      }
      else
      {
        v83.origin.double x = v44;
        v83.origin.CGFloat y = a8;
        v83.size.CGFloat width = a9;
        v83.size.CGFloat height = a10;
        v85.origin.double x = a26;
        v85.origin.CGFloat y = a27;
        v85.size.CGFloat width = a28;
        v85.size.CGFloat height = a29;
        BOOL v64 = CGRectContainsRect(v83, v85);
        double v65 = v48 * 0.99;
        if (v64)
        {
          if (v65 < v73 && v51 <= v70)
          {
            double v53 = a5 + 11;
            double v52 = a5 + 10;
            double v55 = a5 + 7;
            double v54 = a5 + 6;
            double v57 = a5 + 9;
            double v56 = a5 + 8;
            double v58 = v71;
            double v59 = v72;
            double v60 = v45;
            double v61 = v48;
            goto LABEL_40;
          }
          if (v45 * 0.99 >= v70) {
            goto LABEL_49;
          }
          double v53 = a5 + 11;
          double v52 = a5 + 10;
          double v55 = a5 + 7;
          double v54 = a5 + 6;
          BOOL v66 = v48 * 0.98 > v73;
          double v57 = a5 + 9;
          double v56 = a5 + 8;
          double v58 = v71;
          double v59 = v72;
          double v60 = v45;
          double v61 = v48;
        }
        else
        {
          if (v65 < v72 && v51 <= v71)
          {
            double v53 = a5 + 17;
            double v52 = a5 + 16;
            double v55 = a5 + 13;
            double v54 = a5 + 12;
            double v57 = a5 + 15;
            double v56 = a5 + 14;
            double v58 = v45;
            double v59 = v48;
            double v60 = v70;
            double v61 = v73;
LABEL_40:
            double v62 = v76;
            double v63 = v77;
LABEL_41:
            a7 = v69;
            a6 = v68;
LABEL_48:
            *double v52 = v45;
            *double v53 = v48;
            *double v54 = v44;
            double v71 = v58;
            double v72 = v59;
            *double v55 = a8;
            double v70 = v60;
            *double v56 = a9;
            double v73 = v61;
            double v76 = v62;
            double v77 = v63;
            *double v57 = a10;
            goto LABEL_15;
          }
          if (v45 * 0.99 >= v71)
          {
LABEL_49:
            a7 = v69;
            a6 = v68;
            goto LABEL_15;
          }
          double v53 = a5 + 17;
          double v52 = a5 + 16;
          double v55 = a5 + 13;
          double v54 = a5 + 12;
          double v61 = v73;
          BOOL v66 = v48 * 0.98 > v72;
          double v57 = a5 + 15;
          double v56 = a5 + 14;
          double v58 = v45;
          double v59 = v48;
          double v60 = v70;
        }
        double v62 = v76;
        double v63 = v77;
      }
      a7 = v69;
      a6 = v68;
      if (!v66) {
        goto LABEL_48;
      }
LABEL_15:
      double v44 = v44 + a30;
      if (!rectPlusCushionInsideImage(v44, a8, a9, a10, a6)) {
        goto LABEL_50;
      }
    }
  }
LABEL_51:

  return a9;
}

double cropTimeRightOfFacesWithMask(void *a1, void *a2, uint64_t a3, double a4, double a5, double a6, CGFloat a7, double a8, CGFloat a9, double a10, double a11, CGFloat a12, CGFloat a13, CGFloat a14, CGFloat a15, CGFloat a16, CGFloat a17, CGFloat a18, CGFloat a19, double a20,double a21,double a22)
{
  id v31 = a2;
  double v32 = combineFaceRects(a1);
  double v34 = v33;
  double v36 = v35;
  double v74 = v37;
  if (rectPlusCushionInsideImage(v32, v33, v37, v35, a20))
  {
    double v66 = a5;
    double v69 = a4;
    double v38 = a21 / a22 / (a4 / a5);
    double v39 = 1.0 / (a20 * 2.0 + 1.0);
    double v40 = v74 * 1.0001 / (1.0 - a6);
    if (v40 >= v39) {
      double v40 = 1.0 / (a20 * 2.0 + 1.0);
    }
    double v41 = v40 / v38;
    double v42 = v38 * v36;
    if (v41 >= v36) {
      double v43 = v40;
    }
    else {
      double v43 = v42;
    }
    CGSize v44 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
    v75.origin = (CGPoint)*MEMORY[0x263F001A0];
    v75.size = v44;
    v76.origin = v75.origin;
    v76.size = v44;
    if (v41 >= v36) {
      double v45 = v41;
    }
    else {
      double v45 = v36;
    }
    v77.origin = v75.origin;
    v77.size = v44;
    if (rectIsWithinRect(v32, v34, v74, v36, v32, v34, v43, v45) && v43 <= v39 && v45 <= v39)
    {
      double v48 = a6;
      double v49 = v32;
      double v70 = -4.0 / v69;
      double v50 = -8.0 / v66;
      double v67 = 8.0 / v66 + 1.0;
      double v68 = v50;
      double v51 = ((0.200845666 / (a8 * a9) + -1.0) * 0.2 + 1.0) * 0.185;
      double v65 = v51 / 0.18;
      double v63 = a20 + 1.0;
      double v64 = v51 * 0.04 / 0.82;
      double v71 = 1.0 / (a20 * 2.0 + 1.0);
      do
      {
        double v52 = 1.0 - v43 * v63;
        if (v49 + v43 >= v52) {
          double v53 = v49;
        }
        else {
          double v53 = v52 - v43;
        }
        if (v34 <= 1.0 - v45 * v63) {
          double v54 = v34;
        }
        else {
          double v54 = 1.0 - v45 * v63;
        }
        double v55 = v48;
        double v56 = iterativeBidirectionalFacesMaskSolver(v31, 1, a3, 3, &v75.origin.x, a20, v53, v54, v43, v45, v63, v46, v47, v49, v34, v74, v36, v48, a7,
                a8,
                a9,
                a12,
                a13,
                a14,
                a15,
                a16,
                a17,
                a18,
                a19,
                v70,
                v68,
                v64,
                v65);
        double v43 = v67 * v56;
        double v45 = v67 * v57;
        BOOL IsWithinRect = rectIsWithinRect(v49, v34, v74, v36, v49, v34, v67 * v56, v67 * v57);
        double v48 = v55;
      }
      while (IsWithinRect && v43 <= v71 && v45 <= v71);
    }
    double x = v75.origin.x;
    if (CGRectIsEmpty(v75))
    {
      double x = v76.origin.x;
      if (CGRectIsEmpty(v76))
      {
        double x = v77.origin.x;
        CGRectIsEmpty(v77);
      }
    }
  }
  else
  {
    double x = *MEMORY[0x263F001A0];
  }

  return x;
}

BOOL cropTimeLeftFacesNoMask(void *a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,double a25,double a26,double a27)
{
  double v28 = a25;
  v102[8] = *MEMORY[0x263EF8340];
  double v29 = combineFaceRects(a1);
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  BOOL result = rectPlusCushionInsideImage(v29, v30, v32, v34, a25);
  if (result)
  {
    double v93 = a4;
    double v37 = a26 / a27 / (a3 / a4);
    double v38 = a5 + a7;
    double v39 = 1.0 - (a5 + a7);
    double v40 = v33 * 1.0001 / v39;
    double v100 = 1.0 / (a25 * 2.0 + 1.0);
    if (v40 >= v100) {
      double v40 = 1.0 / (a25 * 2.0 + 1.0);
    }
    double v41 = v40 / v37;
    double v97 = a26 / a27 / (a3 / a4);
    double v42 = v37 * v35;
    if (v41 < v35)
    {
      double v41 = v35;
      double v40 = v42;
    }
    double v87 = v39;
    double v88 = v40;
    double v89 = v41;
    double v91 = v38;
    double v43 = positionCandidateRectForSizeLeft(2, v40, v41, v29, v31, v33, v35, v38);
    double v45 = v44;
    double v47 = v46;
    double v49 = v48;
    double v92 = v33;
    double v90 = v43;
    BOOL IsWithinRect = rectIsWithinRect(v29, v31, v33, v35, v43, v44, v46, v48);
    double v51 = v31;
    double v101 = v29;
    double v98 = v35;
    if (IsWithinRect && rectIsWithinRect(v90, v45, v47, v49, a25, a25, v100, v100))
    {
      CGFloat rect1 = v49;
      CGFloat v85 = v47;
      CGFloat v86 = v45;
      uint64_t v52 = 0;
      v102[0] = a17;
      v102[1] = a18;
      v102[2] = a19;
      v102[3] = a20;
      v102[4] = a21;
      v102[5] = a22;
      double v94 = 8.0 / v93 + 1.0;
      v102[6] = a23;
      v102[7] = a24;
      char v53 = 1;
      while (1)
      {
        char v54 = v53;
        double v55 = (double *)&v102[4 * v52];
        CGFloat v56 = *v55;
        CGFloat v57 = v55[1];
        double v59 = v55[2];
        double v58 = v55[3];
        v103.origin.double x = *v55;
        v103.origin.CGFloat y = v57;
        v103.size.CGFloat width = v59;
        v103.size.CGFloat height = v58;
        if (!CGRectIsNull(v103))
        {
          v104.origin.double x = v90;
          v104.size.CGFloat width = v85;
          v104.origin.CGFloat y = v86;
          v104.size.CGFloat height = rect1;
          v107.origin.double x = v56;
          v107.origin.CGFloat y = v57;
          v107.size.CGFloat width = v59;
          v107.size.CGFloat height = v58;
          BOOL result = CGRectContainsRect(v104, v107);
          if (result) {
            return result;
          }
          double v60 = v88;
          double v61 = v89;
          BOOL v62 = v88 < v59 || v89 < v58;
          double v63 = v101;
          if (v62)
          {
            double v60 = v88;
            double v61 = v89;
            if (v88 < v59) {
              double v60 = v59;
            }
            if (v89 < v58) {
              double v61 = v58;
            }
            if (v60 / v61 >= v97) {
              double v61 = v60 / v97;
            }
            else {
              double v60 = v97 * v61;
            }
          }
          double v64 = v92;
          double v65 = positionCandidateRectForSizeLeft(2, v60, v61, v101, v31, v92, v98, v91);
          double v67 = v66;
          double v69 = v68;
          double v71 = v70;
          v105.origin.double x = a25;
          v105.origin.CGFloat y = a25;
          v105.size.CGFloat width = 1.0 / (a25 * 2.0 + 1.0);
          v105.size.CGFloat height = v105.size.width;
          v108.origin.double x = v65;
          v108.origin.CGFloat y = v67;
          v108.size.CGFloat width = v69;
          v108.size.CGFloat height = v71;
          if (CGRectContainsRect(v105, v108)) {
            break;
          }
        }
LABEL_27:
        char v53 = 0;
        uint64_t v52 = 1;
        if ((v54 & 1) == 0)
        {
          double v29 = v101;
          double v51 = v31;
          double v35 = v98;
          double v28 = a25;
          goto LABEL_29;
        }
      }
      while (1)
      {
        if (rectIsWithinRect(v63, v31, v64, v98, v65, v67, v69, v71))
        {
          BOOL result = rectIsWithinRect(v65, v67, v69, v71, a25, a25, v100, v100);
          if (result) {
            break;
          }
        }
        double v64 = v92;
        double v63 = v101;
        double v65 = positionCandidateRectForSizeLeft(2, v94 * v69, v94 * v71, v101, v31, v92, v98, v91);
        double v67 = v72;
        double v69 = v73;
        double v71 = v74;
        v106.origin.double x = a25;
        v106.origin.CGFloat y = a25;
        v106.size.CGFloat width = 1.0 / (a25 * 2.0 + 1.0);
        v106.size.CGFloat height = v106.size.width;
        v109.origin.double x = v65;
        v109.origin.CGFloat y = v67;
        v109.size.CGFloat width = v69;
        v109.size.CGFloat height = v71;
        if (!CGRectContainsRect(v106, v109)) {
          goto LABEL_27;
        }
      }
    }
    else
    {
LABEL_29:
      uint64_t v75 = 0;
      double v95 = v51 + v35 * 0.5;
      double v96 = v29 + v92 * 0.5;
      do
      {
        if (a2 == 1) {
          CGRect v76 = (char *)&cropTimeRightFacesNoMask_thirdsChoices;
        }
        else {
          CGRect v76 = (char *)&cropTimeRightFacesNoMask_centerChoices;
        }
        double v77 = maxRectInImageWithAnchorAtPosition(v97, v28, v91 + v87 * 0.5, *(double *)&v76[v75], v96, v95);
        double v79 = v78;
        double v81 = v80;
        double v83 = v82;
        BOOL result = rectIsWithinRect(v101, v51, v92, v98, v77, v78, v80, v82);
        if (result)
        {
          BOOL result = rectIsWithinRect(v77, v79, v81, v83, v28, v28, v100, v100);
          if (result) {
            break;
          }
        }
        v75 += 8;
      }
      while (v75 != 56);
    }
  }
  return result;
}

BOOL cropTimeRightFacesNoMask(void *a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,double a25,double a26,double a27)
{
  v81[8] = *MEMORY[0x263EF8340];
  double v26 = combineFaceRects(a1);
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  BOOL result = rectPlusCushionInsideImage(v26, v27, v29, v31, a25);
  if (!result) {
    return result;
  }
  double v74 = a4;
  double v34 = a26 / a27 / (a3 / a4);
  double v70 = a5;
  double v35 = v30 * 1.0001 / (1.0 - a5);
  double rect1 = 1.0 / (a25 * 2.0 + 1.0);
  if (v35 >= rect1) {
    double v35 = 1.0 / (a25 * 2.0 + 1.0);
  }
  double v36 = v35 / v34;
  double v73 = a26 / a27 / (a3 / a4);
  double v37 = v34 * v32;
  if (v36 >= v32) {
    double v38 = v36;
  }
  else {
    double v38 = v32;
  }
  if (v36 >= v32) {
    double v37 = v35;
  }
  if (a2 == 2)
  {
    double v40 = -0.5;
  }
  else
  {
    double v39 = v28;
    if (a2 != 1) {
      goto LABEL_14;
    }
    double v40 = -0.333333333;
  }
  double v39 = v28 + v38 * v40 + v32 * 0.5;
LABEL_14:
  double v41 = v26 + -(v30 - v37 * v70) * -0.5;
  double v69 = v37;
  double v78 = v30;
  double v79 = v26;
  double v80 = v32;
  if (!rectIsWithinRect(v26, v28, v30, v32, v41, v39, v37, v38)
    || !rectIsWithinRect(v41, v39, v69, v38, a25, a25, rect1, rect1))
  {
    goto LABEL_49;
  }
  CGFloat v68 = v39;
  double v72 = v28;
  uint64_t v42 = 0;
  double v71 = -v30;
  v81[0] = a17;
  v81[1] = a18;
  v81[2] = a19;
  v81[3] = a20;
  double v75 = 8.0 / v74 + 1.0;
  v81[4] = a21;
  v81[5] = a22;
  v81[6] = a23;
  v81[7] = a24;
  char v43 = 1;
  do
  {
    char v44 = v43;
    double v45 = (double *)&v81[4 * v42];
    CGFloat v46 = *v45;
    CGFloat v47 = v45[1];
    double v49 = v45[2];
    double v48 = v45[3];
    v82.origin.double x = *v45;
    v82.origin.CGFloat y = v47;
    v82.size.CGFloat width = v49;
    v82.size.CGFloat height = v48;
    if (CGRectIsNull(v82)) {
      goto LABEL_47;
    }
    v83.origin.double x = v41;
    v83.origin.CGFloat y = v68;
    v83.size.CGFloat width = v69;
    v83.size.CGFloat height = v38;
    v86.origin.double x = v46;
    v86.origin.CGFloat y = v47;
    v86.size.CGFloat width = v49;
    v86.size.CGFloat height = v48;
    BOOL result = CGRectContainsRect(v83, v86);
    if (result) {
      return result;
    }
    BOOL v50 = v69 < v49 || v38 < v48;
    double v51 = v38;
    double v52 = v69;
    if (v50)
    {
      if (v69 >= v49) {
        double v52 = v69;
      }
      else {
        double v52 = v49;
      }
      if (v38 >= v48) {
        double v51 = v38;
      }
      else {
        double v51 = v48;
      }
      if (v52 / v51 >= v73) {
        double v51 = v52 / v73;
      }
      else {
        double v52 = v73 * v51;
      }
    }
    if (a2 == 2)
    {
      double v54 = -0.5;
    }
    else
    {
      double v53 = v72;
      if (a2 != 1) {
        goto LABEL_38;
      }
      double v54 = -0.333333333;
    }
    double v53 = v72 + v51 * v54 + v80 * 0.5;
LABEL_38:
    double v55 = v79;
    double v56 = v79 + (v71 + v52 * v70) * -0.5;
    v84.origin.double x = a25;
    v84.origin.CGFloat y = a25;
    v84.size.CGFloat width = 1.0 / (a25 * 2.0 + 1.0);
    v84.size.CGFloat height = v84.size.width;
    v87.origin.double x = v56;
    v87.origin.CGFloat y = v53;
    v87.size.CGFloat width = v52;
    v87.size.CGFloat height = v51;
    if (CGRectContainsRect(v84, v87))
    {
      while (1)
      {
        if (rectIsWithinRect(v55, v72, v78, v80, v56, v53, v52, v51))
        {
          BOOL result = rectIsWithinRect(v56, v53, v52, v51, a25, a25, rect1, rect1);
          if (result) {
            return result;
          }
        }
        double v51 = v75 * v51;
        if (a2 == 2) {
          break;
        }
        double v53 = v72;
        if (a2 == 1)
        {
          double v57 = -0.333333333;
LABEL_45:
          double v53 = v72 + v51 * v57 + v80 * 0.5;
        }
        v85.size.CGFloat width = 1.0 / (a25 * 2.0 + 1.0);
        double v52 = v75 * v52;
        double v55 = v79;
        double v56 = v79 + (v71 + v52 * v70) * -0.5;
        v85.origin.double x = a25;
        v85.origin.CGFloat y = a25;
        v85.size.CGFloat height = v85.size.width;
        v88.origin.double x = v56;
        v88.origin.CGFloat y = v53;
        v88.size.CGFloat width = v52;
        v88.size.CGFloat height = v51;
        if (!CGRectContainsRect(v85, v88)) {
          goto LABEL_47;
        }
      }
      double v57 = -0.5;
      goto LABEL_45;
    }
LABEL_47:
    char v43 = 0;
    uint64_t v42 = 1;
  }
  while ((v44 & 1) != 0);
  double v30 = v78;
  double v26 = v79;
  double v28 = v72;
  double v32 = v80;
LABEL_49:
  uint64_t v58 = 0;
  double v76 = v26 + v30 * 0.5;
  double v59 = v28 + v32 * 0.5;
  do
  {
    if (a2 == 1) {
      double v60 = (char *)&cropTimeRightFacesNoMask_thirdsChoices;
    }
    else {
      double v60 = (char *)&cropTimeRightFacesNoMask_centerChoices;
    }
    double v61 = maxRectInImageWithAnchorAtPosition(v73, a25, v70 * 0.5, *(double *)&v60[v58], v76, v59);
    double v63 = v62;
    double v65 = v64;
    double v67 = v66;
    BOOL result = rectIsWithinRect(v79, v28, v78, v80, v61, v62, v64, v66);
    if (result)
    {
      BOOL result = rectIsWithinRect(v61, v63, v65, v67, a25, a25, rect1, rect1);
      if (result) {
        break;
      }
    }
    v58 += 8;
  }
  while (v58 != 56);
  return result;
}

double findCoverage(uint64_t a1, void *a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10)
{
  id v19 = a2;
  double v20 = renormalizeRect(a7, a8, a9, a10, a3, a4, a5, a6);
  double v24 = v20;
  double v25 = v21;
  switch(a1)
  {
    case 0:
      double v26 = v23 * 0.82;
      double v21 = v21 + v23 * 0.82;
      goto LABEL_5;
    case 1:
      double v26 = v23 * 0.82;
      double v25 = v21 + v23 * 0.18;
LABEL_5:
      double v27 = v22;
      goto LABEL_9;
    case 2:
      double v27 = v22 * 0.82;
      double v20 = v20 + v22 * 0.82;
      goto LABEL_8;
    case 3:
      double v27 = v22 * 0.82;
      double v24 = v20 + v22 * 0.18;
      goto LABEL_8;
    default:
      double v27 = v22;
LABEL_8:
      double v26 = v23;
LABEL_9:
      objc_msgSend(v19, "coverageOfTimeLabel:", v20, v21);
      objc_msgSend(v19, "coverageOfTimeLabel:", v24, v25, v27, v26);
      double v29 = v28;

      return v29;
  }
}

PFLCCurationScore *PFLCCurationScoreForAsset(void *a1, uint64_t a2)
{
  uint64_t v126 = *MEMORY[0x263EF8340];
  id v2 = a1;
  id v3 = objc_alloc_init(MEMORY[0x263F14E18]);
  [v3 setIncludedDetectionTypes:&unk_27072FFC8];
  v112 = v3;
  v4 = [MEMORY[0x263F14DF0] fetchFacesInAsset:v2 options:v3];
  v117 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v120 objects:buf count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v121;
    obuint64_t j = v5;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v121 != v8) {
          objc_enumerationMutation(obj);
        }
        double v10 = *(void **)(*((void *)&v120 + 1) + 8 * i);
        [v10 size];
        double v12 = v11;
        unint64_t v13 = [v2 pixelWidth];
        unint64_t v14 = [v2 pixelHeight];
        if (v13 <= v14) {
          unint64_t v15 = v14;
        }
        else {
          unint64_t v15 = v13;
        }
        double v16 = v12 * (double)v15;
        [v10 centerX];
        double v18 = fmax(v16 * -0.5 + v17 * (double)(unint64_t)[v2 pixelWidth], 0.0);
        [v10 centerY];
        double v20 = fmax(v16 * -0.5 + v19 * (double)(unint64_t)[v2 pixelHeight], 0.0);
        unint64_t v21 = [v2 pixelWidth];
        if (v16 >= (double)v21 - v18) {
          double v22 = (double)v21 - v18;
        }
        else {
          double v22 = v16;
        }
        unint64_t v23 = [v2 pixelHeight];
        if (v16 >= (double)v23 - v20) {
          double v16 = (double)v23 - v20;
        }
        CGAffineTransformMakeScale(&v119, (float)(1.0 / (float)(unint64_t)[v2 pixelWidth]), (float)(1.0 / (float)(unint64_t)objc_msgSend(v2, "pixelHeight")));
        v128.origin.double x = v18;
        v128.origin.double y = v20;
        v128.size.double width = v22;
        v128.size.double height = v16;
        CGRect v129 = CGRectApplyAffineTransform(v128, &v119);
        v125.b = 0.0;
        v125.c = 0.0;
        *(_OWORD *)&v125.d = xmmword_25934AEF0;
        v125.a = 1.0;
        v125.tdouble y = 1.0;
        CGRect v130 = CGRectApplyAffineTransform(v129, &v125);
        double x = v130.origin.x;
        double y = v130.origin.y;
        double width = v130.size.width;
        double height = v130.size.height;
        double v28 = pflc_layout_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          double v29 = _rectAsString(x, y, width, height);
          int v30 = [v10 detectionType];
          LODWORD(v125.a) = 136315650;
          *(void *)((char *)&v125.a + 4) = "NSArray<NSValue *> * _Nullable faceRectsForAsset(PHAsset *__strong)";
          WORD2(v125.b) = 2112;
          *(void *)((char *)&v125.b + 6) = v29;
          HIWORD(v125.c) = 2048;
          *(void *)&v125.d = v30;
          _os_log_impl(&dword_259343000, v28, OS_LOG_TYPE_DEFAULT, "%s: face at %@, detectionType == %ld", (uint8_t *)&v125, 0x20u);
        }
        double v31 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", x, y, width, height);
        [v117 addObject:v31];
      }
      id v5 = obj;
      uint64_t v7 = [obj countByEnumeratingWithState:&v120 objects:buf count:16];
    }
    while (v7);
  }

  double v32 = v117;
  if (![v117 count])
  {
    double v33 = pflc_layout_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      double v34 = [v2 localIdentifier];
      LODWORD(v125.a) = 136315394;
      *(void *)((char *)&v125.a + 4) = "NSArray<NSValue *> * _Nullable faceRectsForAsset(PHAsset *__strong)";
      WORD2(v125.b) = 2112;
      *(void *)((char *)&v125.b + 6) = v34;
      _os_log_impl(&dword_259343000, v33, OS_LOG_TYPE_DEFAULT, "%s: No PHFace data in asset %@", (uint8_t *)&v125, 0x16u);
    }
  }

  double v35 = (double)(unint64_t)[v2 pixelWidth];
  double v36 = (double)(unint64_t)[v2 pixelHeight];
  [v2 preferredCropRect];
  double v107 = v38;
  double v108 = v37;
  CGFloat v105 = v40;
  CGFloat v106 = v39;
  [v2 acceptableCropRect];
  uint64_t v103 = v42;
  uint64_t v104 = v41;
  uint64_t v101 = v44;
  uint64_t v102 = v43;
  v113 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v98 = 0;
  if (v117) {
    BOOL v45 = a2 == 0;
  }
  else {
    BOOL v45 = 0;
  }
  if (v45) {
    uint64_t v46 = 1;
  }
  else {
    uint64_t v46 = a2;
  }
  double v47 = *MEMORY[0x263F5DE98] * 0.5;
  double v99 = *(double *)(MEMORY[0x263F5DEA0] + 8);
  double v100 = *MEMORY[0x263F5DEA0];
  double v48 = *MEMORY[0x263F5DEA0] / v99;
  double v49 = v35 * v47 + 0.0;
  double v50 = v36 * v47 + 0.0;
  double v51 = v47 * -2.0 + 1.0;
  double v52 = v51 * v35;
  double v53 = v51 * v36;
  double v54 = v48 * v53;
  if (v48 * v53 >= v52) {
    double v54 = v52;
  }
  CGFloat v97 = v54;
  double v55 = v49 + fmax((v52 - v54) * 0.5, 0.0);
  double v56 = v52 / v48;
  if (v56 >= v53) {
    double v56 = v53;
  }
  CGFloat v95 = v56;
  CGFloat v96 = v55;
  double v109 = v36;
  double v111 = v35;
  double v93 = 1.0 / v35;
  double v94 = v50 + fmax((v53 - v56) * 0.5, 0.0);
  double v92 = 1.0 / v36;
  double v114 = -1.0;
  for (uint64_t j = 1; j != 9; ++j)
  {
    PFCRectForTimePosition();
    double v59 = v58;
    CGFloat v61 = v60;
    CGFloat v63 = v62;
    double v65 = v64;
    PFLCCalculateLayout(0, 1, v46, v32, 0, j, v111, v109, v108, v107, v106, v105, v66, v67, v68, v69, v104, v103, v102,
      v101,
      v100,
      v99,
      v58,
      v60,
      v62,
    double v70 = v64);
    [v70 visibleRect];
    double obja = v65;
    if (CGRectIsEmpty(v131))
    {
      CGAffineTransformMakeScale(&v118, v93, v92);
      v132.origin.double x = v96;
      v132.size.double width = v97;
      v132.origin.double y = v94;
      v132.size.double height = v95;
      CGRect v133 = CGRectApplyAffineTransform(v132, &v118);
      double v71 = v133.origin.x;
      double v72 = v133.origin.y;
      double v73 = v133.size.width;
      double v74 = v133.size.height;
      double v75 = pflc_layout_log();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        double v76 = _rectAsString(v71, v72, v73, v74);
        LODWORD(buf[0].a) = 138412290;
        *(void *)((char *)&buf[0].a + 4) = v76;
        _os_log_impl(&dword_259343000, v75, OS_LOG_TYPE_DEFAULT, "PFLCCurationScoreForAsset: Backup crop: %@", (uint8_t *)buf, 0xCu);
      }
      CGFloat v77 = v59;

      double v78 = -[PFLCLayout initWithCropScore:layoutScore:foregroundCoverage:visibleRect:usesMask:]([PFLCLayout alloc], "initWithCropScore:layoutScore:foregroundCoverage:visibleRect:usesMask:", 0, 0.0, 0.0, 0.0, v71, v72, v73, v74);
      double v70 = v78;
    }
    else
    {
      CGFloat v77 = v59;
    }
    double v79 = [PFLCCurationPositionScore alloc];
    [v70 cropScore];
    double v81 = v80;
    [v70 visibleRect];
    buf[0].b = 0.0;
    buf[0].c = 0.0;
    *(_OWORD *)&buf[0].d = xmmword_25934AEF0;
    buf[0].a = 1.0;
    buf[0].tdouble y = 1.0;
    CGRect v135 = CGRectApplyAffineTransform(v134, buf);
    double v82 = v135.origin.x;
    double v83 = v135.origin.y;
    double v84 = v135.size.width;
    double v85 = v135.size.height;
    buf[0].b = 0.0;
    buf[0].c = 0.0;
    *(_OWORD *)&buf[0].d = xmmword_25934AEF0;
    buf[0].a = 1.0;
    buf[0].tdouble y = 1.0;
    v135.origin.double x = v77;
    v135.origin.double y = v61;
    v135.size.double width = v63;
    v135.size.double height = obja;
    CGRect v136 = CGRectApplyAffineTransform(v135, buf);
    CGRect v86 = -[PFLCCurationPositionScore initWithCropScore:cropRect:timeLabelRect:classification:](v79, "initWithCropScore:cropRect:timeLabelRect:classification:", v46, v81, v82, v83, v84, v85, *(void *)&v136.origin.x, *(void *)&v136.origin.y, *(void *)&v136.size.width, *(void *)&v136.size.height);
    CGRect v87 = [NSNumber numberWithUnsignedInteger:j];
    [v113 setObject:v86 forKeyedSubscript:v87];

    [v70 cropScore];
    if (v88 > v114)
    {
      [v70 cropScore];
      double v114 = v89;
      uint64_t v98 = j;
    }

    double v32 = v117;
  }
  double v90 = [[PFLCCurationScore alloc] initWithPositionScores:v113 preferredPosition:v98];

  return v90;
}

PFLCLayout *PFLCCalculateLayout(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6, double a7, double a8, double a9, double a10, CGFloat a11, CGFloat a12, uint64_t a13, uint64_t a14, double a15, double a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,double a21,double a22,double a23,double a24,double a25,double a26)
{
  uint64_t v150 = *MEMORY[0x263EF8340];
  id v31 = a4;
  id v32 = a5;
  double v34 = *MEMORY[0x263F001A8];
  double v33 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v36 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v35 = *(double *)(MEMORY[0x263F001A8] + 24);
  double v124 = a11;
  double v125 = a12;
  double v126 = a21 * 0.8;
  double v134 = 0.0;
  double rect1 = v35;
  if (!a1)
  {
    uint64_t v48 = 0;
    double v49 = 0.0;
    double v130 = 0.0;
    double v50 = *MEMORY[0x263F001A8];
    double v138 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v139 = *MEMORY[0x263F001A8];
    double v51 = v138;
    double v52 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v53 = *(double *)(MEMORY[0x263F001A8] + 24);
    double v54 = a7;
LABEL_29:
    double v71 = pflc_layout_log();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v145 = a3;
      _os_log_impl(&dword_259343000, v71, OS_LOG_TYPE_DEFAULT, "PFLCCalculateLayout(%ld): trying with no mask", buf, 0xCu);
    }

    double v80 = v138;
    switch(a3)
    {
      case 0:
      case 5:
        double v53 = rect1;
        double v36 = v52;
        double v80 = v51;
        double v139 = v50;
        break;
      case 1:
        double v81 = layoutPeopleNoMatte(v31, a6, v54, a8, a9, a10, v124, v125, v78, v79, v72, v73, v74, v75, v76, v77, a17, a18, a19,
                a20,
                a21,
                a22,
                a23,
                a24,
                a25,
                a26);
        goto LABEL_37;
      case 2:
        double v81 = layoutPetsNoMatte(v31, v54, a8, a9, a10, v124, v125, (uint64_t)v32, a6, v78, v79, *(CGFloat *)&a17, *(CGFloat *)&a18, *(CGFloat *)&a19, *(CGFloat *)&a20, a21, a22, a23, a24,
                a25,
                a26);
        goto LABEL_37;
      case 3:
        double v81 = layoutNatureNoMatte(a6, v54, a8, a9, a10, v124, v125, v78, v79, *(double *)&a17, *(double *)&a18, *(double *)&a19, *(double *)&a20, a21, a22, a23, a24, a25, a26);
        goto LABEL_37;
      case 4:
        double v81 = layoutCityScapeNoMatte(a6, v54, a8, a9, a10, v124, v125, v78, v79, *(double *)&a17, *(double *)&a18, *(double *)&a19, *(double *)&a20, a21, a22, a23, a24, a25, a26);
LABEL_37:
        double v139 = v81;
        double v36 = v82;
        double v53 = v83;
        break;
      default:
        break;
    }
    double v132 = v49;
    double v84 = v53;
    double v85 = v54;
    double v86 = v139;
    double v87 = v36;
    double v88 = v80;
    double v89 = v87;
    double v90 = v84;
    if (CGRectIsEmpty(*(CGRect *)(&v80 - 1)) || !rectIsWithinRect(v139, v88, v87, v84, 0.0, 0.0, 1.0, 1.0))
    {
      long long v120 = pflc_layout_log();
      if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v145 = a3;
        _os_log_impl(&dword_259343000, v120, OS_LOG_TYPE_DEFAULT, "PFLCCalculateLayout(%ld): no rect found", buf, 0xCu);
      }

      double v138 = v51;
      double v139 = v50;
      double v36 = v52;
      double v53 = rect1;
      double v49 = v132;
    }
    else
    {
      CGFloat rect1a = v84;
      double v138 = v88;
      double v91 = pflc_layout_log();
      double v36 = v87;
      if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
      {
        double v92 = _rectAsString(v139, v138, v87, v84);
        *(_DWORD *)buf = 134218242;
        uint64_t v145 = a3;
        __int16 v146 = 2112;
        v147 = v92;
        _os_log_impl(&dword_259343000, v91, OS_LOG_TYPE_DEFAULT, "PFLCCalculateLayout(%ld): found rect %@", buf, 0x16u);
      }
      if (v87 > 0.0) {
        double v93 = v87;
      }
      else {
        double v93 = 0.0;
      }
      double v94 = v84;
      if (v84 <= 0.0) {
        double v94 = 0.0;
      }
      double v95 = (v94 + v93) * 0.1 * 0.5;
      double v49 = 0.9;
      double v96 = 0.9 - v95;
      BOOL v67 = v95 <= 0.1;
      double v97 = 0.8;
      if (v67) {
        double v97 = v96;
      }
      double v131 = v97;
      id v98 = v31;
      uint64_t v99 = [v98 count];
      double v100 = 0.0;
      double v101 = a21 * 0.8;
      if (v99)
      {
        unint64_t v102 = v99;
        long long v142 = 0u;
        long long v143 = 0u;
        long long v140 = 0u;
        long long v141 = 0u;
        id v103 = v98;
        uint64_t v104 = [v103 countByEnumeratingWithState:&v140 objects:buf count:16];
        if (v104)
        {
          uint64_t v105 = v104;
          uint64_t v106 = *(void *)v141;
          double v135 = 0.0;
          do
          {
            for (uint64_t i = 0; i != v105; ++i)
            {
              if (*(void *)v141 != v106) {
                objc_enumerationMutation(v103);
              }
              [*(id *)(*((void *)&v140 + 1) + 8 * i) rectValue];
              double v109 = v108;
              double v111 = v110;
              double v113 = v112;
              double v115 = v114;
              v152.origin.double y = v138;
              v152.origin.double x = v139;
              v152.size.double width = v87;
              v152.size.double height = rect1a;
              v154.origin.double x = v109;
              v154.origin.double y = v111;
              v154.size.double width = v113;
              v154.size.double height = v115;
              if (!CGRectContainsRect(v152, v154))
              {
                for (int j = 1; j != 5; ++j)
                {
                  v155.origin.double x = expandRect(v109, v111, v113, v115, (double)j * 0.25 * -0.05, (double)j * 0.25 * -0.2, (double)j * 0.25 * -0.1, (double)j * 0.25 * -0.2);
                  v155.origin.double y = v117;
                  v155.size.double width = v118;
                  v155.size.double height = v119;
                  v153.origin.double y = v138;
                  v153.origin.double x = v139;
                  v153.size.double width = v87;
                  v153.size.double height = rect1a;
                  if (CGRectContainsRect(v153, v155)) {
                    break;
                  }
                }
                double v135 = v135 + (double)j * 0.25;
              }
            }
            uint64_t v105 = [v103 countByEnumeratingWithState:&v140 objects:buf count:16];
          }
          while (v105);
        }
        else
        {
          double v135 = 0.0;
        }

        double v85 = a7;
        double v100 = v135 / (double)v102;
        double v101 = a21 * 0.8;
        double v49 = 0.9;
      }

      double v121 = 1.0 - v85 * v87 / v101;
      if (v85 * v87 >= v101) {
        double v121 = 0.0;
      }
      double v134 = v131 + v100 * -0.3 + v121 * -0.3;
      double v53 = rect1a;
    }
    goto LABEL_72;
  }
  double v37 = pflc_layout_log();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v145 = a3;
    _os_log_impl(&dword_259343000, v37, OS_LOG_TYPE_DEFAULT, "PFLCCalculateLayout(%ld): trying with a mask", buf, 0xCu);
  }

  double v38 = [[PFLCCoverageValidator alloc] initWithMaskImage:a1 orientation:a2];
  uint64_t v41 = v38;
  double v42 = v35;
  double v43 = v36;
  double v44 = v33;
  double v45 = v34;
  switch(a3)
  {
    case 1:
      double v46 = layoutPeopleMatte(v38, v31, a6, a7, a8, a9, a10, a11, a12, v39, v40, *(CGFloat *)&a17, *(CGFloat *)&a18, *(CGFloat *)&a19, *(CGFloat *)&a20, a21, a22, a23, a24,
              a25,
              a26);
      goto LABEL_10;
    case 2:
      double v46 = layoutPetsMatte(v38, v31, a7, a8, a9, a10, a11, a12, (uint64_t)v32, a6, v39, v40, *(CGFloat *)&a17, *(CGFloat *)&a18, *(CGFloat *)&a19, *(CGFloat *)&a20, a21, a22, a23,
              a24,
              a25,
              a26);
      goto LABEL_10;
    case 3:
      double v46 = layoutNatureMatte(v38, a6, a7, a8, a9, a10, a11, a12, v39, v40, *(double *)&a17, *(double *)&a18, *(double *)&a19, *(double *)&a20, a21, a22, a23, a24, a25,
              a26);
      goto LABEL_10;
    case 4:
      double v46 = layoutCityScapeMatte(v38, a6, a7, a8, a9, a10, a11, a12, v39, v40, *(double *)&a17, *(double *)&a18, *(double *)&a19, *(double *)&a20, a21, a22, a23, a24, a25,
              a26);
LABEL_10:
      double v45 = v46;
      double v42 = v47;
      break;
    default:
      break;
  }
  double v50 = v34;
  double v51 = v33;
  double v52 = v36;
  double v55 = v45;
  double v56 = v43;
  double v57 = v44;
  double v58 = v42;
  if (CGRectIsEmpty(*(CGRect *)(&v44 - 1)) || !rectIsWithinRect(v45, v57, v56, v42, 0.0, 0.0, 1.0, 1.0))
  {

    uint64_t v48 = 0;
    double v49 = 0.0;
    double v130 = 0.0;
    double v138 = v51;
    double v139 = v34;
    double v36 = v52;
    double v53 = rect1;
    double v54 = a7;
    goto LABEL_29;
  }
  double v138 = v57;
  double v139 = v45;
  [(PFLCCoverageValidator *)v41 coverageOfTimeLabel:renormalizeRect(a23, a24, a25, a26, v45, v57, v56, v42)];
  double v130 = v59;
  double v60 = pflc_layout_log();
  double v36 = v56;
  double v53 = v42;
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    CGFloat v61 = _rectAsString(v139, v138, v56, v42);
    *(_DWORD *)buf = 134218498;
    uint64_t v145 = a3;
    __int16 v146 = 2112;
    v147 = v61;
    __int16 v148 = 2048;
    double v149 = v130;
    _os_log_impl(&dword_259343000, v60, OS_LOG_TYPE_DEFAULT, "PFLCCalculateLayout(%ld): found rect %@, coverage %.3f", buf, 0x20u);
  }
  double v62 = 0.0;
  if (v56 > 0.0) {
    double v63 = v56;
  }
  else {
    double v63 = 0.0;
  }
  if (v42 > 0.0) {
    double v64 = v42;
  }
  else {
    double v64 = 0.0;
  }
  double v65 = (v64 + v63) * 0.1 * 0.5;
  double v49 = 1.0;
  double v66 = 1.0 - v65;
  BOOL v67 = v65 <= 0.1;
  double v68 = 0.9;
  if (v67) {
    double v68 = v66;
  }
  if (a7 * v56 < v126) {
    double v62 = 1.0 - a7 * v56 / v126;
  }
  double v69 = v68 + v62 * -0.3;

  uint64_t v48 = 1;
  double v134 = v69;
  BOOL v70 = v69 == 0.0;
  double v54 = a7;
  if (v70) {
    goto LABEL_29;
  }
LABEL_72:
  long long v122 = -[PFLCLayout initWithCropScore:layoutScore:foregroundCoverage:visibleRect:usesMask:]([PFLCLayout alloc], "initWithCropScore:layoutScore:foregroundCoverage:visibleRect:usesMask:", v48, v134, v49, v130, v139, v138, v36, v53);

  return v122;
}

double layoutCityScapeMatte(void *a1, uint64_t a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, CGFloat a17, CGFloat a18, double a19, double a20)
{
  return layoutNatureMatte(a1, a2, a3, a4, a5, a6, a7, a8, a19, a20, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
}

double layoutCityScapeNoMatte(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, double a17, double a18, double a19)
{
  return layoutNatureNoMatte(a1, a2, a3, a4, a5, a6, a7, a18, a19, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19);
}

double layoutNatureMatte(void *a1, uint64_t a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, CGFloat a17, CGFloat a18, double a19, CGFloat a20)
{
  v51[1] = *MEMORY[0x263EF8340];
  id v29 = a1;
  double v30 = *MEMORY[0x263F001A8];
  CGFloat v43 = a6;
  double v31 = *MEMORY[0x263F5DE98] * 0.5;
  switch(a2)
  {
    case 1:
    case 3:
    case 7:
      *(double *)uint64_t v48 = a11;
      *(double *)&v48[1] = a12 + a14 * 0.5;
      *(double *)&v48[2] = a13;
      *(double *)&v48[3] = a14 * 0.5;
      id v32 = [MEMORY[0x263F08D40] valueWithBytes:v48 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      v51[0] = v32;
      double v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:1];

      double v35 = cropTimeAboveFacesWithMask(v33, v29, 3, a3, a4, a17, a18, a19, a20, v31, v34, a15, a16);
      goto LABEL_5;
    case 5:
      v47[0] = a11 + a13 * 0.333333333;
      v47[1] = a12;
      v47[2] = a13 * 0.666666667;
      v47[3] = a14;
      double v36 = [MEMORY[0x263F08D40] valueWithBytes:v47 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      double v50 = v36;
      double v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v50 count:1];

      double v35 = cropTimeLeftOfFacesWithMask(v33, v29, 2, a3, a4, a17, a18, a19, a20, v37, v38, a5, v43, a7, a8, *MEMORY[0x263F001A0], *(CGFloat *)(MEMORY[0x263F001A0] + 8), *(CGFloat *)(MEMORY[0x263F001A0] + 16), *(CGFloat *)(MEMORY[0x263F001A0] + 24),
              v31,
              a15,
              a16);
      goto LABEL_5;
    case 6:
      *(double *)double v46 = a11;
      *(double *)&v46[1] = a12;
      *(double *)&v46[2] = a13 * 0.666666667;
      *(double *)&v46[3] = a14;
      double v39 = [MEMORY[0x263F08D40] valueWithBytes:v46 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      double v49 = v39;
      double v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v49 count:1];

      double v35 = cropTimeRightOfFacesWithMask(v33, v29, 2, a3, a4, a17, a18, a19, a20, v40, v41, a5, v43, a7, a8, *MEMORY[0x263F001A0], *(CGFloat *)(MEMORY[0x263F001A0] + 8), *(CGFloat *)(MEMORY[0x263F001A0] + 16), *(CGFloat *)(MEMORY[0x263F001A0] + 24),
              v31,
              a15,
              a16);
LABEL_5:
      double v30 = v35;

      break;
    default:
      break;
  }

  return v30;
}

double layoutNatureNoMatte(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, double a17, double a18, double a19)
{
  v65[1] = *MEMORY[0x263EF8340];
  double v29 = *MEMORY[0x263F5DE98] * 0.5;
  switch(a1)
  {
    case 1:
    case 3:
    case 7:
      *(double *)CGFloat v61 = a10;
      *(double *)&v61[1] = a11;
      *(double *)&v61[2] = a12;
      *(double *)&v61[3] = a13;
      double v30 = [MEMORY[0x263F08D40] valueWithBytes:v61 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      v65[0] = v30;
      double v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v65 count:1];

      double v33 = cropTimeAboveFacesNoMask(v31, a2, a3, a16, a17, a18, a19, v29, v32, a14, a15);
      goto LABEL_7;
    case 2:
    case 4:
    case 8:
      *(double *)double v60 = a10;
      *(double *)&v60[1] = a11;
      *(double *)&v60[2] = a12;
      *(double *)&v60[3] = a13;
      double v34 = [MEMORY[0x263F08D40] valueWithBytes:v60 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      double v64 = v34;
      double v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v64 count:1];

      double v33 = cropTimeBelowFacesNoMask(v31, a2, a3, a16, a17, a18, a19, v29, v35, a14, a15);
      goto LABEL_7;
    case 5:
      v59[0] = a10 + a12 * 0.333333333;
      v59[1] = a11;
      v59[2] = a12 * 0.666666667;
      v59[3] = a13;
      double v37 = [MEMORY[0x263F08D40] valueWithBytes:v59 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      double v63 = v37;
      double v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v63 count:1];

      cropTimeLeftFacesNoMask(v31, 2, a2, a3, a16, a17, a18, a19, v44, v45, v38, v39, v40, v41, v42, v43, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6,
        *(uint64_t *)&a7,
        *MEMORY[0x263F001A0],
        *(void *)(MEMORY[0x263F001A0] + 8),
        *(void *)(MEMORY[0x263F001A0] + 16),
        *(void *)(MEMORY[0x263F001A0] + 24),
        v29,
        a14,
        a15);
      goto LABEL_7;
    case 6:
      *(double *)double v58 = a10;
      *(double *)&v58[1] = a11;
      *(double *)&v58[2] = a12 * 0.666666667;
      *(double *)&v58[3] = a13;
      double v46 = [MEMORY[0x263F08D40] valueWithBytes:v58 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      double v62 = v46;
      double v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v62 count:1];

      cropTimeRightFacesNoMask(v31, 2, a2, a3, a16, a17, a18, a19, v53, v54, v47, v48, v49, v50, v51, v52, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6,
        *(uint64_t *)&a7,
        *MEMORY[0x263F001A0],
        *(void *)(MEMORY[0x263F001A0] + 8),
        *(void *)(MEMORY[0x263F001A0] + 16),
        *(void *)(MEMORY[0x263F001A0] + 24),
        v29,
        a14,
        a15);
LABEL_7:
      double v36 = v33;

      break;
    default:
      double v36 = *MEMORY[0x263F001A8];
      break;
  }
  return v36;
}

double layoutPeopleMatte(void *a1, void *a2, uint64_t a3, double a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, double a10, double a11, CGFloat a12, CGFloat a13, CGFloat a14, CGFloat a15, double a16, double a17, CGFloat a18, CGFloat a19, double a20,CGFloat a21)
{
  id v30 = a1;
  id v31 = a2;
  double v32 = *MEMORY[0x263F001A8];
  if ([v31 count])
  {
    CGFloat v42 = a7;
    double v33 = *MEMORY[0x263F5DE98] * 0.5;
    switch(a3)
    {
      case 1:
      case 3:
      case 7:
        double v34 = expandRects(v31, 0.0, 0.01, 0.02, 0.01);
        double v36 = cropTimeAboveFacesWithMask(v34, v30, 1, a4, a5, a18, a19, a20, a21, v33, v35, a16, a17);
        goto LABEL_6;
      case 5:
        double v34 = expandRects(v31, 0.01, 0.01, 0.05, 0.01);
        double v36 = cropTimeLeftOfFacesWithMask(v34, v30, 1, a4, a5, a18, a19, a20, a21, v37, v38, a6, v42, a8, a9, a12, a13, a14, a15,
                v33,
                a16,
                a17);
        goto LABEL_6;
      case 6:
        double v34 = expandRects(v31, 0.01, 0.01, 0.05, 0.01);
        double v36 = cropTimeRightOfFacesWithMask(v34, v30, 1, a4, a5, a18, a19, a20, a21, v39, v40, a6, v42, a8, a9, a12, a13, a14, a15,
                v33,
                a16,
                a17);
LABEL_6:
        double v32 = v36;

        break;
      default:
        break;
    }
  }

  return v32;
}

double layoutPeopleNoMatte(void *a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,double a21,double a22,double a23,double a24,double a25,double a26)
{
  id v29 = a1;
  double x = *MEMORY[0x263F001A8];
  if ([v29 count])
  {
    uint64_t v91 = *(void *)&a6;
    double v31 = a4;
    double x = a25;
    double v98 = a3;
    double v32 = *MEMORY[0x263F5DE98] * 0.5;
    switch(a2)
    {
      case 1:
      case 3:
      case 7:
        double v33 = expandRects(v29, 0.0, 0.01, 0.02, 0.01);
        v99.origin.double x = cropTimeAboveFacesNoMask(v33, a3, v31, a23, a24, a25, a26, v32, v34, a21, a22);
        double x = v99.origin.x;
        if (CGRectIsNull(v99))
        {
          int v35 = 1;
          do
          {
            double v36 = v33;
            double v33 = expandRects(v29, (double)v35 * 0.25 * -0.05, (double)v35 * 0.25 * -0.2, (double)v35 * 0.25 * -0.1, (double)v35 * 0.25 * -0.2);

            v100.origin.double x = cropTimeAboveFacesNoMask(v33, a3, v31, a23, a24, a25, a26, v32, v37, a21, a22);
            double x = v100.origin.x;
          }
          while (CGRectIsNull(v100) && v35++ < 4);
        }
        goto LABEL_34;
      case 2:
      case 4:
      case 8:
        double v33 = expandRects(v29, 0.01, 0.01, 0.0, 0.01);
        v101.origin.double x = cropTimeBelowFacesNoMask(v33, a3, v31, a23, a24, a25, a26, v32, v39, a21, a22);
        double x = v101.origin.x;
        if (CGRectIsNull(v101))
        {
          int v40 = 1;
          do
          {
            uint64_t v41 = v33;
            double v33 = expandRects(v29, (double)v40 * 0.25 * -0.05, (double)v40 * 0.25 * -0.2, (double)v40 * 0.25 * -0.1, (double)v40 * 0.25 * -0.2);

            v102.origin.double x = cropTimeBelowFacesNoMask(v33, a3, v31, a23, a24, a25, a26, v32, v42, a21, a22);
            double x = v102.origin.x;
          }
          while (CGRectIsNull(v102) && v40++ < 4);
        }
        goto LABEL_34;
      case 5:
        double v33 = expandRects(v29, 0.01, 0.01, 0.05, 0.01);
        double v93 = v32;
        cropTimeLeftFacesNoMask(v33, 1, a3, v31, a23, a24, a25, a26, v73, v74, v67, v68, v69, v70, v71, v72, *(uint64_t *)&a5, v91, *(uint64_t *)&a7,
          *(uint64_t *)&a8,
          a17,
          a18,
          a19,
          a20,
          v32,
          a21,
          a22);
        double x = v105.origin.x;
        if (CGRectIsNull(v105))
        {
          uint64_t v75 = *MEMORY[0x263F001A0];
          uint64_t v76 = *(void *)(MEMORY[0x263F001A0] + 8);
          double v96 = v31;
          uint64_t v77 = *(void *)(MEMORY[0x263F001A0] + 16);
          uint64_t v78 = *(void *)(MEMORY[0x263F001A0] + 24);
          int v79 = 1;
          do
          {
            double v80 = v33;
            double v33 = expandRects(v29, (double)v79 * 0.25 * -0.05, (double)v79 * 0.25 * -0.2, (double)v79 * 0.25 * -0.1, (double)v79 * 0.25 * -0.2);

            cropTimeLeftFacesNoMask(v33, 1, v98, v96, a23, a24, a25, a26, v87, v88, v81, v82, v83, v84, v85, v86, v75, v76, v77,
              v78,
              v75,
              v76,
              v77,
              v78,
              v93,
              a21,
              a22);
            double x = v106.origin.x;
          }
          while (CGRectIsNull(v106) && v79++ < 4);
        }
        goto LABEL_34;
      case 6:
        double v33 = expandRects(v29, 0.01, 0.01, 0.05, 0.01);
        double v92 = v32;
        cropTimeRightFacesNoMask(v33, 1, a3, v31, a23, a24, a25, a26, v50, v51, v44, v45, v46, v47, v48, v49, *(uint64_t *)&a5, v91, *(uint64_t *)&a7,
          *(uint64_t *)&a8,
          a17,
          a18,
          a19,
          a20,
          v32,
          a21,
          a22);
        double x = v103.origin.x;
        if (CGRectIsNull(v103))
        {
          uint64_t v52 = *MEMORY[0x263F001A0];
          uint64_t v53 = *(void *)(MEMORY[0x263F001A0] + 8);
          double v95 = v31;
          uint64_t v54 = *(void *)(MEMORY[0x263F001A0] + 16);
          uint64_t v55 = *(void *)(MEMORY[0x263F001A0] + 24);
          int v56 = 1;
          do
          {
            double v57 = v33;
            double v33 = expandRects(v29, (double)v56 * 0.25 * -0.05, (double)v56 * 0.25 * -0.2, (double)v56 * 0.25 * -0.1, (double)v56 * 0.25 * -0.2);

            cropTimeRightFacesNoMask(v33, 1, v98, v95, a23, a24, a25, a26, v64, v65, v58, v59, v60, v61, v62, v63, v52, v53, v54,
              v55,
              v52,
              v53,
              v54,
              v55,
              v92,
              a21,
              a22);
            double x = v104.origin.x;
          }
          while (CGRectIsNull(v104) && v56++ < 4);
        }
LABEL_34:

        break;
      default:
        break;
    }
  }

  return x;
}

double layoutPetsMatte(void *a1, void *a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, uint64_t a9, uint64_t a10, double a11, double a12, CGFloat a13, CGFloat a14, CGFloat a15, CGFloat a16, double a17, double a18, CGFloat a19, CGFloat a20,double a21,CGFloat a22)
{
  v49[1] = *MEMORY[0x263EF8340];
  id v26 = a1;
  id v27 = a2;
  double v28 = *MEMORY[0x263F001A8];
  id v29 = v27;
  if ([v29 count])
  {
    double v30 = -0.2;
    double v31 = v29;
  }
  else
  {
    v50.origin.double x = a13;
    v50.origin.double y = a14;
    v50.size.double width = a15;
    v50.size.double height = a16;
    if (CGRectIsEmpty(v50))
    {
      double v31 = v29;
      goto LABEL_12;
    }
    *(CGFloat *)uint64_t v48 = a13;
    *(CGFloat *)&v48[1] = a14;
    *(CGFloat *)&v48[2] = a15;
    *(CGFloat *)&v48[3] = a16;
    double v32 = [MEMORY[0x263F08D40] valueWithBytes:v48 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    v49[0] = v32;
    double v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:1];

    double v30 = 0.0;
  }
  double v28 = *MEMORY[0x263F5DE98] * 0.5;
  switch(a10)
  {
    case 1:
    case 3:
    case 7:
      double v33 = expandRects(v31, v30, 0.01, 0.02, 0.01);
      double v35 = cropTimeAboveFacesWithMask(v33, v26, 2, a3, a4, a19, a20, a21, a22, v28, v34, a17, a18);
      goto LABEL_11;
    case 2:
    case 4:
    case 8:
      double v33 = expandRects(v31, v30, 0.01, 0.0, 0.01);
      double v35 = cropTimeBelowFacesWithMask(v33, v26, a3, a4, a19, a20, a21, a22, v28, v36, a17, a18);
      goto LABEL_11;
    case 5:
      double v33 = expandRects(v31, v30, 0.01, 0.02, 0.01);
      double v35 = cropTimeLeftOfFacesWithMask(v33, v26, 1, a3, a4, a19, a20, a21, a22, v37, v38, a5, a6, a7, a8, a13, a14, a15, a16,
              v28,
              a17,
              a18);
      goto LABEL_11;
    case 6:
      double v33 = expandRects(v31, v30, 0.01, 0.02, 0.01);
      double v35 = cropTimeRightOfFacesWithMask(v33, v26, 1, a3, a4, a19, a20, a21, a22, v39, v40, a5, a6, a7, a8, a13, a14, a15, a16,
              v28,
              a17,
              a18);
LABEL_11:
      double v28 = v35;

      break;
    default:
      break;
  }
LABEL_12:

  return v28;
}

double layoutPetsNoMatte(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9, double a10, double a11, CGFloat a12, CGFloat a13, CGFloat a14, CGFloat a15, double a16, double a17, double a18, double a19, double a20,double a21)
{
  v99[1] = *MEMORY[0x263EF8340];
  id v25 = a1;
  double x = *MEMORY[0x263F001A8];
  id v27 = v25;
  if ([v27 count])
  {
    uint64_t v90 = *(void *)&a12;
    double v28 = -0.2;
    id v29 = v27;
  }
  else
  {
    v100.origin.double x = a12;
    v100.origin.double y = a13;
    v100.size.double width = a14;
    v100.size.double height = a15;
    if (CGRectIsEmpty(v100))
    {
      id v29 = v27;
      goto LABEL_39;
    }
    uint64_t v90 = *(void *)&a12;
    *(CGFloat *)double v98 = a12;
    *(CGFloat *)&v98[1] = a13;
    *(CGFloat *)&v98[2] = a14;
    *(CGFloat *)&v98[3] = a15;
    double v30 = [MEMORY[0x263F08D40] valueWithBytes:v98 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    v99[0] = v30;
    id v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v99 count:1];

    double v28 = 0.0;
  }
  double x = a20;
  double v31 = *MEMORY[0x263F5DE98] * 0.5;
  double v95 = v28;
  switch(a9)
  {
    case 1:
    case 3:
    case 7:
      double v32 = expandRects(v29, v28, 0.01, 0.02, 0.01);
      v101.origin.double x = cropTimeAboveFacesNoMask(v32, a2, a3, a18, a19, a20, a21, v31, v33, a16, a17);
      double x = v101.origin.x;
      if (CGRectIsNull(v101))
      {
        int v34 = 1;
        do
        {
          double v35 = v32;
          double v32 = expandRects(v27, v95 + (double)v34 * 0.25 * -0.05, (double)v34 * 0.25 * -0.2, (double)v34 * 0.25 * -0.1, (double)v34 * 0.25 * -0.2);

          v102.origin.double x = cropTimeAboveFacesNoMask(v32, a2, a3, a18, a19, a20, a21, v31, v36, a16, a17);
          double x = v102.origin.x;
        }
        while (CGRectIsNull(v102) && v34++ < 4);
      }
      goto LABEL_38;
    case 2:
    case 4:
    case 8:
      double v32 = expandRects(v29, v28, 0.01, 0.0, 0.01);
      v103.origin.double x = cropTimeBelowFacesNoMask(v32, a2, a3, a18, a19, a20, a21, v31, v38, a16, a17);
      double x = v103.origin.x;
      if (CGRectIsNull(v103))
      {
        int v39 = 1;
        do
        {
          double v40 = v32;
          double v32 = expandRects(v27, v95 + (double)v39 * 0.25 * -0.05, (double)v39 * 0.25 * -0.2, (double)v39 * 0.25 * -0.1, (double)v39 * 0.25 * -0.2);

          v104.origin.double x = cropTimeBelowFacesNoMask(v32, a2, a3, a18, a19, a20, a21, v31, v41, a16, a17);
          double x = v104.origin.x;
        }
        while (CGRectIsNull(v104) && v39++ < 4);
      }
      goto LABEL_38;
    case 5:
      double v32 = expandRects(v29, v28, 0.01, 0.02, 0.01);
      cropTimeLeftFacesNoMask(v32, 1, a2, a3, a18, a19, a20, a21, v49, v50, v43, v44, v45, v46, v47, v48, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6,
        *(uint64_t *)&a7,
        v90,
        *(uint64_t *)&a13,
        *(uint64_t *)&a14,
        *(uint64_t *)&a15,
        v31,
        a16,
        a17);
      double x = v105.origin.x;
      if (CGRectIsNull(v105))
      {
        uint64_t v51 = *MEMORY[0x263F001A0];
        uint64_t v52 = *(void *)(MEMORY[0x263F001A0] + 8);
        uint64_t v53 = *(void *)(MEMORY[0x263F001A0] + 16);
        uint64_t v54 = *(void *)(MEMORY[0x263F001A0] + 24);
        int v55 = 1;
        do
        {
          int v56 = v32;
          double v32 = expandRects(v27, v95 + (double)v55 * 0.25 * -0.05, (double)v55 * 0.25 * -0.2, (double)v55 * 0.25 * -0.1, (double)v55 * 0.25 * -0.2);

          cropTimeLeftFacesNoMask(v32, 1, a2, a3, a18, a19, a20, a21, v63, v64, v57, v58, v59, v60, v61, v62, v51, v52, v53,
            v54,
            v51,
            v52,
            v53,
            v54,
            v31,
            a16,
            a17);
          double x = v106.origin.x;
        }
        while (CGRectIsNull(v106) && v55++ < 4);
      }
      goto LABEL_38;
    case 6:
      double v32 = expandRects(v29, v28, 0.01, 0.02, 0.01);
      cropTimeRightFacesNoMask(v32, 1, a2, a3, a18, a19, a20, a21, v72, v73, v66, v67, v68, v69, v70, v71, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6,
        *(uint64_t *)&a7,
        v90,
        *(uint64_t *)&a13,
        *(uint64_t *)&a14,
        *(uint64_t *)&a15,
        v31,
        a16,
        a17);
      double x = v107.origin.x;
      if (CGRectIsNull(v107))
      {
        uint64_t v74 = *MEMORY[0x263F001A0];
        uint64_t v75 = *(void *)(MEMORY[0x263F001A0] + 8);
        uint64_t v76 = *(void *)(MEMORY[0x263F001A0] + 16);
        uint64_t v77 = *(void *)(MEMORY[0x263F001A0] + 24);
        int v78 = 1;
        do
        {
          int v79 = v32;
          double v32 = expandRects(v27, v95 + (double)v78 * 0.25 * -0.05, (double)v78 * 0.25 * -0.2, (double)v78 * 0.25 * -0.1, (double)v78 * 0.25 * -0.2);

          cropTimeRightFacesNoMask(v32, 1, a2, a3, a18, a19, a20, a21, v86, v87, v80, v81, v82, v83, v84, v85, v74, v75, v76,
            v77,
            v74,
            v75,
            v76,
            v77,
            v31,
            a16,
            a17);
          double x = v108.origin.x;
        }
        while (CGRectIsNull(v108) && v78++ < 4);
      }
LABEL_38:

      break;
    default:
      break;
  }
LABEL_39:

  return x;
}

id pflc_layout_log()
{
  if (pflc_layout_log_onceToken != -1) {
    dispatch_once(&pflc_layout_log_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)pflc_layout_log___logger;

  return v0;
}

uint64_t __pflc_layout_log_block_invoke()
{
  pflc_layout_log___logger = (uint64_t)os_log_create("com.apple.photosfacelayoutcore", "layout");

  return MEMORY[0x270F9A758]();
}

uint64_t makePresentationTransform@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  switch((int)result)
  {
    case 1:
      *(void *)a4 = 0x3FF0000000000000;
      *(void *)(a4 + 8) = 0;
      *(void *)(a4 + 16) = 0;
      *(void *)(a4 + 24) = 0x3FF0000000000000;
      *(void *)(a4 + 32) = 0;
      *(void *)(a4 + 40) = 0;
      return result;
    case 2:
      double v6 = (double)a2;
      *(void *)a4 = 0xBFF0000000000000;
      *(void *)(a4 + 8) = 0;
      *(void *)(a4 + 16) = 0;
      *(void *)(a4 + 24) = 0x3FF0000000000000;
      goto LABEL_9;
    case 3:
      double v7 = (double)a2;
      double v8 = (double)a3;
      *(void *)a4 = 0xBFF0000000000000;
      *(void *)(a4 + 8) = 0;
      *(void *)(a4 + 16) = 0;
      *(void *)(a4 + 24) = 0xBFF0000000000000;
      goto LABEL_11;
    case 4:
      double v9 = (double)a3;
      *(void *)a4 = 0x3FF0000000000000;
      *(void *)(a4 + 8) = 0;
      *(void *)(a4 + 16) = 0;
      *(void *)(a4 + 24) = 0xBFF0000000000000;
      goto LABEL_13;
    case 5:
      __asm { FMOV            V0.2D, #1.0; jumptable 000000025934A378 case 5 }
      *(_OWORD *)(a4 + 8) = _Q0;
      *(void *)(a4 + 32) = 0;
      *(void *)(a4 + 40) = 0;
      *(void *)(a4 + 24) = 0;
      return result;
    case 6:
      double v6 = (double)a3;
      *(_OWORD *)(a4 + 8) = xmmword_25934AFA0;
LABEL_9:
      *(double *)(a4 + 32) = v6;
      return result;
    case 7:
      double v7 = (double)a3;
      double v8 = (double)a2;
      __asm { FMOV            V2.2D, #-1.0 }
      *(_OWORD *)(a4 + 8) = _Q2;
LABEL_11:
      *(double *)(a4 + 32) = v7;
      *(double *)(a4 + 40) = v8;
      break;
    case 8:
      double v9 = (double)a2;
      *(_OWORD *)(a4 + 8) = xmmword_25934AF90;
      *(void *)(a4 + 24) = 0;
      *(void *)(a4 + 32) = 0;
LABEL_13:
      *(double *)(a4 + 40) = v9;
      break;
    default:
      uint64_t v4 = MEMORY[0x263F000D0];
      long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      *(_OWORD *)a4 = *MEMORY[0x263F000D0];
      *(_OWORD *)(a4 + 16) = v5;
      *(_OWORD *)(a4 + 32) = *(_OWORD *)(v4 + 32);
      break;
  }
  return result;
}

double makePresentationSize(float64x2_t *a1, double a2, double a3)
{
  *(void *)&double result = *(_OWORD *)&vabsq_f64(vmlaq_n_f64(vmulq_n_f64(a1[1], a3), *a1, a2));
  return result;
}

CGFloat uprightCTM@<D0>(CGImage *a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>)
{
  CGFloat Height = (double)CGImageGetHeight(a1);
  uint64_t v6 = MEMORY[0x263F000D0];
  long long v7 = *MEMORY[0x263F000D0];
  long long v8 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)a3 = *MEMORY[0x263F000D0];
  *(_OWORD *)(a3 + 16) = v8;
  long long v9 = *(_OWORD *)(v6 + 32);
  *(_OWORD *)(a3 + 32) = v9;
  *(_OWORD *)&t1.a = v7;
  *(_OWORD *)&t1.c = v8;
  *(_OWORD *)&t1.tdouble x = v9;
  t2.b = 0.0;
  t2.c = 0.0;
  t2.a = 1.0;
  *(_OWORD *)&t2.d = xmmword_25934AEF0;
  t2.tdouble y = Height;
  CGAffineTransformConcat((CGAffineTransform *)a3, &t1, &t2);
  long long v10 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)&t2.a = *(_OWORD *)a3;
  *(_OWORD *)&t2.c = v10;
  *(_OWORD *)&t2.tdouble x = *(_OWORD *)(a3 + 32);
  long long v11 = a2[1];
  *(_OWORD *)&v16.a = *a2;
  *(_OWORD *)&v16.c = v11;
  *(_OWORD *)&v16.tdouble x = a2[2];
  CGAffineTransformConcat(&t1, &t2, &v16);
  long long v12 = *(_OWORD *)&t1.c;
  *(_OWORD *)a3 = *(_OWORD *)&t1.a;
  *(_OWORD *)(a3 + 16) = v12;
  *(_OWORD *)(a3 + 32) = *(_OWORD *)&t1.tx;
  long long v13 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)&t2.a = *(_OWORD *)a3;
  *(_OWORD *)&t2.c = v13;
  *(_OWORD *)&t2.tdouble x = *(_OWORD *)(a3 + 32);
  v16.b = 0.0;
  v16.c = 0.0;
  v16.a = 1.0;
  *(_OWORD *)&v16.d = xmmword_25934AEF0;
  v16.tdouble y = Height;
  CGAffineTransformConcat(&t1, &t2, &v16);
  long long v14 = *(_OWORD *)&t1.c;
  *(_OWORD *)a3 = *(_OWORD *)&t1.a;
  *(_OWORD *)(a3 + 16) = v14;
  CGFloat result = t1.tx;
  *(_OWORD *)(a3 + 32) = *(_OWORD *)&t1.tx;
  return result;
}

BOOL rectIsWithinRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  BOOL v8 = a1 < a5 + -0.00000011920929 || a2 < a6 + -0.00000011920929;
  return !v8 && a1 + a3 + -0.00000011920929 <= a5 + a7 && a2 + a4 + -0.00000011920929 <= a6 + a8;
}

double expandRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return a1 - a3 * a8;
}

id expandRects(void *a1, double a2, double a3, double a4, double a5)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v9 = a1;
  long long v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    double v15 = a3 + a5 + 1.0;
    double v16 = a2 + a4 + 1.0;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * i) rectValue];
        v24[0] = v20 - v18 * a5;
        v24[1] = v21 - v19 * a2;
        v24[2] = v15 * v18;
        v24[3] = v16 * v19;
        double v22 = [MEMORY[0x263F08D40] valueWithBytes:v24 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
        [v10 addObject:v22];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v13);
  }

  return v10;
}

double renormalizeRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, CGFloat a7, CGFloat a8)
{
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeScale(&v15, a7, a8);
  CGAffineTransform v14 = v15;
  v16.origin.double x = a1;
  v16.origin.double y = a2;
  v16.size.double width = a3;
  v16.size.double height = a4;
  return a5 + COERCE_DOUBLE(CGRectApplyAffineTransform(v16, &v14));
}

id _rectAsString(double a1, double a2, double a3, double a4)
{
  if (a4 <= 1.0 && a3 <= 1.0) {
    long long v5 = @"{ %.5f, %.5f, %.5f, %.5f }";
  }
  else {
    long long v5 = @"{ %.1f, %.1f, %.1f, %.1f }";
  }
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", v5, *(void *)&a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);

  return v6;
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x270EE5978](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D18](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextRelease(CGContextRef c)
{
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

uint64_t PFCRectForTimePosition()
{
  return MEMORY[0x270F53A90]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}