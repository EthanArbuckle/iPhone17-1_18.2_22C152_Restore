@interface RBShape
- (BOOL)EOFill;
- (BOOL)isAntialiased;
- (CGRect)boundingRect;
- (double)_setEmpty;
- (double)_setInfinite;
- (double)renderingModeArgument;
- (float)_setRoundedRect:(double)a3 cornerSize:(float64_t)a4 cornerStyle:(float64_t)a5;
- (id).cxx_construct;
- (uint64_t)shapeData;
- (unint64_t)_setRBPath:(uint64_t)a3 transform:(float64x2_t *)a4;
- (unsigned)renderingMode;
- (void)_setCircleAtPoint:(float64_t)a3 radius:(double)a4;
- (void)_setGlyphs:(float64x2_t *)a3 positions:(unint64_t)a4 count:(const void *)a5 font:(int)a6 renderingStyle:(char)a7 dilation:(__n128)a8 shouldDrawBitmapRuns:(__n128)a9;
- (void)_setRect:(float64_t)a3;
- (void)_setStrokedRBPath:(uint64_t)a3 transform:(float64x2_t *)a4 lineWidth:(unsigned int)a5 lineCap:(CGLineJoin)a6 lineJoin:(double *)a7 miterLimit:(uint64_t)a8 dashPhase:(double)a9 dashPattern:(double)a10 dashCount:(double)a11;
- (void)_xmlAttributes:(double)a3;
- (void)setAntialiased:(BOOL)a3;
- (void)setCustomGlyphDilation:(CGSize)a3;
- (void)setEOFill:(BOOL)a3;
- (void)setEllipseInRect:(CGRect)a3;
- (void)setGlyphs:(const unsigned __int16 *)a3 positions:(const CGPoint *)a4 count:(unint64_t)a5 font:(CGFont *)a6 renderingStyle:(unsigned int)a7;
- (void)setGlyphs:(float64x2_t *)a3 positions:(unint64_t)a4 count:(const void *)a5 font:(int)a6 renderingStyle:(char)a7 dilation:(__n128)a8 shouldDrawBitmapRuns:(__n128)a9;
- (void)setPath:(CGPath *)a3;
- (void)setPath:(CGPath *)a3 transform:(CGAffineTransform *)a4;
- (void)setRBPath:(RBPath)a3 transform:(CGAffineTransform *)a4;
- (void)setRenderingMode:(unsigned int)a3;
- (void)setRenderingModeArgument:(double)a3;
- (void)setRoundedRect:(CGRect)a3 cornerRadii:(id)a4 cornerStyle:(int)a5;
- (void)setRoundedRect:(CGRect)a3 cornerRadius:(double)a4 cornerStyle:(int)a5;
- (void)setRoundedRect:(CGRect)a3 cornerSize:(CGSize)a4 cornerStyle:(int)a5;
- (void)setShouldDrawBitmapRuns:(BOOL)a3;
- (void)setStroke:(id)a3;
- (void)setStrokedCircleAtPoint:(CGPoint)a3 radius:(double)a4 lineWidth:(double)a5;
- (void)setStrokedLineFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 lineWidth:(double)a5 lineCap:(int)a6;
- (void)setStrokedPath:(CGPath *)a3 transform:(CGAffineTransform *)a4 lineWidth:(double)a5 lineCap:(int)a6 lineJoin:(int)a7 miterLimit:(double)a8;
- (void)setStrokedPath:(CGPath *)a3 transform:(CGAffineTransform *)a4 lineWidth:(double)a5 lineCap:(int)a6 lineJoin:(int)a7 miterLimit:(double)a8 dashPhase:(double)a9 dashPattern:(const double *)a10 dashCount:(int64_t)a11;
- (void)setStrokedRBPath:(RBPath)a3 transform:(CGAffineTransform *)a4 lineWidth:(double)a5 lineCap:(int)a6 lineJoin:(int)a7 miterLimit:(double)a8 dashPhase:(double)a9 dashPattern:(const double *)a10 dashCount:(int64_t)a11;
- (void)setStrokedRect:(CGRect)a3 lineWidth:(double)a4;
- (void)setStrokedRoundedRect:(CGRect)a3 cornerRadii:(id)a4 cornerStyle:(int)a5 lineWidth:(double)a6;
- (void)setStrokedRoundedRect:(CGRect)a3 cornerRadius:(double)a4 cornerStyle:(int)a5 lineWidth:(double)a6;
@end

@implementation RBShape

- (id).cxx_construct
{
  self->_data.type = 0;
  RB::Heap::Heap((RB::Heap *)&self->_heap, (char *)self->_heap._buffer, 256, 0);
  return self;
}

- (void).cxx_destruct
{
  self->_data.type = 0;
}

- (uint64_t)shapeData
{
  if (a1) {
    return a1 + 16;
  }
  else {
    return 0;
  }
}

- (void)setRBPath:(RBPath)a3 transform:(CGAffineTransform *)a4
{
  float64x2_t v4 = *(float64x2_t *)&a4->c;
  float64x2_t v5 = *(float64x2_t *)&a4->tx;
  v6[0] = *(float64x2_t *)&a4->a;
  v6[1] = v4;
  v6[2] = v5;
  [(RBShape *)(unint64_t)self _setRBPath:(uint64_t)a3.callbacks transform:v6];
}

- (unint64_t)_setRBPath:(uint64_t)a3 transform:(float64x2_t *)a4
{
  if (result)
  {
    unint64_t v7 = result;
    int64x2_t v8 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(a4[1], (float64x2_t)xmmword_2142181D0), (int8x16_t)vceqq_f64(*a4, (float64x2_t)xmmword_2142181C0)), (int8x16_t)vceqzq_f64(a4[2]));
    unint64_t v9 = vandq_s8((int8x16_t)vdupq_laneq_s64(v8, 1), (int8x16_t)v8).u64[0];
    unint64_t v10 = v9;
    v11 = (int *)(result + 16);
    if (*(_DWORD *)(result + 16) != 2
      || *(void *)(result + 32) != a2
      || *(void *)(result + 40) != a3
      || (v19 = (float64x2_t *)((unint64_t)a4 & ~v9), v20 = *(float64x2_t **)(result + 48), v20 != v19)
      && ((v9 & 0x8000000000000000) != 0
       || !v20
       || (int64x2_t v21 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(v20[1], *(float64x2_t *)(((unint64_t)a4 & ~v9) + 0x10)), (int8x16_t)vceqq_f64(*v20, *v19)), (int8x16_t)vceqq_f64(v20[2], *(float64x2_t *)(((unint64_t)a4 & ~v9) + 0x20))), (vandq_s8((int8x16_t)vdupq_laneq_s64(v21, 1), (int8x16_t)v21).u64[0] & 0x8000000000000000) == 0)))
    {
      RB::Heap::reset((RB::Heap *)(result + 128), (char *)(result + 168), 256);
      char v12 = *(unsigned char *)(v7 + 424);
      int v13 = *(_DWORD *)(v7 + 428);
      RBShapeData::apply<RB::DestroyAny>(v11);
      *(_DWORD *)(v7 + 16) = 0;
      double v14 = *(double *)(v7 + 432);
      *(void *)(v7 + 32) = RBPathRetain(a2, a3);
      *(void *)(v7 + 40) = v15;
      if ((v10 & 0x8000000000000000) != 0)
      {
        result = 0;
      }
      else
      {
        result = (*(void *)(v7 + 144) + 15) & 0xFFFFFFFFFFFFFFF0;
        if (result + 48 > *(void *)(v7 + 152)) {
          result = RB::Heap::alloc_slow((size_t *)(v7 + 128), 0x30uLL, 15);
        }
        else {
          *(void *)(v7 + 144) = result + 48;
        }
        float64x2_t v16 = *a4;
        float64x2_t v17 = a4[2];
        *(float64x2_t *)(result + 16) = a4[1];
        *(float64x2_t *)(result + 32) = v17;
        *(float64x2_t *)result = v16;
      }
      float v18 = v14;
      *(void *)(v7 + 48) = result;
      *(float *)(v7 + 56) = v18;
      *(unsigned char *)(v7 + 60) = v12;
      *(unsigned char *)(v7 + 61) = v13;
      *(_DWORD *)(v7 + 16) = 2;
    }
  }
  return result;
}

- (void)setEOFill:(BOOL)a3
{
  if (self->_eoFill != a3)
  {
    self->_eoFill = a3;
    if (self->_data.type == 2) {
      self->_data.data[40] = a3;
    }
  }
}

- (void)setRenderingMode:(unsigned int)a3
{
  if (self->_renderingMode != a3)
  {
    self->_renderingMode = a3;
    RBShapeData::set_rendering_mode((uint64_t)&self->_data, a3);
  }
}

- (void)setGlyphs:(float64x2_t *)a3 positions:(unint64_t)a4 count:(const void *)a5 font:(int)a6 renderingStyle:(char)a7 dilation:(__n128)a8 shouldDrawBitmapRuns:(__n128)a9
{
  if (a1) {
    [(RBShape *)a1 _setGlyphs:a3 positions:a4 count:a5 font:a6 renderingStyle:a7 dilation:a8 shouldDrawBitmapRuns:a9];
  }
}

- (unsigned)renderingMode
{
  return self->_renderingMode;
}

- (void)_setGlyphs:(float64x2_t *)a3 positions:(unint64_t)a4 count:(const void *)a5 font:(int)a6 renderingStyle:(char)a7 dilation:(__n128)a8 shouldDrawBitmapRuns:(__n128)a9
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (a1 && !HIDWORD(a4))
  {
    __n128 v25 = a8;
    __n128 v26 = a9;
    if (a4 > 0x200)
    {
      float64x2_t v17 = (float32x2_t *)malloc_type_malloc(8 * a4, 0x676B4AC8uLL);
      if (!v17)
      {
LABEL_10:
        free(v17);
        return;
      }
    }
    else
    {
      MEMORY[0x270FA5388](a1, 8 * a4);
      float64x2_t v17 = (float32x2_t *)((char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
      bzero(v17, v16);
    }
    if (a4)
    {
      float v18 = v17;
      unint64_t v19 = a4;
      do
      {
        float64x2_t v20 = *a3++;
        *v18++ = vcvt_f32_f64(v20);
        --v19;
      }
      while (v19);
    }
    RB::Heap::reset((RB::Heap *)(a1 + 128), (char *)(a1 + 168), 256);
    *(void *)&v21.f64[0] = v25.n128_u64[0];
    *(void *)&v21.f64[1] = v26.n128_u64[0];
    double v22 = COERCE_DOUBLE(vcvt_f32_f64(v21));
    char v23 = *(unsigned char *)(a1 + 428);
    RBShapeData::apply<RB::DestroyAny>((int *)(a1 + 16));
    *(_DWORD *)(a1 + 16) = 0;
    float v24 = *(double *)(a1 + 432);
    RB::Coverage::Glyphs::Glyphs(a1 + 32, (RB::Heap *)(a1 + 128), a5, a4, (const void *)size, v17, a6, v23, v22, v24, a7);
    *(_DWORD *)(a1 + 16) = 4;
    if (a4 >= 0x201) {
      goto LABEL_10;
    }
  }
}

- (void)_setRect:(float64_t)a3
{
  if (a1)
  {
    BOOL IsInfinite = CGRectIsInfinite(*(CGRect *)&a2);
    unint64_t v7 = (int *)(a1 + 16);
    if (IsInfinite)
    {
      RBShapeData::apply<RB::DestroyAny>(v7);
      *(void *)(a1 + 32) = 0x100000001000000;
      int32x2_t v8 = vdup_n_s32(0x7F7FFFFFu);
      char v9 = 1;
      float v10 = 0.0;
      LOBYTE(v11) = 1;
    }
    else
    {
      v12.f64[0] = a2;
      v12.f64[1] = a3;
      float32x2_t v13 = vcvt_f32_f64(v12);
      v12.f64[0] = a4;
      v12.f64[1] = a5;
      int32x2_t v8 = (int32x2_t)vcvt_f32_f64(v12);
      int v11 = *(_DWORD *)(a1 + 428);
      RBShapeData::apply<RB::DestroyAny>(v7);
      float v10 = *(double *)(a1 + 432);
      *(float32x2_t *)(a1 + 32) = v13;
      char v9 = 2;
    }
    *(int32x2_t *)(a1 + 40) = v8;
    *(void *)(a1 + 48) = 0;
    *(void *)(a1 + 56) = 0;
    *(void *)(a1 + 64) = 1065353216;
    *(float *)(a1 + 72) = v10;
    *(unsigned char *)(a1 + 76) = v9;
    *(unsigned char *)(a1 + 77) = v11;
    *(unsigned char *)(a1 + 78) &= 0xF8u;
    *(_DWORD *)(a1 + 16) = 1;
  }
}

- (void)setRoundedRect:(CGRect)a3 cornerSize:(CGSize)a4 cornerStyle:(int)a5
{
}

- (void)setEllipseInRect:(CGRect)a3
{
  CGFloat v4 = a3.size.width / a3.size.height;
  double v5 = 1.0 / (a3.size.width / a3.size.height);
  v6.f64[0] = v5 * a3.origin.x;
  v7.f64[0] = v5 * a3.size.width;
  v6.f64[1] = a3.origin.y;
  float32x2_t v8 = vcvt_f32_f64(v6);
  v7.f64[1] = a3.size.height;
  float32x2_t v9 = vcvt_f32_f64(v7);
  v6.f64[0] = a3.size.height * 0.5;
  *(float *)v6.f64 = a3.size.height * 0.5;
  int32x4_t v13 = vdupq_lane_s32(*(int32x2_t *)&v6.f64[0], 0);
  unsigned int renderingMode = self->_renderingMode;
  RBShapeData::apply<RB::DestroyAny>(&self->_data.type);
  float v11 = v4;
  float renderingModeArgument = self->_renderingModeArgument;
  *(float32x2_t *)&self->_data.data[12] = v8;
  *(float32x2_t *)&self->_data.data[20] = v9;
  *(int32x4_t *)&self->_data.data[28] = v13;
  *(float *)&self->_data.data[44] = v11;
  *(_DWORD *)&self->_data.data[48] = 0;
  *(float *)&self->_data.data[52] = renderingModeArgument;
  self->_data.data[56] = 5;
  self->_data.data[57] = renderingMode;
  self->_data.data[58] &= 0xF8u;
  self->_data.type = 1;
}

- (float)_setRoundedRect:(double)a3 cornerSize:(float64_t)a4 cornerStyle:(float64_t)a5
{
  if (a1)
  {
    double v14 = a3;
    if (CGRectIsInfinite(*(CGRect *)&a3))
    {
      RBShapeData::apply<RB::DestroyAny>((int *)&a1[2]);
      a1[4] = (int32x2_t)0x100000001000000;
      a1[5] = vdup_n_s32(0x7F7FFFFFu);
      a1[6] = 0;
      a1[7] = 0;
      LODWORD(a3) = 1065353216;
      a1[8] = (int32x2_t)1065353216;
      a1[9].i32[0] = 0;
      a1[9].i16[2] = 257;
      a1[9].i8[6] &= 0xF8u;
      a1[2].i32[0] = 1;
    }
    else
    {
      v16.f64[0] = v14;
      v17.f64[0] = a5;
      *(float *)&a3 = set_rounded_rect((uint64_t)a1, a2, v16, a4, v17, a6, a7, a8, 0.0);
    }
  }
  return *(float *)&a3;
}

- (void)_xmlAttributes:(double)a3
{
  if (a1)
  {
    switch(a1[1].i32[0])
    {
      case 1:
        RB::Coverage::Primitive::attributes(a1 + 2, a2, a3, a4, a5);
        break;
      case 2:
        RB::Coverage::Path::attributes((RB::Coverage::Path *)&a1[2], a2);
      case 3:
        RB::Coverage::StrokeablePath::attributes(&a1[2].i64[1]);
      case 4:
        RB::Coverage::Glyphs::attributes((float **)&a1[2], a2);
      case 5:
        RBStrokeRef::attributes((id *)&a1[2].i64[1]);
        break;
      default:
        return;
    }
  }
}

- (CGRect)boundingRect
{
  switch(self->_data.type)
  {
    case 1:
      long long v11 = xmmword_2142181C0;
      long long v12 = xmmword_2142181D0;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      *(float32x2_t *)&double v4 = RB::Coverage::Primitive::bounds((float32x2_t *)&self->_data.data[12], (float64x2_t *)&v11, (int8x16_t)xmmword_2142181C0, (int32x4_t)xmmword_2142181D0, v2, v3);
      break;
    case 2:
      v15.info = &self->_data.data[12];
      long long v11 = xmmword_2142181C0;
      long long v12 = xmmword_2142181D0;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      v15.callbacks = (RBPathCallbacks *)&v11;
      double v4 = RB::Coverage::Path::bounds(v15);
      break;
    case 3:
      long long v11 = xmmword_2142181C0;
      long long v12 = xmmword_2142181D0;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      *(float32x2_t *)&double v4 = RB::Coverage::Stroke<RB::Coverage::StrokeablePath>::bounds((uint64_t)&self->_data.data[12], (float64x2_t *)&v11, 1.0, (int32x4_t)xmmword_2142181D0);
      break;
    case 4:
      long long v11 = xmmword_2142181C0;
      long long v12 = xmmword_2142181D0;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      double v4 = RB::Coverage::Glyphs::bounds((RB::Coverage::Glyphs *)&self->_data.data[12], (float64x2_t *)&v11, 0);
      break;
    case 5:
      long long v11 = xmmword_2142181C0;
      long long v12 = xmmword_2142181D0;
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      *(float32x2_t *)&double v4 = RB::Coverage::Stroke<RBStrokeRef>::bounds(&self->_data.data[12], (float64x2_t *)&v11, 1.0, (int32x4_t)xmmword_2142181D0);
      break;
    default:
      float32x2_t v5 = 0;
      double v4 = 0.0;
      break;
  }
  double v6 = *((float *)&v4 + 1);
  double v7 = v5.f32[0];
  double v8 = v5.f32[1];
  double v9 = *(float *)&v4;
  double v10 = v6;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (BOOL)isAntialiased
{
  return self->_renderingMode != 1;
}

- (void)setAntialiased:(BOOL)a3
{
  BOOL v3 = !a3;
  if (self->_renderingMode != !a3)
  {
    self->_unsigned int renderingMode = v3;
    RBShapeData::set_rendering_mode((uint64_t)&self->_data, v3);
  }
}

- (void)setRenderingModeArgument:(double)a3
{
  if (self->_renderingModeArgument != a3)
  {
    self->_float renderingModeArgument = a3;
    int type = self->_data.type;
    switch(type)
    {
      case 1:
        uint64_t v4 = 72;
        break;
      case 4:
        uint64_t v4 = 80;
        break;
      case 2:
        uint64_t v4 = 56;
        break;
      default:
        return;
    }
    float v5 = a3;
    *(float *)((char *)&self->super.isa + v4) = v5;
  }
}

- (double)_setInfinite
{
  if (a1)
  {
    RBShapeData::apply<RB::DestroyAny>((int *)&a1[2]);
    a1[4] = (int32x2_t)0x100000001000000;
    a1[5] = vdup_n_s32(0x7F7FFFFFu);
    a1[6] = 0;
    a1[7] = 0;
    *(void *)&double result = 1065353216;
    a1[8] = (int32x2_t)1065353216;
    a1[9].i32[0] = 0;
    a1[9].i16[2] = 257;
    a1[9].i8[6] &= 0xF8u;
    a1[2].i32[0] = 1;
  }
  return result;
}

- (double)_setEmpty
{
  if (a1)
  {
    RBShapeData::apply<RB::DestroyAny>((int *)(a1 + 16));
    double result = 0.0;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_DWORD *)(a1 + 64) = 1065353216;
    *(void *)(a1 + 68) = 0;
    *(_WORD *)(a1 + 76) = 256;
    *(unsigned char *)(a1 + 78) &= 0xF8u;
    *(_DWORD *)(a1 + 16) = 1;
  }
  return result;
}

- (void)setStrokedRect:(CGRect)a3 lineWidth:(double)a4
{
  if (a4 <= 0.0)
  {
    -[RBShape _setEmpty]((uint64_t)self);
  }
  else
  {
    if (a3.size.width >= a3.size.height) {
      double width = a3.size.width;
    }
    else {
      double width = a3.size.height;
    }
    if (width <= a4)
    {
      CGRect v15 = CGRectInset(a3, a4 * -0.5, a4 * -0.5);
      -[RBShape _setRect:]((uint64_t)self, v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
    }
    else
    {
      CGFloat y = a3.origin.y;
      float32x2_t v8 = vcvt_f32_f64((float64x2_t)a3.origin);
      CGFloat height = a3.size.height;
      float32x2_t v10 = vcvt_f32_f64((float64x2_t)a3.size);
      unsigned int renderingMode = self->_renderingMode;
      RBShapeData::apply<RB::DestroyAny>(&self->_data.type);
      float v12 = a4;
      float renderingModeArgument = self->_renderingModeArgument;
      *(float32x2_t *)&self->_data.data[12] = v8;
      *(float32x2_t *)&self->_data.data[20] = v10;
      *(void *)&self->_data.data[28] = 0;
      *(void *)&self->_data.data[36] = 0;
      *(_DWORD *)&self->_data.data[44] = 1065353216;
      *(float *)&self->_data.data[48] = v12;
      *(float *)&self->_data.data[52] = renderingModeArgument;
      self->_data.data[56] = 2;
      self->_data.data[57] = renderingMode;
      self->_data.data[58] &= 0xF8u;
      self->_data.int type = 1;
    }
  }
}

- (void)setRoundedRect:(CGRect)a3 cornerRadius:(double)a4 cornerStyle:(int)a5
{
}

- (void)setRoundedRect:(CGRect)a3 cornerRadii:(id)a4 cornerStyle:(int)a5
{
  double var3 = a4.var3;
  double var2 = a4.var2;
  double var1 = a4.var1;
  double var0 = a4.var0;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (CGRectIsInfinite(a3))
  {
    -[RBShape _setInfinite]((int32x2_t *)self);
  }
  else
  {
    set_rounded_rect((uint64_t)self, a5, x, y, width, height, var0, var1, var2, var3, 0.0);
  }
}

- (void)setStrokedRoundedRect:(CGRect)a3 cornerRadius:(double)a4 cornerStyle:(int)a5 lineWidth:(double)a6
{
  if (a6 <= 0.0)
  {
LABEL_4:
    -[RBShape _setEmpty]((uint64_t)self);
    return;
  }
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (CGRectIsInfinite(a3))
  {
    if ((*(void *)&a6 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL) {
      goto LABEL_4;
    }
    -[RBShape _setInfinite]((int32x2_t *)self);
  }
  else
  {
    v14.f64[0] = x;
    v15.f64[0] = width;
    set_rounded_rect((uint64_t)self, a5, v14, y, v15, height, a4, a4, a6);
  }
}

- (void)setStrokedRoundedRect:(CGRect)a3 cornerRadii:(id)a4 cornerStyle:(int)a5 lineWidth:(double)a6
{
  if (a6 <= 0.0)
  {
LABEL_4:
    -[RBShape _setEmpty]((uint64_t)self);
    return;
  }
  double var2 = a4.var2;
  double var1 = a4.var1;
  double var0 = a4.var0;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double var3 = a4.var3;
  if (CGRectIsInfinite(a3))
  {
    if ((*(void *)&a6 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL) {
      goto LABEL_4;
    }
    -[RBShape _setInfinite]((int32x2_t *)self);
  }
  else
  {
    set_rounded_rect((uint64_t)self, a5, x, y, width, height, var0, var1, var2, var3, a6);
  }
}

- (void)_setCircleAtPoint:(float64_t)a3 radius:(double)a4
{
  if (a1)
  {
    if (a4 <= 0.0)
    {
      RBShapeData::apply<RB::DestroyAny>((int *)(a1 + 16));
      *(_OWORD *)(a1 + 32) = 0u;
      *(_OWORD *)(a1 + 48) = 0u;
      *(_DWORD *)(a1 + 64) = 1065353216;
      *(void *)(a1 + 68) = 0;
      *(_WORD *)(a1 + 76) = 256;
    }
    else
    {
      a2.f64[1] = a3;
      float32x2_t v5 = vcvt_f32_f64(vsubq_f64(a2, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a4, 0)));
      double v6 = a4 + a4;
      *(float *)&double v6 = a4 + a4;
      int32x2_t v7 = vdup_lane_s32(*(int32x2_t *)&v6, 0);
      int v8 = *(_DWORD *)(a1 + 428);
      RBShapeData::apply<RB::DestroyAny>((int *)(a1 + 16));
      v9.i32[1] = HIDWORD(a4);
      *(float *)v9.i32 = a4;
      float v10 = *(double *)(a1 + 432);
      *(float32x2_t *)(a1 + 32) = v5;
      *(int32x2_t *)(a1 + 40) = v7;
      *(int32x4_t *)(a1 + 48) = vdupq_lane_s32(v9, 0);
      *(void *)(a1 + 64) = 1065353216;
      *(float *)(a1 + 72) = v10;
      *(unsigned char *)(a1 + 76) = 5;
      *(unsigned char *)(a1 + 77) = v8;
    }
    *(unsigned char *)(a1 + 78) &= 0xF8u;
    *(_DWORD *)(a1 + 16) = 1;
  }
}

- (void)setStrokedCircleAtPoint:(CGPoint)a3 radius:(double)a4 lineWidth:(double)a5
{
  if (a5 <= 0.0)
  {
    -[RBShape _setEmpty]((uint64_t)self);
  }
  else
  {
    double v7 = a5 * 0.5;
    if (v7 >= a4)
    {
      double v16 = v7 + a4;
      [(RBShape *)(uint64_t)self _setCircleAtPoint:a3.y radius:v16];
    }
    else
    {
      CGFloat y = a3.y;
      float32x2_t v9 = vcvt_f32_f64(vsubq_f64((float64x2_t)a3, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a4, 0)));
      double v10 = a4 + a4;
      *(float *)&double v10 = a4 + a4;
      int32x2_t v11 = vdup_lane_s32(*(int32x2_t *)&v10, 0);
      unsigned int renderingMode = self->_renderingMode;
      RBShapeData::apply<RB::DestroyAny>(&self->_data.type);
      v13.i32[1] = HIDWORD(a4);
      *(float *)v13.i32 = a4;
      float v14 = a5;
      float renderingModeArgument = self->_renderingModeArgument;
      *(float32x2_t *)&self->_data.data[12] = v9;
      *(int32x2_t *)&self->_data.data[20] = v11;
      *(int32x4_t *)&self->_data.data[28] = vdupq_lane_s32(v13, 0);
      *(_DWORD *)&self->_data.data[44] = 1065353216;
      *(float *)&self->_data.data[48] = v14;
      *(float *)&self->_data.data[52] = renderingModeArgument;
      self->_data.data[56] = 5;
      self->_data.data[57] = renderingMode;
      self->_data.data[58] &= 0xF8u;
      self->_data.int type = 1;
    }
  }
}

- (void)setStrokedLineFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 lineWidth:(double)a5 lineCap:(int)a6
{
  if (a5 <= 0.0)
  {
    -[RBShape _setEmpty]((uint64_t)self);
  }
  else
  {
    double y = a4.y;
    double x = a4.x;
    if (a6 == 1) {
      char v11 = 7;
    }
    else {
      char v11 = 8;
    }
    double v19 = a3.x;
    double v20 = a3.y;
    BOOL v12 = rb_clip_mode(LOBYTE(self->_renderingMode));
    v13.f64[0] = v19;
    v13.f64[1] = v20;
    float32x2_t v14 = vcvt_f32_f64(v13);
    *(float *)&unint64_t v15 = x - v19;
    *(float *)v13.f64 = y - v20;
    HIDWORD(v15) = LODWORD(v13.f64[0]);
    unint64_t v21 = v15;
    RBShapeData::apply<RB::DestroyAny>(&self->_data.type);
    float v16 = a5;
    float renderingModeArgument = self->_renderingModeArgument;
    *(float32x2_t *)&self->_data.data[12] = v14;
    *(_OWORD *)&self->_data.data[20] = v21;
    *(void *)&self->_data.data[36] = 0;
    *(_DWORD *)&self->_data.data[44] = 1065353216;
    *(float *)&self->_data.data[48] = v16;
    *(float *)&self->_data.data[52] = renderingModeArgument;
    if (a6) {
      unsigned __int8 v18 = v11;
    }
    else {
      unsigned __int8 v18 = 6;
    }
    self->_data.data[56] = v18;
    self->_data.data[57] = v12;
    self->_data.data[58] &= 0xF8u;
    self->_data.int type = 1;
  }
}

- (void)setPath:(CGPath *)a3
{
  v3[0] = (float64x2_t)xmmword_2142181C0;
  v3[1] = (float64x2_t)xmmword_2142181D0;
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  [(RBShape *)(unint64_t)self _setRBPath:(uint64_t)&RBPathCGPathCallbacks transform:v3];
}

- (void)setPath:(CGPath *)a3 transform:(CGAffineTransform *)a4
{
  float64x2_t v4 = *(float64x2_t *)&a4->c;
  float64x2_t v5 = *(float64x2_t *)&a4->tx;
  v6[0] = *(float64x2_t *)&a4->a;
  v6[1] = v4;
  v6[2] = v5;
  [(RBShape *)(unint64_t)self _setRBPath:(uint64_t)&RBPathCGPathCallbacks transform:v6];
}

- (void)setStrokedPath:(CGPath *)a3 transform:(CGAffineTransform *)a4 lineWidth:(double)a5 lineCap:(int)a6 lineJoin:(int)a7 miterLimit:(double)a8 dashPhase:(double)a9 dashPattern:(const double *)a10 dashCount:(int64_t)a11
{
  float64x2_t v11 = *(float64x2_t *)&a4->c;
  float64x2_t v12 = *(float64x2_t *)&a4->tx;
  v13[0] = *(float64x2_t *)&a4->a;
  v13[1] = v11;
  v13[2] = v12;
  [(RBShape *)(uint64_t)self _setStrokedRBPath:(uint64_t)&RBPathCGPathCallbacks transform:v13 lineWidth:a6 lineCap:(CGLineJoin)a7 lineJoin:(double *)a10 miterLimit:a11 dashPhase:a5 dashPattern:a8 dashCount:a9];
}

- (void)_setStrokedRBPath:(uint64_t)a3 transform:(float64x2_t *)a4 lineWidth:(unsigned int)a5 lineCap:(CGLineJoin)a6 lineJoin:(double *)a7 miterLimit:(uint64_t)a8 dashPhase:(double)a9 dashPattern:(double)a10 dashCount:(double)a11
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  if (!a1) {
    return;
  }
  if (a9 <= 0.0)
  {
    RBShapeData::apply<RB::DestroyAny>((int *)(a1 + 16));
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_DWORD *)(a1 + 64) = 1065353216;
    *(void *)(a1 + 68) = 0;
    *(_WORD *)(a1 + 76) = 256;
    *(unsigned char *)(a1 + 78) &= 0xF8u;
    *(_DWORD *)(a1 + 16) = 1;
    return;
  }
  int v21 = rb_line_cap(a5);
  uint64_t v22 = rb_line_join(a6);
  int v23 = v22;
  uint64_t v24 = a8 << (a8 & 1);
  BOOL v25 = a8 < 0;
  if (a8 >= 0) {
    unint64_t v26 = a8 << (a8 & 1);
  }
  else {
    unint64_t v26 = -v24;
  }
  if (a8 >= 0) {
    size_t v27 = 4 * v26;
  }
  else {
    size_t v27 = -4 * v26;
  }
  if (!(4 * v26)) {
    BOOL v25 = 0;
  }
  if (!(v26 >> 62) && !v25)
  {
    int v51 = v21;
    if (v27 <= 0x1000)
    {
      MEMORY[0x270FA5388](v22, v27);
      v29 = (char *)&v50 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v29, v40);
      int v21 = 0;
      if (a8) {
        goto LABEL_15;
      }
    }
    else
    {
      v29 = (char *)malloc_type_malloc(v27, 0x2524D8A0uLL);
      int v21 = 1;
      if (a8)
      {
LABEL_15:
        if (!v29)
        {
          if (!v21) {
            return;
          }
          goto LABEL_39;
        }
        uint64_t v30 = 8 * a8;
        uint64_t v31 = 8 * a8;
        v32 = (float *)v29;
        v33 = a7;
        do
        {
          double v34 = *v33++;
          float v35 = v34;
          *v32++ = v35;
          v31 -= 8;
        }
        while (v31);
        if (v24 != a8)
        {
          v36 = (float *)&v29[4 * a8];
          do
          {
            double v37 = *a7++;
            float v38 = v37;
            *v36++ = v38;
            v30 -= 8;
          }
          while (v30);
        }
        if (RB::Stroke::Dasher::prepare_pattern(a8 << (a8 & 1), v29, v28)) {
          uint64_t v39 = a8 << (a8 & 1);
        }
        else {
          uint64_t v39 = 0;
        }
        goto LABEL_29;
      }
    }
    uint64_t v39 = 0;
LABEL_29:
    LODWORD(a8) = v21;
    LOBYTE(v21) = v51;
    goto LABEL_30;
  }
  if (a8) {
    return;
  }
  v29 = 0;
  uint64_t v39 = 0;
LABEL_30:
  if (v23) {
    BOOL v41 = 1;
  }
  else {
    BOOL v41 = a10 > 0.0;
  }
  if (!v41) {
    LOBYTE(v23) = 2;
  }
  int64x2_t v42 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(a4[1], (float64x2_t)xmmword_2142181D0), (int8x16_t)vceqq_f64(*a4, (float64x2_t)xmmword_2142181C0)), (int8x16_t)vceqzq_f64(a4[2]));
  if (vandq_s8((int8x16_t)vdupq_laneq_s64(v42, 1), (int8x16_t)v42).i64[0] >= 0) {
    v43 = a4;
  }
  else {
    v43 = 0;
  }
  RB::Heap::reset((RB::Heap *)(a1 + 128), (char *)(a1 + 168), 256);
  uint64_t v44 = RBPathRetain(a2, a3);
  float v45 = a9;
  float v46 = a11;
  uint64_t v52 = v44;
  uint64_t v53 = v47;
  v54 = v43;
  float v55 = v45;
  float v56 = v46;
  uint64_t v57 = v39;
  v58 = v29;
  BOOL v48 = rb_clip_mode(*(unsigned __int8 *)(a1 + 428));
  RBShapeData::apply<RB::DestroyAny>((int *)(a1 + 16));
  *(_DWORD *)(a1 + 16) = 0;
  *(void *)(a1 + 32) = &unk_26C4EDD48;
  RB::Coverage::StrokeablePath::StrokeablePath(a1 + 40, &v52, a1 + 128);
  float v49 = a10;
  *(void *)(a1 + 88) = 0x100000001000000;
  *(int32x2_t *)(a1 + 96) = vdup_n_s32(0x7F7FFFFFu);
  *(unsigned char *)(a1 + 104) = 0;
  *(unsigned char *)(a1 + 105) = v21;
  *(unsigned char *)(a1 + 106) = v23;
  *(unsigned char *)(a1 + 107) = 15;
  *(unsigned char *)(a1 + 108) = v48;
  *(float *)(a1 + 112) = v49;
  *(_DWORD *)(a1 + 16) = 3;
  RBPathRelease(v52, v53);
  if (a8) {
LABEL_39:
  }
    free(v29);
}

- (void)setStrokedPath:(CGPath *)a3 transform:(CGAffineTransform *)a4 lineWidth:(double)a5 lineCap:(int)a6 lineJoin:(int)a7 miterLimit:(double)a8
{
  float64x2_t v8 = *(float64x2_t *)&a4->c;
  float64x2_t v9 = *(float64x2_t *)&a4->tx;
  v10[0] = *(float64x2_t *)&a4->a;
  v10[1] = v8;
  v10[2] = v9;
  [(RBShape *)(uint64_t)self _setStrokedRBPath:(uint64_t)&RBPathCGPathCallbacks transform:v10 lineWidth:a6 lineCap:(CGLineJoin)a7 lineJoin:0 miterLimit:0 dashPhase:a5 dashPattern:a8 dashCount:0.0];
}

- (void)setStrokedRBPath:(RBPath)a3 transform:(CGAffineTransform *)a4 lineWidth:(double)a5 lineCap:(int)a6 lineJoin:(int)a7 miterLimit:(double)a8 dashPhase:(double)a9 dashPattern:(const double *)a10 dashCount:(int64_t)a11
{
  float64x2_t v11 = *(float64x2_t *)&a4->c;
  float64x2_t v12 = *(float64x2_t *)&a4->tx;
  v13[0] = *(float64x2_t *)&a4->a;
  v13[1] = v11;
  v13[2] = v12;
  [(RBShape *)(uint64_t)self _setStrokedRBPath:(uint64_t)a3.callbacks transform:v13 lineWidth:a6 lineCap:(CGLineJoin)a7 lineJoin:(double *)a10 miterLimit:a11 dashPhase:a5 dashPattern:a8 dashCount:a9];
}

- (void)setGlyphs:(const unsigned __int16 *)a3 positions:(const CGPoint *)a4 count:(unint64_t)a5 font:(CGFont *)a6 renderingStyle:(unsigned int)a7
{
  v7.n128_u64[0] = *MEMORY[0x263F001B0];
  v8.n128_u64[0] = *(void *)(MEMORY[0x263F001B0] + 8);
  [(RBShape *)(uint64_t)self _setGlyphs:(float64x2_t *)a4 positions:a5 count:a6 font:a7 renderingStyle:0 dilation:v7 shouldDrawBitmapRuns:v8];
}

- (void)setCustomGlyphDilation:(CGSize)a3
{
  if (self->_data.type == 4)
  {
    CGFloat height = a3.height;
    *(float32x2_t *)&self->_data.data[36] = vcvt_f32_f64((float64x2_t)a3);
  }
}

- (void)setShouldDrawBitmapRuns:(BOOL)a3
{
  if (self->_data.type == 4) {
    self->_data.data[65] = self->_data.data[65] & 0xFE | a3;
  }
}

- (void)setStroke:(id)a3
{
  int v5 = [a3 strokeType];
  unsigned __int8 v6 = v5;
  if (v5)
  {
    if (v5 != 1) {
      abort();
    }
    unsigned __int8 v7 = rb_alpha_blend_mode([a3 blendMode]);
    unsigned __int8 v8 = 0;
    unsigned __int8 v9 = 1;
    float v10 = 10.0;
  }
  else
  {
    unsigned __int8 v8 = rb_line_cap([a3 lineCap]);
    int v11 = rb_line_join((CGLineJoin)[a3 lineJoin]);
    [a3 miterLimit];
    float v10 = v12;
    if (v12 <= 0.0 && v11 == 0) {
      unsigned __int8 v9 = 2;
    }
    else {
      unsigned __int8 v9 = v11;
    }
    unsigned __int8 v7 = 15;
  }
  RB::Heap::reset((RB::Heap *)&self->_heap, (char *)self->_heap._buffer, 256);
  id v14 = a3;
  BOOL v15 = rb_clip_mode(LOBYTE(self->_renderingMode));
  RBShapeData::apply<RB::DestroyAny>(&self->_data.type);
  self->_data.int type = 0;
  *(void *)&self->_data.data[12] = &unk_26C4EDD28;
  *(void *)&self->_data.data[20] = v14;
  *(void *)&self->_data.data[28] = 0x100000001000000;
  *(int32x2_t *)&self->_data.data[36] = vdup_n_s32(0x7F7FFFFFu);
  self->_data.data[44] = v6;
  self->_data.data[45] = v8;
  self->_data.data[46] = v9;
  self->_data.data[47] = v7;
  self->_data.data[48] = v15;
  *(float *)&self->_data.data[52] = v10;
  self->_data.int type = 5;
}

- (BOOL)EOFill
{
  return self->_eoFill;
}

- (double)renderingModeArgument
{
  return self->_renderingModeArgument;
}

@end