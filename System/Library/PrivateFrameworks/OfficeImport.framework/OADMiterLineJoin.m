@interface OADMiterLineJoin
+ (id)defaultProperties;
- (BOOL)isAnythingOverridden;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLimitOverridden;
- (OADMiterLineJoin)initWithDefaults;
- (float)limit;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3;
- (void)removeUnnecessaryOverrides;
- (void)setLimit:(float)a3;
@end

@implementation OADMiterLineJoin

+ (id)defaultProperties
{
  if (+[OADMiterLineJoin defaultProperties]::once != -1) {
    dispatch_once(&+[OADMiterLineJoin defaultProperties]::once, &__block_literal_global_92_0);
  }
  v2 = (void *)+[OADMiterLineJoin defaultProperties]::defaultProperties;
  return v2;
}

- (OADMiterLineJoin)initWithDefaults
{
  v6.receiver = self;
  v6.super_class = (Class)OADMiterLineJoin;
  v2 = [(OADProperties *)&v6 initWithDefaults];
  v4 = v2;
  if (v2)
  {
    LODWORD(v3) = 8.0;
    [(OADMiterLineJoin *)v2 setLimit:v3];
  }
  return v4;
}

- (void)setLimit:(float)a3
{
  *((float *)&self->super.super + 5) = a3;
  LOBYTE(self->mLimit) |= 1u;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = (float *)v4;
    int mLimit_low = LOBYTE(self->mLimit);
    BOOL v6 = ((*((unsigned __int8 *)v7 + 24) ^ mLimit_low) & 1) == 0
      && ((mLimit_low & 1) == 0 || *((float *)&self->super.super + 5) == v7[5]);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  BOOL v6 = v4;
  if (LOBYTE(self->mLimit))
  {
    LODWORD(v5) = *((_DWORD *)&self->super.super + 5);
    [v4 setLimit:v5];
  }
  return v6;
}

void __37__OADMiterLineJoin_defaultProperties__block_invoke()
{
  v0 = [[OADMiterLineJoin alloc] initWithDefaults];
  v1 = (void *)+[OADMiterLineJoin defaultProperties]::defaultProperties;
  +[OADMiterLineJoin defaultProperties]::defaultProperties = (uint64_t)v0;
}

- (BOOL)isAnythingOverridden
{
  v4.receiver = self;
  v4.super_class = (Class)OADMiterLineJoin;
  return [(OADProperties *)&v4 isAnythingOverridden]
      || [(OADMiterLineJoin *)self isLimitOverridden];
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OADMiterLineJoin;
  [(OADProperties *)&v9 fixPropertiesForChangingParentPreservingEffectiveValues:v4];
  if ((LOBYTE(self->mLimit) & 1) != 0
    || ([(OADProperties *)self parent], id v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    [(OADMiterLineJoin *)self limit];
    float v7 = v6;
    [v4 limit];
    if (v7 == v8)
    {
      LOBYTE(self->mLimit) &= ~1u;
    }
    else if ((LOBYTE(self->mLimit) & 1) == 0)
    {
      [(OADMiterLineJoin *)self limit];
      -[OADMiterLineJoin setLimit:](self, "setLimit:");
    }
  }
}

- (void)removeUnnecessaryOverrides
{
  double v3 = [(OADProperties *)self parent];

  if (v3)
  {
    BOOL v4 = [(OADProperties *)self isMerged];
    BOOL v5 = [(OADProperties *)self isMergedWithParent];
    [(OADProperties *)self setMerged:0];
    [(OADProperties *)self setMergedWithParent:0];
    if ([(OADMiterLineJoin *)self isLimitOverridden])
    {
      float v6 = [(OADProperties *)self parent];
      [(OADMiterLineJoin *)self limit];
      float v8 = v7;
      [v6 limit];
      if (v8 == *(float *)&v9)
      {
        LODWORD(v9) = 8.0;
        [(OADMiterLineJoin *)self setLimit:v9];
        LOBYTE(self->mLimit) &= ~1u;
      }
    }
    [(OADProperties *)self setMerged:v4];
    [(OADProperties *)self setMergedWithParent:v5];
    v10.receiver = self;
    v10.super_class = (Class)OADMiterLineJoin;
    [(OADProperties *)&v10 removeUnnecessaryOverrides];
  }
}

- (float)limit
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isLimitOverridden];
  float v3 = v2[5];

  return v3;
}

- (BOOL)isLimitOverridden
{
  return (LOBYTE(self->mLimit) & 1) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (unint64_t)hash
{
  unint64_t v2 = (unint64_t)*((float *)&self->super.super + 5);
  v4.receiver = self;
  v4.super_class = (Class)OADMiterLineJoin;
  return ([(OADProperties *)&v4 hash] + 256 * v2) ^ LOBYTE(self->mLimit) & 1;
}

@end