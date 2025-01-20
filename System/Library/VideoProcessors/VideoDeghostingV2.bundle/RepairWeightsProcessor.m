@interface RepairWeightsProcessor
- (RepairWeightsProcessor)init;
- (void)_temporalFilterMetaContainerAtIndex:(int64_t)a3 ofQueue:(id)a4 lookaheadBufferLen:(int)a5;
- (void)reset;
- (void)setWeightsForROIAtIndex:(int64_t)a3 ofMetaContainer:(id *)a4 ROIMotion:(float)a5;
- (void)temporalFilterBlendingWeights:(id)a3 lookaheadMetaBufs:(id)a4;
@end

@implementation RepairWeightsProcessor

- (RepairWeightsProcessor)init
{
  v6.receiver = self;
  v6.super_class = (Class)RepairWeightsProcessor;
  v2 = [(RepairWeightsProcessor *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(RepairWeightsProcessor *)v2 reset];
    v4 = v3;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }

  return v3;
}

- (void)reset
{
  v3 = +[NSMutableArray array];
  lookbackMetaBufs = self->_lookbackMetaBufs;
  self->_lookbackMetaBufs = v3;

  self->_frameIdx = 0;
}

- (void)setWeightsForROIAtIndex:(int64_t)a3 ofMetaContainer:(id *)a4 ROIMotion:(float)a5
{
  v5 = (int *)(&a4->var0 + 2 * a3);
  double v6 = fminf(fmaxf((float)(a5 + -0.5) + (float)(a5 + -0.5), 0.0), 1.0);
  double v7 = v6 * 0.04 + 0.06;
  float v8 = v7 * (fminf(fmaxf((float)((float)((float)v5[2324] * 0.015625) + -900.0) / 700.0, 0.0), 1.0) * -0.5 + 1.0);
  float v9 = fminf(fmaxf(*((float *)v5 + 1364) / v8, 0.0), 1.0);
  float v10 = v6 * 0.02 + 0.01;
  float v11 = fminf(fmaxf(*((float *)v5 + 1424) / v10, 0.0), 1.0);
  if (v11 >= v9) {
    float v9 = v11;
  }
  *((float *)v5 + 490) = v9;
  *((float *)v5 + 1184) = v9;
  float v12 = v7;
  float v13 = fminf(fmaxf(*((float *)v5 + 1964) / v12, 0.0), 1.0);
  float v14 = fminf(fmaxf(*((float *)v5 + 2024) / v10, 0.0), 1.0);
  if (v14 < v13) {
    float v14 = v13;
  }
  *((float *)v5 + 2084) = v14;
  *((float *)v5 + 2144) = v14;
  float v15 = (fminf(fmaxf((float)((float)((float)(a4->var7[a3].var5 - a4->var7[a3].var3)* (float)(a4->var7[a3].var6 - a4->var7[a3].var4))+ -900.0)/ 2700.0, 0.0), 1.0)* -0.9+ 1.0)* 0.03;
  float v16 = 1.0 - fminf(fmaxf(*((float *)v5 + 1304) / v15, 0.0), 1.0);
  *((float *)v5 + 790) = v16;
  *((float *)v5 + 1244) = v16;
}

- (void)_temporalFilterMetaContainerAtIndex:(int64_t)a3 ofQueue:(id)a4 lookaheadBufferLen:(int)a5
{
  id v7 = a4;
  v174 = v7;
  if (a5 > 0)
  {
    id v8 = [v7 objectAtIndex:a3];
    float v9 = (float *)[v8 mutableBytes];

    int64_t v157 = a3;
    if ([v174 count])
    {
      unint64_t v10 = 0;
      int64_t v11 = -a3;
      float v12 = 0.0;
      float v13 = 0.0;
      float v14 = self;
      do
      {
        id v15 = [v174 objectAtIndex:v10];
        float v16 = (float *)[v15 mutableBytes];

        float v17 = fmaxf(fabsf((float)(uint64_t)(v11 + v10)) / (float)a5, 0.0);
        if (v17 >= 1.0) {
          float v18 = 0.0;
        }
        else {
          float v18 = 1.0 - v17;
        }
        float v12 = v12 + (float)(v18 * v16[1181]);
        float v13 = v13 + v18;
        ++v10;
      }
      while ((unint64_t)[v174 count] > v10);
      float v19 = v12 / v13;
      a3 = v157;
    }
    else
    {
      float v19 = NAN;
      float v14 = self;
    }
    v9[1181] = v19;
    float v20 = 1.0 / v19;
    v9[1183] = v20;
    if (*(__int16 *)v9 < 1) {
      goto LABEL_129;
    }
    float v148 = fminf(fmaxf(v20 + -1.0, 0.0), 1.0);
    if (a5 >= 2) {
      int v21 = 2;
    }
    else {
      int v21 = a5;
    }
    if (a5 >= 5) {
      int v22 = 5;
    }
    else {
      int v22 = a5;
    }
    int64_t v23 = a5;
    float v24 = (float)a5;
    int64_t v152 = v22;
    double v147 = (double)a5;
    uint64_t v25 = 0;
    double v26 = 1.0;
    v149 = (__int16 *)v9;
    int64_t v156 = v23;
    float v158 = v24;
    int64_t v153 = v21;
    while (1)
    {
      v151 = (__int16 *)&v9[v25];
      int v27 = *((_DWORD *)v151 + 1091);
      v28 = (float32x2_t *)&v9[8 * v25];
      float32x2_t v29 = v28[8];
      float32x2_t v178 = v28[7];
      if (![v174 count])
      {
        v91 = v14;
        float v88 = 1.0;
        float32x2_t v92 = 0;
        int v33 = -1;
        float v101 = 0.0;
        float v102 = 0.0;
        float v99 = 0.0;
        float v96 = 0.0;
        float v97 = 0.0;
        float v100 = 0.0;
        float v39 = 0.0;
        float v38 = 0.0;
        float v90 = 0.0;
        float v105 = 0.0;
        float v104 = 0.0;
        int v37 = -1;
        float v98 = 0.0;
        int v36 = -1;
        int v35 = -1;
        int v103 = -1;
        int v34 = -1;
        int v106 = -1;
        int32x2_t v95 = 0;
        float v93 = 0.0;
        float v94 = 0.0;
        float v89 = 1.0;
        goto LABEL_80;
      }
      uint64_t v150 = v25;
      unint64_t v31 = 0;
      float32x2_t v32 = vmul_f32(v29, v29);
      int v33 = -1;
      float32x2_t v172 = 0;
      float v177 = 0.0;
      float v170 = 0.0;
      float v171 = 0.0;
      float v179 = 0.0;
      *(void *)&long long v30 = 0;
      long long v169 = v30;
      float v154 = 0.0;
      float v155 = 0.0;
      int v34 = -1;
      uint64_t v161 = 0xFFFFFFFFLL;
      int v35 = -1;
      int v36 = -1;
      int v37 = -1;
      int v159 = -1;
      float v165 = 0.0;
      float v160 = 0.0;
      float v180 = 0.0;
      float v181 = 0.0;
      float v38 = 0.0;
      float v39 = 0.0;
      float v40 = 0.0;
      float v41 = 0.0;
      float v42 = 0.0;
      float v43 = 0.0;
      float v44 = 0.0;
      float v45 = 0.0;
      float v163 = 0.0;
      float v164 = 0.0;
      float v167 = 0.0;
      float v168 = 0.0;
      float v166 = 0.0;
      float v162 = 0.0;
      float v176 = sqrtf(vaddv_f32(v32));
      do
      {
        if ((uint64_t)(v31 - a3) >= 0) {
          int64_t v46 = v31 - a3;
        }
        else {
          int64_t v46 = a3 - v31;
        }
        if (v46 >= v23) {
          goto LABEL_73;
        }
        float v47 = fmaxf(fabsf((float)(uint64_t)(v31 - a3)) / v158, 0.0);
        if (v47 >= 1.0) {
          v32.f32[0] = 0.0;
        }
        else {
          v32.f32[0] = 1.0 - v47;
        }
        int32x2_t v173 = (int32x2_t)v32;
        id v48 = [v174 objectAtIndex:v31];
        v49 = (__int16 *)[v48 mutableBytes];

        if (*v49 < 1)
        {
          int64_t v23 = v156;
          a3 = v157;
        }
        else
        {
          uint64_t v50 = 0;
          char v51 = 0;
          float32x2_t v175 = (float32x2_t)vdup_lane_s32(v173, 0);
          float v52 = 0.0;
          uint64_t v53 = 2968;
          uint64_t v54 = 32;
          a3 = v157;
          float v55 = 16.0;
          float32x2_t v56 = v172;
          float v58 = v170;
          float v57 = v171;
          long long v59 = v169;
          float v61 = v167;
          float v60 = v168;
          float v63 = v165;
          float v62 = v166;
          float v65 = v163;
          float v64 = v164;
          float v66 = v162;
          uint64_t v67 = v161;
          float v68 = v160;
          do
          {
            v69 = (unsigned __int16 *)&v49[v50];
            if (v27 == *(_DWORD *)&v49[v50 + 2182])
            {
              float32x2_t v70 = vsub_f32(v178, *(float32x2_t *)&v49[v54 - 4]);
              float v71 = fminf(fmaxf(sqrtf(vaddv_f32(vmul_f32(v70, v70)))/ (float)((float)((float)(v176+ sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)&v49[v54], *(float32x2_t *)&v49[v54]))))* 0.5)+ v55), 0.0), 1.0);
              if ((v51 & (v52 < v71)) == 0) {
                float v52 = v71;
              }
              float v72 = *((float *)v69 + 1364);
              float v73 = fminf(fmaxf(v72, 0.0), 0.1);
              if ((float)(*(float *)v173.i32 * v73) > v45)
              {
                float v45 = *(float *)v173.i32 * v73;
                float v39 = v73;
                int v33 = v31;
              }
              float v74 = *((float *)v69 + 1964);
              float v75 = fminf(fmaxf(v74, 0.0), 0.1);
              if ((float)(*(float *)v173.i32 * v75) > v44)
              {
                float v44 = *(float *)v173.i32 * v75;
                float v38 = v75;
                int v37 = v31;
              }
              float v76 = *((float *)v69 + 1424);
              float v77 = fminf(fmaxf(v76, 0.0), 0.03);
              BOOL v78 = (float)(*(float *)v173.i32 * v77) <= v43;
              if ((float)(*(float *)v173.i32 * v77) > v43) {
                float v43 = *(float *)v173.i32 * v77;
              }
              float v79 = v181;
              if (!v78) {
                float v79 = v77;
              }
              float v181 = v79;
              if (!v78) {
                int v36 = v31;
              }
              float v80 = *((float *)v69 + 2024);
              float v81 = fminf(fmaxf(v80, 0.0), 0.03);
              if ((float)(*(float *)v173.i32 * v81) > v42)
              {
                float v42 = *(float *)v173.i32 * v81;
                float v68 = v81;
                int v35 = v31;
              }
              float v82 = *((float *)v69 + 970);
              BOOL v83 = (float)(*(float *)v173.i32 * v82) <= v40;
              if ((float)(*(float *)v173.i32 * v82) > v40) {
                float v40 = *(float *)v173.i32 * v82;
              }
              float v84 = v180;
              if (!v83) {
                float v84 = *((float *)v69 + 970);
              }
              float v180 = v84;
              if (!v83) {
                int v34 = v31;
              }
              float v85 = *((float *)v69 + 1304);
              if ((float)(*(float *)v173.i32 * v85) <= v41)
              {
                uint64_t v67 = v67;
              }
              else
              {
                float v41 = *(float *)v173.i32 * v85;
                float v63 = *((float *)v69 + 1304);
                uint64_t v67 = v31;
              }
              if (v46 <= v153)
              {
                float32x2_t v56 = vmla_f32(v56, *(float32x2_t *)&v49[v53], v175);
                float v55 = 16.0;
                *(float *)&long long v59 = *(float *)v173.i32 + *(float *)&v59;
              }
              float v65 = v65 + (float)(*(float *)v173.i32 * v72);
              float v66 = v66 + (float)(*(float *)v173.i32 * v74);
              float v62 = v62 + (float)(*(float *)v173.i32 * v76);
              float v61 = v61 + (float)(*(float *)v173.i32 * v80);
              float v64 = v64 + (float)(*(float *)v173.i32 * v82);
              float v60 = v60 + (float)(*(float *)v173.i32 * v85);
              float v58 = v58 + (float)(*(float *)v173.i32 * (float)*((int *)v69 + 2324));
              float v57 = *(float *)v173.i32 + v57;
              if ((uint64_t)v31 < v157)
              {
                float v177 = v177 + (float)(*(float *)v173.i32 * *(float *)&v49[v50 + 3208]);
                float v179 = *(float *)v173.i32 + v179;
              }
              char v51 = 1;
            }
            v50 += 2;
            v54 += 16;
            v53 += 4;
          }
          while (2 * (unsigned __int16)*v49 != v50);
          float v160 = v68;
          uint64_t v161 = v67;
          float v162 = v66;
          float v163 = v65;
          float v164 = v64;
          float v165 = v63;
          float v166 = v62;
          float v167 = v61;
          float v168 = v60;
          long long v169 = v59;
          float v170 = v58;
          float v171 = v57;
          float32x2_t v172 = v56;
          if (((v46 <= v152) & v51) != 0)
          {
            if (v31 == v157) {
              float v52 = -0.0;
            }
            float v154 = v154 + v52;
            float v155 = v155 + 1.0;
            int64_t v23 = v156;
            goto LABEL_73;
          }
          int64_t v23 = v156;
          if (v51) {
            goto LABEL_73;
          }
        }
        int64_t v86 = v159 - a3;
        if (v86 < 0) {
          int64_t v86 = a3 - v159;
        }
        if (v46 >= (unint64_t)v86) {
          int v87 = v159;
        }
        else {
          int v87 = v31;
        }
        if (v159 == -1) {
          int v87 = v31;
        }
        int v159 = v87;
LABEL_73:
        ++v31;
      }
      while ((unint64_t)[v174 count] > v31);
      float v88 = 1.0;
      float v89 = 1.0;
      if (v155 > 1.0) {
        float v88 = fminf(fmaxf((float)((float)(v154 / (float)(v155 + -1.0)) + -0.1)+ (float)((float)(v154 / (float)(v155 + -1.0)) + -0.1), 0.0), 1.0);
      }
      float v90 = v180;
      v91 = self;
      uint64_t v25 = v150;
      float v24 = v158;
      double v26 = 1.0;
      float32x2_t v92 = v172;
      float v94 = v170;
      float v93 = v171;
      int32x2_t v95 = (int32x2_t)v169;
      float v96 = v167;
      float v97 = v168;
      float v98 = v165;
      float v99 = v166;
      float v101 = v163;
      float v100 = v164;
      float v102 = v162;
      int v103 = v161;
      float v104 = v160;
      float v105 = v181;
      if (v179 > 0.0) {
        float v88 = (float)(v177 / v179) + (float)((float)(v88 - (float)(v177 / v179)) * 0.3);
      }
      int v106 = v159;
LABEL_80:
      *((float *)v151 + 1604) = v88;
      float v107 = fmax((v26 - v88) * 2.5, 0.5) * v147;
      float v108 = fabsf((float)(v33 - a3));
      if (v33 >= a3) {
        float v109 = v24;
      }
      else {
        float v109 = v107;
      }
      float v110 = fmaxf(v108 / v109, 0.0);
      if (v110 >= v89) {
        float v111 = 0.0;
      }
      else {
        float v111 = v89 - v110;
      }
      float v112 = v39 * v111;
      float v113 = fabsf((float)(v37 - a3));
      if (v37 >= a3) {
        float v114 = v24;
      }
      else {
        float v114 = v107;
      }
      float v115 = fmaxf(v113 / v114, 0.0);
      if (v115 >= v89) {
        float v116 = 0.0;
      }
      else {
        float v116 = v89 - v115;
      }
      float v117 = v38 * v116;
      float v118 = fabsf((float)(v34 - a3));
      if (v34 >= a3) {
        float v119 = v24;
      }
      else {
        float v119 = v107;
      }
      float v120 = fmaxf(v118 / v119, 0.0);
      if (v120 >= v89) {
        float v121 = 0.0;
      }
      else {
        float v121 = v89 - v120;
      }
      float v122 = v90 * v121;
      float v123 = fabsf((float)(v36 - a3));
      if (v36 >= a3) {
        float v124 = v24;
      }
      else {
        float v124 = v107;
      }
      float v125 = fmaxf(v123 / v124, 0.0);
      if (v125 >= v89) {
        float v126 = 0.0;
      }
      else {
        float v126 = v89 - v125;
      }
      float v127 = v105 * v126;
      float v128 = fabsf((float)(v35 - a3));
      if (v35 >= a3) {
        float v129 = v24;
      }
      else {
        float v129 = v107;
      }
      float v130 = fmaxf(v128 / v129, 0.0);
      if (v130 >= v89) {
        float v131 = 0.0;
      }
      else {
        float v131 = v89 - v130;
      }
      float v132 = v104 * v131;
      float v133 = fabsf((float)(v103 - a3));
      if (v103 >= a3) {
        float v107 = v24;
      }
      float v134 = fmaxf(v133 / v107, 0.0);
      if (v134 >= v89) {
        float v135 = 0.0;
      }
      else {
        float v135 = v89 - v134;
      }
      v136 = (float *)(v151 + 1940);
      *((float *)v151 + 970) = (float)(v122 + (float)(v88 * (float)((float)(v100 / v93) - v122)))
                             + (float)((float)(v122 - (float)(v122 + (float)(v88 * (float)((float)(v100 / v93) - v122))))
                                     * 0.3);
      *((float *)v151 + 1364) = (float)(v112 + (float)(v88 * (float)((float)(v101 / v93) - v112)))
                              + (float)((float)(v112 - (float)(v112 + (float)(v88 * (float)((float)(v101 / v93) - v112))))
                                      * 0.3);
      *((float *)v151 + 1424) = (float)(v127 + (float)(v88 * (float)((float)(v99 / v93) - v127)))
                              + (float)((float)(v127 - (float)(v127 + (float)(v88 * (float)((float)(v99 / v93) - v127))))
                                      * 0.3);
      *((float *)v151 + 1304) = (float)((float)(v98 * v135)
                                      + (float)(v88 * (float)((float)(v97 / v93) - (float)(v98 * v135))))
                              + (float)((float)((float)(v98 * v135)
                                              - (float)((float)(v98 * v135)
                                                      + (float)(v88 * (float)((float)(v97 / v93) - (float)(v98 * v135)))))
                                      * 0.3);
      *((float *)v151 + 1964) = (float)(v117 + (float)(v88 * (float)((float)(v102 / v93) - v117)))
                              + (float)((float)(v117 - (float)(v117 + (float)(v88 * (float)((float)(v102 / v93) - v117))))
                                      * 0.3);
      *((float *)v151 + 2024) = (float)(v132 + (float)(v88 * (float)((float)(v96 / v93) - v132)))
                              + (float)((float)(v132 - (float)(v132 + (float)(v88 * (float)((float)(v96 / v93) - v132))))
                                      * 0.3);
      float v9 = (float *)v149;
      v137 = (float32x2_t *)&v149[4 * v25];
      double v138 = COERCE_DOUBLE(vminnm_f32(v137[742], vdiv_f32(v92, (float32x2_t)vdup_lane_s32(v95, 0))));
      *(double *)&v137[742] = v138;
      *((_DWORD *)v151 + 2324) = (int)(float)(v94 / v93);
      float v14 = v91;
      *(float *)&double v138 = v88;
      [(RepairWeightsProcessor *)v91 setWeightsForROIAtIndex:v25 ofMetaContainer:v149 ROIMotion:v138];
      if (v106 < 0)
      {
        float v141 = *v136;
        if (!v14->_frameIdx)
        {
          float v145 = 1.0 - fminf(fmaxf(v88 / 0.6, 0.0), 1.0);
          if (v141 < v145) {
            float v141 = v145;
          }
        }
      }
      else
      {
        float v139 = fmaxf(fabsf((float)(v106 - a3)) / v24, 0.0);
        float v140 = 1.0 - v139;
        if (v139 >= 1.0) {
          float v140 = 0.0;
        }
        float v141 = *v136;
        if (*v136 < v140) {
          float v141 = v140;
        }
        v142 = &v149[2 * v25];
        double v143 = v140;
        if (v26 - *((float *)v142 + 790) >= v143) {
          double v143 = v26 - *((float *)v142 + 790);
        }
        float v144 = v26 - v143;
        *((float *)v142 + 790) = v144;
      }
      if (v141 < v148) {
        float v141 = v148;
      }
      float *v136 = v141;
      *(float *)&v149[2 * v25++ + 2060] = v141;
      if (v25 >= *v149)
      {
LABEL_129:
        sub_1B254((__int16 *)v9);
        goto LABEL_130;
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();
LABEL_130:
}

- (void)temporalFilterBlendingWeights:(id)a3 lookaheadMetaBufs:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  if ([(NSMutableArray *)self->_lookbackMetaBufs count]) {
    [v8 addObjectsFromArray:self->_lookbackMetaBufs];
  }
  [v8 addObject:v13];
  if ([v7 count]) {
    [v8 addObjectsFromArray:v7];
  }
  lookbackMetaBufs = self->_lookbackMetaBufs;
  if (lookbackMetaBufs) {
    uint64_t v10 = (int)[(NSMutableArray *)lookbackMetaBufs count];
  }
  else {
    uint64_t v10 = 0;
  }
  if ((unint64_t)[v8 count] <= 1)
  {
    fig_log_get_emitter();
    uint64_t v12 = v4;
    LODWORD(v11) = 0;
    FigDebugAssert3();
  }
  else
  {
    [(RepairWeightsProcessor *)self _temporalFilterMetaContainerAtIndex:v10 ofQueue:v8 lookaheadBufferLen:15];
  }
  if ([(NSMutableArray *)self->_lookbackMetaBufs count] == (char *)&dword_C + 3) {
    [(NSMutableArray *)self->_lookbackMetaBufs removeObjectAtIndex:0];
  }
  [(NSMutableArray *)self->_lookbackMetaBufs addObject:v13];
  ++self->_frameIdx;
}

- (void).cxx_destruct
{
}

@end