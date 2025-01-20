@interface CRTextDecodingUtils
+ (BOOL)validateProbability:(id)a3 precisionThreshold:(double)a4 withLM:(BOOL)a5;
+ (id)adjustedBeamSearchDecodedString:(id)a3 greedyDecodedString:(id)a4 decodingLocale:(id)a5;
+ (id)characterRangesForTokens:(id)a3 fromActivation:(id)a4 usingCharacterTokens:(BOOL)a5;
+ (id)filteredTokensFromTokens:(id)a3 falsePositiveFiltering:(BOOL)a4 keepWhitespaceToken:(BOOL)a5;
+ (id)getTokenPermutationByApplyingReorderingPermutation:(id)a3 toRanges:(id)a4;
+ (id)graphemeClusterTokensFromTokens:(id)a3;
+ (id)halfWidthToFullWidthNormalizationForTextString:(id)a3;
+ (id)invertedPermutation:(id)a3;
+ (id)reversedPermutation:(id)a3 numTimeSteps:(unint64_t)a4;
+ (id)reversedTokens:(id)a3 numTimeSteps:(unint64_t)a4;
+ (id)tokenDelimiterRangesForTokens:(id)a3 usingCharacterTokens:(BOOL)a4;
+ (id)tokenSequenceStringForTokens:(id)a3 usingCharacterTokens:(BOOL)a4;
+ (id)wordTokensFromCharacterTokens:(id)a3;
+ (unint64_t)getTokenPermutationByApplyingReorderingPermutation:(uint64_t *)a3 toRanges:(uint64_t)a4;
+ (void)getBoundariesForRanges:(void *)a3 topPoints:(void *)a4 bottomPoints:(void *)a5 imageSize:(void *)a6 scale:(int)a7 featureImageSize:(int)a8 rect:(double)a9 rotatedRoi:(double)a10 radians:(float)a11 model:(double)a12 configuration:(double)a13 paddingLeft:(double)a14 paddingRight:(double)a15 rangeOffset:(double)a16;
+ (void)getCharacterBoundariesForActivationRanges:(float)a3 topPoints:(double)a4 bottomPoints:(double)a5 imageSize:(double)a6 scale:(uint64_t)a7 featureImageSize:(uint64_t)a8 rect:(void *)a9 rotatedRoi:(void *)a10 radians:(void *)a11 model:(void *)a12 configuration:(void *)a13 paddingLeft:(int)a14 paddingRight:(double)a15 rangeOffset:(double)a16;
+ (void)getWordBoundariesForWhiteSpaceRanges:(float)a3 topPoints:(double)a4 bottomPoints:(double)a5 imageSize:(double)a6 scale:(uint64_t)a7 featureImageSize:(uint64_t)a8 rect:(void *)a9 rotatedRoi:(void *)a10 radians:(void *)a11 model:(void *)a12 configuration:(void *)a13 paddingLeft:(int)a14 paddingRight:(double)a15 rangeOffset:(double)a16;
@end

@implementation CRTextDecodingUtils

+ (id)adjustedBeamSearchDecodedString:(id)a3 greedyDecodedString:(id)a4 decodingLocale:(id)a5
{
  uint64_t v6 = sub_1DD8A7480();
  unint64_t v8 = v7;
  uint64_t v9 = sub_1DD8A7480();
  unint64_t v11 = v10;
  if (a5)
  {
    uint64_t v12 = sub_1DD8A7480();
    a5 = v13;
  }
  else
  {
    uint64_t v12 = 0;
  }
  swift_getObjCClassMetadata();
  sub_1DD738778(v6, v8, v9, v11, v12, a5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14 = (void *)sub_1DD8A7470();
  swift_bridgeObjectRelease();
  return v14;
}

+ (id)halfWidthToFullWidthNormalizationForTextString:(id)a3
{
  id v3 = a3;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__7;
  v32 = __Block_byref_object_dispose__7;
  id v33 = 0;
  v4 = customHalfWidthToFullWidthMapping();
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__7;
  v26 = __Block_byref_object_dispose__7;
  id v27 = 0;
  if ((unint64_t)[v3 length] >= 3)
  {
    uint64_t v5 = customRegexToIgnoreHalfWidthToFullWidthMapping();
    uint64_t v6 = (void *)v23[5];
    v23[5] = v5;
  }
  uint64_t v7 = [v3 length];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __70__CRTextDecodingUtils_halfWidthToFullWidthNormalizationForTextString___block_invoke;
  v17 = &unk_1E6CDB588;
  id v8 = v4;
  id v18 = v8;
  v20 = &v22;
  id v9 = v3;
  id v19 = v9;
  v21 = &v28;
  objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 2, &v14);
  unint64_t v10 = (void *)v29[5];
  if (v10) {
    id v11 = (id)objc_msgSend(v10, "copy", v14, v15, v16, v17, v18);
  }
  else {
    id v11 = v9;
  }
  uint64_t v12 = v11;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v12;
}

void __70__CRTextDecodingUtils_halfWidthToFullWidthNormalizationForTextString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v26 = a2;
  uint64_t v7 = [*(id *)(a1 + 32) allKeys];
  int v8 = [v7 containsObject:v26];

  if (v8)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
      goto LABEL_20;
    }
    uint64_t v9 = a3 <= 1 ? 1 : a3;
    uint64_t v10 = v9 - 1;
    do
    {
      uint64_t v11 = v10;
      uint64_t v12 = objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v10, 1);
      char v13 = [v12 isEqualToString:@" "];
      if ((unint64_t)(v10 + 1) > 1) {
        char v14 = v13;
      }
      else {
        char v14 = 0;
      }

      --v10;
    }
    while ((v14 & 1) != 0);
    uint64_t v15 = [*(id *)(a1 + 40) length];
    unint64_t v16 = v15 - 1 >= (unint64_t)([v26 length] + a3)
        ? [v26 length] + a3
        : [*(id *)(a1 + 40) length] - 1;
    for (unint64_t i = v16 - v10; ; ++i)
    {
      id v18 = objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v16, 1);
      if (![v18 isEqualToString:@" "]) {
        break;
      }
      unint64_t v19 = [*(id *)(a1 + 40) length] - 1;

      if (v16 >= v19) {
        goto LABEL_19;
      }
      ++v16;
    }

LABEL_19:
    if (objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "rangeOfFirstMatchInString:options:range:", *(void *)(a1 + 40), 0, v11, i) == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_20:
      v20 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      id v21 = v26;
      if (!v20)
      {
        uint64_t v22 = [*(id *)(a1 + 40) mutableCopy];
        uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
        uint64_t v24 = *(void **)(v23 + 40);
        *(void *)(v23 + 40) = v22;

        v20 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        id v21 = v26;
      }
      v25 = [*(id *)(a1 + 32) objectForKeyedSubscript:v21];
      objc_msgSend(v20, "replaceCharactersInRange:withString:", a3, a4, v25);
    }
  }
}

+ (void)getBoundariesForRanges:(void *)a3 topPoints:(void *)a4 bottomPoints:(void *)a5 imageSize:(void *)a6 scale:(int)a7 featureImageSize:(int)a8 rect:(double)a9 rotatedRoi:(double)a10 radians:(float)a11 model:(double)a12 configuration:(double)a13 paddingLeft:(double)a14 paddingRight:(double)a15 rangeOffset:(double)a16
{
  uint64_t v164 = *MEMORY[0x1E4F143B8];
  id v142 = a2;
  id v30 = a5;
  id v143 = a6;
  v141 = v30;
  self;
  uint64_t v31 = a24;
  __p = 0;
  v161 = 0;
  v162 = 0;
  BOOL v32 = *(double *)&a23 == 0.0;
  if (*(double *)&a24 == 0.0) {
    BOOL v32 = 1;
  }
  if (v32) {
    uint64_t v33 = a19;
  }
  else {
    uint64_t v33 = a23;
  }
  if (v32) {
    uint64_t v31 = a20;
  }
  double v145 = *(double *)&v31;
  v34 = [v30 outputWidthDownscale];
  [v34 floatValue];
  float v36 = v35;
  v139 = a3;
  v140 = a4;

  long long v158 = 0u;
  long long v159 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  id obj = v142;
  uint64_t v37 = [obj countByEnumeratingWithState:&v156 objects:v163 count:16];
  if (v37)
  {
    float v38 = *(double *)&v33;
    float v39 = v36 / (a12 * a11 / v38);
    uint64_t v40 = *(void *)v157;
    double v41 = v39;
    uint64_t v42 = MEMORY[0x1E4F1DAD8];
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v157 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = objc_msgSend(*(id *)(*((void *)&v156 + 1) + 8 * i), "rangeValue", v139, v140, v141);
        uint64_t v46 = *(void *)(v42 + 8);
        if (v45 == 0x7FFFFFFFFFFFFFFFLL) {
          double v47 = (float)(v39 * (float)(unint64_t)v44);
        }
        else {
          double v47 = *(double *)&a26 + ((double)v44 + a28) * v41;
        }
        if (v45 == 0x7FFFFFFFFFFFFFFFLL) {
          double v48 = (float)(v39 * (float)(unint64_t)v44);
        }
        else {
          double v48 = *(double *)&a27 + ((double)(v44 + v45) + a28) * v41;
        }
        v50 = v161;
        v49 = v162;
        if (v161 >= v162)
        {
          v52 = (double *)__p;
          uint64_t v53 = ((char *)v161 - (unsigned char *)__p) >> 4;
          unint64_t v54 = v53 + 1;
          if ((unint64_t)(v53 + 1) >> 60) {
            goto LABEL_140;
          }
          uint64_t v55 = (char *)v162 - (unsigned char *)__p;
          if (((char *)v162 - (unsigned char *)__p) >> 3 > v54) {
            unint64_t v54 = v55 >> 3;
          }
          if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v56 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v56 = v54;
          }
          if (v56)
          {
            v57 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>((uint64_t)&v162, v56);
            v52 = (double *)__p;
            v50 = v161;
          }
          else
          {
            v57 = 0;
          }
          v58 = (double *)&v57[16 * v53];
          double *v58 = v47;
          *((void *)v58 + 1) = v46;
          v59 = v58;
          if (v50 != v52)
          {
            do
            {
              *((_OWORD *)v59 - 1) = *((_OWORD *)v50 - 1);
              v59 -= 2;
              v50 -= 2;
            }
            while (v50 != v52);
            v52 = (double *)__p;
          }
          v49 = (double *)&v57[16 * v56];
          v51 = v58 + 2;
          __p = v59;
          v161 = v58 + 2;
          v162 = v49;
          if (v52)
          {
            operator delete(v52);
            v49 = v162;
          }
        }
        else
        {
          double *v161 = v47;
          *((void *)v50 + 1) = v46;
          v51 = v50 + 2;
        }
        v161 = v51;
        if (v51 >= v49)
        {
          v61 = (double *)__p;
          uint64_t v62 = ((char *)v51 - (unsigned char *)__p) >> 4;
          unint64_t v63 = v62 + 1;
          if ((unint64_t)(v62 + 1) >> 60) {
LABEL_140:
          }
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          uint64_t v64 = (char *)v49 - (unsigned char *)__p;
          if (v64 >> 3 > v63) {
            unint64_t v63 = v64 >> 3;
          }
          if ((unint64_t)v64 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v65 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v65 = v63;
          }
          if (v65)
          {
            v66 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>((uint64_t)&v162, v65);
            v61 = (double *)__p;
            v51 = v161;
          }
          else
          {
            v66 = 0;
          }
          v67 = (double *)&v66[16 * v62];
          double *v67 = v48;
          *((void *)v67 + 1) = v46;
          v68 = v67;
          if (v51 != v61)
          {
            do
            {
              *((_OWORD *)v68 - 1) = *((_OWORD *)v51 - 1);
              v68 -= 2;
              v51 -= 2;
            }
            while (v51 != v61);
            v61 = (double *)__p;
          }
          v60 = v67 + 2;
          __p = v68;
          v161 = v67 + 2;
          v162 = (double *)&v66[16 * v65];
          if (v61) {
            operator delete(v61);
          }
        }
        else
        {
          double *v51 = v48;
          *((void *)v51 + 1) = v46;
          v60 = v51 + 2;
        }
        v161 = v60;
      }
      uint64_t v37 = [obj countByEnumeratingWithState:&v156 objects:v163 count:16];
    }
    while (v37);
  }

  v70 = v139;
  v69 = v140;
  v153 = 0;
  v154 = 0;
  v155 = 0;
  v150 = 0;
  v151 = 0;
  v152 = 0;
  [v143 angleThresholdForRotatedCrops];
  if (v71 >= fabsf(*(float *)&a25))
  {
    v106 = (double *)__p;
    v107 = v161;
    if (__p != v161)
    {
      double v108 = *(double *)&a18 / a10;
      do
      {
        double v109 = v106[1];
        double v110 = (*(double *)&a17 + *v106) / a9;
        v111 = v154;
        if (v154 >= (double *)v155)
        {
          v113 = (double *)v153;
          uint64_t v114 = ((char *)v154 - (unsigned char *)v153) >> 4;
          unint64_t v115 = v114 + 1;
          if ((unint64_t)(v114 + 1) >> 60) {
            goto LABEL_144;
          }
          uint64_t v116 = v155 - (unsigned char *)v153;
          if ((v155 - (unsigned char *)v153) >> 3 > v115) {
            unint64_t v115 = v116 >> 3;
          }
          if ((unint64_t)v116 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v117 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v117 = v115;
          }
          if (v117)
          {
            v118 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>((uint64_t)&v155, v117);
            v113 = (double *)v153;
            v111 = v154;
          }
          else
          {
            v118 = 0;
          }
          v119 = (double *)&v118[16 * v114];
          double *v119 = v110;
          v119[1] = v108;
          v120 = v119;
          if (v111 != v113)
          {
            do
            {
              *((_OWORD *)v120 - 1) = *((_OWORD *)v111 - 1);
              v120 -= 2;
              v111 -= 2;
            }
            while (v111 != v113);
            v113 = (double *)v153;
          }
          v112 = v119 + 2;
          v153 = v120;
          v154 = v119 + 2;
          v155 = &v118[16 * v117];
          if (v113) {
            operator delete(v113);
          }
        }
        else
        {
          double *v154 = v110;
          v111[1] = v108;
          v112 = v111 + 2;
        }
        v154 = v112;
        v121 = v151;
        double v122 = (*(double *)&a18 + *(double *)&a20 + v109) / a10;
        if (v151 >= (double *)v152)
        {
          v124 = v150;
          uint64_t v125 = ((char *)v151 - (char *)v150) >> 4;
          unint64_t v126 = v125 + 1;
          if ((unint64_t)(v125 + 1) >> 60) {
LABEL_144:
          }
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          uint64_t v127 = v152 - (char *)v150;
          if ((v152 - (char *)v150) >> 3 > v126) {
            unint64_t v126 = v127 >> 3;
          }
          if ((unint64_t)v127 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v128 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v128 = v126;
          }
          if (v128)
          {
            v129 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>((uint64_t)&v152, v128);
            v124 = v150;
            v121 = v151;
          }
          else
          {
            v129 = 0;
          }
          v130 = (double *)&v129[16 * v125];
          double *v130 = v110;
          v130[1] = v122;
          v131 = v130;
          if (v121 != v124)
          {
            do
            {
              *((_OWORD *)v131 - 1) = *((_OWORD *)v121 - 1);
              v131 -= 2;
              v121 -= 2;
            }
            while (v121 != v124);
            v124 = v150;
          }
          v123 = v130 + 2;
          v150 = v131;
          v152 = &v129[16 * v128];
          if (v124) {
            operator delete(v124);
          }
        }
        else
        {
          double *v151 = v110;
          v151[1] = v122;
          v123 = v151 + 2;
        }
        v151 = v123;
        v106 += 2;
      }
      while (v106 != v107);
    }
  }
  else
  {
    v72 = (double *)__p;
    v73 = v161;
    if (__p != v161)
    {
      float v74 = v145;
      double v75 = *(double *)&a19 * 0.5;
      double v76 = *(double *)&a20 * 0.5;
      __float2 v77 = __sincosf_stret(*(float *)&a25);
      double v78 = *(double *)&a22 + v74 - *(double *)&a20 * 0.5;
      double cosval = v77.__cosval;
      double sinval = v77.__sinval;
      double v144 = v78 * v77.__cosval;
      double v146 = -(v78 * v77.__sinval);
      do
      {
        double v81 = *(double *)&a21 + *v72 - v75;
        double v82 = (*(double *)&a17 + v75 + v81 * cosval - (*(double *)&a22 - *(double *)&a20 * 0.5) * v77.__sinval) / a9;
        double v83 = (*(double *)&a18 + v76 + (*(double *)&a22 - *(double *)&a20 * 0.5) * v77.__cosval + v81 * sinval) / a10;
        v84 = v154;
        if (v154 >= (double *)v155)
        {
          v86 = (double *)v153;
          uint64_t v87 = ((char *)v154 - (unsigned char *)v153) >> 4;
          unint64_t v88 = v87 + 1;
          if ((unint64_t)(v87 + 1) >> 60) {
            goto LABEL_143;
          }
          uint64_t v89 = v155 - (unsigned char *)v153;
          if ((v155 - (unsigned char *)v153) >> 3 > v88) {
            unint64_t v88 = v89 >> 3;
          }
          if ((unint64_t)v89 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v90 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v90 = v88;
          }
          if (v90)
          {
            v91 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>((uint64_t)&v155, v90);
            v86 = (double *)v153;
            v84 = v154;
          }
          else
          {
            v91 = 0;
          }
          v92 = (double *)&v91[16 * v87];
          double *v92 = v82;
          v92[1] = v83;
          v93 = v92;
          if (v84 != v86)
          {
            do
            {
              *((_OWORD *)v93 - 1) = *((_OWORD *)v84 - 1);
              v93 -= 2;
              v84 -= 2;
            }
            while (v84 != v86);
            v86 = (double *)v153;
          }
          v85 = v92 + 2;
          v153 = v93;
          v154 = v92 + 2;
          v155 = &v91[16 * v90];
          if (v86) {
            operator delete(v86);
          }
        }
        else
        {
          double *v154 = v82;
          v84[1] = v83;
          v85 = v84 + 2;
        }
        double v94 = (*(double *)&a17 + v75 + v146 + v81 * cosval) / a9;
        double v95 = (*(double *)&a18 + v76 + v144 + v81 * sinval) / a10;
        v154 = v85;
        v96 = v151;
        if (v151 >= (double *)v152)
        {
          v98 = v150;
          uint64_t v99 = ((char *)v151 - (char *)v150) >> 4;
          unint64_t v100 = v99 + 1;
          if ((unint64_t)(v99 + 1) >> 60) {
LABEL_143:
          }
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          uint64_t v101 = v152 - (char *)v150;
          if ((v152 - (char *)v150) >> 3 > v100) {
            unint64_t v100 = v101 >> 3;
          }
          if ((unint64_t)v101 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v102 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v102 = v100;
          }
          if (v102)
          {
            v103 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<_NSRange>>((uint64_t)&v152, v102);
            v98 = v150;
            v96 = v151;
          }
          else
          {
            v103 = 0;
          }
          v104 = (double *)&v103[16 * v99];
          double *v104 = v94;
          v104[1] = v95;
          v105 = v104;
          if (v96 != v98)
          {
            do
            {
              *((_OWORD *)v105 - 1) = *((_OWORD *)v96 - 1);
              v105 -= 2;
              v96 -= 2;
            }
            while (v96 != v98);
            v98 = v150;
          }
          v97 = v104 + 2;
          v150 = v105;
          v152 = &v103[16 * v102];
          if (v98) {
            operator delete(v98);
          }
        }
        else
        {
          double *v151 = v94;
          v151[1] = v95;
          v97 = v151 + 2;
        }
        v151 = v97;
        v72 += 2;
      }
      while (v72 != v73);
    }
  }
  v132 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v139, v140);
  v133 = (double *)v153;
  v134 = v154;
  if (v153 != v154)
  {
    do
    {
      v135 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", *v133, v133[1]);
      [v132 addObject:v135];

      v133 += 2;
    }
    while (v133 != v134);
  }
  v136 = [MEMORY[0x1E4F1CA48] array];
  for (j = v150; j != v151; j += 2)
  {
    v138 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", *j, j[1]);
    [v136 addObject:v138];
  }
  if (v70)
  {
    void *v70 = [MEMORY[0x1E4F1C978] arrayWithArray:v132];
  }
  if (v69)
  {
    void *v69 = [MEMORY[0x1E4F1C978] arrayWithArray:v136];
  }

  if (v150) {
    operator delete(v150);
  }
  if (v153)
  {
    v154 = (double *)v153;
    operator delete(v153);
  }
  if (__p)
  {
    v161 = (double *)__p;
    operator delete(__p);
  }
}

+ (void)getWordBoundariesForWhiteSpaceRanges:(float)a3 topPoints:(double)a4 bottomPoints:(double)a5 imageSize:(double)a6 scale:(uint64_t)a7 featureImageSize:(uint64_t)a8 rect:(void *)a9 rotatedRoi:(void *)a10 radians:(void *)a11 model:(void *)a12 configuration:(void *)a13 paddingLeft:(int)a14 paddingRight:(double)a15 rangeOffset:(double)a16
{
  LODWORD(a6) = a25;
  +[CRTextDecodingUtils getBoundariesForRanges:topPoints:bottomPoints:imageSize:scale:featureImageSize:rect:rotatedRoi:radians:model:configuration:paddingLeft:paddingRight:rangeOffset:]((int)CRTextDecodingUtils, a9, a10, a11, a12, a13, (int)a13, a14, a1, a2, a3, a4, a5, a6, *(double *)&a26, *(double *)&a24, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28);
}

+ (void)getCharacterBoundariesForActivationRanges:(float)a3 topPoints:(double)a4 bottomPoints:(double)a5 imageSize:(double)a6 scale:(uint64_t)a7 featureImageSize:(uint64_t)a8 rect:(void *)a9 rotatedRoi:(void *)a10 radians:(void *)a11 model:(void *)a12 configuration:(void *)a13 paddingLeft:(int)a14 paddingRight:(double)a15 rangeOffset:(double)a16
{
  LODWORD(a6) = a25;
  +[CRTextDecodingUtils getBoundariesForRanges:topPoints:bottomPoints:imageSize:scale:featureImageSize:rect:rotatedRoi:radians:model:configuration:paddingLeft:paddingRight:rangeOffset:]((int)CRTextDecodingUtils, a9, a10, a11, a12, a13, (int)a13, a14, a1, a2, a3, a4, a5, a6, *(double *)&a26, *(double *)&a24, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28);
}

+ (BOOL)validateProbability:(id)a3 precisionThreshold:(double)a4 withLM:(BOOL)a5
{
  [a3 doubleValue];
  return v6 >= a4 + 0.0;
}

+ (id)tokenSequenceStringForTokens:(id)a3 usingCharacterTokens:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = objc_msgSend(MEMORY[0x1E4F28E78], "string", v5);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (v4
          && ([*(id *)(*((void *)&v18 + 1) + 8 * i) fullString],
              uint64_t v12 = objc_claimAutoreleasedReturnValue(),
              int v13 = [v12 isEqualToString:@" "],
              v12,
              v13))
        {
          [v6 appendString:@"\uFFFC"];
        }
        else
        {
          char v14 = [v11 string];
          [v6 appendString:v14];
        }
        [v6 appendString:@" "];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  uint64_t v15 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  unint64_t v16 = [v6 stringByTrimmingCharactersInSet:v15];

  return v16;
}

+ (id)tokenDelimiterRangesForTokens:(id)a3 usingCharacterTokens:(BOOL)a4
{
  BOOL v43 = a4;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  if ([v40 count])
  {
    uint64_t v44 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v40, "count") + 1);
    BOOL v4 = [v40 firstObject];
    uint64_t v5 = [v4 activationRange];

    double v6 = [v40 lastObject];
    uint64_t v7 = [v6 activationRange];
    uint64_t v38 = v8;
    uint64_t v39 = v7;

    uint64_t v9 = [v40 lastObject];
    uint64_t v10 = [v9 activationRange];
    uint64_t v36 = v11;
    uint64_t v37 = v10;

    if (v5) {
      objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", 0, v5);
    }
    else {
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", 0, 0x7FFFFFFFFFFFFFFFLL);
    }
    [v44 addObject:v12];

    if ((unint64_t)[v40 count] >= 2)
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v14 = v40;
      uint64_t v42 = [v14 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v42)
      {
        uint64_t v15 = 0;
        uint64_t v41 = *(void *)v46;
LABEL_9:
        uint64_t v16 = 0;
        while (1)
        {
          if (*(void *)v46 != v41) {
            objc_enumerationMutation(v14);
          }
          v17 = *(void **)(*((void *)&v45 + 1) + 8 * v16);
          if (v15 + v16 == [v14 count] - 1) {
            break;
          }
          long long v18 = [v14 objectAtIndexedSubscript:v15 + v16 + 1];
          uint64_t v19 = [v17 activationRange];
          uint64_t v21 = v20;
          uint64_t v22 = [v18 activationRange];
          uint64_t v23 = v19 + v21;
          if (v22 - v23 <= (unint64_t)!v43) {
            uint64_t v24 = !v43;
          }
          else {
            uint64_t v24 = v22 - v23;
          }
          if (v43)
          {
            v25 = [v17 fullString];
            int v26 = [v25 isEqualToString:@" "];

            if (v26) {
              uint64_t v23 = v19 + 1;
            }
            id v27 = [v18 fullString];
            int v28 = [v27 isEqualToString:@" "];

            if (v28) {
              uint64_t v24 = 1;
            }
          }
          v29 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v23, v24);
          [v44 addObject:v29];

          if (v42 == ++v16)
          {
            v15 += v16;
            uint64_t v42 = [v14 countByEnumeratingWithState:&v45 objects:v49 count:16];
            if (v42) {
              goto LABEL_9;
            }
            break;
          }
        }
      }
    }
    if (v39 + v38 == v37 + v36)
    {
      objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v39 + v38, 0x7FFFFFFFFFFFFFFFLL);
    }
    else
    {
      uint64_t v31 = [v40 lastObject];
      uint64_t v32 = [v31 activationRange];
      uint64_t v34 = v33;

      objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v39 + v38, v34 - (v39 + v38) + v32);
    id v30 = };
    [v44 addObject:v30];

    int v13 = [MEMORY[0x1E4F1C978] arrayWithArray:v44];
  }
  else
  {
    int v13 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

+ (id)wordTokensFromCharacterTokens:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  if ([v35 count])
  {
    id v36 = [MEMORY[0x1E4F1CA48] array];
    id v3 = [MEMORY[0x1E4F28E78] string];
    BOOL v4 = [v35 firstObject];
    NSUInteger location = [v4 activationRange];
    NSUInteger length = v6;

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = v35;
    uint64_t v8 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v8)
    {
      unint64_t v9 = 0;
      uint64_t v10 = *(void *)v39;
      double v11 = 0.0;
      double v12 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v39 != v10) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          v46.NSUInteger location = [v14 activationRange];
          v46.NSUInteger length = v15;
          v45.NSUInteger location = location;
          v45.NSUInteger length = length;
          NSRange v16 = NSUnionRange(v45, v46);
          NSUInteger location = v16.location;
          NSUInteger length = v16.length;
          v17 = [v14 fullString];
          char v18 = [v17 isEqualToString:@" "];

          if (v18) {
            goto LABEL_9;
          }
          uint64_t v19 = [v14 string];
          [v3 appendString:v19];

          uint64_t v20 = [v14 alignmentScore];
          [v20 doubleValue];
          double v22 = v21;

          uint64_t v23 = [v14 score];
          [v23 doubleValue];
          double v25 = v24;

          int v26 = [obj lastObject];
          LODWORD(v23) = v14 == v26;

          ++v9;
          double v12 = v12 + v22;
          double v11 = v11 + v25;
          if (v23)
          {
LABEL_9:
            if (v9) {
              double v27 = v11 / (double)v9;
            }
            else {
              double v27 = 0.0;
            }
            int v28 = [NSNumber numberWithDouble:v27];
            if (v9) {
              double v29 = v12 / (double)v9;
            }
            else {
              double v29 = 0.0;
            }
            id v30 = [NSNumber numberWithDouble:v29];
            id v31 = objc_alloc(MEMORY[0x1E4F567A0]);
            uint64_t v32 = (void *)[v3 copy];
            uint64_t v33 = objc_msgSend(v31, "initWithString:score:alignmentScore:activationRange:terminatingCharacter:", v32, v28, v30, v16.location, v16.length, &stru_1F38EED68);

            [v36 addObject:v33];
            [v3 setString:&stru_1F38EED68];

            unint64_t v9 = 0;
            NSUInteger location = v16.location + v16.length;
            double v11 = 0.0;
            double v12 = 0.0;
            NSUInteger length = 0;
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v36 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v36;
}

+ (id)graphemeClusterTokensFromTokens:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  if (![v53 count])
  {
    id v55 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_38;
  }
  id v55 = [MEMORY[0x1E4F1CA48] array];
  v60 = [MEMORY[0x1E4F28E78] string];
  id v3 = [v53 firstObject];
  uint64_t v4 = [v3 activationRange];
  NSUInteger length = v5;
  NSUInteger location = v4;

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v53;
  uint64_t v6 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
  unint64_t v7 = 0;
  if (!v6)
  {
    double v8 = 0.0;
    double v9 = 0.0;
    goto LABEL_29;
  }
  uint64_t v56 = *(void *)v62;
  double v8 = 0.0;
  double v9 = 0.0;
  do
  {
    uint64_t v57 = v6;
    for (uint64_t i = 0; i != v57; ++i)
    {
      if (*(void *)v62 != v56) {
        objc_enumerationMutation(obj);
      }
      double v11 = *(void **)(*((void *)&v61 + 1) + 8 * i);
      double v12 = [v11 string];
      int v13 = [(NSString *)v60 stringByAppendingString:v12];

      id v14 = [v11 fullString];
      char v15 = [v14 isEqualToString:@" "];

      NSRange v16 = [v11 string];
      uint64_t v17 = characterCount(v16);

      if ([(NSString *)v60 length])
      {
        unint64_t v18 = characterCount(v13);
        if (v18 >= characterCount(v60) + v17) {
          char v19 = 1;
        }
        else {
          char v19 = v15;
        }
        if ((v19 & 1) == 0)
        {
LABEL_15:
          double v21 = [v11 string];
          uint64_t v22 = characterCount(v21);

          uint64_t v23 = [v11 string];
          [(NSString *)v60 appendString:v23];

          v70.NSUInteger location = [v11 activationRange];
          v70.NSUInteger length = v24;
          v68.NSUInteger length = length;
          v68.NSUInteger location = location;
          NSRange v25 = NSUnionRange(v68, v70);
          NSUInteger length = v25.length;
          NSUInteger location = v25.location;
          int v26 = [v11 alignmentScore];
          [v26 doubleValue];
          double v28 = v27;

          double v29 = [v11 score];
          [v29 doubleValue];
          v7 += v22;
          double v9 = v9 + v28;
          double v8 = v8 + v30;
          goto LABEL_24;
        }
      }
      else if ((v15 & 1) == 0)
      {
        goto LABEL_15;
      }
      if (v7) {
        double v20 = v8 / (double)v7;
      }
      else {
        double v20 = 0.0;
      }
      double v29 = [NSNumber numberWithDouble:v20];
      if (v7) {
        double v31 = v9 / (double)v7;
      }
      else {
        double v31 = 0.0;
      }
      uint64_t v32 = [NSNumber numberWithDouble:v31];
      id v33 = objc_alloc(MEMORY[0x1E4F567A0]);
      uint64_t v34 = (void *)[(NSString *)v60 copy];
      id v35 = objc_msgSend(v33, "initWithString:score:alignmentScore:activationRange:terminatingCharacter:", v34, v29, v32, location, length, &stru_1F38EED68);

      [v55 addObject:v35];
      if (v15)
      {
        [v55 addObject:v11];
        [(NSString *)v60 setString:&stru_1F38EED68];
        uint64_t v36 = [v11 activationRange];
        unint64_t v7 = 0;
        NSUInteger length = 0;
        NSUInteger location = v36 + v37;
        double v8 = 0.0;
        double v9 = 0.0;
      }
      else
      {
        long long v38 = [v11 string];
        [(NSString *)v60 setString:v38];

        v71.NSUInteger location = [v11 activationRange];
        v71.NSUInteger length = v39;
        v69.NSUInteger location = location + length;
        v69.NSUInteger length = 0;
        NSRange v40 = NSUnionRange(v69, v71);
        NSUInteger length = v40.length;
        NSUInteger location = v40.location;
        long long v41 = [v11 alignmentScore];
        [v41 doubleValue];
        double v9 = v42;

        uint64_t v43 = [v11 score];
        [v43 doubleValue];
        double v8 = v44;

        unint64_t v7 = v17;
      }

LABEL_24:
    }
    uint64_t v6 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
  }
  while (v6);
LABEL_29:

  if ([(NSString *)v60 length])
  {
    if (v7) {
      double v45 = v8 / (double)v7;
    }
    else {
      double v45 = 0.0;
    }
    NSRange v46 = [NSNumber numberWithDouble:v45];
    if (v7) {
      double v47 = v9 / (double)v7;
    }
    else {
      double v47 = 0.0;
    }
    long long v48 = [NSNumber numberWithDouble:v47];
    id v49 = objc_alloc(MEMORY[0x1E4F567A0]);
    uint64_t v50 = (void *)[(NSString *)v60 copy];
    v51 = objc_msgSend(v49, "initWithString:score:alignmentScore:activationRange:terminatingCharacter:", v50, v46, v48, location, length, &stru_1F38EED68);

    [v55 addObject:v51];
  }

LABEL_38:
  return v55;
}

+ (id)characterRangesForTokens:(id)a3 fromActivation:(id)a4 usingCharacterTokens:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  NSRange v46 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  uint64_t v9 = [v7 count];
  uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
  if (v8 && v9)
  {
    unint64_t v11 = 0x1E4F1C000uLL;
    long long v41 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    double v12 = [v8 characterObservations];
    long long v48 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v8, "blankIndex"));

    unint64_t v45 = 0;
    unint64_t v40 = !v5;
    id v42 = v7;
    id v49 = v8;
    while (v45 < objc_msgSend(v7, "count", v40))
    {
      int v13 = objc_msgSend(v7, "objectAtIndexedSubscript:");
      unint64_t v14 = [v13 activationRange];
      uint64_t v16 = v15;

      uint64_t v17 = [v7 objectAtIndexedSubscript:v45];
      unint64_t v18 = [v17 fullString];
      char v19 = [v18 componentsSeparatedByCharactersInSet:v46];
      double v20 = [v19 componentsJoinedByString:&stru_1F38EED68];

      uint64_t v43 = characterCount(v20);
      double v44 = v20;
      uint64_t v50 = [*(id *)(v11 + 2632) array];
      double v21 = [*(id *)(v11 + 2632) array];
      if (v14 < v14 + v16)
      {
        BOOL v22 = 0;
        uint64_t v23 = 0;
        uint64_t v47 = -1;
        double v24 = -1.79769313e308;
        NSRange v25 = &stru_1F38EED68;
        while (1)
        {
          int v26 = v23;
          double v51 = 0.0;
          uint64_t v23 = [v49 topCandidateForTimestep:v14 outputLogProbability:&v51];
          BOOL v27 = ([v23 isEqualToString:v48] & 1) != 0
             || [v23 rangeOfCharacterFromSet:v46] != 0x7FFFFFFFFFFFFFFFLL;
          if (((v27 | [v23 isEqualToString:v26]) & 1) == 0)
          {
            uint64_t v28 = [(__CFString *)v25 length];
            uint64_t v29 = [(__CFString *)v25 stringByAppendingString:v23];
            BOOL v22 = v28 == 0;

            NSRange v25 = (__CFString *)v29;
          }
          if (characterCount(&v25->isa) != 1) {
            break;
          }
          if (!v27)
          {
            if (!v22)
            {
              BOOL v22 = 0;
              goto LABEL_23;
            }
            BOOL v22 = 1;
            if (v51 > v24)
            {
              double v24 = v51;
LABEL_21:
              uint64_t v47 = v14;
            }
          }
LABEL_23:

          ++v14;
          if (!--v16) {
            goto LABEL_26;
          }
        }
        if ([(__CFString *)v25 length])
        {

          NSRange v25 = &stru_1F38EED68;
        }
        if (v27) {
          goto LABEL_23;
        }
        double v30 = [NSNumber numberWithInteger:v47];
        [v21 addObject:v30];

        double v24 = v51;
        double v31 = v23;

        BOOL v22 = 1;
        NSRange v25 = v31;
        goto LABEL_21;
      }
      uint64_t v23 = 0;
      uint64_t v47 = -1;
      NSRange v25 = &stru_1F38EED68;
LABEL_26:
      if ([(__CFString *)v25 length])
      {
        uint64_t v32 = [NSNumber numberWithInteger:v47];
        [v21 addObject:v32];
      }
      uint64_t v33 = [v21 count];
      if (v33 == v43)
      {
        for (unint64_t i = v40; i < [v21 count]; ++i)
        {
          id v35 = [v21 objectAtIndexedSubscript:i];
          uint64_t v36 = [v35 integerValue];

          uint64_t v37 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v36, 0);
          [v50 addObject:v37];
        }
        long long v38 = [MEMORY[0x1E4F1C978] arrayWithArray:v50];
        [v41 addObject:v38];
      }
      ++v45;
      id v7 = v42;
      id v8 = v49;
      unint64_t v11 = 0x1E4F1C000;
      if (v33 != v43)
      {
        uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
        goto LABEL_36;
      }
    }
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithArray:v41];
LABEL_36:
  }
  return v10;
}

+ (id)reversedTokens:(id)a3 numTimeSteps:(unint64_t)a4
{
  id v25 = a3;
  BOOL v22 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v25, "count"));
  uint64_t v4 = [v25 count] - 1;
  if (v4 >= 0)
  {
    do
    {
      BOOL v5 = [v25 objectAtIndexedSubscript:v4];
      uint64_t v6 = [v5 activationRange];
      uint64_t v8 = v7;

      id v9 = objc_alloc(MEMORY[0x1E4F567A0]);
      uint64_t v10 = [v25 objectAtIndexedSubscript:v4];
      unint64_t v11 = [v10 string];
      double v12 = [v25 objectAtIndexedSubscript:v4];
      int v13 = [v12 score];
      unint64_t v14 = [v25 objectAtIndexedSubscript:v4];
      uint64_t v15 = [v14 alignmentScore];
      if (v4)
      {
        double v24 = [v25 objectAtIndexedSubscript:v4 - 1];
        uint64_t v23 = [v24 terminatingCharacter];
        uint64_t v16 = v23;
      }
      else
      {
        uint64_t v16 = 0;
      }
      uint64_t v17 = objc_msgSend(v9, "initWithString:score:alignmentScore:activationRange:terminatingCharacter:", v11, v13, v15, a4 - (v6 + v8), v8, v16);
      if (v4)
      {
      }
      [v22 addObject:v17];
    }
    while (v4-- > 0);
  }
  char v19 = (void *)[v22 copy];

  return v19;
}

+ (id)getTokenPermutationByApplyingReorderingPermutation:(id)a3 toRanges:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  std::vector<unsigned long>::vector(&v26, [v6 count]);
  for (unint64_t i = 0; i < [v6 count]; ++i)
  {
    uint64_t v8 = [v6 objectAtIndexedSubscript:i];
    uint64_t v9 = [v8 rangeValue];

    uint64_t v10 = [v5 objectAtIndexedSubscript:v9];
    uint64_t v11 = [v10 unsignedIntegerValue];

    *((void *)v26 + i) = v11;
  }
  std::vector<unsigned long>::vector(&__p, (v27 - (unsigned char *)v26) >> 3);
  double v12 = (uint64_t *)__p;
  int v13 = v25;
  if (__p != v25)
  {
    uint64_t v14 = 0;
    uint64_t v15 = (uint64_t *)__p;
    do
      *v15++ = v14++;
    while (v15 != v13);
  }
  unint64_t v16 = 126 - 2 * __clz(v13 - v12);
  uint64_t v28 = &v26;
  if (v13 == v12) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = v16;
  }
  std::__introsort<std::_ClassicAlgPolicy,+[CRTextDecodingUtils getTokenPermutationByApplyingReorderingPermutation:toRanges:]::$_0 &,unsigned long *,false>((unint64_t)v12, v13, (uint64_t **)&v28, v17, 1);
  unint64_t v18 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  char v19 = (uint64_t *)__p;
  double v20 = v25;
  if (__p != v25)
  {
    do
    {
      double v21 = [NSNumber numberWithUnsignedInteger:*v19];
      [v18 addObject:v21];

      ++v19;
    }
    while (v19 != v20);
  }
  BOOL v22 = (void *)[v18 copy];

  if (__p)
  {
    id v25 = (uint64_t *)__p;
    operator delete(__p);
  }
  if (v26)
  {
    BOOL v27 = v26;
    operator delete(v26);
  }

  return v22;
}

+ (id)invertedPermutation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  for (unint64_t i = 0; i < [v3 count]; ++i)
  {
    id v6 = [NSNumber numberWithUnsignedInteger:i];
    uint64_t v7 = [v3 objectAtIndexedSubscript:i];
    [v4 setObject:v6 forKeyedSubscript:v7];
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  for (unint64_t j = 0; j < [v3 count]; ++j)
  {
    uint64_t v10 = [NSNumber numberWithUnsignedInteger:j];
    uint64_t v11 = [v4 objectForKeyedSubscript:v10];
    [v8 addObject:v11];
  }
  double v12 = (void *)[v8 copy];

  return v12;
}

+ (id)reversedPermutation:(id)a3 numTimeSteps:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v7 = [v5 count];
  if (v7 - 1 >= 0)
  {
    do
    {
      uint64_t v8 = [v5 objectAtIndexedSubscript:--v7];
      unint64_t v9 = ~[v8 unsignedIntegerValue] + a4;

      uint64_t v10 = [NSNumber numberWithUnsignedInteger:v9];
      [v6 addObject:v10];
    }
    while (v7 > 0);
  }
  uint64_t v11 = [v6 reverseObjectEnumerator];
  double v12 = [v11 allObjects];

  return v12;
}

BOOL __87__CRTextDecodingUtils__tokenFilterPredicateFalsePositiveFiltering_keepWhitespaceToken___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(a1 + 48)
    && ([v5 fullString],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isEqualToString:@" "],
        v7,
        (v8 & 1) != 0))
  {
    BOOL v9 = 1;
  }
  else
  {
    uint64_t v10 = [v5 fullString];
    uint64_t v11 = [v10 stringByTrimmingCharactersInSet:*(void *)(a1 + 32)];

    uint64_t v12 = [v11 length];
    unint64_t v13 = v12;
    if (*(unsigned char *)(a1 + 49))
    {
      if (v12)
      {
        uint64_t v14 = [v11 componentsSeparatedByCharactersInSet:*(void *)(a1 + 40)];
        uint64_t v15 = [v14 componentsJoinedByString:&stru_1F38EED68];
        unint64_t v16 = [v15 length];

        BOOL v9 = (double)v16 / (double)v13 > 0.5;
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = v12 != 0;
    }
  }
  return v9;
}

+ (id)filteredTokensFromTokens:(id)a3 falsePositiveFiltering:(BOOL)a4 keepWhitespaceToken:(BOOL)a5
{
  id v7 = a3;
  self;
  char v8 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  BOOL v9 = [MEMORY[0x1E4F28B88] _crUnknownScriptCharacterSet];
  uint64_t v10 = (void *)MEMORY[0x1E4F28F60];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __87__CRTextDecodingUtils__tokenFilterPredicateFalsePositiveFiltering_keepWhitespaceToken___block_invoke;
  v16[3] = &unk_1E6CDB5B0;
  BOOL v19 = a5;
  id v11 = v8;
  BOOL v20 = a4;
  id v17 = v11;
  id v18 = v9;
  id v12 = v9;
  unint64_t v13 = [v10 predicateWithBlock:v16];

  uint64_t v14 = [v7 filteredArrayUsingPredicate:v13];

  return v14;
}

+ (unint64_t)getTokenPermutationByApplyingReorderingPermutation:(uint64_t *)a3 toRanges:(uint64_t)a4
{
  id v11 = (uint64_t *)result;
  while (2)
  {
    id v12 = v11;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          id v11 = v12;
          uint64_t v13 = (char *)a2 - (char *)v12;
          unint64_t v14 = a2 - v12;
          if (v6 || !v5)
          {
            switch(v14)
            {
              case 0uLL:
              case 1uLL:
                return result;
              case 2uLL:
                uint64_t v46 = *(a2 - 1);
                uint64_t v47 = *v12;
                if (*(void *)(**a3 + 8 * v46) < *(void *)(**a3 + 8 * *v12))
                {
                  *id v12 = v46;
                  *(a2 - 1) = v47;
                }
                break;
              case 3uLL:
                uint64_t v48 = **a3;
                result = (unint64_t)std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[CRTextDecodingUtils getTokenPermutationByApplyingReorderingPermutation:a2 - 1 toRanges:v48];
                break;
              case 4uLL:
                result = (unint64_t)std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,+[CRTextDecodingUtils getTokenPermutationByApplyingReorderingPermutation:toRanges:]::$_0 &,unsigned long *>(v12, v12 + 1, v12 + 2, a2 - 1, a3);
                break;
              case 5uLL:
                id v49 = v12 + 1;
                uint64_t v50 = v12 + 2;
                double v51 = v12 + 3;
                result = (unint64_t)std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,+[CRTextDecodingUtils getTokenPermutationByApplyingReorderingPermutation:toRanges:]::$_0 &,unsigned long *>(v12, v12 + 1, v12 + 2, v12 + 3, a3);
                uint64_t v52 = *(a2 - 1);
                uint64_t v53 = v12[3];
                uint64_t v54 = **a3;
                if (*(void *)(v54 + 8 * v52) < *(void *)(v54 + 8 * v53))
                {
                  uint64_t *v51 = v52;
                  *(a2 - 1) = v53;
                  uint64_t v55 = *v51;
                  uint64_t v56 = *v50;
                  if (*(void *)(v54 + 8 * *v51) < *(void *)(v54 + 8 * *v50))
                  {
                    uint64_t *v50 = v55;
                    uint64_t *v51 = v56;
                    uint64_t v57 = *v49;
                    if (*(void *)(v54 + 8 * v55) < *(void *)(v54 + 8 * *v49))
                    {
                      v12[1] = v55;
                      v12[2] = v57;
                      uint64_t v58 = *v12;
                      if (*(void *)(v54 + 8 * v55) < *(void *)(v54 + 8 * *v12))
                      {
                        *id v12 = v55;
                        v12[1] = v58;
                      }
                    }
                  }
                }
                break;
              default:
                JUMPOUT(0);
            }
            return result;
          }
          if (v13 <= 191)
          {
            if (a5)
            {
              if (v12 != a2)
              {
                v59 = v12 + 1;
                if (v12 + 1 != a2)
                {
                  uint64_t v60 = **a3;
                  uint64_t v61 = 8;
                  long long v62 = v12;
                  do
                  {
                    uint64_t v64 = *v62;
                    uint64_t v63 = v62[1];
                    long long v62 = v59;
                    if (*(void *)(v60 + 8 * v63) < *(void *)(v60 + 8 * v64))
                    {
                      uint64_t v65 = v61;
                      do
                      {
                        *(uint64_t *)((char *)v12 + v65) = v64;
                        uint64_t v66 = v65 - 8;
                        if (v65 == 8)
                        {
                          v67 = v12;
                          goto LABEL_80;
                        }
                        uint64_t v64 = *(uint64_t *)((char *)v12 + v65 - 16);
                        v65 -= 8;
                      }
                      while (*(void *)(v60 + 8 * v63) < *(void *)(v60 + 8 * v64));
                      v67 = (uint64_t *)((char *)v12 + v66);
LABEL_80:
                      uint64_t *v67 = v63;
                    }
                    v59 = v62 + 1;
                    v61 += 8;
                  }
                  while (v62 + 1 != a2);
                }
              }
            }
            else if (v12 != a2)
            {
              uint64_t v99 = v12 + 1;
              if (v12 + 1 != a2)
              {
                uint64_t v100 = **a3;
                do
                {
                  uint64_t v102 = *v11;
                  uint64_t v101 = v11[1];
                  id v11 = v99;
                  if (*(void *)(v100 + 8 * v101) < *(void *)(v100 + 8 * v102))
                  {
                    do
                    {
                      *uint64_t v99 = v102;
                      uint64_t v102 = *(v99 - 2);
                      --v99;
                    }
                    while (*(void *)(v100 + 8 * v101) < *(void *)(v100 + 8 * v102));
                    *uint64_t v99 = v101;
                  }
                  uint64_t v99 = v11 + 1;
                }
                while (v11 + 1 != a2);
              }
            }
            return result;
          }
          if (!a4)
          {
            if (v12 != a2)
            {
              int64_t v68 = (v14 - 2) >> 1;
              NSRange v69 = *a3;
              int64_t v70 = v68;
              do
              {
                int64_t v71 = v70;
                if (v68 >= v70)
                {
                  uint64_t v72 = (2 * v70) | 1;
                  v73 = &v12[v72];
                  uint64_t v74 = *v73;
                  if (2 * v71 + 2 < (uint64_t)v14)
                  {
                    uint64_t v75 = *v69;
                    if (*(void *)(*v69 + 8 * v74) < *(void *)(*v69 + 8 * v73[1]))
                    {
                      uint64_t v74 = v73[1];
                      ++v73;
                      uint64_t v72 = 2 * v71 + 2;
                    }
                  }
                  else
                  {
                    uint64_t v75 = *v69;
                  }
                  double v76 = &v12[v71];
                  uint64_t v77 = *v76;
                  result = *(void *)(v75 + 8 * v74);
                  if (result >= *(void *)(v75 + 8 * *v76))
                  {
                    do
                    {
                      result = (unint64_t)v73;
                      *double v76 = v74;
                      if (v68 < v72) {
                        break;
                      }
                      uint64_t v78 = (2 * v72) | 1;
                      v73 = &v12[v78];
                      uint64_t v79 = 2 * v72 + 2;
                      uint64_t v74 = *v73;
                      if (v79 < (uint64_t)v14 && *(void *)(v75 + 8 * v74) < *(void *)(v75 + 8 * v73[1]))
                      {
                        uint64_t v74 = v73[1];
                        ++v73;
                        uint64_t v78 = v79;
                      }
                      double v76 = (uint64_t *)result;
                      uint64_t v72 = v78;
                    }
                    while (*(void *)(v75 + 8 * v74) >= *(void *)(v75 + 8 * v77));
                    *(void *)result = v77;
                  }
                }
                int64_t v70 = v71 - 1;
              }
              while (v71);
              uint64_t v80 = (unint64_t)v13 >> 3;
              do
              {
                uint64_t v81 = 0;
                uint64_t v82 = *v12;
                double v83 = *a3;
                v84 = v12;
                do
                {
                  v85 = &v84[v81];
                  uint64_t v88 = v85[1];
                  v86 = v85 + 1;
                  uint64_t v87 = v88;
                  uint64_t v89 = (2 * v81) | 1;
                  uint64_t v90 = 2 * v81 + 2;
                  if (v90 < v80)
                  {
                    result = v86[1];
                    if (*(void *)(*v83 + 8 * v87) < *(void *)(*v83 + 8 * result))
                    {
                      uint64_t v87 = v86[1];
                      ++v86;
                      uint64_t v89 = v90;
                    }
                  }
                  uint64_t *v84 = v87;
                  v84 = v86;
                  uint64_t v81 = v89;
                }
                while (v89 <= (uint64_t)((unint64_t)(v80 - 2) >> 1));
                if (v86 == --a2)
                {
                  uint64_t *v86 = v82;
                }
                else
                {
                  uint64_t *v86 = *a2;
                  *a2 = v82;
                  uint64_t v91 = (char *)v86 - (char *)v12 + 8;
                  if (v91 >= 9)
                  {
                    unint64_t v92 = (((unint64_t)v91 >> 3) - 2) >> 1;
                    v93 = &v12[v92];
                    uint64_t v94 = *v93;
                    uint64_t v95 = *v86;
                    uint64_t v96 = *v83;
                    if (*(void *)(v96 + 8 * *v93) < *(void *)(v96 + 8 * *v86))
                    {
                      do
                      {
                        v97 = v93;
                        uint64_t *v86 = v94;
                        if (!v92) {
                          break;
                        }
                        unint64_t v92 = (v92 - 1) >> 1;
                        v93 = &v12[v92];
                        uint64_t v94 = *v93;
                        v86 = v97;
                      }
                      while (*(void *)(v96 + 8 * *v93) < *(void *)(v96 + 8 * v95));
                      uint64_t *v97 = v95;
                    }
                  }
                }
              }
              while (v80-- > 2);
            }
            return result;
          }
          unint64_t v15 = v14 >> 1;
          unint64_t v16 = &v12[v14 >> 1];
          uint64_t v17 = **a3;
          if ((unint64_t)v13 >= 0x401)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[CRTextDecodingUtils getTokenPermutationByApplyingReorderingPermutation:a2 - 1 toRanges:v17];
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[CRTextDecodingUtils getTokenPermutationByApplyingReorderingPermutation:a2 - 2 toRanges:**a3];
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[CRTextDecodingUtils getTokenPermutationByApplyingReorderingPermutation:a2 - 3 toRanges:**a3];
            result = (unint64_t)std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[CRTextDecodingUtils getTokenPermutationByApplyingReorderingPermutation:&v11[v15 + 1] toRanges:**a3];
            uint64_t v18 = *v11;
            *id v11 = *v16;
            *unint64_t v16 = v18;
          }
          else
          {
            result = (unint64_t)std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,+[CRTextDecodingUtils getTokenPermutationByApplyingReorderingPermutation:a2 - 1 toRanges:v17];
          }
          --a4;
          uint64_t v19 = *v11;
          uint64_t v20 = **a3;
          if (a5) {
            break;
          }
          unint64_t v21 = *(void *)(v20 + 8 * v19);
          if (*(void *)(v20 + 8 * *(v11 - 1)) < v21) {
            goto LABEL_13;
          }
          if (v21 >= *(void *)(v20 + 8 * *(a2 - 1)))
          {
            uint64_t v37 = v11 + 1;
            do
            {
              id v12 = v37;
              if (v37 >= a2) {
                break;
              }
              ++v37;
            }
            while (v21 >= *(void *)(v20 + 8 * *v12));
          }
          else
          {
            id v12 = v11;
            do
            {
              uint64_t v36 = v12[1];
              ++v12;
            }
            while (v21 >= *(void *)(v20 + 8 * v36));
          }
          long long v38 = a2;
          if (v12 < a2)
          {
            long long v38 = a2;
            do
              uint64_t v39 = *--v38;
            while (v21 < *(void *)(v20 + 8 * v39));
          }
          if (v12 < v38)
          {
            uint64_t v40 = *v12;
            uint64_t v41 = *v38;
            do
            {
              *id v12 = v41;
              *long long v38 = v40;
              unint64_t v42 = *(void *)(v20 + 8 * v19);
              do
              {
                uint64_t v43 = v12[1];
                ++v12;
                uint64_t v40 = v43;
              }
              while (v42 >= *(void *)(v20 + 8 * v43));
              do
              {
                uint64_t v44 = *--v38;
                uint64_t v41 = v44;
              }
              while (v42 < *(void *)(v20 + 8 * v44));
            }
            while (v12 < v38);
          }
          unint64_t v45 = v12 - 1;
          BOOL v5 = v12 - 1 >= v11;
          BOOL v6 = v12 - 1 == v11;
          if (v12 - 1 != v11) {
            *id v11 = *v45;
          }
          a5 = 0;
          *unint64_t v45 = v19;
        }
        unint64_t v21 = *(void *)(v20 + 8 * v19);
LABEL_13:
        uint64_t v22 = 0;
        do
          uint64_t v23 = v11[++v22];
        while (*(void *)(v20 + 8 * v23) < v21);
        double v24 = &v11[v22];
        id v25 = a2;
        if (v22 == 1)
        {
          id v25 = a2;
          do
          {
            if (v24 >= v25) {
              break;
            }
            uint64_t v27 = *--v25;
          }
          while (*(void *)(v20 + 8 * v27) >= v21);
        }
        else
        {
          do
            uint64_t v26 = *--v25;
          while (*(void *)(v20 + 8 * v26) >= v21);
        }
        if (v24 >= v25)
        {
          uint64_t v34 = v24 - 1;
        }
        else
        {
          uint64_t v28 = *v25;
          uint64_t v29 = &v11[v22];
          double v30 = v25;
          do
          {
            uint64_t *v29 = v28;
            *double v30 = v23;
            unint64_t v31 = *(void *)(v20 + 8 * v19);
            do
            {
              uint64_t v32 = v29[1];
              ++v29;
              uint64_t v23 = v32;
            }
            while (*(void *)(v20 + 8 * v32) < v31);
            do
            {
              uint64_t v33 = *--v30;
              uint64_t v28 = v33;
            }
            while (*(void *)(v20 + 8 * v33) >= v31);
          }
          while (v29 < v30);
          uint64_t v34 = v29 - 1;
        }
        if (v34 != v11) {
          *id v11 = *v34;
        }
        uint64_t *v34 = v19;
        if (v24 >= v25) {
          break;
        }
LABEL_34:
        result = std::__introsort<std::_ClassicAlgPolicy,+[CRTextDecodingUtils getTokenPermutationByApplyingReorderingPermutation:toRanges:]::$_0 &,unsigned long *,false>(v11, v34, a3, a4, a5 & 1);
        a5 = 0;
        id v12 = v34 + 1;
      }
      BOOL v35 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,+[CRTextDecodingUtils getTokenPermutationByApplyingReorderingPermutation:toRanges:]::$_0 &,unsigned long *>(v11, v34, a3);
      id v12 = v34 + 1;
      result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,+[CRTextDecodingUtils getTokenPermutationByApplyingReorderingPermutation:toRanges:]::$_0 &,unsigned long *>(v34 + 1, a2, a3);
      if (result) {
        break;
      }
      if (!v35) {
        goto LABEL_34;
      }
    }
    a2 = v34;
    if (!v35) {
      continue;
    }
    return result;
  }
}

@end