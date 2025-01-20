@interface IPARegion
+ (id)region;
+ (id)regionWithRect:(CGRect)a3;
+ (id)regionWithRectArray:(id)a3;
+ (id)regionWithRegion:(id)a3;
- (BOOL)includesRect:(CGRect)a3;
- (BOOL)includesRegion:(id)a3;
- (BOOL)intersectsRect:(CGRect)a3;
- (BOOL)intersectsRegion:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRegion:(id)a3;
- (CGRect)bounds;
- (IPARegion)init;
- (IPARegion)initWithRect:(CGRect)a3;
- (IPARegion)initWithRectArray:(id)a3;
- (IPARegion)initWithRegion:(id)a3;
- (double)area;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)regionByAddingRect:(CGRect)a3;
- (id)regionByAddingRectArray:(id)a3;
- (id)regionByAddingRegion:(id)a3;
- (id)regionByApplyingAffineTransform:(CGAffineTransform *)a3;
- (id)regionByApplyingOrientation:(int64_t)a3 imageSize:(CGSize)a4;
- (id)regionByClippingToRect:(CGRect)a3;
- (id)regionByClippingToRectArray:(id)a3;
- (id)regionByClippingToRegion:(id)a3;
- (id)regionByExcludingRect:(CGRect)a3;
- (id)regionByExcludingRegion:(id)a3;
- (id)regionByFlippingInRect:(CGRect)a3;
- (id)regionByGrowingBy:(CGPoint)a3;
- (id)regionByGrowingBy:(CGPoint)a3 inRect:(CGRect)a4;
- (id)regionByRemovingRect:(CGRect)a3;
- (id)regionByRemovingRectArray:(id)a3;
- (id)regionByRemovingRegion:(id)a3;
- (id)regionByRoundingDown;
- (id)regionByRoundingUp;
- (id)regionByScalingBy:(CGPoint)a3;
- (id)regionByShrinkingBy:(CGPoint)a3;
- (id)regionByShrinkingBy:(CGPoint)a3 inRect:(CGRect)a4;
- (id)regionByTranslatingBy:(CGPoint)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)dealloc;
- (void)enumerateRects:(id)a3;
@end

@implementation IPARegion

- (double)area
{
  v2 = (double *)*((void *)self->_imp + 2);
  if (!v2) {
    return 0.0;
  }
  double result = 0.0;
  do
  {
    double result = result + v2[4] * v2[5];
    v2 = *(double **)v2;
  }
  while (v2);
  return result;
}

- (BOOL)includesRegion:(id)a3
{
  return a3 && PA::Region::Includes((PA::Region *)self->_imp, *((const PA::Region **)a3 + 1));
}

- (BOOL)includesRect:(CGRect)a3
{
  imp = (PA::Region *)self->_imp;
  CGRect v5 = a3;
  PA::Region::Region((PA::Region *)v6, (const PA::Rect *)&v5);
  LOBYTE(imp) = PA::Region::Includes(imp, (const PA::Region *)v6);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v6);
  return (char)imp;
}

- (BOOL)intersectsRegion:(id)a3
{
  if (a3) {
    return PA::Region::Intersects(*((void *)self->_imp + 2), *((void *)a3 + 1));
  }
  else {
    return 0;
  }
}

- (BOOL)intersectsRect:(CGRect)a3
{
  imp = self->_imp;
  CGRect v5 = a3;
  PA::Region::Region((PA::Region *)v6, (const PA::Rect *)&v5);
  LOBYTE(imp) = PA::Region::Intersects(imp[2], (uint64_t)v6);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v6);
  return (char)imp;
}

- (CGRect)bounds
{
  double Bounds = PA::Region::GetBounds(*((PA::Region **)self->_imp + 2));
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = Bounds;
  return result;
}

- (void)enumerateRects:(id)a3
{
  for (i = (double *)*((void *)self->_imp + 2); i; i = *(double **)i)
    (*((void (**)(id, SEL, double, double, double, double))a3 + 2))(a3, a2, i[2], i[3], i[4], i[5]);
}

- (BOOL)isEqualToRegion:(id)a3
{
  if (!a3) {
    return 0;
  }
  imp = self->_imp;
  double v4 = (void *)*((void *)a3 + 1);
  if (imp[3] == v4[3])
  {
    double v5 = imp + 2;
    while (1)
    {
      double v5 = (void *)*v5;
      BOOL result = v5 == 0;
      if (!v5) {
        return result;
      }
      int8x8_t v7 = (int8x8_t)v4[1];
      if (!*(void *)&v7) {
        return 0;
      }
      unint64_t v8 = (v5[2] + 4095) & 0xFFFFFFFF00000000 ^ ((unint64_t)(v5[3] + 4095) >> 32 << 24) ^ ((unint64_t)(v5[4] + 4095) >> 32 << 8) ^ ((unint64_t)(v5[5] + 4095) >> 32);
      uint8x8_t v9 = (uint8x8_t)vcnt_s8(v7);
      v9.i16[0] = vaddlv_u8(v9);
      unint64_t v10 = v9.u32[0];
      if (v9.u32[0] > 1uLL)
      {
        unint64_t v11 = (v5[2] + 4095) & 0xFFFFFFFF00000000 ^ ((unint64_t)(v5[3] + 4095) >> 32 << 24) ^ ((unint64_t)(v5[4] + 4095) >> 32 << 8) ^ ((unint64_t)(v5[5] + 4095) >> 32);
        if (v8 >= *(void *)&v7) {
          unint64_t v11 = v8 % *(void *)&v7;
        }
      }
      else
      {
        unint64_t v11 = v8 & (*(void *)&v7 - 1);
      }
      v12 = *(void **)(*v4 + 8 * v11);
      if (!v12) {
        return 0;
      }
      v13 = (void *)*v12;
      if (!*v12) {
        return 0;
      }
      while (1)
      {
        unint64_t v14 = v13[1];
        if (v8 == v14) {
          break;
        }
        if (v10 > 1)
        {
          if (v14 >= *(void *)&v7) {
            v14 %= *(void *)&v7;
          }
        }
        else
        {
          v14 &= *(void *)&v7 - 1;
        }
        if (v14 != v11) {
          return 0;
        }
LABEL_20:
        v13 = (void *)*v13;
        if (!v13) {
          return 0;
        }
      }
      if (!PA::RectEqualTo::operator()(v13 + 2, v5 + 2)) {
        goto LABEL_20;
      }
      BOOL v15 = PA::RectEqualTo::operator()(v5 + 2, v13 + 2);
      BOOL result = 0;
      if (!v15) {
        return result;
      }
    }
  }
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [v4 isEqualToRegion:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  v2 = (uint64_t *)*((void *)self->_imp + 2);
  if (!v2) {
    return 0;
  }
  unint64_t result = 0;
  int64x2_t v4 = vdupq_n_s64(0xFFFuLL);
  do
  {
    int8x16_t v5 = vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)vaddq_s64(*(int64x2_t *)(v2 + 3), v4), (uint64x2_t)xmmword_1DD4240A0), (int8x16_t)xmmword_1DD4240B0);
    result ^= (v2[2] + 4095) & 0xFFFFFFFF00000000 ^ v5.i64[0] ^ v5.i64[1] ^ ((unint64_t)(v2[5] + 4095) >> 32);
    v2 = (uint64_t *)*v2;
  }
  while (v2);
  return result;
}

- (BOOL)isEmpty
{
  return *((void *)self->_imp + 3) == 0;
}

- (unint64_t)count
{
  return *((void *)self->_imp + 3);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  int64x2_t v4 = +[IPAMutableRegion allocWithZone:a3];
  return [(IPARegion *)v4 initWithRegion:self];
}

+ (id)regionWithRegion:(id)a3
{
  id v4 = a3;
  int8x16_t v5 = (void *)[objc_alloc((Class)a1) initWithRegion:v4];

  return v5;
}

+ (id)regionWithRectArray:(id)a3
{
  id v4 = a3;
  int8x16_t v5 = (void *)[objc_alloc((Class)a1) initWithRectArray:v4];

  return v5;
}

+ (id)regionWithRect:(CGRect)a3
{
  double v3 = objc_msgSend(objc_alloc((Class)a1), "initWithRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return v3;
}

+ (id)region
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (id)description
{
  double v3 = [MEMORY[0x1E4F1CA48] array];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __24__IPARegion_description__block_invoke;
  v11[3] = &unk_1E6CC1F10;
  id v4 = v3;
  id v12 = v4;
  [(IPARegion *)self enumerateRects:v11];
  int8x16_t v5 = NSString;
  uint64_t v6 = objc_opt_class();
  unint64_t v7 = [(IPARegion *)self count];
  unint64_t v8 = [v4 componentsJoinedByString:@","];
  uint8x8_t v9 = [v5 stringWithFormat:@"<%@:%p %lu rects: %@>", v6, self, v7, v8];

  return v9;
}

void __24__IPARegion_description__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v6 = [NSString stringWithFormat:@"{{%g, %g}, {%g, %g}}", *(void *)&a2, *(void *)&a3, *(void *)&a4, *(void *)&a5];
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (void)dealloc
{
  imp = self->_imp;
  if (imp)
  {
    uint64_t v4 = std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)imp);
    MEMORY[0x1E01B4BC0](v4, 0x10A0C408EF24B1CLL);
  }
  v5.receiver = self;
  v5.super_class = (Class)IPARegion;
  [(IPARegion *)&v5 dealloc];
}

- (IPARegion)initWithRectArray:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)IPARegion;
    if ([(IPARegion *)&v6 init]) {
      operator new();
    }

    return 0;
  }
  else
  {
    unint64_t result = (IPARegion *)_PFAssertFailHandler();
    __break(1u);
  }
  return result;
}

uint64_t __31__IPARegion_initWithRectArray___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  objc_super v5 = *(PA::Region **)(*(void *)(a1 + 32) + 8);
  *(double *)unint64_t v7 = a2;
  *(double *)&v7[1] = a3;
  *(double *)&v7[2] = a4;
  *(double *)&v7[3] = a5;
  return PA::Region::Add(v5, (const PA::Rect *)v7);
}

- (IPARegion)initWithRegion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)IPARegion;
    if ([(IPARegion *)&v6 init]) {
      operator new();
    }

    return 0;
  }
  else
  {
    unint64_t result = (IPARegion *)_PFAssertFailHandler();
    __break(1u);
  }
  return result;
}

- (IPARegion)initWithRect:(CGRect)a3
{
  if (CGRectIsInfinite(a3))
  {
    unint64_t result = (IPARegion *)_PFAssertFailHandler();
    __break(1u);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)IPARegion;
    if ([(IPARegion *)&v5 init]) {
      operator new();
    }
    return 0;
  }
  return result;
}

- (IPARegion)init
{
  v3.receiver = self;
  v3.super_class = (Class)IPARegion;
  if ([(IPARegion *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (id)regionByFlippingInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  unint64_t v7 = (void *)[(IPARegion *)self mutableCopy];
  objc_msgSend(v7, "flipInRect:", x, y, width, height);
  return v7;
}

- (id)regionByApplyingAffineTransform:(CGAffineTransform *)a3
{
  id v4 = (void *)[(IPARegion *)self mutableCopy];
  long long v5 = *(_OWORD *)&a3->c;
  v7[0] = *(_OWORD *)&a3->a;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->tx;
  [v4 applyAffineTransform:v7];
  return v4;
}

- (id)regionByApplyingOrientation:(int64_t)a3 imageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  unint64_t v7 = (void *)[(IPARegion *)self mutableCopy];
  objc_msgSend(v7, "applyOrientation:imageSize:", a3, width, height);
  return v7;
}

- (id)regionByRoundingDown
{
  id v2 = (void *)[(IPARegion *)self mutableCopy];
  [v2 roundDown];
  return v2;
}

- (id)regionByRoundingUp
{
  id v2 = (void *)[(IPARegion *)self mutableCopy];
  [v2 roundUp];
  return v2;
}

- (id)regionByShrinkingBy:(CGPoint)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.y;
  double v9 = a3.x;
  unint64_t v10 = (void *)[(IPARegion *)self mutableCopy];
  objc_msgSend(v10, "shrinkBy:inRect:", v9, v8, x, y, width, height);
  return v10;
}

- (id)regionByShrinkingBy:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  long long v5 = (void *)[(IPARegion *)self mutableCopy];
  objc_msgSend(v5, "shrinkBy:", x, y);
  return v5;
}

- (id)regionByGrowingBy:(CGPoint)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.y;
  double v9 = a3.x;
  unint64_t v10 = (void *)[(IPARegion *)self mutableCopy];
  objc_msgSend(v10, "growBy:inRect:", v9, v8, x, y, width, height);
  return v10;
}

- (id)regionByGrowingBy:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  long long v5 = (void *)[(IPARegion *)self mutableCopy];
  objc_msgSend(v5, "growBy:", x, y);
  return v5;
}

- (id)regionByTranslatingBy:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  long long v5 = (void *)[(IPARegion *)self mutableCopy];
  objc_msgSend(v5, "translateBy:", x, y);
  return v5;
}

- (id)regionByScalingBy:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  long long v5 = (void *)[(IPARegion *)self mutableCopy];
  objc_msgSend(v5, "scaleBy:", x, y);
  return v5;
}

- (id)regionByExcludingRegion:(id)a3
{
  id v4 = a3;
  long long v5 = (void *)[(IPARegion *)self mutableCopy];
  [v5 diffWithRegion:v4];

  return v5;
}

- (id)regionByExcludingRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  unint64_t v7 = (void *)[(IPARegion *)self mutableCopy];
  objc_msgSend(v7, "diffWithRect:", x, y, width, height);
  return v7;
}

- (id)regionByClippingToRectArray:(id)a3
{
  id v4 = a3;
  long long v5 = (void *)[(IPARegion *)self mutableCopy];
  [v5 clipToRectArray:v4];

  return v5;
}

- (id)regionByClippingToRegion:(id)a3
{
  id v4 = a3;
  long long v5 = (void *)[(IPARegion *)self mutableCopy];
  [v5 clipToRegion:v4];

  return v5;
}

- (id)regionByClippingToRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  unint64_t v7 = (void *)[(IPARegion *)self mutableCopy];
  objc_msgSend(v7, "clipToRect:", x, y, width, height);
  return v7;
}

- (id)regionByRemovingRectArray:(id)a3
{
  id v4 = a3;
  long long v5 = (void *)[(IPARegion *)self mutableCopy];
  [v5 removeRectArray:v4];

  return v5;
}

- (id)regionByRemovingRegion:(id)a3
{
  id v4 = a3;
  long long v5 = (void *)[(IPARegion *)self mutableCopy];
  [v5 removeRegion:v4];

  return v5;
}

- (id)regionByRemovingRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  unint64_t v7 = (void *)[(IPARegion *)self mutableCopy];
  objc_msgSend(v7, "removeRect:", x, y, width, height);
  return v7;
}

- (id)regionByAddingRectArray:(id)a3
{
  id v4 = a3;
  long long v5 = (void *)[(IPARegion *)self mutableCopy];
  [v5 addRectArray:v4];

  return v5;
}

- (id)regionByAddingRegion:(id)a3
{
  id v4 = a3;
  long long v5 = (void *)[(IPARegion *)self mutableCopy];
  [v5 addRegion:v4];

  return v5;
}

- (id)regionByAddingRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  unint64_t v7 = (void *)[(IPARegion *)self mutableCopy];
  objc_msgSend(v7, "addRect:", x, y, width, height);
  return v7;
}

@end