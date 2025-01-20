@interface PISmartBlackAndWhiteAutoCalculator
- (id)_calculateBlackAndWhiteSettingsFromBufferImage:(id)a3;
- (void)submit:(id)a3;
@end

@implementation PISmartBlackAndWhiteAutoCalculator

- (void)submit:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v10 = NUAssertLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "completion != nil");
      *(_DWORD *)buf = 138543362;
      v24 = v11;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v12 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v14 = NUAssertLogger();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific(*v12);
        v19 = [MEMORY[0x1E4F29060] callStackSymbols];
        v20 = [v19 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v24 = v18;
        __int16 v25 = 2114;
        v26 = v20;
        _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v24 = v17;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
    __break(1u);
  }
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F7A3B8]) initWithRequest:self];
  [v5 setName:@"PISmartBlackAndWhiteAutoCalculator-renderInputImage"];
  v6 = [MEMORY[0x1E4F7A5D8] RGBAh];
  [v5 setPixelFormat:v6];

  v7 = [MEMORY[0x1E4F7A400] sRGBLinearColorSpace];
  [v5 setColorSpace:v7];

  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F7A468]), "initWithTargetPixelSize:", 100, 100);
  [v5 setScalePolicy:v8];

  [v5 setSampleMode:1];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __45__PISmartBlackAndWhiteAutoCalculator_submit___block_invoke;
  v21[3] = &unk_1E5D81798;
  v21[4] = self;
  id v9 = v4;
  id v22 = v9;
  [v5 submit:v21];
}

void __45__PISmartBlackAndWhiteAutoCalculator_submit___block_invoke(uint64_t a1, void *a2)
{
  id v8 = 0;
  v3 = [a2 result:&v8];
  id v4 = v8;
  v5 = [v3 image];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) _calculateBlackAndWhiteSettingsFromBufferImage:v5];
  }
  else
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F7A660]) initWithError:v4];
  }
  v7 = (void *)v6;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_calculateBlackAndWhiteSettingsFromBufferImage:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__18777;
  v12 = __Block_byref_object_dispose__18778;
  id v13 = 0;
  id v4 = [v3 validRegion];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__PISmartBlackAndWhiteAutoCalculator__calculateBlackAndWhiteSettingsFromBufferImage___block_invoke;
  v7[3] = &unk_1E5D80918;
  v7[4] = &v8;
  [v3 readBufferRegion:v4 withBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __85__PISmartBlackAndWhiteAutoCalculator__calculateBlackAndWhiteSettingsFromBufferImage___block_invoke(uint64_t a1, void *a2)
{
  v64[4] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v53 = 0;
  v54 = (float *)&v53;
  uint64_t v55 = 0x5012000000;
  v56 = __Block_byref_object_copy__39;
  v57 = __Block_byref_object_dispose__40;
  v58 = &unk_1A984BDE3;
  long long v60 = xmmword_1A980B9E0;
  int32x2_t v61 = vdup_n_s32(0x3EAAAAABu);
  int v59 = 0;
  int v62 = 1051372203;
  long long v52 = *MEMORY[0x1E4F7A328];
  id v3 = [v2 buffer];
  uint64_t v4 = [v3 size];
  uint64_t v6 = v5;

  v7 = [MEMORY[0x1E4F7A448] sharedFactory];
  uint64_t v8 = [v7 bufferFactory];
  id v9 = [v2 buffer];
  uint64_t v10 = [v9 size];
  uint64_t v12 = v11;
  id v13 = [MEMORY[0x1E4F7A5D8] RGBAf];
  v14 = objc_msgSend(v8, "newStorageWithSize:format:", v10, v12, v13);

  long long v49 = v52;
  uint64_t v50 = v4;
  uint64_t v51 = v6;
  BOOL v15 = [MEMORY[0x1E4F7A5F8] regionWithRect:&v49];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __85__PISmartBlackAndWhiteAutoCalculator__calculateBlackAndWhiteSettingsFromBufferImage___block_invoke_45;
  v43[3] = &unk_1E5D808F0;
  id v16 = v2;
  long long v46 = v52;
  uint64_t v47 = v4;
  uint64_t v48 = v6;
  id v44 = v16;
  v45 = &v53;
  [v14 writeBufferInRegion:v15 block:v43];

  v17 = [MEMORY[0x1E4F7A448] sharedFactory];
  v18 = [v17 bufferFactory];
  [v18 returnStorage:v14];

  v20 = v54;
  if (*((unsigned char *)v54 + 48))
  {
    *(float *)&double v19 = v54[13];
    goto LABEL_14;
  }
  *((unsigned char *)v54 + 48) = 1;
  float v21 = v20[13];
  double v19 = v21;
  if (v21 <= 0.35)
  {
    double v22 = 0.35 - v19;
    double v23 = -2.0;
  }
  else
  {
    if (v21 >= 0.85)
    {
      *(float *)&double v19 = (float)((float)(v21 + -0.85) * 2.0) + -1.0;
      goto LABEL_9;
    }
    double v22 = v19 + -0.35;
    double v23 = 2.0;
  }
  double v19 = v22 * v23 + 0.0;
  *(float *)&double v19 = v19;
LABEL_9:
  float v24 = v20[14];
  float v25 = v20[15];
  float v26 = v24 * 1.25;
  BOOL v27 = v24 > 0.4;
  float v28 = (float)((float)(v24 + -0.4) * 0.83333) + 0.5;
  if (!v27) {
    float v28 = v26;
  }
  v20[13] = *(float *)&v19;
  v20[14] = v28;
  float v29 = v25 + -1.0;
  float v30 = v20[16];
  if (v30 > 0.0) {
    float v30 = v30 * 0.5;
  }
  v20[15] = v29;
  v20[16] = v30;
LABEL_14:
  v63[0] = @"inputHue";
  v31 = [NSNumber numberWithFloat:v19];
  v64[0] = v31;
  v63[1] = @"inputStrength";
  *(float *)&double v32 = v54[14];
  v33 = [NSNumber numberWithFloat:v32];
  v64[1] = v33;
  v63[2] = @"inputNeutralGamma";
  *(float *)&double v34 = v54[15];
  v35 = [NSNumber numberWithFloat:v34];
  v64[2] = v35;
  v63[3] = @"inputTone";
  *(float *)&double v36 = v54[16];
  v37 = [NSNumber numberWithFloat:v36];
  v64[3] = v37;
  v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:4];

  uint64_t v39 = [objc_alloc(MEMORY[0x1E4F7A660]) initWithResult:v38];
  uint64_t v40 = *(void *)(*(void *)(a1 + 32) + 8);
  v41 = *(void **)(v40 + 40);
  *(void *)(v40 + 40) = v39;

  _Block_object_dispose(&v53, 8);
}

void __85__PISmartBlackAndWhiteAutoCalculator__calculateBlackAndWhiteSettingsFromBufferImage___block_invoke_45(uint64_t a1, void *a2)
{
  uint64_t v172 = *MEMORY[0x1E4F143B8];
  id v135 = a2;
  memset(&src, 0, sizeof(src));
  id v3 = [*(id *)(a1 + 32) buffer];
  uint64_t v4 = (void *)[v3 bytes];
  uint64_t v6 = *(void *)(a1 + 64);
  vImagePixelCount v5 = *(void *)(a1 + 72);
  src.data = v4;
  src.height = v5;
  src.width = 4 * v6;
  v7 = [*(id *)(a1 + 32) buffer];
  src.rowBytes = [v7 rowBytes];

  memset(&dest, 0, sizeof(dest));
  uint64_t v8 = (void *)[v135 bytes];
  uint64_t v10 = *(void *)(a1 + 64);
  vImagePixelCount v9 = *(void *)(a1 + 72);
  dest.data = v8;
  dest.height = v9;
  dest.width = 4 * v10;
  dest.rowBytes = [v135 rowBytes];
  vImageConvert_Planar16FtoPlanarF(&src, &dest, 0);
  v133 = [MEMORY[0x1E4F7A400] sRGBLinearColorSpace];
  uint64_t v11 = [v133 CGColorSpace];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  id v13 = v135;
  *(_DWORD *)(v12 + 48) = 0;
  *(_OWORD *)(v12 + 52) = xmmword_1A980B9E0;
  *(int32x2_t *)(v12 + 68) = vdup_n_s32(0x3EAAAAABu);
  *(_DWORD *)(v12 + 76) = 1051372203;
  id v136 = v13;
  if (!v13) {
    goto LABEL_122;
  }
  v14 = [PIMsgImageBuffer alloc];
  uint64_t v15 = [v136 bytes];
  uint64_t v16 = [v136 size];
  [v136 size];
  uint64_t v18 = v17;
  uint64_t v19 = [v136 rowBytes];
  v20 = [v136 format];
  uint64_t v21 = [v20 bytesPerPixel];
  if (v21 >= 0) {
    uint64_t v22 = v21;
  }
  else {
    uint64_t v22 = v21 + 3;
  }
  double v23 = [v136 format];
  float v24 = -[PIMsgImageBuffer initWithBytes:width:height:bytesPerRow:bytesPerComponent:format:colorspace:](v14, "initWithBytes:width:height:bytesPerRow:bytesPerComponent:format:colorspace:", v15, v16, v18, v19, v22 >> 2, [v23 CIFormat], v11);

  v134 = v24;
  float v25 = v134;
  if (v134)
  {
    uint64_t v145 = [(PIMsgImageBuffer *)v134 bytes];
    uint64_t v144 = [(PIMsgImageBuffer *)v134 rowElements];
    uint64_t v26 = [(PIMsgImageBuffer *)v134 width];
    uint64_t v146 = [(PIMsgImageBuffer *)v134 height];
    float v25 = v134;
  }
  else
  {
    uint64_t v144 = 0;
    uint64_t v145 = 0;
    uint64_t v26 = 0;
    uint64_t v146 = 0;
  }

  int64x2_t v138 = vdupq_n_s64(0x3FD5555555555555uLL);
  unint64_t v27 = v146 * v26;
  char v28 = 1;
  do
  {
    char v29 = v28;
    LODWORD(v159[0]) = 3;
    memset((char *)v159 + 4, 0, 28);
    unsigned int v155 = 3;
    uint64_t v157 = 0;
    long long v156 = 0uLL;
    int v158 = 0;
    std::vector<double>::vector(&v153, v27);
    std::vector<double>::vector(v152, v27);
    char v143 = v29;
    if (v146)
    {
      uint64_t v30 = 0;
      uint64_t v31 = 0;
      double v32 = 0.0;
      do
      {
        if (v26)
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            uint64_t v34 = 0;
            uint64_t v35 = v145 + 4 * v144 * v31 + 16 * i;
            float v37 = *(float *)(v35 + 4);
            LODWORD(v164) = *(_DWORD *)v35;
            float v36 = *(float *)&v164;
            *((float *)&v164 + 1) = v37;
            v165 = *(void **)(v35 + 8);
            *((double *)v152[0] + v30) = sqrtf(vmlas_n_f32((float)(v37 * (float)(v37 * *(float *)(v12 + 72)))+ (float)((float)(*(float *)&v164 * *(float *)(v12 + 68)) * *(float *)&v164), *(float *)(v12 + 76) * *(float *)&v165, *(float *)&v165));
            double v38 = v36;
            double v39 = v38;
            do
            {
              double v40 = *(float *)((char *)&v164 + v34);
              if (v39 > v40) {
                double v39 = *(float *)((char *)&v164 + v34);
              }
              if (v38 < v40) {
                double v38 = *(float *)((char *)&v164 + v34);
              }
              v34 += 4;
            }
            while (v34 != 12);
            uint64_t v41 = 0;
            double v42 = v38 - v39;
            *((double *)v153 + v30) = v38 - v39;
            do
            {
              *(double *)&buf[8 * v41] = *((float *)&v164 + v41);
              ++v41;
            }
            while (v41 != 3);
            MsgMatrix<double>::AppendRow<double>((uint64_t)v159, (uint64_t)buf);
            double v32 = v32 + v42;
            ++v30;
          }
        }
        ++v31;
      }
      while (v31 != v146);
      uint64_t v43 = 0;
      uint64_t v44 = 0;
      uint64_t v45 = 0;
      double v46 = v32 / (double)(unint64_t)((v154 - (unsigned char *)v153) >> 3);
      do
      {
        if (v26)
        {
          v44 += v26;
          uint64_t v47 = v43;
          uint64_t v48 = v26;
          do
          {
            double v49 = *(double *)((char *)v153 + v47);
            BOOL v50 = v49 > v46;
            double v51 = v49 * 0.5;
            *(void *)buf = *(void *)((char *)v152[0] + v47);
            *(double *)&buf[8] = v51 + *(double *)buf;
            *(void *)&buf[16] = 0;
            double v168 = v51 + 1.0;
            v164 = *(char **)&buf[16 * v50 + 8 * (*(double *)buf > 0.217)];
            v165 = v164;
            v166 = v164;
            MsgMatrix<double>::AppendRow<double>((uint64_t)&v155, (uint64_t)&v164);
            v47 += 8;
            --v48;
          }
          while (v48);
        }
        ++v45;
        v43 += 8 * v26;
      }
      while (v45 != v146);
    }
    MsgMatrix<double>::T((unsigned int *)buf, (unsigned int *)v159);
    MsgMatrix<double>::T((unsigned int *)&v164, &v155);
    unsigned int v52 = v159[0];
    uint64_t v163 = v159[0];
    int v161 = 0;
    char v160 = 78;
    std::vector<double>::vector(&v169, 0x100uLL);
    uint64_t v53 = v169;
    int v162 = -1;
    double *v169 = 0.0;
    dgels_NEWLAPACK();
    double v54 = *v53;
    if (*v53 <= 256.0)
    {
      int v162 = 256;
      goto LABEL_51;
    }
    int v162 = (int)v54;
    unint64_t v55 = (int)v54;
    v56 = v170;
    unint64_t v57 = (v170 - (char *)v169) >> 3;
    if (v55 > v57)
    {
      unint64_t v58 = v55 - v57;
      if (v55 - v57 > (v171 - v170) >> 3)
      {
        if ((v55 & 0x80000000) != 0) {
          std::vector<float>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v141 = v55 - v57;
        uint64_t v59 = v171 - (char *)v169;
        if ((v171 - (char *)v169) >> 2 > v55) {
          unint64_t v55 = v59 >> 2;
        }
        if ((unint64_t)v59 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v60 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v60 = v55;
        }
        int32x2_t v61 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v60);
        uint64_t v139 = v62;
        v64 = v169;
        v63 = (double *)v170;
        v137 = v61;
        v65 = &v61[8 * v57];
        bzero(v65, 8 * v141);
        v66 = v65;
        if (v63 == v64)
        {
          uint64_t v67 = v139;
        }
        else
        {
          uint64_t v67 = v139;
          do
          {
            uint64_t v68 = *((void *)v63-- - 1);
            *((void *)v66 - 1) = v68;
            v66 -= 8;
          }
          while (v63 != v64);
        }
        v169 = (double *)v66;
        v170 = &v65[8 * v141];
        v171 = &v137[8 * v67];
        if (v64) {
          operator delete(v64);
        }
        goto LABEL_50;
      }
      bzero(v170, 8 * v58);
      v69 = &v56[8 * v58];
      goto LABEL_46;
    }
    if (v55 < v57)
    {
      v69 = (char *)&v169[v55];
LABEL_46:
      v170 = v69;
    }
LABEL_50:
    uint64_t v53 = v169;
LABEL_51:
    v132 = v53;
    dgels_NEWLAPACK();
    if (v169)
    {
      v170 = (char *)v169;
      operator delete(v169);
    }
    v169 = 0;
    unsigned int v149 = v52;
    unsigned int v150 = v52;
    std::vector<double>::vector(__p, v52 * v52, &v169);
    uint64_t v70 = v150;
    if (v150)
    {
      unint64_t v71 = 0;
      do
      {
        uint64_t v72 = v149;
        if (v149)
        {
          unint64_t v73 = 0;
          do
          {
            uint64_t v74 = *(void *)MsgMatrix<double>::operator()((unsigned int *)&v164, v73, v71);
            *(void *)MsgMatrix<double>::operator()(&v149, v73++, v71) = v74;
          }
          while (v72 != v73);
        }
        ++v71;
      }
      while (v71 != v70);
    }
    if (v165)
    {
      v166 = v165;
      operator delete(v165);
    }
    if (*(void *)&buf[8])
    {
      *(void *)&buf[16] = *(void *)&buf[8];
      operator delete(*(void **)&buf[8]);
    }
    unint64_t v75 = 0;
    double v76 = fabs(*(double *)MsgMatrix<double>::operator()(&v149, 0, 0));
    do
      double v76 = fmax(v76, fabs(*(double *)MsgMatrix<double>::operator()(&v149, v75++, 0)));
    while (v75 != 3);
    unint64_t v77 = 0;
    double v78 = 0.0;
    do
    {
      double v79 = *(double *)MsgMatrix<double>::operator()(&v149, v77, 0) / v76;
      *(double *)&buf[8 * v77] = v79;
      double v78 = v78 + v79;
      ++v77;
    }
    while (v77 != 3);
    double v80 = fabs(v78);
    if (v80 < 0.000001 || v80 > 1000000000.0)
    {
      *(void *)&buf[16] = 0x3FD5555555555555;
      *(int64x2_t *)buf = v138;
      double v78 = 1.0;
    }
    for (uint64_t j = 0; j != 24; j += 8)
      *(double *)&buf[j] = *(double *)&buf[j] / v78;
    uint64_t v82 = 0;
    float v83 = *(double *)buf;
    float v84 = *(double *)&buf[8];
    float v85 = *(double *)&buf[16];
    v86 = (float *)&dword_1A980BE94;
    do
    {
      float v87 = (float)(*(v86 - 1) * v84) + (float)(*(v86 - 2) * v83);
      float v88 = *v86;
      v86 += 3;
      *(float *)((char *)&v164 + v82) = v87 + (float)(v88 * v85);
      v82 += 4;
    }
    while (v82 != 12);
    uint64_t v89 = 0;
    v169 = (double *)v164;
    LODWORD(v170) = v165;
    do
    {
      float v90 = *(float *)((char *)&v169 + v89);
      float v91 = powf(fabsf(v90), 0.43);
      if (v90 < 0.0) {
        float v91 = -v91;
      }
      *(float *)((char *)&v169 + v89) = v91;
      v89 += 4;
    }
    while (v89 != 12);
    uint64_t v92 = 0;
    v93 = v169;
    v94 = (float *)&dword_1A980BEB8;
    float v95 = *(float *)&v170;
    do
    {
      float v96 = (float)(*((float *)&v93 + 1) * *(v94 - 1)) + (float)(*(v94 - 2) * *(float *)&v93);
      float v97 = *v94;
      v94 += 3;
      *(float *)((char *)&v164 + v92) = v96 + (float)(v97 * v95);
      v92 += 4;
    }
    while (v92 != 12);
    LODWORD(v170) = v165;
    v169 = (double *)v164;
    float v98 = *((float *)&v164 + 1);
    float v99 = *(float *)&v165;
    unint64_t v27 = v146 * v26;
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v152[0])
    {
      v152[1] = v152[0];
      operator delete(v152[0]);
    }
    if (v153)
    {
      v154 = v153;
      operator delete(v153);
    }
    if (*(void *)((char *)&v156 + 4)) {
      operator delete(*(void **)((char *)&v156 + 4));
    }
    if (v159[1]) {
      operator delete((void *)v159[1]);
    }
    float v100 = atan2f(v99, v98) / 6.28318531;
    float v101 = v100 + 0.5;
    *(float *)(v12 + 52) = v100 + 0.5;
    float v140 = *(float *)(v12 + 56);
    double v102 = v140;
    double v103 = v140 * cos((float)(0.60167 - (float)(v100 + 0.5)) * 6.28318531) + 1.0;
    if (v103 <= 1.0) {
      double v104 = v103 * -2.0 + 3.0;
    }
    else {
      double v104 = (v103 + -1.0) * -0.55 + 1.0;
    }
    float v105 = v104;
    float v142 = powf(0.3, v105);
    double v106 = v102 * cos((float)(0.8663 - v101) * 6.28318531) + 1.0;
    if (v106 <= 1.0) {
      double v107 = v106 * -2.0 + 3.0;
    }
    else {
      double v107 = (v106 + -1.0) * -0.55 + 1.0;
    }
    float v108 = v107;
    float v109 = powf(0.6, v108);
    double v110 = v102 * cos((float)(0.22284 - v101) * 6.28318531) + 1.0;
    if (v110 <= 1.0) {
      double v111 = v110 * -2.0 + 3.0;
    }
    else {
      double v111 = (v110 + -1.0) * -0.55 + 1.0;
    }
    float v112 = v111;
    float v113 = powf(0.1, v112);
    char v28 = 0;
    float v114 = v113 + (float)(v142 + v109);
    float v115 = v113 / v114;
    *(float *)(v12 + 68) = v142 / v114;
    *(float *)(v12 + 72) = v109 / v114;
    *(float *)(v12 + 76) = v115;
  }
  while ((v143 & 1) != 0);
  BOOL v117 = COERCE_UNSIGNED_INT(fabs(v142 / v114)) <= 0x7F7FFFFF
      && COERCE_UNSIGNED_INT(fabs(v109 / v114)) <= 0x7F7FFFFF
      && (LODWORD(v115) & 0x7FFFFFFFu) <= 0x7F7FFFFF;
  if (!v117
    || (((LODWORD(v101) & 0x7FFFFFFFu) - 0x800000) >> 24 > 0x7E
      ? (BOOL v127 = (LODWORD(v101) & 0x7FFFFFFFu) - 1 > 0x7FFFFE)
      : (BOOL v127 = 0),
        v127 ? (BOOL v128 = LODWORD(v101) == 0) : (BOOL v128 = 1),
        v128 ? (BOOL v129 = (LODWORD(v140) & 0x7FFFFFFFu) <= 0x7F7FFFFF) : (BOOL v129 = 0),
        !v129
     || (*(_DWORD *)(v12 + 60) & 0x7FFFFFFFu) > 0x7F7FFFFF
     || (*(_DWORD *)(v12 + 64) & 0x7FFFFFFFu) >= 0x7F800000))
  {
    v118 = (void *)MEMORY[0x1E4F7A750];
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_18773);
    }
    v119 = (id *)MEMORY[0x1E4F7A748];
    v120 = (id)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
    {
      v121 = [NSString stringWithFormat:@"Produced invalid BlackAndWhite settings, using defaults", v132, &v162, &v161];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v121;
      _os_log_impl(&dword_1A9680000, v120, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);
    }
    v122 = (const void **)MEMORY[0x1E4F7A308];
    if (dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      if (*v118 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_18773);
      }
      v123 = *v119;
      if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
      {
        v124 = dispatch_get_specific(*v122);
        v125 = [MEMORY[0x1E4F29060] callStackSymbols];
        v126 = [v125 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v124;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v126;
        _os_log_error_impl(&dword_1A9680000, v123, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else
    {
      if (*v118 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_18773);
      }
      v123 = *v119;
      if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
      {
        v130 = [MEMORY[0x1E4F29060] callStackSymbols];
        v131 = [v130 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v131;
        _os_log_error_impl(&dword_1A9680000, v123, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
      }
    }

    _NUAssertContinueHandler();
    *(_DWORD *)(v12 + 48) = 0;
    *(_OWORD *)(v12 + 52) = xmmword_1A980B9E0;
    *(int32x2_t *)(v12 + 68) = vdup_n_s32(0x3EAAAAABu);
    *(_DWORD *)(v12 + 76) = 1051372203;
  }

LABEL_122:
}

@end