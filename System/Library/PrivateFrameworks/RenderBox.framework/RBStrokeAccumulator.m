@interface RBStrokeAccumulator
- (BOOL)rotatesImage;
- (CGImage)image;
- (CGRect)boundingRect;
- (RBStrokeAccumulator)init;
- (float)borderWidth;
- (float)imageScale;
- (float)maxLineWidth;
- (float)miterLimit;
- (id).cxx_construct;
- (id)commit;
- (id)copyWithZone:(_NSZone *)a3;
- (int)blendMode;
- (int)lineCap;
- (int)lineJoin;
- (int)strokeType;
- (int64_t)seed;
- (uint64_t)addPath:(uint64_t)a1 transform:(uint64_t)a2;
- (unint64_t)imageCount;
- (void)addElement:(unsigned __int8)a3 args:(const float *)a4;
- (void)addPath:(CGPath *)a3 transform:(CGAffineTransform *)a4;
- (void)applyFunction:(void *)a3 info:(void *)a4;
- (void)removeAllElements;
- (void)setBlendMode:(int)a3;
- (void)setImage:(CGImage *)a3;
- (void)setImageCount:(unint64_t)a3;
- (void)setImageScale:(float)a3;
- (void)setLineCap:(int)a3;
- (void)setLineJoin:(int)a3;
- (void)setMiterLimit:(float)a3;
- (void)setRotatesImage:(BOOL)a3;
- (void)setSeed:(int64_t)a3;
- (void)setStrokeType:(int)a3;
@end

@implementation RBStrokeAccumulator

- (RBStrokeAccumulator)init
{
  v3.receiver = self;
  v3.super_class = (Class)RBStrokeAccumulator;
  result = [(RBStrokeAccumulator *)&v3 init];
  if (result)
  {
    result->_imageScale = 1.0;
    result->_imageCount = 1;
    *(_OWORD *)&result->_strokeType = xmmword_214219960;
    *(void *)&result->_miterLimit = 1092616192;
    result->_seed = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(RBStrokeAccumulator);
  v5 = v4;
  if (!v4) {
    return v5;
  }
  p_elements = &v4->_elements;
  v4->_elements._unint64_t size = 0;
  p = self->_elements._p;
  unint64_t size = self->_elements._size;
  if (v4->_elements._capacity < size)
  {
    RB::vector<unsigned char,0ul,unsigned long>::reserve_slow((uint64_t)&v4->_elements, self->_elements._size);
    unint64_t v9 = v5->_elements._size;
  }
  else
  {
    unint64_t v9 = 0;
    if (!size) {
      goto LABEL_6;
    }
  }
  v10 = p_elements->_p;
  unint64_t v11 = size;
  do
  {
    unsigned __int8 v12 = *p++;
    v10[v9] = v12;
    ++v10;
    --v11;
  }
  while (v11);
LABEL_6:
  v5->_elements._unint64_t size = v9 + size;
  v5->_values._unint64_t size = 0;
  v14 = self->_values._p;
  unint64_t v13 = self->_values._size;
  if (v5->_values._capacity < v13)
  {
    RB::vector<float,0ul,unsigned long>::reserve_slow((uint64_t)&v5->_values, self->_values._size);
    unint64_t v15 = v5->_values._size;
LABEL_8:
    v16 = &v5->_values._p[v15];
    unint64_t v17 = v13;
    do
    {
      int v18 = *(_DWORD *)v14++;
      *(_DWORD *)v16++ = v18;
      --v17;
    }
    while (v17);
    goto LABEL_10;
  }
  unint64_t v15 = 0;
  if (v13) {
    goto LABEL_8;
  }
LABEL_10:
  v5->_values._unint64_t size = v15 + v13;
  v19 = self->_image._p;
  v20 = v5->_image._p;
  if (v20 != v19)
  {
    if (v20) {
      CFRelease(v20);
    }
    if (v19) {
      v21 = (CGImage *)CFRetain(v19);
    }
    else {
      v21 = 0;
    }
    v5->_image._p = v21;
  }
  v5->_imageScale = self->_imageScale;
  v5->_imageCount = self->_imageCount;
  *(_OWORD *)&v5->_strokeType = *(_OWORD *)&self->_strokeType;
  v5->_miterLimit = self->_miterLimit;
  v5->_seed = self->_seed;
  if (self->_hasBounds)
  {
    CGSize v22 = self->_bounds.size;
    v5->_bounds.origin = self->_bounds.origin;
    v5->_bounds.unint64_t size = v22;
    v5->_borderWidth = self->_borderWidth;
    v5->_hasBounds = 1;
  }
  v5->_rotatesImage = self->_rotatesImage;
  return v5;
}

- (id)commit
{
  *((unsigned char *)self + 149) = 1;
  return self;
}

- (void)addElement:(unsigned __int8)a3 args:(const float *)a4
{
  if (self->_committed) {
    RB::precondition_failure((RB *)"already committed stroke", a2, a3, a4);
  }
  unsigned int v5 = a3;
  unint64_t size = self->_elements._size;
  size_t v8 = size + 1;
  if (self->_elements._capacity < size + 1)
  {
    RB::vector<unsigned char,0ul,unsigned long>::reserve_slow((uint64_t)&self->_elements, v8);
    unint64_t size = self->_elements._size;
    size_t v8 = size + 1;
  }
  self->_elements._p[size] = v5;
  self->_elements._unint64_t size = v8;
  if (v5 <= 0xF && v5 != 4)
  {
    uint64_t v9 = 0;
    uint64_t v10 = RB::Stroke::element_args(RBStrokeElement)::elts[v5];
    unint64_t v11 = self->_values._size;
    do
    {
      unint64_t v12 = v11 + 1;
      if (self->_values._capacity < v11 + 1)
      {
        RB::vector<float,0ul,unsigned long>::reserve_slow((uint64_t)&self->_values, v12);
        unint64_t v11 = self->_values._size;
        unint64_t v12 = v11 + 1;
      }
      self->_values._p[v11] = a4[v9];
      self->_values._unint64_t size = v12;
      ++v9;
      unint64_t v11 = v12;
    }
    while (v10 != v9);
    if (v5 == 5)
    {
      float maxLineWidth = self->_maxLineWidth;
      if (maxLineWidth < *a4) {
        float maxLineWidth = *a4;
      }
      self->_float maxLineWidth = maxLineWidth;
    }
  }
}

- (void)addPath:(CGPath *)a3 transform:(CGAffineTransform *)a4
{
  if (self->_committed) {
    RB::precondition_failure((RB *)"already committed stroke", a2, a3, a4);
  }
  info = self;
  long long v4 = *(_OWORD *)&a4->c;
  long long v6 = *(_OWORD *)&a4->a;
  long long v7 = v4;
  long long v8 = *(_OWORD *)&a4->tx;
  CGPathApply(a3, &info, (CGPathApplierFunction)-[RBStrokeAccumulator addPath:transform:]::$_0::__invoke);
}

- (void)removeAllElements
{
  if (self->_committed) {
    RB::precondition_failure((RB *)"already committed stroke", a2);
  }
  self->_elements._unint64_t size = 0;
  self->_values._unint64_t size = 0;
  self->_float maxLineWidth = 0.0;
}

- (int)strokeType
{
  return self->_strokeType;
}

- (void)setStrokeType:(int)a3
{
  if (self->_committed) {
    RB::precondition_failure((RB *)"already committed stroke", a2, *(void *)&a3);
  }
  self->_strokeType = a3;
}

- (CGImage)image
{
  return self->_image._p;
}

- (void)setImage:(CGImage *)a3
{
  if (self->_committed) {
    RB::precondition_failure((RB *)"already committed stroke", a2, a3);
  }
  p = self->_image._p;
  if (p != a3)
  {
    if (p) {
      CFRelease(p);
    }
    if (a3) {
      long long v6 = (CGImage *)CFRetain(a3);
    }
    else {
      long long v6 = 0;
    }
    self->_image._p = v6;
  }
}

- (float)imageScale
{
  return self->_imageScale;
}

- (void)setImageScale:(float)a3
{
  if (self->_committed) {
    RB::precondition_failure((RB *)"already committed stroke", a2);
  }
  self->_imageScale = a3;
}

- (unint64_t)imageCount
{
  return self->_imageCount;
}

- (void)setImageCount:(unint64_t)a3
{
  if (self->_committed) {
    RB::precondition_failure((RB *)"already committed stroke", a2, a3);
  }
  self->_imageCount = a3;
}

- (BOOL)rotatesImage
{
  return self->_rotatesImage;
}

- (void)setRotatesImage:(BOOL)a3
{
  if (self->_committed) {
    RB::precondition_failure((RB *)"already committed stroke", a2, a3);
  }
  self->_rotatesImage = a3;
}

- (int)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(int)a3
{
  if (self->_committed) {
    RB::precondition_failure((RB *)"already committed stroke", a2, *(void *)&a3);
  }
  self->_blendMode = a3;
}

- (int)lineCap
{
  return self->_lineCap;
}

- (void)setLineCap:(int)a3
{
  if (self->_committed) {
    RB::precondition_failure((RB *)"already committed stroke", a2, *(void *)&a3);
  }
  self->_lineCap = a3;
}

- (int)lineJoin
{
  return self->_lineJoin;
}

- (void)setLineJoin:(int)a3
{
  if (self->_committed) {
    RB::precondition_failure((RB *)"already committed stroke", a2, *(void *)&a3);
  }
  self->_lineJoin = a3;
}

- (float)miterLimit
{
  return self->_miterLimit;
}

- (void)setMiterLimit:(float)a3
{
  if (self->_committed) {
    RB::precondition_failure((RB *)"already committed stroke", a2);
  }
  self->_miterLimit = a3;
}

- (float)maxLineWidth
{
  return self->_maxLineWidth;
}

- (int64_t)seed
{
  return self->_seed;
}

- (void)setSeed:(int64_t)a3
{
  if (self->_committed) {
    RB::precondition_failure((RB *)"already committed stroke", a2, a3);
  }
  self->_seed = a3;
}

- (CGRect)boundingRect
{
  if (self->_hasBounds)
  {
    double x = self->_bounds.origin.x;
    double y = self->_bounds.origin.y;
    double width = self->_bounds.size.width;
    double height = self->_bounds.size.height;
  }
  else
  {
    RBStrokeBoundingRect(self, &self->_borderWidth);
    self->_bounds.origin.double x = x;
    self->_bounds.origin.double y = y;
    self->_bounds.size.double width = width;
    self->_bounds.size.double height = height;
    self->_hasBounds = 1;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (float)borderWidth
{
  if (!self->_hasBounds)
  {
    RBStrokeBoundingRect(self, &self->_borderWidth);
    self->_bounds.origin.double x = v3;
    self->_bounds.origin.double y = v4;
    self->_bounds.size.double width = v5;
    self->_bounds.size.double height = v6;
    self->_hasBounds = 1;
  }
  return self->_borderWidth;
}

- (void)applyFunction:(void *)a3 info:(void *)a4
{
  unint64_t size = self->_elements._size;
  if (size) {
    ((void (*)(unint64_t, unsigned __int8 *, float *, void *))a3)(size, self->_elements._p, self->_values._p, a4);
  }
}

- (void).cxx_destruct
{
  p = self->_image._p;
  if (p) {
    CFRelease(p);
  }
  CGFloat v4 = self->_values._p;
  if (v4) {
    free(v4);
  }
  CGFloat v5 = self->_elements._p;
  if (v5)
  {
    free(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (uint64_t)addPath:(uint64_t)a1 transform:(uint64_t)a2
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  switch(*(_DWORD *)a2)
  {
    case 0:
      uint64_t v2 = 0;
      unint64_t v34 = (unint64_t)vcvt_f32_f64(vmlaq_n_f64(vmlaq_n_f64(*(float64x2_t *)(a1 + 40), *(float64x2_t *)(a1 + 8), **(double **)(a2 + 8)), *(float64x2_t *)(a1 + 24), *(double *)(*(void *)(a2 + 8) + 8)));
      break;
    case 1:
      unint64_t v34 = (unint64_t)vcvt_f32_f64(vmlaq_n_f64(vmlaq_n_f64(*(float64x2_t *)(a1 + 40), *(float64x2_t *)(a1 + 8), **(double **)(a2 + 8)), *(float64x2_t *)(a1 + 24), *(double *)(*(void *)(a2 + 8) + 8)));
      uint64_t v2 = 1;
      break;
    case 2:
      CGFloat v3 = *(double **)(a2 + 8);
      double v4 = v3[1];
      double v5 = *(double *)(a1 + 8);
      double v6 = *(double *)(a1 + 16);
      double v7 = *(double *)(a1 + 24);
      double v8 = *(double *)(a1 + 32);
      double v9 = *(double *)(a1 + 40);
      double v10 = *(double *)(a1 + 48);
      double v11 = v10 + v6 * *v3 + v8 * v4;
      *(float *)&double v4 = v9 + v5 * *v3 + v7 * v4;
      *(float *)&double v11 = v11;
      unint64_t v34 = __PAIR64__(LODWORD(v11), LODWORD(v4));
      double v12 = v3[2];
      double v13 = v3[3];
      double v14 = v9 + v12 * v5 + v13 * v7;
      double v15 = v10 + v12 * v6 + v13 * v8;
      *(float *)&double v13 = v14;
      *(float *)&double v15 = v15;
      int v35 = LODWORD(v13);
      int v36 = LODWORD(v15);
      uint64_t v2 = 2;
      break;
    case 3:
      v16 = *(double **)(a2 + 8);
      double v17 = v16[1];
      double v18 = *(double *)(a1 + 8);
      double v19 = *(double *)(a1 + 16);
      double v20 = *(double *)(a1 + 24);
      double v21 = *(double *)(a1 + 32);
      double v22 = *(double *)(a1 + 40);
      double v23 = *(double *)(a1 + 48);
      double v24 = v23 + v19 * *v16 + v21 * v17;
      *(float *)&double v17 = v22 + v18 * *v16 + v20 * v17;
      *(float *)&double v24 = v24;
      unint64_t v34 = __PAIR64__(LODWORD(v24), LODWORD(v17));
      double v25 = v16[2];
      double v26 = v16[3];
      double v27 = v22 + v25 * v18 + v26 * v20;
      double v28 = v23 + v25 * v19 + v26 * v21;
      *(float *)&double v26 = v27;
      *(float *)&double v28 = v28;
      int v35 = LODWORD(v26);
      int v36 = LODWORD(v28);
      double v29 = v16[4];
      double v30 = v16[5];
      double v31 = v22 + v29 * v18 + v30 * v20;
      double v32 = v23 + v29 * v19 + v30 * v21;
      *(float *)&double v30 = v31;
      *(float *)&double v32 = v32;
      int v37 = LODWORD(v30);
      int v38 = LODWORD(v32);
      uint64_t v2 = 3;
      break;
    case 4:
      uint64_t v2 = 4;
      break;
    default:
      uint64_t v2 = 0;
      break;
  }
  return [*(id *)a1 addElement:v2 args:&v34];
}

@end