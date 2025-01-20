@interface CIImage(PrivateLocalLightHDR)
- (id)localLightHDRStatisticsNoProxy;
@end

@implementation CIImage(PrivateLocalLightHDR)

- (id)localLightHDRStatisticsNoProxy
{
  v1 = (void *)MEMORY[0x1F4188790](a1);
  v65[256] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1E018];
  uint64_t v3 = *MEMORY[0x1E4F1E208];
  v63[0] = *MEMORY[0x1E4F1E1E0];
  v63[1] = v3;
  v64[0] = MEMORY[0x1E4F1CC28];
  v64[1] = @"PILocalLightHDR-stats";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:2];
  v5 = [v2 contextWithOptions:v4];

  id v6 = v1;
  id v7 = v5;
  [v6 extent];
  CGRect v68 = CGRectIntegral(v67);
  double x = v68.origin.x;
  double y = v68.origin.y;
  double width = v68.size.width;
  double height = v68.size.height;
  [v6 extent];
  unint64_t v13 = (unint64_t)v12;
  [v6 extent];
  unint64_t v15 = (unint64_t)v14;
  uint64_t v16 = 4 * v13;
  id v17 = [MEMORY[0x1E4F1CA58] dataWithLength:4 * v13 * (unint64_t)v14];
  uint64_t v18 = [v17 bytes];
  id v50 = v17;
  uint64_t v19 = [v50 mutableBytes];
  v51 = v6;
  v52 = v7;
  objc_msgSend(v7, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v6, v19, 4 * v13, *MEMORY[0x1E4F1E2F0], 0, x, y, width, height);
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  LODWORD(v22) = 0;
  unint64_t v23 = vcvtas_u32_f32((float)v15 / 31.0);
  unint64_t v58 = v13 - 1;
  unint64_t v59 = vcvtas_u32_f32((float)v13 / 31.0);
  uint64_t v24 = v18 + 2;
  uint64_t v53 = 4 * v13 * v23;
  unint64_t v54 = v23;
  do
  {
    uint64_t v25 = 0;
    uint64_t v56 = v21;
    uint64_t v57 = v20;
    unint64_t v26 = v21 * v23;
    if (v21 * v23 + v23 <= v15 - 1) {
      unint64_t v27 = v21 * v23 + v23;
    }
    else {
      unint64_t v27 = v15;
    }
    uint64_t v22 = (int)v22;
    uint64_t v28 = v27 + v20;
    uint64_t v55 = v24;
    do
    {
      unint64_t v29 = v25 * v59;
      bzero(v65, 0x800uLL);
      unint64_t v33 = v25 * v59 + v59;
      if (v33 >= v58) {
        unint64_t v33 = v58;
      }
      if (v33 > v29)
      {
        v34 = (unsigned char *)v24;
        do
        {
          v35 = v34;
          uint64_t v36 = v28;
          if (v27 > v26)
          {
            do
            {
              LOBYTE(v30) = *(v35 - 2);
              LOBYTE(v31) = *(v35 - 1);
              double v31 = (double)*(unint64_t *)&v31 / 255.0;
              LOBYTE(v32) = *v35;
              double v32 = (double)*(unint64_t *)&v32 / 255.0;
              unsigned int v37 = llround(((double)*(unint64_t *)&v30 / 255.0 + v31 + v32) / 3.0 * 255.0);
              double v30 = 1.0 / (double)(v33 * v27) + *(double *)&v65[v37];
              *(double *)&v65[v37] = v30;
              v35 += v16;
              --v36;
            }
            while (v36);
          }
          ++v29;
          v34 += 4;
        }
        while (v29 != v33);
      }
      area_light_stats_from_histogram((uint64_t)v65, (uint64_t)&v62[80 * v22++]);
      ++v25;
      v24 += 4 * v59;
    }
    while (v25 != 31);
    uint64_t v21 = v56 + 1;
    unint64_t v23 = v54;
    uint64_t v20 = v57 - v54;
    uint64_t v24 = v55 + v53;
  }
  while (v56 != 30);

  uint64_t v38 = 961;
  v39 = arealight_coeffs_from_stats((uint64_t)v62, 961);
  uint64_t v40 = average_light_coeffs_from_stats((uint64_t)v62, 0x3C1uLL);
  v41 = (void *)v40;
  double v42 = 0.0;
  uint64_t v43 = 56;
  double v44 = 0.0;
  do
  {
    double v45 = *(double *)&v62[v43];
    if (v45 > v44) {
      double v44 = *(double *)&v62[v43];
    }
    double v42 = v42 + v45;
    v43 += 80;
    --v38;
  }
  while (v38);
  if (v44 + v42 / -961.0 <= 0.5) {
    double v46 = v44;
  }
  else {
    double v46 = v44 * 0.45;
  }
  v60[0] = @"lightMap";
  v60[1] = @"lightMapWidth";
  v61[0] = v39;
  v61[1] = &unk_1F0009C68;
  v60[2] = @"lightMapHeight";
  v60[3] = @"lightMapAvg";
  v61[2] = &unk_1F0009C68;
  v61[3] = v40;
  v60[4] = @"localAutoValue";
  if (fabs(v46) < 1.0e-10) {
    double v46 = 0.0;
  }
  v47 = [NSNumber numberWithDouble:v46];
  v61[4] = v47;
  v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:5];

  return v48;
}

@end