@interface VKRoadSignArtwork
- (Box<float,)localCollisionBounds;
- (Box<float,)localRenderBounds;
- (Box<float,)localSignBounds;
- (Matrix<float,)offsetPixelForPixel:()Matrix<float;
- (VKRoadSignArtwork)initWithFramesetter:(__CTFramesetter *)a3 signMetrics:(RoadSignMetrics *)a4 textMetrics:(RoadSignTextMetrics *)a5 signColoring:glyph:cgGlyph:resourceStore:;
- (VKRoadSignArtwork)initWithLine:(__CTLine *)a3 signMetrics:(RoadSignMetrics *)a4 textMetrics:(RoadSignTextMetrics *)a5 signColoring:glyph:cgGlyph:resourceStore:;
- (const)generatedMetrics;
- (const)glyph;
- (const)textMetrics;
- (id).cxx_construct;
- (id)image;
- (void)addDebugPoint:(CGPoint)a3 color:()Color<float;
- (void)addDebugRect:(CGRect)a3 color:()Color<float;
- (void)dealloc;
@end

@implementation VKRoadSignArtwork

- (id).cxx_construct
{
  *((unsigned char *)self + 32) = 0;
  __asm { FMOV            V5.2D, #1.0 }
  *(_OWORD *)((char *)self + 40) = _Q5;
  *(_OWORD *)((char *)self + 56) = xmmword_1A28FE8E0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  v7 = (_OWORD *)MEMORY[0x1E4F1DB30];
  long long v8 = *MEMORY[0x1E4F1DB30];
  *(_OWORD *)((char *)self + 88) = *MEMORY[0x1E4F1DB30];
  *((void *)self + 14) = 0;
  *((void *)self + 15) = 0;
  *((void *)self + 13) = 0x4034000000000000;
  *((_OWORD *)self + 8) = xmmword_1A28FE8F0;
  *((void *)self + 18) = 0;
  *((void *)self + 19) = 0;
  *((void *)self + 20) = 0x401A000000000000;
  *(_OWORD *)((char *)self + 168) = v8;
  *(_OWORD *)((char *)self + 184) = xmmword_1A28FCCC0;
  *(_OWORD *)((char *)self + 200) = xmmword_1A28FE900;
  __asm { FMOV            V0.2D, #6.0 }
  *(_OWORD *)((char *)self + 216) = _Q0;
  __asm { FMOV            V0.2D, #17.0 }
  *(_OWORD *)((char *)self + 232) = _Q0;
  *((void *)self + 31) = 0;
  *((void *)self + 32) = 0;
  *((void *)self + 33) = 0;
  v11 = &md::SignedDistanceFieldGenerator::_hypotCache[32854];
  {
    id v41 = self;
    long long v39 = _Q5;
    _Q5 = v39;
    v11 = md::SignedDistanceFieldGenerator::_hypotCache + 131416;
    v7 = (_OWORD *)MEMORY[0x1E4F1DB30];
    int v35 = v34;
    self = v41;
    if (v35) {
      operator new();
    }
  }
  v12 = (char *)self + 1384;
  *((void *)self + 34) = *((void *)v11 + 91);
  *((void *)self + 35) = 0;
  *((void *)self + 36) = 0;
  *((void *)self + 37) = 0;
  {
    id v42 = self;
    v38 = (char *)self + 1384;
    long long v40 = _Q5;
    _Q5 = v40;
    v11 = md::SignedDistanceFieldGenerator::_hypotCache + 131416;
    v12 = v38;
    v7 = (_OWORD *)MEMORY[0x1E4F1DB30];
    int v37 = v36;
    self = v42;
    if (v37) {
      operator new();
    }
  }
  *((void *)self + 38) = *((void *)v11 + 91);
  *(_OWORD *)((char *)self + 312) = 0u;
  *((_WORD *)self + 164) = 1;
  *((unsigned char *)self + 336) = 0;
  *(_OWORD *)((char *)self + 344) = *v7;
  v13 = (long long *)MEMORY[0x1E4F1DB28];
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v15 = *MEMORY[0x1E4F1DB28];
  *(_OWORD *)((char *)self + 360) = *MEMORY[0x1E4F1DB28];
  *(_OWORD *)((char *)self + 376) = v14;
  *(_OWORD *)((char *)self + 392) = 0u;
  *(_OWORD *)((char *)self + 408) = 0u;
  v16 = (long long *)MEMORY[0x1E4F1DAD8];
  *(_OWORD *)((char *)self + 417) = 0u;
  long long v17 = *v16;
  *(_OWORD *)((char *)self + 440) = *v16;
  *(_OWORD *)((char *)self + 456) = v17;
  long long v18 = *v16;
  *(_OWORD *)((char *)self + 472) = *v16;
  *(_OWORD *)((char *)self + 488) = v18;
  *((unsigned char *)self + 504) = 0;
  long long v19 = *v13;
  *((_OWORD *)self + 32) = *v7;
  *((_OWORD *)self + 33) = v19;
  *((_OWORD *)self + 34) = v13[1];
  *((_OWORD *)self + 35) = 0u;
  *((_OWORD *)self + 36) = 0u;
  *(_OWORD *)((char *)self + 585) = 0u;
  *((_OWORD *)self + 38) = v18;
  *((_OWORD *)self + 39) = v18;
  *((_OWORD *)self + 40) = v18;
  *((_OWORD *)self + 41) = v18;
  *((unsigned char *)self + 672) = 0;
  long long v20 = *v7;
  *(_OWORD *)((char *)self + 680) = *v7;
  long long v21 = *v16;
  *(_OWORD *)((char *)self + 776) = *v16;
  *(_OWORD *)((char *)self + 792) = v21;
  *(_OWORD *)((char *)self + 808) = v21;
  *(_OWORD *)((char *)self + 824) = v21;
  long long v23 = *v13;
  long long v22 = v13[1];
  *(_OWORD *)((char *)self + 696) = *v13;
  *(_OWORD *)((char *)self + 712) = v22;
  *(_OWORD *)((char *)self + 728) = 0u;
  *(_OWORD *)((char *)self + 744) = 0u;
  *(_OWORD *)((char *)self + 753) = 0u;
  *((unsigned char *)self + 840) = 0;
  *((_OWORD *)self + 53) = v20;
  *((_OWORD *)self + 54) = v23;
  *(_OWORD *)((char *)self + 921) = 0u;
  *((_OWORD *)self + 56) = 0u;
  *((_OWORD *)self + 57) = 0u;
  *((_OWORD *)self + 55) = v22;
  long long v24 = *v16;
  *((_OWORD *)self + 59) = *v16;
  *((_OWORD *)self + 60) = v24;
  long long v25 = *v16;
  *((_OWORD *)self + 61) = *v16;
  *((_OWORD *)self + 62) = v25;
  *((unsigned char *)self + 1008) = 0;
  *(_OWORD *)((char *)self + 1016) = *v7;
  long long v26 = v13[1];
  *(_OWORD *)((char *)self + 1032) = *v13;
  *(_OWORD *)((char *)self + 1048) = v26;
  long long v27 = v13[1];
  *(_OWORD *)((char *)self + 1064) = *v13;
  *(_OWORD *)((char *)self + 1080) = v27;
  *((void *)self + 137) = 0;
  *((_OWORD *)self + 69) = *v16;
  *((_OWORD *)self + 70) = *v16;
  *((_OWORD *)self + 71) = *v16;
  long long v28 = *v13;
  *((_OWORD *)self + 73) = v13[1];
  *((_OWORD *)self + 72) = v28;
  long long v29 = *v13;
  *((_OWORD *)self + 75) = v13[1];
  *((_OWORD *)self + 74) = v29;
  long long v30 = *v13;
  *((_OWORD *)self + 77) = v13[1];
  *((_OWORD *)self + 76) = v30;
  long long v31 = *v13;
  *((_OWORD *)self + 79) = v13[1];
  *((_OWORD *)self + 78) = v31;
  long long v32 = *v13;
  *((_OWORD *)self + 81) = v13[1];
  *((_OWORD *)self + 80) = v32;
  long long v33 = *v13;
  *((_OWORD *)self + 83) = v13[1];
  *((_OWORD *)self + 82) = v33;
  *((_OWORD *)self + 85) = v13[1];
  *((_OWORD *)self + 84) = v15;
  *((void *)self + 205) = 0;
  *((void *)self + 172) = 0x1010000000001;
  _OWORD *v12 = _Q5;
  v12[1] = _Q5;
  *((void *)self + 195) = 0;
  *(_OWORD *)((char *)self + 1544) = 0u;
  *((void *)self + 196) = 0x3FC99999A0000000;
  *((void *)self + 199) = 0;
  *(_OWORD *)((char *)self + 1576) = 0u;
  *((void *)self + 200) = 0x3FF0000000000000;
  *((_OWORD *)self + 103) = 0u;
  *(_OWORD *)((char *)self + 1704) = 0u;
  *(_OWORD *)((char *)self + 1720) = 0u;
  *(_OWORD *)((char *)self + 1672) = 0u;
  *(_OWORD *)((char *)self + 1688) = 0u;
  *((void *)self + 217) = 850045863;
  *((void *)self + 224) = 0;
  *((_OWORD *)self + 111) = 0u;
  *((_OWORD *)self + 110) = 0u;
  *((_OWORD *)self + 109) = 0u;
  *((void *)self + 225) = &unk_1EF559EB8;
  *((void *)self + 226) = 0;
  return self;
}

- (void).cxx_destruct
{
  *((void *)self + 225) = &unk_1EF559EB8;

  std::mutex::~mutex((std::mutex *)((char *)self + 1736));
  v3 = (std::__shared_weak_count *)*((void *)self + 216);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  v4 = (void *)*((void *)self + 212);
  if (v4)
  {
    *((void *)self + 213) = v4;
    operator delete(v4);
  }
  v5 = (void *)*((void *)self + 209);
  if (v5)
  {
    *((void *)self + 210) = v5;
    operator delete(v5);
  }
  v6 = (std::__shared_weak_count *)*((void *)self + 207);
  if (!v6 || atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if ((*((char *)self + 303) & 0x80000000) == 0) {
      goto LABEL_10;
    }
LABEL_13:
    (*(void (**)(void, void, uint64_t))(**((void **)self + 38) + 40))(*((void *)self + 38), *((void *)self + 35), *((void *)self + 37) & 0x7FFFFFFFFFFFFFFFLL);
    if ((*((char *)self + 271) & 0x80000000) == 0) {
      return;
    }
    goto LABEL_14;
  }
  ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
  std::__shared_weak_count::__release_weak(v6);
  if (*((char *)self + 303) < 0) {
    goto LABEL_13;
  }
LABEL_10:
  if ((*((char *)self + 271) & 0x80000000) == 0) {
    return;
  }
LABEL_14:
  v7 = *(void (**)(void))(**((void **)self + 34) + 40);
  v7();
}

- (void)addDebugRect:(CGRect)a3 color:()Color<float
{
  v5 = v4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v11 = (CGRect *)*((void *)self + 213);
  unint64_t v12 = *((void *)self + 214);
  if ((unint64_t)v11 >= v12)
  {
    long long v14 = (CGRect *)*((void *)self + 212);
    unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)v11 - (char *)v14) >> 4) + 1;
    if (v15 > 0x555555555555555) {
      abort();
    }
    unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v12 - (void)v14) >> 4);
    if (2 * v16 > v15) {
      unint64_t v15 = 2 * v16;
    }
    if (v16 >= 0x2AAAAAAAAAAAAAALL) {
      unint64_t v17 = 0x555555555555555;
    }
    else {
      unint64_t v17 = v15;
    }
    if (v17)
    {
      if (v17 > 0x555555555555555) {
        std::__throw_bad_array_new_length[abi:nn180100]();
      }
      long long v18 = (char *)operator new(48 * v17);
    }
    else
    {
      long long v18 = 0;
    }
    long long v19 = &v18[16 * (((char *)v11 - (char *)v14) >> 4)];
    *(CGFloat *)long long v19 = x;
    *((CGFloat *)v19 + 1) = y;
    *((CGFloat *)v19 + 2) = width;
    *((CGFloat *)v19 + 3) = height;
    *((_OWORD *)v19 + 2) = *v5;
    p_size = (CGSize *)(v19 + 48);
    if (v11 != v14)
    {
      do
      {
        CGPoint origin = v11[-1].origin;
        *((_OWORD *)v19 - 3) = v11[-2].size;
        *((CGPoint *)v19 - 2) = origin;
        *((_OWORD *)v19 - 1) = v11[-1].size;
        v19 -= 48;
        v11 = (CGRect *)((char *)v11 - 48);
      }
      while (v11 != v14);
      v11 = (CGRect *)*((void *)self + 212);
    }
    *((void *)self + 212) = v19;
    *((void *)self + 213) = p_size;
    *((void *)self + 214) = &v18[48 * v17];
    if (v11) {
      operator delete(v11);
    }
  }
  else
  {
    CGRect *v11 = a3;
    v11[1].CGPoint origin = (CGPoint)*v4;
    p_size = &v11[1].size;
  }
  *((void *)self + 213) = p_size;
}

- (void)addDebugPoint:(CGPoint)a3 color:()Color<float
{
  v5 = v4;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v9 = (CGPoint *)*((void *)self + 210);
  unint64_t v10 = *((void *)self + 211);
  if ((unint64_t)v9 >= v10)
  {
    unint64_t v12 = (CGPoint *)*((void *)self + 209);
    uint64_t v13 = ((char *)v9 - (char *)v12) >> 5;
    unint64_t v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 59) {
      abort();
    }
    uint64_t v15 = v10 - (void)v12;
    if (v15 >> 4 > v14) {
      unint64_t v14 = v15 >> 4;
    }
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v16 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v16 = v14;
    }
    if (v16)
    {
      if (v16 >> 59) {
        std::__throw_bad_array_new_length[abi:nn180100]();
      }
      unint64_t v17 = (char *)operator new(32 * v16);
    }
    else
    {
      unint64_t v17 = 0;
    }
    long long v18 = (CGPoint *)&v17[32 * v13];
    v18->CGFloat x = x;
    v18->CGFloat y = y;
    v18[1] = *v5;
    v11 = v18 + 2;
    if (v9 != v12)
    {
      do
      {
        v18[-2] = v9[-2];
        v18[-1] = v9[-1];
        v18 -= 2;
        v9 -= 2;
      }
      while (v9 != v12);
      v9 = (CGPoint *)*((void *)self + 209);
    }
    *((void *)self + 209) = v18;
    *((void *)self + 210) = v11;
    *((void *)self + 211) = &v17[32 * v16];
    if (v9) {
      operator delete(v9);
    }
  }
  else
  {
    CGPoint *v9 = a3;
    v9[1] = *v4;
    v11 = v9 + 2;
  }
  *((void *)self + 210) = v11;
}

- (const)textMetrics
{
  return (char *)self + 192;
}

- (const)generatedMetrics
{
  return (const RoadSignGeneratedMetrics *)((char *)self + 336);
}

- (Box<float,)localCollisionBounds
{
  [(VKRoadSignArtwork *)self localRenderBounds];
  if (v4 < v2 || v5 < v3)
  {
    float v4 = -3.4028e38;
    float v2 = 3.4028e38;
    float v3 = 3.4028e38;
    float v5 = -3.4028e38;
  }
  result._maximum._e[1] = v5;
  result._maximum._e[0] = v4;
  result._minimum._e[1] = v3;
  result._minimum._e[0] = v2;
  return result;
}

- (Box<float,)localSignBounds
{
  float v2 = *((double *)self + 129);
  float v3 = *((double *)self + 130);
  float v4 = *((double *)self + 131);
  float v5 = *((double *)self + 132);
  float v6 = v4 + v2;
  float v7 = v5 + v3;
  if (v6 < v2 || v7 < v3)
  {
    float v12 = 3.4028e38;
    float v14 = -3.4028e38;
    float v13 = -3.4028e38;
    float v11 = 3.4028e38;
  }
  else
  {
    float v9 = *((double *)self + 128) * 0.5;
    float v10 = *((double *)self + 127) * 0.5;
    float v11 = v2 - v10;
    float v12 = v3 - v9;
    float v13 = v6 - v10;
    float v14 = v7 - v9;
  }
  result._maximum._e[1] = v14;
  result._maximum._e[0] = v13;
  result._minimum._e[1] = v12;
  result._minimum._e[0] = v11;
  return result;
}

- (Box<float,)localRenderBounds
{
  double v2 = *((double *)self + 127);
  double v3 = *((double *)self + 128);
  float v4 = v2 * -0.5;
  float v5 = v3 * -0.5;
  float v6 = v2 * 0.5;
  float v7 = v3 * 0.5;
  result._maximum._e[1] = v7;
  result._maximum._e[0] = v6;
  result._minimum._e[1] = v5;
  result._minimum._e[0] = v4;
  return result;
}

- (Matrix<float,)offsetPixelForPixel:()Matrix<float
{
  if (*((unsigned char *)self + 432)
    || *((unsigned char *)self + 600)
    || (float64x2_t v3 = *(float64x2_t *)MEMORY[0x1E4F1DAD8], *((unsigned char *)self + 1008)) && *((unsigned char *)self + 936))
  {
    float64x2_t v3 = *((float64x2_t *)self + 70);
  }
  __asm { FMOV            V2.2D, #-0.5 }
  float32x2_t v9 = vcvt_f32_f64(vnegq_f64(vmlaq_f64(v3, _Q2, *(float64x2_t *)((char *)self + 1016))));
  float v10 = v9.f32[1];
  result._e[0] = v9.f32[0];
  result._e[1] = v10;
  return result;
}

- (const)glyph
{
  return (char *)self + 1648;
}

- (id)image
{
  float64x2_t v3 = (std::mutex *)((char *)self + 1736);
  std::mutex::lock((std::mutex *)((char *)self + 1736));
  float v4 = (void *)*((void *)self + 226);
  if (!v4)
  {
    double v5 = *((double *)self + 127);
    double v6 = *((double *)self + 128);
    size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
    if (_colorSpace(void)::once != -1) {
      dispatch_once(&_colorSpace(void)::once, &__block_literal_global_19600);
    }
    long long v8 = CGBitmapContextCreate(0, (unint64_t)v5, (unint64_t)v6, 8uLL, AlignedBytesPerRow, (CGColorSpaceRef)_colorSpace(void)::colorspace, 0x2002u);
    float32x2_t v9 = v8;
    if (!v8)
    {
      id v12 = 0;
      goto LABEL_46;
    }
    v88.origin.CGFloat x = 0.0;
    v88.origin.CGFloat y = 0.0;
    v88.size.CGFloat width = v5;
    v88.size.CGFloat height = v6;
    CGContextClearRect(v8, v88);
    uint64_t v10 = *((void *)self + 215);
    float v11 = (std::__shared_weak_count *)*((void *)self + 216);
    if (v11)
    {
      atomic_fetch_add_explicit(&v11->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      uint64_t v84 = v10;
      v85 = v11;
      atomic_fetch_add_explicit(&v11->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    }
    else
    {
      uint64_t v84 = *((void *)self + 215);
      v85 = 0;
    }
    float v13 = VKCreateRoadSignImageWithSignType((const RoadSignMetrics *)((char *)self + 32), (const RoadSignPartMetrics *)self + 4, (uint64_t)self + 1376, &v84);
    if (v85) {
      std::__shared_weak_count::__release_weak(v85);
    }
    uint64_t v82 = v10;
    v83 = v11;
    if (v11) {
      atomic_fetch_add_explicit(&v11->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    }
    float v14 = VKCreateRoadSignImageWithSignType((const RoadSignMetrics *)((char *)self + 32), (const RoadSignPartMetrics *)self + 2, (uint64_t)self + 1376, &v82);
    if (v83) {
      std::__shared_weak_count::__release_weak(v83);
    }
    uint64_t v80 = v10;
    v81 = v11;
    if (v11) {
      atomic_fetch_add_explicit(&v11->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v15 = VKCreateRoadSignImageWithSignType((const RoadSignMetrics *)((char *)self + 32), (const RoadSignPartMetrics *)self + 3, (uint64_t)self + 1376, &v80);
    if (v81) {
      std::__shared_weak_count::__release_weak(v81);
    }
    unsigned int v16 = *((unsigned __int8 *)self + 32);
    if (v16 <= 0xD)
    {
      int v17 = 1 << v16;
      if ((v17 & 0x3BF6) != 0)
      {
        CGFloat v18 = *((double *)self + 148);
        CGFloat v19 = *((double *)self + 149);
        CGFloat v20 = *((double *)self + 150);
        CGFloat v21 = *((double *)self + 151);
        long long v22 = (CGImage *)[v14 image];
        v89.origin.CGFloat x = v18;
        v89.origin.CGFloat y = v19;
        v89.size.CGFloat width = v20;
        v89.size.CGFloat height = v21;
        CGContextDrawImage(v9, v89, v22);
        CGFloat v23 = *((double *)self + 156);
        CGFloat v24 = *((double *)self + 157);
        CGFloat v25 = *((double *)self + 158);
        CGFloat v26 = *((double *)self + 159);
        long long v27 = (CGImage *)[v13 image];
        v90.origin.CGFloat x = v23;
        v90.origin.CGFloat y = v24;
        v90.size.CGFloat width = v25;
        v90.size.CGFloat height = v26;
        CGContextDrawImage(v9, v90, v27);
        CGFloat v28 = *((double *)self + 152);
        CGFloat v29 = *((double *)self + 153);
        CGFloat v30 = *((double *)self + 154);
        CGFloat v31 = *((double *)self + 155);
        long long v32 = (CGImage *)[v15 image];
        v91.origin.CGFloat x = v28;
        v91.origin.CGFloat y = v29;
        v91.size.CGFloat width = v30;
        v91.size.CGFloat height = v31;
        CGContextDrawImage(v9, v91, v32);
      }
      else if ((v17 & 0x408) != 0)
      {
        uint64_t v78 = v10;
        v79 = v11;
        if (v11) {
          atomic_fetch_add_explicit(&v11->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        }
        v49 = VKCreateRoadSignImageWithSignType((const RoadSignMetrics *)((char *)self + 32), (const RoadSignPartMetrics *)self + 5, (uint64_t)self + 1376, &v78);
        if (v79) {
          std::__shared_weak_count::__release_weak(v79);
        }
        CGFloat v50 = *((double *)self + 148);
        CGFloat v51 = *((double *)self + 149);
        CGFloat v52 = *((double *)self + 150);
        CGFloat v53 = *((double *)self + 151);
        v54 = (CGImage *)[v14 image];
        v93.origin.CGFloat x = v50;
        v93.origin.CGFloat y = v51;
        v93.size.CGFloat width = v52;
        v93.size.CGFloat height = v53;
        CGContextDrawImage(v9, v93, v54);
        if (*((double *)self + 137) > 0.0)
        {
          CGFloat v55 = *((double *)self + 164);
          CGFloat v56 = *((double *)self + 165);
          CGFloat v57 = *((double *)self + 166);
          CGFloat v58 = *((double *)self + 167);
          v59 = (CGImage *)[v13 image];
          v94.origin.CGFloat x = v55;
          v94.origin.CGFloat y = v56;
          v94.size.CGFloat width = v57;
          v94.size.CGFloat height = v58;
          CGContextDrawImage(v9, v94, v59);
        }
        CGFloat v60 = *((double *)self + 160);
        CGFloat v61 = *((double *)self + 161);
        CGFloat v62 = *((double *)self + 162);
        CGFloat v63 = *((double *)self + 163);
        v64 = (CGImage *)[v49 image];
        v95.origin.CGFloat x = v60;
        v95.origin.CGFloat y = v61;
        v95.size.CGFloat width = v62;
        v95.size.CGFloat height = v63;
        CGContextDrawImage(v9, v95, v64);
        if (*((double *)self + 137) > 0.0)
        {
          CGFloat v65 = *((double *)self + 168);
          CGFloat v66 = *((double *)self + 169);
          CGFloat v67 = *((double *)self + 170);
          CGFloat v68 = *((double *)self + 171);
          v69 = (CGImage *)[v13 image];
          v96.origin.CGFloat x = v65;
          v96.origin.CGFloat y = v66;
          v96.size.CGFloat width = v67;
          v96.size.CGFloat height = v68;
          CGContextDrawImage(v9, v96, v69);
        }
        CGFloat v70 = *((double *)self + 152);
        CGFloat v71 = *((double *)self + 153);
        CGFloat v72 = *((double *)self + 154);
        CGFloat v73 = *((double *)self + 155);
        v74 = (CGImage *)[v15 image];
        v97.origin.CGFloat x = v70;
        v97.origin.CGFloat y = v71;
        v97.size.CGFloat width = v72;
        v97.size.CGFloat height = v73;
        CGContextDrawImage(v9, v97, v74);
      }
    }
    uint64_t v33 = *((void *)self + 209);
    for (uint64_t i = *((void *)self + 210); v33 != i; v33 += 32)
    {
      CGContextSetRGBFillColor(v9, *(float *)(v33 + 16), *(float *)(v33 + 20), *(float *)(v33 + 24), *(float *)(v33 + 28));
      v92.origin.CGFloat x = *(double *)v33 + -2.0;
      v92.origin.CGFloat y = *(double *)(v33 + 8) + -2.0;
      v92.size.CGFloat width = 4.0;
      v92.size.CGFloat height = 4.0;
      CGContextFillRect(v9, v92);
    }
    uint64_t v35 = *((void *)self + 212);
    for (uint64_t j = *((void *)self + 213); v35 != j; v35 += 48)
    {
      CGContextSetRGBStrokeColor(v9, *(float *)(v35 + 32), *(float *)(v35 + 36), *(float *)(v35 + 40), *(float *)(v35 + 44));
      CGContextStrokeRect(v9, *(CGRect *)v35);
    }

    if (v11) {
      std::__shared_weak_count::__release_weak(v11);
    }
    if (*((void *)self + 1))
    {
      CGContextSetTextPosition(v9, *((CGFloat *)self + 142), *((CGFloat *)self + 143));
      CTLineDraw(*((CTLineRef *)self + 1), v9);
    }
    else
    {
      int v37 = (const __CTFrame *)*((void *)self + 2);
      if (v37) {
        goto LABEL_31;
      }
      if (*((void *)self + 3))
      {
        Mutable = CGPathCreateMutable();
        CGPathAddRect(Mutable, 0, *((CGRect *)self + 36));
        v87.location = 0;
        v87.length = 0;
        *((void *)self + 2) = CTFramesetterCreateFrame(*((CTFramesetterRef *)self + 3), v87, Mutable, 0);
        CFRelease(*((CFTypeRef *)self + 3));
        *((void *)self + 3) = 0;
        CFRelease(Mutable);
        int v37 = (const __CTFrame *)*((void *)self + 2);
        if (v37) {
LABEL_31:
        }
          CTFrameDraw(v37, v9);
      }
    }
    uint64_t v38 = *((void *)self + 206);
    if (v38)
    {
      unsigned __int8 v39 = atomic_load((unsigned __int8 *)(v38 + 143));
      if (v39) {
        id v40 = *(id *)(v38 + 16);
      }
      else {
        id v40 = 0;
      }
      id v41 = (CGImage *)[v40 image];
    }
    else
    {
      id v41 = (CGImage *)*((void *)self + 208);
      if (!v41) {
        goto LABEL_40;
      }
    }
    CGContextDrawImage(v9, *(CGRect *)((char *)self + 1064), v41);
LABEL_40:
    Image = CGBitmapContextCreateImage(v9);
    CGContextRelease(v9);
    v43 = [VKImage alloc];
    double v44 = *((double *)self + 6);
    v45 = (std::__shared_weak_count *)*((void *)self + 216);
    uint64_t v76 = *((void *)self + 215);
    v77 = v45;
    if (v45) {
      atomic_fetch_add_explicit(&v45->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v46 = [(VKImage *)v43 initWithCGImage:Image scale:&v76 resourceStore:v44];
    v47 = (void *)*((void *)self + 226);
    *((void *)self + 226) = v46;

    if (v77) {
      std::__shared_weak_count::__release_weak(v77);
    }
    CGImageRelease(Image);
    float v4 = (void *)*((void *)self + 226);
  }
  id v12 = v4;
LABEL_46:
  std::mutex::unlock(v3);
  return v12;
}

- (void)dealloc
{
  float64x2_t v3 = (const void *)*((void *)self + 208);
  if (v3) {
    CFRelease(v3);
  }
  float v4 = (const void *)*((void *)self + 3);
  if (v4) {
    CFRelease(v4);
  }
  double v5 = (const void *)*((void *)self + 2);
  if (v5) {
    CFRelease(v5);
  }
  double v6 = (const void *)*((void *)self + 1);
  if (v6) {
    CFRelease(v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)VKRoadSignArtwork;
  [(VKRoadSignArtwork *)&v7 dealloc];
}

- (VKRoadSignArtwork)initWithLine:(__CTLine *)a3 signMetrics:(RoadSignMetrics *)a4 textMetrics:(RoadSignTextMetrics *)a5 signColoring:glyph:cgGlyph:resourceStore:
{
  long long v8 = v7;
  float32x2_t v9 = v6;
  uint64_t v10 = v5;
  v47.receiver = self;
  v47.super_class = (Class)VKRoadSignArtwork;
  float v14 = [(VKRoadSignArtwork *)&v47 init];
  uint64_t v15 = v14;
  if (!v14) {
    goto LABEL_40;
  }
  long long v16 = *(_OWORD *)&a4->_contentScale;
  *((_OWORD *)v14 + 2) = *(_OWORD *)&a4->_orientation;
  *((_OWORD *)v14 + 3) = v16;
  long long v17 = *(_OWORD *)&a4->_arrowLength;
  long long v18 = *(_OWORD *)&a4->_arrowJoinCornerRadius;
  long long v19 = *(_OWORD *)&a4->_strokeWeight;
  *((_OWORD *)v14 + 6) = *(_OWORD *)&a4->_shadowOffset.height;
  *((_OWORD *)v14 + 7) = v19;
  *((_OWORD *)v14 + 4) = v17;
  *((_OWORD *)v14 + 5) = v18;
  long long v20 = *(_OWORD *)&a4->_signHeight;
  long long v21 = *(_OWORD *)&a4->_horizontalMargin;
  long long v22 = *(_OWORD *)&a4->_glyphSize.height;
  *((_OWORD *)v14 + 10) = *(_OWORD *)&a4->_cornerRadius;
  *((_OWORD *)v14 + 11) = v22;
  *((_OWORD *)v14 + 8) = v20;
  *((_OWORD *)v14 + 9) = v21;
  long long v23 = *(_OWORD *)&a5->_scale;
  long long v24 = *(_OWORD *)&a5->_horizontalMargin;
  long long v25 = *(_OWORD *)&a5->_verticalOffset;
  *((void *)v14 + 30) = *(void *)&a5->_secondaryTextSize;
  *((_OWORD *)v14 + 13) = v24;
  *((_OWORD *)v14 + 14) = v25;
  *((_OWORD *)v14 + 12) = v23;
  if (v14 + 192 != (char *)a5)
  {
    CGFloat v26 = (void **)(v14 + 248);
    char v27 = *((unsigned char *)&a5->_fontFamily.__r_.__value_.var0.__l + 23);
    if (v15[271] < 0)
    {
      if (v27 >= 0) {
        p_fontFamilCGFloat y = &a5->_fontFamily;
      }
      else {
        p_fontFamilCGFloat y = (basic_string<char, std::char_traits<char>, geo::StdAllocator<char, mdm::Allocator>> *)a5->_fontFamily.__r_.__value_.var0.__l.__data_;
      }
      if (v27 >= 0) {
        size_t size = *((unsigned __int8 *)&a5->_fontFamily.__r_.__value_.var0.__l + 23);
      }
      else {
        size_t size = a5->_fontFamily.__r_.__value_.var0.__l.__size_;
      }
      std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>::__assign_no_alias<false>(v26, p_fontFamily, size);
    }
    else if ((*((unsigned char *)&a5->_fontFamily.__r_.__value_.var0.__l + 23) & 0x80) != 0)
    {
      std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>::__assign_no_alias<true>((void **)v26, a5->_fontFamily.__r_.__value_.var0.__l.__data_, a5->_fontFamily.__r_.__value_.var0.__l.__size_);
    }
    else
    {
      long long v28 = *(_OWORD *)a5->_fontFamily.__r_.__value_.var0.__s.__data_;
      *((void *)v15 + 33) = *((void *)&a5->_fontFamily.__r_.__value_.var0.__l + 2);
      *(_OWORD *)CGFloat v26 = v28;
    }
    CGFloat v31 = (void **)(v15 + 280);
    char contentScale_high = HIBYTE(a5[1]._contentScale);
    if (v15[303] < 0)
    {
      if (contentScale_high >= 0) {
        p_var0 = &a5->_fontFamily.var0;
      }
      else {
        p_var0 = (void *)a5->_fontFamily.var0;
      }
      if (contentScale_high >= 0) {
        *(void *)&double scale = HIBYTE(a5[1]._contentScale);
      }
      else {
        double scale = a5[1]._scale;
      }
      std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>::__assign_no_alias<false>(v31, p_var0, *(size_t *)&scale);
    }
    else if ((HIBYTE(a5[1]._contentScale) & 0x80) != 0)
    {
      std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>::__assign_no_alias<true>((void **)v31, (void *)a5->_fontFamily.var0, *(void *)&a5[1]._scale);
    }
    else
    {
      long long v33 = *(_OWORD *)&a5->_fontFamily.var0;
      *((void *)v15 + 37) = *(void *)&a5[1]._contentScale;
      *(_OWORD *)CGFloat v31 = v33;
    }
  }
  long long v36 = *(_OWORD *)&a5[1]._verticalMargin;
  *((_WORD *)v15 + 164) = LOWORD(a5[1]._textSize);
  *(_OWORD *)(v15 + 312) = v36;
  *((void *)v15 + 172) = *v10;
  *((void *)v15 + 173) = v10[1];
  *((void *)v15 + 174) = v10[2];
  *((void *)v15 + 175) = v10[3];
  *((void *)v15 + 176) = v10[4];
  *((void *)v15 + 177) = v10[5];
  *((void *)v15 + 178) = v10[6];
  *((void *)v15 + 179) = v10[7];
  *((void *)v15 + 180) = v10[8];
  *((void *)v15 + 181) = v10[9];
  *((void *)v15 + 182) = v10[10];
  *((void *)v15 + 183) = v10[11];
  *((void *)v15 + 184) = v10[12];
  *((void *)v15 + 185) = v10[13];
  *((void *)v15 + 186) = v10[14];
  *((void *)v15 + 187) = v10[15];
  *((void *)v15 + 188) = v10[16];
  *((void *)v15 + 189) = v10[17];
  *((void *)v15 + 190) = v10[18];
  *((void *)v15 + 191) = v10[19];
  *((void *)v15 + 192) = v10[20];
  *((void *)v15 + 193) = v10[21];
  *((void *)v15 + 194) = v10[22];
  *((void *)v15 + 195) = v10[23];
  *((void *)v15 + 196) = v10[24];
  *((void *)v15 + 197) = v10[25];
  *((void *)v15 + 198) = v10[26];
  *((void *)v15 + 199) = v10[27];
  *((void *)v15 + 200) = v10[28];
  *((void *)v15 + 201) = v10[29];
  *((void *)v15 + 202) = v10[30];
  *((void *)v15 + 203) = v10[31];
  *((void *)v15 + 204) = v10[32];
  *((void *)v15 + 205) = v10[33];
  uint64_t v38 = *v9;
  uint64_t v37 = v9[1];
  if (v37) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v37 + 8), 1uLL, memory_order_relaxed);
  }
  *((void *)v15 + 206) = v38;
  unsigned __int8 v39 = (std::__shared_weak_count *)*((void *)v15 + 207);
  *((void *)v15 + 207) = v37;
  if (v39 && !atomic_fetch_add(&v39->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
    std::__shared_weak_count::__release_weak(v39);
    *((void *)v15 + 208) = v8;
    if (a3) {
      goto LABEL_30;
    }
LABEL_32:
    CFTypeRef v40 = 0;
    goto LABEL_33;
  }
  *((void *)v15 + 208) = v8;
  if (!a3) {
    goto LABEL_32;
  }
LABEL_30:
  CFTypeRef v40 = CFRetain(a3);
LABEL_33:
  *((void *)v15 + 2) = 0;
  *((void *)v15 + 3) = 0;
  *((void *)v15 + 1) = v40;
  uint64_t v42 = *v48;
  uint64_t v41 = v48[1];
  if (v41) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v41 + 16), 1uLL, memory_order_relaxed);
  }
  *((void *)v15 + 215) = v42;
  v43 = (std::__shared_weak_count *)*((void *)v15 + 216);
  *((void *)v15 + 216) = v41;
  if (v43) {
    std::__shared_weak_count::__release_weak(v43);
  }
  md::RoadSignGeneratedMetrics::RoadSignGeneratedMetrics((md::RoadSignGeneratedMetrics *)v46, (const RoadSignMetrics *)(v15 + 32), (const RoadSignTextMetrics *)v15 + 2);
  memcpy(v15 + 336, v46, 0x410uLL);
  if (*((void *)v15 + 208)) {
    CGImageRetain(v8);
  }
  double v44 = v15;
LABEL_40:

  return (VKRoadSignArtwork *)v15;
}

- (VKRoadSignArtwork)initWithFramesetter:(__CTFramesetter *)a3 signMetrics:(RoadSignMetrics *)a4 textMetrics:(RoadSignTextMetrics *)a5 signColoring:glyph:cgGlyph:resourceStore:
{
  long long v8 = v7;
  float32x2_t v9 = v6;
  uint64_t v10 = v5;
  v47.receiver = self;
  v47.super_class = (Class)VKRoadSignArtwork;
  float v14 = [(VKRoadSignArtwork *)&v47 init];
  uint64_t v15 = v14;
  if (v14)
  {
    long long v16 = *(_OWORD *)&a4->_contentScale;
    *((_OWORD *)v14 + 2) = *(_OWORD *)&a4->_orientation;
    *((_OWORD *)v14 + 3) = v16;
    long long v17 = *(_OWORD *)&a4->_arrowLength;
    long long v18 = *(_OWORD *)&a4->_arrowJoinCornerRadius;
    long long v19 = *(_OWORD *)&a4->_strokeWeight;
    *((_OWORD *)v14 + 6) = *(_OWORD *)&a4->_shadowOffset.height;
    *((_OWORD *)v14 + 7) = v19;
    *((_OWORD *)v14 + 4) = v17;
    *((_OWORD *)v14 + 5) = v18;
    long long v20 = *(_OWORD *)&a4->_signHeight;
    long long v21 = *(_OWORD *)&a4->_horizontalMargin;
    long long v22 = *(_OWORD *)&a4->_glyphSize.height;
    *((_OWORD *)v14 + 10) = *(_OWORD *)&a4->_cornerRadius;
    *((_OWORD *)v14 + 11) = v22;
    *((_OWORD *)v14 + 8) = v20;
    *((_OWORD *)v14 + 9) = v21;
    long long v23 = *(_OWORD *)&a5->_scale;
    long long v24 = *(_OWORD *)&a5->_horizontalMargin;
    long long v25 = *(_OWORD *)&a5->_verticalOffset;
    *((void *)v14 + 30) = *(void *)&a5->_secondaryTextSize;
    *((_OWORD *)v14 + 13) = v24;
    *((_OWORD *)v14 + 14) = v25;
    *((_OWORD *)v14 + 12) = v23;
    if (v14 + 192 != (char *)a5)
    {
      CGFloat v26 = (void **)(v14 + 248);
      char v27 = *((unsigned char *)&a5->_fontFamily.__r_.__value_.var0.__l + 23);
      if (v15[271] < 0)
      {
        if (v27 >= 0) {
          p_fontFamilCGFloat y = &a5->_fontFamily;
        }
        else {
          p_fontFamilCGFloat y = (basic_string<char, std::char_traits<char>, geo::StdAllocator<char, mdm::Allocator>> *)a5->_fontFamily.__r_.__value_.var0.__l.__data_;
        }
        if (v27 >= 0) {
          size_t size = *((unsigned __int8 *)&a5->_fontFamily.__r_.__value_.var0.__l + 23);
        }
        else {
          size_t size = a5->_fontFamily.__r_.__value_.var0.__l.__size_;
        }
        std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>::__assign_no_alias<false>(v26, p_fontFamily, size);
      }
      else if ((*((unsigned char *)&a5->_fontFamily.__r_.__value_.var0.__l + 23) & 0x80) != 0)
      {
        std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>::__assign_no_alias<true>((void **)v26, a5->_fontFamily.__r_.__value_.var0.__l.__data_, a5->_fontFamily.__r_.__value_.var0.__l.__size_);
      }
      else
      {
        long long v28 = *(_OWORD *)a5->_fontFamily.__r_.__value_.var0.__s.__data_;
        *((void *)v15 + 33) = *((void *)&a5->_fontFamily.__r_.__value_.var0.__l + 2);
        *(_OWORD *)CGFloat v26 = v28;
      }
      CGFloat v31 = (void **)(v15 + 280);
      char contentScale_high = HIBYTE(a5[1]._contentScale);
      if (v15[303] < 0)
      {
        if (contentScale_high >= 0) {
          p_var0 = &a5->_fontFamily.var0;
        }
        else {
          p_var0 = (void *)a5->_fontFamily.var0;
        }
        if (contentScale_high >= 0) {
          *(void *)&double scale = HIBYTE(a5[1]._contentScale);
        }
        else {
          double scale = a5[1]._scale;
        }
        std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>::__assign_no_alias<false>(v31, p_var0, *(size_t *)&scale);
      }
      else if ((HIBYTE(a5[1]._contentScale) & 0x80) != 0)
      {
        std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>::__assign_no_alias<true>((void **)v31, (void *)a5->_fontFamily.var0, *(void *)&a5[1]._scale);
      }
      else
      {
        long long v33 = *(_OWORD *)&a5->_fontFamily.var0;
        *((void *)v15 + 37) = *(void *)&a5[1]._contentScale;
        *(_OWORD *)CGFloat v31 = v33;
      }
    }
    long long v36 = *(_OWORD *)&a5[1]._verticalMargin;
    *((_WORD *)v15 + 164) = LOWORD(a5[1]._textSize);
    *(_OWORD *)(v15 + 312) = v36;
    *((void *)v15 + 172) = *v10;
    *((void *)v15 + 173) = v10[1];
    *((void *)v15 + 174) = v10[2];
    *((void *)v15 + 175) = v10[3];
    *((void *)v15 + 176) = v10[4];
    *((void *)v15 + 177) = v10[5];
    *((void *)v15 + 178) = v10[6];
    *((void *)v15 + 179) = v10[7];
    *((void *)v15 + 180) = v10[8];
    *((void *)v15 + 181) = v10[9];
    *((void *)v15 + 182) = v10[10];
    *((void *)v15 + 183) = v10[11];
    *((void *)v15 + 184) = v10[12];
    *((void *)v15 + 185) = v10[13];
    *((void *)v15 + 186) = v10[14];
    *((void *)v15 + 187) = v10[15];
    *((void *)v15 + 188) = v10[16];
    *((void *)v15 + 189) = v10[17];
    *((void *)v15 + 190) = v10[18];
    *((void *)v15 + 191) = v10[19];
    *((void *)v15 + 192) = v10[20];
    *((void *)v15 + 193) = v10[21];
    *((void *)v15 + 194) = v10[22];
    *((void *)v15 + 195) = v10[23];
    *((void *)v15 + 196) = v10[24];
    *((void *)v15 + 197) = v10[25];
    *((void *)v15 + 198) = v10[26];
    *((void *)v15 + 199) = v10[27];
    *((void *)v15 + 200) = v10[28];
    *((void *)v15 + 201) = v10[29];
    *((void *)v15 + 202) = v10[30];
    *((void *)v15 + 203) = v10[31];
    *((void *)v15 + 204) = v10[32];
    *((void *)v15 + 205) = v10[33];
    uint64_t v38 = *v9;
    uint64_t v37 = v9[1];
    if (v37) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v37 + 8), 1uLL, memory_order_relaxed);
    }
    *((void *)v15 + 206) = v38;
    unsigned __int8 v39 = (std::__shared_weak_count *)*((void *)v15 + 207);
    *((void *)v15 + 207) = v37;
    if (v39 && !atomic_fetch_add(&v39->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
      std::__shared_weak_count::__release_weak(v39);
    }
    *((void *)v15 + 208) = v8;
    *((void *)v15 + 1) = 0;
    *((void *)v15 + 2) = 0;
    if (a3) {
      CFTypeRef v40 = CFRetain(a3);
    }
    else {
      CFTypeRef v40 = 0;
    }
    *((void *)v15 + 3) = v40;
    uint64_t v42 = *v48;
    uint64_t v41 = v48[1];
    if (v41) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v41 + 16), 1uLL, memory_order_relaxed);
    }
    *((void *)v15 + 215) = v42;
    v43 = (std::__shared_weak_count *)*((void *)v15 + 216);
    *((void *)v15 + 216) = v41;
    if (v43) {
      std::__shared_weak_count::__release_weak(v43);
    }
    if (*((void *)v15 + 208)) {
      CGImageRetain(v8);
    }
    md::RoadSignGeneratedMetrics::RoadSignGeneratedMetrics((md::RoadSignGeneratedMetrics *)v46, (const RoadSignMetrics *)(v15 + 32), (const RoadSignTextMetrics *)v15 + 2);
    memcpy(v15 + 336, v46, 0x410uLL);
    double v44 = v15;
  }

  return (VKRoadSignArtwork *)v15;
}

@end