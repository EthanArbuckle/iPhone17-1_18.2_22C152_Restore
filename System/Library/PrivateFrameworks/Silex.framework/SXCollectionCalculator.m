@interface SXCollectionCalculator
+ (id)layoutWithCollectionDisplay:(id)a3 width:(double)a4 numberOfComponents:(unint64_t)a5 unitConverter:(id)a6;
@end

@implementation SXCollectionCalculator

+ (id)layoutWithCollectionDisplay:(id)a3 width:(double)a4 numberOfComponents:(unint64_t)a5 unitConverter:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  uint64_t v11 = [v9 gutter];
  objc_msgSend(v10, "convertValueToPoints:", v11, v12);
  double v14 = v13;
  uint64_t v15 = [v9 minimumWidth];
  objc_msgSend(v10, "convertValueToPoints:", v15, v16);
  if (v17 >= a4) {
    double v17 = a4;
  }
  if (v14 > a4) {
    double v17 = a4;
  }
  if (v17 >= 40.0) {
    double v18 = v17;
  }
  else {
    double v18 = 40.0;
  }
  uint64_t v19 = [v9 maximumWidth];
  objc_msgSend(v10, "convertValueToPoints:", v19, v20);
  unint64_t v22 = 0;
  if (v21 == 0.0) {
    double v21 = a4;
  }
  if (v21 >= v18) {
    double v23 = v21;
  }
  else {
    double v23 = v18;
  }
  do
    unint64_t v24 = v22++;
  while (v22 <= a5 && (a4 - v14 * (double)v24) / (double)v22 > v18);
  if (v24 <= 1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24;
  }
  uint64_t v26 = [v9 widows];
  if (v25 >= a5 || v26)
  {
    if ([v9 widows] != 1) {
      goto LABEL_26;
    }
    while (a5 % v25--)
      ;
    goto LABEL_25;
  }
  if ((a5 & 1) == 0)
  {
    while (a5 % v25--)
      ;
LABEL_25:
    ++v25;
    goto LABEL_26;
  }
  if (v25 + a5 / v25 * v25 - a5 >= 2)
  {
    if (v24 <= 1) {
      uint64_t v60 = 1;
    }
    else {
      uint64_t v60 = v24;
    }
    unint64_t v61 = v60 - 1;
    do
    {
      unint64_t v62 = --v25 + a5 / v61 * v61 - a5;
      BOOL v37 = v61-- != 0;
      char v63 = v37;
    }
    while (v62 >= 2 && (v63 & 1) != 0);
    unint64_t v25 = v61 + 1;
  }
LABEL_26:
  objc_msgSend(v10, "convertValueToPoints:", 0x4069000000000000, 2);
  double v65 = v29;
  uint64_t v30 = [v9 rowSpacing];
  v66 = v10;
  objc_msgSend(v10, "convertValueToPoints:", v30, v31);
  double v64 = v32;
  unint64_t v33 = vcvtpd_u64_f64((double)a5 / (double)v25);
  int v34 = [v9 variableSizing];
  v35 = [MEMORY[0x263EFF980] array];
  if (v33)
  {
    while (1)
    {
      unint64_t v36 = a5;
      BOOL v37 = a5 >= v25;
      a5 -= v25;
      if (v37) {
        unint64_t v38 = v25;
      }
      else {
        unint64_t v38 = v36;
      }
      if (v34) {
        unint64_t v39 = v38;
      }
      else {
        unint64_t v39 = v25;
      }
      double v40 = (double)v38;
      unint64_t v41 = v39 - 1;
      double v42 = (double)v25;
      if (v34) {
        double v42 = (double)v38;
      }
      double v43 = a4 - v14 * (double)v41;
      if (v43 / v42 >= v23) {
        double v44 = v23;
      }
      else {
        double v44 = v43 / v42;
      }
      uint64_t v45 = [v9 distribution];
      double v46 = floor(v44);
      if (v45 || (v14 == 0.0 ? (BOOL v47 = v44 < v23) : (BOOL v47 = 0), !v47)) {
        double v44 = v46;
      }
      if (v34) {
        double v48 = v43 - v44 * v40;
      }
      else {
        double v48 = v43 - v44 * v40 + (double)(v25 - v38) * v14;
      }
      double v49 = 0.0;
      if ([v9 distribution] == 1)
      {
        if ([v9 alignment] == 1)
        {
          double v50 = floor(v48 * 0.5);
          double v49 = ceil(v48 * 0.5);
        }
        else
        {
          double v50 = v48;
          if ([v9 alignment] != 2)
          {
            double v50 = 0.0;
            if ([v9 alignment]) {
              double v49 = 0.0;
            }
            else {
              double v49 = v48;
            }
          }
        }
      }
      else
      {
        double v50 = 0.0;
      }
      unint64_t v51 = v38 - 1;
      if (v38 <= 1) {
        double v52 = 0.0;
      }
      else {
        double v52 = v14 + (v48 - (v50 + v49)) / (double)v51;
      }
      float v53 = v52;
      double v54 = -((float)(floorf(v53) * (float)v51) - v52 * (double)(v38 - 1));
      if (v54 <= 0.00000011920929) {
        goto LABEL_59;
      }
      uint64_t v55 = [v9 distribution];
      if (!v55) {
        goto LABEL_58;
      }
      if (v55 == 1) {
        break;
      }
LABEL_59:
      v56 = objc_alloc_init(SXCollectionRowLayout);
      [(SXCollectionRowLayout *)v56 setIntendedComponentsPerRow:v25];
      [(SXCollectionRowLayout *)v56 setComponentsPerRow:v38];
      [(SXCollectionRowLayout *)v56 setLeftMargin:v50];
      [(SXCollectionRowLayout *)v56 setRightMargin:v49];
      [(SXCollectionRowLayout *)v56 setComponentWidth:v44];
      [(SXCollectionRowLayout *)v56 setSpaceBetweenComponents:floor(v52)];
      [v35 addObject:v56];

      if (!--v33) {
        goto LABEL_70;
      }
    }
    if ([v9 alignment] != 1)
    {
      if ([v9 alignment] == 2)
      {
        double v50 = v54;
      }
      else if (![v9 alignment])
      {
        double v49 = v54;
      }
      goto LABEL_59;
    }
LABEL_58:
    double v50 = floor(v54 * 0.5);
    double v49 = ceil(v54 * 0.5);
    goto LABEL_59;
  }
LABEL_70:
  if (v64 >= v65) {
    double v57 = v65;
  }
  else {
    double v57 = v64;
  }
  v58 = objc_alloc_init(SXCollectionLayout);
  [(SXCollectionLayout *)v58 setSpaceBetweenRows:v57];
  [(SXCollectionLayout *)v58 setRowsLayouts:v35];

  return v58;
}

@end