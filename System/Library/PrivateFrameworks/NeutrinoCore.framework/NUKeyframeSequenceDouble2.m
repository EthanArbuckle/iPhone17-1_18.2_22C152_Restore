@interface NUKeyframeSequenceDouble2
- (NUKeyframeSequenceDouble2)initWithInterpolation:(int64_t)a3 count:(unint64_t)a4 times:(id *)a5 values:;
- (NUKeyframeSequenceDouble2)initWithKeyframeSequence:(id)a3 values:;
- (double)sampleAtTime:(long long *)a3;
- (double)tangentOfKeyframeAtIndex:(uint64_t)a3;
- (double)valueOfKeyframeAtIndex:(uint64_t)a3;
- (id)debugQuickLookObject;
- (void)_compressAndStoreValues:(NUKeyframeSequenceDouble2 *)self count:(SEL)a2;
- (void)dealloc;
@end

@implementation NUKeyframeSequenceDouble2

- (id)debugQuickLookObject
{
  v74[2] = *MEMORY[0x1E4F143B8];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v4 = CGBitmapContextCreate(0, 0x40AuLL, 0x20AuLL, 8uLL, 0, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  CGContextSetAllowsAntialiasing(v4, 1);
  CGContextSetShouldAntialias(v4, 1);
  double v5 = 0.0;
  SRGB = CGColorCreateSRGB(0.0, 0.0, 0.0, 1.0);
  CGContextSetFillColorWithColor(v4, SRGB);
  CGFloat Width = (double)CGBitmapContextGetWidth(v4);
  v76.size.height = (double)CGBitmapContextGetHeight(v4);
  v76.origin.x = 0.0;
  v76.origin.y = 0.0;
  v76.size.width = Width;
  CGContextFillRect(v4, v76);
  CGColorRelease(SRGB);
  CGContextSetLineWidth(v4, 1.5);
  int v8 = [(NUKeyframeSequence *)self count];
  memset(&v73[1], 0, sizeof(CMTime));
  [(NUKeyframeSequence *)self timeOfKeyframeAtIndex:0];
  memset(v73, 0, 24);
  [(NUKeyframeSequence *)self timeOfKeyframeAtIndex:v8 - 1];
  memset(&v72, 0, sizeof(v72));
  CMTime lhs = v73[0];
  CMTime rhs = v73[1];
  CMTimeSubtract(&v72, &lhs, &rhs);
  float64x2_t v56 = *(float64x2_t *)self->_scale;
  Mutable = CGPathCreateMutable();
  v74[0] = Mutable;
  v10 = CGPathCreateMutable();
  v74[1] = v10;
  memset(&lhs, 0, sizeof(lhs));
  [(NUKeyframeSequence *)self timeOfKeyframeAtIndex:0];
  if (v8 >= 1)
  {
    v50 = v10;
    v51 = v4;
    uint64_t v11 = 0;
    __asm { FMOV            V1.2D, #1.0 }
    float64x2_t v54 = (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64(v56), (int8x16_t)vdivq_f64(_Q1, v56), (int8x16_t)_Q1);
    uint64_t v17 = v8;
    float64x2_t v18 = 0uLL;
    float64x2_t v52 = (float64x2_t)vdupq_n_s64(0x3F7F601F601F601FuLL);
    do
    {
      float64x2_t v57 = v18;
      memset(&rhs, 0, sizeof(rhs));
      -[NUKeyframeSequence timeOfKeyframeAtIndex:](self, "timeOfKeyframeAtIndex:", v11, v50, v51);
      memset(&v69, 0, sizeof(v69));
      CMTime v68 = rhs;
      CMTime time = v73[1];
      CMTimeSubtract(&v69, &v68, &time);
      double v19 = (double)v69.value / (double)v69.timescale * 1024.0 / ((double)v72.value / (double)v72.timescale);
      [(NUKeyframeSequenceDouble2 *)self valueOfKeyframeAtIndex:v11];
      float64x2_t v18 = vmulq_f64(v54, vmulq_f64(vsubq_f64(v20, *(float64x2_t *)self->_bias), v52));
      float64x2_t v53 = v18;
      uint64_t v21 = 0;
      if (v11)
      {
        char v22 = 1;
        do
        {
          char v23 = v22;
          v24 = (CGPath *)v74[v21];
          float64x2_t v64 = v57;
          CGPathMoveToPoint(v24, 0, v5 + 5.0, *(double *)((unint64_t)&v64 & 0xFFFFFFFFFFFFFFF7 | (8 * (v21 & 1))) * 0.5+ (double)(int)v21 * 512.0 * 0.5+ 5.0);
          char v22 = 0;
          uint64_t v21 = 1;
        }
        while ((v23 & 1) != 0);
        int32_t v25 = 1;
        double v26 = 1.0;
        double v27 = 1.0;
        do
        {
          double v28 = v19 * (v26 * 0.03125) + 5.0 + v5 * (v27 - v26 * 0.03125);
          memset(&v68, 0, sizeof(v68));
          CMTime time = rhs;
          CMTimeMultiplyByRatio(&v66, &time, v25, 32);
          CMTime time = lhs;
          CMTimeMultiplyByRatio(&v65, &time, 32 - v25, 32);
          CMTimeAdd(&v68, &v66, &v65);
          CMTime time = v68;
          [(NUKeyframeSequenceDouble2 *)self sampleAtTime:&time];
          long long v58 = v29;
          uint64_t v30 = 0;
          long long v55 = *(_OWORD *)self->_bias;
          char v31 = 1;
          do
          {
            v32 = (CGPath *)v74[v30];
            char v33 = v31;
            long long v61 = v58;
            double v34 = *(double *)((unint64_t)&v61 & 0xFFFFFFFFFFFFFFF7 | (8 * (v30 & 1)));
            long long v62 = v55;
            double v35 = (v34 - *(double *)((unint64_t)&v62 & 0xFFFFFFFFFFFFFFF7 | (8 * (v30 & 1)))) * 0.00766002899;
            float64x2_t v63 = v54;
            CGPathAddLineToPoint(v32, 0, v28, (double)(int)v30 * 512.0 * 0.5+ *(double *)((unint64_t)&v63 & 0xFFFFFFFFFFFFFFF7 | (8 * (v30 & 1))) * v35 * 0.5+ 5.0);
            char v31 = 0;
            uint64_t v30 = 1;
          }
          while ((v33 & 1) != 0);
          double v27 = 1.0;
          double v26 = v26 + 1.0;
          ++v25;
        }
        while (v25 != 33);
        double v36 = v19 + 5.0;
        float64x2_t v18 = v53;
      }
      else
      {
        double v36 = v19 + 5.0;
        char v37 = 1;
        do
        {
          char v38 = v37;
          v39 = (CGPath *)v74[v21];
          float64x2_t v60 = v18;
          CGPathMoveToPoint(v39, 0, v19 + 5.0, *(double *)((unint64_t)&v60 & 0xFFFFFFFFFFFFFFF7 | (8 * (v21 & 1))) * 0.5+ (double)(int)v21 * 512.0 * 0.5+ 5.0);
          float64x2_t v18 = v53;
          char v37 = 0;
          uint64_t v21 = 1;
        }
        while ((v38 & 1) != 0);
      }
      uint64_t v40 = 0;
      double v41 = v36 + -1.0;
      char v42 = 1;
      do
      {
        char v43 = v42;
        v44 = (CGPath *)v74[v40];
        float64x2_t v59 = v18;
        v77.origin.y = *(double *)((unint64_t)&v59 & 0xFFFFFFFFFFFFFFF7 | (8 * (v40 & 1))) * 0.5
                     + (double)(int)v40 * 512.0 * 0.5
                     + 5.0
                     + -2.0;
        v77.size.width = 5.0;
        v77.size.height = 5.0;
        v77.origin.x = v41;
        CGPathAddEllipseInRect(v44, 0, v77);
        float64x2_t v18 = v53;
        char v42 = 0;
        uint64_t v40 = 1;
      }
      while ((v43 & 1) != 0);
      CMTime lhs = rhs;
      ++v11;
      double v5 = v19;
    }
    while (v11 != v17);
    Mutable = (const CGPath *)v74[0];
    v10 = v50;
    v4 = v51;
  }
  v45 = CGColorCreateSRGB(1.0, 0.0, 0.0, 1.0);
  v46 = CGColorCreateSRGB(0.0, 1.0, 0.0, 1.0);
  CGContextAddPath(v4, Mutable);
  CGContextSetStrokeColorWithColor(v4, v45);
  CGContextStrokePath(v4);
  CGPathRelease(Mutable);
  CGColorRelease(v45);
  CGContextAddPath(v4, v10);
  CGContextSetStrokeColorWithColor(v4, v46);
  CGContextStrokePath(v4);
  CGPathRelease(v10);
  CGColorRelease(v46);
  CGContextFlush(v4);
  Image = CGBitmapContextCreateImage(v4);
  v48 = NUDebugQuicklookWrapCGImage((uint64_t)Image);
  CGImageRelease(Image);
  CGContextRelease(v4);

  return v48;
}

- (double)sampleAtTime:(long long *)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    long long v23 = *a3;
    uint64_t v24 = *((void *)a3 + 2);
    uint64_t v6 = [a1 indexOfKeyframeAtOrBeforeTime:&v23];
    uint64_t v7 = [a1 interpolation];
    switch(v7)
    {
      case 2:
        [a1 valueOfKeyframeAtIndex:v6];
        float64x2_t v18 = v8;
        [a1 valueOfKeyframeAtIndex:v6 + 1];
        float64x2_t v16 = v9;
        [a1 tangentOfKeyframeAtIndex:v6];
        float64x2_t v15 = v10;
        [a1 tangentOfKeyframeAtIndex:v6 + 1];
        float64x2_t v14 = v11;
        long long v23 = *a3;
        uint64_t v24 = *((void *)a3 + 2);
        [a1 interpolantAtTime:&v23];
        *(void *)&double result = *(_OWORD *)&vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_laneq_f64(v15, v20, 1), v18, v20.f64[0]), v16, v21.f64[0]), v14, v21, 1);
        break;
      case 1:
        [a1 valueOfKeyframeAtIndex:v6];
        float64x2_t v19 = v12;
        [a1 valueOfKeyframeAtIndex:v6 + 1];
        float64x2_t v17 = v13;
        long long v23 = *a3;
        uint64_t v24 = *((void *)a3 + 2);
        [a1 interpolantAtTime:&v23];
        *(void *)&double result = *(_OWORD *)&vmlaq_n_f64(vmulq_laneq_f64(v17, v22, 1), v19, v22.f64[0]);
        break;
      case 0:
        [a1 valueOfKeyframeAtIndex:v6];
        break;
    }
  }
  else
  {
    [a1 valueOfKeyframeAtIndex:0];
  }
  return result;
}

- (double)tangentOfKeyframeAtIndex:(uint64_t)a3
{
  double result = 0.0;
  uint64_t v4 = a3 - 1;
  if (a3 >= 1)
  {
    uint64_t v7 = objc_msgSend(a1, "count", 0.0);
    double result = 0.0;
    if (v7 - 1 > a3)
    {
      objc_msgSend(a1, "valueOfKeyframeAtIndex:", v4, 0.0);
      float64x2_t v12 = v8;
      uint64_t v9 = a3 + 1;
      [a1 valueOfKeyframeAtIndex:v9];
      float64x2_t v11 = v10;
      memset(&v16[1], 0, sizeof(CMTime));
      [a1 timeOfKeyframeAtIndex:v4];
      memset(v16, 0, 24);
      [a1 timeOfKeyframeAtIndex:v9];
      memset(&v15, 0, sizeof(v15));
      CMTime lhs = v16[0];
      CMTime rhs = v16[1];
      CMTimeSubtract(&v15, &lhs, &rhs);
      if (v15.value < 1) {
        return 0.0;
      }
      else {
        *(void *)&double result = *(_OWORD *)&vdivq_f64(vsubq_f64(v11, v12), (float64x2_t)vdupq_lane_s64(COERCE__INT64(fmax((double)v15.value / (double)v15.timescale, 0.015625)), 0));
      }
    }
  }
  return result;
}

- (double)valueOfKeyframeAtIndex:(uint64_t)a3
{
  if (!*(void *)(a1 + 80)) {
    return 0.0;
  }
  uint64_t v5 = [(id)a1 count] - 1;
  if (v5 >= a3) {
    uint64_t v5 = a3;
  }
  uint64_t v6 = (unsigned __int16 *)(*(void *)(a1 + 80) + 4 * (v5 & ~(v5 >> 63)));
  v7.i64[0] = *v6;
  v7.i64[1] = v6[1];
  *(void *)&double result = *(_OWORD *)&vmlaq_f64(*(float64x2_t *)(a1 + 64), *(float64x2_t *)(a1 + 48), vcvtq_f64_u64(v7));
  return result;
}

- (void)dealloc
{
  v3 = *(void **)self->_values;
  if (v3) {
    free(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)NUKeyframeSequenceDouble2;
  [(NUKeyframeSequence *)&v4 dealloc];
}

- (NUKeyframeSequenceDouble2)initWithKeyframeSequence:(id)a3 values:
{
  uint64_t v4 = v3;
  v7.receiver = self;
  v7.super_class = (Class)NUKeyframeSequenceDouble2;
  uint64_t v5 = [(NUKeyframeSequence *)&v7 initWithKeyframeSequence:a3];
  if ([(NUKeyframeSequence *)v5 count]) {
    [(NUKeyframeSequenceDouble2 *)v5 _compressAndStoreValues:v4 count:[(NUKeyframeSequence *)v5 count]];
  }
  return v5;
}

- (NUKeyframeSequenceDouble2)initWithInterpolation:(int64_t)a3 count:(unint64_t)a4 times:(id *)a5 values:
{
  uint64_t v6 = v5;
  v11.receiver = self;
  v11.super_class = (Class)NUKeyframeSequenceDouble2;
  float64x2_t v8 = [(NUKeyframeSequence *)&v11 initWithInterpolation:a3 count:a4 times:a5];
  uint64_t v9 = v8;
  if (a4) {
    [(NUKeyframeSequenceDouble2 *)v8 _compressAndStoreValues:v6 count:a4];
  }
  return v9;
}

- (void)_compressAndStoreValues:(NUKeyframeSequenceDouble2 *)self count:(SEL)a2
{
  unint64_t v4 = v3;
  uint64_t v5 = v2;
  *(void *)self->_values = malloc_type_calloc(v3, 4uLL, 0x100004052888210uLL);
  float64x2_t v7 = *v5;
  if (v4 < 2)
  {
    float64x2_t v10 = *v5;
  }
  else
  {
    unsigned int v8 = 2;
    unint64_t v9 = 1;
    float64x2_t v10 = *v5;
    do
    {
      float64x2_t v11 = v5[v9];
      float64x2_t v10 = vminnmq_f64(v10, v11);
      float64x2_t v7 = vmaxnmq_f64(v7, v11);
      unint64_t v9 = v8++;
    }
    while (v9 < v4);
  }
  float64x2_t v12 = vsubq_f64(v7, v10);
  float64x2_t v13 = (float64x2_t)vdupq_n_s64(0x40EFFFE000000000uLL);
  *(float64x2_t *)self->_scale = vdivq_f64(v12, v13);
  *(float64x2_t *)self->_bias = v10;
  if (v4)
  {
    uint64_t v14 = 0;
    __asm { FMOV            V3.2D, #1.0 }
    float64x2_t v20 = (float64x2_t)vbslq_s8((int8x16_t)vcgtzq_f64(*(float64x2_t *)self->_scale), (int8x16_t)vdivq_f64(_Q3, *(float64x2_t *)self->_scale), (int8x16_t)_Q3);
    do
    {
      int32x2_t v21 = vmovn_s64(vcvtq_s64_f64(vminnmq_f64(vmaxnmq_f64(vrndaq_f64(vmulq_f64(v20, vsubq_f64(v5[v14], *(float64x2_t *)self->_bias))), (float64x2_t)0), v13)));
      float64x2_t v22 = (_WORD *)(*(void *)self->_values + 4 * v14);
      v22[1] = v21.i16[2];
      *float64x2_t v22 = v21.i16[0];
      ++v14;
    }
    while (v4 > v14);
  }
}

@end