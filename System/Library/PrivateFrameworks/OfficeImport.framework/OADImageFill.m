@interface OADImageFill
+ (id)defaultProperties;
- (BOOL)isAnythingOverridden;
- (BOOL)isBlipRefOverridden;
- (BOOL)isDpiOverridden;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRotateWithShapeOverridden;
- (BOOL)isSourceRectOverridden;
- (BOOL)isTechniqueOverridden;
- (BOOL)rotateWithShape;
- (OADImageFill)initWithDefaults;
- (id)blipRef;
- (id)color;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sourceRect;
- (id)technique;
- (int)dpi;
- (unint64_t)hash;
- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3;
- (void)removeUnnecessaryOverrides;
- (void)setBlipRef:(id)a3;
- (void)setDpi:(int)a3;
- (void)setParent:(id)a3;
- (void)setRotateWithShape:(BOOL)a3;
- (void)setSourceRect:(id)a3;
- (void)setStyleColor:(id)a3;
- (void)setTechnique:(id)a3;
@end

@implementation OADImageFill

+ (id)defaultProperties
{
  if (+[OADImageFill defaultProperties]::once != -1) {
    dispatch_once(&+[OADImageFill defaultProperties]::once, &__block_literal_global_270);
  }
  v2 = (void *)+[OADImageFill defaultProperties]::defaultProperties;
  return v2;
}

- (OADImageFill)initWithDefaults
{
  v8.receiver = self;
  v8.super_class = (Class)OADImageFill;
  v2 = [(OADProperties *)&v8 initWithDefaults];
  v3 = v2;
  if (v2)
  {
    [(OADImageFill *)v2 setBlipRef:0];
    v4 = [[OADRelativeRect alloc] initWithLeft:0.0 top:0.0 right:0.0 bottom:0.0];
    [(OADImageFill *)v3 setSourceRect:v4];
    [(OADImageFill *)v3 setDpi:72];
    [(OADImageFill *)v3 setRotateWithShape:1];
    v5 = +[OADTileTechnique defaultProperties];
    v6 = (void *)[v5 copy];
    [(OADImageFill *)v3 setTechnique:v6];
  }
  return v3;
}

- (void)setBlipRef:(id)a3
{
  LOBYTE(self->mBlipRef) = 1;
}

- (void)setSourceRect:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v5 = [NSString stringWithUTF8String:"-[OADImageFill setSourceRect:]"];
    v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADFill.mm"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 1384, 0, "invalid nil value for '%{public}s'", "sourceRect");

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  v7 = *(void **)&self->mIsBlipRefOverridden;
  *(void *)&self->mIsBlipRefOverridden = v4;
}

- (void)setDpi:(int)a3
{
  LODWORD(self->mSourceRect) = a3;
  BYTE4(self->mSourceRect) = 1;
}

- (void)setRotateWithShape:(BOOL)a3
{
  BYTE5(self->mSourceRect) = a3;
  BYTE6(self->mSourceRect) = 1;
}

- (void)setTechnique:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v5 = [NSString stringWithUTF8String:"-[OADImageFill setTechnique:]"];
    v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADFill.mm"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 1423, 0, "invalid nil value for '%{public}s'", "technique");

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  v7 = *(void **)&self->mDpi;
  *(void *)&self->mDpi = v4;
}

- (void)setParent:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)OADImageFill;
  [(OADProperties *)&v6 setParent:v4];
  if (*(void *)&self->mDpi)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [v4 technique];
      if ([v5 isMemberOfClass:objc_opt_class()]) {
        [*(id *)&self->mDpi setParent:v5];
      }
    }
  }
}

- (BOOL)isSourceRectOverridden
{
  return *(void *)&self->mIsBlipRefOverridden
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)sourceRect
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isSourceRectOverridden];
  id v3 = v2[5];

  return v3;
}

- (BOOL)isBlipRefOverridden
{
  return LOBYTE(self->mBlipRef)
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)blipRef
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isBlipRefOverridden];
  id v3 = v2[3];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OADImageFill;
  if ([(OADFill *)&v8 isEqual:v4])
  {
    v5 = (objc_object **)v4;
    if (LOBYTE(self->mBlipRef) == *((unsigned __int8 *)v5 + 32)
      && (!LOBYTE(self->mBlipRef) || [*(id *)&self->super.mDefinedByStyle isEqual:v5[3]])
      && TCObjectEqual(*(objc_object **)&self->mIsBlipRefOverridden, v5[5])
      && BYTE4(self->mSourceRect) == *((unsigned __int8 *)v5 + 52)
      && (!BYTE4(self->mSourceRect) || LODWORD(self->mSourceRect) == *((_DWORD *)v5 + 12))
      && BYTE6(self->mSourceRect) == *((unsigned __int8 *)v5 + 54)
      && (!BYTE6(self->mSourceRect) || BYTE5(self->mSourceRect) == *((unsigned __int8 *)v5 + 53)))
    {
      char v6 = TCObjectEqual(*(objc_object **)&self->mDpi, v5[7]);
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
  if (LOBYTE(self->mBlipRef)) {
    uint64_t v3 = [*(id *)&self->super.mDefinedByStyle hash];
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = *(void **)&self->mIsBlipRefOverridden;
  if (v4) {
    v3 ^= [v4 hash];
  }
  if (BYTE4(self->mSourceRect)) {
    v3 ^= SLODWORD(self->mSourceRect);
  }
  if (BYTE6(self->mSourceRect)) {
    v3 ^= BYTE5(self->mSourceRect);
  }
  v5 = *(void **)&self->mDpi;
  if (v5) {
    v3 ^= [v5 hash];
  }
  v7.receiver = self;
  v7.super_class = (Class)OADImageFill;
  return [(OADFill *)&v7 hash] ^ v3;
}

- (id)technique
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isTechniqueOverridden];
  id v3 = v2[7];

  return v3;
}

- (BOOL)isTechniqueOverridden
{
  return *(void *)&self->mDpi
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (LOBYTE(self->mBlipRef))
  {
    char v6 = (void *)[*(id *)&self->super.mDefinedByStyle copyWithZone:a3];
    [v5 setBlipRef:v6];
  }
  objc_super v7 = *(void **)&self->mIsBlipRefOverridden;
  if (v7)
  {
    objc_super v8 = (void *)[v7 copyWithZone:a3];
    [v5 setSourceRect:v8];
  }
  if (BYTE4(self->mSourceRect)) {
    [v5 setDpi:LODWORD(self->mSourceRect)];
  }
  if (BYTE6(self->mSourceRect)) {
    [v5 setRotateWithShape:BYTE5(self->mSourceRect)];
  }
  v9 = *(void **)&self->mDpi;
  if (v9)
  {
    v10 = (void *)[v9 copyWithZone:a3];
    [v5 setTechnique:v10];
  }
  return v5;
}

- (void)setStyleColor:(id)a3
{
  id v8 = a3;
  id v4 = [(OADImageFill *)self blipRef];
  uint64_t v5 = [v4 effectCount];
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      objc_super v7 = [v4 effectAtIndex:i];
      [v7 setStyleColor:v8];
    }
  }
}

void __33__OADImageFill_defaultProperties__block_invoke()
{
  v0 = [[OADImageFill alloc] initWithDefaults];
  v1 = (void *)+[OADImageFill defaultProperties]::defaultProperties;
  +[OADImageFill defaultProperties]::defaultProperties = (uint64_t)v0;
}

- (BOOL)isAnythingOverridden
{
  v4.receiver = self;
  v4.super_class = (Class)OADImageFill;
  return [(OADProperties *)&v4 isAnythingOverridden]
      || [(OADImageFill *)self isBlipRefOverridden]
      || [(OADImageFill *)self isSourceRectOverridden]
      || [(OADImageFill *)self isDpiOverridden]
      || [(OADImageFill *)self isRotateWithShapeOverridden]
      || [(OADImageFill *)self isTechniqueOverridden];
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)OADImageFill;
  [(OADProperties *)&v31 fixPropertiesForChangingParentPreservingEffectiveValues:v4];
  if (LOBYTE(self->mBlipRef)
    || ([(OADProperties *)self parent], id v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    char v6 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_isBlipRefOverridden];

    if (v6)
    {
      objc_super v7 = [(OADImageFill *)self blipRef];
    }
    else
    {
      objc_super v7 = 0;
    }
    id v8 = [v4 possiblyInexistentOverrideForSelector:sel_isBlipRefOverridden];

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
      v10 = *(void **)&self->super.mDefinedByStyle;
      *(void *)&self->super.mDefinedByStyle = 0;

      LOBYTE(self->mBlipRef) = 0;
    }
    else if (!LOBYTE(self->mBlipRef) && v6)
    {
      [(OADImageFill *)self setBlipRef:v7];
    }
  }
  if ([(OADImageFill *)self isSourceRectOverridden]
    || ([(OADProperties *)self parent],
        id v11 = (id)objc_claimAutoreleasedReturnValue(),
        v11,
        v11 != v4))
  {
    v12 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_isSourceRectOverridden];

    if (v12)
    {
      v13 = [(OADImageFill *)self sourceRect];
    }
    else
    {
      v13 = 0;
    }
    v14 = [v4 possiblyInexistentOverrideForSelector:sel_isSourceRectOverridden];

    if (v14)
    {
      v15 = [v4 sourceRect];
    }
    else
    {
      v15 = 0;
    }
    int v16 = TCObjectEqual(v13, v15);
    v17 = *(void **)&self->mIsBlipRefOverridden;
    if (v16)
    {
      *(void *)&self->mIsBlipRefOverridden = 0;
    }
    else if (!v17 && v12)
    {
      [(OADImageFill *)self setSourceRect:v13];
    }
  }
  if (BYTE4(self->mSourceRect)
    || ([(OADProperties *)self parent],
        id v18 = (id)objc_claimAutoreleasedReturnValue(),
        v18,
        v18 != v4))
  {
    int v19 = [(OADImageFill *)self dpi];
    if (v19 == [v4 dpi])
    {
      BYTE4(self->mSourceRect) = 0;
    }
    else if (!BYTE4(self->mSourceRect))
    {
      [(OADImageFill *)self setDpi:[(OADImageFill *)self dpi]];
    }
  }
  if (BYTE6(self->mSourceRect)
    || ([(OADProperties *)self parent],
        id v20 = (id)objc_claimAutoreleasedReturnValue(),
        v20,
        v20 != v4))
  {
    int v21 = [(OADImageFill *)self rotateWithShape];
    if (v21 == [v4 rotateWithShape])
    {
      BYTE6(self->mSourceRect) = 0;
    }
    else if (!BYTE6(self->mSourceRect))
    {
      [(OADImageFill *)self setRotateWithShape:[(OADImageFill *)self rotateWithShape]];
    }
  }
  p_mDpuint64_t i = &self->mDpi;
  if (*(void *)&self->mDpi
    || ([(OADProperties *)self parent],
        id v23 = (id)objc_claimAutoreleasedReturnValue(),
        v23,
        v23 != v4))
  {
    v24 = [(OADImageFill *)self technique];
    id v25 = objc_alloc_init((Class)objc_opt_class());

    v26 = [(OADImageFill *)self technique];
    [v25 setParent:v26];

    objc_storeStrong((id *)p_mDpi, v25);
    v27 = [v4 possiblyInexistentOverrideForSelector:sel_isTechniqueOverridden];

    if (v27)
    {
      v27 = [v4 technique];
    }
    if (*(void **)p_mDpi == v27)
    {
      id v30 = v27;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) == 0)
      {
        uint64_t v29 = [(id)objc_opt_class() defaultProperties];

        v27 = (void *)v29;
      }
      [*(id *)p_mDpi changeParentPreservingEffectiveValues:v27];
      if (isKindOfClass & 1) == 0 || ([*(id *)p_mDpi isAnythingOverridden]) {
        goto LABEL_53;
      }
      id v30 = *(id *)p_mDpi;
    }
    *(void *)p_mDpuint64_t i = 0;

LABEL_53:
  }
}

- (void)removeUnnecessaryOverrides
{
  id v3 = [(OADProperties *)self parent];

  if (v3)
  {
    BOOL v4 = [(OADProperties *)self isMerged];
    BOOL v5 = [(OADProperties *)self isMergedWithParent];
    [(OADProperties *)self setMerged:0];
    [(OADProperties *)self setMergedWithParent:0];
    if (![(OADImageFill *)self isSourceRectOverridden]) {
      goto LABEL_10;
    }
    char v6 = [(OADProperties *)self parent];
    objc_super v7 = [(OADImageFill *)self sourceRect];
    id v8 = [v6 sourceRect];
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
      if ([(OADImageFill *)self isDpiOverridden])
      {
        v13 = [(OADProperties *)self parent];
        int v14 = [(OADImageFill *)self dpi];
        if (v14 == [v13 dpi])
        {
          [(OADImageFill *)self setDpi:72];
          BYTE4(self->mSourceRect) = 0;
        }
      }
      if ([(OADImageFill *)self isRotateWithShapeOverridden])
      {
        v15 = [(OADProperties *)self parent];
        int v16 = [(OADImageFill *)self rotateWithShape];
        if (v16 == [v15 rotateWithShape])
        {
          [(OADImageFill *)self setRotateWithShape:1];
          BYTE6(self->mSourceRect) = 0;
        }
      }
      if (![(OADImageFill *)self isTechniqueOverridden]) {
        goto LABEL_26;
      }
      v17 = [(OADProperties *)self parent];
      id v18 = [(OADImageFill *)self technique];
      int v19 = [v17 technique];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(objc_object *)v18 removeUnnecessaryOverrides];
        uint64_t v20 = objc_opt_class();
        if (v20 != objc_opt_class()) {
          goto LABEL_25;
        }
        uint64_t v21 = [(objc_object *)v18 isMergedWithParent];
        [(objc_object *)v18 setMergedWithParent:0];
        char v22 = [(objc_object *)v18 isAnythingOverridden];
        [(objc_object *)v18 setMergedWithParent:v21];
        if (v22) {
          goto LABEL_25;
        }
      }
      else if (!TCObjectEqual(v18, v19))
      {
LABEL_25:

LABEL_26:
        [(OADProperties *)self setMerged:v4];
        [(OADProperties *)self setMergedWithParent:v5];
        v24.receiver = self;
        v24.super_class = (Class)OADImageFill;
        [(OADProperties *)&v24 removeUnnecessaryOverrides];
        return;
      }
      id v23 = *(void **)&self->mDpi;
      *(void *)&self->mDpuint64_t i = 0;

      goto LABEL_25;
    }
    v12 = *(void **)&self->mIsBlipRefOverridden;
    *(void *)&self->mIsBlipRefOverridden = 0;

    goto LABEL_9;
  }
}

- (id)color
{
  if ([*(id *)&self->super.mDefinedByStyle effectCount])
  {
    uint64_t v3 = 0;
    unsigned int v4 = 1;
    while (1)
    {
      BOOL v5 = [*(id *)&self->super.mDefinedByStyle effectAtIndex:v3];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }

      uint64_t v3 = v4;
      if ([*(id *)&self->super.mDefinedByStyle effectCount] <= (unint64_t)v4++) {
        goto LABEL_5;
      }
    }
    objc_super v7 = [v5 foregroundColor];
  }
  else
  {
LABEL_5:
    objc_super v7 = 0;
  }
  return v7;
}

- (int)dpi
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isDpiOverridden];
  int v3 = v2[12];

  return v3;
}

- (BOOL)isDpiOverridden
{
  return BYTE4(self->mSourceRect)
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)rotateWithShape
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isRotateWithShapeOverridden];
  char v3 = v2[53];

  return v3;
}

- (BOOL)isRotateWithShapeOverridden
{
  return BYTE6(self->mSourceRect)
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDpi, 0);
  objc_storeStrong((id *)&self->mIsBlipRefOverridden, 0);
  objc_storeStrong((id *)&self->super.mDefinedByStyle, 0);
}

@end