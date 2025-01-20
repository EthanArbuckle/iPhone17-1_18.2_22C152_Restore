@interface FCCachePolicy
+ (FCCachePolicy)cachePolicyWithSoftMaxAge:(double)a3;
+ (id)cachedOnlyCachePolicy;
+ (id)defaultCachePolicy;
+ (id)ignoreCacheCachePolicy;
- (NSDate)oldestAllowedDate;
- (double)maximumCachedAge;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)cachePolicy;
- (void)setCachePolicy:(unint64_t)a3;
- (void)setMaximumCachedAge:(double)a3;
@end

@implementation FCCachePolicy

- (unint64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (double)maximumCachedAge
{
  return self->_maximumCachedAge;
}

+ (id)defaultCachePolicy
{
  if (qword_1EB5D1590 != -1) {
    dispatch_once(&qword_1EB5D1590, &__block_literal_global_74);
  }
  v2 = (void *)_MergedGlobals_172;
  return v2;
}

- (NSDate)oldestAllowedDate
{
  unint64_t v3 = [(FCCachePolicy *)self cachePolicy];
  if (v3 <= 5)
  {
    if (((1 << v3) & 0xD) != 0)
    {
      v4 = (void *)MEMORY[0x1E4F1C9C8];
LABEL_7:
      unint64_t v3 = [v4 distantPast];
      goto LABEL_8;
    }
    if (((1 << v3) & 0x30) != 0)
    {
      [(FCCachePolicy *)self maximumCachedAge];
      v5 = (void *)MEMORY[0x1E4F1C9C8];
      if (v6 == 1.79769313e308)
      {
        v4 = (void *)MEMORY[0x1E4F1C9C8];
        goto LABEL_7;
      }
      [(FCCachePolicy *)self maximumCachedAge];
      unint64_t v3 = [v5 dateWithTimeIntervalSinceNow:-v8];
    }
    else
    {
      unint64_t v3 = [MEMORY[0x1E4F1C9C8] distantFuture];
    }
  }
LABEL_8:
  return (NSDate *)(id)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setCachePolicy:", -[FCCachePolicy cachePolicy](self, "cachePolicy"));
  [(FCCachePolicy *)self maximumCachedAge];
  objc_msgSend(v4, "setMaximumCachedAge:");
  return v4;
}

+ (FCCachePolicy)cachePolicyWithSoftMaxAge:(double)a3
{
  v4 = objc_opt_new();
  [v4 setCachePolicy:4];
  [v4 setMaximumCachedAge:a3];
  return (FCCachePolicy *)v4;
}

- (void)setCachePolicy:(unint64_t)a3
{
  self->_cachePolicy = a3;
}

- (void)setMaximumCachedAge:(double)a3
{
  self->_maximumCachedAge = a3;
}

uint64_t __35__FCCachePolicy_defaultCachePolicy__block_invoke()
{
  v0 = objc_alloc_init(FCCachePolicy);
  v1 = (void *)_MergedGlobals_172;
  _MergedGlobals_172 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_172;
  return [v2 setCachePolicy:0];
}

+ (id)cachedOnlyCachePolicy
{
  if (qword_1EB5D15A0 != -1) {
    dispatch_once(&qword_1EB5D15A0, &__block_literal_global_2_0);
  }
  v2 = (void *)qword_1EB5D1598;
  return v2;
}

uint64_t __38__FCCachePolicy_cachedOnlyCachePolicy__block_invoke()
{
  v0 = objc_alloc_init(FCCachePolicy);
  v1 = (void *)qword_1EB5D1598;
  qword_1EB5D1598 = (uint64_t)v0;

  v2 = (void *)qword_1EB5D1598;
  return [v2 setCachePolicy:3];
}

+ (id)ignoreCacheCachePolicy
{
  if (qword_1EB5D15B0 != -1) {
    dispatch_once(&qword_1EB5D15B0, &__block_literal_global_4_6);
  }
  v2 = (void *)qword_1EB5D15A8;
  return v2;
}

uint64_t __39__FCCachePolicy_ignoreCacheCachePolicy__block_invoke()
{
  v0 = objc_alloc_init(FCCachePolicy);
  v1 = (void *)qword_1EB5D15A8;
  qword_1EB5D15A8 = (uint64_t)v0;

  v2 = (void *)qword_1EB5D15A8;
  return [v2 setCachePolicy:1];
}

@end