@interface CIImage(PrivateSmartColorHDR)
- (id)smartColorHDRStatistics;
@end

@implementation CIImage(PrivateSmartColorHDR)

- (id)smartColorHDRStatistics
{
  v1 = (void *)MEMORY[0x1F4188790](a1);
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v2 = v1;
  context = (void *)MEMORY[0x1AD0F8D70]();
  v3 = (void *)MEMORY[0x1E4F1E018];
  v85[0] = *MEMORY[0x1E4F1E248];
  v4 = [NSNumber numberWithInt:*MEMORY[0x1E4F1E300]];
  v85[1] = *MEMORY[0x1E4F1E208];
  v86[0] = v4;
  v86[1] = @"PISmartColorHDR-sat-histogram";
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:2];
  v6 = [v3 contextWithOptions:v5];

  [v2 extent];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  unint64_t v15 = (unint64_t)v11;
  unint64_t v16 = (unint64_t)v13;
  unint64_t v17 = 4 * (unint64_t)v11;
  id v18 = [MEMORY[0x1E4F1CA58] dataWithLength:v17 * (unint64_t)v13];
  uint64_t v19 = [v18 bytes];
  id v75 = v18;
  uint64_t v20 = [v75 mutableBytes];
  uint64_t v21 = *MEMORY[0x1E4F1E2F0];
  id v76 = v6;
  id v78 = v2;
  objc_msgSend(v6, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v2, v20, v17, v21, 0, v8, v10, v12, v14);
  bzero(v82, 0x400uLL);
  bzero(v81, 0x400uLL);
  v74[1] = v74;
  bzero(v88, 0x400uLL);
  bzero(v87, 0x400uLL);
  bzero(v84, 0x400uLL);
  bzero(v83, 0x400uLL);
  if (v16)
  {
    uint64_t v25 = 0;
    float v26 = 1.0 / (float)(v16 * v15);
    v27 = (unsigned char *)(v19 + 2);
    do
    {
      v28 = v27;
      for (unint64_t i = v15; i; --i)
      {
        LOBYTE(v22) = *(v28 - 2);
        LOBYTE(v23) = *(v28 - 1);
        double v30 = (double)*(unint64_t *)&v22 / 255.0;
        double v31 = (double)*(unint64_t *)&v23 / 255.0;
        LOBYTE(v24) = *v28;
        double v32 = (double)*(unint64_t *)&v24 / 255.0;
        double v33 = (v30 + v31 + v32) / 3.0;
        double v22 = v30 * 255.0;
        unsigned int v34 = llround(v22);
        double v23 = v31 * 255.0;
        unsigned int v35 = llround(v23);
        *(float *)&double v23 = v26 + *(float *)&v87[4 * v35];
        unsigned int v36 = llround(v32 * 255.0);
        *(float *)&v88[4 * v34] = v26 + *(float *)&v88[4 * v34];
        *(float *)&double v22 = v26 + v84[v36];
        double v24 = v33 * 255.0;
        *(_DWORD *)&v87[4 * v35] = LODWORD(v23);
        unsigned int v37 = llround(v33 * 255.0);
        *(float *)&double v23 = v83[v37];
        v84[v36] = *(float *)&v22;
        *(float *)&double v22 = v26 + *(float *)&v23;
        v83[v37] = v26 + *(float *)&v23;
        v28 += 4;
      }
      ++v25;
      v27 += v17;
    }
    while (v25 != v16);
  }
  uint64_t v38 = 0;
  __asm { FMOV            V1.4S, #1.0 }
  do
  {
    float32x4_t v44 = *(float32x4_t *)&v83[v38];
    float32x4_t v45 = vabdq_f32(*(float32x4_t *)&v88[v38 * 4], v44);
    float32x4_t v46 = vabdq_f32(*(float32x4_t *)&v87[v38 * 4], v44);
    float32x4_t v47 = vabdq_f32(*(float32x4_t *)&v84[v38], v44);
    *(float32x4_t *)&v82[v38 * 4] = vminnmq_f32(vmaxnmq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vaddq_f64(vaddq_f64(vcvtq_f64_f32(*(float32x2_t *)v45.f32), vcvtq_f64_f32(*(float32x2_t *)v46.f32)), vcvtq_f64_f32(*(float32x2_t *)v47.f32))), vaddq_f64(vaddq_f64(vcvt_hight_f64_f32(v45), vcvt_hight_f64_f32(v46)), vcvt_hight_f64_f32(v47))), (float32x4_t)0), _Q1);
    *(float32x4_t *)&v81[v38 * 4] = v46;
    v38 += 4;
  }
  while (v38 != 256);

  uint64_t v48 = 0;
  int v49 = 71362;
  int v50 = 71362;
  do
  {
    *(float *)&int v50 = *(float *)&v50 + *(float *)&v82[v48];
    *(float *)&int v49 = *(float *)&v49 + *(float *)&v81[v48];
    v48 += 4;
  }
  while (v48 != 1024);
  uint64_t v51 = 0;
  float v52 = 0.0;
  float v53 = 0.0;
  do
  {
    float v53 = v53 + *(float *)&v82[v51];
    *(float *)&v88[v51] = v53 / *(float *)&v50;
    float v52 = v52 + *(float *)&v81[v51];
    *(float *)&v87[v51] = v52 / *(float *)&v49;
    v51 += 4;
  }
  while (v51 != 1024);
  unint64_t v54 = 0;
  float v55 = 0.0;
  float v56 = 0.0;
  do
  {
    float v57 = *(float *)&v88[4 * v54];
    if (v57 >= 0.75 && v55 == 0.0) {
      float v55 = (float)v54 / 255.0;
    }
    if (v57 >= 0.98 && v56 == 0.0) {
      float v56 = (float)v54 / 255.0;
    }
    ++v54;
  }
  while (v54 != 256);
  uint64_t v58 = 0;
  float v59 = 0.0;
  do
  {
    if (*(float *)&v87[4 * v58] >= 0.98 && v59 == 0.0) {
      float v59 = (float)(int)v58 / 255.0;
    }
    ++v58;
  }
  while (v58 != 256);
  float v60 = 1.0;
  float v61 = fmaxf(fminf(1.0 - v56, 1.0), 0.0);
  BOOL v62 = v55 >= 0.9 || v56 < 0.99;
  float v63 = vabds_f32(0.5, v55);
  if (!v62) {
    float v61 = v63;
  }
  if (v59 >= v56) {
    float v60 = 2.0;
  }
  float v64 = fminf(v61 * v60, 0.2);
  v79[0] = @"satPercentile75";
  v65 = objc_msgSend(NSNumber, "numberWithFloat:");
  v80[0] = v65;
  v79[1] = @"satPercentile98";
  *(float *)&double v66 = v56;
  v67 = [NSNumber numberWithFloat:v66];
  v80[1] = v67;
  v79[2] = @"satPercentileG98";
  *(float *)&double v68 = v59;
  v69 = [NSNumber numberWithFloat:v68];
  v80[2] = v69;
  v79[3] = @"satAutoValue";
  *(float *)&double v70 = v64;
  v71 = [NSNumber numberWithFloat:v70];
  v80[3] = v71;
  v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:4];

  return v72;
}

@end