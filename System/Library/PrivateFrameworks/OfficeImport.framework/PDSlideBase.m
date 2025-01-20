@interface PDSlideBase
+ (int)inheritedPlaceholderType:(int)a3;
- (BOOL)hasPpt10Animations;
- (BOOL)hasPpt9Animations;
- (BOOL)isHidden;
- (PDSlideBase)init;
- (id)animation;
- (id)background;
- (id)colorMap;
- (id)colorScheme;
- (id)defaultTableStyle;
- (id)defaultTextListStyle;
- (id)defaultTheme;
- (id)description;
- (id)drawables;
- (id)drawingTheme;
- (id)fontScheme;
- (id)inheritedTextStyleForPlaceholderType:(int)a3;
- (id)masterGraphicForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5;
- (id)name;
- (id)parentShapePropertiesForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5;
- (id)parentSlideBase;
- (id)parentTextBodyPropertiesForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5;
- (id)parentTextStyleForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 defaultTextListStyle:(id)a5 overrideIndex:(BOOL)a6;
- (id)parentTextStyleForTables;
- (id)placeholderWithType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5;
- (id)placeholderWithType:(int)a3 placeholderTypeIndex:(int)a4 useBaseTypeMatch:(BOOL)a5 overrideIndex:(BOOL)a6;
- (id)placeholders;
- (id)ppt2011Transition;
- (id)styleMatrix;
- (id)transition;
- (unsigned)slideId;
- (void)addSlideNumberPlaceholder:(id)a3;
- (void)doneWithContent;
- (void)generatePpt9Animations:(id)a3;
- (void)removeUnnecessaryOverrides;
- (void)setBackground:(id)a3;
- (void)setDefaultTableStyle:(id)a3;
- (void)setDrawables:(id)a3;
- (void)setDrawablesNoHierarchy:(id)a3;
- (void)setIsHidden:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPpt2011Transition:(id)a3;
- (void)setPpt9AnimationDataForCacheItem:(id)a3 order:(int)a4 state:(id)a5;
- (void)setSlideId:(unsigned int)a3;
- (void)setTransition:(id)a3;
- (void)setUpDrawablePropertyHierarchy;
- (void)setUpPropertyHierarchyForDrawable:(id)a3;
- (void)setUpPropertyHierarchyForDrawablePreservingEffectiveValues:(id)a3;
- (void)setUpPropertyHierarchyPreservingEffectiveValues;
@end

@implementation PDSlideBase

- (PDSlideBase)init
{
  v7.receiver = self;
  v7.super_class = (Class)PDSlideBase;
  v2 = [(PDSlideBase *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->mSlideId = 0;
    v4 = objc_alloc_init(PDAnimation);
    mAnimation = v3->mAnimation;
    v3->mAnimation = v4;
  }
  return v3;
}

- (id)drawables
{
  return self->mDrawables;
}

- (void)setBackground:(id)a3
{
}

+ (int)inheritedPlaceholderType:(int)a3
{
  int result = a3;
  if a3 <= 0xF && ((0xBF0Fu >> a3)) {
    return dword_238EF02A0[a3];
  }
  return result;
}

- (id)placeholderWithType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  return [(PDSlideBase *)self placeholderWithType:*(void *)&a3 placeholderTypeIndex:*(void *)&a4 useBaseTypeMatch:0 overrideIndex:a5];
}

- (id)placeholderWithType:(int)a3 placeholderTypeIndex:(int)a4 useBaseTypeMatch:(BOOL)a5 overrideIndex:(BOOL)a6
{
  int v6 = a3;
  BOOL v21 = a5;
  if (a5) {
    int v6 = +[PDSlideBase inheritedPlaceholderType:*(void *)&a3];
  }
  NSUInteger v8 = [(NSArray *)self->mDrawables count];
  if (!v8)
  {
LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
  NSUInteger v9 = v8;
  uint64_t v10 = 0;
  while (1)
  {
    v11 = [(NSArray *)self->mDrawables objectAtIndex:v10];
    v12 = [v11 clientData];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
LABEL_13:

    if (v9 == ++v10) {
      goto LABEL_14;
    }
  }
  id v13 = v12;
  if (([v13 hasPlaceholder] & 1) == 0) {
    goto LABEL_12;
  }
  v14 = [v13 placeholder];
  uint64_t v15 = [v14 type];

  if (v21) {
    LODWORD(v15) = +[PDSlideBase inheritedPlaceholderType:v15];
  }
  if (v15 != v6
    || ([v13 placeholder],
        v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = [v16 index],
        v16,
        v17 != a4)
    && !a6)
  {
LABEL_12:

    goto LABEL_13;
  }

LABEL_15:
  return v11;
}

- (void)addSlideNumberPlaceholder:(id)a3
{
  id v6 = a3;
  v4 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  [(NSArray *)v4 addObject:v6];
  [(NSArray *)v4 addObjectsFromArray:self->mDrawables];
  mDrawables = self->mDrawables;
  self->mDrawables = v4;
}

- (BOOL)isHidden
{
  return *((unsigned char *)self + 72) & 1;
}

- (id)background
{
  return self->mBackground;
}

- (void)setTransition:(id)a3
{
}

- (id)animation
{
  return self->mAnimation;
}

- (void)setDefaultTableStyle:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (id)transition
{
  return self->mTransition;
}

- (void)setIsHidden:(BOOL)a3
{
  *((unsigned char *)self + 72) = *((unsigned char *)self + 72) & 0xFE | a3;
}

- (id)name
{
  return self->mName;
}

- (void)setUpPropertyHierarchyForDrawable:(id)a3
{
  id v29 = a3;
  v4 = [(PDSlideBase *)self defaultTextListStyle];
  uint64_t v5 = objc_opt_class();
  id v6 = TSUDynamicCast(v5, (uint64_t)v29);
  if (v6)
  {
    id v7 = [(PDSlideBase *)self parentTextStyleForTables];
    if (!v7) {
      id v7 = v4;
    }
    [v6 setParentTextListStyle:v7];
  }
  else
  {
    uint64_t v8 = objc_opt_class();
    NSUInteger v9 = [v29 clientData];
    id v6 = TSUDynamicCast(v8, (uint64_t)v9);

    uint64_t v10 = objc_opt_class();
    v11 = [v6 placeholder];
    TSUDynamicCast(v10, (uint64_t)v11);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 && [v6 inheritedTextStylePlaceholderType] != -1)
    {
      v12 = -[PDSlideBase inheritedTextStyleForPlaceholderType:](self, "inheritedTextStyleForPlaceholderType:", [v6 inheritedTextStylePlaceholderType]);
      id v13 = v12;
      if (v12)
      {
        id v14 = v12;

        v4 = v14;
      }
    }
    if (!v7) {
      goto LABEL_19;
    }
    uint64_t v15 = [v7 type];
    uint64_t v16 = [v7 index];
    id v17 = [(PDSlideBase *)self parentTextStyleForPlaceholderType:v15 placeholderTypeIndex:v16 defaultTextListStyle:v4 overrideIndex:0];
    uint64_t v27 = [(PDSlideBase *)self parentTextBodyPropertiesForPlaceholderType:v15 placeholderTypeIndex:v16 overrideIndex:0];
    if (v27)
    {
      uint64_t v18 = objc_opt_class();
      v19 = TSUDynamicCast(v18, (uint64_t)v29);
      v20 = [v19 textBody];
      BOOL v21 = [v20 properties];
      [v21 setParent:v27];
    }
    v22 = -[PDSlideBase parentShapePropertiesForPlaceholderType:placeholderTypeIndex:overrideIndex:](self, "parentShapePropertiesForPlaceholderType:placeholderTypeIndex:overrideIndex:", v15, v16, 0, v27);
    if (v22)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v23 = [v29 drawableProperties];
        [v23 setParent:v22];
      }
    }
    v24 = [(PDSlideBase *)self masterGraphicForPlaceholderType:v15 placeholderTypeIndex:v16 overrideIndex:0];
    if (v24)
    {
      uint64_t v25 = objc_opt_class();
      v26 = TSUDynamicCast(v25, (uint64_t)v29);
      [v26 setMasterGraphic:v24];
    }
    if (!v17) {
LABEL_19:
    }
      id v17 = v4;
    [v29 setParentTextListStyle:v17];
  }
}

- (void)setUpDrawablePropertyHierarchy
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = self->mDrawables;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        -[PDSlideBase setUpPropertyHierarchyForDrawable:](self, "setUpPropertyHierarchyForDrawable:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)setUpPropertyHierarchyForDrawablePreservingEffectiveValues:(id)a3
{
  id v31 = a3;
  uint64_t v4 = [(PDSlideBase *)self defaultTextListStyle];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = TSUDynamicCast(v5, (uint64_t)v31);
  if (v6)
  {
    id v7 = [(PDSlideBase *)self parentTextStyleForTables];
    if (!v7) {
      id v7 = v4;
    }
    [v6 changeParentTextListStylePreservingEffectiveValues:v7];
  }
  else
  {
    uint64_t v8 = objc_opt_class();
    long long v9 = [v31 clientData];
    uint64_t v6 = TSUDynamicCast(v8, (uint64_t)v9);

    uint64_t v10 = objc_opt_class();
    v11 = [v6 placeholder];
    TSUDynamicCast(v10, (uint64_t)v11);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 && [v6 inheritedTextStylePlaceholderType] != -1)
    {
      uint64_t v12 = -[PDSlideBase inheritedTextStyleForPlaceholderType:](self, "inheritedTextStyleForPlaceholderType:", [v6 inheritedTextStylePlaceholderType]);
      id v13 = v12;
      if (v12)
      {
        id v14 = v12;

        uint64_t v4 = v14;
      }
    }
    id v29 = v4;
    if (v7)
    {
      uint64_t v15 = [v7 type];
      uint64_t v16 = [v7 index];
      id v17 = [(PDSlideBase *)self parentTextStyleForPlaceholderType:v15 placeholderTypeIndex:v16 defaultTextListStyle:v4 overrideIndex:0];
      uint64_t v18 = [(PDSlideBase *)self parentTextBodyPropertiesForPlaceholderType:v15 placeholderTypeIndex:v16 overrideIndex:0];
      v19 = [(PDSlideBase *)self parentShapePropertiesForPlaceholderType:v15 placeholderTypeIndex:v16 overrideIndex:0];
      v20 = [(PDSlideBase *)self masterGraphicForPlaceholderType:v15 placeholderTypeIndex:v16 overrideIndex:0];
      if (v20)
      {
        uint64_t v21 = objc_opt_class();
        v22 = TSUDynamicCast(v21, (uint64_t)v31);
        [v22 setMasterGraphic:v20];
      }
    }
    else
    {
      id v17 = 0;
      uint64_t v18 = 0;
      v19 = 0;
    }
    uint64_t v23 = objc_opt_class();
    v24 = TSUDynamicCast(v23, (uint64_t)v31);
    if (v24)
    {
      if (!v18)
      {
        uint64_t v18 = +[OADTextBodyProperties defaultProperties];
      }
      uint64_t v25 = objc_msgSend(v24, "textBody", v29);
      v26 = [v25 properties];
      [v26 changeParentPreservingEffectiveValues:v18];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!v19)
      {
        uint64_t v27 = [v31 drawableProperties];
        v19 = [(id)objc_opt_class() defaultProperties];
      }
      v28 = objc_msgSend(v31, "drawableProperties", v29);
      [v28 changeParentPreservingEffectiveValues:v19];
    }
    if (!v17) {
      id v17 = v29;
    }
    objc_msgSend(v31, "changeParentTextListStylePreservingEffectiveValues:", v17, v29);

    uint64_t v4 = v30;
  }
}

- (void)setUpPropertyHierarchyPreservingEffectiveValues
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v3 = self->mDrawables;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        -[PDSlideBase setUpPropertyHierarchyForDrawablePreservingEffectiveValues:](self, "setUpPropertyHierarchyForDrawablePreservingEffectiveValues:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)inheritedTextStyleForPlaceholderType:(int)a3
{
  return 0;
}

- (void)setDrawablesNoHierarchy:(id)a3
{
}

- (void)setDrawables:(id)a3
{
  id v4 = a3;
  -[PDSlideBase setDrawablesNoHierarchy:](self, "setDrawablesNoHierarchy:");
  [(PDSlideBase *)self setUpDrawablePropertyHierarchy];
}

- (id)ppt2011Transition
{
  return self->mPpt2011Transition;
}

- (void)setPpt2011Transition:(id)a3
{
}

- (id)defaultTheme
{
  return 0;
}

- (id)defaultTextListStyle
{
  return 0;
}

- (id)placeholders
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->mDrawables;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        long long v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        long long v9 = objc_msgSend(v8, "clientData", (void)v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 hasPlaceholder]) {
          [v3 addObject:v8];
        }
      }
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v3;
}

- (id)parentTextBodyPropertiesForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  return 0;
}

- (id)parentTextStyleForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 defaultTextListStyle:(id)a5 overrideIndex:(BOOL)a6
{
  return 0;
}

- (id)parentTextStyleForTables
{
  return 0;
}

- (id)parentShapePropertiesForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  return 0;
}

- (id)masterGraphicForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  return 0;
}

- (id)parentSlideBase
{
  return 0;
}

- (id)colorScheme
{
  return 0;
}

- (id)fontScheme
{
  return 0;
}

- (id)colorMap
{
  return 0;
}

- (id)styleMatrix
{
  return 0;
}

- (id)defaultTableStyle
{
  return self->mDefaultTableStyle;
}

- (void)doneWithContent
{
  mName = self->mName;
  self->mName = 0;

  mDrawables = self->mDrawables;
  self->mDrawables = 0;

  mBackground = self->mBackground;
  self->mBackground = 0;

  mAnimation = self->mAnimation;
  self->mAnimation = 0;

  mTransition = self->mTransition;
  self->mTransition = 0;

  mDefaultTableStyle = self->mDefaultTableStyle;
  self->mDefaultTableStyle = 0;

  *((unsigned char *)self + 72) |= 2u;
}

- (id)drawingTheme
{
  return 0;
}

- (BOOL)hasPpt10Animations
{
  v2 = [(PDAnimation *)self->mAnimation rootTimeNode];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)hasPpt9Animations
{
  if ([(NSArray *)self->mDrawables count])
  {
    uint64_t v3 = 0;
    unsigned int v4 = 1;
    do
    {
      uint64_t v5 = [(NSArray *)self->mDrawables objectAtIndex:v3];
      uint64_t v6 = [v5 clientData];

      if (v6)
      {
        long long v7 = [v5 clientData];
        LOBYTE(v6) = [v7 hasAnimationInfo];
      }
      if ([(NSArray *)self->mDrawables count] <= v4) {
        break;
      }
      uint64_t v3 = v4++;
    }
    while ((v6 & 1) == 0);
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)generatePpt9Animations:(id)a3
{
  id v7 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  +[PDAnimationCache loadAnimationCache:v4 pdAnimation:self->mAnimation state:v7];
  for (unsigned int i = 0; [v4 count] > (unint64_t)i; ++i)
  {
    uint64_t v6 = [v4 objectAtIndex:i];
    [(PDSlideBase *)self setPpt9AnimationDataForCacheItem:v6 order:i state:v7];
  }
}

- (void)removeUnnecessaryOverrides
{
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PDSlideBase;
  v2 = [(PDSlideBase *)&v4 description];
  return v2;
}

- (unsigned)slideId
{
  return self->mSlideId;
}

- (void)setSlideId:(unsigned int)a3
{
  self->mSlideId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDefaultTableStyle, 0);
  objc_storeStrong((id *)&self->mPpt2011Transition, 0);
  objc_storeStrong((id *)&self->mTransition, 0);
  objc_storeStrong((id *)&self->mAnimation, 0);
  objc_storeStrong((id *)&self->mBackground, 0);
  objc_storeStrong((id *)&self->mDrawables, 0);
  objc_storeStrong((id *)&self->mName, 0);
}

- (void)setPpt9AnimationDataForCacheItem:(id)a3 order:(int)a4 state:(id)a5
{
  uint64_t v8 = *(void *)&a4;
  id v31 = a3;
  id v9 = a5;
  long long v10 = [v31 target];
  long long v11 = [v10 drawable];

  v30 = v11;
  long long v12 = [v11 clientData];
  long long v13 = [(PDOfficeArtClient *)v12 animationInfo];
  long long v14 = 0;
  int v15 = [v31 presetClass];
  if (v15 == 1)
  {
    long long v14 = [v13 entranceData];
    if (!v14)
    {
LABEL_24:

      goto LABEL_25;
    }
  }
  int v16 = [v31 presetClass];
  if (v16 == 2)
  {
    uint64_t v5 = [v13 exitData];
    if (!v5)
    {
      if (v15 != 1) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  id v29 = v9;
  if ([v31 presetClass] != 6 || objc_msgSend(v31, "presetId") != 1)
  {
    int v17 = 0;
    goto LABEL_10;
  }
  uint64_t v6 = [v13 entranceData];
  if (v6)
  {
    int v17 = 1;
LABEL_10:
    if ([v31 presetClass] == 6 && objc_msgSend(v31, "presetId") == 3)
    {
      uint64_t v18 = [v13 exitData];
      BOOL v19 = v18 == 0;

      if (!v17)
      {
LABEL_16:
        id v9 = v29;
        if (v16 != 2) {
          goto LABEL_18;
        }
        goto LABEL_17;
      }
    }
    else
    {
      BOOL v19 = 0;
      if ((v17 & 1) == 0) {
        goto LABEL_16;
      }
    }

    goto LABEL_16;
  }
  BOOL v19 = 1;
  if (v16 == 2) {
LABEL_17:
  }

LABEL_18:
  if (v15 != 1)
  {
    if (v19) {
      goto LABEL_25;
    }
LABEL_22:
    v20 = v30;
    goto LABEL_42;
  }

  if (!v19) {
    goto LABEL_22;
  }
LABEL_25:
  v20 = v30;
  id v21 = +[PDAnimationCache createAnimationInfoDataForCacheItem:v31 order:v8];
  if (v21)
  {
    v22 = v21;
    if (!v12)
    {
      long long v12 = objc_alloc_init(PDOfficeArtClient);
      [v30 setClientData:v12];
    }
    uint64_t v23 = [v30 clientData];

    if (v23 && !v13)
    {
      v24 = objc_alloc_init(PDAnimationInfo);
      uint64_t v25 = [v30 clientData];
      [v25 setAnimationInfo:v24];

      long long v13 = v24;
    }
    if ([v31 presetClass] == 1
      || [v31 presetClass] == 6 && objc_msgSend(v31, "presetId") == 1)
    {
      [v13 setEntranceData:v22];
    }
    else if ([v31 presetClass] == 2 {
           || [v31 presetClass] == 6 && objc_msgSend(v31, "presetId") == 3)
    }
    {
      [v13 setExitData:v22];
    }
    v26 = [v9 mediaNodeMap];
    uint64_t v27 = [v31 target];
    v28 = [v26 objectForKey:v27];

    if (v28) {
      [v13 setMediaNode:v28];
    }
  }
LABEL_42:
}

@end