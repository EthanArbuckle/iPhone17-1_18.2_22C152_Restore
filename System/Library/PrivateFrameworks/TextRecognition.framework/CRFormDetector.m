@interface CRFormDetector
+ (BOOL)validateHorizontalTiles:(const void *)a3 document:(id)a4;
+ (id)_detectorResultsFromSortedResults:(const void *)a3 imageSize:(CGSize)a4 originalImageSize:(CGSize)a5;
+ (id)_multiArrayFromPixelBuffer:(__CVBuffer *)a3;
+ (void)_saveDebugImage:(id)a3 byOverlayingResults:(const void *)a4;
- (CRFormAnalyzerConfiguration)configuration;
- (CRFormDetector)initWithConfiguration:(id)a3 error:(id *)a4;
- (CRFormDetectorModel)model;
- (__n128)detectFormFieldsInImage:(unint64_t)a3 document:(__n128 *)a4 outputCandidateResults:(__n128)result;
- (__n128)detectFormFieldsInImage:(unint64_t)a3 document:(__n128 *)a4 outputCandidateResults:(uint64_t)a5;
- (char)detectFormFieldsInImage:(char *)a3 document:(uint64_t)a4 outputCandidateResults:(uint64_t)a5;
- (id)detectFormFieldsInImage:(id)a3 document:(id)a4 outputCandidateResults:(id *)a5;
- (void)_denormalizeResults:(void *)a3 imageSize:(CGSize *)a4 translation:(CGVector *)a5;
- (void)detectFormFieldsInImage:(uint64_t)a3 document:(char)a4 outputCandidateResults:;
@end

@implementation CRFormDetector

- (CRFormDetector)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRFormDetector;
  v8 = [(CRFormDetector *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_configuration, a3);
    v10 = [[CRFormDetectorModel alloc] initWithConfiguration:v7 error:a4];
    model = v9->_model;
    v9->_model = v10;
  }
  return v9;
}

+ (id)_multiArrayFromPixelBuffer:(__CVBuffer *)a3
{
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType == 32)
  {
    uint64_t v6 = 1;
    uint64_t v7 = 2;
    uint64_t v5 = 3;
    goto LABEL_5;
  }
  if (PixelFormatType == 1111970369)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 2;
    uint64_t v7 = 1;
LABEL_5:
    CVPixelBufferLockBaseAddress(a3, 0);
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F1E9A8]) initWithShape:&unk_1F39333D0 dataType:65568 error:0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __45__CRFormDetector__multiArrayFromPixelBuffer___block_invoke;
    v11[3] = &__block_descriptor_64_e24_v32__0_v8q16__NSArray_24l;
    v11[4] = BaseAddress;
    v11[5] = v6;
    v11[6] = v7;
    v11[7] = v5;
    [v9 getMutableBytesWithHandler:v11];
    CVPixelBufferUnlockBaseAddress(a3, 0);
    goto LABEL_7;
  }
  v9 = 0;
LABEL_7:
  return v9;
}

__n128 __45__CRFormDetector__multiArrayFromPixelBuffer___block_invoke(void *a1, uint64_t a2, __n128 result)
{
  uint64_t v3 = 0;
  uint64_t v4 = a1[4];
  uint64_t v5 = v4 + a1[7];
  uint64_t v6 = v4 + a1[6];
  uint64_t v7 = v4 + a1[5];
  do
  {
    result.n128_u8[0] = *(unsigned char *)(v7 + v3);
    *(float *)&unsigned int v8 = (float)result.n128_u32[0] / 255.0;
    uint64_t v9 = a2 + v3;
    *(float *)uint64_t v9 = *(float *)&v8;
    LOBYTE(v8) = *(unsigned char *)(v6 + v3);
    *(float *)&unsigned int v10 = (float)v8 / 255.0;
    *(float *)(v9 + 1638400) = *(float *)&v10;
    LOBYTE(v10) = *(unsigned char *)(v5 + v3);
    result.n128_f32[0] = (float)v10 / 255.0;
    *(_DWORD *)(v9 + 3276800) = result.n128_u32[0];
    v3 += 4;
  }
  while (v3 != 1638400);
  return result;
}

+ (id)_detectorResultsFromSortedResults:(const void *)a3 imageSize:(CGSize)a4 originalImageSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v7 = a4.height;
  double v8 = a4.width;
  unsigned int v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 4)];
  uint64_t v11 = *(void *)a3;
  uint64_t v12 = *((void *)a3 + 1);
  if (*(void *)a3 != v12)
  {
    do
    {
      objc_super v13 = -[CRNormalizedQuad initWithNormalizedBoundingBox:size:]([CRNormalizedQuad alloc], "initWithNormalizedBoundingBox:size:", *(double *)(v11 + 8) / v8, *(double *)(v11 + 16) / v7, *(double *)(v11 + 24) / v8, *(double *)(v11 + 32) / v7, width, height);
      unint64_t v14 = *(void *)(v11 + 40) - 1;
      if (v14 < 7)
      {
        v15 = [[CRFormField alloc] initWithQuad:v13 type:qword_1DD8CE2D0[v14] source:1 value:0 contentType:0 maxCharacterCount:0x7FFFFFFFFFFFFFFFLL];
        [(CRFormField *)v15 setHasBoundedHeight:(*(void *)(v11 + 40) < 8uLL) & (0xC4u >> *(void *)(v11 + 40))];
        [(CRFormField *)v15 setHasBoundedWidth:(*(void *)(v11 + 40) < 8uLL) & (0xDCu >> *(void *)(v11 + 40))];
        [v10 addObject:v15];
      }
      v11 += 48;
    }
    while (v11 != v12);
  }
  return v10;
}

+ (void)_saveDebugImage:(id)a3 byOverlayingResults:(const void *)a4
{
  id v5 = a3;
  __p = 0;
  v34 = 0;
  v35 = 0;
  uint64_t v6 = *(void *)a4;
  uint64_t v7 = *((void *)a4 + 1);
  if (*(void *)a4 != v7)
  {
    do
    {
      uint64_t v8 = *(void *)(v6 + 8);
      double v9 = (double)(unint64_t)[v5 height];
      uint64_t v11 = *(void *)(v6 + 24);
      double v10 = *(double *)(v6 + 32);
      double v12 = v9 - (*(double *)(v6 + 16) + v10);
      objc_super v13 = v34;
      if (v34 >= v35)
      {
        v15 = __p;
        uint64_t v16 = (v34 - __p) >> 5;
        unint64_t v17 = v16 + 1;
        if ((unint64_t)(v16 + 1) >> 59) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v18 = v35 - __p;
        if ((v35 - __p) >> 4 > v17) {
          unint64_t v17 = v18 >> 4;
        }
        if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v19 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v19 = v17;
        }
        if (v19)
        {
          v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGRect>>((uint64_t)&v35, v19);
          v15 = __p;
          objc_super v13 = v34;
        }
        else
        {
          v20 = 0;
        }
        v21 = (double *)&v20[32 * v16];
        *(void *)v21 = v8;
        v21[1] = v12;
        *((void *)v21 + 2) = v11;
        v21[3] = v10;
        if (v13 == v15)
        {
          v24 = &v20[32 * v16];
        }
        else
        {
          v22 = &v20[32 * v16];
          do
          {
            long long v23 = *((_OWORD *)v13 - 1);
            v24 = v22 - 32;
            *((_OWORD *)v22 - 2) = *((_OWORD *)v13 - 2);
            *((_OWORD *)v22 - 1) = v23;
            v13 -= 32;
            v22 -= 32;
          }
          while (v13 != v15);
        }
        unint64_t v14 = (char *)(v21 + 4);
        __p = v24;
        v35 = &v20[32 * v19];
        if (v15) {
          operator delete(v15);
        }
      }
      else
      {
        *(void *)v34 = v8;
        *((double *)v34 + 1) = v12;
        unint64_t v14 = v34 + 32;
        *((void *)v34 + 2) = v11;
        *((double *)v34 + 3) = v10;
      }
      v34 = v14;
      v6 += 48;
    }
    while (v6 != v7);
  }
  v25 = objc_msgSend(v5, "imageByOverlayingRects:count:");
  v26 = [v5 url];
  v27 = [v26 URLByDeletingPathExtension];
  v28 = [v27 lastPathComponent];
  v29 = v28;
  if (v28)
  {
    id v30 = v28;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"null%lu", objc_msgSend(v5, "hash"));
    id v30 = (id)objc_claimAutoreleasedReturnValue();
  }
  v31 = v30;

  v32 = [NSString stringWithFormat:@"/tmp/form_%@_detection.png", v31];
  [v25 writeToFile:v32];

  if (__p) {
    operator delete(__p);
  }
}

- (void)_denormalizeResults:(void *)a3 imageSize:(CGSize *)a4 translation:(CGVector *)a5
{
  uint64_t v8 = [(CRFormDetector *)self configuration];
  int v9 = [v8 resizeInputImage];

  CGSize v10 = *a4;
  if (v9)
  {
    float64x2_t v11 = vdivq_f64((float64x2_t)vdupq_n_s64(0x4084000000000000uLL), (float64x2_t)v10);
  }
  else
  {
    unint64_t width = (unint64_t)v10.width;
    if ((unint64_t)v10.width <= (unint64_t)v10.height) {
      unint64_t width = (unint64_t)v10.height;
    }
    float64x2_t v11 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(640.0 / (double)width), 0);
  }
  uint64_t v13 = *(void *)a3;
  uint64_t v14 = *((void *)a3 + 1);
  if (*(void *)a3 != v14)
  {
    CGVector v15 = *a5;
    do
    {
      *(float64x2_t *)(v13 + 24) = vdivq_f64(*(float64x2_t *)(v13 + 24), v11);
      *(float64x2_t *)(v13 + 8) = vaddq_f64((float64x2_t)v15, vdivq_f64(*(float64x2_t *)(v13 + 8), v11));
      v13 += 48;
    }
    while (v13 != v14);
  }
}

+ (BOOL)validateHorizontalTiles:(const void *)a3 document:(id)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  obuint64_t j = CGRectGetMaxX(*(CGRect *)(*((void *)a3 + 1) - 32));
  double MaxY = CGRectGetMaxY(*(CGRect *)(*((void *)a3 + 1) - 32));
  std::vector<CGRect>::vector(&__p, (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 5);
  uint64_t v7 = *(void *)a3;
  if (*((void *)a3 + 1) != *(void *)a3)
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    do
    {
      CGSize v10 = (CGFloat *)(v7 + v8);
      CGFloat v11 = *v10;
      CGFloat v12 = v10[1];
      CGFloat v13 = v10[2];
      CGFloat v14 = v10[3];
      v84.origin.x = *v10;
      v84.origin.y = v12;
      v84.size.unint64_t width = v13;
      v84.size.double height = v14;
      double MinX = CGRectGetMinX(v84);
      v85.origin.x = v11;
      v85.origin.y = v12;
      v85.size.unint64_t width = v13;
      v85.size.double height = v14;
      double MinY = CGRectGetMinY(v85);
      v86.origin.x = v11;
      v86.origin.y = v12;
      v86.size.unint64_t width = v13;
      v86.size.double height = v14;
      double Width = CGRectGetWidth(v86);
      v87.origin.x = v11;
      v87.origin.y = v12;
      v87.size.unint64_t width = v13;
      v87.size.double height = v14;
      CGFloat Height = CGRectGetHeight(v87);
      unint64_t v19 = (double *)((char *)__p + v8);
      *unint64_t v19 = MinX / obj;
      v19[1] = MinY / MaxY;
      v19[2] = Width / obj;
      v19[3] = Height / MaxY;
      ++v9;
      uint64_t v7 = *(void *)a3;
      v8 += 32;
    }
    while (v9 < (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 5);
  }
  v63 = [v5 contentsWithTypes:8];
  [v5 contentsWithTypes:64];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obja = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = [obja countByEnumeratingWithState:&v74 objects:v82 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v75 != v21) {
          objc_enumerationMutation(obja);
        }
        long long v23 = *(void **)(*((void *)&v74 + 1) + 8 * i);
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        v24 = [v23 colQuads];
        id v25 = v5;
        uint64_t v26 = [v24 countByEnumeratingWithState:&v70 objects:v81 count:16];
        if (v26)
        {
          uint64_t v27 = *(void *)v71;
          while (2)
          {
            for (uint64_t j = 0; j != v26; ++j)
            {
              if (*(void *)v71 != v27) {
                objc_enumerationMutation(v24);
              }
              [*(id *)(*((void *)&v70 + 1) + 8 * j) boundingBox];
              v33 = (char *)__p;
              if (v79 == __p) {
                goto LABEL_41;
              }
              CGFloat v34 = v29;
              CGFloat v35 = v30;
              CGFloat v36 = v31;
              CGFloat v37 = v32;
              uint64_t v38 = 0;
              unint64_t v39 = 1;
              do
              {
                v88.origin.x = v34;
                v88.origin.y = v35;
                v88.size.unint64_t width = v36;
                v88.size.double height = v37;
                BOOL v40 = CGRectContainsRect(*(CGRect *)&v33[v38], v88);
                v33 = (char *)__p;
                char v41 = v39++ >= (v79 - (unsigned char *)__p) >> 5 || v40;
                v38 += 32;
              }
              while ((v41 & 1) == 0);
              if (!v40)
              {
LABEL_41:

                id v5 = v25;
                BOOL v61 = 0;
                id v42 = obja;
                goto LABEL_42;
              }
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v70 objects:v81 count:16];
            if (v26) {
              continue;
            }
            break;
          }
        }

        id v5 = v25;
      }
      uint64_t v20 = [obja countByEnumeratingWithState:&v74 objects:v82 count:16];
    }
    while (v20);
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v42 = v63;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v66 objects:v80 count:16];
  if (v43)
  {
    uint64_t v44 = 0;
    uint64_t v45 = *(void *)v67;
    do
    {
      for (uint64_t k = 0; k != v43; ++k)
      {
        if (*(void *)v67 != v45) {
          objc_enumerationMutation(v42);
        }
        v47 = [*(id *)(*((void *)&v66 + 1) + 8 * k) boundingQuad];
        [v47 boundingBox];
        CGFloat v49 = v48;
        CGFloat v51 = v50;
        CGFloat v53 = v52;
        CGFloat v55 = v54;

        v56 = (char *)__p;
        if (v79 == __p)
        {
          BOOL v59 = 0;
        }
        else
        {
          uint64_t v57 = 0;
          unint64_t v58 = 1;
          do
          {
            v89.origin.x = v49;
            v89.origin.y = v51;
            v89.size.unint64_t width = v53;
            v89.size.double height = v55;
            BOOL v59 = CGRectContainsRect(*(CGRect *)&v56[v57], v89);
            v56 = (char *)__p;
            char v60 = v58++ >= (v79 - (unsigned char *)__p) >> 5 || v59;
            v57 += 32;
          }
          while ((v60 & 1) == 0);
        }
        v44 += !v59;
      }
      uint64_t v43 = [v42 countByEnumeratingWithState:&v66 objects:v80 count:16];
    }
    while (v43);
    BOOL v61 = v44 < 2;
  }
  else
  {
    BOOL v61 = 1;
  }
LABEL_42:

  if (__p)
  {
    v79 = __p;
    operator delete(__p);
  }

  return v61;
}

- (id)detectFormFieldsInImage:(id)a3 document:(id)a4 outputCandidateResults:(id *)a5
{
  uint64_t v233 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v196 = a4;
  int64x2_t v229 = vdupq_n_s64(0x4084000000000000uLL);
  unint64_t v7 = [v6 width];
  unint64_t v8 = [v6 height];
  double v9 = fmax((double)(unint64_t)[v6 width], (double)(unint64_t)objc_msgSend(v6, "height"));
  id v207 = v6;
  __p = 0;
  v227 = 0;
  v228 = 0;
  if (v9 >= 1280.0)
  {
    CGSize v10 = [(CRFormDetector *)self configuration];
    char v11 = [v10 tileInputImage];

    if (v11)
    {
      double v12 = fmin((double)v7, (double)v8);
      CGFloat v13 = objc_msgSend(v207, "imageByScalingToWidth:height:", (unint64_t)(640.0 / v12 * (double)(unint64_t)objc_msgSend(v207, "width")), (unint64_t)(640.0 / v12 * (double)(unint64_t)objc_msgSend(v207, "height")));

      if (v12 == (double)(unint64_t)[v207 height])
      {
        unint64_t v14 = [v13 width];
        unint64_t v15 = [v13 height];
        double v16 = (double)(unint64_t)[v13 height];
        double v17 = fmax((double)v14 * 0.6, (double)v15);
        uint64_t v143 = ((char *)v227 - (unsigned char *)__p) >> 5;
        unint64_t v144 = v143 + 1;
        if ((unint64_t)(v143 + 1) >> 59) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v145 = v228 - (unsigned char *)__p;
        if ((v228 - (unsigned char *)__p) >> 4 > v144) {
          unint64_t v144 = v145 >> 4;
        }
        if ((unint64_t)v145 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v146 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v146 = v144;
        }
        if (v146) {
          v147 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGRect>>((uint64_t)&v228, v146);
        }
        else {
          v147 = 0;
        }
        v153 = &v147[32 * v143];
        *(void *)v153 = 0;
        *((void *)v153 + 1) = 0;
        *((double *)v153 + 2) = v17;
        *((double *)v153 + 3) = v16;
        v154 = (double *)(v153 + 32);
        __p = v153;
        v228 = &v147[32 * v146];
        v227 = v154;
        double v155 = (double)(unint64_t)[v13 width] - v17;
        double v156 = (double)(unint64_t)[v13 height];
        v157 = v154;
        if (v154 >= (double *)v228)
        {
          v159 = (double *)__p;
          uint64_t v160 = ((char *)v227 - (unsigned char *)__p) >> 5;
          unint64_t v161 = v160 + 1;
          if ((unint64_t)(v160 + 1) >> 59) {
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v162 = v228 - (unsigned char *)__p;
          if ((v228 - (unsigned char *)__p) >> 4 > v161) {
            unint64_t v161 = v162 >> 4;
          }
          if ((unint64_t)v162 >= 0x7FFFFFFFFFFFFFE0) {
            unint64_t v163 = 0x7FFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v163 = v161;
          }
          if (v163)
          {
            v164 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGRect>>((uint64_t)&v228, v163);
            v159 = (double *)__p;
            v157 = v227;
          }
          else
          {
            v164 = 0;
          }
          v165 = &v164[32 * v160];
          *(double *)v165 = v155;
          *((void *)v165 + 1) = 0;
          v166 = &v164[32 * v163];
          *((double *)v165 + 2) = v17;
          *((double *)v165 + 3) = v156;
          v158 = (double *)(v165 + 32);
          if (v157 == v159)
          {
            v168 = v165;
          }
          else
          {
            do
            {
              long long v167 = *((_OWORD *)v157 - 1);
              v168 = v165 - 32;
              *((_OWORD *)v165 - 2) = *((_OWORD *)v157 - 2);
              *((_OWORD *)v165 - 1) = v167;
              v157 -= 4;
              v165 -= 32;
            }
            while (v157 != v159);
          }
          __p = v168;
          v227 = v158;
          v228 = v166;
          if (v159) {
            operator delete(v159);
          }
        }
        else
        {
          double *v227 = v155;
          v154[1] = 0.0;
          v158 = v154 + 4;
          v157[2] = v17;
          v157[3] = v156;
        }
        v227 = v158;
        if ([(id)objc_opt_class() validateHorizontalTiles:&__p document:v196])
        {
          uint64_t v26 = v227;
          goto LABEL_15;
        }
        v227 = (double *)__p;
        double v169 = (double)(unint64_t)[v13 width];
        double v170 = (double)(unint64_t)[v13 height];
        v171 = v227;
        if (v227 < (double *)v228)
        {
          double *v227 = 0.0;
          v171[1] = 0.0;
          uint64_t v26 = v171 + 4;
          v171[2] = v169;
          v171[3] = v170;
LABEL_214:
          v227 = v26;
          goto LABEL_15;
        }
        v172 = (double *)__p;
        uint64_t v173 = ((char *)v227 - (unsigned char *)__p) >> 5;
        unint64_t v174 = v173 + 1;
        if ((unint64_t)(v173 + 1) >> 59) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v175 = v228 - (unsigned char *)__p;
        if ((v228 - (unsigned char *)__p) >> 4 > v174) {
          unint64_t v174 = v175 >> 4;
        }
        if ((unint64_t)v175 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v176 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v176 = v174;
        }
        if (v176)
        {
          v177 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGRect>>((uint64_t)&v228, v176);
          v172 = (double *)__p;
          v171 = v227;
        }
        else
        {
          v177 = 0;
        }
        v188 = &v177[32 * v173];
        *(void *)v188 = 0;
        *((void *)v188 + 1) = 0;
        v189 = &v177[32 * v176];
        *((double *)v188 + 2) = v169;
        *((double *)v188 + 3) = v170;
        uint64_t v26 = (double *)(v188 + 32);
        if (v171 != v172)
        {
          do
          {
            long long v192 = *((_OWORD *)v171 - 1);
            v191 = v188 - 32;
            *((_OWORD *)v188 - 2) = *((_OWORD *)v171 - 2);
            *((_OWORD *)v188 - 1) = v192;
            v171 -= 4;
            v188 -= 32;
          }
          while (v171 != v172);
          goto LABEL_212;
        }
      }
      else
      {
        unint64_t v139 = [v13 height];
        unint64_t v140 = [v13 width];
        double v141 = (double)(unint64_t)[v13 width];
        double v142 = fmax((double)v139 * 0.6, (double)v140);
        uint64_t v148 = ((char *)v227 - (unsigned char *)__p) >> 5;
        unint64_t v149 = v148 + 1;
        if ((unint64_t)(v148 + 1) >> 59) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v150 = v228 - (unsigned char *)__p;
        if ((v228 - (unsigned char *)__p) >> 4 > v149) {
          unint64_t v149 = v150 >> 4;
        }
        if ((unint64_t)v150 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v151 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v151 = v149;
        }
        if (v151) {
          v152 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGRect>>((uint64_t)&v228, v151);
        }
        else {
          v152 = 0;
        }
        v178 = &v152[32 * v148];
        *(void *)v178 = 0;
        *((void *)v178 + 1) = 0;
        *((double *)v178 + 2) = v141;
        *((double *)v178 + 3) = v142;
        v179 = (double *)(v178 + 32);
        __p = v178;
        v228 = &v152[32 * v151];
        v227 = v179;
        double v180 = (double)(unint64_t)[v13 height] - v142;
        double v181 = (double)(unint64_t)[v13 width];
        v182 = v179;
        if (v179 < (double *)v228)
        {
          double *v227 = 0.0;
          v179[1] = v180;
          v179[2] = v181;
          uint64_t v26 = v179 + 4;
          v179[3] = v142;
          goto LABEL_214;
        }
        v172 = (double *)__p;
        uint64_t v183 = ((char *)v227 - (unsigned char *)__p) >> 5;
        unint64_t v184 = v183 + 1;
        if ((unint64_t)(v183 + 1) >> 59) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v185 = v228 - (unsigned char *)__p;
        if ((v228 - (unsigned char *)__p) >> 4 > v184) {
          unint64_t v184 = v185 >> 4;
        }
        if ((unint64_t)v185 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v186 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v186 = v184;
        }
        if (v186)
        {
          v187 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGRect>>((uint64_t)&v228, v186);
          v172 = (double *)__p;
          v182 = v227;
        }
        else
        {
          v187 = 0;
        }
        v188 = &v187[32 * v183];
        *(void *)v188 = 0;
        v189 = &v187[32 * v186];
        *((double *)v188 + 1) = v180;
        *((double *)v188 + 2) = v181;
        *((double *)v188 + 3) = v142;
        uint64_t v26 = (double *)(v188 + 32);
        if (v182 != v172)
        {
          do
          {
            long long v190 = *((_OWORD *)v182 - 1);
            v191 = v188 - 32;
            *((_OWORD *)v188 - 2) = *((_OWORD *)v182 - 2);
            *((_OWORD *)v188 - 1) = v190;
            v182 -= 4;
            v188 -= 32;
          }
          while (v182 != v172);
LABEL_212:
          __p = v191;
          v227 = v26;
          v228 = v189;
          if (v172) {
            operator delete(v172);
          }
          goto LABEL_214;
        }
      }
      v191 = v188;
      goto LABEL_212;
    }
  }
  double v18 = (double)(unint64_t)[v207 width];
  double v19 = (double)(unint64_t)[v207 height];
  uint64_t v20 = ((char *)v227 - (unsigned char *)__p) >> 5;
  unint64_t v21 = v20 + 1;
  if ((unint64_t)(v20 + 1) >> 59) {
    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v22 = v228 - (unsigned char *)__p;
  if ((v228 - (unsigned char *)__p) >> 4 > v21) {
    unint64_t v21 = v22 >> 4;
  }
  if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFE0) {
    unint64_t v23 = 0x7FFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v23 = v21;
  }
  if (v23) {
    v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGRect>>((uint64_t)&v228, v23);
  }
  else {
    v24 = 0;
  }
  id v25 = (double *)&v24[32 * v20];
  double *v25 = 0.0;
  v25[1] = 0.0;
  v25[2] = v18;
  v25[3] = v19;
  uint64_t v26 = v25 + 4;
  __p = v25;
  v228 = &v24[32 * v23];
  v227 = v25 + 4;
  CGFloat v13 = v207;
LABEL_15:
  v224[0] = 0;
  v224[1] = 0;
  uint64_t v225 = 0;
  v222[0] = 0;
  v222[1] = 0;
  uint64_t v223 = 0;
  uint64_t v27 = (char *)v26 - (unsigned char *)__p;
  v195 = v13;
  if (v26 == __p)
  {
    v206 = 0;
  }
  else
  {
    if (v27 < 0) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    v206 = (double *)operator new((unint64_t)v27 >> 1);
    bzero(v206, (unint64_t)v27 >> 1);
  }
  v208 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v27 >> 5];
  v28 = (char *)__p;
  if (v227 == __p)
  {
LABEL_31:
    uint64_t v45 = objc_alloc_init(MEMORY[0x1E4F1E9E0]);
    v209 = v45;
    v46 = [(CRFormDetector *)self model];
    id v221 = 0;
    v203 = [v46 predictionsFromInputs:v208 options:v45 error:&v221];
    id v32 = v221;

    if (v32)
    {
      v47 = CROSLogForCategory(0);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
      {
        id v48 = [v32 description];
        uint64_t v49 = [v48 UTF8String];
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = v49;
        _os_log_impl(&dword_1DD733000, v47, OS_LOG_TYPE_FAULT, "Form detection inference error: %s", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v50 = [v203 count];
      if (v50 == ((char *)v227 - (unsigned char *)__p) >> 5)
      {
        if (v227 != __p)
        {
          v202 = 0;
          uint64_t v52 = 0;
          *(void *)&long long v51 = 134218240;
          long long v193 = v51;
          while (1)
          {
            uint64_t v204 = v52;
            v199 = [v203 objectAtIndexedSubscript:v193];
            id v205 = [v199 boundingBoxes];
            id v200 = [v199 classLogits];
            id v201 = [v199 anchors];
            CGFloat v53 = [v205 shape];
            double v54 = [v53 objectAtIndexedSubscript:1];
            unint64_t v55 = [v54 unsignedIntegerValue];

            id v56 = v201;
            uint64_t v57 = (float *)[v56 dataPointer];
            id v58 = v205;
            BOOL v59 = (float *)[v58 dataPointer];
            id v198 = v200;
            char v60 = (float *)[v198 dataPointer];
            v219[0] = 0;
            v219[1] = 0;
            uint64_t v220 = 0;
            id v197 = v58;
            BOOL v61 = v56;
            v217[0] = 0;
            v217[1] = 0;
            uint64_t v218 = 0;
            if (v55)
            {
              uint64_t v63 = 0;
              BOOL v64 = 1;
              while (1)
              {
                uint64_t v65 = 0;
                float v67 = *v57;
                float v66 = v57[1];
                float v68 = v57[2];
                float v69 = v57[3];
                float v214 = *v59;
                float v215 = *v57 + v68;
                float v213 = v59[1];
                float v70 = v59[2] / 5.0;
                float v71 = (float)(v59[3] / 5.0) <= 4.1352 ? v59[3] / 5.0 : 4.1352;
                double v72 = *v60 + -0.592243;
                float v73 = v72;
                for (uint64_t i = 1; i != 9; ++i)
                {
                  if (v60[i] > v73)
                  {
                    uint64_t v65 = i;
                    float v73 = v60[i];
                  }
                }
                if (v70 > 4.1352) {
                  float v70 = 4.1352;
                }
                float v212 = expf(v70);
                float v75 = v68 - v67;
                float v211 = expf(v71);
                *(void *)&long long v216 = v65;
                double v76 = exp(v72 - v73);
                uint64_t v77 = 0;
                double v78 = 0.0;
                do
                {
                  if (v65 != v77)
                  {
                    if (v77) {
                      double v78 = v78 + expf(v60[v77] - v73);
                    }
                    else {
                      double v78 = v76 + v78;
                    }
                  }
                  ++v77;
                }
                while (v77 != 9);
                float v79 = v66 + v69;
                float v80 = v66;
                float v81 = (float)(v215 * 0.5) + (float)((float)(v214 / 10.0) * v75);
                float v82 = v75 * v212;
                float v83 = (float)(v79 * 0.5) + (float)((float)(v213 / 10.0) * (float)(v69 - v80));
                float v84 = (float)(v69 - v80) * v211;
                float v85 = log1p(v78) + v73;
                float v86 = v73 - v85;
                float v230 = v73 - v85;
                if (v65)
                {
                  double v87 = (float)(v81 - (float)(v82 * 0.5));
                  double v88 = (float)(v83 - (float)(v84 * 0.5));
                  double v89 = v82;
                  *(double *)buf = v87;
                  *(double *)&buf[8] = v88;
                  double v90 = v84;
                  *(double *)&buf[16] = v82;
                  double v232 = v90;
                  BOOL v91 = v65 == 8;
                  BOOL v92 = v86 > 2.709313;
                  BOOL v93 = v91 && v92;
                  BOOL v117 = !v91 || !v92;
                  uint64_t v94 = 8;
                  if (v117) {
                    uint64_t v94 = v65;
                  }
                }
                else
                {
                  BOOL v93 = 0;
                  double v87 = (float)(v81 - (float)(v82 * 0.5));
                  double v88 = (float)(v83 - (float)(v84 * 0.5));
                  double v89 = v82;
                  double v90 = v84;
                  uint64_t v94 = 2;
                }
                *(void *)&long long v216 = v94;
                *(double *)buf = v87;
                *(double *)&buf[8] = v88;
                *(double *)&buf[16] = v89;
                double v232 = v90;
                if (v93) {
                  break;
                }
                v57 += 4;
                v59 += 4;
                v60 += 9;
                BOOL v64 = ++v63 < v55;
                uint64_t v45 = v209;
                if (v63 == v55) {
                  goto LABEL_61;
                }
              }
              v114 = CROSLogForCategory(6);
              uint64_t v45 = v209;
              if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v116 = *((void *)v219[1] - 3);
                uint64_t v115 = *((void *)v219[1] - 2);
                *(_DWORD *)buf = v193;
                *(void *)&buf[4] = v116;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = v115;
                _os_log_impl(&dword_1DD733000, v114, OS_LOG_TYPE_DEBUG, "Gating form detection result with rejection box found with size %.2f x %.2f", buf, 0x16u);
              }

              CGFloat v13 = v195;
              v109 = v197;
              v110 = v198;
              v202 = MEMORY[0x1E4F1CBF0];
            }
            else
            {
LABEL_61:
              v95 = v219[0];
              v96 = (__n128 *)v219[1];
              unint64_t v97 = 0xAAAAAAAAAAAAAAABLL * (((char *)v219[1] - (char *)v219[0]) >> 4);
              if ((char *)v219[1] - (char *)v219[0] <= 6144)
              {
                CGFloat v13 = v195;
                uint64_t v102 = v204;
              }
              else
              {
                CGFloat v13 = v195;
                uint64_t v102 = v204;
                if (v98) {
                  operator delete(v98);
                }
              }
              v103 = v217[0];
              v104 = (__n128 *)v217[1];
              unint64_t v105 = 0xAAAAAAAAAAAAAAABLL * (((char *)v217[1] - (char *)v217[0]) >> 4);
              if ((char *)v217[1] - (char *)v217[0] <= 6144)
              {
                v109 = v197;
              }
              else
              {
                v109 = v197;
                if (v106) {
                  operator delete(v106);
                }
              }
              v110 = v198;
              if (v219[0] == v219[1])
              {
                unint64_t v113 = 0;
              }
              else
              {
                unint64_t v111 = 0;
                v112 = (float *)((char *)v219[0] + 48);
                do
                {
                  unint64_t v113 = v111 + 1;
                  if (*(v112 - 12) < -11.902) {
                    break;
                  }
                  if (v111 > 0x2BA) {
                    break;
                  }
                  ++v111;
                  BOOL v117 = v112 == v219[1];
                  v112 += 12;
                }
                while (!v117);
              }
              BOOL v117 = v113 >= 0xAAAAAAAAAAAAAAABLL * (((char *)v219[1] - (char *)v219[0]) >> 4)
                  || (char *)v219[0] + 48 * v113 == v219[1];
              if (!v117) {
                v219[1] = (char *)v219[0] + 48 * v113;
              }
              if (0xAAAAAAAAAAAAAAABLL * (((char *)v217[1] - (char *)v217[0]) >> 4) >= 0x2BD
                && (char *)v217[0] + 33600 != v217[1])
              {
                v217[1] = (char *)v217[0] + 33600;
              }
              if (v219[0])
              {
                v219[1] = v219[0];
                operator delete(v219[0]);
              }
              *(_OWORD *)v219 = *(_OWORD *)buf;
              uint64_t v220 = *(void *)&buf[16];
              if (v217[0])
              {
                v217[1] = v217[0];
                operator delete(v217[0]);
              }
              *(_OWORD *)v217 = *(_OWORD *)buf;
              uint64_t v218 = *(void *)&buf[16];
              *(_OWORD *)buf = *(_OWORD *)&v206[2 * v102];
              long long v216 = 0uLL;
              long long v216 = *((_OWORD *)__p + 2 * v102);
              [(CRFormDetector *)self _denormalizeResults:v219 imageSize:buf translation:&v216];
              CRLogger = CRLogger::getCRLogger((CRLogger *)[(CRFormDetector *)self _denormalizeResults:v217 imageSize:buf translation:&v216]);
              if (*CRLogger && (CRLogger[8] & 0x10) != 0)
              {
                v120 = [v207 url];
                [v13 setUrl:v120];

                [(id)objc_opt_class() _saveDebugImage:v13 byOverlayingResults:v219];
              }
              BOOL v64 = 0;
            }
            if (v217[0])
            {
              v217[1] = v217[0];
              operator delete(v217[0]);
            }
            if (v219[0])
            {
              v219[1] = v219[0];
              operator delete(v219[0]);
            }

            if (v64) {
              goto LABEL_133;
            }
            uint64_t v52 = v204 + 1;
            if (v204 + 1 >= (unint64_t)(((char *)v227 - (unsigned char *)__p) >> 5))
            {
              if ((unint64_t)((char *)v227 - (unsigned char *)__p) >= 0x21)
              {
                unint64_t v121 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)v224[1] - (char *)v224[0]) >> 4));
                if (v224[1] == v224[0]) {
                  uint64_t v122 = 0;
                }
                else {
                  uint64_t v122 = v121;
                }
                unint64_t v123 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)v222[1] - (char *)v222[0]) >> 4));
                if (v222[1] == v222[0]) {
                  uint64_t v124 = 0;
                }
                else {
                  uint64_t v124 = v123;
                }
              }
              break;
            }
          }
        }
        if (0xAAAAAAAAAAAAAAABLL * (((char *)v222[1] - (char *)v222[0]) >> 4) >= 0x12D
          && (char *)v222[0] + 14400 != v222[1])
        {
          v222[1] = (char *)v222[0] + 14400;
        }
        if (v224[0])
        {
          v224[1] = v224[0];
          operator delete(v224[0]);
        }
        *(_OWORD *)v224 = *(_OWORD *)buf;
        uint64_t v225 = *(void *)&buf[16];
        v125 = (CRLogger *)v222[0];
        if (v222[0])
        {
          v222[1] = v222[0];
          operator delete(v222[0]);
        }
        *(_OWORD *)v222 = *(_OWORD *)buf;
        uint64_t v223 = *(void *)&buf[16];
        v126 = CRLogger::getCRLogger(v125);
        if (*v126 && (v126[8] & 0x10) != 0)
        {
          v127 = [v207 url];
          [v13 setUrl:v127];

          [(id)objc_opt_class() _saveDebugImage:v13 byOverlayingResults:v224];
        }
        unint64_t v128 = [v207 width];
        unint64_t v129 = [v207 height];
        unint64_t v130 = [v13 width];
        unint64_t v131 = [v13 height];
        double v132 = (double)v128;
        v133 = objc_msgSend((id)objc_opt_class(), "_detectorResultsFromSortedResults:imageSize:originalImageSize:", v224, (double)v130, (double)v131, (double)v128, (double)v129);
        if (a5)
        {
          objc_msgSend((id)objc_opt_class(), "_detectorResultsFromSortedResults:imageSize:originalImageSize:", v222, (double)v130, (double)v131, v132, (double)v129);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        v47 = v133;
        v202 = v47;
LABEL_132:

LABEL_133:
        goto LABEL_134;
      }
      v47 = CROSLogForCategory(0);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
      {
        v136 = __p;
        v135 = v227;
        uint64_t v137 = [v203 count];
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = ((char *)v135 - v136) >> 5;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v137;
        _os_log_impl(&dword_1DD733000, v47, OS_LOG_TYPE_FAULT, "Form detection inference error, expected %ld outputs, got %ld.", buf, 0x16u);
      }
    }
    v202 = 0;
    goto LABEL_132;
  }
  uint64_t v29 = 0;
  unint64_t v30 = 0;
  double v31 = v206 + 1;
  while (1)
  {
    objc_msgSend(v13, "imageByCroppingRectangle:", *(double *)&v28[v29], *(double *)&v28[v29 + 8], *(double *)&v28[v29 + 16], *(double *)&v28[v29 + 24]);
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v33 = [v32 width];
    unint64_t v34 = [v32 height];
    *(v31 - 1) = (double)v33;
    double *v31 = (double)v34;
    CGFloat v35 = [(CRFormDetector *)self configuration];
    int v36 = [v35 resizeInputImage];

    if (v36)
    {
      unint64_t v37 = [v32 width];
      unint64_t v38 = [v32 height];
      unint64_t v39 = v38 >= v37 ? v37 : v38;
    }
    else
    {
      unint64_t v40 = [v32 width];
      unint64_t v41 = [v32 height];
      unint64_t v39 = v40 <= v41 ? v41 : v40;
    }
    id v42 = (__CVBuffer *)objc_msgSend(v32, "pixelBufferWithScale:paddedToSize:", 640.0 / (double)v39, 640.0, 640.0);
    if (!v42) {
      break;
    }
    uint64_t v43 = [(id)objc_opt_class() _multiArrayFromPixelBuffer:v42];
    CVPixelBufferRelease(v42);
    if (!v43)
    {

      v202 = 0;
      v134 = v206;
      goto LABEL_135;
    }
    uint64_t v44 = [[CRFormDetectorModelInput alloc] initWithMLMultiArray:v43];
    [v208 addObject:v44];

    ++v30;
    v28 = (char *)__p;
    v31 += 2;
    v29 += 32;
    if (v30 >= ((char *)v227 - (unsigned char *)__p) >> 5) {
      goto LABEL_31;
    }
  }
  uint64_t v45 = CROSLogForCategory(0);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD733000, v45, OS_LOG_TYPE_FAULT, "Error while creating buffer for form detection.", buf, 2u);
  }
  v202 = 0;
LABEL_134:

  v134 = v206;
  if (v206) {
LABEL_135:
  }
    operator delete(v134);
  if (v222[0])
  {
    v222[1] = v222[0];
    operator delete(v222[0]);
  }
  if (v224[0])
  {
    v224[1] = v224[0];
    operator delete(v224[0]);
  }
  if (__p)
  {
    v227 = (double *)__p;
    operator delete(__p);
  }

  return v202;
}

- (CRFormAnalyzerConfiguration)configuration
{
  return (CRFormAnalyzerConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (CRFormDetectorModel)model
{
  return (CRFormDetectorModel *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (__n128)detectFormFieldsInImage:(unint64_t)a3 document:(__n128 *)a4 outputCandidateResults:(uint64_t)a5
{
  if (a3 >= 2)
  {
    uint64_t v7 = a1;
    if (a3 == 2)
    {
      unint64_t v8 = a2 - 3;
      result.n128_u32[0] = a2[-3].n128_u32[0];
      if (result.n128_f32[0] > *(float *)a1)
      {
        result = *(__n128 *)a1;
        __n128 v9 = *(__n128 *)(a1 + 16);
        __n128 v10 = *(__n128 *)(a1 + 32);
        __n128 v12 = a2[-2];
        __n128 v11 = a2[-1];
        *(__n128 *)a1 = *v8;
        *(__n128 *)(a1 + 16) = v12;
        *(__n128 *)(a1 + 32) = v11;
        a2[-2] = v9;
        a2[-1] = v10;
        __n128 *v8 = result;
      }
    }
    else if ((uint64_t)a3 > 128)
    {
      unint64_t v23 = a4;
      unint64_t v24 = a3 >> 1;
      id v25 = (__n128 *)(a1 + 48 * (a3 >> 1));
      unint64_t v26 = a3 >> 1;
      if ((uint64_t)a3 <= a5)
      {
        __n128 v27 = std::__stable_sort_move<std::_ClassicAlgPolicy,[(CRFormDetector *)(__n128 *)a1 detectFormFieldsInImage:v26 document:a4 outputCandidateResults:result];
        v28 = &v23[3 * v24];
        result.n128_u64[0] = std::__stable_sort_move<std::_ClassicAlgPolicy,[(CRFormDetector *)(__n128 *)(v7 + 48 * (a3 >> 1)) detectFormFieldsInImage:a3 - (a3 >> 1) document:v28 outputCandidateResults:v27].n128_u64[0];
        uint64_t v29 = &v23[3 * a3];
        unint64_t v30 = v28;
        while (v30 != v29)
        {
          if (v30->n128_f32[0] <= v23->n128_f32[0])
          {
            result = *v23;
            __n128 v32 = v23[2];
            *(__n128 *)(v7 + 16) = v23[1];
            *(__n128 *)(v7 + 32) = v32;
            *(__n128 *)uint64_t v7 = result;
            v23 += 3;
          }
          else
          {
            result = *v30;
            __n128 v31 = v30[2];
            *(__n128 *)(v7 + 16) = v30[1];
            *(__n128 *)(v7 + 32) = v31;
            *(__n128 *)uint64_t v7 = result;
            v30 += 3;
          }
          v7 += 48;
          if (v23 == v28)
          {
            if (v30 != v29)
            {
              uint64_t v33 = 0;
              do
              {
                unint64_t v34 = (__n128 *)(v7 + v33 * 16);
                result = v30[v33];
                __n128 v35 = v30[v33 + 2];
                v34[1] = v30[v33 + 1];
                v34[2] = v35;
                __n128 *v34 = result;
                v33 += 3;
              }
              while (&v30[v33] != v29);
            }
            return result;
          }
        }
        if (v23 != v28)
        {
          uint64_t v36 = 0;
          do
          {
            unint64_t v37 = (__n128 *)(v7 + v36 * 16);
            result = v23[v36];
            __n128 v38 = v23[v36 + 2];
            v37[1] = v23[v36 + 1];
            v37[2] = v38;
            *unint64_t v37 = result;
            v36 += 3;
          }
          while (&v23[v36] != v28);
        }
      }
      else
      {
        std::__stable_sort<std::_ClassicAlgPolicy,[(CRFormDetector *)a1 detectFormFieldsInImage:v26 document:a4 outputCandidateResults:a5];
        std::__stable_sort<std::_ClassicAlgPolicy,[(CRFormDetector *)v7 + 48 * (a3 >> 1) detectFormFieldsInImage:a3 - (a3 >> 1) document:v23 outputCandidateResults:a5];
      }
    }
    else if ((__n128 *)a1 != a2)
    {
      unint64_t v14 = (unsigned __int32 *)(a1 + 48);
      if ((__n128 *)(a1 + 48) != a2)
      {
        uint64_t v15 = 0;
        uint64_t v16 = a1;
        do
        {
          double v17 = (__n128 *)v14;
          result.n128_u32[0] = *v14;
          if (*(float *)v14 > *(float *)v16)
          {
            long long v39 = *(_OWORD *)(v16 + 52);
            *(_OWORD *)unint64_t v40 = *(_OWORD *)(v16 + 68);
            *(_OWORD *)&v40[12] = *(_OWORD *)(v16 + 80);
            uint64_t v18 = v15;
            while (1)
            {
              double v19 = (float *)(a1 + v18);
              long long v20 = *(_OWORD *)(a1 + v18 + 16);
              *((_OWORD *)v19 + 3) = *(_OWORD *)(a1 + v18);
              *((_OWORD *)v19 + 4) = v20;
              *((_OWORD *)v19 + 5) = *(_OWORD *)(a1 + v18 + 32);
              if (!v18) {
                break;
              }
              v18 -= 48;
              if (result.n128_f32[0] <= *(v19 - 12))
              {
                uint64_t v21 = a1 + v18 + 48;
                goto LABEL_15;
              }
            }
            uint64_t v21 = a1;
LABEL_15:
            *(_DWORD *)uint64_t v21 = result.n128_u32[0];
            *(_OWORD *)(v21 + 4) = v39;
            *(_OWORD *)(v21 + 20) = *(_OWORD *)v40;
            result = *(__n128 *)&v40[12];
            *(_OWORD *)(v21 + 32) = *(_OWORD *)&v40[12];
          }
          unint64_t v14 = (unsigned __int32 *)&v17[3];
          v15 += 48;
          uint64_t v16 = (uint64_t)v17;
        }
        while (&v17[3] != a2);
      }
    }
  }
  return result;
}

- (__n128)detectFormFieldsInImage:(unint64_t)a3 document:(__n128 *)a4 outputCandidateResults:(__n128)result
{
  if (a3)
  {
    id v5 = a4;
    unint64_t v8 = a1;
    if (a3 == 2)
    {
      __n128 v10 = a2 - 3;
      if (a2[-3].n128_f32[0] <= a1->n128_f32[0])
      {
        __n128 v26 = *a1;
        __n128 v27 = a1[2];
        a4[1] = a1[1];
        a4[2] = v27;
        *a4 = v26;
        result = *v10;
        __n128 v13 = a2[-2];
        __n128 v14 = a2[-1];
      }
      else
      {
        __n128 v11 = *v10;
        __n128 v12 = a2[-1];
        a4[1] = a2[-2];
        a4[2] = v12;
        *a4 = v11;
        result = *a1;
        __n128 v13 = a1[1];
        __n128 v14 = a1[2];
      }
      a4[4] = v13;
      a4[5] = v14;
      a4[3] = result;
    }
    else if (a3 == 1)
    {
      result = *a1;
      __n128 v9 = a1[2];
      a4[1] = a1[1];
      a4[2] = v9;
      *a4 = result;
    }
    else if ((uint64_t)a3 > 8)
    {
      v28 = &a1[3 * (a3 >> 1)];
      std::__stable_sort<std::_ClassicAlgPolicy,[(CRFormDetector *)a1 detectFormFieldsInImage:a3 >> 1 document:a4 outputCandidateResults:a3 >> 1];
      std::__stable_sort<std::_ClassicAlgPolicy,[(CRFormDetector *)&v8[3 * (a3 >> 1)] detectFormFieldsInImage:a3 - (a3 >> 1) document:&v5[3 * (a3 >> 1)] outputCandidateResults:a3 - (a3 >> 1)];
      uint64_t v29 = &v8[3 * (a3 >> 1)];
      while (v29 != a2)
      {
        if (v29->n128_f32[0] <= v8->n128_f32[0])
        {
          result = *v8;
          __n128 v31 = v8[2];
          v5[1] = v8[1];
          v5[2] = v31;
          *id v5 = result;
          v8 += 3;
        }
        else
        {
          result = *v29;
          __n128 v30 = v29[2];
          v5[1] = v29[1];
          v5[2] = v30;
          *id v5 = result;
          v29 += 3;
        }
        v5 += 3;
        if (v8 == v28)
        {
          if (v29 != a2)
          {
            uint64_t v32 = 0;
            do
            {
              uint64_t v33 = &v5[v32];
              result = v29[v32];
              __n128 v34 = v29[v32 + 2];
              v33[1] = v29[v32 + 1];
              v33[2] = v34;
              __n128 *v33 = result;
              v32 += 3;
            }
            while (&v29[v32] != a2);
          }
          return result;
        }
      }
      if (v8 != v28)
      {
        uint64_t v35 = 0;
        do
        {
          uint64_t v36 = &v5[v35];
          result = v8[v35];
          __n128 v37 = v8[v35 + 2];
          v36[1] = v8[v35 + 1];
          v36[2] = v37;
          *uint64_t v36 = result;
          v35 += 3;
        }
        while (&v8[v35] != v28);
      }
    }
    else if (a1 != a2)
    {
      result = *a1;
      __n128 v15 = a1[2];
      a4[1] = a1[1];
      a4[2] = v15;
      *a4 = result;
      uint64_t v16 = a1 + 3;
      if (&a1[3] != a2)
      {
        uint64_t v17 = 0;
        uint64_t v18 = a4;
        do
        {
          double v19 = v18;
          float v20 = v18->n128_f32[0];
          v18 += 3;
          uint64_t v21 = v18;
          if (v16->n128_f32[0] > v20)
          {
            __n128 v22 = v19[1];
            *uint64_t v18 = *v19;
            v18[1] = v22;
            v18[2] = v19[2];
            uint64_t v21 = a4;
            if (v19 != a4)
            {
              uint64_t v23 = v17;
              while (1)
              {
                uint64_t v21 = (__n128 *)((char *)a4 + v23);
                if (v16->n128_f32[0] <= *(float *)((char *)a4[-3].n128_f32 + v23)) {
                  break;
                }
                __n128 v24 = *(__n128 *)((char *)a4 + v23 - 32);
                __n128 *v21 = *(__n128 *)((char *)a4 + v23 - 48);
                v21[1] = v24;
                v21[2] = *(__n128 *)((char *)a4 + v23 - 16);
                v23 -= 48;
                if (!v23)
                {
                  uint64_t v21 = a4;
                  break;
                }
              }
            }
          }
          result = *v16;
          __n128 v25 = v16[2];
          v21[1] = v16[1];
          v21[2] = v25;
          __n128 *v21 = result;
          v16 += 3;
          v17 += 48;
        }
        while (v16 != a2);
      }
    }
  }
  return result;
}

- (char)detectFormFieldsInImage:(char *)a3 document:(uint64_t)a4 outputCandidateResults:(uint64_t)a5
{
  if (a5)
  {
    uint64_t v9 = a5;
    __n128 v11 = result;
    while (a4 > a7 && v9 > a7)
    {
      if (!a4) {
        return result;
      }
      uint64_t v12 = 0;
      uint64_t v13 = -a4;
      while (*(float *)a2 <= *(float *)&v11[v12])
      {
        v12 += 48;
        if (__CFADD__(v13++, 1)) {
          return result;
        }
      }
      uint64_t v15 = -v13;
      float v67 = a3;
      __src = a6;
      uint64_t v66 = a7;
      if (-v13 >= v9)
      {
        if (v13 == -1)
        {
          BOOL v59 = &v11[v12];
          long long v70 = *(_OWORD *)&v11[v12 + 16];
          long long v71 = *(_OWORD *)&v11[v12 + 32];
          long long v69 = *(_OWORD *)&v11[v12];
          long long v60 = *(_OWORD *)a2;
          long long v61 = *((_OWORD *)a2 + 2);
          *((_OWORD *)v59 + 1) = *((_OWORD *)a2 + 1);
          *((_OWORD *)v59 + 2) = v61;
          *(_OWORD *)BOOL v59 = v60;
          *(_OWORD *)a2 = v69;
          *((_OWORD *)a2 + 1) = v70;
          *((_OWORD *)a2 + 2) = v71;
          return result;
        }
        if (v13 > 0) {
          uint64_t v15 = 1 - v13;
        }
        uint64_t v25 = v15 >> 1;
        double v19 = &v11[48 * (v15 >> 1) + v12];
        uint64_t v18 = a2;
        if (a2 != a3)
        {
          unint64_t v26 = 0xAAAAAAAAAAAAAAABLL * ((a3 - a2) >> 4);
          uint64_t v18 = a2;
          do
          {
            unint64_t v27 = v26 >> 1;
            v28 = (float *)&v18[48 * (v26 >> 1)];
            float v30 = *v28;
            uint64_t v29 = (char *)(v28 + 12);
            v26 += ~(v26 >> 1);
            if (v30 > *(float *)v19) {
              uint64_t v18 = v29;
            }
            else {
              unint64_t v26 = v27;
            }
          }
          while (v26);
        }
        uint64_t v17 = 0xAAAAAAAAAAAAAAABLL * ((v18 - a2) >> 4);
      }
      else
      {
        if (v9 >= 0) {
          uint64_t v16 = v9;
        }
        else {
          uint64_t v16 = v9 + 1;
        }
        uint64_t v17 = v16 >> 1;
        uint64_t v18 = &a2[48 * (v16 >> 1)];
        double v19 = a2;
        if (a2 - v11 != v12)
        {
          unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((a2 - v11 - v12) >> 4);
          double v19 = &v11[v12];
          do
          {
            unint64_t v21 = v20 >> 1;
            __n128 v22 = (float *)&v19[48 * (v20 >> 1)];
            float v24 = *v22;
            uint64_t v23 = (char *)(v22 + 12);
            v20 += ~(v20 >> 1);
            if (*(float *)v18 > v24) {
              unint64_t v20 = v21;
            }
            else {
              double v19 = v23;
            }
          }
          while (v20);
        }
        uint64_t v25 = 0xAAAAAAAAAAAAAAABLL * ((v19 - v11 - v12) >> 4);
      }
      a4 = -v25 - v13;
      uint64_t v31 = v9 - v17;
      uint64_t v32 = v25;
      uint64_t v34 = v32;
      uint64_t v35 = v33;
      if (v34 + v17 >= v9 - (v34 + v17) - v13)
      {
        uint64_t v38 = v34;
        a2 = v19;
        a7 = v66;
        uint64_t v31 = v17;
        a6 = __src;
        a4 = v38;
        a3 = v35;
        v11 += v12;
      }
      else
      {
        uint64_t v36 = v19;
        uint64_t v37 = v17;
        a6 = __src;
        a7 = v66;
        __n128 v11 = v35;
        a2 = v18;
        a3 = v67;
      }
      uint64_t v9 = v31;
      if (!v31) {
        return result;
      }
    }
    if (a4 <= v9)
    {
      if (v11 != a2)
      {
        uint64_t v50 = 0;
        do
        {
          long long v51 = &a6[v50];
          long long v52 = *(_OWORD *)&v11[v50];
          long long v53 = *(_OWORD *)&v11[v50 + 32];
          *((_OWORD *)v51 + 1) = *(_OWORD *)&v11[v50 + 16];
          *((_OWORD *)v51 + 2) = v53;
          *(_OWORD *)long long v51 = v52;
          v50 += 48;
        }
        while (&v11[v50] != a2);
        if (v50)
        {
          double v54 = (float *)a6;
          while (a2 != a3)
          {
            if (*(float *)a2 <= *v54)
            {
              long long v57 = *(_OWORD *)v54;
              long long v58 = *((_OWORD *)v54 + 2);
              *((_OWORD *)v11 + 1) = *((_OWORD *)v54 + 1);
              *((_OWORD *)v11 + 2) = v58;
              *(_OWORD *)__n128 v11 = v57;
              v54 += 12;
            }
            else
            {
              long long v55 = *(_OWORD *)a2;
              long long v56 = *((_OWORD *)a2 + 2);
              *((_OWORD *)v11 + 1) = *((_OWORD *)a2 + 1);
              *((_OWORD *)v11 + 2) = v56;
              *(_OWORD *)__n128 v11 = v55;
              a2 += 48;
            }
            v11 += 48;
            if (&a6[v50] == (char *)v54) {
              return result;
            }
          }
          return (char *)memmove(v11, v54, a6 - (char *)v54 + v50);
        }
      }
    }
    else if (a3 != a2)
    {
      uint64_t v39 = 0;
      do
      {
        unint64_t v40 = &a6[v39];
        long long v41 = *(_OWORD *)&a2[v39];
        long long v42 = *(_OWORD *)&a2[v39 + 32];
        *((_OWORD *)v40 + 1) = *(_OWORD *)&a2[v39 + 16];
        *((_OWORD *)v40 + 2) = v42;
        *(_OWORD *)unint64_t v40 = v41;
        v39 += 48;
      }
      while (&a2[v39] != a3);
      if (v39)
      {
        uint64_t v43 = (float *)&a6[v39];
        uint64_t v44 = a3 - 48;
        while (a2 != v11)
        {
          float v45 = *(v43 - 12);
          float v46 = *((float *)a2 - 12);
          if (v45 <= v46) {
            v47 = (char *)(v43 - 12);
          }
          else {
            v47 = a2 - 48;
          }
          if (v45 <= v46) {
            v43 -= 12;
          }
          else {
            a2 -= 48;
          }
          long long v48 = *(_OWORD *)v47;
          long long v49 = *((_OWORD *)v47 + 2);
          *((_OWORD *)v44 + 1) = *((_OWORD *)v47 + 1);
          *((_OWORD *)v44 + 2) = v49;
          *(_OWORD *)uint64_t v44 = v48;
          v44 -= 48;
          if (v43 == (float *)a6) {
            return result;
          }
        }
        unint64_t v62 = 0;
        do
        {
          uint64_t v63 = &v44[v62 * 4];
          long long v64 = *(_OWORD *)&v43[v62 - 12];
          long long v65 = *(_OWORD *)&v43[v62 - 4];
          *((_OWORD *)v63 + 1) = *(_OWORD *)&v43[v62 - 8];
          *((_OWORD *)v63 + 2) = v65;
          *(_OWORD *)uint64_t v63 = v64;
          v62 -= 12;
        }
        while (&v43[v62] != (float *)a6);
      }
    }
  }
  return result;
}

- (void)detectFormFieldsInImage:(uint64_t)a3 document:(char)a4 outputCandidateResults:
{
  while (2)
  {
    unint64_t v10 = a1;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          a1 = v10;
          uint64_t v11 = (uint64_t)a2 - v10;
          unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)a2 - v10) >> 4);
          if (v5 || !v4)
          {
            switch(v12)
            {
              case 0uLL:
              case 1uLL:
                return;
              case 2uLL:
                float v46 = *(a2 - 12);
                float v45 = a2 - 12;
                if (v46 > *(float *)v10)
                {
                  long long v131 = *(_OWORD *)(v10 + 16);
                  long long v141 = *(_OWORD *)(v10 + 32);
                  long long v122 = *(_OWORD *)v10;
                  long long v47 = *(_OWORD *)v45;
                  long long v48 = *((_OWORD *)v45 + 2);
                  *(_OWORD *)(v10 + 16) = *((_OWORD *)v45 + 1);
                  *(_OWORD *)(v10 + 32) = v48;
                  *(_OWORD *)unint64_t v10 = v47;
                  *((_OWORD *)v45 + 1) = v131;
                  *((_OWORD *)v45 + 2) = v141;
                  *(_OWORD *)float v45 = v122;
                }
                break;
              case 3uLL:
                break;
              case 4uLL:
                break;
              case 5uLL:
                long long v49 = (long long *)(v10 + 48);
                uint64_t v50 = (long long *)(v10 + 96);
                long long v51 = (long long *)(v10 + 144);
                float v53 = *(a2 - 12);
                long long v52 = a2 - 12;
                if (v53 > *(float *)(v10 + 144))
                {
                  long long v54 = *v51;
                  long long v132 = *(_OWORD *)(v10 + 160);
                  long long v55 = *(_OWORD *)(v10 + 176);
                  long long v56 = *(_OWORD *)v52;
                  long long v57 = *((_OWORD *)v52 + 2);
                  *(_OWORD *)(v10 + 160) = *((_OWORD *)v52 + 1);
                  *(_OWORD *)(v10 + 176) = v57;
                  *long long v51 = v56;
                  *((_OWORD *)v52 + 1) = v132;
                  *((_OWORD *)v52 + 2) = v55;
                  *(_OWORD *)long long v52 = v54;
                  if (*(float *)v51 > *(float *)v50)
                  {
                    long long v59 = *(_OWORD *)(v10 + 112);
                    long long v58 = *(_OWORD *)(v10 + 128);
                    long long v60 = *v50;
                    long long v61 = *(_OWORD *)(v10 + 160);
                    *uint64_t v50 = *v51;
                    *(_OWORD *)(v10 + 112) = v61;
                    *(_OWORD *)(v10 + 128) = *(_OWORD *)(v10 + 176);
                    *long long v51 = v60;
                    *(_OWORD *)(v10 + 160) = v59;
                    *(_OWORD *)(v10 + 176) = v58;
                    if (*(float *)v50 > *(float *)v49)
                    {
                      long long v63 = *(_OWORD *)(v10 + 64);
                      long long v62 = *(_OWORD *)(v10 + 80);
                      long long v64 = *v49;
                      long long v65 = *(_OWORD *)(v10 + 112);
                      *long long v49 = *v50;
                      *(_OWORD *)(v10 + 64) = v65;
                      *(_OWORD *)(v10 + 80) = *(_OWORD *)(v10 + 128);
                      *uint64_t v50 = v64;
                      *(_OWORD *)(v10 + 112) = v63;
                      *(_OWORD *)(v10 + 128) = v62;
                      if (*(float *)(v10 + 48) > *(float *)v10)
                      {
                        long long v133 = *(_OWORD *)(v10 + 16);
                        long long v142 = *(_OWORD *)(v10 + 32);
                        long long v123 = *(_OWORD *)v10;
                        long long v66 = *(_OWORD *)(v10 + 64);
                        *(_OWORD *)unint64_t v10 = *v49;
                        *(_OWORD *)(v10 + 16) = v66;
                        *(_OWORD *)(v10 + 32) = *(_OWORD *)(v10 + 80);
                        *long long v49 = v123;
                        *(_OWORD *)(v10 + 64) = v133;
                        *(_OWORD *)(v10 + 80) = v142;
                      }
                    }
                  }
                }
                break;
              default:
                JUMPOUT(0);
            }
            return;
          }
          if (v11 <= 1151)
          {
            float v67 = (float *)(v10 + 48);
            BOOL v69 = (float *)v10 == a2 || v67 == a2;
            if (a4)
            {
              if (!v69)
              {
                uint64_t v70 = 0;
                unint64_t v71 = v10;
                do
                {
                  double v72 = v67;
                  float v73 = *(float *)(v71 + 48);
                  if (v73 > *(float *)v71)
                  {
                    long long v124 = *(_OWORD *)(v71 + 52);
                    *(_OWORD *)v134 = *(_OWORD *)(v71 + 68);
                    *(_OWORD *)&v134[12] = *(_OWORD *)(v71 + 80);
                    uint64_t v74 = v70;
                    while (1)
                    {
                      float v75 = (float *)(v10 + v74);
                      long long v76 = *(_OWORD *)(v10 + v74 + 16);
                      *((_OWORD *)v75 + 3) = *(_OWORD *)(v10 + v74);
                      *((_OWORD *)v75 + 4) = v76;
                      *((_OWORD *)v75 + 5) = *(_OWORD *)(v10 + v74 + 32);
                      if (!v74) {
                        break;
                      }
                      v74 -= 48;
                      if (v73 <= *(v75 - 12))
                      {
                        uint64_t v77 = v10 + v74 + 48;
                        goto LABEL_80;
                      }
                    }
                    uint64_t v77 = v10;
LABEL_80:
                    *(float *)uint64_t v77 = v73;
                    *(_OWORD *)(v77 + 32) = *(_OWORD *)&v134[12];
                    *(_OWORD *)(v77 + 20) = *(_OWORD *)v134;
                    *(_OWORD *)(v77 + 4) = v124;
                  }
                  float v67 = v72 + 12;
                  v70 += 48;
                  unint64_t v71 = (unint64_t)v72;
                }
                while (v72 + 12 != a2);
              }
            }
            else if (!v69)
            {
              do
              {
                unint64_t v108 = (unint64_t)v67;
                float v109 = *(float *)(a1 + 48);
                if (v109 > *(float *)a1)
                {
                  long long v127 = *(_OWORD *)(a1 + 52);
                  *(_OWORD *)uint64_t v137 = *(_OWORD *)(a1 + 68);
                  *(_OWORD *)&v137[12] = *(_OWORD *)(a1 + 80);
                  v110 = v67;
                  do
                  {
                    long long v111 = *((_OWORD *)v110 - 2);
                    *(_OWORD *)v110 = *((_OWORD *)v110 - 3);
                    *((_OWORD *)v110 + 1) = v111;
                    *((_OWORD *)v110 + 2) = *((_OWORD *)v110 - 1);
                    float v112 = *(v110 - 24);
                    v110 -= 12;
                  }
                  while (v109 > v112);
                  float *v110 = v109;
                  *((_OWORD *)v110 + 2) = *(_OWORD *)&v137[12];
                  *(_OWORD *)(v110 + 5) = *(_OWORD *)v137;
                  *(_OWORD *)(v110 + 1) = v127;
                }
                v67 += 12;
                a1 = v108;
              }
              while ((float *)(v108 + 48) != a2);
            }
            return;
          }
          if (!a3)
          {
            if ((float *)v10 != a2)
            {
              int64_t v78 = (v12 - 2) >> 1;
              int64_t v79 = v78;
              do
              {
                int64_t v80 = v79;
                if (v78 >= v79)
                {
                  uint64_t v81 = (2 * v79) | 1;
                  unint64_t v82 = v10 + 48 * v81;
                  if (2 * v80 + 2 < (uint64_t)v12 && *(float *)v82 > *(float *)(v82 + 48))
                  {
                    v82 += 48;
                    uint64_t v81 = 2 * v80 + 2;
                  }
                  unint64_t v83 = v10 + 48 * v80;
                  float v84 = *(float *)v83;
                  if (*(float *)v82 <= *(float *)v83)
                  {
                    *(_OWORD *)&v135[12] = *(_OWORD *)(v83 + 32);
                    long long v125 = *(_OWORD *)(v83 + 4);
                    *(_OWORD *)v135 = *(_OWORD *)(v83 + 20);
                    do
                    {
                      float v85 = (_OWORD *)v83;
                      unint64_t v83 = v82;
                      long long v86 = *(_OWORD *)v82;
                      long long v87 = *(_OWORD *)(v82 + 32);
                      v85[1] = *(_OWORD *)(v82 + 16);
                      v85[2] = v87;
                      *float v85 = v86;
                      if (v78 < v81) {
                        break;
                      }
                      uint64_t v88 = 2 * v81;
                      uint64_t v81 = (2 * v81) | 1;
                      unint64_t v82 = v10 + 48 * v81;
                      uint64_t v89 = v88 + 2;
                      if (v89 < (uint64_t)v12 && *(float *)v82 > *(float *)(v82 + 48))
                      {
                        v82 += 48;
                        uint64_t v81 = v89;
                      }
                    }
                    while (*(float *)v82 <= v84);
                    *(float *)unint64_t v83 = v84;
                    *(_OWORD *)(v83 + 32) = *(_OWORD *)&v135[12];
                    *(_OWORD *)(v83 + 20) = *(_OWORD *)v135;
                    *(_OWORD *)(v83 + 4) = v125;
                  }
                }
                int64_t v79 = v80 - 1;
              }
              while (v80);
              int64_t v90 = v11 / 0x30uLL;
              do
              {
                uint64_t v91 = 0;
                long long v136 = *(_OWORD *)(v10 + 16);
                long long v143 = *(_OWORD *)(v10 + 32);
                long long v126 = *(_OWORD *)v10;
                BOOL v92 = (float *)v10;
                do
                {
                  BOOL v93 = v92;
                  v92 += 12 * v91 + 12;
                  uint64_t v94 = 2 * v91;
                  uint64_t v91 = (2 * v91) | 1;
                  int64_t v95 = v94 + 2;
                  if (v95 < v90 && *v92 > v92[12])
                  {
                    v92 += 12;
                    uint64_t v91 = v95;
                  }
                  long long v96 = *(_OWORD *)v92;
                  long long v97 = *((_OWORD *)v92 + 2);
                  *((_OWORD *)v93 + 1) = *((_OWORD *)v92 + 1);
                  *((_OWORD *)v93 + 2) = v97;
                  *(_OWORD *)BOOL v93 = v96;
                }
                while (v91 <= (uint64_t)((unint64_t)(v90 - 2) >> 1));
                a2 -= 12;
                if (v92 == a2)
                {
                  *((_OWORD *)v92 + 1) = v136;
                  *((_OWORD *)v92 + 2) = v143;
                  *(_OWORD *)BOOL v92 = v126;
                }
                else
                {
                  long long v98 = *(_OWORD *)a2;
                  long long v99 = *((_OWORD *)a2 + 2);
                  *((_OWORD *)v92 + 1) = *((_OWORD *)a2 + 1);
                  *((_OWORD *)v92 + 2) = v99;
                  *(_OWORD *)BOOL v92 = v98;
                  *((_OWORD *)a2 + 1) = v136;
                  *((_OWORD *)a2 + 2) = v143;
                  *(_OWORD *)a2 = v126;
                  uint64_t v100 = (uint64_t)v92 - v10 + 48;
                  if (v100 >= 49)
                  {
                    unint64_t v101 = (v100 / 0x30uLL - 2) >> 1;
                    uint64_t v102 = (float *)(v10 + 48 * v101);
                    float v103 = *v92;
                    if (*v102 > *v92)
                    {
                      *(_OWORD *)&v118[12] = *((_OWORD *)v92 + 2);
                      long long v115 = *(_OWORD *)(v92 + 1);
                      *(_OWORD *)v118 = *(_OWORD *)(v92 + 5);
                      do
                      {
                        v104 = v92;
                        BOOL v92 = v102;
                        long long v105 = *(_OWORD *)v102;
                        long long v106 = *((_OWORD *)v102 + 2);
                        *((_OWORD *)v104 + 1) = *((_OWORD *)v102 + 1);
                        *((_OWORD *)v104 + 2) = v106;
                        *(_OWORD *)v104 = v105;
                        if (!v101) {
                          break;
                        }
                        unint64_t v101 = (v101 - 1) >> 1;
                        uint64_t v102 = (float *)(v10 + 48 * v101);
                      }
                      while (*v102 > v103);
                      *BOOL v92 = v103;
                      *((_OWORD *)v92 + 2) = *(_OWORD *)&v118[12];
                      *(_OWORD *)(v92 + 5) = *(_OWORD *)v118;
                      *(_OWORD *)(v92 + 1) = v115;
                    }
                  }
                }
              }
              while (v90-- > 2);
            }
            return;
          }
          unint64_t v13 = v12 >> 1;
          unint64_t v14 = v10 + 48 * (v12 >> 1);
          if ((unint64_t)v11 >= 0x1801)
          {
            uint64_t v15 = 3 * v13;
            uint64_t v16 = (float *)(a1 + 48 * v13 - 48);
            uint64_t v17 = (float *)(a1 + 48 + 16 * v15);
            long long v128 = *(_OWORD *)(a1 + 16);
            long long v138 = *(_OWORD *)(a1 + 32);
            long long v119 = *(_OWORD *)a1;
            long long v18 = *(_OWORD *)(v14 + 32);
            long long v19 = *(_OWORD *)v14;
            *(_OWORD *)(a1 + 16) = *(_OWORD *)(v14 + 16);
            *(_OWORD *)(a1 + 32) = v18;
            *(_OWORD *)a1 = v19;
            *(_OWORD *)(v14 + 16) = v128;
            *(_OWORD *)(v14 + 32) = v138;
            *(_OWORD *)unint64_t v14 = v119;
          }
          else
          {
          }
          --a3;
          float v20 = *(float *)a1;
          if ((a4 & 1) != 0 || *(float *)(a1 - 48) > v20) {
            break;
          }
          *(_OWORD *)&v117[12] = *(_OWORD *)(a1 + 32);
          long long v114 = *(_OWORD *)(a1 + 4);
          *(_OWORD *)BOOL v117 = *(_OWORD *)(a1 + 20);
          if (v20 <= *(a2 - 12))
          {
            unint64_t v36 = a1 + 48;
            do
            {
              unint64_t v10 = v36;
              if (v36 >= (unint64_t)a2) {
                break;
              }
              v36 += 48;
            }
            while (v20 <= *(float *)v10);
          }
          else
          {
            unint64_t v10 = a1;
            do
            {
              float v35 = *(float *)(v10 + 48);
              v10 += 48;
            }
            while (v20 <= v35);
          }
          uint64_t v37 = a2;
          if (v10 < (unint64_t)a2)
          {
            uint64_t v37 = a2;
            do
            {
              float v38 = *(v37 - 12);
              v37 -= 12;
            }
            while (v20 > v38);
          }
          while (v10 < (unint64_t)v37)
          {
            long long v130 = *(_OWORD *)(v10 + 16);
            long long v140 = *(_OWORD *)(v10 + 32);
            long long v121 = *(_OWORD *)v10;
            long long v39 = *(_OWORD *)v37;
            long long v40 = *((_OWORD *)v37 + 2);
            *(_OWORD *)(v10 + 16) = *((_OWORD *)v37 + 1);
            *(_OWORD *)(v10 + 32) = v40;
            *(_OWORD *)unint64_t v10 = v39;
            *((_OWORD *)v37 + 1) = v130;
            *((_OWORD *)v37 + 2) = v140;
            *(_OWORD *)uint64_t v37 = v121;
            do
            {
              float v41 = *(float *)(v10 + 48);
              v10 += 48;
            }
            while (v20 <= v41);
            do
            {
              float v42 = *(v37 - 12);
              v37 -= 12;
            }
            while (v20 > v42);
          }
          BOOL v4 = v10 - 48 >= a1;
          BOOL v5 = v10 - 48 == a1;
          if (v10 - 48 != a1)
          {
            long long v43 = *(_OWORD *)(v10 - 48);
            long long v44 = *(_OWORD *)(v10 - 16);
            *(_OWORD *)(a1 + 16) = *(_OWORD *)(v10 - 32);
            *(_OWORD *)(a1 + 32) = v44;
            *(_OWORD *)a1 = v43;
          }
          a4 = 0;
          *(float *)(v10 - 48) = v20;
          *(_OWORD *)(v10 - 16) = *(_OWORD *)&v117[12];
          *(_OWORD *)(v10 - 28) = *(_OWORD *)v117;
          *(_OWORD *)(v10 - 44) = v114;
        }
        uint64_t v21 = 0;
        *(_OWORD *)&v116[12] = *(_OWORD *)(a1 + 32);
        long long v113 = *(_OWORD *)(a1 + 4);
        *(_OWORD *)uint64_t v116 = *(_OWORD *)(a1 + 20);
        do
        {
          float v22 = *(float *)(a1 + v21 + 48);
          v21 += 48;
        }
        while (v22 > v20);
        unint64_t v23 = a1 + v21;
        float v24 = a2;
        if (v21 == 48)
        {
          float v24 = a2;
          do
          {
            if (v23 >= (unint64_t)v24) {
              break;
            }
            float v26 = *(v24 - 12);
            v24 -= 12;
          }
          while (v26 <= v20);
        }
        else
        {
          do
          {
            float v25 = *(v24 - 12);
            v24 -= 12;
          }
          while (v25 <= v20);
        }
        unint64_t v10 = a1 + v21;
        if (v23 < (unint64_t)v24)
        {
          unint64_t v27 = v24;
          do
          {
            long long v129 = *(_OWORD *)(v10 + 16);
            long long v139 = *(_OWORD *)(v10 + 32);
            long long v120 = *(_OWORD *)v10;
            long long v28 = *(_OWORD *)v27;
            long long v29 = *((_OWORD *)v27 + 2);
            *(_OWORD *)(v10 + 16) = *((_OWORD *)v27 + 1);
            *(_OWORD *)(v10 + 32) = v29;
            *(_OWORD *)unint64_t v10 = v28;
            *((_OWORD *)v27 + 1) = v129;
            *((_OWORD *)v27 + 2) = v139;
            *(_OWORD *)unint64_t v27 = v120;
            do
            {
              float v30 = *(float *)(v10 + 48);
              v10 += 48;
            }
            while (v30 > v20);
            do
            {
              float v31 = *(v27 - 12);
              v27 -= 12;
            }
            while (v31 <= v20);
          }
          while (v10 < (unint64_t)v27);
        }
        if (v10 - 48 != a1)
        {
          long long v32 = *(_OWORD *)(v10 - 48);
          long long v33 = *(_OWORD *)(v10 - 16);
          *(_OWORD *)(a1 + 16) = *(_OWORD *)(v10 - 32);
          *(_OWORD *)(a1 + 32) = v33;
          *(_OWORD *)a1 = v32;
        }
        *(float *)(v10 - 48) = v20;
        *(_OWORD *)(v10 - 16) = *(_OWORD *)&v116[12];
        *(_OWORD *)(v10 - 28) = *(_OWORD *)v116;
        *(_OWORD *)(v10 - 44) = v113;
        if (v23 >= (unint64_t)v24) {
          break;
        }
LABEL_30:
        a4 = 0;
      }
      {
        break;
      }
      if (!v34) {
        goto LABEL_30;
      }
    }
    a2 = (float *)(v10 - 48);
    if (!v34) {
      continue;
    }
    break;
  }
}

@end