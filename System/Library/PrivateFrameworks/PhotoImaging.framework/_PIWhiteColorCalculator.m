@interface _PIWhiteColorCalculator
- ($0AD4595100182B9C99B393CDFB23CEAD)_computeWhitePointColorWithGrayEdgesBuffer:(SEL)a3 grayWorldBuffer:(id)a4 greenChannelPercentage:(id)a5 RAWCameraSpaceProperties:(double)a6;
- ($0AD4595100182B9C99B393CDFB23CEAD)_whitePointColorFromGrayEdgesImage:(SEL)a3 grayWorldImage:(id)a4 greenChannelPercentage:(id)a5 RAWCameraSpaceProperties:(double)a6;
- (_PIWhiteColorCalculator)initWithComposition:(id)a3 useSushi:(BOOL)a4;
- (id)_brightnessMultiplierFromImageProperties:(id)a3;
- (void)_computeGreenPercentage:(id)a3;
- (void)_configureRequest:(id)a3;
- (void)_submitGERenderRequest:(id)a3;
- (void)_submitGWRenderRequest:(id)a3;
- (void)calculateColorWithProperties:(id)a3 completion:(id)a4;
- (void)readBufferFromImage:(id)a3 withRGBAfBufferBlock:(id)a4;
@end

@implementation _PIWhiteColorCalculator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_q, 0);
  objc_storeStrong((id *)&self->_imageDataClient, 0);
  objc_storeStrong((id *)&self->_bufferRenderClient, 0);
  objc_storeStrong((id *)&self->_composition, 0);
}

- (void)_submitGERenderRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F7A3B8]) initWithComposition:self->_composition];
  [v5 setName:@"PIWhiteColorCalculator-grayEdges"];
  [(_PIWhiteColorCalculator *)self _configureRequest:v5];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (self->_useSushi)
  {
    v7 = +[PIPipelineFilters rawSourceFilterIncludingOrientation];
    [v6 addObject:v7];

    +[PIPipelineFilters sushiLevel1Filter];
  }
  else
  {
    [MEMORY[0x1E4F7A618] stopAtTagFilter:@"/Master/Source"];
  v8 = };
  [v6 addObject:v8];

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F7A618]) initWithBlock:&__block_literal_global_261_6718];
  [v6 addObject:v9];

  [v5 setPipelineFilters:v6];
  bufferRenderClient = self->_bufferRenderClient;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50___PIWhiteColorCalculator__submitGERenderRequest___block_invoke_2;
  v12[3] = &unk_1E5D81670;
  id v13 = v4;
  id v11 = v4;
  [(NUBufferRenderClient *)bufferRenderClient setCompletionBlock:v12];
  [(NUBufferRenderClient *)self->_bufferRenderClient submitRequest:v5];
  [(NUBufferRenderClient *)self->_bufferRenderClient setCompletionBlock:&__block_literal_global_270];
}

- (void)_submitGWRenderRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F7A3B8]) initWithComposition:self->_composition];
  [v5 setName:@"PIWhiteColorCalculator-grayWorld"];
  [(_PIWhiteColorCalculator *)self _configureRequest:v5];
  bufferRenderClient = self->_bufferRenderClient;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50___PIWhiteColorCalculator__submitGWRenderRequest___block_invoke;
  v8[3] = &unk_1E5D81670;
  id v9 = v4;
  id v7 = v4;
  [(NUBufferRenderClient *)bufferRenderClient setCompletionBlock:v8];
  [(NUBufferRenderClient *)self->_bufferRenderClient submitRequest:v5];
  [(NUBufferRenderClient *)self->_bufferRenderClient setCompletionBlock:&__block_literal_global_6732];
}

- (void)_computeGreenPercentage:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F7A4D8]) initWithComposition:self->_composition dataExtractor:@"CIAreaAverage" options:0];
  [v5 setName:@"PIWhiteColorCalculator-computeGreenPercentage"];
  [(_PIWhiteColorCalculator *)self _configureRequest:v5];
  imageDataClient = self->_imageDataClient;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51___PIWhiteColorCalculator__computeGreenPercentage___block_invoke;
  v8[3] = &unk_1E5D81670;
  id v9 = v4;
  id v7 = v4;
  [(NUImageDataClient *)imageDataClient submitRequest:v5 completion:v8];
}

- (void)_configureRequest:(id)a3
{
  id v10 = a3;
  id v4 = [MEMORY[0x1E4F7A5D8] RGBAh];
  [v10 setPixelFormat:v4];

  v5 = [MEMORY[0x1E4F7A400] genericRGBLinearColorSpace];
  [v10 setColorSpace:v5];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F7A5D0]) initWithTargetPixelCount:0x40000];
  [v10 setScalePolicy:v6];

  [v10 setSampleMode:3];
  objc_msgSend(v10, "setTileSize:", 0x40000, 0x40000);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (self->_useSushi)
  {
    v8 = +[PIPipelineFilters rawSourceFilterIncludingOrientation];
    [v7 addObject:v8];

    +[PIPipelineFilters sushiLevel1Filter];
  }
  else
  {
    [MEMORY[0x1E4F7A618] stopAtTagFilter:@"/Master/Source"];
  id v9 = };
  [v7 addObject:v9];

  [v10 setPipelineFilters:v7];
}

- ($0AD4595100182B9C99B393CDFB23CEAD)_whitePointColorFromGrayEdgesImage:(SEL)a3 grayWorldImage:(id)a4 greenChannelPercentage:(id)a5 RAWCameraSpaceProperties:(double)a6
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x6810000000;
  v29 = &unk_1A984BDE3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v34 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __125___PIWhiteColorCalculator__whitePointColorFromGrayEdgesImage_grayWorldImage_greenChannelPercentage_RAWCameraSpaceProperties___block_invoke;
  v21[3] = &unk_1E5D7F4F8;
  v21[4] = self;
  id v15 = v13;
  id v22 = v15;
  v24 = &v26;
  double v25 = a6;
  id v16 = v14;
  id v23 = v16;
  [(_PIWhiteColorCalculator *)self readBufferFromImage:v12 withRGBAfBufferBlock:v21];
  v17 = v27;
  long long v18 = *((_OWORD *)v27 + 5);
  *(_OWORD *)retstr->var1.var0 = *((_OWORD *)v27 + 4);
  *(_OWORD *)&retstr->var1.var0[2] = v18;
  *(void *)&retstr->var2 = v17[12];
  long long v19 = *((_OWORD *)v17 + 3);
  *(_OWORD *)retstr->var0.var0 = *((_OWORD *)v17 + 2);
  *(_OWORD *)&retstr->var0.var0[2] = v19;

  _Block_object_dispose(&v26, 8);
  return result;
}

- ($0AD4595100182B9C99B393CDFB23CEAD)_computeWhitePointColorWithGrayEdgesBuffer:(SEL)a3 grayWorldBuffer:(id)a4 greenChannelPercentage:(id)a5 RAWCameraSpaceProperties:(double)a6
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  *(_OWORD *)retstr->var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var0[2] = 0u;
  *(_OWORD *)retstr->var1.var0 = 0u;
  *(_OWORD *)&retstr->var1.var0[2] = 0u;
  retstr->var2 = 0.0;
  uint64_t v14 = [v11 rowBytes];
  uint64_t v15 = [v12 rowBytes];
  if (v13)
  {
    [v13 whiteValue];
    double v17 = v16;
    [v13 whiteFactor];
    double v19 = 65535.0;
    if (v17 != 0.0 && v18 != 0.0) {
      double v19 = 65535.0 / (v17 * v18);
    }
    float v20 = 0.800000012 / v19;
  }
  else
  {
    float v20 = 0.98039;
  }
  uint64_t v21 = [v12 bytes];
  uint64_t v22 = [v11 bytes];
  id v86 = v11;
  uint64_t v23 = [v11 size];
  uint64_t v25 = v24;
  [v12 size];
  char v26 = NUPixelSizeEqualToSize();
  uint64_t v27 = *MEMORY[0x1E4F7A750];
  if (v26)
  {
    id v84 = v12;
    if (v27 != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_303);
    }
    float v28 = flt_1A980B320[v13 == 0];
    v29 = (void *)*MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
    {
      v79 = v29;
      v80 = NSStringFromNUPixelSize();
      *(_DWORD *)buf = 138413314;
      uint64_t v81 = 0x3FA99999A0000000;
      *(void *)v88 = v80;
      if (!v13) {
        uint64_t v81 = 0x3FA4141420000000;
      }
      *(_WORD *)&v88[8] = 2048;
      double v89 = *(double *)&v14;
      __int16 v90 = 2048;
      double v91 = v28;
      __int16 v92 = 2048;
      double v93 = v20;
      __int16 v94 = 2048;
      double v95 = *(double *)&v81;
      _os_log_debug_impl(&dword_1A9680000, v79, OS_LOG_TYPE_DEBUG, "Buffer size is %@, bytes per row is %ld, dark_thr=%f, sat_thr=%f, noise_thr=%f", buf, 0x34u);
    }
    if (v25 < 1)
    {
      int v31 = 0;
      int v30 = 0;
      double v37 = 0.0;
      double v36 = 0.0;
      double v35 = 0.0;
      double v34 = 0.0;
      double v33 = 0.0;
      double v32 = 0.0;
    }
    else
    {
      int v30 = 0;
      int v31 = 0;
      double v32 = 0.0;
      double v33 = 0.0;
      double v34 = 0.0;
      double v35 = 0.0;
      double v36 = 0.0;
      double v37 = 0.0;
      do
      {
        if (v23 >= 1)
        {
          uint64_t v38 = 0;
          unint64_t v39 = v23 + 1;
          do
          {
            float v40 = *(float *)(v21 + v38);
            float v41 = *(float *)(v21 + v38 + 4);
            float v42 = *(float *)(v21 + v38 + 8);
            BOOL v45 = (float)((float)((float)(v41 + v40) + v42) / 3.0) > v28 && v40 < v20 && v41 < v20 && v42 < v20;
            if (v45 && ((double v46 = v41, v47 = v40, v48 = v42, v46 * a6 < v47) || v46 * a6 < v48))
            {
              double v34 = v34 + v47;
              double v33 = v33 + v46;
              double v32 = v32 + v48;
              ++v31;
              int v49 = 1;
            }
            else
            {
              int v49 = 0;
            }
            float v51 = *(float *)(v22 + v38);
            float v50 = *(float *)(v22 + v38 + 4);
            float v52 = *(float *)(v22 + v38 + 8);
            float v53 = (float)((float)(v50 + v51) + v52) / 3.0;
            if (v53 > flt_1A980B340[v13 == 0] && v53 < (float)(v20 * v20))
            {
              double v55 = v50 * a6;
              if (v55 < v51 || v55 < v52)
              {
                if (v49)
                {
                  double v37 = v37 + sqrtf(fabsf(v51));
                  double v36 = v36 + sqrtf(fabsf(v50));
                  double v35 = v35 + sqrtf(fabsf(v52));
                  ++v30;
                }
              }
            }
            --v39;
            v38 += 16;
          }
          while (v39 > 1);
        }
        v21 += v15;
        v22 += v14;
      }
      while (v25-- > 1);
    }
    double v59 = v35;
    v60 = (void *)MEMORY[0x1E4F7A750];
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_303);
    }
    v57 = v86;
    v61 = (os_log_t *)MEMORY[0x1E4F7A758];
    v62 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v88 = v31;
      *(_WORD *)&v88[4] = 1024;
      *(_DWORD *)&v88[6] = v30;
      _os_log_debug_impl(&dword_1A9680000, v62, OS_LOG_TYPE_DEBUG, "all done summing, np_gw is %d, np_ge is %d", buf, 0xEu);
    }
    double v63 = 1.0;
    double v64 = 1.0;
    double v65 = 1.0;
    double v66 = 1.0;
    if (v31 >= 1)
    {
      double v64 = v34 / (double)v31;
      double v65 = v33 / (double)v31;
      double v66 = v32 / (double)v31;
    }
    double v67 = v64 + v65 + v66;
    double v68 = v64 / v67;
    double v69 = v65 / v67;
    double v70 = 1.0;
    double v71 = 1.0;
    double v72 = v66 / v67;
    if (v30 >= 1)
    {
      double v63 = v37 / (double)v30;
      double v70 = v36 / (double)v30;
      double v71 = v59 / (double)v30;
    }
    double v73 = v63 + v70 + v71;
    double v74 = v63 / v73;
    double v75 = v70 / v73;
    double v76 = v71 / v73;
    retstr->var0.var0[0] = v63 / v73;
    retstr->var0.var0[1] = v70 / v73;
    retstr->var0.var0[2] = v71 / v73;
    retstr->var0.var0[3] = 1.0;
    retstr->var1.var0[0] = v68;
    retstr->var1.var0[1] = v69;
    retstr->var1.var0[2] = v72;
    retstr->var1.var0[3] = 1.0;
    id v12 = v84;
    if (*v60 != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_303);
    }
    v77 = *v61;
    if (os_log_type_enabled(*v61, OS_LOG_TYPE_DEBUG))
    {
      v82 = @"YES";
      BOOL useSushi = self->_useSushi;
      *(_DWORD *)buf = 134220034;
      if (!useSushi) {
        v82 = @"NO";
      }
      *(double *)v88 = v74;
      *(_WORD *)&v88[8] = 2048;
      double v89 = v75;
      __int16 v90 = 2048;
      double v91 = v76;
      __int16 v92 = 2048;
      double v93 = 1.0;
      __int16 v94 = 2048;
      double v95 = v68;
      __int16 v96 = 2048;
      double v97 = v69;
      __int16 v98 = 2048;
      double v99 = v72;
      __int16 v100 = 2048;
      uint64_t v101 = 0x3FF0000000000000;
      __int16 v102 = 2112;
      v103 = v82;
      _os_log_debug_impl(&dword_1A9680000, v77, OS_LOG_TYPE_DEBUG, "wp_ge {%f, %f, %f, %f} wp_gw {%f, %f, %f, %f}, Sushi? %@", buf, 0x5Cu);
    }
  }
  else
  {
    if (v27 != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_303);
    }
    v57 = v86;
    v58 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)v88 = v86;
      *(_WORD *)&v88[8] = 2114;
      double v89 = *(double *)&v12;
      _os_log_impl(&dword_1A9680000, v58, OS_LOG_TYPE_INFO, "Buffer sizes are not the same: %{public}@ vs %{public}@", buf, 0x16u);
    }
    retstr->var2 = 0.0;
    *(_OWORD *)retstr->var1.var0 = 0u;
    *(_OWORD *)&retstr->var1.var0[2] = 0u;
    *(_OWORD *)retstr->var0.var0 = 0u;
    *(_OWORD *)&retstr->var0.var0[2] = 0u;
  }

  return result;
}

- (id)_brightnessMultiplierFromImageProperties:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 metadata];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F2F800]];

  char v6 = flashFired(v5);
  id v7 = apertureValue(v5);
  v8 = shutterSpeedValue(v5);
  id v9 = isoValue(v5);
  if (v9) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10 || v7 == 0) {
    goto LABEL_15;
  }
  [v7 doubleValue];
  if (v12 <= 0.0) {
    goto LABEL_15;
  }
  if (self->_useSushi)
  {
    if ((v6 & 1) == 0)
    {
      id v13 = NSNumber;
      [v7 doubleValue];
      double v15 = v14;
      [v7 doubleValue];
      double v17 = v15 * v16;
      [v8 doubleValue];
      double v19 = log2(v17 / v18);
      [v9 doubleValue];
      double v21 = v19 - log2(v20 * 0.319999993);
      if (v21 < 0.0) {
        double v21 = 0.0;
      }
      goto LABEL_24;
    }
LABEL_15:
    uint64_t v22 = 0;
    goto LABEL_16;
  }
  if (v6) {
    goto LABEL_15;
  }
  id v13 = NSNumber;
  [v7 doubleValue];
  double v26 = v25;
  [v7 doubleValue];
  double v28 = v26 * v27;
  [v9 doubleValue];
  double v30 = v29;
  [v8 doubleValue];
  double v21 = v28 / (v30 * v31);
LABEL_24:
  uint64_t v22 = [v13 numberWithDouble:v21];
LABEL_16:
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_303);
  }
  uint64_t v23 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEBUG))
  {
    int v32 = 138412802;
    double v33 = v7;
    __int16 v34 = 2112;
    double v35 = v8;
    __int16 v36 = 2112;
    double v37 = v9;
    _os_log_debug_impl(&dword_1A9680000, v23, OS_LOG_TYPE_DEBUG, "aperture=%@, shutterSpeed=%@, iso=%@", (uint8_t *)&v32, 0x20u);
  }

  return v22;
}

- (void)calculateColorWithProperties:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__6630;
  v36[4] = __Block_byref_object_dispose__6631;
  id v37 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v35[3] = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__6630;
  v33[4] = __Block_byref_object_dispose__6631;
  id v34 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__6630;
  v31[4] = __Block_byref_object_dispose__6631;
  id v32 = 0;
  v8 = [(_PIWhiteColorCalculator *)self _brightnessMultiplierFromImageProperties:v6];
  [MEMORY[0x1E4F7A648] begin];
  if (v8)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __67___PIWhiteColorCalculator_calculateColorWithProperties_completion___block_invoke;
    v27[3] = &unk_1E5D80D18;
    double v29 = v36;
    id v28 = v8;
    double v30 = v35;
    [(_PIWhiteColorCalculator *)self _computeGreenPercentage:v27];
  }
  BOOL useSushi = self->_useSushi;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __67___PIWhiteColorCalculator_calculateColorWithProperties_completion___block_invoke_2;
  v26[3] = &unk_1E5D7FDF8;
  v26[4] = v33;
  v26[5] = v36;
  [(_PIWhiteColorCalculator *)self _submitGERenderRequest:v26];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __67___PIWhiteColorCalculator_calculateColorWithProperties_completion___block_invoke_3;
  v25[3] = &unk_1E5D7FDF8;
  v25[4] = v31;
  v25[5] = v36;
  [(_PIWhiteColorCalculator *)self _submitGWRenderRequest:v25];
  BOOL v10 = (void *)MEMORY[0x1E4F7A648];
  q = self->_q;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67___PIWhiteColorCalculator_calculateColorWithProperties_completion___block_invoke_4;
  v15[3] = &unk_1E5D7F4D0;
  double v20 = v36;
  id v12 = v8;
  id v16 = v12;
  double v21 = v35;
  BOOL v24 = useSushi;
  id v13 = v6;
  id v17 = v13;
  double v18 = self;
  uint64_t v22 = v33;
  uint64_t v23 = v31;
  id v14 = v7;
  id v19 = v14;
  [v10 commitAndNotifyOnQueue:q withBlock:v15];

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v36, 8);
}

- (void)readBufferFromImage:(id)a3 withRGBAfBufferBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 validRegion];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68___PIWhiteColorCalculator_readBufferFromImage_withRGBAfBufferBlock___block_invoke;
  v9[3] = &unk_1E5D7F4A8;
  id v10 = v5;
  id v8 = v5;
  [v6 readBufferRegion:v7 withBlock:v9];
}

- (_PIWhiteColorCalculator)initWithComposition:(id)a3 useSushi:(BOOL)a4
{
  id v6 = (NUComposition *)a3;
  v17.receiver = self;
  v17.super_class = (Class)_PIWhiteColorCalculator;
  id v7 = [(_PIWhiteColorCalculator *)&v17 init];
  composition = v7->_composition;
  v7->_composition = v6;
  id v9 = v6;

  v7->_BOOL useSushi = a4;
  dispatch_queue_t v10 = dispatch_queue_create("PIWhiteBalanceAutoCalculator", 0);
  q = v7->_q;
  v7->_q = (OS_dispatch_queue *)v10;

  uint64_t v12 = [objc_alloc(MEMORY[0x1E4F7A3B0]) initWithName:@"PIWhiteBalanceAutoCalculator" responseQueue:v7->_q];
  bufferRenderClient = v7->_bufferRenderClient;
  v7->_bufferRenderClient = (NUBufferRenderClient *)v12;

  uint64_t v14 = [objc_alloc(MEMORY[0x1E4F7A4D0]) initWithName:@"PIWhiteBalanceAutoCalculator" responseQueue:v7->_q];
  imageDataClient = v7->_imageDataClient;
  v7->_imageDataClient = (NUImageDataClient *)v14;

  return v7;
}

@end