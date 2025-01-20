@interface OADLinearShade
+ (id)defaultProperties;
- (BOOL)isAngleOverridden;
- (BOOL)isAnythingOverridden;
- (BOOL)isEqual:(id)a3;
- (BOOL)isScaledOverridden;
- (BOOL)scaled;
- (OADLinearShade)initWithDefaults;
- (float)angle;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3;
- (void)removeUnnecessaryOverrides;
- (void)setAngle:(float)a3;
- (void)setScaled:(BOOL)a3;
@end

@implementation OADLinearShade

+ (id)defaultProperties
{
  if (+[OADLinearShade defaultProperties]::once != -1) {
    dispatch_once(&+[OADLinearShade defaultProperties]::once, &__block_literal_global_98);
  }
  v2 = (void *)+[OADLinearShade defaultProperties]::defaultProperties;
  return v2;
}

- (OADLinearShade)initWithDefaults
{
  v5.receiver = self;
  v5.super_class = (Class)OADLinearShade;
  v2 = [(OADProperties *)&v5 initWithDefaults];
  v3 = v2;
  if (v2)
  {
    [(OADLinearShade *)v2 setAngle:0.0];
    [(OADLinearShade *)v3 setScaled:0];
  }
  return v3;
}

- (void)setAngle:(float)a3
{
  *((float *)&self->super.super + 5) = a3;
  LOBYTE(self->mAngle) = 1;
}

- (void)setScaled:(BOOL)a3
{
  BYTE1(self->mAngle) = a3;
  BYTE2(self->mAngle) = 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v4;
  if (LOBYTE(self->mAngle))
  {
    LODWORD(v5) = *((_DWORD *)&self->super.super + 5);
    [v4 setAngle:v5];
  }
  if (BYTE2(self->mAngle)) {
    [v6 setScaled:BYTE1(self->mAngle)];
  }
  return v6;
}

- (unint64_t)hash
{
  if (LOBYTE(self->mAngle)) {
    unint64_t v2 = (unint64_t)*((float *)&self->super.super + 5);
  }
  else {
    unint64_t v2 = 0;
  }
  if (BYTE2(self->mAngle)) {
    v2 ^= BYTE1(self->mAngle);
  }
  return v2;
}

- (float)angle
{
  unint64_t v2 = [(OADProperties *)self overrideForSelector:sel_isAngleOverridden];
  float v3 = v2[5];

  return v3;
}

- (BOOL)isAngleOverridden
{
  return LOBYTE(self->mAngle) || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OADLinearShade;
  if ([(OADShade *)&v8 isEqual:v4])
  {
    double v5 = (float *)v4;
    if (LOBYTE(self->mAngle) == *((unsigned __int8 *)v5 + 24)
      && (!LOBYTE(self->mAngle) || *((float *)&self->super.super + 5) == v5[5])
      && BYTE2(self->mAngle) == *((unsigned __int8 *)v5 + 26))
    {
      if (BYTE2(self->mAngle)) {
        BOOL v6 = BYTE1(self->mAngle) == *((unsigned __int8 *)v5 + 25);
      }
      else {
        BOOL v6 = 1;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

void __35__OADLinearShade_defaultProperties__block_invoke()
{
  v0 = [[OADLinearShade alloc] initWithDefaults];
  v1 = (void *)+[OADLinearShade defaultProperties]::defaultProperties;
  +[OADLinearShade defaultProperties]::defaultProperties = (uint64_t)v0;
}

- (BOOL)isAnythingOverridden
{
  v4.receiver = self;
  v4.super_class = (Class)OADLinearShade;
  return [(OADProperties *)&v4 isAnythingOverridden]
      || [(OADLinearShade *)self isAngleOverridden]
      || [(OADLinearShade *)self isScaledOverridden];
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OADLinearShade;
  [(OADProperties *)&v11 fixPropertiesForChangingParentPreservingEffectiveValues:v4];
  if (LOBYTE(self->mAngle)
    || ([(OADProperties *)self parent], id v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    [(OADLinearShade *)self angle];
    float v7 = v6;
    [v4 angle];
    if (v7 == v8)
    {
      LOBYTE(self->mAngle) = 0;
    }
    else if (!LOBYTE(self->mAngle))
    {
      [(OADLinearShade *)self angle];
      -[OADLinearShade setAngle:](self, "setAngle:");
    }
  }
  if (BYTE2(self->mAngle)
    || ([(OADProperties *)self parent], id v9 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v9,
                                                 v9 != v4))
  {
    int v10 = [(OADLinearShade *)self scaled];
    if (v10 == [v4 scaled])
    {
      BYTE2(self->mAngle) = 0;
    }
    else if (!BYTE2(self->mAngle))
    {
      [(OADLinearShade *)self setScaled:[(OADLinearShade *)self scaled]];
    }
  }
}

- (void)removeUnnecessaryOverrides
{
  float v3 = [(OADProperties *)self parent];

  if (v3)
  {
    BOOL v4 = [(OADProperties *)self isMerged];
    BOOL v5 = [(OADProperties *)self isMergedWithParent];
    [(OADProperties *)self setMerged:0];
    [(OADProperties *)self setMergedWithParent:0];
    if ([(OADLinearShade *)self isAngleOverridden])
    {
      float v6 = [(OADProperties *)self parent];
      [(OADLinearShade *)self angle];
      float v8 = v7;
      [v6 angle];
      if (v8 == v9)
      {
        [(OADLinearShade *)self setAngle:0.0];
        LOBYTE(self->mAngle) = 0;
      }
    }
    if ([(OADLinearShade *)self isScaledOverridden])
    {
      int v10 = [(OADProperties *)self parent];
      int v11 = [(OADLinearShade *)self scaled];
      if (v11 == [v10 scaled])
      {
        [(OADLinearShade *)self setScaled:0];
        BYTE2(self->mAngle) = 0;
      }
    }
    [(OADProperties *)self setMerged:v4];
    [(OADProperties *)self setMergedWithParent:v5];
    v12.receiver = self;
    v12.super_class = (Class)OADLinearShade;
    [(OADProperties *)&v12 removeUnnecessaryOverrides];
  }
}

- (BOOL)scaled
{
  unint64_t v2 = [(OADProperties *)self overrideForSelector:sel_isScaledOverridden];
  char v3 = v2[25];

  return v3;
}

- (BOOL)isScaledOverridden
{
  return BYTE2(self->mAngle) || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

@end