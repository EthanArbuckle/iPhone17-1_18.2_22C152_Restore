@interface OADGroupProperties
+ (id)defaultProperties;
- (BOOL)hasEffects;
- (BOOL)hasFill;
- (BOOL)hasScene3D;
- (BOOL)hasShape3D;
- (NSString)description;
- (OADGroupProperties)initWithDefaults;
- (id)effects;
- (id)fill;
- (id)scene3D;
- (id)shape3D;
- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3;
- (void)setEffects:(id)a3;
- (void)setFill:(id)a3;
- (void)setScene3D:(id)a3;
- (void)setShape3D:(id)a3;
@end

@implementation OADGroupProperties

+ (id)defaultProperties
{
  if (+[OADGroupProperties defaultProperties]::once != -1) {
    dispatch_once(&+[OADGroupProperties defaultProperties]::once, &__block_literal_global_57);
  }
  v2 = (void *)+[OADGroupProperties defaultProperties]::defaultProperties;
  return v2;
}

- (OADGroupProperties)initWithDefaults
{
  v8.receiver = self;
  v8.super_class = (Class)OADGroupProperties;
  v2 = [(OADDrawableProperties *)&v8 initWithDefaults];
  if (v2)
  {
    v3 = +[OADNullFill nullFill];
    [(OADGroupProperties *)v2 setFill:v3];

    v4 = [MEMORY[0x263EFF8C0] array];
    [(OADGroupProperties *)v2 setEffects:v4];

    v5 = +[OADScene3D nullScene3D];
    [(OADGroupProperties *)v2 setScene3D:v5];

    v6 = +[OADShape3D nullShape3D];
    [(OADGroupProperties *)v2 setShape3D:v6];
  }
  return v2;
}

- (void)setFill:(id)a3
{
}

- (void)setEffects:(id)a3
{
}

- (void)setScene3D:(id)a3
{
}

- (void)setShape3D:(id)a3
{
}

- (id)fill
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasFill];
  id v3 = v2[9];

  return v3;
}

- (BOOL)hasFill
{
  return self->mFill || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)effects
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasEffects];
  id v3 = v2[10];

  return v3;
}

- (BOOL)hasEffects
{
  return self->mEffects || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)scene3D
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasScene3D];
  id v3 = v2[11];

  return v3;
}

- (BOOL)hasScene3D
{
  return self->mScene3D || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)shape3D
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasShape3D];
  id v3 = v2[12];

  return v3;
}

- (BOOL)hasShape3D
{
  return self->mShape3D || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

void __39__OADGroupProperties_defaultProperties__block_invoke()
{
  v0 = [[OADGroupProperties alloc] initWithDefaults];
  v1 = (void *)+[OADGroupProperties defaultProperties]::defaultProperties;
  +[OADGroupProperties defaultProperties]::defaultProperties = (uint64_t)v0;
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)OADGroupProperties;
  [(OADDrawableProperties *)&v35 fixPropertiesForChangingParentPreservingEffectiveValues:v4];
  p_mFill = &self->mFill;
  if (self->mFill
    || ([(OADProperties *)self parent], id v6 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v6,
                                                 v6 != v4))
  {
    v7 = [(OADGroupProperties *)self fill];
    id v8 = objc_alloc_init((Class)objc_opt_class());

    v9 = [(OADGroupProperties *)self fill];
    [v8 setParent:v9];

    objc_storeStrong((id *)&self->mFill, v8);
    v10 = [v4 possiblyInexistentOverrideForSelector:sel_hasFill];

    if (v10)
    {
      v10 = [v4 fill];
    }
    if (*p_mFill == v10)
    {
      v13 = v10;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) == 0)
      {
        uint64_t v12 = [(id)objc_opt_class() defaultProperties];

        v10 = (OADFill *)v12;
      }
      [(OADProperties *)*p_mFill changeParentPreservingEffectiveValues:v10];
      if ((isKindOfClass & 1) == 0 || [(OADProperties *)*p_mFill isAnythingOverridden]) {
        goto LABEL_13;
      }
      v13 = *p_mFill;
    }
    *p_mFill = 0;

LABEL_13:
  }
  if ([(OADGroupProperties *)self hasEffects]
    || ([(OADProperties *)self parent],
        id v14 = (id)objc_claimAutoreleasedReturnValue(),
        v14,
        v14 != v4))
  {
    v15 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasEffects];

    if (v15)
    {
      v16 = [(OADGroupProperties *)self effects];
    }
    else
    {
      v16 = 0;
    }
    v17 = [v4 possiblyInexistentOverrideForSelector:sel_hasEffects];

    if (v17)
    {
      v18 = [v4 effects];
    }
    else
    {
      v18 = 0;
    }
    int v19 = TCObjectEqual(v16, v18);
    mEffects = self->mEffects;
    if (v19)
    {
      self->mEffects = 0;
    }
    else if (!mEffects && v15)
    {
      [(OADGroupProperties *)self setEffects:v16];
    }
  }
  if ([(OADGroupProperties *)self hasScene3D]
    || ([(OADProperties *)self parent],
        id v21 = (id)objc_claimAutoreleasedReturnValue(),
        v21,
        v21 != v4))
  {
    v22 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasScene3D];

    if (v22)
    {
      v23 = [(OADGroupProperties *)self scene3D];
    }
    else
    {
      v23 = 0;
    }
    v24 = [v4 possiblyInexistentOverrideForSelector:sel_hasScene3D];

    if (v24)
    {
      v25 = [v4 scene3D];
    }
    else
    {
      v25 = 0;
    }
    int v26 = TCObjectEqual(v23, v25);
    mScene3D = self->mScene3D;
    if (v26)
    {
      self->mScene3D = 0;
    }
    else if (!mScene3D && v22)
    {
      [(OADGroupProperties *)self setScene3D:v23];
    }
  }
  if ([(OADGroupProperties *)self hasShape3D]
    || ([(OADProperties *)self parent],
        id v28 = (id)objc_claimAutoreleasedReturnValue(),
        v28,
        v28 != v4))
  {
    v29 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_hasShape3D];

    if (v29)
    {
      v30 = [(OADGroupProperties *)self shape3D];
    }
    else
    {
      v30 = 0;
    }
    v31 = [v4 possiblyInexistentOverrideForSelector:sel_hasShape3D];

    if (v31)
    {
      v32 = [v4 shape3D];
    }
    else
    {
      v32 = 0;
    }
    int v33 = TCObjectEqual(v30, v32);
    mShape3D = self->mShape3D;
    if (v33)
    {
      self->mShape3D = 0;
    }
    else if (!mShape3D && v29)
    {
      [(OADGroupProperties *)self setShape3D:v30];
    }
  }
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADGroupProperties;
  v2 = [(OADDrawableProperties *)&v4 description];
  return (NSString *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mShape3D, 0);
  objc_storeStrong((id *)&self->mScene3D, 0);
  objc_storeStrong((id *)&self->mEffects, 0);
  objc_storeStrong((id *)&self->mFill, 0);
}

@end