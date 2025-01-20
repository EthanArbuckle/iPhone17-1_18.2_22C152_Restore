@interface OADCustomPattern
+ (id)defaultProperties;
- (BOOL)isAnythingOverridden;
- (BOOL)isBlipRefOverridden;
- (BOOL)isEqual:(id)a3;
- (OADCustomPattern)initWithDefaults;
- (id)blipRef;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3;
- (void)setBlipRef:(id)a3;
@end

@implementation OADCustomPattern

+ (id)defaultProperties
{
  if (+[OADCustomPattern defaultProperties]::once != -1) {
    dispatch_once(&+[OADCustomPattern defaultProperties]::once, &__block_literal_global_486);
  }
  v2 = (void *)+[OADCustomPattern defaultProperties]::defaultProperties;
  return v2;
}

- (OADCustomPattern)initWithDefaults
{
  v5.receiver = self;
  v5.super_class = (Class)OADCustomPattern;
  v2 = [(OADProperties *)&v5 initWithDefaults];
  v3 = v2;
  if (v2) {
    [(OADCustomPattern *)v2 setBlipRef:0];
  }
  return v3;
}

- (void)setBlipRef:(id)a3
{
  objc_super v5 = (OADBlipRef *)a3;
  if (self->mBlipRef != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mBlipRef, a3);
    objc_super v5 = v6;
    self->mIsBlipRefOverridden = 1;
  }
}

- (unint64_t)hash
{
  if (self->mIsBlipRefOverridden) {
    unint64_t v3 = [(OADBlipRef *)self->mBlipRef hash];
  }
  else {
    unint64_t v3 = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)OADCustomPattern;
  return [(OADPattern *)&v5 hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OADCustomPattern;
  if ([(OADPattern *)&v8 isEqual:v4])
  {
    objc_super v5 = v4;
    if (self->mIsBlipRefOverridden == *((unsigned __int8 *)v5 + 32)) {
      BOOL v6 = !self->mIsBlipRefOverridden || [(OADBlipRef *)self->mBlipRef isEqual:v5[3]];
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (self->mIsBlipRefOverridden)
  {
    id v6 = [(OADBlipRef *)self->mBlipRef copyWithZone:a3];
    [v5 setBlipRef:v6];
  }
  return v5;
}

void __37__OADCustomPattern_defaultProperties__block_invoke()
{
  v0 = [[OADCustomPattern alloc] initWithDefaults];
  v1 = (void *)+[OADCustomPattern defaultProperties]::defaultProperties;
  +[OADCustomPattern defaultProperties]::defaultProperties = (uint64_t)v0;
}

- (BOOL)isAnythingOverridden
{
  v4.receiver = self;
  v4.super_class = (Class)OADCustomPattern;
  return [(OADProperties *)&v4 isAnythingOverridden]
      || [(OADCustomPattern *)self isBlipRefOverridden];
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OADCustomPattern;
  [(OADProperties *)&v11 fixPropertiesForChangingParentPreservingEffectiveValues:v4];
  if (self->mIsBlipRefOverridden
    || ([(OADProperties *)self parent], id v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    id v6 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_isBlipRefOverridden];

    if (v6)
    {
      v7 = [(OADCustomPattern *)self blipRef];
    }
    else
    {
      v7 = 0;
    }
    objc_super v8 = [v4 possiblyInexistentOverrideForSelector:sel_isBlipRefOverridden];

    if (v8)
    {
      v9 = [v4 blipRef];
    }
    else
    {
      v9 = 0;
    }
    if (TCObjectEqual(v7, v9))
    {
      mBlipRef = self->mBlipRef;
      self->mBlipRef = 0;

      self->mIsBlipRefOverridden = 0;
    }
    else if (!self->mIsBlipRefOverridden && v6)
    {
      [(OADCustomPattern *)self setBlipRef:v7];
    }
  }
}

- (id)blipRef
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isBlipRefOverridden];
  id v3 = v2[3];

  return v3;
}

- (BOOL)isBlipRefOverridden
{
  return self->mIsBlipRefOverridden
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (void).cxx_destruct
{
}

@end