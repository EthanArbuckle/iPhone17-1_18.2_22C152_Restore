@interface UIFocusScrollOffsetResolverDifferential
@end

@implementation UIFocusScrollOffsetResolverDifferential

void __74___UIFocusScrollOffsetResolverDifferential_contentOffsetForScrollRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  _UIIntervalFromCGRect(a2, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v5 = v4;
  double v7 = v6;
  _UIIntervalFromCGRect(a2, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  double v10 = -0.0;
  if (v7 >= 0.0) {
    double v11 = -0.0;
  }
  else {
    double v11 = v7;
  }
  double v12 = v5 + v11;
  if (v9 < 0.0) {
    double v10 = v9;
  }
  double v13 = v8 + v10;
  if (v12 > v13) {
    goto LABEL_12;
  }
  double v14 = -v7;
  if (v7 >= 0.0) {
    double v14 = v7;
  }
  double v15 = v14 + v12;
  double v16 = -v9;
  if (v9 >= 0.0) {
    double v16 = v9;
  }
  if (v15 < v16 + v13)
  {
LABEL_12:
    if (v13 > v12)
    {
      if (v7 >= 0.0) {
        double v17 = v7;
      }
      else {
        double v17 = -v7;
      }
LABEL_22:
      _UIIntervalFromCGRect(a2, *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
      double v20 = v19;
      double v22 = v21;
      _UIIntervalFromCGRect(a2, *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160));
      double v25 = -v24;
      if (v24 >= 0.0)
      {
        double v25 = v24;
        double v24 = -0.0;
      }
      if (v23 + v24 + v25 * 0.5 <= v12 + v17 * 0.5)
      {
        double v29 = -0.0;
        if (v22 < 0.0) {
          double v29 = v22;
        }
        double v28 = v20 + v29;
      }
      else
      {
        double v26 = -v22;
        if (v22 >= 0.0) {
          double v26 = v22;
        }
        double v27 = -0.0;
        if (v22 < 0.0) {
          double v27 = v22;
        }
        double v28 = v26 + v20 + v27 - v7;
      }
      double v30 = _UIPointValueForAxis(a2, *(double *)(a1 + 168), *(double *)(a1 + 176));
      double v31 = _UISetPointValueForAxis(a2, *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v28 + v30);
      uint64_t v32 = *(void *)(*(void *)(a1 + 32) + 8);
      *(double *)(v32 + 32) = v31;
      *(void *)(v32 + 40) = v33;
      return;
    }
    if (v9 < 0.0) {
      double v9 = -v9;
    }
    double v18 = v9 + v13;
    if (v7 >= 0.0) {
      double v17 = v7;
    }
    else {
      double v17 = -v7;
    }
    if (v18 < v17 + v12) {
      goto LABEL_22;
    }
  }
}

@end