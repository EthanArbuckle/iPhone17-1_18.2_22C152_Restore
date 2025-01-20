@interface MIWBModuleConfigPlist
- (int)readModuleConfigPlist:(id)a3;
@end

@implementation MIWBModuleConfigPlist

- (int)readModuleConfigPlist:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4
    || ([v4 objectForKeyedSubscript:@"AutoWhiteBalance"],
        (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    int v69 = FigSignalErrorAt();
    goto LABEL_26;
  }
  v7 = v6;
  v8 = [v6 objectForKeyedSubscript:@"CSC"];
  if (!v8)
  {
    FigDebugAssert3();
    int v69 = FigSignalErrorAt();
LABEL_36:

    goto LABEL_26;
  }
  v9 = v8;
  v10 = [v8 objectForKeyedSubscript:@"CCMCoef"];
  if (!v10)
  {
    FigDebugAssert3();
    int v72 = FigSignalErrorAt();
    v73 = v9;
    int v69 = v72;

    goto LABEL_36;
  }
  v11 = v10;
  if ([v10 count] != 9
    || ([v9 objectForKeyedSubscript:@"CSCCoef"],
        (v12 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    v74 = v9;
    int v69 = FigSignalErrorAt();
LABEL_35:

    goto LABEL_36;
  }
  v13 = v12;
  if ([v12 count] != 9)
  {
    FigDebugAssert3();
    v74 = v9;
    int v69 = FigSignalErrorAt();

    goto LABEL_35;
  }
  v80 = v7;
  v77 = v11;
  v78 = v5;
  v14 = self;
  if ([v13 count])
  {
    unint64_t v15 = 0;
    do
    {
      v16 = [v9 objectForKeyedSubscript:@"CCMCoef"];
      v17 = [v16 objectAtIndexedSubscript:v15];
      v18 = v13;
      v19 = (float *)((char *)v14 + 4 * v15);
      v19[2] = (float)(int)[v17 intValue] * 0.00024414;

      v20 = [v9 objectForKeyedSubscript:@"CSCCoef"];
      v21 = [v20 objectAtIndexedSubscript:v15];
      v19[11] = (float)(int)[v21 intValue] * 0.00024414;
      v13 = v18;

      ++v15;
    }
    while ([v18 count] > v15);
  }
  v79 = v14;
  v22 = [v7 objectForKeyedSubscript:@"Histogram"];
  v23 = [v22 objectForKeyedSubscript:@"XToCCT"];

  if ((unint64_t)[v23 count] > 8)
  {
    FigDebugAssert3();
    v75 = v9;
    int v69 = FigSignalErrorAt();

    goto LABEL_25;
  }
  v76 = v13;
  if ([v23 count])
  {
    uint64_t v25 = 0;
    x2CCtLut = v14->x2CCtLut;
    unsigned int v26 = 1;
    do
    {
      v27 = [v23 objectAtIndexedSubscript:v25];
      v28 = [v27 objectForKeyedSubscript:@"X"];

      if (!v28) {
        goto LABEL_27;
      }
      v29 = [v23 objectAtIndexedSubscript:v25];
      v30 = [v29 objectForKeyedSubscript:@"Y"];

      if (!v30) {
        goto LABEL_27;
      }
      v31 = v9;
      v32 = [v23 objectAtIndexedSubscript:v25];
      v33 = [v32 objectForKeyedSubscript:@"CCT"];

      if (!v33) {
        goto LABEL_28;
      }
      v34 = [v23 objectAtIndexedSubscript:v25];
      v35 = [v34 objectForKeyedSubscript:@"X"];
      v36 = x2CCtLut[v25];
      float *v36 = (float)(int)[v35 intValue] * 0.0039062;

      v37 = [v23 objectAtIndexedSubscript:v25];
      v38 = [v37 objectForKeyedSubscript:@"Y"];
      v36[1] = (float)(int)[v38 intValue] * 0.0039062;

      v39 = [v23 objectAtIndexedSubscript:v25];
      v40 = [v39 objectForKeyedSubscript:@"CCT"];
      v36[2] = (float)(int)[v40 intValue];

      uint64_t v25 = v26;
      BOOL v41 = [v23 count] > (unint64_t)v26++;
      v9 = v31;
    }
    while (v41);
  }
  uint64_t v42 = 0;
  v43 = &v79->x2CCtLut[7][2];
  LODWORD(v24) = 1232348160;
  do
  {
    v44 = &v79->xSortedX2cct[v42];
    float *v44 = *(v43 - 2);
    v44[8] = 1000000.0 / *v43;
    v44[16] = 1000000.0 / *v43;
    v44[24] = *(v43 - 2);
    ++v42;
    v43 -= 3;
  }
  while (v42 != 8);
  v45 = objc_msgSend(v80, "objectForKeyedSubscript:", @"CSC", v24);
  v46 = [v45 objectForKeyedSubscript:@"CSCOffset"];
  v47 = [v46 objectAtIndexedSubscript:1];

  if (!v47) {
    goto LABEL_27;
  }
  v48 = [v80 objectForKeyedSubscript:@"CSC"];
  v49 = [v48 objectForKeyedSubscript:@"CSCOffset"];
  v50 = [v49 objectAtIndexedSubscript:2];

  if (!v50)
  {
LABEL_27:
    FigDebugAssert3();
    v71 = v9;
    int v69 = FigSignalErrorAt();

LABEL_29:
    goto LABEL_25;
  }
  v31 = v9;
  v51 = [v80 objectForKeyedSubscript:@"CSC"];
  v52 = [v51 objectForKeyedSubscript:@"CSCOffset"];
  v53 = [v52 objectAtIndexedSubscript:1];
  v79->offset1 = [v53 intValue];

  v54 = [v80 objectForKeyedSubscript:@"CSC"];
  v55 = [v54 objectForKeyedSubscript:@"CSCOffset"];
  v56 = [v55 objectAtIndexedSubscript:2];
  v79->offset2 = [v56 intValue];

  v57 = [v80 objectForKeyedSubscript:@"Histogram"];
  v58 = [v57 objectForKeyedSubscript:@"Config"];
  v59 = [v58 objectForKeyedSubscript:@"C1Scale"];

  if (!v59) {
    goto LABEL_28;
  }
  v60 = [v80 objectForKeyedSubscript:@"Histogram"];
  v61 = [v60 objectForKeyedSubscript:@"Config"];
  v62 = [v61 objectForKeyedSubscript:@"C2Scale"];

  if (!v62)
  {
LABEL_28:
    FigDebugAssert3();
    int v69 = FigSignalErrorAt();

    goto LABEL_29;
  }
  v63 = [v80 objectForKeyedSubscript:@"Histogram"];
  v64 = [v63 objectForKeyedSubscript:@"Config"];
  v65 = [v64 objectForKeyedSubscript:@"C1Scale"];
  v79->scale1 = [v65 intValue];

  v66 = [v80 objectForKeyedSubscript:@"Histogram"];
  v67 = [v66 objectForKeyedSubscript:@"Config"];
  v68 = [v67 objectForKeyedSubscript:@"C2Scale"];
  v79->scale2 = [v68 intValue];

  int v69 = 0;
LABEL_25:
  v5 = v78;
LABEL_26:

  return v69;
}

@end