@interface UICollectionLayoutValidatedContentOffsetForProposedContentOffsetForOrthogonalSection
@end

@implementation UICollectionLayoutValidatedContentOffsetForProposedContentOffsetForOrthogonalSection

double ___UICollectionLayoutValidatedContentOffsetForProposedContentOffsetForOrthogonalSection_block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v10 = a5 + a5 + *(double *)(a1 + 40) - *(double *)(a1 + 48);
  double v11 = fabs(a4);
  BOOL IsNull = CGRectIsNull(*(CGRect *)(a1 + 56));
  if (v11 >= 2.22044605e-16)
  {
    BOOL v15 = IsNull;
    uint64_t v16 = *(void *)(a1 + 32);
    double v17 = 0.0;
    double v18 = 0.0;
    double v19 = 0.0;
    if (v16)
    {
      double v19 = *(double *)(v16 + 96);
      double v18 = *(double *)(v16 + 104);
    }
    uint64_t v20 = *(void *)(a1 + 104);
    if (v20)
    {
      double v21 = *(double *)(a1 + 88) - v19;
      double v22 = *(double *)(a1 + 96) - v18;
      double v23 = 1.0;
      BOOL v24 = v22 < 0.0;
      BOOL v25 = v22 <= 0.0;
      double v26 = 1.0;
      if (v25)
      {
        double v26 = 0.0;
        if (v24) {
          double v26 = -1.0;
        }
      }
      if (v21 <= 0.0)
      {
        double v23 = 0.0;
        if (v21 < 0.0) {
          double v23 = -1.0;
        }
      }
      if (v20) {
        double v17 = v23;
      }
      else {
        double v17 = 0.0;
      }
      if ((v20 & 2) != 0) {
        double v27 = v26;
      }
      else {
        double v27 = 0.0;
      }
    }
    else
    {
      double v27 = 0.0;
    }
    double v28 = _UIPointValueForAxis(v20, a2, a3) - v10 + 0.0001;
    uint64_t v29 = *(void *)(a1 + 104);
    double v30 = 1.0;
    if (v29 == 2) {
      double v31 = 1.0;
    }
    else {
      double v31 = v27;
    }
    if (v29 == 3)
    {
      double v31 = 1.0;
      double v32 = 1.0;
    }
    else
    {
      double v32 = v17;
    }
    if (v29 == 1) {
      double v31 = v27;
    }
    else {
      double v30 = v32;
    }
    BOOL v33 = v28 < 0.0;
    if (v28 >= 0.0) {
      double v34 = v31;
    }
    else {
      double v34 = v27;
    }
    if (v33) {
      double v30 = v17;
    }
    if (v29 == 1) {
      double v35 = v30;
    }
    else {
      double v35 = v34;
    }
    double v36 = _UIPointValueForAxis(v29, a2, a3) / a4;
    double v37 = -v35;
    if (v35 >= 0.0) {
      double v37 = v35;
    }
    if (v37 > 2.22044605e-16 && v15)
    {
      if (v35 >= 0.0) {
        double v39 = ceil(v36 + -0.005);
      }
      else {
        double v39 = floor(v36 + 0.005);
      }
    }
    else
    {
      double v39 = round(v36);
    }
    uint64_t v40 = (uint64_t)v39 & ~((uint64_t)v39 >> 63);
    double v14 = _UISetPointValueForAxis(*(void *)(a1 + 104), a2, a3, (double)v40 * a4);
    double v13 = v41;
    if (!v15)
    {
      double v56 = v10;
      double v42 = _UIPointValueForAxis(*(void *)(a1 + 104), *(double *)(a1 + 56), *(double *)(a1 + 64));
      double v43 = a5;
      double v44 = v42 + _UISizeValueForAxis(*(void *)(a1 + 104), *(double *)(a1 + 72), *(double *)(a1 + 80));
      double v45 = _UIPointValueForAxis(*(void *)(a1 + 104), v14, v13);
      double v46 = *(double *)(a1 + 48);
      double v47 = v45 + v46 - v43;
      if (v46 - a4 + 0.0001 < 0.0)
      {
        double v10 = v56;
      }
      else
      {
        double v10 = v56;
        if (v45 > v42 != v47 < v44)
        {
          if (v45 <= v42) {
            uint64_t v48 = 0;
          }
          else {
            uint64_t v48 = (uint64_t)(0.0 - ceil((v45 - v42) / a4));
          }
          if (v47 < v44) {
            uint64_t v48 = (uint64_t)(ceil((v44 - v47) / a4) + (double)v48);
          }
          double v14 = _UISetPointValueForAxis(*(void *)(a1 + 104), a2, a3, (double)(v48 + v40) * a4);
          double v13 = v49;
        }
      }
    }
  }
  else
  {
    double v13 = a3;
    double v14 = a2;
  }
  double v50 = _UIPointValueForAxis(*(void *)(a1 + 104), v14, v13);
  if (v10 < 0.0 || v50 < 0.0)
  {
    uint64_t v51 = *(void *)(a1 + 104);
    double v54 = 0.0;
    double v52 = v14;
    double v53 = v13;
    return _UISetPointValueForAxis(v51, v52, v53, v54);
  }
  if (v50 > v10)
  {
    uint64_t v51 = *(void *)(a1 + 104);
    double v52 = v14;
    double v53 = v13;
    double v54 = v10;
    return _UISetPointValueForAxis(v51, v52, v53, v54);
  }
  return v14;
}

@end