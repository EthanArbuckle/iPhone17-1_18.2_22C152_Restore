@interface NUMutableBrushStroke
- (NUMutableBrushStroke)initWithRadius:(float)a3 softness:(float)a4 opacity:(float)a5 clipRect:(id *)a6 pressureMode:(int64_t)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)points;
- (void)appendPoint:(id)a3;
- (void)appendPoints:(id *)a3 pointCount:(int64_t)a4;
- (void)applyTransform:(CGAffineTransform *)a3;
- (void)setRadius:(float)a3;
@end

@implementation NUMutableBrushStroke

- (void)setRadius:(float)a3
{
  self->super._radius = a3;
  [(NUBrushStroke *)self _updateExtent];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(NSMutableData *)self->super._data mutableCopy];
  v6 = [+[NUBrushStroke allocWithZone:a3] init];
  *(float *)&double v7 = self->super._radius;
  *(float *)&double v8 = self->super._softness;
  *(float *)&double v9 = self->super._opacity;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 size = self->super._extent.size;
  v14[0] = self->super._extent.origin;
  v14[1] = size;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 v11 = self->super._clipRect.size;
  v13[0] = self->super._clipRect.origin;
  v13[1] = v11;
  [(NUBrushStroke *)v6 _initializeWithRadius:v14 softness:v13 opacity:v5 extent:self->super._pressureMode clipRect:v7 data:v8 pressureMode:v9];
  if ((!self->super._extent.size.width || !self->super._extent.size.height)
    && [(NUBrushStroke *)v6 pointCount] >= 1)
  {
    [(NUBrushStroke *)v6 _updateExtent];
  }

  return v6;
}

- (void)applyTransform:(CGAffineTransform *)a3
{
  uint64_t v5 = [(NUBrushStroke *)self pointCount];
  float64x2_t v6 = vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, self->super._radius), *(float64x2_t *)&a3->a, self->super._radius);
  double v7 = v6.f64[1];
  if (v6.f64[0] >= v6.f64[1]) {
    double v7 = v6.f64[0];
  }
  float v8 = v7;
  self->super._radius = v8;
  if (v5 >= 1)
  {
    uint64_t v9 = v5;
    double v10 = v8 * 2.0 + 1.0;
    $5BB7312FFE32F1AB3F1F5957C99A58B3 v11 = [(NSMutableData *)self->super._data mutableBytes];
    v12 = &v11[3 * v9];
    int64x2_t v13 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    $5BB7312FFE32F1AB3F1F5957C99A58B3 v14 = ($5BB7312FFE32F1AB3F1F5957C99A58B3)0;
    do
    {
      CGSize v16 = (CGSize)v14;
      CGPoint v17 = (CGPoint)v13;
      float64x2_t v15 = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v11[1]), *(float64x2_t *)&a3->a, *v11));
      *(float32x2_t *)$5BB7312FFE32F1AB3F1F5957C99A58B3 v11 = vcvt_f32_f64(v15);
      v11 += 3;
      v19.origin = (CGPoint)vsubq_f64(v15, (float64x2_t)vdupq_lane_s64(COERCE__INT64(self->super._radius), 0));
      v19.size.width = v10;
      v19.size.height = v10;
      NU::RectT<long>::RectT(v18, &v19, 0);
      v19.origin = v17;
      v19.$5BB7312FFE32F1AB3F1F5957C99A58B3 size = v16;
      NU::RectT<long>::add((uint64_t *)v18, (uint64_t *)&v19);
      int64x2_t v13 = (int64x2_t)v18[0];
      $5BB7312FFE32F1AB3F1F5957C99A58B3 v14 = ($5BB7312FFE32F1AB3F1F5957C99A58B3)v18[1];
    }
    while (v11 != v12);
    self->super._extent.origin = ($86B46DF249C2B4242DBB096758D29184)v18[0];
    self->super._extent.$5BB7312FFE32F1AB3F1F5957C99A58B3 size = v14;
  }
}

- (void)appendPoints:(id *)a3 pointCount:(int64_t)a4
{
  int64_t width = self->super._extent.size.width;
  int64_t height = self->super._extent.size.height;
  if (width) {
    BOOL v9 = height == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    int64_t y = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v13 = 0x8000000000000000;
    uint64_t v12 = 0x8000000000000000;
    int64_t x = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    int64_t x = self->super._extent.origin.x;
    int64_t y = self->super._extent.origin.y;
    uint64_t v12 = width + x;
    uint64_t v13 = height + y;
  }
  [(NUBrushStroke *)self radius];
  if (a4 >= 1)
  {
    double v15 = (float)((float)(*(float *)v14.i32 * 2.0) + 1.0);
    float32x2_t v16 = (float32x2_t)vdup_lane_s32(v14, 0);
    CGPoint v17 = a3;
    int64_t v18 = a4;
    do
    {
      float32x2_t v19 = *(float32x2_t *)&v17->var0;
      ++v17;
      v22.origin = (CGPoint)vcvtq_f64_f32(vsub_f32(v19, v16));
      v22.size.int64_t width = v15;
      v22.size.int64_t height = v15;
      NU::RectT<long>::RectT(v21, &v22, 0);
      int64x2_t v20 = vaddq_s64(v21[1], v21[0]);
      if (v21[0].i64[0] < x) {
        int64_t x = v21[0].i64[0];
      }
      if (v12 <= v20.i64[0]) {
        uint64_t v12 = v20.i64[0];
      }
      if (v21[0].i64[1] < y) {
        int64_t y = v21[0].i64[1];
      }
      if (v13 <= v20.i64[1]) {
        uint64_t v13 = v20.i64[1];
      }
      --v18;
    }
    while (v18);
  }
  self->super._extent.origin.int64_t x = x;
  self->super._extent.origin.int64_t y = y;
  self->super._extent.size.int64_t width = v12 - x;
  self->super._extent.size.int64_t height = v13 - y;
  [(NSMutableData *)self->super._data appendBytes:a3 length:12 * a4];
}

- (void)appendPoint:(id)a3
{
  float var1 = a3.var1;
  float var0 = a3.var0;
  $E2C29196C7A5C696474C6955C5A9CE06 v10 = a3;
  [(NUBrushStroke *)self radius];
  v12.origin.int64_t x = (float)(var0 - v6);
  v12.origin.int64_t y = (float)(var1 - v6);
  v12.size.int64_t width = (float)((float)(v6 * 2.0) + 1.0);
  v12.size.int64_t height = v12.size.width;
  NU::RectT<long>::RectT(&v11, &v12, 0);
  CGPoint origin = (CGPoint)self->super._extent.origin;
  CGSize size = (CGSize)self->super._extent.size;
  CGRect v12 = v11;
  v11.CGPoint origin = origin;
  v11.CGSize size = size;
  NU::RectT<long>::add((uint64_t *)&v11, (uint64_t *)&v12);
  CGSize v9 = v11.size;
  self->super._extent.CGPoint origin = ($86B46DF249C2B4242DBB096758D29184)v11.origin;
  self->super._extent.CGSize size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)v9;
  [(NSMutableData *)self->super._data appendBytes:&v10 length:12];
}

- (id)points
{
  v2 = (void *)[(NSMutableData *)self->super._data copy];

  return v2;
}

- (NUMutableBrushStroke)initWithRadius:(float)a3 softness:(float)a4 opacity:(float)a5 clipRect:(id *)a6 pressureMode:(int64_t)a7
{
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:6000];
  v20.receiver = self;
  v20.super_class = (Class)NUMutableBrushStroke;
  int32x2_t v14 = [(NUMutableBrushStroke *)&v20 init];
  memset(v19, 0, sizeof(v19));
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a6->var1;
  v18[0] = a6->var0;
  v18[1] = var1;
  *(float *)&var1.float var0 = a4;
  *(float *)&double v16 = a5;
  [(NUBrushStroke *)v14 _initializeWithRadius:v19 softness:v18 opacity:v13 extent:a7 clipRect:COERCE_DOUBLE(__PAIR64__(DWORD1(v18[0]), LODWORD(a3))) data:*(double *)&var1.var0 pressureMode:v16];

  return v14;
}

@end