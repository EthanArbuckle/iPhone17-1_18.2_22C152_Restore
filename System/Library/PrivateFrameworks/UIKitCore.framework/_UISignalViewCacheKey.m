@interface _UISignalViewCacheKey
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCacheKey:(id)a3;
- (_UISignalViewCacheKey)initWithClass:(Class)a3 size:(CGSize)a4 rect:(CGRect)a5 radius:(double)a6 lineWidth:(double)a7 alternate:(BOOL)a8 scale:(double)a9;
- (double)initWithClass:(double)a3 size:(double)a4 rect:(double)a5 radius:(double)a6 lineWidth:(double)a7 secondarySize:(double)a8 secondaryRect:(double)a9 alternate:(uint64_t)a10 scale:(uint64_t)a11;
- (unint64_t)hash;
@end

@implementation _UISignalViewCacheKey

- (unint64_t)hash
{
  uint64_t v3 = [(objc_class *)self->_classType hash];
  int8x16_t v4 = veorq_s8(veorq_s8(veorq_s8((int8x16_t)vcvtq_s64_f64((float64x2_t)self->_size), (int8x16_t)vcvtq_s64_f64((float64x2_t)self->_rect.size)), veorq_s8((int8x16_t)vcvtq_s64_f64((float64x2_t)self->_rect.origin), (int8x16_t)vcvtq_s64_f64(*(float64x2_t *)&self->_radius))), veorq_s8((int8x16_t)vcvtq_s64_f64((float64x2_t)self->_secondarySize), (int8x16_t)vcvtq_s64_f64((float64x2_t)self->_secondaryRect.origin)));
  return *(void *)&veor_s8(*(int8x8_t *)v4.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL)) ^ (uint64_t)self->_secondaryRect.size.width ^ (uint64_t)self->_secondaryRect.size.height ^ (uint64_t)self->_scale ^ v3 ^ self->_alternate;
}

- (_UISignalViewCacheKey)initWithClass:(Class)a3 size:(CGSize)a4 rect:(CGRect)a5 radius:(double)a6 lineWidth:(double)a7 alternate:(BOOL)a8 scale:(double)a9
{
  return -[_UISignalViewCacheKey initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:](self, "initWithClass:size:rect:radius:lineWidth:secondarySize:secondaryRect:alternate:scale:", a3, a8, a4.width, a4.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a6, a7, *MEMORY[0x1E4F1DB30], *(void *)(MEMORY[0x1E4F1DB30] + 8), *MEMORY[0x1E4F1DB20], *(void *)(MEMORY[0x1E4F1DB20] + 8), *(void *)(MEMORY[0x1E4F1DB20] + 16), *(void *)(MEMORY[0x1E4F1DB20] + 24), *(void *)&a9);
}

- (double)initWithClass:(double)a3 size:(double)a4 rect:(double)a5 radius:(double)a6 lineWidth:(double)a7 secondarySize:(double)a8 secondaryRect:(double)a9 alternate:(uint64_t)a10 scale:(uint64_t)a11
{
  v34.receiver = a1;
  v34.super_class = (Class)_UISignalViewCacheKey;
  result = (double *)objc_msgSendSuper2(&v34, sel_init);
  if (result)
  {
    *((void *)result + 1) = a11;
    result[2] = a2;
    result[3] = a3;
    result[4] = a4;
    result[5] = a5;
    result[6] = a6;
    result[7] = a7;
    result[8] = a8;
    result[9] = a9;
    *((void *)result + 10) = a17;
    *((void *)result + 11) = a18;
    *((void *)result + 12) = a19;
    *((void *)result + 13) = a20;
    *((void *)result + 14) = a21;
    *((void *)result + 15) = a22;
    *((unsigned char *)result + 128) = a12;
    *((void *)result + 17) = a23;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int8x16_t v4 = (_UISignalViewCacheKey *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(_UISignalViewCacheKey *)self isEqualToCacheKey:v4];
  }

  return v5;
}

- (BOOL)isEqualToCacheKey:(id)a3
{
  int8x16_t v4 = (CGRect *)a3;
  BOOL v5 = v4;
  if (self->_classType != *(Class *)&v4->origin.y
    || (self->_size.width == v4->size.width ? (BOOL v6 = self->_size.height == v4->size.height) : (BOOL v6 = 0),
        !v6
     || !CGRectEqualToRect(self->_rect, v4[1])
     || vabdd_f64(self->_radius, v5[2].origin.x) > 0.00000011920929
     || vabdd_f64(self->_lineWidth, v5[2].origin.y) > 0.00000011920929))
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  BOOL v7 = 0;
  if (self->_secondarySize.width == v5[2].size.width && self->_secondarySize.height == v5[2].size.height)
  {
    if (CGRectEqualToRect(self->_secondaryRect, v5[3])
      && self->_alternate == LOBYTE(v5[4].origin.x)
      && vabdd_f64(self->_scale, v5[4].origin.y) <= 0.00000011920929)
    {
      BOOL v7 = 1;
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_16:

  return v7;
}

@end