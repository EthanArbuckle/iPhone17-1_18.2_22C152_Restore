@interface OADStretchTechnique
+ (id)defaultProperties;
- (BOOL)isAnythingOverridden;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFillRectOverridden;
- (OADStretchTechnique)initWithDefaults;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fillRect;
- (unint64_t)hash;
- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3;
- (void)removeUnnecessaryOverrides;
- (void)setFillRect:(id)a3;
@end

@implementation OADStretchTechnique

+ (id)defaultProperties
{
  if (+[OADStretchTechnique defaultProperties]::once != -1) {
    dispatch_once(&+[OADStretchTechnique defaultProperties]::once, &__block_literal_global_219);
  }
  v2 = (void *)+[OADStretchTechnique defaultProperties]::defaultProperties;
  return v2;
}

- (OADStretchTechnique)initWithDefaults
{
  v5.receiver = self;
  v5.super_class = (Class)OADStretchTechnique;
  v2 = [(OADProperties *)&v5 initWithDefaults];
  if (v2)
  {
    v3 = [[OADRelativeRect alloc] initWithLeft:0.0 top:0.0 right:0.0 bottom:0.0];
    [(OADStretchTechnique *)v2 setFillRect:v3];
  }
  return v2;
}

- (void)setFillRect:(id)a3
{
  objc_super v5 = (OADRelativeRect *)a3;
  if (self->mFillRect != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mFillRect, a3);
    objc_super v5 = v6;
  }
}

- (unint64_t)hash
{
  unint64_t result = (unint64_t)self->mFillRect;
  if (result) {
    return [(id)result hash];
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (objc_object **)a3;
  v7.receiver = self;
  v7.super_class = (Class)OADStretchTechnique;
  if ([(OADImageFillTechnique *)&v7 isEqual:v4]) {
    char v5 = TCObjectEqual((objc_object *)self->mFillRect, v4[3]);
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  mFillRect = self->mFillRect;
  if (mFillRect)
  {
    id v7 = [(OADRelativeRect *)mFillRect copyWithZone:a3];
    [v5 setFillRect:v7];
  }
  return v5;
}

void __40__OADStretchTechnique_defaultProperties__block_invoke()
{
  v0 = [[OADStretchTechnique alloc] initWithDefaults];
  v1 = (void *)+[OADStretchTechnique defaultProperties]::defaultProperties;
  +[OADStretchTechnique defaultProperties]::defaultProperties = (uint64_t)v0;
}

- (BOOL)isAnythingOverridden
{
  v4.receiver = self;
  v4.super_class = (Class)OADStretchTechnique;
  return [(OADProperties *)&v4 isAnythingOverridden]
      || [(OADStretchTechnique *)self isFillRectOverridden];
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)OADStretchTechnique;
  [(OADProperties *)&v12 fixPropertiesForChangingParentPreservingEffectiveValues:v4];
  if ([(OADStretchTechnique *)self isFillRectOverridden]
    || ([(OADProperties *)self parent], id v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    v6 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_isFillRectOverridden];

    if (v6)
    {
      id v7 = [(OADStretchTechnique *)self fillRect];
    }
    else
    {
      id v7 = 0;
    }
    v8 = [v4 possiblyInexistentOverrideForSelector:sel_isFillRectOverridden];

    if (v8)
    {
      v9 = [v4 fillRect];
    }
    else
    {
      v9 = 0;
    }
    int v10 = TCObjectEqual(v7, v9);
    mFillRect = self->mFillRect;
    if (v10)
    {
      self->mFillRect = 0;
    }
    else if (!mFillRect && v6)
    {
      [(OADStretchTechnique *)self setFillRect:v7];
    }
  }
}

- (void)removeUnnecessaryOverrides
{
  v3 = [(OADProperties *)self parent];

  if (v3)
  {
    BOOL v4 = [(OADProperties *)self isMerged];
    BOOL v5 = [(OADProperties *)self isMergedWithParent];
    [(OADProperties *)self setMerged:0];
    [(OADProperties *)self setMergedWithParent:0];
    if (![(OADStretchTechnique *)self isFillRectOverridden])
    {
LABEL_10:
      [(OADProperties *)self setMerged:v4];
      [(OADProperties *)self setMergedWithParent:v5];
      v13.receiver = self;
      v13.super_class = (Class)OADStretchTechnique;
      [(OADProperties *)&v13 removeUnnecessaryOverrides];
      return;
    }
    v6 = [(OADProperties *)self parent];
    id v7 = [(OADStretchTechnique *)self fillRect];
    v8 = [v6 fillRect];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(objc_object *)v7 removeUnnecessaryOverrides];
      uint64_t v9 = objc_opt_class();
      if (v9 != objc_opt_class()) {
        goto LABEL_9;
      }
      uint64_t v10 = [(objc_object *)v7 isMergedWithParent];
      [(objc_object *)v7 setMergedWithParent:0];
      char v11 = [(objc_object *)v7 isAnythingOverridden];
      [(objc_object *)v7 setMergedWithParent:v10];
      if (v11) {
        goto LABEL_9;
      }
    }
    else if (!TCObjectEqual(v7, v8))
    {
LABEL_9:

      goto LABEL_10;
    }
    mFillRect = self->mFillRect;
    self->mFillRect = 0;

    goto LABEL_9;
  }
}

- (id)fillRect
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isFillRectOverridden];
  id v3 = v2[3];

  return v3;
}

- (BOOL)isFillRectOverridden
{
  return self->mFillRect || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (void).cxx_destruct
{
}

@end