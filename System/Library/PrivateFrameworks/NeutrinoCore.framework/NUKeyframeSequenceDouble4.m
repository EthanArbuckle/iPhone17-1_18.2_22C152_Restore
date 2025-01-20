@interface NUKeyframeSequenceDouble4
- (CMTime)tangentOfKeyframeAtIndex:(float64x2_t *)a3@<X8>;
- (NUKeyframeSequenceDouble4)initWithInterpolation:(int64_t)a3 count:(unint64_t)a4 times:(id *)a5 values:;
- (NUKeyframeSequenceDouble4)initWithKeyframeSequence:(id)a3 values:;
- (float64x2_t)valueOfKeyframeAtIndex:(float64x2_t *)a3@<X8>;
- (id)debugQuickLookObject;
- (id)sparseSequence;
- (uint64_t)sampleAtTime:(float64x2_t *)a3@<X8>;
- (void)_compressAndStoreValues:(NUKeyframeSequenceDouble4 *)self count:(SEL)a2;
- (void)dealloc;
@end

@implementation NUKeyframeSequenceDouble4

- (id)debugQuickLookObject
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v4 = CGBitmapContextCreate(0, 0x40AuLL, 0x20AuLL, 8uLL, 0, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  CGContextSetAllowsAntialiasing(v4, 1);
  CGContextSetShouldAntialias(v4, 1);
  double v5 = 0.0;
  SRGB = CGColorCreateSRGB(0.0, 0.0, 0.0, 1.0);
  CGContextSetFillColorWithColor(v4, SRGB);
  CGFloat Width = (double)CGBitmapContextGetWidth(v4);
  v79.size.height = (double)CGBitmapContextGetHeight(v4);
  v79.origin.x = 0.0;
  v79.origin.y = 0.0;
  v79.size.width = Width;
  CGContextFillRect(v4, v79);
  CGColorRelease(SRGB);
  c = v4;
  CGContextSetLineWidth(v4, 1.5);
  int v8 = [(NUKeyframeSequence *)self count];
  memset(&v72[1], 0, sizeof(CMTime));
  [(NUKeyframeSequence *)self timeOfKeyframeAtIndex:0];
  memset(v72, 0, 24);
  [(NUKeyframeSequence *)self timeOfKeyframeAtIndex:v8 - 1];
  memset(&v71, 0, sizeof(v71));
  CMTime lhs = v72[0];
  CMTime rhs = v72[1];
  CMTimeSubtract(&v71, &lhs, &rhs);
  float64x2_t v51 = *(float64x2_t *)self->_scale;
  float64x2_t v54 = *(float64x2_t *)&self->_scale[16];
  lhs.value = (CMTimeValue)CGPathCreateMutable();
  *(void *)&lhs.timescale = CGPathCreateMutable();
  lhs.epoch = (CMTimeEpoch)CGPathCreateMutable();
  CGMutablePathRef Mutable = CGPathCreateMutable();
  memset(&v70, 0, sizeof(v70));
  [(NUKeyframeSequence *)self timeOfKeyframeAtIndex:0];
  if (v8 >= 1)
  {
    uint64_t v9 = 0;
    __asm { FMOV            V2.2D, #1.0 }
    float64x2_t v48 = (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64(v54), (int8x16_t)vdivq_f64(_Q2, v54), (int8x16_t)vdupq_n_s64(0x7FF0000000000000uLL));
    float64x2_t v47 = (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64(v51), (int8x16_t)vdivq_f64(_Q2, v51), (int8x16_t)xmmword_1A9A72CD0);
    uint64_t v43 = v8;
    float64x2_t v15 = 0uLL;
    float64x2_t v42 = (float64x2_t)vdupq_n_s64(0x3F80001000100010uLL);
    float64x2_t v16 = 0uLL;
    do
    {
      float64x2_t v52 = v16;
      float64x2_t v55 = v15;
      memset(&rhs, 0, sizeof(rhs));
      [(NUKeyframeSequence *)self timeOfKeyframeAtIndex:v9];
      memset(&v69, 0, sizeof(v69));
      CMTime v68 = rhs;
      CMTime time = v72[1];
      CMTimeSubtract(&v69, &v68, &time);
      double v17 = (double)v69.value / (double)v69.timescale * 1024.0 / ((double)v71.value / (double)v71.timescale);
      [(NUKeyframeSequenceDouble4 *)self valueOfKeyframeAtIndex:v9];
      float64x2_t v16 = vmulq_f64(v48, vmulq_f64(vsubq_f64(v66, *(float64x2_t *)&self->_bias[16]), v42));
      float64x2_t v15 = vmulq_f64(v47, vmulq_f64(vsubq_f64(v65, *(float64x2_t *)self->_bias), v42));
      float64x2_t v45 = v15;
      float64x2_t v46 = v16;
      if (v9)
      {
        uint64_t v44 = v9;
        for (uint64_t i = 0; i != 4; ++i)
        {
          v19 = (CGPath *)*(&lhs.value + i);
          v62[0] = v55;
          v62[1] = v52;
          CGPathMoveToPoint(v19, 0, v5 + 5.0, *((double *)v62 + (i & 3)) * 0.25 + (double)(int)i * 512.0 * 0.25 + 5.0);
        }
        int32_t v20 = 1;
        double v21 = 1.0;
        double v22 = 1.0;
        do
        {
          double v23 = v17 * (v21 * 0.03125) + 5.0 + v5 * (v22 - v21 * 0.03125);
          memset(&v68, 0, sizeof(v68));
          CMTime time = rhs;
          CMTimeMultiplyByRatio(&v64, &time, v20, 32);
          CMTime time = v70;
          CMTimeMultiplyByRatio(&v63, &time, 32 - v20, 32);
          CMTimeAdd(&v68, &v64, &v63);
          CMTime time = v68;
          [(NUKeyframeSequenceDouble4 *)self sampleAtTime:&time];
          uint64_t v24 = 0;
          long long v53 = v62[2];
          long long v56 = v62[3];
          long long v49 = *(_OWORD *)self->_bias;
          long long v50 = *(_OWORD *)&self->_bias[16];
          do
          {
            v25 = (CGPath *)*(&lhs.value + v24);
            v61[0] = v53;
            v61[1] = v56;
            uint64_t v26 = 8 * (v24 & 3);
            double v27 = *(double *)((char *)v61 + v26);
            v60[0] = v49;
            v60[1] = v50;
            double v28 = (v27 - *(double *)((char *)v60 + v26)) * 0.00781261921;
            v59[0] = v47;
            v59[1] = v48;
            CGPathAddLineToPoint(v25, 0, v23, (double)(int)v24++ * 512.0 * 0.25 + *(double *)((char *)v59 + v26) * v28 * 0.25 + 5.0);
          }
          while (v24 != 4);
          double v22 = 1.0;
          double v21 = v21 + 1.0;
          ++v20;
        }
        while (v20 != 33);
        double v29 = v17 + 5.0;
        uint64_t v9 = v44;
        float64x2_t v15 = v45;
        float64x2_t v16 = v46;
      }
      else
      {
        uint64_t v30 = 0;
        double v29 = v17 + 5.0;
        do
        {
          v31 = (CGPath *)*(&lhs.value + v30);
          v58[0] = v15;
          v58[1] = v16;
          CGPathMoveToPoint(v31, 0, v17 + 5.0, *((double *)v58 + (v30 & 3)) * 0.25 + (double)(int)v30 * 512.0 * 0.25 + 5.0);
          float64x2_t v15 = v45;
          float64x2_t v16 = v46;
          ++v30;
        }
        while (v30 != 4);
      }
      uint64_t v32 = 0;
      double v33 = v29 + -1.0;
      do
      {
        v34 = (CGPath *)*(&lhs.value + v32);
        v57[0] = v15;
        v57[1] = v16;
        v80.origin.y = *((double *)v57 + (v32 & 3)) * 0.25 + (double)(int)v32 * 512.0 * 0.25 + 5.0 + -2.0;
        v80.size.width = 5.0;
        v80.size.height = 5.0;
        v80.origin.x = v33;
        CGPathAddEllipseInRect(v34, 0, v80);
        float64x2_t v15 = v45;
        float64x2_t v16 = v46;
        ++v32;
      }
      while (v32 != 4);
      CMTime v70 = rhs;
      ++v9;
      double v5 = v17;
    }
    while (v9 != v43);
  }
  rhs.value = (CMTimeValue)CGColorCreateSRGB(1.0, 0.0, 0.0, 1.0);
  *(void *)&rhs.timescale = CGColorCreateSRGB(0.0, 1.0, 0.0, 1.0);
  rhs.epoch = (CMTimeEpoch)CGColorCreateSRGB(0.0, 0.0, 1.0, 1.0);
  uint64_t v35 = 0;
  CGColorRef v74 = CGColorCreateSRGB(0.8, 0.8, 0.0, 1.0);
  do
  {
    v36 = *(const CGPath **)((char *)&lhs.value + v35);
    CGContextAddPath(c, v36);
    v37 = *(CGColor **)((char *)&rhs.value + v35);
    CGContextSetStrokeColorWithColor(c, v37);
    CGContextStrokePath(c);
    CGPathRelease(v36);
    CGColorRelease(v37);
    v35 += 8;
  }
  while (v35 != 32);
  CGContextFlush(c);
  Image = CGBitmapContextCreateImage(c);
  v39 = NUDebugQuicklookWrapCGImage((uint64_t)Image);
  CGImageRelease(Image);
  CGContextRelease(c);

  return v39;
}

- (id)sparseSequence
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  if ([(NUKeyframeSequence *)self count] > 3)
  {
    int64x2_t v4 = (int64x2_t)vandq_s8((int8x16_t)vceqzq_f64(*(float64x2_t *)self->_scale), (int8x16_t)vceqzq_f64(*(float64x2_t *)&self->_scale[16]));
    if ((vandq_s8((int8x16_t)v4, (int8x16_t)vdupq_laneq_s64(v4, 1)).u64[0] & 0x8000000000000000) != 0)
    {
      [(NUKeyframeSequence *)self timeOfKeyframeAtIndex:0];
      [(NUKeyframeSequenceDouble4 *)self valueOfKeyframeAtIndex:0];
      long long v80 = v77;
      long long v81 = v78;
      id v36 = objc_alloc((Class)objc_opt_class());
      v3 = (NUKeyframeSequenceDouble4 *)objc_msgSend(v36, "initWithInterpolation:count:times:values:", -[NUKeyframeSequence interpolation](self, "interpolation"), 1, &v82, &v80);
    }
    else
    {
      float64x2_t v53 = *(float64x2_t *)&self->_scale[16];
      *(_OWORD *)obj = *(_OWORD *)self->_scale;
      double v5 = objc_opt_new();
      if ((int)[(NUKeyframeSequence *)self count] >= 5)
      {
        __asm { FMOV            V2.2D, #1.0 }
        float64x2_t v45 = (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64(*(float64x2_t *)obj), (int8x16_t)vdivq_f64(_Q2, *(float64x2_t *)obj), (int8x16_t)xmmword_1A9A72CD0);
        float64x2_t v44 = (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64(v53), (int8x16_t)vdivq_f64(_Q2, v53), (int8x16_t)vdupq_n_s64(0x7FF0000000000000uLL));
        uint64_t v11 = 2;
        float64x2_t v43 = (float64x2_t)vdupq_n_s64(0x4058000000000000uLL);
        do
        {
          long long v80 = 0uLL;
          *(void *)&long long v81 = 0;
          -[NUKeyframeSequence timeOfKeyframeAtIndex:](self, "timeOfKeyframeAtIndex:", v11 - 2, *(_OWORD *)&v43, *(_OWORD *)&v44, *(_OWORD *)&v45);
          memset(&v82, 0, sizeof(v82));
          [(NUKeyframeSequence *)self timeOfKeyframeAtIndex:v11 + 2];
          [(NUKeyframeSequenceDouble4 *)self valueOfKeyframeAtIndex:v11 - 2];
          float64x2_t v49 = v75;
          float64x2_t v51 = v76;
          [(NUKeyframeSequenceDouble4 *)self valueOfKeyframeAtIndex:v11 + 2];
          BOOL v12 = 0;
          int32_t v13 = 1;
          int32_t v14 = 7;
          float64x2_t v46 = v73;
          float64x2_t v47 = v74;
          while (1)
          {
            memset(&v72, 0, sizeof(v72));
            *(_OWORD *)&time.value = v80;
            time.epoch = v81;
            CMTimeMultiplyByRatio(&lhs, &time, v14, 8);
            CMTime time = v82;
            CMTimeMultiplyByRatio(&rhs, &time, v13, 8);
            CMTimeAdd(&v72, &lhs, &rhs);
            double v15 = (double)v13 * 0.125;
            float64x2_t v54 = vmlaq_n_f64(vmulq_n_f64(v47, v15), v51, 1.0 - v15);
            float64x2_t objb = vmlaq_n_f64(vmulq_n_f64(v46, v15), v49, 1.0 - v15);
            CMTime time = v72;
            [(NUKeyframeSequenceDouble4 *)self sampleAtTime:&time];
            int64x2_t v16 = (int64x2_t)vorrq_s8((int8x16_t)vcgtq_f64(vmulq_f64(v45, vabdq_f64(objb, v67)), v43), (int8x16_t)vcgtq_f64(vmulq_f64(v44, vabdq_f64(v54, v68)), v43));
            if ((vorrq_s8((int8x16_t)v16, (int8x16_t)vdupq_laneq_s64(v16, 1)).u64[0] & 0x8000000000000000) != 0) {
              break;
            }
            BOOL v12 = v13++ > 6;
            if (!--v14) {
              goto LABEL_14;
            }
          }
          if (!v12) {
            goto LABEL_15;
          }
LABEL_14:
          v18 = [NSNumber numberWithInt:v11];
          [v5 addObject:v18];

LABEL_15:
          ++v11;
        }
        while (v11 < (int)([(NUKeyframeSequence *)self count] - 2));
      }
      if ([v5 count])
      {
        unint64_t v19 = [(NUKeyframeSequence *)self count];
        unint64_t v20 = v19 - [v5 count];
        float64x2_t v52 = (char *)malloc_type_malloc(24 * v20, 0x1000040504FFAC1uLL);
        double v21 = (char *)malloc_type_malloc(32 * v20, 0x1000040E0EAB150uLL);
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        id obja = v5;
        uint64_t v22 = [obja countByEnumeratingWithState:&v63 objects:v79 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          unint64_t v48 = v20;
          long long v50 = v5;
          LODWORD(v20) = 0;
          int v24 = 0;
          uint64_t v25 = *(void *)v64;
          do
          {
            uint64_t v26 = 0;
            uint64_t v55 = v23;
            do
            {
              if (*(void *)v64 != v25) {
                objc_enumerationMutation(obja);
              }
              int v27 = [*(id *)(*((void *)&v63 + 1) + 8 * v26) intValue];
              if ((int)v20 >= v27)
              {
                int v28 = v20;
              }
              else
              {
                int v28 = v27;
                uint64_t v29 = v24;
                unint64_t v20 = (int)v20;
                uint64_t v30 = &v52[24 * v24];
                uint64_t v31 = v27;
                do
                {
                  uint64_t v32 = v29;
                  [(NUKeyframeSequence *)self timeOfKeyframeAtIndex:v20];
                  long long v33 = v80;
                  *((void *)v30 + 2) = v81;
                  *(_OWORD *)uint64_t v30 = v33;
                  v30 += 24;
                  [(NUKeyframeSequenceDouble4 *)self valueOfKeyframeAtIndex:v20];
                  uint64_t v29 = v32 + 1;
                  v34 = &v21[32 * v32];
                  *(_OWORD *)v34 = v61;
                  *((_OWORD *)v34 + 1) = v62;
                  ++v20;
                }
                while (v31 != v20);
                int v24 = v32 + 1;
                uint64_t v23 = v55;
              }
              LODWORD(v20) = v28 + 1;
              ++v26;
            }
            while (v26 != v23);
            uint64_t v23 = [obja countByEnumeratingWithState:&v63 objects:v79 count:16];
          }
          while (v23);
          uint64_t v35 = (int)v20;
          double v5 = v50;
          unint64_t v20 = v48;
        }
        else
        {
          uint64_t v35 = 0;
          int v24 = 0;
        }

        if (v24 < (int)v20)
        {
          v37 = &v21[32 * v24];
          uint64_t v38 = (int)v20 - (uint64_t)v24;
          v39 = &v52[24 * v24];
          do
          {
            [(NUKeyframeSequence *)self timeOfKeyframeAtIndex:v35];
            long long v40 = v80;
            *((void *)v39 + 2) = v81;
            *(_OWORD *)v39 = v40;
            v39 += 24;
            [(NUKeyframeSequenceDouble4 *)self valueOfKeyframeAtIndex:v35];
            *(_OWORD *)v37 = v59;
            *((_OWORD *)v37 + 1) = v60;
            v37 += 32;
            ++v35;
            --v38;
          }
          while (v38);
        }
        id v41 = objc_alloc((Class)objc_opt_class());
        v3 = (NUKeyframeSequenceDouble4 *)objc_msgSend(v41, "initWithInterpolation:count:times:values:", -[NUKeyframeSequence interpolation](self, "interpolation"), v20, v52, v21);

        free(v52);
        free(v21);
      }
      else
      {
        v3 = self;
      }
    }
  }
  else
  {
    v3 = self;
  }

  return v3;
}

- (uint64_t)sampleAtTime:(float64x2_t *)a3@<X8>
{
  if (*((unsigned char *)a2 + 12))
  {
    long long v27 = *a2;
    uint64_t v28 = *((void *)a2 + 2);
    uint64_t v9 = [a1 indexOfKeyframeAtOrBeforeTime:&v27];
    uint64_t result = [a1 interpolation];
    if (result == 2)
    {
      [a1 valueOfKeyframeAtIndex:v9];
      [a1 valueOfKeyframeAtIndex:v9 + 1];
      [a1 tangentOfKeyframeAtIndex:v9];
      [a1 tangentOfKeyframeAtIndex:v9 + 1];
      long long v27 = *a2;
      uint64_t v28 = *((void *)a2 + 2);
      uint64_t result = [a1 interpolantAtTime:&v27];
      float64x2_t v6 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_laneq_f64(v15, v10, 1), v19, v10.f64[0]), v17, v11.f64[0]), v13, v11, 1);
      float64x2_t v7 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_laneq_f64(v14, v10, 1), v18, v10.f64[0]), v16, v11.f64[0]), v12, v11, 1);
    }
    else if (result == 1)
    {
      [a1 valueOfKeyframeAtIndex:v9];
      [a1 valueOfKeyframeAtIndex:v9 + 1];
      long long v27 = *a2;
      uint64_t v28 = *((void *)a2 + 2);
      uint64_t result = [a1 interpolantAtTime:&v27];
      float64x2_t v6 = vmlaq_n_f64(vmulq_laneq_f64(v22, v20, 1), v24, v20.f64[0]);
      float64x2_t v7 = vmlaq_n_f64(vmulq_laneq_f64(v21, v20, 1), v23, v20.f64[0]);
    }
    else
    {
      if (result) {
        return result;
      }
      uint64_t result = [a1 valueOfKeyframeAtIndex:v9];
      float64x2_t v7 = v25;
      float64x2_t v6 = v26;
    }
  }
  else
  {
    uint64_t result = [a1 valueOfKeyframeAtIndex:0];
    float64x2_t v7 = v29;
    float64x2_t v6 = v30;
  }
  *a3 = v7;
  a3[1] = v6;
  return result;
}

- (CMTime)tangentOfKeyframeAtIndex:(float64x2_t *)a3@<X8>
{
  uint64_t v4 = a2 - 1;
  if (a2 < 1
    || (v6 = result, uint64_t result = (CMTime *)[(CMTime *)result count], (uint64_t)&result[-1].epoch + 7 <= a2))
  {
    *a3 = 0u;
    a3[1] = 0u;
  }
  else
  {
    [(CMTime *)v6 valueOfKeyframeAtIndex:v4];
    float64x2_t v13 = v21;
    float64x2_t v14 = v22;
    uint64_t v7 = a2 + 1;
    [(CMTime *)v6 valueOfKeyframeAtIndex:v7];
    float64x2_t v11 = v19;
    float64x2_t v12 = v20;
    memset(&v18[1], 0, sizeof(CMTime));
    [(CMTime *)v6 timeOfKeyframeAtIndex:v4];
    memset(v18, 0, 24);
    [(CMTime *)v6 timeOfKeyframeAtIndex:v7];
    memset(&v17, 0, sizeof(v17));
    CMTime lhs = v18[0];
    CMTime rhs = v18[1];
    uint64_t result = CMTimeSubtract(&v17, &lhs, &rhs);
    if (v17.value < 1)
    {
      float64x2_t v10 = 0uLL;
      float64x2_t v9 = 0uLL;
    }
    else
    {
      float64x2_t v8 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(fmax((double)v17.value / (double)v17.timescale, 0.015625)), 0);
      float64x2_t v9 = vdivq_f64(vsubq_f64(v12, v14), v8);
      float64x2_t v10 = vdivq_f64(vsubq_f64(v11, v13), v8);
    }
    *a3 = v10;
    a3[1] = v9;
  }
  return result;
}

- (float64x2_t)valueOfKeyframeAtIndex:(float64x2_t *)a3@<X8>
{
  if (*(void *)&result[7].f64[0])
  {
    double v5 = result;
    uint64_t result = (float64x2_t *)[(float64x2_t *)result count];
    uint64_t v6 = (uint64_t)&result[-1].f64[1] + 7;
    if ((uint64_t)&result[-1].f64[1] + 7 >= a2) {
      uint64_t v6 = a2;
    }
    uint32x4_t v7 = vmovl_u16(*(uint16x4_t *)(*(void *)&v5[7].f64[0] + 8 * (v6 & ~(v6 >> 63))));
    v8.i64[0] = v7.u32[0];
    v8.i64[1] = v7.u32[1];
    float64x2_t v9 = vcvtq_f64_u64(v8);
    v8.i64[0] = v7.u32[2];
    v8.i64[1] = v7.u32[3];
    float64x2_t v10 = vmlaq_f64(v5[6], v5[4], vcvtq_f64_u64(v8));
    float64x2_t v11 = vmlaq_f64(v5[5], v5[3], v9);
  }
  else
  {
    float64x2_t v11 = 0uLL;
    float64x2_t v10 = 0uLL;
  }
  *a3 = v11;
  a3[1] = v10;
  return result;
}

- (void)dealloc
{
  v3 = *(void **)self->_values;
  if (v3) {
    free(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)NUKeyframeSequenceDouble4;
  [(NUKeyframeSequence *)&v4 dealloc];
}

- (NUKeyframeSequenceDouble4)initWithKeyframeSequence:(id)a3 values:
{
  uint64_t v4 = v3;
  v7.receiver = self;
  v7.super_class = (Class)NUKeyframeSequenceDouble4;
  double v5 = [(NUKeyframeSequence *)&v7 initWithKeyframeSequence:a3];
  if ([(NUKeyframeSequence *)v5 count]) {
    [(NUKeyframeSequenceDouble4 *)v5 _compressAndStoreValues:v4 count:[(NUKeyframeSequence *)v5 count]];
  }
  return v5;
}

- (NUKeyframeSequenceDouble4)initWithInterpolation:(int64_t)a3 count:(unint64_t)a4 times:(id *)a5 values:
{
  uint64_t v6 = v5;
  v11.receiver = self;
  v11.super_class = (Class)NUKeyframeSequenceDouble4;
  uint64x2_t v8 = [(NUKeyframeSequence *)&v11 initWithInterpolation:a3 count:a4 times:a5];
  float64x2_t v9 = v8;
  if (a4) {
    [(NUKeyframeSequenceDouble4 *)v8 _compressAndStoreValues:v6 count:a4];
  }
  return v9;
}

- (void)_compressAndStoreValues:(NUKeyframeSequenceDouble4 *)self count:(SEL)a2
{
  unint64_t v4 = v3;
  uint64_t v5 = v2;
  *(void *)self->_values = malloc_type_calloc(v3, 8uLL, 0x100004000313F17uLL);
  float64x2_t v8 = *v5;
  float64x2_t v7 = v5[1];
  if (v4 < 2)
  {
    float64x2_t v11 = *v5;
    float64x2_t v12 = v5[1];
  }
  else
  {
    unsigned int v9 = 2;
    unint64_t v10 = 1;
    float64x2_t v11 = *v5;
    float64x2_t v12 = v5[1];
    do
    {
      float64x2_t v13 = &v5[2 * v10];
      float64x2_t v14 = v13[1];
      float64x2_t v11 = vminnmq_f64(v11, *v13);
      float64x2_t v12 = vminnmq_f64(v12, v14);
      float64x2_t v8 = vmaxnmq_f64(v8, *v13);
      float64x2_t v7 = vmaxnmq_f64(v7, v14);
      unint64_t v10 = v9++;
    }
    while (v10 < v4);
  }
  float64x2_t v15 = vsubq_f64(v7, v12);
  float64x2_t v16 = (float64x2_t)vdupq_n_s64(0x40EFFFE000000000uLL);
  *(float64x2_t *)self->_scale = vdivq_f64(vsubq_f64(v8, v11), v16);
  *(float64x2_t *)&self->_scale[16] = vdivq_f64(v15, v16);
  *(float64x2_t *)self->_bias = v11;
  *(float64x2_t *)&self->_bias[16] = v12;
  if (v4)
  {
    uint64_t v17 = 0;
    __asm { FMOV            V4.2D, #1.0 }
    float64x2_t v23 = (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64(*(float64x2_t *)&self->_scale[16]), (int8x16_t)vdivq_f64(_Q4, *(float64x2_t *)&self->_scale[16]), (int8x16_t)vdupq_n_s64(0x7FF0000000000000uLL));
    float64x2_t v24 = (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64(*(float64x2_t *)self->_scale), (int8x16_t)vdivq_f64(_Q4, *(float64x2_t *)self->_scale), (int8x16_t)xmmword_1A9A72CD0);
    do
    {
      *(int16x4_t *)(*(void *)self->_values + 8 * v17) = vmovn_s32(vuzp1q_s32((int32x4_t)vcvtq_s64_f64(vminnmq_f64(vmaxnmq_f64(vrndaq_f64(vmulq_f64(v24, vsubq_f64(v5[2 * v17], *(float64x2_t *)self->_bias))), (float64x2_t)0), v16)), (int32x4_t)vcvtq_s64_f64(vminnmq_f64(vmaxnmq_f64(vrndaq_f64(vmulq_f64(v23, vsubq_f64(
                                                                                      v5[2 * v17 + 1],
                                                                                      *(float64x2_t *)&self->_bias[16]))),
                                                                                (float64x2_t)0),
                                                                              v16))));
      ++v17;
    }
    while (v4 > v17);
  }
}

@end