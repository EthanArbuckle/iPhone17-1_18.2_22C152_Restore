@interface OADTileTechnique
+ (id)defaultProperties;
- (BOOL)isAlignmentOverridden;
- (BOOL)isAnythingOverridden;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFlipModeOverridden;
- (BOOL)isOffsetXOverridden;
- (BOOL)isOffsetYOverridden;
- (BOOL)isScaleXOverridden;
- (BOOL)isScaleYOverridden;
- (OADTileTechnique)initWithDefaults;
- (float)offsetX;
- (float)offsetY;
- (float)scaleX;
- (float)scaleY;
- (id)copyWithZone:(_NSZone *)a3;
- (int)alignment;
- (int)flipMode;
- (unint64_t)hash;
- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3;
- (void)removeUnnecessaryOverrides;
- (void)setAlignment:(int)a3;
- (void)setFlipMode:(int)a3;
- (void)setOffsetX:(float)a3;
- (void)setOffsetY:(float)a3;
- (void)setScaleX:(float)a3;
- (void)setScaleY:(float)a3;
@end

@implementation OADTileTechnique

+ (id)defaultProperties
{
  if (+[OADTileTechnique defaultProperties]::once != -1) {
    dispatch_once(&+[OADTileTechnique defaultProperties]::once, &__block_literal_global_232);
  }
  v2 = (void *)+[OADTileTechnique defaultProperties]::defaultProperties;
  return v2;
}

- (OADTileTechnique)initWithDefaults
{
  v7.receiver = self;
  v7.super_class = (Class)OADTileTechnique;
  v2 = [(OADProperties *)&v7 initWithDefaults];
  v3 = v2;
  if (v2)
  {
    [(OADTileTechnique *)v2 setOffsetX:0.0];
    [(OADTileTechnique *)v3 setOffsetY:0.0];
    LODWORD(v4) = 1.0;
    [(OADTileTechnique *)v3 setScaleX:v4];
    LODWORD(v5) = 1.0;
    [(OADTileTechnique *)v3 setScaleY:v5];
    [(OADTileTechnique *)v3 setFlipMode:0];
    [(OADTileTechnique *)v3 setAlignment:1];
  }
  return v3;
}

- (void)setOffsetX:(float)a3
{
  *((float *)&self->super.super + 5) = a3;
  LOBYTE(self->mOffsetX) = 1;
}

- (void)setOffsetY:(float)a3
{
  *(float *)&self->mIsOffsetXOverridden = a3;
  LOBYTE(self->mOffsetY) = 1;
}

- (void)setScaleX:(float)a3
{
  *(float *)&self->mIsOffsetYOverridden = a3;
  LOBYTE(self->mScaleX) = 1;
}

- (void)setScaleY:(float)a3
{
  *(float *)&self->mIsScaleXOverridden = a3;
  LOBYTE(self->mScaleY) = 1;
}

- (void)setFlipMode:(int)a3
{
  *(_DWORD *)&self->mIsScaleYOverridden = a3;
  LOBYTE(self->mFlipMode) = 1;
}

- (void)setAlignment:(int)a3
{
  *(_DWORD *)&self->mIsFlipModeOverridden = a3;
  LOBYTE(self->mAlignment) = 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v4;
  if (LOBYTE(self->mOffsetX))
  {
    LODWORD(v5) = *((_DWORD *)&self->super.super + 5);
    [v4 setOffsetX:v5];
  }
  if (LOBYTE(self->mOffsetY))
  {
    LODWORD(v5) = *(_DWORD *)&self->mIsOffsetXOverridden;
    [v6 setOffsetY:v5];
  }
  if (LOBYTE(self->mScaleX))
  {
    LODWORD(v5) = *(_DWORD *)&self->mIsOffsetYOverridden;
    [v6 setScaleX:v5];
  }
  if (LOBYTE(self->mScaleY))
  {
    LODWORD(v5) = *(_DWORD *)&self->mIsScaleXOverridden;
    [v6 setScaleY:v5];
  }
  if (LOBYTE(self->mFlipMode)) {
    [v6 setFlipMode:*(unsigned int *)&self->mIsScaleYOverridden];
  }
  if (LOBYTE(self->mAlignment)) {
    [v6 setAlignment:*(unsigned int *)&self->mIsFlipModeOverridden];
  }
  return v6;
}

- (unint64_t)hash
{
  if (LOBYTE(self->mOffsetX)) {
    unint64_t v2 = (unint64_t)*((float *)&self->super.super + 5);
  }
  else {
    unint64_t v2 = 0;
  }
  if (LOBYTE(self->mOffsetY)) {
    v2 ^= (unint64_t)*(float *)&self->mIsOffsetXOverridden;
  }
  if (LOBYTE(self->mScaleX)) {
    v2 ^= (unint64_t)*(float *)&self->mIsOffsetYOverridden;
  }
  if (LOBYTE(self->mScaleY)) {
    v2 ^= (unint64_t)*(float *)&self->mIsScaleXOverridden;
  }
  if (LOBYTE(self->mFlipMode)) {
    v2 ^= *(unsigned int *)&self->mIsScaleYOverridden;
  }
  if (LOBYTE(self->mAlignment)) {
    v2 ^= *(unsigned int *)&self->mIsFlipModeOverridden;
  }
  v4.receiver = self;
  v4.super_class = (Class)OADTileTechnique;
  return [(OADImageFillTechnique *)&v4 hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OADTileTechnique;
  if ([(OADImageFillTechnique *)&v8 isEqual:v4])
  {
    double v5 = (float *)v4;
    if (LOBYTE(self->mOffsetX) == *((unsigned __int8 *)v5 + 24)
      && (!LOBYTE(self->mOffsetX) || *((float *)&self->super.super + 5) == v5[5])
      && LOBYTE(self->mOffsetY) == *((unsigned __int8 *)v5 + 32)
      && (!LOBYTE(self->mOffsetY) || *(float *)&self->mIsOffsetXOverridden == v5[7])
      && LOBYTE(self->mScaleX) == *((unsigned __int8 *)v5 + 40)
      && (!LOBYTE(self->mScaleX) || *(float *)&self->mIsOffsetYOverridden == v5[9])
      && LOBYTE(self->mScaleY) == *((unsigned __int8 *)v5 + 48)
      && (!LOBYTE(self->mScaleY) || *(float *)&self->mIsScaleXOverridden == v5[11])
      && LOBYTE(self->mFlipMode) == *((unsigned __int8 *)v5 + 56)
      && (!LOBYTE(self->mFlipMode) || *(_DWORD *)&self->mIsScaleYOverridden == *((_DWORD *)v5 + 13))
      && LOBYTE(self->mAlignment) == *((unsigned __int8 *)v5 + 64))
    {
      if (LOBYTE(self->mAlignment)) {
        BOOL v6 = *(_DWORD *)&self->mIsFlipModeOverridden == *((_DWORD *)v5 + 15);
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

void __37__OADTileTechnique_defaultProperties__block_invoke()
{
  v0 = [[OADTileTechnique alloc] initWithDefaults];
  v1 = (void *)+[OADTileTechnique defaultProperties]::defaultProperties;
  +[OADTileTechnique defaultProperties]::defaultProperties = (uint64_t)v0;
}

- (BOOL)isAnythingOverridden
{
  v4.receiver = self;
  v4.super_class = (Class)OADTileTechnique;
  return [(OADProperties *)&v4 isAnythingOverridden]
      || [(OADTileTechnique *)self isOffsetXOverridden]
      || [(OADTileTechnique *)self isOffsetYOverridden]
      || [(OADTileTechnique *)self isScaleXOverridden]
      || [(OADTileTechnique *)self isScaleYOverridden]
      || [(OADTileTechnique *)self isFlipModeOverridden]
      || [(OADTileTechnique *)self isAlignmentOverridden];
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)OADTileTechnique;
  [(OADProperties *)&v25 fixPropertiesForChangingParentPreservingEffectiveValues:v4];
  if (LOBYTE(self->mOffsetX)
    || ([(OADProperties *)self parent], id v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    [(OADTileTechnique *)self offsetX];
    float v7 = v6;
    [v4 offsetX];
    if (v7 == v8)
    {
      LOBYTE(self->mOffsetX) = 0;
    }
    else if (!LOBYTE(self->mOffsetX))
    {
      [(OADTileTechnique *)self offsetX];
      -[OADTileTechnique setOffsetX:](self, "setOffsetX:");
    }
  }
  if (LOBYTE(self->mOffsetY)
    || ([(OADProperties *)self parent], id v9 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v9,
                                                 v9 != v4))
  {
    [(OADTileTechnique *)self offsetY];
    float v11 = v10;
    [v4 offsetY];
    if (v11 == v12)
    {
      LOBYTE(self->mOffsetY) = 0;
    }
    else if (!LOBYTE(self->mOffsetY))
    {
      [(OADTileTechnique *)self offsetY];
      -[OADTileTechnique setOffsetY:](self, "setOffsetY:");
    }
  }
  if (LOBYTE(self->mScaleX)
    || ([(OADProperties *)self parent],
        id v13 = (id)objc_claimAutoreleasedReturnValue(),
        v13,
        v13 != v4))
  {
    [(OADTileTechnique *)self scaleX];
    float v15 = v14;
    [v4 scaleX];
    if (v15 == v16)
    {
      LOBYTE(self->mScaleX) = 0;
    }
    else if (!LOBYTE(self->mScaleX))
    {
      [(OADTileTechnique *)self scaleX];
      -[OADTileTechnique setScaleX:](self, "setScaleX:");
    }
  }
  if (LOBYTE(self->mScaleY)
    || ([(OADProperties *)self parent],
        id v17 = (id)objc_claimAutoreleasedReturnValue(),
        v17,
        v17 != v4))
  {
    [(OADTileTechnique *)self scaleY];
    float v19 = v18;
    [v4 scaleY];
    if (v19 == v20)
    {
      LOBYTE(self->mScaleY) = 0;
    }
    else if (!LOBYTE(self->mScaleY))
    {
      [(OADTileTechnique *)self scaleY];
      -[OADTileTechnique setScaleY:](self, "setScaleY:");
    }
  }
  if (LOBYTE(self->mFlipMode)
    || ([(OADProperties *)self parent],
        id v21 = (id)objc_claimAutoreleasedReturnValue(),
        v21,
        v21 != v4))
  {
    int v22 = [(OADTileTechnique *)self flipMode];
    if (v22 == [v4 flipMode])
    {
      LOBYTE(self->mFlipMode) = 0;
    }
    else if (!LOBYTE(self->mFlipMode))
    {
      [(OADTileTechnique *)self setFlipMode:[(OADTileTechnique *)self flipMode]];
    }
  }
  if (LOBYTE(self->mAlignment)
    || ([(OADProperties *)self parent],
        id v23 = (id)objc_claimAutoreleasedReturnValue(),
        v23,
        v23 != v4))
  {
    int v24 = [(OADTileTechnique *)self alignment];
    if (v24 == [v4 alignment])
    {
      LOBYTE(self->mAlignment) = 0;
    }
    else if (!LOBYTE(self->mAlignment))
    {
      [(OADTileTechnique *)self setAlignment:[(OADTileTechnique *)self alignment]];
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
    if ([(OADTileTechnique *)self isOffsetXOverridden])
    {
      float v6 = [(OADProperties *)self parent];
      [(OADTileTechnique *)self offsetX];
      float v8 = v7;
      [v6 offsetX];
      if (v8 == v9)
      {
        [(OADTileTechnique *)self setOffsetX:0.0];
        LOBYTE(self->mOffsetX) = 0;
      }
    }
    if ([(OADTileTechnique *)self isOffsetYOverridden])
    {
      float v10 = [(OADProperties *)self parent];
      [(OADTileTechnique *)self offsetY];
      float v12 = v11;
      [v10 offsetY];
      if (v12 == v13)
      {
        [(OADTileTechnique *)self setOffsetY:0.0];
        LOBYTE(self->mOffsetY) = 0;
      }
    }
    if ([(OADTileTechnique *)self isScaleXOverridden])
    {
      float v14 = [(OADProperties *)self parent];
      [(OADTileTechnique *)self scaleX];
      float v16 = v15;
      [v14 scaleX];
      if (v16 == *(float *)&v17)
      {
        LODWORD(v17) = 1.0;
        [(OADTileTechnique *)self setScaleX:v17];
        LOBYTE(self->mScaleX) = 0;
      }
    }
    if ([(OADTileTechnique *)self isScaleYOverridden])
    {
      float v18 = [(OADProperties *)self parent];
      [(OADTileTechnique *)self scaleY];
      float v20 = v19;
      [v18 scaleY];
      if (v20 == *(float *)&v21)
      {
        LODWORD(v21) = 1.0;
        [(OADTileTechnique *)self setScaleY:v21];
        LOBYTE(self->mScaleY) = 0;
      }
    }
    if ([(OADTileTechnique *)self isFlipModeOverridden])
    {
      int v22 = [(OADProperties *)self parent];
      int v23 = [(OADTileTechnique *)self flipMode];
      if (v23 == [v22 flipMode])
      {
        [(OADTileTechnique *)self setFlipMode:0];
        LOBYTE(self->mFlipMode) = 0;
      }
    }
    if ([(OADTileTechnique *)self isAlignmentOverridden])
    {
      int v24 = [(OADProperties *)self parent];
      int v25 = [(OADTileTechnique *)self alignment];
      if (v25 == [v24 alignment])
      {
        [(OADTileTechnique *)self setAlignment:1];
        LOBYTE(self->mAlignment) = 0;
      }
    }
    [(OADProperties *)self setMerged:v4];
    [(OADProperties *)self setMergedWithParent:v5];
    v26.receiver = self;
    v26.super_class = (Class)OADTileTechnique;
    [(OADProperties *)&v26 removeUnnecessaryOverrides];
  }
}

- (float)offsetX
{
  unint64_t v2 = [(OADProperties *)self overrideForSelector:sel_isOffsetXOverridden];
  float v3 = v2[5];

  return v3;
}

- (BOOL)isOffsetXOverridden
{
  return LOBYTE(self->mOffsetX)
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (float)offsetY
{
  unint64_t v2 = [(OADProperties *)self overrideForSelector:sel_isOffsetYOverridden];
  float v3 = v2[7];

  return v3;
}

- (BOOL)isOffsetYOverridden
{
  return LOBYTE(self->mOffsetY)
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (float)scaleX
{
  unint64_t v2 = [(OADProperties *)self overrideForSelector:sel_isScaleXOverridden];
  float v3 = v2[9];

  return v3;
}

- (BOOL)isScaleXOverridden
{
  return LOBYTE(self->mScaleX)
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (float)scaleY
{
  unint64_t v2 = [(OADProperties *)self overrideForSelector:sel_isScaleYOverridden];
  float v3 = v2[11];

  return v3;
}

- (BOOL)isScaleYOverridden
{
  return LOBYTE(self->mScaleY)
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (int)flipMode
{
  unint64_t v2 = [(OADProperties *)self overrideForSelector:sel_isFlipModeOverridden];
  int v3 = v2[13];

  return v3;
}

- (BOOL)isFlipModeOverridden
{
  return LOBYTE(self->mFlipMode)
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (int)alignment
{
  unint64_t v2 = [(OADProperties *)self overrideForSelector:sel_isAlignmentOverridden];
  int v3 = v2[15];

  return v3;
}

- (BOOL)isAlignmentOverridden
{
  return LOBYTE(self->mAlignment)
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

@end