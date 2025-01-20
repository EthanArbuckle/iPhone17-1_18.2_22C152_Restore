@interface GUBilateralConvolution
+ (id)LabToRGBKernel;
+ (id)RGBToLabKernel;
+ (id)RGBToLabKernels;
+ (id)bilateralAdd1Kernel;
+ (id)bilateralAdd2Kernel;
+ (id)bilateralAdd3Kernel;
+ (id)bilateralAdd4Kernel;
+ (id)bilateralAdd5Kernel;
+ (id)bilateralAdd6Kernel;
+ (id)bilateralAdd7Kernel;
+ (id)bilateralAdd8Kernel;
+ (id)bilateralAdd9Kernel;
+ (id)bilateralFinalizeKernel;
+ (id)bilateralKernels;
- (CGRect)bilateralAddROI:(int64_t)a3 destRect:(CGRect)result userInfo:(id)a5;
- (CGRect)boundsForPointArray:(id)a3;
- (CGRect)enlargedBounds:(CGRect)a3 withPoints:(id)a4;
- (CIImage)inputImage;
- (NSArray)inputPoints;
- (NSArray)inputWeights;
- (NSNumber)inputEdgeDetail;
- (NSNumber)inputVersion;
- (id)doBilateralPass:(id)a3 points:(id)a4 weights:(id)a5 sums:(id)a6 slope:(id)a7;
- (id)outputImage;
- (unint64_t)samplesPerPass;
- (void)setInputEdgeDetail:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputPoints:(id)a3;
- (void)setInputVersion:(id)a3;
- (void)setInputWeights:(id)a3;
@end

@implementation GUBilateralConvolution

+ (id)LabToRGBKernel
{
  v2 = [a1 RGBToLabKernels];
  v3 = [v2 objectForKeyedSubscript:@"convertFromLabToRGB"];

  return v3;
}

+ (id)RGBToLabKernel
{
  v2 = [a1 RGBToLabKernels];
  v3 = [v2 objectForKeyedSubscript:@"convertFromRGBToLab"];

  return v3;
}

+ (id)bilateralFinalizeKernel
{
  v2 = [a1 bilateralKernels];
  v3 = [v2 objectForKeyedSubscript:@"bilateralFinalize"];

  return v3;
}

+ (id)bilateralAdd9Kernel
{
  v2 = [a1 bilateralKernels];
  v3 = [v2 objectForKeyedSubscript:@"bilateralAdd_9"];

  return v3;
}

+ (id)bilateralAdd8Kernel
{
  v2 = [a1 bilateralKernels];
  v3 = [v2 objectForKeyedSubscript:@"bilateralAdd_8"];

  return v3;
}

+ (id)bilateralAdd7Kernel
{
  v2 = [a1 bilateralKernels];
  v3 = [v2 objectForKeyedSubscript:@"bilateralAdd_7"];

  return v3;
}

+ (id)bilateralAdd6Kernel
{
  v2 = [a1 bilateralKernels];
  v3 = [v2 objectForKeyedSubscript:@"bilateralAdd_6"];

  return v3;
}

+ (id)bilateralAdd5Kernel
{
  v2 = [a1 bilateralKernels];
  v3 = [v2 objectForKeyedSubscript:@"bilateralAdd_5"];

  return v3;
}

+ (id)bilateralAdd4Kernel
{
  v2 = [a1 bilateralKernels];
  v3 = [v2 objectForKeyedSubscript:@"bilateralAdd_4"];

  return v3;
}

+ (id)bilateralAdd3Kernel
{
  v2 = [a1 bilateralKernels];
  v3 = [v2 objectForKeyedSubscript:@"bilateralAdd_3"];

  return v3;
}

+ (id)bilateralAdd2Kernel
{
  v2 = [a1 bilateralKernels];
  v3 = [v2 objectForKeyedSubscript:@"bilateralAdd_2"];

  return v3;
}

+ (id)bilateralAdd1Kernel
{
  v2 = [a1 bilateralKernels];
  v3 = [v2 objectForKeyedSubscript:@"bilateralAdd_1"];

  return v3;
}

+ (id)RGBToLabKernels
{
  if (RGBToLabKernels_onceToken != -1) {
    dispatch_once(&RGBToLabKernels_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)RGBToLabKernels_RGBToLabKernels;
  return v2;
}

uint64_t __41__GUBilateralConvolution_RGBToLabKernels__block_invoke()
{
  RGBToLabKernels_RGBToLabKernels = [MEMORY[0x1E4F1E058] kernelsDictionaryWithString:@"kernel vec4 convertFromRGBToLab(sampler src)\n{\nvec3 f\nvec4 pix, color;\npix = unpremultiply(sample(src, samplerCoord(src)));\ncolor.xyz = pix.r * vec3(0.449695, 0.316251, 0.18452 )\n+ pix.g * vec3(0.244634, 0.672034, 0.0833318)\n+ pix.b * vec3(0.0251829, 0.141184, 0.922602);\ncolor.xyz *= vec3(1.052111, 1.0, 0.918417);\nf = compare(color.xyz - 0.00885645, 7.787037 * color.xyz + 0.137931, pow(color.xyz, vec3(0.333333)));\ncolor.r = 116.0 * f.y - 16.0;\ncolor.g = 500.0 * (f.x - f.y);\ncolor.b = 200.0 * (f.y - f.z);\ncolor.rgb *= 0.005;\ncolor.a = 1.0;\nreturn color;\n}\nkernel vec4 convertFromLabToRGB(sampler src, sampler original)\n{\nvec3 f, cie;\nvec4 color, pix, opix;\npix = sample(src, samplerCoord(src));\nopix = sample(original, samplerCoord(original));\npix.rgb *= 200.0;\nf.y = (pix.r + 16.0) / 116.0;\nf.x = f.y + pix.g * 0.002;\nf.z = f.y - pix.b * 0.005;\ncolor.xyz = f * f * f;\ncie = compare(color.xyz - 0.00885645, (f.xyz - 0.137931) / 7.787037, color.xyz);\ncie *= vec3(0.95047, 1.0, 1.08883);\ncolor.rgb = cie.x * vec3(2.95176, -1.28951, -0.47388 )\n+ cie.y * vec3(-1.0851, 1.99084, 0.0372023)\n+ cie.z * vec3(0.0854804, -0.269456, 1.09113 );\ncolor.a = opix.a;\nreturn premultiply(color);\n}\n\n"];;
  return MEMORY[0x1F41817F8]();
}

+ (id)bilateralKernels
{
  if (bilateralKernels_onceToken != -1) {
    dispatch_once(&bilateralKernels_onceToken, &__block_literal_global_7398);
  }
  v2 = (void *)bilateralKernels_bilateralKernels;
  return v2;
}

uint64_t __42__GUBilateralConvolution_bilateralKernels__block_invoke()
{
  bilateralKernels_bilateralKernels = [MEMORY[0x1E4F1E058] kernelsDictionaryWithString:&cfstr_FloatLuminance];
  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputVersion, 0);
  objc_storeStrong((id *)&self->_inputEdgeDetail, 0);
  objc_storeStrong((id *)&self->_inputWeights, 0);
  objc_storeStrong((id *)&self->_inputPoints, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputVersion:(id)a3
{
}

- (NSNumber)inputVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setInputEdgeDetail:(id)a3
{
}

- (NSNumber)inputEdgeDetail
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputWeights:(id)a3
{
}

- (NSArray)inputWeights
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputPoints:(id)a3
{
}

- (NSArray)inputPoints
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (id)outputImage
{
  v61[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(GUBilateralConvolution *)self samplesPerPass];
  NSUInteger v4 = [(NSArray *)self->_inputPoints count];
  NSUInteger v5 = [(NSArray *)self->_inputWeights count];
  if (v4) {
    BOOL v6 = v5 == v4;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    [(NSNumber *)self->_inputEdgeDetail floatValue];
    v58 = [NSNumber numberWithDouble:__exp10(v8 + -3.0) * -200.0];
    uint64_t v9 = [MEMORY[0x1E4F1E078] samplerWithImage:self->_inputImage options:0];
    v10 = [(id)objc_opt_class() RGBToLabKernel];
    [(CIImage *)self->_inputImage extent];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    v56 = (void *)v9;
    v61[0] = v9;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:1];
    v20 = objc_msgSend(v10, "applyWithExtent:arguments:", v19, v12, v14, v16, v18);

    v57 = [MEMORY[0x1E4F1E078] samplerWithImage:v20 options:0];
    NSUInteger v21 = 0;
    v22 = 0;
    NSUInteger v23 = v4;
    NSUInteger v24 = v4;
    do
    {
      NSUInteger v25 = v24 - v3;
      if (v24 >= v3) {
        unint64_t v26 = v3;
      }
      else {
        unint64_t v26 = v24;
      }
      if (v21)
      {
        uint64_t v27 = [MEMORY[0x1E4F1E078] samplerWithImage:v20 options:0];

        v22 = (void *)v27;
      }
      v28 = -[NSArray subarrayWithRange:](self->_inputPoints, "subarrayWithRange:", v21, v26);
      v29 = -[NSArray subarrayWithRange:](self->_inputWeights, "subarrayWithRange:", v21, v26);
      v30 = [(GUBilateralConvolution *)self doBilateralPass:v57 points:v28 weights:v29 sums:v22 slope:v58];

      v21 += v3;
      NSUInteger v24 = v25;
      v20 = v30;
    }
    while (v21 < v23);
    v31 = [MEMORY[0x1E4F1E078] samplerWithImage:v30 options:0];

    v32 = [(id)objc_opt_class() bilateralFinalizeKernel];
    [v30 extent];
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;
    v60 = v31;
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
    v42 = objc_msgSend(v32, "applyWithExtent:arguments:", v41, v34, v36, v38, v40);

    v43 = [MEMORY[0x1E4F1E078] samplerWithImage:v42 options:0];

    v44 = [(id)objc_opt_class() LabToRGBKernel];
    [v42 extent];
    double v46 = v45;
    double v48 = v47;
    double v50 = v49;
    double v52 = v51;
    v59[0] = v43;
    v59[1] = v56;
    v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
    v54 = objc_msgSend(v44, "applyWithExtent:arguments:", v53, v46, v48, v50, v52);

    id v7 = v54;
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)doBilateralPass:(id)a3 points:(id)a4 weights:(id)a5 sums:(id)a6 slope:(id)a7
{
  v263[6] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  double v17 = (void *)MEMORY[0x1E4F1E048];
  [v12 extent];
  -[GUBilateralConvolution enlargedBounds:withPoints:](self, "enlargedBounds:withPoints:", v13);
  double v18 = objc_msgSend(v17, "shapeWithRect:");
  uint64_t v19 = [v13 count];
  if (v15)
  {
    id v20 = v15;
    NSUInteger v21 = [v20 definition];
    id v251 = [v18 unionWith:v21];

    double v22 = 1.0;
  }
  else
  {
    id v20 = v12;
    id v251 = v18;
    double v22 = 0.0;
  }
  v253[0] = MEMORY[0x1E4F143A8];
  v253[1] = 3221225472;
  v253[2] = __68__GUBilateralConvolution_doBilateralPass_points_weights_sums_slope___block_invoke;
  v253[3] = &unk_1E5D7F680;
  v253[4] = self;
  id v23 = v13;
  id v254 = v23;
  v252 = (void *)MEMORY[0x1AD0F8FE0](v253);
  id v249 = v20;
  v250 = v18;
  switch(v19)
  {
    case 1:
      v263[0] = v12;
      v263[1] = v20;
      v263[2] = v16;
      NSUInteger v24 = [v23 objectAtIndex:0];
      v263[3] = v24;
      NSUInteger v25 = [v14 objectAtIndex:0];
      v263[4] = v25;
      unint64_t v26 = [NSNumber numberWithDouble:v22];
      v263[5] = v26;
      uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v263 count:6];

      uint64_t v28 = [(id)objc_opt_class() bilateralAdd1Kernel];
      goto LABEL_15;
    case 2:
      v262[0] = v12;
      v262[1] = v20;
      v262[2] = v16;
      v233 = [v23 objectAtIndex:0];
      v262[3] = v233;
      v31 = [v23 objectAtIndex:1];
      v262[4] = v31;
      v32 = (void *)MEMORY[0x1E4F1E080];
      [v14 objectAtIndex:0];
      double v33 = v241 = v12;
      [v33 floatValue];
      double v35 = v34;
      [v14 objectAtIndex:1];
      v37 = id v36 = v15;
      [v37 floatValue];
      double v39 = [v32 vectorWithX:v35 Y:v38];
      v262[5] = v39;
      [NSNumber numberWithDouble:v22];
      v41 = id v40 = v16;
      v262[6] = v41;
      uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v262 count:7];

      id v16 = v40;
      id v15 = v36;

      id v12 = v241;
      uint64_t v28 = [(id)objc_opt_class() bilateralAdd2Kernel];
      goto LABEL_15;
    case 3:
      v261[0] = v12;
      v261[1] = v20;
      v261[2] = v16;
      v219 = [v23 objectAtIndex:0];
      v261[3] = v219;
      v42 = [v23 objectAtIndex:1];
      v261[4] = v42;
      [v23 objectAtIndex:2];
      v43 = id v242 = v12;
      v261[5] = v43;
      v44 = (void *)MEMORY[0x1E4F1E080];
      [v14 objectAtIndex:0];
      double v45 = v226 = v15;
      [v45 floatValue];
      double v47 = v46;
      [v14 objectAtIndex:1];
      double v48 = v234 = v16;
      [v48 floatValue];
      double v50 = v49;
      double v51 = [v14 objectAtIndex:2];
      [v51 floatValue];
      v53 = [v44 vectorWithX:v47 Y:v50 Z:v52];
      v261[6] = v53;
      v54 = [NSNumber numberWithDouble:v22];
      v261[7] = v54;
      uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v261 count:8];

      id v16 = v234;
      id v15 = v226;

      id v12 = v242;
      uint64_t v28 = [(id)objc_opt_class() bilateralAdd3Kernel];
      goto LABEL_15;
    case 4:
      v260[0] = v12;
      v260[1] = v20;
      v260[2] = v16;
      v235 = [v23 objectAtIndex:0];
      v260[3] = v235;
      v220 = [v23 objectAtIndex:1];
      v260[4] = v220;
      v213 = [v23 objectAtIndex:2];
      v260[5] = v213;
      v207 = [v23 objectAtIndex:3];
      v260[6] = v207;
      v55 = (void *)MEMORY[0x1E4F1E080];
      [v14 objectAtIndex:0];
      v56 = id v243 = v12;
      [v56 floatValue];
      double v58 = v57;
      v59 = [v14 objectAtIndex:1];
      [v59 floatValue];
      double v61 = v60;
      [v14 objectAtIndex:2];
      v62 = id v227 = v15;
      [v62 floatValue];
      double v64 = v63;
      v65 = [v14 objectAtIndex:3];
      [v65 floatValue];
      v67 = [v55 vectorWithX:v58 Y:v61 Z:v64 W:v66];
      v260[7] = v67;
      [NSNumber numberWithDouble:v22];
      v69 = id v68 = v16;
      v260[8] = v69;
      uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v260 count:9];

      id v16 = v68;
      id v15 = v227;

      id v12 = v243;
      uint64_t v28 = [(id)objc_opt_class() bilateralAdd4Kernel];
      goto LABEL_15;
    case 5:
      v259[0] = v12;
      v259[1] = v20;
      v259[2] = v16;
      v221 = [v23 objectAtIndex:0];
      v259[3] = v221;
      v214 = [v23 objectAtIndex:1];
      v259[4] = v214;
      v208 = [v23 objectAtIndex:2];
      v259[5] = v208;
      v202 = [v23 objectAtIndex:3];
      v259[6] = v202;
      v197 = [v23 objectAtIndex:4];
      v259[7] = v197;
      v70 = (void *)MEMORY[0x1E4F1E080];
      [v14 objectAtIndex:0];
      v71 = id v244 = v12;
      [v71 floatValue];
      double v73 = v72;
      [v14 objectAtIndex:1];
      v74 = id v228 = v15;
      [v74 floatValue];
      double v76 = v75;
      [v14 objectAtIndex:2];
      v77 = id v236 = v16;
      [v77 floatValue];
      double v79 = v78;
      v80 = [v14 objectAtIndex:3];
      [v80 floatValue];
      v82 = [v70 vectorWithX:v73 Y:v76 Z:v79 W:v81];
      v259[8] = v82;
      v83 = [v14 objectAtIndex:4];
      v259[9] = v83;
      v84 = [NSNumber numberWithDouble:v22];
      v259[10] = v84;
      uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v259 count:11];

      id v16 = v236;
      id v15 = v228;

      id v12 = v244;
      uint64_t v28 = [(id)objc_opt_class() bilateralAdd5Kernel];
      goto LABEL_15;
    case 6:
      v258[0] = v12;
      v258[1] = v20;
      v258[2] = v16;
      v229 = [v23 objectAtIndex:0];
      v258[3] = v229;
      v222 = [v23 objectAtIndex:1];
      v258[4] = v222;
      v215 = [v23 objectAtIndex:2];
      v258[5] = v215;
      v209 = [v23 objectAtIndex:3];
      v258[6] = v209;
      v203 = [v23 objectAtIndex:4];
      v258[7] = v203;
      v198 = [v23 objectAtIndex:5];
      v258[8] = v198;
      v85 = (void *)MEMORY[0x1E4F1E080];
      v193 = [v14 objectAtIndex:0];
      [v193 floatValue];
      double v87 = v86;
      v189 = [v14 objectAtIndex:1];
      [v189 floatValue];
      double v89 = v88;
      v185 = [v14 objectAtIndex:2];
      [v185 floatValue];
      double v91 = v90;
      [v14 objectAtIndex:3];
      v92 = id v245 = v12;
      [v92 floatValue];
      [v85 vectorWithX:v87 Y:v89 Z:v91 W:v93];
      v94 = id v237 = v16;
      v258[9] = v94;
      v95 = (void *)MEMORY[0x1E4F1E080];
      v96 = [v14 objectAtIndex:4];
      [v96 floatValue];
      double v98 = v97;
      v99 = [v14 objectAtIndex:5];
      [v99 floatValue];
      v101 = [v95 vectorWithX:v98 Y:v100];
      v258[10] = v101;
      [NSNumber numberWithDouble:v22];
      v103 = id v102 = v15;
      v258[11] = v103;
      uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v258 count:12];

      id v15 = v102;
      id v16 = v237;

      id v12 = v245;
      uint64_t v28 = [(id)objc_opt_class() bilateralAdd6Kernel];
      goto LABEL_15;
    case 7:
      v257[0] = v12;
      v257[1] = v20;
      v257[2] = v16;
      v230 = [v23 objectAtIndex:0];
      v257[3] = v230;
      v223 = [v23 objectAtIndex:1];
      v257[4] = v223;
      v216 = [v23 objectAtIndex:2];
      v257[5] = v216;
      v210 = [v23 objectAtIndex:3];
      v257[6] = v210;
      v204 = [v23 objectAtIndex:4];
      v257[7] = v204;
      v199 = [v23 objectAtIndex:5];
      v257[8] = v199;
      v194 = [v23 objectAtIndex:6];
      v257[9] = v194;
      v104 = (void *)MEMORY[0x1E4F1E080];
      v190 = [v14 objectAtIndex:0];
      [v190 floatValue];
      double v106 = v105;
      v186 = [v14 objectAtIndex:1];
      [v186 floatValue];
      double v108 = v107;
      v182 = [v14 objectAtIndex:2];
      [v182 floatValue];
      double v110 = v109;
      v179 = [v14 objectAtIndex:3];
      [v179 floatValue];
      [v104 vectorWithX:v106 Y:v108 Z:v110 W:v111];
      v112 = id v246 = v12;
      v257[10] = v112;
      v113 = (void *)MEMORY[0x1E4F1E080];
      [v14 objectAtIndex:4];
      v114 = id v238 = v16;
      [v114 floatValue];
      double v116 = v115;
      [v14 objectAtIndex:5];
      v118 = id v117 = v15;
      [v118 floatValue];
      double v120 = v119;
      v121 = [v14 objectAtIndex:6];
      [v121 floatValue];
      v123 = [v113 vectorWithX:v116 Y:v120 Z:v122];
      v257[11] = v123;
      v124 = [NSNumber numberWithDouble:v22];
      v257[12] = v124;
      uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v257 count:13];

      id v15 = v117;
      id v16 = v238;

      id v12 = v246;
      uint64_t v28 = [(id)objc_opt_class() bilateralAdd7Kernel];
      goto LABEL_15;
    case 8:
      v256[0] = v12;
      v256[1] = v20;
      v256[2] = v16;
      v224 = [v23 objectAtIndex:0];
      v256[3] = v224;
      v217 = [v23 objectAtIndex:1];
      v256[4] = v217;
      v211 = [v23 objectAtIndex:2];
      v256[5] = v211;
      v205 = [v23 objectAtIndex:3];
      v256[6] = v205;
      v200 = [v23 objectAtIndex:4];
      v256[7] = v200;
      v195 = [v23 objectAtIndex:5];
      v256[8] = v195;
      v191 = [v23 objectAtIndex:6];
      v256[9] = v191;
      v187 = [v23 objectAtIndex:7];
      v256[10] = v187;
      v125 = (void *)MEMORY[0x1E4F1E080];
      v183 = [v14 objectAtIndex:0];
      [v183 floatValue];
      double v127 = v126;
      v180 = [v14 objectAtIndex:1];
      [v180 floatValue];
      double v129 = v128;
      v177 = [v14 objectAtIndex:2];
      [v177 floatValue];
      double v131 = v130;
      v175 = [v14 objectAtIndex:3];
      [v175 floatValue];
      v133 = [v125 vectorWithX:v127 Y:v129 Z:v131 W:v132];
      v256[11] = v133;
      v134 = (void *)MEMORY[0x1E4F1E080];
      [v14 objectAtIndex:4];
      v135 = id v247 = v12;
      [v135 floatValue];
      double v137 = v136;
      [v14 objectAtIndex:5];
      v138 = id v239 = v16;
      [v138 floatValue];
      double v140 = v139;
      [v14 objectAtIndex:6];
      v141 = id v231 = v15;
      [v141 floatValue];
      double v143 = v142;
      v144 = [v14 objectAtIndex:7];
      [v144 floatValue];
      v146 = [v134 vectorWithX:v137 Y:v140 Z:v143 W:v145];
      v256[12] = v146;
      v147 = [NSNumber numberWithDouble:v22];
      v256[13] = v147;
      uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v256 count:14];

      id v15 = v231;
      id v16 = v239;

      id v12 = v247;
      uint64_t v28 = [(id)objc_opt_class() bilateralAdd8Kernel];
      goto LABEL_15;
    case 9:
      v255[0] = v12;
      v255[1] = v20;
      v255[2] = v16;
      v232 = [v23 objectAtIndex:0];
      v255[3] = v232;
      v225 = [v23 objectAtIndex:1];
      v255[4] = v225;
      v218 = [v23 objectAtIndex:2];
      v255[5] = v218;
      v212 = [v23 objectAtIndex:3];
      v255[6] = v212;
      v206 = [v23 objectAtIndex:4];
      v255[7] = v206;
      v201 = [v23 objectAtIndex:5];
      v255[8] = v201;
      v196 = [v23 objectAtIndex:6];
      v255[9] = v196;
      v192 = [v23 objectAtIndex:7];
      v255[10] = v192;
      v188 = [v23 objectAtIndex:8];
      v255[11] = v188;
      v148 = (void *)MEMORY[0x1E4F1E080];
      v184 = [v14 objectAtIndex:0];
      [v184 floatValue];
      double v150 = v149;
      v181 = [v14 objectAtIndex:1];
      [v181 floatValue];
      double v152 = v151;
      v178 = [v14 objectAtIndex:2];
      [v178 floatValue];
      double v154 = v153;
      v176 = [v14 objectAtIndex:3];
      [v176 floatValue];
      v174 = [v148 vectorWithX:v150 Y:v152 Z:v154 W:v155];
      v255[12] = v174;
      v156 = (void *)MEMORY[0x1E4F1E080];
      v173 = [v14 objectAtIndex:4];
      [v173 floatValue];
      double v158 = v157;
      [v14 objectAtIndex:5];
      v159 = id v248 = v12;
      [v159 floatValue];
      double v161 = v160;
      [v14 objectAtIndex:6];
      v162 = id v240 = v16;
      [v162 floatValue];
      double v164 = v163;
      [v14 objectAtIndex:7];
      v166 = id v165 = v15;
      [v166 floatValue];
      v168 = [v156 vectorWithX:v158 Y:v161 Z:v164 W:v167];
      v255[13] = v168;
      v169 = [v14 objectAtIndex:9];
      v255[14] = v169;
      v170 = [NSNumber numberWithDouble:v22];
      v255[15] = v170;
      uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v255 count:16];

      id v15 = v165;
      id v16 = v240;

      id v12 = v248;
      uint64_t v28 = [(id)objc_opt_class() bilateralAdd9Kernel];
LABEL_15:
      v171 = (void *)v28;
      v30 = v251;
      [v251 extent];
      v29 = objc_msgSend(v171, "applyWithExtent:roiCallback:arguments:", v252, v27);

      id v20 = v249;
      double v18 = v250;
      break;
    default:
      uint64_t v27 = 0;
      v29 = 0;
      v30 = v251;
      break;
  }

  return v29;
}

uint64_t __68__GUBilateralConvolution_doBilateralPass_points_weights_sums_slope___block_invoke(uint64_t a1, int a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "bilateralAddROI:destRect:userInfo:", a2, *(void *)(a1 + 40));
}

- (CGRect)bilateralAddROI:(int64_t)a3 destRect:(CGRect)result userInfo:(id)a5
{
  if (!a3) {
    -[GUBilateralConvolution enlargedBounds:withPoints:](self, "enlargedBounds:withPoints:", a5, result.origin.x, result.origin.y, result.size.width, result.size.height, v5, v6);
  }
  return result;
}

- (CGRect)enlargedBounds:(CGRect)a3 withPoints:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(GUBilateralConvolution *)self boundsForPointArray:a4];
  double v9 = x + v8;
  double v11 = y + v10;
  double v13 = width + v12;
  double v15 = height + v14;
  result.size.double height = v15;
  result.size.double width = v13;
  result.origin.double y = v11;
  result.origin.double x = v9;
  return result;
}

- (CGRect)boundsForPointArray:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 count])
  {
    id v23 = NUAssertLogger_7453();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      NSUInteger v24 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "points.count > 0");
      *(_DWORD *)buf = 138543362;
      double v37 = v24;
      _os_log_error_impl(&dword_1A9680000, v23, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    NSUInteger v25 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v27 = NUAssertLogger_7453();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v28)
      {
        v31 = dispatch_get_specific(*v25);
        v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        float v34 = [v32 callStackSymbols];
        double v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        double v37 = v31;
        __int16 v38 = 2114;
        double v39 = v35;
        _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v28)
    {
      v29 = [MEMORY[0x1E4F29060] callStackSymbols];
      v30 = [v29 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      double v37 = v30;
      _os_log_error_impl(&dword_1A9680000, v27, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  unint64_t v4 = [v3 count];
  uint64_t v5 = [v3 objectAtIndex:0];
  [v5 X];
  double v7 = v6;
  [v5 Y];
  double v9 = v8;
  if (v4 >= 2)
  {
    uint64_t v10 = 1;
    double v11 = v8;
    double v12 = v7;
    while (1)
    {
      double v13 = v5;
      uint64_t v5 = [v3 objectAtIndex:v10];

      [v5 X];
      double v15 = v14;
      [v5 Y];
      double v17 = v16;
      double v18 = v15 > v7 ? v15 : v7;
      if (v15 >= v12) {
        double v7 = v18;
      }
      else {
        double v12 = v15;
      }
      if (v17 < v11) {
        break;
      }
      if (v17 <= v9) {
        goto LABEL_13;
      }
LABEL_14:
      ++v10;
      double v9 = v17;
      if (v4 == v10) {
        goto LABEL_17;
      }
    }
    double v11 = v17;
LABEL_13:
    double v17 = v9;
    goto LABEL_14;
  }
  double v12 = v7;
  double v11 = v8;
  double v17 = v8;
LABEL_17:

  double v19 = v7 - v12;
  double v20 = v17 - v11;
  double v21 = v12;
  double v22 = v11;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (unint64_t)samplesPerPass
{
  return 6;
}

@end