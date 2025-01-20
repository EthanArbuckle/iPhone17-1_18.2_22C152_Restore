@interface PIRepairUtilities
+ (BOOL)applyRepairMLStrokeToMutableBuffer:(id)a3 brushStroke:(id)a4 detectedFaces:(id)a5 context:(id)a6 error:(id *)a7;
+ (CGImage)newWatchInfillFromImage:(CGImage *)a3 mask:(CGImage *)a4;
+ (id)brushStrokeFromRetouchStrokeDictionary:(id)a3;
+ (id)extractRGBAfPixelsFromImage:(id)a3 fromROI:(id *)a4;
+ (id)prepareForCIFilterWithFaces:(id)a3 cropRect:(id *)a4;
+ (void)applyRepairStrokeToMutableBuffer:(id)a3 brushStroke:(id)a4 sourceOffset:(CGPoint)a5 repairEdges:(BOOL)a6;
+ (void)calcExtentsForStrokeRadius:(double)a3 offset:(id)a4 inputImageExtent:(id *)a5 maskExtent:(id *)a6 repairExtent:(id *)a7 textureExtent:(id *)a8 sourceExtent:(id *)a9;
@end

@implementation PIRepairUtilities

+ (CGImage)newWatchInfillFromImage:(CGImage *)a3 mask:(CGImage *)a4
{
  v4 = 0;
  if (a3)
  {
    if (a4)
    {
      unint64_t Width = CGImageGetWidth(a3);
      size_t Height = CGImageGetHeight(a3);
      v4 = 0;
      if (Width - 8193 >= 0xFFFFFFFFFFFFE036)
      {
        size_t v9 = Height;
        if (Height >= 0x37 && Height <= 0x2000)
        {
          if (Width == CGImageGetWidth(a4) && v9 == CGImageGetHeight(a4))
          {
            v10 = malloc_type_malloc(4 * v9 * Width, 0x100004052888210uLL);
            CFStringRef name = (const __CFString *)*MEMORY[0x1E4F1DC98];
            v11 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
            uint64_t v12 = 1;
            v13 = CGBitmapContextCreate(v10, Width, v9, 8uLL, 4 * Width, v11, 1u);
            CGColorSpaceRelease(v11);
            CGContextSetInterpolationQuality(v13, kCGInterpolationHigh);
            v310.origin.x = 0.0;
            v310.origin.y = 0.0;
            v310.size.width = (double)Width;
            v310.size.height = (double)v9;
            CGContextDrawImage(v13, v310, a3);
            CGContextRelease(v13);
            v14 = (unsigned __int8 *)malloc_type_malloc(v9 * Width, 0x82529B75uLL);
            v15 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBF8]);
            v16 = CGBitmapContextCreate(v14, Width, v9, 8uLL, Width, v15, 0);
            CGColorSpaceRelease(v15);
            CGContextSetInterpolationQuality(v16, kCGInterpolationHigh);
            v311.origin.x = 0.0;
            v311.origin.y = 0.0;
            v311.size.width = (double)Width;
            v311.size.height = (double)v9;
            CGContextDrawImage(v16, v311, a4);
            CGContextRelease(v16);
            v277 = v14;
            v278 = v10;
            v296 = v10;
            v297 = v14;
            int v298 = Width;
            int v299 = v9;
            v300.i32[0] = Width + 22;
            v300.i32[1] = v9 + 22;
            unsigned int v17 = 4;
            uint64_t v18 = 9;
            v301[0] = 4;
            do
            {
              int v19 = 1812433253 * (v17 ^ (v17 >> 30));
              unsigned int v17 = v19 + v12;
              *((_DWORD *)&v296 + v18) = v18 + v19 - 8;
              ++v12;
              ++v18;
            }
            while (v18 != 632);
            uint64_t v20 = 0;
            memset(v309, 0, 44);
            long long v308 = 0u;
            memset(v307, 0, sizeof(v307));
            long long v306 = 0u;
            long long v305 = 0u;
            long long v304 = 0u;
            long long v303 = 0u;
            long long v302 = 0u;
            __asm { FMOV            V0.2D, #21.0 }
            float64x2_t v286 = _Q0;
            do
            {
              v25 = &v307[3 * v20 + 3];
              _ZNSt3__16vectorIDv2_sNS_9allocatorIS1_EEE7reserveEm(v25, 0x22uLL);
              int v26 = 0;
              uint64_t v27 = v20 + 1;
              v28 = &(&v296)[3 * v20];
              v29 = (void **)(v28 + 330);
              v30 = v28 + 331;
              v31 = (char *)v28[330];
              do
              {
                __double2 v33 = __sincos_stret((double)v26 * 6.28318531 / 17.0);
                v32.f64[0] = v33.__cosval;
                v32.f64[1] = v33.__sinval;
                int32x2_t v34 = vmovn_s64(vcvtq_s64_f64(vmulq_n_f64(vmulq_f64(v32, v286), (double)((int)v20 + 1))));
                if ((unint64_t)v31 >= *v30)
                {
                  int32x2_t v282 = v34;
                  uint64_t v35 = (v31 - (unsigned char *)*v25) >> 2;
                  if ((unint64_t)(v35 + 1) >> 62) {
                    std::vector<float>::__throw_length_error[abi:ne180100]();
                  }
                  uint64_t v36 = *v30 - (void)*v25;
                  uint64_t v37 = v36 >> 1;
                  if (v36 >> 1 <= (unint64_t)(v35 + 1)) {
                    uint64_t v37 = v35 + 1;
                  }
                  if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFFCLL) {
                    unint64_t v38 = 0x3FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v38 = v37;
                  }
                  if (v38) {
                    unint64_t v38 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v38);
                  }
                  else {
                    uint64_t v39 = 0;
                  }
                  v40 = (_WORD *)(v38 + 4 * v35);
                  v40[1] = v282.i16[2];
                  _WORD *v40 = v282.i16[0];
                  v41 = (char *)*v29;
                  v42 = (char *)*v25;
                  v43 = v40;
                  if (*v29 != *v25)
                  {
                    do
                    {
                      int v44 = *((_DWORD *)v41 - 1);
                      v41 -= 4;
                      *((_DWORD *)v43 - 1) = v44;
                      v43 -= 2;
                    }
                    while (v41 != v42);
                    v41 = (char *)*v25;
                  }
                  v31 = (char *)(v40 + 2);
                  *v25 = v43;
                  void *v30 = v38 + 4 * v39;
                  if (v41) {
                    operator delete(v41);
                  }
                }
                else
                {
                  *((_WORD *)v31 + 1) = v34.i16[2];
                  *(_WORD *)v31 = v34.i16[0];
                  v31 += 4;
                }
                *v29 = v31;
                ++v26;
              }
              while (v26 != 17);
              for (int i = 0; i != 17; ++i)
              {
                __double2 v47 = __sincos_stret((double)i * 6.28318531 / 17.0);
                v46.f64[0] = v47.__cosval;
                v46.f64[1] = v47.__sinval;
                int32x2_t v48 = vmovn_s64(vcvtq_s64_f64(vmulq_n_f64(vmulq_f64(v46, v286), (double)(2 * (int)v20 + 5))));
                if ((unint64_t)v31 >= *v30)
                {
                  int32x2_t v283 = v48;
                  uint64_t v49 = (v31 - (unsigned char *)*v25) >> 2;
                  if ((unint64_t)(v49 + 1) >> 62) {
                    std::vector<float>::__throw_length_error[abi:ne180100]();
                  }
                  uint64_t v50 = *v30 - (void)*v25;
                  uint64_t v51 = v50 >> 1;
                  if (v50 >> 1 <= (unint64_t)(v49 + 1)) {
                    uint64_t v51 = v49 + 1;
                  }
                  if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFFCLL) {
                    unint64_t v52 = 0x3FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v52 = v51;
                  }
                  if (v52) {
                    unint64_t v52 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v52);
                  }
                  else {
                    uint64_t v53 = 0;
                  }
                  v54 = (_WORD *)(v52 + 4 * v49);
                  v54[1] = v283.i16[2];
                  _WORD *v54 = v283.i16[0];
                  v55 = (char *)*v29;
                  v56 = (char *)*v25;
                  v57 = v54;
                  if (*v29 != *v25)
                  {
                    do
                    {
                      int v58 = *((_DWORD *)v55 - 1);
                      v55 -= 4;
                      *((_DWORD *)v57 - 1) = v58;
                      v57 -= 2;
                    }
                    while (v55 != v56);
                    v55 = (char *)*v25;
                  }
                  v31 = (char *)(v54 + 2);
                  *v25 = v57;
                  void *v30 = v52 + 4 * v53;
                  if (v55) {
                    operator delete(v55);
                  }
                }
                else
                {
                  *((_WORD *)v31 + 1) = v48.i16[2];
                  *(_WORD *)v31 = v48.i16[0];
                  v31 += 4;
                }
                *v29 = v31;
              }
              ++v20;
            }
            while (v27 != 3);
            v59 = *(float **)&v309[2];
            v60 = (unsigned char *)*((void *)&v309[1] + 1);
            v61 = *(unsigned char **)&v309[1];
            if (*(void *)&v309[2] - *(void *)&v309[1] > 0x1E3uLL)
            {
              v63 = (float *)*((void *)&v309[1] + 1);
            }
            else
            {
              v62 = (char *)operator new(0x1E4uLL);
              v59 = (float *)(v62 + 484);
              v63 = (float *)&v62[(v60 - v61) & 0xFFFFFFFFFFFFFFFCLL];
              v64 = v63;
              if (v60 != v61)
              {
                v64 = (float *)&v62[(v60 - v61) & 0xFFFFFFFFFFFFFFFCLL];
                do
                {
                  int v65 = *((_DWORD *)v60 - 1);
                  v60 -= 4;
                  *((_DWORD *)v64-- - 1) = v65;
                }
                while (v60 != v61);
              }
              *(void *)&v309[1] = v64;
              *((void *)&v309[1] + 1) = v63;
              *(void *)&v309[2] = v62 + 484;
              if (v61) {
                operator delete(v61);
              }
            }
            int v66 = 0;
            v67.i32[1] = 0;
            do
            {
              int v68 = 0;
              float v69 = fabsf((float)(v66 - 5));
              float v70 = (float)(v69 * 0.17273) * (float)(v69 * 0.17273);
              do
              {
                float v71 = fabsf((float)(v68 - 5));
                float v72 = sqrtf(v70 + (float)((float)(v71 * 0.17273) * (float)(v71 * 0.17273)));
                if (v72 <= 1.0) {
                  float v73 = 1.0 - v72;
                }
                else {
                  float v73 = 0.0;
                }
                if (v63 >= v59)
                {
                  v74 = *(float **)&v309[1];
                  uint64_t v75 = ((uint64_t)v63 - *(void *)&v309[1]) >> 2;
                  unint64_t v76 = v75 + 1;
                  if ((unint64_t)(v75 + 1) >> 62) {
                    std::vector<float>::__throw_length_error[abi:ne180100]();
                  }
                  if (((uint64_t)v59 - *(void *)&v309[1]) >> 1 > v76) {
                    unint64_t v76 = ((uint64_t)v59 - *(void *)&v309[1]) >> 1;
                  }
                  if ((unint64_t)v59 - *(void *)&v309[1] >= 0x7FFFFFFFFFFFFFFCLL) {
                    unint64_t v76 = 0x3FFFFFFFFFFFFFFFLL;
                  }
                  if (v76)
                  {
                    unint64_t v76 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v76);
                    v63 = (float *)*((void *)&v309[1] + 1);
                    v74 = *(float **)&v309[1];
                  }
                  else
                  {
                    uint64_t v77 = 0;
                  }
                  v78 = (float *)(v76 + 4 * v75);
                  float *v78 = v73;
                  v79 = v78 + 1;
                  while (v63 != v74)
                  {
                    int v80 = *((_DWORD *)v63-- - 1);
                    *((_DWORD *)v78-- - 1) = v80;
                  }
                  v59 = (float *)(v76 + 4 * v77);
                  *(void *)&v309[1] = v78;
                  *(void *)&v309[2] = v59;
                  if (v74) {
                    operator delete(v74);
                  }
                  v63 = v79;
                }
                else
                {
                  *v63++ = v73;
                }
                *((void *)&v309[1] + 1) = v63;
                ++v68;
              }
              while (v68 != 11);
              ++v66;
            }
            while (v66 != 11);
            int v82 = v298;
            int v81 = v299;
            unint64_t v83 = v300.i32[1] * (uint64_t)v300.i32[0];
            v84 = (char *)*((void *)&v304 + 1);
            unint64_t v85 = v304;
            uint64_t v86 = *((void *)&v304 + 1) - v304;
            size_t v87 = v83 - (*((void *)&v304 + 1) - v304);
            __int32 v287 = v300.i32[0];
            if (v83 <= *((void *)&v304 + 1) - (void)v304)
            {
              if (v83 < *((void *)&v304 + 1) - (void)v304) {
                *((void *)&v304 + 1) = v304 + v83;
              }
            }
            else if ((void)v305 - *((void *)&v304 + 1) >= v87)
            {
              bzero(*((void **)&v304 + 1), v83 - (*((void *)&v304 + 1) - v304));
              *((void *)&v304 + 1) = &v84[v87];
            }
            else
            {
              if ((v83 & 0x80000000) != 0) {
                std::vector<float>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v88 = 2 * (v305 - v304);
              if (v88 <= v83) {
                unint64_t v88 = v300.i32[1] * (uint64_t)v300.i32[0];
              }
              if ((void)v305 - (void)v304 >= 0x3FFFFFFFFFFFFFFFuLL) {
                size_t v89 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                size_t v89 = v88;
              }
              v90 = operator new(v89);
              v91 = (char *)v90 + v86;
              v92 = (char *)v90 + v89;
              v93 = (char *)v90 + v83;
              bzero(v91, v87);
              if (v84 == (char *)v85)
              {
                v90 = v91;
              }
              else
              {
                v94 = &v84[~v85];
                do
                {
                  char v95 = *--v84;
                  (v94--)[(void)v90] = v95;
                }
                while (v84 != (char *)v85);
                v84 = (char *)v304;
              }
              *(void *)&long long v304 = v90;
              *((void *)&v304 + 1) = v93;
              *(void *)&long long v305 = v92;
              if (v84) {
                operator delete(v84);
              }
            }
            _ZNSt3__16vectorIDv4_fNS_9allocatorIS1_EEE6resizeEm((char **)&v305 + 1, v83);
            _ZNSt3__16vectorIDv4_fNS_9allocatorIS1_EEE6resizeEm((char **)v307, v83);
            v96 = (char *)*((void *)&v305 + 1);
            v97 = (char *)v307[0];
            v98 = v296;
            v99 = v297;
            uint64_t v100 = v304;
            bzero((void *)v304, v83);
            bzero(v97, 16 * (int)v83);
            bzero(v96, 16 * (int)v83);
            if (v81 <= 0)
            {
              _ZNSt3__16vectorIDv2_sNS_9allocatorIS1_EEE7reserveEm((void **)&v302 + 1, v83);
            }
            else
            {
              int v101 = 0;
              uint64_t v102 = 11 * v287 + 11;
              v103 = &v97[16 * v102];
              v104 = &v96[16 * v102];
              v105 = (unsigned char *)(v100 + v102);
              do
              {
                if (v82 >= 1)
                {
                  int v106 = v82;
                  v107 = v99;
                  do
                  {
                    if (*v107 <= 5u)
                    {
                      unsigned char *v105 = 1;
                      *((float *)&v108 + 3) = (float)HIBYTE(*v98) / 255.0;
                      *(_OWORD *)v104 = v108;
                      *(_OWORD *)v103 = v108;
                    }
                    ++v107;
                    ++v105;
                    ++v98;
                    v104 += 16;
                    v103 += 16;
                    --v106;
                  }
                  while (v106);
                  v99 += (v82 - 1) + 1;
                }
                v105 += 22;
                v104 += 352;
                v103 += 352;
                ++v101;
              }
              while (v101 != v81);
              _ZNSt3__16vectorIDv2_sNS_9allocatorIS1_EEE7reserveEm((void **)&v302 + 1, v83);
              for (int j = 0; j != v81; ++j)
              {
                if (v82 >= 1)
                {
                  for (int k = 0; k != v82; ++k)
                  {
                    HIWORD(v295) = j + 11;
                    LOWORD(v295) = k + 11;
                    {
                      v109.i32[0] = k + 11;
                      v109.i32[1] = j + 11;
                      v112 = (_WORD *)v303;
                      if ((unint64_t)v303 >= *((void *)&v303 + 1))
                      {
                        int32x2_t v288 = v109;
                        uint64_t v114 = (uint64_t)(v303 - *((void *)&v302 + 1)) >> 2;
                        unint64_t v115 = v114 + 1;
                        if ((unint64_t)(v114 + 1) >> 62) {
LABEL_261:
                        }
                          std::vector<float>::__throw_length_error[abi:ne180100]();
                        uint64_t v116 = *((void *)&v303 + 1) - *((void *)&v302 + 1);
                        if ((uint64_t)(*((void *)&v303 + 1) - *((void *)&v302 + 1)) >> 1 > v115) {
                          unint64_t v115 = v116 >> 1;
                        }
                        if ((unint64_t)v116 >= 0x7FFFFFFFFFFFFFFCLL) {
                          unint64_t v117 = 0x3FFFFFFFFFFFFFFFLL;
                        }
                        else {
                          unint64_t v117 = v115;
                        }
                        if (v117) {
                          unint64_t v117 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v117);
                        }
                        else {
                          uint64_t v118 = 0;
                        }
                        v119 = (_WORD *)(v117 + 4 * v114);
                        v109.i32[1] = v288.i32[1];
                        v119[1] = v288.i16[2];
                        _WORD *v119 = v288.i16[0];
                        v120 = (char *)v303;
                        v121 = (char *)*((void *)&v302 + 1);
                        v122 = v119;
                        if ((void)v303 != *((void *)&v302 + 1))
                        {
                          do
                          {
                            int v123 = *((_DWORD *)v120 - 1);
                            v120 -= 4;
                            *((_DWORD *)v122 - 1) = v123;
                            v122 -= 2;
                          }
                          while (v120 != v121);
                          v120 = (char *)*((void *)&v302 + 1);
                        }
                        v113 = v119 + 2;
                        *((void *)&v302 + 1) = v122;
                        *((void *)&v303 + 1) = v117 + 4 * v118;
                        if (v120) {
                          operator delete(v120);
                        }
                      }
                      else
                      {
                        *(_WORD *)(v303 + 2) = j + 11;
                        _WORD *v112 = k + 11;
                        v113 = v112 + 2;
                      }
                      *(void *)&long long v303 = v113;
                    }
                  }
                }
              }
            }
            __int32 v285 = v300.i32[0];
            if ((void)v303 != *((void *)&v302 + 1))
            {
              uint64_t v284 = v304;
              v109.i32[0] = 11;
              int32x2_t v124 = vshl_n_s32(v109, 0x10uLL);
              int32x2_t v125 = vshr_n_s32(v124, 0x10uLL);
              int32x2_t v126 = vdup_n_s32(0xFFFBu);
              v124.i32[0] = 11;
              int32x2_t v127 = vshr_n_s32(vshl_n_s32(v124, 0x10uLL), 0x10uLL);
              while (1)
              {
                std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v128 = std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()((std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)v301);
                uint64_t v129 = ((void)v303 - *((void *)&v302 + 1)) >> 2;
                v130 = (__int16 *)(*((void *)&v302 + 1) + 4 * (int)(v128 % v129));
                v131.i16[0] = *v130;
                v131.i16[2] = v130[1];
                uint64_t v132 = v303 - (void)(v130 + 2);
                int32x2_t v289 = v131;
                if ((__int16 *)v303 != v130 + 2)
                {
                  memmove((void *)(*((void *)&v302 + 1) + 4 * (int)(v128 % v129)), v130 + 2, v303 - (void)(v130 + 2));
                  int32x2_t v131 = v289;
                }
                *(void *)&long long v303 = (char *)v130 + v132;
                __int16 v133 = v131.i16[2];
                if (*(unsigned char *)(v284 + v285 * v131.i16[2] + v131.i16[0]) == 1) {
                  goto LABEL_238;
                }
                HIWORD(v294) = v131.i16[2];
                LOWORD(v294) = v131.i16[0];
                v134 = &(&v296)[3
                              * (std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()((std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)v301)
                               % 3)];
                v139 = (__int16 *)v134[329];
                v140 = (__int16 *)v134[330];
                if (v139 == v140)
                {
                  *(void *)&long long v138 = 0xFFFF0000FFFFLL;
                  v67.i32[0] = 1900671690;
                  int32x2_t v142 = v289;
                }
                else
                {
                  int32x2_t v141 = v300;
                  float32x2_t v135 = (float32x2_t)vadd_s32(v300, (int32x2_t)0x1500000015);
                  int32x2_t v142 = v289;
                  int32x2_t v143 = vadd_s32(v289, v126);
                  uint64_t v144 = *((void *)&v305 + 1) + 16 * v143.i16[2] * (uint64_t)v300.i32[0] + 16 * v143.i16[0];
                  uint64_t v145 = v304 + v143.i16[2] * (uint64_t)v300.i32[0] + v143.i16[0];
                  uint64_t v146 = 16 * (v300.i32[0] - 11) + 176;
                  *(void *)&long long v138 = 0xFFFF0000FFFFLL;
                  v67.i32[0] = 1900671690;
                  do
                  {
                    v141.i16[0] = *v139;
                    v141.i16[2] = v139[1];
                    int32x2_t v141 = vadd_s32(v141, v289);
                    int32x2_t v147 = vadd_s32(v141, v126);
                    __int16 v148 = v147.i16[0];
                    float v149 = -1.0;
                    if (v147.i16[0] >= 22)
                    {
                      unsigned __int16 v154 = v147.u16[2];
                      if (v147.i16[2] >= 22)
                      {
                        int32x2_t v155 = vcgt_s32((int32x2_t)v135, vshr_n_s32(vshl_n_s32(vadd_s32(v141, (int32x2_t)0x600000006), 0x10uLL), 0x10uLL));
                        if (v155.i8[0] & 1) != 0 && (v155.i8[4])
                        {
                          int v156 = 0;
                          int v157 = 0;
                          unsigned int v158 = v148;
                          unint64_t v159 = *((void *)&v305 + 1)
                               + 16 * v300.i32[0] * (unint64_t)v154
                               + 16 * v148;
                          unint64_t v160 = v304 + v300.i32[0] * (unint64_t)v154 + v158;
                          float v161 = 0.0;
                          uint64_t v162 = v144;
                          uint64_t v163 = *(void *)&v309[1];
                          uint64_t v164 = v145;
                          do
                          {
                            uint64_t v165 = 0;
                            do
                            {
                              if (*(float *)(v163 + 4 * v165) > 0.0)
                              {
                                if (!*(unsigned char *)(v160 + v165)) {
                                  goto LABEL_139;
                                }
                                if (*(unsigned char *)(v164 + v165))
                                {
                                  float32x4_t v166 = vsubq_f32(*(float32x4_t *)(v159 + 16 * v165), *(float32x4_t *)(v162 + 16 * v165));
                                  float32x4_t v167 = vmulq_f32(v166, v166);
                                  ++v157;
                                  int32x2_t v137 = (int32x2_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v167, 2), vaddq_f32(v167, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v167.f32, 1))).u64[0];
                                  float v161 = v161 + *(float *)v137.i32;
                                }
                              }
                              ++v165;
                            }
                            while (v165 != 11);
                            v160 += v300.i32[0];
                            v164 += v300.i32[0];
                            ++v156;
                            v162 += v146;
                            v159 += v146;
                            v163 += 44;
                          }
                          while (v156 != 11);
                          float v149 = v161 / (float)v157;
                        }
                      }
                    }
LABEL_139:
                    BOOL v150 = v149 >= 0.0;
                    BOOL v151 = v149 < v67.f32[0];
                    _ZF = !v150 || !v151;
                    if (v150 && v151) {
                      unsigned int v153 = -1;
                    }
                    else {
                      unsigned int v153 = 0;
                    }
                    int32x2_t v136 = vdup_n_s32(v153);
                    *(int8x8_t *)&long long v138 = vbsl_s8((int8x8_t)v136, (int8x8_t)v141, *(int8x8_t *)&v138);
                    if (!_ZF) {
                      v67.f32[0] = v149;
                    }
                    v139 += 2;
                  }
                  while (v139 != v140);
                }
                if ((v138 & 0x8000) != 0)
                {
                  for (uint64_t m = 0; m != 32; m += 4)
                  {
                    v135.i16[0] = *(_WORD *)((char *)&_ZZN12_GLOBAL__N_119_NTKUltraCubeFiller10tryResolveEDv2_sE4adjs + m);
                    v135.i16[2] = *(_WORD *)((char *)&_ZZN12_GLOBAL__N_119_NTKUltraCubeFiller10tryResolveEDv2_sE4adjs
                                           + m
                                           + 2);
                    float32x2_t v135 = (float32x2_t)vadd_s32((int32x2_t)v135, v142);
                    HIWORD(v292) = v135.i16[2];
                    LOWORD(v292) = v135.i16[0];
                    if (v292 << 16 >= 720896)
                    {
                      int v218 = v292 >> 16;
                      BOOL v219 = v292 >= 720896 && v135.i16[0] < v300.i32[0] - 11;
                      if (v219 && v218 < v300.i32[1] - 11)
                      {
                        if (*(unsigned char *)(v304 + v218 * v300.i32[0] + v135.i16[0]))
                        {
                          if (!*(unsigned char *)(v304 + v300.i32[0] * (v294 >> 16) + (__int16)v294))
                          {
                            int8x8_t v280 = (int8x8_t)v135;
                            long long v281 = v138;
                            std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v221 = std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()((std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)v301);
                            *((void *)&v138 + 1) = *((void *)&v281 + 1);
                            int32x2_t v142 = v289;
                            v135.f32[0] = (float)(v221 % 0x3E8);
                            *(int8x8_t *)&long long v138 = vbsl_s8((int8x8_t)*(_OWORD *)&vmovl_s16((int16x4_t)vcgt_f32(v67, v135)), v280, *(int8x8_t *)&v281);
                            if (v67.f32[0] > v135.f32[0]) {
                              v67.f32[0] = (float)(v221 % 0x3E8);
                            }
                          }
                        }
                      }
                    }
                  }
                  if ((v138 & 0x8000) != 0) {
                    goto LABEL_238;
                  }
                  HIWORD(v291) = WORD2(v138);
                  LOWORD(v291) = v138;
                  __int32 v223 = v300.i32[0];
                  __int32 v222 = v300.i32[1];
                  uint64_t v224 = v300.i32[0] * (uint64_t)v133;
                  uint64_t v225 = *((void *)&v305 + 1) + 16 * v224;
                  v226 = (char *)v307[0] + 16 * v224;
                  uint64_t v227 = v304 + v224;
                  float32x4_t v228 = vaddq_f32(*(float32x4_t *)(*((void *)&v305 + 1)+ 16 * v300.i32[0] * (v291 >> 16)+ 16 * (__int16)v138), *(float32x4_t *)&v226[16 * (__int16)v294]);
                  float32x4_t v229 = vmulq_n_f32(v228, 1.0 / v228.f32[3]);
                  v229.i32[3] = 1.0;
                  *(float32x4_t *)&v226[16 * (__int16)v294] = v228;
                  *(float32x4_t *)(v225 + 16 * (__int16)v294) = v229;
                  *(unsigned char *)(v227 + (__int16)v294) = 1;
                  *(int32x2_t *)v228.f32 = vadd_s32(v142, (int32x2_t)0xFFFF0000FFFFLL);
                  v230.i32[1] = v228.i32[1];
                  v230.i32[0] = 11;
                  *(int8x8_t *)v228.f32 = vbsl_s8((int8x8_t)vdup_lane_s32(vcgt_s32(v125, vshr_n_s32(vshl_n_s32(*(int32x2_t *)v228.f32, 0x10uLL), 0x10uLL)), 0), v230, *(int8x8_t *)v228.f32);
                  *(int32x2_t *)v229.f32 = vdup_lane_s32(vcgt_s32(v125, vshr_n_s32(vshl_n_s32(vdup_lane_s32(*(int32x2_t *)v228.f32, 1), 0x10uLL), 0x10uLL)), 0);
                  int8x8_t v231 = (int8x8_t)vadd_s32(v142, (int32x2_t)0x100000001);
                  v136.i32[0] = v223 - 11;
                  v137.i32[0] = v231.i16[0];
                  int8x8_t v232 = (int8x8_t)vmovl_s16((int16x4_t)vcgt_s32(v136, v137)).u64[0];
                  v233.i32[1] = v231.i32[1];
                  v233.i32[0] = v223 - 12;
                  int8x8_t v234 = vbsl_s8(v232, v231, v233);
                  uint64_t v235 = v228.u32[0] | 0xB00000000;
                  int8x8_t v236 = vbsl_s8(*(int8x8_t *)v229.f32, (int8x8_t)v235, *(int8x8_t *)v228.f32);
                  v229.i32[0] = v234.i16[2];
                  LODWORD(v235) = v222 - 11;
                  v229.i64[0] = vmovl_s16((int16x4_t)vcgt_s32((int32x2_t)v235, *(int32x2_t *)v229.f32)).u64[0];
                  LODWORD(v235) = v234.i32[0];
                  HIDWORD(v235) = v222 - 12;
                  int8x8_t v237 = vbsl_s8(*(int8x8_t *)v229.f32, v234, (int8x8_t)v235);
                  int v238 = v236.i16[2];
                  if (v236.i16[2] <= v237.i16[2])
                  {
                    int v239 = v237.i16[2];
                    int v240 = v236.i16[0];
                    int v241 = v237.i16[0];
                    if (v236.i16[0] <= v237.i16[0]) {
                      int v242 = v237.i16[0];
                    }
                    else {
                      int v242 = v236.i16[0];
                    }
                    do
                    {
                      int v243 = v240;
                      if (v240 <= v241)
                      {
                        do
                        {
                          HIWORD(v290) = v238;
                          LOWORD(v290) = v243;
                          {
                            v244 = (_WORD *)v303;
                            if ((unint64_t)v303 >= *((void *)&v303 + 1))
                            {
                              uint64_t v246 = (uint64_t)(v303 - *((void *)&v302 + 1)) >> 2;
                              unint64_t v247 = v246 + 1;
                              if ((unint64_t)(v246 + 1) >> 62) {
                                goto LABEL_261;
                              }
                              uint64_t v248 = *((void *)&v303 + 1) - *((void *)&v302 + 1);
                              if ((uint64_t)(*((void *)&v303 + 1) - *((void *)&v302 + 1)) >> 1 > v247) {
                                unint64_t v247 = v248 >> 1;
                              }
                              if ((unint64_t)v248 >= 0x7FFFFFFFFFFFFFFCLL) {
                                unint64_t v249 = 0x3FFFFFFFFFFFFFFFLL;
                              }
                              else {
                                unint64_t v249 = v247;
                              }
                              if (v249) {
                                unint64_t v249 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v249);
                              }
                              else {
                                uint64_t v250 = 0;
                              }
                              v251 = (_WORD *)(v249 + 4 * v246);
                              v251[1] = v238;
                              _WORD *v251 = v243;
                              v252 = (char *)v303;
                              v253 = (char *)*((void *)&v302 + 1);
                              v254 = v251;
                              if ((void)v303 != *((void *)&v302 + 1))
                              {
                                do
                                {
                                  int v255 = *((_DWORD *)v252 - 1);
                                  v252 -= 4;
                                  *((_DWORD *)v254 - 1) = v255;
                                  v254 -= 2;
                                }
                                while (v252 != v253);
                                v252 = (char *)*((void *)&v302 + 1);
                              }
                              v245 = v251 + 2;
                              *((void *)&v302 + 1) = v254;
                              *((void *)&v303 + 1) = v249 + 4 * v250;
                              if (v252) {
                                operator delete(v252);
                              }
                            }
                            else
                            {
                              *(_WORD *)(v303 + 2) = v238;
                              _WORD *v244 = v243;
                              v245 = v244 + 2;
                            }
                            *(void *)&long long v303 = v245;
                          }
                          _ZF = v243++ == v242;
                        }
                        while (!_ZF);
                      }
                      _ZF = v238++ == v239;
                    }
                    while (!_ZF);
                  }
                }
                else
                {
                  int v168 = 0;
                  __int32 v169 = v300.i32[1];
                  uint64_t v170 = v300.i32[0];
                  int32x2_t v171 = vadd_s32(*(int32x2_t *)&v138, v126);
                  int32x2_t v172 = vadd_s32(v142, v126);
                  __int16 v173 = v171.i16[0];
                  int32x2_t v174 = vmul_s32(vdup_n_s32(v300.u32[0]), vshr_n_s32(vshl_n_s32(vzip2_s32(v171, v172), 0x10uLL), 0x10uLL));
                  uint64_t v175 = *((void *)&v305 + 1) + 16 * v174.i32[0] + 16 * v173;
                  uint64_t v176 = v304;
                  uint64_t v177 = *((void *)&v305 + 1) + 16 * v174.i32[1] + 16 * v172.i16[0];
                  v178 = (char *)v307[0] + 16 * v174.i32[1] + 16 * v172.i16[0];
                  v179 = *(float **)&v309[1];
                  uint64_t v180 = v300.i32[0] - 11;
                  do
                  {
                    uint64_t v181 = 0;
                    do
                    {
                      if (*v179 > 0.0)
                      {
                        float32x4_t v182 = vmlaq_n_f32(*(float32x4_t *)&v178[v181], *(float32x4_t *)(v175 + v181), *v179);
                        float32x4_t v183 = vmulq_n_f32(v182, 1.0 / v182.f32[3]);
                        v183.i32[3] = 1.0;
                        *(float32x4_t *)&v178[v181] = v182;
                        *(float32x4_t *)(v177 + v181) = v183;
                      }
                      ++v179;
                      v181 += 16;
                    }
                    while (v181 != 176);
                    v175 += v181 + 16 * v180;
                    v177 += v181 + 16 * v180;
                    ++v168;
                    v178 += 16 * v180 + v181;
                  }
                  while (v168 != 11);
                  uint64_t v184 = v176 + (int)v170 * (uint64_t)(v133 - 1) + (__int16)v294;
                  *(unsigned char *)(v184 + 1) = 1;
                  *(_WORD *)(v184 - 1) = 257;
                  uint64_t v185 = v184 + v170 - 3;
                  *(_WORD *)(v185 + 2) = 257;
                  v185 += 2;
                  *(unsigned char *)(v185 + 2) = 1;
                  uint64_t v186 = v185 + v170 - 3;
                  int32x2_t v187 = vadd_s32(v142, vdup_n_s32(0xFFFEu));
                  int32x2_t v188 = vdup_lane_s32(vcgt_s32(v127, vshr_n_s32(vshl_n_s32(v187, 0x10uLL), 0x10uLL)), 0);
                  int8x8_t v189 = (int8x8_t)vadd_s32(v142, (int32x2_t)0x200000002);
                  v190.i32[1] = v187.i32[1];
                  v190.i32[0] = 11;
                  int32x2_t v191 = (int32x2_t)vbsl_s8((int8x8_t)v188, v190, (int8x8_t)v187);
                  v188.i32[0] = v180;
                  v190.i32[0] = v189.i16[0];
                  int8x8_t v192 = (int8x8_t)vmovl_s16((int16x4_t)vcgt_s32(v188, (int32x2_t)v190)).u64[0];
                  v190.i32[1] = v189.i32[1];
                  v190.i32[0] = v170 - 12;
                  int8x8_t v193 = vbsl_s8(v192, v189, v190);
                  *(unsigned char *)(v186 + 5) = 1;
                  int32x2_t v194 = vdup_lane_s32(vcgt_s32(v127, vshr_n_s32(vshl_n_s32(vdup_lane_s32(v191, 1), 0x10uLL), 0x10uLL)), 0);
                  *(_WORD *)(v186 + 3) = 257;
                  uint64_t v195 = v191.u32[0] | 0xB00000000;
                  int8x8_t v196 = vbsl_s8((int8x8_t)v194, (int8x8_t)v195, (int8x8_t)v191);
                  v194.i32[0] = v193.i16[2];
                  LODWORD(v195) = v169 - 11;
                  int8x8_t v197 = (int8x8_t)vmovl_s16((int16x4_t)vcgt_s32((int32x2_t)v195, v194)).u64[0];
                  LODWORD(v195) = v193.i32[0];
                  HIDWORD(v195) = v169 - 12;
                  int8x8_t v198 = vbsl_s8(v197, v193, (int8x8_t)v195);
                  int v199 = v196.i16[2];
                  if (v196.i16[2] <= v198.i16[2])
                  {
                    int v200 = v198.i16[2];
                    int v201 = v196.i16[0];
                    int v202 = v198.i16[0];
                    if (v196.i16[0] <= v198.i16[0]) {
                      int v203 = v198.i16[0];
                    }
                    else {
                      int v203 = v196.i16[0];
                    }
                    do
                    {
                      int v204 = v201;
                      if (v201 <= v202)
                      {
                        do
                        {
                          HIWORD(v293) = v199;
                          LOWORD(v293) = v204;
                          {
                            v205 = (_WORD *)v303;
                            if ((unint64_t)v303 >= *((void *)&v303 + 1))
                            {
                              uint64_t v207 = (uint64_t)(v303 - *((void *)&v302 + 1)) >> 2;
                              unint64_t v208 = v207 + 1;
                              if ((unint64_t)(v207 + 1) >> 62) {
                                goto LABEL_261;
                              }
                              uint64_t v209 = *((void *)&v303 + 1) - *((void *)&v302 + 1);
                              if ((uint64_t)(*((void *)&v303 + 1) - *((void *)&v302 + 1)) >> 1 > v208) {
                                unint64_t v208 = v209 >> 1;
                              }
                              if ((unint64_t)v209 >= 0x7FFFFFFFFFFFFFFCLL) {
                                unint64_t v210 = 0x3FFFFFFFFFFFFFFFLL;
                              }
                              else {
                                unint64_t v210 = v208;
                              }
                              if (v210) {
                                unint64_t v210 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v210);
                              }
                              else {
                                uint64_t v211 = 0;
                              }
                              v212 = (_WORD *)(v210 + 4 * v207);
                              v212[1] = v199;
                              _WORD *v212 = v204;
                              v213 = (char *)v303;
                              v214 = (char *)*((void *)&v302 + 1);
                              v215 = v212;
                              if ((void)v303 != *((void *)&v302 + 1))
                              {
                                do
                                {
                                  int v216 = *((_DWORD *)v213 - 1);
                                  v213 -= 4;
                                  *((_DWORD *)v215 - 1) = v216;
                                  v215 -= 2;
                                }
                                while (v213 != v214);
                                v213 = (char *)*((void *)&v302 + 1);
                              }
                              v206 = v212 + 2;
                              *((void *)&v302 + 1) = v215;
                              *((void *)&v303 + 1) = v210 + 4 * v211;
                              if (v213) {
                                operator delete(v213);
                              }
                            }
                            else
                            {
                              *(_WORD *)(v303 + 2) = v199;
                              _WORD *v205 = v204;
                              v206 = v205 + 2;
                            }
                            *(void *)&long long v303 = v206;
                          }
                          _ZF = v204++ == v203;
                        }
                        while (!_ZF);
                      }
                      _ZF = v199++ == v200;
                    }
                    while (!_ZF);
                  }
                }
                ++DWORD2(v309[2]);
LABEL_238:
                if ((void)v303 == *((void *)&v302 + 1))
                {
                  __int32 v285 = v300.i32[0];
                  break;
                }
              }
            }
            int v256 = v298;
            size_t v257 = v299;
            int v258 = 4 * v298;
            v259 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:4 * v298 * v299];
            uint64_t v260 = *((void *)&v305 + 1);
            id v261 = v259;
            v262 = (__int32 *)[v261 mutableBytes];
            if ((int)v257 >= 1)
            {
              int v263 = 0;
              float32x4_t v264 = (float32x4_t)vdupq_n_s32(0x45CDF000u);
              v265 = (float32x4_t *)(v260 + 16 * (11 * v285 + 11));
              float32x4_t v266 = (float32x4_t)vdupq_n_s32(0x437F0000u);
              do
              {
                int v267 = v256;
                if (v256 >= 1)
                {
                  do
                  {
                    float32x4_t v268 = *v265++;
                    float32x4_t v269 = vmulq_f32(v268, v264);
                    v269.i32[3] = v268.i32[3];
                    int8x16_t v270 = (int8x16_t)vmulq_f32(v269, v266);
                    int v271 = (int)*(float *)v270.i32;
                    v270.i32[0] = vextq_s8(v270, v270, 8uLL).i32[1];
                    *(uint32x2_t *)v270.i8 = vshl_u32((uint32x2_t)vcvt_s32_f32(*(float32x2_t *)v270.i8), (uint32x2_t)0x800000018);
                    *v262++ = v270.i32[0] | ((int)*(float *)&v270.i32[2] << 16) | v271 | v270.i32[1];
                    --v267;
                  }
                  while (v267);
                }
                v265 += 22;
                ++v263;
              }
              while (v263 != v257);
            }
            v272 = CGDataProviderCreateWithCFData((CFDataRef)v261);
            v273 = CGColorSpaceCreateWithName(name);
            v4 = CGImageCreate(v256, v257, 8uLL, 0x20uLL, v258, v273, 0, v272, 0, 0, kCGRenderingIntentDefault);
            CGDataProviderRelease(v272);
            CGColorSpaceRelease(v273);

            if (*(void *)&v309[1])
            {
              *((void *)&v309[1] + 1) = *(void *)&v309[1];
              operator delete(*(void **)&v309[1]);
            }
            for (uint64_t n = 0; n != -72; n -= 24)
            {
              v275 = *(void **)((char *)&v308 + n + 8);
              if (v275)
              {
                *(void *)((char *)v309 + n) = v275;
                operator delete(v275);
              }
            }
            if (v307[0])
            {
              v307[1] = v307[0];
              operator delete(v307[0]);
            }
            if (*((void *)&v305 + 1))
            {
              *(void *)&long long v306 = *((void *)&v305 + 1);
              operator delete(*((void **)&v305 + 1));
            }
            if ((void)v304)
            {
              *((void *)&v304 + 1) = v304;
              operator delete((void *)v304);
            }
            if (*((void *)&v302 + 1))
            {
              *(void *)&long long v303 = *((void *)&v302 + 1);
              operator delete(*((void **)&v302 + 1));
            }
            free(v278);
            free(v277);
          }
          else
          {
            return 0;
          }
        }
      }
    }
  }
  return v4;
}

+ (void)applyRepairStrokeToMutableBuffer:(id)a3 brushStroke:(id)a4 sourceOffset:(CGPoint)a5 repairEdges:(BOOL)a6
{
  uint64_t v296 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [v9 size];
  uint64_t v13 = v12;
  long long v193 = 0u;
  long long v194 = 0u;
  if (v10)
  {
    [v10 extent];
  }
  else
  {
    long long v191 = 0uLL;
    long long v192 = 0uLL;
  }
  uint64_t v188 = 0;
  uint64_t v187 = 0;
  uint64_t v189 = v11;
  uint64_t v190 = v13;
  NUPixelRectIntersection();
  long long v185 = v193;
  long long v186 = v194;
  if ((NUPixelRectIsEmpty() & 1) == 0)
  {
    [v10 radius];
    float v15 = v14;
    uint64_t v16 = NUPixelPointFromCGPoint();
    v178[1] = 0;
    v178[0] = 0;
    v178[2] = v11;
    v178[3] = v13;
    v177[0] = v193;
    v177[1] = v194;
    +[PIRepairUtilities calcExtentsForStrokeRadius:offset:inputImageExtent:maskExtent:repairExtent:textureExtent:sourceExtent:](PIRepairUtilities, "calcExtentsForStrokeRadius:offset:inputImageExtent:maskExtent:repairExtent:textureExtent:sourceExtent:", v16, v17, v178, v177, &v183, &v181, v15, &v179);
    long long v175 = v183;
    long long v176 = v184;
    if ((NUPixelRectIsEmpty() & 1) == 0)
    {
      long long v173 = v181;
      long long v174 = v182;
      if ((NUPixelRectIsEmpty() & 1) == 0)
      {
        long long v171 = v179;
        long long v172 = v180;
        if ((NUPixelRectIsEmpty() & 1) == 0)
        {
          long long v169 = 0u;
          long long v170 = 0u;
          long long v167 = v183;
          long long v168 = v184;
          uint64_t v163 = 0;
          uint64_t v164 = 0;
          uint64_t v165 = v11;
          uint64_t v166 = v13;
          NUPixelRectFlipYOrigin();
          memset(v162, 0, sizeof(v162));
          int32x2_t v141 = [a1 extractRGBAfPixelsFromImage:v9 fromROI:v162];
          long long v159 = v179;
          long long v160 = v180;
          uint64_t v155 = 0;
          uint64_t v156 = 0;
          uint64_t v157 = v11;
          uint64_t v158 = v13;
          NUPixelRectFlipYOrigin();
          long long v138 = [a1 extractRGBAfPixelsFromImage:v9 fromROI:v161];
          long long v152 = v181;
          long long v153 = v182;
          uint64_t v148 = 0;
          uint64_t v149 = 0;
          uint64_t v150 = v11;
          uint64_t v151 = v13;
          NUPixelRectFlipYOrigin();
          v139 = [a1 extractRGBAfPixelsFromImage:v9 fromROI:v154];
          id v18 = objc_alloc(MEMORY[0x1E4F7A598]);
          long long v19 = v194;
          uint64_t v20 = [MEMORY[0x1E4F7A5D8] R8];
          v140 = (void *)[v18 initWithSize:v19 format:v20];

          [MEMORY[0x1E4F7A390] rasterizeBrushStroke:v10 atPoint:v193 toBuffer:v140];
          uint64_t v21 = [v138 bytes];
          int v22 = [v138 rowBytes];
          uint64_t v23 = [v139 bytes];
          int v24 = [v139 rowBytes];
          uint64_t v136 = [v140 bytes];
          int v135 = [v140 rowBytes];
          uint64_t v25 = [v141 mutableBytes];
          int v26 = [v141 rowBytes];
          long long v266 = v184;
          long long v265 = v183;
          long long v264 = v180;
          long long v263 = v179;
          long long v262 = v184;
          long long v261 = v183;
          NUPixelRectIntersection();
          if (NUPixelRectEqualToRect())
          {
            long long v251 = v179;
            long long v252 = v180;
            unsigned int v27 = NUWidth();
            long long v249 = v179;
            long long v250 = v180;
            unsigned int v28 = NUHeight();
            v253[1] = 0;
            uint64_t v254 = v21;
            uint64_t v255 = v22;
            long long v256 = xmmword_1A980BA40;
            uint64_t v257 = v27;
            uint64_t v258 = v28;
            uint64_t v259 = 1;
            __int16 v260 = 1;
            v253[0] = &unk_1EFFD4A20;
            long long v239 = v181;
            long long v240 = v182;
            unsigned int v29 = NUWidth();
            long long v237 = v181;
            long long v238 = v182;
            unsigned int v30 = NUHeight();
            v241[1] = 0;
            uint64_t v242 = v23;
            uint64_t v243 = v24;
            long long v244 = xmmword_1A980BA40;
            unint64_t v245 = v29;
            unint64_t v246 = v30;
            uint64_t v247 = 1;
            __int16 v248 = 1;
            v241[0] = &unk_1EFFD4A20;
            long long v227 = v183;
            long long v228 = v184;
            unsigned int v31 = NUWidth();
            long long v225 = v183;
            long long v226 = v184;
            unsigned int v32 = NUHeight();
            v229[1] = 0;
            uint64_t v230 = v25;
            uint64_t v231 = v26;
            long long v232 = xmmword_1A980BA40;
            unint64_t v233 = v31;
            unint64_t v234 = v32;
            uint64_t v235 = 1;
            __int16 v236 = 1;
            v229[0] = &unk_1EFFD4A20;
            long long v215 = v193;
            long long v216 = v194;
            unsigned int v33 = NUWidth();
            long long v213 = v193;
            long long v214 = v194;
            unsigned int v34 = NUHeight();
            v217[1] = 0;
            uint64_t v218 = v136;
            uint64_t v219 = v135;
            long long v220 = xmmword_1A980BA50;
            unint64_t v221 = v33;
            unint64_t v222 = v34;
            uint64_t v223 = 1;
            __int16 v224 = 1;
            v217[0] = &unk_1EFFD4A60;
            uint64_t v211 = &unk_1EFFD4BE8;
            int v212 = 0;
            long long v209 = v183;
            long long v210 = v184;
            int v35 = NUMinX();
            long long v207 = v179;
            long long v208 = v180;
            int v36 = NUMinX();
            long long v205 = v179;
            long long v206 = v180;
            int v137 = NUMaxY();
            long long v203 = v183;
            long long v204 = v184;
            int v37 = NUMaxY();
            long long v201 = v179;
            long long v202 = v180;
            int v38 = NUMaxX();
            long long v199 = v183;
            long long v200 = v184;
            int v39 = NUMaxX();
            long long v197 = v183;
            long long v198 = v184;
            int v40 = NUMinY();
            long long v195 = v179;
            long long v196 = v180;
            int v41 = NUMinY();
            unsigned int v42 = v35 - v36;
            unsigned int v43 = v38 - v39;
            if (v42 <= v43) {
              unsigned int v44 = v43;
            }
            else {
              unsigned int v44 = v42;
            }
            CGrNavigator::CGrNavigator((CGrNavigator *)&dest, (CMemEnv *)&v211, v221, v222, 16);
            dest.data = &unk_1EFFD4A20;
            if (v284)
            {
              CGrNavigator::CGrNavigator((CGrNavigator *)buf, (CMemEnv *)&v211, v221, v222, 16);
              *(void *)buf = &unk_1EFFD4A20;
              if (v295)
              {
                LODWORD(v45) = v42;
                int v46 = v137 - v37;
                DWORD1(v45) = v137 - v37;
                DWORD2(v45) = v43;
                HIDWORD(v45) = v40 - v41;
                *(_OWORD *)&src.height = v45;
                src.data = &v211;
                src.size_t rowBytes = 0x3CA3D70A00000000;
                uint64_t v286 = 0x3F00000000000001;
                char v287 = 0;
                char v289 = 0;
                __int16 v288 = 0;
                bzero(&v290, 0x304uLL);
                if (v44 != 1 && (uint64_t v47 = 2 * v44, v245 == v221 + v47) && v246 == v222 + v47)
                {
                  int v275 = 1056964608;
                  int v276 = 1065353216;
                  __int16 v277 = -1;
                  int v278 = 0;
                  __int16 v279 = 0;
                  v273 = &v211;
                  float v274 = (float)v44;
                  CGrNavigator::CGrNavigator((CGrNavigator *)v270, (CMemEnv *)&v211, v245, v246, 4);
                  v270[0] = &unk_1EFFD4A40;
                  if (v272)
                  {
                    CGrNavigator::CGrNavigator((CGrNavigator *)v267, (CMemEnv *)&v211, v282, v283, 4);
                    v267[0] = &unk_1EFFD4A40;
                    if (v269)
                    {
                      uint64_t v48 = 0;
                      while (1)
                      {
                        uint64_t v49 = v271;
                        if (v271)
                        {
                          uint64_t v50 = 0;
                          uint64_t v51 = v270[6];
                          uint64_t v52 = v242;
                          uint64_t v53 = v243;
                          uint64_t v54 = v244;
                          v55 = (_DWORD *)v270[2];
                          uint64_t v56 = v270[3];
                          do
                          {
                            uint64_t v57 = v52;
                            int v58 = v55;
                            for (uint64_t i = v51; i; --i)
                            {
                              *v58++ = *(_DWORD *)(v57 + 4 * v48);
                              v57 += v54;
                            }
                            ++v50;
                            v55 = (_DWORD *)((char *)v55 + v56);
                            v52 += v53;
                          }
                          while (v50 != v49);
                        }
                        if (CMedian::Median((uint64_t)&v273)) {
                          break;
                        }
                        uint64_t v60 = v268;
                        if (v268)
                        {
                          uint64_t v61 = 0;
                          uint64_t v62 = v267[6];
                          vImagePixelCount width = dest.width;
                          size_t rowBytes = dest.rowBytes;
                          uint64_t v65 = v281;
                          int v66 = (int *)v267[2];
                          uint64_t v67 = v267[3];
                          do
                          {
                            int v68 = v66;
                            vImagePixelCount v69 = width;
                            for (uint64_t j = v62; j; --j)
                            {
                              int v71 = *v68++;
                              *(_DWORD *)(v69 + 4 * v48) = v71;
                              v69 += v65;
                            }
                            ++v61;
                            width += rowBytes;
                            int v66 = (int *)((char *)v66 + v67);
                          }
                          while (v61 != v60);
                        }
                        if (++v48 == 4)
                        {
                          CGrNavigator::~CGrNavigator((CGrNavigator *)v267);
                          CGrNavigator::~CGrNavigator((CGrNavigator *)v270);
                          goto LABEL_34;
                        }
                      }
                    }
                    CGrNavigator::~CGrNavigator((CGrNavigator *)v267);
                  }
                  CGrNavigator::~CGrNavigator((CGrNavigator *)v270);
                }
                else if (!CInwardBlur::InwardBlur((uint64_t)&src))
                {
LABEL_34:
                  HIBYTE(v288) = a6;
                  if (!CInwardBlur::InwardBlur((uint64_t)&src))
                  {
                    switch((void)v220)
                    {
                      case 4:
                        unint64_t v101 = v234;
                        if (v234)
                        {
                          uint64_t v102 = 0;
                          unsigned int v103 = 0;
                          unint64_t v104 = v233;
                          do
                          {
                            if (v104)
                            {
                              uint64_t v105 = 0;
                              uint64_t v106 = v103 + v46;
                              unsigned int v107 = 1;
                              do
                              {
                                uint64_t v108 = v255 * v106;
                                uint64_t v109 = v254 + 16 * (v42 + v107 - 1);
                                float v110 = *(float *)(v218 + 4 * v105 + v219 * v102);
                                if (v110 <= 0.02)
                                {
                                  float32x4_t v112 = *(float32x4_t *)(v108 + v109);
                                }
                                else
                                {
                                  float v111 = (float)(v110 * 2.0388) + -0.040776;
                                  if (v110 >= 0.51049) {
                                    float v111 = 1.0;
                                  }
                                  float32x4_t v112 = vmlaq_n_f32(*(float32x4_t *)(v109 + v108), vaddq_f32(vsubq_f32(*(float32x4_t *)(16 * (v42 + v107 - 1) + v242 + v243 * v106), vaddq_f32(*(float32x4_t *)(v109 + v108), *(float32x4_t *)(16 * v105 + dest.width + dest.rowBytes * v102))), *(float32x4_t *)(16 * v105 + *(void *)&v293[2] + v294 * v102)), v111);
                                }
                                *(float32x4_t *)(v231 * v102 + v230 + 16 * v105) = v112;
                                uint64_t v105 = v107;
                                unint64_t v104 = v233;
                                BOOL v84 = v233 > v107++;
                              }
                              while (v84);
                              unint64_t v101 = v234;
                            }
                            uint64_t v102 = ++v103;
                          }
                          while (v101 > v103);
                        }
                        break;
                      case 2:
                        unint64_t v89 = v234;
                        if (v234)
                        {
                          uint64_t v90 = 0;
                          unsigned int v91 = 0;
                          unint64_t v92 = v233;
                          do
                          {
                            if (v92)
                            {
                              uint64_t v93 = 0;
                              uint64_t v94 = v91 + v46;
                              unsigned int v95 = 1;
                              do
                              {
                                uint64_t v96 = v255 * v94;
                                uint64_t v97 = v254 + 16 * (v42 + v95 - 1);
                                unsigned int v98 = *(unsigned __int16 *)(v218 + 2 * v93 + v219 * v90);
                                if (v98 <= 0x51E)
                                {
                                  float32x4_t v100 = *(float32x4_t *)(v96 + v97);
                                }
                                else
                                {
                                  if (v98 >= 0x82AE) {
                                    float v99 = 1.0;
                                  }
                                  else {
                                    float v99 = (float)((133613 * v98 - 175033030) >> 16) * 0.000015259;
                                  }
                                  float32x4_t v100 = vmlaq_n_f32(*(float32x4_t *)(v97 + v96), vaddq_f32(vsubq_f32(*(float32x4_t *)(16 * (v42 + v95 - 1) + v242 + v243 * v94), vaddq_f32(*(float32x4_t *)(v97 + v96), *(float32x4_t *)(16 * v93 + dest.width + dest.rowBytes * v90))), *(float32x4_t *)(16 * v93 + *(void *)&v293[2] + v294 * v90)), v99);
                                }
                                *(float32x4_t *)(v231 * v90 + v230 + 16 * v93) = v100;
                                uint64_t v93 = v95;
                                unint64_t v92 = v233;
                                BOOL v84 = v233 > v95++;
                              }
                              while (v84);
                              unint64_t v89 = v234;
                            }
                            uint64_t v90 = ++v91;
                          }
                          while (v89 > v91);
                        }
                        break;
                      case 1:
                        unint64_t v72 = v234;
                        if (v234)
                        {
                          uint64_t v73 = 0;
                          unsigned int v74 = 0;
                          unint64_t v75 = v233;
                          do
                          {
                            if (v75)
                            {
                              uint64_t v76 = 0;
                              uint64_t v77 = v74 + v46;
                              unsigned int v78 = 1;
                              do
                              {
                                uint64_t v79 = v255 * v77;
                                uint64_t v80 = v254 + 16 * (v42 + v78 - 1);
                                unsigned int v81 = *(unsigned __int8 *)(v76 + v218 + v219 * v73);
                                if (v81 <= 5)
                                {
                                  float32x4_t v83 = *(float32x4_t *)(v79 + v80);
                                }
                                else
                                {
                                  if (v81 >= 0x82) {
                                    float v82 = 1.0;
                                  }
                                  else {
                                    float v82 = (float)(523 * v81 - 2615) * 0.000015259;
                                  }
                                  float32x4_t v83 = vmlaq_n_f32(*(float32x4_t *)(v80 + v79), vaddq_f32(vsubq_f32(*(float32x4_t *)(16 * (v42 + v78 - 1) + v242 + v243 * v77), vaddq_f32(*(float32x4_t *)(v80 + v79), *(float32x4_t *)(16 * v76 + dest.width + dest.rowBytes * v73))), *(float32x4_t *)(16 * v76 + *(void *)&v293[2] + v294 * v73)), v82);
                                }
                                *(float32x4_t *)(v231 * v73 + v230 + 16 * v76) = v83;
                                uint64_t v76 = v78;
                                unint64_t v75 = v233;
                                BOOL v84 = v233 > v78++;
                              }
                              while (v84);
                              unint64_t v72 = v234;
                            }
                            uint64_t v73 = ++v74;
                          }
                          while (v72 > v74);
                        }
                        break;
                    }
                  }
                }
              }
              CGrNavigator::~CGrNavigator((CGrNavigator *)buf);
            }
            CGrNavigator::~CGrNavigator((CGrNavigator *)&dest);
            CGrNavigator::~CGrNavigator((CGrNavigator *)v217);
            CGrNavigator::~CGrNavigator((CGrNavigator *)v229);
            CGrNavigator::~CGrNavigator((CGrNavigator *)v241);
            CGrNavigator::~CGrNavigator((CGrNavigator *)v253);

            id v85 = objc_alloc(MEMORY[0x1E4F7A598]);
            long long v86 = v184;
            size_t v87 = [MEMORY[0x1E4F7A5D8] RGBAh];
            unint64_t v88 = (void *)[v85 initWithSize:v86 format:v87];

            src.data = (void *)[v141 mutableBytes];
            long long v146 = v183;
            long long v147 = v184;
            src.height = NUHeight();
            long long v144 = v183;
            long long v145 = v184;
            src.vImagePixelCount width = 4 * NUWidth();
            src.size_t rowBytes = [v141 rowBytes];
            vImage_Buffer dest = src;
            dest.data = (void *)[v88 mutableBytes];
            dest.size_t rowBytes = [v88 rowBytes];
            if (!vImageConvert_PlanarFtoPlanar16F(&src, &dest, 0))
            {
              v142[0] = 0;
              v142[1] = 0;
              long long v143 = v170;
              [MEMORY[0x1E4F7A528] copyPixelsToImage:v9 atPoint:v169 fromBuffer:v88 inRect:v142];

              goto LABEL_57;
            }
            v121 = NUAssertLogger();
            if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
            {
              v122 = [NSString stringWithFormat:@"Bad fixed float to half float conversion"];
              *(_DWORD *)buf = 138543362;
              *(void *)&buf[4] = v122;
              _os_log_error_impl(&dword_1A9680000, v121, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
            }
            int v123 = (const void **)MEMORY[0x1E4F7A308];
            specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
            int32x2_t v125 = NUAssertLogger();
            BOOL v126 = os_log_type_enabled(v125, OS_LOG_TYPE_ERROR);
            if (specific)
            {
              if (v126)
              {
                uint64_t v132 = dispatch_get_specific(*v123);
                __int16 v133 = [MEMORY[0x1E4F29060] callStackSymbols];
                v134 = [v133 componentsJoinedByString:@"\n"];
                *(_DWORD *)buf = 138543618;
                *(void *)&buf[4] = v132;
                __int16 v292 = 2114;
                *(void *)int v293 = v134;
                _os_log_error_impl(&dword_1A9680000, v125, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
              }
            }
            else if (v126)
            {
              int32x2_t v127 = [MEMORY[0x1E4F29060] callStackSymbols];
              std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v128 = [v127 componentsJoinedByString:@"\n"];
              *(_DWORD *)buf = 138543362;
              *(void *)&buf[4] = v128;
              _os_log_error_impl(&dword_1A9680000, v125, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
            }
            _NUAssertFailHandler();
          }
          else
          {
            v113 = NUAssertLogger();
            if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
            {
              uint64_t v114 = [NSString stringWithFormat:@"repairBounds not fully contained in srcBounds in repairWithReef"];
              LODWORD(src.data) = 138543362;
              *(void **)((char *)&src.data + 4) = v114;
              _os_log_error_impl(&dword_1A9680000, v113, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&src, 0xCu);
            }
            unint64_t v115 = (const void **)MEMORY[0x1E4F7A308];
            uint64_t v116 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
            unint64_t v117 = NUAssertLogger();
            BOOL v118 = os_log_type_enabled(v117, OS_LOG_TYPE_ERROR);
            if (v116)
            {
              if (v118)
              {
                uint64_t v129 = dispatch_get_specific(*v115);
                v130 = [MEMORY[0x1E4F29060] callStackSymbols];
                int32x2_t v131 = [v130 componentsJoinedByString:@"\n"];
                LODWORD(src.data) = 138543618;
                *(void **)((char *)&src.data + 4) = v129;
                WORD2(src.height) = 2114;
                *(vImagePixelCount *)((char *)&src.height + 6) = (vImagePixelCount)v131;
                _os_log_error_impl(&dword_1A9680000, v117, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&src, 0x16u);
              }
            }
            else if (v118)
            {
              v119 = [MEMORY[0x1E4F29060] callStackSymbols];
              v120 = [v119 componentsJoinedByString:@"\n"];
              LODWORD(src.data) = 138543362;
              *(void **)((char *)&src.data + 4) = v120;
              _os_log_error_impl(&dword_1A9680000, v117, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&src, 0xCu);
            }
            _NUAssertFailHandler();
          }
          __break(1u);
        }
      }
    }
  }
LABEL_57:
}

+ (BOOL)applyRepairMLStrokeToMutableBuffer:(id)a3 brushStroke:(id)a4 detectedFaces:(id)a5 context:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v73 = a6;
  unsigned int v74 = v11;
  uint64_t v67 = v13;
  int v68 = v12;
  uint64_t v76 = [v11 format];
  float v14 = (void *)[MEMORY[0x1E4F7A500] newCIImageFromBufferImage:v11];
  uint64_t v79 = v14;
  float v15 = [v12 ciImageTiled:0 closed:1 pressureMode:1];
  long long v151 = 0u;
  long long v152 = 0u;
  uint64_t v77 = v15;
  if (v12) {
    [v12 clipRect];
  }
  long long v149 = 0u;
  long long v150 = 0u;
  [v14 extent];
  NUPixelRectFromCGRect();
  long long v147 = 0u;
  long long v148 = 0u;
  [v15 extent];
  NUPixelRectFromCGRect();
  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  NUPixelRectIntersection();
  uint64_t v16 = vcvtd_n_s64_f64((double)NUPixelSizeLargestDimension(), 2uLL);
  uint64_t v17 = 768;
  if ((unint64_t)v16 > 0x300) {
    uint64_t v17 = v16;
  }
  if ((unint64_t)v16 <= 0x200) {
    uint64_t v17 = 512;
  }
  if (v16 <= 256) {
    uint64_t v18 = 256;
  }
  else {
    uint64_t v18 = v17;
  }
  if (v18 >= 0) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = v18 + 1;
  }
  if (v18 >= 0) {
    uint64_t v20 = v18;
  }
  else {
    uint64_t v20 = v18 + 1;
  }
  long long v139 = v151;
  long long v140 = v152;
  uint64_t v21 = -(v19 >> 1);
  uint64_t v22 = -(v20 >> 1);
  if (NUPixelRectIsEmpty())
  {
    long long v151 = v149;
    long long v152 = v150;
  }
  uint64_t v135 = v21;
  uint64_t v136 = -(v20 >> 1);
  uint64_t v137 = v18;
  uint64_t v138 = v18;
  uint64_t v23 = NUWidth();
  long long v133 = v151;
  long long v134 = v152;
  if (v23 <= NUWidth()) {
    uint64_t v24 = v18;
  }
  else {
    uint64_t v24 = v152;
  }
  uint64_t v129 = v21;
  uint64_t v130 = v22;
  uint64_t v131 = v24;
  uint64_t v132 = v18;
  uint64_t v25 = NUHeight();
  long long v127 = v151;
  long long v128 = v152;
  uint64_t v26 = NUHeight();
  uint64_t v27 = *((void *)&v152 + 1);
  if (v25 <= v26) {
    uint64_t v27 = v18;
  }
  uint64_t v123 = v21;
  uint64_t v124 = v22;
  uint64_t v125 = v24;
  uint64_t v126 = v27;
  long long v121 = v151;
  long long v122 = v152;
  NUPixelRectConstrainToRect();
  CGFloat a = v116.a;
  CGFloat b = v116.b;
  CGFloat c = v116.c;
  CGFloat v117 = v116.a;
  CGFloat v118 = v116.b;
  CGFloat v119 = v116.c;
  CGFloat d = v116.d;
  CGFloat v120 = v116.d;
  NUPixelRectToCGRect();
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  int v39 = objc_msgSend(v79, "imageByCroppingToRect:");

  int v40 = objc_msgSend(v77, "imageByCroppingToRect:", v32, v34, v36, v38);

  [v39 extent];
  double v42 = v41;
  [v39 extent];
  memset(&v116, 0, sizeof(v116));
  CGAffineTransformMakeTranslation(&v116, -v42, -v43);
  CGAffineTransform v115 = v116;
  unsigned int v44 = [v39 imageByApplyingTransform:&v115];

  CGAffineTransform v114 = v116;
  long long v45 = [v40 imageByApplyingTransform:&v114];

  long long v110 = v145;
  long long v111 = v146;
  unsigned int v78 = v45;
  uint64_t v80 = v44;
  NUPixelRectOffset();
  long long v145 = v112;
  long long v146 = v113;
  int v46 = (void *)MEMORY[0x1E4F1E050];
  uint64_t v47 = [MEMORY[0x1E4F1E008] whiteColor];
  uint64_t v48 = [v46 imageWithColor:v47];
  [v44 extent];
  unint64_t v72 = objc_msgSend(v48, "imageByCroppingToRect:");

  uint64_t v49 = [v45 imageByApplyingFilter:@"CIColorInvert"];
  int v71 = [v49 imageByCompositingOverImage:v72];

  *(CGFloat *)uint64_t v109 = a;
  *(CGFloat *)&v109[1] = b;
  *(CGFloat *)&v109[2] = c;
  *(CGFloat *)&v109[3] = d;
  unint64_t v75 = [a1 prepareForCIFilterWithFaces:v13 cropRect:v109];
  uint64_t v50 = [MEMORY[0x1E4F1E040] filterWithName:@"CIInpaintingFilter"];
  [v50 setValue:v44 forKey:@"inputImage"];
  [v50 setValue:v71 forKey:@"inputMaskImage"];
  uint64_t v51 = (void *)MEMORY[0x1E4F1E080];
  long long v107 = v145;
  long long v108 = v146;
  NUPixelRectToCGRect();
  uint64_t v52 = objc_msgSend(v51, "vectorWithCGRect:");
  [v50 setValue:v52 forKey:@"inputMaskBoundingBox"];

  if (v75) {
    [v50 setValue:v75 forKey:@"inputFaceBoundingBoxes"];
  }
  vImagePixelCount v69 = [v50 outputImage];
  CGFloat v103 = a;
  CGFloat v104 = b;
  CGFloat v105 = c;
  CGFloat v106 = d;
  uint64_t v53 = [v76 alignedRowBytesForWidth:NUWidth()];
  CGFloat v99 = a;
  CGFloat v100 = b;
  CGFloat v101 = c;
  CGFloat v102 = d;
  id v66 = [MEMORY[0x1E4F1CA58] dataWithLength:NUHeight() * v53];
  id v54 = objc_alloc(MEMORY[0x1E4F1E070]);
  id v55 = v66;
  uint64_t v56 = [v55 mutableBytes];
  CGFloat v95 = a;
  CGFloat v96 = b;
  CGFloat v97 = c;
  CGFloat v98 = d;
  uint64_t v57 = NUWidth();
  CGFloat v91 = a;
  CGFloat v92 = b;
  CGFloat v93 = c;
  CGFloat v94 = d;
  int v58 = objc_msgSend(v54, "initWithBitmapData:width:height:bytesPerRow:format:", v56, v57, NUHeight(), v53, objc_msgSend(v76, "CIFormat"));
  v59 = [v74 colorSpace];
  objc_msgSend(v58, "setColorSpace:", objc_msgSend(v59, "CGColorSpace"));

  [v58 setLabel:@"PIRepair-applyRepairMLStrokeToMutableBuffer"];
  uint64_t v60 = [v73 startTaskToRender:v69 toDestination:v58 error:a7];
  id v61 = (id)[v60 waitUntilCompletedAndReturnError:a7];

  long long v112 = 0u;
  long long v113 = 0u;
  CGFloat v87 = a;
  CGFloat v88 = b;
  CGFloat v89 = c;
  CGFloat v90 = d;
  uint64_t v83 = 0;
  uint64_t v84 = 0;
  uint64_t v85 = [v74 size];
  uint64_t v86 = v62;
  NUPixelRectFlipYOrigin();
  v63 = (void *)MEMORY[0x1E4F7A528];
  v82[0] = v112;
  v82[1] = v113;
  id v64 = v55;
  objc_msgSend(v63, "copyPixelsToImage:rect:srcPtr:srcPtrRowBytes:", v74, v82, objc_msgSend(v64, "mutableBytes"), v53);

  return 1;
}

+ (id)prepareForCIFilterWithFaces:(id)a3 cropRect:(id *)a4
{
  id v5 = a3;
  v6 = v5;
  if (v5 && (uint64_t v7 = [v5 count]) != 0)
  {
    uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
    uint64_t v8 = 0;
    uint64_t v21 = v24;
    uint64_t v22 = &v30;
    do
    {
      id v9 = objc_msgSend(v6, "objectAtIndexedSubscript:", v8, v21, v22);
      id v10 = [v9 objectForKeyedSubscript:@"x"];
      int v11 = [v10 intValue];

      id v12 = [v9 objectForKeyedSubscript:@"y"];
      LODWORD(v10) = [v12 intValue];

      id v13 = [v9 objectForKeyedSubscript:@"w"];
      LODWORD(v12) = [v13 intValue];

      float v14 = [v9 objectForKeyedSubscript:@"h"];
      int v15 = [v14 intValue];

      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v25 = v11;
      uint64_t v26 = (int)v10;
      uint64_t v27 = (int)v12;
      uint64_t v28 = v15;
      $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a4->var1;
      v24[3] = a4->var0;
      v24[4] = var1;
      NUPixelRectIntersection();
      v24[1] = v29;
      v24[2] = v30;
      if ((NUPixelRectIsEmpty() & 1) == 0)
      {
        *uint64_t v21 = *v22;
        NUPixelRectToCGRect();
        uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithCGRect:");
        [v23 addObject:v17];
      }
      ++v8;
    }
    while (v7 != v8);
    if ([v23 count])
    {
      uint64_t v18 = v23;
      id v19 = v23;
    }
    else
    {
      id v19 = 0;
      uint64_t v18 = v23;
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

+ (id)extractRGBAfPixelsFromImage:(id)a3 fromROI:(id *)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x1E4F7A598]);
  int64_t var0 = a4->var1.var0;
  int64_t var1 = a4->var1.var1;
  id v10 = [MEMORY[0x1E4F7A5D8] RGBAf];
  int v11 = objc_msgSend(v7, "initWithSize:format:", var0, var1, v10);

  id v12 = objc_alloc(MEMORY[0x1E4F7A598]);
  int64_t v13 = a4->var1.var0;
  int64_t v14 = a4->var1.var1;
  int v15 = [MEMORY[0x1E4F7A5D8] RGBAh];
  uint64_t v16 = objc_msgSend(v12, "initWithSize:format:", v13, v14, v15);

  $0AC6E346AE4835514AAA8AC86D8F4844 v17 = a4->var1;
  v52[0] = a4->var0;
  v52[1] = v17;
  objc_msgSend(MEMORY[0x1E4F7A528], "copyPixelsFromImage:rect:destPtr:destPtrRowBytes:", v6, v52, objc_msgSend(v16, "mutableBytes"), objc_msgSend(v16, "rowBytes"));
  uint64_t v18 = [v6 format];
  id v19 = [MEMORY[0x1E4F7A5D8] RGBAh];
  LODWORD(v14) = [v18 isEqualToPixelFormat:v19];

  if (!v14)
  {
    v4 = (void *)MEMORY[0x1E4F7A750];
    if (*MEMORY[0x1E4F7A750] == -1) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
  src.datCGFloat a = (void *)[v16 mutableBytes];
  $0AC6E346AE4835514AAA8AC86D8F4844 v20 = a4->var1;
  $0AC6E346AE4835514AAA8AC86D8F4844 v50 = a4->var0;
  $0AC6E346AE4835514AAA8AC86D8F4844 v51 = v20;
  src.height = NUHeight();
  $0AC6E346AE4835514AAA8AC86D8F4844 v21 = a4->var1;
  $0AC6E346AE4835514AAA8AC86D8F4844 v48 = a4->var0;
  $0AC6E346AE4835514AAA8AC86D8F4844 v49 = v21;
  src.vImagePixelCount width = 4 * NUWidth();
  src.size_t rowBytes = [v16 rowBytes];
  dest.height = src.height;
  dest.vImagePixelCount width = src.width;
  dest.datCGFloat a = (void *)[v11 mutableBytes];
  dest.size_t rowBytes = [v11 rowBytes];
  if (vImageConvert_Planar16FtoPlanarF(&src, &dest, 0))
  {
    double v36 = NUAssertLogger();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      double v37 = [NSString stringWithFormat:@"Bad half float to float conversion"];
      *(_DWORD *)buf = 138543362;
      id v54 = v37;
      _os_log_error_impl(&dword_1A9680000, v36, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    double v38 = (const void **)MEMORY[0x1E4F7A308];
    specifiCGFloat c = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    int v40 = NUAssertLogger();
    BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v41)
      {
        unsigned int v44 = dispatch_get_specific(*v38);
        long long v45 = [MEMORY[0x1E4F29060] callStackSymbols];
        int v46 = [v45 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v54 = v44;
        __int16 v55 = 2114;
        uint64_t v56 = v46;
        _os_log_error_impl(&dword_1A9680000, v40, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v41)
    {
      double v42 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v43 = [v42 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v54 = v43;
      _os_log_error_impl(&dword_1A9680000, v40, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
    while (1)
    {
      __break(1u);
LABEL_28:
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_26516);
LABEL_7:
      uint64_t v23 = (id *)MEMORY[0x1E4F7A748];
      uint64_t v24 = (id)*MEMORY[0x1E4F7A748];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = NSString;
        uint64_t v26 = [v6 format];
        uint64_t v27 = [v26 name];
        uint64_t v28 = [v25 stringWithFormat:@"PIRepair expects the incoming image to be RGBAh, not %@", v27];
        LODWORD(src.data) = 138543362;
        *(void **)((char *)&src.data + 4) = v28;
        _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&src, 0xCu);
      }
      long long v29 = (const void **)MEMORY[0x1E4F7A308];
      if (dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (*v4 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_26516);
        }
        long long v30 = *v23;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          double v33 = dispatch_get_specific(*v29);
          double v34 = [MEMORY[0x1E4F29060] callStackSymbols];
          double v35 = [v34 componentsJoinedByString:@"\n"];
          LODWORD(src.data) = 138543618;
          *(void **)((char *)&src.data + 4) = v33;
          WORD2(src.height) = 2114;
          *(vImagePixelCount *)((char *)&src.height + 6) = (vImagePixelCount)v35;
          _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&src, 0x16u);
        }
      }
      else
      {
        if (*v4 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_26516);
        }
        long long v30 = *v23;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          double v31 = [MEMORY[0x1E4F29060] callStackSymbols];
          double v32 = [v31 componentsJoinedByString:@"\n"];
          LODWORD(src.data) = 138543362;
          *(void **)((char *)&src.data + 4) = v32;
          _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&src, 0xCu);
        }
      }

      [v6 format];
      [(id)objc_claimAutoreleasedReturnValue() name];
      objc_claimAutoreleasedReturnValue();
      _NUAssertFailHandler();
    }
  }

  return v11;
}

+ (id)brushStrokeFromRetouchStrokeDictionary:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  uint64_t v28 = [v31 objectForKeyedSubscript:@"radius"];
  long long v29 = [v31 objectForKeyedSubscript:@"softness"];
  v3 = [v31 objectForKeyedSubscript:@"clipRect"];
  NUPixelRectFromArray();

  id v4 = objc_alloc(MEMORY[0x1E4F7A580]);
  [v28 floatValue];
  int v6 = v5;
  [v29 floatValue];
  LODWORD(v8) = v7;
  memset(v38, 0, sizeof(v38));
  long long v30 = (void *)[v4 initWithRadius:v38 softness:0 opacity:COERCE_DOUBLE((unint64_t)v6) clipRect:v8 pressureMode:COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(1.0))];
  uint64_t v27 = [v31 objectForKeyedSubscript:@"points"];
  uint64_t v26 = [v27 count];
  id v9 = [MEMORY[0x1E4F1CA58] dataWithLength:12 * v26];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = [v31 objectForKeyedSubscript:@"points"];
  uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v35;
    do
    {
      uint64_t v13 = 0;
      uint64_t v32 = v11;
      uint64_t v14 = 12 * v11;
      do
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(obj);
        }
        int v15 = *(void **)(*((void *)&v34 + 1) + 8 * v13);
        uint64_t v16 = [v15 objectForKeyedSubscript:@"x"];
        [v16 floatValue];
        int v18 = v17;

        id v19 = [v15 objectForKeyedSubscript:@"y"];
        [v19 floatValue];
        int v21 = v20;

        uint64_t v22 = (_DWORD *)([v9 mutableBytes] + v14);
        *uint64_t v22 = v18;
        v22[1] = v21;
        v22[2] = 1065353216;
        ++v13;
        v14 += 12;
      }
      while (v10 != v13);
      uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      uint64_t v11 = v32 + v13;
    }
    while (v10);
  }

  id v23 = v9;
  objc_msgSend(v30, "appendPoints:pointCount:", objc_msgSend(v23, "mutableBytes"), v26);
  uint64_t v24 = (void *)[v30 copy];

  return v24;
}

+ (void)calcExtentsForStrokeRadius:(double)a3 offset:(id)a4 inputImageExtent:(id *)a5 maskExtent:(id *)a6 repairExtent:(id *)a7 textureExtent:(id *)a8 sourceExtent:(id *)a9
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (!a7)
  {
    uint64_t v24 = NUAssertLogger();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "repairExtent != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v25;
      _os_log_error_impl(&dword_1A9680000, v24, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v26 = (const void **)MEMORY[0x1E4F7A308];
    specifiCGFloat c = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v28 = NUAssertLogger();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v29)
      {
        double v42 = dispatch_get_specific(*v26);
        double v43 = [MEMORY[0x1E4F29060] callStackSymbols];
        unsigned int v44 = [v43 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v42;
        *(_WORD *)&unsigned char buf[12] = 2114;
        *(void *)&buf[14] = v44;
        _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
      goto LABEL_32;
    }
    if (!v29) {
      goto LABEL_32;
    }
LABEL_23:
    uint64_t v40 = [MEMORY[0x1E4F29060] callStackSymbols];
    BOOL v41 = [v40 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v41;
    _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_32;
  }
  if (!a8)
  {
    long long v30 = NUAssertLogger();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "textureExtent != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v31;
      _os_log_error_impl(&dword_1A9680000, v30, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v32 = (const void **)MEMORY[0x1E4F7A308];
    double v33 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v28 = NUAssertLogger();
    BOOL v34 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (v33)
    {
      if (v34)
      {
        long long v45 = dispatch_get_specific(*v32);
        int v46 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v47 = [v46 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v45;
        *(_WORD *)&unsigned char buf[12] = 2114;
        *(void *)&buf[14] = v47;
        _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
      goto LABEL_32;
    }
    if (!v34) {
      goto LABEL_32;
    }
    goto LABEL_23;
  }
  if (!a9)
  {
    long long v35 = NUAssertLogger();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      long long v36 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "sourceExtent != nil");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v36;
      _os_log_error_impl(&dword_1A9680000, v35, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    long long v37 = (const void **)MEMORY[0x1E4F7A308];
    double v38 = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    uint64_t v28 = NUAssertLogger();
    BOOL v39 = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (!v38)
    {
      if (!v39) {
        goto LABEL_32;
      }
      goto LABEL_23;
    }
    if (v39)
    {
      $0AC6E346AE4835514AAA8AC86D8F4844 v48 = dispatch_get_specific(*v37);
      $0AC6E346AE4835514AAA8AC86D8F4844 v49 = [MEMORY[0x1E4F29060] callStackSymbols];
      $0AC6E346AE4835514AAA8AC86D8F4844 v50 = [v49 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v48;
      *(_WORD *)&unsigned char buf[12] = 2114;
      *(void *)&buf[14] = v50;
      _os_log_error_impl(&dword_1A9680000, v28, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
LABEL_32:

    _NUAssertFailHandler();
    __break(1u);
  }
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a6->var1;
  a7->int64_t var0 = a6->var0;
  a7->$0AC6E346AE4835514AAA8AC86D8F4844 var1 = var1;
  NUPixelRectIntersection();
  $0AC6E346AE4835514AAA8AC86D8F4844 v12 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&buf[16];
  a7->int64_t var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)buf;
  a7->$0AC6E346AE4835514AAA8AC86D8F4844 var1 = v12;
  NUPixelRectSetOrigin();
  $0AC6E346AE4835514AAA8AC86D8F4844 v13 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&buf[16];
  a8->int64_t var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)buf;
  a8->$0AC6E346AE4835514AAA8AC86D8F4844 var1 = v13;
  NUPixelRectConstrainToRect();
  $0AC6E346AE4835514AAA8AC86D8F4844 v14 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&buf[16];
  a8->int64_t var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)buf;
  a8->$0AC6E346AE4835514AAA8AC86D8F4844 var1 = v14;
  if (NUPixelRectIsEmpty() & 1) != 0 || (NUPixelRectIsEmpty())
  {
    int v15 = ($0AC6E346AE4835514AAA8AC86D8F4844 *)MEMORY[0x1E4F7A328];
    $0AC6E346AE4835514AAA8AC86D8F4844 v16 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)(MEMORY[0x1E4F7A328] + 16);
    a8->int64_t var0 = ($0AC6E346AE4835514AAA8AC86D8F4844)*MEMORY[0x1E4F7A328];
    a8->$0AC6E346AE4835514AAA8AC86D8F4844 var1 = v16;
    $0AC6E346AE4835514AAA8AC86D8F4844 v17 = v15[1];
    a7->int64_t var0 = *v15;
    a7->$0AC6E346AE4835514AAA8AC86D8F4844 var1 = v17;
    $0AC6E346AE4835514AAA8AC86D8F4844 v18 = *v15;
    $0AC6E346AE4835514AAA8AC86D8F4844 v19 = v15[1];
  }
  else
  {
    uint64_t v20 = NUMinX();
    uint64_t v21 = NUMinX();
    uint64_t v22 = NUMinY();
    uint64_t v23 = NUMinY();
    memset(buf, 0, 32);
    NUPixelRectInset();
    NUPixelRectIntersection();
    NUMinX();
    NUMinY();
    NUWidth();
    NUHeight();
    NUPixelRectIntersection();
    v51.int64_t var0 = NUMinX() + v20 - v21;
    v51.$0AC6E346AE4835514AAA8AC86D8F4844 var1 = NUMinY() + v22 - v23;
    v52.int64_t var0 = NUWidth();
    v52.$0AC6E346AE4835514AAA8AC86D8F4844 var1 = NUHeight();
    a8->int64_t var0 = v51;
    a8->$0AC6E346AE4835514AAA8AC86D8F4844 var1 = v52;
    $0AC6E346AE4835514AAA8AC86D8F4844 v18 = ($0AC6E346AE4835514AAA8AC86D8F4844)0;
    $0AC6E346AE4835514AAA8AC86D8F4844 v19 = ($0AC6E346AE4835514AAA8AC86D8F4844)0;
  }
  a9->int64_t var0 = v18;
  a9->$0AC6E346AE4835514AAA8AC86D8F4844 var1 = v19;
}

@end