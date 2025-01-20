@interface OADImageProperties
+ (id)defaultProperties;
- (BOOL)hasImageFill;
- (id)description;
- (id)imageFill;
- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3;
- (void)setImageFill:(id)a3;
@end

@implementation OADImageProperties

+ (id)defaultProperties
{
  if (+[OADImageProperties defaultProperties]::once != -1) {
    dispatch_once(&+[OADImageProperties defaultProperties]::once, &__block_literal_global_58);
  }
  v2 = (void *)+[OADImageProperties defaultProperties]::defaultProperties;
  return v2;
}

- (void)setImageFill:(id)a3
{
}

- (BOOL)hasImageFill
{
  v4 = [(OADProperties *)self parent];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  mImageFill = self->mImageFill;
  if ((isKindOfClass & 1) == 0) {
    return mImageFill != 0;
  }
  if (mImageFill) {
    return 1;
  }
  return [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)imageFill
{
  v2 = [(OADProperties *)self overrideForSelector:sel_hasImageFill];
  id v3 = v2[16];

  return v3;
}

void __39__OADImageProperties_defaultProperties__block_invoke()
{
  v0 = [(OADGraphicProperties *)[OADImageProperties alloc] initWithDefaults];
  v1 = (void *)+[OADImageProperties defaultProperties]::defaultProperties;
  +[OADImageProperties defaultProperties]::defaultProperties = (uint64_t)v0;
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)OADImageProperties;
  [(OADGraphicProperties *)&v14 fixPropertiesForChangingParentPreservingEffectiveValues:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    p_mImageFill = &self->mImageFill;
    if (self->mImageFill
      || ([(OADProperties *)self parent],
          id v6 = (id)objc_claimAutoreleasedReturnValue(),
          v6,
          v6 != v4))
    {
      v7 = [(OADImageProperties *)self imageFill];
      id v8 = objc_alloc_init((Class)objc_opt_class());

      v9 = [(OADImageProperties *)self imageFill];
      [v8 setParent:v9];

      objc_storeStrong((id *)p_mImageFill, v8);
      v10 = [v4 possiblyInexistentOverrideForSelector:sel_hasImageFill];

      if (v10)
      {
        v10 = [v4 imageFill];
      }
      if (*p_mImageFill == v10)
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

          v10 = (OADImageFill *)v12;
        }
        [(OADProperties *)*p_mImageFill changeParentPreservingEffectiveValues:v10];
        if ((isKindOfClass & 1) == 0 || [(OADImageFill *)*p_mImageFill isAnythingOverridden]) {
          goto LABEL_14;
        }
        v13 = *p_mImageFill;
      }
      *p_mImageFill = 0;

LABEL_14:
    }
  }
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADImageProperties;
  v2 = [(OADGraphicProperties *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end