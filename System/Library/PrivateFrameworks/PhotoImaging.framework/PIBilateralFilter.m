@interface PIBilateralFilter
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)inputEdgeDetail;
- (NSNumber)inputRadius;
- (id)outputImage;
- (void)setInputEdgeDetail:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputRadius:(id)a3;
@end

@implementation PIBilateralFilter

+ (id)customAttributes
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = *MEMORY[0x1E4F1E0D8];
  uint64_t v4 = *MEMORY[0x1E4F1E0E8];
  uint64_t v5 = *MEMORY[0x1E4F1E0E0];
  uint64_t v6 = *MEMORY[0x1E4F1E098];
  uint64_t v7 = *MEMORY[0x1E4F1E0F0];
  v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F1E0D8], &unk_1F000A398, *MEMORY[0x1E4F1E0E8], &unk_1F000A3A8, *MEMORY[0x1E4F1E0E0], &unk_1F000A3B8, *MEMORY[0x1E4F1E098], *MEMORY[0x1E4F1E118], *MEMORY[0x1E4F1E0F0], 0);
  uint64_t v9 = *MEMORY[0x1E4F1E4E0];
  v10 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v3, &unk_1F000A3C8, v4, &unk_1F000A3D8, v5, &unk_1F000A3E8, v6, *MEMORY[0x1E4F1E158], v7, 0);
  v11 = objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v8, v9, v10, @"inputEdgeDetail", 0);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputEdgeDetail, 0);
  objc_storeStrong((id *)&self->_inputRadius, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (void)setInputEdgeDetail:(id)a3
{
}

- (NSNumber)inputEdgeDetail
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputRadius:(id)a3
{
}

- (NSNumber)inputRadius
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
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
  uint64_t v175 = *MEMORY[0x1E4F143B8];
  [(NSNumber *)self->_inputRadius floatValue];
  if (v3 == 0.0) {
    goto LABEL_120;
  }
  double v4 = v3;
  double v5 = v4 + v4;
  uint64_t v6 = vcvtpd_s64_f64(v4 + v4);
  if (v6 >= 101)
  {
    v134 = NUAssertLogger_7453();
    if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
    {
      v135 = [NSString stringWithFormat:@"ridiculously large radius for bilateral filter"];
      *(_DWORD *)buf = 138543362;
      v172 = v135;
      _os_log_error_impl(&dword_1A9680000, v134, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v136 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v138 = NUAssertLogger_7453();
    BOOL v139 = os_log_type_enabled(v138, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v139)
      {
        v142 = dispatch_get_specific(*v136);
        v143 = (void *)MEMORY[0x1E4F29060];
        id v144 = v142;
        v145 = [v143 callStackSymbols];
        v146 = [v145 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v172 = v142;
        __int16 v173 = 2114;
        v174 = v146;
        _os_log_error_impl(&dword_1A9680000, v138, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v139)
    {
      v140 = [MEMORY[0x1E4F29060] callStackSymbols];
      v141 = [v140 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v172 = v141;
      _os_log_error_impl(&dword_1A9680000, v138, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
LABEL_132:
    v147 = NUAssertLogger_7453();
    if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
    {
      v148 = [NSString stringWithFormat:@"unable to allocate convolution table in bilateral filter"];
      *(_DWORD *)buf = 138543362;
      v172 = v148;
      _os_log_error_impl(&dword_1A9680000, v147, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v149 = (const void **)MEMORY[0x1E4F7A308];
    v150 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v151 = NUAssertLogger_7453();
    BOOL v152 = os_log_type_enabled(v151, OS_LOG_TYPE_ERROR);
    if (v150)
    {
      if (v152)
      {
        v155 = dispatch_get_specific(*v149);
        v156 = (void *)MEMORY[0x1E4F29060];
        id v157 = v155;
        v158 = [v156 callStackSymbols];
        v159 = [v158 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v172 = v155;
        __int16 v173 = 2114;
        v174 = v159;
        _os_log_error_impl(&dword_1A9680000, v151, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v152)
    {
      v153 = [MEMORY[0x1E4F29060] callStackSymbols];
      v154 = [v153 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v172 = v154;
      _os_log_error_impl(&dword_1A9680000, v151, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  if (v3 <= 0.5)
  {
LABEL_120:
    v32 = self->_inputImage;
    goto LABEL_121;
  }
  if (v4 <= 1.05)
  {
    v33 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    v34 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    double v35 = 0.0;
    double v36 = hypot(1.0, 0.0) / v5;
    double v37 = 0.0;
    if (v36 >= 0.0)
    {
      double v37 = 1.0;
      if (v36 <= 1.0) {
        double v37 = (v36 * -2.0 + 3.0) * (v36 * v36);
      }
    }
    double v38 = 1.0 - v37;
    double v39 = hypot(1.0, 1.0) / v5;
    if (v39 >= 0.0)
    {
      double v35 = 1.0;
      if (v39 <= 1.0) {
        double v35 = (v39 * -2.0 + 3.0) * (v39 * v39);
      }
    }
    v40 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithX:Y:Z:W:");
    [v33 addObject:v40];

    v41 = [MEMORY[0x1E4F1E080] vectorWithX:1.0 Y:1.0 Z:1.0 W:-1.0];
    [v33 addObject:v41];

    v42 = [NSNumber numberWithDouble:v38];
    [v34 addObject:v42];

    v43 = NSNumber;
    double v44 = 1.0 - v35;
    goto LABEL_118;
  }
  if (v3 <= 1.5)
  {
    v33 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:5];
    v34 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:5];
    double v45 = hypot(1.0, 0.0) / v5;
    double v46 = (v45 * -2.0 + 3.0) * (v45 * v45);
    if (v45 > 1.0) {
      double v46 = 1.0;
    }
    if (v45 >= 0.0) {
      double v47 = v46;
    }
    else {
      double v47 = 0.0;
    }
    double v48 = 1.0 - v47;
    double v49 = hypot(1.0, 1.0) / v5;
    double v50 = (v49 * -2.0 + 3.0) * (v49 * v49);
    if (v49 > 1.0) {
      double v50 = 1.0;
    }
    if (v49 >= 0.0) {
      double v51 = v50;
    }
    else {
      double v51 = 0.0;
    }
    double v52 = 1.0 - v51;
    double v53 = hypot(2.0, 0.0) / v5;
    double v54 = (v53 * -2.0 + 3.0) * (v53 * v53);
    if (v53 > 1.0) {
      double v54 = 1.0;
    }
    if (v53 >= 0.0) {
      double v55 = v54;
    }
    else {
      double v55 = 0.0;
    }
    double v56 = 1.0 - v55;
    double v57 = hypot(2.0, 1.0) / v5;
    double v58 = (v57 * -2.0 + 3.0) * (v57 * v57);
    double v59 = 1.0 - v58;
    if (v57 > 1.0)
    {
      double v59 = 0.0;
      double v58 = 1.0;
    }
    if (v57 >= 0.0) {
      double v60 = v59;
    }
    else {
      double v60 = 1.0;
    }
    if (v57 >= 0.0) {
      double v61 = v58;
    }
    else {
      double v61 = 0.0;
    }
    double v62 = 1.0 - v61;
    v63 = [MEMORY[0x1E4F1E080] vectorWithX:1.0 Y:0.0 Z:0.0 W:-1.0];
    [v33 addObject:v63];

    v64 = [MEMORY[0x1E4F1E080] vectorWithX:1.0 Y:1.0 Z:1.0 W:-1.0];
    [v33 addObject:v64];

    v65 = [MEMORY[0x1E4F1E080] vectorWithX:2.0 Y:0.0 Z:0.0 W:-2.0];
    [v33 addObject:v65];

    v66 = [MEMORY[0x1E4F1E080] vectorWithX:2.0 Y:1.0 Z:2.0 W:-1.0];
    [v33 addObject:v66];

    v67 = [MEMORY[0x1E4F1E080] vectorWithX:1.0 Y:2.0 Z:1.0 W:-2.0];
    [v33 addObject:v67];

    v68 = [NSNumber numberWithDouble:v48];
    [v34 addObject:v68];

    v69 = [NSNumber numberWithDouble:v52];
    [v34 addObject:v69];

    v70 = [NSNumber numberWithDouble:v56];
    [v34 addObject:v70];

    v71 = [NSNumber numberWithDouble:v60];
    [v34 addObject:v71];

    v43 = NSNumber;
    double v44 = v62;
    goto LABEL_118;
  }
  if (v4 <= 2.1)
  {
    v33 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:11];
    v34 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:11];
    double v72 = hypot(1.0, 0.0) / v5;
    double v73 = (v72 * -2.0 + 3.0) * (v72 * v72);
    if (v72 > 1.0) {
      double v73 = 1.0;
    }
    if (v72 >= 0.0) {
      double v74 = v73;
    }
    else {
      double v74 = 0.0;
    }
    double v75 = 1.0 - v74;
    double v76 = hypot(1.0, 1.0) / v5;
    double v77 = (v76 * -2.0 + 3.0) * (v76 * v76);
    if (v76 > 1.0) {
      double v77 = 1.0;
    }
    if (v76 >= 0.0) {
      double v78 = v77;
    }
    else {
      double v78 = 0.0;
    }
    double v170 = 1.0 - v78;
    double v79 = hypot(2.0, 0.0) / v5;
    double v80 = (v79 * -2.0 + 3.0) * (v79 * v79);
    if (v79 > 1.0) {
      double v80 = 1.0;
    }
    if (v79 >= 0.0) {
      double v81 = v80;
    }
    else {
      double v81 = 0.0;
    }
    double v168 = 1.0 - v81;
    double v82 = hypot(2.0, 1.0) / v5;
    double v83 = (v82 * -2.0 + 3.0) * (v82 * v82);
    if (v82 > 1.0) {
      double v83 = 1.0;
    }
    if (v82 >= 0.0) {
      double v84 = v83;
    }
    else {
      double v84 = 0.0;
    }
    double v166 = 1.0 - v84;
    double v85 = hypot(1.0, 2.0) / v5;
    double v86 = (v85 * -2.0 + 3.0) * (v85 * v85);
    if (v85 > 1.0) {
      double v86 = 1.0;
    }
    if (v85 >= 0.0) {
      double v87 = v86;
    }
    else {
      double v87 = 0.0;
    }
    double v164 = 1.0 - v87;
    double v88 = hypot(2.0, 2.0) / v5;
    double v89 = (v88 * -2.0 + 3.0) * (v88 * v88);
    if (v88 > 1.0) {
      double v89 = 1.0;
    }
    if (v88 >= 0.0) {
      double v90 = v89;
    }
    else {
      double v90 = 0.0;
    }
    double v162 = 1.0 - v90;
    double v91 = hypot(3.0, 0.0) / v5;
    double v92 = (v91 * -2.0 + 3.0) * (v91 * v91);
    if (v91 > 1.0) {
      double v92 = 1.0;
    }
    if (v91 >= 0.0) {
      double v93 = v92;
    }
    else {
      double v93 = 0.0;
    }
    double v161 = 1.0 - v93;
    double v94 = hypot(3.0, 1.0) / v5;
    double v95 = (v94 * -2.0 + 3.0) * (v94 * v94);
    if (v94 > 1.0) {
      double v95 = 1.0;
    }
    if (v94 >= 0.0) {
      double v96 = v95;
    }
    else {
      double v96 = 0.0;
    }
    double v160 = 1.0 - v96;
    double v97 = hypot(1.0, 3.0) / v5;
    double v98 = (v97 * -2.0 + 3.0) * (v97 * v97);
    if (v97 > 1.0) {
      double v98 = 1.0;
    }
    if (v97 >= 0.0) {
      double v99 = v98;
    }
    else {
      double v99 = 0.0;
    }
    double v100 = 1.0 - v99;
    double v101 = hypot(3.0, 2.0) / v5;
    double v102 = (v101 * -2.0 + 3.0) * (v101 * v101);
    if (v101 > 1.0) {
      double v102 = 1.0;
    }
    if (v101 >= 0.0) {
      double v103 = v102;
    }
    else {
      double v103 = 0.0;
    }
    double v104 = 1.0 - v103;
    double v105 = hypot(2.0, 3.0) / v5;
    double v106 = (v105 * -2.0 + 3.0) * (v105 * v105);
    if (v105 > 1.0) {
      double v106 = 1.0;
    }
    if (v105 >= 0.0) {
      double v107 = v106;
    }
    else {
      double v107 = 0.0;
    }
    double v108 = 1.0 - v107;
    v109 = [MEMORY[0x1E4F1E080] vectorWithX:1.0 Y:0.0 Z:0.0 W:-1.0];
    [v33 addObject:v109];

    v110 = [MEMORY[0x1E4F1E080] vectorWithX:1.0 Y:1.0 Z:1.0 W:-1.0];
    [v33 addObject:v110];

    v111 = [MEMORY[0x1E4F1E080] vectorWithX:2.0 Y:0.0 Z:0.0 W:-2.0];
    [v33 addObject:v111];

    v112 = [MEMORY[0x1E4F1E080] vectorWithX:2.0 Y:1.0 Z:2.0 W:-1.0];
    [v33 addObject:v112];

    v113 = [MEMORY[0x1E4F1E080] vectorWithX:1.0 Y:2.0 Z:1.0 W:-2.0];
    [v33 addObject:v113];

    v114 = [MEMORY[0x1E4F1E080] vectorWithX:2.0 Y:2.0 Z:2.0 W:-2.0];
    [v33 addObject:v114];

    v115 = [MEMORY[0x1E4F1E080] vectorWithX:3.0 Y:0.0 Z:0.0 W:-3.0];
    [v33 addObject:v115];

    v116 = [MEMORY[0x1E4F1E080] vectorWithX:3.0 Y:1.0 Z:3.0 W:-1.0];
    [v33 addObject:v116];

    v117 = [MEMORY[0x1E4F1E080] vectorWithX:1.0 Y:3.0 Z:1.0 W:-3.0];
    [v33 addObject:v117];

    v118 = [MEMORY[0x1E4F1E080] vectorWithX:3.0 Y:2.0 Z:3.0 W:-2.0];
    [v33 addObject:v118];

    v119 = [MEMORY[0x1E4F1E080] vectorWithX:2.0 Y:3.0 Z:2.0 W:-3.0];
    [v33 addObject:v119];

    v120 = [NSNumber numberWithDouble:v75];
    [v34 addObject:v120];

    v121 = [NSNumber numberWithDouble:v170];
    [v34 addObject:v121];

    v122 = [NSNumber numberWithDouble:v168];
    [v34 addObject:v122];

    v123 = [NSNumber numberWithDouble:v166];
    [v34 addObject:v123];

    v124 = [NSNumber numberWithDouble:v164];
    [v34 addObject:v124];

    v125 = [NSNumber numberWithDouble:v162];
    [v34 addObject:v125];

    v126 = [NSNumber numberWithDouble:v161];
    [v34 addObject:v126];

    v127 = [NSNumber numberWithDouble:v160];
    [v34 addObject:v127];

    v128 = [NSNumber numberWithDouble:v100];
    [v34 addObject:v128];

    v129 = [NSNumber numberWithDouble:v104];
    [v34 addObject:v129];

    v43 = NSNumber;
    double v44 = v108;
LABEL_118:
    v130 = [v43 numberWithDouble:v44];
    [v34 addObject:v130];

    v131 = objc_alloc_init(GUBWBilateralConvolution);
    uint64_t v132 = *MEMORY[0x1E4F1E480];
    [(GUBWBilateralConvolution *)v131 setValue:self->_inputImage forKey:*MEMORY[0x1E4F1E480]];
    [(GUBWBilateralConvolution *)v131 setValue:v33 forKey:@"inputPoints"];
    [(GUBWBilateralConvolution *)v131 setValue:v34 forKey:@"inputWeights"];
    [(GUBWBilateralConvolution *)v131 setValue:self->_inputEdgeDetail forKey:@"inputEdgeDetail"];
    v32 = [(GUBWBilateralConvolution *)v131 valueForKey:*MEMORY[0x1E4F1E520]];
    [(GUBWBilateralConvolution *)v131 setValue:0 forKey:v132];

    goto LABEL_121;
  }
  uint64_t v7 = 2 * v6 - 1;
  v8 = (double *)malloc_type_calloc(8uLL, v7 * v7, 0xF572C6DCuLL);
  if (!v8) {
    goto LABEL_132;
  }
  uint64_t v9 = v8;
  double v10 = 0.0;
  if (1 - v6 < v6)
  {
    uint64_t v11 = 0;
    uint64_t v12 = 1 - v6;
    do
    {
      uint64_t v13 = 2 * v6 - 1;
      uint64_t v14 = 1 - v6;
      do
      {
        double v15 = sqrt((double)v12 / v5 * ((double)v12 / v5) + (double)v14 / v5 * ((double)v14 / v5));
        double v16 = 0.0;
        if (v15 < 1.0)
        {
          double v16 = -((v15 * -2.0 + 3.0) * v15) * v15 + 1.0;
          double v10 = v10 + v16;
        }
        v8[v11] = v16;
        ++v14;
        ++v11;
        --v13;
      }
      while (v13);
      ++v12;
    }
    while (v12 != v6);
  }
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  if ((unint64_t)(v7 * v7) <= 1) {
    uint64_t v19 = 1;
  }
  else {
    uint64_t v19 = v7 * v7;
  }
  double v20 = 1.0 / v10;
  do
  {
    double v21 = v8[v17];
    if (v21 != 0.0)
    {
      ++v18;
      v8[v17] = v20 * v21;
    }
    ++v17;
  }
  while (v19 != v17);
  if (!v18)
  {
    free(v8);
    goto LABEL_120;
  }
  v163 = self;
  v22 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v18];
  v23 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v18];
  uint64_t v169 = 1 - v6;
  if (1 - v6 < v6)
  {
    uint64_t v24 = 0;
    uint64_t v25 = 1 - v6;
    uint64_t v165 = 2 * v6 - 1;
    uint64_t v167 = v6;
    do
    {
      uint64_t v26 = v169;
      do
      {
        if (v9[v24] != 0.0)
        {
          v27 = [MEMORY[0x1E4F1E080] vectorWithX:(double)v26 Y:(double)v25];
          [v22 addObject:v27];

          double v28 = v9[v24];
          *(float *)&double v28 = v28;
          v29 = [NSNumber numberWithFloat:v28];
          [v23 addObject:v29];
        }
        ++v26;
        ++v24;
        --v7;
      }
      while (v7);
      ++v25;
      uint64_t v7 = v165;
    }
    while (v25 != v167);
  }
  free(v9);
  v30 = objc_alloc_init(GUBilateralConvolution);
  uint64_t v31 = *MEMORY[0x1E4F1E480];
  [(GUBilateralConvolution *)v30 setValue:v163->_inputImage forKey:*MEMORY[0x1E4F1E480]];
  [(GUBilateralConvolution *)v30 setValue:v22 forKey:@"inputPoints"];
  [(GUBilateralConvolution *)v30 setValue:v23 forKey:@"inputWeights"];
  [(GUBilateralConvolution *)v30 setValue:v163->_inputEdgeDetail forKey:@"inputEdgeDetail"];
  v32 = [(GUBilateralConvolution *)v30 valueForKey:*MEMORY[0x1E4F1E520]];
  [(GUBilateralConvolution *)v30 setValue:0 forKey:v31];

LABEL_121:
  return v32;
}

@end