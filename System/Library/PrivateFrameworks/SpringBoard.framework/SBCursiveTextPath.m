@interface SBCursiveTextPath
- (CGAffineTransform)transformForRect:(SEL)a3 pointSize:(CGRect)a4 flipped:(double)a5;
- (CGPath)pathForFraction:(double)a3 calculateLength:(BOOL)a4;
- (CGPath)pathForTime:(double)a3;
- (SBCursiveTextPath)initWithURL:(id)a3;
- (SBCursiveTextPath)initWithURL:(id)a3 resolution:(int64_t)a4;
- (double)duration;
- (id).cxx_construct;
@end

@implementation SBCursiveTextPath

- (SBCursiveTextPath)initWithURL:(id)a3
{
  return [(SBCursiveTextPath *)self initWithURL:a3 resolution:40];
}

- (SBCursiveTextPath)initWithURL:(id)a3 resolution:(int64_t)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  v71.receiver = self;
  v71.super_class = (Class)SBCursiveTextPath;
  v5 = [(SBCursiveTextPath *)&v71 init];
  v6 = v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 8) = xmmword_1D8FD0700;
    *((void *)v5 + 3) = 0x3FD0000000000000;
    uint64_t v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v56];
    v53 = (void *)v7;
    if (v7)
    {
      id v70 = 0;
      v8 = [MEMORY[0x1E4F28F98] propertyListWithData:v7 options:0 format:0 error:&v70];
      id v52 = v70;
      v55 = v8;
      if (v8)
      {
        v9 = [v8 objectForKeyedSubscript:@"unitsPerEm"];
        [v9 floatValue];
        *((double *)v6 + 10) = v10;

        v11 = [v8 objectForKeyedSubscript:@"ascender"];
        [v11 floatValue];
        *((double *)v6 + 11) = v12;

        v13 = [v8 objectForKeyedSubscript:@"descender"];
        [v13 floatValue];
        *((double *)v6 + 12) = v14;

        id v15 = [v8 objectForKeyedSubscript:@"scale"];
        v16 = v15;
        *(_OWORD *)obuint64_t j = 0u;
        if (v15 && [v15 count] == 4)
        {
          v17 = [v16 objectAtIndexedSubscript:0];
          [v17 floatValue];
          unsigned int objb = v18;
          v19 = [v16 objectAtIndexedSubscript:1];
          [v19 floatValue];
          unsigned int v50 = v20;
          v21 = [v16 objectAtIndexedSubscript:2];
          [v21 floatValue];
          unsigned int v49 = v22;
          v23 = [v16 objectAtIndexedSubscript:3];
          [v23 floatValue];
          uint64_t v48 = v24;

          *(void *)&long long v25 = __PAIR64__(v50, objb);
          *((void *)&v25 + 1) = __PAIR64__(v48, v49);
          *(_OWORD *)obuint64_t j = v25;
        }

        float32x4_t v69 = *(float32x4_t *)obj;
        v51 = [v8 objectForKeyedSubscript:@"strokes"];
        std::vector<std::vector<BezierCurve>>::reserve((void *)v6 + 13, [v51 count]);
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        id obja = v51;
        uint64_t v26 = [obja countByEnumeratingWithState:&v65 objects:v76 count:16];
        if (v26)
        {
          uint64_t v27 = *(void *)v66;
          do
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v66 != v27) {
                objc_enumerationMutation(obja);
              }
              v29 = *(void **)(*((void *)&v65 + 1) + 8 * i);
              *(void *)buf = 0;
              v74 = 0;
              uint64_t v75 = 0;
              std::vector<BezierCurve>::reserve((void **)buf, objc_msgSend(v29, "count", v48));
              long long v60 = 0u;
              long long v61 = 0u;
              long long v62 = 0u;
              long long v63 = 0u;
              id v30 = v29;
              uint64_t v31 = [v30 countByEnumeratingWithState:&v60 objects:v72 count:16];
              if (v31)
              {
                uint64_t v32 = *(void *)v61;
                do
                {
                  for (uint64_t j = 0; j != v31; ++j)
                  {
                    if (*(void *)v61 != v32) {
                      objc_enumerationMutation(v30);
                    }
                    v64 = *(void **)(*((void *)&v60 + 1) + 8 * j);
                    _ZNSt3__16vectorI11BezierCurveNS_9allocatorIS1_EEE12emplace_backIJRU8__strongKP12NSDictionaryRDv4_fEEERS1_DpOT_((float32x4_t **)buf, &v64, &v69);
                  }
                  uint64_t v31 = [v30 countByEnumeratingWithState:&v60 objects:v72 count:16];
                }
                while (v31);
              }

              v34 = (void *)*((void *)v6 + 14);
              if ((unint64_t)v34 >= *((void *)v6 + 15))
              {
                uint64_t v38 = std::vector<std::vector<BezierCurve>>::__emplace_back_slow_path<std::vector<BezierCurve>&>((uint64_t *)v6 + 13, (uint64_t)buf);
              }
              else
              {
                void *v34 = 0;
                v34[1] = 0;
                v34[2] = 0;
                v35 = *(const void **)buf;
                int64_t v36 = (int64_t)v74 - *(void *)buf;
                if (v74 != *(const void **)buf)
                {
                  std::vector<BezierCurve>::__vallocate[abi:nn180100](v34, v36 >> 6);
                  v37 = (char *)v34[1];
                  memmove(v37, v35, v36);
                  v34[1] = &v37[64 * (v36 >> 6)];
                }
                uint64_t v38 = (uint64_t)(v34 + 3);
                *((void *)v6 + 14) = v34 + 3;
              }
              *((void *)v6 + 14) = v38;
              if (*(void *)buf)
              {
                v74 = *(const void **)buf;
                operator delete(*(void **)buf);
              }
            }
            uint64_t v26 = [obja countByEnumeratingWithState:&v65 objects:v76 count:16];
          }
          while (v26);
        }

        *((void *)v6 + 16) = a4;
        v39 = (const CGPath *)[v6 pathForFraction:1 calculateLength:0.0];
        *(CGRect *)(v6 + 48) = CGPathGetPathBoundingBox(v39);
        CGPathRelease(v39);
        float v40 = *((double *)v6 + 4) / 3000.0;
        *((double *)v6 + 5) = (float)((float)(powf((float)(fminf(fmaxf(v40, 0.0), 10.0) / 10.0) + -1.0, 3.0) + 1.0) * 4.0);

        goto LABEL_29;
      }
      v44 = SBLogDashBoard();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v45 = [v56 absoluteString];
        v46 = [v52 description];
        [(SBCursiveTextPath *)v45 initWithURL:buf resolution:v44];
      }
    }
    else
    {
      v42 = SBLogDashBoard();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v43 = [v56 absoluteString];
        -[SBCursiveTextPath initWithURL:resolution:](v43, buf, v42);
      }
    }
    v41 = 0;
    goto LABEL_37;
  }
LABEL_29:
  v41 = v6;
LABEL_37:

  return v41;
}

- (CGAffineTransform)transformForRect:(SEL)a3 pointSize:(CGRect)a4 flipped:(double)a5
{
  BOOL v6 = a6;
  double descender = self->_descender;
  double v11 = self->_ascender - descender;
  double v12 = -descender / v11;
  double v13 = v11 / self->_unitsPerM * a5;
  double v33 = (CGRectGetHeight(a4) - v13) * 0.5;
  CGFloat x = self->_boundingBoxOfPath.origin.x;
  CGFloat y = self->_boundingBoxOfPath.origin.y;
  CGFloat width = self->_boundingBoxOfPath.size.width;
  CGFloat height = self->_boundingBoxOfPath.size.height;
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = width;
  v40.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v40);
  v41.origin.CGFloat x = x;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  CGFloat v19 = CGRectGetWidth(v41);
  CGAffineTransformMakeTranslation(retstr, -(MinX + v19 * 0.5), 0.0);
  double v20 = 1.0 - v12;
  if (!v6) {
    double v20 = v12;
  }
  double v21 = v33 + v20 * v13;
  double v22 = a5 / self->_unitsPerM;
  long long v23 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t1.c = v23;
  *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&retstr->tx;
  double v24 = -v22;
  if (!v6) {
    double v24 = v22;
  }
  CGAffineTransformMakeScale(&t2, v22, v24);
  CGAffineTransformConcat(&v39, &t1, &t2);
  long long v25 = *(_OWORD *)&v39.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v39.a;
  *(_OWORD *)&retstr->c = v25;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v39.tx;
  long long v26 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v36.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v36.c = v26;
  *(_OWORD *)&v36.tCGFloat x = *(_OWORD *)&retstr->tx;
  CGFloat v27 = a4.origin.x;
  *(CGFloat *)&long long v26 = a4.origin.y;
  CGFloat v28 = a4.size.width;
  CGFloat v29 = a4.size.height;
  CGFloat v30 = CGRectGetWidth(*(CGRect *)((char *)&v26 - 8));
  CGAffineTransformMakeTranslation(&v35, v30 * 0.5, v21);
  result = CGAffineTransformConcat(&v39, &v36, &v35);
  long long v32 = *(_OWORD *)&v39.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v39.a;
  *(_OWORD *)&retstr->c = v32;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v39.tx;
  return result;
}

- (double)duration
{
  return self->_duration;
}

- (CGPath)pathForTime:(double)a3
{
  return [(SBCursiveTextPath *)self pathForFraction:0 calculateLength:a3 / self->_duration];
}

- (CGPath)pathForFraction:(double)a3 calculateLength:(BOOL)a4
{
  BOOL v4 = a4;
  double rampTime = self->_rampTime;
  double duration = self->_duration;
  uint64_t v96 = 0;
  uint64_t v97 = 0;
  uint64_t v98 = 0;
  begin = (float32x4_t **)self->_bezierArrays.__begin_;
  end = (float32x4_t **)self->_bezierArrays.__end_;
  if (begin == end)
  {
    double v16 = 0.0;
  }
  else
  {
    char v9 = 0;
    char v10 = 0;
    double v11 = rampTime / duration;
    double v12 = 1.0;
    double v13 = -(v11 - (v11 + 1.0) * a3);
    float v14 = v13;
    float v15 = v11;
    double v88 = v11 + v13;
    double v16 = 0.0;
    float32x4_t v92 = 0u;
    __asm
    {
      FMOV            V1.4S, #3.0
      FMOV            V0.4S, #6.0
    }
    float32x4_t v89 = _Q0;
    float32x4_t v90 = _Q1;
    do
    {
      __p = 0;
      v94 = 0;
      v95 = 0;
      long long v23 = *begin;
      v86 = begin[1];
      v87 = begin;
      if (*begin == v86)
      {
LABEL_32:
        std::vector<std::vector<PathPoint>>::emplace_back<std::vector<PathPoint>>(&v96, (uint64_t)&__p);
        int v65 = 0;
      }
      else
      {
        double v24 = 0;
        while ((vminvq_u32((uint32x4_t)vceqq_f32(*v23, v23[3])) & 0x80000000) == 0)
        {
          int64_t resolution = self->_resolution;
          if ((resolution & 0x8000000000000000) == 0) {
            goto LABEL_9;
          }
LABEL_31:
          v23 += 4;
          char v10 = 1;
          if (v23 == v86) {
            goto LABEL_32;
          }
        }
        int64_t resolution = 0;
LABEL_9:
        uint64_t v26 = 0;
        while (1)
        {
          float32x4_t v27 = v92;
          float v28 = v12 / (double)self->_resolution * (double)v26;
          float32x4_t v29 = v23[1];
          float32x4_t v30 = vmulq_f32(v29, v90);
          float32x4_t v31 = v23[2];
          float32x4_t v32 = v23[3];
          float32x4_t v33 = vmulq_n_f32(vmulq_n_f32(vmulq_f32(v31, v90), v28), v28);
          float32x4_t v34 = vaddq_f32(vmulq_n_f32(vmulq_n_f32(vmulq_n_f32(v32, v28), v28), v28), vaddq_f32(vmulq_n_f32(v33, 1.0 - v28), vaddq_f32(vmulq_n_f32(vmulq_n_f32(vmulq_n_f32(v30, v28), 1.0 - v28), 1.0 - v28), vmulq_n_f32(vmulq_n_f32(vmulq_n_f32(*v23, 1.0 - v28), 1.0 - v28), 1.0 - v28))));
          float32x2_t v35 = (float32x2_t)vaddq_f32(vmulq_n_f32(vmulq_n_f32(vmulq_f32(v32, v90), v28), v28), vsubq_f32(vaddq_f32(vmulq_n_f32(vmulq_n_f32(vmulq_f32(v31, v89), 1.0 - v28), v28), vsubq_f32(vsubq_f32(vmulq_n_f32(vmulq_n_f32(v30, 1.0 - v28), 1.0 - v28), vmulq_n_f32(vmulq_n_f32(vmulq_f32(*v23, v90), 1.0 - v28), 1.0 - v28)), vmulq_n_f32(vmulq_n_f32(vmulq_f32(v29, v89), 1.0 - v28), v28))), v33)).u64[0];
          float32_t v36 = -v35.f32[0];
          v35.i32[0] = vdup_lane_s32((int32x2_t)v35, 1).u32[0];
          v35.f32[1] = v36;
          float32x2_t v37 = vmul_f32(v35, v35);
          v37.i32[0] = vadd_f32(v37, (float32x2_t)vdup_lane_s32((int32x2_t)v37, 1)).u32[0];
          float32x2_t v38 = vrsqrte_f32((float32x2_t)v37.u32[0]);
          float32x2_t v39 = vmul_f32(v38, vrsqrts_f32((float32x2_t)v37.u32[0], vmul_f32(v38, v38)));
          int8x8_t v91 = (int8x8_t)vmul_n_f32(v35, vmul_f32(v39, vrsqrts_f32((float32x2_t)v37.u32[0], vmul_f32(v39, v39))).f32[0]);
          float32x4_t v92 = v34;
          if (v9)
          {
            float32x4_t v40 = vsubq_f32(v34, v27);
            float32x4_t v41 = vmulq_f32(v40, v40);
            double v42 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v41, 2), vaddq_f32(v41, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v41.f32, 1))).f32[0]);
            double v43 = 0.5;
            if ((v10 & 1) == 0) {
              double v43 = v12;
            }
            double v16 = v16 + v42 * v43;
            char v10 = 0;
          }
          double v44 = v16 / self->_length;
          float v45 = v44;
          double initialWeight = self->_initialWeight;
          double finalWeight = self->_finalWeight;
          float v48 = powf((float)(1.0 - fminf(fmaxf((float)(v45 - v14) / v15, 0.0), 1.0)) + -1.0, 3.0);
          if (!v4 && v44 > v88) {
            break;
          }
          int8x8_t v49 = vbsl_s8((int8x8_t)vdup_n_s32(0), (int8x8_t)0x3F80000000000000, v91);
          float v50 = initialWeight;
          float v51 = finalWeight;
          float v52 = vmuls_lane_f32(v50 + (float)((float)(v48 + 1.0) * (float)(v51 - v50)), v92, 3);
          if (v24 >= (int8x8_t *)v95)
          {
            unint64_t v54 = 0xAAAAAAAAAAAAAAABLL * (((char *)v24 - (unsigned char *)__p) >> 3);
            unint64_t v55 = v54 + 1;
            if (v54 + 1 > 0xAAAAAAAAAAAAAAALL) {
              abort();
            }
            if (0x5555555555555556 * ((v95 - (unsigned char *)__p) >> 3) > v55) {
              unint64_t v55 = 0x5555555555555556 * ((v95 - (unsigned char *)__p) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * ((v95 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
              unint64_t v56 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v56 = v55;
            }
            v57 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::vector<BezierCurve>>>((uint64_t)&v95, v56);
            v59 = (int8x8_t *)&v57[24 * v54];
            *(float *)&__int32 v60 = v16;
            int8x8_t *v59 = *(int8x8_t *)v92.f32;
            v59[1] = v49;
            *(float *)v59[2].i32 = v52;
            v59[2].i32[1] = v60;
            long long v62 = (char *)__p;
            long long v61 = (char *)v94;
            long long v63 = v59;
            double v12 = 1.0;
            if (v94 != __p)
            {
              do
              {
                long long v64 = *(_OWORD *)(v61 - 24);
                v63[-1] = *(int8x8_t *)(v61 - 8);
                *(_OWORD *)v63[-3].i8 = v64;
                v63 -= 3;
                v61 -= 24;
              }
              while (v61 != v62);
              long long v61 = (char *)__p;
            }
            double v24 = v59 + 3;
            __p = v63;
            v94 = v59 + 3;
            v95 = &v57[24 * v58];
            if (v61) {
              operator delete(v61);
            }
          }
          else
          {
            *(float *)&__int32 v53 = v16;
            *double v24 = *(int8x8_t *)v92.f32;
            v24[1] = v49;
            *(float *)v24[2].i32 = v52;
            v24[2].i32[1] = v53;
            v24 += 3;
            double v12 = 1.0;
          }
          v94 = v24;
          char v9 = 1;
          if (v26++ == resolution) {
            goto LABEL_31;
          }
        }
        std::vector<std::vector<PathPoint>>::emplace_back<std::vector<PathPoint>>(&v96, (uint64_t)&__p);
        int v65 = 9;
        char v9 = 1;
      }
      if (__p)
      {
        v94 = (int8x8_t *)__p;
        operator delete(__p);
      }
      if (v65) {
        break;
      }
      begin = v87 + 3;
    }
    while (v87 + 3 != end);
  }
  if (v4) {
    self->_length = v16;
  }
  Mutable = CGPathCreateMutable();
  uint64_t v67 = v96;
  for (uint64_t i = v97; v67 != i; v67 += 24)
  {
    float32x4_t v69 = *(float32x2_t **)v67;
    uint64_t v70 = *(void *)(v67 + 8);
    if (*(void *)v67 != v70)
    {
      float32x2_t v71 = vmla_n_f32(*v69, v69[1], v69[2].f32[0]);
      CGPathMoveToPoint(Mutable, 0, v71.f32[0], v71.f32[1]);
      unint64_t v72 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v67 + 8) - *(void *)v67) >> 3);
      if (v72 - 1 >= 2)
      {
        uint64_t v73 = 0;
        unint64_t v74 = v72 - 2;
        do
        {
          float32x2_t v75 = vmla_n_f32(*(float32x2_t *)(*(void *)v67 + v73 + 24), *(float32x2_t *)(*(void *)v67 + v73 + 32), *(float *)(*(void *)v67 + v73 + 40));
          CGPathAddLineToPoint(Mutable, 0, v75.f32[0], v75.f32[1]);
          v73 += 24;
          --v74;
        }
        while (v74);
      }
      float v76 = atan2f(COERCE_FLOAT(HIDWORD(*(void *)(v70 - 16))), COERCE_FLOAT(*(void *)(v70 - 16)));
      CGPathAddArc(Mutable, 0, COERCE_FLOAT(*(void *)(v70 - 24)), COERCE_FLOAT(HIDWORD(*(void *)(v70 - 24))), *(float *)(v70 - 8), v76, v76 + 3.14159265, 0);
      uint64_t v78 = *(void *)(v67 + 8) - *(void *)v67;
      if (v78 >= 49)
      {
        int64_t v79 = v78 / 0x18uLL - 1;
        unint64_t v80 = 24 * (v78 / 0x18uLL);
        do
        {
          unint64_t v81 = *(void *)v67 + v80;
          v77.i32[0] = *(_DWORD *)(v81 - 32);
          float32x2_t v82 = vmls_lane_f32(*(float32x2_t *)(v81 - 48), *(float32x2_t *)(v81 - 40), v77, 0);
          CGPathAddLineToPoint(Mutable, 0, v82.f32[0], v82.f32[1]);
          --v79;
          v80 -= 24;
        }
        while (v79 > 1);
      }
      float v83 = atan2f(-COERCE_FLOAT(HIDWORD(*(void *)&v69[1])), -COERCE_FLOAT(*(void *)&v69[1]));
      CGPathAddArc(Mutable, 0, COERCE_FLOAT(*v69), COERCE_FLOAT(HIDWORD(*(unint64_t *)v69)), v69[2].f32[0], v83, v83 + 3.14159265, 0);
    }
  }
  __p = &v96;
  std::vector<std::vector<PathPoint>>::__destroy_vector::operator()[abi:nn180100]((void ***)&__p);
  return Mutable;
}

- (void).cxx_destruct
{
  p_bezierArrays = &self->_bezierArrays;
  std::vector<std::vector<PathPoint>>::__destroy_vector::operator()[abi:nn180100]((void ***)&p_bezierArrays);
}

- (id).cxx_construct
{
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 15) = 0;
  return self;
}

- (void)initWithURL:(os_log_t)log resolution:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "[SBCursiveTextPath] No data for url %@", buf, 0xCu);
}

- (void)initWithURL:(uint8_t *)buf resolution:(os_log_t)log .cold.2(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "[SBCursiveTextPath] Indecipherable plist for url: %@, error: %@", buf, 0x16u);
}

@end