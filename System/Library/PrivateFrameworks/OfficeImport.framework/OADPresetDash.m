@interface OADPresetDash
+ (id)defaultProperties;
- (BOOL)isAnythingOverridden;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTypeOverridden;
- (OADPresetDash)initWithDefaults;
- (char)type;
- (id)copyWithZone:(_NSZone *)a3;
- (id)equivalentCustomDash;
- (unint64_t)hash;
- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3;
- (void)setType:(char)a3;
@end

@implementation OADPresetDash

+ (id)defaultProperties
{
  if (+[OADPresetDash defaultProperties]::once != -1) {
    dispatch_once(&+[OADPresetDash defaultProperties]::once, &__block_literal_global_151);
  }
  v2 = (void *)+[OADPresetDash defaultProperties]::defaultProperties;
  return v2;
}

- (OADPresetDash)initWithDefaults
{
  v5.receiver = self;
  v5.super_class = (Class)OADPresetDash;
  v2 = [(OADProperties *)&v5 initWithDefaults];
  v3 = v2;
  if (v2) {
    [(OADPresetDash *)v2 setType:0];
  }
  return v3;
}

- (void)setType:(char)a3
{
  *((unsigned char *)&self->super.super + 17) = a3;
  *((unsigned char *)&self->super.super + 18) |= 1u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_super v5 = v4;
  if (*((unsigned char *)&self->super.super + 18)) {
    [v4 setType:*((char *)&self->super.super + 17)];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OADPresetDash;
  if ([(OADDash *)&v9 isEqual:v4])
  {
    objc_super v5 = (unsigned __int8 *)v4;
    int v6 = *((unsigned __int8 *)&self->super.super + 18);
    BOOL v7 = ((v5[18] ^ v6) & 1) == 0 && ((v6 & 1) == 0 || *((unsigned __int8 *)&self->super.super + 17) == v5[17]);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  if (*((unsigned char *)&self->super.super + 18)) {
    return *((char *)&self->super.super + 17);
  }
  else {
    return 0;
  }
}

- (char)type
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isTypeOverridden];
  char v3 = v2[17];

  return v3;
}

- (BOOL)isTypeOverridden
{
  return (*((unsigned char *)&self->super.super + 18) & 1) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)equivalentCustomDash
{
  uint64_t v2 = *((char *)&self->super.super + 17) - 1;
  if (v2 > 0xD)
  {
    id v4 = 0;
  }
  else
  {
    char v3 = *(&off_264D62930 + v2);
    id v4 = objc_alloc_init(OADCustomDash);
    objc_super v5 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
    LODWORD(v7) = *v3;
    if (*(float *)v3 != -1.0)
    {
      v8 = (float *)(v3 + 2);
      do
      {
        *(float *)&double v6 = *(v8 - 1);
        +[OADDashStop addStopWithDash:v5 space:v7 toArray:v6];
        float v9 = *v8;
        v8 += 2;
        *(float *)&double v7 = v9;
      }
      while (v9 != -1.0);
    }
    -[OADCustomDash setStops:](v4, "setStops:", v5, v7);
  }
  return v4;
}

void __34__OADPresetDash_defaultProperties__block_invoke()
{
  v0 = [[OADPresetDash alloc] initWithDefaults];
  v1 = (void *)+[OADPresetDash defaultProperties]::defaultProperties;
  +[OADPresetDash defaultProperties]::defaultProperties = (uint64_t)v0;
}

- (BOOL)isAnythingOverridden
{
  v4.receiver = self;
  v4.super_class = (Class)OADPresetDash;
  return [(OADProperties *)&v4 isAnythingOverridden]
      || [(OADPresetDash *)self isTypeOverridden];
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)OADPresetDash;
  [(OADProperties *)&v7 fixPropertiesForChangingParentPreservingEffectiveValues:v4];
  if ((*((unsigned char *)&self->super.super + 18) & 1) != 0
    || ([(OADProperties *)self parent], id v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    int v6 = [(OADPresetDash *)self type];
    if (v6 == [v4 type])
    {
      *((unsigned char *)&self->super.super + 18) &= ~1u;
    }
    else if ((*((unsigned char *)&self->super.super + 18) & 1) == 0)
    {
      [(OADPresetDash *)self setType:[(OADPresetDash *)self type]];
    }
  }
}

@end