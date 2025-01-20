@interface PITempTintFilter
+ (id)customAttributes;
- (CIImage)inputImage;
- (double)inputTemperature;
- (double)inputTint;
- (id)outputImage;
- (void)setInputImage:(id)a3;
- (void)setInputTemperature:(double)a3;
- (void)setInputTint:(double)a3;
- (void)setInputVectorsForFilter:(id)a3;
@end

@implementation PITempTintFilter

+ (id)customAttributes
{
  v28[3] = *MEMORY[0x1E4F143B8];
  v27[0] = *MEMORY[0x1E4F1E0B8];
  uint64_t v2 = *MEMORY[0x1E4F1E1C8];
  v26[0] = *MEMORY[0x1E4F1E188];
  v26[1] = v2;
  v26[2] = *MEMORY[0x1E4F1E1B8];
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
  v28[0] = v15;
  v27[1] = @"inputTemperature";
  uint64_t v4 = *MEMORY[0x1E4F1E0D8];
  v18[0] = *MEMORY[0x1E4F1E098];
  uint64_t v3 = v18[0];
  v18[1] = v4;
  v24[0] = &unk_1F000A2D8;
  v24[1] = &unk_1F000A2E8;
  uint64_t v6 = *MEMORY[0x1E4F1E0E8];
  uint64_t v19 = *MEMORY[0x1E4F1E0D0];
  uint64_t v5 = v19;
  uint64_t v20 = v6;
  v24[2] = &unk_1F000A2F8;
  v24[3] = &unk_1F000A308;
  uint64_t v8 = *MEMORY[0x1E4F1E0C8];
  uint64_t v21 = *MEMORY[0x1E4F1E0E0];
  uint64_t v7 = v21;
  uint64_t v22 = v8;
  v24[4] = &unk_1F000A318;
  v24[5] = &unk_1F000A2D8;
  uint64_t v23 = *MEMORY[0x1E4F1E0F0];
  uint64_t v9 = v23;
  uint64_t v25 = *MEMORY[0x1E4F1E158];
  uint64_t v10 = v25;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v18 count:7];
  v27[2] = @"inputTint";
  v28[1] = v11;
  v16[0] = v3;
  v16[1] = v4;
  v17[0] = &unk_1F000A328;
  v17[1] = &unk_1F000A338;
  v16[2] = v5;
  v16[3] = v6;
  v17[2] = &unk_1F000A348;
  v17[3] = &unk_1F000A358;
  v16[4] = v7;
  v16[5] = v8;
  v17[4] = &unk_1F000A368;
  v17[5] = &unk_1F000A328;
  v16[6] = v9;
  v17[6] = v10;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:7];
  v28[2] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];

  return v13;
}

- (void).cxx_destruct
{
}

- (void)setInputTint:(double)a3
{
  self->_inputTint = a3;
}

- (double)inputTint
{
  return self->_inputTint;
}

- (void)setInputTemperature:(double)a3
{
  self->_inputTemperature = a3;
}

- (double)inputTemperature
{
  return self->_inputTemperature;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputVectorsForFilter:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  [(PITempTintFilter *)self inputTemperature];
  double v5 = v4;
  [(PITempTintFilter *)self inputTint];
  double v7 = v6;
  double v58 = 0.0;
  uint64_t v59 = 0;
  double v60 = 0.0;
  double v8 = 2000.0;
  if (v5 >= 2000.0) {
    double v8 = v5;
  }
  if (v8 <= 50000.0) {
    double v9 = v8;
  }
  else {
    double v9 = 50000.0;
  }
  if (v7 <= 0.0)
  {
    double v30 = 1000.0 / v9;
    __double2 v31 = __sincos_stret(v30 * (v30 * v30) * 49.864+ 1000.0 / v9 * (v30 * (v30 * v30)) * -36.855+ v30 * v30 * -19.656+ v30 * -0.5063+ -0.2464);
    double sinval = v31.__sinval;
    double cosval = v31.__cosval;
  }
  else
  {
    *(void *)&long long v61 = 0;
    *(void *)&v56[0] = 0;
    GUTemp_to_xy((double *)&v61, (double *)v56, v9);
    double v10 = *(double *)v56 * 12.0 + *(double *)&v61 * -2.0 + 3.0;
    double v11 = *(double *)&v61 * 4.0 / v10;
    double v12 = *(double *)v56 * 6.0 / v10;
    double v13 = 1000.0 / v9;
    __double2 v14 = __sincos_stret(v13 * (v13 * v13) * 49.864+ 1000.0 / v9 * (v13 * (v13 * v13)) * -36.855+ v13 * v13 * -19.656+ v13 * -0.5063+ -0.2464);
    double sinval = v14.__sinval;
    double cosval = v14.__cosval;
    unint64_t v17 = 0;
    double v18 = 150.0;
    double v19 = 1.0;
    double v20 = 1.0;
    while (1)
    {
      double v21 = v11 - v14.__cosval * 150.0 * v20 / 3000.0;
      double v22 = v12 - v14.__sinval * 150.0 * v20 / 3000.0;
      if (v22 <= v21 * -0.1 + 0.4
        && (double v23 = v21 * 3.0,
            double v24 = v21 * 2.0 + 4.0 + v22 * -8.0,
            double v25 = v23 / v24,
            double v26 = (v22 + v22) / v24,
            v25 + v26 <= 1.0)
        && v26 <= (1.039 - v25) * 0.86)
      {
        int v28 = 0;
        double v18 = v20 * 150.0;
        char v27 = 1;
      }
      else
      {
        char v27 = 0;
        int v28 = 1;
      }
      if (v17) {
        char v27 = 0;
      }
      if ((v27 & 1) != 0 || v17 > 0xF) {
        break;
      }
      double v29 = -v19;
      if (!v28) {
        double v29 = v19;
      }
      double v20 = v20 + v29;
      ++v17;
      double v19 = v19 * 0.5;
    }
    double v7 = v7 * (v18 / 150.0);
  }
  *(void *)&long long v61 = 0;
  *(void *)&v56[0] = 0;
  double v32 = 150.0;
  if (v7 <= 150.0) {
    double v32 = v7;
  }
  if (v32 >= -150.0) {
    double v33 = v32;
  }
  else {
    double v33 = -150.0;
  }
  GUTemp_to_xy((double *)&v61, (double *)v56, v9);
  double v34 = *(double *)v56 * 12.0 + *(double *)&v61 * -2.0 + 3.0;
  double v35 = *(double *)&v61 * 4.0 / v34 - cosval * v33 / 3000.0;
  double v36 = *(double *)v56 * 6.0 / v34 - sinval * v33 / 3000.0;
  double v37 = v35 * 2.0 + 4.0 + v36 * -8.0;
  double v38 = (v36 + v36) / v37;
  if (v38 >= 1.0e-20)
  {
    double v39 = v35 * 3.0 / v37;
    double v58 = v39 / v38;
    uint64_t v59 = 0x3FF0000000000000;
    double v60 = (1.0 - v39) / v38 + -1.0;
  }
  uint64_t v57 = 0;
  memset(v56, 0, sizeof(v56));
  GUGetAdaptationMatrix(&v58, (double *)v56);
  uint64_t v49 = 0;
  memset(v48, 0, sizeof(v48));
  long long v66 = xmmword_1A980B8D0;
  uint64_t v67 = 0x3FF16CC7D1EF8103;
  double v65 = 0.0;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  GUGetAdaptationMatrix((double *)&v66, (double *)&v61);
  float64x2_t v50 = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)xmmword_1A980B8E0, *((double *)&v61 + 1)), (float64x2_t)xmmword_1A980B8F0, *(double *)&v61), (float64x2_t)xmmword_1A980B900, *(double *)&v62);
  double v51 = *((double *)&v61 + 1) * 0.0959986815 + *(double *)&v61 * 0.193244099 + *(double *)&v62 * 0.957493343;
  float64x2_t v52 = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)xmmword_1A980B8E0, *(double *)&v63), (float64x2_t)xmmword_1A980B8F0, *((double *)&v62 + 1)), (float64x2_t)xmmword_1A980B900, *((double *)&v63 + 1));
  double v53 = *(double *)&v63 * 0.0959986815 + *((double *)&v62 + 1) * 0.193244099 + *((double *)&v63 + 1) * 0.957493343;
  float64x2_t v54 = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64((float64x2_t)xmmword_1A980B8E0, *((double *)&v64 + 1)), (float64x2_t)xmmword_1A980B8F0, *(double *)&v64), (float64x2_t)xmmword_1A980B900, v65);
  double v55 = *((double *)&v64 + 1) * 0.0959986815 + *(double *)&v64 * 0.193244099 + v65 * 0.957493343;
  GUInvertMatrix(v50.f64, (double *)v48);
  double v65 = 1.0;
  long long v61 = 0x3FF0000000000000uLL;
  long long v62 = 0uLL;
  long long v63 = 0x3FF0000000000000uLL;
  long long v64 = 0uLL;
  GUMatrixMatrix((double *)&v61, v50.f64, (double *)&v61);
  GUMatrixMatrix((double *)&v61, (double *)v56, (double *)&v61);
  GUMatrixMatrix((double *)&v61, (double *)v48, (double *)&v61);
  long long v40 = v62;
  long long v41 = v63;
  long long v42 = v64;
  double v43 = v65;
  v44 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithX:Y:Z:W:", v61, *(double *)&v62, 0.0);
  v45 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithX:Y:Z:W:", *((double *)&v40 + 1), v41, 0.0);
  v46 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithX:Y:Z:W:", v42, v43, 0.0);
  [v47 setValue:v44 forKey:@"inputRVector"];
  [v47 setValue:v45 forKey:@"inputGVector"];
  [v47 setValue:v46 forKey:@"inputBVector"];
}

- (id)outputImage
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_inputImage)
  {
    double v6 = NUAssertLogger_6146();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      double v7 = [NSString stringWithFormat:@"inputImage cannot be nil"];
      int v19 = 138543362;
      double v20 = v7;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v19, 0xCu);
    }
    double v8 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    double v10 = NUAssertLogger_6146();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        __double2 v14 = dispatch_get_specific(*v8);
        v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        unint64_t v17 = [v15 callStackSymbols];
        double v18 = [v17 componentsJoinedByString:@"\n"];
        int v19 = 138543618;
        double v20 = v14;
        __int16 v21 = 2114;
        double v22 = v18;
        _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v19, 0x16u);
      }
    }
    else if (v11)
    {
      double v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v13 = [v12 componentsJoinedByString:@"\n"];
      int v19 = 138543362;
      double v20 = v13;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v19, 0xCu);
    }
    _NUAssertFailHandler();
  }
  uint64_t v3 = [MEMORY[0x1E4F1E040] filterWithName:@"CIColorMatrix"];
  [v3 setValue:self->_inputImage forKey:@"inputImage"];
  [(PITempTintFilter *)self setInputVectorsForFilter:v3];
  double v4 = [v3 outputImage];

  return v4;
}

@end