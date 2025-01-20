@interface OADPatternFill
+ (id)defaultProperties;
- (BOOL)isAnythingOverridden;
- (BOOL)isBgColorOverridden;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFgColorOverridden;
- (BOOL)isPatternOverridden;
- (OADPatternFill)initWithDefaults;
- (id)bgColor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fgColor;
- (id)namedImageDataWithBlipCollection:(id)a3;
- (id)pattern;
- (unint64_t)hash;
- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3;
- (void)removeUnnecessaryOverrides;
- (void)setBgColor:(id)a3;
- (void)setFgColor:(id)a3;
- (void)setParent:(id)a3;
- (void)setPattern:(id)a3;
- (void)setStyleColor:(id)a3;
@end

@implementation OADPatternFill

+ (id)defaultProperties
{
  if (+[OADPatternFill defaultProperties]::once != -1) {
    dispatch_once(&+[OADPatternFill defaultProperties]::once, &__block_literal_global_495);
  }
  v2 = (void *)+[OADPatternFill defaultProperties]::defaultProperties;
  return v2;
}

- (OADPatternFill)initWithDefaults
{
  v8.receiver = self;
  v8.super_class = (Class)OADPatternFill;
  v2 = [(OADProperties *)&v8 initWithDefaults];
  if (v2)
  {
    v3 = +[OADPresetPattern defaultProperties];
    v4 = (void *)[v3 copy];
    [(OADPatternFill *)v2 setPattern:v4];

    v5 = +[OADRgbColor black];
    [(OADPatternFill *)v2 setFgColor:v5];

    v6 = +[OADRgbColor white];
    [(OADPatternFill *)v2 setBgColor:v6];
  }
  return v2;
}

- (void)setPattern:(id)a3
{
}

- (void)setFgColor:(id)a3
{
}

- (void)setBgColor:(id)a3
{
}

- (void)setParent:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)OADPatternFill;
  [(OADProperties *)&v6 setParent:v4];
  if (self->mBgColor)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [v4 pattern];
      if ([v5 isMemberOfClass:objc_opt_class()]) {
        [(OADColor *)self->mBgColor setParent:v5];
      }
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OADPatternFill;
  if ([(OADFill *)&v8 isEqual:v4])
  {
    v5 = (objc_object **)v4;
    if (TCObjectEqual(*(objc_object **)&self->super.mDefinedByStyle, v5[3])
      && TCObjectEqual((objc_object *)self->mFgColor, v5[4]))
    {
      char v6 = TCObjectEqual((objc_object *)self->mBgColor, v5[5]);
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  v3 = *(void **)&self->super.mDefinedByStyle;
  if (v3) {
    uint64_t v4 = [v3 hash];
  }
  else {
    uint64_t v4 = 0;
  }
  mFgColor = self->mFgColor;
  if (mFgColor) {
    v4 ^= [(OADColor *)mFgColor hash];
  }
  mBgColor = self->mBgColor;
  if (mBgColor) {
    v4 ^= [(OADColor *)mBgColor hash];
  }
  v8.receiver = self;
  v8.super_class = (Class)OADPatternFill;
  return [(OADFill *)&v8 hash] ^ v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char v6 = *(void **)&self->super.mDefinedByStyle;
  if (v6)
  {
    v7 = (void *)[v6 copyWithZone:a3];
    [v5 setFgColor:v7];
  }
  mFgColor = self->mFgColor;
  if (mFgColor)
  {
    id v9 = [(OADColor *)mFgColor copyWithZone:a3];
    [v5 setBgColor:v9];
  }
  mBgColor = self->mBgColor;
  if (mBgColor)
  {
    id v11 = [(OADColor *)mBgColor copyWithZone:a3];
    [v5 setPattern:v11];
  }
  return v5;
}

void __35__OADPatternFill_defaultProperties__block_invoke()
{
  v0 = [[OADPatternFill alloc] initWithDefaults];
  v1 = (void *)+[OADPatternFill defaultProperties]::defaultProperties;
  +[OADPatternFill defaultProperties]::defaultProperties = (uint64_t)v0;
}

- (BOOL)isAnythingOverridden
{
  v4.receiver = self;
  v4.super_class = (Class)OADPatternFill;
  return [(OADProperties *)&v4 isAnythingOverridden]
      || [(OADPatternFill *)self isFgColorOverridden]
      || [(OADPatternFill *)self isBgColorOverridden]
      || [(OADPatternFill *)self isPatternOverridden];
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)OADPatternFill;
  [(OADProperties *)&v28 fixPropertiesForChangingParentPreservingEffectiveValues:v4];
  if ([(OADPatternFill *)self isFgColorOverridden]
    || ([(OADProperties *)self parent], id v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    char v6 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_isFgColorOverridden];

    if (v6)
    {
      v7 = [(OADPatternFill *)self fgColor];
    }
    else
    {
      v7 = 0;
    }
    objc_super v8 = [v4 possiblyInexistentOverrideForSelector:sel_isFgColorOverridden];

    if (v8)
    {
      id v9 = [v4 fgColor];
    }
    else
    {
      id v9 = 0;
    }
    int v10 = TCObjectEqual(v7, v9);
    id v11 = *(void **)&self->super.mDefinedByStyle;
    if (v10)
    {
      *(void *)&self->super.mDefinedByStyle = 0;
    }
    else if (!v11 && v6)
    {
      [(OADPatternFill *)self setFgColor:v7];
    }
  }
  if ([(OADPatternFill *)self isBgColorOverridden]
    || ([(OADProperties *)self parent],
        id v12 = (id)objc_claimAutoreleasedReturnValue(),
        v12,
        v12 != v4))
  {
    v13 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_isBgColorOverridden];

    if (v13)
    {
      v14 = [(OADPatternFill *)self bgColor];
    }
    else
    {
      v14 = 0;
    }
    v15 = [v4 possiblyInexistentOverrideForSelector:sel_isBgColorOverridden];

    if (v15)
    {
      v16 = [v4 bgColor];
    }
    else
    {
      v16 = 0;
    }
    int v17 = TCObjectEqual(v14, v16);
    mFgColor = self->mFgColor;
    if (v17)
    {
      self->mFgColor = 0;
    }
    else if (!mFgColor && v13)
    {
      [(OADPatternFill *)self setBgColor:v14];
    }
  }
  p_mBgColor = &self->mBgColor;
  if (self->mBgColor
    || ([(OADProperties *)self parent],
        id v20 = (id)objc_claimAutoreleasedReturnValue(),
        v20,
        v20 != v4))
  {
    v21 = [(OADPatternFill *)self pattern];
    id v22 = objc_alloc_init((Class)objc_opt_class());

    v23 = [(OADPatternFill *)self pattern];
    [v22 setParent:v23];

    objc_storeStrong((id *)p_mBgColor, v22);
    v24 = [v4 possiblyInexistentOverrideForSelector:sel_isPatternOverridden];

    if (v24)
    {
      v24 = [v4 pattern];
    }
    if (*p_mBgColor == v24)
    {
      v27 = v24;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) == 0)
      {
        uint64_t v26 = [(id)objc_opt_class() defaultProperties];

        v24 = (OADColor *)v26;
      }
      [(OADColor *)*p_mBgColor changeParentPreservingEffectiveValues:v24];
      if (isKindOfClass & 1) == 0 || ([(OADColor *)*p_mBgColor isAnythingOverridden]) {
        goto LABEL_41;
      }
      v27 = *p_mBgColor;
    }
    *p_mBgColor = 0;

LABEL_41:
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
    if (![(OADPatternFill *)self isFgColorOverridden]) {
      goto LABEL_10;
    }
    char v6 = [(OADProperties *)self parent];
    v7 = [(OADPatternFill *)self fgColor];
    objc_super v8 = [v6 fgColor];
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

LABEL_10:
      if (![(OADPatternFill *)self isBgColorOverridden]) {
        goto LABEL_18;
      }
      v13 = [(OADProperties *)self parent];
      v14 = [(OADPatternFill *)self bgColor];
      v15 = [v13 bgColor];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(objc_object *)v14 removeUnnecessaryOverrides];
        uint64_t v16 = objc_opt_class();
        if (v16 != objc_opt_class()) {
          goto LABEL_17;
        }
        uint64_t v17 = [(objc_object *)v14 isMergedWithParent];
        [(objc_object *)v14 setMergedWithParent:0];
        char v18 = [(objc_object *)v14 isAnythingOverridden];
        [(objc_object *)v14 setMergedWithParent:v17];
        if (v18) {
          goto LABEL_17;
        }
      }
      else if (!TCObjectEqual(v14, v15))
      {
LABEL_17:

LABEL_18:
        if (![(OADPatternFill *)self isPatternOverridden])
        {
LABEL_26:
          [(OADProperties *)self setMerged:v4];
          [(OADProperties *)self setMergedWithParent:v5];
          v27.receiver = self;
          v27.super_class = (Class)OADPatternFill;
          [(OADProperties *)&v27 removeUnnecessaryOverrides];
          return;
        }
        id v20 = [(OADProperties *)self parent];
        v21 = [(OADPatternFill *)self pattern];
        id v22 = [v20 pattern];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(objc_object *)v21 removeUnnecessaryOverrides];
          uint64_t v23 = objc_opt_class();
          if (v23 != objc_opt_class()) {
            goto LABEL_25;
          }
          uint64_t v24 = [(objc_object *)v21 isMergedWithParent];
          [(objc_object *)v21 setMergedWithParent:0];
          char v25 = [(objc_object *)v21 isAnythingOverridden];
          [(objc_object *)v21 setMergedWithParent:v24];
          if (v25) {
            goto LABEL_25;
          }
        }
        else if (!TCObjectEqual(v21, v22))
        {
LABEL_25:

          goto LABEL_26;
        }
        mBgColor = self->mBgColor;
        self->mBgColor = 0;

        goto LABEL_25;
      }
      mFgColor = self->mFgColor;
      self->mFgColor = 0;

      goto LABEL_17;
    }
    id v12 = *(void **)&self->super.mDefinedByStyle;
    *(void *)&self->super.mDefinedByStyle = 0;

    goto LABEL_9;
  }
}

- (id)fgColor
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isFgColorOverridden];
  id v3 = v2[3];

  return v3;
}

- (BOOL)isFgColorOverridden
{
  return *(void *)&self->super.mDefinedByStyle
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)bgColor
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isBgColorOverridden];
  id v3 = v2[4];

  return v3;
}

- (BOOL)isBgColorOverridden
{
  return self->mFgColor || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)pattern
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isPatternOverridden];
  id v3 = v2[5];

  return v3;
}

- (BOOL)isPatternOverridden
{
  return self->mBgColor || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (void)setStyleColor:(id)a3
{
  id v6 = a3;
  BOOL v4 = objc_msgSend(*(id *)&self->super.mDefinedByStyle, "colorForStyleColor:");
  [(OADPatternFill *)self setFgColor:v4];

  BOOL v5 = [(OADColor *)self->mFgColor colorForStyleColor:v6];
  [(OADPatternFill *)self setBgColor:v5];
}

- (id)namedImageDataWithBlipCollection:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = +[OADPresetPattern namedBitmapDataForPresetPatternType:[(OADColor *)self->mBgColor type]];
    goto LABEL_13;
  }
  BOOL v5 = [(OADColor *)self->mBgColor blipRef];
  id v6 = [v5 blip];
  if (!v6)
  {
    id v6 = objc_msgSend(v4, "blipAtIndex:", objc_msgSend(v5, "index"));
  }
  v7 = [v6 mainSubBlip];
  if (([v7 isLoaded] & 1) == 0) {
    [v7 load];
  }
  objc_super v8 = [v7 data];
  uint64_t v9 = [v5 name];
  if (![(__CFString *)v9 length])
  {

    uint64_t v9 = @"pattern";
    if (v7) {
      goto LABEL_8;
    }
LABEL_11:
    id v12 = 0;
    goto LABEL_12;
  }
  if (!v7) {
    goto LABEL_11;
  }
LABEL_8:
  uint64_t v10 = +[OADBlip pathExtensionForBlipType:](OADBlip, "pathExtensionForBlipType:", [v7 type]);
  uint64_t v11 = [(__CFString *)v9 stringByAppendingPathExtension:v10];

  id v12 = +[TCNamedData namedDataWithData:v8 named:v11];

  uint64_t v9 = (__CFString *)v11;
LABEL_12:

LABEL_13:
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBgColor, 0);
  objc_storeStrong((id *)&self->mFgColor, 0);
  objc_storeStrong((id *)&self->super.mDefinedByStyle, 0);
}

@end