@interface OADGradientFill
+ (id)defaultProperties;
+ (id)stringForTileFlipMode:(int)a3;
- (BOOL)areStopsOverridden;
- (BOOL)isAnythingOverridden;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFlipModeOverridden;
- (BOOL)isRotateWithShapeOverridden;
- (BOOL)isShadeOverridden;
- (BOOL)isTileRectOverridden;
- (BOOL)rotateWithShape;
- (BOOL)usesPlaceholderColor;
- (OADGradientFill)initWithDefaults;
- (id)copyWithZone:(_NSZone *)a3;
- (id)firstStop;
- (id)lastStop;
- (id)shade;
- (id)stops;
- (id)tileRect;
- (int)flipMode;
- (unint64_t)hash;
- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3;
- (void)removeUnnecessaryOverrides;
- (void)setFlipMode:(int)a3;
- (void)setParent:(id)a3;
- (void)setRotateWithShape:(BOOL)a3;
- (void)setShade:(id)a3;
- (void)setStops:(id)a3;
- (void)setStyleColor:(id)a3;
- (void)setTileRect:(id)a3;
- (void)sortStops;
@end

@implementation OADGradientFill

+ (id)defaultProperties
{
  if (+[OADGradientFill defaultProperties]::once != -1) {
    dispatch_once(&+[OADGradientFill defaultProperties]::once, &__block_literal_global_150);
  }
  v2 = (void *)+[OADGradientFill defaultProperties]::defaultProperties;
  return v2;
}

- (OADGradientFill)initWithDefaults
{
  v11.receiver = self;
  v11.super_class = (Class)OADGradientFill;
  v2 = [(OADProperties *)&v11 initWithDefaults];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
    v4 = +[OADRgbColor black];
    +[OADGradientFillStop addStopWithColor:v4 position:v3 toArray:0.0];

    v5 = +[OADRgbColor white];
    LODWORD(v6) = 1.0;
    +[OADGradientFillStop addStopWithColor:v5 position:v3 toArray:v6];

    [(OADGradientFill *)v2 setStops:v3];
    v7 = [[OADRelativeRect alloc] initWithLeft:0.0 top:0.0 right:0.0 bottom:0.0];
    [(OADGradientFill *)v2 setTileRect:v7];
    [(OADGradientFill *)v2 setFlipMode:0];
    [(OADGradientFill *)v2 setRotateWithShape:1];
    v8 = +[OADLinearShade defaultProperties];
    v9 = (void *)[v8 copy];
    [(OADGradientFill *)v2 setShade:v9];
  }
  return v2;
}

- (void)setTileRect:(id)a3
{
  v4 = (NSArray *)a3;
  if (!v4)
  {
    v5 = [NSString stringWithUTF8String:"-[OADGradientFill setTileRect:]"];
    double v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADFill.mm"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 743, 0, "invalid nil value for '%{public}s'", "tileRect");

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  mStops = self->mStops;
  self->mStops = v4;
}

- (void)setFlipMode:(int)a3
{
  LODWORD(self->mTileRect) = a3;
  BYTE4(self->mTileRect) = 1;
}

- (void)setRotateWithShape:(BOOL)a3
{
  BYTE5(self->mTileRect) = a3;
  BYTE6(self->mTileRect) = 1;
}

- (void)setShade:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v5 = [NSString stringWithUTF8String:"-[OADGradientFill setShade:]"];
    double v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADFill.mm"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 782, 0, "invalid nil value for '%{public}s'", "shade");

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  v7 = *(void **)&self->mFlipMode;
  *(void *)&self->mFlipMode = v4;
}

- (void)setParent:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)OADGradientFill;
  [(OADProperties *)&v6 setParent:v4];
  if (*(void *)&self->mFlipMode)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [v4 shade];
      if ([v5 isMemberOfClass:objc_opt_class()]) {
        [*(id *)&self->mFlipMode setParent:v5];
      }
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OADGradientFill;
  if ([(OADFill *)&v8 isEqual:v4])
  {
    v5 = (objc_object **)v4;
    if (TCObjectEqual(*(objc_object **)&self->super.mDefinedByStyle, v5[3])
      && TCObjectEqual((objc_object *)self->mStops, v5[4])
      && BYTE4(self->mTileRect) == *((unsigned __int8 *)v5 + 44)
      && (!BYTE4(self->mTileRect) || LODWORD(self->mTileRect) == *((_DWORD *)v5 + 10))
      && BYTE6(self->mTileRect) == *((unsigned __int8 *)v5 + 46)
      && (!BYTE6(self->mTileRect) || BYTE5(self->mTileRect) == *((unsigned __int8 *)v5 + 45)))
    {
      char v6 = TCObjectEqual(*(objc_object **)&self->mFlipMode, v5[6]);
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

- (id)stops
{
  v2 = [(OADProperties *)self overrideForSelector:sel_areStopsOverridden];
  id v3 = v2[3];

  return v3;
}

- (BOOL)areStopsOverridden
{
  return *(void *)&self->super.mDefinedByStyle
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (unint64_t)hash
{
  mStops = self->mStops;
  if (mStops) {
    uint64_t v4 = [(NSArray *)mStops hash];
  }
  else {
    uint64_t v4 = 0;
  }
  if (BYTE4(self->mTileRect)) {
    v4 ^= LODWORD(self->mTileRect);
  }
  if (BYTE6(self->mTileRect)) {
    v4 ^= BYTE5(self->mTileRect);
  }
  v5 = *(void **)&self->mFlipMode;
  if (v5) {
    v4 ^= [v5 hash];
  }
  v7.receiver = self;
  v7.super_class = (Class)OADGradientFill;
  return [(OADFill *)&v7 hash] ^ v4;
}

- (id)shade
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isShadeOverridden];
  id v3 = v2[6];

  return v3;
}

- (BOOL)isShadeOverridden
{
  return *(void *)&self->mFlipMode
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(void *)&self->super.mDefinedByStyle)
  {
    char v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF8C0], "allocWithZone:", a3), "initWithArray:copyItems:", *(void *)&self->super.mDefinedByStyle, 1);
    [v5 setStops:v6];
  }
  mStops = self->mStops;
  if (mStops)
  {
    objc_super v8 = (void *)[(NSArray *)mStops copyWithZone:a3];
    [v5 setTileRect:v8];
  }
  if (BYTE4(self->mTileRect)) {
    [v5 setFlipMode:LODWORD(self->mTileRect)];
  }
  if (BYTE6(self->mTileRect)) {
    [v5 setRotateWithShape:BYTE5(self->mTileRect)];
  }
  v9 = *(void **)&self->mFlipMode;
  if (v9)
  {
    v10 = (void *)[v9 copyWithZone:a3];
    [v5 setShade:v10];
  }
  return v5;
}

- (void)setStops:(id)a3
{
  uint64_t v4 = [a3 copy];
  v5 = *(void **)&self->super.mDefinedByStyle;
  *(void *)&self->super.mDefinedByStyle = v4;
}

- (void)setStyleColor:(id)a3
{
}

void __36__OADGradientFill_defaultProperties__block_invoke()
{
  v0 = [[OADGradientFill alloc] initWithDefaults];
  v1 = (void *)+[OADGradientFill defaultProperties]::defaultProperties;
  +[OADGradientFill defaultProperties]::defaultProperties = (uint64_t)v0;
}

- (BOOL)isAnythingOverridden
{
  v4.receiver = self;
  v4.super_class = (Class)OADGradientFill;
  return [(OADProperties *)&v4 isAnythingOverridden]
      || [(OADGradientFill *)self areStopsOverridden]
      || [(OADGradientFill *)self isTileRectOverridden]
      || [(OADGradientFill *)self isFlipModeOverridden]
      || [(OADGradientFill *)self isRotateWithShapeOverridden]
      || [(OADGradientFill *)self isShadeOverridden];
}

- (void)fixPropertiesForChangingParentPreservingEffectiveValues:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)OADGradientFill;
  [(OADProperties *)&v32 fixPropertiesForChangingParentPreservingEffectiveValues:v4];
  if ([(OADGradientFill *)self areStopsOverridden]
    || ([(OADProperties *)self parent], id v5 = (id)objc_claimAutoreleasedReturnValue(),
                                                 v5,
                                                 v5 != v4))
  {
    char v6 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_areStopsOverridden];

    if (v6)
    {
      objc_super v7 = [(OADGradientFill *)self stops];
    }
    else
    {
      objc_super v7 = 0;
    }
    objc_super v8 = [v4 possiblyInexistentOverrideForSelector:sel_areStopsOverridden];

    if (v8)
    {
      v9 = [v4 stops];
    }
    else
    {
      v9 = 0;
    }
    int v10 = TCObjectEqual(v7, v9);
    objc_super v11 = *(void **)&self->super.mDefinedByStyle;
    if (v10)
    {
      *(void *)&self->super.mDefinedByStyle = 0;
    }
    else if (!v11 && v6)
    {
      [(OADGradientFill *)self setStops:v7];
    }
  }
  if ([(OADGradientFill *)self isTileRectOverridden]
    || ([(OADProperties *)self parent],
        id v12 = (id)objc_claimAutoreleasedReturnValue(),
        v12,
        v12 != v4))
  {
    v13 = [(OADProperties *)self possiblyInexistentOverrideForSelector:sel_isTileRectOverridden];

    if (v13)
    {
      v14 = [(OADGradientFill *)self tileRect];
    }
    else
    {
      v14 = 0;
    }
    v15 = [v4 possiblyInexistentOverrideForSelector:sel_isTileRectOverridden];

    if (v15)
    {
      v16 = [v4 tileRect];
    }
    else
    {
      v16 = 0;
    }
    int v17 = TCObjectEqual(v14, v16);
    mStops = self->mStops;
    if (v17)
    {
      self->mStops = 0;
    }
    else if (!mStops && v13)
    {
      [(OADGradientFill *)self setTileRect:v14];
    }
  }
  if (BYTE4(self->mTileRect)
    || ([(OADProperties *)self parent],
        id v19 = (id)objc_claimAutoreleasedReturnValue(),
        v19,
        v19 != v4))
  {
    int v20 = [(OADGradientFill *)self flipMode];
    if (v20 == [v4 flipMode])
    {
      BYTE4(self->mTileRect) = 0;
    }
    else if (!BYTE4(self->mTileRect))
    {
      [(OADGradientFill *)self setFlipMode:[(OADGradientFill *)self flipMode]];
    }
  }
  if (BYTE6(self->mTileRect)
    || ([(OADProperties *)self parent],
        id v21 = (id)objc_claimAutoreleasedReturnValue(),
        v21,
        v21 != v4))
  {
    int v22 = [(OADGradientFill *)self rotateWithShape];
    if (v22 == [v4 rotateWithShape])
    {
      BYTE6(self->mTileRect) = 0;
    }
    else if (!BYTE6(self->mTileRect))
    {
      [(OADGradientFill *)self setRotateWithShape:[(OADGradientFill *)self rotateWithShape]];
    }
  }
  p_mFlipMode = &self->mFlipMode;
  if (*(void *)&self->mFlipMode
    || ([(OADProperties *)self parent],
        id v24 = (id)objc_claimAutoreleasedReturnValue(),
        v24,
        v24 != v4))
  {
    v25 = [(OADGradientFill *)self shade];
    id v26 = objc_alloc_init((Class)objc_opt_class());

    v27 = [(OADGradientFill *)self shade];
    [v26 setParent:v27];

    objc_storeStrong((id *)p_mFlipMode, v26);
    v28 = [v4 possiblyInexistentOverrideForSelector:sel_isShadeOverridden];

    if (v28)
    {
      v28 = [v4 shade];
    }
    if (*(void **)p_mFlipMode == v28)
    {
      id v31 = v28;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) == 0)
      {
        uint64_t v30 = [(id)objc_opt_class() defaultProperties];

        v28 = (void *)v30;
      }
      [*(id *)p_mFlipMode changeParentPreservingEffectiveValues:v28];
      if (isKindOfClass & 1) == 0 || ([*(id *)p_mFlipMode isAnythingOverridden]) {
        goto LABEL_53;
      }
      id v31 = *(id *)p_mFlipMode;
    }
    *(void *)p_mFlipMode = 0;

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
    if (![(OADGradientFill *)self areStopsOverridden]) {
      goto LABEL_10;
    }
    char v6 = [(OADProperties *)self parent];
    objc_super v7 = [(OADGradientFill *)self stops];
    objc_super v8 = [v6 stops];
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
      if (![(OADGradientFill *)self isTileRectOverridden]) {
        goto LABEL_18;
      }
      v13 = [(OADProperties *)self parent];
      v14 = [(OADGradientFill *)self tileRect];
      v15 = [v13 tileRect];
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
        if ([(OADGradientFill *)self isFlipModeOverridden])
        {
          int v20 = [(OADProperties *)self parent];
          int v21 = [(OADGradientFill *)self flipMode];
          if (v21 == [v20 flipMode])
          {
            [(OADGradientFill *)self setFlipMode:0];
            BYTE4(self->mTileRect) = 0;
          }
        }
        if ([(OADGradientFill *)self isRotateWithShapeOverridden])
        {
          int v22 = [(OADProperties *)self parent];
          int v23 = [(OADGradientFill *)self rotateWithShape];
          if (v23 == [v22 rotateWithShape])
          {
            [(OADGradientFill *)self setRotateWithShape:1];
            BYTE6(self->mTileRect) = 0;
          }
        }
        if (![(OADGradientFill *)self isShadeOverridden]) {
          goto LABEL_34;
        }
        id v24 = [(OADProperties *)self parent];
        v25 = [(OADGradientFill *)self shade];
        id v26 = [v24 shade];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(objc_object *)v25 removeUnnecessaryOverrides];
          uint64_t v27 = objc_opt_class();
          if (v27 != objc_opt_class()) {
            goto LABEL_33;
          }
          uint64_t v28 = [(objc_object *)v25 isMergedWithParent];
          [(objc_object *)v25 setMergedWithParent:0];
          char v29 = [(objc_object *)v25 isAnythingOverridden];
          [(objc_object *)v25 setMergedWithParent:v28];
          if (v29) {
            goto LABEL_33;
          }
        }
        else if (!TCObjectEqual(v25, v26))
        {
LABEL_33:

LABEL_34:
          [(OADProperties *)self setMerged:v4];
          [(OADProperties *)self setMergedWithParent:v5];
          v31.receiver = self;
          v31.super_class = (Class)OADGradientFill;
          [(OADProperties *)&v31 removeUnnecessaryOverrides];
          return;
        }
        uint64_t v30 = *(void **)&self->mFlipMode;
        *(void *)&self->mFlipMode = 0;

        goto LABEL_33;
      }
      mStops = self->mStops;
      self->mStops = 0;

      goto LABEL_17;
    }
    id v12 = *(void **)&self->super.mDefinedByStyle;
    *(void *)&self->super.mDefinedByStyle = 0;

    goto LABEL_9;
  }
}

- (void)sortStops
{
  id v5 = (id)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"position" ascending:1];
  id v3 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:");
  BOOL v4 = [*(id *)&self->super.mDefinedByStyle sortedArrayUsingDescriptors:v3];
  [(OADGradientFill *)self setStops:v4];
}

- (id)tileRect
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isTileRectOverridden];
  id v3 = v2[4];

  return v3;
}

- (BOOL)isTileRectOverridden
{
  return self->mStops || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (int)flipMode
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isFlipModeOverridden];
  int v3 = v2[10];

  return v3;
}

- (BOOL)isFlipModeOverridden
{
  return BYTE4(self->mTileRect)
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (BOOL)rotateWithShape
{
  v2 = [(OADProperties *)self overrideForSelector:sel_isRotateWithShapeOverridden];
  char v3 = v2[45];

  return v3;
}

- (BOOL)isRotateWithShapeOverridden
{
  return BYTE6(self->mTileRect)
      || [(OADProperties *)self isMergedPropertyForSelector:a2];
}

- (id)firstStop
{
  objc_opt_class();
  char v3 = [(OADGradientFill *)self stops];
  BOOL v4 = [v3 firstObject];

  return v4;
}

- (id)lastStop
{
  objc_opt_class();
  char v3 = [(OADGradientFill *)self stops];
  BOOL v4 = [v3 lastObject];

  return v4;
}

- (BOOL)usesPlaceholderColor
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)&self->super.mDefinedByStyle;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "usesPlaceholderColor", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

+ (id)stringForTileFlipMode:(int)a3
{
  if (a3 > 3) {
    return @"unknown";
  }
  else {
    return off_264D62710[a3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFlipMode, 0);
  objc_storeStrong((id *)&self->mStops, 0);
  objc_storeStrong((id *)&self->super.mDefinedByStyle, 0);
}

@end