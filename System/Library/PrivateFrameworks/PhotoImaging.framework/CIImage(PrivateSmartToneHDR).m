@interface CIImage(PrivateSmartToneHDR)
- (id)smartToneHDRStatistics;
@end

@implementation CIImage(PrivateSmartToneHDR)

- (id)smartToneHDRStatistics
{
  v1 = (void *)MEMORY[0x1F4188790](a1);
  v65[2] = *MEMORY[0x1E4F143B8];
  uint64_t v58 = 0;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v53 = 0u;
  v2 = [v1 properties];

  if (!v2) {
    NSLog(&cfstr_WarningSmartto.isa);
  }
  v3 = [v1 properties];
  v4 = [v3 valueForKey:*MEMORY[0x1E4F2F800]];
  v5 = [v4 valueForKey:*MEMORY[0x1E4F2F838]];

  double v6 = 1.0;
  if (v5)
  {
    if ([v5 intValue]) {
      double v6 = 0.6;
    }
    else {
      double v6 = 1.0;
    }
  }
  v52 = v5;
  context = (void *)MEMORY[0x1AD0F8D70]();
  v7 = (void *)MEMORY[0x1E4F1E018];
  v64[0] = *MEMORY[0x1E4F1E248];
  v8 = NSNumber;
  uint64_t v9 = *MEMORY[0x1E4F1E300];
  id v10 = v1;
  v11 = [v8 numberWithInt:v9];
  v64[1] = *MEMORY[0x1E4F1E208];
  v65[0] = v11;
  v65[1] = @"PISmartToneFilterHDR-histogram";
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:2];
  v49 = [v7 contextWithOptions:v12];

  [v10 extent];
  CGRect v68 = CGRectIntegral(v67);
  double x = v68.origin.x;
  double y = v68.origin.y;
  double width = v68.size.width;
  double height = v68.size.height;
  unint64_t v17 = (unint64_t)v68.size.width;
  unint64_t v18 = (unint64_t)v68.size.height;
  unint64_t v19 = 4 * (unint64_t)v68.size.width;
  id v48 = [MEMORY[0x1E4F1CA58] dataWithLength:v19 * (unint64_t)v68.size.height];
  uint64_t v46 = [v48 bytes];
  v62[0] = @"inputRVector";
  v47 = [MEMORY[0x1E4F1E080] vectorWithX:0.333333333 Y:0.333333333 Z:0.333333333 W:0.0];
  v63[0] = v47;
  v62[1] = @"inputGVector";
  v20 = [MEMORY[0x1E4F1E080] vectorWithX:0.166666667 Y:0.166666667 Z:0.166666667 W:0.0];
  v63[1] = v20;
  v62[2] = @"inputBVector";
  v21 = [MEMORY[0x1E4F1E080] vectorWithX:-1.0 Y:-1.0 Z:-1.0 W:0.0];
  v63[2] = v21;
  v62[3] = @"inputAVector";
  v22 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:0.0 W:1.0];
  v63[3] = v22;
  v62[4] = @"inputBiasVector";
  v23 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:0.0 W:0.0];
  v63[4] = v23;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:5];
  v25 = [v10 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v24];

  id v26 = v48;
  uint64_t v27 = [v26 mutableBytes];
  objc_msgSend(v49, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v25, v27, v19, *MEMORY[0x1E4F1E2F0], 0, x, y, width, height);
  bzero(v61, 0x1000uLL);
  if (v18)
  {
    uint64_t v28 = 0;
    double v29 = 1.0 / (double)(v18 * v17);
    v30 = (unsigned __int8 *)(v46 + 2);
    while (1)
    {
      v31 = v30;
      unint64_t v32 = v17;
      if (v17) {
        break;
      }
LABEL_17:
      ++v28;
      v30 += v19;
      if (v28 == v18) {
        goto LABEL_18;
      }
    }
    while (1)
    {
      uint64_t v33 = *v31;
      int v34 = (char)*(v31 - 1);
      v61[*(v31 - 2)] = v29 + v61[*(v31 - 2)];
      if (v34 < 0) {
        break;
      }
      if (v33) {
        goto LABEL_12;
      }
LABEL_13:
      v31 += 4;
      if (!--v32) {
        goto LABEL_17;
      }
    }
    v61[2 * v34] = v29 + v61[2 * v34];
    if (!v33) {
      goto LABEL_13;
    }
LABEL_12:
    v61[v33 + 255] = v29 + v61[v33 + 255];
    goto LABEL_13;
  }
LABEL_18:

  smart_tone_stats_from_histogram((uint64_t)v61, 0x100uLL, 256, (uint64_t)&v53);
  v59[0] = @"tonalRange";
  contexta = [NSNumber numberWithDouble:*(double *)&v53];
  v60[0] = contexta;
  v59[1] = @"highKey";
  v35 = [NSNumber numberWithDouble:*((double *)&v53 + 1)];
  v60[1] = v35;
  v59[2] = @"p02";
  v36 = [NSNumber numberWithDouble:*(double *)&v54];
  v60[2] = v36;
  v59[3] = @"p10";
  v37 = [NSNumber numberWithDouble:*((double *)&v54 + 1)];
  v60[3] = v37;
  v59[4] = @"p25";
  v38 = [NSNumber numberWithDouble:*(double *)&v55];
  v60[4] = v38;
  v59[5] = @"p50";
  v39 = [NSNumber numberWithDouble:*((double *)&v55 + 1)];
  v60[5] = v39;
  v59[6] = @"p98";
  v40 = [NSNumber numberWithDouble:*(double *)&v56];
  v60[6] = v40;
  v59[7] = @"autoValue";
  v41 = [NSNumber numberWithDouble:v6 * *((double *)&v56 + 1)];
  v60[7] = v41;
  v59[8] = @"blackPoint";
  v42 = [NSNumber numberWithDouble:*(double *)&v57];
  v60[8] = v42;
  v59[9] = @"whitePoint";
  v43 = [NSNumber numberWithDouble:*((double *)&v57 + 1)];
  v60[9] = v43;
  v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:10];

  return v44;
}

@end