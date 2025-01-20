uint64_t idcComputeGlobalTransform()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  unint64_t v5;
  int32x2_t *v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  int v11;
  float32x2_t v12;
  int32x2_t v13;
  float32x2_t v14;
  float v15;
  float v17;
  BOOL v18;
  int32x2_t v19;
  long long v20;
  unsigned int v21;
  float v22;
  int32x2_t v24;
  int v25;
  int32x2_t v26;
  unsigned int v27;
  float32x2_t v29;
  float32x2_t v35;
  uint64_t v38;
  float32x2_t v41;
  float32x2_t *v42;
  float32x2_t *v43;
  unint64_t v44;
  float32x2_t v45;
  float32x2_t v46;
  float32x2_t v47;
  float32x2_t v48;
  float v49;
  float v50;
  uint64_t *v51;
  float32x2_t *v52;
  unint64_t v53;
  float v54;
  float32x2_t v55;
  float32x2_t v56;
  uint64_t v57;
  float v59;
  float v60;
  float v61;
  uint64_t *v62;
  float32x2_t *v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float32x2_t v73;
  float32x2_t v74;
  uint64_t v76;
  float v84;
  float v85;
  float v86;
  float v87;
  long long v88;
  float v89;
  float32x2_t v92;
  float32x2_t v97;
  __int32 v100;
  float v101;
  float v102;
  float v103;
  float v104;
  uint64_t v105;
  uint64_t v107;
  float v108;
  float v109;
  float v110;
  float v111;
  float v112;
  uint64_t v113;
  float v114;
  float v115;
  float v116;
  float v117;
  float v118;
  float v119;
  uint64_t v120;
  int v121;
  long long v122;
  float v123;
  float v124;
  float v125;
  float32x2_t v126;
  float32x2_t v127;
  uint64_t v128;
  float v129;
  long long v130;
  _OWORD v131[3];
  int v132;
  int v133;
  int v134;
  int v135;
  int v136;
  int v137;
  int v138;
  int v139;
  int v140;
  int v141;
  int v142;
  unsigned char v143[3];
  float32x2_t v144[108];
  void v145[108];
  void v146[108];
  float v147;
  float v148;
  float v149;
  float v150;
  float v151;
  float v152;
  float v153;
  float v154;
  float v155;
  long long v156;
  long long v157;
  long long v158;
  long long v159;
  long long v160;
  long long v161;
  long long v162;
  long long v163;
  long long v164;
  long long v165;
  long long v166;
  long long v167;
  long long v168;
  long long v169;
  long long v170;
  long long v171;
  long long v172;
  long long v173;
  long long v174;
  long long v175;
  float v176;
  uint64_t v177;
  CGRect v178;
  CGRect v179;

  v0 = MEMORY[0x270FA5388]();
  v2 = v1;
  v128 = v3;
  v5 = (unint64_t)v4;
  v6 = (int32x2_t *)v0;
  v177 = *MEMORY[0x263EF8340];
  v8 = v7;
  v9 = v8;
  if (v8 && v2 && v128 >= 2 && HIDWORD(v128) > 1 && v128 < 0xD && HIDWORD(v128) < 0xA)
  {
    v131[0] = vdupq_n_s64(1uLL);
    v131[1] = xmmword_262F34690;
    v131[2] = xmmword_262F346A0;
    [v8 getBytes:v144 bytesPerRow:96 fromRegion:v131 mipmapLevel:0];
    v179.origin.x = (double)*(int *)v5;
    v10 = v6[11].i32[0];
    v11 = v6[11].i32[1];
    v178.size.width = (double)v10;
    v178.size.height = (double)v11;
    v179.origin.y = (double)*(int *)(v5 + 4);
    v179.size.width = (double)*(int *)(v5 + 16);
    v179.size.height = (double)*(int *)(v5 + 20);
    v12 = vcvt_f32_s32(v6[3]);
    v13 = v6[9];
    v14 = vcvt_f32_s32(v13);
    v178.origin.x = (double)v13.i32[0];
    v178.origin.y = (double)(int)HIDWORD(*(void *)&v6[9]);
    v15 = (double)v10 / v179.size.width;
    _S11 = (double)v11 / v179.size.height;
    v17 = v178.origin.x - v15 * v179.origin.x;
    v18 = CGRectContainsRect(v178, v179);
    LODWORD(v5) = 0;
    v21 = (9 - HIDWORD(v128)) >> 1;
    v22 = 1.0 / fmaxf((float)v10 + -1.0, 1.0);
    _S1 = 1.0 / fmaxf((float)v11 + -1.0, 1.0);
    *(float *)v24.i32 = (float)(v6[5].i32[1] - 1) * 0.125;
    v25 = 12 * v21;
    *(float *)v26.i32 = (float)(v6[5].i32[0] - 1) / 11.0;
    do
    {
      v27 = (12 - v128) >> 1;
      do
      {
        _D5 = vadd_f32(v144[v25 + v27], v12);
        if (v18)
        {
          v29.f32[0] = vmlas_n_f32(v17, v15, _D5.f32[0]);
          __asm { FMLA            S7, S11, V5.S[1] }
          v29.i32[1] = _S7;
          _D5 = v29;
        }
        v35.f32[0] = *(float *)v26.i32 * (float)v27;
        v35.f32[1] = *(float *)v24.i32 * (float)v21;
        _D6 = vsub_f32(vadd_f32(v35, v12), v14);
        _D5 = vsub_f32(_D5, v14);
        *(float *)&v38 = v22 * _D6.f32[0];
        __asm { FMLS            S16, S1, V6.S[1] }
        HIDWORD(v38) = _S16;
        _D6.f32[0] = v22 * _D5.f32[0];
        __asm { FMLS            S16, S1, V5.S[1] }
        _D6.i32[1] = _S16;
        v146[v5] = v38;
        v145[v5] = _D6;
        v5 = (v5 + 1);
        ++v27;
      }
      while (((12 - v128) >> 1) - ((12 - v128) & 0xFFFFFFFE) + 12 != v27);
      ++v21;
      v25 += 12;
    }
    while (v21 != 9 - ((9 - HIDWORD(v128)) >> 1));
    *(float *)v19.i32 = (float)v5;
    v125 = (float)v5;
    if (v5)
    {
      v41 = 0;
      v42 = (float32x2_t *)v145;
      v43 = (float32x2_t *)v146;
      v44 = v5;
      v45 = 0;
      do
      {
        v46 = *v43++;
        v41 = vadd_f32(v41, v46);
        v47 = *v42++;
        v45 = vadd_f32(v45, v47);
        --v44;
      }
      while (v44);
      v48 = vdiv_f32(v41, (float32x2_t)vdup_lane_s32(v19, 0));
      v49 = v45.f32[0] / *(float *)v19.i32;
      v50 = 0.0;
      v51 = v145;
      v52 = (float32x2_t *)v146;
      v53 = v5;
      v54 = 0.0;
      v129 = v45.f32[1] / *(float *)v19.i32;
      do
      {
        v55 = *v52++;
        v56 = vsub_f32(v55, v48);
        v54 = v54 + hypotf(v56.f32[0], v56.f32[1]);
        v57 = *v51++;
        v50 = v50 + hypotf(*(float *)&v57 - v49, *((float *)&v57 + 1) - v129);
        --v53;
      }
      while (v53);
      *(float *)v19.i32 = (float)v5;
      *(float *)v26.i32 = v129;
    }
    else
    {
      v54 = 0.0;
      *(float *)v26.i32 = 0.0 / *(float *)v19.i32;
      v48 = (float32x2_t)vdup_lane_s32(v26, 0);
      v49 = 0.0 / *(float *)v19.i32;
      v50 = 0.0;
    }
    *(float *)v24.i32 = (float)(*(float *)v19.i32 * 1.4142) / v54;
    v176 = 0.0;
    v175 = 0u;
    v174 = 0u;
    v173 = 0u;
    v172 = 0u;
    v171 = 0u;
    v170 = 0u;
    v169 = 0u;
    v168 = 0u;
    v167 = 0u;
    v166 = 0u;
    v165 = 0u;
    v164 = 0u;
    _S10 = (float)(*(float *)v19.i32 * 1.4142) / v50;
    v59 = -(float)(_S10 * v49);
    v163 = 0u;
    v162 = 0u;
    v161 = 0u;
    v160 = 0u;
    v159 = 0u;
    v158 = 0u;
    v157 = 0u;
    v156 = 0u;
    v127 = vmul_n_f32(v48, -*(float *)v24.i32);
    v60 = -(float)(_S10 * *(float *)v26.i32);
    v124 = *(float *)v24.i32;
    if (v5)
    {
      v126 = (float32x2_t)vdup_lane_s32(v24, 0);
      *(void *)&v20 = 0;
      v61 = 0.0;
      v62 = v145;
      v63 = (float32x2_t *)v146;
      v64 = 0.0;
      v65 = 0.0;
      v66 = 0.0;
      v67 = 0.0;
      v68 = 0.0;
      v69 = 0.0;
      v70 = 0.0;
      v71 = 0.0;
      v72 = 0.0;
      v73 = 0;
      do
      {
        v74 = *v63++;
        _D31 = v74;
        v76 = *v62++;
        _V11.S[1] = HIDWORD(v76);
        _S12 = vmlas_n_f32(v59, _S10, *(float *)&v76);
        __asm { FMLA            S13, S10, V11.S[1] }
        v71 = v71 - _S12;
        _D14 = vmla_f32(v127, _D31, v126);
        _D31.i32[0] = _D14.i32[1];
        v68 = v68 + _D14.f32[1];
        v67 = vmlas_n_f32(v67, _D14.f32[1], _D14.f32[0]);
        __asm
        {
          FMLA            S7, S31, V14.S[1]
          FMLS            S6, S12, V14.S[0]
          FMLS            S16, S12, V14.S[1]
        }
        _D31.f32[0] = vmuls_lane_f32(_D14.f32[1], _D14, 1);
        v84 = (float)(_S13 * _S13) + (float)(_S12 * _S12);
        v85 = v70;
        v86 = _S10;
        v87 = v59;
        v88 = v20;
        v89 = v60;
        _D9 = vmul_n_f32(_D14, _D14.f32[0]);
        __asm { FMLS            S26, S12, V9.S[0] }
        v92 = vmla_n_f32(vmul_n_f32(vmul_n_f32(_D14, _S13), _S13), vmul_n_f32(_D14, _S12), _S12);
        __asm
        {
          FMLS            S17, S13, V9.S[0]
          FMLS            S24, S12, V9.S[1]
          FMLS            S4, S13, V9.S[1]
          FMLS            S21, S12, V9.S[1]
        }
        v66 = v66 - (float)(_D31.f32[0] * _S12);
        v97 = vmla_n_f32(vmul_n_f32(vmul_n_f32(_D9, _S13), _S13), vmul_n_f32(_D9, _S12), _S12);
        v65 = v65 - (float)(_D31.f32[0] * _S13);
        _D31.f32[0] = (float)(_S12 * (float)(_D31.f32[0] * _S12)) + (float)((float)(_D31.f32[0] * _S13) * _S13);
        v70 = v70 - _S13;
        __asm
        {
          FMLS            S2, S13, V14.S[0]
          FMLS            S12, S13, V14.S[1]
        }
        v64 = v64 + v84;
        v69 = v69 + _D14.f32[0];
        v72 = vmlas_n_f32(v72, _D14.f32[0], _D14.f32[0]);
        v73 = vadd_f32(v73, v97);
        v60 = v89;
        *((void *)&v20 + 1) = *((void *)&v88 + 1);
        v61 = v61 + _D31.f32[0];
        *(float32x2_t *)&v20 = vadd_f32(*(float32x2_t *)&v88, v92);
        v59 = v87;
        _S10 = v86;
        --v5;
      }
      while (v5);
      *(void *)&v156 = __PAIR64__(LODWORD(v67), LODWORD(v72));
      *((void *)&v158 + 1) = __PAIR64__(LODWORD(v68), _S7);
      *((float *)&v162 + 2) = v71;
      *((float *)&v169 + 1) = v85 - _S13;
      LODWORD(v167) = _S12;
      *((float *)&v156 + 2) = v69;
      *((void *)&v157 + 1) = __PAIR64__(_S24, _S26);
      *((float *)&v166 + 3) = v65;
      LODWORD(v158) = _S6;
      DWORD1(v164) = _S17;
      *((void *)&v164 + 1) = __PAIR64__(_S2, _S4);
      *(void *)&v160 = __PAIR64__(_S16, LODWORD(v66));
      HIDWORD(v159) = _S21;
      v176 = v64;
      *(float32x2_t *)&v171 = v73;
      DWORD2(v171) = v20;
      *((void *)&v173 + 1) = __PAIR64__(DWORD1(v20), LODWORD(v61));
      v100 = v73.i32[1];
      *(float *)v19.i32 = v125;
    }
    else
    {
      *(void *)&v20 = 0;
      v100 = 0;
      v70 = 0.0;
      _S12 = 0;
      v65 = 0.0;
      _S7 = 0;
      _S2 = 0;
      _S4 = 0;
      _S17 = 0;
      v72 = 0.0;
      v71 = 0.0;
      _S16 = 0;
      v66 = 0.0;
      _S21 = 0;
      v68 = 0.0;
      _S6 = 0;
      _S24 = 0;
      _S26 = 0;
      v69 = 0.0;
      v67 = 0.0;
    }
    *((float *)&v158 + 1) = v67;
    *((void *)&v160 + 1) = __PAIR64__(LODWORD(v68), LODWORD(v69));
    *(void *)&v174 = __PAIR64__(_S16, _S6);
    *((void *)&v169 + 1) = __PAIR64__(_S21, _S26);
    HIDWORD(v171) = _S24;
    *(void *)&v172 = __PAIR64__(_S16, LODWORD(v66));
    LODWORD(v161) = v19.i32[0];
    *((void *)&v174 + 1) = __PAIR64__(_S2, LODWORD(v71));
    *(void *)&v170 = __PAIR64__(_S17, _S6);
    *((void *)&v172 + 1) = __PAIR64__(LODWORD(v65), _S4);
    *((void *)&v163 + 1) = __PAIR64__(LODWORD(v67), LODWORD(v72));
    *(void *)&v175 = __PAIR64__(LODWORD(v70), _S12);
    *((float *)&v165 + 3) = v67;
    *(float *)&v164 = v69;
    *(void *)&v166 = __PAIR64__(LODWORD(v68), _S7);
    *((void *)&v168 + 1) = __PAIR64__(_S2, v19.u32[0]);
    *((void *)&v170 + 1) = __PAIR64__(_S2, _S4);
    *(void *)&v173 = __PAIR64__(v100, _S12);
    *(void *)&v168 = __PAIR64__(LODWORD(v68), LODWORD(v69));
    DWORD2(v166) = _S4;
    *(void *)&v162 = __PAIR64__(_S16, _S6);
    LODWORD(v169) = _S12;
    *((void *)&v175 + 1) = v20;
    qmemcpy(v143, "LIV", sizeof(v143));
    v142 = 9;
    v141 = 9;
    v140 = 1065353216;
    v139 = 1065353216;
    v138 = 1;
    v137 = 1;
    v135 = 1;
    v136 = 794552063;
    v133 = 512;
    v134 = 9;
    v132 = 0;
    ssyevx_NEWLAPACK();
    if (v132
      || (v101 = v153,
          v102 = v154,
          v103 = v155,
          v104 = v155 + vmlas_n_f32(vmuls_lane_f32(v154, v127, 1), v153, v127.f32[0]),
          fabsf(v104) < 1.0e-10))
    {
      fig_log_get_emitter();
      v105 = 4294954513;
      FigDebugAssert3();
    }
    else
    {
      v107 = 0;
      v108 = v124 / (float)(_S10 * v104);
      v109 = 1.0 / (float)(_S10 * v104);
      v110 = v124 / v104;
      v111 = v147;
      v112 = v148;
      *(float *)&v113 = v108 * (float)(v147 - (float)(v153 * v59));
      v114 = v150;
      v115 = v149;
      *((float *)&v113 + 1) = v108 * (float)(v150 - (float)(v153 * v60));
      *(float *)(v2 + 8) = v153 * v110;
      *(void *)v2 = v113;
      *(float *)&v113 = v108 * (float)(v112 - (float)(v102 * v59));
      v116 = v151;
      v117 = v152;
      *((float *)&v113 + 1) = v108 * (float)(v151 - (float)(v102 * v60));
      *(float *)(v2 + 24) = v102 * v110;
      *(void *)(v2 + 16) = v113;
      v118 = -(float)(v101 * v127.f32[0]);
      v119 = -(float)(v102 * v127.f32[1]);
      *(float *)&v120 = v109
                      * (float)((float)((float)((float)((float)((float)(v127.f32[1] * v112) + (float)(v111 * v127.f32[0]))
                                                      + v115)
                                              + (float)(v118 * v59))
                                      + (float)(v119 * v59))
                              - (float)(v103 * v59));
      *((float *)&v120 + 1) = v109
                            * (float)((float)((float)((float)((float)((float)(v127.f32[1] * v116)
                                                                    + (float)(v114 * v127.f32[0]))
                                                            + v117)
                                                    + (float)(v118 * v60))
                                            + (float)(v119 * v60))
                                    - (float)(v103 * v60));
      *(_DWORD *)(v2 + 40) = 1065353216;
      *(void *)(v2 + 32) = v120;
      do
      {
        v121 = 0;
        v122 = *(_OWORD *)(v2 + 16 * v107);
        do
        {
          v130 = v122;
          v123 = fabsf(*(float *)((unint64_t)&v130 & 0xFFFFFFFFFFFFFFF3 | (4 * (v121 & 3))));
          if (v123 >= INFINITY && v123 <= INFINITY)
          {
            fig_log_get_emitter();
            FigDebugAssert3();
            v105 = 4294954513;
            goto LABEL_28;
          }
          ++v121;
        }
        while (v121 != 3);
        ++v107;
      }
      while (v107 != 3);
      v105 = 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v105 = 4294954516;
  }
LABEL_28:

  return v105;
}

uint64_t idcComputeInverseDistortionPolynomial(uint64_t a1, uint64_t a2, uint64_t a3, float a4, float a5)
{
  v102[9] = *MEMORY[0x263EF8340];
  long long v83 = 0u;
  long long v82 = 0u;
  long long v81 = 0u;
  long double v8 = hypot((double)*(int *)(a2 + 16), (double)*(int *)(a2 + 20));
  uint64_t v9 = 0;
  double v10 = v8 * a5;
  do
  {
    *((double *)&v84 + v9) = *(float *)(a1 + 4 * v9);
    ++v9;
  }
  while (v9 != 7);
  uint64_t v11 = 0;
  double v12 = (a4 / 100.0 + 1.0) * (v10 * 0.5);
  double v13 = a4
      / (*(double *)&v84
       + (*(double *)&v85
        + (*(double *)&v86
         + (*(double *)&v87 + (*(double *)&v88 + (*(double *)&v89 + *(double *)&v90 * v12) * v12) * v12) * v12)
        * v12)
       * v12);
  do
  {
    *(double *)((char *)&v84 + v11) = v13 * *(double *)((char *)&v84 + v11);
    v11 += 8;
  }
  while (v11 != 56);
  uint64_t v14 = 0;
  memset(v80, 0, 512);
  float64x2_t v15 = (float64x2_t)vdupq_lane_s64(v90, 0);
  float64x2_t v16 = (float64x2_t)vdupq_lane_s64(v89, 0);
  float64x2_t v17 = (float64x2_t)vdupq_lane_s64(v88, 0);
  float64x2_t v18 = (float64x2_t)vdupq_lane_s64(v87, 0);
  int32x2_t v19 = (int32x2_t)0x100000000;
  float64x2_t v20 = (float64x2_t)vdupq_n_s64(0x4058C00000000000uLL);
  float64x2_t v21 = (float64x2_t)vdupq_lane_s64(v86, 0);
  float64x2_t v22 = (float64x2_t)vdupq_n_s64(0x4059000000000000uLL);
  __asm { FMOV            V17.2D, #1.0 }
  float64x2_t v27 = (float64x2_t)vdupq_lane_s64(v85, 0);
  float64x2_t v28 = (float64x2_t)vdupq_lane_s64(v84, 0);
  do
  {
    v29.i64[0] = v19.u32[0];
    v29.i64[1] = v19.u32[1];
    float64x2_t v30 = vdivq_f64(vmulq_n_f64(vcvtq_f64_u64(v29), v12), v20);
    float64x2_t v31 = vdivq_f64(v30, vaddq_f64(vdivq_f64(vmlaq_f64(v28, v30, vmlaq_f64(v27, v30, vmlaq_f64(v21, v30, vmlaq_f64(v18, v30, vmlaq_f64(v17, v30, vmlaq_f64(v16, v30, v15)))))), v22), _Q17));
    v32 = (float64x2_t *)&v80[v14];
    float64x2_t *v32 = v31;
    v32[50] = (float64x2_t)vbicq_s8((int8x16_t)vmulq_f64(vdivq_f64(vsubq_f64(v31, v30), v30), v22), (int8x16_t)vceqzq_f64(v30));
    int32x2_t v19 = vadd_s32(v19, (int32x2_t)0x200000002);
    ++v14;
  }
  while (v14 != 50);
  sub_262F217D4((double *)v80, (double *)&v81, (uint64_t)__src, (uint64_t)&v96);
  double v34 = v33;
  int v35 = 0;
  int v36 = 0;
  long long v99 = v81;
  long long v100 = v82;
  long long v101 = v83;
  double v37 = 0.0001;
  while (2)
  {
    int v78 = v36;
    int v79 = v35;
    memcpy(__dst, __src, sizeof(__dst));
    uint64_t v38 = 0;
    long long v93 = v96;
    long long v94 = v97;
    long long v95 = v98;
    do
    {
      __dst[v38] = (v37 + 1.0) * *(double *)&__src[v38 * 8];
      v38 += 7;
    }
    while (v38 != 42);
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    uint64_t v41 = 0;
    memset(v102, 0, 24);
    do
    {
      uint64_t v42 = 0;
      double v43 = 0.0;
      v44 = __dst;
      do
      {
        if (*((_DWORD *)v102 + v42) != 1)
        {
          for (uint64_t i = 0; i != 6; ++i)
          {
            if (!*((_DWORD *)v102 + i))
            {
              double v46 = fabs(v44[i]);
              if (v46 >= v43)
              {
                uint64_t v41 = i;
                uint64_t v40 = v42;
                double v43 = v46;
              }
            }
          }
        }
        ++v42;
        v44 += 6;
      }
      while (v42 != 6);
      ++*((_DWORD *)v102 + v41);
      if (v40 == v41)
      {
        uint64_t v47 = 6 * v41;
      }
      else
      {
        uint64_t v48 = 0;
        uint64_t v47 = 6 * v41;
        v49 = &__dst[6 * v41];
        v50 = &__dst[6 * v40];
        do
        {
          double v51 = v50[v48];
          v50[v48] = v49[v48];
          v49[v48++] = v51;
        }
        while (v48 != 6);
        uint64_t v52 = *((void *)&v93 + v40);
        *((void *)&v93 + v40) = *((void *)&v93 + v41);
        *((void *)&v93 + v41) = v52;
      }
      *((_DWORD *)&v102[3] + v39) = v40;
      *((_DWORD *)&v102[6] + v39) = v41;
      double v53 = __dst[7 * v41];
      if (fabs(v53) < 1.0e-40)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        fig_log_get_emitter();
        uint64_t v75 = 4294954513;
        FigDebugAssert3();
        fig_log_get_emitter();
        FigDebugAssert3();
        return v75;
      }
      uint64_t v54 = 0;
      __dst[7 * v41] = 1.0;
      double v55 = 1.0 / v53;
      do
      {
        *(float64x2_t *)&__dst[v47 + v54] = vmulq_n_f64(*(float64x2_t *)&__dst[v47 + v54], v55);
        v54 += 2;
      }
      while (v54 != 6);
      uint64_t v56 = 0;
      *((double *)&v93 + v41) = v55 * *((double *)&v93 + v41);
      v57 = __dst;
      v58 = &__dst[v47];
      do
      {
        if (v56 != v41)
        {
          uint64_t v59 = 0;
          uint64_t v60 = v41 + 6 * v56;
          double v61 = __dst[v60];
          __dst[v60] = 0.0;
          do
          {
            v57[v59] = v57[v59] - v58[v59] * v61;
            ++v59;
          }
          while (v59 != 6);
          *((double *)&v93 + v56) = *((double *)&v93 + v56) - *((double *)&v93 + v41) * v61;
        }
        ++v56;
        v57 += 6;
      }
      while (v56 != 6);
      ++v39;
    }
    while (v39 != 6);
    uint64_t v62 = 5;
    do
    {
      uint64_t v63 = v62;
      int v64 = *((_DWORD *)&v102[3] + v62);
      int v65 = *((_DWORD *)&v102[6] + v63);
      if (v64 != v65)
      {
        for (uint64_t j = 0; j != 36; j += 6)
        {
          double v67 = __dst[(v64 + j)];
          __dst[(v64 + j)] = __dst[(v65 + j)];
          __dst[(v65 + j)] = v67;
        }
      }
      uint64_t v62 = v63 - 1;
    }
    while (v63);
    do
    {
      *(long long *)((char *)&v99 + v63) = (__int128)vaddq_f64(*(float64x2_t *)((char *)&v80[100] + v63), *(float64x2_t *)((char *)&v93 + v63));
      v63 += 16;
    }
    while (v63 != 48);
    sub_262F217D4((double *)v80, (double *)&v99, (uint64_t)__dst, (uint64_t)&v93);
    double v69 = vabdd_f64(v68, v34);
    if (v69 >= 1.00000001e-10 && v68 >= v34)
    {
      int v36 = 0;
      double v37 = v37 * 10.0;
      int v72 = v79;
      goto LABEL_50;
    }
    double v71 = v68;
    memcpy(__src, __dst, sizeof(__src));
    long long v96 = v93;
    long long v97 = v94;
    long long v98 = v95;
    long long v81 = v99;
    long long v82 = v100;
    int v36 = v78;
    int v72 = v79;
    if (v69 < 1.00000001e-10) {
      int v36 = v78 + 1;
    }
    long long v83 = v101;
    if (v71 > 0.000000248015873 && v36 < 3)
    {
      double v37 = v37 * 0.1;
      double v34 = v71;
LABEL_50:
      int v35 = v72 + 1;
      if (v35 != 20) {
        continue;
      }
    }
    break;
  }
  for (uint64_t k = 0; k != 6; ++k)
  {
    float v74 = *((double *)&v81 + k);
    *(float *)(a3 + 4 * k) = v74;
  }
  return 0;
}

double *sub_262F217D4(double *result, double *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = 0;
  uint64_t v32 = *MEMORY[0x263EF8340];
  double v26 = *result * *result;
  double v5 = v26;
  double v27 = v5 * v5;
  double v28 = v5 * (v5 * v5);
  double v29 = v27 * v27;
  double v30 = v5 * v5 * v28;
  double v31 = v28 * v28;
  double v6 = result[100]
     - (v5 * v5 * a2[1]
      + *a2 * v5
      + a2[2] * v28
      + a2[3] * (v27 * v27)
      + a2[4] * v30
      + a2[5] * (v28 * v28));
  uint64_t v7 = 1;
  uint64_t v8 = a3;
  do
  {
    uint64_t v9 = 0;
    double v10 = *(&v26 + v4);
    do
    {
      *(double *)(v8 + 8 * v9) = v10 * *(&v26 + v9);
      ++v9;
    }
    while (v7 != v9);
    *(double *)(a4 + 8 * v4++) = v6 * v10;
    ++v7;
    v8 += 48;
  }
  while (v4 != 6);
  double v11 = v6 * v6;
  for (uint64_t i = 1; i != 100; ++i)
  {
    uint64_t v13 = 0;
    uint64_t v14 = &result[i];
    double v26 = *v14 * *v14;
    double v15 = v26;
    double v27 = v15 * v15;
    double v28 = v15 * (v15 * v15);
    double v29 = v27 * v27;
    double v30 = v15 * v15 * v28;
    double v31 = v28 * v28;
    double v16 = v14[100]
        - (v15 * v15 * a2[1]
         + *a2 * v15
         + a2[2] * v28
         + a2[3] * (v27 * v27)
         + a2[4] * v30
         + a2[5] * (v28 * v28));
    uint64_t v17 = a3;
    uint64_t v18 = 1;
    do
    {
      uint64_t v19 = 0;
      double v20 = *(&v26 + v13);
      do
      {
        *(double *)(v17 + 8 * v19) = *(double *)(v17 + 8 * v19) + v20 * *(&v26 + v19);
        ++v19;
      }
      while (v18 != v19);
      *(double *)(a4 + 8 * v13) = *(double *)(a4 + 8 * v13) + v16 * v20;
      ++v13;
      ++v18;
      v17 += 48;
    }
    while (v13 != 6);
    double v11 = v11 + v16 * v16;
  }
  float64x2_t v21 = (void *)(a3 + 8);
  uint64_t v22 = a3 + 48;
  for (uint64_t j = 1; j != 6; ++j)
  {
    uint64_t v24 = 0;
    v25 = v21;
    do
    {
      void *v25 = *(void *)(v22 + 8 * v24);
      v25 += 6;
      ++v24;
    }
    while (j != v24);
    ++v21;
    v22 += 48;
  }
  return result;
}

float32x2_t forwardDistort(unsigned int a1, unsigned int a2, float32x2_t *a3)
{
  float32x2_t v3 = vadd_f32(a3[1], a3[10]);
  float32x2_t v4 = vmla_f32(vneg_f32(v3), *a3, vcvt_f32_s32((int32x2_t)__PAIR64__(a2, a1)));
  float v5 = a3[11].f32[0] * vmlas_n_f32(COERCE_FLOAT(vmul_f32(v4, v4).i32[1]), v4.f32[0], v4.f32[0]);
  if (v5 >= 1.0)
  {
    float v7 = v5 * v5;
    float v6 = (float)((float)((float)((float)((float)((float)(a3[16].f32[0] + (float)(a3[16].f32[1] * v5))
                                               + (float)(a3[17].f32[0] * (float)(v5 * v5)))
                                       + (float)(a3[17].f32[1] * (float)(v5 * (float)(v5 * v5))))
                               + (float)(a3[18].f32[0] * (float)(v7 * v7)))
                       + (float)((float)((float)(v7 * v7) * a3[18].f32[1]) * v5))
               + (float)((float)((float)(v7 * v7) * a3[19].f32[0]) * v7))
       + (float)((float)((float)(v7 * v7) * a3[19].f32[1]) * (float)(v5 * (float)(v5 * v5)));
  }
  else
  {
    float v6 = a3[16].f32[0]
       + (float)((float)(a3[16].f32[1]
                       + (float)((float)(a3[17].f32[0]
                                       + (float)((float)(a3[17].f32[1]
                                                       + (float)((float)(a3[18].f32[0]
                                                                       + (float)((float)(a3[18].f32[1]
                                                                                       + (float)((float)(a3[19].f32[0] + (float)(a3[19].f32[1] * v5))
                                                                                               * v5))
                                                                               * v5))
                                                               * v5))
                                               * v5))
                               * v5))
               * v5);
  }
  return vdiv_f32(vmla_n_f32(v3, v4, 1.0 / (float)((float)(v6 * 0.01) + 1.0)), *a3);
}

float32x2_t inverseDistort(unsigned int a1, unsigned int a2, float32x2_t *a3)
{
  float32x2_t v3 = vadd_f32(a3[1], a3[10]);
  float32x2_t v4 = vmla_f32(vneg_f32(v3), *a3, vcvt_f32_s32((int32x2_t)__PAIR64__(a2, a1)));
  float v5 = a3[11].f32[0] * vmlas_n_f32(COERCE_FLOAT(vmul_f32(v4, v4).i32[1]), v4.f32[0], v4.f32[0]);
  if (v5 >= 1.0)
  {
    float v7 = v5 * v5;
    float v6 = (float)((float)((float)((float)((float)((float)(a3[12].f32[0] + (float)(a3[12].f32[1] * v5))
                                               + (float)(a3[13].f32[0] * (float)(v5 * v5)))
                                       + (float)(a3[13].f32[1] * (float)(v5 * (float)(v5 * v5))))
                               + (float)(a3[14].f32[0] * (float)(v7 * v7)))
                       + (float)((float)((float)(v7 * v7) * a3[14].f32[1]) * v5))
               + (float)((float)((float)(v7 * v7) * a3[15].f32[0]) * v7))
       + (float)((float)((float)(v7 * v7) * a3[15].f32[1]) * (float)(v5 * (float)(v5 * v5)));
  }
  else
  {
    float v6 = a3[12].f32[0]
       + (float)((float)(a3[12].f32[1]
                       + (float)((float)(a3[13].f32[0]
                                       + (float)((float)(a3[13].f32[1]
                                                       + (float)((float)(a3[14].f32[0]
                                                                       + (float)((float)(a3[14].f32[1]
                                                                                       + (float)((float)(a3[15].f32[0] + (float)(a3[15].f32[1] * v5))
                                                                                               * v5))
                                                                               * v5))
                                                               * v5))
                                               * v5))
                               * v5))
               * v5);
  }
  return vdiv_f32(vmla_n_f32(v3, v4, 1.0 / (float)((float)(v6 * 0.01) + 1.0)), *a3);
}

void sub_262F2744C(uint64_t a1)
{
  v2 = *(void **)(a1 + 120);
}

double rectangleC1toC0(int a1, double a2, double a3, double a4, double a5)
{
  double v6 = a2 + a4;
  double v7 = a3 + a5;
  double v8 = sub_262F27754(a1, a2, a3);
  double v9 = sub_262F27754(a1, v6, v7);
  if (v8 >= v9) {
    return v9;
  }
  else {
    return v8;
  }
}

double sub_262F27754(int a1, double result, double a3)
{
  double v3 = 1.0 - a3;
  switch(a1)
  {
    case 2:
      result = 1.0 - result;
      break;
    case 3:
      result = 1.0 - result;
      break;
    case 5:
    case 6:
      result = v3;
      break;
    case 7:
      result = 1.0 - v3;
      break;
    case 8:
      result = 1.0 - v3;
      break;
    default:
      return result;
  }
  return result;
}

double rectangleC0toC1(int a1, double a2, double a3, double a4, double a5)
{
  double v6 = a2 + a4;
  double v7 = a3 + a5;
  double v8 = sub_262F27878(a1, a2, a3);
  double v9 = sub_262F27878(a1, v6, v7);
  if (v8 >= v9) {
    return v9;
  }
  else {
    return v8;
  }
}

double sub_262F27878(int a1, double result, double a3)
{
  switch(a1)
  {
    case 2:
      result = 1.0 - result;
      break;
    case 3:
      result = 1.0 - result;
      break;
    case 5:
    case 8:
      result = a3;
      break;
    case 6:
      float v3 = a3;
      result = (float)(1.0 - v3);
      break;
    case 7:
      result = 1.0 - a3;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t utlIntToOrientation(int a1, _DWORD *a2)
{
  if (a2) {
    BOOL v2 = (a1 - 1) >= 8;
  }
  else {
    BOOL v2 = 1;
  }
  uint64_t v3 = !v2;
  if (v3 == 1) {
    *a2 = a1;
  }
  return v3;
}

uint64_t cubicRegression()
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  uint64_t v0 = MEMORY[0x270FA5388]();
  float v5 = (float *)&v54 - v4;
  uint64_t v6 = 0;
  if (v0 && v1)
  {
    unint64_t v57 = 0;
    unint64_t v58 = 0;
    unint64_t v59 = 0;
    if (v2 < 1)
    {
      float v15 = 0.0;
    }
    else
    {
      float v7 = 0.0;
      uint64_t v8 = v2;
      double v9 = (float *)v0;
      float v10 = 0.0;
      float v11 = 0.0;
      float v12 = 0.0;
      float v13 = 0.0;
      float v14 = 0.0;
      float v15 = 0.0;
      do
      {
        float v16 = *v9++;
        float v17 = v16;
        float v18 = v17 * (float)(v17 * v17);
        float v15 = v15 + 1.0;
        float v14 = v16 + v14;
        float v13 = (float)(v17 * v17) + v13;
        float v12 = v18 + v12;
        float v11 = (float)((float)(v17 * v17) * (float)(v17 * v17)) + v11;
        float v10 = (float)((float)(v17 * v17) * v18) + v10;
        float v7 = (float)(v18 * v18) + v7;
        --v8;
      }
      while (v8);
      unint64_t v57 = __PAIR64__(LODWORD(v13), LODWORD(v14));
      unint64_t v58 = __PAIR64__(LODWORD(v11), LODWORD(v12));
      unint64_t v59 = __PAIR64__(LODWORD(v7), LODWORD(v10));
    }
    uint64_t v19 = 0;
    float v56 = v15;
    double v20 = &v56;
    do
    {
      long long v21 = *(_OWORD *)v20++;
      *(_OWORD *)((char *)&v61 + v19) = v21;
      v19 += 16;
    }
    while (v19 != 64);
    float v22 = (float)(v61 * v66) - (float)(v65 * v62);
    float v23 = (float)(v61 * v67) - (float)(v65 * v63);
    float v24 = (float)(v61 * v68) - (float)(v65 * v64);
    float v25 = (float)(v62 * v67) - (float)(v66 * v63);
    float v26 = (float)(v62 * v68) - (float)(v66 * v64);
    float v27 = (float)(v63 * v68) - (float)(v67 * v64);
    float v28 = (float)(v71 * v76) - (float)(v75 * v72);
    float v29 = (float)(v70 * v76) - (float)(v74 * v72);
    float v30 = (float)(v70 * v75) - (float)(v74 * v71);
    float v31 = (float)(v69 * v76) - (float)(v73 * v72);
    float v32 = (float)(v69 * v75) - (float)(v73 * v71);
    float v33 = (float)(v69 * v74) - (float)(v73 * v70);
    if (fabsf((float)((float)((float)((float)((float)(v22 * v28) - (float)(v23 * v29)) + (float)(v24 * v30))+ (float)(v25 * v31))- (float)(v26 * v32))+ (float)(v27 * v33)) < 0.000001)
    {
      return 0;
    }
    else
    {
      uint64_t v34 = 0;
      *((float *)&v54 + 1) = (float)(v29 * (float)-v67) + (float)(v66 * v28);
      float v55 = (float)((float)((float)((float)((float)(v22 * v28) - (float)(v23 * v29)) + (float)(v24 * v30))
                          + (float)(v25 * v31))
                  - (float)(v26 * v32))
          + (float)(v27 * v33);
      v60[0] = (float)(*((float *)&v54 + 1) + (float)(v68 * v30)) * (float)(1.0 / v55);
      v60[1] = (float)((float)((float)(v63 * v29) - (float)(v62 * v28)) - (float)(v64 * v30)) * (float)(1.0 / v55);
      v60[2] = (float)((float)((float)(v26 * (float)-v75) + (float)(v74 * v27)) + (float)(v76 * v25))
             * (float)(1.0 / v55);
      v60[3] = (float)((float)((float)(v71 * v26) - (float)(v70 * v27)) - (float)(v72 * v25)) * (float)(1.0 / v55);
      v60[4] = (float)((float)((float)(v67 * v31) + (float)((float)-v65 * v28)) - (float)(v68 * v32))
             * (float)(1.0 / v55);
      v60[5] = (float)((float)((float)(v61 * v28) - (float)(v63 * v31)) + (float)(v64 * v32)) * (float)(1.0 / v55);
      v60[6] = (float)((float)((float)(v24 * v75) + (float)((float)-v73 * v27)) - (float)(v76 * v23))
             * (float)(1.0 / v55);
      v60[7] = (float)((float)((float)(v69 * v27) - (float)(v71 * v24)) + (float)(v72 * v23)) * (float)(1.0 / v55);
      v60[8] = (float)((float)((float)(v31 * (float)-v66) + (float)(v65 * v29)) + (float)(v68 * v33))
             * (float)(1.0 / v55);
      v60[9] = (float)((float)((float)(v62 * v31) - (float)(v61 * v29)) - (float)(v64 * v33)) * (float)(1.0 / v55);
      v60[10] = (float)((float)((float)(v24 * (float)-v74) + (float)(v73 * v26)) + (float)(v76 * v22))
              * (float)(1.0 / v55);
      v60[11] = (float)((float)((float)(v24 * v70) - (float)(v69 * v26)) - (float)(v72 * v22)) * (float)(1.0 / v55);
      v60[12] = (float)((float)((float)(v66 * v32) + (float)((float)-v65 * v30)) + (float)((float)-v67 * v33))
              * (float)(1.0 / v55);
      v60[13] = (float)((float)((float)(v61 * v30) - (float)(v62 * v32)) + (float)(v63 * v33)) * (float)(1.0 / v55);
      v60[14] = (float)((float)((float)(v23 * v74) + (float)((float)-v73 * v25)) + (float)((float)-v75 * v22))
              * (float)(1.0 / v55);
      v60[15] = (float)((float)((float)(v69 * v25) - (float)(v70 * v23)) + (float)(v71 * v22)) * (float)(1.0 / v55);
      int v35 = v5;
      do
      {
        if (v2 >= 1)
        {
          int v36 = &v60[4 * v34];
          float v37 = *v36;
          float v38 = v36[1];
          float v39 = v36[2];
          float v40 = v36[3];
          uint64_t v41 = v2;
          uint64_t v42 = (float *)v0;
          double v43 = v35;
          do
          {
            float v44 = *v42++;
            *v43++ = (float)((float)(v37 + (float)(v38 * v44)) + (float)(v39 * (float)(v44 * v44)))
                   + (float)(v40 * (float)(v44 * (float)(v44 * v44)));
            --v41;
          }
          while (v41);
        }
        ++v34;
        v35 += v2;
      }
      while (v34 != 4);
      for (uint64_t i = 0; i != 4; ++i)
      {
        float v46 = 0.0;
        if (v2 >= 1)
        {
          uint64_t v47 = v2;
          uint64_t v48 = v1;
          v49 = v5;
          do
          {
            float v50 = *v49++;
            float v51 = v50;
            float v52 = *v48++;
            float v46 = v46 + (float)(v51 * v52);
            --v47;
          }
          while (v47);
        }
        *(float *)(v3 + 4 * i) = v46;
        v5 += v2;
      }
      return 1;
    }
  }
  return v6;
}

void sub_262F2B658(uint64_t a1)
{
  int v2 = *(void **)(a1 + 40);
}

void sub_262F2B6B4(uint64_t a1)
{
  int v2 = *(void **)(a1 + 56);
}

void sub_262F2C3E8(uint64_t a1)
{
  id v7 = [MEMORY[0x263F13340] matrixDescriptorWithRows:216 columns:216 rowBytes:864 dataType:268435488];
  if (v7
    && (id v2 = objc_alloc(MEMORY[0x263F13318]),
        [*(id *)(*(void *)(a1 + 32) + 8) device],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = (void *)[v2 initWithDevice:v3 descriptor:v7],
        v3,
        v4))
  {
    float v5 = [*(id *)(*(void *)(a1 + 32) + 8) commandQueue];
    uint64_t v6 = [v5 commandBuffer];

    if (v6)
    {
      [*(id *)(*(void *)(a1 + 32) + 296) encodeToCommandBuffer:v6 sourceMatrix:v4 resultMatrix:v4 status:0];
      [v6 commit];
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -12786;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -12786;
  }
}

uint64_t sub_262F2E188(uint64_t a1, void *a2)
{
  uint64_t result = [a2 status];
  *(_DWORD *)(*(void *)(a1 + 32) + 8) = result;
  return result;
}

uint64_t sub_262F2E1B8(uint64_t a1, void *a2)
{
  uint64_t result = [a2 status];
  *(_DWORD *)(*(void *)(a1 + 32) + 12) = result;
  return result;
}

uint64_t sub_262F2E1E8(uint64_t a1, void *a2)
{
  uint64_t result = [a2 status];
  *(_DWORD *)(*(void *)(a1 + 32) + 16) = result;
  return result;
}

uint64_t sub_262F2E218(uint64_t a1, void *a2)
{
  uint64_t result = [a2 status];
  *(_DWORD *)(*(void *)(a1 + 32) + 20) = result;
  return result;
}

void sub_262F339D8(uint64_t a1)
{
  id v2 = *(void **)(a1 + 24);
}

void sub_262F33A24(uint64_t a1)
{
  id v2 = *(void **)(a1 + 16);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x270EE7160](dict, point);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

uint64_t FigCFDictionaryGetCGRectIfPresent()
{
  return MEMORY[0x270EE8038]();
}

uint64_t FigDebugAssert3()
{
  return MEMORY[0x270EE8178]();
}

uint64_t FigGetCFPreferenceNumberWithDefault()
{
  return MEMORY[0x270EE8248]();
}

uint64_t FigMetalDecRef()
{
  return MEMORY[0x270F12DE0]();
}

uint64_t FigSignalErrorAt()
{
  return MEMORY[0x270EE8378]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  MEMORY[0x270ED7E18]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
}

uint64_t fig_log_get_emitter()
{
  return MEMORY[0x270EE84C8]();
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x270ED9E58](__x, __y);
  return result;
}

float hypotf(float a1, float a2)
{
  MEMORY[0x270ED9E60](a1, a2);
  return result;
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

uint64_t ssyevx_NEWLAPACK()
{
  return MEMORY[0x270EDE8F0]();
}