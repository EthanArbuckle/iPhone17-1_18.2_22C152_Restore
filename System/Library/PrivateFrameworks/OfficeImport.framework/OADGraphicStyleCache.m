@interface OADGraphicStyleCache
+ (int)fillCatagory:(id)a3;
- (OADGraphicStyleCache)init;
- (id)cachedDrawableStylesOfCategory:(int)a3;
- (id)chartStyleIds;
- (id)colorCache;
- (id)countedDrawableStyleOfCategory:(int)a3 atIndex:(unint64_t)a4;
- (id)fillsOfCategory:(int)a3;
- (id)fontFaceCache;
- (id)shadows;
- (id)strokes;
- (id)tableStyleForId:(id)a3;
- (id)tableStyleIds;
- (unint64_t)cacheDrawablePropertiesOfCategory:(int)a3 withFillCategory:(int)a4 fillIndex:(unint64_t)a5 strokeIndex:(unint64_t)a6 shadowIndex:(unint64_t)a7 reflectionOpacity:(float)a8 textStyleIndex:(unint64_t)a9;
- (unint64_t)cacheDrawablePropertiesOfCategory:(int)a3 withGraphicProperties:(id)a4 textBodyProperties:(id)a5 paragraphProperties:(id)a6 characterProperties:(id)a7 colorContext:(id)a8;
- (unint64_t)cacheFill:(id)a3 returnCategory:(int *)a4;
- (unint64_t)cacheShadow:(id)a3;
- (unint64_t)cacheStroke:(id)a3;
- (void)applyCachedDrawableStyle:(id)a3 toGraphicProperties:(id)a4;
- (void)applyCachedDrawableStyle:(id)a3 toParagraphProperties:(id)a4;
- (void)applyCachedDrawableStyle:(id)a3 toTextBodyProperties:(id)a4;
- (void)cacheChartStyleId:(int)a3;
- (void)cacheTableStyle:(id)a3;
- (void)dealloc;
@end

@implementation OADGraphicStyleCache

- (OADGraphicStyleCache)init
{
  v26.receiver = self;
  v26.super_class = (Class)OADGraphicStyleCache;
  v2 = [(OADGraphicStyleCache *)&v26 init];
  if (v2)
  {
    for (uint64_t i = 8; i != 40; i += 8)
    {
      v4 = objc_alloc_init(OADGraphicFeatureCache);
      v5 = *(Class *)((char *)&v2->super.isa + i);
      *(Class *)((char *)&v2->super.isa + i) = (Class)v4;
    }
    v6 = objc_alloc_init(OADGraphicFeatureCache);
    mStrokeCache = v2->mStrokeCache;
    v2->mStrokeCache = v6;

    v8 = objc_alloc_init(OADGraphicFeatureCache);
    mShadowCache = v2->mShadowCache;
    v2->mShadowCache = v8;

    v10 = objc_alloc_init(OADGraphicFeatureCache);
    mColorCache = v2->mColorCache;
    v2->mColorCache = v10;

    v12 = objc_alloc_init(OADGraphicFeatureCache);
    mFontFaceCache = v2->mFontFaceCache;
    v2->mFontFaceCache = v12;

    v14 = objc_alloc_init(OADGraphicFeatureCache);
    mTextStyleCache = v2->mTextStyleCache;
    v2->mTextStyleCache = v14;

    v16 = objc_alloc_init(OADGraphicFeatureCache);
    mTableIdCache = v2->mTableIdCache;
    v2->mTableIdCache = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mTableStyleCache = v2->mTableStyleCache;
    v2->mTableStyleCache = v18;

    v20 = objc_alloc_init(OADGraphicFeatureCache);
    mChartIdCache = v2->mChartIdCache;
    v2->mChartIdCache = v20;

    for (uint64_t j = 104; j != 136; j += 8)
    {
      v23 = objc_alloc_init(OADGraphicFeatureCache);
      v24 = *(Class *)((char *)&v2->super.isa + j);
      *(Class *)((char *)&v2->super.isa + j) = (Class)v23;
    }
  }
  return v2;
}

- (unint64_t)cacheStroke:(id)a3
{
  id v4 = a3;
  v5 = [v4 fill];
  int v6 = +[OADGraphicStyleCache fillCatagory:v5];

  if (v6 == 4) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = [(OADGraphicFeatureCache *)self->mStrokeCache cacheFeature:v4];
  }

  return v7;
}

+ (int)fillCatagory:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = objc_opt_class();
    int v6 = TSUDynamicCast(v5, (uint64_t)v3);
    unint64_t v7 = v6;
    if (v6)
    {
      v8 = [v6 color];
      +[OADColor alphaWithColor:v8];
      float v10 = v9;

      if (v10 <= 0.08) {
        int v4 = 4;
      }
      else {
        int v4 = 0;
      }
    }
    else
    {
      uint64_t v11 = objc_opt_class();
      v12 = TSUDynamicCast(v11, (uint64_t)v3);
      v13 = v12;
      if (v12)
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        v14 = objc_msgSend(v12, "stops", 0);
        uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v33;
          while (2)
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v33 != v16) {
                objc_enumerationMutation(v14);
              }
              v18 = [*(id *)(*((void *)&v32 + 1) + 8 * i) color];
              +[OADColor alphaWithColor:v18];
              BOOL v20 = v19 <= 0.08;

              if (!v20)
              {
                int v4 = 1;
                goto LABEL_19;
              }
            }
            uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }
        int v4 = 4;
LABEL_19:
      }
      else
      {
        uint64_t v21 = objc_opt_class();
        v22 = TSUDynamicCast(v21, (uint64_t)v3);
        v23 = v22;
        if (v22)
        {
          v24 = [v22 blipRef];
          uint64_t v25 = [v24 effectCount];
          if (v25)
          {
            uint64_t v26 = 0;
            while (1)
            {
              uint64_t v27 = objc_opt_class();
              v28 = [v24 effectAtIndex:v26];
              v29 = TSUDynamicCast(v27, (uint64_t)v28);

              if (v29)
              {
                [v29 alpha];
                if (v30 <= 0.08) {
                  break;
                }
              }

              if (v25 == ++v26) {
                goto LABEL_26;
              }
            }

            int v4 = 4;
          }
          else
          {
LABEL_26:
            int v4 = 2;
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            int v4 = 3;
          }
          else {
            int v4 = 4;
          }
        }
      }
    }
  }
  else
  {
    int v4 = 4;
  }

  return v4;
}

- (unint64_t)cacheShadow:(id)a3
{
  return [(OADGraphicFeatureCache *)self->mShadowCache cacheFeature:a3];
}

- (void)dealloc
{
  for (uint64_t i = 8; i != 40; i += 8)
  {
    int v4 = *(Class *)((char *)&self->super.isa + i);
    *(Class *)((char *)&self->super.isa + i) = 0;
  }
  mStrokeCache = self->mStrokeCache;
  self->mStrokeCache = 0;

  mShadowCache = self->mShadowCache;
  self->mShadowCache = 0;

  mColorCache = self->mColorCache;
  self->mColorCache = 0;

  mFontFaceCache = self->mFontFaceCache;
  self->mFontFaceCache = 0;

  mTextStyleCache = self->mTextStyleCache;
  self->mTextStyleCache = 0;

  mTableIdCache = self->mTableIdCache;
  self->mTableIdCache = 0;

  mTableStyleCache = self->mTableStyleCache;
  self->mTableStyleCache = 0;

  mChartIdCache = self->mChartIdCache;
  self->mChartIdCache = 0;

  for (uint64_t j = 104; j != 136; j += 8)
  {
    v14 = *(Class *)((char *)&self->super.isa + j);
    *(Class *)((char *)&self->super.isa + j) = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)OADGraphicStyleCache;
  [(OADGraphicStyleCache *)&v15 dealloc];
}

- (unint64_t)cacheFill:(id)a3 returnCategory:(int *)a4
{
  id v6 = a3;
  int v7 = +[OADGraphicStyleCache fillCatagory:v6];
  if (a4) {
    *a4 = v7;
  }
  if (v7 > 3) {
    unint64_t v8 = 0;
  }
  else {
    unint64_t v8 = [(OADGraphicFeatureCache *)self->mFillCacheArray[v7] cacheFeature:v6];
  }

  return v8;
}

- (id)fontFaceCache
{
  return self->mFontFaceCache;
}

- (id)colorCache
{
  return self->mColorCache;
}

- (void)cacheTableStyle:(id)a3
{
  id v6 = a3;
  int v4 = [v6 id];
  if ([v4 hasPrefix:@"{"]
    && [v4 hasSuffix:@"}"]
    && [v4 length] == 38)
  {
    uint64_t v5 = objc_msgSend(v4, "substringWithRange:", 1, objc_msgSend(v4, "length") - 2);

    int v4 = (void *)v5;
  }
  if (v4)
  {
    [(OADGraphicFeatureCache *)self->mTableIdCache cacheFeature:v4];
    [(NSMutableDictionary *)self->mTableStyleCache setObject:v6 forKey:v4];
  }
}

- (void)cacheChartStyleId:(int)a3
{
  mChartIdCache = self->mChartIdCache;
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  -[OADGraphicFeatureCache cacheFeature:](mChartIdCache, "cacheFeature:");
}

- (id)tableStyleForId:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->mTableStyleCache objectForKey:a3];
  return v3;
}

- (unint64_t)cacheDrawablePropertiesOfCategory:(int)a3 withFillCategory:(int)a4 fillIndex:(unint64_t)a5 strokeIndex:(unint64_t)a6 shadowIndex:(unint64_t)a7 reflectionOpacity:(float)a8 textStyleIndex:(unint64_t)a9
{
  uint64_t v11 = [[OADCachedDrawableStyle alloc] initWithFillCategory:*(void *)&a4 mFillIndex:a5 strokeIndex:a6 shadowIndex:a7 reflectionOpacity:(int)(a8 * 255.0) textStyleIndex:a9];
  unint64_t v12 = [(OADGraphicFeatureCache *)self->mDrawableStyleCacheArray[a3] cacheFeature:v11];

  return v12;
}

- (unint64_t)cacheDrawablePropertiesOfCategory:(int)a3 withGraphicProperties:(id)a4 textBodyProperties:(id)a5 paragraphProperties:(id)a6 characterProperties:(id)a7 colorContext:(id)a8
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v14 = a4;
  id v37 = a5;
  id v38 = a6;
  id v39 = a7;
  id v40 = a8;
  v41 = v14;
  unsigned int v46 = 4;
  if (a3)
  {
    unint64_t v15 = 0;
  }
  else
  {
    uint64_t v16 = [v14 fill];
    unint64_t v15 = [(OADGraphicStyleCache *)self cacheFill:v16 returnCategory:&v46];

    if (!v15)
    {
      unint64_t v19 = 0;
      goto LABEL_35;
    }
  }
  v17 = [v14 stroke];
  unint64_t v18 = [(OADGraphicStyleCache *)self cacheStroke:v17];

  if (v18
    || ((unint64_t v19 = 0, !a3) ? (v20 = v15 == 0) : (v20 = 0),
        !v20 ? (char v21 = 0) : (char v21 = 1),
        (a3 - 1) >= 2 && (v21 & 1) == 0))
  {
    [v14 effects];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v47 count:16];
    unint64_t v35 = v18;
    v36 = self;
    id v24 = 0;
    id v25 = 0;
    if (!v23) {
      goto LABEL_31;
    }
    uint64_t v26 = *(void *)v43;
    while (1)
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v43 != v26) {
          objc_enumerationMutation(v22);
        }
        v28 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        if (v24)
        {
          if (v25) {
            continue;
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            id v24 = v28;
            if (v25) {
              continue;
            }
          }
          else
          {
            id v24 = 0;
            if (v25) {
              continue;
            }
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v25 = v28;
        }
        else {
          id v25 = 0;
        }
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (!v23)
      {
LABEL_31:

        uint64_t v29 = [(OADGraphicStyleCache *)v36 cacheShadow:v24];
        [v25 startOpacity];
        int v31 = LODWORD(v30);
        if ((a3 & 0xFFFFFFFD) == 1)
        {
          uint64_t v32 = 0;
        }
        else
        {
          long long v33 = [[OADCachedTextStyle alloc] initWithTextBodyProperties:v37 paragraphProperties:v38 characterProperties:v39 colorContext:v40 graphicStyleCache:v36];
          uint64_t v32 = [(OADGraphicFeatureCache *)v36->mTextStyleCache cacheFeature:v33];
        }
        LODWORD(v30) = v31;
        unint64_t v19 = [(OADGraphicStyleCache *)v36 cacheDrawablePropertiesOfCategory:a3 withFillCategory:v46 fillIndex:v15 strokeIndex:v35 shadowIndex:v29 reflectionOpacity:v32 textStyleIndex:v30];

        break;
      }
    }
  }
LABEL_35:

  return v19;
}

- (id)countedDrawableStyleOfCategory:(int)a3 atIndex:(unint64_t)a4
{
  return [(OADGraphicFeatureCache *)self->mDrawableStyleCacheArray[a3] countedFeatureAtIndex:a4];
}

- (id)strokes
{
  return [(OADGraphicFeatureCache *)self->mStrokeCache featuresSortedByUsageCount];
}

- (id)shadows
{
  return [(OADGraphicFeatureCache *)self->mShadowCache featuresSortedByUsageCount];
}

- (id)fillsOfCategory:(int)a3
{
  return [(OADGraphicFeatureCache *)self->mFillCacheArray[a3] featuresSortedByUsageCount];
}

- (id)tableStyleIds
{
  return [(OADGraphicFeatureCache *)self->mTableIdCache featuresSortedByUsageCount];
}

- (id)chartStyleIds
{
  return [(OADGraphicFeatureCache *)self->mChartIdCache featuresSortedByUsageCount];
}

- (id)cachedDrawableStylesOfCategory:(int)a3
{
  return [(OADGraphicFeatureCache *)self->mDrawableStyleCacheArray[a3] featuresSortedByUsageCount];
}

- (void)applyCachedDrawableStyle:(id)a3 toGraphicProperties:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  if ((int)[v18 fillCategory] > 3
    || (-[OADGraphicFeatureCache countedFeatureAtIndex:](self->mFillCacheArray[[v18 fillCategory]], "countedFeatureAtIndex:", objc_msgSend(v18, "fillIndex")), int v7 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v7, "feature"), v8 = objc_claimAutoreleasedReturnValue(), v7, !v8))
  {
    unint64_t v8 = +[OADNullFill nullFill];
  }
  float v9 = -[OADGraphicFeatureCache countedFeatureAtIndex:](self->mStrokeCache, "countedFeatureAtIndex:", [v18 strokeIndex]);
  float v10 = [v9 feature];

  if (!v10)
  {
    float v10 = +[OADStroke nullStroke];
  }
  uint64_t v11 = [MEMORY[0x263EFF8C0] array];
  unint64_t v12 = -[OADGraphicFeatureCache countedFeatureAtIndex:](self->mShadowCache, "countedFeatureAtIndex:", [v18 shadowIndex]);
  v13 = [v12 feature];

  if (v13)
  {
    uint64_t v14 = [v11 arrayByAddingObject:v13];

    uint64_t v11 = (void *)v14;
  }
  if ([v18 reflectionOpacity])
  {
    unint64_t v15 = objc_alloc_init(OADReflectionEffect);
    *(float *)&double v16 = (float)[v18 reflectionOpacity];
    [(OADReflectionEffect *)v15 setStartOpacity:v16];
    uint64_t v17 = [v11 arrayByAddingObject:v15];

    uint64_t v11 = (void *)v17;
  }
  [v6 setFill:v8];
  [v6 setStroke:v10];
  [v6 setEffects:v11];
}

- (void)applyCachedDrawableStyle:(id)a3 toParagraphProperties:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  int v7 = -[OADGraphicFeatureCache countedFeatureAtIndex:](self->mTextStyleCache, "countedFeatureAtIndex:", [v9 textStyleIndex]);
  unint64_t v8 = [v7 feature];

  [v8 applyToParagraphProperties:v6 graphicStyleCache:self];
}

- (void)applyCachedDrawableStyle:(id)a3 toTextBodyProperties:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  int v7 = -[OADGraphicFeatureCache countedFeatureAtIndex:](self->mTextStyleCache, "countedFeatureAtIndex:", [v9 textStyleIndex]);
  unint64_t v8 = [v7 feature];

  [v8 applyToTextBodyProperties:v6 graphicStyleCache:self];
}

- (void).cxx_destruct
{
  uint64_t v3 = 0;
  id v4 = &self->mDrawableStyleCacheArray[3];
  do
    objc_storeStrong((id *)&v4[v3--], 0);
  while (v3 != -4);
  objc_storeStrong((id *)&self->mChartIdCache, 0);
  objc_storeStrong((id *)&self->mTableStyleCache, 0);
  objc_storeStrong((id *)&self->mTableIdCache, 0);
  objc_storeStrong((id *)&self->mTextStyleCache, 0);
  objc_storeStrong((id *)&self->mFontFaceCache, 0);
  objc_storeStrong((id *)&self->mColorCache, 0);
  objc_storeStrong((id *)&self->mShadowCache, 0);
  objc_storeStrong((id *)&self->mStrokeCache, 0);
  uint64_t v5 = 32;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v5), 0);
    v5 -= 8;
  }
  while (v5);
}

@end