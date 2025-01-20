@interface PISmartToneFilterHDR
+ (id)customAttributes;
- (BOOL)_isIdentity;
- (CIImage)inputImage;
- (NSNumber)inputBlack;
- (NSNumber)inputBrightness;
- (NSNumber)inputContrast;
- (NSNumber)inputExposure;
- (NSNumber)inputHighlights;
- (NSNumber)inputRawHighlights;
- (NSNumber)inputShadows;
- (id)_kernelBneg;
- (id)_kernelBpos;
- (id)_kernelC;
- (id)_kernelC_hdr;
- (id)_kernelH;
- (id)_kernelRH;
- (id)outputImage;
- (void)setInputBlack:(id)a3;
- (void)setInputBrightness:(id)a3;
- (void)setInputContrast:(id)a3;
- (void)setInputExposure:(id)a3;
- (void)setInputHighlights:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputRawHighlights:(id)a3;
- (void)setInputShadows:(id)a3;
@end

@implementation PISmartToneFilterHDR

+ (id)customAttributes
{
  v44[8] = *MEMORY[0x1E4F143B8];
  v43[0] = *MEMORY[0x1E4F1E0B8];
  uint64_t v2 = *MEMORY[0x1E4F1E1C8];
  v42[0] = *MEMORY[0x1E4F1E1C0];
  v42[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1E180];
  v42[2] = *MEMORY[0x1E4F1E1B8];
  v42[3] = v3;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:4];
  v44[0] = v21;
  v43[1] = @"inputExposure";
  uint64_t v5 = *MEMORY[0x1E4F1E0E8];
  v34[0] = *MEMORY[0x1E4F1E0D8];
  uint64_t v4 = v34[0];
  v34[1] = v5;
  v40[0] = &unk_1F000A6F8;
  v40[1] = &unk_1F000A708;
  uint64_t v7 = *MEMORY[0x1E4F1E0D0];
  uint64_t v35 = *MEMORY[0x1E4F1E0E0];
  uint64_t v6 = v35;
  uint64_t v36 = v7;
  v40[2] = &unk_1F000A718;
  v40[3] = &unk_1F000A728;
  uint64_t v9 = *MEMORY[0x1E4F1E0C8];
  uint64_t v37 = *MEMORY[0x1E4F1E098];
  uint64_t v8 = v37;
  uint64_t v38 = v9;
  v40[4] = &unk_1F000A738;
  v40[5] = &unk_1F000A738;
  uint64_t v39 = *MEMORY[0x1E4F1E0F0];
  uint64_t v10 = v39;
  uint64_t v41 = *MEMORY[0x1E4F1E158];
  uint64_t v11 = v41;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v34 count:7];
  v44[1] = v20;
  v43[2] = @"inputContrast";
  v32[0] = v4;
  v32[1] = v5;
  v33[0] = &unk_1F000A6F8;
  v33[1] = &unk_1F000A708;
  v32[2] = v6;
  v32[3] = v7;
  v33[2] = &unk_1F000A718;
  v33[3] = &unk_1F000A728;
  v32[4] = v8;
  v32[5] = v9;
  v33[4] = &unk_1F000A738;
  v33[5] = &unk_1F000A738;
  v32[6] = v10;
  v33[6] = v11;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:7];
  v44[2] = v19;
  v43[3] = @"inputBrightness";
  v30[0] = v4;
  v30[1] = v5;
  v31[0] = &unk_1F000A6F8;
  v31[1] = &unk_1F000A708;
  v30[2] = v6;
  v30[3] = v7;
  v31[2] = &unk_1F000A718;
  v31[3] = &unk_1F000A728;
  v30[4] = v8;
  v30[5] = v9;
  v31[4] = &unk_1F000A738;
  v31[5] = &unk_1F000A738;
  v30[6] = v10;
  v31[6] = v11;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:7];
  v44[3] = v18;
  v43[4] = @"inputShadows";
  v28[0] = v4;
  v28[1] = v5;
  v29[0] = &unk_1F000A6F8;
  v29[1] = &unk_1F000A708;
  v28[2] = v6;
  v28[3] = v7;
  v29[2] = &unk_1F000A718;
  v29[3] = &unk_1F000A728;
  v28[4] = v8;
  v28[5] = v9;
  v29[4] = &unk_1F000A738;
  v29[5] = &unk_1F000A738;
  v28[6] = v10;
  v29[6] = v11;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:7];
  v44[4] = v17;
  v43[5] = @"inputHighlights";
  v26[0] = v4;
  v26[1] = v5;
  v27[0] = &unk_1F000A6F8;
  v27[1] = &unk_1F000A708;
  v26[2] = v6;
  v26[3] = v7;
  v27[2] = &unk_1F000A718;
  v27[3] = &unk_1F000A728;
  v26[4] = v8;
  v26[5] = v9;
  v27[4] = &unk_1F000A738;
  v27[5] = &unk_1F000A738;
  v26[6] = v10;
  v27[6] = v11;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:7];
  v44[5] = v16;
  v43[6] = @"inputBlack";
  v24[0] = v4;
  v24[1] = v5;
  v25[0] = &unk_1F000A6F8;
  v25[1] = &unk_1F000A708;
  v24[2] = v6;
  v24[3] = v7;
  v25[2] = &unk_1F000A718;
  v25[3] = &unk_1F000A728;
  v24[4] = v8;
  v24[5] = v9;
  v25[4] = &unk_1F000A738;
  v25[5] = &unk_1F000A738;
  v24[6] = v10;
  v25[6] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:7];
  v44[6] = v12;
  v43[7] = @"inputRawHighlights";
  v22[0] = v4;
  v22[1] = v5;
  v23[0] = &unk_1F000A738;
  v23[1] = &unk_1F000A738;
  v22[2] = v6;
  v22[3] = v7;
  v23[2] = &unk_1F000A718;
  v23[3] = &unk_1F000A718;
  v22[4] = v8;
  v22[5] = v9;
  v23[4] = &unk_1F000A738;
  v23[5] = &unk_1F000A738;
  v22[6] = v10;
  v23[6] = v11;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:7];
  v44[7] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:8];

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputRawHighlights, 0);
  objc_storeStrong((id *)&self->inputBlack, 0);
  objc_storeStrong((id *)&self->inputHighlights, 0);
  objc_storeStrong((id *)&self->inputShadows, 0);
  objc_storeStrong((id *)&self->inputBrightness, 0);
  objc_storeStrong((id *)&self->inputContrast, 0);
  objc_storeStrong((id *)&self->inputExposure, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

- (void)setInputRawHighlights:(id)a3
{
}

- (NSNumber)inputRawHighlights
{
  return self->inputRawHighlights;
}

- (void)setInputBlack:(id)a3
{
}

- (NSNumber)inputBlack
{
  return self->inputBlack;
}

- (void)setInputHighlights:(id)a3
{
}

- (NSNumber)inputHighlights
{
  return self->inputHighlights;
}

- (void)setInputShadows:(id)a3
{
}

- (NSNumber)inputShadows
{
  return self->inputShadows;
}

- (void)setInputBrightness:(id)a3
{
}

- (NSNumber)inputBrightness
{
  return self->inputBrightness;
}

- (void)setInputContrast:(id)a3
{
}

- (NSNumber)inputContrast
{
  return self->inputContrast;
}

- (void)setInputExposure:(id)a3
{
}

- (NSNumber)inputExposure
{
  return self->inputExposure;
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (id)outputImage
{
  v151[5] = *MEMORY[0x1E4F143B8];
  if (!self->inputImage)
  {
    uint64_t v3 = 0;
    goto LABEL_46;
  }
  if ([(PISmartToneFilterHDR *)self _isIdentity])
  {
    uint64_t v3 = self->inputImage;
    goto LABEL_46;
  }
  [(NSNumber *)self->inputExposure doubleValue];
  double v5 = fmin(fmax(v4, -2.0), 2.0);
  [(NSNumber *)self->inputContrast doubleValue];
  double v132 = v6;
  [(NSNumber *)self->inputBrightness doubleValue];
  double v134 = fmax(v7, -2.0);
  [(NSNumber *)self->inputShadows doubleValue];
  double v9 = v8;
  [(NSNumber *)self->inputHighlights doubleValue];
  double v11 = v10;
  [(NSNumber *)self->inputBlack doubleValue];
  double v13 = fmax(v12, -2.0);
  [(NSNumber *)self->inputRawHighlights doubleValue];
  double v15 = fmax(v14, 0.0);
  uint64_t v3 = self->inputImage;
  double v131 = fmin(v15, 2.0);
  double v137 = v15;
  double v138 = fabs(v131);
  if (v138 >= 1.0e-10)
  {
    float v16 = fmin(v15, 0.8);
    float v17 = 1.0 - v16;
    float v18 = (float)(1.0 - v17) * 0.33333;
    v150[0] = @"inputRVector";
    double v19 = (float)(v17 + v18);
    double v20 = v18;
    v21 = [MEMORY[0x1E4F1E080] vectorWithX:v19 Y:v20 Z:v20 W:0.0];
    v151[0] = v21;
    v150[1] = @"inputGVector";
    v22 = [MEMORY[0x1E4F1E080] vectorWithX:v20 Y:v19 Z:v20 W:0.0];
    v151[1] = v22;
    v150[2] = @"inputBVector";
    v23 = [MEMORY[0x1E4F1E080] vectorWithX:v20 Y:v20 Z:v19 W:0.0];
    v151[2] = v23;
    v150[3] = @"inputAVector";
    v24 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:0.0 W:1.0];
    v151[3] = v24;
    v150[4] = @"inputBiasVector";
    v25 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:0.0 W:0.0];
    v151[4] = v25;
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v151 forKeys:v150 count:5];
    uint64_t v27 = [(CIImage *)v3 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v26];

    uint64_t v3 = (CIImage *)v27;
  }
  double v28 = fmax(v9, -2.0);
  double v29 = fmax(v11, -2.0);
  double v30 = fmin(v13, 2.0);
  double v31 = fmin(v134, 2.0);
  if (fabs(v5) >= 1.0e-10 || fabs(v30) >= 1.0e-10)
  {
    long double v32 = 1.0 / (1.0 / exp2(v5 + v5) - v30 / 20.0);
    v148[0] = @"inputRVector";
    v33 = [MEMORY[0x1E4F1E080] vectorWithX:(double)v32 Y:0.0 Z:0.0 W:0.0];
    v149[0] = v33;
    v148[1] = @"inputGVector";
    v34 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:(double)v32 Z:0.0 W:0.0];
    v149[1] = v34;
    v148[2] = @"inputBVector";
    uint64_t v35 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:(double)v32 W:0.0];
    v149[2] = v35;
    v148[3] = @"inputAVector";
    uint64_t v36 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:0.0 W:1.0];
    v149[3] = v36;
    v148[4] = @"inputBiasVector";
    uint64_t v37 = [MEMORY[0x1E4F1E080] vectorWithX:(double)-(v30 / 20.0 * v32) Y:(double)-(v30 / 20.0 * v32) Z:(double)-(v30 / 20.0 * v32) W:0.0];
    v149[4] = v37;
    uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v149 forKeys:v148 count:5];
    uint64_t v39 = [(CIImage *)v3 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v38];

    uint64_t v3 = (CIImage *)v39;
  }
  double v40 = fmax(v132, -2.0);
  double v41 = fmin(v28, 2.0);
  double v42 = fmin(v29, 2.0);
  if (fabs(v31) >= 1.0e-10)
  {
    double v135 = v40;
    v45 = [(CIImage *)v3 imageByUnpremultiplyingAlpha];

    if (v31 >= 0.0)
    {
      v46 = [(PISmartToneFilterHDR *)self _kernelBpos];
      [v45 extent];
      double v48 = v58;
      double v50 = v59;
      double v52 = v60;
      double v54 = v61;
      v146[0] = v45;
      v55 = [NSNumber numberWithDouble:v31 * 2.0 + 1.0];
      v146[1] = v55;
      v56 = (void *)MEMORY[0x1E4F1C978];
      v57 = v146;
    }
    else
    {
      v46 = [(PISmartToneFilterHDR *)self _kernelBneg];
      [v45 extent];
      double v48 = v47;
      double v50 = v49;
      double v52 = v51;
      double v54 = v53;
      v147[0] = v45;
      v55 = [NSNumber numberWithDouble:v31 * -1.5 + 1.0];
      v147[1] = v55;
      v56 = (void *)MEMORY[0x1E4F1C978];
      v57 = v147;
    }
    v62 = [v56 arrayWithObjects:v57 count:2];
    objc_msgSend(v46, "applyWithExtent:arguments:", v62, v48, v50, v52, v54);
    uint64_t v3 = (CIImage *)objc_claimAutoreleasedReturnValue();
    unint64_t v44 = 0x1E4F1E000uLL;

    double v40 = v135;
    if (fabs(v41) < 1.0e-10)
    {
      int v43 = 0;
      goto LABEL_21;
    }
    uint64_t v63 = [(CIImage *)v3 imageByPremultiplyingAlpha];

    uint64_t v3 = (CIImage *)v63;
  }
  else
  {
    if (fabs(v41) < 1.0e-10)
    {
      int v43 = 1;
      unint64_t v44 = 0x1E4F1E000;
      goto LABEL_21;
    }
    unint64_t v44 = 0x1E4F1E000;
  }
  v144[0] = @"inputShadowAmount";
  v64 = [NSNumber numberWithDouble:v41];
  v145[0] = v64;
  v145[1] = &unk_1F000A718;
  v144[1] = @"inputHighlightAmount";
  v144[2] = @"inputRadius";
  v145[2] = &unk_1F000A738;
  v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v145 forKeys:v144 count:3];
  uint64_t v66 = [(CIImage *)v3 imageByApplyingFilter:@"CIHighlightShadowAdjust" withInputParameters:v65];

  int v43 = 1;
  uint64_t v3 = (CIImage *)v66;
LABEL_21:
  double v67 = fmin(v40, 2.0);
  double v68 = fabs(v42);
  if (v68 >= 1.0e-10)
  {
    long double v69 = exp(v42 * v42 / -0.75);
    double v70 = v69 * -0.45 + 1.45;
    double v71 = v69 * 0.45 + 0.55;
    if (v42 <= 0.0) {
      double v72 = v71;
    }
    else {
      double v72 = v70;
    }
    double v73 = (v68 + -0.6) * 2.0 + 0.2;
    if (v68 < 0.6) {
      double v73 = 0.2;
    }
    double v133 = v73;
    if (v43)
    {
      uint64_t v74 = [(CIImage *)v3 imageByUnpremultiplyingAlpha];

      uint64_t v3 = (CIImage *)v74;
    }
    double v136 = v67;
    double v75 = v138;
    if (v138 >= 1.0e-10)
    {
      if (v72 < v131) {
        double v72 = v131;
      }
      v78 = [(PISmartToneFilterHDR *)self _kernelRH];
      [(CIImage *)v3 extent];
      double v80 = v79;
      double v82 = v81;
      double v84 = v83;
      double v86 = v85;
      v143[0] = v3;
      v87 = [NSNumber numberWithDouble:v72];
      v143[1] = v87;
      v88 = [MEMORY[0x1E4F1C978] arrayWithObjects:v143 count:2];
      v76 = objc_msgSend(v78, "applyWithExtent:arguments:", v88, v80, v82, v84, v86);

      if (v42 <= 0.0)
      {
        double v75 = exp(v42 * (v42 * -0.4245) / 0.75);
        double v72 = v75 * 0.45 + 0.55;
      }
      else
      {
        double v75 = exp(v42 * (v42 * -0.4225) / 0.75);
        double v72 = v130 + v75 * v129;
      }
    }
    else
    {
      v76 = v3;
    }
    v89 = [(PISmartToneFilterHDR *)self _kernelH];
    [v76 extent];
    double v91 = v90;
    double v93 = v92;
    double v95 = v94;
    double v97 = v96;
    v142[0] = v76;
    v98 = [NSNumber numberWithDouble:v72];
    v142[1] = v98;
    v99 = [NSNumber numberWithDouble:v133];
    v142[2] = v99;
    v100 = [MEMORY[0x1E4F1C978] arrayWithObjects:v142 count:3];
    objc_msgSend(v89, "applyWithExtent:arguments:", v100, v91, v93, v95, v97);
    uint64_t v3 = (CIImage *)objc_claimAutoreleasedReturnValue();

    double v67 = v136;
    if (fabs(v136) < 1.0e-10) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
  if (fabs(v67) >= 1.0e-10)
  {
    if (v43)
    {
      uint64_t v77 = [(CIImage *)v3 imageByUnpremultiplyingAlpha];

      uint64_t v3 = (CIImage *)v77;
    }
LABEL_42:
    v101 = [(PISmartToneFilterHDR *)self _kernelC_hdr];
    [(CIImage *)v3 extent];
    double v103 = v102;
    double v105 = v104;
    double v107 = v106;
    double v109 = v108;
    v141[0] = v3;
    v110 = [NSNumber numberWithDouble:v67 * 3.4];
    v141[1] = v110;
    v111 = NSNumber;
    [MEMORY[0x1E4F7A4A0] HLGOpticalScale];
    v112 = objc_msgSend(v111, "numberWithDouble:");
    v141[2] = v112;
    v113 = [MEMORY[0x1E4F1C978] arrayWithObjects:v141 count:3];
    uint64_t v114 = objc_msgSend(v101, "applyWithExtent:arguments:", v113, v103, v105, v107, v109);

    uint64_t v3 = (CIImage *)v114;
    goto LABEL_43;
  }
  if ((v43 & 1) == 0)
  {
LABEL_43:
    uint64_t v115 = [(CIImage *)v3 imageByPremultiplyingAlpha];

    uint64_t v3 = (CIImage *)v115;
  }
  if (v138 >= 1.0e-10)
  {
    float v116 = fmin(v137, 0.8);
    float v117 = 1.0 / (float)(1.0 - v116);
    float v118 = (float)(1.0 - v117) * 0.33333;
    v139[0] = @"inputRVector";
    double v119 = (float)(v117 + v118);
    double v120 = v118;
    v121 = [*(id *)(v44 + 128) vectorWithX:v119 Y:v120 Z:v120 W:0.0];
    v140[0] = v121;
    v139[1] = @"inputGVector";
    v122 = [*(id *)(v44 + 128) vectorWithX:v120 Y:v119 Z:v120 W:0.0];
    v140[1] = v122;
    v139[2] = @"inputBVector";
    v123 = [*(id *)(v44 + 128) vectorWithX:v120 Y:v120 Z:v119 W:0.0];
    v140[2] = v123;
    v139[3] = @"inputAVector";
    v124 = [*(id *)(v44 + 128) vectorWithX:0.0 Y:0.0 Z:0.0 W:1.0];
    v140[3] = v124;
    v139[4] = @"inputBiasVector";
    v125 = [*(id *)(v44 + 128) vectorWithX:0.0 Y:0.0 Z:0.0 W:0.0];
    v140[4] = v125;
    v126 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v140 forKeys:v139 count:5];
    uint64_t v127 = [(CIImage *)v3 imageByApplyingFilter:@"CIColorMatrix" withInputParameters:v126];

    uint64_t v3 = (CIImage *)v127;
  }
LABEL_46:
  return v3;
}

- (id)_kernelRH
{
  if (_kernelRH_once != -1) {
    dispatch_once(&_kernelRH_once, &__block_literal_global_91_20410);
  }
  uint64_t v2 = (void *)_kernelRH_singleton;
  return v2;
}

uint64_t __33__PISmartToneFilterHDR__kernelRH__block_invoke()
{
  _kernelRH_singleton = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 _rawHighlightsHDR(__sample pix, float gain) \n { \n vec3 high = gain*pix.rgb \n float lum = clamp(dot(pix.rgb, vec3(.3333)), 0.0, 1.0); \n vec3 neg = min(high, 0.0); \n high.rgb = mix(max(pix.rgb, 0.0), high.rgb, lum*lum) + neg; \n return vec4(high, pix.a); \n }"];;
  return MEMORY[0x1F41817F8]();
}

- (id)_kernelH
{
  if (_kernelH_once != -1) {
    dispatch_once(&_kernelH_once, &__block_literal_global_86);
  }
  uint64_t v2 = (void *)_kernelH_singleton;
  return v2;
}

uint64_t __32__PISmartToneFilterHDR__kernelH__block_invoke()
{
  _kernelH_singleton = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 _smarttone_highlightcontrast_HDR (__sample pix, float highAmt, float sat) \n { \n float maxVal = 1.0 vec3 neg = min(pix.rgb, 0.0); \n vec3 pos = max(pix.rgb, maxVal) - maxVal; \n pix.rgb = clamp(pix.rgb, 0.0, maxVal); \n float lum = clamp(dot(pix.rgb, vec3(.3333)),0.0,1.0); \n vec3 high = pow(pix.rgb, vec3(3.0 - 2.0*highAmt)); \n float pivot = 0.8; \n vec3 pix1 = (high - pivot)*(4.0 - 3.0*highAmt) + pivot; \n float h = highAmt*highAmt*highAmt*highAmt; \n float a = (4.0 - 3.0*h); \n vec3 pix2 = (lum-pivot)*a+pivot + high.rgb -lum; \n high = mix(pix2, pix1, sat); \n pix.rgb = mix(pix.rgb, high, lum*lum); \n pix.rgb = pix.rgb + neg + pos; \n return pix; \n }"];;
  return MEMORY[0x1F41817F8]();
}

- (id)_kernelC_hdr
{
  if (_kernelC_hdr_once != -1) {
    dispatch_once(&_kernelC_hdr_once, &__block_literal_global_81_20419);
  }
  uint64_t v2 = (void *)_kernelC_hdr_singleton;
  return v2;
}

uint64_t __36__PISmartToneFilterHDR__kernelC_hdr__block_invoke()
{
  _kernelC_hdr_singleton = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 _smarttone_contrast_HDR (__sample im, float midAmt, float maxVal) \n { \n midAmt = midAmt / maxVal \n vec3 neg = min(im.rgb, 0.0); \n vec3 pos = max(im.rgb, maxVal) - maxVal; \n im.rgb = clamp(im.rgb, 0.0, maxVal); \n float y = dot(im.rgb, vec3(0.3333)); \n y = sqrt(y); \n im.rgb = sqrt(im.rgb); \n float sat = dot(im.rgb - vec3(y), im.rgb - vec3(y)) / sqrt(maxVal); \n y = y*(sqrt(maxVal)-y); \n float a = midAmt*y; \n float b = -0.5*a; \n vec3 pix = im.r * vec3(0.299*a) + \n im.g * vec3(0.587*a) + \n im.b * vec3(0.114*a) + \n im.rgb + vec3(b); \n im.rgb = mix(im.rgb, vec3(0.5), -a); \n im.rgb = mix(im.rgb, pix, clamp(0.8+sat, 0.0, 1.0)); \n im.rgb = max(im.rgb, 0.0); \n im.rgb *= im.rgb; \n im.rgb = im.rgb + neg + pos; \n return im; \n }"];;
  return MEMORY[0x1F41817F8]();
}

- (id)_kernelC
{
  if (_kernelC_once != -1) {
    dispatch_once(&_kernelC_once, &__block_literal_global_76);
  }
  uint64_t v2 = (void *)_kernelC_singleton;
  return v2;
}

uint64_t __32__PISmartToneFilterHDR__kernelC__block_invoke()
{
  _kernelC_singleton = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 _smarttone_contrast_HDR (__sample im, float midAmt) \n { \n vec3 neg = min(im.rgb, 0.0) \n vec3 pos = max(im.rgb, 1.0)-1.0; \n im.rgb = clamp(im.rgb, 0.0, 1.0); \n float y = dot(im.rgb, vec3(0.3333)); \n y = sqrt(y); \n float sat = (im.r-y)*(im.r-y)+(im.g-y)*(im.g-y)+(im.b-y)*(im.b-y); \n y = y*(1.0-y); \n im.rgb = sqrt(im.rgb); \n float a = midAmt*y; \n float b = -0.5*a; \n vec3 pix = im.r * vec3(0.299*a) + \n im.g * vec3(0.587*a) + \n im.b * vec3(0.114*a) + \n im.rgb + vec3(b); \n im.rgb = mix(im.rgb, vec3(0.5), -y*midAmt); \n im.rgb = mix(im.rgb, pix, 0.8+sat); \n im.rgb = max(im.rgb, 0.0); \n im.rgb *= im.rgb; \n im.rgb = im.rgb + neg + pos; \n return im; \n }"];;
  return MEMORY[0x1F41817F8]();
}

- (id)_kernelBpos
{
  if (_kernelBpos_once != -1) {
    dispatch_once(&_kernelBpos_once, &__block_literal_global_71);
  }
  uint64_t v2 = (void *)_kernelBpos_singleton;
  return v2;
}

uint64_t __35__PISmartToneFilterHDR__kernelBpos__block_invoke()
{
  _kernelBpos_singleton = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 _smarttone_brightness_pos_HDR (__sample c, float gamma) \n { \n vec3 neg = min(c.rgb, 0.0) \n vec3 pos = max(c.rgb, 1.0)-1.0; \n c.rgb = clamp(c.rgb, 0.0, 1.0); \n vec3 m = 1.0-c.rgb; \n float a = 0.6; \n vec4 result = c; \n result.rgb = 1.0 - (pow(m, vec3(gamma))+a*( ((gamma-1.0)*m*(1.0-m*m))/(gamma*gamma))); \n c.rgb = pow(c.rgb, vec3(1.0-((min(gamma, 2.95)-1.0)/2.6))); \n result.rgb = mix(c.rgb, result.rgb, .85); \n result.rgb = result.rgb+neg+pos; \n return result; \n } \n"];;
  return MEMORY[0x1F41817F8]();
}

- (id)_kernelBneg
{
  if (_kernelBneg_once != -1) {
    dispatch_once(&_kernelBneg_once, &__block_literal_global_20430);
  }
  uint64_t v2 = (void *)_kernelBneg_singleton;
  return v2;
}

uint64_t __35__PISmartToneFilterHDR__kernelBneg__block_invoke()
{
  _kernelBneg_singleton = [MEMORY[0x1E4F1E010] kernelWithString:@"kernel vec4 _smarttone_brightness_neg_HDR (__sample c, float gamma) \n { \n vec3 neg = min(c.rgb, 0.0) \n c.rgb = max(c.rgb, 0.0); \n vec3 pix = pow(c.rgb, vec3(gamma)); \n float lum = dot(c.rgb, vec3(0.39, .5, .11)); \n vec3 pix2 = lum>0.0 ? c.rgb*pow(lum, gamma)/lum : vec3(0.0); \n pix = mix(pix, pix2, 0.8) + neg; \n return vec4(pix, c.a); \n } \n"];;
  return MEMORY[0x1F41817F8]();
}

- (BOOL)_isIdentity
{
  [(NSNumber *)self->inputExposure doubleValue];
  double v4 = v3;
  [(NSNumber *)self->inputContrast doubleValue];
  double v6 = v5;
  [(NSNumber *)self->inputBrightness doubleValue];
  double v8 = v7;
  [(NSNumber *)self->inputShadows doubleValue];
  double v10 = v9;
  [(NSNumber *)self->inputHighlights doubleValue];
  double v12 = v11;
  [(NSNumber *)self->inputBlack doubleValue];
  double v14 = v13;
  [(NSNumber *)self->inputRawHighlights doubleValue];
  BOOL result = 0;
  if (fabs(v4) < 1.0e-10
    && fabs(v6) < 1.0e-10
    && fabs(v8) < 1.0e-10
    && fabs(v10) < 1.0e-10
    && fabs(v12) < 1.0e-10
    && fabs(v14) < 1.0e-10)
  {
    return fabs(v15) < 1.0e-10;
  }
  return result;
}

@end