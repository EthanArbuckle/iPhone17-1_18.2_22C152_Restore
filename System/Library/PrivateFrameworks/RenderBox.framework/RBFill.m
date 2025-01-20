@interface RBFill
- (__int16)_setColor:(float)_S0@<S0> colorSpace:(float)a4@<S1>;
- (id).cxx_construct;
- (uint64_t)_setAngularGradientCenter:(float *)a3 startAngle:(unsigned int)a4 endAngle:(uint64_t)a5 stopCount:(int)a6 colors:(float64_t)a7 colorSpace:(float64_t)a8 locations:(double)a9 flags:(double)a10;
- (uint64_t)_setAxialGradientStartPoint:(float *)a3 endPoint:(unsigned int)a4 stopCount:(uint64_t)a5 colors:(int)a6 colorSpace:(float64_t)a7 locations:(float64_t)a8 flags:(float64_t)a9;
- (uint64_t)_setConicGradientCenter:(float *)a3 angle:(unsigned int)a4 stopCount:(uint64_t)a5 colors:(int)a6 colorSpace:(float64_t)a7 locations:(float64_t)a8 flags:(double)a9;
- (uint64_t)_setRBImage:(const void *)a3 transform:(float64x2_t *)a4 interpolation:(unsigned int)a5 tintColor:(unsigned int)a6 colorSpace:(__int16)a7 flags:(float)_S0;
- (uint64_t)_setRadialGradientStartCenter:(float *)a3 startRadius:(unsigned int)a4 endCenter:(uint64_t)a5 endRadius:(int)a6 stopCount:(float64_t)a7 colors:(float64_t)a8 colorSpace:(double)a9 locations:(float64_t)a10 flags:(float64_t)a11;
- (uint64_t)_xmlAttributes:(uint64_t)result;
- (unint64_t)_set9PartRBImage:(const void *)a3 transform:(float64x2_t *)a4 destinationRect:(int)a5 capInsets:(unsigned int)a6 repeat:(unsigned int)a7 interpolation:(__int16)a8 tintColor:(float64_t)a9 colorSpace:(float64_t)a10 flags:(float64_t)a11;
- (unint64_t)_setTiledRBImage:(const void *)a3 transform:(float64x2_t *)a4 sourceRect:(unsigned int)a5 interpolation:(unsigned int)a6 tintColor:(__int16)a7 colorSpace:(float64_t)a8 flags:(float64_t)a9;
- (void)concat:(CGAffineTransform *)a3;
- (void)invalidateContents;
- (void)set9PartImage:(CGImage *)a3 transform:(CGAffineTransform *)a4 destinationRect:(CGRect)a5 capInsets:(id)a6 repeat:(BOOL)a7 interpolation:(int)a8 tintColor:(id)a9 flags:(unsigned int)a10;
- (void)set9PartRBImage:(id)a3 transform:(CGAffineTransform *)a4 destinationRect:(CGRect)a5 capInsets:(id)a6 repeat:(BOOL)a7 interpolation:(int)a8 tintColor:(id)a9 colorSpace:(int)a10 flags:(unsigned int)a11;
- (void)set9PartRBImage:(id)a3 transform:(CGAffineTransform *)a4 destinationRect:(CGRect)a5 capInsets:(id)a6 repeat:(BOOL)a7 interpolation:(int)a8 tintColor:(id)a9 flags:(unsigned int)a10;
- (void)setAngularGradientCenter:(CGPoint)a3 startAngle:(double)a4 endAngle:(double)a5 stopCount:(int64_t)a6 colors:(id *)a7 colorSpace:(int)a8 locations:(const double *)a9 flags:(unsigned int)a10;
- (void)setAxialGradientStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 stopCount:(int64_t)a5 colors:(id *)a6 colorSpace:(int)a7 locations:(const double *)a8 flags:(unsigned int)a9;
- (void)setAxialGradientStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 stopCount:(int64_t)a5 colors:(id *)a6 locations:(const double *)a7 flags:(unsigned int)a8;
- (void)setColor:(id)a3;
- (void)setColor:(id)a3 colorSpace:(int)a4;
- (void)setConicGradientCenter:(CGPoint)a3 angle:(double)a4 stopCount:(int64_t)a5 colors:(id *)a6 colorSpace:(int)a7 locations:(const double *)a8 flags:(unsigned int)a9;
- (void)setConicGradientCenter:(CGPoint)a3 angle:(double)a4 stopCount:(int64_t)a5 colors:(id *)a6 locations:(const double *)a7 flags:(unsigned int)a8;
- (void)setImage:(CGImage *)a3 transform:(CGAffineTransform *)a4 interpolation:(int)a5 tintColor:(id)a6 flags:(unsigned int)a7;
- (void)setMeshGradientType:(unsigned int)a3 positions:(const float *)a4 colors:(id *)a5 count:(unint64_t)a6 width:(unint64_t)a7 background:(id)a8 colorSpace:(int)a9 flags:(unsigned int)a10;
- (void)setRBImage:(id)a3 transform:(CGAffineTransform *)a4 interpolation:(int)a5 tintColor:(id)a6 colorSpace:(int)a7 flags:(unsigned int)a8;
- (void)setRBImage:(id)a3 transform:(CGAffineTransform *)a4 interpolation:(int)a5 tintColor:(id)a6 flags:(unsigned int)a7;
- (void)setRadialGradientCenter:(CGPoint)a3 startRadius:(double)a4 endRadius:(double)a5 stopCount:(int64_t)a6 colors:(id *)a7 colorSpace:(int)a8 locations:(const double *)a9 flags:(unsigned int)a10;
- (void)setRadialGradientCenter:(CGPoint)a3 startRadius:(double)a4 endRadius:(double)a5 stopCount:(int64_t)a6 colors:(id *)a7 locations:(const double *)a8 flags:(unsigned int)a9;
- (void)setRadialGradientStartCenter:(CGPoint)a3 startRadius:(double)a4 endCenter:(CGPoint)a5 endRadius:(double)a6 stopCount:(int64_t)a7 colors:(id *)a8 colorSpace:(int)a9 locations:(const double *)a10 flags:(unsigned int)a11;
- (void)setRadialGradientStartCenter:(CGPoint)a3 startRadius:(double)a4 endCenter:(CGPoint)a5 endRadius:(double)a6 stopCount:(int64_t)a7 colors:(id *)a8 locations:(const double *)a9 flags:(unsigned int)a10;
- (void)setShader:(id)a3 bounds:(const CGRect *)a4 flags:(unsigned int)a5;
- (void)setTiledImage:(CGImage *)a3 transform:(CGAffineTransform *)a4 sourceRect:(CGRect)a5 interpolation:(int)a6 tintColor:(id)a7 flags:(unsigned int)a8;
- (void)setTiledRBImage:(id)a3 transform:(CGAffineTransform *)a4 sourceRect:(CGRect)a5 interpolation:(int)a6 tintColor:(id)a7 colorSpace:(int)a8 flags:(unsigned int)a9;
- (void)setTiledRBImage:(id)a3 transform:(CGAffineTransform *)a4 sourceRect:(CGRect)a5 interpolation:(int)a6 tintColor:(id)a7 flags:(unsigned int)a8;
@end

@implementation RBFill

- (id).cxx_construct
{
  self->_data.type = 0;
  RB::Heap::Heap((RB::Heap *)&self->_heap, (char *)self->_heap._buffer, 64, 0);
  return self;
}

- (void).cxx_destruct
{
  RB::Heap::~Heap((RB::Heap *)&self->_heap);
  RBFillData::apply<RB::DestroyAny>(&self->_data.type, (uint64_t)&v3);
  self->_data.type = 0;
}

- (void)setColor:(id)a3 colorSpace:(int)a4
{
}

- (__int16)_setColor:(float)_S0@<S0> colorSpace:(float)a4@<S1>
{
  if (a1)
  {
    _S8 = a6;
    _S9 = a5;
    _S10 = a4;
    _S11 = _S0;
    v11 = (atomic_uint *)(a1 + 16);
    __int16 v12 = rb_color_space(a2);
    RBFillData::apply<RB::DestroyAny>(v11, (uint64_t)&v20);
    __asm
    {
      FCVT            H0, S11
      FCVT            H1, S10
      FCVT            H2, S9
    }
    *(_WORD *)(a1 + 32) = LOWORD(_S0);
    *(_WORD *)(a1 + 34) = _H1;
    __asm { FCVT            H0, S8 }
    *(_WORD *)(a1 + 36) = _H2;
    *(_WORD *)(a1 + 38) = LOWORD(_S0);
    *(_WORD *)(a1 + 40) = v12;
    *(_DWORD *)(a1 + 16) = 1;
  }
  return LOWORD(_S0);
}

- (void)setColor:(id)a3
{
  _S8 = a3.var3;
  _S9 = a3.var2;
  _S10 = a3.var1;
  _S11 = a3.var0;
  RBFillData::apply<RB::DestroyAny>(&self->_data.type, (uint64_t)&v16);
  __asm
  {
    FCVT            H0, S11
    FCVT            H1, S10
    FCVT            H2, S9
  }
  *(_WORD *)&self->_data.data[12] = _H0;
  *(_WORD *)&self->_data.data[14] = _H1;
  __asm { FCVT            H0, S8 }
  *(_WORD *)&self->_data.data[16] = _H2;
  *(_WORD *)&self->_data.data[18] = _H0;
  *(_WORD *)&self->_data.data[20] = 0;
  self->_data.type = 1;
}

- (void)setImage:(CGImage *)a3 transform:(CGAffineTransform *)a4 interpolation:(int)a5 tintColor:(id)a6 flags:(unsigned int)a7
{
  float64x2_t v7 = *(float64x2_t *)&a4->c;
  v8[0] = *(float64x2_t *)&a4->a;
  v8[1] = v7;
  v8[2] = *(float64x2_t *)&a4->tx;
  -[RBFill _setRBImage:transform:interpolation:tintColor:colorSpace:flags:]((uint64_t)self, 0, a3, v8, a5, 0, a7, a6.var0, a6.var1, a6.var2, a6.var3);
}

- (void)setAxialGradientStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 stopCount:(int64_t)a5 colors:(id *)a6 locations:(const double *)a7 flags:(unsigned int)a8
{
}

- (uint64_t)_setRBImage:(const void *)a3 transform:(float64x2_t *)a4 interpolation:(unsigned int)a5 tintColor:(unsigned int)a6 colorSpace:(__int16)a7 flags:(float)_S0
{
  if (result)
  {
    uint64_t v19 = result;
    float64x2_t v33 = a4[1];
    float64x2_t v34 = *a4;
    __asm
    {
      FCVT            H8, S0
      FCVT            H9, S1
      FCVT            H10, S2
      FCVT            H11, S3
    }
    float64x2_t v32 = a4[2];
    __int16 v24 = rb_color_space(a6);
    unint64_t v25 = ((unint64_t)_S10 << 32) | ((unint64_t)_S11 << 48) | ((unint64_t)_S9 << 16) | _S8;
    result = rb_interpolation_mode(a5);
    float32x2_t v26 = vcvt_f32_f64(v34);
    float32x2_t v27 = vcvt_f32_f64(v33);
    float32x2_t v28 = vcvt_f32_f64(v32);
    __int16 v29 = (a7 << 12) | ((result & 0xF) << 8);
    if (*(_DWORD *)(v19 + 16) == 4 && *(const void **)(v19 + 32) == a3 && *(_DWORD *)(v19 + 40) == a2)
    {
      *(void *)(v19 + 48) = 0;
      __asm { FMOV            V0.2S, #1.0 }
      *(void *)(v19 + 56) = _D0;
      *(void *)(v19 + 64) = 0;
      *(void *)(v19 + 72) = 0;
      *(float32x2_t *)(v19 + 80) = v26;
      *(_DWORD *)(v19 + 88) = 0;
      *(float32x2_t *)(v19 + 92) = v27;
      *(_DWORD *)(v19 + 100) = 0;
      *(float32x2_t *)(v19 + 104) = v28;
      *(_DWORD *)(v19 + 112) = 1065353216;
      *(void *)(v19 + 116) = v25;
      *(_WORD *)(v19 + 124) = v24;
      *(_WORD *)(v19 + 126) = v29;
    }
    else
    {
      RB::Heap::reset((RB::Heap *)(v19 + 240), (char *)(v19 + 280), 64);
      RB::ImageTexture::ImageTexture((RB::ImageTexture *)v35, a2, a3);
      RBFillData::apply<RB::DestroyAny>((atomic_uint *)(v19 + 16), (uint64_t)&v36);
      *(_DWORD *)(v19 + 16) = 0;
      result = RB::ImageTexture::ImageTexture((RB::ImageTexture *)(v19 + 32), (const RB::ImageTexture *)v35, (RB::Heap *)(v19 + 240));
      *(void *)(v19 + 48) = 0;
      __asm { FMOV            V0.2S, #1.0 }
      *(void *)(v19 + 56) = _D0;
      *(void *)(v19 + 64) = 0;
      *(void *)(v19 + 72) = 0;
      *(float32x2_t *)(v19 + 80) = v26;
      *(_DWORD *)(v19 + 88) = 0;
      *(float32x2_t *)(v19 + 92) = v27;
      *(_DWORD *)(v19 + 100) = 0;
      *(float32x2_t *)(v19 + 104) = v28;
      *(_DWORD *)(v19 + 112) = 1065353216;
      *(void *)(v19 + 116) = v25;
      *(_WORD *)(v19 + 124) = v24;
      *(_WORD *)(v19 + 126) = v29;
      *(_DWORD *)(v19 + 16) = 4;
    }
  }
  return result;
}

- (uint64_t)_setAxialGradientStartPoint:(float *)a3 endPoint:(unsigned int)a4 stopCount:(uint64_t)a5 colors:(int)a6 colorSpace:(float64_t)a7 locations:(float64_t)a8 flags:(float64_t)a9
{
  if (result)
  {
    uint64_t v15 = result;
    result = set_gradient_color(result, a2, a3, a4);
    if ((result & 1) == 0)
    {
      RB::Heap::reset((RB::Heap *)(v15 + 240), (char *)(v15 + 280), 64);
      __int16 v16 = rb_color_space(a4);
      v17.f64[0] = a7;
      v17.f64[1] = a8;
      double v18 = COERCE_DOUBLE(vcvt_f32_f64(v17));
      v17.f64[0] = a9;
      v17.f64[1] = a10;
      double v19 = COERCE_DOUBLE(vcvt_f32_f64(v17));
      RBFillData::apply<RB::DestroyAny>((atomic_uint *)(v15 + 16), (uint64_t)&v24);
      *(_DWORD *)(v15 + 16) = 0;
      result = RB::Fill::Gradient::Gradient(v15 + 32, (RB::Heap *)(v15 + 240), 0, a2, (uint64_t)a3, v16, a5, a6, v18, v19, 0.0, 0.0);
      *(_DWORD *)(v15 + 16) = 2;
    }
  }
  return result;
}

- (uint64_t)_xmlAttributes:(uint64_t)result
{
  if (result)
  {
    switch(*(_DWORD *)(result + 16))
    {
      case 1:
        v2 = (RB::Fill::Color *)(result + 32);
        RB::Fill::Color::attributes(v2, a2);
      case 2:
        v5 = (float32x2_t *)(result + 32);
        RB::Fill::Gradient::attributes(v5, a2);
      case 3:
        char v3 = (RB::Fill::MeshGradient *)(result + 32);
        RB::Fill::MeshGradient::attributes(v3, a2);
      case 4:
        RB::ImageTexture::attributes((CFTypeRef *)(result + 32), a2);
      case 5:
        v4 = (atomic_uint **)(result + 32);
        RB::Fill::Custom::attributes(v4, a2);
      default:
        return result;
    }
  }
  return result;
}

- (void)concat:(CGAffineTransform *)a3
{
  switch(self->_data.type)
  {
    case 2:
    case 3:
      long long v4 = *(_OWORD *)&a3->c;
      long long v5 = *(_OWORD *)&a3->tx;
      float64x2_t v13 = *(float64x2_t *)&a3->a;
      long long v14 = v4;
      long long v15 = v5;
      RB::Fill::Gradient::concat((RB::Fill::Gradient *)&self->_data.data[12], &v13, (RB::Heap *)&self->_heap);
      break;
    case 4:
      long long v6 = *(_OWORD *)&a3->c;
      long long v7 = *(_OWORD *)&a3->tx;
      float64x2_t v13 = *(float64x2_t *)&a3->a;
      long long v14 = v6;
      long long v15 = v7;
      RB::Fill::ImageData::concat((RB::Fill::ImageData *)&self->_data.data[28], &v13);
      break;
    case 5:
      long long v8 = *(_OWORD *)&a3->c;
      long long v9 = *(_OWORD *)&a3->tx;
      float64x2_t v13 = *(float64x2_t *)&a3->a;
      long long v14 = v8;
      long long v15 = v9;
      *(double *)&long long v10 = RB::operator*(&v13, (float64x2_t *)&self->_data.data[140]);
      *(_OWORD *)&self->_data.data[140] = v10;
      *(_OWORD *)&self->_data.data[156] = v11;
      *(_OWORD *)&self->_data.data[172] = v12;
      break;
    default:
      return;
  }
}

- (void)setAxialGradientStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4 stopCount:(int64_t)a5 colors:(id *)a6 colorSpace:(int)a7 locations:(const double *)a8 flags:(unsigned int)a9
{
}

- (void)setRadialGradientCenter:(CGPoint)a3 startRadius:(double)a4 endRadius:(double)a5 stopCount:(int64_t)a6 colors:(id *)a7 locations:(const double *)a8 flags:(unsigned int)a9
{
}

- (uint64_t)_setRadialGradientStartCenter:(float *)a3 startRadius:(unsigned int)a4 endCenter:(uint64_t)a5 endRadius:(int)a6 stopCount:(float64_t)a7 colors:(float64_t)a8 colorSpace:(double)a9 locations:(float64_t)a10 flags:(float64_t)a11
{
  if (result)
  {
    uint64_t v19 = result;
    result = set_gradient_color(result, a2, a3, a4);
    if ((result & 1) == 0)
    {
      RB::Heap::reset((RB::Heap *)(v19 + 240), (char *)(v19 + 280), 64);
      __int16 v20 = rb_color_space(a4);
      v21.f64[0] = a7;
      v21.f64[1] = a8;
      double v22 = COERCE_DOUBLE(vcvt_f32_f64(v21));
      v21.f64[0] = a10;
      v21.f64[1] = a11;
      double v23 = COERCE_DOUBLE(vcvt_f32_f64(v21));
      RBFillData::apply<RB::DestroyAny>((atomic_uint *)(v19 + 16), (uint64_t)&v30);
      *(_DWORD *)(v19 + 16) = 0;
      float v24 = a9;
      float v25 = a12;
      result = RB::Fill::Gradient::Gradient(v19 + 32, (RB::Heap *)(v19 + 240), 1, a2, (uint64_t)a3, v20, a5, a6, v22, v23, v24, v25);
      *(_DWORD *)(v19 + 16) = 2;
    }
  }
  return result;
}

- (void)setRadialGradientCenter:(CGPoint)a3 startRadius:(double)a4 endRadius:(double)a5 stopCount:(int64_t)a6 colors:(id *)a7 colorSpace:(int)a8 locations:(const double *)a9 flags:(unsigned int)a10
{
}

- (void)setRadialGradientStartCenter:(CGPoint)a3 startRadius:(double)a4 endCenter:(CGPoint)a5 endRadius:(double)a6 stopCount:(int64_t)a7 colors:(id *)a8 locations:(const double *)a9 flags:(unsigned int)a10
{
}

- (void)setRadialGradientStartCenter:(CGPoint)a3 startRadius:(double)a4 endCenter:(CGPoint)a5 endRadius:(double)a6 stopCount:(int64_t)a7 colors:(id *)a8 colorSpace:(int)a9 locations:(const double *)a10 flags:(unsigned int)a11
{
}

- (void)setConicGradientCenter:(CGPoint)a3 angle:(double)a4 stopCount:(int64_t)a5 colors:(id *)a6 locations:(const double *)a7 flags:(unsigned int)a8
{
}

- (uint64_t)_setConicGradientCenter:(float *)a3 angle:(unsigned int)a4 stopCount:(uint64_t)a5 colors:(int)a6 colorSpace:(float64_t)a7 locations:(float64_t)a8 flags:(double)a9
{
  if (result)
  {
    uint64_t v15 = result;
    result = set_gradient_color(result, a2, a3, a4);
    if ((result & 1) == 0)
    {
      RB::Heap::reset((RB::Heap *)(v15 + 240), (char *)(v15 + 280), 64);
      __int16 v16 = rb_color_space(a4);
      v17.f64[0] = a7;
      v17.f64[1] = a8;
      double v18 = COERCE_DOUBLE(vcvt_f32_f64(v17));
      RBFillData::apply<RB::DestroyAny>((atomic_uint *)(v15 + 16), (uint64_t)&v22);
      *(_DWORD *)(v15 + 16) = 0;
      float v19 = a9;
      result = RB::Fill::Gradient::Gradient(v15 + 32, (RB::Heap *)(v15 + 240), 2, a2, (uint64_t)a3, v16, a5, a6, v18, 0.0, v19, 0.0);
      *(_DWORD *)(v15 + 16) = 2;
    }
  }
  return result;
}

- (void)setConicGradientCenter:(CGPoint)a3 angle:(double)a4 stopCount:(int64_t)a5 colors:(id *)a6 colorSpace:(int)a7 locations:(const double *)a8 flags:(unsigned int)a9
{
}

- (void)setAngularGradientCenter:(CGPoint)a3 startAngle:(double)a4 endAngle:(double)a5 stopCount:(int64_t)a6 colors:(id *)a7 colorSpace:(int)a8 locations:(const double *)a9 flags:(unsigned int)a10
{
}

- (uint64_t)_setAngularGradientCenter:(float *)a3 startAngle:(unsigned int)a4 endAngle:(uint64_t)a5 stopCount:(int)a6 colors:(float64_t)a7 colorSpace:(float64_t)a8 locations:(double)a9 flags:(double)a10
{
  if (result)
  {
    uint64_t v17 = result;
    result = set_gradient_color(result, a2, a3, a4);
    if ((result & 1) == 0)
    {
      RB::Heap::reset((RB::Heap *)(v17 + 240), (char *)(v17 + 280), 64);
      __int16 v18 = rb_color_space(a4);
      v19.f64[0] = a7;
      v19.f64[1] = a8;
      double v20 = COERCE_DOUBLE(vcvt_f32_f64(v19));
      RBFillData::apply<RB::DestroyAny>((atomic_uint *)(v17 + 16), (uint64_t)&v25);
      *(_DWORD *)(v17 + 16) = 0;
      float v21 = a9;
      float v22 = a10;
      result = RB::Fill::Gradient::Gradient(v17 + 32, (RB::Heap *)(v17 + 240), 4, a2, (uint64_t)a3, v18, a5, a6, v20, 0.0, v21, v22);
      *(_DWORD *)(v17 + 16) = 2;
    }
  }
  return result;
}

- (void)setMeshGradientType:(unsigned int)a3 positions:(const float *)a4 colors:(id *)a5 count:(unint64_t)a6 width:(unint64_t)a7 background:(id)a8 colorSpace:(int)a9 flags:(unsigned int)a10
{
  unsigned __int8 v14 = a3;
  __asm
  {
    FCVT            H8, S0
    FCVT            H9, S1
    FCVT            H10, S2
    FCVT            H11, S3
  }
  v24[0] = _H8;
  v24[1] = _H9;
  v24[2] = _H10;
  v24[3] = _H11;
  v24[4] = rb_color_space(a9);
  RB::Heap::reset((RB::Heap *)&self->_heap, (char *)self->_heap._buffer, 64);
  RBFillData::apply<RB::DestroyAny>(&self->_data.type, (uint64_t)&v25);
  self->_data.type = 0;
  RB::Fill::MeshGradient::MeshGradient(&self->_data.data[12], v14, a6, a7, a4, a5, v24, a10);
  self->_data.type = 3;
}

- (void)setRBImage:(id)a3 transform:(CGAffineTransform *)a4 interpolation:(int)a5 tintColor:(id)a6 colorSpace:(int)a7 flags:(unsigned int)a8
{
  float64x2_t v8 = *(float64x2_t *)&a4->c;
  v9[0] = *(float64x2_t *)&a4->a;
  v9[1] = v8;
  v9[2] = *(float64x2_t *)&a4->tx;
  -[RBFill _setRBImage:transform:interpolation:tintColor:colorSpace:flags:]((uint64_t)self, *(CGImage **)&a3.var0, a3.var1, v9, a5, a7, a8, a6.var0, a6.var1, a6.var2, a6.var3);
}

- (void)setRBImage:(id)a3 transform:(CGAffineTransform *)a4 interpolation:(int)a5 tintColor:(id)a6 flags:(unsigned int)a7
{
  float64x2_t v7 = *(float64x2_t *)&a4->c;
  v8[0] = *(float64x2_t *)&a4->a;
  v8[1] = v7;
  v8[2] = *(float64x2_t *)&a4->tx;
  -[RBFill _setRBImage:transform:interpolation:tintColor:colorSpace:flags:]((uint64_t)self, *(CGImage **)&a3.var0, a3.var1, v8, a5, 0, a7, a6.var0, a6.var1, a6.var2, a6.var3);
}

- (void)setTiledRBImage:(id)a3 transform:(CGAffineTransform *)a4 sourceRect:(CGRect)a5 interpolation:(int)a6 tintColor:(id)a7 colorSpace:(int)a8 flags:(unsigned int)a9
{
  float64x2_t v9 = *(float64x2_t *)&a4->c;
  v10[0] = *(float64x2_t *)&a4->a;
  v10[1] = v9;
  v10[2] = *(float64x2_t *)&a4->tx;
  -[RBFill _setTiledRBImage:transform:sourceRect:interpolation:tintColor:colorSpace:flags:]((unint64_t)self, *(CGImage **)&a3.var0, a3.var1, v10, a6, a8, a9, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a7.var0, a7.var1, a7.var2, a7.var3);
}

- (unint64_t)_setTiledRBImage:(const void *)a3 transform:(float64x2_t *)a4 sourceRect:(unsigned int)a5 interpolation:(unsigned int)a6 tintColor:(__int16)a7 colorSpace:(float64_t)a8 flags:(float64_t)a9
{
  if (result)
  {
    _S8 = a15;
    _S9 = a14;
    _S10 = a13;
    _S11 = a12;
    unint64_t v24 = result;
    int v25 = rb_interpolation_mode(a5);
    char v26 = RB::interpolation_mode_without_mipmaps(v25);
    float64x2_t v42 = a4[1];
    float64x2_t v43 = *a4;
    __asm
    {
      FCVT            H11, S11
      FCVT            H10, S10
      FCVT            H9, S9
      FCVT            H8, S8
    }
    float64x2_t v41 = a4[2];
    result = rb_color_space(a6);
    __int16 v31 = result;
    unint64_t v32 = ((unint64_t)LODWORD(_S9) << 32) | ((unint64_t)LODWORD(_S8) << 48) | ((unint64_t)LODWORD(_S10) << 16) | LODWORD(_S11);
    v33.f64[0] = a8;
    v33.f64[1] = a9;
    v34.f64[0] = a10;
    v34.f64[1] = a11;
    float32x2_t v35 = vcvt_f32_f64(v33);
    float32x2_t v36 = vcvt_f32_f64(v34);
    float32x2_t v37 = vcvt_f32_f64(v43);
    float32x2_t v38 = vcvt_f32_f64(v42);
    float32x2_t v39 = vcvt_f32_f64(v41);
    __int16 v40 = (a7 << 12) | ((v26 & 0xF) << 8) | 2;
    if (*(_DWORD *)(v24 + 16) == 4 && *(const void **)(v24 + 32) == a3 && *(_DWORD *)(v24 + 40) == a2)
    {
      *(float32x2_t *)(v24 + 48) = v35;
      *(float32x2_t *)(v24 + 56) = v36;
      *(void *)(v24 + 64) = 0;
      *(void *)(v24 + 72) = 0;
      *(float32x2_t *)(v24 + 80) = v37;
      *(_DWORD *)(v24 + 88) = 0;
      *(float32x2_t *)(v24 + 92) = v38;
      *(_DWORD *)(v24 + 100) = 0;
      *(float32x2_t *)(v24 + 104) = v39;
      *(_DWORD *)(v24 + 112) = 1065353216;
      *(void *)(v24 + 116) = v32;
      *(_WORD *)(v24 + 124) = result;
      *(_WORD *)(v24 + 126) = v40;
    }
    else
    {
      RB::Heap::reset((RB::Heap *)(v24 + 240), (char *)(v24 + 280), 64);
      RB::ImageTexture::ImageTexture((RB::ImageTexture *)v48, a2, a3);
      RBFillData::apply<RB::DestroyAny>((atomic_uint *)(v24 + 16), (uint64_t)&v49);
      *(_DWORD *)(v24 + 16) = 0;
      result = RB::ImageTexture::ImageTexture((RB::ImageTexture *)(v24 + 32), (const RB::ImageTexture *)v48, (RB::Heap *)(v24 + 240));
      *(float32x2_t *)(v24 + 48) = v35;
      *(float32x2_t *)(v24 + 56) = v36;
      *(void *)(v24 + 64) = 0;
      *(void *)(v24 + 72) = 0;
      *(float32x2_t *)(v24 + 80) = v37;
      *(_DWORD *)(v24 + 88) = 0;
      *(float32x2_t *)(v24 + 92) = v38;
      *(_DWORD *)(v24 + 100) = 0;
      *(float32x2_t *)(v24 + 104) = v39;
      *(_DWORD *)(v24 + 112) = 1065353216;
      *(void *)(v24 + 116) = v32;
      *(_WORD *)(v24 + 124) = v31;
      *(_WORD *)(v24 + 126) = v40;
      *(_DWORD *)(v24 + 16) = 4;
    }
  }
  return result;
}

- (void)setTiledRBImage:(id)a3 transform:(CGAffineTransform *)a4 sourceRect:(CGRect)a5 interpolation:(int)a6 tintColor:(id)a7 flags:(unsigned int)a8
{
  float64x2_t v8 = *(float64x2_t *)&a4->c;
  v9[0] = *(float64x2_t *)&a4->a;
  v9[1] = v8;
  v9[2] = *(float64x2_t *)&a4->tx;
  -[RBFill _setTiledRBImage:transform:sourceRect:interpolation:tintColor:colorSpace:flags:]((unint64_t)self, *(CGImage **)&a3.var0, a3.var1, v9, a6, 0, a8, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a7.var0, a7.var1, a7.var2, a7.var3);
}

- (void)setTiledImage:(CGImage *)a3 transform:(CGAffineTransform *)a4 sourceRect:(CGRect)a5 interpolation:(int)a6 tintColor:(id)a7 flags:(unsigned int)a8
{
  float64x2_t v8 = *(float64x2_t *)&a4->c;
  v9[0] = *(float64x2_t *)&a4->a;
  v9[1] = v8;
  v9[2] = *(float64x2_t *)&a4->tx;
  -[RBFill _setTiledRBImage:transform:sourceRect:interpolation:tintColor:colorSpace:flags:]((unint64_t)self, 0, a3, v9, a6, 0, a8, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a7.var0, a7.var1, a7.var2, a7.var3);
}

- (void)set9PartRBImage:(id)a3 transform:(CGAffineTransform *)a4 destinationRect:(CGRect)a5 capInsets:(id)a6 repeat:(BOOL)a7 interpolation:(int)a8 tintColor:(id)a9 colorSpace:(int)a10 flags:(unsigned int)a11
{
  float64x2_t v12 = *(float64x2_t *)&a4->c;
  v13[0] = *(float64x2_t *)&a4->a;
  v13[1] = v12;
  v13[2] = *(float64x2_t *)&a4->tx;
  -[RBFill _set9PartRBImage:transform:destinationRect:capInsets:repeat:interpolation:tintColor:colorSpace:flags:]((unint64_t)self, *(CGImage **)&a3.var0, a3.var1, v13, a7, a8, v11, a10, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a6.var0, a6.var1, a6.var2, a6.var3, LODWORD(a9.var0), SLODWORD(a9.var1), SLODWORD(a9.var2),
    LODWORD(a9.var3));
}

- (unint64_t)_set9PartRBImage:(const void *)a3 transform:(float64x2_t *)a4 destinationRect:(int)a5 capInsets:(unsigned int)a6 repeat:(unsigned int)a7 interpolation:(__int16)a8 tintColor:(float64_t)a9 colorSpace:(float64_t)a10 flags:(float64_t)a11
{
  if (result)
  {
    _D8 = a15;
    _D10 = a13;
    unint64_t v30 = result;
    _S14 = a19;
    _S13 = a20;
    _S12 = a17;
    _S15 = a18;
    int v35 = rb_interpolation_mode(a6);
    char v36 = v35;
    if (a5)
    {
      char v36 = RB::interpolation_mode_without_mipmaps(v35);
      __int16 v37 = 6;
    }
    else
    {
      __int16 v37 = 5;
    }
    float v38 = a14;
    float v39 = a16;
    float v40 = _D10;
    float v41 = _D8;
    float v62 = v40;
    float v63 = v41;
    float64x2_t v56 = a4[1];
    float64x2_t v57 = *a4;
    float64x2_t v55 = a4[2];
    __asm
    {
      FCVT            H8, S12
      FCVT            H10, S15
      FCVT            H12, S14
      FCVT            H13, S13
    }
    result = rb_color_space(a7);
    __int16 v46 = result;
    unint64_t v47 = ((unint64_t)_S12 << 32) | ((unint64_t)_S13 << 48) | ((unint64_t)LODWORD(_D10) << 16) | LODWORD(_D8);
    v48.f64[0] = a9;
    v48.f64[1] = a10;
    float32x2_t v49 = vcvt_f32_f64(v48);
    v48.f64[0] = a11;
    v48.f64[1] = a12;
    float32x2_t v50 = vcvt_f32_f64(v48);
    float32x2_t v51 = vcvt_f32_f64(v57);
    float32x2_t v52 = vcvt_f32_f64(v56);
    float32x2_t v53 = vcvt_f32_f64(v55);
    __int16 v54 = v37 & 0xF0FF | ((v36 & 0xF) << 8) | (a8 << 12);
    if (*(_DWORD *)(v30 + 16) == 4 && *(const void **)(v30 + 32) == a3 && *(_DWORD *)(v30 + 40) == a2)
    {
      *(float32x2_t *)(v30 + 48) = v49;
      *(float32x2_t *)(v30 + 56) = v50;
      *(float *)(v30 + 64) = v38;
      *(float *)(v30 + 68) = v39;
      *(float *)(v30 + 72) = v62;
      *(float *)(v30 + 76) = v63;
      *(float32x2_t *)(v30 + 80) = v51;
      *(_DWORD *)(v30 + 88) = 0;
      *(float32x2_t *)(v30 + 92) = v52;
      *(_DWORD *)(v30 + 100) = 0;
      *(float32x2_t *)(v30 + 104) = v53;
      *(_DWORD *)(v30 + 112) = 1065353216;
      *(void *)(v30 + 116) = v47;
      *(_WORD *)(v30 + 124) = result;
      *(_WORD *)(v30 + 126) = v54;
    }
    else
    {
      RB::Heap::reset((RB::Heap *)(v30 + 240), (char *)(v30 + 280), 64);
      RB::ImageTexture::ImageTexture((RB::ImageTexture *)v64, a2, a3);
      RBFillData::apply<RB::DestroyAny>((atomic_uint *)(v30 + 16), (uint64_t)&v65);
      *(_DWORD *)(v30 + 16) = 0;
      result = RB::ImageTexture::ImageTexture((RB::ImageTexture *)(v30 + 32), (const RB::ImageTexture *)v64, (RB::Heap *)(v30 + 240));
      *(float32x2_t *)(v30 + 48) = v49;
      *(float32x2_t *)(v30 + 56) = v50;
      *(float *)(v30 + 64) = v38;
      *(float *)(v30 + 68) = v39;
      *(float *)(v30 + 72) = v62;
      *(float *)(v30 + 76) = v63;
      *(float32x2_t *)(v30 + 80) = v51;
      *(_DWORD *)(v30 + 88) = 0;
      *(float32x2_t *)(v30 + 92) = v52;
      *(_DWORD *)(v30 + 100) = 0;
      *(float32x2_t *)(v30 + 104) = v53;
      *(_DWORD *)(v30 + 112) = 1065353216;
      *(void *)(v30 + 116) = v47;
      *(_WORD *)(v30 + 124) = v46;
      *(_WORD *)(v30 + 126) = v54;
      *(_DWORD *)(v30 + 16) = 4;
    }
  }
  return result;
}

- (void)set9PartRBImage:(id)a3 transform:(CGAffineTransform *)a4 destinationRect:(CGRect)a5 capInsets:(id)a6 repeat:(BOOL)a7 interpolation:(int)a8 tintColor:(id)a9 flags:(unsigned int)a10
{
  float64x2_t v11 = *(float64x2_t *)&a4->c;
  v12[0] = *(float64x2_t *)&a4->a;
  v12[1] = v11;
  v12[2] = *(float64x2_t *)&a4->tx;
  -[RBFill _set9PartRBImage:transform:destinationRect:capInsets:repeat:interpolation:tintColor:colorSpace:flags:]((unint64_t)self, *(CGImage **)&a3.var0, a3.var1, v12, a7, a8, 0, v10, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a6.var0, a6.var1, a6.var2, a6.var3, LODWORD(a9.var0), SLODWORD(a9.var1), SLODWORD(a9.var2),
    LODWORD(a9.var3));
}

- (void)set9PartImage:(CGImage *)a3 transform:(CGAffineTransform *)a4 destinationRect:(CGRect)a5 capInsets:(id)a6 repeat:(BOOL)a7 interpolation:(int)a8 tintColor:(id)a9 flags:(unsigned int)a10
{
  float64x2_t v10 = *(float64x2_t *)&a4->c;
  v11[0] = *(float64x2_t *)&a4->a;
  v11[1] = v10;
  v11[2] = *(float64x2_t *)&a4->tx;
  -[RBFill _set9PartRBImage:transform:destinationRect:capInsets:repeat:interpolation:tintColor:colorSpace:flags:]((unint64_t)self, 0, a3, v11, a7, a8, 0, SLOWORD(a9.var0), a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a6.var0, a6.var1, a6.var2, a6.var3, a10, v12, v13,
    v14);
}

- (void)setShader:(id)a3 bounds:(const CGRect *)a4 flags:(unsigned int)a5
{
  float64x2_t v8 = (const RB::CustomShader::Closure *)-[RBShape shapeData]((uint64_t)a3);
  if (a4)
  {
    float32x2_t v9 = vcvt_f32_f64((float64x2_t)a4->size);
    v10.n128_u64[0] = (unint64_t)vcvt_f32_f64((float64x2_t)a4->origin);
    *(float32x2_t *)&v10.n128_i8[8] = v9;
  }
  else
  {
    __n128 v10 = 0uLL;
  }
  RBFillData::apply<RB::DestroyAny>(&self->_data.type, (uint64_t)&v11);
  self->_data.type = 0;
  RB::Fill::Custom::Custom((RB::Fill::Custom *)&self->_data.data[12], v8, &v10, a5);
  self->_data.type = 5;
}

- (void)invalidateContents
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (self->_data.type == 4)
  {
    unsigned int v3 = *(_DWORD *)&self->_data.data[20];
    BOOL v4 = v3 > 4;
    int v5 = (1 << v3) & 0x13;
    if (!v4 && v5 != 0)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      float64x2_t v7 = +[RBDevice allDevices];
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        __n128 v10 = &self->_data.data[12];
        uint64_t v11 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v7);
            }
            int v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            unsigned int v14 = [v13 queue];
            v15[0] = MEMORY[0x263EF8330];
            v15[1] = 3221225472;
            v15[2] = __28__RBFill_invalidateContents__block_invoke;
            v15[3] = &unk_2641F8550;
            v15[4] = v13;
            v15[5] = v10;
            dispatch_sync(v14, v15);
          }
          uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v9);
      }
    }
  }
}

RB::Device *__28__RBFill_invalidateContents__block_invoke(uint64_t a1)
{
  result = (RB::Device *)-[RBDecodedFontMetadata fontUID](*(void *)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = *(_DWORD *)(v3 + 8);
  switch(v4)
  {
    case 4:
      long long v6 = *(__IOSurface **)v3;
      return (RB::Device *)RBInvalidateCachedMTLTexture((uint64_t)result, v6);
    case 1:
      float64x2_t v7 = *(__IOSurface **)v3;
      return (RB::Device *)RBInvalidateCachedIOSurface(result, v7);
    case 0:
      int v5 = *(CGImage **)v3;
      return (RB::Device *)RBInvalidateCachedImage(result, v5);
  }
  return result;
}

@end