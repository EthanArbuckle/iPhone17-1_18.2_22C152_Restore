@interface NURegion
+ (NURegion)regionWithRect:(id *)a3;
+ (NURegion)regionWithRegion:(id)a3;
+ (id)region;
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)bounds;
- (BOOL)includesRect:(id *)a3;
- (BOOL)includesRegion:(id)a3;
- (BOOL)intersectsRect:(id *)a3;
- (BOOL)intersectsRegion:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRegion:(id)a3;
- (NURegion)init;
- (NURegion)initWithRect:(id *)a3;
- (NURegion)initWithRegion:(id)a3;
- (NURegion)regionWithSubregionsOfMinimumDensity:(double)a3;
- (double)area;
- (double)density;
- (id)convertImageRegion:(id)a3 fromRect:(id *)a4 toRect:(id *)a5;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)regionByAddingRect:(id *)a3;
- (id)regionByAddingRegion:(id)a3;
- (id)regionByApplyingAffineTransform:(CGAffineTransform *)a3 roundPolicy:(int64_t)a4;
- (id)regionByApplyingOrientation:(int64_t)a3 imageSize:(id)a4;
- (id)regionByClippingToRect:(id *)a3;
- (id)regionByClippingToRegion:(id)a3;
- (id)regionByExcludingRect:(id *)a3;
- (id)regionByExcludingRegion:(id)a3;
- (id)regionByFlippingInRect:(id *)a3;
- (id)regionByGrowingBy:(id)a3;
- (id)regionByGrowingBy:(id)a3 inRect:(id *)a4;
- (id)regionByRemovingRect:(id *)a3;
- (id)regionByRemovingRegion:(id)a3;
- (id)regionByScalingBy:(CGPoint)a3 withRounding:(int64_t)a4;
- (id)regionByShrinkingBy:(id)a3;
- (id)regionByShrinkingBy:(id)a3 inRect:(id *)a4;
- (id)regionByTranslatingBy:(id)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (void)dealloc;
- (void)enumerateRects:(id)a3;
@end

@implementation NURegion

- (double)density
{
  BOOL v3 = [(NURegion *)self isEmpty];
  double result = 1.0;
  if (!v3)
  {
    [(NURegion *)self area];
    double v6 = v5;
    [(NURegion *)self bounds];
    return v6 / (double)0;
  }
  return result;
}

- (double)area
{
  v2 = (void *)*((void *)self->_imp + 2);
  if (!v2) {
    return 0.0;
  }
  double result = 0.0;
  do
  {
    double result = result + (double)(uint64_t)(v2[5] * v2[4]);
    v2 = (void *)*v2;
  }
  while (v2);
  return result;
}

- (BOOL)includesRegion:(id)a3
{
  return a3 && NU::Region::includes((NU::Region *)self->_imp, *((const NU::Region **)a3 + 1));
}

- (BOOL)includesRect:(id *)a3
{
  imp = (NU::Region *)self->_imp;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  v6[0] = (__n128)a3->var0;
  v6[1] = (__n128)var1;
  return NU::Region::includes(imp, v6);
}

- (BOOL)intersectsRegion:(id)a3
{
  if (a3) {
    return NU::Region::intersects((uint64_t)self->_imp, *((void *)a3 + 1));
  }
  else {
    return 0;
  }
}

- (BOOL)intersectsRect:(id *)a3
{
  imp = self->_imp;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  v6[0] = (__n128)a3->var0;
  v6[1] = (__n128)var1;
  return NU::Region::intersects((uint64_t)imp, v6);
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)bounds
{
  NU::Region::getBounds((NU::Region *)self->_imp, (uint64_t)v6);
  $0AC6E346AE4835514AAA8AC86D8F4844 v5 = ($0AC6E346AE4835514AAA8AC86D8F4844)v6[1];
  retstr->var0 = ($0AC6E346AE4835514AAA8AC86D8F4844)v6[0];
  retstr->$0AC6E346AE4835514AAA8AC86D8F4844 var1 = v5;
  return result;
}

- (void)enumerateRects:(id)a3
{
  v4 = (void (**)(id, _OWORD *))a3;
  $0AC6E346AE4835514AAA8AC86D8F4844 v5 = (char *)self->_imp + 16;
  while (1)
  {
    $0AC6E346AE4835514AAA8AC86D8F4844 v5 = *(char **)v5;
    if (!v5) {
      break;
    }
    long long v6 = *((_OWORD *)v5 + 2);
    v7[0] = *((_OWORD *)v5 + 1);
    v7[1] = v6;
    v4[2](v4, v7);
  }
}

- (BOOL)isEqualToRegion:(id)a3
{
  return a3
      && std::operator==[abi:ne180100]<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>((uint64_t)self->_imp, *((uint64_t **)a3 + 1));
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
  return NU::Region::getHash((NU::Region *)self->_imp);
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
  id v4 = +[NUMutableRegion allocWithZone:a3];

  return [(NURegion *)v4 initWithRegion:self];
}

+ (NURegion)regionWithRegion:(id)a3
{
  id v4 = a3;
  char v5 = (void *)[objc_alloc((Class)a1) initWithRegion:v4];

  return (NURegion *)v5;
}

+ (NURegion)regionWithRect:(id *)a3
{
  id v4 = objc_alloc((Class)a1);
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  v8[0] = a3->var0;
  v8[1] = var1;
  long long v6 = (void *)[v4 initWithRect:v8];

  return (NURegion *)v6;
}

+ (id)region
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (id)description
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __23__NURegion_description__block_invoke;
  v11[3] = &unk_1E5D95658;
  id v4 = v3;
  id v12 = v4;
  [(NURegion *)self enumerateRects:v11];
  char v5 = NSString;
  uint64_t v6 = objc_opt_class();
  unint64_t v7 = [(NURegion *)self count];
  v8 = [v4 componentsJoinedByString:@","];
  v9 = [v5 stringWithFormat:@"<%@:%p %lu rects: %@>", v6, self, v7, v8];

  return v9;
}

void __23__NURegion_description__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [NSString stringWithFormat:@"{{%ld, %ld}, {%lu, %lu}}", *a2, a2[1], a2[2], a2[3]];
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (void)dealloc
{
  imp = self->_imp;
  if (imp)
  {
    uint64_t v4 = std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::~__hash_table((uint64_t)imp);
    MEMORY[0x1AD0FA500](v4, 0x10A0C408EF24B1CLL);
  }
  v5.receiver = self;
  v5.super_class = (Class)NURegion;
  [(NURegion *)&v5 dealloc];
}

- (NURegion)initWithRegion:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v6 = NUAssertLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      unint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "region != nil");
      *(_DWORD *)buf = 138543362;
      v22 = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v9 = NUAssertLogger();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = [MEMORY[0x1E4F29060] callStackSymbols];
        v15 = [v14 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v22 = v13;
        __int16 v23 = 2114;
        v24 = v15;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v22 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURegion initWithRegion:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Region/NURegion.mm", 756, @"Invalid parameter not satisfying: %s", v16, v17, v18, v19, (uint64_t)"region != nil");
  }
  v20.receiver = self;
  v20.super_class = (Class)NURegion;
  if ([(NURegion *)&v20 init]) {
    operator new();
  }

  return 0;
}

- (NURegion)initWithRect:(id *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NURegion;
  if ([(NURegion *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (NURegion)init
{
  v3.receiver = self;
  v3.super_class = (Class)NURegion;
  if ([(NURegion *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (NURegion)regionWithSubregionsOfMinimumDensity:(double)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (a3 < 0.0 || a3 > 1.0)
  {
    v31 = NUAssertLogger();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "0.0 <= density && density <= 1.0");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v32;
      _os_log_error_impl(&dword_1A9892000, v31, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v34 = NUAssertLogger();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v35)
      {
        v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v39 = [MEMORY[0x1E4F29060] callStackSymbols];
        v40 = [v39 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v38;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v40;
        _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v35)
    {
      v36 = [MEMORY[0x1E4F29060] callStackSymbols];
      v37 = [v36 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v37;
      _os_log_error_impl(&dword_1A9892000, v34, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURegion(Mutability) regionWithSubregionsOfMinimumDensity:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Region/NURegion.mm", 1193, @"Invalid parameter not satisfying: %s", v41, v42, v43, v44, (uint64_t)"0.0 <= density && density <= 1.0");
  }
  uint64_t v6 = objc_alloc_init(NUMutableRegion);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v45 = self;
  [v7 addObject:self];
  while ([v7 count])
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_130);
    }
    v8 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_debug_impl(&dword_1A9892000, v8, OS_LOG_TYPE_DEBUG, "Dense subregions: %@, result: %@", buf, 0x16u);
    }
    v9 = [v7 lastObject];
    [v7 removeLastObject];
    [v9 density];
    if (v10 >= a3)
    {
      if (v9) {
        [v9 bounds];
      }
      else {
        memset(v48, 0, sizeof(v48));
      }
      [(NUMutableRegion *)v6 addRect:v48];
    }
    else
    {
      memset(buf, 0, 32);
      if (v9)
      {
        [v9 bounds];
        uint64_t v12 = *(void *)buf;
        uint64_t v11 = *(void *)&buf[8];
        uint64_t v13 = *(void *)&buf[24];
        uint64_t v14 = *(void *)&buf[16];
      }
      else
      {
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        uint64_t v11 = 0;
        uint64_t v12 = 0;
      }
      uint64_t v15 = v14 / 2;
      v52[0] = v12;
      v52[1] = v11;
      uint64_t v16 = v13 / 2;
      v52[2] = v14 / 2;
      v52[3] = v13 / 2;
      uint64_t v17 = [v9 regionByClippingToRect:v52];
      [v7 addObject:v17];

      uint64_t v18 = v16 + v11;
      uint64_t v19 = *(void *)&buf[24] - v16;
      v51[0] = v12;
      v51[1] = v18;
      v51[2] = v15;
      v51[3] = v19;
      objc_super v20 = [v9 regionByClippingToRect:v51];
      [v7 addObject:v20];

      uint64_t v21 = v15 + v12;
      uint64_t v22 = *(void *)&buf[16] - v15;
      v50[0] = v21;
      v50[1] = v18;
      v50[2] = v22;
      v50[3] = v19;
      __int16 v23 = [v9 regionByClippingToRect:v50];
      [v7 addObject:v23];

      v49[0] = v21;
      v49[1] = *(void *)&buf[8];
      v49[2] = v22;
      v49[3] = v18 - *(void *)&buf[8];
      v24 = [v9 regionByClippingToRect:v49];
      [v7 addObject:v24];
    }
  }
  uint64_t v25 = objc_alloc_init(NUMutableRegion);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __61__NURegion_Mutability__regionWithSubregionsOfMinimumDensity___block_invoke;
  v46[3] = &unk_1E5D95680;
  v46[4] = v45;
  v26 = v25;
  v47 = v26;
  [(NURegion *)v6 enumerateRects:v46];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_130);
  }
  v27 = _NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v26;
    _os_log_debug_impl(&dword_1A9892000, v27, OS_LOG_TYPE_DEBUG, "Dense subregions result: %@, optimized: %@", buf, 0x16u);
  }
  v28 = v47;
  v29 = v26;

  return v29;
}

void __61__NURegion_Mutability__regionWithSubregionsOfMinimumDensity___block_invoke(uint64_t a1, _OWORD *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  long long v4 = a2[1];
  v9[0] = *a2;
  v9[1] = v4;
  objc_super v5 = [v3 regionByClippingToRect:v9];
  uint64_t v6 = v5;
  id v7 = *(void **)(a1 + 40);
  if (v5) {
    [v5 bounds];
  }
  else {
    memset(v8, 0, sizeof(v8));
  }
  [v7 addRect:v8];
}

- (id)convertImageRegion:(id)a3 fromRect:(id *)a4 toRect:(id *)a5
{
  int64_t var0 = a5->var1.var0;
  int64_t var1 = a5->var1.var1;
  int64_t v9 = a4->var1.var0;
  int64_t v10 = a4->var1.var1;
  uint64_t v11 = (void *)[a3 mutableCopy];
  objc_msgSend(v11, "translateBy:", -a4->var0.var0, -a4->var0.var1);
  objc_msgSend(v11, "scaleBy:withRounding:", 2, (double)var0 / (double)v9, (double)var1 / (double)v10);
  objc_msgSend(v11, "translateBy:", a5->var0.var0, a5->var0.var1);

  return v11;
}

- (id)regionByFlippingInRect:(id *)a3
{
  long long v4 = (void *)[(NURegion *)self mutableCopy];
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  v7[0] = a3->var0;
  v7[1] = var1;
  [v4 flipInRect:v7];

  return v4;
}

- (id)regionByApplyingAffineTransform:(CGAffineTransform *)a3 roundPolicy:(int64_t)a4
{
  uint64_t v6 = (void *)[(NURegion *)self mutableCopy];
  long long v7 = *(_OWORD *)&a3->c;
  v9[0] = *(_OWORD *)&a3->a;
  v9[1] = v7;
  _OWORD v9[2] = *(_OWORD *)&a3->tx;
  [v6 applyAffineTransform:v9 roundPolicy:a4];

  return v6;
}

- (id)regionByApplyingOrientation:(int64_t)a3 imageSize:(id)a4
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  long long v7 = (void *)[(NURegion *)self mutableCopy];
  objc_msgSend(v7, "applyOrientation:imageSize:", a3, var0, var1);

  return v7;
}

- (id)regionByShrinkingBy:(id)a3 inRect:(id *)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  long long v7 = (void *)[(NURegion *)self mutableCopy];
  $0AC6E346AE4835514AAA8AC86D8F4844 v8 = a4->var1;
  v10[0] = a4->var0;
  v10[1] = v8;
  objc_msgSend(v7, "shrinkBy:inRect:", var0, var1, v10);

  return v7;
}

- (id)regionByShrinkingBy:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  objc_super v5 = (void *)[(NURegion *)self mutableCopy];
  objc_msgSend(v5, "shrinkBy:", var0, var1);

  return v5;
}

- (id)regionByGrowingBy:(id)a3 inRect:(id *)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  long long v7 = (void *)[(NURegion *)self mutableCopy];
  $0AC6E346AE4835514AAA8AC86D8F4844 v8 = a4->var1;
  v10[0] = a4->var0;
  v10[1] = v8;
  objc_msgSend(v7, "growBy:inRect:", var0, var1, v10);

  return v7;
}

- (id)regionByGrowingBy:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  objc_super v5 = (void *)[(NURegion *)self mutableCopy];
  objc_msgSend(v5, "growBy:", var0, var1);

  return v5;
}

- (id)regionByTranslatingBy:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  objc_super v5 = (void *)[(NURegion *)self mutableCopy];
  objc_msgSend(v5, "translateBy:", var0, var1);

  return v5;
}

- (id)regionByScalingBy:(CGPoint)a3 withRounding:(int64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  long long v7 = (void *)[(NURegion *)self mutableCopy];
  objc_msgSend(v7, "scaleBy:withRounding:", a4, x, y);

  return v7;
}

- (id)regionByExcludingRegion:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)[(NURegion *)self mutableCopy];
  [v5 diffWithRegion:v4];

  return v5;
}

- (id)regionByExcludingRect:(id *)a3
{
  id v4 = (void *)[(NURegion *)self mutableCopy];
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  v7[0] = a3->var0;
  v7[1] = var1;
  [v4 diffWithRect:v7];

  return v4;
}

- (id)regionByClippingToRegion:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)[(NURegion *)self mutableCopy];
  [v5 clipToRegion:v4];

  return v5;
}

- (id)regionByClippingToRect:(id *)a3
{
  id v4 = (void *)[(NURegion *)self mutableCopy];
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  v7[0] = a3->var0;
  v7[1] = var1;
  [v4 clipToRect:v7];

  return v4;
}

- (id)regionByRemovingRegion:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)[(NURegion *)self mutableCopy];
  [v5 removeRegion:v4];

  return v5;
}

- (id)regionByRemovingRect:(id *)a3
{
  id v4 = (void *)[(NURegion *)self mutableCopy];
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  v7[0] = a3->var0;
  v7[1] = var1;
  [v4 removeRect:v7];

  return v4;
}

- (id)regionByAddingRegion:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)[(NURegion *)self mutableCopy];
  [v5 addRegion:v4];

  return v5;
}

- (id)regionByAddingRect:(id *)a3
{
  id v4 = (void *)[(NURegion *)self mutableCopy];
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  v7[0] = a3->var0;
  v7[1] = var1;
  [v4 addRect:v7];

  return v4;
}

@end