@interface OADLineEnd
+ (id)defaultProperties;
+ (id)stringForLineEndLength:(unsigned __int8)a3;
+ (id)stringForLineEndType:(unsigned __int8)a3;
+ (id)stringForLineEndWidth:(unsigned __int8)a3;
- (BOOL)isAnythingOverridden;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLengthOverridden;
- (BOOL)isTypeOverridden;
- (BOOL)isWidthOverridden;
- (OADLineEnd)initWithDefaults;
- (OADLineEnd)initWithType:(unsigned __int8)a3 width:(unsigned __int8)a4 length:(unsigned __int8)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)length;
- (unsigned)type;
- (unsigned)width;
- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3;
- (void)removeUnnecessaryOverrides;
- (void)setLength:(unsigned __int8)a3;
- (void)setType:(unsigned __int8)a3;
- (void)setWidth:(unsigned __int8)a3;
@end

@implementation OADLineEnd

+ (id)defaultProperties
{
  if (+[OADLineEnd defaultProperties]::once != -1) {
    dispatch_once(&+[OADLineEnd defaultProperties]::once, &__block_literal_global_62);
  }
  v2 = (void *)+[OADLineEnd defaultProperties]::defaultProperties;
  return v2;
}

- (OADLineEnd)initWithDefaults
{
  v5.receiver = self;
  v5.super_class = (Class)OADLineEnd;
  v2 = [(OADProperties *)&v5 initWithDefaults];
  v3 = v2;
  if (v2)
  {
    [(OADLineEnd *)v2 setType:0];
    [(OADLineEnd *)v3 setWidth:1];
    [(OADLineEnd *)v3 setLength:1];
  }
  return v3;
}

- (void)setType:(unsigned __int8)a3
{
  *((unsigned char *)&self->super + 17) = a3;
  *((unsigned char *)&self->super + 20) |= 1u;
}

- (void)setWidth:(unsigned __int8)a3
{
  *((unsigned char *)&self->super + 18) = a3;
  *((unsigned char *)&self->super + 20) |= 2u;
}

- (void)setLength:(unsigned __int8)a3
{
  *((unsigned char *)&self->super + 19) = a3;
  *((unsigned char *)&self->super + 20) |= 4u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_super v5 = v4;
  if (*((unsigned char *)&self->super + 20)) {
    [v4 setType:*((unsigned __int8 *)&self->super + 17)];
  }
  if ((*((unsigned char *)&self->super + 20) & 2) != 0) {
    [v5 setWidth:*((unsigned __int8 *)&self->super + 18)];
  }
  if ((*((unsigned char *)&self->super + 20) & 4) != 0) {
    [v5 setLength:*((unsigned __int8 *)&self->super + 19)];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = (unsigned __int8 *)v4;
    BOOL v6 = *((unsigned __int8 *)&self->super + 17) == v7[17]
      && *((unsigned __int8 *)&self->super + 18) == v7[18]
      && *((unsigned __int8 *)&self->super + 19) == v7[19];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return ((unint64_t)*((unsigned __int8 *)&self->super + 17) << 16) | ((unint64_t)*((unsigned __int8 *)&self->super
                                                                                                + 19) << 8) | *((unsigned __int8 *)&self->super + 18);
}

- (unsigned)type
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isTypeOverridden];
  unsigned __int8 v3 = v2[17];

  return v3;
}

- (BOOL)isTypeOverridden
{
  return (*((unsigned char *)&self->super + 20) & 1) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (unsigned)width
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isWidthOverridden];
  unsigned __int8 v3 = v2[18];

  return v3;
}

- (BOOL)isWidthOverridden
{
  return (*((unsigned char *)&self->super + 20) & 2) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (unsigned)length
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isLengthOverridden];
  unsigned __int8 v3 = v2[19];

  return v3;
}

- (BOOL)isLengthOverridden
{
  return (*((unsigned char *)&self->super + 20) & 4) != 0
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (OADLineEnd)initWithType:(unsigned __int8)a3 width:(unsigned __int8)a4 length:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  uint64_t v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OADLineEnd;
  v8 = [(OADProperties *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(OADLineEnd *)v8 setType:v7];
    [(OADLineEnd *)v9 setWidth:v6];
    [(OADLineEnd *)v9 setLength:v5];
  }
  return v9;
}

void __31__OADLineEnd_defaultProperties__block_invoke()
{
  v0 = [[OADLineEnd alloc] initWithDefaults];
  v1 = (void *)+[OADLineEnd defaultProperties]::defaultProperties;
  +[OADLineEnd defaultProperties]::defaultProperties = (uint64_t)v0;
}

- (BOOL)isAnythingOverridden
{
  v4.receiver = self;
  v4.super_class = (Class)OADLineEnd;
  return [(OADProperties *)&v4 isAnythingOverridden]
      || [(OADLineEnd *)self isTypeOverridden]
      || [(OADLineEnd *)self isWidthOverridden]
      || [(OADLineEnd *)self isLengthOverridden];
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)OADLineEnd;
  [(OADProperties *)&v11 fixPropertiesForChangingParentPreservingEffectiveValues:v4];
  if ((*((unsigned char *)&self->super + 20) & 1) != 0
    || ([(OADProperties *)self parent], id v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    int v6 = [(OADLineEnd *)self type];
    if (v6 == [v4 type])
    {
      *((unsigned char *)&self->super + 20) &= ~1u;
    }
    else if ((*((unsigned char *)&self->super + 20) & 1) == 0)
    {
      [(OADLineEnd *)self setType:[(OADLineEnd *)self type]];
    }
  }
  if ((*((unsigned char *)&self->super + 20) & 2) != 0
    || ([(OADProperties *)self parent], id v7 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v7,
                                                 v7 != v4))
  {
    int v8 = [(OADLineEnd *)self width];
    if (v8 == [v4 width])
    {
      *((unsigned char *)&self->super + 20) &= ~2u;
    }
    else if ((*((unsigned char *)&self->super + 20) & 2) == 0)
    {
      [(OADLineEnd *)self setWidth:[(OADLineEnd *)self width]];
    }
  }
  if ((*((unsigned char *)&self->super + 20) & 4) != 0
    || ([(OADProperties *)self parent], id v9 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v9,
                                                 v9 != v4))
  {
    int v10 = [(OADLineEnd *)self length];
    if (v10 == [v4 length])
    {
      *((unsigned char *)&self->super + 20) &= ~4u;
    }
    else if ((*((unsigned char *)&self->super + 20) & 4) == 0)
    {
      [(OADLineEnd *)self setLength:[(OADLineEnd *)self length]];
    }
  }
}

- (void)removeUnnecessaryOverrides
{
  unsigned __int8 v3 = [(OADProperties *)self parent];

  if (v3)
  {
    BOOL v4 = [(OADProperties *)self isMerged];
    BOOL v5 = [(OADProperties *)self isMergedWithParent];
    [(OADProperties *)self setMerged:0];
    [(OADProperties *)self setMergedWithParent:0];
    if ([(OADLineEnd *)self isTypeOverridden])
    {
      int v6 = [(OADProperties *)self parent];
      int v7 = [(OADLineEnd *)self type];
      if (v7 == [v6 type])
      {
        [(OADLineEnd *)self setType:0];
        *((unsigned char *)&self->super + 20) &= ~1u;
      }
    }
    if ([(OADLineEnd *)self isWidthOverridden])
    {
      int v8 = [(OADProperties *)self parent];
      int v9 = [(OADLineEnd *)self width];
      if (v9 == [v8 width])
      {
        [(OADLineEnd *)self setWidth:1];
        *((unsigned char *)&self->super + 20) &= ~2u;
      }
    }
    if ([(OADLineEnd *)self isLengthOverridden])
    {
      int v10 = [(OADProperties *)self parent];
      int v11 = [(OADLineEnd *)self length];
      if (v11 == [v10 length])
      {
        [(OADLineEnd *)self setLength:1];
        *((unsigned char *)&self->super + 20) &= ~4u;
      }
    }
    [(OADProperties *)self setMerged:v4];
    [(OADProperties *)self setMergedWithParent:v5];
    v12.receiver = self;
    v12.super_class = (Class)OADLineEnd;
    [(OADProperties *)&v12 removeUnnecessaryOverrides];
  }
}

+ (id)stringForLineEndType:(unsigned __int8)a3
{
  if (a3 > 5u) {
    return @"unknown";
  }
  else {
    return off_264D628E8[(char)a3];
  }
}

+ (id)stringForLineEndWidth:(unsigned __int8)a3
{
  if (a3 > 2u) {
    return @"unknown";
  }
  else {
    return off_264D62918[(char)a3];
  }
}

+ (id)stringForLineEndLength:(unsigned __int8)a3
{
  if (a3 > 2u) {
    return @"unknown";
  }
  else {
    return off_264D62918[(char)a3];
  }
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADLineEnd;
  v2 = [(OADProperties *)&v4 description];
  return v2;
}

@end