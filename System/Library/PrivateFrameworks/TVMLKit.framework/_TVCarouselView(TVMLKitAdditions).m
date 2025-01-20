@interface _TVCarouselView(TVMLKitAdditions)
- (id)rowMetricsForExpectedWidth:()TVMLKitAdditions firstItemRowIndex:;
@end

@implementation _TVCarouselView(TVMLKitAdditions)

- (id)rowMetricsForExpectedWidth:()TVMLKitAdditions firstItemRowIndex:
{
  v53[1] = *MEMORY[0x263EF8340];
  objc_msgSend(a1, "tv_padding");
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [a1 itemSize];
  unint64_t v42 = v13;
  objc_msgSend(a1, "tv_focusMargin");
  double v15 = v14;
  objc_msgSend(a1, "tv_focusMargin");
  uint64_t v17 = v16;
  v18 = [a1 headerView];

  float64x2_t v19 = (float64x2_t)v42;
  if (v18)
  {
    float64x2_t v41 = (float64x2_t)v42;
    v20 = [a1 headerView];
    objc_msgSend(v20, "tv_margin");
    double v40 = v21;
    double v23 = v22;
    double v25 = v24;
    uint64_t v43 = v17;
    double v27 = v26;

    if (a2 - (v10 + v23 + v12 + v27) >= 2.22044605e-16) {
      double v28 = a2 - (v10 + v23 + v12 + v27);
    }
    else {
      double v28 = a2;
    }
    v29 = [a1 headerView];
    objc_msgSend(v29, "tv_sizeThatFits:", v28, 0.0);
    double v31 = v30;

    v32 = [a1 headerView];
    objc_msgSend(v32, "tv_alignmentInsetsForExpectedWidth:", v28);
    double v34 = v33;

    float64x2_t v19 = vaddq_f64(v41, (float64x2_t)vdupq_lane_s64(COERCE__INT64(v25 + v8 + v40 + v31), 0));
    double v35 = v8 + v40 + v34;
    uint64_t v17 = v43;
    double v36 = fmax(fmax(v15 - v25, 0.0) - (v8 + v40), 0.0);
    if (v15 > 0.0) {
      double v15 = v36;
    }
  }
  else
  {
    double v35 = 0.0;
  }
  *a4 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v44 = 0;
  float64x2_t v45 = v19;
  uint64_t v46 = 0;
  double v47 = v35;
  uint64_t v48 = 0;
  double v49 = v35;
  uint64_t v50 = 0;
  double v51 = v15;
  uint64_t v52 = v17;
  v37 = objc_msgSend(MEMORY[0x263F08D40], "tv_valueWithRowMetrics:", &v44);
  v53[0] = v37;
  v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:1];

  return v38;
}

@end