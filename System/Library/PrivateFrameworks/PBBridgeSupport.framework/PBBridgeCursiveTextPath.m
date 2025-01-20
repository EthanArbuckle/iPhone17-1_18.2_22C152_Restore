@interface PBBridgeCursiveTextPath
- (CGAffineTransform)transformForRect:(SEL)a3 pointSize:(CGRect)a4 flipped:(double)a5;
- (CGPath)pathForFraction:(float)a3 calculateLength:(BOOL)a4 startFraction:(float)a5;
- (CGPath)pathForTime:(float)a3;
- (CGRect)boundingBoxOfPath;
- (PBBridgeCursiveTextPath)initWithURL:(id)a3;
- (PBBridgeCursiveTextPath)initWithURL:(id)a3 options:(id)a4;
- (float)animationDuration;
- (float)duration;
- (float)lineHeight;
- (float)scale;
@end

@implementation PBBridgeCursiveTextPath

- (PBBridgeCursiveTextPath)initWithURL:(id)a3
{
  return [(PBBridgeCursiveTextPath *)self initWithURL:a3 options:0];
}

- (PBBridgeCursiveTextPath)initWithURL:(id)a3 options:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PBBridgeCursiveTextPath;
  v8 = [(PBBridgeCursiveTextPath *)&v22 init];
  v9 = v8;
  if (!v8)
  {
LABEL_13:
    v17 = v9;
    goto LABEL_14;
  }
  *(void *)&v8->_initialWeight = 0x3F8000003F266666;
  v8->_rampTime = 0.25;
  uint64_t v10 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v6];
  if (v10)
  {
    v11 = v10;
    uint64_t v12 = [MEMORY[0x263F08AC0] propertyListWithData:v10 options:0 format:0 error:0];
    if (v12)
    {
      pathDefinition = v9->_pathDefinition;
      v9->_pathDefinition = (NSDictionary *)v12;

      v14 = [v7 objectForKeyedSubscript:@"resolution"];
      v15 = v14;
      if (v14) {
        int v16 = [v14 intValue];
      }
      else {
        int v16 = 40;
      }
      v9->_resolution = v16;
      v18 = [(PBBridgeCursiveTextPath *)v9 pathForFraction:1 calculateLength:0.0 startFraction:0.0];
      v9->_boundingBoxOfPath = CGPathGetPathBoundingBox(v18);
      CGPathRelease(v18);
      v19 = [v7 objectForKeyedSubscript:@"enableErase"];
      v20 = v19;
      if (v19) {
        LOBYTE(v19) = [v19 BOOLValue];
      }
      v9->_enableErase = (char)v19;
      v9->_duration = (float)(powf((float)(fminf(fmaxf(v9->_length / 3000.0, 0.0), 10.0) / 10.0) + -1.0, 3.0) + 1.0)
                    * 4.0;

      goto LABEL_13;
    }
  }
  else
  {
    v11 = pbb_setup_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[PBBridgeCursiveTextPath initWithURL:options:]";
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl(&dword_21C445000, v11, OS_LOG_TYPE_DEFAULT, "%s - No data loaded from URL: %@", buf, 0x16u);
    }
  }

  v17 = 0;
LABEL_14:

  return v17;
}

- (CGAffineTransform)transformForRect:(SEL)a3 pointSize:(CGRect)a4 flipped:(double)a5
{
  result = (CGAffineTransform *)self->_pathDefinition;
  if (result)
  {
    BOOL v9 = a6;
    double height = a4.size.height;
    double width = a4.size.width;
    v13 = [(CGAffineTransform *)result objectForKeyedSubscript:@"unitsPerEm", a4.origin.x, a4.origin.y];
    [v13 floatValue];
    double v15 = v14;

    int v16 = [(NSDictionary *)self->_pathDefinition objectForKeyedSubscript:@"ascender"];
    [v16 floatValue];
    double v18 = v17;

    v19 = [(NSDictionary *)self->_pathDefinition objectForKeyedSubscript:@"descender"];
    [v19 floatValue];
    double v21 = v20;

    double v22 = v18 - v21;
    double v23 = -v21 / (v18 - v21);
    double v24 = v22 / v15 * a5;
    double v25 = (height - v24) * 0.5;
    *(float *)&double v22 = v22;
    self->_lineHeight = *(float *)&v22;
    double x = self->_boundingBoxOfPath.origin.x;
    double v27 = self->_boundingBoxOfPath.size.width;
    *(_OWORD *)&retstr->a = 0u;
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tdouble x = 0u;
    CGAffineTransformMakeTranslation(retstr, -(x + v27 * 0.5), 0.0);
    if (v9) {
      double v28 = 1.0 - v23;
    }
    else {
      double v28 = v23;
    }
    double v29 = v25 + v28 * v24;
    float v30 = a5 / v15;
    self->_scale = v30;
    double v31 = -(a5 / v15);
    if (!v9) {
      double v31 = a5 / v15;
    }
    CGAffineTransformMakeScale(&t2, a5 / v15, v31);
    long long v32 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v32;
    *(_OWORD *)&t1.tdouble x = *(_OWORD *)&retstr->tx;
    CGAffineTransformConcat(&v42, &t1, &t2);
    long long v33 = *(_OWORD *)&v42.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v42.a;
    *(_OWORD *)&retstr->c = v33;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v42.tx;
    CGAffineTransformMakeTranslation(&v39, width * 0.5, v29);
    long long v34 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v34;
    *(_OWORD *)&t1.tdouble x = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformConcat(&v42, &t1, &v39);
    long long v35 = *(_OWORD *)&v42.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v42.a;
    *(_OWORD *)&retstr->c = v35;
    long long v36 = *(_OWORD *)&v42.tx;
  }
  else
  {
    uint64_t v37 = MEMORY[0x263F000D0];
    long long v38 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
    *(_OWORD *)&retstr->c = v38;
    long long v36 = *(_OWORD *)(v37 + 32);
  }
  *(_OWORD *)&retstr->tdouble x = v36;
  return result;
}

- (float)animationDuration
{
  float result = self->_duration;
  if (self->_enableErase) {
    return result + result;
  }
  return result;
}

- (float)duration
{
  return self->_duration;
}

- (CGRect)boundingBoxOfPath
{
  double x = self->_boundingBoxOfPath.origin.x;
  double y = self->_boundingBoxOfPath.origin.y;
  double width = self->_boundingBoxOfPath.size.width;
  double height = self->_boundingBoxOfPath.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (float)lineHeight
{
  return self->_lineHeight;
}

- (float)scale
{
  return self->_scale;
}

- (CGPath)pathForTime:(float)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  float duration = self->_duration;
  if (duration == 0.0)
  {
    id v7 = pbb_setup_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      uint64_t v10 = "-[PBBridgeCursiveTextPath pathForTime:]";
      _os_log_impl(&dword_21C445000, v7, OS_LOG_TYPE_DEFAULT, "%s Duration is 0", (uint8_t *)&v9, 0xCu);
    }

    *(void *)&a3 = 0;
    double v3 = 0.0;
  }
  else
  {
    float v6 = a3;
    a3 = a3 / duration;
    *(float *)&double v3 = (float)(v6 - duration) / duration;
    if (!self->_enableErase) {
      *(float *)&double v3 = 0.0;
    }
  }
  return [(PBBridgeCursiveTextPath *)self pathForFraction:0 calculateLength:*(double *)&a3 startFraction:v3];
}

- (CGPath)pathForFraction:(float)a3 calculateLength:(BOOL)a4 startFraction:(float)a5
{
  BOOL v6 = a4;
  uint64_t v171 = *MEMORY[0x263EF8340];
  float duration = self->_duration;
  if (duration == 0.0) {
    float v10 = 0.0;
  }
  else {
    float v10 = self->_rampTime / duration;
  }
  float v135 = v10;
  unint64_t v11 = 0x263EFF000uLL;
  uint64_t v12 = [MEMORY[0x263EFF980] array];
  v13 = [(NSDictionary *)self->_pathDefinition objectForKeyedSubscript:@"scale"];
  float v14 = v13;
  __asm { FMOV            V0.4S, #1.0 }
  double v130 = *(double *)&_Q0;
  if (v13 && [v13 count] == 4)
  {
    float v20 = [v14 objectAtIndexedSubscript:0];
    [v20 floatValue];
    unsigned int v131 = v21;

    double v22 = [v14 objectAtIndexedSubscript:1];
    [v22 floatValue];
    unsigned int v141 = v23;

    double v24 = [v14 objectAtIndexedSubscript:2];
    [v24 floatValue];

    double v25 = [v14 objectAtIndexedSubscript:3];
    [v25 floatValue];
    double v130 = COERCE_DOUBLE(__PAIR64__(v141, v131));
  }
  v125 = v14;
  [(NSDictionary *)self->_pathDefinition objectForKeyedSubscript:@"strokes"];
  long long v162 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v27 = [v26 countByEnumeratingWithState:&v162 objects:v170 count:16];
  v126 = v26;
  if (v27)
  {
    uint64_t v28 = v27;
    char v29 = 0;
    char v30 = 0;
    float v31 = (float)-v135 + (v135 + 1.0) * a3;
    float v32 = a5 * 1.25 + -0.25;
    uint64_t v33 = *(void *)v163;
    float v132 = (float)(a5 * -0.5) + 1.0;
    float v133 = v31;
    float v134 = v135 + v31;
    float32x4_t v142 = 0u;
    float v34 = 0.0;
    uint64_t v122 = *(void *)v163;
    v123 = v12;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v163 != v33) {
          objc_enumerationMutation(v26);
        }
        uint64_t v124 = v35;
        long long v36 = *(void **)(*((void *)&v162 + 1) + 8 * v35);
        uint64_t v37 = [*(id *)(v11 + 2432) array];
        long long v158 = 0u;
        long long v159 = 0u;
        long long v160 = 0u;
        long long v161 = 0u;
        obuint64_t j = v36;
        uint64_t v127 = [obj countByEnumeratingWithState:&v158 objects:v169 count:16];
        if (v127)
        {
          uint64_t v128 = *(void *)v159;
          uint64_t v121 = v28;
          do
          {
            for (uint64_t i = 0; i != v127; ++i)
            {
              if (*(void *)v159 != v128) {
                objc_enumerationMutation(obj);
              }
              CGAffineTransform v39 = [[BezierCurve alloc] initWithDictionary:*(void *)(*((void *)&v158 + 1) + 8 * i)];
              [(BezierCurve *)v39 scaleBy:v130];
              [(BezierCurve *)v39 p0];
              *(_OWORD *)path1c = v40;
              [(BezierCurve *)v39 p3];
              if ((vminvq_u32((uint32x4_t)vceqq_f32(*(float32x4_t *)path1c, v41)) & 0x80000000) != 0)
              {
                int resolution = 0;
                float32x4_t v43 = v142;
LABEL_21:
                int v44 = 0;
                int v45 = resolution + 1;
                float32x4_t v46 = v43;
                while (1)
                {
                  *(float32x4_t *)path1 = v46;
                  double v47 = 1.0 / (float)self->_resolution * (float)v44;
                  float v48 = v47;
                  *(float *)&double v47 = v48;
                  [(BezierCurve *)v39 pointAt:v47];
                  float32x4_t v143 = v49;
                  v49.f32[0] = v48;
                  [(BezierCurve *)v39 derivativeAt:*(double *)v49.i64];
                  *(float *)&__int32 v51 = -*(float *)v50.i32;
                  v50.i32[0] = vdup_lane_s32(v50, 1).u32[0];
                  v50.i32[1] = v51;
                  float32x2_t v52 = vmul_f32((float32x2_t)v50, (float32x2_t)v50);
                  v52.i32[0] = vadd_f32(v52, (float32x2_t)vdup_lane_s32((int32x2_t)v52, 1)).u32[0];
                  float32x2_t v53 = vrsqrte_f32((float32x2_t)v52.u32[0]);
                  float32x2_t v54 = vmul_f32(v53, vrsqrts_f32((float32x2_t)v52.u32[0], vmul_f32(v53, v53)));
                  float32x2_t v55 = vmul_n_f32((float32x2_t)v50, vmul_f32(v54, vrsqrts_f32((float32x2_t)v52.u32[0], vmul_f32(v54, v54))).f32[0]);
                  if (v30)
                  {
                    float32x4_t v56 = vsubq_f32(v143, *(float32x4_t *)path1);
                    float32x4_t v57 = vmulq_f32(v56, v56);
                    double v58 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v57, 2), vaddq_f32(v57, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v57.f32, 1))).f32[0]);
                    double v59 = 0.5;
                    if ((v29 & 1) == 0) {
                      double v59 = 1.0;
                    }
                    float v34 = v34 + v58 * v59;
                    char v29 = 0;
                  }
                  float v60 = v34 / self->_length;
                  if (v60 >= v32)
                  {
                    int8x8_t path1a = (int8x8_t)v55;
                    if (a5 <= 0.0)
                    {
                      float v63 = a5;
                      float initialWeight = self->_initialWeight;
                      float finalWeight = self->_finalWeight;
                      *(float *)&double v62 = powf((float)(1.0 - fminf(fmaxf((float)(v60 - v133) / v135, 0.0), 1.0)) + -1.0, 3.0);
                      float v66 = finalWeight - initialWeight;
                      a5 = v63;
                      *(float *)&double v62 = initialWeight + (float)((float)(*(float *)&v62 + 1.0) * v66);
                    }
                    else
                    {
                      float v61 = v132 * self->_finalWeight;
                      *(float *)&double v62 = (float)((float)(powf(fminf(fmaxf((float)(v60 - v32) * 4.0, 0.0), 1.0) + -1.0, 3.0)+ 1.0)* (float)(v61 + -0.2))+ 0.2;
                    }
                    if (!v6 && v60 > v134)
                    {
                      uint64_t v12 = v123;
                      objc_msgSend(v123, "addObject:", v37, v62);

                      id v26 = v126;
                      goto LABEL_41;
                    }
                    float v67 = vmuls_lane_f32(*(float *)&v62, v143, 3);
                    v68 = [PathPoint alloc];
                    *(float *)&double v69 = v67;
                    *(float *)&double v70 = v34;
                    v71 = [(PathPoint *)v68 initWithP:*(double *)v143.i64 n:COERCE_DOUBLE(vbsl_s8((int8x8_t)vdup_n_s32(0xFFFFFFFF), path1a, (int8x8_t)0x3F80000000000000)) r:v69 l:v70];
                    [v37 addObject:v71];
                  }
                  ++v44;
                  char v30 = 1;
                  float32x4_t v43 = v143;
                  float32x4_t v46 = v143;
                  if (v45 == v44) {
                    goto LABEL_34;
                  }
                }
              }
              int resolution = self->_resolution;
              float32x4_t v43 = v142;
              if ((resolution & 0x80000000) == 0) {
                goto LABEL_21;
              }
LABEL_34:
              float32x4_t v142 = v43;

              char v29 = 1;
            }
            id v26 = v126;
            uint64_t v12 = v123;
            unint64_t v11 = 0x263EFF000;
            uint64_t v28 = v121;
            uint64_t v127 = [obj countByEnumeratingWithState:&v158 objects:v169 count:16];
          }
          while (v127);
        }

        [v12 addObject:v37];
        uint64_t v35 = v124 + 1;
        uint64_t v33 = v122;
      }
      while (v124 + 1 != v28);
      uint64_t v28 = [v26 countByEnumeratingWithState:&v162 objects:v170 count:16];
    }
    while (v28);
  }
  else
  {
    float v34 = 0.0;
  }
LABEL_41:

  if (v6) {
    self->_length = v34;
  }
  path1b = CGPathCreateMutable();
  long long v154 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  id v136 = v12;
  uint64_t v72 = [v136 countByEnumeratingWithState:&v154 objects:v168 count:16];
  if (v72)
  {
    uint64_t v73 = v72;
    uint64_t v74 = *(void *)v155;
    do
    {
      for (uint64_t j = 0; j != v73; ++j)
      {
        if (*(void *)v155 != v74) {
          objc_enumerationMutation(v136);
        }
        v76 = *(void **)(*((void *)&v154 + 1) + 8 * j);
        if ([v76 count])
        {
          Mutable = CGPathCreateMutable();
          v78 = [v76 objectAtIndexedSubscript:0];
          [v78 n];
          float v80 = -v79;
          [v78 n];
          CGFloat v82 = atan2f(v80, -v81);
          [v78 p];
          CGFloat v84 = v83;
          [v78 p];
          CGFloat v86 = v85;
          [v78 r];
          CGPathAddArc(Mutable, 0, v84, v86, v87, v82, v82 + 3.14159265, 0);
          long long v152 = 0u;
          long long v153 = 0u;
          long long v150 = 0u;
          long long v151 = 0u;
          id v88 = v76;
          uint64_t v89 = [v88 countByEnumeratingWithState:&v150 objects:v167 count:16];
          if (v89)
          {
            uint64_t v90 = v89;
            uint64_t v91 = *(void *)v151;
            do
            {
              for (uint64_t k = 0; k != v90; ++k)
              {
                if (*(void *)v151 != v91) {
                  objc_enumerationMutation(v88);
                }
                v93 = *(void **)(*((void *)&v150 + 1) + 8 * k);
                [v93 p];
                float32x2_t v144 = v94;
                [v93 n];
                float32x2_t v96 = v95;
                [v93 r];
                float32x2_t v98 = vmla_n_f32(v144, v96, v97);
                CGPathAddLineToPoint(Mutable, 0, v98.f32[0], v98.f32[1]);
              }
              uint64_t v90 = [v88 countByEnumeratingWithState:&v150 objects:v167 count:16];
            }
            while (v90);
          }

          v99 = objc_msgSend(v88, "objectAtIndexedSubscript:", objc_msgSend(v88, "count") - 1);

          [v99 n];
          float v101 = v100;
          [v99 n];
          CGFloat v103 = atan2f(v101, v102);
          [v99 p];
          CGFloat v105 = v104;
          [v99 p];
          CGFloat v107 = v106;
          [v99 r];
          CGPathAddArc(Mutable, 0, v105, v107, v108, v103, v103 + 3.14159265, 0);
          long long v148 = 0u;
          long long v149 = 0u;
          long long v146 = 0u;
          long long v147 = 0u;
          v109 = [v88 reverseObjectEnumerator];
          uint64_t v110 = [v109 countByEnumeratingWithState:&v146 objects:v166 count:16];
          if (v110)
          {
            uint64_t v111 = v110;
            uint64_t v112 = *(void *)v147;
            do
            {
              for (uint64_t m = 0; m != v111; ++m)
              {
                if (*(void *)v147 != v112) {
                  objc_enumerationMutation(v109);
                }
                v114 = *(void **)(*((void *)&v146 + 1) + 8 * m);
                [v114 p];
                float32x2_t v145 = v115;
                [v114 n];
                float32x2_t v117 = v116;
                [v114 r];
                float32x2_t v119 = vmls_lane_f32(v145, v117, v118, 0);
                CGPathAddLineToPoint(Mutable, 0, v119.f32[0], v119.f32[1]);
              }
              uint64_t v111 = [v109 countByEnumeratingWithState:&v146 objects:v166 count:16];
            }
            while (v111);
          }

          CGPathAddPath(path1b, 0, Mutable);
          CGPathRelease(Mutable);
        }
      }
      uint64_t v73 = [v136 countByEnumeratingWithState:&v154 objects:v168 count:16];
    }
    while (v73);
  }

  return path1b;
}

- (void).cxx_destruct
{
}

@end