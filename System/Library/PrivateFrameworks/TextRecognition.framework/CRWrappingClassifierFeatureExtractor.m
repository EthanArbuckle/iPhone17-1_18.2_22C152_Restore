@interface CRWrappingClassifierFeatureExtractor
+ (id)_tokenizeString:(id)a3 usingWordUnits:(BOOL)a4 excludeWhitespace:(BOOL)a5;
+ (id)extractFeatureMultiArrayForLocale:(id)a3 textFeature:(id)a4 lastFeature:(id)a5 evaluation:(id)a6 imageSize:(CGSize)a7;
+ (id)extractFeaturesForLocale:(id)a3 textFeature:(id)a4 lastFeature:(id)a5 imageSize:(CGSize)a6 revision:(unint64_t)a7;
+ (id)multiArrayFromVector:(const void *)a3;
+ (id)nsArrayFromVector:(const void *)a3;
+ (vector<double,)extractFeatureVectorForLocale:(id)a2 string1:(SEL)a3 string2:(id)a4 evaluation:(id)a5 imageSize:(id)a6;
+ (void)_extractBagOfTokensFeaturesTo:(void *)a3 vocabulary:(id)a4 tokens:(id)a5 beginIndex:(int64_t)a6 endIndex:(int64_t)a7;
+ (void)_extractEvaluatedFeaturesTo:(void *)a3 evaluation:(id)a4;
+ (void)_extractGeometricFeaturesTo:(void *)a3 evaluation:(id)a4;
+ (void)_extractLanguageModelFeaturesTo:(void *)a3 evaluation:(id)a4;
+ (void)_extractLexicalFeaturesTo:(void *)a3 string1:(id)a4 string2:(id)a5 configuration:(id)a6 forCJK:(BOOL)a7;
@end

@implementation CRWrappingClassifierFeatureExtractor

+ (void)_extractBagOfTokensFeaturesTo:(void *)a3 vocabulary:(id)a4 tokens:(id)a5 beginIndex:(int64_t)a6 endIndex:(int64_t)a7
{
  id v11 = a4;
  id v12 = a5;
  std::vector<BOOL>::vector(&__p, [v11 count]);
  v69 = a3;
  int64_t v13 = [v12 count];
  int64_t v14 = a6 & ~(a6 >> 63);
  if (v13 >= a7) {
    int64_t v15 = a7;
  }
  else {
    int64_t v15 = v13;
  }
  int64_t v70 = v15;
  if (v14 < v15)
  {
    do
    {
      for (unint64_t i = 0; i < [v11 count]; ++i)
      {
        unint64_t v17 = i >> 6;
        uint64_t v18 = 1 << i;
        uint64_t v19 = *((void *)__p + (i >> 6));
        if ((v19 & (1 << i)) != 0)
        {
          *((void *)__p + v17) = v19 | v18;
        }
        else
        {
          v20 = [v11 objectAtIndexedSubscript:i];
          v21 = [v12 objectAtIndexedSubscript:v14];
          v22 = [v21 lowercaseString];
          if ([v20 isEqualToString:v22]) {
            uint64_t v23 = *((void *)__p + v17) | v18;
          }
          else {
            uint64_t v23 = *((void *)__p + v17) & ~v18;
          }
          *((void *)__p + v17) = v23;
        }
      }
      ++v14;
    }
    while (v14 != v70);
  }
  uint64_t v24 = v72;
  if (v72 >= 1)
  {
    v25 = (char *)__p;
    v26 = v69;
    unint64_t v27 = v69[1];
    uint64_t v28 = v27 - *v69;
    v29 = (double *)(*v69 + (v28 & 0xFFFFFFFFFFFFFFF8));
    uint64_t v30 = v69[2];
    if (v72 > (uint64_t)(v30 - v27) >> 3)
    {
      uint64_t v31 = v28 >> 3;
      unint64_t v32 = (v28 >> 3) + v72;
      if (v32 >> 61) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v33 = v30 - *v69;
      if (v33 >> 2 > v32) {
        unint64_t v32 = v33 >> 2;
      }
      if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v34 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v34 = v32;
      }
      if (v34) {
        v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v69 + 2), v34);
      }
      else {
        v35 = 0;
      }
      int v56 = 0;
      v57 = (double *)&v35[8 * v31];
      v58 = &v57[v24];
      uint64_t v59 = 8 * v24;
      v60 = v57;
      do
      {
        if ((*(void *)v25 >> v56)) {
          double v61 = 1.0;
        }
        else {
          double v61 = 0.0;
        }
        *v60++ = v61;
        v25 += 8 * (v56 == 63);
        if (v56 == 63) {
          int v56 = 0;
        }
        else {
          ++v56;
        }
        v59 -= 8;
      }
      while (v59);
      v62 = (double *)*v69;
      if ((double *)*v69 != v29)
      {
        v63 = v29;
        do
        {
          uint64_t v64 = *((void *)v63-- - 1);
          *((void *)v57-- - 1) = v64;
        }
        while (v63 != v62);
      }
      v65 = &v35[8 * v34];
      v66 = (double *)v69[1];
      int64_t v67 = (char *)v66 - (char *)v29;
      if (v66 != v29) {
        memmove(v58, v29, (char *)v66 - (char *)v29);
      }
      v68 = (void *)*v69;
      void *v69 = v57;
      v69[1] = (char *)v58 + v67;
      v69[2] = v65;
      if (v68) {
        operator delete(v68);
      }
      goto LABEL_77;
    }
    v36 = (char *)__p + 8 * ((unint64_t)v72 >> 6);
    int v37 = v72 & 0x3F;
    uint64_t v38 = v27 - (void)v29;
    uint64_t v39 = (uint64_t)(v27 - (void)v29) >> 3;
    if (v39 >= v72)
    {
      v45 = (double *)v69[1];
      unsigned int v44 = v72 & 0x3F;
      v43 = (char *)__p + 8 * ((unint64_t)v72 >> 6);
      goto LABEL_44;
    }
    uint64_t v40 = v39 - 63;
    if (v39 < 63) {
      uint64_t v40 = (uint64_t)(v27 - (void)v29) >> 3;
    }
    uint64_t v41 = v40 >> 6;
    unint64_t v42 = (unint64_t)v39 >> 6;
    if (v38 >= -7) {
      uint64_t v41 = v42;
    }
    v43 = (char *)__p + 8 * v41;
    unsigned int v44 = (v38 >> 3) & 0x3F;
    if (v44 != v37 || (v45 = (double *)v69[1], v41 != (unint64_t)v72 >> 6))
    {
      v45 = (double *)v69[1];
      v46 = (char *)__p + 8 * v41;
      unsigned int v47 = (v38 >> 3) & 0x3F;
      v48 = v45;
      do
      {
        if ((*(void *)v46 >> v47)) {
          double v49 = 1.0;
        }
        else {
          double v49 = 0.0;
        }
        *v48++ = v49;
        v46 += 8 * (v47 == 63);
        if (v47 == 63) {
          unsigned int v47 = 0;
        }
        else {
          ++v47;
        }
        ++v45;
      }
      while (v47 != v37 || v46 != v36);
    }
    v69[1] = v45;
    if (v38 >= 1)
    {
      v26 = v69;
LABEL_44:
      v50 = &v29[v24];
      v51 = &v45[-v24];
      v52 = v45;
      if ((unint64_t)v51 < v27)
      {
        v52 = v45;
        do
        {
          uint64_t v53 = *(void *)v51++;
          *(void *)v52++ = v53;
        }
        while ((unint64_t)v51 < v27);
      }
      v26[1] = v52;
      if (v45 != v50) {
        memmove(&v45[-(v45 - v50)], v29, (char *)v45 - (char *)v50);
      }
      if (v44 || v25 != v43)
      {
        int v54 = 0;
        do
        {
          if ((*(void *)v25 >> v54)) {
            double v55 = 1.0;
          }
          else {
            double v55 = 0.0;
          }
          *v29++ = v55;
          v25 += 8 * (v54 == 63);
          if (v54 == 63) {
            int v54 = 0;
          }
          else {
            ++v54;
          }
        }
        while (v54 != v44 || v25 != v43);
      }
    }
  }
LABEL_77:
  if (__p) {
    operator delete(__p);
  }
}

+ (id)_tokenizeString:(id)a3 usingWordUnits:(BOOL)a4 excludeWhitespace:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  if (v6)
  {
    v8 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v9 = [v7 componentsSeparatedByCharactersInSet:v8];
  }
  else
  {
    if (v5)
    {
      v10 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      uint64_t v11 = [v7 _crStringByReplacingCharactersInSet:v10 withString:&stru_1F38EED68];

      id v7 = (id)v11;
    }
    v9 = [v7 _crArrayOfComposedCharacters];
  }

  return v9;
}

+ (void)_extractLanguageModelFeaturesTo:(void *)a3 evaluation:(id)a4
{
  id v66 = a4;
  [v66 lmScore];
  if (v5 <= 1.0) {
    double v6 = v5;
  }
  else {
    double v6 = 1.0;
  }
  if (v5 >= 0.0) {
    double v7 = v6;
  }
  else {
    double v7 = 0.0;
  }
  [v66 eosLMScore];
  if (v8 <= 1.0) {
    double v9 = v8;
  }
  else {
    double v9 = 1.0;
  }
  if (v8 >= 0.0) {
    double v10 = v9;
  }
  else {
    double v10 = 0.0;
  }
  double v11 = log(v7);
  double v12 = log(v10);
  int64_t v14 = (char **)((char *)a3 + 16);
  int64_t v13 = (char *)*((void *)a3 + 2);
  int64_t v15 = (double *)*((void *)a3 + 1);
  if (v15 >= (double *)v13)
  {
    unint64_t v17 = *(double **)a3;
    uint64_t v18 = ((uint64_t)v15 - *(void *)a3) >> 3;
    unint64_t v19 = v18 + 1;
    if ((unint64_t)(v18 + 1) >> 61) {
      goto LABEL_99;
    }
    uint64_t v20 = v13 - (char *)v17;
    if (v20 >> 2 > v19) {
      unint64_t v19 = v20 >> 2;
    }
    if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v21 = v19;
    }
    if (v21)
    {
      v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v21);
      unint64_t v17 = *(double **)a3;
      int64_t v15 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v22 = 0;
    }
    uint64_t v23 = (double *)&v22[8 * v18];
    int64_t v13 = &v22[8 * v21];
    *uint64_t v23 = v7;
    v16 = v23 + 1;
    while (v15 != v17)
    {
      uint64_t v24 = *((void *)v15-- - 1);
      *((void *)v23-- - 1) = v24;
    }
    *(void *)a3 = v23;
    *((void *)a3 + 1) = v16;
    *((void *)a3 + 2) = v13;
    if (v17)
    {
      operator delete(v17);
      int64_t v13 = *v14;
    }
  }
  else
  {
    *int64_t v15 = v7;
    v16 = v15 + 1;
  }
  *((void *)a3 + 1) = v16;
  if (v16 >= (double *)v13)
  {
    v26 = *(double **)a3;
    uint64_t v27 = ((uint64_t)v16 - *(void *)a3) >> 3;
    unint64_t v28 = v27 + 1;
    if ((unint64_t)(v27 + 1) >> 61) {
      goto LABEL_99;
    }
    uint64_t v29 = v13 - (char *)v26;
    if (v29 >> 2 > v28) {
      unint64_t v28 = v29 >> 2;
    }
    if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v30 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v30 = v28;
    }
    if (v30)
    {
      uint64_t v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v30);
      v26 = *(double **)a3;
      v16 = (double *)*((void *)a3 + 1);
    }
    else
    {
      uint64_t v31 = 0;
    }
    unint64_t v32 = (double *)&v31[8 * v27];
    int64_t v13 = &v31[8 * v30];
    *unint64_t v32 = v10;
    v25 = v32 + 1;
    while (v16 != v26)
    {
      uint64_t v33 = *((void *)v16-- - 1);
      *((void *)v32-- - 1) = v33;
    }
    *(void *)a3 = v32;
    *((void *)a3 + 1) = v25;
    *((void *)a3 + 2) = v13;
    if (v26)
    {
      operator delete(v26);
      int64_t v13 = *v14;
    }
  }
  else
  {
    double *v16 = v10;
    v25 = v16 + 1;
  }
  unint64_t v34 = v66;
  double v35 = fmax(v11 * 0.25, -10.0);
  *((void *)a3 + 1) = v25;
  if (v25 >= (double *)v13)
  {
    int v37 = *(double **)a3;
    uint64_t v38 = ((uint64_t)v25 - *(void *)a3) >> 3;
    unint64_t v39 = v38 + 1;
    if ((unint64_t)(v38 + 1) >> 61) {
      goto LABEL_99;
    }
    uint64_t v40 = v13 - (char *)v37;
    if (v40 >> 2 > v39) {
      unint64_t v39 = v40 >> 2;
    }
    if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v41 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v41 = v39;
    }
    if (v41)
    {
      unint64_t v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v41);
      int v37 = *(double **)a3;
      v25 = (double *)*((void *)a3 + 1);
    }
    else
    {
      unint64_t v42 = 0;
    }
    v43 = (double *)&v42[8 * v38];
    int64_t v13 = &v42[8 * v41];
    double *v43 = v35;
    v36 = v43 + 1;
    while (v25 != v37)
    {
      uint64_t v44 = *((void *)v25-- - 1);
      *((void *)v43-- - 1) = v44;
    }
    *(void *)a3 = v43;
    *((void *)a3 + 1) = v36;
    *((void *)a3 + 2) = v13;
    if (v37)
    {
      operator delete(v37);
      int64_t v13 = *v14;
    }
    unint64_t v34 = v66;
  }
  else
  {
    double *v25 = v35;
    v36 = v25 + 1;
  }
  double v45 = fmax(v12 * 0.25, -10.0);
  *((void *)a3 + 1) = v36;
  if (v36 < (double *)v13)
  {
    double *v36 = v45;
    v46 = v36 + 1;
    goto LABEL_79;
  }
  unsigned int v47 = *(double **)a3;
  uint64_t v48 = ((uint64_t)v36 - *(void *)a3) >> 3;
  unint64_t v49 = v48 + 1;
  if ((unint64_t)(v48 + 1) >> 61) {
LABEL_99:
  }
    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
  uint64_t v50 = v13 - (char *)v47;
  if (v50 >> 2 > v49) {
    unint64_t v49 = v50 >> 2;
  }
  if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v51 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v51 = v49;
  }
  if (v51)
  {
    v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v51);
    unsigned int v47 = *(double **)a3;
    v36 = (double *)*((void *)a3 + 1);
  }
  else
  {
    v52 = 0;
  }
  uint64_t v53 = (double *)&v52[8 * v48];
  int64_t v13 = &v52[8 * v51];
  *uint64_t v53 = v45;
  v46 = v53 + 1;
  while (v36 != v47)
  {
    uint64_t v54 = *((void *)v36-- - 1);
    *((void *)v53-- - 1) = v54;
  }
  *(void *)a3 = v53;
  *((void *)a3 + 1) = v46;
  *((void *)a3 + 2) = v13;
  if (v47)
  {
    operator delete(v47);
    int64_t v13 = *v14;
  }
  unint64_t v34 = v66;
LABEL_79:
  *((void *)a3 + 1) = v46;
  double v55 = v35 - v45;
  if (v46 >= (double *)v13)
  {
    v57 = *(double **)a3;
    uint64_t v58 = ((uint64_t)v46 - *(void *)a3) >> 3;
    unint64_t v59 = v58 + 1;
    if ((unint64_t)(v58 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v60 = v13 - (char *)v57;
    if (v60 >> 2 > v59) {
      unint64_t v59 = v60 >> 2;
    }
    if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v61 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v61 = v59;
    }
    if (v61)
    {
      v62 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v61);
      v57 = *(double **)a3;
      v46 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v62 = 0;
    }
    v63 = (double *)&v62[8 * v58];
    uint64_t v64 = &v62[8 * v61];
    double *v63 = v55;
    int v56 = v63 + 1;
    while (v46 != v57)
    {
      uint64_t v65 = *((void *)v46-- - 1);
      *((void *)v63-- - 1) = v65;
    }
    *(void *)a3 = v63;
    *((void *)a3 + 1) = v56;
    *((void *)a3 + 2) = v64;
    if (v57) {
      operator delete(v57);
    }
    unint64_t v34 = v66;
  }
  else
  {
    double *v46 = v55;
    int v56 = v46 + 1;
  }
  *((void *)a3 + 1) = v56;
}

+ (void)_extractGeometricFeaturesTo:(void *)a3 evaluation:(id)a4
{
  id v310 = a4;
  [v310 lastFeatureSize];
  double v6 = v5;
  double v8 = v7;
  [v310 featureInTestSize];
  double v10 = v9;
  double v12 = v11;
  [v310 imageSize];
  double v14 = v13;
  double v16 = v15;
  double v17 = fabs(v13);
  double v18 = v6 / v13;
  if (v17 <= 2.22044605e-16) {
    double v19 = 0.0;
  }
  else {
    double v19 = v18;
  }
  unint64_t v21 = (char **)((char *)a3 + 16);
  uint64_t v20 = (char *)*((void *)a3 + 2);
  v22 = (double *)*((void *)a3 + 1);
  if (v22 >= (double *)v20)
  {
    uint64_t v24 = *(double **)a3;
    uint64_t v25 = ((uint64_t)v22 - *(void *)a3) >> 3;
    unint64_t v26 = v25 + 1;
    if ((unint64_t)(v25 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v27 = v20 - (char *)v24;
    if (v27 >> 2 > v26) {
      unint64_t v26 = v27 >> 2;
    }
    if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v28 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v28 = v26;
    }
    if (v28)
    {
      uint64_t v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v28);
      uint64_t v24 = *(double **)a3;
      v22 = (double *)*((void *)a3 + 1);
    }
    else
    {
      uint64_t v29 = 0;
    }
    unint64_t v30 = (double *)&v29[8 * v25];
    uint64_t v20 = &v29[8 * v28];
    *unint64_t v30 = v19;
    uint64_t v23 = v30 + 1;
    while (v22 != v24)
    {
      uint64_t v31 = *((void *)v22-- - 1);
      *((void *)v30-- - 1) = v31;
    }
    *(void *)a3 = v30;
    *((void *)a3 + 1) = v23;
    *((void *)a3 + 2) = v20;
    if (v24)
    {
      operator delete(v24);
      uint64_t v20 = *v21;
    }
  }
  else
  {
    double *v22 = v19;
    uint64_t v23 = v22 + 1;
  }
  *((void *)a3 + 1) = v23;
  double v309 = fabs(v16);
  if (v309 <= 2.22044605e-16) {
    double v32 = 0.0;
  }
  else {
    double v32 = v8 / v16;
  }
  if (v23 >= (double *)v20)
  {
    unint64_t v34 = *(double **)a3;
    uint64_t v35 = ((uint64_t)v23 - *(void *)a3) >> 3;
    unint64_t v36 = v35 + 1;
    if ((unint64_t)(v35 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v37 = v20 - (char *)v34;
    if (v37 >> 2 > v36) {
      unint64_t v36 = v37 >> 2;
    }
    if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v38 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v38 = v36;
    }
    if (v38)
    {
      unint64_t v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v38);
      unint64_t v34 = *(double **)a3;
      uint64_t v23 = (double *)*((void *)a3 + 1);
    }
    else
    {
      unint64_t v39 = 0;
    }
    uint64_t v40 = (double *)&v39[8 * v35];
    uint64_t v20 = &v39[8 * v38];
    *uint64_t v40 = v32;
    uint64_t v33 = v40 + 1;
    while (v23 != v34)
    {
      uint64_t v41 = *((void *)v23-- - 1);
      *((void *)v40-- - 1) = v41;
    }
    *(void *)a3 = v40;
    *((void *)a3 + 1) = v33;
    *((void *)a3 + 2) = v20;
    if (v34)
    {
      operator delete(v34);
      uint64_t v20 = *v21;
    }
  }
  else
  {
    *uint64_t v23 = v32;
    uint64_t v33 = v23 + 1;
  }
  unint64_t v42 = v310;
  *((void *)a3 + 1) = v33;
  if (v17 <= 2.22044605e-16) {
    double v43 = 0.0;
  }
  else {
    double v43 = v10 / v14;
  }
  if (v33 >= (double *)v20)
  {
    double v45 = *(double **)a3;
    uint64_t v46 = ((uint64_t)v33 - *(void *)a3) >> 3;
    unint64_t v47 = v46 + 1;
    if ((unint64_t)(v46 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v48 = v20 - (char *)v45;
    if (v48 >> 2 > v47) {
      unint64_t v47 = v48 >> 2;
    }
    if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v49 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v49 = v47;
    }
    if (v49)
    {
      uint64_t v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v49);
      double v45 = *(double **)a3;
      uint64_t v33 = (double *)*((void *)a3 + 1);
    }
    else
    {
      uint64_t v50 = 0;
    }
    unint64_t v51 = (double *)&v50[8 * v46];
    uint64_t v20 = &v50[8 * v49];
    double *v51 = v43;
    uint64_t v44 = v51 + 1;
    while (v33 != v45)
    {
      uint64_t v52 = *((void *)v33-- - 1);
      *((void *)v51-- - 1) = v52;
    }
    *(void *)a3 = v51;
    *((void *)a3 + 1) = v44;
    *((void *)a3 + 2) = v20;
    if (v45)
    {
      operator delete(v45);
      uint64_t v20 = *v21;
    }
    unint64_t v42 = v310;
  }
  else
  {
    *uint64_t v33 = v43;
    uint64_t v44 = v33 + 1;
  }
  *((void *)a3 + 1) = v44;
  if (v309 <= 2.22044605e-16) {
    double v53 = 0.0;
  }
  else {
    double v53 = v12 / v16;
  }
  if (v44 >= (double *)v20)
  {
    double v55 = *(double **)a3;
    uint64_t v56 = ((uint64_t)v44 - *(void *)a3) >> 3;
    unint64_t v57 = v56 + 1;
    if ((unint64_t)(v56 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v58 = v20 - (char *)v55;
    if (v58 >> 2 > v57) {
      unint64_t v57 = v58 >> 2;
    }
    if ((unint64_t)v58 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v59 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v59 = v57;
    }
    if (v59)
    {
      uint64_t v60 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v59);
      double v55 = *(double **)a3;
      uint64_t v44 = (double *)*((void *)a3 + 1);
    }
    else
    {
      uint64_t v60 = 0;
    }
    unint64_t v61 = (double *)&v60[8 * v56];
    v62 = &v60[8 * v59];
    *unint64_t v61 = v53;
    uint64_t v54 = v61 + 1;
    while (v44 != v55)
    {
      uint64_t v63 = *((void *)v44-- - 1);
      *((void *)v61-- - 1) = v63;
    }
    *(void *)a3 = v61;
    *((void *)a3 + 1) = v54;
    *((void *)a3 + 2) = v62;
    if (v55) {
      operator delete(v55);
    }
    unint64_t v42 = v310;
  }
  else
  {
    *uint64_t v44 = v53;
    uint64_t v54 = v44 + 1;
  }
  *((void *)a3 + 1) = v54;
  [v42 textHeightRatio];
  long double v65 = exp(-v64);
  int64_t v67 = (double *)*((void *)a3 + 1);
  unint64_t v66 = *((void *)a3 + 2);
  double v68 = 1.0 / (v65 + 1.0);
  if ((unint64_t)v67 >= v66)
  {
    int64_t v70 = *(double **)a3;
    uint64_t v71 = ((uint64_t)v67 - *(void *)a3) >> 3;
    unint64_t v72 = v71 + 1;
    if ((unint64_t)(v71 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v73 = v66 - (void)v70;
    if (v73 >> 2 > v72) {
      unint64_t v72 = v73 >> 2;
    }
    if ((unint64_t)v73 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v74 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v74 = v72;
    }
    if (v74)
    {
      v75 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v74);
      int64_t v70 = *(double **)a3;
      int64_t v67 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v75 = 0;
    }
    v76 = (double *)&v75[8 * v71];
    v77 = &v75[8 * v74];
    double *v76 = v68;
    v69 = v76 + 1;
    while (v67 != v70)
    {
      uint64_t v78 = *((void *)v67-- - 1);
      *((void *)v76-- - 1) = v78;
    }
    *(void *)a3 = v76;
    *((void *)a3 + 1) = v69;
    *((void *)a3 + 2) = v77;
    if (v70) {
      operator delete(v70);
    }
  }
  else
  {
    *int64_t v67 = v68;
    v69 = v67 + 1;
  }
  *((void *)a3 + 1) = v69;
  [v310 textHeightRatio];
  if (fabs(v79) <= 2.22044605e-16)
  {
    if (v79 >= 0.0) {
      *(double *)&unint64_t v81 = 1.79769313e308;
    }
    else {
      *(double *)&unint64_t v81 = -1.79769313e308;
    }
    double v80 = *(double *)&v81;
  }
  else
  {
    double v80 = 1.0 / v79;
  }
  long double v82 = exp(-v80);
  v84 = (double *)*((void *)a3 + 1);
  unint64_t v83 = *((void *)a3 + 2);
  double v85 = 1.0 / (v82 + 1.0);
  if ((unint64_t)v84 >= v83)
  {
    v87 = *(double **)a3;
    uint64_t v88 = ((uint64_t)v84 - *(void *)a3) >> 3;
    unint64_t v89 = v88 + 1;
    if ((unint64_t)(v88 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v90 = v83 - (void)v87;
    if (v90 >> 2 > v89) {
      unint64_t v89 = v90 >> 2;
    }
    if ((unint64_t)v90 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v91 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v91 = v89;
    }
    if (v91)
    {
      v92 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v91);
      v87 = *(double **)a3;
      v84 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v92 = 0;
    }
    v93 = (double *)&v92[8 * v88];
    v94 = &v92[8 * v91];
    double *v93 = v85;
    v86 = v93 + 1;
    while (v84 != v87)
    {
      uint64_t v95 = *((void *)v84-- - 1);
      *((void *)v93-- - 1) = v95;
    }
    *(void *)a3 = v93;
    *((void *)a3 + 1) = v86;
    *((void *)a3 + 2) = v94;
    if (v87) {
      operator delete(v87);
    }
  }
  else
  {
    double *v84 = v85;
    v86 = v84 + 1;
  }
  *((void *)a3 + 1) = v86;
  [v310 textWidthRatio];
  long double v97 = exp(-v96);
  v99 = (double *)*((void *)a3 + 1);
  unint64_t v98 = *((void *)a3 + 2);
  double v100 = 1.0 / (v97 + 1.0);
  if ((unint64_t)v99 >= v98)
  {
    v102 = *(double **)a3;
    uint64_t v103 = ((uint64_t)v99 - *(void *)a3) >> 3;
    unint64_t v104 = v103 + 1;
    if ((unint64_t)(v103 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v105 = v98 - (void)v102;
    if (v105 >> 2 > v104) {
      unint64_t v104 = v105 >> 2;
    }
    if ((unint64_t)v105 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v106 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v106 = v104;
    }
    if (v106)
    {
      v107 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v106);
      v102 = *(double **)a3;
      v99 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v107 = 0;
    }
    v108 = (double *)&v107[8 * v103];
    v109 = &v107[8 * v106];
    double *v108 = v100;
    v101 = v108 + 1;
    while (v99 != v102)
    {
      uint64_t v110 = *((void *)v99-- - 1);
      *((void *)v108-- - 1) = v110;
    }
    *(void *)a3 = v108;
    *((void *)a3 + 1) = v101;
    *((void *)a3 + 2) = v109;
    if (v102) {
      operator delete(v102);
    }
  }
  else
  {
    double *v99 = v100;
    v101 = v99 + 1;
  }
  *((void *)a3 + 1) = v101;
  [v310 textWidthRatio];
  if (fabs(v111) <= 2.22044605e-16)
  {
    if (v111 >= 0.0) {
      *(double *)&unint64_t v113 = 1.79769313e308;
    }
    else {
      *(double *)&unint64_t v113 = -1.79769313e308;
    }
    double v112 = *(double *)&v113;
  }
  else
  {
    double v112 = 1.0 / v111;
  }
  long double v114 = exp(-v112);
  v116 = (double *)*((void *)a3 + 1);
  unint64_t v115 = *((void *)a3 + 2);
  double v117 = 1.0 / (v114 + 1.0);
  if ((unint64_t)v116 >= v115)
  {
    v119 = *(double **)a3;
    uint64_t v120 = ((uint64_t)v116 - *(void *)a3) >> 3;
    unint64_t v121 = v120 + 1;
    if ((unint64_t)(v120 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v122 = v115 - (void)v119;
    if (v122 >> 2 > v121) {
      unint64_t v121 = v122 >> 2;
    }
    if ((unint64_t)v122 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v123 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v123 = v121;
    }
    if (v123)
    {
      v124 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v123);
      v119 = *(double **)a3;
      v116 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v124 = 0;
    }
    v125 = (double *)&v124[8 * v120];
    v126 = &v124[8 * v123];
    double *v125 = v117;
    v118 = v125 + 1;
    while (v116 != v119)
    {
      uint64_t v127 = *((void *)v116-- - 1);
      *((void *)v125-- - 1) = v127;
    }
    *(void *)a3 = v125;
    *((void *)a3 + 1) = v118;
    *((void *)a3 + 2) = v126;
    if (v119) {
      operator delete(v119);
    }
  }
  else
  {
    double *v116 = v117;
    v118 = v116 + 1;
  }
  *((void *)a3 + 1) = v118;
  [v310 angleDiff];
  double v129 = v128;
  v131 = (double *)*((void *)a3 + 1);
  unint64_t v130 = *((void *)a3 + 2);
  if ((unint64_t)v131 >= v130)
  {
    v133 = *(double **)a3;
    uint64_t v134 = ((uint64_t)v131 - *(void *)a3) >> 3;
    unint64_t v135 = v134 + 1;
    if ((unint64_t)(v134 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v136 = v130 - (void)v133;
    if (v136 >> 2 > v135) {
      unint64_t v135 = v136 >> 2;
    }
    if ((unint64_t)v136 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v137 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v137 = v135;
    }
    if (v137)
    {
      v138 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v137);
      v133 = *(double **)a3;
      v131 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v138 = 0;
    }
    v139 = (double *)&v138[8 * v134];
    v140 = &v138[8 * v137];
    double *v139 = v129;
    v132 = v139 + 1;
    while (v131 != v133)
    {
      uint64_t v141 = *((void *)v131-- - 1);
      *((void *)v139-- - 1) = v141;
    }
    *(void *)a3 = v139;
    *((void *)a3 + 1) = v132;
    *((void *)a3 + 2) = v140;
    if (v133) {
      operator delete(v133);
    }
  }
  else
  {
    double *v131 = v129;
    v132 = v131 + 1;
  }
  *((void *)a3 + 1) = v132;
  [v310 topDistanceLeft];
  double v308 = v6;
  double v143 = v142 / v14;
  double v144 = 0.0;
  if (v17 <= 2.22044605e-16) {
    double v145 = 0.0;
  }
  else {
    double v145 = v143;
  }
  objc_msgSend(v310, "topDistanceRight", *(void *)&v16);
  double v146 = v12;
  double v148 = v147 / v14;
  if (v17 > 2.22044605e-16) {
    double v144 = v148;
  }
  [v310 leftDistance];
  double v150 = fabs(v8);
  double v151 = v149 / v8;
  double v152 = 0.0;
  if (v150 <= 2.22044605e-16) {
    double v153 = 0.0;
  }
  else {
    double v153 = v149 / v8;
  }
  [v310 rightDistance];
  double v155 = v154 / v8;
  if (v150 > 2.22044605e-16) {
    double v152 = v155;
  }
  v156 = (double *)*((void *)a3 + 1);
  v157 = (char *)*((void *)a3 + 2);
  if (v156 >= (double *)v157)
  {
    v159 = *(double **)a3;
    uint64_t v160 = ((uint64_t)v156 - *(void *)a3) >> 3;
    unint64_t v161 = v160 + 1;
    if ((unint64_t)(v160 + 1) >> 61) {
      goto LABEL_394;
    }
    if ((v157 - (char *)v159) >> 2 > v161) {
      unint64_t v161 = (v157 - (char *)v159) >> 2;
    }
    if ((unint64_t)(v157 - (char *)v159) >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v162 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v162 = v161;
    }
    if (v162)
    {
      v163 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v162);
      v159 = *(double **)a3;
      v156 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v163 = 0;
    }
    v164 = (double *)&v163[8 * v160];
    v157 = &v163[8 * v162];
    double *v164 = v145;
    v158 = v164 + 1;
    while (v156 != v159)
    {
      uint64_t v165 = *((void *)v156-- - 1);
      *((void *)v164-- - 1) = v165;
    }
    *(void *)a3 = v164;
    *((void *)a3 + 1) = v158;
    *((void *)a3 + 2) = v157;
    if (v159)
    {
      operator delete(v159);
      v157 = *v21;
    }
  }
  else
  {
    double *v156 = v145;
    v158 = v156 + 1;
  }
  *((void *)a3 + 1) = v158;
  if (v158 < (double *)v157)
  {
    double *v158 = v144;
    v166 = v158 + 1;
    goto LABEL_213;
  }
  v167 = *(double **)a3;
  uint64_t v168 = ((uint64_t)v158 - *(void *)a3) >> 3;
  unint64_t v169 = v168 + 1;
  if ((unint64_t)(v168 + 1) >> 61) {
LABEL_394:
  }
    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
  if ((v157 - (char *)v167) >> 2 > v169) {
    unint64_t v169 = (v157 - (char *)v167) >> 2;
  }
  if ((unint64_t)(v157 - (char *)v167) >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v170 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v170 = v169;
  }
  if (v170)
  {
    v171 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v170);
    v167 = *(double **)a3;
    v158 = (double *)*((void *)a3 + 1);
  }
  else
  {
    v171 = 0;
  }
  v172 = (double *)&v171[8 * v168];
  v157 = &v171[8 * v170];
  double *v172 = v144;
  v166 = v172 + 1;
  while (v158 != v167)
  {
    uint64_t v173 = *((void *)v158-- - 1);
    *((void *)v172-- - 1) = v173;
  }
  *(void *)a3 = v172;
  *((void *)a3 + 1) = v166;
  *((void *)a3 + 2) = v157;
  if (v167)
  {
    operator delete(v167);
    v157 = *v21;
  }
LABEL_213:
  *((void *)a3 + 1) = v166;
  double v174 = v145 - v144;
  if (v166 >= (double *)v157)
  {
    v176 = *(double **)a3;
    uint64_t v177 = ((uint64_t)v166 - *(void *)a3) >> 3;
    unint64_t v178 = v177 + 1;
    if ((unint64_t)(v177 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    if ((v157 - (char *)v176) >> 2 > v178) {
      unint64_t v178 = (v157 - (char *)v176) >> 2;
    }
    if ((unint64_t)(v157 - (char *)v176) >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v179 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v179 = v178;
    }
    if (v179)
    {
      v180 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v179);
      v176 = *(double **)a3;
      v166 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v180 = 0;
    }
    v181 = (double *)&v180[8 * v177];
    v157 = &v180[8 * v179];
    double *v181 = v174;
    v175 = v181 + 1;
    while (v166 != v176)
    {
      uint64_t v182 = *((void *)v166-- - 1);
      *((void *)v181-- - 1) = v182;
    }
    *(void *)a3 = v181;
    *((void *)a3 + 1) = v175;
    *((void *)a3 + 2) = v157;
    if (v176)
    {
      operator delete(v176);
      v157 = *v21;
    }
  }
  else
  {
    double *v166 = v174;
    v175 = v166 + 1;
  }
  *((void *)a3 + 1) = v175;
  double v183 = 1.0 / (exp(-v153) + 1.0);
  if (v175 >= (double *)v157)
  {
    v187 = *(double **)a3;
    uint64_t v188 = ((uint64_t)v175 - *(void *)a3) >> 3;
    unint64_t v189 = v188 + 1;
    if ((unint64_t)(v188 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    double v185 = v146;
    if ((v157 - (char *)v187) >> 2 > v189) {
      unint64_t v189 = (v157 - (char *)v187) >> 2;
    }
    if ((unint64_t)(v157 - (char *)v187) >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v190 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v190 = v189;
    }
    double v186 = v308;
    if (v190)
    {
      v191 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v190);
      v187 = *(double **)a3;
      v175 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v191 = 0;
    }
    v192 = (double *)&v191[8 * v188];
    v157 = &v191[8 * v190];
    double *v192 = v183;
    v184 = v192 + 1;
    while (v175 != v187)
    {
      uint64_t v193 = *((void *)v175-- - 1);
      *((void *)v192-- - 1) = v193;
    }
    *(void *)a3 = v192;
    *((void *)a3 + 1) = v184;
    *((void *)a3 + 2) = v157;
    if (v187)
    {
      operator delete(v187);
      v157 = *v21;
    }
  }
  else
  {
    double *v175 = v183;
    v184 = v175 + 1;
    double v185 = v146;
    double v186 = v308;
  }
  *((void *)a3 + 1) = v184;
  double v194 = 1.0 / (exp(-v152) + 1.0);
  if (v184 >= (double *)v157)
  {
    v196 = *(double **)a3;
    uint64_t v197 = ((uint64_t)v184 - *(void *)a3) >> 3;
    unint64_t v198 = v197 + 1;
    if ((unint64_t)(v197 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    if ((v157 - (char *)v196) >> 2 > v198) {
      unint64_t v198 = (v157 - (char *)v196) >> 2;
    }
    if ((unint64_t)(v157 - (char *)v196) >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v199 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v199 = v198;
    }
    if (v199)
    {
      v200 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v199);
      v196 = *(double **)a3;
      v184 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v200 = 0;
    }
    v201 = (double *)&v200[8 * v197];
    v157 = &v200[8 * v199];
    double *v201 = v194;
    v195 = v201 + 1;
    while (v184 != v196)
    {
      uint64_t v202 = *((void *)v184-- - 1);
      *((void *)v201-- - 1) = v202;
    }
    *(void *)a3 = v201;
    *((void *)a3 + 1) = v195;
    *((void *)a3 + 2) = v157;
    if (v196)
    {
      operator delete(v196);
      v157 = *v21;
    }
  }
  else
  {
    double *v184 = v194;
    v195 = v184 + 1;
  }
  *((void *)a3 + 1) = v195;
  double v203 = v151 / v8;
  if (v150 <= 2.22044605e-16) {
    double v203 = 0.0;
  }
  double v204 = 1.0 / (exp(-v203) + 1.0);
  if (v195 >= (double *)v157)
  {
    v206 = *(double **)a3;
    uint64_t v207 = ((uint64_t)v195 - *(void *)a3) >> 3;
    unint64_t v208 = v207 + 1;
    if ((unint64_t)(v207 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    if ((v157 - (char *)v206) >> 2 > v208) {
      unint64_t v208 = (v157 - (char *)v206) >> 2;
    }
    if ((unint64_t)(v157 - (char *)v206) >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v209 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v209 = v208;
    }
    if (v209)
    {
      v210 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v209);
      v206 = *(double **)a3;
      v195 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v210 = 0;
    }
    v211 = (double *)&v210[8 * v207];
    v212 = &v210[8 * v209];
    double *v211 = v204;
    v205 = v211 + 1;
    while (v195 != v206)
    {
      uint64_t v213 = *((void *)v195-- - 1);
      *((void *)v211-- - 1) = v213;
    }
    *(void *)a3 = v211;
    *((void *)a3 + 1) = v205;
    *((void *)a3 + 2) = v212;
    if (v206) {
      operator delete(v206);
    }
  }
  else
  {
    double *v195 = v204;
    v205 = v195 + 1;
  }
  *((void *)a3 + 1) = v205;
  [v310 verticalSpacing];
  double v215 = v214 / v8;
  if (v150 <= 2.22044605e-16) {
    double v216 = 0.0;
  }
  else {
    double v216 = v215;
  }
  v218 = (double *)*((void *)a3 + 1);
  unint64_t v217 = *((void *)a3 + 2);
  if ((unint64_t)v218 >= v217)
  {
    v220 = *(double **)a3;
    uint64_t v221 = ((uint64_t)v218 - *(void *)a3) >> 3;
    unint64_t v222 = v221 + 1;
    if ((unint64_t)(v221 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v223 = v217 - (void)v220;
    if (v223 >> 2 > v222) {
      unint64_t v222 = v223 >> 2;
    }
    if ((unint64_t)v223 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v224 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v224 = v222;
    }
    if (v224)
    {
      v225 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v224);
      v220 = *(double **)a3;
      v218 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v225 = 0;
    }
    v226 = (double *)&v225[8 * v221];
    v227 = &v225[8 * v224];
    double *v226 = v216;
    v219 = v226 + 1;
    while (v218 != v220)
    {
      uint64_t v228 = *((void *)v218-- - 1);
      *((void *)v226-- - 1) = v228;
    }
    *(void *)a3 = v226;
    *((void *)a3 + 1) = v219;
    *((void *)a3 + 2) = v227;
    if (v220) {
      operator delete(v220);
    }
  }
  else
  {
    double *v218 = v216;
    v219 = v218 + 1;
  }
  *((void *)a3 + 1) = v219;
  [v310 horizontalOverlap];
  double v230 = fabs(v186);
  double v231 = v229 / v186;
  if (v230 <= 2.22044605e-16) {
    double v232 = 0.0;
  }
  else {
    double v232 = v231;
  }
  v234 = (double *)*((void *)a3 + 1);
  unint64_t v233 = *((void *)a3 + 2);
  if ((unint64_t)v234 >= v233)
  {
    v236 = *(double **)a3;
    uint64_t v237 = ((uint64_t)v234 - *(void *)a3) >> 3;
    unint64_t v238 = v237 + 1;
    if ((unint64_t)(v237 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v239 = v233 - (void)v236;
    if (v239 >> 2 > v238) {
      unint64_t v238 = v239 >> 2;
    }
    if ((unint64_t)v239 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v240 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v240 = v238;
    }
    if (v240)
    {
      v241 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v240);
      v236 = *(double **)a3;
      v234 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v241 = 0;
    }
    v242 = (double *)&v241[8 * v237];
    v243 = &v241[8 * v240];
    double *v242 = v232;
    v235 = v242 + 1;
    while (v234 != v236)
    {
      uint64_t v244 = *((void *)v234-- - 1);
      *((void *)v242-- - 1) = v244;
    }
    *(void *)a3 = v242;
    *((void *)a3 + 1) = v235;
    *((void *)a3 + 2) = v243;
    if (v236) {
      operator delete(v236);
    }
  }
  else
  {
    double *v234 = v232;
    v235 = v234 + 1;
  }
  *((void *)a3 + 1) = v235;
  [v310 verticalOverlap];
  double v246 = v245 / v8;
  if (v150 <= 2.22044605e-16) {
    double v247 = 0.0;
  }
  else {
    double v247 = v246;
  }
  v249 = (double *)*((void *)a3 + 1);
  unint64_t v248 = *((void *)a3 + 2);
  if ((unint64_t)v249 >= v248)
  {
    v251 = *(double **)a3;
    uint64_t v252 = ((uint64_t)v249 - *(void *)a3) >> 3;
    unint64_t v253 = v252 + 1;
    if ((unint64_t)(v252 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v254 = v248 - (void)v251;
    if (v254 >> 2 > v253) {
      unint64_t v253 = v254 >> 2;
    }
    if ((unint64_t)v254 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v255 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v255 = v253;
    }
    if (v255)
    {
      v256 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v255);
      v251 = *(double **)a3;
      v249 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v256 = 0;
    }
    v257 = (double *)&v256[8 * v252];
    v258 = &v256[8 * v255];
    double *v257 = v247;
    v250 = v257 + 1;
    while (v249 != v251)
    {
      uint64_t v259 = *((void *)v249-- - 1);
      *((void *)v257-- - 1) = v259;
    }
    *(void *)a3 = v257;
    *((void *)a3 + 1) = v250;
    *((void *)a3 + 2) = v258;
    if (v251) {
      operator delete(v251);
    }
  }
  else
  {
    double *v249 = v247;
    v250 = v249 + 1;
  }
  *((void *)a3 + 1) = v250;
  [v310 midDistance];
  double v261 = (v8 + v185 - v260) / v307;
  if (v309 <= 2.22044605e-16) {
    double v262 = 0.0;
  }
  else {
    double v262 = v261;
  }
  v264 = (double *)*((void *)a3 + 1);
  unint64_t v263 = *((void *)a3 + 2);
  if ((unint64_t)v264 >= v263)
  {
    v266 = *(double **)a3;
    uint64_t v267 = ((uint64_t)v264 - *(void *)a3) >> 3;
    unint64_t v268 = v267 + 1;
    if ((unint64_t)(v267 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v269 = v263 - (void)v266;
    if (v269 >> 2 > v268) {
      unint64_t v268 = v269 >> 2;
    }
    if ((unint64_t)v269 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v270 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v270 = v268;
    }
    if (v270)
    {
      v271 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v270);
      v266 = *(double **)a3;
      v264 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v271 = 0;
    }
    v272 = (double *)&v271[8 * v267];
    v273 = &v271[8 * v270];
    double *v272 = v262;
    v265 = v272 + 1;
    while (v264 != v266)
    {
      uint64_t v274 = *((void *)v264-- - 1);
      *((void *)v272-- - 1) = v274;
    }
    *(void *)a3 = v272;
    *((void *)a3 + 1) = v265;
    *((void *)a3 + 2) = v273;
    if (v266) {
      operator delete(v266);
    }
  }
  else
  {
    double *v264 = v262;
    v265 = v264 + 1;
  }
  *((void *)a3 + 1) = v265;
  [v310 xSpace];
  double v276 = v275 / v186;
  if (v230 <= 2.22044605e-16) {
    double v276 = 0.0;
  }
  long double v277 = exp(-v276);
  v279 = (double *)*((void *)a3 + 1);
  unint64_t v278 = *((void *)a3 + 2);
  double v280 = 1.0 / (v277 + 1.0);
  if ((unint64_t)v279 >= v278)
  {
    v282 = *(double **)a3;
    uint64_t v283 = ((uint64_t)v279 - *(void *)a3) >> 3;
    unint64_t v284 = v283 + 1;
    if ((unint64_t)(v283 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v285 = v278 - (void)v282;
    if (v285 >> 2 > v284) {
      unint64_t v284 = v285 >> 2;
    }
    if ((unint64_t)v285 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v286 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v286 = v284;
    }
    if (v286)
    {
      v287 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v286);
      v282 = *(double **)a3;
      v279 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v287 = 0;
    }
    v288 = (double *)&v287[8 * v283];
    v289 = &v287[8 * v286];
    double *v288 = v280;
    v281 = v288 + 1;
    while (v279 != v282)
    {
      uint64_t v290 = *((void *)v279-- - 1);
      *((void *)v288-- - 1) = v290;
    }
    *(void *)a3 = v288;
    *((void *)a3 + 1) = v281;
    *((void *)a3 + 2) = v289;
    if (v282) {
      operator delete(v282);
    }
  }
  else
  {
    double *v279 = v280;
    v281 = v279 + 1;
  }
  *((void *)a3 + 1) = v281;
  [v310 ySpace];
  double v292 = v291 / v185;
  if (fabs(v185) <= 2.22044605e-16) {
    double v292 = 0.0;
  }
  long double v293 = exp(-v292);
  v295 = (double *)*((void *)a3 + 1);
  unint64_t v294 = *((void *)a3 + 2);
  double v296 = 1.0 / (v293 + 1.0);
  if ((unint64_t)v295 >= v294)
  {
    v298 = *(double **)a3;
    uint64_t v299 = ((uint64_t)v295 - *(void *)a3) >> 3;
    unint64_t v300 = v299 + 1;
    if ((unint64_t)(v299 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v301 = v294 - (void)v298;
    if (v301 >> 2 > v300) {
      unint64_t v300 = v301 >> 2;
    }
    if ((unint64_t)v301 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v302 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v302 = v300;
    }
    if (v302)
    {
      v303 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v302);
      v298 = *(double **)a3;
      v295 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v303 = 0;
    }
    v304 = (double *)&v303[8 * v299];
    v305 = &v303[8 * v302];
    double *v304 = v296;
    v297 = v304 + 1;
    while (v295 != v298)
    {
      uint64_t v306 = *((void *)v295-- - 1);
      *((void *)v304-- - 1) = v306;
    }
    *(void *)a3 = v304;
    *((void *)a3 + 1) = v297;
    *((void *)a3 + 2) = v305;
    if (v298) {
      operator delete(v298);
    }
  }
  else
  {
    double *v295 = v296;
    v297 = v295 + 1;
  }
  *((void *)a3 + 1) = v297;
}

+ (void)_extractEvaluatedFeaturesTo:(void *)a3 evaluation:(id)a4
{
  id v174 = a4;
  double v5 = (double)[v174 isOversegmented];
  unint64_t v6 = *((void *)a3 + 2);
  double v7 = (double *)*((void *)a3 + 1);
  if ((unint64_t)v7 >= v6)
  {
    double v9 = *(double **)a3;
    uint64_t v10 = ((uint64_t)v7 - *(void *)a3) >> 3;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v6 - (void)v9;
    if (v12 >> 2 > v11) {
      unint64_t v11 = v12 >> 2;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13)
    {
      double v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v13);
      double v9 = *(double **)a3;
      double v7 = (double *)*((void *)a3 + 1);
    }
    else
    {
      double v14 = 0;
    }
    double v15 = (double *)&v14[8 * v10];
    double v16 = &v14[8 * v13];
    *double v15 = v5;
    double v8 = v15 + 1;
    while (v7 != v9)
    {
      uint64_t v17 = *((void *)v7-- - 1);
      *((void *)v15-- - 1) = v17;
    }
    *(void *)a3 = v15;
    *((void *)a3 + 1) = v8;
    *((void *)a3 + 2) = v16;
    if (v9) {
      operator delete(v9);
    }
  }
  else
  {
    *double v7 = v5;
    double v8 = v7 + 1;
  }
  *((void *)a3 + 1) = v8;
  double v18 = (double)[v174 caseWrappingScoreUsingCustomConfiguration:0] / 10.0;
  uint64_t v20 = (double *)*((void *)a3 + 1);
  unint64_t v19 = *((void *)a3 + 2);
  if ((unint64_t)v20 >= v19)
  {
    v22 = *(double **)a3;
    uint64_t v23 = ((uint64_t)v20 - *(void *)a3) >> 3;
    unint64_t v24 = v23 + 1;
    if ((unint64_t)(v23 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v25 = v19 - (void)v22;
    if (v25 >> 2 > v24) {
      unint64_t v24 = v25 >> 2;
    }
    if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v26 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v26 = v24;
    }
    if (v26)
    {
      uint64_t v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v26);
      v22 = *(double **)a3;
      uint64_t v20 = (double *)*((void *)a3 + 1);
    }
    else
    {
      uint64_t v27 = 0;
    }
    unint64_t v28 = (double *)&v27[8 * v23];
    uint64_t v29 = &v27[8 * v26];
    *unint64_t v28 = v18;
    unint64_t v21 = v28 + 1;
    while (v20 != v22)
    {
      uint64_t v30 = *((void *)v20-- - 1);
      *((void *)v28-- - 1) = v30;
    }
    *(void *)a3 = v28;
    *((void *)a3 + 1) = v21;
    *((void *)a3 + 2) = v29;
    if (v22) {
      operator delete(v22);
    }
  }
  else
  {
    double *v20 = v18;
    unint64_t v21 = v20 + 1;
  }
  *((void *)a3 + 1) = v21;
  double v31 = (double)[v174 wordCountWrappingScore] / 10.0;
  uint64_t v33 = (double *)*((void *)a3 + 1);
  unint64_t v32 = *((void *)a3 + 2);
  if ((unint64_t)v33 >= v32)
  {
    uint64_t v35 = *(double **)a3;
    uint64_t v36 = ((uint64_t)v33 - *(void *)a3) >> 3;
    unint64_t v37 = v36 + 1;
    if ((unint64_t)(v36 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v38 = v32 - (void)v35;
    if (v38 >> 2 > v37) {
      unint64_t v37 = v38 >> 2;
    }
    if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v39 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v39 = v37;
    }
    if (v39)
    {
      uint64_t v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v39);
      uint64_t v35 = *(double **)a3;
      uint64_t v33 = (double *)*((void *)a3 + 1);
    }
    else
    {
      uint64_t v40 = 0;
    }
    uint64_t v41 = (double *)&v40[8 * v36];
    unint64_t v42 = &v40[8 * v39];
    *uint64_t v41 = v31;
    unint64_t v34 = v41 + 1;
    while (v33 != v35)
    {
      uint64_t v43 = *((void *)v33-- - 1);
      *((void *)v41-- - 1) = v43;
    }
    *(void *)a3 = v41;
    *((void *)a3 + 1) = v34;
    *((void *)a3 + 2) = v42;
    if (v35) {
      operator delete(v35);
    }
  }
  else
  {
    *uint64_t v33 = v31;
    unint64_t v34 = v33 + 1;
  }
  *((void *)a3 + 1) = v34;
  double v44 = (double)[v174 punctuationWrappingScoreUsingCustomConfiguration:0] / 10.0;
  uint64_t v46 = (double *)*((void *)a3 + 1);
  unint64_t v45 = *((void *)a3 + 2);
  if ((unint64_t)v46 >= v45)
  {
    uint64_t v48 = *(double **)a3;
    uint64_t v49 = ((uint64_t)v46 - *(void *)a3) >> 3;
    unint64_t v50 = v49 + 1;
    if ((unint64_t)(v49 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v51 = v45 - (void)v48;
    if (v51 >> 2 > v50) {
      unint64_t v50 = v51 >> 2;
    }
    if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v52 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v52 = v50;
    }
    if (v52)
    {
      double v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v52);
      uint64_t v48 = *(double **)a3;
      uint64_t v46 = (double *)*((void *)a3 + 1);
    }
    else
    {
      double v53 = 0;
    }
    uint64_t v54 = (double *)&v53[8 * v49];
    double v55 = &v53[8 * v52];
    *uint64_t v54 = v44;
    unint64_t v47 = v54 + 1;
    while (v46 != v48)
    {
      uint64_t v56 = *((void *)v46-- - 1);
      *((void *)v54-- - 1) = v56;
    }
    *(void *)a3 = v54;
    *((void *)a3 + 1) = v47;
    *((void *)a3 + 2) = v55;
    if (v48) {
      operator delete(v48);
    }
  }
  else
  {
    double *v46 = v44;
    unint64_t v47 = v46 + 1;
  }
  *((void *)a3 + 1) = v47;
  double v57 = (double)[v174 textContentWrappingScore] / 10.0;
  unint64_t v59 = (double *)*((void *)a3 + 1);
  unint64_t v58 = *((void *)a3 + 2);
  if ((unint64_t)v59 >= v58)
  {
    unint64_t v61 = *(double **)a3;
    uint64_t v62 = ((uint64_t)v59 - *(void *)a3) >> 3;
    unint64_t v63 = v62 + 1;
    if ((unint64_t)(v62 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v64 = v58 - (void)v61;
    if (v64 >> 2 > v63) {
      unint64_t v63 = v64 >> 2;
    }
    if ((unint64_t)v64 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v65 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v65 = v63;
    }
    if (v65)
    {
      unint64_t v66 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v65);
      unint64_t v61 = *(double **)a3;
      unint64_t v59 = (double *)*((void *)a3 + 1);
    }
    else
    {
      unint64_t v66 = 0;
    }
    int64_t v67 = (double *)&v66[8 * v62];
    double v68 = &v66[8 * v65];
    *int64_t v67 = v57;
    uint64_t v60 = v67 + 1;
    while (v59 != v61)
    {
      uint64_t v69 = *((void *)v59-- - 1);
      *((void *)v67-- - 1) = v69;
    }
    *(void *)a3 = v67;
    *((void *)a3 + 1) = v60;
    *((void *)a3 + 2) = v68;
    if (v61) {
      operator delete(v61);
    }
  }
  else
  {
    *unint64_t v59 = v57;
    uint64_t v60 = v59 + 1;
  }
  *((void *)a3 + 1) = v60;
  double v70 = (double)[v174 midSentencePunctuated];
  unint64_t v72 = (double *)*((void *)a3 + 1);
  unint64_t v71 = *((void *)a3 + 2);
  if ((unint64_t)v72 >= v71)
  {
    unint64_t v74 = *(double **)a3;
    uint64_t v75 = ((uint64_t)v72 - *(void *)a3) >> 3;
    unint64_t v76 = v75 + 1;
    if ((unint64_t)(v75 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v77 = v71 - (void)v74;
    if (v77 >> 2 > v76) {
      unint64_t v76 = v77 >> 2;
    }
    if ((unint64_t)v77 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v78 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v78 = v76;
    }
    if (v78)
    {
      float v79 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v78);
      unint64_t v74 = *(double **)a3;
      unint64_t v72 = (double *)*((void *)a3 + 1);
    }
    else
    {
      float v79 = 0;
    }
    double v80 = (double *)&v79[8 * v75];
    unint64_t v81 = &v79[8 * v78];
    *double v80 = v70;
    uint64_t v73 = v80 + 1;
    while (v72 != v74)
    {
      uint64_t v82 = *((void *)v72-- - 1);
      *((void *)v80-- - 1) = v82;
    }
    *(void *)a3 = v80;
    *((void *)a3 + 1) = v73;
    *((void *)a3 + 2) = v81;
    if (v74) {
      operator delete(v74);
    }
  }
  else
  {
    *unint64_t v72 = v70;
    uint64_t v73 = v72 + 1;
  }
  *((void *)a3 + 1) = v73;
  double v83 = (double)[v174 bothBeginWithDigits];
  double v85 = (double *)*((void *)a3 + 1);
  unint64_t v84 = *((void *)a3 + 2);
  if ((unint64_t)v85 >= v84)
  {
    v87 = *(double **)a3;
    uint64_t v88 = ((uint64_t)v85 - *(void *)a3) >> 3;
    unint64_t v89 = v88 + 1;
    if ((unint64_t)(v88 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v90 = v84 - (void)v87;
    if (v90 >> 2 > v89) {
      unint64_t v89 = v90 >> 2;
    }
    if ((unint64_t)v90 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v91 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v91 = v89;
    }
    if (v91)
    {
      v92 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v91);
      v87 = *(double **)a3;
      double v85 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v92 = 0;
    }
    v93 = (double *)&v92[8 * v88];
    v94 = &v92[8 * v91];
    double *v93 = v83;
    v86 = v93 + 1;
    while (v85 != v87)
    {
      uint64_t v95 = *((void *)v85-- - 1);
      *((void *)v93-- - 1) = v95;
    }
    *(void *)a3 = v93;
    *((void *)a3 + 1) = v86;
    *((void *)a3 + 2) = v94;
    if (v87) {
      operator delete(v87);
    }
  }
  else
  {
    *double v85 = v83;
    v86 = v85 + 1;
  }
  *((void *)a3 + 1) = v86;
  double v96 = (double)[v174 f2StartOfSentence];
  unint64_t v98 = (double *)*((void *)a3 + 1);
  unint64_t v97 = *((void *)a3 + 2);
  if ((unint64_t)v98 >= v97)
  {
    double v100 = *(double **)a3;
    uint64_t v101 = ((uint64_t)v98 - *(void *)a3) >> 3;
    unint64_t v102 = v101 + 1;
    if ((unint64_t)(v101 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v103 = v97 - (void)v100;
    if (v103 >> 2 > v102) {
      unint64_t v102 = v103 >> 2;
    }
    if ((unint64_t)v103 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v104 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v104 = v102;
    }
    if (v104)
    {
      uint64_t v105 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v104);
      double v100 = *(double **)a3;
      unint64_t v98 = (double *)*((void *)a3 + 1);
    }
    else
    {
      uint64_t v105 = 0;
    }
    unint64_t v106 = (double *)&v105[8 * v101];
    v107 = &v105[8 * v104];
    *unint64_t v106 = v96;
    v99 = v106 + 1;
    while (v98 != v100)
    {
      uint64_t v108 = *((void *)v98-- - 1);
      *((void *)v106-- - 1) = v108;
    }
    *(void *)a3 = v106;
    *((void *)a3 + 1) = v99;
    *((void *)a3 + 2) = v107;
    if (v100) {
      operator delete(v100);
    }
  }
  else
  {
    *unint64_t v98 = v96;
    v99 = v98 + 1;
  }
  *((void *)a3 + 1) = v99;
  double v109 = (double)[v174 oversegmentedListItem];
  float v111 = (double *)*((void *)a3 + 1);
  unint64_t v110 = *((void *)a3 + 2);
  if ((unint64_t)v111 >= v110)
  {
    unint64_t v113 = *(double **)a3;
    uint64_t v114 = ((uint64_t)v111 - *(void *)a3) >> 3;
    unint64_t v115 = v114 + 1;
    if ((unint64_t)(v114 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v116 = v110 - (void)v113;
    if (v116 >> 2 > v115) {
      unint64_t v115 = v116 >> 2;
    }
    if ((unint64_t)v116 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v117 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v117 = v115;
    }
    if (v117)
    {
      v118 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v117);
      unint64_t v113 = *(double **)a3;
      float v111 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v118 = 0;
    }
    v119 = (double *)&v118[8 * v114];
    uint64_t v120 = &v118[8 * v117];
    double *v119 = v109;
    double v112 = v119 + 1;
    while (v111 != v113)
    {
      uint64_t v121 = *((void *)v111-- - 1);
      *((void *)v119-- - 1) = v121;
    }
    *(void *)a3 = v119;
    *((void *)a3 + 1) = v112;
    *((void *)a3 + 2) = v120;
    if (v113) {
      operator delete(v113);
    }
  }
  else
  {
    *float v111 = v109;
    double v112 = v111 + 1;
  }
  *((void *)a3 + 1) = v112;
  double v122 = (double)[v174 f2BeginsWithDD];
  v124 = (double *)*((void *)a3 + 1);
  unint64_t v123 = *((void *)a3 + 2);
  if ((unint64_t)v124 >= v123)
  {
    v126 = *(double **)a3;
    uint64_t v127 = ((uint64_t)v124 - *(void *)a3) >> 3;
    unint64_t v128 = v127 + 1;
    if ((unint64_t)(v127 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v129 = v123 - (void)v126;
    if (v129 >> 2 > v128) {
      unint64_t v128 = v129 >> 2;
    }
    if ((unint64_t)v129 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v130 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v130 = v128;
    }
    if (v130)
    {
      v131 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v130);
      v126 = *(double **)a3;
      v124 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v131 = 0;
    }
    v132 = (double *)&v131[8 * v127];
    v133 = &v131[8 * v130];
    double *v132 = v122;
    v125 = v132 + 1;
    while (v124 != v126)
    {
      uint64_t v134 = *((void *)v124-- - 1);
      *((void *)v132-- - 1) = v134;
    }
    *(void *)a3 = v132;
    *((void *)a3 + 1) = v125;
    *((void *)a3 + 2) = v133;
    if (v126) {
      operator delete(v126);
    }
  }
  else
  {
    double *v124 = v122;
    v125 = v124 + 1;
  }
  *((void *)a3 + 1) = v125;
  double v135 = (double)[v174 f1EndsWithDD];
  unint64_t v137 = (double *)*((void *)a3 + 1);
  unint64_t v136 = *((void *)a3 + 2);
  if ((unint64_t)v137 >= v136)
  {
    v139 = *(double **)a3;
    uint64_t v140 = ((uint64_t)v137 - *(void *)a3) >> 3;
    unint64_t v141 = v140 + 1;
    if ((unint64_t)(v140 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v142 = v136 - (void)v139;
    if (v142 >> 2 > v141) {
      unint64_t v141 = v142 >> 2;
    }
    if ((unint64_t)v142 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v143 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v143 = v141;
    }
    if (v143)
    {
      double v144 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v143);
      v139 = *(double **)a3;
      unint64_t v137 = (double *)*((void *)a3 + 1);
    }
    else
    {
      double v144 = 0;
    }
    double v145 = (double *)&v144[8 * v140];
    double v146 = &v144[8 * v143];
    *double v145 = v135;
    v138 = v145 + 1;
    while (v137 != v139)
    {
      uint64_t v147 = *((void *)v137-- - 1);
      *((void *)v145-- - 1) = v147;
    }
    *(void *)a3 = v145;
    *((void *)a3 + 1) = v138;
    *((void *)a3 + 2) = v146;
    if (v139) {
      operator delete(v139);
    }
  }
  else
  {
    *unint64_t v137 = v135;
    v138 = v137 + 1;
  }
  *((void *)a3 + 1) = v138;
  double v148 = (double)[v174 f2FullyDD];
  double v150 = (double *)*((void *)a3 + 1);
  unint64_t v149 = *((void *)a3 + 2);
  if ((unint64_t)v150 >= v149)
  {
    double v152 = *(double **)a3;
    uint64_t v153 = ((uint64_t)v150 - *(void *)a3) >> 3;
    unint64_t v154 = v153 + 1;
    if ((unint64_t)(v153 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v155 = v149 - (void)v152;
    if (v155 >> 2 > v154) {
      unint64_t v154 = v155 >> 2;
    }
    if ((unint64_t)v155 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v156 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v156 = v154;
    }
    if (v156)
    {
      v157 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v156);
      double v152 = *(double **)a3;
      double v150 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v157 = 0;
    }
    v158 = (double *)&v157[8 * v153];
    v159 = &v157[8 * v156];
    double *v158 = v148;
    double v151 = v158 + 1;
    while (v150 != v152)
    {
      uint64_t v160 = *((void *)v150-- - 1);
      *((void *)v158-- - 1) = v160;
    }
    *(void *)a3 = v158;
    *((void *)a3 + 1) = v151;
    *((void *)a3 + 2) = v159;
    if (v152) {
      operator delete(v152);
    }
  }
  else
  {
    *double v150 = v148;
    double v151 = v150 + 1;
  }
  *((void *)a3 + 1) = v151;
  double v161 = (double)[v174 multilineDD];
  v163 = (double *)*((void *)a3 + 1);
  unint64_t v162 = *((void *)a3 + 2);
  if ((unint64_t)v163 >= v162)
  {
    uint64_t v165 = *(double **)a3;
    uint64_t v166 = ((uint64_t)v163 - *(void *)a3) >> 3;
    unint64_t v167 = v166 + 1;
    if ((unint64_t)(v166 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v168 = v162 - (void)v165;
    if (v168 >> 2 > v167) {
      unint64_t v167 = v168 >> 2;
    }
    if ((unint64_t)v168 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v169 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v169 = v167;
    }
    if (v169)
    {
      unint64_t v170 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a3 + 16, v169);
      uint64_t v165 = *(double **)a3;
      v163 = (double *)*((void *)a3 + 1);
    }
    else
    {
      unint64_t v170 = 0;
    }
    v171 = (double *)&v170[8 * v166];
    v172 = &v170[8 * v169];
    double *v171 = v161;
    v164 = v171 + 1;
    while (v163 != v165)
    {
      uint64_t v173 = *((void *)v163-- - 1);
      *((void *)v171-- - 1) = v173;
    }
    *(void *)a3 = v171;
    *((void *)a3 + 1) = v164;
    *((void *)a3 + 2) = v172;
    if (v165) {
      operator delete(v165);
    }
  }
  else
  {
    double *v163 = v161;
    v164 = v163 + 1;
  }
  *((void *)a3 + 1) = v164;
}

+ (void)_extractLexicalFeaturesTo:(void *)a3 string1:(id)a4 string2:(id)a5 configuration:(id)a6 forCJK:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v544 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v517 = a5;
  id v13 = a6;
  v516 = v12;
  v514 = v13;
  double v14 = (double)[v12 _crStartsWithListItemIndicator];
  unint64_t v15 = *((void *)a3 + 2);
  v523 = (char **)((char *)a3 + 16);
  double v16 = (double *)*((void *)a3 + 1);
  if ((unint64_t)v16 >= v15)
  {
    double v18 = *(double **)a3;
    uint64_t v19 = ((uint64_t)v16 - *(void *)a3) >> 3;
    unint64_t v20 = v19 + 1;
    if ((unint64_t)(v19 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v21 = v15 - (void)v18;
    if (v21 >> 2 > v20) {
      unint64_t v20 = v21 >> 2;
    }
    if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v22 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v22 = v20;
    }
    if (v22)
    {
      uint64_t v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v22);
      double v18 = *(double **)a3;
      double v16 = (double *)*((void *)a3 + 1);
    }
    else
    {
      uint64_t v23 = 0;
    }
    unint64_t v24 = (double *)&v23[8 * v19];
    uint64_t v25 = &v23[8 * v22];
    *unint64_t v24 = v14;
    uint64_t v17 = v24 + 1;
    while (v16 != v18)
    {
      uint64_t v26 = *((void *)v16-- - 1);
      *((void *)v24-- - 1) = v26;
    }
    *(void *)a3 = v24;
    *((void *)a3 + 1) = v17;
    *((void *)a3 + 2) = v25;
    if (v18) {
      operator delete(v18);
    }
  }
  else
  {
    double *v16 = v14;
    uint64_t v17 = v16 + 1;
  }
  *((void *)a3 + 1) = v17;
  double v27 = (double)[v12 _crStartsWithDigit];
  uint64_t v29 = (double *)*((void *)a3 + 1);
  unint64_t v28 = *((void *)a3 + 2);
  if ((unint64_t)v29 >= v28)
  {
    double v31 = *(double **)a3;
    uint64_t v32 = ((uint64_t)v29 - *(void *)a3) >> 3;
    unint64_t v33 = v32 + 1;
    if ((unint64_t)(v32 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v34 = v28 - (void)v31;
    if (v34 >> 2 > v33) {
      unint64_t v33 = v34 >> 2;
    }
    if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v35 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v35 = v33;
    }
    if (v35)
    {
      uint64_t v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v35);
      double v31 = *(double **)a3;
      uint64_t v29 = (double *)*((void *)a3 + 1);
    }
    else
    {
      uint64_t v36 = 0;
    }
    unint64_t v37 = (double *)&v36[8 * v32];
    uint64_t v38 = &v36[8 * v35];
    *unint64_t v37 = v27;
    uint64_t v30 = v37 + 1;
    while (v29 != v31)
    {
      uint64_t v39 = *((void *)v29-- - 1);
      *((void *)v37-- - 1) = v39;
    }
    *(void *)a3 = v37;
    *((void *)a3 + 1) = v30;
    *((void *)a3 + 2) = v38;
    if (v31) {
      operator delete(v31);
    }
  }
  else
  {
    double *v29 = v27;
    uint64_t v30 = v29 + 1;
  }
  *((void *)a3 + 1) = v30;
  double v40 = (double)[v12 _crEndsWithClosingPunctuation];
  unint64_t v42 = (double *)*((void *)a3 + 1);
  unint64_t v41 = *((void *)a3 + 2);
  if ((unint64_t)v42 >= v41)
  {
    double v44 = *(double **)a3;
    uint64_t v45 = ((uint64_t)v42 - *(void *)a3) >> 3;
    unint64_t v46 = v45 + 1;
    if ((unint64_t)(v45 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v47 = v41 - (void)v44;
    if (v47 >> 2 > v46) {
      unint64_t v46 = v47 >> 2;
    }
    if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v48 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v48 = v46;
    }
    if (v48)
    {
      uint64_t v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v48);
      double v44 = *(double **)a3;
      unint64_t v42 = (double *)*((void *)a3 + 1);
    }
    else
    {
      uint64_t v49 = 0;
    }
    unint64_t v50 = (double *)&v49[8 * v45];
    uint64_t v51 = &v49[8 * v48];
    double *v50 = v40;
    uint64_t v43 = v50 + 1;
    while (v42 != v44)
    {
      uint64_t v52 = *((void *)v42-- - 1);
      *((void *)v50-- - 1) = v52;
    }
    *(void *)a3 = v50;
    *((void *)a3 + 1) = v43;
    *((void *)a3 + 2) = v51;
    if (v44) {
      operator delete(v44);
    }
  }
  else
  {
    *unint64_t v42 = v40;
    uint64_t v43 = v42 + 1;
  }
  *((void *)a3 + 1) = v43;
  double v53 = (double)[v12 _crEndsWithHyphen];
  double v55 = (double *)*((void *)a3 + 1);
  unint64_t v54 = *((void *)a3 + 2);
  if ((unint64_t)v55 >= v54)
  {
    double v57 = *(double **)a3;
    uint64_t v58 = ((uint64_t)v55 - *(void *)a3) >> 3;
    unint64_t v59 = v58 + 1;
    if ((unint64_t)(v58 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v60 = v54 - (void)v57;
    if (v60 >> 2 > v59) {
      unint64_t v59 = v60 >> 2;
    }
    if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v61 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v61 = v59;
    }
    if (v61)
    {
      uint64_t v62 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v61);
      double v57 = *(double **)a3;
      double v55 = (double *)*((void *)a3 + 1);
    }
    else
    {
      uint64_t v62 = 0;
    }
    unint64_t v63 = (double *)&v62[8 * v58];
    uint64_t v64 = &v62[8 * v61];
    double *v63 = v53;
    uint64_t v56 = v63 + 1;
    while (v55 != v57)
    {
      uint64_t v65 = *((void *)v55-- - 1);
      *((void *)v63-- - 1) = v65;
    }
    *(void *)a3 = v63;
    *((void *)a3 + 1) = v56;
    *((void *)a3 + 2) = v64;
    if (v57) {
      operator delete(v57);
    }
  }
  else
  {
    *double v55 = v53;
    uint64_t v56 = v55 + 1;
  }
  *((void *)a3 + 1) = v56;
  double v66 = (double)[v12 _crEndsWithDigit];
  double v68 = (double *)*((void *)a3 + 1);
  unint64_t v67 = *((void *)a3 + 2);
  if ((unint64_t)v68 >= v67)
  {
    double v70 = *(double **)a3;
    uint64_t v71 = ((uint64_t)v68 - *(void *)a3) >> 3;
    unint64_t v72 = v71 + 1;
    if ((unint64_t)(v71 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v73 = v67 - (void)v70;
    if (v73 >> 2 > v72) {
      unint64_t v72 = v73 >> 2;
    }
    if ((unint64_t)v73 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v74 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v74 = v72;
    }
    if (v74)
    {
      uint64_t v75 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v74);
      double v70 = *(double **)a3;
      double v68 = (double *)*((void *)a3 + 1);
    }
    else
    {
      uint64_t v75 = 0;
    }
    unint64_t v76 = (double *)&v75[8 * v71];
    uint64_t v77 = &v75[8 * v74];
    double *v76 = v66;
    uint64_t v69 = v76 + 1;
    while (v68 != v70)
    {
      uint64_t v78 = *((void *)v68-- - 1);
      *((void *)v76-- - 1) = v78;
    }
    *(void *)a3 = v76;
    *((void *)a3 + 1) = v69;
    *((void *)a3 + 2) = v77;
    if (v70) {
      operator delete(v70);
    }
  }
  else
  {
    double *v68 = v66;
    uint64_t v69 = v68 + 1;
  }
  *((void *)a3 + 1) = v69;
  double v79 = (double)[v12 _crIsSentencePunctuatedIncludingWhitespace:1];
  unint64_t v81 = (double *)*((void *)a3 + 1);
  unint64_t v80 = *((void *)a3 + 2);
  if ((unint64_t)v81 >= v80)
  {
    double v83 = *(double **)a3;
    uint64_t v84 = ((uint64_t)v81 - *(void *)a3) >> 3;
    unint64_t v85 = v84 + 1;
    if ((unint64_t)(v84 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v86 = v80 - (void)v83;
    if (v86 >> 2 > v85) {
      unint64_t v85 = v86 >> 2;
    }
    if ((unint64_t)v86 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v87 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v87 = v85;
    }
    if (v87)
    {
      uint64_t v88 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v87);
      double v83 = *(double **)a3;
      unint64_t v81 = (double *)*((void *)a3 + 1);
    }
    else
    {
      uint64_t v88 = 0;
    }
    unint64_t v89 = (double *)&v88[8 * v84];
    uint64_t v90 = &v88[8 * v87];
    *unint64_t v89 = v79;
    uint64_t v82 = v89 + 1;
    while (v81 != v83)
    {
      uint64_t v91 = *((void *)v81-- - 1);
      *((void *)v89-- - 1) = v91;
    }
    *(void *)a3 = v89;
    *((void *)a3 + 1) = v82;
    *((void *)a3 + 2) = v90;
    if (v83) {
      operator delete(v83);
    }
  }
  else
  {
    *unint64_t v81 = v79;
    uint64_t v82 = v81 + 1;
  }
  *((void *)a3 + 1) = v82;
  double v92 = (double)[v517 _crStartsWithListItemIndicator];
  v94 = (double *)*((void *)a3 + 1);
  unint64_t v93 = *((void *)a3 + 2);
  if ((unint64_t)v94 >= v93)
  {
    double v96 = *(double **)a3;
    uint64_t v97 = ((uint64_t)v94 - *(void *)a3) >> 3;
    unint64_t v98 = v97 + 1;
    if ((unint64_t)(v97 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v99 = v93 - (void)v96;
    if (v99 >> 2 > v98) {
      unint64_t v98 = v99 >> 2;
    }
    if ((unint64_t)v99 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v100 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v100 = v98;
    }
    if (v100)
    {
      uint64_t v101 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v100);
      double v96 = *(double **)a3;
      v94 = (double *)*((void *)a3 + 1);
    }
    else
    {
      uint64_t v101 = 0;
    }
    unint64_t v102 = (double *)&v101[8 * v97];
    uint64_t v103 = &v101[8 * v100];
    double *v102 = v92;
    uint64_t v95 = v102 + 1;
    while (v94 != v96)
    {
      uint64_t v104 = *((void *)v94-- - 1);
      *((void *)v102-- - 1) = v104;
    }
    *(void *)a3 = v102;
    *((void *)a3 + 1) = v95;
    *((void *)a3 + 2) = v103;
    if (v96) {
      operator delete(v96);
    }
  }
  else
  {
    double *v94 = v92;
    uint64_t v95 = v94 + 1;
  }
  *((void *)a3 + 1) = v95;
  double v105 = (double)[v517 _crStartsWithDigit];
  v107 = (double *)*((void *)a3 + 1);
  unint64_t v106 = *((void *)a3 + 2);
  if ((unint64_t)v107 >= v106)
  {
    double v109 = *(double **)a3;
    uint64_t v110 = ((uint64_t)v107 - *(void *)a3) >> 3;
    unint64_t v111 = v110 + 1;
    if ((unint64_t)(v110 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v112 = v106 - (void)v109;
    if (v112 >> 2 > v111) {
      unint64_t v111 = v112 >> 2;
    }
    if ((unint64_t)v112 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v113 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v113 = v111;
    }
    if (v113)
    {
      uint64_t v114 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v113);
      double v109 = *(double **)a3;
      v107 = (double *)*((void *)a3 + 1);
    }
    else
    {
      uint64_t v114 = 0;
    }
    unint64_t v115 = (double *)&v114[8 * v110];
    uint64_t v116 = &v114[8 * v113];
    *unint64_t v115 = v105;
    uint64_t v108 = v115 + 1;
    while (v107 != v109)
    {
      uint64_t v117 = *((void *)v107-- - 1);
      *((void *)v115-- - 1) = v117;
    }
    *(void *)a3 = v115;
    *((void *)a3 + 1) = v108;
    *((void *)a3 + 2) = v116;
    if (v109) {
      operator delete(v109);
    }
  }
  else
  {
    double *v107 = v105;
    uint64_t v108 = v107 + 1;
  }
  *((void *)a3 + 1) = v108;
  double v118 = (double)[v517 _crEndsWithClosingPunctuation];
  uint64_t v120 = (double *)*((void *)a3 + 1);
  unint64_t v119 = *((void *)a3 + 2);
  if ((unint64_t)v120 >= v119)
  {
    double v122 = *(double **)a3;
    uint64_t v123 = ((uint64_t)v120 - *(void *)a3) >> 3;
    unint64_t v124 = v123 + 1;
    if ((unint64_t)(v123 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v125 = v119 - (void)v122;
    if (v125 >> 2 > v124) {
      unint64_t v124 = v125 >> 2;
    }
    if ((unint64_t)v125 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v126 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v126 = v124;
    }
    if (v126)
    {
      uint64_t v127 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v126);
      double v122 = *(double **)a3;
      uint64_t v120 = (double *)*((void *)a3 + 1);
    }
    else
    {
      uint64_t v127 = 0;
    }
    unint64_t v128 = (double *)&v127[8 * v123];
    uint64_t v129 = &v127[8 * v126];
    *unint64_t v128 = v118;
    uint64_t v121 = v128 + 1;
    while (v120 != v122)
    {
      uint64_t v130 = *((void *)v120-- - 1);
      *((void *)v128-- - 1) = v130;
    }
    *(void *)a3 = v128;
    *((void *)a3 + 1) = v121;
    *((void *)a3 + 2) = v129;
    if (v122) {
      operator delete(v122);
    }
  }
  else
  {
    *uint64_t v120 = v118;
    uint64_t v121 = v120 + 1;
  }
  *((void *)a3 + 1) = v121;
  double v131 = (double)[v517 _crEndsWithHyphen];
  v133 = (double *)*((void *)a3 + 1);
  unint64_t v132 = *((void *)a3 + 2);
  if ((unint64_t)v133 >= v132)
  {
    double v135 = *(double **)a3;
    uint64_t v136 = ((uint64_t)v133 - *(void *)a3) >> 3;
    unint64_t v137 = v136 + 1;
    if ((unint64_t)(v136 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v138 = v132 - (void)v135;
    if (v138 >> 2 > v137) {
      unint64_t v137 = v138 >> 2;
    }
    if ((unint64_t)v138 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v139 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v139 = v137;
    }
    if (v139)
    {
      uint64_t v140 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v139);
      double v135 = *(double **)a3;
      v133 = (double *)*((void *)a3 + 1);
    }
    else
    {
      uint64_t v140 = 0;
    }
    unint64_t v141 = (double *)&v140[8 * v136];
    uint64_t v142 = &v140[8 * v139];
    *unint64_t v141 = v131;
    uint64_t v134 = v141 + 1;
    while (v133 != v135)
    {
      uint64_t v143 = *((void *)v133-- - 1);
      *((void *)v141-- - 1) = v143;
    }
    *(void *)a3 = v141;
    *((void *)a3 + 1) = v134;
    *((void *)a3 + 2) = v142;
    if (v135) {
      operator delete(v135);
    }
  }
  else
  {
    double *v133 = v131;
    uint64_t v134 = v133 + 1;
  }
  *((void *)a3 + 1) = v134;
  double v144 = (double)[v517 _crEndsWithDigit];
  double v146 = (double *)*((void *)a3 + 1);
  unint64_t v145 = *((void *)a3 + 2);
  if ((unint64_t)v146 >= v145)
  {
    double v148 = *(double **)a3;
    uint64_t v149 = ((uint64_t)v146 - *(void *)a3) >> 3;
    unint64_t v150 = v149 + 1;
    if ((unint64_t)(v149 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v151 = v145 - (void)v148;
    if (v151 >> 2 > v150) {
      unint64_t v150 = v151 >> 2;
    }
    if ((unint64_t)v151 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v152 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v152 = v150;
    }
    if (v152)
    {
      uint64_t v153 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v152);
      double v148 = *(double **)a3;
      double v146 = (double *)*((void *)a3 + 1);
    }
    else
    {
      uint64_t v153 = 0;
    }
    unint64_t v154 = (double *)&v153[8 * v149];
    uint64_t v155 = &v153[8 * v152];
    *unint64_t v154 = v144;
    uint64_t v147 = v154 + 1;
    while (v146 != v148)
    {
      uint64_t v156 = *((void *)v146-- - 1);
      *((void *)v154-- - 1) = v156;
    }
    *(void *)a3 = v154;
    *((void *)a3 + 1) = v147;
    *((void *)a3 + 2) = v155;
    if (v148) {
      operator delete(v148);
    }
  }
  else
  {
    *double v146 = v144;
    uint64_t v147 = v146 + 1;
  }
  *((void *)a3 + 1) = v147;
  double v157 = (double)[v517 _crIsSentencePunctuatedIncludingWhitespace:1];
  v159 = (double *)*((void *)a3 + 1);
  unint64_t v158 = *((void *)a3 + 2);
  if ((unint64_t)v159 >= v158)
  {
    double v161 = *(double **)a3;
    uint64_t v162 = ((uint64_t)v159 - *(void *)a3) >> 3;
    unint64_t v163 = v162 + 1;
    if ((unint64_t)(v162 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v164 = v158 - (void)v161;
    if (v164 >> 2 > v163) {
      unint64_t v163 = v164 >> 2;
    }
    if ((unint64_t)v164 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v165 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v165 = v163;
    }
    if (v165)
    {
      uint64_t v166 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v165);
      double v161 = *(double **)a3;
      v159 = (double *)*((void *)a3 + 1);
    }
    else
    {
      uint64_t v166 = 0;
    }
    unint64_t v167 = (double *)&v166[8 * v162];
    uint64_t v168 = &v166[8 * v165];
    double *v167 = v157;
    uint64_t v160 = v167 + 1;
    while (v159 != v161)
    {
      uint64_t v169 = *((void *)v159-- - 1);
      *((void *)v167-- - 1) = v169;
    }
    *(void *)a3 = v167;
    *((void *)a3 + 1) = v160;
    *((void *)a3 + 2) = v168;
    if (v161) {
      operator delete(v161);
    }
  }
  else
  {
    double *v159 = v157;
    uint64_t v160 = v159 + 1;
  }
  *((void *)a3 + 1) = v160;
  unint64_t v170 = [v13 objectForKeyedSubscript:@"useWordTokens"];
  uint64_t v171 = [v170 BOOLValue];

  v172 = [v13 objectForKeyedSubscript:@"excludeWhitespace"];
  uint64_t v173 = [v172 BOOLValue];

  v515 = [v13 objectForKeyedSubscript:@"features"];
  v519 = [(id)objc_opt_class() _tokenizeString:v12 usingWordUnits:v171 excludeWhitespace:v173];
  id v174 = [(id)objc_opt_class() _tokenizeString:v517 usingWordUnits:v171 excludeWhitespace:v173];
  v513 = v174;
  if ([v519 count])
  {
    v521 = [v519 lastObject];
  }
  else
  {
    v521 = &stru_1F38EED68;
  }
  if ([v174 count])
  {
    v520 = [v174 firstObject];

    if (!v171) {
      goto LABEL_361;
    }
  }
  else
  {
    v520 = &stru_1F38EED68;
    if (!v171) {
      goto LABEL_361;
    }
  }
  unsigned int v175 = [v12 _crStartsWithUppercase];
  unsigned int v176 = [v517 _crStartsWithUppercase];
  double v177 = (double)v175;
  unint64_t v179 = (double *)*((void *)a3 + 1);
  unint64_t v178 = (char *)*((void *)a3 + 2);
  if (v179 >= (double *)v178)
  {
    v181 = *(double **)a3;
    uint64_t v182 = ((uint64_t)v179 - *(void *)a3) >> 3;
    unint64_t v183 = v182 + 1;
    if ((unint64_t)(v182 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v184 = v178 - (char *)v181;
    if (v184 >> 2 > v183) {
      unint64_t v183 = v184 >> 2;
    }
    if ((unint64_t)v184 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v185 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v185 = v183;
    }
    if (v185)
    {
      double v186 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v185);
      v181 = *(double **)a3;
      unint64_t v179 = (double *)*((void *)a3 + 1);
    }
    else
    {
      double v186 = 0;
    }
    v187 = (double *)&v186[8 * v182];
    unint64_t v178 = &v186[8 * v185];
    double *v187 = v177;
    v180 = v187 + 1;
    while (v179 != v181)
    {
      uint64_t v188 = *((void *)v179-- - 1);
      *((void *)v187-- - 1) = v188;
    }
    *(void *)a3 = v187;
    *((void *)a3 + 1) = v180;
    *((void *)a3 + 2) = v178;
    if (v181)
    {
      operator delete(v181);
      unint64_t v178 = *v523;
    }
  }
  else
  {
    *unint64_t v179 = v177;
    v180 = v179 + 1;
  }
  *((void *)a3 + 1) = v180;
  double v189 = (double)v176;
  if (v180 >= (double *)v178)
  {
    v191 = *(double **)a3;
    uint64_t v192 = ((uint64_t)v180 - *(void *)a3) >> 3;
    unint64_t v193 = v192 + 1;
    if ((unint64_t)(v192 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v194 = v178 - (char *)v191;
    if (v194 >> 2 > v193) {
      unint64_t v193 = v194 >> 2;
    }
    if ((unint64_t)v194 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v195 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v195 = v193;
    }
    if (v195)
    {
      v196 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v195);
      v191 = *(double **)a3;
      v180 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v196 = 0;
    }
    uint64_t v197 = (double *)&v196[8 * v192];
    unint64_t v178 = &v196[8 * v195];
    *uint64_t v197 = v189;
    unint64_t v190 = v197 + 1;
    while (v180 != v191)
    {
      uint64_t v198 = *((void *)v180-- - 1);
      *((void *)v197-- - 1) = v198;
    }
    *(void *)a3 = v197;
    *((void *)a3 + 1) = v190;
    *((void *)a3 + 2) = v178;
    if (v191)
    {
      operator delete(v191);
      unint64_t v178 = *v523;
    }
  }
  else
  {
    double *v180 = v189;
    unint64_t v190 = v180 + 1;
  }
  *((void *)a3 + 1) = v190;
  double v199 = (double)(v175 & v176);
  if (v190 >= (double *)v178)
  {
    v201 = *(double **)a3;
    uint64_t v202 = ((uint64_t)v190 - *(void *)a3) >> 3;
    unint64_t v203 = v202 + 1;
    if ((unint64_t)(v202 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v204 = v178 - (char *)v201;
    if (v204 >> 2 > v203) {
      unint64_t v203 = v204 >> 2;
    }
    if ((unint64_t)v204 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v205 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v205 = v203;
    }
    if (v205)
    {
      v206 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v205);
      v201 = *(double **)a3;
      unint64_t v190 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v206 = 0;
    }
    uint64_t v207 = (double *)&v206[8 * v202];
    unint64_t v208 = &v206[8 * v205];
    *uint64_t v207 = v199;
    v200 = v207 + 1;
    while (v190 != v201)
    {
      uint64_t v209 = *((void *)v190-- - 1);
      *((void *)v207-- - 1) = v209;
    }
    *(void *)a3 = v207;
    *((void *)a3 + 1) = v200;
    *((void *)a3 + 2) = v208;
    if (v201) {
      operator delete(v201);
    }
  }
  else
  {
    *unint64_t v190 = v199;
    v200 = v190 + 1;
  }
  *((void *)a3 + 1) = v200;
  v210 = [MEMORY[0x1E4F28B88] letterCharacterSet];
  double v211 = (double)[v516 _crStartsWithCharacterInSet:v210];
  uint64_t v213 = (double *)*((void *)a3 + 1);
  unint64_t v212 = *((void *)a3 + 2);
  if ((unint64_t)v213 >= v212)
  {
    double v215 = *(double **)a3;
    uint64_t v216 = ((uint64_t)v213 - *(void *)a3) >> 3;
    unint64_t v217 = v216 + 1;
    if ((unint64_t)(v216 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v218 = v212 - (void)v215;
    if (v218 >> 2 > v217) {
      unint64_t v217 = v218 >> 2;
    }
    if ((unint64_t)v218 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v219 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v219 = v217;
    }
    if (v219)
    {
      v220 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v219);
      double v215 = *(double **)a3;
      uint64_t v213 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v220 = 0;
    }
    uint64_t v221 = (double *)&v220[8 * v216];
    unint64_t v222 = &v220[8 * v219];
    *uint64_t v221 = v211;
    double v214 = v221 + 1;
    while (v213 != v215)
    {
      uint64_t v223 = *((void *)v213-- - 1);
      *((void *)v221-- - 1) = v223;
    }
    *(void *)a3 = v221;
    *((void *)a3 + 1) = v214;
    *((void *)a3 + 2) = v222;
    if (v215) {
      operator delete(v215);
    }
  }
  else
  {
    *uint64_t v213 = v211;
    double v214 = v213 + 1;
  }
  *((void *)a3 + 1) = v214;

  unint64_t v224 = [MEMORY[0x1E4F28B88] letterCharacterSet];
  double v225 = (double)[v517 _crStartsWithCharacterInSet:v224];
  v227 = (double *)*((void *)a3 + 1);
  unint64_t v226 = *((void *)a3 + 2);
  if ((unint64_t)v227 >= v226)
  {
    float v229 = *(double **)a3;
    uint64_t v230 = ((uint64_t)v227 - *(void *)a3) >> 3;
    unint64_t v231 = v230 + 1;
    if ((unint64_t)(v230 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v232 = v226 - (void)v229;
    if (v232 >> 2 > v231) {
      unint64_t v231 = v232 >> 2;
    }
    if ((unint64_t)v232 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v233 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v233 = v231;
    }
    if (v233)
    {
      v234 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v233);
      float v229 = *(double **)a3;
      v227 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v234 = 0;
    }
    v235 = (double *)&v234[8 * v230];
    v236 = &v234[8 * v233];
    double *v235 = v225;
    uint64_t v228 = v235 + 1;
    while (v227 != v229)
    {
      uint64_t v237 = *((void *)v227-- - 1);
      *((void *)v235-- - 1) = v237;
    }
    *(void *)a3 = v235;
    *((void *)a3 + 1) = v228;
    *((void *)a3 + 2) = v236;
    if (v229) {
      operator delete(v229);
    }
  }
  else
  {
    double *v227 = v225;
    uint64_t v228 = v227 + 1;
  }
  *((void *)a3 + 1) = v228;

  unsigned int v238 = [(__CFString *)v521 _crStartsWithUppercase];
  int v239 = [(__CFString *)v520 _crStartsWithUppercase];
  double v240 = (double)v238;
  v242 = (double *)*((void *)a3 + 1);
  v241 = (char *)*((void *)a3 + 2);
  if (v242 >= (double *)v241)
  {
    uint64_t v244 = *(double **)a3;
    uint64_t v245 = ((uint64_t)v242 - *(void *)a3) >> 3;
    unint64_t v246 = v245 + 1;
    if ((unint64_t)(v245 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v247 = v241 - (char *)v244;
    if (v247 >> 2 > v246) {
      unint64_t v246 = v247 >> 2;
    }
    if ((unint64_t)v247 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v248 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v248 = v246;
    }
    if (v248)
    {
      v249 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v248);
      uint64_t v244 = *(double **)a3;
      v242 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v249 = 0;
    }
    v250 = (double *)&v249[8 * v245];
    v241 = &v249[8 * v248];
    double *v250 = v240;
    v243 = v250 + 1;
    while (v242 != v244)
    {
      uint64_t v251 = *((void *)v242-- - 1);
      *((void *)v250-- - 1) = v251;
    }
    *(void *)a3 = v250;
    *((void *)a3 + 1) = v243;
    *((void *)a3 + 2) = v241;
    if (v244)
    {
      operator delete(v244);
      v241 = *v523;
    }
  }
  else
  {
    double *v242 = v240;
    v243 = v242 + 1;
  }
  *((void *)a3 + 1) = v243;
  double v252 = (double)(v238 & (v239 ^ 1));
  if (v243 >= (double *)v241)
  {
    uint64_t v254 = *(double **)a3;
    uint64_t v255 = ((uint64_t)v243 - *(void *)a3) >> 3;
    unint64_t v256 = v255 + 1;
    if ((unint64_t)(v255 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v257 = v241 - (char *)v254;
    if (v257 >> 2 > v256) {
      unint64_t v256 = v257 >> 2;
    }
    if ((unint64_t)v257 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v258 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v258 = v256;
    }
    if (v258)
    {
      uint64_t v259 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v258);
      uint64_t v254 = *(double **)a3;
      v243 = (double *)*((void *)a3 + 1);
    }
    else
    {
      uint64_t v259 = 0;
    }
    float v260 = (double *)&v259[8 * v255];
    v241 = &v259[8 * v258];
    *float v260 = v252;
    unint64_t v253 = v260 + 1;
    while (v243 != v254)
    {
      uint64_t v261 = *((void *)v243-- - 1);
      *((void *)v260-- - 1) = v261;
    }
    *(void *)a3 = v260;
    *((void *)a3 + 1) = v253;
    *((void *)a3 + 2) = v241;
    if (v254)
    {
      operator delete(v254);
      v241 = *v523;
    }
  }
  else
  {
    double *v243 = v252;
    unint64_t v253 = v243 + 1;
  }
  *((void *)a3 + 1) = v253;
  double v262 = (double)(v238 & v239);
  if (v253 >= (double *)v241)
  {
    v264 = *(double **)a3;
    uint64_t v265 = ((uint64_t)v253 - *(void *)a3) >> 3;
    unint64_t v266 = v265 + 1;
    if ((unint64_t)(v265 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v267 = v241 - (char *)v264;
    if (v267 >> 2 > v266) {
      unint64_t v266 = v267 >> 2;
    }
    if ((unint64_t)v267 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v268 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v268 = v266;
    }
    if (v268)
    {
      uint64_t v269 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v268);
      v264 = *(double **)a3;
      unint64_t v253 = (double *)*((void *)a3 + 1);
    }
    else
    {
      uint64_t v269 = 0;
    }
    unint64_t v270 = (double *)&v269[8 * v265];
    v271 = &v269[8 * v268];
    *unint64_t v270 = v262;
    unint64_t v263 = v270 + 1;
    while (v253 != v264)
    {
      uint64_t v272 = *((void *)v253-- - 1);
      *((void *)v270-- - 1) = v272;
    }
    *(void *)a3 = v270;
    *((void *)a3 + 1) = v263;
    *((void *)a3 + 2) = v271;
    if (v264) {
      operator delete(v264);
    }
  }
  else
  {
    *unint64_t v253 = v262;
    unint64_t v263 = v253 + 1;
  }
  id v13 = v514;
  *((void *)a3 + 1) = v263;
  double v273 = (double)[(__CFString *)v521 _crIsAllCaps];
  float v275 = (double *)*((void *)a3 + 1);
  unint64_t v274 = *((void *)a3 + 2);
  if ((unint64_t)v275 >= v274)
  {
    long double v277 = *(double **)a3;
    uint64_t v278 = ((uint64_t)v275 - *(void *)a3) >> 3;
    unint64_t v279 = v278 + 1;
    if ((unint64_t)(v278 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v280 = v274 - (void)v277;
    if (v280 >> 2 > v279) {
      unint64_t v279 = v280 >> 2;
    }
    if ((unint64_t)v280 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v281 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v281 = v279;
    }
    if (v281)
    {
      v282 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v281);
      long double v277 = *(double **)a3;
      float v275 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v282 = 0;
    }
    uint64_t v283 = (double *)&v282[8 * v278];
    unint64_t v284 = &v282[8 * v281];
    *uint64_t v283 = v273;
    double v276 = v283 + 1;
    while (v275 != v277)
    {
      uint64_t v285 = *((void *)v275-- - 1);
      *((void *)v283-- - 1) = v285;
    }
    *(void *)a3 = v283;
    *((void *)a3 + 1) = v276;
    *((void *)a3 + 2) = v284;
    if (v277) {
      operator delete(v277);
    }
  }
  else
  {
    *float v275 = v273;
    double v276 = v275 + 1;
  }
  *((void *)a3 + 1) = v276;
  double v286 = (double)[(__CFString *)v520 _crIsAllCaps];
  v288 = (double *)*((void *)a3 + 1);
  unint64_t v287 = *((void *)a3 + 2);
  if ((unint64_t)v288 >= v287)
  {
    uint64_t v290 = *(double **)a3;
    uint64_t v291 = ((uint64_t)v288 - *(void *)a3) >> 3;
    unint64_t v292 = v291 + 1;
    if ((unint64_t)(v291 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v293 = v287 - (void)v290;
    if (v293 >> 2 > v292) {
      unint64_t v292 = v293 >> 2;
    }
    if ((unint64_t)v293 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v294 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v294 = v292;
    }
    if (v294)
    {
      v295 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v294);
      uint64_t v290 = *(double **)a3;
      v288 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v295 = 0;
    }
    double v296 = (double *)&v295[8 * v291];
    v297 = &v295[8 * v294];
    *double v296 = v286;
    v289 = v296 + 1;
    while (v288 != v290)
    {
      uint64_t v298 = *((void *)v288-- - 1);
      *((void *)v296-- - 1) = v298;
    }
    *(void *)a3 = v296;
    *((void *)a3 + 1) = v289;
    *((void *)a3 + 2) = v297;
    if (v290) {
      operator delete(v290);
    }
  }
  else
  {
    double *v288 = v286;
    v289 = v288 + 1;
  }
  *((void *)a3 + 1) = v289;
LABEL_361:
  unint64_t v299 = [v519 count];
  unint64_t v300 = [v174 count];
  double v301 = (double)v299 / 20.0;
  unint64_t v302 = (double *)*((void *)a3 + 1);
  v303 = (char *)*((void *)a3 + 2);
  if (v302 >= (double *)v303)
  {
    v305 = *(double **)a3;
    uint64_t v306 = ((uint64_t)v302 - *(void *)a3) >> 3;
    unint64_t v307 = v306 + 1;
    if ((unint64_t)(v306 + 1) >> 61) {
      goto LABEL_694;
    }
    if ((v303 - (char *)v305) >> 2 > v307) {
      unint64_t v307 = (v303 - (char *)v305) >> 2;
    }
    if ((unint64_t)(v303 - (char *)v305) >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v308 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v308 = v307;
    }
    if (v308)
    {
      double v309 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v308);
      v305 = *(double **)a3;
      unint64_t v302 = (double *)*((void *)a3 + 1);
    }
    else
    {
      double v309 = 0;
    }
    id v310 = (double *)&v309[8 * v306];
    v303 = &v309[8 * v308];
    *id v310 = v301;
    v304 = v310 + 1;
    while (v302 != v305)
    {
      uint64_t v311 = *((void *)v302-- - 1);
      *((void *)v310-- - 1) = v311;
    }
    *(void *)a3 = v310;
    *((void *)a3 + 1) = v304;
    *((void *)a3 + 2) = v303;
    if (v305)
    {
      operator delete(v305);
      v303 = *v523;
    }
  }
  else
  {
    *unint64_t v302 = v301;
    v304 = v302 + 1;
  }
  double v312 = (double)v300 / 20.0;
  *((void *)a3 + 1) = v304;
  if (v304 < (double *)v303)
  {
    double *v304 = v312;
    v313 = v304 + 1;
    goto LABEL_393;
  }
  v314 = *(double **)a3;
  uint64_t v315 = ((uint64_t)v304 - *(void *)a3) >> 3;
  unint64_t v316 = v315 + 1;
  if ((unint64_t)(v315 + 1) >> 61) {
LABEL_694:
  }
    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
  if ((v303 - (char *)v314) >> 2 > v316) {
    unint64_t v316 = (v303 - (char *)v314) >> 2;
  }
  if ((unint64_t)(v303 - (char *)v314) >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v317 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v317 = v316;
  }
  if (v317)
  {
    v318 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v317);
    v314 = *(double **)a3;
    v304 = (double *)*((void *)a3 + 1);
  }
  else
  {
    v318 = 0;
  }
  v319 = (double *)&v318[8 * v315];
  v303 = &v318[8 * v317];
  double *v319 = v312;
  v313 = v319 + 1;
  while (v304 != v314)
  {
    uint64_t v320 = *((void *)v304-- - 1);
    *((void *)v319-- - 1) = v320;
  }
  *(void *)a3 = v319;
  *((void *)a3 + 1) = v313;
  *((void *)a3 + 2) = v303;
  if (v314)
  {
    operator delete(v314);
    v303 = *v523;
  }
LABEL_393:
  *((void *)a3 + 1) = v313;
  double v321 = v301 + v312;
  if (v313 >= (double *)v303)
  {
    v323 = *(double **)a3;
    uint64_t v324 = ((uint64_t)v313 - *(void *)a3) >> 3;
    unint64_t v325 = v324 + 1;
    if ((unint64_t)(v324 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    if ((v303 - (char *)v323) >> 2 > v325) {
      unint64_t v325 = (v303 - (char *)v323) >> 2;
    }
    if ((unint64_t)(v303 - (char *)v323) >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v326 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v326 = v325;
    }
    if (v326)
    {
      v327 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v326);
      v323 = *(double **)a3;
      v313 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v327 = 0;
    }
    v328 = (double *)&v327[8 * v324];
    v303 = &v327[8 * v326];
    double *v328 = v321;
    v322 = v328 + 1;
    while (v313 != v323)
    {
      uint64_t v329 = *((void *)v313-- - 1);
      *((void *)v328-- - 1) = v329;
    }
    *(void *)a3 = v328;
    *((void *)a3 + 1) = v322;
    *((void *)a3 + 2) = v303;
    if (v323)
    {
      operator delete(v323);
      v303 = *v523;
    }
  }
  else
  {
    double *v313 = v321;
    v322 = v313 + 1;
  }
  *((void *)a3 + 1) = v322;
  double v330 = v312 - v301;
  if (v322 >= (double *)v303)
  {
    v332 = *(double **)a3;
    uint64_t v333 = ((uint64_t)v322 - *(void *)a3) >> 3;
    unint64_t v334 = v333 + 1;
    if ((unint64_t)(v333 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    if ((v303 - (char *)v332) >> 2 > v334) {
      unint64_t v334 = (v303 - (char *)v332) >> 2;
    }
    if ((unint64_t)(v303 - (char *)v332) >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v335 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v335 = v334;
    }
    if (v335)
    {
      v336 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v335);
      v332 = *(double **)a3;
      v322 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v336 = 0;
    }
    v337 = (double *)&v336[8 * v333];
    v303 = &v336[8 * v335];
    double *v337 = v330;
    v331 = v337 + 1;
    while (v322 != v332)
    {
      uint64_t v338 = *((void *)v322-- - 1);
      *((void *)v337-- - 1) = v338;
    }
    *(void *)a3 = v337;
    *((void *)a3 + 1) = v331;
    *((void *)a3 + 2) = v303;
    if (v332)
    {
      operator delete(v332);
      v303 = *v523;
    }
  }
  else
  {
    double *v322 = v330;
    v331 = v322 + 1;
  }
  *((void *)a3 + 1) = v331;
  double v339 = v301 / v312;
  if (v312 <= 2.22044605e-16) {
    double v339 = 0.0;
  }
  double v340 = 1.0 / (exp(-v339) + 1.0);
  if (v331 >= (double *)v303)
  {
    v342 = *(double **)a3;
    uint64_t v343 = ((uint64_t)v331 - *(void *)a3) >> 3;
    unint64_t v344 = v343 + 1;
    if ((unint64_t)(v343 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    if ((v303 - (char *)v342) >> 2 > v344) {
      unint64_t v344 = (v303 - (char *)v342) >> 2;
    }
    if ((unint64_t)(v303 - (char *)v342) >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v345 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v345 = v344;
    }
    if (v345)
    {
      v346 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v345);
      v342 = *(double **)a3;
      v331 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v346 = 0;
    }
    v347 = (double *)&v346[8 * v343];
    v303 = &v346[8 * v345];
    double *v347 = v340;
    v341 = v347 + 1;
    while (v331 != v342)
    {
      uint64_t v348 = *((void *)v331-- - 1);
      *((void *)v347-- - 1) = v348;
    }
    *(void *)a3 = v347;
    *((void *)a3 + 1) = v341;
    *((void *)a3 + 2) = v303;
    if (v342)
    {
      operator delete(v342);
      v303 = *v523;
    }
  }
  else
  {
    double *v331 = v340;
    v341 = v331 + 1;
  }
  *((void *)a3 + 1) = v341;
  double v349 = v312 / v301;
  if (v301 <= 2.22044605e-16) {
    double v349 = 0.0;
  }
  double v350 = 1.0 / (exp(-v349) + 1.0);
  if (v341 >= (double *)v303)
  {
    v352 = *(double **)a3;
    uint64_t v353 = ((uint64_t)v341 - *(void *)a3) >> 3;
    unint64_t v354 = v353 + 1;
    if ((unint64_t)(v353 + 1) >> 61) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    if ((v303 - (char *)v352) >> 2 > v354) {
      unint64_t v354 = (v303 - (char *)v352) >> 2;
    }
    if ((unint64_t)(v303 - (char *)v352) >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v355 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v355 = v354;
    }
    if (v355)
    {
      v356 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v355);
      v352 = *(double **)a3;
      v341 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v356 = 0;
    }
    v357 = (double *)&v356[8 * v353];
    v358 = &v356[8 * v355];
    double *v357 = v350;
    v351 = v357 + 1;
    while (v341 != v352)
    {
      uint64_t v359 = *((void *)v341-- - 1);
      *((void *)v357-- - 1) = v359;
    }
    *(void *)a3 = v357;
    *((void *)a3 + 1) = v351;
    *((void *)a3 + 2) = v358;
    if (v352) {
      operator delete(v352);
    }
  }
  else
  {
    double *v341 = v350;
    v351 = v341 + 1;
  }
  *((void *)a3 + 1) = v351;
  v518 = [v13 objectForKeyedSubscript:@"maxTokenCountForLengthFeatures"];
  for (uint64_t i = 1; i <= (int)[v518 intValue]; ++i)
  {
    if ([v519 count] == i) {
      double v361 = 1.0;
    }
    else {
      double v361 = 0.0;
    }
    v363 = (double *)*((void *)a3 + 1);
    unint64_t v362 = *((void *)a3 + 2);
    if ((unint64_t)v363 >= v362)
    {
      v365 = *(double **)a3;
      uint64_t v366 = ((uint64_t)v363 - *(void *)a3) >> 3;
      unint64_t v367 = v366 + 1;
      if ((unint64_t)(v366 + 1) >> 61) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v368 = v362 - (void)v365;
      if (v368 >> 2 > v367) {
        unint64_t v367 = v368 >> 2;
      }
      if ((unint64_t)v368 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v369 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v369 = v367;
      }
      if (v369)
      {
        v370 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v369);
        v365 = *(double **)a3;
        v363 = (double *)*((void *)a3 + 1);
      }
      else
      {
        v370 = 0;
      }
      v371 = (double *)&v370[8 * v366];
      double *v371 = v361;
      v364 = v371 + 1;
      while (v363 != v365)
      {
        uint64_t v372 = *((void *)v363-- - 1);
        *((void *)v371-- - 1) = v372;
      }
      *(void *)a3 = v371;
      *((void *)a3 + 1) = v364;
      *((void *)a3 + 2) = &v370[8 * v369];
      if (v365) {
        operator delete(v365);
      }
    }
    else
    {
      double *v363 = v361;
      v364 = v363 + 1;
    }
    *((void *)a3 + 1) = v364;
    if ([v174 count] == i) {
      double v373 = 1.0;
    }
    else {
      double v373 = 0.0;
    }
    v375 = (double *)*((void *)a3 + 1);
    unint64_t v374 = *((void *)a3 + 2);
    if ((unint64_t)v375 >= v374)
    {
      v377 = *(double **)a3;
      uint64_t v378 = ((uint64_t)v375 - *(void *)a3) >> 3;
      unint64_t v379 = v378 + 1;
      if ((unint64_t)(v378 + 1) >> 61) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v380 = v374 - (void)v377;
      if (v380 >> 2 > v379) {
        unint64_t v379 = v380 >> 2;
      }
      if ((unint64_t)v380 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v381 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v381 = v379;
      }
      if (v381)
      {
        v382 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v381);
        v377 = *(double **)a3;
        v375 = (double *)*((void *)a3 + 1);
      }
      else
      {
        v382 = 0;
      }
      v383 = (double *)&v382[8 * v378];
      double *v383 = v373;
      v376 = v383 + 1;
      while (v375 != v377)
      {
        uint64_t v384 = *((void *)v375-- - 1);
        *((void *)v383-- - 1) = v384;
      }
      *(void *)a3 = v383;
      *((void *)a3 + 1) = v376;
      *((void *)a3 + 2) = &v382[8 * v381];
      if (v377) {
        operator delete(v377);
      }
    }
    else
    {
      double *v375 = v373;
      v376 = v375 + 1;
    }
    *((void *)a3 + 1) = v376;
  }
  uint64_t v385 = [v516 length];
  uint64_t v386 = [v517 length];
  if (v385 < 1) {
    v387 = 0;
  }
  else {
    v387 = (_anonymous_namespace_ *)[v516 characterAtIndex:v385 - 1];
  }
  if (v386 < 1) {
    unsigned int c = 0;
  }
  else {
    unsigned int c = [v517 characterAtIndex:0];
  }
  id v512 = a1;
  int v390 = 0;
  int v511 = v171;
  if (v171) {
    int v391 = 6;
  }
  else {
    int v391 = 12;
  }
  v392 = (double *)*((void *)a3 + 1);
  do
  {
    if (v388 == v390) {
      double v393 = 1.0;
    }
    else {
      double v393 = 0.0;
    }
    v394 = (double *)*v523;
    if (v392 >= (double *)*v523)
    {
      v396 = *(double **)a3;
      uint64_t v397 = ((uint64_t)v392 - *(void *)a3) >> 3;
      unint64_t v398 = v397 + 1;
      if ((unint64_t)(v397 + 1) >> 61) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v399 = (char *)v394 - (char *)v396;
      if (v399 >> 2 > v398) {
        unint64_t v398 = v399 >> 2;
      }
      if ((unint64_t)v399 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v400 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v400 = v398;
      }
      if (v400)
      {
        v401 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v400);
        v396 = *(double **)a3;
        v392 = (double *)*((void *)a3 + 1);
      }
      else
      {
        v401 = 0;
      }
      v402 = (double *)&v401[8 * v397];
      double *v402 = v393;
      v395 = v402 + 1;
      while (v392 != v396)
      {
        uint64_t v403 = *((void *)v392-- - 1);
        *((void *)v402-- - 1) = v403;
      }
      v394 = (double *)&v401[8 * v400];
      *(void *)a3 = v402;
      *((void *)a3 + 1) = v395;
      *((void *)a3 + 2) = v394;
      if (v396)
      {
        operator delete(v396);
        v394 = (double *)*v523;
      }
    }
    else
    {
      double *v392 = v393;
      v395 = v392 + 1;
    }
    *((void *)a3 + 1) = v395;
    if (v389 == v390) {
      double v404 = 1.0;
    }
    else {
      double v404 = 0.0;
    }
    if (v395 >= v394)
    {
      v405 = *(double **)a3;
      uint64_t v406 = ((uint64_t)v395 - *(void *)a3) >> 3;
      unint64_t v407 = v406 + 1;
      if ((unint64_t)(v406 + 1) >> 61) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v408 = (char *)v394 - (char *)v405;
      if (v408 >> 2 > v407) {
        unint64_t v407 = v408 >> 2;
      }
      if ((unint64_t)v408 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v409 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v409 = v407;
      }
      if (v409)
      {
        v410 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v409);
        v405 = *(double **)a3;
        v395 = (double *)*((void *)a3 + 1);
      }
      else
      {
        v410 = 0;
      }
      v411 = (double *)&v410[8 * v406];
      double *v411 = v404;
      v392 = v411 + 1;
      while (v395 != v405)
      {
        uint64_t v412 = *((void *)v395-- - 1);
        *((void *)v411-- - 1) = v412;
      }
      *(void *)a3 = v411;
      *((void *)a3 + 1) = v392;
      *((void *)a3 + 2) = &v410[8 * v409];
      if (v405) {
        operator delete(v405);
      }
    }
    else
    {
      double *v395 = v404;
      v392 = v395 + 1;
    }
    *((void *)a3 + 1) = v392;
    ++v390;
  }
  while (v390 != v391);
  for (int j = 0; j != v391; ++j)
  {
    for (int k = 0; k != v391; ++k)
    {
      BOOL v416 = v388 == j && v389 == k;
      double v417 = (double)v416;
      if (v392 >= (double *)*v523)
      {
        v418 = *(double **)a3;
        uint64_t v419 = ((uint64_t)v392 - *(void *)a3) >> 3;
        unint64_t v420 = v419 + 1;
        if ((unint64_t)(v419 + 1) >> 61) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v421 = *v523 - (char *)v418;
        if (v421 >> 2 > v420) {
          unint64_t v420 = v421 >> 2;
        }
        if ((unint64_t)v421 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v422 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v422 = v420;
        }
        if (v422)
        {
          v423 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v422);
          v418 = *(double **)a3;
          v392 = (double *)*((void *)a3 + 1);
        }
        else
        {
          v423 = 0;
        }
        v424 = (double *)&v423[8 * v419];
        double *v424 = v417;
        v425 = v424 + 1;
        while (v392 != v418)
        {
          uint64_t v426 = *((void *)v392-- - 1);
          *((void *)v424-- - 1) = v426;
        }
        *(void *)a3 = v424;
        *((void *)a3 + 1) = v425;
        *((void *)a3 + 2) = &v423[8 * v422];
        if (v418) {
          operator delete(v418);
        }
        v392 = v425;
      }
      else
      {
        *v392++ = v417;
      }
      *((void *)a3 + 1) = v392;
    }
  }
  long long v538 = 0u;
  long long v539 = 0u;
  long long v536 = 0u;
  long long v537 = 0u;
  v427 = [v515 objectForKeyedSubscript:@"L1C"];
  uint64_t v428 = [v427 countByEnumeratingWithState:&v536 objects:v543 count:16];
  if (v428)
  {
    uint64_t v429 = *(void *)v537;
    do
    {
      for (uint64_t m = 0; m != v428; ++m)
      {
        if (*(void *)v537 != v429) {
          objc_enumerationMutation(v427);
        }
        v431 = *(void **)(*((void *)&v536 + 1) + 8 * m);
        int v432 = u_isdigit((UChar32)v387);
        int v433 = [v431 characterAtIndex:0];
        if (v432) {
          int v434 = 49;
        }
        else {
          int v434 = (int)v387;
        }
        if (v434 == v433) {
          double v435 = 1.0;
        }
        else {
          double v435 = 0.0;
        }
        v437 = (double *)*((void *)a3 + 1);
        unint64_t v436 = *((void *)a3 + 2);
        if ((unint64_t)v437 >= v436)
        {
          v439 = *(double **)a3;
          uint64_t v440 = ((uint64_t)v437 - *(void *)a3) >> 3;
          unint64_t v441 = v440 + 1;
          if ((unint64_t)(v440 + 1) >> 61) {
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v442 = v436 - (void)v439;
          if (v442 >> 2 > v441) {
            unint64_t v441 = v442 >> 2;
          }
          if ((unint64_t)v442 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v443 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v443 = v441;
          }
          if (v443)
          {
            v444 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v443);
            v439 = *(double **)a3;
            v437 = (double *)*((void *)a3 + 1);
          }
          else
          {
            v444 = 0;
          }
          v445 = (double *)&v444[8 * v440];
          double *v445 = v435;
          v438 = v445 + 1;
          while (v437 != v439)
          {
            uint64_t v446 = *((void *)v437-- - 1);
            *((void *)v445-- - 1) = v446;
          }
          *(void *)a3 = v445;
          *((void *)a3 + 1) = v438;
          *((void *)a3 + 2) = &v444[8 * v443];
          if (v439) {
            operator delete(v439);
          }
        }
        else
        {
          double *v437 = v435;
          v438 = v437 + 1;
        }
        *((void *)a3 + 1) = v438;
      }
      uint64_t v428 = [v427 countByEnumeratingWithState:&v536 objects:v543 count:16];
    }
    while (v428);
  }

  long long v534 = 0u;
  long long v535 = 0u;
  long long v532 = 0u;
  long long v533 = 0u;
  v447 = [v515 objectForKeyedSubscript:@"R1C"];
  uint64_t v448 = [v447 countByEnumeratingWithState:&v532 objects:v542 count:16];
  if (v448)
  {
    uint64_t v449 = *(void *)v533;
    do
    {
      for (uint64_t n = 0; n != v448; ++n)
      {
        if (*(void *)v533 != v449) {
          objc_enumerationMutation(v447);
        }
        v451 = *(void **)(*((void *)&v532 + 1) + 8 * n);
        int v452 = u_isdigit(c);
        int v453 = [v451 characterAtIndex:0];
        int v454 = c;
        if (v452) {
          int v454 = 49;
        }
        if (v454 == v453) {
          double v455 = 1.0;
        }
        else {
          double v455 = 0.0;
        }
        v457 = (double *)*((void *)a3 + 1);
        unint64_t v456 = *((void *)a3 + 2);
        if ((unint64_t)v457 >= v456)
        {
          v459 = *(double **)a3;
          uint64_t v460 = ((uint64_t)v457 - *(void *)a3) >> 3;
          unint64_t v461 = v460 + 1;
          if ((unint64_t)(v460 + 1) >> 61) {
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v462 = v456 - (void)v459;
          if (v462 >> 2 > v461) {
            unint64_t v461 = v462 >> 2;
          }
          if ((unint64_t)v462 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v463 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v463 = v461;
          }
          if (v463)
          {
            v464 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v463);
            v459 = *(double **)a3;
            v457 = (double *)*((void *)a3 + 1);
          }
          else
          {
            v464 = 0;
          }
          v465 = (double *)&v464[8 * v460];
          double *v465 = v455;
          v458 = v465 + 1;
          while (v457 != v459)
          {
            uint64_t v466 = *((void *)v457-- - 1);
            *((void *)v465-- - 1) = v466;
          }
          *(void *)a3 = v465;
          *((void *)a3 + 1) = v458;
          *((void *)a3 + 2) = &v464[8 * v463];
          if (v459) {
            operator delete(v459);
          }
        }
        else
        {
          double *v457 = v455;
          v458 = v457 + 1;
        }
        *((void *)a3 + 1) = v458;
      }
      uint64_t v448 = [v447 countByEnumeratingWithState:&v532 objects:v542 count:16];
    }
    while (v448);
  }

  if (v511)
  {
    long long v530 = 0u;
    long long v531 = 0u;
    long long v528 = 0u;
    long long v529 = 0u;
    v467 = [v515 objectForKeyedSubscript:@"L1W"];
    uint64_t v468 = [v467 countByEnumeratingWithState:&v528 objects:v541 count:16];
    if (v468)
    {
      uint64_t v469 = *(void *)v529;
      do
      {
        for (iuint64_t i = 0; ii != v468; ++ii)
        {
          if (*(void *)v529 != v469) {
            objc_enumerationMutation(v467);
          }
          v471 = *(void **)(*((void *)&v528 + 1) + 8 * ii);
          v472 = [(__CFString *)v521 lowercaseString];
          double v473 = (double)[v471 isEqualToString:v472];
          v475 = (double *)*((void *)a3 + 1);
          unint64_t v474 = *((void *)a3 + 2);
          if ((unint64_t)v475 >= v474)
          {
            v477 = *(double **)a3;
            uint64_t v478 = ((uint64_t)v475 - *(void *)a3) >> 3;
            unint64_t v479 = v478 + 1;
            if ((unint64_t)(v478 + 1) >> 61) {
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v480 = v474 - (void)v477;
            if (v480 >> 2 > v479) {
              unint64_t v479 = v480 >> 2;
            }
            if ((unint64_t)v480 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v481 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v481 = v479;
            }
            if (v481)
            {
              v482 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v481);
              v477 = *(double **)a3;
              v475 = (double *)*((void *)a3 + 1);
            }
            else
            {
              v482 = 0;
            }
            v483 = (double *)&v482[8 * v478];
            double *v483 = v473;
            v476 = v483 + 1;
            while (v475 != v477)
            {
              uint64_t v484 = *((void *)v475-- - 1);
              *((void *)v483-- - 1) = v484;
            }
            *(void *)a3 = v483;
            *((void *)a3 + 1) = v476;
            *((void *)a3 + 2) = &v482[8 * v481];
            if (v477) {
              operator delete(v477);
            }
          }
          else
          {
            double *v475 = v473;
            v476 = v475 + 1;
          }
          *((void *)a3 + 1) = v476;
        }
        uint64_t v468 = [v467 countByEnumeratingWithState:&v528 objects:v541 count:16];
      }
      while (v468);
    }

    long long v526 = 0u;
    long long v527 = 0u;
    long long v524 = 0u;
    long long v525 = 0u;
    v485 = [v515 objectForKeyedSubscript:@"R1W"];
    uint64_t v486 = [v485 countByEnumeratingWithState:&v524 objects:v540 count:16];
    if (v486)
    {
      uint64_t v487 = *(void *)v525;
      do
      {
        for (jint j = 0; jj != v486; ++jj)
        {
          if (*(void *)v525 != v487) {
            objc_enumerationMutation(v485);
          }
          v489 = *(void **)(*((void *)&v524 + 1) + 8 * jj);
          v490 = [(__CFString *)v520 lowercaseString];
          double v491 = (double)[v489 isEqualToString:v490];
          v493 = (double *)*((void *)a3 + 1);
          unint64_t v492 = *((void *)a3 + 2);
          if ((unint64_t)v493 >= v492)
          {
            v495 = *(double **)a3;
            uint64_t v496 = ((uint64_t)v493 - *(void *)a3) >> 3;
            unint64_t v497 = v496 + 1;
            if ((unint64_t)(v496 + 1) >> 61) {
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v498 = v492 - (void)v495;
            if (v498 >> 2 > v497) {
              unint64_t v497 = v498 >> 2;
            }
            if ((unint64_t)v498 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v499 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v499 = v497;
            }
            if (v499)
            {
              v500 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)v523, v499);
              v495 = *(double **)a3;
              v493 = (double *)*((void *)a3 + 1);
            }
            else
            {
              v500 = 0;
            }
            v501 = (double *)&v500[8 * v496];
            double *v501 = v491;
            v494 = v501 + 1;
            while (v493 != v495)
            {
              uint64_t v502 = *((void *)v493-- - 1);
              *((void *)v501-- - 1) = v502;
            }
            *(void *)a3 = v501;
            *((void *)a3 + 1) = v494;
            *((void *)a3 + 2) = &v500[8 * v499];
            if (v495) {
              operator delete(v495);
            }
          }
          else
          {
            double *v493 = v491;
            v494 = v493 + 1;
          }
          *((void *)a3 + 1) = v494;
        }
        uint64_t v486 = [v485 countByEnumeratingWithState:&v524 objects:v540 count:16];
      }
      while (v486);
    }

    id v503 = [v515 objectForKeyedSubscript:@"LnW"];

    v504 = [v515 objectForKeyedSubscript:@"RnW"];
  }
  else
  {
    id v503 = [v515 objectForKeyedSubscript:@"LnC"];

    v504 = [v515 objectForKeyedSubscript:@"RnC"];
  }
  id v505 = v504;

  v506 = [v514 objectForKeyedSubscript:@"leftBagOfTokensContextSize"];
  v507 = [v514 objectForKeyedSubscript:@"rightBagOfTokensContextSize"];
  uint64_t v508 = [v519 count];
  int v509 = [v506 intValue];
  int v510 = [v507 intValue];
  objc_msgSend(v512, "_extractBagOfTokensFeaturesTo:vocabulary:tokens:beginIndex:endIndex:", a3, v503, v519, v508 - v509, objc_msgSend(v519, "count"));
  [v512 _extractBagOfTokensFeaturesTo:a3 vocabulary:v505 tokens:v513 beginIndex:0 endIndex:v510];
}

+ (vector<double,)extractFeatureVectorForLocale:(id)a2 string1:(SEL)a3 string2:(id)a4 evaluation:(id)a5 imageSize:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  std::vector<double>::reserve((void **)&retstr->__begin_, 0x12CuLL);
  uint64_t v17 = +[CRLineWrappingClassifier modelLocaleForLocale:v13];
  double v18 = lineWrappingConfig();
  uint64_t v19 = [v18 objectForKey:v17];
  unint64_t v20 = [v19 objectForKey:@"classifier"];

  if (v20)
  {
    BOOL v21 = +[CRImageReader languageIsChinese:v13]
       || +[CRImageReader languageIsJapanese:v13]
       || +[CRImageReader languageIsKorean:v13];
    [a2 _extractLanguageModelFeaturesTo:retstr evaluation:v16];
    [a2 _extractGeometricFeaturesTo:retstr evaluation:v16];
    [a2 _extractEvaluatedFeaturesTo:retstr evaluation:v16];
    [a2 _extractLexicalFeaturesTo:retstr string1:v14 string2:v15 configuration:v20 forCJK:v21];
  }
  else
  {
    unint64_t v22 = CROSLogForCategory(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      int v24 = 138412290;
      id v25 = v13;
      _os_log_impl(&dword_1DD733000, v22, OS_LOG_TYPE_FAULT, "Failed to load classifier config for locale %@", (uint8_t *)&v24, 0xCu);
    }
  }
  return result;
}

+ (id)nsArrayFromVector:(const void *)a3
{
  v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:(uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3];
  double v5 = *(double **)a3;
  unint64_t v6 = (double *)*((void *)a3 + 1);
  if (*(double **)a3 != v6)
  {
    do
    {
      BOOL v7 = [NSNumber numberWithDouble:*v5];
      [v4 addObject:v7];

      ++v5;
    }
    while (v5 != v6);
  }
  return v4;
}

+ (id)multiArrayFromVector:(const void *)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F1E9A8]);
  v10[0] = &unk_1F39330E8;
  double v5 = [NSNumber numberWithUnsignedLong:(uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3];
  v10[1] = v5;
  unint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  BOOL v7 = (void *)[v4 initWithShape:v6 dataType:65600 error:0];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__CRWrappingClassifierFeatureExtractor_multiArrayFromVector___block_invoke;
  v9[3] = &__block_descriptor_40_e24_v32__0_v8q16__NSArray_24l;
  v9[4] = a3;
  [v7 getMutableBytesWithHandler:v9];
  return v7;
}

void *__61__CRWrappingClassifierFeatureExtractor_multiArrayFromVector___block_invoke(void *result, void *__dst)
{
  uint64_t v2 = result[4];
  v3 = *(unsigned char **)v2;
  id v4 = *(unsigned char **)(v2 + 8);
  if (v4 != v3) {
    return memmove(__dst, v3, v4 - v3);
  }
  return result;
}

+ (id)extractFeaturesForLocale:(id)a3 textFeature:(id)a4 lastFeature:(id)a5 imageSize:(CGSize)a6 revision:(unint64_t)a7
{
  double height = a6.height;
  double width = a6.width;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = [CRLineWrappingParameters alloc];
  id v16 = [v13 locale];
  uint64_t v17 = [v16 languageIdentifier];
  double v18 = [(CRLineWrappingParameters *)v15 initWithLocale:v17];

  uint64_t v19 = [CRLineWrappingContext alloc];
  unint64_t v20 = [v14 locale];
  BOOL v21 = [v20 languageIdentifier];
  unint64_t v22 = [(CRLineWrappingContext *)v19 initWithLocale:v21];

  uint64_t v23 = -[CRWrappingEvaluationResult initWithTextFeature:context:imageSize:parameters:]([CRWrappingEvaluationResult alloc], "initWithTextFeature:context:imageSize:parameters:", v14, v22, v18, width, height);
  [(CRLineWrappingContext *)v22 startWithResult:v23 contextSize:[(CRLineWrappingParameters *)v18 lmContextSize]];
  int v24 = -[CRWrappingEvaluationResult initWithTextFeature:context:imageSize:parameters:]([CRWrappingEvaluationResult alloc], "initWithTextFeature:context:imageSize:parameters:", v13, v22, v18, width, height);
  id v25 = [v14 text];
  uint64_t v26 = [v13 text];
  objc_msgSend(a1, "extractFeatureVectorForLocale:string1:string2:evaluation:imageSize:", v12, v25, v26, v24, width, height);

  double v27 = [a1 nsArrayFromVector:__p];
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v27;
}

+ (id)extractFeatureMultiArrayForLocale:(id)a3 textFeature:(id)a4 lastFeature:(id)a5 evaluation:(id)a6 imageSize:(CGSize)a7
{
  double height = a7.height;
  double width = a7.width;
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = [a5 text];
  uint64_t v17 = [v14 text];
  objc_msgSend(a1, "extractFeatureVectorForLocale:string1:string2:evaluation:imageSize:", v13, v16, v17, v15, width, height);

  double v18 = v22;
  if (v22 != __p)
  {
    uint64_t v19 = [a1 multiArrayFromVector:&__p];
    double v18 = __p;
    if (!__p) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v19 = 0;
  if (v22)
  {
LABEL_3:
    unint64_t v22 = v18;
    operator delete(v18);
  }
LABEL_4:

  return v19;
}

@end