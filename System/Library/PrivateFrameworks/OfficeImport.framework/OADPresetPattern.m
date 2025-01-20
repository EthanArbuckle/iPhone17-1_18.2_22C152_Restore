@interface OADPresetPattern
+ (id)defaultProperties;
+ (id)nameForPresetPatternType:(int)a3;
+ (id)namedBitmapDataForPresetPatternType:(int)a3;
- (BOOL)isAnythingOverridden;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTypeOverridden;
- (OADPresetPattern)initWithDefaults;
- (id)copyWithZone:(_NSZone *)a3;
- (int)type;
- (unint64_t)hash;
- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3;
- (void)setType:(int)a3;
@end

@implementation OADPresetPattern

+ (id)defaultProperties
{
  if (+[OADPresetPattern defaultProperties]::once != -1) {
    dispatch_once(&+[OADPresetPattern defaultProperties]::once, &__block_literal_global_310);
  }
  v2 = (void *)+[OADPresetPattern defaultProperties]::defaultProperties;
  return v2;
}

- (OADPresetPattern)initWithDefaults
{
  v5.receiver = self;
  v5.super_class = (Class)OADPresetPattern;
  v2 = [(OADProperties *)&v5 initWithDefaults];
  v3 = v2;
  if (v2) {
    [(OADPresetPattern *)v2 setType:1];
  }
  return v3;
}

- (void)setType:(int)a3
{
  *((_DWORD *)&self->super.super + 5) = a3;
  LOBYTE(self->mType) = 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_super v5 = v4;
  if (LOBYTE(self->mType)) {
    [v4 setType:*((unsigned int *)&self->super.super + 5)];
  }
  return v5;
}

- (unint64_t)hash
{
  if (LOBYTE(self->mType)) {
    uint64_t v2 = *((unsigned int *)&self->super.super + 5);
  }
  else {
    uint64_t v2 = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)OADPresetPattern;
  return [(OADPattern *)&v4 hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OADPresetPattern;
  if ([(OADPattern *)&v8 isEqual:v4])
  {
    objc_super v5 = v4;
    if (LOBYTE(self->mType) == *((unsigned __int8 *)v5 + 24))
    {
      if (LOBYTE(self->mType)) {
        BOOL v6 = *((_DWORD *)&self->super.super + 5) == v5[5];
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

void __37__OADPresetPattern_defaultProperties__block_invoke()
{
  v0 = [[OADPresetPattern alloc] initWithDefaults];
  v1 = (void *)+[OADPresetPattern defaultProperties]::defaultProperties;
  +[OADPresetPattern defaultProperties]::defaultProperties = (uint64_t)v0;
}

- (int)type
{
  uint64_t v2 = [(OADProperties *)self overrideForSelector:sel_isTypeOverridden];
  int v3 = v2[5];

  return v3;
}

- (BOOL)isTypeOverridden
{
  return LOBYTE(self->mType) || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)isAnythingOverridden
{
  v4.receiver = self;
  v4.super_class = (Class)OADPresetPattern;
  return [(OADProperties *)&v4 isAnythingOverridden]
      || [(OADPresetPattern *)self isTypeOverridden];
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)OADPresetPattern;
  [(OADProperties *)&v7 fixPropertiesForChangingParentPreservingEffectiveValues:v4];
  if (LOBYTE(self->mType)
    || ([(OADProperties *)self parent], id v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    int v6 = [(OADPresetPattern *)self type];
    if (v6 == [v4 type])
    {
      LOBYTE(self->mType) = 0;
    }
    else if (!LOBYTE(self->mType))
    {
      [(OADPresetPattern *)self setType:[(OADPresetPattern *)self type]];
    }
  }
}

+ (id)nameForPresetPatternType:(int)a3
{
  if ((a3 - 1) > 0x35) {
    return 0;
  }
  else {
    return off_264D62730[a3 - 1];
  }
}

+ (id)namedBitmapDataForPresetPatternType:(int)a3
{
  int v3 = [a1 nameForPresetPatternType:*(void *)&a3];
  if (v3)
  {
    id v4 = +[OCPattern blackAndWhiteImageDataWithPatternName:v3];
    id v5 = [v3 stringByAppendingPathExtension:@"bmp"];
    int v6 = +[TCNamedData namedDataWithData:v4 named:v5];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

@end