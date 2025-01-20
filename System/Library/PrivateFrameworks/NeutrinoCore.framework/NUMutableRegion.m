@interface NUMutableRegion
- (id)copyWithZone:(_NSZone *)a3;
- (void)addRect:(id *)a3;
- (void)addRegion:(id)a3;
- (void)applyAffineTransform:(CGAffineTransform *)a3 roundPolicy:(int64_t)a4;
- (void)applyOrientation:(int64_t)a3 imageSize:(id)a4;
- (void)clear;
- (void)clipToRect:(id *)a3;
- (void)clipToRegion:(id)a3;
- (void)diffWithRect:(id *)a3;
- (void)diffWithRegion:(id)a3;
- (void)flipInRect:(id *)a3;
- (void)growBy:(id)a3;
- (void)growBy:(id)a3 inRect:(id *)a4;
- (void)removeRect:(id *)a3;
- (void)removeRegion:(id)a3;
- (void)scaleBy:(CGPoint)a3 withRounding:(int64_t)a4;
- (void)setRegion:(id)a3;
- (void)shrinkBy:(id)a3;
- (void)shrinkBy:(id)a3 inRect:(id *)a4;
- (void)translateBy:(id)a3;
@end

@implementation NUMutableRegion

- (void)applyAffineTransform:(CGAffineTransform *)a3 roundPolicy:(int64_t)a4
{
}

- (void)applyOrientation:(int64_t)a3 imageSize:(id)a4
{
}

- (void)shrinkBy:(id)a3 inRect:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3.var0 < 0 || a3.var1 < 0)
  {
    v6 = NUAssertLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "delta.x >= 0 && delta.y >= 0");
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v7;
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
        *(void *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v15;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMutableRegion shrinkBy:inRect:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Region/NURegion.mm", 1001, @"Invalid parameter not satisfying: %s", v16, v17, v18, v19, (uint64_t)"delta.x >= 0 && delta.y >= 0");
  }
  imp = (__n128 *)self->super._imp;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a4->var1;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)buf = a4->var0;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)&buf[16] = var1;
  NU::Region::shrinkInRect(imp, a3.var0, a3.var1, (__n128 *)buf);
}

- (void)shrinkBy:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3.var0 < 0 || a3.var1 < 0)
  {
    v4 = NUAssertLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "delta.x >= 0 && delta.y >= 0");
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v5;
      _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v7 = NUAssertLogger();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v12 = [MEMORY[0x1E4F29060] callStackSymbols];
        v13 = [v12 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = v11;
        __int16 v20 = 2114;
        uint64_t v21 = v13;
        _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v8)
    {
      v9 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v10 = [v9 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v10;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMutableRegion shrinkBy:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Region/NURegion.mm", 994, @"Invalid parameter not satisfying: %s", v14, v15, v16, v17, (uint64_t)"delta.x >= 0 && delta.y >= 0");
  }
  imp = (NU::Region *)self->super._imp;

  NU::Region::shrink(imp, a3.var0, a3.var1);
}

- (void)growBy:(id)a3 inRect:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3.var0 < 0 || a3.var1 < 0)
  {
    v6 = NUAssertLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "delta.x >= 0 && delta.y >= 0");
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v7;
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
        uint64_t v14 = [MEMORY[0x1E4F29060] callStackSymbols];
        uint64_t v15 = [v14 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v13;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v15;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMutableRegion growBy:inRect:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Region/NURegion.mm", 987, @"Invalid parameter not satisfying: %s", v16, v17, v18, v19, (uint64_t)"delta.x >= 0 && delta.y >= 0");
  }
  imp = (NU::Region *)self->super._imp;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a4->var1;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)buf = a4->var0;
  *($0AC6E346AE4835514AAA8AC86D8F4844 *)&buf[16] = var1;
  NU::Region::grow(imp, a3.var0, a3.var1);
  NU::Region::clip(imp, (__n128 *)buf);
}

- (void)growBy:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3.var0 < 0 || a3.var1 < 0)
  {
    v4 = NUAssertLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "delta.x >= 0 && delta.y >= 0");
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v5;
      _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v7 = NUAssertLogger();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v12 = [MEMORY[0x1E4F29060] callStackSymbols];
        v13 = [v12 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = v11;
        __int16 v20 = 2114;
        uint64_t v21 = v13;
        _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v8)
    {
      v9 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v10 = [v9 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v10;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUMutableRegion growBy:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Region/NURegion.mm", 980, @"Invalid parameter not satisfying: %s", v14, v15, v16, v17, (uint64_t)"delta.x >= 0 && delta.y >= 0");
  }
  imp = (NU::Region *)self->super._imp;

  NU::Region::grow(imp, a3.var0, a3.var1);
}

- (void)setRegion:(id)a3
{
  v6 = a3;
  uint64_t v4 = v6[1];
  imp = self->super._imp;
  if (imp != (_DWORD *)v4)
  {
    imp[8] = *(_DWORD *)(v4 + 32);
    std::__hash_table<NU::RegionRect,NU::RectHash,NU::RectEqualTo,std::allocator<NU::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<NU::RegionRect,void *> *>>(imp, *(uint64_t **)(v4 + 16));
  }
}

- (void)clear
{
}

- (void)scaleBy:(CGPoint)a3 withRounding:(int64_t)a4
{
}

- (void)translateBy:(id)a3
{
}

- (void)flipInRect:(id *)a3
{
  imp = self->super._imp;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  v5[0] = a3->var0;
  v5[1] = var1;
  NU::Region::flipInRect((uint64_t)imp, v5);
}

- (void)diffWithRegion:(id)a3
{
  if (a3) {
    NU::Region::diff((__n128 *)self->super._imp, *((const NU::Region **)a3 + 1));
  }
}

- (void)diffWithRect:(id *)a3
{
  imp = (__n128 *)self->super._imp;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  v5[0] = (__n128)a3->var0;
  v5[1] = (__n128)var1;
  NU::Region::diff(imp, v5);
}

- (void)clipToRegion:(id)a3
{
  if (a3) {
    NU::Region::clip((NU::Region *)self->super._imp, *((const NU::Region **)a3 + 1));
  }
}

- (void)clipToRect:(id *)a3
{
  imp = (NU::Region *)self->super._imp;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  v5[0] = (__n128)a3->var0;
  v5[1] = (__n128)var1;
  NU::Region::clip(imp, v5);
}

- (void)removeRegion:(id)a3
{
  if (a3)
  {
    imp = (__n128 *)self->super._imp;
    NU::Region::breakRects(*((void *)a3 + 1), imp);
    NU::Region::mergeRectsVertically((NU::Region *)imp);
  }
}

- (void)addRegion:(id)a3
{
  if (a3) {
    NU::Region::add((NU::Region *)self->super._imp, *((const NU::Region **)a3 + 1));
  }
}

- (void)removeRect:(id *)a3
{
  imp = (__n128 *)self->super._imp;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  v5[0] = (__n128)a3->var0;
  v5[1] = (__n128)var1;
  NU::Region::remove(imp, v5);
}

- (void)addRect:(id *)a3
{
  imp = (NU::Region *)self->super._imp;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = a3->var1;
  v5[0] = (__n128)a3->var0;
  v5[1] = (__n128)var1;
  NU::Region::add(imp, v5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[NURegion allocWithZone:a3];

  return [(NURegion *)v4 initWithRegion:self];
}

@end