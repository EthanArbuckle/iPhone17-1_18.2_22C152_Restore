@interface PICurvesLUTFilter
+ (id)curvePointsFromDictionaries:(id)a3;
+ (id)tableImageFromRed:(const float *)a3 green:(const float *)a4 blue:(const float *)a5 luminance:(const float *)a6;
+ (vector<float,)calculateCurveTable:(id)a2;
- (NSArray)inputPointsB;
- (NSArray)inputPointsG;
- (NSArray)inputPointsL;
- (NSArray)inputPointsR;
- (id)outputImage;
- (void)setInputPointsB:(id)a3;
- (void)setInputPointsG:(id)a3;
- (void)setInputPointsL:(id)a3;
- (void)setInputPointsR:(id)a3;
@end

@implementation PICurvesLUTFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputPointsL, 0);
  objc_storeStrong((id *)&self->_inputPointsB, 0);
  objc_storeStrong((id *)&self->_inputPointsG, 0);
  objc_storeStrong((id *)&self->_inputPointsR, 0);
}

- (void)setInputPointsL:(id)a3
{
}

- (NSArray)inputPointsL
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputPointsB:(id)a3
{
}

- (NSArray)inputPointsB
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputPointsG:(id)a3
{
}

- (NSArray)inputPointsG
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputPointsR:(id)a3
{
}

- (NSArray)inputPointsR
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (id)outputImage
{
  v3 = [(PICurvesLUTFilter *)self inputPointsR];
  v4 = +[PICurvesLUTFilter curvePointsFromDictionaries:v3];

  v5 = [(PICurvesLUTFilter *)self inputPointsG];
  v6 = +[PICurvesLUTFilter curvePointsFromDictionaries:v5];

  v7 = [(PICurvesLUTFilter *)self inputPointsB];
  v8 = +[PICurvesLUTFilter curvePointsFromDictionaries:v7];

  v9 = [(PICurvesLUTFilter *)self inputPointsL];
  v10 = +[PICurvesLUTFilter curvePointsFromDictionaries:v9];

  +[PICurvesLUTFilter calculateCurveTable:v4];
  +[PICurvesLUTFilter calculateCurveTable:v6];
  +[PICurvesLUTFilter calculateCurveTable:v8];
  +[PICurvesLUTFilter calculateCurveTable:v10];
  v11 = +[PICurvesLUTFilter tableImageFromRed:v16 green:v15 blue:v14 luminance:__p];
  if (__p) {
    operator delete(__p);
  }
  if (v14) {
    operator delete(v14);
  }
  if (v15) {
    operator delete(v15);
  }
  if (v16) {
    operator delete(v16);
  }

  return v11;
}

+ (id)tableImageFromRed:(const float *)a3 green:(const float *)a4 blue:(const float *)a5 luminance:(const float *)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v14 = NUAssertLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "tableR != nil");
      LODWORD(srcA.data) = 138543362;
      *(void **)((char *)&srcA.data + 4) = v15;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&srcA, 0xCu);
    }
    v16 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v18 = NUAssertLogger();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v37 = dispatch_get_specific(*v16);
        v38 = [MEMORY[0x1E4F29060] callStackSymbols];
        v39 = [v38 componentsJoinedByString:@"\n"];
        LODWORD(srcA.data) = 138543618;
        *(void **)((char *)&srcA.data + 4) = v37;
        WORD2(srcA.height) = 2114;
        *(vImagePixelCount *)((char *)&srcA.height + 6) = (vImagePixelCount)v39;
        _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&srcA, 0x16u);
      }
      goto LABEL_39;
    }
    if (!v19) {
      goto LABEL_39;
    }
LABEL_27:
    v35 = [MEMORY[0x1E4F29060] callStackSymbols];
    v36 = [v35 componentsJoinedByString:@"\n"];
    LODWORD(srcA.data) = 138543362;
    *(void **)((char *)&srcA.data + 4) = v36;
    _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&srcA, 0xCu);

    goto LABEL_39;
  }
  if (!a4)
  {
    v20 = NUAssertLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "tableG != nil");
      LODWORD(srcA.data) = 138543362;
      *(void **)((char *)&srcA.data + 4) = v21;
      _os_log_error_impl(&dword_1A9680000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&srcA, 0xCu);
    }
    v22 = (const void **)MEMORY[0x1E4F7A308];
    v23 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v18 = NUAssertLogger();
    BOOL v24 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (v23)
    {
      if (v24)
      {
        v40 = dispatch_get_specific(*v22);
        v41 = [MEMORY[0x1E4F29060] callStackSymbols];
        v42 = [v41 componentsJoinedByString:@"\n"];
        LODWORD(srcA.data) = 138543618;
        *(void **)((char *)&srcA.data + 4) = v40;
        WORD2(srcA.height) = 2114;
        *(vImagePixelCount *)((char *)&srcA.height + 6) = (vImagePixelCount)v42;
        _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&srcA, 0x16u);
      }
      goto LABEL_39;
    }
    if (!v24) {
      goto LABEL_39;
    }
    goto LABEL_27;
  }
  if (!a5)
  {
    v25 = NUAssertLogger();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "tableB != nil");
      LODWORD(srcA.data) = 138543362;
      *(void **)((char *)&srcA.data + 4) = v26;
      _os_log_error_impl(&dword_1A9680000, v25, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&srcA, 0xCu);
    }
    v27 = (const void **)MEMORY[0x1E4F7A308];
    v28 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v18 = NUAssertLogger();
    BOOL v29 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (v29)
      {
        v43 = dispatch_get_specific(*v27);
        v44 = [MEMORY[0x1E4F29060] callStackSymbols];
        v45 = [v44 componentsJoinedByString:@"\n"];
        LODWORD(srcA.data) = 138543618;
        *(void **)((char *)&srcA.data + 4) = v43;
        WORD2(srcA.height) = 2114;
        *(vImagePixelCount *)((char *)&srcA.height + 6) = (vImagePixelCount)v45;
        _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&srcA, 0x16u);
      }
      goto LABEL_39;
    }
    if (!v29) {
      goto LABEL_39;
    }
    goto LABEL_27;
  }
  if (!a6)
  {
    v30 = NUAssertLogger();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "tableL != nil");
      LODWORD(srcA.data) = 138543362;
      *(void **)((char *)&srcA.data + 4) = v31;
      _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&srcA, 0xCu);
    }
    v32 = (const void **)MEMORY[0x1E4F7A308];
    v33 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    v18 = NUAssertLogger();
    BOOL v34 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (!v33)
    {
      if (!v34) {
        goto LABEL_39;
      }
      goto LABEL_27;
    }
    if (v34)
    {
      v46 = dispatch_get_specific(*v32);
      v47 = [MEMORY[0x1E4F29060] callStackSymbols];
      v48 = [v47 componentsJoinedByString:@"\n"];
      LODWORD(srcA.data) = 138543618;
      *(void **)((char *)&srcA.data + 4) = v46;
      WORD2(srcA.height) = 2114;
      *(vImagePixelCount *)((char *)&srcA.height + 6) = (vImagePixelCount)v48;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&srcA, 0x16u);
    }
LABEL_39:

    _NUAssertFailHandler();
    __break(1u);
  }
  *(_OWORD *)&srcA.height = xmmword_1A980B9C0;
  srcA.data = (void *)a3;
  srcA.rowBytes = 2048;
  *(_OWORD *)&srcR.height = xmmword_1A980B9C0;
  srcG.rowBytes = 2048;
  srcR.data = (void *)a4;
  srcR.rowBytes = 2048;
  srcB.rowBytes = 2048;
  srcG.data = (void *)a5;
  *(_OWORD *)&srcG.height = xmmword_1A980B9C0;
  srcB.data = (void *)a6;
  *(_OWORD *)&srcB.height = xmmword_1A980B9C0;
  id v6 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:0x2000];
  dest.data = (void *)[v6 mutableBytes];
  *(_OWORD *)&dest.height = xmmword_1A980B9C0;
  dest.rowBytes = [v6 length];
  vImageConvert_PlanarFtoARGBFFFF(&srcA, &srcR, &srcG, &srcB, &dest, 0);
  uint64_t v7 = *MEMORY[0x1E4F1E3A0];
  v55[0] = *MEMORY[0x1E4F1E3D0];
  v55[1] = v7;
  v56[0] = v6;
  v56[1] = MEMORY[0x1E4F1CC28];
  uint64_t v8 = *MEMORY[0x1E4F1E378];
  v55[2] = *MEMORY[0x1E4F1E388];
  v55[3] = v8;
  v56[2] = MEMORY[0x1E4F1CC38];
  v56[3] = MEMORY[0x1E4F1CC38];
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:4];
  id v10 = objc_alloc(MEMORY[0x1E4F1E050]);
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __60__PICurvesLUTFilter_tableImageFromRed_green_blue_luminance___block_invoke;
  v49[3] = &unk_1E5D80650;
  id v11 = v6;
  id v50 = v11;
  v12 = (void *)[v10 initWithImageProvider:v49 width:512 height:1 format:*MEMORY[0x1E4F1E300] colorSpace:0 options:v9];

  return v12;
}

vImage_Error __60__PICurvesLUTFilter_tableImageFromRed_green_blue_luminance___block_invoke(uint64_t a1, void *a2, size_t a3)
{
  src.data = (void *)[*(id *)(a1 + 32) bytes];
  *(_OWORD *)&src.height = xmmword_1A980B9D0;
  src.rowBytes = [*(id *)(a1 + 32) length];
  dest.data = a2;
  *(_OWORD *)&dest.height = xmmword_1A980B9D0;
  dest.rowBytes = a3;
  return vImageConvert_PlanarFtoPlanar16F(&src, &dest, 0);
}

+ (id)curvePointsFromDictionaries:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [PICurveControlPoint alloc];
        id v11 = -[PICurveControlPoint initWithDictionary:](v10, "initWithDictionary:", v9, (void)v13);
        [v4 addObject:v11];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (vector<float,)calculateCurveTable:(id)a2
{
  id v5 = a4;
  uint64_t v6 = [v5 count];
  unint64_t v7 = v6 - 2;
  if (v6 == 2)
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2.var0 = 0;
  }
  else
  {
    if (v7 >> 61) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    int64_t v8 = 8 * v7;
    uint64_t v9 = (float *)operator new(8 * v7);
    bzero(v9, v8);
    unint64_t v10 = 0;
    unint64_t v11 = v8 >> 3;
    unsigned int v12 = 1;
    do
    {
      unint64_t v13 = v12;
      long long v14 = [v5 objectAtIndexedSubscript:v12];
      [v14 x];
      *(float *)&double v15 = v15;
      v9[2 * v10] = *(float *)&v15;
      [v14 y];
      *(float *)&double v16 = v16;
      v9[2 * v10 + 1] = *(float *)&v16;

      unsigned int v12 = v13 + 1;
      unint64_t v10 = v13;
    }
    while (v11 > v13);
    if ((unint64_t)v8 > 0xF)
    {
      float v17 = *v9;
      float v18 = v9[(unint64_t)v8 / 4 - 2];
      BOOL v19 = operator new(20 * v11);
      bzero(v19, 20 * ((20 * v11 - 20) / 0x14) + 20);
      LODWORD(v99[0]) = 0;
      std::vector<float>::vector(v100, v11, v99);
      LODWORD(v98[0]) = 0;
      std::vector<float>::vector(v99, v11, v98);
      LODWORD(v97[0]) = 0;
      std::vector<float>::vector(v98, v11, v97);
      LODWORD(v96[0]) = 0;
      std::vector<float>::vector(v97, v11, v96);
      unint64_t v20 = v11 - 1;
      LODWORD(v95[0]) = 0;
      std::vector<float>::vector(v96, v11 - 1, v95);
      LODWORD(v93) = 0;
      std::vector<float>::vector(v95, v11 - 1, &v93);
      LODWORD(v92[0]) = 0;
      std::vector<float>::vector(&v93, v11, v92);
      LODWORD(__p[0]) = 0;
      std::vector<float>::vector(v92, v11, __p);
      int v90 = 0;
      std::vector<float>::vector(__p, v11, &v90);
      *(v94 - 1) = 1065353216;
      v21 = (char *)v93;
      *(_DWORD *)v93 = 1065353216;
      v22 = v100[0];
      if (v11 <= 1) {
        uint64_t v23 = 1;
      }
      else {
        uint64_t v23 = v11;
      }
      BOOL v24 = (int *)(v9 + 1);
      do
      {
        int v25 = *v24;
        v24 += 2;
        *v22++ = v25;
        --v23;
      }
      while (v23);
      if (v11 == 1)
      {
        uint64_t v45 = -1;
        v40 = (char *)__p[0];
      }
      else
      {
        v26 = (char *)v96[0];
        v27 = v9 + 2;
        unint64_t v28 = v11 - 1;
        BOOL v29 = (float *)v96[0];
        do
        {
          *v29++ = *v27 - *(v27 - 2);
          v27 += 2;
          --v28;
        }
        while (v28);
        if (v20 <= 1)
        {
          v40 = (char *)__p[0];
        }
        else
        {
          v30 = (char *)v95[0];
          v31 = (float *)((char *)v95[0] + 4);
          unint64_t v32 = v11 - 2;
          v33 = (float *)(v26 + 4);
          BOOL v34 = (float *)((char *)v100[0] + 4);
          unint64_t v35 = v11 - 2;
          v36 = (float *)((char *)v100[0] + 4);
          do
          {
            float v37 = v36[1];
            ++v36;
            *v31++ = (float)((float)(-3.0 / *(v33 - 1)) * (float)(*v34 - *(v34 - 1)))
                   + (float)((float)(3.0 / *v33) * (float)(v37 - *v34));
            ++v33;
            BOOL v34 = v36;
            --v35;
          }
          while (v35);
          uint64_t v38 = 0;
          v39 = (char *)v92[0];
          v40 = (char *)__p[0];
          v41 = v30 + 4;
          v42 = v9 + 4;
          v43 = v21 + 4;
          do
          {
            float v44 = (float)((float)(*v42 - *(v42 - 4)) * 2.0) - (float)(*(float *)&v26[v38] * *(float *)&v39[v38]);
            *(float *)&v43[v38] = v44;
            *(float *)&v39[v38 + 4] = *(float *)&v26[v38 + 4] / v44;
            *(float *)&v40[v38 + 4] = (float)(*(float *)&v41[v38] - (float)(*(float *)&v26[v38] * *(float *)&v40[v38]))
                                    / *(float *)&v43[v38];
            v38 += 4;
            v42 += 2;
            --v32;
          }
          while (v32);
        }
        uint64_t v45 = v11 - 2;
        v46 = (int *)v98[0];
        v47 = (int *)v100[0];
        v48 = (int *)v99[0];
        v49 = (int *)v97[0];
        id v50 = (char *)v97[0] - 8;
        v51 = (char *)v99[0] - 8;
        v52 = v26 - 8;
        v53 = v40 - 8;
        v54 = (char *)v100[0] - 4;
        v55 = (char *)v98[0] - 4;
        v56 = (char *)v92[0] - 8;
        unint64_t v57 = v11 - 1;
        do
        {
          float v58 = *(float *)&v55[4 * v11];
          float v59 = *(float *)&v53[4 * v11] - (float)(*(float *)&v56[4 * v11] * v58);
          *(float *)&v55[4 * v11 - 4] = v59;
          *(float *)&v51[4 * v11] = (float)((float)(*(float *)&v54[4 * v11] - *(float *)&v54[4 * v11 - 4])
                                          / *(float *)&v52[4 * v11])
                                  + (float)((float)((float)(v58 + (float)(v59 * 2.0)) * *(float *)&v52[4 * v11])
                                          * -0.33333);
          *(float *)&v50[4 * v11] = (float)(*(float *)&v55[4 * v11] - *(float *)&v55[4 * v11 - 4])
                                  / (float)(*(float *)&v52[4 * v11] * 3.0);
          v50 -= 4;
          v51 -= 4;
          v52 -= 4;
          v53 -= 4;
          v54 -= 4;
          v55 -= 4;
          v56 -= 4;
          --v57;
        }
        while (v57);
        v60 = v19 + 2;
        v61 = v9;
        unint64_t v62 = v11 - 1;
        do
        {
          int v63 = *(_DWORD *)v61;
          v61 += 2;
          *(v60 - 2) = v63;
          int v64 = *v47++;
          *(v60 - 1) = v64;
          int v65 = *v48++;
          _DWORD *v60 = v65;
          int v66 = *v46++;
          v60[1] = v66;
          int v67 = *v49++;
          v60[2] = v67;
          v60 += 5;
          --v62;
        }
        while (v62);
      }
      float v68 = v9[2 * v20];
      float v69 = v68 - v9[2 * v45];
      v70 = (float *)&v19[5 * v45];
      float v71 = v70[2];
      float v72 = v69 * v70[3];
      float v73 = (float)(v70[1] + (float)(v71 * v69)) + (float)(v72 * v69);
      float v74 = v69 * (float)(v69 * v70[4]);
      v75 = (float *)&v19[5 * v20];
      float *v75 = v68;
      v75[1] = v73 + (float)(v74 * v69);
      v75[2] = (float)(v71 + (float)(v72 * 2.0)) + (float)(v74 * 3.0);
      v75[3] = 0.0;
      v75[4] = 0.0;
      if (v40)
      {
        __p[1] = v40;
        operator delete(v40);
      }
      if (v92[0])
      {
        v92[1] = v92[0];
        operator delete(v92[0]);
      }
      if (v93)
      {
        v94 = v93;
        operator delete(v93);
      }
      if (v95[0])
      {
        v95[1] = v95[0];
        operator delete(v95[0]);
      }
      if (v96[0])
      {
        v96[1] = v96[0];
        operator delete(v96[0]);
      }
      if (v97[0])
      {
        v97[1] = v97[0];
        operator delete(v97[0]);
      }
      if (v98[0])
      {
        v98[1] = v98[0];
        operator delete(v98[0]);
      }
      if (v99[0])
      {
        v99[1] = v99[0];
        operator delete(v99[0]);
      }
      if (v100[0])
      {
        v100[1] = v100[0];
        operator delete(v100[0]);
      }
      retstr->var0 = 0;
      retstr->var1 = 0;
      retstr->var2.var0 = 0;
      v76 = (float *)operator new(0x800uLL);
      retstr->var0 = v76;
      retstr->var2.var0 = v76 + 512;
      bzero(v76, 0x800uLL);
      uint64_t v77 = 0;
      unint64_t v78 = 0;
      retstr->var1 = v76 + 512;
      do
      {
        unint64_t v79 = v78;
        *(float *)v80.i32 = powf((float)((float)v77 + (float)v77) / 511.0, 0.45455);
        if (v78 <= v20) {
          unint64_t v78 = v20;
        }
        uint64_t v81 = 20 * v79 + 20;
        while (v78 != v79)
        {
          ++v79;
          float v82 = *(float *)((char *)v19 + v81);
          v81 += 20;
          if (*(float *)v80.i32 <= v82)
          {
            unint64_t v78 = v79 - 1;
            break;
          }
        }
        v83 = (float *)&v19[5 * v78];
        float v84 = *(float *)v80.i32 - *v83;
        *(float *)v80.i32 = v83[1] + (float)(v83[2] * v84);
        if (v84 > 0.0) {
          *(float *)v80.i32 = *(float *)v80.i32
        }
                            + (float)((float)(v84 * (float)(v84 * (float)(v84 * *(float *)&v19[5 * v78 + 4])))
                                    + (float)((float)(v84 * *(float *)&v19[5 * v78 + 3]) * v84));
        if (v17 > 0.0 && !v78 && v84 < 0.0) {
          v80.i32[0] = v19[1];
        }
        if (v78 == v20 && v18 < 1.0) {
          v80.i32[0] = (__int32)v83[1];
        }
        if (*(float *)v80.i32 < 0.0) {
          *(float *)v80.i32 = 0.0;
        }
        if (*(float *)v80.i32 > 2.0) {
          *(float *)v80.i32 = 2.0;
        }
        int8x16_t v89 = v80;
        *(float *)v86.i32 = powf(fabsf(*(float *)v80.i32), 2.2);
        v87.i64[0] = 0x8000000080000000;
        v87.i64[1] = 0x8000000080000000;
        LODWORD(v76[v77++]) = vbslq_s8(v87, v86, v89).u32[0];
      }
      while (v77 != 512);
      operator delete(v19);
    }
    else
    {
      retstr->var0 = 0;
      retstr->var1 = 0;
      retstr->var2.var0 = 0;
    }
    operator delete(v9);
  }

  return result;
}

@end