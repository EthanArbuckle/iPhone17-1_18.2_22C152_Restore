@interface PAEKeyer
- (BOOL)addParameters;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6;
- (BOOL)isApplyTuningForRec2020;
- (BOOL)isLumaKey;
- (BOOL)isSimpleKey;
- (BOOL)pullInitialKey:(id *)a3;
- (BOOL)sampleEdge:(void *)a3 renderInfo:(id *)a4 width:(float)a5 height:(float)a6;
- (BOOL)sampleRect:(void *)a3 renderInfo:(id *)a4 width:(float)a5 height:(float)a6;
- (BOOL)use32x32Histogram;
- (HGRef<HGNode>)getKeyerNode:(HGRef<HGNode>)a3 omKeyer:(void *)a4 atTime:(id)a5;
- (PAEKeyer)initWithAPIManager:(id)a3;
- (double)autokeyAmountToHistoPercent:(double)a3;
- (id).cxx_construct;
- (id)apiManager;
- (id)getBlendOptionsAtTime:(id)a3;
- (id)properties;
- (int)getColorPrimaries;
- (int)lut2DSize;
- (void)computeModel:(BOOL)a3 atTime:(id)a4;
- (void)dealloc;
- (void)getInputWidth:(float *)a3 height:(float *)a4 renderInfo:(id *)a5;
- (void)setInitialSamples:(void *)a3;
@end

@implementation PAEKeyer

- (BOOL)sampleEdge:(void *)a3 renderInfo:(id *)a4 width:(float)a5 height:(float)a6
{
  (*(void (**)(uint64_t *__return_ptr, void *, SEL))(*(void *)a3 + 16))(&v170, a3, a2);
  (*(void (**)(uint64_t *__return_ptr, void *))(*(void *)a3 + 24))(&v169, a3);
  v11 = [[FxHostCapabilities alloc] initWithAPIManager:self->super.super._apiManager];
  if ([(FxHostCapabilities *)v11 hostIsMotion])
  {
    float v12 = *(float *)&v170;
  }
  else
  {
    float v12 = *(float *)&v169;
    float v13 = 1.0 - *((float *)&v169 + 1);
    LODWORD(v169) = v170;
    *((float *)&v169 + 1) = 1.0 - *((float *)&v170 + 1);
    *((float *)&v170 + 1) = v13;
  }
  v158 = (uint64_t *)((char *)a3 + 48);
  *((void *)a3 + 7) = *((void *)a3 + 6);
  float v14 = 0.0;
  float v15 = 0.0;
  if (v12 >= 0.0)
  {
    float v15 = 1.0;
    if (v12 <= 1.0) {
      float v15 = v12;
    }
  }
  *(float *)&uint64_t v170 = v15;
  if (*((float *)&v170 + 1) >= 0.0)
  {
    float v14 = 1.0;
    if (*((float *)&v170 + 1) <= 1.0) {
      float v14 = *((float *)&v170 + 1);
    }
  }
  *((float *)&v170 + 1) = v14;
  float v16 = 0.0;
  float v17 = 0.0;
  if (*(float *)&v169 >= 0.0)
  {
    float v17 = 1.0;
    if (*(float *)&v169 <= 1.0) {
      float v17 = *(float *)&v169;
    }
  }
  float v18 = a5 * 0.5;
  *(float *)&uint64_t v169 = v17;
  if (*((float *)&v169 + 1) >= 0.0)
  {
    float v16 = 1.0;
    if (*((float *)&v169 + 1) <= 1.0) {
      float v16 = *((float *)&v169 + 1);
    }
  }
  *((float *)&v169 + 1) = v16;
  float v19 = (float)(v15 * a5) - v18;
  float v20 = -v18;
  float v21 = -v18;
  if (v19 >= (float)-v18)
  {
    float v21 = a5 * 0.5;
    if (v19 <= v18) {
      float v21 = v19;
    }
  }
  float v22 = a6 * 0.5;
  float v23 = (float)(v17 * a5) - v18;
  float v24 = -v18;
  if (v23 >= v20)
  {
    float v24 = a5 * 0.5;
    if (v23 <= v18) {
      float v24 = (float)(v17 * a5) - v18;
    }
  }
  float v25 = (float)(v14 * a6) - v22;
  float v26 = -v22;
  float v27 = -v22;
  if (v25 >= (float)-v22)
  {
    float v27 = a6 * 0.5;
    if (v25 <= v22) {
      float v27 = v25;
    }
  }
  float v148 = v27;
  float v150 = v24;
  float v152 = v21;
  float v154 = a5;
  float v156 = a6;
  float v28 = (float)(v16 * a6) - v22;
  float v29 = -v22;
  if (v28 >= v26)
  {
    float v29 = a6 * 0.5;
    if (v28 <= v22) {
      float v29 = v28;
    }
  }
  float v146 = v29;
  v30 = (float *)*((void *)a3 + 3);
  float v31 = *v30;
  float v32 = v30[1];
  float v34 = v30[2];
  float v33 = v30[3];
  if ([(FxHostCapabilities *)v11 hostIsMotion])
  {
    float v35 = v34;
    float v34 = v31;
    float v31 = v35;
    float v36 = v33;
  }
  else
  {
    float v36 = 1.0 - v32;
    float v32 = 1.0 - v33;
  }
  float v37 = (float)(v34 * v154) - v18;
  if (v37 <= v18) {
    float v38 = (float)(v34 * v154) - v18;
  }
  else {
    float v38 = v18;
  }
  if (v37 >= v20) {
    float v39 = v38;
  }
  else {
    float v39 = -v18;
  }
  float v40 = rintf(v39);
  float v41 = (float)(v31 * v154) - v18;
  if (v41 <= v18) {
    float v42 = (float)(v31 * v154) - v18;
  }
  else {
    float v42 = v18;
  }
  if (v41 >= v20) {
    float v43 = v42;
  }
  else {
    float v43 = -v18;
  }
  float v44 = rintf(v43);
  float v45 = (float)(v32 * v156) - v22;
  if (v45 <= v22) {
    float v46 = (float)(v32 * v156) - v22;
  }
  else {
    float v46 = v22;
  }
  if (v45 >= v26) {
    float v47 = v46;
  }
  else {
    float v47 = -v22;
  }
  float v48 = (float)(v36 * v156) - v22;
  if (v48 >= v26)
  {
    float v26 = v22;
    if (v48 <= v22) {
      float v26 = (float)(v36 * v156) - v22;
    }
  }
  float v49 = rintf(v47);
  float v50 = rintf(v26);
  if (v44 < v40 || v44 == v40 && v49 > v50)
  {
    float v51 = v40;
    float v52 = v49;
  }
  else
  {
    float v51 = v44;
    float v52 = v50;
    float v44 = v40;
    float v50 = v49;
  }
  float v145 = v31;
  if (v44 == v51)
  {
    float v56 = v32;
    float v57 = v34;
    float v58 = v36;
    float v55 = 0.0;
    float v53 = 0.0;
    float v54 = 0.0;
LABEL_64:
    float v59 = 0.0;
    goto LABEL_65;
  }
  float v53 = (float)(v52 - v50) / (float)(v51 - v44);
  float v54 = 0.0;
  if (v53 == 0.0) {
    float v55 = 0.0;
  }
  else {
    float v55 = 1.0 / v53;
  }
  float v56 = v32;
  float v57 = v34;
  float v58 = v36;
  if (v53 >= 0.0) {
    goto LABEL_64;
  }
  float v59 = (float)(int)(float)(v50 - v52);
  float v54 = (float)(int)(float)(v51 - v44);
LABEL_65:
  float v60 = rintf(v152);
  float v61 = rintf(v150);
  float v62 = rintf(v148);
  float v63 = rintf(v146);
  float v64 = fabsf(v53);
  if (v44 == v51 || v64 >= 1.0)
  {
    float v60 = v60 + -3.0;
    float v61 = v61 + 3.0;
  }
  else
  {
    float v62 = v62 + -3.0;
    float v63 = v63 + 3.0;
  }
  if (vabds_f32(v62, v63) < 6.0 || vabds_f32(v60, v61) < 6.0) {
    return 0;
  }
  v168[0] = HGRectMake4i((int)v60, (int)v62, (int)v61, (int)v63);
  v168[1] = v67;
  id v167 = 0;
  long long v68 = *(_OWORD *)&a4->var2;
  long long v69 = *(_OWORD *)&a4->var4;
  v166[0] = *(_OWORD *)&a4->var0.var0;
  v166[1] = v68;
  v166[2] = v69;
  BOOL v70 = [(PAEFilterDefaultBase *)self getInputBitmap:&v167 withInfo:v166 atTime:a4->var0.var1 withROI:v168];
  BOOL v65 = v70;
  if (v70)
  {
    v147 = a4;
    BOOL v142 = v70;
    int v71 = [v167 width];
    uint64_t v72 = [v167 height];
    unint64_t v73 = [v167 dataPtr];
    uint64_t v74 = [v167 pixelFormat];
    BOOL v157 = v74 != 0;
    if (v74) {
      uint64_t v75 = 2;
    }
    else {
      uint64_t v75 = 1;
    }
    if (v74) {
      uint64_t v76 = 3;
    }
    else {
      uint64_t v76 = 2;
    }
    unint64_t v151 = (unint64_t)(int)[v167 rowBytes] >> 2;
    int v77 = v151 * v72;
    BOOL v78 = [(PAEKeyer *)self isLutExpandedForHDR];
    int v153 = v71;
    uint64_t v155 = v72;
    v143 = self;
    v144 = v11;
    if (v64 < 1.0)
    {
      BOOL v79 = v157;
      uint64_t v80 = v72;
      unsigned int v81 = v71;
      if (v71 >= 1)
      {
        uint64_t v97 = 0;
        uint64_t v149 = v81;
        do
        {
          unint64_t v98 = v73
              + 4 * (4 * v97)
              + 4 * (int)(float)((float)(v53 * (float)(int)v97) + v59) * (int)v151;
          int v99 = 6;
          do
          {
            if (v98 >= v73 && v77 > (int)((v98 - v73 + 12) >> 2))
            {
              if (v78)
              {
                float v100 = *(float *)(v98 + 4 * v79);
                if (v100 < 0.0) {
                  float v100 = 0.0;
                }
                float v101 = *(float *)(v98 + 4 * v75);
                if (v101 < 0.0) {
                  float v101 = 0.0;
                }
                float v102 = *(float *)(v98 + 4 * v76);
                if (v102 < 0.0) {
                  float v102 = 0.0;
                }
              }
              else
              {
                float v103 = *(float *)(v98 + 4 * v79);
                if (v103 <= 1.0) {
                  float v104 = *(float *)(v98 + 4 * v79);
                }
                else {
                  float v104 = 1.0;
                }
                if (v103 >= 0.0) {
                  float v100 = v104;
                }
                else {
                  float v100 = 0.0;
                }
                float v105 = *(float *)(v98 + 4 * v75);
                if (v105 <= 1.0) {
                  float v106 = *(float *)(v98 + 4 * v75);
                }
                else {
                  float v106 = 1.0;
                }
                if (v105 >= 0.0) {
                  float v101 = v106;
                }
                else {
                  float v101 = 0.0;
                }
                float v107 = *(float *)(v98 + 4 * v76);
                if (v107 <= 1.0) {
                  float v108 = *(float *)(v98 + 4 * v76);
                }
                else {
                  float v108 = 1.0;
                }
                if (v107 >= 0.0) {
                  float v102 = v108;
                }
                else {
                  float v102 = 0.0;
                }
              }
              float v163 = v100;
              float v164 = v101;
              float v165 = v102;
              v109 = (float *)*((void *)a3 + 7);
              if ((unint64_t)v109 >= *((void *)a3 + 8))
              {
                uint64_t v110 = std::vector<Vec3f>::__push_back_slow_path<Vec3f const&>(v158, &v163);
                unsigned int v81 = v153;
                uint64_t v80 = v155;
                BOOL v79 = v157;
              }
              else
              {
                float *v109 = v100;
                v109[1] = v164;
                v109[2] = v165;
                uint64_t v110 = (uint64_t)(v109 + 3);
              }
              *((void *)a3 + 7) = v110;
              v98 += 4 * (int)v151;
            }
            --v99;
          }
          while (v99);
          ++v97;
        }
        while (v97 != v149);
      }
    }
    else
    {
      BOOL v79 = v157;
      uint64_t v80 = v72;
      unsigned int v81 = v71;
      if ((int)v72 >= 1)
      {
        int v82 = 0;
        unint64_t v83 = v73;
        do
        {
          unint64_t v84 = v83 + 16 * (int)(float)((float)(v55 * (float)v82) + v54);
          int v85 = 6;
          do
          {
            if (v84 >= v73 && v77 > (int)((v84 - v73 + 12) >> 2))
            {
              if (v78)
              {
                float v86 = *(float *)(v84 + 4 * v79);
                if (v86 < 0.0) {
                  float v86 = 0.0;
                }
                float v87 = *(float *)(v84 + 4 * v75);
                if (v87 < 0.0) {
                  float v87 = 0.0;
                }
                float v88 = *(float *)(v84 + 4 * v76);
                if (v88 < 0.0) {
                  float v88 = 0.0;
                }
              }
              else
              {
                float v89 = *(float *)(v84 + 4 * v79);
                if (v89 <= 1.0) {
                  float v90 = *(float *)(v84 + 4 * v79);
                }
                else {
                  float v90 = 1.0;
                }
                if (v89 >= 0.0) {
                  float v86 = v90;
                }
                else {
                  float v86 = 0.0;
                }
                float v91 = *(float *)(v84 + 4 * v75);
                if (v91 <= 1.0) {
                  float v92 = *(float *)(v84 + 4 * v75);
                }
                else {
                  float v92 = 1.0;
                }
                if (v91 >= 0.0) {
                  float v87 = v92;
                }
                else {
                  float v87 = 0.0;
                }
                float v93 = *(float *)(v84 + 4 * v76);
                if (v93 <= 1.0) {
                  float v94 = *(float *)(v84 + 4 * v76);
                }
                else {
                  float v94 = 1.0;
                }
                if (v93 >= 0.0) {
                  float v88 = v94;
                }
                else {
                  float v88 = 0.0;
                }
              }
              float v163 = v86;
              float v164 = v87;
              float v165 = v88;
              v95 = (float *)*((void *)a3 + 7);
              if ((unint64_t)v95 >= *((void *)a3 + 8))
              {
                uint64_t v96 = std::vector<Vec3f>::__push_back_slow_path<Vec3f const&>(v158, &v163);
                unsigned int v81 = v153;
                uint64_t v80 = v155;
                BOOL v79 = v157;
              }
              else
              {
                float *v95 = v86;
                v95[1] = v164;
                v95[2] = v165;
                uint64_t v96 = (uint64_t)(v95 + 3);
              }
              *((void *)a3 + 7) = v96;
              v84 += 16;
            }
            --v85;
          }
          while (v85);
          v83 += 4 * (int)v151;
          ++v82;
        }
        while (v82 != v80);
      }
    }
    uint64_t v111 = (int)(4 * v81 - 4);
    if (v57 <= v145) {
      uint64_t v112 = 0;
    }
    else {
      uint64_t v112 = (int)(4 * v81 - 4);
    }
    if (v57 > v145) {
      uint64_t v111 = 0;
    }
    uint64_t v113 = (v80 << 32) - 0x100000000;
    if (v56 <= v58) {
      uint64_t v114 = 0;
    }
    else {
      uint64_t v114 = (v80 << 32) - 0x100000000;
    }
    uint64_t v115 = v73 + ((uint64_t)(v114 * v151) >> 30) + 4 * v112;
    float v116 = *(float *)(v115 + 4 * v75);
    float v117 = *(float *)(v115 + 4 * v76);
    float v163 = *(float *)(v115 + 4 * v79);
    float v164 = v116;
    float v165 = v117;
    if (v56 <= v58) {
      uint64_t v118 = v113;
    }
    else {
      uint64_t v118 = 0;
    }
    uint64_t v119 = v73 + ((uint64_t)(v118 * v151) >> 30) + 4 * v111;
    float v120 = *(float *)(v119 + 4 * v75);
    float v121 = *(float *)(v119 + 4 * v76);
    v162[0] = *(float *)(v119 + 4 * v79);
    v162[1] = v120;
    v162[2] = v121;
    v122 = [[PAEKeyerSetupUtil alloc] initWithAPIManager:v143->super.super._apiManager colorPrimaries:[(PAEKeyer *)v143 getColorPrimaries] atTime:v147->var0.var1];
    OMKeyer2D::getTolCenterCbCr((OMKeyer2D *)[(PAEKeyerSetupUtil *)v122 omKeyer], &v161);
    float32x2_t v123 = vmul_f32(v161, (float32x2_t)0x3F0000003F000000);

    OMColorUtil::getCbCrFromRGB(&v163, 1, v124, v125, v126, v127, v128, v129, (float *)&v161);
    OMColorUtil::getCbCrFromRGB(v162, 1, v130, v131, v132, v133, v134, v135, (float *)&v160);
    float32x2_t v136 = vsub_f32(v123, v161);
    int32x2_t v137 = (int32x2_t)vmul_f32(v136, v136);
    float32x2_t v138 = vsub_f32(v123, v160);
    int32x2_t v139 = (int32x2_t)vmul_f32(v138, v138);
    float32x2_t v159 = vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v139, v137), (float32x2_t)vzip2_s32(v139, v137)));
    BOOL v140 = [(FxHostCapabilities *)v144 hostIsMotion];
    BOOL v141 = v159.f32[0] < v159.f32[1];
    if (!v140) {
      BOOL v141 = v159.f32[0] > v159.f32[1];
    }
    *((unsigned char *)a3 + 84) = v141;

    return v142;
  }
  else
  {
    fwrite("Failed to retrieve input bitmap in Keyer \n", 0x2AuLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
  }
  return v65;
}

- (BOOL)sampleRect:(void *)a3 renderInfo:(id *)a4 width:(float)a5 height:(float)a6
{
  (*(void (**)(unint64_t *__return_ptr, void *, SEL))(*(void *)a3 + 16))(&v95, a3, a2);
  (*(void (**)(unint64_t *__return_ptr, void *))(*(void *)a3 + 24))(&v94, a3);
  float v87 = (uint64_t *)((char *)a3 + 48);
  *((void *)a3 + 7) = *((void *)a3 + 6);
  float v11 = 0.0;
  float v12 = 0.0;
  if (*(float *)&v95 >= 0.0)
  {
    float v12 = 1.0;
    if (*(float *)&v95 <= 1.0) {
      LODWORD(v12) = v95;
    }
  }
  float v13 = 1.0;
  if (*((float *)&v95 + 1) <= 1.0) {
    float v14 = *((float *)&v95 + 1);
  }
  else {
    float v14 = 1.0;
  }
  if (*((float *)&v95 + 1) >= 0.0) {
    float v15 = v14;
  }
  else {
    float v15 = 0.0;
  }
  unint64_t v95 = __PAIR64__(LODWORD(v15), LODWORD(v12));
  if (*(float *)&v94 >= 0.0)
  {
    float v11 = 1.0;
    if (*(float *)&v94 <= 1.0) {
      LODWORD(v11) = v94;
    }
  }
  BOOL v16 = 0;
  if (*((float *)&v94 + 1) <= 1.0) {
    float v13 = *((float *)&v94 + 1);
  }
  if (*((float *)&v94 + 1) >= 0.0) {
    float v17 = v13;
  }
  else {
    float v17 = 0.0;
  }
  unint64_t v94 = __PAIR64__(LODWORD(v17), LODWORD(v11));
  if ((float)(v11 - v12) != 0.0 && (float)(v17 - v15) != 0.0)
  {
    float v18 = a5 * 0.5;
    float v19 = a6 * 0.5;
    float v20 = (float)(v12 * a5) - (float)(a5 * 0.5);
    float v21 = -(float)(a5 * 0.5);
    if (v20 <= (float)(a5 * 0.5)) {
      float v22 = v20;
    }
    else {
      float v22 = a5 * 0.5;
    }
    if (v20 >= v21) {
      float v23 = v22;
    }
    else {
      float v23 = -(float)(a5 * 0.5);
    }
    float v24 = rintf(v23);
    float v25 = (float)(v11 * a5) - v18;
    if (v25 <= v18) {
      float v26 = v25;
    }
    else {
      float v26 = a5 * 0.5;
    }
    if (v25 >= v21) {
      float v27 = v26;
    }
    else {
      float v27 = -(float)(a5 * 0.5);
    }
    float v28 = rintf(v27);
    float v29 = (float)(v15 * a6) - v19;
    float v30 = -v19;
    if (v29 <= v19) {
      float v31 = (float)(v15 * a6) - v19;
    }
    else {
      float v31 = a6 * 0.5;
    }
    if (v29 >= v30) {
      float v32 = v31;
    }
    else {
      float v32 = -v19;
    }
    float v33 = rintf(v32);
    float v34 = (float)(v17 * a6) - v19;
    if (v34 <= v19) {
      float v35 = (float)(v17 * a6) - v19;
    }
    else {
      float v35 = a6 * 0.5;
    }
    if (v34 >= v30) {
      float v30 = v35;
    }
    float v36 = rintf(v30);
    float v37 = v24 + 1.0;
    if (v28 != v24) {
      float v37 = v28;
    }
    float v38 = v18 + -1.0;
    if (v24 == v18 && v28 == v18) {
      float v37 = v28;
    }
    else {
      float v38 = v24;
    }
    if (v33 == v19 && v36 == v19)
    {
      float v33 = v19 + -1.0;
    }
    else if (v36 == v33)
    {
      float v36 = v33 + 1.0;
    }
    if (vabds_f32(v33, v36) >= 6.0 && vabds_f32(v38, v37) >= 6.0)
    {
      v93[0] = HGRectMake4i((int)v38, (int)v33, (int)v37, (int)v36);
      v93[1] = v41;
      id v92 = 0;
      long long v42 = *(_OWORD *)&a4->var2;
      long long v43 = *(_OWORD *)&a4->var4;
      v91[0] = *(_OWORD *)&a4->var0.var0;
      v91[1] = v42;
      v91[2] = v43;
      BOOL v16 = [(PAEFilterDefaultBase *)self getInputBitmap:&v92 withInfo:v91 atTime:a4->var0.var1 withROI:v93];
      if (v16)
      {
        uint64_t v44 = [v92 dataPtr];
        uint64_t v45 = [v92 pixelFormat];
        BOOL v46 = v45 != 0;
        if (v45) {
          uint64_t v47 = 2;
        }
        else {
          uint64_t v47 = 1;
        }
        if (v45) {
          uint64_t v48 = 3;
        }
        else {
          uint64_t v48 = 2;
        }
        unint64_t v49 = [v92 width];
        unint64_t v50 = [v92 height];
        BOOL v51 = [(PAEKeyer *)self isLutExpandedForHDR];
        unint64_t v86 = v50;
        BOOL v81 = v16;
        if ([(PAEKeyer *)self isSimpleKey])
        {
          if (v50)
          {
            uint64_t v52 = 0;
            float v53 = (float)v50 * 0.5;
            uint64_t v54 = 4 * v46;
            uint64_t v82 = 4 * v48;
            uint64_t v84 = 4 * v47;
            do
            {
              if (v49)
              {
                uint64_t v55 = 0;
                float v56 = (float *)(v44 + v54);
                float v57 = (float *)(v44 + v84);
                float v58 = (float *)(v44 + v82);
                do
                {
                  if (sqrtf((float)((float)((float)((float)(int)v52 * 0.5) - v53)* (float)((float)((float)(int)v52 * 0.5) - v53))+ (float)((float)((float)((float)(int)v55 * 0.5) - (float)((float)v49 * 0.5))* (float)((float)((float)(int)v55 * 0.5) - (float)((float)v49 * 0.5)))) < (float)((float)v49 * 0.5))
                  {
                    if (v51)
                    {
                      float v59 = *v56;
                      if (*v56 < 0.0) {
                        float v59 = 0.0;
                      }
                      float v60 = *v57;
                      if (*v57 < 0.0) {
                        float v60 = 0.0;
                      }
                      float v61 = *v58;
                      if (*v58 < 0.0) {
                        float v61 = 0.0;
                      }
                    }
                    else
                    {
                      if (*v56 <= 1.0) {
                        float v62 = *v56;
                      }
                      else {
                        float v62 = 1.0;
                      }
                      if (*v56 >= 0.0) {
                        float v59 = v62;
                      }
                      else {
                        float v59 = 0.0;
                      }
                      if (*v57 <= 1.0) {
                        float v63 = *v57;
                      }
                      else {
                        float v63 = 1.0;
                      }
                      if (*v57 >= 0.0) {
                        float v60 = v63;
                      }
                      else {
                        float v60 = 0.0;
                      }
                      if (*v58 <= 1.0) {
                        float v64 = *v58;
                      }
                      else {
                        float v64 = 1.0;
                      }
                      if (*v58 >= 0.0) {
                        float v61 = v64;
                      }
                      else {
                        float v61 = 0.0;
                      }
                    }
                    float v88 = v59;
                    float v89 = v60;
                    float v90 = v61;
                    BOOL v65 = (float *)*((void *)a3 + 7);
                    if ((unint64_t)v65 >= *((void *)a3 + 8))
                    {
                      uint64_t v66 = std::vector<Vec3f>::__push_back_slow_path<Vec3f const&>(v87, &v88);
                    }
                    else
                    {
                      *BOOL v65 = v59;
                      v65[1] = v89;
                      v65[2] = v90;
                      uint64_t v66 = (uint64_t)(v65 + 3);
                    }
                    *((void *)a3 + 7) = v66;
                  }
                  ++v55;
                  v56 += 4;
                  v57 += 4;
                  v58 += 4;
                }
                while (v49 != v55);
              }
              v44 += [v92 rowBytes] & 0xFFFFFFFFFFFFFFFCLL;
              ++v52;
            }
            while (v52 != v86);
          }
        }
        else if (v50)
        {
          uint64_t v67 = 0;
          uint64_t v83 = 4 * v47;
          uint64_t v85 = 4 * v46;
          uint64_t v68 = 4 * v48;
          do
          {
            if (v49)
            {
              long long v69 = (float *)(v44 + v85);
              BOOL v70 = (float *)(v44 + v83);
              int v71 = (float *)(v44 + v68);
              unint64_t v72 = v49;
              do
              {
                if (v51)
                {
                  float v73 = *v69;
                  if (*v69 < 0.0) {
                    float v73 = 0.0;
                  }
                  float v74 = *v70;
                  if (*v70 < 0.0) {
                    float v74 = 0.0;
                  }
                  float v75 = *v71;
                  if (*v71 < 0.0) {
                    float v75 = 0.0;
                  }
                }
                else
                {
                  if (*v69 <= 1.0) {
                    float v76 = *v69;
                  }
                  else {
                    float v76 = 1.0;
                  }
                  if (*v69 >= 0.0) {
                    float v73 = v76;
                  }
                  else {
                    float v73 = 0.0;
                  }
                  if (*v70 <= 1.0) {
                    float v77 = *v70;
                  }
                  else {
                    float v77 = 1.0;
                  }
                  if (*v70 >= 0.0) {
                    float v74 = v77;
                  }
                  else {
                    float v74 = 0.0;
                  }
                  if (*v71 <= 1.0) {
                    float v78 = *v71;
                  }
                  else {
                    float v78 = 1.0;
                  }
                  if (*v71 >= 0.0) {
                    float v75 = v78;
                  }
                  else {
                    float v75 = 0.0;
                  }
                }
                float v88 = v73;
                float v89 = v74;
                float v90 = v75;
                BOOL v79 = (float *)*((void *)a3 + 7);
                if ((unint64_t)v79 >= *((void *)a3 + 8))
                {
                  uint64_t v80 = std::vector<Vec3f>::__push_back_slow_path<Vec3f const&>(v87, &v88);
                }
                else
                {
                  *BOOL v79 = v73;
                  v79[1] = v89;
                  v79[2] = v90;
                  uint64_t v80 = (uint64_t)(v79 + 3);
                }
                *((void *)a3 + 7) = v80;
                v69 += 4;
                v70 += 4;
                v71 += 4;
                --v72;
              }
              while (v72);
            }
            v44 += [v92 rowBytes] & 0xFFFFFFFFFFFFFFFCLL;
            ++v67;
          }
          while (v67 != v86);
        }

        return v81;
      }
      else
      {
        fwrite("Failed to retrieve input bitmap in Keyer \n", 0x2AuLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
      }
    }
    else
    {
      return 0;
    }
  }
  return v16;
}

- (void)setInitialSamples:(void *)a3
{
  v10 = [[PAEKeyerAutokeySetupUtil alloc] initWithAPIManager:self->super.super._apiManager];
  uint64_t v6 = *((void *)a3 + 6);
  v5 = (char *)a3 + 48;
  *((void *)v5 + 1) = v6;
  if ([(PAEKeyer *)self use32x32Histogram]) {
    float v7 = 0.015625;
  }
  else {
    float v7 = 0.0078125;
  }
  [(PAEKeyerAutokeySetupUtil *)v10 getHistogramScale];
  *(float *)&double v9 = v7 * v8;
  +[PAEKeyerInitialize setInitialSamples:v5 autokeySetupUtil:v10 sampleBoxHalfDim:v9];
}

- (void)getInputWidth:(float *)a3 height:(float *)a4 renderInfo:(id *)a5
{
  id v21 = 0;
  long long v8 = *(_OWORD *)&a5->var2;
  long long v9 = *(_OWORD *)&a5->var4;
  v20[0] = *(_OWORD *)&a5->var0.var0;
  v20[1] = v8;
  v20[2] = v9;
  [(PAESharedDefaultBase *)self getHeliumImage:&v21 source:1 withInfo:v20 atTime:a5->var0.var1];
  *a3 = (float)(unint64_t)[v21 width];
  *a4 = (float)(unint64_t)[v21 height];
  v10 = [[FxHostCapabilities alloc] initWithAPIManager:self->super.super._apiManager];
  if (!-[FxHostCapabilities hostIsMotion](v10, "hostIsMotion") && [v21 fieldOrder])
  {
    float v11 = (void *)[v21 inversePixelTransform];
    double v12 = *a3;
    double v13 = *a4;
    objc_msgSend(v11, "transform2DPoint:", 0.0, 0.0);
    double v15 = v14;
    double v17 = v16;
    objc_msgSend(v11, "transform2DPoint:", v12, v13);
    *(float *)&double v18 = v18 - v15;
    *a3 = fabsf(*(float *)&v18);
    *(float *)&double v18 = v19 - v17;
    *a4 = fabsf(*(float *)&v18);
  }
}

- (void)computeModel:(BOOL)a3 atTime:(id)a4
{
  BOOL v5 = a3;
  double v18 = [[PAEKeyerSetupUtil alloc] initWithAPIManager:self->super.super._apiManager colorPrimaries:[(PAEKeyer *)self getColorPrimaries] atTime:a4.var1];
  float v7 = [(PAEKeyerSetupUtil *)v18 omKeyer];
  if ([(PAEKeyer *)self isSimpleKey]) {
    [(PAEKeyerSetupUtil *)v18 simpleKeyAmount];
  }
  else {
    [(PAEKeyerSetupUtil *)v18 autoAdjustSoftGap];
  }
  float v9 = v8;
  int v10 = [(PAEKeyerSetupUtil *)v18 tight];
  omSamples = (OMSamples *)self->_omSamples;
  [(PAEKeyerSetupUtil *)v18 shadowsGain];
  float v13 = v12;
  [(PAEKeyerSetupUtil *)v18 highlightsGain];
  float v15 = v14;
  [(PAEKeyerSetupUtil *)v18 spreadGain];
  float v17 = v16;
  OMKeyer2D::computeModel(v7, v5, v9, v10, omSamples, v13, v15, v17, [(PAEKeyer *)self isLumaKey], [(PAEKeyer *)self isSimpleKey]);
  [(PAEKeyerSetupUtil *)v18 syncWithDB:a4.var1 setAsDefault:0];
}

- (PAEKeyer)initWithAPIManager:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PAEKeyer;
  v3 = [(PAESharedDefaultBase *)&v7 initWithAPIManager:a3];
  v4 = [[FxHostCapabilities alloc] initWithAPIManager:v3->super.super._apiManager];
  if (v4) {
    v3->_isMotion = [(FxHostCapabilities *)v4 hostIsMotion];
  }
  v3->_toggledAdvancedMode = 0;
  v3->_matteTools = objc_alloc_init(PAEKeyerMatteTools);
  BOOL v5 = objc_alloc_init(PAEKeyerPreprocess);
  v3->_preprocessTools = v5;
  v5->_apiManager = v3->super.super._apiManager;
  [(PAEKeyerPreprocess *)v3->_preprocessTools setKeyer:v3];
  operator new();
}

- (id)properties
{
  unsigned int v2 = objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1F121E208), "versionAtCreation");
  uint64_t v3 = 1;
  if (v2 > 6) {
    uint64_t v3 = 2;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *(void *)"";
  block[2] = __22__PAEKeyer_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v3;
  if (-[PAEKeyer properties]::once != -1) {
    dispatch_once(&-[PAEKeyer properties]::once, block);
  }
  return (id)-[PAEKeyer properties]::sPropertiesDict;
}

uint64_t __22__PAEKeyer_properties__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithBool:1];
  uint64_t v6 = [NSNumber numberWithInt:2];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:65792];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:590080];
  uint64_t result = objc_msgSend(v2, "initWithObjectsAndKeys:", v3, @"PositionIndependent", v4, @"SupportsLargeRenderScale", v5, @"SupportsHeliumRendering", v6, @"DesiredProcessingColorInfo", v7, @"SDRWorkingSpace", v8, @"HDRWorkingSpace", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", *(void *)(a1 + 32)), @"AutoColorProcessingSupport", 0);
  -[PAEKeyer properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)isApplyTuningForRec2020
{
  uint64_t v3 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  return [(PAEKeyer *)self getColorPrimaries] == 1
      && [v3 versionAtCreation] > 6;
}

- (int)getColorPrimaries
{
  if (objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1F121E208), "versionAtCreation") < 4|| (uint64_t v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1F12189D0)) == 0|| (v4 = objc_msgSend(v3, "colorPrimaries"), v4 != 1))
  {
    LODWORD(v4) = 0;
  }
  return v4;
}

- (BOOL)addParameters
{
  v45.receiver = self;
  v45.super_class = (Class)PAEKeyer;
  [(PAESharedDefaultBase *)&v45 addParameters];
  MainBundle = CFBundleGetMainBundle();
  if (MainBundle
    && (CFStringRef Identifier = CFBundleGetIdentifier(MainBundle)) != 0
    && ((CFStringRef v5 = Identifier, CFEqual(Identifier, @"com.apple.FinalCut"))
     || CFEqual(v5, @"com.apple.FinalCutTrial")))
  {
    int v6 = 2 * self->_isMotion;
  }
  else
  {
    int v6 = 0;
  }
  uint64_t v7 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  uint64_t v8 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121B330];
  float v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v9) {
    unsigned int v10 = [v9 versionAtCreation];
  }
  else {
    unsigned int v10 = 3;
  }
  if (v7) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    return 1;
  }
  long long v42 = (void *)v8;
  float v13 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v14 = [(PAEKeyer *)self isLumaKey];
  BOOL v15 = [(PAEKeyer *)self isSimpleKey];
  BOOL v17 = self->_isMotion || v10 > 1;
  int v18 = !v15;
  if (v14) {
    int v19 = 2;
  }
  else {
    int v19 = 0;
  }
  if (v15) {
    uint64_t v20 = 2;
  }
  else {
    uint64_t v20 = 0;
  }
  int v43 = v17 & v18;
  if ((v17 & v18) != 0) {
    int v21 = 0;
  }
  else {
    int v21 = 2;
  }
  unsigned int v44 = v21;
  LODWORD(v39) = 563;
  objc_msgSend(v7, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::OSCState", 0, 0), 35, 0, 0, 2, 0, 0x100000001, v39);
  objc_msgSend(v7, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::DefaultSoftness", @"DefaultSoftness", 0), 1, 546, 9.0, 0.0, 20.0, 0.0, 20.0, 0.1);
  if (v14)
  {
    objc_msgSend(v7, "addCustomParameterWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::LumaWidget", @"Luma", 0), 5, objc_alloc_init(PAEKeyerLumaSetup), 576);
    objc_msgSend(v7, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::MatteInvert", @"Invert", 0), 50, 0, 545);
    objc_msgSend(v7, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::LumaRolloff", @"Luma Rolloff", 0), 14, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.001);
  }
  objc_msgSend(v7, "addCustomParameterWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::Selection", @"Define Mask", 0), 19, &stru_1F119C770, v20 | v19 | 0x251);
  if ([(PAEKeyer *)self isSimpleKey])
  {
    uint64_t v22 = v6 | v19 | 0x201u;
    float v23 = @"Softness";
    double v24 = 0.00001;
    double v25 = 0.5;
    double v26 = 2.0;
    double v27 = 1.0;
    float v28 = v7;
    double v29 = 0.00001;
  }
  else
  {
    float v23 = (__CFString *)[v13 localizedStringForKey:@"Keyer::Strength" value:@"Strength" table:0];
    uint64_t v22 = v6 | v19 | 0x201u;
    double v25 = 1.0;
    double v24 = 0.0;
    double v26 = 2.0;
    double v29 = 0.0;
    double v27 = 1.0;
    float v28 = v7;
  }
  [v28 addPercentSliderWithName:v23 parmId:36 defaultValue:v22 parameterMin:v25 parameterMax:v24 sliderMin:v26 sliderMax:v29 delta:v27 parmFlags:0.001];
  LODWORD(v40) = 547;
  objc_msgSend(v7, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::ViewChannel", 0, 0), 27, 0, 0, 4, 0, 0x100000004, v40);
  objc_msgSend(v7, "addCustomParameterWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::NavigateCtrl", @"Navigate", 0), 37, &stru_1F119C770, v20 | v19 | 0x251);
  objc_msgSend(v7, "addCustomParameterWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::ViewChannelCtrl", @"View", 0), 34, &stru_1F119C770, v20 | 0x271);
  BOOL v41 = v14
     || [(PAEKeyerMatteTools *)self->_matteTools addParametersWithParamAPI:v7 hideSimpleViewParam:v20 isLumaKey:0];
  objc_msgSend(v7, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::Spill Level", @"Spill Level", 0), 20, v20 | v19, 0.46, 0.0, 1.0, 0.0, 1.0, 0.001);
  if (!v14) {
    objc_msgSend(v7, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::MatteInvert", @"Invert", 0), 50, 0, v20 | 0x201);
  }
  objc_msgSend(v7, "addCustomParameterWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::Autokey", 0, 0), 4, objc_alloc_init(PAEKeyerAutokeySetup), 34);
  if (!(v43 ^ 1 | v14)) {
    objc_msgSend(v7, "startParameterSubGroup:parmId:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::Advanced", @"Advanced", 0), 18, 8);
  }
  uint64_t v30 = [v13 localizedStringForKey:@"Keyer::EditMode" value:@"Graph" table:0];
  int v31 = v44 | v19;
  uint64_t v32 = v31 | v20;
  objc_msgSend(v7, "addCustomParameterWithName:parmId:defaultValue:parmFlags:", v30, 45, objc_msgSend(NSNumber, "numberWithInt:", v14), v32 | 0x261);
  objc_msgSend(v7, "addCustomParameterWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::ChromaWidget", @"Chroma", 0), 6, objc_alloc_init(PAEKeyerCbCrSetup), v32 | 0x260);
  if (!v14) {
    objc_msgSend(v7, "addCustomParameterWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::LumaWidget", @"Luma", 0), 5, objc_alloc_init(PAEKeyerLumaSetup), v44 | 0x260);
  }
  objc_msgSend(v7, "addCustomParameterWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::Histogram", @"Histogram", 0), 9, objc_alloc_init(PAEKeyerHistogram), 66);
  int v33 = v31 | 0x20;
  objc_msgSend(v7, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::ChromaRolloff", @"Chroma Rolloff", 0), 16, v31 | 0x20u, 0.1, 0.0, 1.0, 0.0, 1.0, 0.001);
  objc_msgSend(v7, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::ChromaErode", @"Chroma Erode", 0), 17, 34, 0.0, -0.5, 0.5, -0.25, 0.25, 0.02);
  if (!v14) {
    objc_msgSend(v7, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::LumaRolloff", @"Luma Rolloff", 0), 14, v44 | 0x120, 0.1, 0.0, 1.0, 0.0, 1.0, 0.001);
  }
  [(PAEKeyerPreprocess *)self->_preprocessTools addAdvancedParametersWithParamAPI:v7 paramFlags:v31 | v20];
  if (!(v43 ^ 1 | v14)) {
    [v7 endParameterSubGroup];
  }
  if (v43) {
    objc_msgSend(v7, "startParameterSubGroup:parmId:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::MatteTools", @"Matte Tools", 0), 47, 40);
  }
  if (v14) {
    BOOL v41 = [(PAEKeyerMatteTools *)self->_matteTools addParametersWithParamAPI:v7 hideSimpleViewParam:0 isLumaKey:1];
  }
  [(PAEKeyerMatteTools *)self->_matteTools addLevelsParametersWithParamAPI:v42 hideSimpleViewParam:v44];
  [(PAEKeyerMatteTools *)self->_matteTools addAdvancedParametersWithParamAPI:v7 hideSimpleViewParam:v44];
  if (v43) {
    [v7 endParameterSubGroup];
  }
  objc_msgSend(v7, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::MinGreen", @"MinGreen", 0), 38, 547, -3.0, -10.0, 10.0, -10.0, 10.0, 0.1);
  objc_msgSend(v7, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::MaxGreen", @"MaxGreen", 0), 39, 547, -1.7, -10.0, 10.0, -10.0, 10.0, 0.1);
  objc_msgSend(v7, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::GreenChroma", @"GreenChroma", 0), 40, 547, 0.09, -10.0, 10.0, -10.0, 10.0, 0.1);
  objc_msgSend(v7, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::MinBlue", @"MinBlue", 0), 41, 547, -1.25, -10.0, 10.0, -10.0, 10.0, 0.1);
  objc_msgSend(v7, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::MaxBlue", @"MaxBlue", 0), 42, 547, 0.125, -10.0, 10.0, -10.0, 10.0, 0.1);
  objc_msgSend(v7, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::BlueChroma", @"BlueChroma", 0), 43, 547, 0.09, -10.0, 10.0, -10.0, 10.0, 0.1);
  objc_msgSend(v7, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::AddTolerance", @"Add Tolerance", 0), 11, 0, 563);
  objc_msgSend(v7, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::DefineEdge", @"Define Edge", 0), 12, 0, 563);
  if (v14 | v43 ^ 1u)
  {
    objc_msgSend(v42, "addLevelsWithName:parmId:hideGamma:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::SpillLevels", @"Spill Levels", 0), 26, 1, v32);
    objc_msgSend(v7, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::SubClr", @"Sub Clr", 0), 23, v33 | v20, 0.04, 0.0, 1.0, 0.0, 1.0, 0.001);
    objc_msgSend(v7, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::LateralSat", @"Lateral Sat", 0), 24, v33 | v20, 0.75, 0.0, 1.0, 0.0, 1.0, 0.001);
    if ((v43 & 1) == 0) {
      goto LABEL_60;
    }
    goto LABEL_59;
  }
  objc_msgSend(v7, "startParameterSubGroup:parmId:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::SpillSuppression", @"Spill Suppression", 0), 28, 8);
  objc_msgSend(v42, "addLevelsWithName:parmId:hideGamma:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::SpillLevels", @"Spill Levels", 0), 26, 1, v32);
  objc_msgSend(v7, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::SubClr", @"Sub Clr", 0), 23, v33 | v20, 0.04, 0.0, 1.0, 0.0, 1.0, 0.001);
  objc_msgSend(v7, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::LateralSat", @"Lateral Sat", 0), 24, v33 | v20, 0.75, 0.0, 1.0, 0.0, 1.0, 0.001);
  [v7 endParameterSubGroup];
  if (v43) {
LABEL_59:
  }
    objc_msgSend(v7, "startParameterSubGroup:parmId:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::LightWrap", @"Light Wrap", 0), 33, 8);
LABEL_60:
  uint64_t v34 = v44 | 0x20;
  objc_msgSend(v7, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::LightWrapAmount", @"Amount", 0), 29, v34, 0.0, 0.0, 200.0, 0.0, 50.0, 1.0);
  objc_msgSend(v7, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::LightWrapIntensity", @"Intensity", 0), 30, v34, 1.0, 0.00100000005, 2.0, 0.00100000005, 1.0, 0.001);
  objc_msgSend(v7, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::LightWrapOpacity", @"Opacity", 0), 31, v34, 1.0, 0.0, 1.0, 0.0, 1.0, 0.001);
  float v35 = (PCBlend *)[v13 localizedStringForKey:@"Keyer::LightWrapMode" value:@"Mode" table:0];
  float v36 = (PCString *)PCBlend::lightWrapModeMenuString(v35);
  objc_msgSend(v7, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", v35, 32, 0, objc_msgSend((id)objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::LightWrapModes", PCString::ns_str(v36), 0), "componentsSeparatedByString:", @";"),
    v44 | 0x221);
  if (v43) {
    [v7 endParameterSubGroup];
  }
  objc_msgSend(v7, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::LumaErode", @"Luma Erode", 0), 15, 34, 0.0, -0.5, 0.5, -0.25, 0.25, 0.02);
  objc_msgSend(v7, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::computeModel", @"computeModel", 0), 13, 0, 563);
  uint64_t v37 = [v13 localizedStringForKey:@"Keyer::NoPremultiply" value:@"Preserve RGB" table:0];
  if (v14) {
    uint64_t v38 = 545;
  }
  else {
    uint64_t v38 = 547;
  }
  [v7 addToggleButtonWithName:v37 parmId:7 defaultValue:0 parmFlags:v38];
  objc_msgSend(v7, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v13, "localizedStringForKey:value:table:", @"Keyer::KeyerIsInitialized", @"KeyerIsInitialized", 0), 8, v14, 547);
  return v41;
}

- (HGRef<HGNode>)getKeyerNode:(HGRef<HGNode>)a3 omKeyer:(void *)a4 atTime:(id)a5
{
  void *v5 = 0;
  return (HGRef<HGNode>)self;
}

- (BOOL)isLumaKey
{
  return 0;
}

- (BOOL)isSimpleKey
{
  return 0;
}

- (BOOL)pullInitialKey:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return 1;
}

- (double)autokeyAmountToHistoPercent:(double)a3
{
  uint64_t v4 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (a3 <= 1.0 || [v4 versionAtCreation] > 6) {
    return a3 * 0.9;
  }
  else {
    return (a3 + -1.0) * 0.1 + 0.9;
  }
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  float v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121D130];
  uint64_t v10 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121B008];
  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    goto LABEL_106;
  }
  double v12 = (void *)v10;
  int v13 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
  if (!v13) {
    return v13;
  }
  if ([a4 imageType] != 3)
  {
LABEL_106:
    LOBYTE(v13) = 0;
    return v13;
  }
  unint64_t v14 = [a4 width];
  unint64_t v15 = [a4 height];
  BOOL v16 = [[[FxHostCapabilities alloc] initWithAPIManager:self->super.super._apiManager] upscalesFields];
  id v76 = a3;
  [a3 pixelAspect];
  float v18 = v17;
  if (a5->var2) {
    int v19 = v16;
  }
  else {
    int v19 = 1;
  }
  if (v19) {
    float v20 = 1.0;
  }
  else {
    float v20 = 2.0;
  }
  if (v19) {
    float v21 = v18;
  }
  else {
    float v21 = v18 + v18;
  }
  __int16 v22 = [a4 nclcValue];
  id v77 = a4;
  if (a4)
  {
    [a4 heliumRef];
    uint64_t v126 = v127;
    if (v127)
    {
      (*(void (**)(HgcAlphaMult *))(*(void *)v127 + 16))(v127);
      uint64_t v125 = v127;
      (*(void (**)(HgcAlphaMult *))(*(void *)v127 + 16))(v127);
      uint64_t v124 = v127;
      (*(void (**)(HgcAlphaMult *))(*(void *)v127 + 16))(v127);
      double v123 = *(double *)&v127;
      (*(void (**)(HgcAlphaMult *))(*(void *)v127 + 16))(v127);
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v126 = 0;
    uint64_t v127 = 0;
  }
  uint64_t v125 = 0;
  *(double *)&uint64_t v124 = 0.0;
  double v123 = 0.0;
LABEL_23:
  [(PAESharedDefaultBase *)self getPixelTransformForImage:a4];
  *(float *)&double v23 = (float)v14;
  *(float *)&double v24 = (float)v15;
  HIDWORD(v25) = HIDWORD(v121);
  HIDWORD(v26) = HIDWORD(v122);
  *(float *)&double v25 = v121;
  float v27 = v122;
  *(float *)&double v26 = fabsf(v27);
  preprocessTools = self->_preprocessTools;
  long long v29 = *(_OWORD *)&a5->var2;
  v120[0] = *(_OWORD *)&a5->var0.var0;
  v120[1] = v29;
  v120[2] = *(_OWORD *)&a5->var4;
  if ([(PAEKeyerPreprocess *)preprocessTools doPreprocessKeyerFootageWithParamAPI:v9 withInfo:v120 linearInput:(v22 & 0xFF00) == 2048 scaleX:&v125 scaleY:&v126 width:&v124 height:v25 fixDVResult:v26 degrainResult:v23 outputNode:v24])
  {
    unsigned __int8 v119 = 0;
    [v9 getBoolValue:&v119 fromParm:50 atFxTime:a5->var0.var1];
    uint64_t v30 = [[PAEKeyerSetupUtil alloc] initWithAPIManager:self->super.super._apiManager colorPrimaries:[(PAEKeyer *)self getColorPrimaries] atTime:a5->var0.var1];
    BOOL v31 = [(PAEKeyerSetupUtil *)v30 keyerActiveAt:a5->var0.var1];
    float v75 = v30;
    uint64_t v74 = [(PAEKeyerSetupUtil *)v30 omKeyer];
    if (v31)
    {
      uint64_t v118 = v124;
      if (*(double *)&v124 != 0.0) {
        (*(void (**)(HgcAlphaMult *))(*(void *)v124 + 16))(v124);
      }
      [(PAEKeyer *)self getKeyerNode:&v118 omKeyer:v74 atTime:a5->var0.var1];
      if (v118) {
        (*(void (**)(HgcAlphaMult *))(*(void *)v118 + 24))(v118);
      }
      double v32 = v102[0];
      if (v124 != *(HgcAlphaMult **)&v102[0])
      {
        if (*(double *)&v124 != 0.0)
        {
          (*(void (**)(HgcAlphaMult *))(*(void *)v124 + 24))(v124);
          double v32 = v102[0];
        }
        *(double *)&uint64_t v124 = v32;
        if (v32 != 0.0) {
          (*(void (**)(double))(**(void **)&v32 + 16))(COERCE_DOUBLE(*(void *)&v32));
        }
      }
      BOOL v33 = [(PAEKeyer *)self isLumaKey];
      BOOL v34 = [(PAEKeyer *)self isLumaKey];
      if (*(void *)&v102[0]) {
        (*(void (**)(void))(**(void **)&v102[0] + 24))(*(void *)&v102[0]);
      }
      int v35 = !v33;
      BOOL v36 = !v34;
    }
    else
    {
      unsigned __int8 v119 = 0;
      uint64_t v37 = v127;
      if (v124 != v127)
      {
        if (*(double *)&v124 != 0.0)
        {
          (*(void (**)(HgcAlphaMult *))(*(void *)v124 + 24))(v124);
          uint64_t v37 = v127;
        }
        uint64_t v124 = v37;
        if (v37) {
          (*(void (**)(HgcAlphaMult *))(*(void *)v37 + 16))(v37);
        }
      }
      int v35 = 0;
      BOOL v36 = 0;
    }
    matteTools = self->_matteTools;
    long long v39 = *(_OWORD *)&a5->var2;
    v117[0] = *(_OWORD *)&a5->var0.var0;
    v117[1] = v39;
    v117[2] = *(_OWORD *)&a5->var4;
    int v40 = v119;
    [(PAESharedDefaultBase *)self getBlendingGamma];
    LODWORD(v42) = v41;
    LOBYTE(v73) = 1;
    *(float *)&double v43 = v21;
    *(float *)&double v44 = v20;
    if ([(PAEKeyerMatteTools *)matteTools doMatteManipulationWithParamAPI:v9 withPrivateParamAPI:v12 withInfo:v117 pixelAspectRatio:v40 != 0 fieldHeight:v36 doInvertMatte:1 inputIsInverted:v43 fillHoles:v44 scaling:v42 blendingGamma:v73 preKeyedInputNode:&v123 outputNode:&v124])
    {
      int v116 = 0;
      [v9 getIntValue:&v116 fromParm:27 atFxTime:a5->var0.var1];
      switch(v116)
      {
        case 1:
          if (v31)
          {
            objc_super v45 = (HgcAlphaMult *)HGObject::operator new(0x1A0uLL);
            HgcAlphaMult::HgcAlphaMult(v45);
            (*(void (**)(HgcAlphaMult *, void, double))(*(void *)v45 + 120))(v45, 0, COERCE_DOUBLE(*(void *)&v123));
            (*(void (**)(HgcAlphaMult *, uint64_t, HgcAlphaMult *))(*(void *)v45 + 120))(v45, 1, v124);
            if (v124 != v45)
            {
              if (*(double *)&v124 != 0.0) {
                (*(void (**)(void))(*(void *)v124 + 24))();
              }
              uint64_t v124 = v45;
              (*(void (**)(HgcAlphaMult *))(*(void *)v45 + 16))(v45);
            }
            (*(void (**)(HgcAlphaMult *))(*(void *)v45 + 24))(v45);
          }
          BOOL v46 = (HgcCopyAlpha *)HGObject::operator new(0x1A0uLL);
          *((_OWORD *)v46 + 24) = 0u;
          *((_OWORD *)v46 + 25) = 0u;
          *((_OWORD *)v46 + 22) = 0u;
          *((_OWORD *)v46 + 23) = 0u;
          *((_OWORD *)v46 + 20) = 0u;
          *((_OWORD *)v46 + 21) = 0u;
          *((_OWORD *)v46 + 18) = 0u;
          *((_OWORD *)v46 + 19) = 0u;
          *((_OWORD *)v46 + 16) = 0u;
          *((_OWORD *)v46 + 17) = 0u;
          *((_OWORD *)v46 + 14) = 0u;
          *((_OWORD *)v46 + 15) = 0u;
          *((_OWORD *)v46 + 12) = 0u;
          *((_OWORD *)v46 + 13) = 0u;
          *((_OWORD *)v46 + 10) = 0u;
          *((_OWORD *)v46 + 11) = 0u;
          *((_OWORD *)v46 + 8) = 0u;
          *((_OWORD *)v46 + 9) = 0u;
          *((_OWORD *)v46 + 6) = 0u;
          *((_OWORD *)v46 + 7) = 0u;
          *((_OWORD *)v46 + 4) = 0u;
          *((_OWORD *)v46 + 5) = 0u;
          *((_OWORD *)v46 + 2) = 0u;
          *((_OWORD *)v46 + 3) = 0u;
          *(_OWORD *)BOOL v46 = 0u;
          *((_OWORD *)v46 + 1) = 0u;
          HgcCopyAlpha::HgcCopyAlpha(v46);
        case 2:
          double v48 = *(double *)&v124;
          unint64_t v49 = v127;
          if (v124 == v127) {
            goto LABEL_90;
          }
          if (*(double *)&v124 != 0.0)
          {
            (*(void (**)(void))(*(void *)v124 + 24))();
            unint64_t v49 = v127;
          }
          goto LABEL_63;
        case 3:
          double v48 = *(double *)&v124;
          unint64_t v49 = v126;
          if (v124 == v126) {
            goto LABEL_90;
          }
          if (*(double *)&v124 != 0.0)
          {
            (*(void (**)(void))(*(void *)v124 + 24))();
            unint64_t v49 = v126;
          }
          goto LABEL_63;
        case 4:
          double v48 = *(double *)&v124;
          unint64_t v49 = v125;
          if (v124 == v125) {
            goto LABEL_90;
          }
          if (*(double *)&v124 != 0.0)
          {
            (*(void (**)(void))(*(void *)v124 + 24))();
            unint64_t v49 = v125;
          }
LABEL_63:
          uint64_t v124 = v49;
          if (v49)
          {
            (*(void (**)(HgcAlphaMult *))(*(void *)v49 + 16))(v49);
LABEL_89:
            double v48 = *(double *)&v124;
LABEL_90:
            v102[0] = v48;
            if (v48 != 0.0) {
              (*(void (**)(double))(**(void **)&v48 + 16))(COERCE_DOUBLE(*(void *)&v48));
            }
          }
          else
          {
            v102[0] = 0.0;
          }
          [(PAESharedDefaultBase *)self crop:v102 fromImage:v77 toImage:v76];

          [v76 setHeliumRef:v102];
          if (*(void *)&v102[0]) {
            (*(void (**)(void))(**(void **)&v102[0] + 24))(*(void *)&v102[0]);
          }
          int v47 = 0;
          break;
        default:
          double v48 = v123;
          if (*(HgcAlphaMult **)&v123 == v124) {
            goto LABEL_90;
          }
          unint64_t v50 = (HgcPostKeyer *)HGObject::operator new(0x1A0uLL);
          HgcPostKeyer::HgcPostKeyer(v50);
          (*(void (**)(HgcPostKeyer *, void, HgcAlphaMult *))(*(void *)v50 + 120))(v50, 0, v124);
          (*(void (**)(HgcPostKeyer *, uint64_t, double))(*(void *)v50 + 120))(v50, 1, COERCE_DOUBLE(*(void *)&v123));
          var1 = a5->var0.var1;
          v102[0] = 0.0;
          [v9 getFloatValue:v102 fromParm:20 atFxTime:var1];
          float v52 = v102[0];
          if (v52 >= 0.1) {
            int v53 = v35;
          }
          else {
            int v53 = 0;
          }
          if (v53 == 1)
          {
            uint64_t v114 = 0x3F0000003F000000;
            int v115 = 1056964608;
            uint64_t v54 = a5->var0.var1;
            v102[0] = 0.0;
            [v9 getFloatValue:v102 fromParm:23 atFxTime:v54];
            double v55 = v102[0];
            float v56 = a5->var0.var1;
            v102[0] = 0.0;
            [v9 getFloatValue:v102 fromParm:24 atFxTime:v56];
            double v57 = v102[0];
            double v112 = 0.0;
            double v113 = 0.0;
            uint64_t v111 = 0;
            [v12 getLevelsBlack:&v113 White:&v112 Gamma:&v111 fromParm:26 atTime:a5->var0.var1];
            float v58 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
            if (v58) {
              unsigned int v59 = [v58 versionAtCreation];
            }
            else {
              unsigned int v59 = 3;
            }
            double v60 = v113;
            if (v59 <= 2) {
              float v61 = v112 + -1.0;
            }
            else {
              float v61 = 0.0;
            }
            uint64_t v62 = [(PAEKeyer *)self getColorPrimaries];
            uint64_t v63 = [(PAEKeyer *)self isApplyTuningForRec2020];
            float v64 = v57;
            float v65 = (v52 + -0.100000001) / 9.0;
            float v66 = v60;
            OMKeyer2D::getSpillSuppressTransf(v74, (uint64_t)&v114, (uint64_t)v102, (uint64_t)&v90, (uint64_t)&v78, v62, v63, v65, v66, v61, 0.0, v64);
            if (v59 < 3)
            {
              uint64_t v67 = (HgcSpillRemoval *)HGObject::operator new(0x1A0uLL);
              HgcSpillRemoval::HgcSpillRemoval(v67);
              (*(void (**)(HgcSpillRemoval *, void, float, float, float, float))(*(void *)v67 + 96))(v67, 0, v90, v91, v92, v93);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(void *)v67 + 96))(v67, 1, v94, v95, v96, v97);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(void *)v67 + 96))(v67, 2, v98, v99, v100, v101);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(void *)v67 + 96))(v67, 3, v107, v108, v109, v110);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(void *)v67 + 96))(v67, 4, v103, v104, v105, v106);
              (*(void (**)(HgcSpillRemoval *, uint64_t, double, double, double, double))(*(void *)v67 + 96))(v67, 5, 0.0, 0.0, 0.0, 0.0);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(void *)v67 + 96))(v67, 6, v78, v79, v80, v81);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(void *)v67 + 96))(v67, 7, v82, v83, v84, v85);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(void *)v67 + 96))(v67, 8, v86, v87, v88, v89);
              float v70 = v55 * 20.0;
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(void *)v67 + 96))(v67, 9, v70, v70, v70, v70);
            }
            else
            {
              uint64_t v67 = (HgcSpillRemoval *)HGObject::operator new(0x1A0uLL);
              HgcSpillRemovalDarkEdges::HgcSpillRemovalDarkEdges(v67);
              (*(void (**)(HgcSpillRemoval *, void, float, float, float, float))(*(void *)v67 + 96))(v67, 0, v90, v91, v92, v93);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(void *)v67 + 96))(v67, 1, v94, v95, v96, v97);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(void *)v67 + 96))(v67, 2, v98, v99, v100, v101);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(void *)v67 + 96))(v67, 3, v107, v108, v109, v110);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(void *)v67 + 96))(v67, 4, v103, v104, v105, v106);
              (*(void (**)(HgcSpillRemoval *, uint64_t, double, double, double, double))(*(void *)v67 + 96))(v67, 5, 0.0, 0.0, 0.0, 0.0);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(void *)v67 + 96))(v67, 6, v78, v79, v80, v81);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(void *)v67 + 96))(v67, 7, v82, v83, v84, v85);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(void *)v67 + 96))(v67, 8, v86, v87, v88, v89);
              float v68 = v55 * 20.0;
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(void *)v67 + 96))(v67, 9, v68, v68, v68, v68);
              float v69 = v112;
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(void *)v67 + 96))(v67, 10, v69, v69, v69, 1.0);
              (*(void (**)(HgcSpillRemoval *, uint64_t, float, float, float, float))(*(void *)v67 + 96))(v67, 11, 10.0, 10.0, 10.0, 10.0);
            }
            (*(void (**)(HgcSpillRemoval *, void, double))(*(void *)v67 + 120))(v67, 0, COERCE_DOUBLE(*(void *)&v123));
            (*(void (**)(HgcPostKeyer *, uint64_t, HgcSpillRemoval *))(*(void *)v50 + 120))(v50, 2, v67);
            (*(void (**)(HgcSpillRemoval *))(*(void *)v67 + 24))(v67);
          }
          else
          {
            (*(void (**)(HgcPostKeyer *, uint64_t, double))(*(void *)v50 + 120))(v50, 2, COERCE_DOUBLE(*(void *)&v123));
          }
          LOBYTE(v102[0]) = 0;
          [v9 getBoolValue:v102 fromParm:7 atFxTime:a5->var0.var1];
          v71.n128_u32[0] = 1.0;
          if (!LOBYTE(v102[0])) {
            v71.n128_f32[0] = -1.0;
          }
          (*(void (**)(HgcPostKeyer *, void, __n128, float, float, float))(*(void *)v50 + 96))(v50, 0, v71, v71.n128_f32[0], v71.n128_f32[0], v71.n128_f32[0]);
          if (v124 != v50)
          {
            if (*(double *)&v124 != 0.0) {
              (*(void (**)(void))(*(void *)v124 + 24))();
            }
            uint64_t v124 = v50;
            (*(void (**)(HgcPostKeyer *))(*(void *)v50 + 16))(v50);
          }
          (*(void (**)(HgcPostKeyer *))(*(void *)v50 + 24))(v50);
          goto LABEL_89;
      }
      goto LABEL_95;
    }
  }
  int v47 = 1;
LABEL_95:
  if (v123 != 0.0) {
    (*(void (**)(double))(**(void **)&v123 + 24))(COERCE_DOUBLE(*(void *)&v123));
  }
  if (*(double *)&v124 != 0.0) {
    (*(void (**)(HgcAlphaMult *))(*(void *)v124 + 24))(v124);
  }
  if (v125) {
    (*(void (**)(HgcAlphaMult *))(*(void *)v125 + 24))(v125);
  }
  if (v126) {
    (*(void (**)(HgcAlphaMult *))(*(void *)v126 + 24))(v126);
  }
  if (v127) {
    (*(void (**)(HgcAlphaMult *))(*(void *)v127 + 24))(v127);
  }
  if (v47) {
    goto LABEL_106;
  }
  LOBYTE(v13) = 1;
  return v13;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  *a6 = 0;
  *a5 = 0;
  long long v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  [(PAESharedDefaultBase *)self overrideFrameSetupForRenderMode:v8 hardware:a5 software:a6];
  return 1;
}

- (void)dealloc
{
  omSamples = self->_omSamples;
  if (omSamples) {
    (*(void (**)(void *, SEL))(*(void *)omSamples + 8))(omSamples, a2);
  }

  lutsBitmapLoaderCache = self->_lutsBitmapLoaderCache;
  if (lutsBitmapLoaderCache) {
    (*(void (**)(void *))(*(void *)lutsBitmapLoaderCache + 24))(lutsBitmapLoaderCache);
  }
  v5.receiver = self;
  v5.super_class = (Class)PAEKeyer;
  [(PAESharedDefaultBase *)&v5 dealloc];
}

- (id)getBlendOptionsAtTime:(id)a3
{
  objc_super v5 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A238];
  if (!v5) {
    return 0;
  }
  long long v6 = v5;
  int v19 = 0;
  [v5 getIntValue:&v19 fromParm:27 atFxTime:a3.var1];
  double v18 = 0.0;
  [v6 getFloatValue:&v18 fromParm:29 atFxTime:a3.var1];
  uint64_t v7 = 0;
  double v8 = v18 * 0.5;
  double v18 = v18 * 0.5;
  if (!v19 && v8 > 0.0)
  {
    int v17 = 0;
    [v6 getIntValue:&v17 fromParm:32 atFxTime:a3.var1];
    double v20 = 0.0;
    [v6 getFloatValue:&v20 fromParm:30 atFxTime:a3.var1];
    float v9 = v20;
    if ([(PAEKeyer *)self isWideGamutHDR]) {
      float v10 = 42.333;
    }
    else {
      float v10 = 1.0;
    }
    double v20 = 0.0;
    [v6 getFloatValue:&v20 fromParm:31 atFxTime:a3.var1];
    float v11 = v20;
    uint64_t v7 = objc_alloc_init(PCFxLightWrapOptions);
    [(PCFxBlendOptions *)v7 setBlendMode:35];
    HIDWORD(v12) = HIDWORD(v18);
    *(float *)&double v12 = v18;
    [(PCFxLightWrapOptions *)v7 setAmount:v12];
    *(float *)&double v13 = v9;
    [(PCFxLightWrapOptions *)v7 setIntensity:v13];
    *(float *)&double v14 = v10;
    [(PCFxLightWrapOptions *)v7 setIntensityScale:v14];
    *(float *)&double v15 = v11;
    [(PCFxLightWrapOptions *)v7 setOpacity:v15];
    [(PCFxLightWrapOptions *)v7 setLRBlendMode:PCBlend::lrBlendToPCBlend(v17)];
  }
  return v7;
}

- (BOOL)use32x32Histogram
{
  return 1;
}

- (int)lut2DSize
{
  if (!self->_lut2DSizeCached)
  {
    uint64_t v3 = [[PAEKeyerAutokeySetupUtil alloc] initWithAPIManager:self->super.super._apiManager];
    [(PAEKeyerAutokeySetupUtil *)v3 getHistogramScale];
    int v5 = (int)v4 << 8;
    if (v5 <= 512) {
      int v5 = 512;
    }
    self->_lut2DSize = v5;

    self->_lut2DSizeCached = 1;
  }
  return self->_lut2DSize;
}

- (id)apiManager
{
  return self->super.super._apiManager;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end