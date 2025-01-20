@interface OU3DObjectMerger
- (vector<OUBox3d,)crossClassNMS:(OU3DObjectMerger *)self;
- (vector<OUBox3d,)mergeCabinets:(OU3DObjectMerger *)self iou_mat:(SEL)a3;
- (vector<OUBox3d,)mergeOtherObjects:(OU3DObjectMerger *)self;
- (vector<OUBox3d,)removeLowHeightStairObjects:(OU3DObjectMerger *)self;
@end

@implementation OU3DObjectMerger

- (vector<OUBox3d,)mergeCabinets:(OU3DObjectMerger *)self iou_mat:(SEL)a3
{
  v254[2] = *(void **)MEMORY[0x263EF8340];
  v6 = @"Cabinet";
  v254[0] = v6;
  v7 = @"Shelf";
  v254[1] = v7;
  std::set<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::set[abi:ne180100]((uint64_t)v250, v254, 2);
  for (uint64_t i = 1; i != -1; --i)

  v9 = v6;
  v253[0] = v9;
  v253[1] = v7;
  v10 = @"Oven";
  v253[2] = v10;
  v253[3] = @"Dishwasher";
  v11 = @"Stove";
  v253[4] = v11;
  v12 = @"Sink";
  v253[5] = v12;
  std::set<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::set[abi:ne180100]((uint64_t)v248, v253, 6);
  for (uint64_t j = 5; j != -1; --j)

  v252[0] = v10;
  v184 = v11;
  v252[1] = v184;
  v186 = v12;
  v252[2] = v186;
  std::set<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::set[abi:ne180100]((uint64_t)v246, v252, 3);
  for (uint64_t k = 2; k != -1; --k)

  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  memset(v245, 0, sizeof(v245));
  v243 = 0;
  v242 = 0;
  unint64_t v244 = 0;
  uint64_t v15 = *(void *)a4;
  if (*((void *)a4 + 1) == *(void *)a4)
  {
    LODWORD(v22) = 0;
  }
  else
  {
    uint64_t v16 = 0;
    unint64_t v17 = 0;
    do
    {
      box3dToCentroidSizeAngle((float32x4_t *)(v15 + v16), (uint64_t *)__p);
      std::vector<std::vector<float>>::push_back[abi:ne180100](v245, (uint64_t)__p);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      uint64_t v18 = *(void *)a4 + v16;
      v19 = (const void **)(v18 + 160);
      v20 = v243;
      if ((unint64_t)v243 >= v244)
      {
        uint64_t v21 = std::vector<std::vector<float>>::__push_back_slow_path<std::vector<float> const&>((uint64_t *)&v242, (uint64_t)v19);
      }
      else
      {
        void *v243 = 0;
        v20[1] = 0;
        v20[2] = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v20, *v19, *(void *)(v18 + 168), (uint64_t)(*(void *)(v18 + 168) - (void)*v19) >> 2);
        uint64_t v21 = (uint64_t)(v20 + 3);
      }
      v243 = (void *)v21;
      ++v17;
      uint64_t v15 = *(void *)a4;
      unint64_t v22 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 5);
      v16 += 224;
    }
    while (v17 < v22);
  }
  uint64_t v23 = *(void *)a4;
  if (*((void *)a4 + 1) == *(void *)a4)
  {
    uint64_t v229 = 0;
    v228 = 0;
    v227 = (uint64_t *)&v228;
LABEL_202:
    uint64_t v226 = 0;
    v225 = 0;
    v224 = (uint64_t *)&v225;
    goto LABEL_203;
  }
  uint64_t v24 = 0;
  uint64_t v25 = 24;
  uint64_t v26 = 224;
  v189 = v9;
  do
  {
    v27 = (void **)std::__tree<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::find<NSString * {__strong}>((uint64_t)v248, (void **)(v23 + 224 * v24 + 128));
    uint64_t v23 = *(void *)a4;
    unint64_t v28 = v24 + 1;
    unint64_t v29 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 5);
    if (v249 != v27 && v28 < v29)
    {
      uint64_t v185 = v25;
      uint64_t v181 = v26;
      do
      {
        if (v249 != (void **)std::__tree<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::find<NSString * {__strong}>((uint64_t)v248, (void **)(v23 + v26 + 128)))
        {
          uint64_t v31 = *(void *)a4 + 224 * v24;
          float v32 = *(float *)(v31 + 8);
          float v33 = *(float *)(*(void *)a4 + v26 + 8);
          if (![*(id *)(v31 + 128) isEqualToString:v9]
            || ((char v34 = [*(id *)(*(void *)a4 + v26 + 128) isEqualToString:v9],
                 vabds_f32(v32, v33) >= 0.4)
              ? (char v35 = v34)
              : (char v35 = 0),
                (v35 & 1) == 0))
          {
            uint64_t v36 = *(void *)(v245[0] + v25);
            float v37 = *(float *)(v36 + 24);
            uint64_t v38 = *(void *)(v245[0] + 24 * v24);
            float v39 = *(float *)(v38 + 24);
            BOOL v41 = vabds_f32(v37, v39) < 0.3
               || (double v40 = (float)(v37 - v39), fabs(v40 + -3.14159265) < 0.300000012)
               || fabs(v40 + 3.14159265) < 0.300000012;
            float v42 = *(float *)(v38 + 16);
            float v43 = *(float *)(v36 + 16);
            uint64_t v44 = *(void *)a4 + 224 * v24;
            BOOL v45 = vabds_f32(*(float *)(v44 + 104), *(float *)(*(void *)a4 + v26 + 104)) < 0.2;
            if (v247 == (void **)std::__tree<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::find<NSString * {__strong}>((uint64_t)v248, (void **)(v44 + 128))
              || v247 == (void **)std::__tree<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::find<NSString * {__strong}>((uint64_t)v248, (void **)(*(void *)a4 + v26 + 128)))
            {
              BOOL v45 = vabds_f32(*(float *)(*(void *)a4 + 224 * v24 + 104), *(float *)(*(void *)a4 + v26 + 104)) < 0.4;
            }
            int v46 = v41 && v45;
            v9 = v189;
            if (v46 == 1 && vabds_f32(v42, v43) < 0.1)
            {
              long long v209 = 0u;
              long long v210 = 0u;
              long long v207 = 0u;
              long long v208 = 0u;
              long long v205 = 0u;
              long long v206 = 0u;
              *(_OWORD *)__p = 0u;
              long long v204 = 0u;
              box3dEnlarge((float32x4_t *)(*(void *)a4 + 224 * v24), 0.4, 0.0, 0.0, __p);
              long long v236 = 0u;
              long long v237 = 0u;
              long long v234 = 0u;
              long long v235 = 0u;
              int32x4_t v232 = 0u;
              int32x4_t v233 = 0u;
              float32x4_t v230 = 0u;
              float32x4_t v231 = 0u;
              box3dEnlarge((float32x4_t *)(*(void *)a4 + v26), 0.4, 0.0, 0.0, &v230);
              int32x4_t v193 = 0u;
              float32x4_t v194 = 0u;
              float32x4_t v192 = 0u;
              box3dIou((float32x4_t *)__p, &v230, 0, (uint64_t)&v192);
              if (v192.f32[0] > 0.0) {
            }
              }
          }
        }
        ++v28;
        uint64_t v23 = *(void *)a4;
        unint64_t v29 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 5);
        v26 += 224;
        v25 += 24;
      }
      while (v28 < v29);
      uint64_t v25 = v185;
      uint64_t v26 = v181;
      unint64_t v28 = v24 + 1;
    }
    v26 += 224;
    v25 += 24;
    uint64_t v24 = v28;
  }
  while (v28 < v29);
  uint64_t v229 = 0;
  v228 = 0;
  v227 = (uint64_t *)&v228;
  if ((int)v29 < 1) {
    goto LABEL_202;
  }
  unint64_t v47 = 0;
  do
  {
    LODWORD(__p[0]) = 0;
    v48 = (int *)v238;
    if (v47 >= (v239 - (unsigned char *)v238) >> 2)
    {
      LODWORD(v51) = -1;
    }
    else
    {
      v49 = (int *)((char *)v238 + 4 * v47);
      uint64_t v50 = *v49;
      LODWORD(v51) = v47;
      if (v47 != v50)
      {
        do
        {
          uint64_t v51 = v48[(int)v50];
          int *v49 = v51;
          v49 = &v48[v51];
          LODWORD(v50) = *v49;
        }
        while (*v49 != v51);
      }
    }
    LODWORD(__p[0]) = v51;
    v230.i64[0] = (uint64_t)__p;
    v52 = std::__tree<std::__value_type<int,std::vector<int>>,std::__map_value_compare<int,std::__value_type<int,std::vector<int>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<int>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&v227, (int *)__p, (uint64_t)&std::piecewise_construct, &v230);
    v53 = v52;
    v54 = (char *)v52[6];
    uint64_t v55 = (uint64_t)(v52 + 7);
    v56 = v52[7];
    if (v54 >= (char *)v56)
    {
      v58 = v52[5];
      uint64_t v59 = (v54 - (char *)v58) >> 2;
      if ((unint64_t)(v59 + 1) >> 62) {
        std::vector<float>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v60 = (char *)v56 - (char *)v58;
      unint64_t v61 = ((char *)v56 - (char *)v58) >> 1;
      if (v61 <= v59 + 1) {
        unint64_t v61 = v59 + 1;
      }
      if (v60 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v62 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v62 = v61;
      }
      if (v62)
      {
        v63 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v55, v62);
        v58 = v53[5];
        v54 = (char *)v53[6];
      }
      else
      {
        v63 = 0;
      }
      v64 = &v63[4 * v59];
      *(_DWORD *)v64 = v47;
      v57 = (uint64_t *)(v64 + 4);
      while (v54 != (char *)v58)
      {
        int v65 = *((_DWORD *)v54 - 1);
        v54 -= 4;
        *((_DWORD *)v64 - 1) = v65;
        v64 -= 4;
      }
      v53[5] = (uint64_t *)v64;
      v53[6] = v57;
      v53[7] = (uint64_t *)&v63[4 * v62];
      if (v58) {
        operator delete(v58);
      }
    }
    else
    {
      *(_DWORD *)v54 = v47;
      v57 = (uint64_t *)(v54 + 4);
    }
    v53[6] = v57;
    ++v47;
  }
  while ((uint64_t)v47 < (int)(-1227133513 * ((*((void *)a4 + 1) - *(void *)a4) >> 5)));
  v66 = v227;
  uint64_t v226 = 0;
  v225 = 0;
  v224 = (uint64_t *)&v225;
  if (v227 != (uint64_t *)&v228)
  {
    do
    {
      LODWORD(__p[0]) = *((_DWORD *)v66 + 8);
      v67 = (int *)v66[5];
      v68 = (int *)v66[6];
      if (v67 == v68)
      {
LABEL_81:
        std::__tree<int>::__emplace_unique_key_args<int,int const&>(&v224, (int *)__p, __p);
      }
      else if ((char *)v68 - (char *)v67 == 4)
      {
        v69 = (const OUBox3d *)(*(void *)a4 + 224 * *v67);
        end = retstr->__end_;
        if (end >= retstr->__end_cap_.__value_)
        {
          uint64_t p_var5 = std::vector<OUBox3d>::__push_back_slow_path<OUBox3d const&>((uint64_t *)retstr, v69);
          v72 = retstr;
        }
        else
        {
          OUBox3d::OUBox3d(retstr->__end_, v69);
          uint64_t p_var5 = (uint64_t)&end[2].var5;
          v72 = retstr;
          retstr->__end_ = (OUBox3d *)((char *)end + 224);
        }
        v72->__end_ = (OUBox3d *)p_var5;
        std::__tree<int>::__emplace_unique_key_args<int,int const&>(&v224, (int *)__p, __p);
      }
      else
      {
        while (v251 == (void **)std::__tree<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::find<NSString * {__strong}>((uint64_t)v250, (void **)(*(void *)a4 + 224 * *v67 + 128)))
        {
          if (++v67 == v68)
          {
            v73 = (int *)v66[5];
            v74 = (int *)v66[6];
            v75 = (uint64_t *)retstr;
            if (v73 != v74)
            {
              v76 = retstr->__end_;
              do
              {
                v77 = (const OUBox3d *)(*(void *)a4 + 224 * *v73);
                if ((unint64_t)v76 >= v75[2])
                {
                  v76 = (OUBox3d *)std::vector<OUBox3d>::__push_back_slow_path<OUBox3d const&>(v75, v77);
                  v75 = (uint64_t *)retstr;
                }
                else
                {
                  OUBox3d::OUBox3d(v76, v77);
                  v76 = (OUBox3d *)((char *)v76 + 224);
                  v75 = (uint64_t *)retstr;
                  retstr->__end_ = v76;
                }
                v75[1] = (uint64_t)v76;
                ++v73;
              }
              while (v73 != v74);
            }
            goto LABEL_81;
          }
        }
      }
      v78 = (uint64_t *)v66[1];
      if (v78)
      {
        do
        {
          v79 = v78;
          v78 = (uint64_t *)*v78;
        }
        while (v78);
      }
      else
      {
        do
        {
          v79 = (uint64_t *)v66[2];
          BOOL v80 = *v79 == (void)v66;
          v66 = v79;
        }
        while (!v80);
      }
      v66 = v79;
    }
    while (v79 != (uint64_t *)&v228);
    v81 = v227;
    if (v227 != (uint64_t *)&v228)
    {
      int32x4_t v168 = vdupq_n_s32(0x7F7FFFFFu);
      do
      {
        v82 = v225;
        if (v225)
        {
          int v83 = *((_DWORD *)v81 + 8);
          do
          {
            int v84 = *((_DWORD *)v82 + 7);
            if (v83 >= v84)
            {
              if (v84 >= v83) {
                goto LABEL_194;
              }
              ++v82;
            }
            v82 = (void *)*v82;
          }
          while (v82);
        }
        v85 = (int *)v81[5];
        unint64_t v86 = v81[6] - (void)v85;
        if ((int)(v86 >> 2) < 1)
        {
          float v89 = -3.4028e38;
          float v88 = 3.4028e38;
        }
        else
        {
          uint64_t v87 = (v86 >> 2);
          float v88 = 3.4028e38;
          float v89 = -3.4028e38;
          do
          {
            int v90 = *v85++;
            float v91 = *(float *)(*(void *)(v245[0] + 24 * v90) + 24);
            float v88 = fminf(v88, v91);
            float v89 = fmaxf(v89, v91);
            --v87;
          }
          while (v87);
        }
        int v169 = (int)(float)((float)((float)(v89 - v88) / 0.3) + 1.0);
        if (v169 >= 1)
        {
          int v92 = 0;
          do
          {
            int v93 = v92 + 1;
            v222 = 0;
            v221 = 0;
            v223 = 0;
            uint64_t v95 = v81[5];
            uint64_t v94 = v81[6];
            if ((int)((unint64_t)(v94 - v95) >> 2) >= 1)
            {
              v96 = 0;
              uint64_t v97 = 0;
              float v98 = v88 + (float)((float)v92 * 0.3);
              int v99 = -1;
              float v100 = -3.4028e38;
              do
              {
                int v101 = *(_DWORD *)(v95 + 4 * v97);
                v102 = *(float **)(v245[0] + 24 * v101);
                float v103 = v102[6];
                if (v98 <= v103 && v103 <= (float)(v88 + (float)((float)v93 * 0.3)))
                {
                  float v105 = v102[3];
                  if ((float)(v102[4] * v105) > v100)
                  {
                    float v100 = v102[4] * v105;
                    int v99 = *(_DWORD *)(v95 + 4 * v97);
                  }
                  if (v96 >= v223)
                  {
                    v107 = (char *)v221;
                    uint64_t v108 = (v96 - (unsigned char *)v221) >> 2;
                    unint64_t v109 = v108 + 1;
                    if ((unint64_t)(v108 + 1) >> 62) {
                      std::vector<float>::__throw_length_error[abi:ne180100]();
                    }
                    uint64_t v110 = v223 - (unsigned char *)v221;
                    if ((v223 - (unsigned char *)v221) >> 1 > v109) {
                      unint64_t v109 = v110 >> 1;
                    }
                    if ((unint64_t)v110 >= 0x7FFFFFFFFFFFFFFCLL) {
                      unint64_t v111 = 0x3FFFFFFFFFFFFFFFLL;
                    }
                    else {
                      unint64_t v111 = v109;
                    }
                    if (v111)
                    {
                      v112 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v223, v111);
                      v96 = v222;
                      v107 = (char *)v221;
                    }
                    else
                    {
                      v112 = 0;
                    }
                    v113 = &v112[4 * v108];
                    *(_DWORD *)v113 = v101;
                    v106 = v113 + 4;
                    while (v96 != v107)
                    {
                      int v114 = *((_DWORD *)v96 - 1);
                      v96 -= 4;
                      *((_DWORD *)v113 - 1) = v114;
                      v113 -= 4;
                    }
                    v221 = v113;
                    v222 = v106;
                    v223 = &v112[4 * v111];
                    if (v107) {
                      operator delete(v107);
                    }
                  }
                  else
                  {
                    *(_DWORD *)v96 = v101;
                    v106 = v96 + 4;
                  }
                  v222 = v106;
                  v96 = v106;
                  uint64_t v95 = v81[5];
                  uint64_t v94 = v81[6];
                }
                ++v97;
              }
              while (v97 < (int)((unint64_t)(v94 - v95) >> 2));
              if (v221 != v96)
              {
                std::vector<float>::vector(&v219, (uint64_t)(v242[1] - *v242) >> 2);
                v115 = v221;
                v116 = v222;
                v117 = v220;
                v118 = (float *)v219;
                unint64_t v119 = ((char *)v220 - (unsigned char *)v219) >> 2;
                if (v221 == v222)
                {
                  float v123 = 0.0;
                }
                else
                {
                  v120 = v242;
                  uint64_t v121 = v245[0];
                  if (v119 <= 1) {
                    uint64_t v122 = 1;
                  }
                  else {
                    uint64_t v122 = ((char *)v220 - (unsigned char *)v219) >> 2;
                  }
                  float v123 = 0.0;
                  v124 = (char *)v221;
                  do
                  {
                    int v125 = *(_DWORD *)v124;
                    if (v117 != v118)
                    {
                      v126 = (float *)v120[3 * v125];
                      uint64_t v127 = v122;
                      v128 = v118;
                      do
                      {
                        float v129 = *v126++;
                        float *v128 = v129 + *v128;
                        ++v128;
                        --v127;
                      }
                      while (v127);
                    }
                    float v123 = v123 + *(float *)(*(void *)(v121 + 24 * v125) + 16);
                    v124 += 4;
                  }
                  while (v124 != v116);
                }
                float v130 = (float)(unint64_t)((v116 - v115) >> 2);
                if (v117 != v118)
                {
                  if (v119 <= 1) {
                    unint64_t v119 = 1;
                  }
                  do
                  {
                    float *v118 = *v118 / v130;
                    ++v118;
                    --v119;
                  }
                  while (v119);
                }
                float v131 = *(float *)(*(void *)(v245[0] + 24 * v99) + 24);
                *(double *)v132.i64 = rotationZMatrix(v131);
                v135 = (int *)v221;
                v136 = (int *)v222;
                if (v221 == v222)
                {
                  v145.i64[0] = 0x80000000800000;
                  v145.i64[1] = 0x80000000800000;
                  float32x4_t v187 = v145;
                  float32x4_t v190 = (float32x4_t)v168;
                }
                else
                {
                  float32x4_t v137 = v132;
                  v138.i64[0] = 0x80000000800000;
                  v138.i64[1] = 0x80000000800000;
                  float32x4_t v187 = v138;
                  float32x4_t v190 = (float32x4_t)vdupq_n_s32(0x7F7FFFFFu);
                  float32x4_t v178 = v133;
                  float32x4_t v182 = v137;
                  float32x4_t v175 = v134;
                  do
                  {
                    int v139 = *v135;
                    if (([*(id *)(*(void *)a4 + 224 * *v135 + 128) isEqualToString:v186] & 1) != 0
                      || ([*(id *)(*(void *)a4 + 224 * v139 + 128) isEqualToString:v184] & 1) != 0)
                    {
                      float32x4_t v140 = v187;
                      float32x4_t v141 = v190;
                    }
                    else
                    {
                      uint64_t v142 = 0;
                      float32x4_t v140 = v187;
                      float32x4_t v141 = v190;
                      do
                      {
                        float32x4_t v143 = *(float32x4_t *)(*(void *)a4 + 224 * v139 + v142);
                        float32x4_t v144 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v182, v143.f32[0]), v178, *(float32x2_t *)v143.f32, 1), v175, v143, 2);
                        v141.i32[3] = 0;
                        v144.i32[3] = 0;
                        float32x4_t v141 = vminnmq_f32(v141, v144);
                        v140.i32[3] = 0;
                        float32x4_t v140 = vmaxnmq_f32(v140, v144);
                        v142 += 16;
                      }
                      while (v142 != 128);
                    }
                    float32x4_t v187 = v140;
                    float32x4_t v190 = v141;
                    ++v135;
                  }
                  while (v135 != v136);
                }
                LODWORD(__p[0]) = 0;
                std::vector<float>::vector(v218, 7uLL, __p);
                float32x4_t v146 = vabdq_f32(v187, v190);
                v147.i64[0] = 0x3F0000003F000000;
                v147.i64[1] = 0x3F0000003F000000;
                float32x4_t v148 = vmulq_f32(vaddq_f32(v190, v187), v147);
                v149 = (float *)v218[0];
                v148.i32[3] = v146.i32[0];
                *(float32x4_t *)v218[0] = v148;
                v149[4] = v123 / v130;
                v149[5] = v146.f32[2];
                v149[6] = v131;
                long long v236 = 0u;
                long long v237 = 0u;
                long long v234 = 0u;
                long long v235 = 0u;
                int32x4_t v232 = 0u;
                int32x4_t v233 = 0u;
                float32x4_t v230 = 0u;
                float32x4_t v231 = 0u;
                centroidSizeAngleToBox3d((uint64_t *)v218, 0, &v230);
                v150 = [MEMORY[0x263F08C38] UUID];
                OUBox3d::OUBox3d((uint64_t)__p, (long long *)&v230, (id *)&OU3DObjectTypeCabinet, v150, (uint64_t)&v219, @"online", 1.0);
                std::vector<OUBox3d>::emplace_back<OUBox3d>((uint64_t *)retstr, (long long *)__p);

                if (v216) {
                  operator delete(v216);
                }
                if (v214)
                {
                  v215 = v214;
                  operator delete(v214);
                }

                v151 = (int *)v221;
                v152 = (int *)v222;
                while (v151 != v152)
                {
                  int v153 = *v151;
                  if (v251 == (void **)std::__tree<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::find<NSString * {__strong}>((uint64_t)v250, (void **)(*(void *)a4 + 224 * *v151 + 128)))
                  {
                    v201 = 0;
                    uint64_t v202 = 0;
                    v200 = 0;
                    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v200, *(const void **)(v245[0] + 24 * v153), *(void *)(v245[0] + 24 * v153 + 8), (uint64_t)(*(void *)(v245[0] + 24 * v153 + 8) - *(void *)(v245[0] + 24 * v153)) >> 2);
                    *((float *)v200 + 6) = v131;
                    float32x4_t v198 = 0u;
                    int32x4_t v199 = 0u;
                    float32x4_t v196 = 0u;
                    int32x4_t v197 = 0u;
                    float32x4_t v194 = 0u;
                    int32x4_t v195 = 0u;
                    float32x4_t v192 = 0u;
                    int32x4_t v193 = 0u;
                    centroidSizeAngleToBox3d((uint64_t *)&v200, 1, &v192);
                    int32x4_t v176 = v193;
                    float32x4_t v179 = v192;
                    float32x4_t v188 = v230;
                    int32x4_t v183 = v233;
                    float32x4_t v191 = v154;
                    int32x4_t v173 = v232;
                    float32x4_t v174 = v231;
                    int32x4_t v180 = v155;
                    int32x4_t v171 = v195;
                    float32x4_t v172 = v194;
                    float32x4_t v177 = v156;
                    uint64_t v158 = 0;
                    float32x4_t v192 = v191;
                    int32x4_t v193 = v180;
                    float32x4_t v194 = v177;
                    int32x4_t v195 = v157;
                    float32x4_t v196 = v191;
                    int32x4_t v197 = v180;
                    float32x4_t v198 = v177;
                    int32x4_t v199 = v157;
                    uint64_t v159 = *(void *)a4;
                    uint64_t v160 = *(void *)a4 + 224 * v153;
                    do
                    {
                      v192.i32[v158 + 2] = *(_DWORD *)(v160 + v158 * 4 + 8);
                      v158 += 4;
                    }
                    while (v158 != 32);
                    int v161 = [*(id *)(v159 + 224 * v153 + 128) isEqualToString:v186];
                    if ((v161 | [*(id *)(*(void *)a4 + 224 * v153 + 128) isEqualToString:v184]) == 1)
                    {
                      if ((float)(*((float *)&v234 + 2) - v230.f32[2]) < 1.2)
                      {
                        uint64_t v162 = 0;
                        if (v161)
                        {
                          do
                          {
                            v196.i32[v162 + 2] = *(_DWORD *)((char *)&v234 + v162 * 4 + 8);
                            v162 += 4;
                          }
                          while (v162 != 16);
                        }
                        else
                        {
                          do
                          {
                            v192.i32[v162 + 2] = *(_DWORD *)((char *)&v234 + v162 * 4 + 8);
                            v162 += 4;
                          }
                          while (v162 != 16);
                        }
                      }
                      uint64_t v163 = 0;
                      if (v161)
                      {
                        do
                        {
                          v196.f32[v163 + 2] = v196.f32[v163 + 2] + 0.01;
                          v163 += 4;
                        }
                        while (v163 != 16);
                        for (uint64_t m = 0; m != 16; m += 4)
                          v192.f32[m + 2] = v196.f32[m + 2] + -0.3;
                      }
                      else
                      {
                        do
                        {
                          v196.f32[v163 + 2] = v192.f32[v163 + 2] + 0.1;
                          v163 += 4;
                        }
                        while (v163 != 16);
                      }
                    }
                    OUBox3d::OUBox3d((uint64_t)__p, (long long *)&v192, (id *)(*(void *)a4 + 224 * v153 + 128), *(void **)(*(void *)a4 + 224 * v153 + 144), *(void *)a4 + 224 * v153 + 160, @"online", *(float *)(*(void *)a4 + 224 * v153 + 136));
                    std::vector<OUBox3d>::emplace_back<OUBox3d>((uint64_t *)retstr, (long long *)__p);

                    if (v216) {
                      operator delete(v216);
                    }
                    if (v214)
                    {
                      v215 = v214;
                      operator delete(v214);
                    }

                    if (v200)
                    {
                      v201 = v200;
                      operator delete(v200);
                    }
                  }
                  ++v151;
                }
                if (v218[0])
                {
                  v218[1] = v218[0];
                  operator delete(v218[0]);
                }
                if (v219)
                {
                  v220 = (float *)v219;
                  operator delete(v219);
                }
                v96 = (char *)v221;
              }
              if (v96)
              {
                v222 = v96;
                operator delete(v96);
              }
            }
            int v92 = v93;
          }
          while (v93 != v169);
        }
LABEL_194:
        v165 = (uint64_t *)v81[1];
        if (v165)
        {
          do
          {
            v166 = v165;
            v165 = (uint64_t *)*v165;
          }
          while (v165);
        }
        else
        {
          do
          {
            v166 = (uint64_t *)v81[2];
            BOOL v80 = *v166 == (void)v81;
            v81 = v166;
          }
          while (!v80);
        }
        v81 = v166;
      }
      while (v166 != (uint64_t *)&v228);
    }
  }
LABEL_203:
  std::__tree<int>::destroy((uint64_t)&v224, v225);
  std::__tree<std::__value_type<int,std::vector<int>>,std::__map_value_compare<int,std::__value_type<int,std::vector<int>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<int>>>>::destroy((uint64_t)&v227, v228);
  if (v240)
  {
    v241 = v240;
    operator delete(v240);
  }
  if (v238)
  {
    v239 = v238;
    operator delete(v238);
  }
  __p[0] = &v242;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  __p[0] = v245;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  std::__tree<std::__value_type<NSString * {__strong},float>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},float>,CompareNSString,true>,std::allocator<std::__value_type<NSString * {__strong},float>>>::destroy((uint64_t)v246, v247[0]);
  std::__tree<std::__value_type<NSString * {__strong},float>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},float>,CompareNSString,true>,std::allocator<std::__value_type<NSString * {__strong},float>>>::destroy((uint64_t)v248, v249[0]);
  std::__tree<std::__value_type<NSString * {__strong},float>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},float>,CompareNSString,true>,std::allocator<std::__value_type<NSString * {__strong},float>>>::destroy((uint64_t)v250, v251[0]);
  return result;
}

- (vector<OUBox3d,)removeLowHeightStairObjects:(OU3DObjectMerger *)self
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  int v6 = -1227133513 * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 5);
  result = (vector<OUBox3d, std::allocator<OUBox3d>> *)std::vector<OUBox3d>::reserve((uint64_t *)retstr, v6);
  if (v6 >= 1)
  {
    uint64_t v9 = 0;
    *(void *)&long long v8 = 134217984;
    long long v15 = v8;
    do
    {
      uint64_t v10 = *(void *)a4;
      v11 = (const OUBox3d *)(*(void *)a4 + v9);
      result = (vector<OUBox3d, std::allocator<OUBox3d>> *)objc_msgSend(v11[1].var5.var0, "isEqualToString:", @"Stairs", v15);
      if (result)
      {
        float v12 = *(float *)(v10 + v9 + 72) - *(float *)(v10 + v9 + 8);
        if (v12 < 0.0)
        {
          v13 = _OULoggingGetOSLogForCategoryObjectUnderstanding();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v15;
            double v17 = v12;
            _os_log_debug_impl(&dword_237C17000, v13, OS_LOG_TYPE_DEBUG, "[3DOD Error] box height shouldn't be a negative value: %f", buf, 0xCu);
          }
        }
        if (v12 <= 0.5) {
          goto LABEL_15;
        }
        end = retstr->__end_;
        if (end >= retstr->__end_cap_.__value_)
        {
LABEL_13:
          result = (vector<OUBox3d, std::allocator<OUBox3d>> *)std::vector<OUBox3d>::__push_back_slow_path<OUBox3d const&>((uint64_t *)retstr, v11);
          goto LABEL_14;
        }
      }
      else
      {
        end = retstr->__end_;
        if (end >= retstr->__end_cap_.__value_) {
          goto LABEL_13;
        }
      }
      OUBox3d::OUBox3d(retstr->__end_, v11);
      result = (vector<OUBox3d, std::allocator<OUBox3d>> *)&end[2].var5;
      retstr->__end_ = (OUBox3d *)((char *)end + 224);
LABEL_14:
      retstr->__end_ = (OUBox3d *)result;
LABEL_15:
      v9 += 224;
    }
    while (224 * v6 != v9);
  }
  return result;
}

- (vector<OUBox3d,)mergeOtherObjects:(OU3DObjectMerger *)self
{
  v279[7] = *(void **)MEMORY[0x263EF8340];
  v279[0] = @"Shelf";
  v228 = @"Sink";
  v279[1] = v228;
  v222 = @"Table";
  v279[2] = v222;
  v279[3] = @"Sofa";
  uint64_t v229 = @"Stairs";
  v279[4] = v229;
  v227 = @"Washer";
  v279[5] = v227;
  v221 = @"Oven";
  v279[6] = v221;
  std::set<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::set[abi:ne180100]((uint64_t)v268, v279, 7);
  for (uint64_t i = 6; i != -1; --i)

  v266 = 0;
  __p = 0;
  v267 = 0;
  v263 = 0;
  v262 = 0;
  v264 = 0;
  uint64_t v7 = *(void *)a4;
  uint64_t v8 = *((void *)a4 + 1);
  uint64_t v9 = 0x6DB6DB6DB6DB6DB7 * ((v8 - *(void *)a4) >> 5);
  v220 = retstr;
  if ((int)v9 < 1)
  {
    LODWORD(v69) = -1227133513 * ((v8 - *(void *)a4) >> 5);
  }
  else
  {
    uint64_t v10 = 0;
    do
    {
      box3dEnlarge((float32x4_t *)(*(void *)a4 + 224 * v10), 0.6, 0.6, 0.6, &v241);
      v11 = v266;
      if (v266 >= v267)
      {
        v19 = (char *)__p;
        uint64_t v20 = (v266 - (unsigned char *)__p) >> 7;
        unint64_t v21 = v20 + 1;
        if ((unint64_t)(v20 + 1) >> 57) {
          std::vector<float>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v22 = v267 - (unsigned char *)__p;
        if ((v267 - (unsigned char *)__p) >> 6 > v21) {
          unint64_t v21 = v22 >> 6;
        }
        if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFF80) {
          unint64_t v23 = 0x1FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v23 = v21;
        }
        if (v23)
        {
          uint64_t v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<box3d>>((uint64_t)&v267, v23);
          v11 = v266;
          v19 = (char *)__p;
        }
        else
        {
          uint64_t v24 = 0;
        }
        uint64_t v25 = &v24[128 * v20];
        long long v26 = *(_OWORD *)&v241.var1;
        long long v27 = *(_OWORD *)&v241.var3;
        long long v28 = *(_OWORD *)&v241.var5.var2.var0;
        *((_OWORD *)v25 + 2) = *(_OWORD *)&v241.var5.var0;
        *((_OWORD *)v25 + 3) = v28;
        *(_OWORD *)uint64_t v25 = v26;
        *((_OWORD *)v25 + 1) = v27;
        long long v29 = *(_OWORD *)&v241.var6.var1;
        long long v30 = *(_OWORD *)&v241.var7;
        long long v31 = v243;
        *((_OWORD *)v25 + 6) = v242;
        *((_OWORD *)v25 + 7) = v31;
        *((_OWORD *)v25 + 4) = v29;
        *((_OWORD *)v25 + 5) = v30;
        if (v11 == v19)
        {
          float v39 = &v24[128 * v20];
        }
        else
        {
          float v32 = &v24[128 * v20];
          do
          {
            long long v33 = *((_OWORD *)v11 - 8);
            long long v34 = *((_OWORD *)v11 - 7);
            long long v35 = *((_OWORD *)v11 - 5);
            *((_OWORD *)v32 - 6) = *((_OWORD *)v11 - 6);
            *((_OWORD *)v32 - 5) = v35;
            *((_OWORD *)v32 - 8) = v33;
            *((_OWORD *)v32 - 7) = v34;
            long long v36 = *((_OWORD *)v11 - 4);
            long long v37 = *((_OWORD *)v11 - 3);
            long long v38 = *((_OWORD *)v11 - 1);
            float v39 = v32 - 128;
            *((_OWORD *)v32 - 2) = *((_OWORD *)v11 - 2);
            *((_OWORD *)v32 - 1) = v38;
            *((_OWORD *)v32 - 4) = v36;
            *((_OWORD *)v32 - 3) = v37;
            v11 -= 128;
            v32 -= 128;
          }
          while (v11 != v19);
        }
        uint64_t v18 = v25 + 128;
        __p = v39;
        v266 = v25 + 128;
        v267 = &v24[128 * v23];
        if (v19) {
          operator delete(v19);
        }
      }
      else
      {
        long long v12 = *(_OWORD *)&v241.var1;
        long long v13 = *(_OWORD *)&v241.var3;
        long long v14 = *(_OWORD *)&v241.var5.var2.var0;
        *((_OWORD *)v266 + 2) = *(_OWORD *)&v241.var5.var0;
        *((_OWORD *)v11 + 3) = v14;
        *(_OWORD *)v11 = v12;
        *((_OWORD *)v11 + 1) = v13;
        long long v15 = *(_OWORD *)&v241.var6.var1;
        long long v16 = *(_OWORD *)&v241.var7;
        long long v17 = v243;
        *((_OWORD *)v11 + 6) = v242;
        *((_OWORD *)v11 + 7) = v17;
        *((_OWORD *)v11 + 4) = v15;
        *((_OWORD *)v11 + 5) = v16;
        uint64_t v18 = v11 + 128;
      }
      v266 = v18;
      box3dEnlarge((float32x4_t *)(*(void *)a4 + 224 * v10), 0.3, 0.3, 0.3, &v241);
      double v40 = v263;
      if (v263 >= v264)
      {
        v48 = (char *)v262;
        uint64_t v49 = (v263 - (unsigned char *)v262) >> 7;
        unint64_t v50 = v49 + 1;
        if ((unint64_t)(v49 + 1) >> 57) {
          std::vector<float>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v51 = v264 - (unsigned char *)v262;
        if ((v264 - (unsigned char *)v262) >> 6 > v50) {
          unint64_t v50 = v51 >> 6;
        }
        if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFF80) {
          unint64_t v52 = 0x1FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v52 = v50;
        }
        if (v52)
        {
          v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<box3d>>((uint64_t)&v264, v52);
          double v40 = v263;
          v48 = (char *)v262;
        }
        else
        {
          v53 = 0;
        }
        v54 = &v53[128 * v49];
        long long v55 = *(_OWORD *)&v241.var1;
        long long v56 = *(_OWORD *)&v241.var3;
        long long v57 = *(_OWORD *)&v241.var5.var2.var0;
        *((_OWORD *)v54 + 2) = *(_OWORD *)&v241.var5.var0;
        *((_OWORD *)v54 + 3) = v57;
        *(_OWORD *)v54 = v55;
        *((_OWORD *)v54 + 1) = v56;
        long long v58 = *(_OWORD *)&v241.var6.var1;
        long long v59 = *(_OWORD *)&v241.var7;
        long long v60 = v243;
        *((_OWORD *)v54 + 6) = v242;
        *((_OWORD *)v54 + 7) = v60;
        *((_OWORD *)v54 + 4) = v58;
        *((_OWORD *)v54 + 5) = v59;
        if (v40 == v48)
        {
          v68 = &v53[128 * v49];
        }
        else
        {
          unint64_t v61 = &v53[128 * v49];
          do
          {
            long long v62 = *((_OWORD *)v40 - 8);
            long long v63 = *((_OWORD *)v40 - 7);
            long long v64 = *((_OWORD *)v40 - 5);
            *((_OWORD *)v61 - 6) = *((_OWORD *)v40 - 6);
            *((_OWORD *)v61 - 5) = v64;
            *((_OWORD *)v61 - 8) = v62;
            *((_OWORD *)v61 - 7) = v63;
            long long v65 = *((_OWORD *)v40 - 4);
            long long v66 = *((_OWORD *)v40 - 3);
            long long v67 = *((_OWORD *)v40 - 1);
            v68 = v61 - 128;
            *((_OWORD *)v61 - 2) = *((_OWORD *)v40 - 2);
            *((_OWORD *)v61 - 1) = v67;
            *((_OWORD *)v61 - 4) = v65;
            *((_OWORD *)v61 - 3) = v66;
            v40 -= 128;
            v61 -= 128;
          }
          while (v40 != v48);
        }
        unint64_t v47 = v54 + 128;
        v262 = v68;
        v263 = v54 + 128;
        v264 = &v53[128 * v52];
        if (v48) {
          operator delete(v48);
        }
      }
      else
      {
        long long v41 = *(_OWORD *)&v241.var1;
        long long v42 = *(_OWORD *)&v241.var3;
        long long v43 = *(_OWORD *)&v241.var5.var2.var0;
        *((_OWORD *)v263 + 2) = *(_OWORD *)&v241.var5.var0;
        *((_OWORD *)v40 + 3) = v43;
        *(_OWORD *)double v40 = v41;
        *((_OWORD *)v40 + 1) = v42;
        long long v44 = *(_OWORD *)&v241.var6.var1;
        long long v45 = *(_OWORD *)&v241.var7;
        long long v46 = v243;
        *((_OWORD *)v40 + 6) = v242;
        *((_OWORD *)v40 + 7) = v46;
        *((_OWORD *)v40 + 4) = v44;
        *((_OWORD *)v40 + 5) = v45;
        unint64_t v47 = v40 + 128;
      }
      v263 = v47;
      ++v10;
    }
    while (v10 != v9);
    uint64_t v7 = *(void *)a4;
    uint64_t v8 = *((void *)a4 + 1);
    unint64_t v69 = 0x6DB6DB6DB6DB6DB7 * ((v8 - *(void *)a4) >> 5);
  }
  memset(v261, 0, sizeof(v261));
  if (v8 != v7)
  {
    uint64_t v70 = 0;
    unint64_t v71 = 0;
    do
    {
      box3dToCentroidSizeAngle((float32x4_t *)(v7 + v70), (uint64_t *)&v241);
      std::vector<std::vector<float>>::push_back[abi:ne180100](v261, (uint64_t)&v241);
      if (v241.var1)
      {
        *(void *)&v241.var2 = v241.var1;
        operator delete(v241.var1);
      }
      ++v71;
      uint64_t v7 = *(void *)a4;
      unint64_t v69 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 5);
      v70 += 224;
    }
    while (v71 < v69);
  }
  unint64_t v72 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 5);
  LODWORD(v275.var1) = -1082130432;
  std::vector<float>::vector(&v241, v72, &v275);
  std::vector<std::vector<float>>::vector(v256, v72, (uint64_t)&v241);
  if (v241.var1)
  {
    *(void *)&v241.var2 = v241.var1;
    operator delete(v241.var1);
  }
  if ((int)v9 >= 1)
  {
    uint64_t v73 = 0;
    uint64_t v226 = 1;
    uint64_t v225 = 128;
    uint64_t v224 = 224;
    uint64_t v74 = 24;
    while (1)
    {
      uint64_t v223 = v73 + 1;
      if (v269 != (void **)std::__tree<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::find<NSString * {__strong}>((uint64_t)v268, (void **)(*(void *)a4 + 224 * v73 + 128))&& v73 + 1 < (int)v9)
      {
        break;
      }
LABEL_86:
      v74 += 24;
      v225 += 128;
      ++v226;
      v224 += 224;
      ++v73;
      if (v223 == v9) {
        goto LABEL_87;
      }
    }
    uint64_t v77 = v224;
    uint64_t v76 = v225;
    uint64_t v78 = v74;
    uint64_t v79 = v226;
    while (1)
    {
      if (v269 == (void **)std::__tree<NSString * {__strong},CompareNSString,std::allocator<NSString * {__strong}>>::find<NSString * {__strong}>((uint64_t)v268, (void **)(*(void *)a4 + v77 + 128))|| ([*(id *)(*(void *)a4 + 224 * v73 + 128) isEqualToString:*(void *)(*(void *)a4 + v77 + 128)] & 1) == 0)
      {
        goto LABEL_85;
      }
      float v80 = *(float *)(*(void *)(v261[0] + 24 * v73) + 24);
      float v81 = *(float *)(*(void *)(v261[0] + v78) + 24);
      if ([*(id *)(*(void *)a4 + 224 * v73 + 128) isEqualToString:v229])
      {
        box3dIou((float32x4_t *)__p + 8 * v73, (float32x4_t *)((char *)__p + v76), 0, (uint64_t)&v241);
      }
      else if ([*(id *)(*(void *)a4 + 224 * v73 + 128) isEqualToString:v227])
      {
        box3dIou((float32x4_t *)v262 + 8 * v73, (float32x4_t *)((char *)v262 + v76), 0, (uint64_t)&v241);
      }
      else
      {
        box3dIou((float32x4_t *)(*(void *)a4 + 224 * v73), (float32x4_t *)(*(void *)a4 + v77), 0, (uint64_t)&v241);
      }
      float v82 = *(float *)&v241.var4;
      float v83 = fabsf(v80 - v81);
      if (*(float *)&v241.var4 <= 0.0
        || ([*(id *)(*(void *)a4 + 224 * v73 + 128) isEqualToString:v228] & 1) == 0
        && ([*(id *)(*(void *)a4 + 224 * v73 + 128) isEqualToString:v221] & 1) == 0
        && (v83 >= 0.26 || ([*(id *)(*(void *)a4 + 224 * v73 + 128) isEqualToString:v227] & 1) == 0))
      {
        if (v82 <= 0.1)
        {
          if (v82 <= 0.0
            || v83 >= 0.4
            || !objc_msgSend(*(id *)(*(void *)a4 + 224 * v73 + 128), "isEqualToString:", v229, v83))
          {
            goto LABEL_84;
          }
        }
        else if (([*(id *)(*(void *)a4 + 224 * v73 + 128) isEqualToString:v222] & 1) == 0)
        {
          char v84 = [*(id *)(*(void *)a4 + 224 * v73 + 128) isEqualToString:v228];
          char v85 = v83 < 0.26 ? 1 : v84;
          if ((v85 & 1) == 0 && v83 <= 6.02) {
            goto LABEL_84;
          }
        }
      }
LABEL_84:
      uint64_t v86 = v256[0];
      *(float *)(*(void *)(v256[0] + v78) + 4 * v73) = v82;
      *(float *)(*(void *)(v86 + 24 * v73) + 4 * v79) = v82;
LABEL_85:
      ++v79;
      v78 += 24;
      v76 += 128;
      v77 += 224;
      if (v9 == v79) {
        goto LABEL_86;
      }
    }
  }
LABEL_87:
  v255[0] = 0;
  v255[1] = 0;
  v254 = (uint64_t *)v255;
  if (*((void *)a4 + 1) == *(void *)a4)
  {
    uint64_t v251 = 0;
    v252 = 0;
    unint64_t v253 = 0;
LABEL_281:
    v220->__begin_ = 0;
    v220->__end_ = 0;
    v220->__end_cap_.__value_ = 0;
    goto LABEL_282;
  }
  unint64_t v87 = 0;
  do
  {
    LODWORD(v275.var1) = 0;
    float v88 = (int *)v257;
    if (v87 >= (v258 - (unsigned char *)v257) >> 2)
    {
      LODWORD(v91) = -1;
    }
    else
    {
      float v89 = (int *)((char *)v257 + 4 * v87);
      uint64_t v90 = *v89;
      LODWORD(v91) = v87;
      if (v87 != v90)
      {
        do
        {
          uint64_t v91 = v88[(int)v90];
          *float v89 = v91;
          float v89 = &v88[v91];
          LODWORD(v90) = *v89;
        }
        while (*v89 != v91);
      }
    }
    LODWORD(v275.var1) = v91;
    v241.var1 = &v275;
    int v92 = std::__tree<std::__value_type<int,std::vector<int>>,std::__map_value_compare<int,std::__value_type<int,std::vector<int>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<int>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&v254, (int *)&v275, (uint64_t)&std::piecewise_construct, &v241);
    int v93 = v92;
    uint64_t v94 = (char *)v92[6];
    uint64_t v95 = (uint64_t)(v92 + 7);
    v96 = v92[7];
    if (v94 >= (char *)v96)
    {
      float v98 = v92[5];
      uint64_t v99 = (v94 - (char *)v98) >> 2;
      if ((unint64_t)(v99 + 1) >> 62) {
        std::vector<float>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v100 = (char *)v96 - (char *)v98;
      unint64_t v101 = ((char *)v96 - (char *)v98) >> 1;
      if (v101 <= v99 + 1) {
        unint64_t v101 = v99 + 1;
      }
      if (v100 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v102 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v102 = v101;
      }
      if (v102)
      {
        float v103 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v95, v102);
        float v98 = v93[5];
        uint64_t v94 = (char *)v93[6];
      }
      else
      {
        float v103 = 0;
      }
      v104 = &v103[4 * v99];
      *(_DWORD *)v104 = v87;
      uint64_t v97 = (uint64_t *)(v104 + 4);
      while (v94 != (char *)v98)
      {
        int v105 = *((_DWORD *)v94 - 1);
        v94 -= 4;
        *((_DWORD *)v104 - 1) = v105;
        v104 -= 4;
      }
      v93[5] = (uint64_t *)v104;
      v93[6] = v97;
      v93[7] = (uint64_t *)&v103[4 * v102];
      if (v98) {
        operator delete(v98);
      }
    }
    else
    {
      *(_DWORD *)uint64_t v94 = v87;
      uint64_t v97 = (uint64_t *)(v94 + 4);
    }
    v93[6] = v97;
    ++v87;
  }
  while (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 5) > v87);
  v106 = v254;
  uint64_t v251 = 0;
  v252 = 0;
  unint64_t v253 = 0;
  if (v254 == (uint64_t *)v255) {
    goto LABEL_281;
  }
  v107 = v220;
  do
  {
    uint64_t v108 = (int *)v106[5];
    unint64_t v109 = (int *)v106[6];
    uint64_t v110 = (int **)(v106 + 5);
    if (v108 == v109) {
      goto LABEL_130;
    }
    if ((char *)v109 - (char *)v108 == 4)
    {
      unint64_t v111 = (const OUBox3d *)(*(void *)a4 + 224 * *v108);
      v112 = v252;
      if ((unint64_t)v252 >= v253)
      {
        v113 = (OUBox3d *)std::vector<OUBox3d>::__push_back_slow_path<OUBox3d const&>(&v251, v111);
      }
      else
      {
        OUBox3d::OUBox3d(v252, v111);
        v113 = (OUBox3d *)((char *)v112 + 224);
      }
      v252 = v113;
      goto LABEL_130;
    }
    if (v278
      || ([*(id *)(*(void *)a4 + 224 * **v110 + 128) isEqualToString:v229] & 1) != 0
      || ([*(id *)(*(void *)a4 + 224 * **v110 + 128) isEqualToString:v228] & 1) != 0
      || ([*(id *)(*(void *)a4 + 224 * **v110 + 128) isEqualToString:v227] & 1) != 0
      || ([*(id *)(*(void *)a4 + 224 * **v110 + 128) isEqualToString:v221] & 1) != 0)
    {
      int v114 = **v110;
      uint64_t v115 = *(void *)a4;
      v116 = [MEMORY[0x263F08C38] UUID];
      OUBox3d::OUBox3d((uint64_t)&v241, (long long *)&v275, (id *)(v115 + 224 * v114 + 128), v116, (uint64_t)v274, @"online", 1.0);
      std::vector<OUBox3d>::emplace_back<OUBox3d>(&v251, (long long *)&v241);

      if (v249) {
        operator delete(v249);
      }
      if (v247)
      {
        v248 = v247;
        operator delete(v247);
      }

      if (v274[0].i64[0])
      {
        v274[0].i64[1] = v274[0].i64[0];
        operator delete((void *)v274[0].i64[0]);
      }
      goto LABEL_130;
    }
    v120 = (int *)v106[5];
    uint64_t v121 = v106[6] - (void)v120;
    if (v121)
    {
      uint64_t v122 = v121 >> 2;
      if ((unint64_t)(v121 >> 2) <= 1) {
        uint64_t v122 = 1;
      }
      float v123 = -3.4028e38;
      float v124 = 3.4028e38;
      do
      {
        int v125 = *v120++;
        float v126 = *(float *)(*(void *)(v261[0] + 24 * v125) + 24);
        if (v124 >= v126) {
          float v124 = v126;
        }
        if (v126 >= v123) {
          float v123 = v126;
        }
        --v122;
      }
      while (v122);
    }
    else
    {
      float v124 = 3.4028e38;
      float v123 = -3.4028e38;
    }
    std::vector<std::vector<int>>::vector(&v239, (int)(float)(floorf((float)(v123 - v124) / 0.3) + 1.0));
    uint64_t v127 = v106[5];
    if (v106[6] != v127)
    {
      unint64_t v128 = 0;
      do
      {
        int v129 = *(_DWORD *)(v127 + 4 * v128);
        uint64_t v130 = v239
             + 24 * (int)vcvtms_s32_f32((float)(*(float *)(*(void *)(v261[0] + 24 * v129) + 24) - v124) / 0.3);
        float32x4_t v132 = (_DWORD **)(v130 + 8);
        float v131 = *(_DWORD **)(v130 + 8);
        float32x4_t v134 = (void *)(v130 + 16);
        unint64_t v133 = *(void *)(v130 + 16);
        if ((unint64_t)v131 >= v133)
        {
          v136 = *(_DWORD **)v130;
          uint64_t v137 = ((uint64_t)v131 - *(void *)v130) >> 2;
          unint64_t v138 = v137 + 1;
          if ((unint64_t)(v137 + 1) >> 62) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v139 = v133 - (void)v136;
          if (v139 >> 1 > v138) {
            unint64_t v138 = v139 >> 1;
          }
          if ((unint64_t)v139 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v140 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v140 = v138;
          }
          if (v140)
          {
            float32x4_t v141 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v134, v140);
            float v131 = *v132;
            v136 = *(_DWORD **)v130;
            int v129 = *(_DWORD *)(v127 + 4 * v128);
          }
          else
          {
            float32x4_t v141 = 0;
          }
          uint64_t v142 = &v141[4 * v137];
          *(_DWORD *)uint64_t v142 = v129;
          v135 = v142 + 4;
          while (v131 != v136)
          {
            int v143 = *--v131;
            *((_DWORD *)v142 - 1) = v143;
            v142 -= 4;
          }
          *(void *)uint64_t v130 = v142;
          *float32x4_t v132 = v135;
          *float32x4_t v134 = &v141[4 * v140];
          if (v136) {
            operator delete(v136);
          }
        }
        else
        {
          *float v131 = v129;
          v135 = v131 + 1;
        }
        *float32x4_t v132 = v135;
        ++v128;
        uint64_t v127 = v106[5];
      }
      while (v128 < (v106[6] - v127) >> 2);
    }
    uint64_t v236 = 0;
    uint64_t v237 = 0;
    uint64_t v238 = 0;
    int32x4_t v233 = 0;
    long long v234 = 0;
    long long v235 = 0;
    uint64_t v145 = v239;
    uint64_t v144 = v240;
    if (v239 == v240)
    {
      uint64_t v163 = 0;
      uint64_t v162 = 0;
      uint64_t v161 = 0;
      uint64_t v160 = 0;
    }
    else
    {
      do
      {
        if (*(void *)v145 != *(void *)(v145 + 8))
        {
          box3dToCentroidSizeAngle(v274, (uint64_t *)&v270);
          int v146 = **v110;
          uint64_t v147 = *(void *)a4;
          float32x4_t v148 = [MEMORY[0x263F08C38] UUID];
          OUBox3d::OUBox3d((uint64_t)&v241, (long long *)v274, (id *)(v147 + 224 * v146 + 128), v148, (uint64_t)&v230, @"online", 1.0);
          std::vector<OUBox3d>::emplace_back<OUBox3d>(&v236, (long long *)&v241);

          if (v249) {
            operator delete(v249);
          }
          if (v247)
          {
            v248 = v247;
            operator delete(v247);
          }

          float v149 = (float)(*((float *)v270 + 3) * *((float *)v270 + 4))
               * (float)(unint64_t)((uint64_t)(*(void *)(v145 + 8) - *(void *)v145) >> 2);
          v150 = v234;
          if (v234 >= v235)
          {
            v152 = (float *)v233;
            uint64_t v153 = ((char *)v234 - (unsigned char *)v233) >> 2;
            unint64_t v154 = v153 + 1;
            if ((unint64_t)(v153 + 1) >> 62) {
              std::vector<float>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v155 = (char *)v235 - (unsigned char *)v233;
            if (((char *)v235 - (unsigned char *)v233) >> 1 > v154) {
              unint64_t v154 = v155 >> 1;
            }
            if ((unint64_t)v155 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v156 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v156 = v154;
            }
            if (v156)
            {
              int32x4_t v157 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v235, v156);
              v152 = (float *)v233;
              v150 = v234;
            }
            else
            {
              int32x4_t v157 = 0;
            }
            uint64_t v158 = (float *)&v157[4 * v153];
            *uint64_t v158 = v149;
            v151 = v158 + 1;
            while (v150 != v152)
            {
              int v159 = *((_DWORD *)v150-- - 1);
              *((_DWORD *)v158-- - 1) = v159;
            }
            int32x4_t v233 = v158;
            long long v234 = v151;
            long long v235 = (float *)&v157[4 * v156];
            if (v152) {
              operator delete(v152);
            }
          }
          else
          {
            *long long v234 = v149;
            v151 = v150 + 1;
          }
          long long v234 = v151;
          if (v230)
          {
            float32x4_t v231 = (char *)v230;
            operator delete(v230);
          }
          if (v270)
          {
            v271 = (char *)v270;
            operator delete(v270);
          }
        }
        v145 += 24;
      }
      while (v145 != v144);
      uint64_t v161 = v236;
      uint64_t v160 = v237;
      uint64_t v163 = v233;
      uint64_t v162 = v234;
    }
    float32x4_t v230 = 0;
    float32x4_t v231 = 0;
    int32x4_t v232 = 0;
    uint64_t v164 = (v160 - v161) >> 5;
    unint64_t v165 = 0x6DB6DB6DB6DB6DB7 * v164;
    if (0x6DB6DB6DB6DB6DB7 * v164 != ((char *)v162 - v163) >> 2)
    {
      exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      std::logic_error::logic_error(exception, "AddPositiveIntegers arguments must be positive");
      exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C3A0] + 16);
      __cxa_throw(exception, (struct type_info *)off_264CFAB20, MEMORY[0x263F8C080]);
    }
    int v273 = -1082130432;
    std::vector<float>::vector(&v241, 0x6DB6DB6DB6DB6DB7 * v164, &v273);
    std::vector<std::vector<float>>::vector(v274, v165, (uint64_t)&v241);
    if (v241.var1)
    {
      *(void *)&v241.var2 = v241.var1;
      operator delete(v241.var1);
    }
    uint64_t v166 = v236;
    uint64_t v167 = v237;
    if (v237 != v236)
    {
      unint64_t v168 = 0;
      uint64_t v169 = 224;
      uint64_t v170 = 24;
      do
      {
        unint64_t v171 = v168++;
        unint64_t v172 = 0x6DB6DB6DB6DB6DB7 * ((v167 - v166) >> 5);
        if (v168 < v172)
        {
          uint64_t v173 = v169;
          uint64_t v174 = v170;
          unint64_t v175 = v168;
          do
          {
            memset(&v241, 0, 48);
            box3dIou((float32x4_t *)(v166 + 224 * v171), (float32x4_t *)(v166 + v173), 0, (uint64_t)&v241);
            uint64_t v176 = v274[0].i64[0];
            int var4 = (int)v241.var4;
            *(_DWORD *)(*(void *)(v274[0].i64[0] + v174) + 4 * v171) = v241.var4;
            *(_DWORD *)(*(void *)(v176 + 24 * v171) + 4 * v175++) = var4;
            uint64_t v166 = v236;
            uint64_t v167 = v237;
            unint64_t v172 = 0x6DB6DB6DB6DB6DB7 * ((v237 - v236) >> 5);
            v174 += 24;
            v173 += 224;
          }
          while (v175 < v172);
        }
        v170 += 24;
        v169 += 224;
      }
      while (v168 < v172);
    }
    float32x4_t v231 = (char *)v230;
    var1 = (uint64_t *)v241.var1;
    v107 = v220;
    if (v241.var1 != *(id *)&v241.var2)
    {
      while (1)
      {
        uint64_t v179 = *var1;
        int32x4_t v180 = v231;
        if (v231 >= v232)
        {
          float32x4_t v182 = (char *)v230;
          uint64_t v183 = (v231 - (unsigned char *)v230) >> 2;
          unint64_t v184 = v183 + 1;
          if ((unint64_t)(v183 + 1) >> 62) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v185 = v232 - (unsigned char *)v230;
          if ((v232 - (unsigned char *)v230) >> 1 > v184) {
            unint64_t v184 = v185 >> 1;
          }
          if ((unint64_t)v185 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v186 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v186 = v184;
          }
          if (v186)
          {
            float32x4_t v187 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v232, v186);
            float32x4_t v182 = (char *)v230;
            int32x4_t v180 = v231;
          }
          else
          {
            float32x4_t v187 = 0;
          }
          float32x4_t v188 = &v187[4 * v183];
          *(_DWORD *)float32x4_t v188 = v179;
          uint64_t v181 = v188 + 4;
          while (v180 != v182)
          {
            int v189 = *((_DWORD *)v180 - 1);
            v180 -= 4;
            *((_DWORD *)v188 - 1) = v189;
            v188 -= 4;
          }
          float32x4_t v230 = v188;
          float32x4_t v231 = v181;
          int32x4_t v232 = &v187[4 * v186];
          if (v182) {
            operator delete(v182);
          }
        }
        else
        {
          *(_DWORD *)float32x4_t v231 = v179;
          uint64_t v181 = v180 + 4;
        }
        float32x4_t v231 = v181;
        v271 = 0;
        v270 = 0;
        v272 = 0;
        float32x4_t v190 = v241.var1;
        uint64_t v191 = *(void *)&v241.var2;
        if (*(void *)&v241.var2 - (unint64_t)v241.var1 < 9)
        {
          float32x4_t v192 = 0;
          if (!v241.var1) {
            goto LABEL_245;
          }
        }
        else
        {
          float32x4_t v192 = 0;
          unint64_t v193 = 1;
          do
          {
            uint64_t v194 = v190[v193];
            if (*(float *)(*(void *)(v274[0].i64[0] + 24 * v179) + 4 * v194) <= 0.3)
            {
              if (v192 >= v272)
              {
                float32x4_t v196 = (char *)v270;
                uint64_t v197 = (v192 - (unsigned char *)v270) >> 3;
                unint64_t v198 = v197 + 1;
                if ((unint64_t)(v197 + 1) >> 61) {
                  std::vector<float>::__throw_length_error[abi:ne180100]();
                }
                uint64_t v199 = v272 - (unsigned char *)v270;
                if ((v272 - (unsigned char *)v270) >> 2 > v198) {
                  unint64_t v198 = v199 >> 2;
                }
                if ((unint64_t)v199 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v200 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v200 = v198;
                }
                if (v200)
                {
                  v201 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v272, v200);
                  float32x4_t v192 = v271;
                  float32x4_t v196 = (char *)v270;
                }
                else
                {
                  v201 = 0;
                }
                uint64_t v202 = &v201[8 * v197];
                *(void *)uint64_t v202 = v194;
                int32x4_t v195 = v202 + 8;
                while (v192 != v196)
                {
                  uint64_t v203 = *((void *)v192 - 1);
                  v192 -= 8;
                  *((void *)v202 - 1) = v203;
                  v202 -= 8;
                }
                v270 = v202;
                v271 = v195;
                v272 = &v201[8 * v200];
                if (v196) {
                  operator delete(v196);
                }
              }
              else
              {
                *(void *)float32x4_t v192 = v194;
                int32x4_t v195 = v192 + 8;
              }
              v271 = v195;
              float32x4_t v192 = v195;
              float32x4_t v190 = v241.var1;
              uint64_t v191 = *(void *)&v241.var2;
            }
            ++v193;
          }
          while (v193 < (v191 - (uint64_t)v190) >> 3);
          if (!v190) {
            goto LABEL_245;
          }
        }
        *(void *)&v241.var2 = v190;
        operator delete(v190);
        float32x4_t v192 = v271;
LABEL_245:
        var1 = (uint64_t *)v270;
        v241.var1 = v270;
        *(void *)&v241.var2 = v192;
        v241.var3 = v272;
        v107 = v220;
        if (v270 == v192) {
          goto LABEL_250;
        }
      }
    }
    float32x4_t v192 = (char *)v241.var1;
LABEL_250:
    if (v192)
    {
      *(void *)&v241.var2 = v192;
      operator delete(v192);
    }
    v241.var1 = v274;
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v241);
    long long v205 = (int *)v230;
    long long v204 = (int *)v231;
    if (v230 != v231)
    {
      long long v206 = v252;
      do
      {
        long long v207 = (const OUBox3d *)(v236 + 224 * *v205);
        if ((unint64_t)v206 >= v253)
        {
          long long v206 = (OUBox3d *)std::vector<OUBox3d>::__emplace_back_slow_path<OUBox3d&>(&v251, v207);
        }
        else
        {
          OUBox3d::OUBox3d(v206, v207);
          long long v206 = (OUBox3d *)((char *)v206 + 224);
        }
        v252 = v206;
        ++v205;
      }
      while (v205 != v204);
      long long v205 = (int *)v230;
    }
    if (v205)
    {
      float32x4_t v231 = (char *)v205;
      operator delete(v205);
    }
    if (v233)
    {
      long long v234 = (float *)v233;
      operator delete(v233);
    }
    v241.var1 = &v236;
    std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)&v241);
    v241.var1 = &v239;
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v241);
LABEL_130:
    v117 = (uint64_t *)v106[1];
    if (v117)
    {
      do
      {
        v118 = v117;
        v117 = (uint64_t *)*v117;
      }
      while (v117);
    }
    else
    {
      do
      {
        v118 = (uint64_t *)v106[2];
        BOOL v119 = *v118 == (void)v106;
        v106 = v118;
      }
      while (!v119);
    }
    v106 = v118;
  }
  while (v118 != (uint64_t *)v255);
  uint64_t v208 = v251;
  long long v209 = v252;
  v107->__end_ = 0;
  v107->__end_cap_.__value_ = 0;
  v107->__begin_ = 0;
  if (v209 != (OUBox3d *)v208)
  {
    uint64_t v210 = 0;
    unint64_t v211 = 0;
    do
    {
      OUBox3d::OUBox3d(&v241, (const OUBox3d *)(v208 + v210));
      if ([*(id *)(v251 + v210 + 128) isEqualToString:v222])
      {
        box3dToCentroidSizeAngle((float32x4_t *)(v251 + v210), (uint64_t *)v274);
        uint64_t v212 = v274[0].i64[0];
        float v213 = *(float *)(v274[0].i64[0] + 12);
        float v214 = *(float *)(v274[0].i64[0] + 16);
        if (v213 < v214)
        {
          float v215 = *(float *)(v274[0].i64[0] + 24) + 1.57079633;
          *(float *)(v274[0].i64[0] + 24) = v215;
          *(float *)(v212 + 12) = v214;
          *(float *)(v212 + 16) = v213;
        }
        centroidSizeAngleToBox3d((uint64_t *)v274, 1, &v275);
        OUBox3d v241 = v275;
        long long v242 = v276;
        long long v243 = v277;
        if (v274[0].i64[0])
        {
          v274[0].i64[1] = v274[0].i64[0];
          operator delete((void *)v274[0].i64[0]);
        }
      }
      end = v107->__end_;
      if (end >= v107->__end_cap_.__value_)
      {
        uint64_t p_var5 = std::vector<OUBox3d>::__push_back_slow_path<OUBox3d const&>((uint64_t *)v107, &v241);
      }
      else
      {
        OUBox3d::OUBox3d(v107->__end_, &v241);
        uint64_t p_var5 = (uint64_t)&end[2].var5;
        v107->__end_ = (OUBox3d *)((char *)end + 224);
      }
      v107->__end_ = (OUBox3d *)p_var5;

      if (v249) {
        operator delete(v249);
      }
      if (v247)
      {
        v248 = v247;
        operator delete(v247);
      }

      ++v211;
      uint64_t v208 = v251;
      v210 += 224;
    }
    while (v211 < 0x6DB6DB6DB6DB6DB7 * (((uint64_t)v252 - v251) >> 5));
  }
LABEL_282:
  v241.var1 = &v251;
  std::vector<OUBox3d>::__destroy_vector::operator()[abi:ne180100]((void ***)&v241);
  std::__tree<std::__value_type<int,std::vector<int>>,std::__map_value_compare<int,std::__value_type<int,std::vector<int>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<int>>>>::destroy((uint64_t)&v254, v255[0]);
  v241.var1 = v256;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v241);
  if (v259)
  {
    v260 = v259;
    operator delete(v259);
  }
  if (v257)
  {
    v258 = v257;
    operator delete(v257);
  }
  v241.var1 = v261;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v241);
  if (v262)
  {
    v263 = (char *)v262;
    operator delete(v262);
  }
  if (__p)
  {
    v266 = (char *)__p;
    operator delete(__p);
  }
  std::__tree<std::__value_type<NSString * {__strong},float>,std::__map_value_compare<NSString * {__strong},std::__value_type<NSString * {__strong},float>,CompareNSString,true>,std::allocator<std::__value_type<NSString * {__strong},float>>>::destroy((uint64_t)v268, v269[0]);
  return result;
}

- (vector<OUBox3d,)crossClassNMS:(OU3DObjectMerger *)self
{
  uint64_t v146 = *MEMORY[0x263EF8340];
  uint64_t v6 = *((void *)a4 + 1);
  uint64_t v7 = *(void *)a4;
  uint64_t v8 = (v6 - *(void *)a4) >> 5;
  unint64_t v9 = 0x6DB6DB6DB6DB6DB7 * v8;
  if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * v8) > 1)
  {
    unint64_t v109 = (uint64_t *)retstr;
    std::vector<float>::vector(__p, 0x6DB6DB6DB6DB6DB7 * v8);
    std::vector<std::vector<float>>::vector(v129, v9, (uint64_t)__p);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    unint64_t v11 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 5);
    std::vector<float>::vector(__p, v11);
    std::vector<std::vector<float>>::vector(v128, v11, (uint64_t)__p);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    unint64_t v12 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 5);
    std::vector<float>::vector(__p, v12);
    std::vector<std::vector<float>>::vector(v127, v12, (uint64_t)__p);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    unint64_t v13 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 5);
    std::vector<float>::vector(__p, v13);
    std::vector<std::vector<float>>::vector(v126, v13, (uint64_t)__p);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    uint64_t v14 = *(void *)a4;
    uint64_t v15 = *((void *)a4 + 1);
    long long v16 = (uint64_t *)a4;
    if (v15 == *(void *)a4)
    {
      unint64_t v21 = 0x6DB6DB6DB6DB6DB7 * ((v15 - *(void *)a4) >> 5);
    }
    else
    {
      unint64_t v17 = 0;
      uint64_t v18 = 24;
      uint64_t v19 = 224;
      do
      {
        unint64_t v20 = v17++;
        unint64_t v21 = 0x6DB6DB6DB6DB6DB7 * ((v15 - v14) >> 5);
        if (v17 < v21)
        {
          uint64_t v22 = v18;
          uint64_t v23 = v19;
          unint64_t v110 = v17;
          do
          {
            long long v124 = 0u;
            long long v125 = 0u;
            *(_OWORD *)__p = 0u;
            box3dIou((float32x4_t *)(v14 + 224 * v20), (float32x4_t *)(v14 + v23), 0, (uint64_t)__p);
            uint64_t v24 = v127[0];
            *(_DWORD *)(*(void *)(v127[0] + 24 * v20) + 4 * v17) = __p[0];
            *(_DWORD *)(*(void *)(v24 + v22) + 4 * v20) = __p[0];
            uint64_t v25 = v126[0];
            *(_DWORD *)(*(void *)(v126[0] + 24 * v20) + 4 * v17) = HIDWORD(__p[1]);
            *(_DWORD *)(*(void *)(v25 + v22) + 4 * v20) = HIDWORD(__p[1]);
            uint64_t v26 = v129[0];
            *(_DWORD *)(*(void *)(v129[0] + 24 * v20) + 4 * v17) = DWORD2(v124);
            *(_DWORD *)(*(void *)(v26 + v22) + 4 * v20) = DWORD2(v124);
            uint64_t v27 = v128[0];
            *(_DWORD *)(*(void *)(v128[0] + 24 * v20) + 4 * v17) = DWORD1(v125);
            *(_DWORD *)(*(void *)(v27 + v22) + 4 * v20) = DWORD1(v125);
            ++v17;
            uint64_t v14 = *v16;
            uint64_t v15 = v16[1];
            unint64_t v21 = 0x6DB6DB6DB6DB6DB7 * ((v15 - *v16) >> 5);
            v23 += 224;
            v22 += 24;
          }
          while (v17 < v21);
          unint64_t v17 = v110;
        }
        v19 += 224;
        v18 += 24;
      }
      while (v17 < v21);
    }
    LOBYTE(__p[0]) = 0;
    std::vector<BOOL>::vector(v122, v21, (unsigned __int8 *)__p);
    long long v28 = v16;
    RemoveFPCabinetFromRefridge(v16, v122);
    BOOL v119 = 0;
    v120 = 0;
    uint64_t v121 = 0;
    long long v29 = (const OUBox3d *)*v16;
    if (v16[1] != *v16)
    {
      unint64_t v30 = 0;
      do
      {
        long long v31 = (float *)((char *)v29 + 224 * v30);
        float v33 = v31[34];
        float v32 = v31 + 34;
        float v34 = v33;
        if (fabsf(v33 + -1.0) >= 0.00000011921)
        {
          long long v38 = v120;
          if (v120 >= v121)
          {
            double v40 = (char *)v119;
            uint64_t v41 = (v120 - (unsigned char *)v119) >> 2;
            unint64_t v42 = v41 + 1;
            if ((unint64_t)(v41 + 1) >> 62) {
              std::vector<float>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v43 = v121 - (unsigned char *)v119;
            if ((v121 - (unsigned char *)v119) >> 1 > v42) {
              unint64_t v42 = v43 >> 1;
            }
            if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v44 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v44 = v42;
            }
            if (v44)
            {
              long long v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v121, v44);
              double v40 = (char *)v119;
              long long v38 = v120;
              float v34 = *v32;
            }
            else
            {
              long long v45 = 0;
            }
            unint64_t v52 = &v45[4 * v41];
            *(float *)unint64_t v52 = v34;
            float v39 = v52 + 4;
            while (v38 != v40)
            {
              int v53 = *((_DWORD *)v38 - 1);
              v38 -= 4;
              *((_DWORD *)v52 - 1) = v53;
              v52 -= 4;
            }
            BOOL v119 = v52;
            v120 = v39;
            uint64_t v121 = &v45[4 * v44];
            if (v40) {
              operator delete(v40);
            }
          }
          else
          {
            *(float *)v120 = v34;
            float v39 = v38 + 4;
          }
          v120 = v39;
        }
        else
        {
          box3dToCentroidSizeAngle((float32x4_t *)v29 + 14 * v30, (uint64_t *)__p);
          float v35 = (float)(*((float *)__p[0] + 3) * *((float *)__p[0] + 4)) + 1.0;
          long long v36 = v120;
          if (v120 >= v121)
          {
            long long v46 = (char *)v119;
            uint64_t v47 = (v120 - (unsigned char *)v119) >> 2;
            unint64_t v48 = v47 + 1;
            if ((unint64_t)(v47 + 1) >> 62) {
              std::vector<float>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v49 = v121 - (unsigned char *)v119;
            if ((v121 - (unsigned char *)v119) >> 1 > v48) {
              unint64_t v48 = v49 >> 1;
            }
            if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v50 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v50 = v48;
            }
            if (v50)
            {
              uint64_t v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v121, v50);
              long long v46 = (char *)v119;
              long long v36 = v120;
            }
            else
            {
              uint64_t v51 = 0;
            }
            v54 = (float *)&v51[4 * v47];
            float *v54 = v35;
            long long v37 = v54 + 1;
            while (v36 != v46)
            {
              int v55 = *((_DWORD *)v36 - 1);
              v36 -= 4;
              *((_DWORD *)v54-- - 1) = v55;
            }
            BOOL v119 = v54;
            v120 = (char *)v37;
            uint64_t v121 = &v51[4 * v50];
            if (v46) {
              operator delete(v46);
            }
          }
          else
          {
            *(float *)v120 = v35;
            long long v37 = (float *)(v36 + 4);
          }
          v120 = (char *)v37;
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
        }
        ++v30;
        long long v29 = (const OUBox3d *)*v28;
      }
      while (v30 < 0x6DB6DB6DB6DB6DB7 * ((v28[1] - *v28) >> 5));
    }
    long long v56 = @"Sofa";
    v117 = 0;
    v118 = 0;
    v116 = 0;
    LOBYTE(v115) = 0;
    long long v57 = operator new(8uLL);
    v116 = v57;
    v117 = v57;
    v118 = v57 + 1;
    long long v58 = v56;
    void *v57 = v58;
    v117 = v57 + 1;
    int v114 = &v116;
    std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v114);

    long long v59 = @"Table";
    v117 = 0;
    v118 = 0;
    v116 = 0;
    int v114 = &v116;
    LOBYTE(v115) = 0;
    long long v60 = operator new(8uLL);
    v116 = v60;
    v117 = v60;
    v118 = v60 + 1;
    unint64_t v61 = v59;
    *long long v60 = v61;
    v117 = v60 + 1;
    int v114 = &v116;
    std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v114);

    long long v62 = @"Bed";
    uint64_t v144 = v62;
    long long v63 = @"Chair";
    uint64_t v145 = v63;
    v117 = 0;
    v118 = 0;
    v116 = 0;
    int v114 = &v116;
    LOBYTE(v115) = 0;
    long long v64 = operator new(0x10uLL);
    v116 = v64;
    v117 = v64;
    v118 = v64 + 2;
    void *v64 = v144;
    v64[1] = v145;
    v117 = v64 + 2;
    int v114 = &v116;
    std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v114);
    for (uint64_t i = 8; i != -8; i -= 8)

    std::string::basic_string[abi:ne180100]<0>(&v116, "cross_class_nms_sofa");
    if (SHIBYTE(v118) < 0) {
      operator delete(v116);
    }
    long long v66 = v58;
    uint64_t v142 = v66;
    long long v67 = v63;
    int v143 = v67;
    v112 = 0;
    v113 = 0;
    unint64_t v111 = 0;
    uint64_t v130 = &v111;
    char v131 = 0;
    v68 = operator new(0x10uLL);
    unint64_t v111 = v68;
    v112 = v68;
    v113 = v68 + 2;
    void *v68 = v142;
    v68[1] = v143;
    v112 = v68 + 2;
    uint64_t v130 = &v111;
    std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v130);
    for (uint64_t j = 8; j != -8; j -= 8)

    std::string::basic_string[abi:ne180100]<0>(&v111, "cross_class_nms_sofa_chair");
    if (SHIBYTE(v113) < 0) {
      operator delete(v111);
    }
    if (v114)
    {
      uint64_t v115 = v114;
      operator delete(v114);
    }
    if (v116)
    {
      v117 = v116;
      operator delete(v116);
    }
    uint64_t v70 = v61;
    unint64_t v140 = v70;
    unint64_t v71 = v67;
    float32x4_t v141 = v71;
    v112 = 0;
    v113 = 0;
    unint64_t v111 = 0;
    uint64_t v130 = &v111;
    char v131 = 0;
    unint64_t v72 = operator new(0x10uLL);
    unint64_t v111 = v72;
    v112 = v72;
    v113 = v72 + 2;
    void *v72 = v140;
    v72[1] = v141;
    v112 = v72 + 2;
    uint64_t v130 = &v111;
    std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v130);
    for (uint64_t k = 8; k != -8; k -= 8)

    std::string::basic_string[abi:ne180100]<0>(&v111, "cross_class_nms_table_chair");
    if (SHIBYTE(v113) < 0) {
      operator delete(v111);
    }
    if (v114)
    {
      uint64_t v115 = v114;
      operator delete(v114);
    }
    if (v116)
    {
      v117 = v116;
      operator delete(v116);
    }
    unint64_t v138 = v66;
    uint64_t v74 = v62;
    uint64_t v139 = v74;
    v112 = 0;
    v113 = 0;
    unint64_t v111 = 0;
    uint64_t v130 = &v111;
    char v131 = 0;
    v75 = operator new(0x10uLL);
    unint64_t v111 = v75;
    v112 = v75;
    v113 = v75 + 2;
    void *v75 = v138;
    v75[1] = v139;
    v112 = v75 + 2;
    uint64_t v130 = &v111;
    std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v130);
    for (uint64_t m = 8; m != -8; m -= 8)

    std::string::basic_string[abi:ne180100]<0>(&v111, "cross_class_nms_sofa_bed");
    if (SHIBYTE(v113) < 0) {
      operator delete(v111);
    }
    if (v114)
    {
      uint64_t v115 = v114;
      operator delete(v114);
    }
    if (v116)
    {
      v117 = v116;
      operator delete(v116);
    }
    v136 = @"Dishwasher";
    uint64_t v77 = @"Sink";
    uint64_t v137 = v77;
    v112 = 0;
    v113 = 0;
    unint64_t v111 = 0;
    uint64_t v130 = &v111;
    char v131 = 0;
    uint64_t v78 = operator new(0x10uLL);
    unint64_t v111 = v78;
    v112 = v78;
    v113 = v78 + 2;
    void *v78 = v136;
    v78[1] = v137;
    v112 = v78 + 2;
    uint64_t v130 = &v111;
    std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v130);
    for (uint64_t n = 8; n != -8; n -= 8)

    std::string::basic_string[abi:ne180100]<0>(&v111, "cross_class_nms_dish_sink");
    if (SHIBYTE(v113) < 0) {
      operator delete(v111);
    }
    float32x4_t v134 = @"Bathtub";
    v135 = v77;
    v112 = 0;
    v113 = 0;
    unint64_t v111 = 0;
    uint64_t v130 = &v111;
    char v131 = 0;
    float v80 = operator new(0x10uLL);
    unint64_t v111 = v80;
    v112 = v80;
    v113 = v80 + 2;
    *float v80 = v134;
    v80[1] = v135;
    v112 = v80 + 2;
    uint64_t v130 = &v111;
    std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v130);
    for (iuint64_t i = 8; ii != -8; ii -= 8)

    std::string::basic_string[abi:ne180100]<0>(&v111, "cross_class_nms_bath_sink");
    if (SHIBYTE(v113) < 0) {
      operator delete(v111);
    }
    float v82 = @"Cabinet";
    v112 = 0;
    v113 = 0;
    unint64_t v111 = 0;
    uint64_t v130 = &v111;
    char v131 = 0;
    float v83 = operator new(8uLL);
    unint64_t v111 = v83;
    v112 = v83;
    v113 = v83 + 1;
    char v84 = v82;
    *float v83 = v84;
    v112 = v83 + 1;
    uint64_t v130 = &v111;
    std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v130);

    std::string::basic_string[abi:ne180100]<0>(&v111, "cross_class_nms_cabinet");
    if (SHIBYTE(v113) < 0) {
      operator delete(v111);
    }
    char v85 = v74;
    v112 = 0;
    v113 = 0;
    unint64_t v111 = 0;
    uint64_t v130 = &v111;
    char v131 = 0;
    uint64_t v86 = operator new(8uLL);
    unint64_t v111 = v86;
    v112 = v86;
    v113 = v86 + 1;
    unint64_t v87 = v85;
    *uint64_t v86 = v87;
    v112 = v86 + 1;
    uint64_t v130 = &v111;
    std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v130);

    std::string::basic_string[abi:ne180100]<0>(&v111, "cross_class_nms_bed.json");
    if (SHIBYTE(v113) < 0) {
      operator delete(v111);
    }
    float v88 = @"Shelf";
    v112 = 0;
    v113 = 0;
    unint64_t v111 = 0;
    uint64_t v130 = &v111;
    char v131 = 0;
    float v89 = operator new(8uLL);
    unint64_t v111 = v89;
    v112 = v89;
    v113 = v89 + 1;
    uint64_t v90 = v88;
    *float v89 = v90;
    v112 = v89 + 1;
    uint64_t v130 = &v111;
    std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v130);

    std::string::basic_string[abi:ne180100]<0>(&v111, "cross_class_nms_shelf_iou3ds_inner");
    if (SHIBYTE(v113) < 0) {
      operator delete(v111);
    }
    uint64_t v91 = v84;
    v133[0] = v91;
    int v92 = v70;
    v133[1] = v92;
    int v93 = v90;
    v133[2] = v93;
    v112 = 0;
    v113 = 0;
    unint64_t v111 = 0;
    uint64_t v130 = &v111;
    char v131 = 0;
    uint64_t v94 = (char *)operator new(0x18uLL);
    uint64_t v95 = 0;
    unint64_t v111 = v94;
    v112 = v94;
    v113 = v94 + 24;
    do
    {
      *(void *)&v94[v95 * 8] = (id)v133[v95];
      ++v95;
    }
    while (v95 != 3);
    v112 = v94 + 24;
    uint64_t v130 = &v111;
    std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v130);
    for (juint64_t j = 2; jj != -1; --jj)

    std::string::basic_string[abi:ne180100]<0>(&v111, "cross_class_nms_cab_tab_shelf_iou3ds");
    if (SHIBYTE(v113) < 0) {
      operator delete(v111);
    }
    v132[0] = v91;
    v132[1] = v92;
    v132[2] = v93;
    v112 = 0;
    v113 = 0;
    unint64_t v111 = 0;
    uint64_t v130 = &v111;
    char v131 = 0;
    uint64_t v97 = (char *)operator new(0x18uLL);
    uint64_t v98 = 0;
    unint64_t v111 = v97;
    v112 = v97;
    v113 = v97 + 24;
    do
    {
      *(void *)&v97[v98 * 8] = (id)v132[v98];
      ++v98;
    }
    while (v98 != 3);
    v112 = v97 + 24;
    uint64_t v130 = &v111;
    std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v130);
    for (kuint64_t k = 2; kk != -1; --kk)

    std::string::basic_string[abi:ne180100]<0>(&v111, "cross_class_nms_cab_tab_shelf_iou3ds_inner");
    if (SHIBYTE(v113) < 0) {
      operator delete(v111);
    }
    unint64_t v100 = v71;
    v112 = 0;
    v113 = 0;
    unint64_t v111 = 0;
    uint64_t v130 = &v111;
    char v131 = 0;
    unint64_t v101 = operator new(8uLL);
    unint64_t v111 = v101;
    v112 = v101;
    v113 = v101 + 1;
    unint64_t v102 = v100;
    *unint64_t v101 = v102;
    v112 = v101 + 1;
    uint64_t v130 = &v111;
    std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v130);

    std::string::basic_string[abi:ne180100]<0>(&v111, "cross_class_nms_chair");
    if (SHIBYTE(v113) < 0) {
      operator delete(v111);
    }
    *unint64_t v109 = 0;
    v109[1] = 0;
    v109[2] = 0;
    v104 = (const OUBox3d *)*v28;
    uint64_t v103 = v28[1];
    if (v103 != *v28)
    {
      uint64_t v105 = 0;
      v106 = 0;
      unint64_t v107 = 0;
      do
      {
        if (((*(void *)((char *)v122[0] + ((v107 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v107) & 1) == 0)
        {
          uint64_t v108 = (const OUBox3d *)((char *)v104 + v105);
          if ((unint64_t)v106 >= v109[2])
          {
            v106 = (OUBox3d *)std::vector<OUBox3d>::__push_back_slow_path<OUBox3d const&>(v109, v108);
          }
          else
          {
            OUBox3d::OUBox3d(v106, v108);
            v106 = (OUBox3d *)((char *)v106 + 224);
            v109[1] = (uint64_t)v106;
          }
          v109[1] = (uint64_t)v106;
          v104 = (const OUBox3d *)*v28;
          uint64_t v103 = v28[1];
        }
        ++v107;
        v105 += 224;
      }
      while (v107 < 0x6DB6DB6DB6DB6DB7 * ((v103 - (uint64_t)v104) >> 5));
    }
    if (v114)
    {
      uint64_t v115 = v114;
      operator delete(v114);
    }
    if (v116)
    {
      v117 = v116;
      operator delete(v116);
    }
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v119)
    {
      v120 = (char *)v119;
      operator delete(v119);
    }
    if (v122[0]) {
      operator delete(v122[0]);
    }
    __p[0] = v126;
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
    __p[0] = v127;
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
    __p[0] = v128;
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
    __p[0] = v129;
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  }
  else
  {
    retstr->__begin_ = 0;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
    return (vector<OUBox3d, std::allocator<OUBox3d>> *)std::vector<OUBox3d>::__init_with_size[abi:ne180100]<OUBox3d*,OUBox3d*>(retstr, v7, v6, v9);
  }
  return result;
}

@end